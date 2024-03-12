`timescale 1ns / 1ps

module NFC_Command_Idle
#
(
    parameter NumberOfWays    =   4
)
(
    oACG_Command          ,  
    oACG_CommandOption    ,  

    oACG_TargetWay        ,  
    oACG_NumOfData        ,  

    oACG_CASelect         ,  
    oACG_CAData           ,  

    oACG_WriteData        ,  
    oACG_WriteLast        ,  
    oACG_WriteValid       ,  

    oACG_ReadReady       
);

    output   [7:0]                  oACG_Command             ;
    output   [2:0]                  oACG_CommandOption       ;

    output   [NumberOfWays - 1:0]   oACG_TargetWay           ;
    output   [15:0]                 oACG_NumOfData           ;

    output                          oACG_CASelect            ;
    output   [39:0]                 oACG_CAData              ;

    output   [15:0]                 oACG_WriteData           ;
    output                          oACG_WriteLast           ;
    output                          oACG_WriteValid          ;

    output                          oACG_ReadReady           ;


	assign oACG_Command         = 8'b0000_0000;    
	assign oACG_CommandOption   = 3'b000;    
	assign oACG_TargetWay       = 8'hff;    
	assign oACG_NumOfData       = 16'd0;    
	assign oACG_CASelect        = 1'b1;    
	assign oACG_CAData          = 40'h00_00_00_00_00;    
	assign oACG_WriteData       = 16'h0000;    
	assign oACG_WriteLast       = 1'b0;    
	assign oACG_WriteValid      = 1'b0;    
	assign oACG_ReadReady       = 1'b0;    
	
endmodule