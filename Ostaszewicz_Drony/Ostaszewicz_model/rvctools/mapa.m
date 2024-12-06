

load("map22.mat")
show(map22)
map = binaryOccupancyMap(map22,2);
inflate(map,0.2)
goal = [8,8];
start = [2,8];



prmSimple = mobileRobotPRM(map,50);
path = findpath(prmSimple,start,goal);
show(prmSimple)