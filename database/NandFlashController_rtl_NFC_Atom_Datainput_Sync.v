`timescale 1ns / 1ps
module NFC_Atom_Datainput_Sync
#
(
    parameter NumberOfWays    =   4
)
(
    iSystemClock            ,
    iReset                  ,
    oReady                  ,
    oLastStep               ,
    iStart                  ,
    iTargetWay              ,
    iNumOfData              ,

    oReadData               ,
    oReadLast               ,
    oReadValid              ,
    iReadReady              ,

    oDQSOutEnable           ,
    oDQOutEnable            ,

    oChipEnable             ,
    oReadEnable             ,
    oWriteEnable            ,
    oAddressLatchEnable     ,
    oCommandLatchEnable     ,

    oBuff_Ready             ,
    iBuff_Valid             ,
    iBuff_Data              ,
    iBuff_Keep              ,
    iBuff_Last              

);

    input                           iSystemClock            ;
    input                           iReset                  ;
    output                          oReady                  ;
    output                          oLastStep               ;
    input                           iStart                  ;
    input   [NumberOfWays - 1:0]    iTargetWay              ;
    input   [15:0]                  iNumOfData              ;

    output  [15:0]                  oReadData               ;
    output                          oReadLast               ;
    output                          oReadValid              ;
    input                           iReadReady              ;
    wire   [1:0]                    oReadKeep               ;

    output                          oDQSOutEnable           ;
    output                          oDQOutEnable            ;

    // output  [7:0]                   oDQStrobe               ;
    // output  [31:0]                  oDQ                     ;
    output  [2*NumberOfWays - 1:0]  oChipEnable             ;
    output  [3:0]                   oReadEnable             ;
    output  [3:0]                   oWriteEnable            ;
    output  [3:0]                   oAddressLatchEnable     ;
    output  [3:0]                   oCommandLatchEnable     ;

    output                          oBuff_Ready             ;
    input                           iBuff_Valid             ;
    input   [15:0]                  iBuff_Data              ;
    input   [ 1:0]                  iBuff_Keep              ;
    input                           iBuff_Last              ;

    reg                           rReady                  ;
    reg                           rLastStep               ;

    reg   [NumberOfWays - 1:0]    rTargetWay              ;
    reg   [15:0]                  rNumOfData              ;

    reg  [31:0]                   rReadData               ;
    reg                           rReadLast               ;
    reg                           rReadValid              ;


    reg                           rDQSOutEnable           ;
    reg                           rDQOutEnable            ;
 
    reg  [2*NumberOfWays - 1:0]   rChipEnable             ;
    reg  [3:0]                    rReadEnable             ;
    reg  [3:0]                    rWriteEnable            ;
    reg  [3:0]                    rAddressLatchEnable     ;
    reg  [3:0]                    rCommandLatchEnable     ;

    reg  [15:0]                   rDIS_DataCounter        ;
    reg  [3:0]                    rDIS_TimeCounter        ;

    wire                          wBuff_Ready             ;

    localparam Write_Valid = 4'b0010;
    localparam Write_Idle  = 4'b0011;

    localparam Out_Enable  = 0;
    localparam Out_Disable = 1;
    
    localparam tWPST_timer = 3;

    wire                          wtWPSTDone = (rDIS_TimeCounter == tWPST_timer) ? 1 : 0 ; // tCKWR
    wire                          wTimerDone = (rDIS_TimeCounter == 4'd3) ? 1 : 0 ; // tCAD
    // wire                          wTimerHalf = (rDIS_TimeCounter <= 4'd4) ? 1 : 0 ;
    wire                          wDISDone   = (rDIS_DataCounter == rNumOfData) ? 1 : 0 ;

    // wire  [31:0]                  wUperData  = {16'h00, iWriteData[15:8], iWriteData[15:8]};
    // wire  [31:0]                  wDownData  = {16'h00, iWriteData[ 7:0], iWriteData[ 7:0]};

    // FSM Parameters/Wires/Regs
    localparam DIS_FSM_BIT = 7;
    localparam DIS_RESET = 7'b000_0001;
    localparam DIS_READY = 7'b000_0010; // Ready
    localparam DIS_LATCH = 7'b000_0100; // tCAD
    localparam DIS_tDQSS = 7'b000_1000; // tDQSHZ
    localparam DIS_OST00 = 7'b001_0000; // 
    localparam DIS_OST01 = 7'b010_0000; // input data
    localparam DIS_OST02 = 7'b100_0000; // tCKWR

    reg     [DIS_FSM_BIT-1:0]       rDIS_cur_state          ;
    reg     [DIS_FSM_BIT-1:0]       rDIS_nxt_state          ;

    // reg [127:0] dbg_ascii_state;

    // always @* begin
    //     dbg_ascii_state = "";
    //     if (rDIS_cur_state == DIS_RESET) dbg_ascii_state = "RESET";
    //     if (rDIS_cur_state == DIS_READY) dbg_ascii_state = "READY";
    //     if (rDIS_cur_state == DIS_LATCH) dbg_ascii_state = "LATCH";
    //     if (rDIS_cur_state == DIS_tDQSS) dbg_ascii_state = "tDQSS";
    //     if (rDIS_cur_state == DIS_OST00) dbg_ascii_state = "OST00";
    //     if (rDIS_cur_state == DIS_OST00) dbg_ascii_state = "OST01";
    //     if (rDIS_cur_state == DIS_OST01) dbg_ascii_state = "OST02";
    //     if (rDIS_cur_state == DIS_OST03) dbg_ascii_state = "OST03";
    // end
    // FSM: Atom_Command_Sync
    
    // update current state to next state
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rDIS_cur_state <= DIS_RESET;
        end else begin
            rDIS_cur_state <= rDIS_nxt_state;
        end
    end
    
    // deside next state
    always @ ( * ) begin
        case (rDIS_cur_state)
            DIS_RESET: begin
                rDIS_nxt_state <= DIS_READY;
            end
            DIS_READY: begin
                rDIS_nxt_state <= (iStart)? DIS_LATCH:DIS_READY;
            end
            DIS_LATCH: begin
                rDIS_nxt_state <= DIS_tDQSS;
            end
            DIS_tDQSS: begin
                rDIS_nxt_state <= (wTimerDone)? DIS_OST00 : DIS_tDQSS; // 50ns
            end
            DIS_OST00: begin
                rDIS_nxt_state <= (wBuff_Ready) ? DIS_OST01 : DIS_OST00; //latch Data
            end
            DIS_OST01: begin
                rDIS_nxt_state <= (wDISDone) ? DIS_OST02 : DIS_OST01;// output
            end
            DIS_OST02: begin
                rDIS_nxt_state <= (rLastStep) ? DIS_READY : DIS_OST02;// finished
            end
            default:
                rDIS_nxt_state <= DIS_READY;
        endcase
    end

    // state behaviour
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rReady              <= 1'b0;
            rLastStep           <= 1'b0;

            rTargetWay          <= { NumberOfWays{1'b1} };
            rNumOfData          <= 16'h0;
            
            // rBuff_Ready         <= 1;
            
            rDQSOutEnable       <= Out_Enable;    
            rDQOutEnable        <= Out_Enable;

            rChipEnable         <= { 2*NumberOfWays{1'b1} };
            rReadEnable         <= 4'b0011;
            rWriteEnable        <= Write_Idle;
            rAddressLatchEnable <= 4'h0;
            rCommandLatchEnable <= 4'h0; 

            rDIS_DataCounter    <= 4'd0;
            rDIS_TimeCounter    <= 4'd0;
        end else begin
            case (rDIS_nxt_state)
                DIS_RESET: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 16'h0;
                    
                    
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    
                    
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDIS_DataCounter    <= 4'd0;
                    rDIS_TimeCounter    <= 4'd0;
                end
                DIS_READY: begin
                    rReady              <= 1'b1;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 16'h0;
                    
                    
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    
                    
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDIS_DataCounter    <= 4'd0;
                    rDIS_TimeCounter    <= 4'd0;
                end
                DIS_LATCH: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= ~iTargetWay;
                    rNumOfData          <= iNumOfData;
                    
                    
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    
                    
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDIS_DataCounter    <= 4'd0;
                    rDIS_TimeCounter    <= 4'd0;
                end
                DIS_tDQSS: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    
                    
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    
                    
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0000;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDIS_DataCounter    <= 4'd0;
                    rDIS_TimeCounter    <= (wTimerDone) ? 0 : rDIS_TimeCounter + 1;
                end
                DIS_OST00: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    
                    
                    
                    rDQSOutEnable       <= Out_Disable;    
                    rDQOutEnable        <= Out_Disable;

                    
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0000;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDIS_DataCounter    <= rDIS_DataCounter;
                    rDIS_TimeCounter    <= 4'd0;
                end
                DIS_OST01: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    
                    
                    rDQSOutEnable       <= Out_Disable;    
                    rDQOutEnable        <= Out_Disable;


                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0000;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0011;
                    rCommandLatchEnable <= 4'b0011;

                    rDIS_DataCounter    <= rDIS_DataCounter + 2;
                    rDIS_TimeCounter    <= 0; //(wTimerDone) ? 0 : rDIS_TimeCounter + 1;
                end
                DIS_OST02: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wtWPSTDone & wDISDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    
                    
                    rDQSOutEnable       <= Out_Disable;    
                    rDQOutEnable        <= Out_Disable;

                    
                    
                    rChipEnable         <= (rDIS_TimeCounter < tWPST_timer) ? {rTargetWay ,rTargetWay} : 0;
                    rReadEnable         <= (rDIS_TimeCounter < tWPST_timer) ? 4'b0000 : 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDIS_DataCounter    <= rDIS_DataCounter;
                    rDIS_TimeCounter    <= rDIS_TimeCounter + 1;
                end
                default: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 16'h0;
                    
                    
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    
                    
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDIS_DataCounter    <= 4'd0;
                    rDIS_TimeCounter    <= 4'd0;
                end
            endcase
        end
    end

	// Parameters
	localparam DEPTH = 4320;
    localparam DATA_WIDTH = 16;
    localparam KEEP_ENABLE = (DATA_WIDTH>8);
    localparam KEEP_WIDTH = (DATA_WIDTH/8);
    localparam LAST_ENABLE = 1;
    localparam ID_ENABLE = 1;
    localparam ID_WIDTH = 8;
    localparam DEST_ENABLE = 1;
    localparam DEST_WIDTH = 8;
    localparam USER_ENABLE = 1;
    localparam USER_WIDTH = 1;
    localparam FRAME_FIFO = 0;
    localparam USER_BAD_FRAME_VALUE = 1'b1;
    localparam USER_BAD_FRAME_MASK = 1'b1;
    localparam DROP_BAD_FRAME = 0;
    localparam DROP_WHEN_FULL = 0;


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

            .s_axis_tdata      (iBuff_Data),
            .s_axis_tkeep      (iBuff_Keep),
            .s_axis_tvalid     (iBuff_Valid),
            .s_axis_tready     (wBuff_Ready),
            .s_axis_tlast      (iBuff_Last),

            .m_axis_tdata      (oReadData ),
            .m_axis_tkeep      (oReadKeep ),
            .m_axis_tvalid     (oReadValid),
            .m_axis_tready     (iReadReady),
            .m_axis_tlast      (oReadLast ),

            .status_overflow   (status_overflow),
            .status_bad_frame  (status_bad_frame),
            .status_good_frame (status_good_frame)
        );

    assign oReady              = rReady                  ;
    assign oLastStep           = rLastStep               ;

    assign oDQSOutEnable       = rDQSOutEnable           ;   
    assign oDQOutEnable        = rDQOutEnable            ;   
    assign oChipEnable         = rChipEnable             ;   
    assign oReadEnable         = rReadEnable             ;   
    assign oWriteEnable        = rWriteEnable            ;   
    assign oAddressLatchEnable = rAddressLatchEnable     ;   
    assign oCommandLatchEnable = rCommandLatchEnable     ;   

    assign oBuff_Ready         = wBuff_Ready;
endmodule