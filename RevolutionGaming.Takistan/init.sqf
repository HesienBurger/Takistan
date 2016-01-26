// TFR Variables API
tf_no_auto_long_range_radio = true; 
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;

StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Takistan Life RPG 0.0.2";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "effect.sqf";

StartProgress = true;
