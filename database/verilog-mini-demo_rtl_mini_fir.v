// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// github  : https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

module mini_fir #(
    parameter NUM = 1
)(    
    input        clk,
    input        rst_n,
    input  [3:0] i_addr,
    input  [7:0] i_data_wr,
    input        i_wr,
    input        i_rd,
    output [7:0] o_data_rd,
    input  [7:0] i_din,
    output reg [7:0] o_dout
);

// 
// contorl registers
wire [7:0] fir_ctrl;
wire [7:0] coeff_00;
wire [7:0] coeff_01;
wire [7:0] coeff_02;
wire [7:0] coeff_03;
wire [7:0] coeff_04;
wire [7:0] coeff_05;
wire [7:0] coeff_06;


wire fir_enable;

assign fir_enable = fir_ctrl[0];

// data path

wire [8*(NUM+1)-1 :0] fir_temp;

genvar i;


//
// contorl registers
//
mini_fir_ctrl u_fir_ctrl (    
    .clk         ( clk        ),
    .rst_n       ( rst_n      ),
    .i_addr      ( i_addr     ),
    .i_data_wr   ( i_data_wr  ),
    .i_wr        ( i_wr       ),
    .i_rd        ( i_rd       ),
    .o_data_rd   ( o_data_rd  ),
    .o_fir_ctrl  (   fir_ctrl ),
    .o_coeff_00  (   coeff_00 ),
    .o_coeff_01  (   coeff_01 ),
    .o_coeff_02  (   coeff_02 ),
    .o_coeff_03  (   coeff_03 ),
    .o_coeff_04  (   coeff_04 ),
    .o_coeff_05  (   coeff_05 ),
    .o_coeff_06  (   coeff_06 )
);


//
// data path
//

assign fir_temp[7:0] = i_din;

generate

for(i=0; i< NUM; i=i+1) begin: loop_fir_dp
    mini_fir_dp u_fir_dp(
        .clk         ( clk        ),
        .rst_n       ( rst_n      ),
        .i_coeff_00  (   coeff_00 ),
        .i_coeff_01  (   coeff_01 ),
        .i_coeff_02  (   coeff_02 ),
        .i_coeff_03  (   coeff_03 ),
        .i_coeff_04  (   coeff_04 ),
        .i_coeff_05  (   coeff_05 ),
        .i_coeff_06  (   coeff_06 ),
        .i_din       ( fir_temp[    i*8+:8] ),
        .o_dout      ( fir_temp[(i+1)*8+:8] )
    );
    end
endgenerate

//
// output pipe
//
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        o_dout <= 'd0;
    end
    else if(fir_enable) begin
        o_dout <= fir_temp[8*NUM+:8];
    end
    else begin
        o_dout <= i_din;
    end
end

endmodule
