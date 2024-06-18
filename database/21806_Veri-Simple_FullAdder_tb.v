// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module tb();
reg a,b,c;
wire o;
fulladder circ(a,b,c,o);

initial begin

a = 0;
b = 0;
c = 0;
#5;
a = 0;
b = 0;
c = 1;
#5;
a = 0;
b = 1;
c = 0;
#5;
a = 0;
b = 1;
c = 1;
#5;
a = 1;
b = 0;
c = 0;
#5;
a = 1;
b = 0;
c = 1;
#5;
a = 1;
b = 1;
c = 0;
#5;
a = 1;
b = 1;
c = 1;
#5;

end
endmodule