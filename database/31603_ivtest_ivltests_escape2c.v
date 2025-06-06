// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module part3 (
\6A_A ,
\6Y_A ,
VCC ,
GND ,
\6A_B ,
\6Y_B ,
\6A_C ,
\6Y_C ,
\6A_D ,
\6Y_D ,
\6A_E ,
// note: with space before the nl below
\6Y_E
) ;

input \6A_A ;
output \6Y_A ;
input VCC ;
input GND ;
input \6A_B ;
output \6Y_B ;
input \6A_C ;
output \6Y_C ;
input \6A_D ;
output \6Y_D ;
input \6A_E ;
output \6Y_E ;

assign \6Y_A  = ~\6A_A ;
assign \6Y_B  = ~\6A_B ;
assign \6Y_C  = ~\6A_C ;
assign \6Y_D  = ~\6A_D ;
assign \6Y_E  = ~\6A_E ;

endmodule
