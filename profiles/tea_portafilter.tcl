advanced_shot {{exit_if 1 flow 6.00 volume 100 transition fast exit_flow_under 0 temperature 110 name Fill pressure 1 sensor coffee pump flow exit_type pressure_over exit_flow_over 6 exit_pressure_over 3.00 exit_pressure_under 0 seconds 20.00} {exit_if 0 flow 4 volume 100 transition fast exit_flow_under 0 temperature 110 name Infuse pressure 0.50 sensor coffee pump pressure exit_type pressure_over exit_flow_over 6 exit_pressure_over 2.00 seconds 30.00 exit_pressure_under 0} {exit_if 0 flow 6.00 volume 100 transition fast exit_flow_under 0 temperature 110 name Flush pressure 6.00 sensor coffee pump flow exit_type pressure_over exit_flow_over 6 exit_pressure_over 2.00 exit_pressure_under 0 seconds 15.00} {exit_if 0 flow 4.00 volume 100 transition fast exit_flow_under 0 temperature 110 name Infuse pressure 0.50 sensor coffee pump pressure exit_type pressure_over exit_flow_over 6 exit_pressure_over 2.00 seconds 40.00 exit_pressure_under 0} {exit_if 0 flow 6.00 volume 100 transition fast exit_flow_under 0 temperature 110 name Flush pressure 0.50 sensor coffee pump flow exit_type pressure_over exit_flow_over 6 exit_pressure_over 2.00 exit_pressure_under 0 seconds 15.00} {exit_if 0 flow 6.00 volume 100 transition fast exit_flow_under 0 temperature 110 name Infuse pressure 0.50 sensor coffee pump pressure exit_type pressure_over exit_flow_over 6 exit_pressure_over 2.00 seconds 40.00 exit_pressure_under 0} {exit_if 0 flow 6.00 volume 100 transition fast exit_flow_under 0 temperature 110 name Flush pressure 0.50 sensor coffee pump flow exit_type pressure_over exit_flow_over 6 exit_pressure_over 2.00 exit_pressure_under 0 seconds 15.00}}
author Decent
espresso_decline_time 0
espresso_hold_time 25
espresso_pressure 8.6
espresso_temperature 110
espresso_temperature_0 90.0
espresso_temperature_1 88.0
espresso_temperature_2 88.0
espresso_temperature_3 88.0
espresso_temperature_steps_enabled 1
final_desired_shot_volume 36
final_desired_shot_volume_advanced 0
final_desired_shot_volume_advanced_count_start 1
final_desired_shot_weight 36
final_desired_shot_weight_advanced 36
flow_profile_decline 1.2
flow_profile_decline_time 17
flow_profile_hold 2
flow_profile_hold_time 8
flow_profile_minimum_pressure 4
flow_profile_preinfusion 4
flow_profile_preinfusion_time 5
preinfusion_flow_rate 4
preinfusion_guarantee 0
preinfusion_stop_pressure 4
preinfusion_time 0
pressure_end 6.0
profile_hide 1
profile_language en
profile_notes {This profile requires a specially designed tea portafilter that opens its valve at pressures of 3 bar or above.  Put a tea bag or loose leaf tea into the basket.  Makes about 230ml of tea in 3 minutes.}
profile_title {Tea portafilter/black tea}
settings_profile_type settings_2c
tank_desired_water_temperature 0
water_temperature 80

