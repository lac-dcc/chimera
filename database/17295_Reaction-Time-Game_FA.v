// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

module FA(Cin,X,Y,S, Cout);
input Cin,X,Y;
output Cout,S;
assign S = Cin ^ X ^ Y;
assign Cout = (X & Y) | (Cin & Y ) | (Cin & X);

endmodule
