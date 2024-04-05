`timescale 1ns / 1ps
module NFC_Atom_Datainput_Async
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

    reg                           rDQSOutEnable           ;
    reg                           rDQOutEnable            ;
 
    reg  [7:0]                    rDQStrobe               ;
    reg  [31:0]                   rDQ                     ;
    reg  [2*NumberOfWays - 1:0]   rChipEnable             ;
    reg  [3:0]                    rReadEnable             ;
    reg  [3:0]                    rWriteEnable            ;
    reg  [3:0]                    rAddressLatchEnable     ;
    reg  [3:0]                    rCommandLatchEnable     ;

    reg  [15:0]                   rDIA_DataCounter        ;
    reg  [3:0]                    rDIA_TimeCounter        ;


    wire                          wTimerDone = (rDIA_TimeCounter == 4'd9) ? 1 : 0 ;
    wire                          wTimerHalf = (rDIA_TimeCounter == 4'd4) ? 1 : 0 ;
    wire                          wACSDone   = (rDIA_DataCounter == rNumOfData) ? 1 : 0 ;

    localparam Write_Valid = 4'b0000;
    localparam Write_Idle  = 4'b0011;

    localparam Out_Enable  = 0;
    localparam Out_Disable = 1;
    
    // FSM Parameters/Wires/Regs
    localparam DIA_FSM_BIT = 9;
    localparam DIA_RESET = 9'b0_0000_0001;
    localparam DIA_READY = 9'b0_0000_0010; // Ready
    localparam DIA_LATCH = 9'b0_0000_0100; // Command/Address capture: first
    localparam DIA_tCSSS = 9'b0_0000_1000; // tDQSHZ
    localparam DIA_OST00 = 9'b0_0001_0000; // output data
    localparam DIA_OST01 = 9'b0_0010_0000; // output data
    localparam DIA_OST02 = 9'b0_0100_0000; // output data
    localparam DIA_OST03 = 9'b0_1000_0000; // output data
    localparam DIA_OST04 = 9'b1_0000_0000; // output data

    reg     [DIA_FSM_BIT-1:0]       rDIA_cur_state          ;
    reg     [DIA_FSM_BIT-1:0]       rDIA_nxt_state          ;

    // FSM: Atom_Command_Sync
    
    // update current state to next state
    always @ (posedge iSystemClock) begin
        if (iReset) begin
            rDIA_cur_state <= DIA_RESET;
        end else begin
            rDIA_cur_state <= rDIA_nxt_state;
        end
    end
    
    // deside next state
    always @ ( * ) begin
        case (rDIA_cur_state)
            DIA_RESET: begin
                rDIA_nxt_state <= DIA_READY;
            end
            DIA_READY: begin
                rDIA_nxt_state <= (iStart)? DIA_LATCH:DIA_READY;
            end
            DIA_LATCH: begin
                rDIA_nxt_state <= DIA_tCSSS;
            end
            DIA_tCSSS: begin
                rDIA_nxt_state <= (wTimerDone)? DIA_OST00:DIA_tCSSS; // 50ns
            end
            DIA_OST00: begin
                rDIA_nxt_state <= (rLastStep) ? DIA_READY : ((wTimerDone)? DIA_OST01:DIA_OST00); // 100ns
            end
            DIA_OST01: begin
                rDIA_nxt_state <= (rLastStep) ? DIA_READY : ((wTimerDone)? DIA_OST02:DIA_OST01);
            end
            DIA_OST02: begin
                rDIA_nxt_state <= (rLastStep) ? DIA_READY : ((wTimerDone)? DIA_OST03:DIA_OST02);
            end
            DIA_OST03: begin
                rDIA_nxt_state <= (rLastStep) ? DIA_READY : ((wTimerDone)? DIA_OST04:DIA_OST03);
            end
            DIA_OST04: begin
                rDIA_nxt_state <= (rLastStep) ? DIA_READY : ((wTimerDone)? DIA_READY:DIA_OST04);
            end
            default:
                rDIA_nxt_state <= DIA_READY;
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

            rDIA_DataCounter    <= 4'd0;
            rDIA_TimeCounter    <= 4'd0;
        end else begin
            case (rDIA_nxt_state)
                DIA_RESET: begin
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

                    rDIA_DataCounter    <= 4'd0;
                    rDIA_TimeCounter    <= 4'd0;
                end
                DIA_READY: begin
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

                    rDIA_DataCounter    <= 4'd0;
                    rDIA_TimeCounter    <= 4'd0;
                end
                DIA_LATCH: begin
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

                    rDIA_DataCounter    <= 4'd0;
                    rDIA_TimeCounter    <= 4'd0;
                end
                DIA_tCSSS: begin
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

                    rDIA_DataCounter    <= 4'd0;
                    rDIA_TimeCounter    <= (wTimerDone) ? 0 : rDIA_TimeCounter + 1;
                end
                DIA_OST00: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {16'h00, rCAData[39:32],rCAData[39:32]};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (wTimerHalf) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rDIA_DataCounter    <= (wTimerDone) ? rDIA_DataCounter + 1 : rDIA_DataCounter ;
                    rDIA_TimeCounter    <= (wTimerDone) ? 0 : rDIA_TimeCounter + 1;
                end
                DIA_OST01: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {16'h00, rCAData[31:24],rCAData[31:24]};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (wTimerHalf) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rDIA_DataCounter    <= (wTimerDone) ? rDIA_DataCounter + 1 : rDIA_DataCounter ;
                    rDIA_TimeCounter    <= (wTimerDone) ? 0 : rDIA_TimeCounter + 1;
                end
                DIA_OST02: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {16'h00, rCAData[23:16],rCAData[23:16]};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (wTimerHalf) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rDIA_DataCounter    <= (wTimerDone) ? rDIA_DataCounter + 1 : rDIA_DataCounter ;
                    rDIA_TimeCounter    <= (wTimerDone) ? 0 : rDIA_TimeCounter + 1;
                end
                DIA_OST03: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {16'h00, rCAData[15:8],rCAData[15:8]};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (wTimerHalf) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rDIA_DataCounter    <= (wTimerDone) ? rDIA_DataCounter + 1 : rDIA_DataCounter ;
                    rDIA_TimeCounter    <= (wTimerDone) ? 0 : rDIA_TimeCounter + 1;
                end
                DIA_OST04: begin
                    rReady              <= 1'b0;
                    rLastStep           <= wTimerDone & wACSDone;

                    rTargetWay          <= rTargetWay;
                    rNumOfData          <= rNumOfData;
                    rCASelect           <= rCASelect ;
                    rCAData             <= rCAData   ;
                    
                    rDQSOutEnable       <= Out_Enable;    
                    rDQOutEnable        <= Out_Enable;

                    rDQStrobe           <= 8'h0;
                    rDQ                 <= {16'h00, rCAData[7:0],rCAData[7:0]};
                    rChipEnable         <= {rTargetWay ,rTargetWay};
                    rReadEnable         <= 4'b0011;
                    rWriteEnable        <= (wTimerHalf) ? Write_Valid : Write_Idle;
                    rAddressLatchEnable <= (rCASelect) ? 4'b0000 : 4'b0011;
                    rCommandLatchEnable <= (rCASelect) ? 4'b0011 : 4'b0000;

                    rDIA_DataCounter    <= (wTimerDone) ? rDIA_DataCounter + 1 : rDIA_DataCounter ;
                    rDIA_TimeCounter    <= (wTimerDone) ? 0 : rDIA_TimeCounter + 1;
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

                    rDIA_DataCounter    <= 4'd0;
                    rDIA_TimeCounter    <= 4'd0;
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
