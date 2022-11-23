%% Load Mat - Signature characteristics
signature = load(['./DB/u1001s0001_sg0001.mat']);
    %disp(signature);
signature2 = load(['./DB/u1001s0001_sg0002.mat']);

% Characteristics extraction.
x = signature.x;
y = signature.y;
p = signature.p;
    %disp(x); %disp(y); %disp(p);
x2 = signature2.x;
y2 = signature2.y;
p2 = signature2.p;


% Time extraction - len of vectors
frec = 200;
    %disp(frec);
time = size(x,2); % Vector Size.
    %disp(time);
t = time/frec;
    %disp(t);
time2 = size(x2,2);
t2 = time2/frec;

% Time Linespace
space = linspace(0,t,time);
space2 = linspace(0,t2,time2);

%% Representation
% Plot signature - x/y
figure;
plot(x, y);
hold on;
plot(x2,y2);
hold off;

% Plot X in time - x/t
figure;
plot(space, x)
hold on;
plot(space2, x2);
hold off;

%Plot Y in time - y/t
figure;
plot(space, y)
hold on;
plot(space2,y2);
hold off;

% Plot P in time - p/t
figure;
plot(space, p)
hold on;
plot(space2,p2);
hold off;

% Signature: x-y

% x-time

% y-time

% z-time


%% Frecuencia de muestreo -- miras cual es tu muestra y cuantas muestras tienes miras cual es el vector