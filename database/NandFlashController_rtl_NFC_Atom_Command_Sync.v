// This program was cloned from: https://github.com/cjhonlyone/NandFlashController
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
module NFC_Atom_Command_Sync
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

    reg  [3:0]                    rACS_DataCounter        ;
    reg  [3:0]                    rACS_TimeCounter        ;

    reg                           rHalt                   ;


    wire                          wTimerDone = (rACS_TimeCounter == 4'd2) ? 1 : 0 ; // this is for tCAD
    wire                          wTimerD1   = (rACS_TimeCounter == 4'd1) ? 1 : 0 ; // this is for tCAD
    wire                          wACSDone   = (rACS_DataCounter == rNumOfData) ? 1 : 0 ;

    localparam Write_Valid = 4'b0010;
    localparam Write_Idle  = 4'b0011;

    localparam Out_Enable  = 0;
    localparam Out_Disable = 1;
    
    // FSM Parameters/Wires/Regs
    localparam ACS_FSM_BIT = 9;
    localparam ACS_RESET = 9'b0_0000_0001;
    localparam ACS_READY = 9'b0_0000_0010; // Ready
    localparam ACS_LATCH = 9'b0_0000_0100; // Command/Address capture: first
    localparam ACS_DQSHZ = 9'b0_0000_1000; // tCAD
    localparam ACS_OST00 = 9'b0_0001_0000; // output data
    localparam ACS_OST01 = 9'b0_0010_0000; // output data
    localparam ACS_OST02 = 9'b0_0100_0000; // output data
    localparam ACS_OST03 = 9'b0_1000_0000; // output data
    localparam ACS_OST04 = 9'b1_0000_0000; // output data

    reg     [ACS_FSM_BIT-1:0]       rACS_cur_state          ;
    reg     [ACS_FSM_BIT-1:0]       rACS_nxt_state          ;

    // FSM: Atom_Command_Sync
    
    // update current state to next state
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rACS_cur_state <= ACS_RESET;
        end else begin
            rACS_cur_state <= rACS_nxt_state;
        end
    end
    
    // deside next state
    always @ ( * ) begin
        case (rACS_cur_state)
            ACS_RESET: begin
                rACS_nxt_state <= ACS_READY;
            end
            ACS_READY: begin
                rACS_nxt_state <= (iStart)? ACS_LATCH:ACS_READY;
            end
            ACS_LATCH: begin
                rACS_nxt_state <= ACS_DQSHZ;
            end
            ACS_DQSHZ: begin
                rACS_nxt_state <= ACS_OST00 ; //(wTimerDone)? ACS_OST00:ACS_DQSHZ;
            end
            ACS_OST00: begin
                rACS_nxt_state <= (rLastStep) ? ACS_READY : (wTimerDone ? ACS_OST01 : ACS_OST00); // 100ns
            end
            ACS_OST01: begin
                rACS_nxt_state <= (rLastStep) ? ACS_READY : (wTimerDone ? ACS_OST02 : ACS_OST01);
            end
            ACS_OST02: begin
                rACS_nxt_state <= (rLastStep) ? ACS_READY : (wTimerDone ? ACS_OST03 : ACS_OST02);
            end
            ACS_OST03: begin
                rACS_nxt_state <= (rLastStep) ? ACS_READY : (wTimerDone ? ACS_OST04 : ACS_OST03);
            end
            ACS_OST04: begin
                rACS_nxt_state <= (rLastStep) ? ACS_READY : (wTimerDone ? ACS_READY : ACS_OST04);
            end
            default:
                rACS_nxt_state <= ACS_READY;
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
            rReadEnable         <= 4'h0;
            rWriteEnable        <= Write_Idle;
            rAddressLatchEnable <= 4'h0;
            rCommandLatchEnable <= 4'h0; 

            rACS_DataCounter    <= 4'd0;
            rACS_TimeCounter    <= 4'd0;
            rHalt               <= 0;
        end else begin
            case (rACS_nxt_state)
                ACS_RESET: begin
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
                    rReadEnable         <= 4'h0;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACS_DataCounter    <= 4'd0;
                    rACS_TimeCounter    <= 4'd0;
                    rHalt               <= 0;
                end
                ACS_READY: begin
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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACS_DataCounter    <= 4'd0;
                    rACS_TimeCounter    <= 4'd0;
                    rHalt               <= 0;
                end
                ACS_LATCH: begin
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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACS_DataCounter    <= 4'd0;
                    rACS_TimeCounter    <= 4'd0;
                    rHalt               <= 0;
                end
                ACS_DQSHZ: begin
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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= 4'b0000;
                    rCommandLatchEnable <= 4'b0000;

                    rACS_DataCounter    <= 4'd0;
                    rACS_TimeCounter    <= 0;
                    rHalt               <= 0;
                end
                ACS_OST00: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerD1 ? wACSDone : 0;

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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0000 : 4'b0011) : 4'b0000 ;
                    rCommandLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0011 : 4'b0000) : 4'b0000 ;

                    rACS_DataCounter    <= (wTimerDone) ? rACS_DataCounter + 1 : rACS_DataCounter;
                    rACS_TimeCounter    <= (wTimerDone) ? 0 : rACS_TimeCounter + 1;
                    rHalt               <= ~rHalt;
                end
                ACS_OST01: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerD1 ? wACSDone : 0;

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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0000 : 4'b0011) : 4'b0000 ;
                    rCommandLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0011 : 4'b0000) : 4'b0000 ;

                    rACS_DataCounter    <= (wTimerDone) ? rACS_DataCounter + 1 : rACS_DataCounter;
                    rACS_TimeCounter    <= (wTimerDone) ? 0 : rACS_TimeCounter + 1;
                    rHalt               <= ~rHalt;
                end
                ACS_OST02: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerD1 ? wACSDone : 0;

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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0000 : 4'b0011) : 4'b0000 ;
                    rCommandLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0011 : 4'b0000) : 4'b0000 ;

                    rACS_DataCounter    <= (wTimerDone) ? rACS_DataCounter + 1 : rACS_DataCounter;
                    rACS_TimeCounter    <= (wTimerDone) ? 0 : rACS_TimeCounter + 1;
                    rHalt               <= ~rHalt;
                end
                ACS_OST03: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerD1 ? wACSDone : 0;

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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0000 : 4'b0011) : 4'b0000 ;
                    rCommandLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0011 : 4'b0000) : 4'b0000 ;

                    rACS_DataCounter    <= (wTimerDone) ? rACS_DataCounter + 1 : rACS_DataCounter;
                    rACS_TimeCounter    <= (wTimerDone) ? 0 : rACS_TimeCounter + 1;
                    rHalt               <= ~rHalt;
                end
                ACS_OST04: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerD1 ? wACSDone : 0;

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
                    rWriteEnable        <= Write_Valid;
                    rAddressLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0000 : 4'b0011) : 4'b0000 ;
                    rCommandLatchEnable <= (rACS_TimeCounter == 0) ? ((rCASelect) ? 4'b0011 : 4'b0000) : 4'b0000 ;

                    rACS_DataCounter    <= (wTimerDone) ? rACS_DataCounter + 1 : rACS_DataCounter;
                    rACS_TimeCounter    <= (wTimerDone) ? 0 : rACS_TimeCounter + 1;
                    rHalt               <= ~rHalt;
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
                    rReadEnable         <= 4'h0;
                    rWriteEnable        <= Write_Idle;
                    rAddressLatchEnable <= 4'h0;
                    rCommandLatchEnable <= 4'h0; 

                    rACS_DataCounter    <= 4'd0;
                    rACS_TimeCounter    <= 4'd0;
                    rHalt               <= 4'd0;
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
