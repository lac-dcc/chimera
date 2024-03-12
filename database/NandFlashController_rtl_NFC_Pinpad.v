`timescale 1ns / 1ps

module NFC_Pinpad
#
(
    parameter NumberOfWays    =   4
)
(
    iDQSOutEnable   ,
    iDQSToNAND      ,
    oDQSFromNAND    ,
    iDQOutEnable    ,
    iDQToNAND       ,
    oDQFromNAND     ,
    iCEToNAND       ,
    iWEToNAND       ,
    iREToNAND       ,
    iALEToNAND      ,
    iCLEToNAND      ,
    oRBFromNAND     ,
    iWPToNAND       ,
    
    IO_NAND_DQS     ,
    IO_NAND_DQ      ,
    O_NAND_CE       ,
    O_NAND_WE       ,
    O_NAND_RE       ,
    O_NAND_ALE      ,
    O_NAND_CLE      ,
    I_NAND_RB       ,
    O_NAND_WP 
);
    // Direction Select: 0-read from NAND, 1-write to NAND
    input                           iDQSOutEnable   ;
    input                           iDQSToNAND      ;
    output                          oDQSFromNAND    ;
    input   [7:0]                   iDQOutEnable    ;
    input   [7:0]                   iDQToNAND       ;
    output  [7:0]                   oDQFromNAND     ;
    input   [NumberOfWays - 1:0]    iCEToNAND       ;
    input                           iWEToNAND       ;
    input                           iREToNAND       ;
    input                           iALEToNAND      ;
    input                           iCLEToNAND      ;
    output  [NumberOfWays - 1:0]    oRBFromNAND     ;
    input                           iWPToNAND       ;
    inout                           IO_NAND_DQS     ; 
    inout   [7:0]                   IO_NAND_DQ      ;
    output  [NumberOfWays - 1:0]    O_NAND_CE       ;
    output                          O_NAND_WE       ;
    output                          O_NAND_RE       ; 
    output                          O_NAND_ALE      ;
    output                          O_NAND_CLE      ;
    input   [NumberOfWays - 1:0]    I_NAND_RB       ;
    output                          O_NAND_WP       ; 

    genvar  c, d, e;

    IOBUF
    Inst_DQSIOBUF
    (
        .I(iDQSToNAND       ),
        .T(iDQSOutEnable    ),
        
        .O(oDQSFromNAND     ),
        
        .IO (IO_NAND_DQS    )
    );
    
    // DQ Pad
    generate
    for (c = 0; c < 8; c = c + 1)
    begin: DQBits
        IOBUF
        Inst_DQIOBUF
        (
            .I(iDQToNAND[c]     ),
            .T(iDQOutEnable[c]  ),
            
            .O(oDQFromNAND[c]   ),
            
            .IO(IO_NAND_DQ[c]   )
        );
    end
    endgenerate
    
    // // CE Pad
    // assign O_NAND_CE = iCEToNAND;
    
    // // WE Pad
    // assign O_NAND_WE = iWEToNAND;
    
    // // RE Pad
    // assign O_NAND_RE = iREToNAND;
    
    // // ALE Pad
    // assign O_NAND_ALE = iALEToNAND;
    
    // // CLE Pad
    // assign O_NAND_CLE = iCLEToNAND;
    
    // // RB Pad
    // assign oRBFromNAND = I_NAND_RB;
    
    // // WP Pad
    // assign O_NAND_WP = iWPToNAND;

    // CE Pad
    generate
    for (d = 0; d < NumberOfWays; d = d + 1)
    begin: CEs
        OBUF
        Inst_CEOBUF
        (
            .I(iCEToNAND[d]),
            .O(O_NAND_CE[d])
        );    
    end
    endgenerate
    
    
    // WE Pad
    OBUF
    Inst_WEOBUF
    (
        .I(iWEToNAND  ),
        .O(O_NAND_WE  )
    ); 
    
    // RE Pad
    OBUF
    Inst_REOBUF
    (
        .I(iREToNAND  ),
        .O(O_NAND_RE  )
    );
    // ALE Pad
    OBUF
    Inst_ALEOBUF
    (
        .I(iALEToNAND  ),
        .O(O_NAND_ALE  )
    ); 
    
    // CLE Pad
    OBUF
    Inst_CLEOBUF
    (
        .I(iCLEToNAND  ),
        .O(O_NAND_CLE  )
    );
    
    // RB Pad
    generate
    for (e = 0; e < NumberOfWays; e = e + 1)
    begin: RBs
        IBUF
        Inst_RBIBUF
        (
            .I(I_NAND_RB[e]),
            .O(oRBFromNAND[e])
        );   
    end
    endgenerate
    
    // WP Pad
    OBUF
    Inst_WPOBUF
    (
        .I(iWPToNAND    ),
        .O(O_NAND_WP    )
    );

endmodule
