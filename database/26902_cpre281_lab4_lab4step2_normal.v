// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module normal(P, T, H, E);

input P;
input T;
input H;
output E;

assign E=((P&(T|H))|((~P)&(T&H)));

endmodule
