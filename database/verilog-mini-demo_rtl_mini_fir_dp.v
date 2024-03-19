// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// github  : https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

module mini_fir_dp (
    input        clk,
    input        rst_n,
    input  [7:0] i_coeff_00,
    input  [7:0] i_coeff_01,
    input  [7:0] i_coeff_02,
    input  [7:0] i_coeff_03,
    input  [7:0] i_coeff_04,
    input  [7:0] i_coeff_05,
    input  [7:0] i_coeff_06,
    input  [7:0] i_din,
    output reg [7:0] o_dout
);


// MACs temp wire
wire [18:0] tmp_00;
wire [18:0] tmp_01;
wire [18:0] tmp_02;
wire [18:0] tmp_03;
wire [18:0] tmp_04;
wire [18:0] tmp_05;
wire [18:0] tmp_06;

//
// MACs
//

mini_fir_mac u_mac_00 (.clk (clk), .rst_n (rst_n), .i_data ( i_din), .i_coeff(i_coeff_00), .i_prev( 19'd0), .o_next(tmp_00));
mini_fir_mac u_mac_01 (.clk (clk), .rst_n (rst_n), .i_data ( i_din), .i_coeff(i_coeff_01), .i_prev(tmp_00), .o_next(tmp_01));
mini_fir_mac u_mac_02 (.clk (clk), .rst_n (rst_n), .i_data ( i_din), .i_coeff(i_coeff_02), .i_prev(tmp_01), .o_next(tmp_02));
mini_fir_mac u_mac_03 (.clk (clk), .rst_n (rst_n), .i_data ( i_din), .i_coeff(i_coeff_03), .i_prev(tmp_02), .o_next(tmp_03));
mini_fir_mac u_mac_04 (.clk (clk), .rst_n (rst_n), .i_data ( i_din), .i_coeff(i_coeff_04), .i_prev(tmp_03), .o_next(tmp_04));
mini_fir_mac u_mac_05 (.clk (clk), .rst_n (rst_n), .i_data ( i_din), .i_coeff(i_coeff_05), .i_prev(tmp_04), .o_next(tmp_05));
mini_fir_mac u_mac_06 (.clk (clk), .rst_n (rst_n), .i_data ( i_din), .i_coeff(i_coeff_06), .i_prev(tmp_05), .o_next(tmp_06));

//
// normalization
//

wire [10:0] shift_nbits = tmp_06>>8;

wire [7:0]  clip_out = (|shift_nbits[10:8]) ? 8'hff : shift_nbits[7:0];

//
// output pipe
//
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        o_dout <= 'd0;
    end
    else begin
        o_dout <= clip_out;
    end
end

endmodule
