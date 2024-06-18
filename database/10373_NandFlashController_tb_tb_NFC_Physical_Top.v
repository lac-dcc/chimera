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


module tb_NFC_Physical_Top;

	parameter IDelayValue          = 7;
	parameter InputClockBufferType = 0;
	parameter NumberOfWays         = 2;
	
    // wire                           iReset                  ;
	// glbl glbl();
	// 100 MHz
    reg                           iSystemClock            ; // SDR 100MHz
    reg                           iDelayRefClock          ; // SDR 200Mhz
    reg                           iSystemClock_120         ;
    // glbl glbl();
    // 100 MHz
    initial                 
    begin
        iSystemClock     <= 1'b0;
        iSystemClock_120  <= 1'b0;
        #10000;
        forever
        begin    
            iSystemClock <= 1'b1;
            iSystemClock_120 <= 1'b0;
            #3000;
            iSystemClock <= 1'b1;
            iSystemClock_120 <= 1'b1;
            #2000;
            iSystemClock <= 1'b0;
            iSystemClock_120 <= 1'b1;
            #3000;
            iSystemClock <= 1'b0;
            iSystemClock_120 <= 1'b0;
            #2000;
        end
    end

    // 200 MHz
    initial                 
    begin
        iDelayRefClock          <= 1'b0;
        #10000;
        forever
        begin    
            iDelayRefClock      <= 1'b1;
            #2500;
            iDelayRefClock      <= 1'b0;
            #2500;
        end
    end

    // reset from ACG
    reg                           iACG_PHY_PinIn_Reset        ;
    reg                           iACG_PHY_PinIn_BUFF_Reset   ;
    reg                           iACG_PHY_PinOut_Reset       ;

    // unused
    reg                           iPI_BUFF_RE                 ;
    reg   [2:0]                   iPI_BUFF_OutSel             ;
    wire  [31:0]                  oPI_DQ                      ;
    wire                          oPI_ValidFlag               ;

    // DQs delay tap for aligment with DQ
    reg                           iACG_PHY_DelayTapLoad       ;
    reg   [4:0]                   iACG_PHY_DelayTap           ;
    wire                          oPHY_ACG_DelayReady         ;
    reg                           iACG_PHY_DQSOutEnable       ;
    reg                           iACG_PHY_DQOutEnable        ;
    reg   [7:0]                   iACG_PHY_DQStrobe           ;
    reg   [31:0]                  iACG_PHY_DQ                 ;
    reg   [2*NumberOfWays - 1:0]  iACG_PHY_ChipEnable         ;
    reg   [3:0]                   iACG_PHY_ReadEnable         ;
    reg   [3:0]                   iACG_PHY_WriteEnable        ;
    reg   [3:0]                   iACG_PHY_AddressLatchEnable ;
    reg   [3:0]                   iACG_PHY_CommandLatchEnable ;

    wire  [NumberOfWays - 1:0]    oPHY_ACG_ReadyBusy          ;
    reg                           iACG_PHY_WriteProtect       ;

    // enable nand to PHY reg buffer
    reg                           iACG_PHY_BUFF_WE            ;
    wire                          oPHY_ACG_BUFF_Empty         ;

    // read data from PHY reg
    reg                           iACG_PHY_Buff_Ready         ;
    wire                          oPHY_ACG_Buff_Valid         ;
    wire  [15:0]                  oPHY_ACG_Buff_Data          ;
    wire  [ 1:0]                  oPHY_ACG_Buff_Keep          ;
    wire                          oPHY_ACG_Buff_Last          ;


	wire                          IO_NAND_DQS                 ;
	wire                  [7:0]   IO_NAND_DQ                  ;
	wire   [NumberOfWays - 1:0]   O_NAND_CE                   ;
	wire                          O_NAND_WE                   ;
	wire                          O_NAND_RE                   ;
	wire                          O_NAND_ALE                  ;
	wire                          O_NAND_CLE                  ;
	wire   [NumberOfWays - 1:0]   I_NAND_RB                   ;
	wire                          O_NAND_WP                   ;


    NFC_Physical_Top #(
            .IDelayValue(IDelayValue),
            .InputClockBufferType(InputClockBufferType),
            .NumberOfWays(NumberOfWays)
        ) inst_NFC_Physical_Top (
            .iSystemClock                (iSystemClock),
            .iDelayRefClock              (iDelayRefClock),
            .iSystemClock_120            (iSystemClock_120),
            .iACG_PHY_PinIn_Reset        (iACG_PHY_PinIn_Reset),
            .iACG_PHY_PinIn_BUFF_Reset   (iACG_PHY_PinIn_BUFF_Reset),
            .iACG_PHY_PinOut_Reset       (iACG_PHY_PinOut_Reset),
            .iPI_BUFF_RE                 (iPI_BUFF_RE),
            .iPI_BUFF_OutSel             (iPI_BUFF_OutSel),
            .oPI_DQ                      (oPI_DQ),
            .oPI_ValidFlag               (oPI_ValidFlag),
            .iACG_PHY_DelayTapLoad       (iACG_PHY_DelayTapLoad),
            .iACG_PHY_DelayTap           (iACG_PHY_DelayTap),
            .oPHY_ACG_DelayReady         (oPHY_ACG_DelayReady),
            .iACG_PHY_DQSOutEnable       (iACG_PHY_DQSOutEnable),
            .iACG_PHY_DQOutEnable        (iACG_PHY_DQOutEnable),
            .iACG_PHY_DQStrobe           (iACG_PHY_DQStrobe),
            .iACG_PHY_DQ                 (iACG_PHY_DQ),
            .iACG_PHY_ChipEnable         (iACG_PHY_ChipEnable),
            .iACG_PHY_ReadEnable         (iACG_PHY_ReadEnable),
            .iACG_PHY_WriteEnable        (iACG_PHY_WriteEnable),
            .iACG_PHY_AddressLatchEnable (iACG_PHY_AddressLatchEnable),
            .iACG_PHY_CommandLatchEnable (iACG_PHY_CommandLatchEnable),
            .oPHY_ACG_ReadyBusy          (oPHY_ACG_ReadyBusy),
            .iACG_PHY_WriteProtect       (iACG_PHY_WriteProtect),
            .iACG_PHY_BUFF_WE            (iACG_PHY_BUFF_WE),
            .oPHY_ACG_BUFF_Empty         (oPHY_ACG_BUFF_Empty),
            .iACG_PHY_Buff_Ready         (iACG_PHY_Buff_Ready),
            .oPHY_ACG_Buff_Valid         (oPHY_ACG_Buff_Valid),
            .oPHY_ACG_Buff_Data          (oPHY_ACG_Buff_Data),
            .oPHY_ACG_Buff_Keep          (oPHY_ACG_Buff_Keep),
            .oPHY_ACG_Buff_Last          (oPHY_ACG_Buff_Last),
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


task PM_signal;
	input                         riPI_BUFF_RE;
	input                         riPI_BUFF_WE;
	input                   [2:0] riPI_BUFF_OutSel;
	input                         riWriteProtect;
	input                         riPIDelayTapLoad;
	input                   [4:0] riPIDelayTap;
	
	input                         riDQSOutEnable;
	input                         riDQOutEnable;
	
	input                   [7:0] riPO_DQStrobe;
	input                  [31:0] riPO_DQ;
	input                   [3:0] riPO_ChipEnable;
	input                   [3:0] riPO_ReadEnable;
	input                   [3:0] riPO_WriteEnable;
	input                   [3:0] riPO_AddressLatchEnable;
	input                   [3:0] riPO_CommandLatchEnable;
	

	begin
		@(posedge iSystemClock);   
		iACG_PHY_Buff_Ready         <= riPI_BUFF_RE;
		// iPI_BUFF_RE              <= riPI_BUFF_RE            ;
		iACG_PHY_BUFF_WE            <= riPI_BUFF_WE            ;
		iPI_BUFF_OutSel             <= riPI_BUFF_OutSel        ;
		iACG_PHY_WriteProtect       <= riWriteProtect          ;
		iACG_PHY_DelayTapLoad       <= riPIDelayTapLoad        ;
		iACG_PHY_DelayTap           <= riPIDelayTap            ;
		
		iACG_PHY_DQSOutEnable       <= riDQSOutEnable          ;
		iACG_PHY_DQOutEnable        <= riDQOutEnable           ;
		
		iACG_PHY_DQStrobe           <= riPO_DQStrobe           ;
		iACG_PHY_DQ                 <= riPO_DQ                 ;
		iACG_PHY_ChipEnable         <= riPO_ChipEnable         ;
		iACG_PHY_ReadEnable         <= riPO_ReadEnable         ;
		iACG_PHY_WriteEnable        <= riPO_WriteEnable        ;
		iACG_PHY_AddressLatchEnable <= riPO_AddressLatchEnable ;
		iACG_PHY_CommandLatchEnable <= riPO_CommandLatchEnable ;
	end
endtask

task reset_ffh;
    begin
    // Async
    // enable CE
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    // cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'hffff, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);
    // idle
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    wait(oPHY_ACG_ReadyBusy[0] == 0);
    wait(oPHY_ACG_ReadyBusy[0] == 1);
    end
endtask

task setfeature_efh;
    begin
    // Async
    // enable CE
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    // cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'hefef, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);
    // addr
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0101, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    // Idle
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);

    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h1515, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);

	PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);

    wait(oPHY_ACG_ReadyBusy[0] == 0);
    wait(oPHY_ACG_ReadyBusy[0] == 1);

    end
endtask

task getfeature_eeh;
    begin

    // Sync
    // enable CE
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    // cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'heeee, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);
    // adr
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0101, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    // idle
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    wait(oPHY_ACG_ReadyBusy[0] == 0);
    wait(oPHY_ACG_ReadyBusy[0] == 1);
    // for DQs to 0, interval
    PM_signal(1, 0, 0, 0, 0, 0, 1, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 0, 0, 0, 0, 0, 1, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    // read
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);

    // for buf1 we, make sure data pushed in FIFO
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);

    // unusable
    PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
	PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
	PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
	PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);


    PM_signal(0, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0000, 4'b0000, 4'b0000);
    end
endtask



task progpage_80h_10h;
	begin
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    //cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h8080, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);
    //addr
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    //tadl
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);

    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0011);
    //data
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h03, 32'h0201, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h03, 32'h0403, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h03, 32'h0605, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h03, 32'h0807, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    //cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h1010, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);

	PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    wait(oPHY_ACG_ReadyBusy[0] == 0);
    wait(oPHY_ACG_ReadyBusy[0] == 1);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
	end
endtask

task readpage_00h_30h;
	begin
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    //cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);
    //addr
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    //cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h3030, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);

    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0000);
    wait(oPHY_ACG_ReadyBusy[0] == 0);
    wait(oPHY_ACG_ReadyBusy[0] == 1);
    // for DQs to 0 
    PM_signal(1, 0, 0, 0, 0, 0, 1, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 0, 0, 0, 0, 0, 1, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);

    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0011, 4'b0011);

    // for buf1 we
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 1, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);

    PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
    PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
	PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
	PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
	PM_signal(1, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0001, 4'b0000, 4'b0000);
	
    PM_signal(0, 0, 0, 0, 0, 0, 0, 0, 8'h00, 32'h0000, 4'b0001, 4'b0000, 4'b0000, 4'b0000, 4'b0000);
	end
endtask

task eraseblock_60h_d0h;
	begin
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    //cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h6060, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);
    //addr
    // PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    // PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0001, 4'b0011, 4'b0000);
    //cmd
    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'hd0d0, 4'b0001, 4'b0011, 4'b0001, 4'b0000, 4'b0011);

    PM_signal(0, 0, 0, 0, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0001, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
    wait(oPHY_ACG_ReadyBusy[0] == 0);
    wait(oPHY_ACG_ReadyBusy[0] == 1);

	end
endtask

    integer I;

    initial
    
        begin
		// $dumpfile("./tb_NFC_Physical_Top.vcd");
		// $dumpvars(0, tb_NFC_Physical_Top);

        iACG_PHY_PinIn_Reset      <= 1;
        iACG_PHY_PinIn_BUFF_Reset <= 1;
        iACG_PHY_PinOut_Reset     <= 1;
        PM_signal(0, 0, 0, 1, 0, 0, 1, 1, 8'h00, 32'h0000, 4'b0000, 4'b0011, 4'b0000, 4'b0000, 4'b0000);
        for (I = 0; I < 10; I = I + 1)
            @(posedge iSystemClock);
        iACG_PHY_PinIn_Reset      <= 0;
        iACG_PHY_PinIn_BUFF_Reset <= 0;
        iACG_PHY_PinOut_Reset     <= 0;
        # 1000000
        for (I = 0; I < 10; I = I + 1)
            @(posedge iSystemClock);
        
        PM_signal(0, 0, 0, 0, 1,20, 1, 1, 8'h00, 32'h0000, 4'b0000, 4'b0011, 4'b0000, 4'b0000, 4'b0000);

        reset_ffh;
        setfeature_efh;
        getfeature_eeh;
        progpage_80h_10h;
        readpage_00h_30h;
        // eraseblock_60h_d0h;
        // readpage_00h_30h;
        repeat (50) @(posedge iSystemClock);
        $finish;
        end
    
endmodule
