// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module design_3_wrapper_tb();
    localparam T = 8;
    
    reg [31:0]BRAM_PORTA_addr;
    reg [31:0]BRAM_PORTA_din;
    wire [31:0]BRAM_PORTA_dout;
    reg BRAM_PORTA_en;
    reg [3:0]BRAM_PORTA_we;
    reg [31:0]BRAM_PORTB_addr;
    reg [31:0]BRAM_PORTB_din;
    wire [31:0]BRAM_PORTB_dout;
    reg BRAM_PORTB_en;
    reg [3:0]BRAM_PORTB_we;
    reg clk;
    wire done;
    reg [7:0]gain;

    reg [9:0]num_of_inp;
    reg rst_n;
    reg start;
    integer i;
    
    design_3_wrapper uut (
        .BRAM_PORTA_addr(BRAM_PORTA_addr),
        .BRAM_PORTA_din(BRAM_PORTA_din),
        .BRAM_PORTA_dout(BRAM_PORTA_dout),
        .BRAM_PORTA_en(BRAM_PORTA_en),
        .BRAM_PORTA_we(BRAM_PORTA_we),
        .BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_din(BRAM_PORTB_din),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en),
        .BRAM_PORTB_we(BRAM_PORTB_we),
        .clk(clk),
        .done(done),
        .gain(gain),
        .num_of_inp(num_of_inp),
        .rst_n(rst_n),
        .start(start)
    );
    
    always
    begin
        // *** Clock ***
        clk = 0;
        #(T/2);
        clk = 1;
        #(T/2);
    end
        
    initial
    begin
        // *** Init ***
        BRAM_PORTA_addr = 0;
        BRAM_PORTA_din = 0;
        BRAM_PORTA_en = 1;
        BRAM_PORTA_we = 0;
        BRAM_PORTB_addr = 0;
        BRAM_PORTB_din = 0;
        BRAM_PORTB_en = 1;
        BRAM_PORTB_we = 0;
        gain = 0;
        num_of_inp = 0;
        start = 0;
        
        // *** Reset ***
        rst_n = 0;
        #(T*5);
        rst_n = 1;
        #(T*5);
        
        // ### 1 ###
        // *** Configuration ***
        gain = 5;
        num_of_inp = 10*4;
        
        // *** Write input ***
        BRAM_PORTA_we = 1;
        for (i = 0; i < 10*4; i = i+4)
        begin
            BRAM_PORTA_addr = i;
            BRAM_PORTA_din = i+4;
            #T;
        end
        BRAM_PORTA_we = 0;
        #(T*10);
        
        // *** Start ***
        start = 1;
        #T;
        start = 0;
        
        // Wait until process is done
        #(T*50);
        // *** Read output ***
        for (i = 0; i < 10*4; i = i+4)
        begin
            BRAM_PORTB_addr = i;
            #T;
        end
        #(T*10);        
    end
endmodule