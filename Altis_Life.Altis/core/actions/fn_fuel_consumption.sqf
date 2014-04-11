/*
                File: fuelConsumption.sqf
                Author: Egypt~Seal
               
                Description:
                Increases vehicles fuel consumption.
        */
 
        private["_vehicle","_rate","_speed"];
        _vehicle = cursorTarget;
		_speed = speed _vehicle;
        if(isNull _vehicle) exitwith {};
        while {(alive _vehicle) and (fuel _vehicle > 0)} do {
 
 
 
        switch ((typeOf _vehicle)) do
        {
                case "C_Offroad_01_F": {_rate = 0.0050};
                case "B_G_Offroad_01_F": {_rate = 0.0010};
                case "B_Quadbike_01_F": {_rate = 0.020};
                case "O_Quadbike_01_F": {_rate = 0.020};
                case "C_Quadbike_01_F": {_rate = 0.020};
				case "O_Heli_Light_02_unarmed_F": {_rate = 0.010};
                case "I_Truck_02_covered_F": {_rate = 0.00010};
                case "I_Truck_02_transport_F": {_rate = 0.00010};
                case "C_Hatchback_01_F": {_rate = 0.015};
                case "C_Hatchback_01_sport_F": {_rate = 0.02};
                case "C_SUV_01_F": {_rate = 0.0035};
                case "C_Van_01_transport_F": {_rate = 0.002};
                case "I_G_Van_01_transport_F": {_rate = 0.001};
                case "C_Van_01_box_F": {_rate = 0.001};
                case "C_Van_01_Fuel_F": {_rate = 0.001};
                case "C_Boat_Civil_01_F": {_rate = 0.0010};
                case "C_Boat_Civil_01_police_F": {_rate = 0.0010};
                case "C_Boat_Civil_01_rescue_F": {_rate = 0.0010};
                case "B_Truck_01_box_F": {_rate = 0.0010};
                case "B_Truck_01_transport_F": {_rate = 0.0010};
				case "B_Truck_01_covered_F": {_rate = 0.0010};
                case "B_MRAP_01_F": {_rate = 0.010};
                case "O_MRAP_02_F": {_rate = 0.010};
                case "I_MRAP_03_F": {_rate = 0.010};
                case "I_Heli_light_03_unarmed_F": {_rate = 0.0080};
                case "O_Truck_02_covered_F": {_rate = 0.004};
                case "I_Truck_02_fuel_F": {_rate = 0.00010};
                case "B_Heli_Transport_01_F": {_rate = 0.0030};
                case "I_Heli_Transport_02_F": {_rate = 0.0030};
                case "O_Heli_Light_02_F": {_rate = 0.0010};
                case "C_Rubberboat": {_rate = 0.005};
                case "O_Boat_Armed_01_hmg_F": {_rate = 0.0010};
                case "B_Boat_Armed_01_minigun_F": {_rate = 0.0010};
                case "I_Boat_Armed_01_minigun_F": {_rate = 0.0010};
                case "B_G_Boat_Transport_01_F": {_rate = 0.0020};
                case "B_Boat_Transport_01_F": {_rate = 0.0020};
				default {_rate = 0};
				
        };
        if (isengineon _vehicle) then {
        _vehicle setFuel ( Fuel _vehicle - (_speed + _rate) / 300 );
        };
        sleep 0.5;
        };