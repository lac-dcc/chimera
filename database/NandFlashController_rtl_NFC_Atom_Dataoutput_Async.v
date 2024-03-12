`timescale 1ns / 1ps
module NFC_Atom_Dataoutput_Async
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
    reg   [15:0]                   rNumOfData              ;

    reg                           rWriteReady             ;
    reg   [31:0]                  rWriteData              ;

    reg                           rDQSOutEnable           ;
    reg                           rDQOutEnable            ;
 
    reg  [7:0]                    rDQStrobe               ;
    reg  [31:0]                   rDQ                     ;
    reg  [2*NumberOfWays - 1:0]   rChipEnable             ;
    reg  [3:0]                    rReadEnable             ;
    reg  [3:0]                    rWriteEnable            ;
    reg  [3:0]                    rAddressLatchEnable     ;
    reg  [3:0]                    rCommandLatchEnable     ;

    reg  [15:0]                   rDOA_DataCounter        ;
    reg  [3:0]                    rDOA_TimeCounter        ;


    wire                          wTimerDone = (rDOA_TimeCounter == 4'd9) ? 1 : 0 ;
    wire                          wTimerHalf = (rDOA_TimeCounter <= 4'd4) ? 1 : 0 ;
    wire                          wDOADone   = (rDOA_DataCounter == rNumOfData) ? 1 : 0 ;

    wire  [31:0]                  wUperData  = {16'h00, iWriteData[15:8], iWriteData[15:8]};
    wire  [31:0]                  wDownData  = {16'h00, iWriteData[ 7:0], iWriteData[ 7:0]};

    localparam Write_Valid = 4'b0000;
    localparam Write_Idle  = 4'b0011;

    localparam Out_Enable  = 0;
    localparam Out_Disable = 1;
    
    // FSM Parameters/Wires/Regs
    localparam DOA_FSM_BIT = 9;
    localparam DOA_RESET = 9'b0_0000_0001;
    localparam DOA_READY = 9'b0_0000_0010; // Ready
    localparam DOA_LATCH = 9'b0_0000_0100; // Command/Address capture: first
    localparam DOA_tCSSS = 9'b0_0000_1000; // tDQSHZ
    localparam DOA_OST00 = 9'b0_0001_0000; // output data
    localparam DOA_OST01 = 9'b0_0010_0000; // output data
    localparam DOA_OST02 = 9'b0_0100_0000; // output data
    localparam DOA_OST03 = 9'b0_1000_0000; // output data
    localparam DOA_OST04 = 9'b1_0000_0000; // output data

    reg     [DOA_FSM_BIT-1:0]       rDOA_cur_state          ;
    reg     [DOA_FSM_BIT-1:0]       rDOA_nxt_state          ;

    reg [127:0] dbg_ascii_state;

    always @* begin
        dbg_ascii_state = "";
        if (rDOA_cur_state == DOA_RESET) dbg_ascii_state = "RESET";
        if (rDOA_cur_state == DOA_READY) dbg_ascii_state = "READY";
        if (rDOA_cur_state == DOA_LATCH) dbg_ascii_state = "LATCH";
        if (rDOA_cur_state == DOA_tCSSS) dbg_ascii_state = "tCSSS";
        if (rDOA_cur_state == DOA_OST00) dbg_ascii_state = "OST00";
        if (rDOA_cur_state == DOA_OST01) dbg_ascii_state = "OST01";
        if (rDOA_cur_state == DOA_OST02) dbg_ascii_state = "OST02";
        if (rDOA_cur_state == DOA_OST03) dbg_ascii_state = "OST03";
    end
    // FSM: Atom_Command_Sync
    
    // update current state to next state
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rDOA_cur_state <= DOA_RESET;
        end else begin
            rDOA_cur_state <= rDOA_nxt_state;
        end
    end
    
    // deside next state
    always @ ( * ) begin
        case (rDOA_cur_state)
            DOA_RESET: begin
                rDOA_nxt_state <= DOA_READY;
            end
            DOA_READY: begin
                rDOA_nxt_state <= (iStart)? DOA_LATCH:DOA_READY;
            end
            DOA_LATCH: begin
                rDOA_nxt_state <= DOA_tCSSS;
            end
            DOA_tCSSS: begin
                rDOA_nxt_state <= (wTimerDone)? DOA_OST00 : DOA_tCSSS; // 50ns
            end
            DOA_OST00: begin
                rDOA_nxt_state <= (iWriteValid) ? DOA_OST01 : DOA_OST00; // wait for Valid
            end
            DOA_OST01: begin
                rDOA_nxt_state <= (rWriteReady) ? DOA_OST02 : DOA_OST01; //latch Data
            end
            DOA_OST02: begin
                rDOA_nxt_state <= (wTimerDone) ? ((wDOADone) ? DOA_OST04 : DOA_OST03) : DOA_OST02 ;// output [15:8]
            end
            DOA_OST03: begin
                rDOA_nxt_state <= (wTimerDone) ? ((wDOADone) ? DOA_OST04 : DOA_OST00) : DOA_OST03 ;// output [ 7:0]
            end
            DOA_OST04: begin
                rDOA_nxt_state <= (rLastStep) ? DOA_READY : DOA_OST04;
            end
            default:
                rDOA_nxt_state <= DOA_READY;
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

            rDOA_DataCounter    <= 4'd0;
            rDOA_TimeCounter    <= 4'd0;
        end else begin
            case (rDOA_nxt_state)
                DOA_RESET: begin
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

                    rDOA_DataCounter    <= 4'd0;
                    rDOA_TimeCounter    <= 4'd0;
                end
                DOA_READY: begin
                    rReady              <= 1'b1;
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

                    rDOA_DataCounter    <= 4'd0;
                    rDOA_TimeCounter    <= 4'd0;
                end
                DOA_LATCH: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= ~iTargetWay;
                    rNumOfData          <= iNumOfData;
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

                    rDOA_DataCounter    <= 4'd0;
                    rDOA_TimeCounter    <= 4'd0;
                end
                DOA_tCSSS: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 32'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOA_DataCounter    <= 4'd0;
                    rDOA_TimeCounter    <= (wTimerDone) ? 0 : rDOA_TimeCounter + 1;
                end
                DOA_OST00: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= 32'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= rDQ;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOA_DataCounter    <= rDOA_DataCounter;
                    rDOA_TimeCounter    <= 4'd0;
                end
                DOA_OST01: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wDOADone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b1;
                    rWriteData          <= 32'd0;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= rDQ;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOA_DataCounter    <= rDOA_DataCounter;
                    rDOA_TimeCounter    <= 4'd0;
                end
                DOA_OST02: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wDOADone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteReady         <= 1'b0;
                    rWriteData          <= (rWriteReady) ? iWriteData : rWriteData;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {4{rWriteData[15:8]}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (rDOA_TimeCounter <= 4'd4) ? Write_Valid :Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOA_DataCounter    <= (rDOA_TimeCounter == 4'd4) ? rDOA_DataCounter + 1 : rDOA_DataCounter ;
                    rDOA_TimeCounter    <= (wTimerDone) ? 0 : rDOA_TimeCounter + 1;
                end
                DOA_OST03: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wDOADone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rWriteData          <= rWriteData;

                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {4{rWriteData[7:0]}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (rDOA_TimeCounter <= 4'd4) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rDOA_DataCounter    <= (rDOA_TimeCounter == 4'd4) ? rDOA_DataCounter + 1 : rDOA_DataCounter ;
                    rDOA_TimeCounter    <= (wTimerDone) ? 0 : rDOA_TimeCounter + 1;
                end
                DOA_OST04: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wDOADone;

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

                    rDOA_DataCounter    <= 4'd0;
                    rDOA_TimeCounter    <= 4'd0;
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

                    rDOA_DataCounter    <= 4'd0;
                    rDOA_TimeCounter    <= 4'd0;
                end
            endcase
        end
    end

    assign oReady              = rReady                  ;
    assign oLastStep           = rLastStep               ;

    assign oWriteReady         = rWriteReady             ;

    assign oDQSOutEnable       = rDQSOutEnable           ;   
    assign oDQOutEnable        = rDQOutEnable            ;   
    assign oDQStrobe           = rDQStrobe               ;   
    assign oDQ                 = rDQ                     ;   
    assign oChipEnable         = rChipEnable             ;   
    assign oReadEnable         = rReadEnable             ;   
    assign oWriteEnable        = rWriteEnable            ;   
    assign oAddressLatchEnable = rAddressLatchEnable     ;   
    assign oCommandLatchEnable = rCommandLatchEnable     ;   
endmodule