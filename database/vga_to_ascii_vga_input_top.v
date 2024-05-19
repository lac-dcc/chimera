// This program was cloned from: https://github.com/zephray/vga_to_ascii
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Wenting Zhang
// 
// Create Date:    15:28:19 01/27/2018 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(  
  //IIC
  inout          IIC_SCL_VIDEO,
  inout          IIC_SDA_VIDEO,
  
  //VGA IN
  input          VGA_IN_DATA_CLK,
  input  [7:0]   VGA_IN_BLUE,
  input  [7:0]   VGA_IN_GREEN,
  input  [7:0]   VGA_IN_RED,
  input          VGA_IN_HSOUT,
  input          VGA_IN_ODD_EVEN_B,
  input          VGA_IN_VSOUT,
  input          VGA_IN_SOGOUT,
  
  //SW
  input          GPIO_SW_C,
  input          GPIO_SW_W,
  input          GPIO_SW_E,
  input          GPIO_SW_S,
  input          GPIO_SW_N,
  input  [7:0]   GPIO_DIP_SW,

  //LED
  output [7:0]   GPIO_LED,
  output         GPIO_LED_C,
  output         GPIO_LED_W,
  output         GPIO_LED_E,
  output         GPIO_LED_S,
  output         GPIO_LED_N,
  
  //DVI
  output [11:0]  DVI_D,
  output         DVI_DE,
  output         DVI_H,
  output         DVI_RESET_B,
  output         DVI_V,
  output         DVI_XCLK_N,
  output         DVI_XCLK_P,
  input          DVI_GPIO1,
  
  //System
  input          FPGA_CPU_RESET_B,
  input          CLK_33MHZ_FPGA,
  input          CLK_27MHZ_FPGA
    );

    //Clock and Reset control   
    wire clk_33;
    wire clk_100;

    wire reset_in;
    wire reset_pll;
    wire reset;
    wire locked_pll;

    assign clk_33 = CLK_33MHZ_FPGA;
    assign reset_in = ~FPGA_CPU_RESET_B;
    
    //Delay Control
    localparam IODELAY_GRP = "IODELAY_MIG";
    localparam RST_SYNC_NUM = 25;
    ddr2_idelay_ctrl_mod #(
      .IODELAY_GRP(IODELAY_GRP),
      .RST_SYNC_NUM(RST_SYNC_NUM)
    ) ddr2_idelay_ctrl_mod (
      .clk_100MHz(clk_100),
      .rst(reset)
    );

    pll pll (
        .CLKIN1_IN(clk_33), 
        .RST_IN(reset_pll), 
        .CLKOUT0_OUT(clk_100),
        .LOCKED_OUT(locked_pll)
    );

    debounce_rst debounce_rst(
        .clk(clk_33),
        .noisy_rst(reset_in),
        .pll_locked(locked_pll),
        .clean_pll_rst(reset_pll),
        .clean_async_rst(reset)
    );
    //assign reset = reset_in;
    
    wire iic_done;
    
    wire vs_in = VGA_IN_VSOUT;
    wire hs_in = VGA_IN_HSOUT;
    wire [7:0] r_in = VGA_IN_RED;
    wire [7:0] g_in = VGA_IN_GREEN;
    wire [7:0] b_in = VGA_IN_BLUE;
    wire pclk_in = VGA_IN_DATA_CLK;
    
    //Double buffering...
    reg [14:0] avg_r_a [0:99]; 
    reg [14:0] avg_g_a [0:99];
    reg [14:0] avg_b_a [0:99];
    reg [14:0] avg_r_b [0:99]; 
    reg [14:0] avg_g_b [0:99];
    reg [14:0] avg_b_b [0:99];
    reg disp_buffer;
    reg [10:0] x_counter; // 0-2047
    reg [10:0] y_counter; 
    reg hs_last;
    reg vs_last;
    
    localparam x_offset = 11'd220;
    localparam y_offset = 11'd28;
    localparam x_size = 11'd800;
    localparam y_size = 11'd600;
    
    wire x_valid = ((x_counter >= x_offset)&&(x_counter < (x_offset + x_size))) ? 1 : 0;
    wire y_valid = ((y_counter >= y_offset)&&(y_counter < (y_offset + y_size))) ? 1 : 0;
    wire y_valid_output = ((y_counter >= (y_offset + 11'd16))&&(y_counter < (y_offset + y_size + 11'd16))) ? 1 : 0;
    wire [10:0] x_position = (x_valid) ? (x_counter - x_offset) : 11'd0;
    wire [10:0] y_position = (y_valid) ? (y_counter - y_offset) : 11'd0;
    
    wire [6:0] avg_addr = (x_position / 8);
    wire avg_clear = ((y_position[3:0] == 4'b0000)&&(x_position[2:0] == 3'b000)) ? 1 : 0;
    
    always@(posedge pclk_in)
    begin
        if (reset) begin
            vs_last <= 0;
            hs_last <= 0;
            x_counter <= 0;
            y_counter <= 0;
            disp_buffer <= 0;
        end
        else begin
            hs_last <= hs_in;
            vs_last <= vs_in;
            if ((hs_last == 1'b0)&&(hs_in == 1'b1)) begin
                x_counter <= 0;
                y_counter <= y_counter + 1;
                if (y_position[3:0] == 4'b1111)
                    disp_buffer <= ~disp_buffer;
            end else
                x_counter <= x_counter + 1;
            if ((vs_last == 1'b0)&&(vs_in == 1'b1)) begin
                y_counter <= 0;
            end
            if (x_valid && y_valid) begin
                if (disp_buffer) begin
                    avg_r_a[avg_addr] <= ((avg_clear) ? (14'b0) : (avg_r_a[avg_addr])) + r_in;
                    avg_g_a[avg_addr] <= ((avg_clear) ? (14'b0) : (avg_g_a[avg_addr])) + g_in;
                    avg_b_a[avg_addr] <= ((avg_clear) ? (14'b0) : (avg_b_a[avg_addr])) + b_in;
                end
                else begin
                    avg_r_b[avg_addr] <= ((avg_clear) ? (14'b0) : (avg_r_b[avg_addr])) + r_in;
                    avg_g_b[avg_addr] <= ((avg_clear) ? (14'b0) : (avg_g_b[avg_addr])) + g_in;
                    avg_b_b[avg_addr] <= ((avg_clear) ? (14'b0) : (avg_b_b[avg_addr])) + b_in;
                end
            end
        end
    end
    
    wire out_en = (x_valid & y_valid_output);
    
    wire [7:0] avg_r_out = disp_buffer ? avg_r_b[avg_addr][14:7] : avg_r_a[avg_addr][14:7];
    wire [7:0] avg_g_out = disp_buffer ? avg_g_b[avg_addr][14:7] : avg_g_a[avg_addr][14:7];
    wire [7:0] avg_b_out = disp_buffer ? avg_b_b[avg_addr][14:7] : avg_b_a[avg_addr][14:7];
    wire [5:0] char_sel = (avg_r_out + avg_g_out + avg_b_out) / 16; 
    wire [7:0] char;
    wire char_out;
    
    ascii_lut ascii_lut(
        .id(char_sel),
        .char(char)
    );
    
    vga_font vga_font(
        .clk(VGA_IN_DATA_CLK),
        .ascii_code(char),
        .row(y_position[3:0]),
        .col(x_position[2:0]),
        .pixel(char_out)
    );
    
    reg [7:0] char_r_out;
    reg [7:0] char_g_out;
    reg [7:0] char_b_out;
    
    always@(negedge VGA_IN_DATA_CLK)
    begin
        char_r_out <= (char_out) ? ((GPIO_DIP_SW[0]) ? (avg_r_out) : (8'hFF)) : (8'h00);
        char_g_out <= (char_out) ? ((GPIO_DIP_SW[0]) ? (avg_g_out) : (8'hFF)) : (8'h00);
        char_b_out <= (char_out) ? ((GPIO_DIP_SW[0]) ? (avg_b_out) : (8'hFF)) : (8'h00);
    end
    
    wire [7:0] r_out = (out_en) ? ((GPIO_DIP_SW[1]) ? (char_r_out) : (r_in)) : 8'h00;
    wire [7:0] g_out = (out_en) ? ((GPIO_DIP_SW[1]) ? (char_g_out) : (g_in)) : 8'h00;
    wire [7:0] b_out = (out_en) ? ((GPIO_DIP_SW[1]) ? (char_b_out) : (b_in)) : 8'h00;
    
    dvi_module dvi_module(  
        //Outputs
        .dvi_vs(DVI_V),        
        .dvi_hs(DVI_H), 
        .dvi_d(DVI_D), 
        .dvi_xclk_p(DVI_XCLK_P), 
        .dvi_xclk_n(DVI_XCLK_N),
        .dvi_de(DVI_DE), 
        .dvi_reset_b(DVI_RESET_B),  
        .iic_done(iic_done), 
      
        //Inouts
        .dvi_sda(IIC_SDA_VIDEO),
        .dvi_scl(IIC_SCL_VIDEO),
      
        //Inputs
        .pixel_clk(VGA_IN_DATA_CLK), 
        .gpuclk_rst(reset), 
        .hsync(~VGA_IN_HSOUT),
        .vsync(~VGA_IN_VSOUT),
        .blank_b(out_en),
        .pixel_r(r_out),
        .pixel_b(b_out),
        .pixel_g(g_out)
    );


    assign GPIO_LED[7:0] = {char};
    assign GPIO_LED_C = iic_done;
    assign GPIO_LED_S = char_out;
    assign GPIO_LED_W = 0;
    assign GPIO_LED_N = 0;
    assign GPIO_LED_E = 0;
    
    
endmodule
