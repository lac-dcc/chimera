`timescale 1ns / 1ps

module NFC_Physical_Input
#
(
    parameter IDelayValue           = 20,
    parameter InputClockBufferType  = 0
)
(
    iSystemClock    ,
    iDelayRefClock  ,
    // iOutputDrivingClock ,
    // iSystemClock_120         ,
    // iSystemClock_4x,
    iModuleReset    ,
    iBufferReset    ,

    iPO_DQStrobe            ,
    iPO_DQ                  ,

    iAddressLatchEnable,
    iPI_Buff_RE     ,
    iPI_Buff_WE     ,
    iPI_Buff_OutSel ,
    oPI_Buff_Empty  ,
    
    iPI_Buff_Ready,
    oPI_Buff_Valid,
    oPI_Buff_Data,
    oPI_Buff_Keep,
    oPI_Buff_Last,
    
    oPI_DQ          ,
    oPI_ValidFlag   ,
    iPI_DelayTapLoad,
    iPI_DelayTap    ,
    oPI_DelayReady  ,
    iDQSFromNAND    ,
    iDQFromNAND
);
    input           iSystemClock        ;
    input           iDelayRefClock      ;
    // input           iOutputDrivingClock     ;
    // input           iSystemClock_120         ;
    // input           iSystemClock_4x         ;
    input           iModuleReset        ;
    input           iBufferReset        ;
    input   [7:0]                   iPO_DQStrobe            ; // DQS, full res.
    input   [31:0]                  iPO_DQ                  ;
    input   [3:0]                   iAddressLatchEnable ;
    input           iPI_Buff_RE         ;
    input           iPI_Buff_WE         ;
    input   [2:0]   iPI_Buff_OutSel     ; // 000: IN_FIFO, 100: Nm4+Nm3, 101: Nm3+Nm2, 110: Nm2+Nm1, 111: Nm1+ZERO
    output          oPI_Buff_Empty      ;
    output  [31:0]  oPI_DQ              ; // DQ, 4 bit * 8 bit data width = 32 bit interface width
    output  [3:0]   oPI_ValidFlag       ; // { Nm1, Nm2, Nm3, Nm4 }
    input           iPI_DelayTapLoad    ;
    input   [4:0]   iPI_DelayTap        ;
    output          oPI_DelayReady      ;
    input           iDQSFromNAND        ;
    input   [7:0]   iDQFromNAND         ;
    
    input           iPI_Buff_Ready      ;
    output          oPI_Buff_Valid      ;
    output  [15:0]  oPI_Buff_Data       ;
    output  [ 1:0]  oPI_Buff_Keep       ;
    output          oPI_Buff_Last       ;
    
    reg           r0_PI_Buff_WE         ;
    reg           r1_PI_Buff_WE         ;
    reg           r2_PI_Buff_WE         ;
    // Input Capture Clock -> delayed DQS signal with IDELAYE2
    // IDELAYE2, REFCLK: SDR 200MHz
    //           Tap resolution: 1/(32*2*200MHz) = 78.125 ps
    //           Initial Tap: 28, 78.125 ps * 28 = 2187.5 ps
    
    // Data Width (DQ): 8 bit
    
    // 1:2 DDR Deserializtion with IDDR
    // IDDR, 1:2 Desirialization
    //       C: delayed DDR 100MHz
    // IN_FIFO
    //          WRCLK: delayed SDR 100MHz RDCLK: SDR 100MHz ARRAY_MODE_4_X_4
    
    // IDELAYCTRL, Minimum Reset Pulse Width: 52 ns
    //             Reset to Ready: 3.22 us
    // IN_FIFO, Maximum Frequency (RDCLK, WRCLK): 533.05 MHz, 1.0 V, -3
    
    // Internal Wires/Regs
    
    wire    wDelayedDQS         ;
    wire    wDelayedDQSClock    ;
    wire    wtestFULL;
    
    wire [7:0] wDelayedDQ         ;



    IDELAYCTRL
    Inst_DQSIDELAYCTRL
    (
        .REFCLK (iDelayRefClock     ),
        .RST    (0       ),
        .RDY    (oPI_DelayReady     )
    );
    
    IDELAYE2
    #
    (
        .IDELAY_TYPE        ("FIXED"),//"VAR_LOAD" ),
        .DELAY_SRC          ("IDATAIN"  ),
        .IDELAY_VALUE       (IDelayValue),
        .SIGNAL_PATTERN     ("CLOCK"    ),
        .REFCLK_FREQUENCY   (200        )
    )
    Inst_DQSIDELAY
    (
        .CNTVALUEOUT    (                   ),
        .DATAOUT        (wDelayedDQS        ),
        .C              (iDelayRefClock     ),
        .CE             (0                  ),
        .CINVCTRL       (0                  ),
        .CNTVALUEIN     (iPI_DelayTap       ),
        .DATAIN         (0                  ),
        .IDATAIN        (iDQSFromNAND       ),
        .INC            (0                  ),
        .LD             (iPI_DelayTapLoad   ),
        .LDPIPEEN       (0                  ),
        .REGRST         (0       )
    );
    IBUFG
    Inst_DQSCLOCK
    (
        .I  (wDelayedDQS        ),
        .O  (wDelayedDQSClock   )
    );


    genvar c;

    
    wire    [7:0]   wDQAtRising     ;
    wire    [7:0]   wDQAtFalling    ;
    
    generate
    for (c = 0; c < 8; c = c + 1)
    begin: DQIDDRBits    
        // IDELAYE2
        // #
        // (
        //     .IDELAY_TYPE        ("FIXED"),//"VAR_LOAD" ),
        //     .DELAY_SRC          ("IDATAIN"  ),
        //     .IDELAY_VALUE       (IDelayValue),
        //     .SIGNAL_PATTERN     ("CLOCK"    ),
        //     .REFCLK_FREQUENCY   (200        )
        // )
        // Inst_DQSIDELAY
        // (
        //     .CNTVALUEOUT    (                   ),
        //     .DATAOUT        (wDelayedDQ[c]        ),
        //     .C              (iDelayRefClock     ),
        //     .CE             (0                  ),
        //     .CINVCTRL       (0                  ),
        //     .CNTVALUEIN     (iPI_DelayTap       ),
        //     .DATAIN         (0                  ),
        //     .IDATAIN        (iDQFromNAND[c]       ),
        //     .INC            (0                  ),
        //     .LD             (iPI_DelayTapLoad   ),
        //     .LDPIPEEN       (0                  ),
        //     .REGRST         (0       )
        // );

        IDDR
        #
        (
            .DDR_CLK_EDGE   ("OPPOSITE_EDGE"    ),
            .INIT_Q1        (0                  ),
            .INIT_Q2        (0                  ),
            .SRTYPE         ("SYNC"             )
        )
        Inst_DQIDDR
        (
            .Q1 ( wDQAtRising[c]    ),
            .Q2 (wDQAtFalling[c]    ),
            .C  (wDelayedDQSClock   ),
            .CE (1                  ),
            .D  (iDQFromNAND[c]      ),
            .R  (0                  ),
            .S  (0                  )
        );
    end
    endgenerate
    
    wire [7:0] DQ_dly        ;
    wire [7:0] DQ_iddr_r     ;
    wire [7:0] DQ_iddr_f     ;

    wire [7:0] DQ_iddr_r0    ;
    wire [7:0] DQ_iddr_f0    ;
    wire [7:0] DQ_iddr_r180  ;
    wire [7:0] DQ_iddr_f180  ;
    wire [7:0] DQ_iddr_r180_2;

    generate
    for (c = 0; c < 8; c = c + 1)
    begin: FF    
        // clk0 data path
        FD FD_DQ_IDDR_R0
        (
            .Q(DQ_iddr_r0[c]),
            .C(iSystemClock),
            .D(wDQAtRising[c])
        );
        FD_1 FD_DQ_IDDR_F0
        (
            .Q(DQ_iddr_f0[c]),
            .C(iSystemClock),
            .D(wDQAtFalling[c])
        );

        // clk180 data path


        FD_1 FD_DQ_IDDR_R180
        (
            .Q(DQ_iddr_r180[c]),
            .C(iSystemClock),
            .D(wDQAtRising[c])
        );
        FD FD_DQ_IDDR_R180_2
        (
            .Q(DQ_iddr_r180_2[c]),
            .C(iSystemClock),
            .D(DQ_iddr_r180[c])
        );
        FD FD_DQ_IDDR_F180
        (
            .Q(DQ_iddr_f180[c]),
            .C(iSystemClock),
            .D(wDQAtFalling[c])
        );

    end
    endgenerate   

    // wire wDQS_Valid_180_2;
    // wire wDQS_Valid_180;
    // FD_1 IDQS_Valid_180
    // (
    //     .Q(wDQS_Valid_180),
    //     .C(iSystemClock),
    //     .D(wDelayedDQSClock)
    // );
    // FD IDQS_Valid_180_2
    // (
    //     .Q(wDQS_Valid_180_2),
    //     .C(iSystemClock),
    //     .D(wDQS_Valid_180)
    // );

    reg [7:0] rd_data_r;
    reg [7:0] rd_data_f;
    reg [4:0] rd_data_valid_SRL;
    reg       rd_data_valid;

    always @(posedge iSystemClock) begin
        rd_data_r <= DQ_iddr_r180_2;
        rd_data_f <= DQ_iddr_f180;
        rd_data_valid_SRL <= {rd_data_valid_SRL[3:0],iAddressLatchEnable[0] & iPI_Buff_WE};
        rd_data_valid <= rd_data_valid_SRL[3];
    end

    // ila_0 ila0(
    // .clk(iDelayRefClock),
    // .probe0(rd_data_r),
    // .probe1(rd_data_f),
    // .probe2(rd_data_valid),
    // .probe3(wDQAtRising), 
    // .probe4(wDQAtFalling)
    // );

    wire    [7:0]   wDQ0  ;
    wire    [7:0]   wDQ1  ;
    wire    [7:0]   wDQ2  ;
    wire    [7:0]   wDQ3  ;
    


    wire [11:0] RDCOUNT;
    wire [11:0] WRCOUNT;


    reg          rPI_Buff_Valid      ;
    reg          rPI_Buff_Valid_m1   ;
    reg          rPI_Buff_Valid_m2   ;
    reg          rPI_Buff_Valid_m3   ;
    reg          rPI_Buff_Valid_m4   ;
    reg  [15:0]  rPI_Buff_Data       ;
    reg  [ 1:0]  rPI_Buff_Keep       ;
    reg          rPI_Buff_Last       ;

    wire         rPI_Buff_advance_condition = iPI_Buff_Ready && rPI_Buff_Valid;

    always @(posedge iSystemClock) begin
        if (iBufferReset) begin
            rPI_Buff_Valid <= 0;
            rPI_Buff_Valid_m1 <= 0;
            rPI_Buff_Valid_m2 <= 0;
            rPI_Buff_Valid_m3 <= 0;
            rPI_Buff_Valid_m4 <= 0;
        end else if (rPI_Buff_advance_condition && rPI_Buff_Last) begin
            rPI_Buff_Valid <= 0;
            rPI_Buff_Valid_m1 <= 0;
            rPI_Buff_Valid_m2 <= 0;
            rPI_Buff_Valid_m3 <= 0;
            rPI_Buff_Valid_m4 <= 0;
        end else if (!oPI_Buff_Empty & iPI_Buff_Ready) begin
            rPI_Buff_Valid <= 1;
        end
        rPI_Buff_Valid_m1 <= rPI_Buff_Valid;
        rPI_Buff_Valid_m3 <= rPI_Buff_Valid_m2;
        if ({rPI_Buff_Valid_m1,rPI_Buff_Valid} == 2'b01)
            rPI_Buff_Valid_m2 <= 1;
        if ({rPI_Buff_Valid_m3,rPI_Buff_Valid_m2} == 2'b01)
            rPI_Buff_Valid_m4 <= 1;
    end

    always @(posedge iSystemClock) begin
        if (rPI_Buff_Valid_m2) begin
            rPI_Buff_Data <= {wDQ1,wDQ0};
            rPI_Buff_Keep <= 2'b11;
        end else begin
            rPI_Buff_Data <= 0;
            rPI_Buff_Keep <= 2'b00;
        end
    end

    always @(posedge iSystemClock) begin
        if (rPI_Buff_advance_condition) begin
            rPI_Buff_Last <= oPI_Buff_Empty;
        end else begin
            rPI_Buff_Last <= 0;
        end
    end
    // ila_0 ila0(
    // .clk(iOutputDrivingClock),
    // .probe0(oPI_Buff_Valid),
    // .probe1(rDQSFromNAND_m2),
    // .probe2(rPI_Buff_Data),
    // .probe3(iPI_Buff_Ready),
    // .probe4({wDQ1,wDQ0}),
    // .probe5({rDQAtFalling, rDQAtRising_m1})
    // );
    // Input

	FIFO36E1 #(
        .ALMOST_EMPTY_OFFSET(13'h0080), // Sets the almost empty threshold
        .ALMOST_FULL_OFFSET(13'h0080), // Sets almost full threshold
        .DATA_WIDTH(18), // Sets data width to 4-36
        .DO_REG(1), // Enable output register (1-0) Must be 1 if EN_SYN = FALSE
        .EN_SYN("FALSE"), // Specifies FIFO as dual-clock (FALSE) or Synchronous (TRUE)
        .FIFO_MODE("FIFO36"), // Sets mode to FIFO18 or FIFO18_36
        .FIRST_WORD_FALL_THROUGH("FALSE"), // Sets the FIFO FWFT to FALSE, TRUE
        .INIT(36'h000000000), // Initial values on output port
        .SIM_DEVICE("7SERIES"), // Must be set to "7SERIES" for simulation behavior
        .SRVAL(36'h000000000) // Set/Reset value for output port
        )
    FIFO36E1_inst (
        // Read Data: 32-bit (each) output: Read output data
        .DO({wDQ3,wDQ2,wDQ1,wDQ0}), // 32-bit output: Data output
        .DOP(), // 4-bit output: Parity data output
        // Status: 1-bit (each) output: Flags and other FIFO status outputs
        .ALMOSTEMPTY(), // 1-bit output: Almost empty flag
        .ALMOSTFULL(), // 1-bit output: Almost full flag
        .EMPTY(oPI_Buff_Empty), // 1-bit output: Empty flag
        .FULL(wtestFULL), // 1-bit output: Full flag
        .RDCOUNT(RDCOUNT), // 12-bit output: Read count
        .RDERR(), // 1-bit output: Read error
        .WRCOUNT(WRCOUNT), // 12-bit output: Write count
        .WRERR(), // 1-bit output: Write error
        // Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
        .RDCLK(iSystemClock), // 1-bit input: Read clock
        .RDEN(rPI_Buff_advance_condition), // 1-bit input: Read enable
        .REGCE(1'b1), // 1-bit input: Clock enable
        .RST(iBufferReset), // 1-bit input: Asynchronous Reset
        .RSTREG(1'b0), // 1-bit input: Output register set/reset
        // Write Control Signals: 1-bit (each) input: Write clock and enable input signals
        .WRCLK(iSystemClock), // 1-bit input: Write clock
        .WREN(rd_data_valid), // 1-bit input: Write enable
        // Write Data: 32-bit (each) input: Write input data
        .DI({16'd0, rd_data_f,rd_data_r}), // 32-bit input: Data input
        .DIP(4'b0) // 4-bit input: Parity input
        );

    assign oPI_Buff_Valid = rPI_Buff_Valid_m4;
    assign oPI_Buff_Data  = rPI_Buff_Data    ;
    assign oPI_Buff_Keep  = rPI_Buff_Keep    ;
    assign oPI_Buff_Last  = rPI_Buff_Last    ;

endmodule
