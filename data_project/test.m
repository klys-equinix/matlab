m1 = rand(40,3)*30; % grupa 1
m2 = rand(30,3)*10+30; % grupa 2
m3 = rand(50,3)*20+40; % grupa 3
m4 = rand(20,3)*10+60; % grupa 4
m= [m1 ; m2 ; m3 ; m4]
scatter3(m(:,1),m(:,2),m(:,3));
c = clusterdata(m,'maxclust',4,'linkage','complete');
figure; scatter3(m(:,1),m(:,2),m(:,3),30,c,'filled');