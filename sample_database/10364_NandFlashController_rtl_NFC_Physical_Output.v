// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module NFC_Physical_Output
#
(
    parameter NumberOfWays    =   4
)
(
    iSystemClock            ,
    // iOutputDrivingClock     ,
    iSystemClock_120         ,
    iModuleReset            ,
    iDQSOutEnable           ,
    iDQOutEnable            ,
    iPO_DQStrobe            ,
    iPO_DQ                  ,
    iPO_ChipEnable          ,
    iPO_ReadEnable          ,
    iPO_WriteEnable         ,
    iPO_AddressLatchEnable  ,
    iPO_CommandLatchEnable  ,
    oDQSOutEnableToPinpad   ,
    oDQOutEnableToPinpad    ,
    oDQSToNAND              ,
    oDQToNAND               ,
    oCEToNAND               ,
    oWEToNAND               ,
    oREToNAND               ,
    oALEToNAND              ,
    oCLEToNAND
);
    // Data Width (DQ): 8 bit
    
    // 4:1 DDR Serialization with OSERDESE2
    // OSERDESE2, 4:1 DDR Serialization
    //            CLKDIV: SDR 100MHz CLK: SDR 200MHz OQ: DDR 200MHz
    //            output resolution: 2.50 ns
    input                           iSystemClock            ;
    // input                           iOutputDrivingClock     ;
    input                           iSystemClock_120         ;
    input                           iModuleReset            ;
    input                           iDQSOutEnable           ;
    input                           iDQOutEnable            ;
    input   [7:0]                   iPO_DQStrobe            ; // DQS, full res.
    input   [31:0]                  iPO_DQ                  ; // DQ, half res., 2 bit * 8 bit data width = 16 bit interface width
    input   [2*NumberOfWays - 1:0]  iPO_ChipEnable          ; // CE, quater res., 1 bit * 4 way = 4 bit interface width
    input   [3:0]                   iPO_ReadEnable          ; // RE, half res.
    input   [3:0]                   iPO_WriteEnable         ; // WE, half res.
    input   [3:0]                   iPO_AddressLatchEnable  ; // ALE, half res.
    input   [3:0]                   iPO_CommandLatchEnable  ; // CLE, half res.
    output                          oDQSOutEnableToPinpad   ;
    output  [7:0]                   oDQOutEnableToPinpad    ;
    output                          oDQSToNAND              ;
    output  [7:0]                   oDQToNAND               ;
    output  [NumberOfWays - 1:0]    oCEToNAND               ;
    output                          oWEToNAND               ;
    output                          oREToNAND               ;
    output                          oALEToNAND              ;
    output                          oCLEToNAND              ;


    genvar c, d;
    ODDR
    #(
        .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
        .INIT           (1'b0),
        .SRTYPE         ("SYNC")
    )
    Inst_DQSODDR
    (
        .D1             (iPO_DQStrobe[0]),
        .D2             (iPO_DQStrobe[2]),
        .C              (iSystemClock),
        .CE             (1),
        .Q              (oDQSToNAND),
        .R              (1'b0),
        .S              (1'b0)
    );

    ODDR
    #(
        .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
        .INIT           (1'b0),
        .SRTYPE         ("SYNC")
    )
    Inst_DQSTODDR
    (
        .D1             (iDQSOutEnable),
        .D2             (iDQSOutEnable),
        .C              (iSystemClock),
        .CE             (1),
        .Q              (oDQSOutEnableToPinpad),
        .R              (1'b0),
        .S              (1'b0)
    );

    generate
    for (c = 0; c < 8; c = c + 1)
    begin : DQODDRBits

        ODDR
        #(
            .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
            .INIT           (1'b0),
            .SRTYPE         ("SYNC")
        )
        Inst_DQODDR
        (
            .D1             (iPO_DQ[ 0 + c]),
            .D2             (iPO_DQ[16 + c]),
            .C              (iSystemClock_120),
            .CE             (1),
            .Q              (oDQToNAND[c]),
            .R              (1'b0),
            .S              (1'b0)
        );

        ODDR
        #(
            .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
            .INIT           (1'b0),
            .SRTYPE         ("SYNC")
        )
        Inst_DQTODDR
        (
            .D1             (iDQOutEnable),
            .D2             (iDQOutEnable),
            .C              (iSystemClock_120),
            .CE             (1),
            .Q              (oDQOutEnableToPinpad[c]),
            .R              (1'b0),
            .S              (1'b0)
        );
    end
    endgenerate

    generate
    for (d = 0; d < NumberOfWays; d = d + 1)
    begin : CEODDRBits
        ODDR
        #(
            .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
            .INIT           (1'b0),
            .SRTYPE         ("SYNC")
        )
        Inst_CEODDR
        (
            .D1             (iPO_ChipEnable[0 + d]),
            .D2             (iPO_ChipEnable[0 + d]),
            .C              (iSystemClock),
            .CE             (1),
            .Q              (oCEToNAND[d]),
            .R              (1'b0),
            .S              (1'b0)
        );
    end
    endgenerate

    ODDR
    #(
        .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
        .INIT           (1'b1),
        .SRTYPE         ("SYNC")
    )
    Inst_REODDR
    (
        .D1             (iPO_ReadEnable[0]),
        .D2             (iPO_ReadEnable[1]),
        .C              (iSystemClock),
        .CE             (1),
        .Q              (oREToNAND),
        .R              (1'b0),
        .S              (1'b0)
    );

    ODDR
    #(
        .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
        .INIT           (1'b1),
        .SRTYPE         ("SYNC")
    )
    Inst_WEODDR
    (
        .D1             (iPO_WriteEnable[0]),
        .D2             (iPO_WriteEnable[1]),
        .C              (iSystemClock),
        .CE             (1),
        .Q              (oWEToNAND),
        .R              (1'b0),
        .S              (1'b0)
    );

    ODDR
    #(
        .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
        .INIT           (1'b0),
        .SRTYPE         ("SYNC")
    )
    Inst_ALEODDR
    (
        .D1             (iPO_AddressLatchEnable[0]),
        .D2             (iPO_AddressLatchEnable[1]),
        .C              (iSystemClock),
        .CE             (1),
        .Q              (oALEToNAND),
        .R              (1'b0),
        .S              (1'b0)
    );

    ODDR
    #(
        .DDR_CLK_EDGE   ("SAME_EDGE"), //"OPPOSITE_EDGE"  "SAME_EDGE
        .INIT           (1'b0),
        .SRTYPE         ("SYNC")
    )
    Inst_CLEODDR
    (
        .D1             (iPO_CommandLatchEnable[0]),
        .D2             (iPO_CommandLatchEnable[1]),
        .C              (iSystemClock),
        .CE             (1),
        .Q              (oCLEToNAND),
        .R              (1'b0),
        .S              (1'b0)
    );


endmodule
