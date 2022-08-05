clear

param

% initial conditions 
x0 = [0.01  0.01  0.01  0.01  0.01  0.01  0.01  0.000001 ...
     0.000001 0.000001 0.000001 0.000001 0.000001 0.000001 ...
     0.000001 0.000001 0.000001 0.000001 0.000001];


tspan = 0:1:15; 
[t,x] = ode45(@(t,x) PlantDifEq(x),tspan,x0'); 

Fe_biomass = zeros(15,1);
Zn_biomass = zeros(15,1);
NA = zeros(15,1);

for t1= 1:1:15
    Fe_biomass(t1) = x(t1,8)  + x(t1,10) + x(t1,11) + x(t1,12) + x(t1,16) + x(t1,17);
    Zn_biomass(t1) = x(t1,14) + x(t1,15) + x(t1,18) + x(t1,19);
    NA(t1)= x(t1,12) + x(t1,13) + x(t1,14) + x(t1,17) + x(t1,18);
end



%Figures: Post- Xylem Biomass ( can change to display state-variable plots ) 

figure(2)
plot(t, x(:,16))
xlabel('time')
ylabel('Fe-Ci Post-Xylem Biomass')

figure(3)
plot(t, x(:,17))
xlabel('time')
ylabel('Fe-NA Post-Xylem Biomass')

figure(4)
plot(t, x(:,18))
xlabel('time')
ylabel('ZN-NA Post-Xylem Biomass')

figure(5)
plot(t, x(:,19))
xlabel('time')
ylabel('ZN Post-Xylem Biomass ')




