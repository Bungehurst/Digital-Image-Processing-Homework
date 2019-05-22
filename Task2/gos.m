function [ g ] = gos( x,y,sigma)
    PI = 3.1415926;
    g = 1/(2*PI*sigma*sigma)*exp(-(x*x+y*y)/(2*sigma*sigma));
end

