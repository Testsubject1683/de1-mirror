advanced_shot {{exit_if 1 flow 8 volume 100 transition fast exit_flow_under 0 temperature 89.0 name Fill pressure 1 sensor coffee pump flow exit_type pressure_over exit_flow_over 6 exit_pressure_over 1.5 exit_pressure_under 0 seconds 25.0} {exit_if 0 flow 8 volume 100 transition fast exit_flow_under 0 temperature 88.5 name Pre-infuse pressure 3.0 sensor coffee pump pressure exit_type pressure_over exit_flow_over 6 exit_pressure_over 3.0 exit_pressure_under 0 seconds 12.0} {exit_if 0 volume 100 transition fast exit_flow_under 0 temperature 88.5 name {Pressure Up} pressure 9.0 sensor coffee pump pressure exit_flow_over 6 exit_pressure_over 11 exit_pressure_under 0 seconds 8.0} {exit_if 1 volume 100 transition smooth exit_flow_under 0 temperature 88.0 name {Pressure Decline} pressure 3.0 sensor coffee pump pressure exit_type flow_over exit_flow_over 1.8 exit_pressure_over 11 exit_pressure_under 0 seconds 45.0} {exit_if 1 volume 100 transition fast exit_flow_under 0 temperature 88.0 name {Pressure Hold} pressure 3.0 sensor coffee pump pressure exit_type flow_over exit_flow_over 1.8 exit_pressure_over 11 exit_pressure_under 0 seconds 127} {exit_if 0 flow 1.8 volume 100 transition fast exit_flow_under 0 temperature 88.0 name {Flow Limit} pressure 3.0 sensor coffee pump flow exit_flow_over 6 exit_pressure_over 11 seconds 127 exit_pressure_under 0}}
author Damian
espresso_hold_time 15
preinfusion_time 20
espresso_pressure 6.0
espresso_decline_time 30
pressure_end 4.0
espresso_temperature 89.0
settings_profile_type settings_2c
flow_profile_preinfusion 4
flow_profile_preinfusion_time 5
flow_profile_hold 2
flow_profile_hold_time 8
flow_profile_decline 1.2
flow_profile_decline_time 17
flow_profile_minimum_pressure 4
preinfusion_flow_rate 4
profile_notes {This profile simulates a Londinium R machines extraction style. This is an advanced profile with some added steps to assist with less than ideal puck prep. Christee-Lee described it as “like having a milkshake with extra syrup”. Great body and flavour range.  By Damian Brakel https://www.diy.brakel.com.au/londinium-r-style-profile/}
water_temperature 80
final_desired_shot_volume 32
final_desired_shot_weight 32
final_desired_shot_weight_advanced 36
tank_desired_water_temperature 0
final_desired_shot_volume_advanced 0
preinfusion_guarantee 1
profile_title {Londinium R by Damian Brakel}
profile_language en
preinfusion_stop_pressure 4.0
