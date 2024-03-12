`timescale 1ns / 1ps
module NFC_Atom_Dataoutput_Sync
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

    iWriteData              ,
    iWriteLast              ,
    iWriteValid             ,
    oWriteReady             ,

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

    input                           iSystemClock            ;
    input                           iReset                  ;
    output                          oReady                  ;
    output                          oLastStep               ;
    input                           iStart                  ;
    input   [NumberOfWays - 1:0]    iTargetWay              ;
    input   [15:0]                  iNumOfData              ;

    input   [15:0]                  iWriteData              ;
    input                           iWriteLast              ;
    input                           iWriteValid             ;
    output                          oWriteReady             ;

    output                          oDQSOutEnable           ;
    output                          oDQOutEnable            ;

    output  [7:0]                   oDQStrobe               ;
    output  [31:0]                  oDQ                     ;
    output  [2*NumberOfWays - 1:0]  oChipEnable             ;
    output  [3:0]                   oReadEnable             ;
    output  [3:0]                   oWriteEnable            ;
    output  [3:0]                   oAddressLatchEnable     ;
    output  [3:0]                   oCommandLatchEnable     ;

    reg                           rReady                  ;
    reg                           rLastStep               ;

    reg   [NumberOfWays - 1:0]    rTargetWay              ;
    reg   [15:0]                  rNumOfData              ;

    reg                           rWriteReady             ;
    reg   [15:0]                  rWriteData              ;

    reg                           rDQSOutEnable           ;
    reg                           rDQOutEnable            ;
 
    reg  [7:0]                    rDQStrobe               ;
    reg  [31:0]                   rDQ                     ;
    reg  [2*NumberOfWays - 1:0]   rChipEnable             ;
    reg  [3:0]                    rReadEnable             ;
    reg  [3:0]                    rWriteEnable            ;
    reg  [3:0]                    rAddressLatchEnable     ;
    reg  [3:0]                    rCommandLatchEnable     ;

    reg  [15:0]                   rDOS_DataCounter        ;
    reg  [3:0]                    rDOS_TimeCounter        ;

 


    wire                          wtWPSTDone = (rDOS_TimeCounter == 4'd3) ? 1 : 0 ; // this is for tCAD
    wire                          wTimerDone = (rDOS_TimeCounter == 4'd1) ? 1 : 0 ;
    wire                          wTimerHalf = (rDOS_TimeCounter <= 4'd4) ? 1 : 0 ;
    wire                          wDOSDone   = (rDOS_DataCounter == rNumOfData) ? 1 : 0 ;

    wire  [31:0]                  wUperData  = {16'h00, iWriteData[15:8], iWriteData[15:8]};
    wire  [31:0]                  wDownData  = {16'h00, iWriteData[ 7:0], iWriteData[ 7:0]};

    localparam Write_Valid = 4'b0010;
    localparam Write_Idle  = 4'b0011;

    localparam Out_Enable  = 0;
    localparam Out_Disable = 1;
    
    // FSM Parameters/Wires/Regs
    localparam DOS_FSM_BIT = 8;
    localparam DOS_RESET = 8'b0000_0001;
    localparam DOS_READY = 8'b0000_0010; // Ready
    localparam DOS_LATCH = 8'b0000_0100; // Command/Address capture: first
    localparam DOS_tDQSS = 8'b0000_1000; // tDQSHZ
    localparam DOS_OST00 = 8'b0001_0000; // output data
    localparam DOS_OST01 = 8'b0010_0000; // output data
    localparam DOS_OST02 = 8'b0100_0000; // output data
    localparam DOS_OST03 = 8'b1000_0000; // output data

    reg     [DOS_FSM_BIT-1:0]       rDOS_cur_state          ;
    reg     [DOS_FSM_BIT-1:0]       rDOS_nxt_state          ;

    // reg [127:0] dbg_ascii_state;

    // always @* begin
    //     dbg_ascii_state = "";
    //     if (rDOS_cur_state == DOS_RESET) dbg_ascii_state = "RESET";
    //     if (rDOS_cur_state == DOS_READY) dbg_ascii_state = "READY";
    //     if (rDOS_cur_state == DOS_LATCH) dbg_ascii_state = "LATCH";
    //     if (rDOS_cur_state == DOS_tDQSS) dbg_ascii_state = "tDQSS";
    //     if (rDOS_cur_state == DOS_OST00) dbg_ascii_state = "OST00";
    //     if (rDOS_cur_state == DOS_OST01) dbg_ascii_state = "OST01";
    //     if (rDOS_cur_state == DOS_OST02) dbg_ascii_state = "OST02";
    //     if (rDOS_cur_state == DOS_OST03) dbg_ascii_state = "OST03";
    // end
    // FSM: Atom_Command_Sync
    
    // update current state to next state
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rDOS_cur_state <= DOS_RESET;
        end else begin
            rDOS_cur_state <= rDOS_nxt_state;
        end
    end
    
    // deside next state
    always @ ( * ) begin
        case (rDOS_cur_state)
            DOS_RESET: begin
                rDOS_nxt_state <= DOS_READY;
            end
            DOS_READY: begin
                rDOS_nxt_state <= (iStart)? DOS_LATCH:DOS_READY;
            end
            DOS_LATCH: begin
                rDOS_nxt_state <= DOS_tDQSS;
            end
            DOS_tDQSS: begin
                rDOS_nxt_state <= (wTimerDone)? DOS_OST00 : DOS_tDQSS; // 50ns
            end
            DOS_OST00: begin
                rDOS_nxt_state <= (iWriteValid) ? DOS_OST01 : DOS_OST00; // wait for Valid
            end
            DOS_OST01: begin
                rDOS_nxt_state <= (rWriteReady) ? DOS_OST02 : DOS_OST01; //latch Data
            end
            DOS_OST02: begin
                rDOS_nxt_state <= (wDOSDone) ? DOS_OST03 : ((iWriteValid) ? DOS_OST02 : DOS_OST00);// output
            end
            DOS_OST03: begin
                rDOS_nxt_state <= (rLastStep) ? DOS_READY : DOS_OST03;// finished
            end
            default:
                rDOS_nxt_state <= DOS_READY;
        endcase
    end

    // state behaviour
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rReady              <= 1'b0;
            rLastStep           <= 1'b0;

            rTargetWay          <= { NumberOfWays{1'b1} };
            rNumOfData          <= 16'h0;
            rWriteReady         <= 1'b0;
            rWriteData          <= 16'd0;
            
            rDQSOutEnable       <= Out_Enable;    
            rDQOutEnable        <= Out_Enable;

            rDQStrobe           <= 8'h0;
            rDQ                 <= 32'h0000;
            rChipEnable         <= { 2*NumberOfWays{1'b1} };
            rReadEnable         <= 4'b0011;
            rWriteEnable        <= Write_Idle;
            rAddressLatchEnable <= 4'h0;
            rCommandLatchEnable <= 4'h0; 

            rDOS_DataCounter    <= 4'd0;
            rDOS_TimeCounter    <= 4'd0;
        end else begin
            case (rDOS_nxt_state)
                DOS_RESET: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 16'h0;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 16'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOS_DataCounter    <= 4'd0;
                    rDOS_TimeCounter    <= 4'd0;
                end
                DOS_READY: begin
                    rReady              <= 1'b1;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 16'h0;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 16'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOS_DataCounter    <= 4'd0;
                    rDOS_TimeCounter    <= 4'd0;
                end
                DOS_LATCH: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= ~iTargetWay;
                    rNumOfData          <= iNumOfData;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 16'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDOS_DataCounter    <= 4'd0;
                    rDOS_TimeCounter    <= 4'd0;
                end
                DOS_tDQSS: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 16'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDOS_DataCounter    <= 4'd0;
                    rDOS_TimeCounter    <= (wTimerDone) ? 0 : rDOS_TimeCounter + 1;
                end
                DOS_OST00: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 16'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= rDQ;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDOS_DataCounter    <= rDOS_DataCounter;
                    rDOS_TimeCounter    <= 4'd0;
                end
                DOS_OST01: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b1;
                    rWriteData          <= 16'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= rDQ;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDOS_DataCounter    <= rDOS_DataCounter;
                    rDOS_TimeCounter    <= 4'd0;
                end
                DOS_OST02: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b1;
                    rWriteData          <= (rWriteReady) ? iWriteData : rWriteData;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'b0000_1100;
                    rDQ                 <= {{2{iWriteData[15:8]}}, {2{iWriteData[7:0]}}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0011;
                    rCommandLatchEnable <= 4'b0011;

                    rDOS_DataCounter    <= rDOS_DataCounter + 2;
                    rDOS_TimeCounter    <= 0; //(wTimerDone) ? 0 : rDOS_TimeCounter + 1;
                end
                DOS_OST03: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wtWPSTDone & wDOSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= rWriteData;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rDOS_DataCounter    <= rDOS_DataCounter;
                    rDOS_TimeCounter    <= rDOS_TimeCounter + 1;
                end
                default: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 16'h0;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 32'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOS_DataCounter    <= 4'd0;
                    rDOS_TimeCounter    <= 4'd0;
                end
            endcase
        end
    end

    reg  [7:0]                    rDQStrobe_m1            ;
    reg  [7:0]                    rDQStrobe_m2            ;
    reg  [7:0]                    rDQStrobe_m3            ;

    reg  [63:0]                   rDQ_m1                  ;
    reg  [63:0]                   rDQ_m2                  ;
    reg  [63:0]                   rDQ_m3                  ;

	always @(posedge iSystemClock) begin
		// if (iReset) begin
		// 	// reset
		// 	rDQStrobe_m1 <= 8'h00;
		// 	rDQStrobe_m2 <= 8'h00;
		// 	rDQ_m1 <= 64'd0;
		// 	rDQ_m2 <= 64'd0;
		// end
		// else begin
			rDQStrobe_m1 <= rDQStrobe;
			rDQStrobe_m2 <= rDQStrobe_m1;
            rDQStrobe_m3 <= rDQStrobe_m2;
			rDQ_m1 <= {32'd0, rDQ};
			rDQ_m2 <= rDQ_m1;
            rDQ_m3 <= rDQ_m2;
		// end
	end

    assign oReady              = rReady                  ;
    assign oLastStep           = rLastStep               ;

    assign oWriteReady         = rWriteReady             ;

    assign oDQSOutEnable       = rDQSOutEnable           ;   
    assign oDQOutEnable        = rDQOutEnable            ;   
    assign oDQStrobe           = rDQStrobe_m1            ;   
    assign oDQ                 = rDQ_m2[31:0]                  ;   
    assign oChipEnable         = rChipEnable             ;   
    assign oReadEnable         = rReadEnable             ;   
    assign oWriteEnable        = rWriteEnable            ;   
    assign oAddressLatchEnable = rAddressLatchEnable     ;   
    assign oCommandLatchEnable = rCommandLatchEnable     ;   
endmodule
