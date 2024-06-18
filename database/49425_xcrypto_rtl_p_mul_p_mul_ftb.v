// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


//
// module: p_mul_ftb
//
//  Dummy module for future use
//
module p_mul_ftb (
    input clock,
    input resetn
);

reg           valid  ;
wire [ 0:0]   ready  ;
reg           mul_l  ;
reg           mul_h  ;
reg           clmul  ;
reg  [4:0]    pw     ;
reg  [31:0]   crs1   ;
reg  [31:0]   crs2   ;
wire [31:0]   result ;


p_mul i_p_mul(
.clock (clock )  ,
.resetn(resetn)  ,
.valid (valid )  ,
.ready (ready )  ,
.mul_l (mul_l )  ,
.mul_h (mul_h )  ,
.clmul (clmul )  ,
.pw    (pw    )  ,
.crs1  (crs1  )  ,
.crs2  (crs2  )  ,
.result(result)
);

endmodule
