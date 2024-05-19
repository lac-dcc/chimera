// This program was cloned from: https://github.com/ic7x24/verilog-mini-demo
// License: MIT License

// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// github  : https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

module mini_top #(
    parameter NUM=8
)(
    input          clk,       
    input          rst_n,     
    input  [15 :0] i_din,     
    input  [15 :0] i_cw,      
    output reg     o_flag,    
    output [15 :0] o_dout,    
    input  [7:0]   i_addr,    
    input          i_wr,      
    input          i_rd,      
    input  [7:0]   i_data_wr, 
    output [7:0]   o_data_rd
);

//
// output 
//

// 0x00 : basic syntax 
wire [7:0] test_0x00_base_out = 0;


// 0x01 : combinational logic
wire [7:0] test_0x01_comb_out = 0;

// 0x02 : sequential logic
wire [7:0] test_0x02_sequ_out = 0;

// 0x03 : single-port ram
wire [7:0] test_0x03_ram_out;

// 0x04 : rom
wire [7:0] test_0x04_rom_out;

// 0x05 : fir
wire [7:0] test_0x05_fir_out;

wire [7:0] out_mux = i_cw[15:8];
assign o_dout[7:0] = 
    out_mux==8'h00 ? test_0x00_base_out :
    out_mux==8'h01 ? test_0x01_comb_out :
    out_mux==8'h02 ? test_0x02_sequ_out :
    out_mux==8'h03 ? test_0x03_ram_out :
    out_mux==8'h04 ? test_0x04_rom_out :
    out_mux==8'h05 ? test_0x05_fir_out :
                     8'h00         ;

assign o_dout[15:8] = ~o_dout[7:0];
                 

// `include "mini_cfg.vh"
// in "mini_cfg.vh" 
`define NUM_1 8'b0001_1111
`define NUM_2 8'h1F
`define NUM_3 8'd31
`define NUM_4 {4'h1, 4'b1111}
`define NUM_5 {4'h1, {4{1'b1}}}

localparam NUM_6 = 31;
localparam NUM_7 = NUM_6;
localparam NUM_8 = `NUM_1;
localparam NUM_9 = `NUM_1 + NUM_6 - 31;

wire r_enable;
wire r_start;
wire r_stop; 
wire r_invert;
wire r_skip;

assign {
    r_enable,
    r_start,
    r_stop,
    r_invert,
    r_skip
} = i_cw[4:0];

// reg
// combinational logic
reg flag;
always @* begin
    flag = r_enable | r_skip | r_stop | r_invert;
end

// async count
reg       cnt_4b_is_0xa;
reg [3:0] cnt_4b;

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cnt_4b        <= 4'd0;
        cnt_4b_is_0xa <= 1'b0;
        o_flag        <= 1'b0;
    end
    else begin
        cnt_4b        <= cnt_4b + 4'd1;
        cnt_4b_is_0xa <= cnt_4b==4'ha ? 1'b1 : 1'b0;
        o_flag        <= cnt_4b ==4'h8 ? 1'b1 : 1'b0;
    end
end

// function : max
// 
function [7:0] max;
    input [7:0] A;
    input [7:0] B;
    
    begin
        max = A < B ? B : A;
    end
endfunction

wire [7:0] temp_max = max(i_din[7:0], NUM_6);


// 
// single-port SRAM
// 
wire ram_en;
wire [7:0] ram_dout;

assign ram_en = i_wr | i_rd;

mini_sp_ram #(
    .ADDR_BITS  ( 8 )
) u_mini_sp_ram (    
    .clk  ( clk       ),
    .addr ( i_addr    ),
    .din  ( i_data_wr ),
    .ce   ( ram_en    ),
    .we   ( i_wr      ),
    .dout ( ram_dout  )
);
assign test_0x03_ram_out = ram_dout;

// 
// ROM
// 
wire [7:0] rom_dout;
mini_rom u_mini_rom (    
    .clk  ( clk       ),
    .addr ( i_addr    ),
    .dout ( rom_dout  )
);

assign test_0x04_rom_out = rom_dout;
// 
// F.I.R filter top
// 
wire [7:0] fir_out;
mini_fir u_mini_fir (
    .clk         ( clk        ),
    .rst_n       ( rst_n      ),
    .i_addr      ( i_addr[3:0]),
    .i_data_wr   ( i_data_wr  ),
    .i_wr        ( i_wr       ),
    .i_rd        ( i_rd       ),
    .o_data_rd   ( o_data_rd  ),
    .i_din       ( i_din[7:0] ),
    .o_dout      ( fir_out    )
);
assign test_0x05_fir_out = fir_out;
endmodule
