// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module pe_top
    (
        input wire         clk,
        input wire         rst_n,
        // *** Control and status port ***
        output wire        ready,
        input wire         start,
        // *** Data input port ***
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *)  output wire        clka,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *)  output wire        rsta,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *)   output wire        ena,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) output wire [31:0] addra,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *)  output wire [31:0] dina,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *)   output wire [3:0]  wea,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) input wire  [31:0] douta,
        // *** Data output port ***
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *)  output wire        clkb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *)  output wire        rstb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *)   output wire        enb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) output wire [31:0] addrb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *)  output wire [31:0] dinb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *)   output wire [3:0]  web,
        (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) input wire  [31:0] doutb
    );
    
    // Main controller 
    wire start_reg, start_rising;
    reg [5:0] cnt_main_reg;
    reg [31:0] cnt_addra_reg, cnt_addrb_reg;
    wire start_cnt_addra, start_cnt_addrb;
    
    // PE datapath
    wire signed [7:0] a_in, a_in_reg; 
    wire signed [7:0] y_in, y_in_reg;
    wire signed [7:0] b_in, b_in_reg;
    wire signed [7:0] y_out, y_out_reg;   

    // *** Main controller ******************************************************
    register #(1) reg_start_0(clk, rst_n, 1'b1, 1'b0, start, start_reg);
    assign start_rising = start & ~start_reg;
    
    // Counter for FSM
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            cnt_main_reg <= 0;
        end
        else if (start_rising)
        begin
            cnt_main_reg <= cnt_main_reg + 1;
        end
        else if (cnt_main_reg >= 1 && cnt_main_reg <= 10)
        begin
            cnt_main_reg <= cnt_main_reg + 1;
        end
        else if (cnt_main_reg >= 11)
        begin
            cnt_main_reg <= 0;
        end
    end

    // Input port control
    assign clka = clk;
    assign rsta = ~rst_n;
    assign ena = ((cnt_main_reg >= 1) && (cnt_main_reg <= 8)) ? 1 : 0;
    assign addra = cnt_addra_reg;
    assign dina = 0;
    assign wea = 0;

    // Address counter for BRAM input
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            cnt_addra_reg <= 0;
        end
        else if (start_cnt_addra)
        begin
            cnt_addra_reg <= cnt_addra_reg + 4;
        end
        else if (cnt_addra_reg >= 32'h00000004 && cnt_addra_reg <= 32'h00000018)
        begin
            cnt_addra_reg <= cnt_addra_reg + 4;
        end
        else if (cnt_addra_reg >= 32'h0000001c)
        begin
            cnt_addra_reg <= 0;
        end
    end
    assign start_cnt_addra = (cnt_main_reg == 1);

    // Output port control
    assign clkb = clk;
    assign rstb = ~rst_n;
    assign enb = ((cnt_main_reg >= 4) && (cnt_main_reg <= 11)) ? 1 : 0;
    assign addrb = cnt_addrb_reg;
    assign dinb = y_out_reg;
    assign web = ((cnt_main_reg >= 4) && (cnt_main_reg <= 11)) ? 4'hf : 4'h0;

    // Address counter for BRAM output
    always @(posedge clk)
    begin
        if (!rst_n)
        begin
            cnt_addrb_reg <= 0;
        end
        else if (start_cnt_addrb)
        begin
            cnt_addrb_reg <= cnt_addrb_reg + 4;
        end
        else if (cnt_addrb_reg >= 32'h00000004 && cnt_addrb_reg <= 32'h00000018)
        begin
            cnt_addrb_reg <= cnt_addrb_reg + 4;
        end
        else if (cnt_addrb_reg >= 32'h0000001c)
        begin
            cnt_addrb_reg <= 0;
        end
    end
    assign start_cnt_addrb = (cnt_main_reg == 4);
    
    // Status control
    assign ready = (cnt_main_reg == 0) ? 1 : 0;
    
    // *** PE datapath **********************************************************
    // Input from BRAM
    assign a_in = douta[7:0];
    assign b_in = douta[15:8];
    assign y_in = douta[23:16];
    
    // Pipeline registers for input
    register #(8) reg_0(clk, rst_n, 1'b1, 1'b0, a_in, a_in_reg);
    register #(8) reg_1(clk, rst_n, 1'b1, 1'b0, y_in, y_in_reg);
    register #(8) reg_2(clk, rst_n, 1'b1, 1'b0, b_in, b_in_reg);
    
    // PE
    pe #(8, 0) pe_0
    (
        .a_in(a_in_reg),
        .y_in(y_in_reg),
        .b(b_in_reg),
        .a_out(),
        .y_out(y_out)
    );
    
    // Pipeline registers for output
    register #(8) reg_3(clk, rst_n, 1'b1, 1'b0, y_out, y_out_reg);
    
endmodule
