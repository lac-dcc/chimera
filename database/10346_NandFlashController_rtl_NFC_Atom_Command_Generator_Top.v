// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module NFC_Atom_Command_Generator_Top
#
(
	// iCI_ACG_Command[6]: C/A Latch async
    // iCI_ACG_Command[5]: Data Out  async
    // iCI_ACG_Command[4]: Data In   async

    // iCI_ACG_Command[3]: C/A Latch sync
    // iCI_ACG_Command[2]: Data Out  sync
    // iCI_ACG_Command[1]: Data In   sync
    // iCI_ACG_Command[0]: Timer
    
    // iCI_ACG_CommandOption[2:0]  : Option
    // iCI_ACG_CommandOption[0:0]  : Data In Option
    // iCI_ACG_CommandOption[0:0]  : Data Out Option
    
    parameter NumberOfWays    =   4
)
(
	// clock
    iSystemClock            ,
    iReset                  ,

    iCI_ACG_Command               ,
    iCI_ACG_CommandOption         ,
    oACG_CI_Ready                 ,
    oACG_CI_LastStep              ,

    iCI_ACG_TargetWay              ,
    iCI_ACG_NumOfData              ,

    iCI_ACG_CASelect               ,
    iCI_ACG_CAData                 ,

    iCI_ACG_WriteData              ,
    iCI_ACG_WriteLast              ,
    iCI_ACG_WriteValid             ,
    oACG_CI_WriteReady             ,

    oACG_CI_ReadData               ,
    oACG_CI_ReadLast               ,
    oACG_CI_ReadValid              ,
    iCI_ACG_ReadReady              ,

    oACG_CI_ReadyBusy              ,

    // reset from ACG
    oACG_PHY_PinIn_Reset               ,
    oACG_PHY_PinIn_BUFF_Reset          ,
    oACG_PHY_PinOut_Reset              ,

    // unused
    iPI_BUFF_RE             ,
    iPI_BUFF_OutSel         ,
    oPI_DQ                  ,
    oPI_ValidFlag           ,

    // DQs delay tap for aligment with DQ
    oACG_PHY_DelayTapLoad       ,
    oACG_PHY_DelayTap           ,
    iPHY_ACG_DelayReady         ,
    // 
    oACG_PHY_DQSOutEnable       ,
    oACG_PHY_DQOutEnable        ,
    
    oACG_PHY_DQStrobe           ,
    oACG_PHY_DQ                 ,
    oACG_PHY_ChipEnable         ,
    oACG_PHY_ReadEnable         ,
    oACG_PHY_WriteEnable        ,
    oACG_PHY_AddressLatchEnable ,
    oACG_PHY_CommandLatchEnable ,

    iPHY_ACG_ReadyBusy          ,
    oACG_PHY_WriteProtect       ,

    // enable nand to PHY input buffer
    oACG_PHY_BUFF_WE             ,
    iPHY_ACG_BUFF_Empty          ,

    // read data from PHY input
    oACG_PHY_Buff_Ready          ,
    iPHY_ACG_Buff_Valid          ,
    iPHY_ACG_Buff_Data           ,
    iPHY_ACG_Buff_Keep           ,
    iPHY_ACG_Buff_Last           
);
    input                           iSystemClock                ;
    input                           iReset                      ;

    // command issue
    input   [7:0]                   iCI_ACG_Command             ;
    input   [2:0]                   iCI_ACG_CommandOption       ;
    output  [7:0]                   oACG_CI_Ready               ;
    output  [7:0]                   oACG_CI_LastStep            ;

    input   [NumberOfWays - 1:0]    iCI_ACG_TargetWay           ;
    input   [15:0]                  iCI_ACG_NumOfData           ;

    input                           iCI_ACG_CASelect            ;
    input   [39:0]                  iCI_ACG_CAData              ;

    input   [15:0]                  iCI_ACG_WriteData           ;
    input                           iCI_ACG_WriteLast           ;
    input                           iCI_ACG_WriteValid          ;
    output                          oACG_CI_WriteReady          ;

    output  [15:0]                  oACG_CI_ReadData            ;
    output                          oACG_CI_ReadLast            ;
    output                          oACG_CI_ReadValid           ;
    input                           iCI_ACG_ReadReady           ;

    output  [NumberOfWays - 1:0]    oACG_CI_ReadyBusy           ;

    // reset from ACG
    output                          oACG_PHY_PinIn_Reset        ;
    output                          oACG_PHY_PinIn_BUFF_Reset   ;
    output                          oACG_PHY_PinOut_Reset       ;

    // unused
    input                           iPI_BUFF_RE                 ;
    input   [2:0]                   iPI_BUFF_OutSel             ;
    output  [31:0]                  oPI_DQ                      ;
    output                          oPI_ValidFlag               ;

    // DQs delay tap for aligment with DQ
    output                          oACG_PHY_DelayTapLoad       ;
    output  [4:0]                   oACG_PHY_DelayTap           ;
    input                           iPHY_ACG_DelayReady         ;
    // 
    output                          oACG_PHY_DQSOutEnable       ;
    output                          oACG_PHY_DQOutEnable        ;
    output   [7:0]                  oACG_PHY_DQStrobe           ;
    output   [31:0]                 oACG_PHY_DQ                 ;
    output   [2*NumberOfWays - 1:0] oACG_PHY_ChipEnable         ;
    output   [3:0]                  oACG_PHY_ReadEnable         ;
    output   [3:0]                  oACG_PHY_WriteEnable        ;
    output   [3:0]                  oACG_PHY_AddressLatchEnable ;
    output   [3:0]                  oACG_PHY_CommandLatchEnable ;

    input   [NumberOfWays - 1:0]    iPHY_ACG_ReadyBusy          ;
    output                          oACG_PHY_WriteProtect       ;

    // enable nand to PHY input buffer
    output                          oACG_PHY_BUFF_WE            ;
    input                           iPHY_ACG_BUFF_Empty         ;

    // read data from PHY input
    output                          oACG_PHY_Buff_Ready         ;
    input                           iPHY_ACG_Buff_Valid         ;
    input   [15:0]                  iPHY_ACG_Buff_Data          ;
    input   [ 1:0]                  iPHY_ACG_Buff_Keep          ;
    input                           iPHY_ACG_Buff_Last          ;

    // wire                          wDLE_Ready                  ;
    // wire                          wDLE_LastStep               ;
    // wire                          wDLE_Start                  ;
    // wire [NumberOfWays - 1:0]     wDLE_TargetWay              ;
    // wire [3:0]                    wDLE_NumOfData              ;
    // wire                          wDLE_CASelect               ;
    // wire [39:0]                   wDLE_CAData                 ;

    wire                          wDLE_DQSOutEnable           ;
    wire                          wDLE_DQOutEnable            ;
    wire  [7:0]                   wDLE_DQStrobe               ;
    wire  [31:0]                  wDLE_DQ                     ;
    wire  [2*NumberOfWays - 1:0]  wDLE_ChipEnable             ;
    wire  [3:0]                   wDLE_ReadEnable             ;
    wire  [3:0]                   wDLE_WriteEnable            ;
    wire  [3:0]                   wDLE_AddressLatchEnable     ;
    wire  [3:0]                   wDLE_CommandLatchEnable     ;

    wire                          wACA_Ready                  ;
    wire                          wACA_LastStep               ;
    wire                          wACA_Start                  ;
    wire [NumberOfWays - 1:0]     wACA_TargetWay              ;
    wire [3:0]                    wACA_NumOfData              ;
    wire                          wACA_CASelect               ;
    wire [39:0]                   wACA_CAData                 ;           
    wire                          wACA_DQSOutEnable           ;
    wire                          wACA_DQOutEnable            ;
    wire  [7:0]                   wACA_DQStrobe               ;
    wire  [31:0]                  wACA_DQ                     ;
    wire  [2*NumberOfWays - 1:0]  wACA_ChipEnable             ;
    wire  [3:0]                   wACA_ReadEnable             ;
    wire  [3:0]                   wACA_WriteEnable            ;
    wire  [3:0]                   wACA_AddressLatchEnable     ;
    wire  [3:0]                   wACA_CommandLatchEnable     ;

    wire                          wACS_Ready                  ;
    wire                          wACS_LastStep               ;
    wire                          wACS_Start                  ;
    wire [NumberOfWays - 1:0]     wACS_TargetWay              ;
    wire [3:0]                    wACS_NumOfData              ;
    wire                          wACS_CASelect               ;
    wire [39:0]                   wACS_CAData                 ;           
    wire                          wACS_DQSOutEnable           ;
    wire                          wACS_DQOutEnable            ;
    wire  [7:0]                   wACS_DQStrobe               ;
    wire  [31:0]                  wACS_DQ                     ;
    wire  [2*NumberOfWays - 1:0]  wACS_ChipEnable             ;
    wire  [3:0]                   wACS_ReadEnable             ;
    wire  [3:0]                   wACS_WriteEnable            ;
    wire  [3:0]                   wACS_AddressLatchEnable     ;
    wire  [3:0]                   wACS_CommandLatchEnable     ;

    wire                          wDOA_Ready                  ;
    wire                          wDOA_LastStep               ;
    wire                          wDOA_Start                  ;
    wire [NumberOfWays - 1:0]     wDOA_TargetWay              ;
    wire [15:0]                   wDOA_NumOfData              ;
    
    wire  [15:0]                  wDOA_WriteData              ;
    wire                          wDOA_WriteLast              ;
    wire                          wDOA_WriteValid             ;
    wire                          wDOA_WriteReady             ;

    wire                          wDOA_DQSOutEnable           ;
    wire                          wDOA_DQOutEnable            ;
    wire  [7:0]                   wDOA_DQStrobe               ;
    wire  [31:0]                  wDOA_DQ                     ;
    wire  [2*NumberOfWays - 1:0]  wDOA_ChipEnable             ;
    wire  [3:0]                   wDOA_ReadEnable             ;
    wire  [3:0]                   wDOA_WriteEnable            ;
    wire  [3:0]                   wDOA_AddressLatchEnable     ;
    wire  [3:0]                   wDOA_CommandLatchEnable     ;

    wire  [15:0]                  wDOS_WriteData              ;
    wire                          wDOS_WriteLast              ;
    wire                          wDOS_WriteValid             ;
    wire                          wDOS_WriteReady             ;

    wire                          wDOS_Ready                  ;
    wire                          wDOS_LastStep               ;
    wire                          wDOS_Start                  ;
    wire [NumberOfWays - 1:0]     wDOS_TargetWay              ;
    wire [15:0]                   wDOS_NumOfData              ;
    // wire                          wDOS_CASelect               ;
    // wire [39:0]                   wDOS_CAData                 ;           
    wire                          wDOS_DQSOutEnable           ;
    wire                          wDOS_DQOutEnable            ;
    wire  [7:0]                   wDOS_DQStrobe               ;
    wire  [31:0]                  wDOS_DQ                     ;
    wire  [2*NumberOfWays - 1:0]  wDOS_ChipEnable             ;
    wire  [3:0]                   wDOS_ReadEnable             ;
    wire  [3:0]                   wDOS_WriteEnable            ;
    wire  [3:0]                   wDOS_AddressLatchEnable     ;
    wire  [3:0]                   wDOS_CommandLatchEnable     ;

    // wire                          wDIA_Ready                  ;
    // wire                          wDIA_LastStep               ;
    // wire                          wDIA_Start                  ;
    // wire [NumberOfWays - 1:0]     wDIA_TargetWay              ;
    // wire [15:0]                   wDIA_NumOfData              ;
    // // wire                          wDIA_CASelect               ;
    // // wire [39:0]                   wDIA_CAData                 ;           
    // wire                          wDIA_DQSOutEnable           ;
    // wire                          wDIA_DQOutEnable            ;
    // wire  [7:0]                   wDIA_DQStrobe               ;
    // wire  [31:0]                  wDIA_DQ                     ;
    // wire  [2*NumberOfWays - 1:0]  wDIA_ChipEnable             ;
    // wire  [3:0]                   wDIA_ReadEnable             ;
    // wire  [3:0]                   wDIA_WriteEnable            ;
    // wire  [3:0]                   wDIA_AddressLatchEnable     ;
    // wire  [3:0]                   wDIA_CommandLatchEnable     ;

    wire                          wDIS_Ready                  ;
    wire                          wDIS_LastStep               ;
    wire                          wDIS_Start                  ;
    wire [NumberOfWays - 1:0]     wDIS_TargetWay              ;
    wire [15:0]                   wDIS_NumOfData              ;
    // wire                          wDIS_CASelect               ;
    // wire [39:0]                   wDIS_CAData                 ;           
    wire                          wDIS_DQSOutEnable           ;
    wire                          wDIS_DQOutEnable            ;
    wire  [7:0]                   wDIS_DQStrobe               ;
    wire  [31:0]                  wDIS_DQ                     ;
    wire  [2*NumberOfWays - 1:0]  wDIS_ChipEnable             ;
    wire  [3:0]                   wDIS_ReadEnable             ;
    wire  [3:0]                   wDIS_WriteEnable            ;
    wire  [3:0]                   wDIS_AddressLatchEnable     ;
    wire  [3:0]                   wDIS_CommandLatchEnable     ;

    wire                          wDIS_BUFF_WE         ;

    wire  [15:0]                  wDIS_ReadData            ;
    wire                          wDIS_ReadLast            ;
    wire                          wDIS_ReadValid           ;
    wire                          wDIS_ReadReady           ;

    wire                          wDIS_Buff_Ready         ;
    wire                          wDIS_Buff_Valid         ;
    wire  [15:0]                  wDIS_Buff_Data          ;
    wire  [ 1:0]                  wDIS_Buff_Keep          ;
    wire                          wDIS_Buff_Last          ;

    wire                          wMUX_DQSOutEnable       ;
    wire                          wMUX_DQOutEnable        ;
    wire  [7:0]                   wMUX_DQStrobe           ;
    wire  [31:0]                  wMUX_DQ                 ;
    wire  [2*NumberOfWays - 1:0]  wMUX_ChipEnable         ;
    wire  [3:0]                   wMUX_ReadEnable         ;
    wire  [3:0]                   wMUX_WriteEnable        ;
    wire  [3:0]                   wMUX_AddressLatchEnable ;
    wire  [3:0]                   wMUX_CommandLatchEnable ;
   

    wire                          wMUX_BUFF_WE    ;

    assign wACA_Start      = iCI_ACG_Command[6];
    assign wACA_TargetWay  = iCI_ACG_TargetWay;
    assign wACA_NumOfData  = iCI_ACG_NumOfData[3:0];
    assign wACA_CASelect   = iCI_ACG_CASelect;
    assign wACA_CAData     = iCI_ACG_CAData;

    assign wACS_Start      = iCI_ACG_Command[3];
    assign wACS_TargetWay  = iCI_ACG_TargetWay;
    assign wACS_NumOfData  = iCI_ACG_NumOfData[3:0];
    assign wACS_CASelect   = iCI_ACG_CASelect;
    assign wACS_CAData     = iCI_ACG_CAData;

    assign wDOA_Start      = iCI_ACG_Command[5];
    assign wDOA_TargetWay  = iCI_ACG_TargetWay;
    assign wDOA_NumOfData  = iCI_ACG_NumOfData[15:0];
    // assign wDOA_CASelect   = iCI_ACG_CASelect;
    // assign wDOA_CAData     = iCI_ACG_CAData;

    assign wDOS_Start      = iCI_ACG_Command[2];
    assign wDOS_TargetWay  = iCI_ACG_TargetWay;
    assign wDOS_NumOfData  = iCI_ACG_NumOfData[15:0];

    assign wDIS_Start      = iCI_ACG_Command[1];
    assign wDIS_TargetWay  = iCI_ACG_TargetWay;
    assign wDIS_NumOfData  = iCI_ACG_NumOfData[15:0];

    assign oACG_CI_Ready[7] = 1'b0; // reserved
    assign oACG_CI_Ready[6] = wACA_Ready;
    assign oACG_CI_Ready[5] = wDOA_Ready;
    assign oACG_CI_Ready[4] = 1'b1;//wDIA_Ready;
    assign oACG_CI_Ready[3] = wACS_Ready;
    assign oACG_CI_Ready[2] = wDOS_Ready;
    assign oACG_CI_Ready[1] = wDIS_Ready;
    assign oACG_CI_Ready[0] = 1'b1;

    assign oACG_CI_LastStep[7] = 1'b0; // reserved
    assign oACG_CI_LastStep[6] = wACA_LastStep;
    assign oACG_CI_LastStep[5] = wDOA_LastStep;
    assign oACG_CI_LastStep[4] = 1'b0;//wDIA_LastStep;
    assign oACG_CI_LastStep[3] = wACS_LastStep;
    assign oACG_CI_LastStep[2] = wDOS_LastStep;
    assign oACG_CI_LastStep[1] = wDIS_LastStep;
    assign oACG_CI_LastStep[0] = 1'b0;

    assign oACG_CI_ReadyBusy[NumberOfWays - 1:0] = iPHY_ACG_ReadyBusy[NumberOfWays - 1:0];
    assign oACG_PHY_PinIn_Reset                  = iReset;
    assign oACG_PHY_PinIn_BUFF_Reset             = iReset;
    assign oACG_PHY_PinOut_Reset                 = iReset;

    assign wDOA_WriteData                        = iCI_ACG_WriteData            ;
    assign wDOA_WriteLast                        = iCI_ACG_WriteLast            ;
    assign wDOA_WriteValid                       = iCI_ACG_WriteValid           ;

    assign wDOS_WriteData                        = iCI_ACG_WriteData            ;
    assign wDOS_WriteLast                        = iCI_ACG_WriteLast            ;
    assign wDOS_WriteValid                       = iCI_ACG_WriteValid           ;

    assign oACG_CI_ReadData                      = wDIS_ReadData         ;
    assign oACG_CI_ReadLast                      = wDIS_ReadLast         ;
    assign oACG_CI_ReadValid                     = wDIS_ReadValid        ;
    assign wDIS_ReadReady                        = iCI_ACG_ReadReady     ;

    assign wDIS_Buff_Valid                       = iPHY_ACG_Buff_Valid ;  
    assign wDIS_Buff_Data                        = iPHY_ACG_Buff_Data  ;  
    assign wDIS_Buff_Keep                        = iPHY_ACG_Buff_Keep  ;  
    assign wDIS_Buff_Last                        = iPHY_ACG_Buff_Last  ;  

    NFC_Atom_Command_Idle #(
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Atom_Command_Idle (
            .iTargetWay          (iCI_ACG_TargetWay),

            .oDQSOutEnable       (wDLE_DQSOutEnable),
            .oDQOutEnable        (wDLE_DQOutEnable),
            .oDQStrobe           (wDLE_DQStrobe),
            .oDQ                 (wDLE_DQ),
            .oChipEnable         (wDLE_ChipEnable),
            .oReadEnable         (wDLE_ReadEnable),
            .oWriteEnable        (wDLE_WriteEnable),
            .oAddressLatchEnable (wDLE_AddressLatchEnable),
            .oCommandLatchEnable (wDLE_CommandLatchEnable)
        );

    NFC_Atom_Command_Async #(
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Atom_Command_Async (
            .iSystemClock        (iSystemClock),
            .iReset              (iReset),

            .oReady              (wACA_Ready),
            .oLastStep           (wACA_LastStep),
            .iStart              (wACA_Start),
            .iTargetWay          (wACA_TargetWay),
            .iNumOfData          (wACA_NumOfData),
            .iCASelect           (wACA_CASelect),
            .iCAData             (wACA_CAData),

            .oDQSOutEnable       (wACA_DQSOutEnable),
            .oDQOutEnable        (wACA_DQOutEnable),
            .oDQStrobe           (wACA_DQStrobe),
            .oDQ                 (wACA_DQ),
            .oChipEnable         (wACA_ChipEnable),
            .oReadEnable         (wACA_ReadEnable),
            .oWriteEnable        (wACA_WriteEnable),
            .oAddressLatchEnable (wACA_AddressLatchEnable),
            .oCommandLatchEnable (wACA_CommandLatchEnable)
        );

	NFC_Atom_Command_Sync #(
			.NumberOfWays(NumberOfWays)
		) inst_NFC_Atom_Command_Sync (
			.iSystemClock        (iSystemClock),
			.iReset              (iReset),

			.oReady              (wACS_Ready),
			.oLastStep           (wACS_LastStep),
			.iStart              (wACS_Start),
			.iTargetWay          (wACS_TargetWay),
			.iNumOfData          (wACS_NumOfData),
			.iCASelect           (wACS_CASelect),
			.iCAData             (wACS_CAData),

			.oDQSOutEnable       (wACS_DQSOutEnable),
			.oDQOutEnable        (wACS_DQOutEnable),
			.oDQStrobe           (wACS_DQStrobe),
			.oDQ                 (wACS_DQ),
			.oChipEnable         (wACS_ChipEnable),
			.oReadEnable         (wACS_ReadEnable),
			.oWriteEnable        (wACS_WriteEnable),
			.oAddressLatchEnable (wACS_AddressLatchEnable),
			.oCommandLatchEnable (wACS_CommandLatchEnable)
		);

    NFC_Atom_Dataoutput_Async #(
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Atom_Dataoutput_Async (
            .iSystemClock        (iSystemClock),
            .iReset              (iReset),

            .oReady              (wDOA_Ready),
            .oLastStep           (wDOA_LastStep),
            .iStart              (wDOA_Start),
            .iTargetWay          (wDOA_TargetWay),
            .iNumOfData          (wDOA_NumOfData),

            .iWriteData          (wDOA_WriteData),
            .iWriteLast          (wDOA_WriteLast),
            .iWriteValid         (wDOA_WriteValid),
            .oWriteReady         (wDOA_WriteReady),

            .oDQSOutEnable       (wDOA_DQSOutEnable),
            .oDQOutEnable        (wDOA_DQOutEnable),
            .oDQStrobe           (wDOA_DQStrobe),
            .oDQ                 (wDOA_DQ),
            .oChipEnable         (wDOA_ChipEnable),
            .oReadEnable         (wDOA_ReadEnable),
            .oWriteEnable        (wDOA_WriteEnable),
            .oAddressLatchEnable (wDOA_AddressLatchEnable),
            .oCommandLatchEnable (wDOA_CommandLatchEnable)
        );

    NFC_Atom_Dataoutput_Sync #(
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Atom_Dataoutput_Sync (
            .iSystemClock        (iSystemClock),
            .iReset              (iReset),

            .oReady              (wDOS_Ready),
            .oLastStep           (wDOS_LastStep),
            .iStart              (wDOS_Start),
            .iTargetWay          (wDOS_TargetWay),
            .iNumOfData          (wDOS_NumOfData),

            .iWriteData          (wDOS_WriteData),
            .iWriteLast          (wDOS_WriteLast),
            .iWriteValid         (wDOS_WriteValid),
            .oWriteReady         (wDOS_WriteReady),

            .oDQSOutEnable       (wDOS_DQSOutEnable),
            .oDQOutEnable        (wDOS_DQOutEnable),
            .oDQStrobe           (wDOS_DQStrobe),
            .oDQ                 (wDOS_DQ),
            .oChipEnable         (wDOS_ChipEnable),
            .oReadEnable         (wDOS_ReadEnable),
            .oWriteEnable        (wDOS_WriteEnable),
            .oAddressLatchEnable (wDOS_AddressLatchEnable),
            .oCommandLatchEnable (wDOS_CommandLatchEnable)
        );

    NFC_Atom_Datainput_Sync #(
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Atom_Datainput_Sync (
            .iSystemClock        (iSystemClock),
            .iReset              (iReset),

            .oReady              (wDIS_Ready),
            .oLastStep           (wDIS_LastStep),
            .iStart              (wDIS_Start),
            .iTargetWay          (wDIS_TargetWay),
            .iNumOfData          (wDIS_NumOfData),

            .oReadData           (wDIS_ReadData),
            .oReadLast           (wDIS_ReadLast),
            .oReadValid          (wDIS_ReadValid),
            .iReadReady          (wDIS_ReadReady),

            .oDQSOutEnable       (wDIS_DQSOutEnable),
            .oDQOutEnable        (wDIS_DQOutEnable),
            .oChipEnable         (wDIS_ChipEnable),
            .oReadEnable         (wDIS_ReadEnable),
            .oWriteEnable        (wDIS_WriteEnable),
            .oAddressLatchEnable (wDIS_AddressLatchEnable),
            .oCommandLatchEnable (wDIS_CommandLatchEnable),

            .oBuff_Ready         (wDIS_Buff_Ready),
            .iBuff_Valid         (wDIS_Buff_Valid),
            .iBuff_Data          (wDIS_Buff_Data),
            .iBuff_Keep          (wDIS_Buff_Keep),
            .iBuff_Last          (wDIS_Buff_Last)
        );

	NFC_Atom_Command_Generator_to_Physical_Mux #(
			.NumberOfWays(NumberOfWays)
		) inst_NFC_Atom_Command_Generator_to_Physical_Mux (
			.iCI_ACG_Command             (iCI_ACG_Command),

            // .iCI_ACG_WriteData           (iCI_ACG_WriteData ),         
            // .iCI_ACG_WriteLast           (iCI_ACG_WriteLast ),         
            // .iCI_ACG_WriteValid          (iCI_ACG_WriteValid), 
            .oACG_CI_WriteReady          (oACG_CI_WriteReady),

			.iDLE_DQSOutEnable           (wDLE_DQSOutEnable),
			.iDLE_DQOutEnable            (wDLE_DQOutEnable),
			.iDLE_DQStrobe               (wDLE_DQStrobe),
			.iDLE_DQ                     (wDLE_DQ),
			.iDLE_ChipEnable             (wDLE_ChipEnable),
			.iDLE_ReadEnable             (wDLE_ReadEnable),
			.iDLE_WriteEnable            (wDLE_WriteEnable),
			.iDLE_AddressLatchEnable     (wDLE_AddressLatchEnable),
			.iDLE_CommandLatchEnable     (wDLE_CommandLatchEnable),

			.iDLE_DelayTapLoad           (wDLE_DelayTapLoad),
			.iDLE_DelayTap               (wDLE_DelayTap),

			.iACA_DQSOutEnable           (wACA_DQSOutEnable),
			.iACA_DQOutEnable            (wACA_DQOutEnable),
			.iACA_DQStrobe               (wACA_DQStrobe),
			.iACA_DQ                     (wACA_DQ),
			.iACA_ChipEnable             (wACA_ChipEnable),
			.iACA_ReadEnable             (wACA_ReadEnable),
			.iACA_WriteEnable            (wACA_WriteEnable),
			.iACA_AddressLatchEnable     (wACA_AddressLatchEnable),
			.iACA_CommandLatchEnable     (wACA_CommandLatchEnable),

			.iACS_DQSOutEnable           (wACS_DQSOutEnable),
			.iACS_DQOutEnable            (wACS_DQOutEnable),
			.iACS_DQStrobe               (wACS_DQStrobe),
			.iACS_DQ                     (wACS_DQ),
			.iACS_ChipEnable             (wACS_ChipEnable),
			.iACS_ReadEnable             (wACS_ReadEnable),
			.iACS_WriteEnable            (wACS_WriteEnable),
			.iACS_AddressLatchEnable     (wACS_AddressLatchEnable),
			.iACS_CommandLatchEnable     (wACS_CommandLatchEnable),

            .iDOA_WriteReady             (wDOA_WriteReady),

			.iDOA_DQSOutEnable           (wDOA_DQSOutEnable),
			.iDOA_DQOutEnable            (wDOA_DQOutEnable),
			.iDOA_DQStrobe               (wDOA_DQStrobe),
			.iDOA_DQ                     (wDOA_DQ),
			.iDOA_ChipEnable             (wDOA_ChipEnable),
			.iDOA_ReadEnable             (wDOA_ReadEnable),
			.iDOA_WriteEnable            (wDOA_WriteEnable),
			.iDOA_AddressLatchEnable     (wDOA_AddressLatchEnable),
			.iDOA_CommandLatchEnable     (wDOA_CommandLatchEnable),

            .iDOS_WriteReady             (wDOS_WriteReady),

			.iDOS_DQSOutEnable           (wDOS_DQSOutEnable),
			.iDOS_DQOutEnable            (wDOS_DQOutEnable),
			.iDOS_DQStrobe               (wDOS_DQStrobe),
			.iDOS_DQ                     (wDOS_DQ),
			.iDOS_ChipEnable             (wDOS_ChipEnable),
			.iDOS_ReadEnable             (wDOS_ReadEnable),
			.iDOS_WriteEnable            (wDOS_WriteEnable),
			.iDOS_AddressLatchEnable     (wDOS_AddressLatchEnable),
			.iDOS_CommandLatchEnable     (wDOS_CommandLatchEnable),

			// .iDIA_DQSOutEnable           (wDIA_DQSOutEnable),
			// .iDIA_DQOutEnable            (wDIA_DQOutEnable),
			// .iDIA_DQStrobe               (wDIA_DQStrobe),
			// .iDIA_DQ                     (wDIA_DQ),
			// .iDIA_ChipEnable             (wDIA_ChipEnable),
			// .iDIA_ReadEnable             (wDIA_ReadEnable),
			// .iDIA_WriteEnable            (wDIA_WriteEnable),
			// .iDIA_AddressLatchEnable     (wDIA_AddressLatchEnable),
			// .iDIA_CommandLatchEnable     (wDIA_CommandLatchEnable),

			.iDIS_DQSOutEnable           (wDIS_DQSOutEnable),
			.iDIS_DQOutEnable            (wDIS_DQOutEnable),
			// .iDIS_DQStrobe               (wDIS_DQStrobe),
			// .iDIS_DQ                     (wDIS_DQ),
			.iDIS_ChipEnable             (wDIS_ChipEnable),
			.iDIS_ReadEnable             (wDIS_ReadEnable),
			.iDIS_WriteEnable            (wDIS_WriteEnable),
			.iDIS_AddressLatchEnable     (wDIS_AddressLatchEnable),
			.iDIS_CommandLatchEnable     (wDIS_CommandLatchEnable),

			.oACG_PHY_DQSOutEnable       (wMUX_DQSOutEnable),
			.oACG_PHY_DQOutEnable        (wMUX_DQOutEnable),
			.oACG_PHY_DQStrobe           (wMUX_DQStrobe),
			.oACG_PHY_DQ                 (wMUX_DQ),
			.oACG_PHY_ChipEnable         (wMUX_ChipEnable),
			.oACG_PHY_ReadEnable         (wMUX_ReadEnable),
			.oACG_PHY_WriteEnable        (wMUX_WriteEnable),
			.oACG_PHY_AddressLatchEnable (wMUX_AddressLatchEnable),
			.oACG_PHY_CommandLatchEnable (wMUX_CommandLatchEnable),

            .oACG_PHY_BUFF_WE            (wMUX_BUFF_WE),

			.oACG_PHY_DelayTapLoad       (wMUX_DelayTapLoad),
			.oACG_PHY_DelayTap           (wMUX_DelayTap)
		);

	assign oACG_PHY_DQSOutEnable       = wMUX_DQSOutEnable       ;
	assign oACG_PHY_DQOutEnable        = wMUX_DQOutEnable        ;
	assign oACG_PHY_DQStrobe           = wMUX_DQStrobe           ;
	assign oACG_PHY_DQ                 = wMUX_DQ                 ;
	assign oACG_PHY_ChipEnable         = wMUX_ChipEnable         ;
	assign oACG_PHY_ReadEnable         = wMUX_ReadEnable         ;
	assign oACG_PHY_WriteEnable        = wMUX_WriteEnable        ;
	assign oACG_PHY_AddressLatchEnable = wMUX_AddressLatchEnable ;
	assign oACG_PHY_CommandLatchEnable = wMUX_CommandLatchEnable ;

	assign oACG_PHY_DelayTapLoad       = wMUX_DelayTapLoad  ;
	assign oACG_PHY_DelayTap           = wMUX_DelayTap      ;

    assign oACG_PHY_WriteProtect       = iReset;

    assign oACG_PHY_Buff_Ready         = wDIS_Buff_Ready;

    assign oACG_PHY_BUFF_WE            = wMUX_BUFF_WE;
endmodule
