while { true } do {
sleep 10;
if (alive player) then {
[] execVM "zombie\configurations.sqf";
    };
sleep 600;
};
