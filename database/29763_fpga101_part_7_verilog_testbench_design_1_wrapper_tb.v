// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module design_1_wrapper_tb();
    localparam T = 10;
    
    reg clk;
    reg rst_n;
    reg start;
    wire ready;

    reg [31:0] BRAM_PORTA_addr;
    reg BRAM_PORTA_clk;
    reg [31:0] BRAM_PORTA_din;
    wire [31:0] BRAM_PORTA_dout;
    reg BRAM_PORTA_en;
    reg BRAM_PORTA_rst;
    reg [3:0] BRAM_PORTA_we;
    reg [31:0] BRAM_PORTB_addr;
    reg BRAM_PORTB_clk;
    reg [31:0] BRAM_PORTB_din;
    wire [31:0] BRAM_PORTB_dout;
    reg BRAM_PORTB_en;
    reg BRAM_PORTB_rst;
    reg [3:0] BRAM_PORTB_we;
    
    integer i = 0;
    
    design_1_wrapper dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .ready(ready),
        .start(start),
        .BRAM_PORTA_addr(BRAM_PORTA_addr),
        .BRAM_PORTA_clk(BRAM_PORTA_clk),
        .BRAM_PORTA_din(BRAM_PORTA_din),
        .BRAM_PORTA_dout(BRAM_PORTA_dout),
        .BRAM_PORTA_en(BRAM_PORTA_en),
        .BRAM_PORTA_rst(BRAM_PORTA_rst),
        .BRAM_PORTA_we(BRAM_PORTA_we),
        .BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_clk(BRAM_PORTB_clk),
        .BRAM_PORTB_din(BRAM_PORTB_din),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en),
        .BRAM_PORTB_rst(BRAM_PORTB_rst),
        .BRAM_PORTB_we(BRAM_PORTB_we)
    );
    
    always
    begin
        clk = 0;
        BRAM_PORTA_clk = 0;
        BRAM_PORTB_clk = 0;
        #(T/2);
        clk = 1;
        BRAM_PORTA_clk = 1;
        BRAM_PORTB_clk = 1;
        #(T/2);
    end
    
    initial
    begin
        start = 0;

        BRAM_PORTA_addr = 0;
        BRAM_PORTA_din = 0;
        BRAM_PORTA_en = 1;
        BRAM_PORTA_we = 0;
        BRAM_PORTB_addr = 0;
        BRAM_PORTB_din = 0;
        BRAM_PORTB_en = 1;
        BRAM_PORTB_we = 0;
        
        rst_n = 0;
        BRAM_PORTA_rst = 1;
        BRAM_PORTB_rst = 1;
        #(T*10);
        rst_n = 1;
        BRAM_PORTA_rst = 0;
        BRAM_PORTB_rst = 0;
        #(T*10);
        
        BRAM_PORTA_we = 4'hf;
        BRAM_PORTA_addr = 32'h00000000;
        BRAM_PORTA_din = {8'd0, 8'd1, 8'd8, 8'd1};
        #T;
        BRAM_PORTA_addr = 32'h00000004;
        BRAM_PORTA_din = {8'd0, 8'd2, 8'd7, 8'd2};
        #T;
        BRAM_PORTA_addr = 32'h00000008;
        BRAM_PORTA_din = {8'd0, 8'd3, 8'd6, 8'd3};
        #T;
        BRAM_PORTA_addr = 32'h0000000c;
        BRAM_PORTA_din = {8'd0, 8'd4, 8'd5, 8'd4};
        #T;
        BRAM_PORTA_addr = 32'h00000010;
        BRAM_PORTA_din = {8'd0, 8'd5, 8'd4, 8'd5};
        #T;
        BRAM_PORTA_addr = 32'h00000014;
        BRAM_PORTA_din = {8'd0, 8'd6, 8'd3, 8'd6};
        #T;
        BRAM_PORTA_addr = 32'h00000018;
        BRAM_PORTA_din = {8'd0, 8'd7, 8'd2, 8'd7};
        #T;
        BRAM_PORTA_addr = 32'h0000001c;
        BRAM_PORTA_din = {8'd0, 8'd8, 8'd1, 8'd8};
        #T;
        BRAM_PORTA_we = 4'h0;
        BRAM_PORTA_addr = 32'h00000000;
        BRAM_PORTA_din = 0;
                
        start = 1;
        #T;
        start = 0;
        #T;
        
        #(T*10);
        
        for (i = 0; i <= 28; i = i+4)
        begin
            BRAM_PORTB_addr = i;
            #T;
        end
    end    
    
endmodule
