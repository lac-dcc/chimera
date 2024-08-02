// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`timescale 1ns / 1ps

module DReg(clk,reset,stall,branch,Ins,PC,ExcCode,Ins_D,PC_D,ExcCode_D,BD_D);
//interface
    input clk;
    input reset;
    input stall;
    input branch;

    input [31:0] Ins;
    input [31:0] PC;

    input [6:2] ExcCode;

    output reg [31:0] Ins_D;
    output reg [31:0] PC_D;
    
    output reg [6:2] ExcCode_D;
    output reg BD_D;

//sequential logic	
    /*
	initial
		begin
			Ins_D=0;
            PC_D=0;
            ExcCode_D=0;
            BD_D=0;
		end
    */
    
    always @(posedge clk)
        begin
            if(reset)
                begin
                    Ins_D<=0;
                    PC_D<=0;        //PC_D doesn't need to stick any PC,so it can be set zero.
                    ExcCode_D<=0;
                    BD_D<=0;
                end
            else if(stall)
                begin
                    Ins_D<=Ins_D;
                    PC_D<=PC_D;
                    ExcCode_D<=ExcCode_D;
                    BD_D<=BD_D;
                end
            else
                begin
                    Ins_D<=Ins;
                    PC_D<=PC;
                    ExcCode_D<=ExcCode;
                    BD_D<=branch;   //BD is stuck on Ins_F when Ins_D is branch
                end
        end

endmodule