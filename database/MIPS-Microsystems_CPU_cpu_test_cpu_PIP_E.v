`timescale 1ns / 1ps

module EReg(clk,reset,stall,Ins,V1,V2,Ext,PC,PC8,ExcCode,BD,Ins_E,V1_E,V2_E,Ext_E,PC_E,PC8_E,ExcCode_E,BD_E);
//interface
    input clk;
    input reset;
    input stall;

    input [31:0] Ins;
    input [31:0] V1;
    input [31:0] V2;
    input [31:0] Ext;

    input [31:0] PC;
    input [31:0] PC8;

    input [6:2] ExcCode;
    input BD;

    output reg [31:0] Ins_E;
    output reg [31:0] V1_E;
    output reg [31:0] V2_E;
    output reg [31:0] Ext_E;
    
    output reg [31:0] PC_E;
    output reg [31:0] PC8_E;

    output reg [6:2] ExcCode_E;
    output reg BD_E;

//sequential logic
    /*
	initial
		begin
			Ins_E=0;
			V1_E=0;
			V2_E=0;
			Ext_E=0;
			PC_E=0;
			PC8_E=0;
            ExcCode_E=0;
            BD_E=0;
		end
	*/
    
    always @(posedge clk)
        begin
            if(reset||stall)
                begin
                    Ins_E<=0;
                    V1_E<=0;
                    V2_E<=0;
                    Ext_E<=0;
                    PC_E<=PC;       //stick PC_D and keep on piping
                    PC8_E<=0;
                    ExcCode_E<=0;
                    BD_E<=BD;       //stick BD_D and keep on piping
                end 
            else
                begin
                    Ins_E<=Ins;
                    V1_E<=V1;
                    V2_E<=V2;
                    Ext_E<=Ext;
                    PC_E<=PC;
                    PC8_E<=PC8;
                    ExcCode_E<=ExcCode;
                    BD_E<=BD;
                end
        end

endmodule