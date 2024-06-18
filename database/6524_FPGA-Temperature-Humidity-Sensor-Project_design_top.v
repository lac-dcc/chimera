// This program was cloned from: https://github.com/aarontartz/FPGA-Temperature-Humidity-Sensor-Project
// License: MIT License

`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Aaron Tartz
// 
// Create Date: 04/02/2024 07:22:51 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
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
    input wire pl_clk,
    input wire btn0,
    //input wire [15:0] data_in,
    inout wire ck_sda,
    output wire ck_scl,
    output wire ck_io0,
    output wire ck_io1,
    output wire ck_io2,
    output wire ck_io3,
    output wire ck_io4,
    output wire ck_io5,
    output wire ck_io6,
    output wire ck_io7,
    output wire ck_io8,
    output wire ck_io9,
    output wire ck_io10,
    output wire ck_io11,
    output wire ck_io12,
    output wire ck_io13,
    output wire ck_io26,
    output wire ck_io27,
    output wire ck_io28,
    output wire ck_io29,
    output wire ck_io30,
    output wire ck_io31,
    output wire ck_io32,
    output wire ck_io33,
    output wire ck_io40,
    output wire ck_io41,
    //output wire [15:0] data_out,
    
    //LOGIC ANALYZER TESTING
    output wire ck_io39,
    output wire ck_io38,
    output wire ck_io37,
    output wire ck_io36,
    output wire ck_io35
    );
    
    wire [7:0] tens_out;
    wire [7:0] ones_out;
    wire [7:0] decimal_out;
    wire [15:0] meas_out_wire;
    wire sda_in_wire;
    wire sda_out_wire;
    wire sda_en_wire;
    wire scl_out_wire;
    wire [1:0] send_cmd_wire;
    
    //LOGIC ANALYZER TESTING
    wire clk100kHz_double_wire;
    wire nack_ack_wire;
    //=================================
    
    wire clk;
    wire [12:0] bram_porta_0_addr;
    wire [31:0] bram_porta_0_din;
    wire [31:0] bram_porta_0_dout;
    wire bram_porta_0_en;
    wire rst;
    wire bram_porta_0_we;
    
    reg [10:0] bram_portb_0_addr = 0;
    reg [31:0] bram_portb_0_din = 0;
    reg bram_portb_0_we = 1'b0;
    
    /*
    design_2_wrapper zynq_ps_instance (
        .BRAM_PORTA_0_addr(bram_porta_0_addr),
        .BRAM_PORTA_0_clk(clk),
        .BRAM_PORTA_0_din(bram_porta_0_din),
        .BRAM_PORTA_0_dout(bram_porta_0_dout),
        .BRAM_PORTA_0_en(bram_porta_0_en),
        .BRAM_PORTA_0_rst(rst),
        .BRAM_PORTA_0_we(bram_porta_0_we)
    );
    
    blk_mem_gen_0 blk_mem_gen_inst (
        .clka(clk),
        .ena(bram_porta_0_en),
        .wea(bram_porta_0_we),
        .addra(bram_porta_0_addr[12:2]),
        .dina(bram_porta_0_din),
        .douta(bram_porta_0_dout),
        
        .clkb(clk),
        .enb(1'b1),
        .web(bram_portb_0_we),
        .addrb(bram_portb_0_addr),
        .dinb(bram_portb_0_din),
        .doutb()
    );
    
    always @(posedge clk) begin
        if (bram_portb_0_addr != 11'h7ff) begin
            bram_portb_0_addr <= bram_portb_0_addr + 1;
            bram_portb_0_din <= meas_out_wire;          //?
            bram_portb_0_we <= 1'b1;
        end
        else begin
            bram_portb_0_we <= 1'b0;
        end
    end
    
    button_fsm button_instance (
        .clk100MHz(pl_clk),
        .button_press(btn0),
        .send_cmd(send_cmd_wire)
    );
    */
    i2c_master i2c_instance (
        .clk100MHz(pl_clk),
        .cmd_in(send_cmd_wire),
        .sda_in(sda_in_wire),
        .sda_out(sda_out_wire),
        .sda_en(sda_en_wire),
        .scl_out(scl_out_wire),
        .data_out(meas_out_wire),
        
        //TESTING
        .clk100kHz_double(clk100kHz_double_wire),
        .nack_ack_w(nack_ack_wire)
    );
    
    disp_7seg disp_instance (
        .clk100MHz(pl_clk),
        .cmd_in(send_cmd_wire),
        .data_in(meas_out_wire),
        .data_out_tens(tens_out),
        .data_out_ones(ones_out),
        .data_out_decimal(decimal_out)
    );
    
    //LOGIC ANALYZER TESTING
    assign ck_io39 = clk100kHz_double_wire;
    assign ck_io38 = sda_in_wire;
    assign ck_io37 = sda_out_wire;
    assign ck_io36 = sda_en_wire;
    assign ck_io35 = nack_ack_wire;
    //=================================
    
    assign data_out = meas_out_wire;
    
    assign ck_scl = scl_out_wire;
    assign ck_sda = sda_en_wire ? sda_out_wire : 1'bz;  // necessary? try ck_sda = sda_out_wire later
    assign sda_in_wire = ck_sda;
    
    assign {ck_io41, ck_io40, ck_io13, ck_io12, ck_io11, ck_io10, ck_io9, ck_io8} = tens_out;
    assign {ck_io7, ck_io6, ck_io5, ck_io4, ck_io3, ck_io2, ck_io1, ck_io0} = ones_out;
    assign {ck_io26, ck_io27, ck_io28, ck_io29, ck_io30, ck_io31, ck_io32, ck_io33} = decimal_out;
    
endmodule
