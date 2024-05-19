// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
module NFC_Atom_Command_Async
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
    iCASelect               ,
    iCAData                 ,

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
    input   [3:0]                   iNumOfData              ;
    input                           iCASelect               ;
    input   [39:0]                  iCAData                 ;

    output                          oDQSOutEnable           ;
    output                          oDQOutEnable            ;

    output  [7:0]                   oDQStrobe               ;
    output  [31:0]                  oDQ                     ;
    output  [2*NumberOfWays - 1:0]  oChipEnable             ;
    output  [3:0]                   oReadEnable             ;
    output  [3:0]                   oWriteEnable            ;
    output  [3:0]                   oAddressLatchEnable     ;
    output  [3:0]                   oCommandLatchEnable     ;

    // FSM
    // IDLE
    // capture CAData
    // output command or address

    reg                           rReady                  ;
    reg                           rLastStep               ;

    reg   [NumberOfWays - 1:0]    rTargetWay              ;
    reg   [3:0]                   rNumOfData              ;
    reg                           rCASelect               ;
    reg   [39:0]                  rCAData                 ;

    reg                           rDQSOutEnable           ;
    reg                           rDQOutEnable            ;
 
    reg  [7:0]                    rDQStrobe               ;
    reg  [31:0]                   rDQ                     ;
    reg  [2*NumberOfWays - 1:0]   rChipEnable             ;
    reg  [3:0]                    rReadEnable             ;
    reg  [3:0]                    rWriteEnable            ;
    reg  [3:0]                    rAddressLatchEnable     ;
    reg  [3:0]                    rCommandLatchEnable     ;

    reg  [3:0]                    rACA_DataCounter        ;
    reg  [3:0]                    rACA_TimeCounter        ;


    wire                          wTimerDone = (rACA_TimeCounter == 4'd9) ? 1 : 0 ;
    wire                          wTimerHalf = (rACA_TimeCounter == 4'd4) ? 1 : 0 ;
    wire                          wACSDone   = (rACA_DataCounter == rNumOfData) ? 1 : 0 ;

    localparam Write_Valid = 4'b0000;
    localparam Write_Idle  = 4'b0011;

    localparam Out_Enable  = 0;
    localparam Out_Disable = 1;

    // FSM Parameters/Wires/Regs
    localparam ACA_FSM_BIT = 9;
    localparam ACA_RESET = 9'b0_0000_0001;
    localparam ACA_READY = 9'b0_0000_0010; // Ready
    localparam ACA_LATCH = 9'b0_0000_0100; // Command/Address capture: first
    localparam ACA_tCSSS = 9'b0_0000_1000; // tDQSHZ
    localparam ACA_OST00 = 9'b0_0001_0000; // output data
    localparam ACA_OST01 = 9'b0_0010_0000; // output data
    localparam ACA_OST02 = 9'b0_0100_0000; // output data
    localparam ACA_OST03 = 9'b0_1000_0000; // output data
    localparam ACA_OST04 = 9'b1_0000_0000; // output data

    reg     [ACA_FSM_BIT-1:0]       rACA_cur_state          ;
    reg     [ACA_FSM_BIT-1:0]       rACA_nxt_state          ;

    // FSM: Atom_Command_Sync
    
    // update current state to next state
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rACA_cur_state <= ACA_RESET;
        end else begin
            rACA_cur_state <= rACA_nxt_state;
        end
    end
    
    // deside next state
    always @ ( * ) begin
        case (rACA_cur_state)
            ACA_RESET: begin
                rACA_nxt_state <= ACA_READY;
            end
            ACA_READY: begin
                rACA_nxt_state <= (iStart)? ACA_LATCH:ACA_READY;
            end
            ACA_LATCH: begin
                rACA_nxt_state <= ACA_tCSSS;
            end
            ACA_tCSSS: begin
                rACA_nxt_state <= (wTimerDone)? ACA_OST00:ACA_tCSSS; // 50ns
            end
            ACA_OST00: begin
                rACA_nxt_state <= (rLastStep) ? ACA_READY : ((wTimerDone)? ACA_OST01:ACA_OST00); // 100ns
            end
            ACA_OST01: begin
                rACA_nxt_state <= (rLastStep) ? ACA_READY : ((wTimerDone)? ACA_OST02:ACA_OST01);
            end
            ACA_OST02: begin
                rACA_nxt_state <= (rLastStep) ? ACA_READY : ((wTimerDone)? ACA_OST03:ACA_OST02);
            end
            ACA_OST03: begin
                rACA_nxt_state <= (rLastStep) ? ACA_READY : ((wTimerDone)? ACA_OST04:ACA_OST03);
            end
            ACA_OST04: begin
                rACA_nxt_state <= (rLastStep) ? ACA_READY : ((wTimerDone)? ACA_READY:ACA_OST04);
            end
            default:
                rACA_nxt_state <= ACA_READY;
        endcase
    end

    // state behaviour
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rReady              <= 1'b0;
            rLastStep           <= 1'b0;

            rTargetWay          <= { NumberOfWays{1'b1} };
            rNumOfData          <= 4'h0;
            rCASelect           <= 1'b0;
            rCAData             <= 40'h00_00_00_00_00;
            
            rDQSOutEnable       <= Out_Enable;    
            rDQOutEnable        <= Out_Enable;

            rDQStrobe           <= 8'h0;
            rDQ                 <= 32'h0000;
            rChipEnable         <= { 2*NumberOfWays{1'b1} };
            rReadEnable         <= 4'b0011;
            rWriteEnable        <= Write_Idle;
            rAddressLatchEnable <= 4'h0;
            rCommandLatchEnable <= 4'h0; 

            rACA_DataCounter    <= 4'd0;
            rACA_TimeCounter    <= 4'd0;
        end else begin
            case (rACA_nxt_state)
                ACA_RESET: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 4'h0;
                    rCASelect           <= 1'b0;
                    rCAData             <= 40'h00_00_00_00_00;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
		            rReadEnable         <= 4'b0011;
		            rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACA_DataCounter    <= 4'd0;
                    rACA_TimeCounter    <= 4'd0;
                end
                ACA_READY: begin
                    rReady              <= 1'b1;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 4'h0;
                    rCASelect           <= 1'b0;
                    rCAData             <= 40'h00_00_00_00_00;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
		            rReadEnable         <= 4'b0011;
		            rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACA_DataCounter    <= 4'd0;
                    rACA_TimeCounter    <= 4'd0;
                end
                ACA_LATCH: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= ~iTargetWay;
                    rNumOfData          <= iNumOfData;
                    rCASelect           <= iCASelect ;
                    rCAData             <= iCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
		            rReadEnable         <= 4'b0011;
		            rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACA_DataCounter    <= 4'd0;
                    rACA_TimeCounter    <= 4'd0;
                end
                ACA_tCSSS: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rACA_DataCounter    <= 4'd0;
                    rACA_TimeCounter    <= (wTimerDone) ? 0 : rACA_TimeCounter + 1;
                end
                ACA_OST00: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {4{rCAData[39:32]}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (rACA_TimeCounter <= 4'd4) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rACA_DataCounter    <= (wTimerDone) ? rACA_DataCounter + 1 : rACA_DataCounter ;
                    rACA_TimeCounter    <= (wTimerDone) ? 0 : rACA_TimeCounter + 1;
                end
                ACA_OST01: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {4{rCAData[31:24]}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (rACA_TimeCounter <= 4'd4) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rACA_DataCounter    <= (wTimerDone) ? rACA_DataCounter + 1 : rACA_DataCounter ;
                    rACA_TimeCounter    <= (wTimerDone) ? 0 : rACA_TimeCounter + 1;
                end
                ACA_OST02: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {4{rCAData[23:16]}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (rACA_TimeCounter <= 4'd4) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rACA_DataCounter    <= (wTimerDone) ? rACA_DataCounter + 1 : rACA_DataCounter ;
                    rACA_TimeCounter    <= (wTimerDone) ? 0 : rACA_TimeCounter + 1;
                end
                ACA_OST03: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {4{rCAData[15:8]}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (rACA_TimeCounter <= 4'd4) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rACA_DataCounter    <= (wTimerDone) ? rACA_DataCounter + 1 : rACA_DataCounter ;
                    rACA_TimeCounter    <= (wTimerDone) ? 0 : rACA_TimeCounter + 1;
                end
                ACA_OST04: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {4{rCAData[7:0]}};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (rACA_TimeCounter <= 4'd4) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rACA_DataCounter    <= (wTimerDone) ? rACA_DataCounter + 1 : rACA_DataCounter ;
                    rACA_TimeCounter    <= (wTimerDone) ? 0 : rACA_TimeCounter + 1;
                end
                default: begin
                    rReady              <= 1'b0;
                    rLastStep           <= 1'b0;
                    rTargetWay          <= { NumberOfWays{1'b1} };
                    rNumOfData          <= 4'h0;
                    rCASelect           <= 1'b0;
                    rCAData             <= 40'h00_00_00_00_00;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= 32'h0000;
                    rChipEnable         <= { 2*NumberOfWays{1'b1} };
		            rReadEnable         <= 4'b0011;
		            rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACA_DataCounter    <= 4'd0;
                    rACA_TimeCounter    <= 4'd0;
                end
            endcase
        end
    end

    assign oReady              = rReady                  ;
    assign oLastStep           = rLastStep               ;

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
