
while {true} do{ sleep 10;
  waitUntil {alive player};
  [] execVM "zombie\init.sqf";
sleep 600;
};


// if having FPS issues use below code it slower on spawns
/*
while {true} do{ sleep 10;
  waitUntil {alive player};
  [] execVM "zombie\init.sqf";
  waitUntil {!alive player};
};
*/