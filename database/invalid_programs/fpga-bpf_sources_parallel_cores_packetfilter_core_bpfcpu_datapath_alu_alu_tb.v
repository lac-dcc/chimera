//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
alu_tb.v

A testbench for alu.v
*/

`ifdef FROM_ALU
`include "../../../bpf_defs.vh"
`include "alu.v"
`else /* For Vivado */
`include "bpf_defs.vh"
`endif

module alu_tb;
	reg clk;
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALU_sel;
    reg ALU_en;
    wire [31:0] ALU_out;
    wire set;
    wire eq;
    wire gt;
    wire ge;
    wire ALU_vld;
    reg ALU_ack;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        A <= 0;
        B <= 0;
        ALU_sel <= 0;
        ALU_en <= 0;
        ALU_ack <= 0;
        
        fd = $fopen("alu_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        
        while ($fgetc(fd) != "\n") begin
            if ($feof(fd)) begin
                $display("Error: file is in incorrect format");
                $finish;
            end
        end
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        
        #0.01
        dummy = $fscanf(fd, "%d%d%b%b%b", A, B, ALU_sel, ALU_en, ALU_ack);
    end

    alu DUT (
        .clk(clk),
        .A(A),
        .B(B),
        .ALU_sel(ALU_sel),
        .ALU_en(ALU_en),
        .ALU_out(ALU_out),
        .set(set),
        .eq(eq),
        .gt(gt),
        .ge(ge),
        .ALU_vld(ALU_vld),
        .ALU_ack(ALU_ack)
    );


endmodule
