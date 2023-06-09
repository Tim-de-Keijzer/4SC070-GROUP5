clc; clear all; close all;

tend = 40;
tsamp = 0.1;

ref = [0:0.01:1, 0.99:-0.01:0, 0.01:0.01:1, 0.99:-0.01:0];
time = 0:tsamp:tend;

reference = [time', ref'];

out = sim('test_gain.slx');

figure
hold on
plot(time,ref)
plot(out.alpha.Time,out.alpha.Data)