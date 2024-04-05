//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
/*
alu.v
A simple ALU designed to match the needs of the BPF VM. 
*/

`ifdef FROM_ALU
`include "../../../bpf_defs.vh"
`elsif FROM_BPFCPU
`include "../bpf_defs.vh"
`elsif FROM_PARALLEL_CORES
`include "packetfilter_core/bpf_defs.vh"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/bpf_defs.vh"
`else /* For Vivado */
`include "bpf_defs.vh"
`endif

module alu # (
	parameter PESS = 0
)(
	input wire clk,
    input wire rst,
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [3:0] ALU_sel,
    input wire ALU_en,
    output wire [31:0] ALU_out,
    output wire set,
    output wire eq,
    output wire gt,
    output wire ge,
    output wire ALU_vld,
    input wire ALU_ack
);

    /************************************/
    /**Forward-declare internal signals**/
    /************************************/
    wire [31:0] A_i;
    wire [31:0] B_i;
    wire [3:0] ALU_sel_i;
    wire ALU_en_i;
    reg [31:0] ALU_out_i;
    wire eq_i, gt_i, ge_i, set_i;
    wire ALU_vld_i;
    
    /***************************************/
    /**Assign internal signals from inputs**/
    /***************************************/
    
    assign A_i = A;
    assign B_i = B;
    assign ALU_sel_i = ALU_sel;
    assign ALU_en_i = ALU_en;
    
    /****************/
    /**Do the logic**/
    /****************/
    
    
    always @(*) begin
        case (ALU_sel_i)
            4'h0:
                ALU_out_i <= A_i + B_i;
            4'h1:
                ALU_out_i <= A_i - B_i;
            4'h2:
                //ALU_out <= A_i * B_i; //TODO: what if this takes >1 clock cycle?
                ALU_out_i <= 32'hCAFEDEAD; //For simplicity, return an "error code" to say "modulus not supported"
            4'h3:
                /*
                ALU_out <= A_i / B_i; //TODO: what if B_i is zero?
                                  //TODO: what if this takes >1 clock cycle?
                */
                ALU_out_i <= 32'hDEADBEEF; //For simplicity, return an "error code" to say "division not supported"
            4'h4:
                ALU_out_i <= A_i | B_i;
            4'h5:
                ALU_out_i <= A_i & B_i;
            4'h6:
                ALU_out_i <= A_i << B_i; //TODO: does this work?
            4'h7:
                ALU_out_i <= A_i >> B_i; //TODO: does this work?
            4'h8:
                ALU_out_i <= ~A_i;
            4'h9:
                /*
                ALU_out <= A_i % B_i; //TODO: what if B_i is zero?
                                  //TODO: what if this takes >1 clock cycle?
                */
                ALU_out_i <= 32'hBEEFCAFE; //For simplicity, return an "error code" to say "modulus not supported"
            4'hA:
                ALU_out_i <= A_i ^ B_i;
            default:
                ALU_out_i <= 32'd0;
        endcase
    end


    //These are used as the predicates for JMP instructions
    assign eq_i = (A_i == B_i) ? 1'b1 : 1'b0;
    assign gt_i = (A_i > B_i) ? 1'b1 : 1'b0;
    assign ge_i = gt_i | eq_i;
    assign set_i = ((A_i & B_i) != 32'h00000000) ? 1'b1 : 1'b0;

    assign ALU_vld_i = ALU_en_i;
    
    
    /****************************************/
    /**Assign outputs from internal signals**/
    /****************************************/
    
    reg [31:0] ALU_out_r = 0;
    reg eq_r = 0;
    reg gt_r = 0;
    reg ge_r = 0;
    reg set_r = 0;
    reg ALU_vld_r = 0;
    
    always @(posedge clk) begin
    	if (rst) begin
            ALU_vld_r <= 0;
    	end else begin
			if (ALU_en_i) begin
				ALU_vld_r <= ALU_vld_i;
			end else begin
				ALU_vld_r <= (ALU_ack) ? 0 : ALU_vld_r;
			end
		end
        if (ALU_en_i) begin
            ALU_out_r <= ALU_out_i;
            eq_r <= eq_i;
            gt_r <= gt_i;
            ge_r <= ge_i;
            set_r <= set_i;
        end 
    end
    
    assign ALU_out = ALU_out_r;
    assign eq = eq_r;
    assign gt = gt_r;
    assign ge = ge_r;
    assign set = set_r;
    assign ALU_vld = ALU_vld_r;

endmodule
