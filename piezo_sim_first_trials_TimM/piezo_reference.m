function y = piezo_reference(x)
rep = x(3);

alpha = x(1) + rep*2*pi;
c = x(2);
piezo_gain = x(4);

y =  piezo_gain * (alpha);
end
