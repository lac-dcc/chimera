// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module tb();
reg x,y,z;
wire o;
circuit circ(x,y,z,o);

initial begin

x = 0;
y = 0;
z = 0;
#5;
x = 0;
y = 0;
z = 1;
#5;
x = 0;
y = 1;
z = 0;
#5;
x = 0;
y = 1;
z = 1;
#5;
x = 1;
y = 0;
z = 0;
#5;
x = 1;
y = 0;
z = 1;
#5;
x = 1;
y = 1;
z = 0;
#5;
x = 1;
y = 1;
z = 1;
#5;

end
endmodule