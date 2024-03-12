`default_nettype none
module complex_mult
#(
    parameter data_in_w = 8, 
    parameter data_out_w = 16
)
(
    input wire signed [data_in_w-1:0] a_real,
    input wire signed [data_in_w-1:0] a_imag,
    input wire signed [data_in_w-1:0] b_real,
    input wire signed [data_in_w-1:0] b_imag,

    output wire signed [data_out_w-1:0] out_real,
    output wire signed [data_out_w-1:0] out_imag
);

    assign out_real = a_real * b_real - a_imag * b_imag;
    assign out_imag = a_real * b_imag + a_imag * b_real;

endmodule

