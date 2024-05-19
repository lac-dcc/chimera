// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

//
//      verilog template for inner product in Axiline
//

module ip#(
    parameter bitwidth =8
)(
    input[bitwidth-1:0] x_0,
    input[bitwidth-1:0] x_1,
    input[bitwidth-1:0] x_2,
    input[bitwidth-1:0] x_3,

    input[bitwidth-1:0] w_0,
    input[bitwidth-1:0] w_1,
    input[bitwidth-1:0] w_2,
    input[bitwidth-1:0] w_3,

    input[bitwidth-1:0] psum,
    input sel,
    output [bitwidth-1:0]sum,
);

    wire [bitwidth-1:0]psum_sel;
    assign psum_sel=sel?psum:0;
    wire [bitwidth-1:0]ip;
    assign ip=x_0*w_i+x_1*w_1+x_2*w_2+x_3*w_3;

    assign sum=ip + psum_sel;

endmodule : ip

