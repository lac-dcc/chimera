// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/02 22:39:41
// Design Name: 
// Module Name: tb_phy
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_NFC_Atom_Command_Generator_Top;

	parameter IDelayValue          = 7;
	parameter InputClockBufferType = 0;
	parameter NumberOfWays         = 2;
	
    reg                           iSystemClock            ; // SDR 100MHz
    reg                           iDelayRefClock          ; // SDR 200Mhz
    reg                           iOutputDrivingClock     ; // SDR 200Mhz
    reg                           iReset                  ;
	// glbl glbl();
	// 100 MHz
	initial                 
	begin
		iSystemClock     <= 1'b0;
		#10000;
		forever
		begin	 
			iSystemClock <= 1'b1;
			#5000;
			iSystemClock <= 1'b0;
			#5000;
		end
	end

	// 200 MHz
	initial                 
	begin
		iDelayRefClock          <= 1'b0;
		iOutputDrivingClock     <= 1'b0;
		#10000;
		forever
		begin	 
			iDelayRefClock      <= 1'b1;
			iOutputDrivingClock <= 1'b1;
			#2500;
			iDelayRefClock      <= 1'b0;
			iOutputDrivingClock <= 1'b0;
			#2500;
		end
	end
    
// CI with ACG

    reg   [7:0]                   iCI_ACG_Command             ;
    reg   [2:0]                   iCI_ACG_CommandOption       ;

    wire  [7:0]                   oACG_CI_Ready               ;
    wire  [7:0]                   oACG_CI_LastStep            ;

    reg   [NumberOfWays - 1:0]    iCI_ACG_TargetWay           ;
    reg   [15:0]                  iCI_ACG_NumOfData           ;

    reg                           iCI_ACG_CASelect            ;
    reg   [39:0]                  iCI_ACG_CAData              ;

    wire  [15:0]                  iCI_ACG_WriteData           ;
    wire                          iCI_ACG_WriteLast           ;
    wire                          iCI_ACG_WriteValid          ;
    wire                          oACG_CI_WriteReady          ;

    wire  [15:0]                  oACG_CI_ReadData            ;
    wire                          oACG_CI_ReadLast            ;
    wire                          oACG_CI_ReadValid           ;
    reg                           iCI_ACG_ReadReady           ;

    wire  [NumberOfWays - 1:0]    oACG_CI_ReadyBusy           ;

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

// pinpad
	wire                          IO_NAND_DQS                 ;
	wire                  [7:0]   IO_NAND_DQ                  ;
	wire   [NumberOfWays - 1:0]   O_NAND_CE                   ;
	wire                          O_NAND_WE                   ;
	wire                          O_NAND_RE                   ;
	wire                          O_NAND_ALE                  ;
	wire                          O_NAND_CLE                  ;
	wire   [NumberOfWays - 1:0]   I_NAND_RB                   ;
	wire                          O_NAND_WP                   ;

    NFC_Atom_Command_Generator_Top #(
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Atom_Command_Generator_Top (
            .iSystemClock                (iSystemClock),
            .iReset                      (iReset),

            .iCI_ACG_Command             (iCI_ACG_Command),
            .iCI_ACG_CommandOption       (iCI_ACG_CommandOption),
            .oACG_CI_Ready               (oACG_CI_Ready),
            .oACG_CI_LastStep            (oACG_CI_LastStep),
            .iCI_ACG_TargetWay           (iCI_ACG_TargetWay),
            .iCI_ACG_NumOfData           (iCI_ACG_NumOfData),
            .iCI_ACG_CASelect            (iCI_ACG_CASelect),
            .iCI_ACG_CAData              (iCI_ACG_CAData),

            .iCI_ACG_WriteData           (iCI_ACG_WriteData),
            .iCI_ACG_WriteLast           (iCI_ACG_WriteLast),
            .iCI_ACG_WriteValid          (iCI_ACG_WriteValid),
            .oACG_CI_WriteReady          (oACG_CI_WriteReady),

            .oACG_CI_ReadData            (oACG_CI_ReadData),
            .oACG_CI_ReadLast            (oACG_CI_ReadLast),
            .oACG_CI_ReadValid           (oACG_CI_ReadValid),
            .iCI_ACG_ReadReady           (iCI_ACG_ReadReady),

            .oACG_CI_ReadyBusy           (oACG_CI_ReadyBusy),

            .oACG_PHY_PinIn_Reset        (wACG_PHY_PinIn_Reset),
            .oACG_PHY_PinIn_BUFF_Reset   (wACG_PHY_PinIn_BUFF_Reset),
            .oACG_PHY_PinOut_Reset       (wACG_PHY_PinOut_Reset),
            .iPI_BUFF_RE                 (wPI_BUFF_RE),
            .iPI_BUFF_OutSel             (wPI_BUFF_OutSel),
            .oPI_DQ                      (wPI_DQ),
            .oPI_ValidFlag               (wPI_ValidFlag),
            .oACG_PHY_DelayTapLoad       (wACG_PHY_DelayTapLoad),
            .oACG_PHY_DelayTap           (wACG_PHY_DelayTap),
            .iPHY_ACG_DelayReady         (wPHY_ACG_DelayReady),
            .oACG_PHY_DQSOutEnable       (wACG_PHY_DQSOutEnable),
            .oACG_PHY_DQOutEnable        (wACG_PHY_DQOutEnable),
            .oACG_PHY_DQStrobe           (wACG_PHY_DQStrobe),
            .oACG_PHY_DQ                 (wACG_PHY_DQ),
            .oACG_PHY_ChipEnable         (wACG_PHY_ChipEnable),
            .oACG_PHY_ReadEnable         (wACG_PHY_ReadEnable),
            .oACG_PHY_WriteEnable        (wACG_PHY_WriteEnable),
            .oACG_PHY_AddressLatchEnable (wACG_PHY_AddressLatchEnable),
            .oACG_PHY_CommandLatchEnable (wACG_PHY_CommandLatchEnable),
            .iPHY_ACG_ReadyBusy          (wPHY_ACG_ReadyBusy),
            .oACG_PHY_WriteProtect       (wACG_PHY_WriteProtect),
            .oACG_PHY_BUFF_WE            (wACG_PHY_BUFF_WE),
            .iPHY_ACG_BUFF_Empty         (wPHY_ACG_BUFF_Empty),
            .oACG_PHY_Buff_Ready         (wACG_PHY_Buff_Ready),
            .iPHY_ACG_Buff_Valid         (wPHY_ACG_Buff_Valid),
            .iPHY_ACG_Buff_Data          (wPHY_ACG_Buff_Data),
            .iPHY_ACG_Buff_Keep          (wPHY_ACG_Buff_Keep),
            .iPHY_ACG_Buff_Last          (wPHY_ACG_Buff_Last)
        );

    NFC_Physical_Top #(
            .IDelayValue(IDelayValue),
            .InputClockBufferType(InputClockBufferType),
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Physical_Top (
            .iSystemClock                (iSystemClock),
            .iDelayRefClock              (iDelayRefClock),
            .iOutputDrivingClock         (iOutputDrivingClock),
            .iACG_PHY_PinIn_Reset        (wACG_PHY_PinIn_Reset),
            .iACG_PHY_PinIn_BUFF_Reset   (wACG_PHY_PinIn_BUFF_Reset),
            .iACG_PHY_PinOut_Reset       (wACG_PHY_PinOut_Reset),
            .iPI_BUFF_RE                 (wPI_BUFF_RE),
            .iPI_BUFF_OutSel             (wPI_BUFF_OutSel),
            .oPI_DQ                      (wPI_DQ),
            .oPI_ValidFlag               (wPI_ValidFlag),
            .iACG_PHY_DelayTapLoad       (wACG_PHY_DelayTapLoad),
            .iACG_PHY_DelayTap           (wACG_PHY_DelayTap),
            .oPHY_ACG_DelayReady         (wPHY_ACG_DelayReady),
            .iACG_PHY_DQSOutEnable       (wACG_PHY_DQSOutEnable),
            .iACG_PHY_DQOutEnable        (wACG_PHY_DQOutEnable),
            .iACG_PHY_DQStrobe           (wACG_PHY_DQStrobe),
            .iACG_PHY_DQ                 (wACG_PHY_DQ),
            .iACG_PHY_ChipEnable         (wACG_PHY_ChipEnable),
            .iACG_PHY_ReadEnable         (wACG_PHY_ReadEnable),
            .iACG_PHY_WriteEnable        (wACG_PHY_WriteEnable),
            .iACG_PHY_AddressLatchEnable (wACG_PHY_AddressLatchEnable),
            .iACG_PHY_CommandLatchEnable (wACG_PHY_CommandLatchEnable),
            .oPHY_ACG_ReadyBusy          (wPHY_ACG_ReadyBusy),
            .iACG_PHY_WriteProtect       (wACG_PHY_WriteProtect),
            .iACG_PHY_BUFF_WE            (wACG_PHY_BUFF_WE),
            .oPHY_ACG_BUFF_Empty         (wPHY_ACG_BUFF_Empty),
            .iACG_PHY_Buff_Ready         (wACG_PHY_Buff_Ready),
            .oPHY_ACG_Buff_Valid         (wPHY_ACG_Buff_Valid),
            .oPHY_ACG_Buff_Data          (wPHY_ACG_Buff_Data),
            .oPHY_ACG_Buff_Keep          (wPHY_ACG_Buff_Keep),
            .oPHY_ACG_Buff_Last          (wPHY_ACG_Buff_Last),
            .IO_NAND_DQS                 (IO_NAND_DQS),
            .IO_NAND_DQ                  (IO_NAND_DQ),
            .O_NAND_CE                   (O_NAND_CE),
            .O_NAND_WE                   (O_NAND_WE),
            .O_NAND_RE                   (O_NAND_RE),
            .O_NAND_ALE                  (O_NAND_ALE),
            .O_NAND_CLE                  (O_NAND_CLE),
            .I_NAND_RB                   (I_NAND_RB),
            .O_NAND_WP                   (O_NAND_WP)
        );

	nand_model nand_b0_1 (
        //clocks
        .Clk_We_n(O_NAND_WE), //same connection to both wen/nclk
        
        //CE
        .Ce_n(O_NAND_CE[0]),
        .Ce2_n(O_NAND_CE[1]),
        
        //Ready/busy
        .Rb_n(I_NAND_RB[0]),
        .Rb2_n(I_NAND_RB[1]),
         
        //DQ DQS
        .Dqs(IO_NAND_DQS), 
        //Reversed DQ
        .Dq_Io(IO_NAND_DQ),
         
        //ALE CLE WR WP
        .Cle(O_NAND_CLE), 
        //.Cle2(),
        .Ale(O_NAND_ALE), 
        //.Ale2(),
        .Wr_Re_n(O_NAND_RE), 
        //.Wr_Re2_n(),
        .Wp_n(O_NAND_WP) 
        //.Wp2_n()
        );  

// Parameters
parameter DEPTH = 32;
parameter DATA_WIDTH = 32;
parameter KEEP_ENABLE = (DATA_WIDTH>8);
parameter KEEP_WIDTH = (DATA_WIDTH/8);
parameter LAST_ENABLE = 1;
parameter ID_ENABLE = 1;
parameter ID_WIDTH = 8;
parameter DEST_ENABLE = 1;
parameter DEST_WIDTH = 8;
parameter USER_ENABLE = 1;
parameter USER_WIDTH = 1;
parameter FRAME_FIFO = 1;
parameter USER_BAD_FRAME_VALUE = 1'b1;
parameter USER_BAD_FRAME_MASK = 1'b1;
parameter DROP_BAD_FRAME = 0;
parameter DROP_WHEN_FULL = 0;

    reg [31:0]       s_axis_tdata  ;
    reg [ 3:0]       s_axis_tkeep  ;
    reg              s_axis_tvalid ;
    wire             s_axis_tready ;
    reg              s_axis_tlast  ;

    wire [ 3:0]      m_axis_tkeep  ;

    axis_fifo #(
        .DEPTH(DEPTH),
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_ENABLE(KEEP_ENABLE),
        .KEEP_WIDTH(KEEP_WIDTH),
        .LAST_ENABLE(LAST_ENABLE),
        .ID_ENABLE(ID_ENABLE),
        .ID_WIDTH(ID_WIDTH),
        .DEST_ENABLE(DEST_ENABLE),
        .DEST_WIDTH(DEST_WIDTH),
        .USER_ENABLE(USER_ENABLE),
        .USER_WIDTH(USER_WIDTH),
        .FRAME_FIFO(FRAME_FIFO),
        .USER_BAD_FRAME_VALUE(USER_BAD_FRAME_VALUE),
        .USER_BAD_FRAME_MASK(USER_BAD_FRAME_MASK),
        .DROP_BAD_FRAME(DROP_BAD_FRAME),
        .DROP_WHEN_FULL(DROP_WHEN_FULL)
    ) inst_axis_fifo (
            .clk               (iSystemClock),
            .rst               (iReset),

            .s_axis_tdata      (s_axis_tdata),
            .s_axis_tkeep      (s_axis_tkeep),
            .s_axis_tvalid     (s_axis_tvalid),
            .s_axis_tready     (s_axis_tready),
            .s_axis_tlast      (s_axis_tlast),

            .m_axis_tdata      (iCI_ACG_WriteData),
            .m_axis_tkeep      (m_axis_tkeep),
            .m_axis_tvalid     (iCI_ACG_WriteValid),
            .m_axis_tready     (oACG_CI_WriteReady),
            .m_axis_tlast      (iCI_ACG_WriteLast),

            .status_overflow   (status_overflow),
            .status_bad_frame  (status_bad_frame),
            .status_good_frame (status_good_frame)
        );

task s_axis_input;
    begin
        @(posedge iSystemClock);   
        s_axis_tvalid <= 0;
        s_axis_tdata <= 32'h00000000;
        s_axis_tkeep <= 4'h0;
        s_axis_tlast <= 0;

        @(posedge iSystemClock);   
        s_axis_tvalid <= 1;
        s_axis_tdata <= 32'h00001500;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 0;

        @(posedge iSystemClock);   
        s_axis_tvalid <= 1;
        s_axis_tdata <= 32'h00000000;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 1;

        @(posedge iSystemClock);   
        s_axis_tvalid <= 0;
        s_axis_tdata <= 32'h00000000;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 1;

        @(posedge iSystemClock);   
        s_axis_tvalid <= 1;
        s_axis_tdata <= 32'h0000102;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 0;
        @(posedge iSystemClock);   
        s_axis_tvalid <= 1;
        s_axis_tdata <= 32'h0000304;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 0;
        @(posedge iSystemClock);   
        s_axis_tvalid <= 1;
        s_axis_tdata <= 32'h0000506;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 0;
        @(posedge iSystemClock);   
        s_axis_tvalid <= 1;
        s_axis_tdata <= 32'h0000708;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 1;
        @(posedge iSystemClock);   
        s_axis_tvalid <= 0;
        s_axis_tdata <= 32'h00000000;
        s_axis_tkeep <= 4'hf;
        s_axis_tlast <= 1;
    end
endtask
task NFC_Atom_signal;
    input   [7:0]                   rCI_ACG_Command             ;
    input   [NumberOfWays - 1:0]    rCI_ACG_TargetWay           ;
    input   [15:0]                  rCI_ACG_NumOfData           ;
    input                           rCI_ACG_CASelect            ;
    input   [39:0]                  rCI_ACG_CAData              ;

	begin
		@(posedge iSystemClock);   
            iCI_ACG_Command   <= rCI_ACG_Command   ;          
            iCI_ACG_TargetWay <= rCI_ACG_TargetWay ;          
            iCI_ACG_NumOfData <= rCI_ACG_NumOfData ;          
            iCI_ACG_CASelect  <= rCI_ACG_CASelect  ;          
            iCI_ACG_CAData    <= rCI_ACG_CAData    ;          
	end
endtask

task reset_ffh;
    begin

    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    NFC_Atom_signal(8'h40, 8'h01, 16'h0001, 1'b1, 40'hff_00_00_00_00);
    wait(oACG_CI_LastStep[6] == 1);

    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    wait(oACG_CI_ReadyBusy[0] == 0);
    wait(oACG_CI_ReadyBusy[0] == 1);

    end
endtask

task setfeature_efh;
    begin
    //cmd
    NFC_Atom_signal(8'h40, 8'h01, 16'h0001, 1'b1, 40'hef_00_00_00_00);
    wait(oACG_CI_LastStep[6] == 1) begin @(posedge iSystemClock); end
//    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //addr
    NFC_Atom_signal(8'h40, 8'h01, 16'h0001, 1'b0, 40'h01_00_00_00_00);
    wait(oACG_CI_LastStep[6] == 1); begin @(posedge iSystemClock); end
//    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //data
    NFC_Atom_signal(8'h20, 8'h01, 16'h0004, 1'b1, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[5] == 1); begin @(posedge iSystemClock); end
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);

    wait(oACG_CI_ReadyBusy[0] == 0);
    wait(oACG_CI_ReadyBusy[0] == 1);
    end
endtask


task getfeature_eeh;
    begin
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //cmd
    NFC_Atom_signal(8'h08, 8'h01, 16'h0000, 1'b1, 40'hee_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    // addr
    NFC_Atom_signal(8'h08, 8'h01, 16'h0000, 1'b0, 40'h01_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);

    wait(oACG_CI_ReadyBusy[0] == 0);
    wait(oACG_CI_ReadyBusy[0] == 1);

    NFC_Atom_signal(8'h02, 8'h01, 16'h0008, 1'b1, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[1] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    end
endtask



task progpage_80h_10h;
	begin
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //cmd
    NFC_Atom_signal(8'h08, 8'h01, 16'h0000, 1'b1, 40'h80_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    // addr
    NFC_Atom_signal(8'h08, 8'h01, 16'h0004, 1'b0, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);

    NFC_Atom_signal(8'h04, 8'h01, 16'h0008, 1'b0, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[2] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);

    NFC_Atom_signal(8'h08, 8'h01, 16'h0001, 1'b1, 40'h10_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);

    wait(oACG_CI_ReadyBusy[0] == 0);
    wait(oACG_CI_ReadyBusy[0] == 1);
	end
endtask

task readpage_00h_30h;
	begin
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //cmd
    NFC_Atom_signal(8'h08, 8'h01, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    // addr
    NFC_Atom_signal(8'h08, 8'h01, 16'h0004, 1'b0, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //cmd
    NFC_Atom_signal(8'h08, 8'h01, 16'h0000, 1'b1, 40'h30_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);

    wait(oACG_CI_ReadyBusy[0] == 0);
    wait(oACG_CI_ReadyBusy[0] == 1);

    NFC_Atom_signal(8'h02, 8'h01, 16'h0008, 1'b1, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[1] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);


	end
endtask

task eraseblock_60h_d0h;
	begin
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //cmd
    NFC_Atom_signal(8'h08, 8'h01, 16'h0000, 1'b1, 40'h60_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    // addr
    NFC_Atom_signal(8'h08, 8'h01, 16'h0002, 1'b0, 40'h00_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    //cmd
    NFC_Atom_signal(8'h08, 8'h01, 16'h0000, 1'b1, 40'hd0_00_00_00_00);
    wait(oACG_CI_LastStep[3] == 1);
    NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b1, 40'h00_00_00_00_00);
    wait(oACG_CI_ReadyBusy[0] == 0);
    wait(oACG_CI_ReadyBusy[0] == 1);
	end
endtask

    integer I;

    initial
    
        begin
		// $dumpfile("./tb_NFC_Physical_Top.vcd");
		// $dumpvars(0, tb_NFC_Physical_Top);
        iReset <= 1;
        iCI_ACG_ReadReady <= 1;
        NFC_Atom_signal(8'h00, 8'h00, 16'h0000, 1'b0, 40'h00_00_00_00_00);
        for (I = 0; I < 10; I = I + 1)
            @(posedge iSystemClock);
        iReset <= 0;
        # 1000000
        for (I = 0; I < 10; I = I + 1)
            @(posedge iSystemClock);
        
        s_axis_input;
        reset_ffh;
        setfeature_efh;
//        getfeature_eeh;
//        progpage_80h_10h;
//        readpage_00h_30h;
//        eraseblock_60h_d0h;
//        readpage_00h_30h;
        repeat (50) @(posedge iSystemClock);
        // $finish;
        end
    
endmodule
