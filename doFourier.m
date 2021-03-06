#!/usr/bin/octave -qf

clear();
clf();

[y, T] = fourierPeriodicFun([], 1);
x = -T:0.01:2*T;
[y, T] = fourierPeriodicFun(x, 1);
hold on
plot(x, y, 'linewidth', 2);

samples = 40;
h = 1/samples;
t = h:h:T;
[f, T] = fourierPeriodicFun(t, 1);
plot(t, f, '.r', "markersize", 8);

I = fourierInt(f, h);
#disp(I);

n = 10;
[a0, a, b] = fourierCoeffs(t, f, T, n);
#disp(a0); disp(a); disp(b);

p = fourierSeries(x, a0, a, b ,T);
plot(x, p, '-r', 'linewidth', 2);

A = [abs(a0), sqrt(a.^2+b.^2)];
bar(0:1:n, A);

hold off
