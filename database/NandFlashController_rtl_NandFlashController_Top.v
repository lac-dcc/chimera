// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module NandFlashController_Top
#
(
    parameter IDelayValue          = 20,
    parameter InputClockBufferType = 0,
    parameter NumberOfWays         = 2,
    parameter PageSize             = 8640
)
(
    iSystemClock                , // 1x clk
    iDelayRefClock              , // 200MHz
    // iOutputDrivingClock         , // 2x clk
    iSystemClock_120             ,
    // iSystemClock_4x,
    iReset                      ,

    iOpcode                     ,
    iTargetID                   ,
    iSourceID                   ,
    iAddress                    ,
    iLength                     ,
    iCMDValid                   ,
    oCMDReady                   ,

    iWriteData                  ,
    iWriteLast                  ,
    iWriteValid                 ,
    iWriteKeep                  ,
    oWriteReady                 ,
    oWriteTransValid             ,

    oStatus                     ,
    oStatusValid                ,

    oReadData                   ,
    oReadLast                   ,
    oReadValid                  ,
    oReadKeep                   ,
    iReadReady                  ,
    oReadTransValid             ,

    oReadyBusy                  ,

    iDelayTapValid              ,
    iDelayTap                   ,

    IO_NAND_DQS                 ,
    IO_NAND_DQ                  ,
    O_NAND_CE                   ,
    O_NAND_WE                   ,
    O_NAND_RE                   ,
    O_NAND_ALE                  ,
    O_NAND_CLE                  ,
    I_NAND_RB                   ,
    O_NAND_WP                   
);

    
    input                          iSystemClock            ;
    input                          iDelayRefClock          ;
    // input                          iOutputDrivingClock     ;
    input                          iSystemClock_120         ;
    // input           iSystemClock_4x         ;
    input                          iReset                  ;

    input   [5:0]                  iOpcode                 ;
    input   [4:0]                  iTargetID               ;
    input   [4:0]                  iSourceID               ;
    input   [31:0]                 iAddress                ;
    input   [15:0]                 iLength                 ;
    input                          iCMDValid               ;
    output                         oCMDReady               ;

    input   [15:0]                 iWriteData              ;
    input                          iWriteLast              ;
    input                          iWriteValid             ;
    input   [1:0]                  iWriteKeep              ;
    output                         oWriteReady             ;
    output                         oWriteTransValid        ;
    
    output  [23:0]                 oStatus                 ;
    output                         oStatusValid            ;

    output  [15:0]                 oReadData               ;
    output                         oReadLast               ;
    output                         oReadValid              ;
    output  [1:0]                  oReadKeep               ;
    input                          iReadReady              ;
    output                         oReadTransValid         ;
    
    output  [NumberOfWays - 1:0]   oReadyBusy              ;

    input                          iDelayTapValid          ;
    input  [4:0]                   iDelayTap               ;

    inout                          IO_NAND_DQS             ;
    inout                  [7:0]   IO_NAND_DQ              ;
    output  [NumberOfWays - 1:0]   O_NAND_CE               ;
    output                         O_NAND_WE               ;
    output                         O_NAND_RE               ;
    output                         O_NAND_ALE              ;
    output                         O_NAND_CLE              ;
    input   [NumberOfWays - 1:0]   I_NAND_RB               ;
    output                         O_NAND_WP               ;



    // CI with ACG
    wire  [7:0]                   wCI_ACG_Command             ;
    wire  [2:0]                   wCI_ACG_CommandOption       ;

    wire  [7:0]                   wACG_CI_Ready               ;
    wire  [7:0]                   wACG_CI_LastStep            ;

    wire  [NumberOfWays - 1:0]    wCI_ACG_TargetWay           ;
    wire  [15:0]                  wCI_ACG_NumOfData           ;

    wire                          wCI_ACG_CASelect            ;
    wire  [39:0]                  wCI_ACG_CAData              ;

    wire  [15:0]                  wCI_ACG_WriteData           ;
    wire                          wCI_ACG_WriteLast           ;
    wire                          wCI_ACG_WriteValid          ;
    wire                          wACG_CI_WriteReady          ;

    wire  [15:0]                  wACG_CI_ReadData            ;
    wire                          wACG_CI_ReadLast            ;
    wire                          wACG_CI_ReadValid           ;
    wire                          wCI_ACG_ReadReady           ;

    wire  [NumberOfWays - 1:0]    wACG_CI_ReadyBusy           ;

// ACG with PHY
    // reset from ACG
    wire                          wACG_PHY_PinIn_Reset        ;
    wire                          wACG_PHY_PinIn_BUFF_Reset   ;
    wire                          wACG_PHY_PinOut_Reset       ;

    // unused
    wire                          wPI_BUFF_RE                 ;
    wire  [2:0]                   wPI_BUFF_OutSel             ;
    wire  [31:0]                  wPI_DQ                      ;
    wire                          wPI_ValidFlag               ;

    // DQs delay tap for aligment with DQ
    wire                          wACG_PHY_DelayTapLoad       ;
    wire  [4:0]                   wACG_PHY_DelayTap           ;
    wire                          wPHY_ACG_DelayReady         ;
    wire                          wACG_PHY_DQSOutEnable       ;
    wire                          wACG_PHY_DQOutEnable        ;
    wire  [7:0]                   wACG_PHY_DQStrobe           ;
    wire  [31:0]                  wACG_PHY_DQ                 ;
    wire  [2*NumberOfWays - 1:0]  wACG_PHY_ChipEnable         ;
    wire  [3:0]                   wACG_PHY_ReadEnable         ;
    wire  [3:0]                   wACG_PHY_WriteEnable        ;
    wire  [3:0]                   wACG_PHY_AddressLatchEnable ;
    wire  [3:0]                   wACG_PHY_CommandLatchEnable ;

    wire  [NumberOfWays - 1:0]    wPHY_ACG_ReadyBusy          ;
    wire                          wACG_PHY_WriteProtect       ;

    // enable nand to PHY reg buffwr
    wire                          wACG_PHY_BUFF_WE            ;
    wire                          wPHY_ACG_BUFF_Empty         ;

    // read data from PHY reg
    wire                          wACG_PHY_Buff_Ready         ;
    wire                          wPHY_ACG_Buff_Valid         ;
    wire  [15:0]                  wPHY_ACG_Buff_Data          ;
    wire  [ 1:0]                  wPHY_ACG_Buff_Keep          ;
    wire                          wPHY_ACG_Buff_Last          ;



    NFC_Command_Issue_Top #(
            .NumberOfWays(NumberOfWays),
            .PageSize(PageSize)
        ) inst_NFC_Command_Issue_Top (
            .iSystemClock           (iSystemClock          ),
            .iReset                 (iReset                ),
            .iTop_CI_Opcode         (iOpcode               ),
            .iTop_CI_TargetID       (iTargetID             ),
            .iTop_CI_SourceID       (iSourceID             ),
            .iTop_CI_Address        (iAddress              ),
            .iTop_CI_Length         (iLength               ),
            .iTop_CI_CMDValid       (iCMDValid             ),
            .oCI_Top_CMDReady       (oCMDReady             ),
            
            .iTop_CI_WriteData      (iWriteData            ),
            .iTop_CI_WriteLast      (iWriteLast            ),
            .iTop_CI_WriteValid     (iWriteValid           ),
            .iTop_CI_WriteKeep      (iWriteKeep            ),
            .oCI_Top_WriteReady     (oWriteReady           ),

            .oCI_Top_WriteTransValid(oWriteTransValid      ),

            .oCI_Top_ReadData       (oReadData             ),
            .oCI_Top_ReadLast       (oReadLast             ),
            .oCI_Top_ReadValid      (oReadValid            ),
            .oCI_Top_ReadKeep       (oReadKeep             ),
            .iTop_CI_ReadReady      (iReadReady            ),
            
            .oCI_Top_ReadTransValid (oReadTransValid       ),
            
            .oCI_Top_ReadyBusy      (oReadyBusy            ),
            
            .oCI_Top_Status         (oStatus               ),
            .oCI_Top_StatusValid    (oStatusValid          ),
            
            .oCI_ACG_Command        (wCI_ACG_Command       ),
            .oCI_ACG_CommandOption  (wCI_ACG_CommandOption ),
            .iACG_CI_Ready          (wACG_CI_Ready         ),
            .iACG_CI_LastStep       (wACG_CI_LastStep      ),
            .oCI_ACG_TargetWay      (wCI_ACG_TargetWay     ),
            .oCI_ACG_NumOfData      (wCI_ACG_NumOfData     ),
            .oCI_ACG_CASelect       (wCI_ACG_CASelect      ),
            .oCI_ACG_CAData         (wCI_ACG_CAData        ),
            .oCI_ACG_WriteData      (wCI_ACG_WriteData     ),
            .oCI_ACG_WriteLast      (wCI_ACG_WriteLast     ),
            .oCI_ACG_WriteValid     (wCI_ACG_WriteValid    ),
            .iACG_CI_WriteReady     (wACG_CI_WriteReady    ),
            .iACG_CI_ReadData       (wACG_CI_ReadData      ),
            .iACG_CI_ReadLast       (wACG_CI_ReadLast      ),
            .iACG_CI_ReadValid      (wACG_CI_ReadValid     ),
            .oCI_ACG_ReadReady      (wCI_ACG_ReadReady     ),
            .iACG_CI_ReadyBusy      (wACG_CI_ReadyBusy     )
        );

    NFC_Atom_Command_Generator_Top #(
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Atom_Command_Generator_Top (
            .iSystemClock                (iSystemClock                ),
            .iReset                      (iReset                      ),
            
            .iCI_ACG_Command             (wCI_ACG_Command             ),
            .iCI_ACG_CommandOption       (wCI_ACG_CommandOption       ),
            .oACG_CI_Ready               (wACG_CI_Ready               ),
            .oACG_CI_LastStep            (wACG_CI_LastStep            ),
            .iCI_ACG_TargetWay           (wCI_ACG_TargetWay           ),
            .iCI_ACG_NumOfData           (wCI_ACG_NumOfData           ),
            .iCI_ACG_CASelect            (wCI_ACG_CASelect            ),
            .iCI_ACG_CAData              (wCI_ACG_CAData              ),
            .iCI_ACG_WriteData           (wCI_ACG_WriteData           ),
            .iCI_ACG_WriteLast           (wCI_ACG_WriteLast           ),
            .iCI_ACG_WriteValid          (wCI_ACG_WriteValid          ),
            .oACG_CI_WriteReady          (wACG_CI_WriteReady          ),
            .oACG_CI_ReadData            (wACG_CI_ReadData            ),
            .oACG_CI_ReadLast            (wACG_CI_ReadLast            ),
            .oACG_CI_ReadValid           (wACG_CI_ReadValid           ),
            .iCI_ACG_ReadReady           (wCI_ACG_ReadReady           ),
            .oACG_CI_ReadyBusy           (wACG_CI_ReadyBusy           ),
            
            .oACG_PHY_PinIn_Reset        (wACG_PHY_PinIn_Reset        ),
            .oACG_PHY_PinIn_BUFF_Reset   (wACG_PHY_PinIn_BUFF_Reset   ),
            .oACG_PHY_PinOut_Reset       (wACG_PHY_PinOut_Reset       ),
            .iPI_BUFF_RE                 (wPI_BUFF_RE                 ),
            .iPI_BUFF_OutSel             (wPI_BUFF_OutSel             ),
            .oPI_DQ                      (wPI_DQ                      ),
            .oPI_ValidFlag               (wPI_ValidFlag               ),
            .oACG_PHY_DelayTapLoad       (wACG_PHY_DelayTapLoad       ),
            .oACG_PHY_DelayTap           (wACG_PHY_DelayTap           ),
            .iPHY_ACG_DelayReady         (wPHY_ACG_DelayReady         ),
            .oACG_PHY_DQSOutEnable       (wACG_PHY_DQSOutEnable       ),
            .oACG_PHY_DQOutEnable        (wACG_PHY_DQOutEnable        ),
            .oACG_PHY_DQStrobe           (wACG_PHY_DQStrobe           ),
            .oACG_PHY_DQ                 (wACG_PHY_DQ                 ),
            .oACG_PHY_ChipEnable         (wACG_PHY_ChipEnable         ),
            .oACG_PHY_ReadEnable         (wACG_PHY_ReadEnable         ),
            .oACG_PHY_WriteEnable        (wACG_PHY_WriteEnable        ),
            .oACG_PHY_AddressLatchEnable (wACG_PHY_AddressLatchEnable ),
            .oACG_PHY_CommandLatchEnable (wACG_PHY_CommandLatchEnable ),
            .iPHY_ACG_ReadyBusy          (wPHY_ACG_ReadyBusy          ),
            .oACG_PHY_WriteProtect       (wACG_PHY_WriteProtect       ),
            .oACG_PHY_BUFF_WE            (wACG_PHY_BUFF_WE            ),
            .iPHY_ACG_BUFF_Empty         (wPHY_ACG_BUFF_Empty         ),
            .oACG_PHY_Buff_Ready         (wACG_PHY_Buff_Ready         ),
            .iPHY_ACG_Buff_Valid         (wPHY_ACG_Buff_Valid         ),
            .iPHY_ACG_Buff_Data          (wPHY_ACG_Buff_Data          ),
            .iPHY_ACG_Buff_Keep          (wPHY_ACG_Buff_Keep          ),
            .iPHY_ACG_Buff_Last          (wPHY_ACG_Buff_Last          )
        );

    NFC_Physical_Top #(
            .IDelayValue(IDelayValue),
            .InputClockBufferType(InputClockBufferType),
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Physical_Top (
            .iSystemClock                (iSystemClock                ),
            .iDelayRefClock              (iDelayRefClock              ),
            // .iOutputDrivingClock         (iOutputDrivingClock         ),
            .iSystemClock_120             (iSystemClock_120             ),
            // .iSystemClock_4x              (iSystemClock_4x),
            .iACG_PHY_PinIn_Reset        (wACG_PHY_PinIn_Reset        ),
            .iACG_PHY_PinIn_BUFF_Reset   (wACG_PHY_PinIn_BUFF_Reset   ),
            .iACG_PHY_PinOut_Reset       (wACG_PHY_PinOut_Reset       ),
            .iPI_BUFF_RE                 (wPI_BUFF_RE                 ),
            .iPI_BUFF_OutSel             (wPI_BUFF_OutSel             ),
            .oPI_DQ                      (wPI_DQ                      ),
            .oPI_ValidFlag               (wPI_ValidFlag               ),
            .iACG_PHY_DelayTapLoad       (iDelayTapValid              ),
            .iACG_PHY_DelayTap           (iDelayTap                   ),
            .oPHY_ACG_DelayReady         (wPHY_ACG_DelayReady         ),
            .iACG_PHY_DQSOutEnable       (wACG_PHY_DQSOutEnable       ),
            .iACG_PHY_DQOutEnable        (wACG_PHY_DQOutEnable        ),
            .iACG_PHY_DQStrobe           (wACG_PHY_DQStrobe           ),
            .iACG_PHY_DQ                 (wACG_PHY_DQ                 ),
            .iACG_PHY_ChipEnable         (wACG_PHY_ChipEnable         ),
            .iACG_PHY_ReadEnable         (wACG_PHY_ReadEnable         ),
            .iACG_PHY_WriteEnable        (wACG_PHY_WriteEnable        ),
            .iACG_PHY_AddressLatchEnable (wACG_PHY_AddressLatchEnable ),
            .iACG_PHY_CommandLatchEnable (wACG_PHY_CommandLatchEnable ),
            .oPHY_ACG_ReadyBusy          (wPHY_ACG_ReadyBusy          ),
            .iACG_PHY_WriteProtect       (wACG_PHY_WriteProtect       ),
            .iACG_PHY_BUFF_WE            (wACG_PHY_BUFF_WE            ),
            .oPHY_ACG_BUFF_Empty         (wPHY_ACG_BUFF_Empty         ),
            .iACG_PHY_Buff_Ready         (wACG_PHY_Buff_Ready         ),
            .oPHY_ACG_Buff_Valid         (wPHY_ACG_Buff_Valid         ),
            .oPHY_ACG_Buff_Data          (wPHY_ACG_Buff_Data          ),
            .oPHY_ACG_Buff_Keep          (wPHY_ACG_Buff_Keep          ),
            .oPHY_ACG_Buff_Last          (wPHY_ACG_Buff_Last          ),
            .IO_NAND_DQS                 (IO_NAND_DQS                 ),
            .IO_NAND_DQ                  (IO_NAND_DQ                  ),
            .O_NAND_CE                   (O_NAND_CE                   ),
            .O_NAND_WE                   (O_NAND_WE                   ),
            .O_NAND_RE                   (O_NAND_RE                   ),
            .O_NAND_ALE                  (O_NAND_ALE                  ),
            .O_NAND_CLE                  (O_NAND_CLE                  ),
            .I_NAND_RB                   (I_NAND_RB                   ),
            .O_NAND_WP                   (O_NAND_WP                   )
        );


endmodule
