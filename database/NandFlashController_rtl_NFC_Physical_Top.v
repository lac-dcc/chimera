// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module NFC_Physical_Top
#
(
    parameter IDelayValue           =   7,
    parameter InputClockBufferType  =   0,
    parameter NumberOfWays          =   4
)
(
    // clock
    iSystemClock            ,
    iDelayRefClock          ,
    iSystemClock_120             ,
    // iSystemClock_4x,
    // reset from ACG
    iACG_PHY_PinIn_Reset               ,
    iACG_PHY_PinIn_BUFF_Reset          ,
    iACG_PHY_PinOut_Reset              ,

    // unused
    iPI_BUFF_RE             ,
    iPI_BUFF_OutSel         ,
    oPI_DQ                  ,
    oPI_ValidFlag           ,

    // DQs delay tap for aligment with DQ
    iACG_PHY_DelayTapLoad       ,
    iACG_PHY_DelayTap           ,
    oPHY_ACG_DelayReady         ,
    // 
    iACG_PHY_DQSOutEnable       ,
    iACG_PHY_DQOutEnable        ,
    
    iACG_PHY_DQStrobe           ,
    iACG_PHY_DQ                 ,
    iACG_PHY_ChipEnable         ,
    iACG_PHY_ReadEnable         ,
    iACG_PHY_WriteEnable        ,
    iACG_PHY_AddressLatchEnable ,
    iACG_PHY_CommandLatchEnable ,

    oPHY_ACG_ReadyBusy          ,
    iACG_PHY_WriteProtect       ,

    // enable nand to PHY input buffer
    iACG_PHY_BUFF_WE             ,
    oPHY_ACG_BUFF_Empty          ,

    // read data from PHY input
    iACG_PHY_Buff_Ready          ,
    oPHY_ACG_Buff_Valid          ,
    oPHY_ACG_Buff_Data           ,
    oPHY_ACG_Buff_Keep           ,
    oPHY_ACG_Buff_Last           ,

    // Pinpad
    IO_NAND_DQS             ,
    IO_NAND_DQ              ,
    O_NAND_CE               ,
    O_NAND_WE               ,
    O_NAND_RE               ,
    O_NAND_ALE              ,
    O_NAND_CLE              ,
    I_NAND_RB               ,
    O_NAND_WP
);
    // way means number of CE
    // These targets use one DQ together

    // clock
    input                           iSystemClock                ; // SDR 100MHz
    input                           iDelayRefClock              ; // SDR 200MHz
    // input                           iOutputDrivingClock         ; // SDR 200Mhz
    input                           iSystemClock_120             ;
    // input           iSystemClock_4x         ;
    // reset from ACG
    input                           iACG_PHY_PinIn_Reset        ;
    input                           iACG_PHY_PinIn_BUFF_Reset   ;
    input                           iACG_PHY_PinOut_Reset       ;

    // unused
    input                           iPI_BUFF_RE                 ;
    input   [2:0]                   iPI_BUFF_OutSel             ;
    output  [31:0]                  oPI_DQ                      ;
    output                          oPI_ValidFlag               ;

    // DQs delay tap for aligment with DQ
    input                           iACG_PHY_DelayTapLoad       ;
    input   [4:0]                   iACG_PHY_DelayTap           ;
    output                          oPHY_ACG_DelayReady         ;
    input                           iACG_PHY_DQSOutEnable       ;
    input                           iACG_PHY_DQOutEnable        ;
    input   [7:0]                   iACG_PHY_DQStrobe           ;
    input   [31:0]                  iACG_PHY_DQ                 ;
    input   [2*NumberOfWays - 1:0]  iACG_PHY_ChipEnable         ;
    input   [3:0]                   iACG_PHY_ReadEnable         ;
    input   [3:0]                   iACG_PHY_WriteEnable        ;
    input   [3:0]                   iACG_PHY_AddressLatchEnable ;
    input   [3:0]                   iACG_PHY_CommandLatchEnable ;

    output  [NumberOfWays - 1:0]    oPHY_ACG_ReadyBusy          ;
    input                           iACG_PHY_WriteProtect       ;

    // enable nand to PHY input buffer
    input                           iACG_PHY_BUFF_WE            ;
    output                          oPHY_ACG_BUFF_Empty         ;

    // read data from PHY input
    input                           iACG_PHY_Buff_Ready         ;
    output                          oPHY_ACG_Buff_Valid         ;
    output  [15:0]                  oPHY_ACG_Buff_Data          ;
    output  [ 1:0]                  oPHY_ACG_Buff_Keep          ;
    output                          oPHY_ACG_Buff_Last          ;

    inout                           IO_NAND_DQS                 ;
    inout   [7:0]                   IO_NAND_DQ                  ;
    output  [NumberOfWays - 1:0]    O_NAND_CE                   ;
    output                          O_NAND_WE                   ;
    output                          O_NAND_RE                   ;
    output                          O_NAND_ALE                  ;
    output                          O_NAND_CLE                  ;
    input   [NumberOfWays - 1:0]    I_NAND_RB                   ;
    output                          O_NAND_WP                   ;
    
    // Internal Wires/Regs
    
    wire                            wDQSOutEnableToPinpad   ;
    wire    [7:0]                   wDQOutEnableToPinpad    ;
    
    wire                            wDQSFromNAND        ;
    wire                            wDQSToNAND          ;
    
    wire    [7:0]                   wDQFromNAND         ;
    wire    [7:0]                   wDQToNAND           ;
    
    wire    [NumberOfWays - 1:0]    wCEToNAND           ;
    
    wire                            wWEToNAND           ;
    wire                            wREToNAND           ;
    wire                            wALEToNAND          ;
    wire                            wCLEToNAND          ;
    
    wire                            wWPToNAND           ;
    
    wire    [NumberOfWays - 1:0]    wReadyBusyFromNAND  ;
    reg     [NumberOfWays - 1:0]    rReadyBusyCDCBuf0   ;
    reg     [NumberOfWays - 1:0]    rReadyBusyCDCBuf1   ;


    NFC_Physical_Input
    #
    (
        .IDelayValue            (IDelayValue            ),
        .InputClockBufferType   (InputClockBufferType   )
    )
    Inst_NFC_Physical_Input
    (
        .iSystemClock       (iSystemClock               ),
        .iDelayRefClock     (iDelayRefClock             ),
        // .iSystemClock_120    (iSystemClock_120            ),
        // .iSystemClock_4x    (iSystemClock_4x),
        .iModuleReset       (iACG_PHY_PinIn_Reset                  ),
        .iBufferReset       (iACG_PHY_PinIn_BUFF_Reset             ),

        .iPO_DQStrobe           (iACG_PHY_DQStrobe           ),
        .iPO_DQ                 (iACG_PHY_DQ                 ),
        
        .iAddressLatchEnable(iACG_PHY_AddressLatchEnable),
        
        // PI Interface
        .iPI_Buff_RE        (iPI_BUFF_RE                ),
        .iPI_Buff_OutSel    (iPI_BUFF_OutSel            ),
        .oPI_DQ             (oPI_DQ                     ),
        .oPI_ValidFlag      (oPI_ValidFlag              ),

        .iPI_Buff_WE        (iACG_PHY_BUFF_WE                ),
        .oPI_Buff_Empty     (oPHY_ACG_BUFF_Empty             ),

        .iPI_Buff_Ready     (iACG_PHY_Buff_Ready             ),
        .oPI_Buff_Valid     (oPHY_ACG_Buff_Valid             ),
        .oPI_Buff_Data      (oPHY_ACG_Buff_Data              ),
        .oPI_Buff_Keep      (oPHY_ACG_Buff_Keep              ),
        .oPI_Buff_Last      (oPHY_ACG_Buff_Last              ),
			
        .iPI_DelayTapLoad   (iACG_PHY_DelayTapLoad            ),
        .iPI_DelayTap       (iACG_PHY_DelayTap                ),
        .oPI_DelayReady     (oPHY_ACG_DelayReady              ),
        
        // Pad Interface
        .iDQSFromNAND       (wDQSFromNAND               ),
        .iDQFromNAND        (wDQFromNAND                )
    );
    
    
    
    // Output
    
    NFC_Physical_Output
    #
    (
        .NumberOfWays   (NumberOfWays   )
    )
    Inst_NFC_Physical_Output
    (
        .iSystemClock           (iSystemClock           ),
        .iSystemClock_120        (iSystemClock_120        ),
        
        .iModuleReset           (iACG_PHY_PinOut_Reset              ),
        
        // PO Interface
        .iDQSOutEnable          (iACG_PHY_DQSOutEnable         ),
        .iDQOutEnable           (iACG_PHY_DQOutEnable          ),
        
        .iPO_DQStrobe           (iACG_PHY_DQStrobe           ),
        .iPO_DQ                 (iACG_PHY_DQ                 ),
        .iPO_ChipEnable         (iACG_PHY_ChipEnable         ),
        .iPO_ReadEnable         (iACG_PHY_ReadEnable         ),
        .iPO_WriteEnable        (iACG_PHY_WriteEnable        ),
        .iPO_AddressLatchEnable (iACG_PHY_AddressLatchEnable ),
        .iPO_CommandLatchEnable (iACG_PHY_CommandLatchEnable ),
        
        // Pad Interface
        .oDQSOutEnableToPinpad  (wDQSOutEnableToPinpad  ),
        .oDQOutEnableToPinpad   (wDQOutEnableToPinpad   ),
        
        .oDQSToNAND             (wDQSToNAND             ),
        .oDQToNAND              (wDQToNAND              ),
        .oCEToNAND              (wCEToNAND              ),
        .oWEToNAND              (wWEToNAND              ),
        .oREToNAND              (wREToNAND              ),
        .oALEToNAND             (wALEToNAND             ),
        .oCLEToNAND             (wCLEToNAND             )
    );
    
    assign wWPToNAND = ~iACG_PHY_WriteProtect; // convert WP to WP-
    
    always @ (posedge iSystemClock)
    begin
        if (iACG_PHY_PinIn_Reset)
        begin
            rReadyBusyCDCBuf0 <= {(NumberOfWays){1'b0}};
            rReadyBusyCDCBuf1 <= {(NumberOfWays){1'b0}};
        end
        else
        begin
            rReadyBusyCDCBuf0 <= rReadyBusyCDCBuf1;
            rReadyBusyCDCBuf1 <= wReadyBusyFromNAND;
        end
    end
    assign oPHY_ACG_ReadyBusy = rReadyBusyCDCBuf0;
    
    // Pinpad
    
    NFC_Pinpad
    #
    (
        .NumberOfWays   (NumberOfWays   )
    )
    Inst_NFC_Pinpad
    (
        // Pad Interface
        .iDQSOutEnable  (wDQSOutEnableToPinpad  ),
        .iDQSToNAND     (wDQSToNAND             ),
        .oDQSFromNAND   (wDQSFromNAND           ),
        
        .iDQOutEnable   (wDQOutEnableToPinpad   ),
        .iDQToNAND      (wDQToNAND              ),
        .oDQFromNAND    (wDQFromNAND            ),
        
        .iCEToNAND      (wCEToNAND              ),
        .iWEToNAND      (wWEToNAND              ),
        .iREToNAND      (wREToNAND              ),
        .iALEToNAND     (wALEToNAND             ),
        .iCLEToNAND     (wCLEToNAND             ),
        
        .oRBFromNAND    (wReadyBusyFromNAND     ), // bypass
        .iWPToNAND      (wWPToNAND              ), // bypass
        
        // NAND Interface
        .IO_NAND_DQS    (IO_NAND_DQS    ),
        .IO_NAND_DQ     (IO_NAND_DQ     ),
        
        .O_NAND_CE      (O_NAND_CE      ),
        
        .O_NAND_WE      (O_NAND_WE      ),
        .O_NAND_RE      (O_NAND_RE      ),
        .O_NAND_ALE     (O_NAND_ALE     ),
        .O_NAND_CLE     (O_NAND_CLE     ),
        
        .I_NAND_RB      (I_NAND_RB      ),
        .O_NAND_WP      (O_NAND_WP      )
    );

endmodule
