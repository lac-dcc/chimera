// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module sample (A,B,C,D,E);
// Inputs 
input A; 
input B;
input C;
//Ouputs 
output D;
output E;
// Components
wire w1;
and g1 (w1 ,A,B) ;
not g2(E,C);
or g3 (D, w1, E) ;
endmodule
