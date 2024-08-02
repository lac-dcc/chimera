// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`timescale 1ns / 1ps

module MReg(clk,reset,Ins,V1,V2,AO,byte_addr,HI,LO,PC,PC8,ExcCode,BD,Ins_M,V1_M,V2_M,AO_M,byte_addr_M,HI_M,LO_M,PC_M,PC8_M,ExcCode_M,BD_M);
//interface
    input clk;
    input reset;

    input [31:0] Ins;
	input [31:0] V1;
    input [31:0] V2;
    input [31:0] AO;
    input [1:0] byte_addr;
	input [31:0] HI;
	input [31:0] LO;

    input [31:0] PC;
    input [31:0] PC8;

    input [6:2] ExcCode;
    input BD;
	
    output reg [31:0] Ins_M;
	output reg [31:0] V1_M;
    output reg [31:0] V2_M;
    output reg [31:0] AO_M;
	output reg [1:0] byte_addr_M;
	output reg [31:0] HI_M;
	output reg [31:0] LO_M;

    output reg [31:0] PC_M;
    output reg [31:0] PC8_M;

    output reg [6:2] ExcCode_M;
    output reg BD_M;

//sequential logic
    /*
	initial
		begin
			Ins_M=0;
			V1_M=0;
			V2_M=0;
			AO_M=0;
			HI_M=0;
			LO_M=0;
			PC_M=0;
			PC8_M=0;
			byte_addr_M=0;
            ExcCode_M=0;
            BD_M=0;
		end
	*/
    
    always @(posedge clk)
        begin
            if(reset)
                begin
                    Ins_M<=0;
					V1_M<=0;
                    V2_M<=0;
                    AO_M<=0;
                    byte_addr_M<=0;
					HI_M<=0;
					LO_M<=0;
                    PC_M<=PC;
                    PC8_M<=0;
                    ExcCode_M<=0;
                    BD_M<=BD;
                end
            else
                begin
                    Ins_M<=Ins;
					V1_M<=V1;
                    V2_M<=V2;
                    AO_M<=AO;
                    byte_addr_M<=byte_addr;
					HI_M<=HI;
					LO_M<=LO;
                    PC_M<=PC;
                    PC8_M<=PC8;
                    ExcCode_M<=ExcCode;
                    BD_M<=BD;
                end
        end
        
endmodule
