// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module NFC_Atom_Command_Idle
#
(
    parameter NumberOfWays    =   4
)
(
    iTargetWay              ,

    oDQSOutEnable           ,
    oDQOutEnable            ,
    oDQStrobe               ,
    oDQ                     ,
    oChipEnable             ,
    oReadEnable             ,
    oWriteEnable            ,
    oAddressLatchEnable     ,
    oCommandLatchEnable  
);
    input   [NumberOfWays - 1:0]    iTargetWay              ;

    output                          oDQSOutEnable           ;
    output                          oDQOutEnable            ;

    output  [7:0]                   oDQStrobe               ;
    output  [31:0]                  oDQ                     ;
    output  [2*NumberOfWays - 1:0]  oChipEnable             ;
    output  [3:0]                   oReadEnable             ;
    output  [3:0]                   oWriteEnable            ;
    output  [3:0]                   oAddressLatchEnable     ;
    output  [3:0]                   oCommandLatchEnable     ;

    localparam Write_Valid = 4'b0010;
    localparam Write_Idle  = 4'b0011;

    localparam Out_Enable  = 0;
    localparam Out_Disable = 1;

    assign oDQSOutEnable       = Out_Enable ;
    assign oDQOutEnable        = Out_Enable ;   
    
    assign oDQStrobe           = 8'h0       ;   
    assign oDQ                 = 32'h0000   ;   
    assign oChipEnable         = { iTargetWay,iTargetWay };   
    assign oReadEnable         = 4'b0011    ;   
    assign oWriteEnable        = Write_Idle ;   
    assign oAddressLatchEnable = 4'h0       ;   
    assign oCommandLatchEnable = 4'h0       ; 

endmodule
