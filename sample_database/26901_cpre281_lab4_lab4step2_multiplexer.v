// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module multiplexer (E, F, M, AC);

input E;
input F;
input M;
output AC;


assign AC=(((~M)&E)|(M&F));

endmodule
