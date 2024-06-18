// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module powersaving(P, T, H, F);

input P;
input T;
input H;
output F;

assign F=(P&T&H);

endmodule
