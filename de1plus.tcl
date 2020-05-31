#!/usr/local/bin/tclsh

encoding system utf-8
cd "[file dirname [info script]]/"
source "pkgIndex.tcl"
package provide de1plus 1.0
package require de1_main
package require de1_webapi 1.0
de1_ui_startup