// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`timescale 1ns / 1ps

module WReg(clk,reset,Ins,V1,V2,AO,byte_addr,RD,HI,LO,PC,PC8,CP0_RD,Ins_W,V1_W,V2_W,AO_W,byte_addr_W,RD_W,HI_W,LO_W,PC_W,PC8_W,CP0_RD_W);
//interface
    input clk;
    input reset;

    input [31:0] Ins;
	input [31:0] V1;
	input [31:0] V2;
    input [31:0] AO;
	input [1:0] byte_addr;
    input [31:0] RD;
	input [31:0] HI;
	input [31:0] LO;

    input [31:0] PC;
    input [31:0] PC8;

    input [31:0] CP0_RD;
    
    output reg [31:0] Ins_W;
	output reg [31:0] V1_W;
	output reg [31:0] V2_W;
    output reg [31:0] AO_W;
	output reg [1:0] byte_addr_W;
    output reg [31:0] RD_W;
	output reg [31:0] HI_W;
	output reg [31:0] LO_W;

    output reg [31:0] PC_W;
    output reg [31:0] PC8_W;

    output reg [31:0] CP0_RD_W;
    
//sequential logic
    /*
	initial
		begin
			Ins_W=0;
			V1_W=0;
			V2_W=0;
            AO_W=0;
			byte_addr_W=0;
			RD_W=0;
			HI_W=0;
			LO_W=0;
			PC_W=0;
			PC8_W=0;
            CP0_RD_W=0;
		end
	*/
    
    always @(posedge clk)
        begin
            if(reset)
                begin
                    Ins_W<=0;
					V1_W<=0;
					V2_W<=0;
                    AO_W<=0;
					byte_addr_W<=0;
                    RD_W<=0;
					HI_W<=0;
					LO_W<=0;
                    PC_W<=0;
                    PC8_W<=0;
                    CP0_RD_W<=0;
                end
            else
                begin
                    Ins_W<=Ins;
					V1_W<=V1;
					V2_W<=V2;
                    AO_W<=AO;
					byte_addr_W<=byte_addr;
                    RD_W<=RD;
					HI_W<=HI;
					LO_W<=LO;
                    PC_W<=PC;
                    PC8_W<=PC8;
                    CP0_RD_W<=CP0_RD;
                end
        end

endmodule
