`include "pow_5_single_cycle_struct.v"

module board_independent_wrapper
(
    input         fast_clk,
    input         slow_clk,
    input         rst_n,
    input         fast_clk_en,
    input  [ 3:0] key,
    input  [ 7:0] sw,
    output [ 7:0] led,
    output [ 7:0] disp_en,
    output [31:0] disp,
    output [ 7:0] disp_dot
);

    wire res_vld;
    
    assign led  = { 8 { res_vld } };

    pow_5_single_cycle_struct
    # (.w (8))
    i_pow_5
    (
        .clk     ( slow_clk    ),
        .rst_n   ( rst_n       ),
        .arg_vld ( key [0]     ),
        .arg     ( sw          ),
        .res_vld ( res_vld     ),
        .res     ( disp [7:0]  )
    );
    
    assign disp_en  = 8'b00000011;
    assign disp_dot = { 7'b0000000, res_vld };

endmodule
