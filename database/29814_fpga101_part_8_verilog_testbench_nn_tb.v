// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module nn_tb();
    localparam T = 10;
    
    reg clk;
    reg rst_n;
    reg en;
    reg clr;

    wire ready;
    reg start;
    wire done;

    reg wb_ena;
    reg [2:0] wb_addra;
    reg [63:0] wb_dina;
    reg [7:0] wb_wea;

    reg k_ena;
    reg [1:0] k_addra;
    reg [63:0] k_dina;
    reg [7:0] k_wea;

    reg a_enb;
    reg [1:0] a_addrb;
    wire [63:0] a_doutb;
 
    nn dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .clr(clr),
        .ready(ready),
        .start(start),
        .done(done),
        .wb_ena(wb_ena),
        .wb_addra(wb_addra),
        .wb_dina(wb_dina),
        .wb_wea(wb_wea),
        .k_ena(k_ena),
        .k_addra(k_addra),
        .k_dina(k_dina),
        .k_wea(k_wea),
        .a_enb(a_enb),
        .a_addrb(a_addrb),
        .a_doutb(a_doutb)
    );

    always
    begin
        clk = 0;
        #(T/2);
        clk = 1;
        #(T/2);
    end
    
    initial
    begin
        en = 1;
        clr = 0;
        start = 0;
        wb_ena = 1;
        wb_addra = 0;
        wb_dina = 0;
        wb_wea = 0;
        k_ena = 1;
        k_addra = 0;
        k_dina = 0;
        k_wea = 0;
        a_enb = 0;
        a_addrb = 0;
        
        rst_n = 0;
        #(T*5);
        rst_n = 1;
        #(T*5);
        
        // *** Testvector 1 ***
        // Write weight and bias
        wb_wea = 8'hff;
        wb_addra = 0;
        wb_dina = 64'b0000000000000000_1011000001111010_0000010101111010_0000010101111010;
        #T;     
        wb_addra = 1;
        wb_dina = 64'b0000000000000000_1111110001100110_0000001111100001_0000001100010100;
        #T;
        wb_addra = 2;  
        wb_dina = 64'b0000000000000000_1111110001110000_0000001010001111_0000010000110011;
        #T;
        wb_addra = 3;  
        wb_dina = 64'b1111010110100011_0000000001010001_1111101011000010_0001110001110000;
        #T;
        wb_addra = 4;  
        wb_dina = 64'b0000000011001100_0000011111100001_0000011010000101_1110001110011001;
        #T;
        wb_wea = 8'h00;
        wb_addra = 0;  
        wb_dina = 0;
        #T;
        
        // Write input
        k_wea = 8'hff;
        k_addra = 0;
        k_dina = 64'b0001010000000000_0001010000000000_0010000000000000_0010000000000000;
        #T; 
        k_wea = 8'hff;
        k_addra = 1;
        k_dina = 64'b0001010000000000_0010000000000000_0001010000000000_0010000000000000;
        #T;
        k_wea = 8'h00;
        k_addra = 0;  
        k_dina = 0;
        #T;
        
        // Start module
        start = 1;
        #T;
        start = 0;
        #T;
        
        #(T*50);
    end
    
endmodule
