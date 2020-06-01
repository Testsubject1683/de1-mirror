namespace eval decent_espresso::webapi {
  package provide de1_webapi 1.0

  package require uri
  package require base64
  package require html


  proc start_socket {} {
    source "./webapi/api.tcl"
    set port "1683"
    set open_socket [HTTPD $port "" "" {} {AuthRealm} {
    "" {
      respond $sock 419 "I'm not a teapot..." "I'm a marvelous Espresso machine"
    }
    "api\/*" {
      array set req $reqstring
      set list [list ]
      foreach {value} [split $req(path) "/"] {
        lappend list [decent_espresso::webapi::url-decode $value]
      }
      set cmd [lindex $list 1]
      set proc_to_call "decent_espresso::webapi::api::${cmd} [lrange $list 2 end]"
      if {[catch {
          respond $sock 200 [eval $proc_to_call]
        } err] != 0} {
        respond $sock 500 "$err" "Internal Server Error"
      }
    }
    "*.html" {
      array set req $reqstring
      set fd [open "[pwd]/webapi/www/${req(path)}" r]
      fconfigure $fd -translation binary
      set content [read $fd]; close $fd
      respond $sock 200 $content
    }
    "*.css" {
      array set req $reqstring
      set fd [open "[pwd]/webapi/www/${req(path)}" r]
      fconfigure $fd -translation binary
      set content [read $fd]; close $fd
      respond $sock 200 $content
    }
    "*.js" {
      array set req $reqstring
      set fd [open "[pwd]/webapi/www/${req(path)}" r]
      fconfigure $fd -translation binary
      set content [read $fd]; close $fd
      respond $sock 200 $content
    }
    }]
  }

  proc file {filePath} {
    
  }

  proc url-decode {str} {
      # rewrite "+" back to space
      # protect \ from quoting another '\'
      set str [string map [list + { } "\\" "\\\\"] $str]

      # prepare to process all %-escapes
      regsub -all -- {%([A-Fa-f0-9][A-Fa-f0-9])} $str {\\u00\1} str

      # process \u unicode mapped chars
      return [subst -novar -nocommand $str]
  }

  #currently unused
  proc close_socket {} {
    if { $open_socket != 0 } {
      close $open_socket
    }
  }

  #taken from http://wiki.tcl.tk/15244
  proc HTTPD {port certfile keyfile userpwds realm handler} {
  if {![llength [::info commands Log]]} { proc Log {args} { puts $args } }
  namespace eval httpd [list set handlers $handler]
  namespace eval httpd [list set realm $realm]
  foreach up $userpwds { namespace eval httpd [list lappend auths [base64::encode $up]] }
  namespace eval httpd {
    proc respond {sock code body {head "OK"}} {
      puts -nonewline $sock "HTTP/1.0 $code $head\nContent-Type: text/html; charset=utf-8\nConnection: close\nAccess-Control-Allow-Origin: *\n\n$body"
    }
    proc checkauth {sock ip auth} {
      variable auths
      variable realm
      if {[info exist auths] && [lsearch -exact $auths $auth]==-1} {
        respond $sock 401 Unauthorized "WWW-Authenticate: Basic realm=\"$realm\"\n"
        error "Unauthorized from $ip"
      }
    }
    proc handler {sock ip reqstring auth} {
      variable auths
      variable handlers
      checkauth $sock $ip $auth
      array set req $reqstring
      switch -glob $req(path) [concat $handlers [list default { respond $sock 404 "Error" "Not Found"}]]
    }
    proc accept {sock ip port} {
      if {[catch {
        gets $sock line
        set auth ""
        for {set c 0} {[gets $sock temp]>=0 && $temp ne "\r" && $temp ne ""} {incr c} {
          regexp {Authorization: Basic ([^\r\n]+)} $temp -- auth
          if {$c == 30} { error "Too many lines from $ip" }
        }
        if {[eof $sock]} { error "Connection closed from $ip" }
        foreach {method url version} $line { break }
        switch -exact $method {
          GET { handler $sock $ip [uri::split $url] $auth }
          default { error "Unsupported method '$method' from $ip" }
        }
      } msg]} {
        write_file "logfile" "Error: $msg"
      }
      close $sock
    }
  }
  return [socket -server decent_espresso::webapi::httpd::accept $port]
  }

  start_socket
}