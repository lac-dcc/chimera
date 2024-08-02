// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module design_1_wrapper_tb();
    localparam T = 10;
    
    reg [31:0]BRAM_PORTA_addr;
    reg BRAM_PORTA_clk;
    reg [31:0]BRAM_PORTA_din;
    wire [31:0]BRAM_PORTA_dout;
    reg BRAM_PORTA_en;
    reg BRAM_PORTA_rst;
    reg [3:0]BRAM_PORTA_we;
    reg [31:0]BRAM_PORTB_addr;
    reg BRAM_PORTB_clk;
    reg [31:0]BRAM_PORTB_din;
    wire [31:0]BRAM_PORTB_dout;
    reg BRAM_PORTB_en;
    reg BRAM_PORTB_rst;
    reg [3:0]BRAM_PORTB_we;
    integer i;
    
    design_1_wrapper uut 
    (
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
        //Clock
        BRAM_PORTA_clk = 0;
        BRAM_PORTB_clk = 0;
        #(T/2);
        BRAM_PORTA_clk = 1;
        BRAM_PORTB_clk = 1;
        #(T/2);
    end
    
    initial
    begin
        // Init
        BRAM_PORTA_addr = 0;
        BRAM_PORTA_din = 0;
        BRAM_PORTA_en = 1;
        BRAM_PORTA_we = 0;
        BRAM_PORTB_addr = 0;
        BRAM_PORTB_din = 0;
        BRAM_PORTB_en = 1;
        BRAM_PORTB_we = 0;
        
        // Reset
        BRAM_PORTA_rst = 1;
        BRAM_PORTB_rst = 1;
        #(T*5);
        BRAM_PORTA_rst = 0;
        BRAM_PORTB_rst = 0;
        #(T*5);
        
        // Write port A
        BRAM_PORTA_we = 4'hf;
        for (i = 0; i < 32; i = i+4)
        begin
            BRAM_PORTA_addr = i;
            BRAM_PORTA_din = i;
            #T;
        end
        BRAM_PORTA_we = 0;
        #T;
        
        // Read port B
        for (i = 0; i < 32; i = i+4)
        begin
            BRAM_PORTB_addr = i;
            #T;
        end
        #T;
    end
endmodule