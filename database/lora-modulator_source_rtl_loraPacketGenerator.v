// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"
`include "RadioDefines.v"

module loraPacketGenerator(
input                               clk,
input                               clkLock,
input                               rst,
input                               symDone,
output reg  [`SF_SELECT_SIZE-1:0]   SF_select,
output reg  [`BW_SELECT_SIZE-1:0]	BW_select,
(* syn_preserve = "TRUE" *) output reg  [`SYMBOL_PRECISION-1:0] symVal,
output reg  [`CHIRP_TYPE_SIZE-1:0]  symType,
output reg                          chirpReset
);

//Counters
reg [`DATA_PRECISION-1:0] preambleCounter;
reg [`DATA_PRECISION-1:0] payloadCounter;

//symbol type and value
reg [`SYMBOL_PRECISION-1:0] next_symVal;
reg [`CHIRP_TYPE_SIZE-1:0]  next_symType;

/*** States ***/
parameter [`STATE_SIZE-1:0] STATE_PREAMBLE = `STATE_SIZE'd0, STATE_SYNC_0 = `STATE_SIZE'd1, STATE_SYNC_1 = `STATE_SIZE'd2, 
STATE_DOWNCHIRP_0 = `STATE_SIZE'd3, STATE_DOWNCHIRP_1 = `STATE_SIZE'd4, STATE_QDOWNCHIRP = `STATE_SIZE'd5, STATE_PAYLOAD = `STATE_SIZE'd6, 
STATE_DONE = `STATE_SIZE'd7, STATE_CONST0 = `STATE_SIZE'd8, STATE_CONST1 = `STATE_SIZE'd9;

reg [`STATE_SIZE-1:0] current_state;
reg [`STATE_SIZE-1:0] next_state;

//TopModule Regs and Wires

//peamble, downchip and payload
reg [`SYMBOL_PRECISION-1:0] preambleSym;
reg [`SYMBOL_PRECISION-1:0] downSym;
reg [`DATA_PRECISION-1:0]	payloadSize;
reg [`DATA_PRECISION-1:0]	preambleSize;
reg [`SYMBOL_PRECISION-1:0] symbols [17:0];

//parameters
parameter   VSS = 1'b0;
parameter   VCC = 1'b1;
//########################################################################################
/*** Assign BW and SF ***/
always @(posedge clk) begin
    SF_select   = `SF_SELECT_8;
    BW_select   = `BW_SELECT_250;
end

/*
*   Assign preambe and payload size
*/
always @(posedge clk) begin
    preambleSize    = `DATA_PRECISION'd8;
    payloadSize     = `DATA_PRECISION'd16;
end

/*
*   Assign preambe and downchirp
*/
always @(SF_select) begin
    //preambleSym = (1 << (12 - SF_select - 1)) + 1;
    //downSym     = (1 << (12 - SF_select - 1)) + 1;

    //new version, corrected
    preambleSym = `SYMBOL_PRECISION'd0;

    case (SF_select)
        `SF_SELECT_12: begin
            //wrong
            downSym = `SYMBOL_PRECISION'd4079;
        end
        `SF_SELECT_11: begin
            //wrong
            downSym = `SYMBOL_PRECISION'd4079;
        end
        `SF_SELECT_10: begin
            //wrong
            downSym = `SYMBOL_PRECISION'd4079;
        end
        `SF_SELECT_9: begin
            //wrong
            downSym = `SYMBOL_PRECISION'd4079;
        end
        `SF_SELECT_8: begin
            downSym = `SYMBOL_PRECISION'd254;
        end
        `SF_SELECT_7: begin
            //wrong
            downSym = `SYMBOL_PRECISION'd4079;
        end
        default: begin
            downSym = `SYMBOL_PRECISION'd4079;
        end
    endcase
end

/*** Update State ***/
always @(posedge clk) begin
    current_state       <= next_state;
    symVal              <= next_symVal;
    symType             <= next_symType;
end

/*** Preamble Counter and payload counter***/
always @(posedge clk) begin
    if (clkLock == VCC) begin
        if (rst == VSS) begin
            preambleCounter	<=	`DATA_PRECISION'd0;
            payloadCounter	<=	`DATA_PRECISION'd0;
        end else begin
            if (symDone) begin
                if (current_state == STATE_PREAMBLE) begin
                    preambleCounter <= preambleCounter + `DATA_PRECISION'd1;
                end else begin
                    preambleCounter	<=	`DATA_PRECISION'd0;
                end
                if (current_state == STATE_PAYLOAD) begin
                    payloadCounter  <= payloadCounter + `DATA_PRECISION'd1;
                end else begin
                    payloadCounter  <= `DATA_PRECISION'd0;
                end
            end else begin
                preambleCounter     <= preambleCounter;
                payloadCounter      <= payloadCounter;
            end
        end
    end
end

/**
*   symbol selection
*/
always @(SF_select) begin
    case (SF_select)
        `SF_SELECT_12: begin
            ////sync symbols
            //symbols[0]	= `SYMBOL_PRECISION'd2057;
            //symbols[1]	= `SYMBOL_PRECISION'd2065;
            ////payload symbols
            //symbols[2]	= `SYMBOL_PRECISION'd2555;
            //symbols[3]	= `SYMBOL_PRECISION'd2635;
            //symbols[4]	= `SYMBOL_PRECISION'd399;
            //symbols[5]	= `SYMBOL_PRECISION'd1003;
            //symbols[6]	= `SYMBOL_PRECISION'd55;
            //symbols[7]	= `SYMBOL_PRECISION'd2543;
            //symbols[8]	= `SYMBOL_PRECISION'd3051;
            //symbols[9]	= `SYMBOL_PRECISION'd3279;
//
            //symbols[10]	= `SYMBOL_PRECISION'd0;
            //symbols[11]	= `SYMBOL_PRECISION'd0;
            //symbols[12]	= `SYMBOL_PRECISION'd0;
            //symbols[13]	= `SYMBOL_PRECISION'd0;
            //symbols[14]	= `SYMBOL_PRECISION'd0;
            //symbols[15]	= `SYMBOL_PRECISION'd0;
            //symbols[16]	= `SYMBOL_PRECISION'd0;
            //symbols[17]	= `SYMBOL_PRECISION'd0;
            
            //new version, not correct
            //sync symbols
            symbols[0]	= `SYMBOL_PRECISION'd8;
            symbols[1]	= `SYMBOL_PRECISION'd16;
            //payload symbols
            symbols[2]	= `SYMBOL_PRECISION'd488;
            symbols[3]	= `SYMBOL_PRECISION'd568;
            symbols[4]	= `SYMBOL_PRECISION'd2427;
            symbols[5]	= `SYMBOL_PRECISION'd3032;
            symbols[6]	= `SYMBOL_PRECISION'd2083;
            symbols[7]	= `SYMBOL_PRECISION'd476;
            symbols[8]	= `SYMBOL_PRECISION'd984;
            symbols[9]	= `SYMBOL_PRECISION'd1211;

            symbols[10]	= `SYMBOL_PRECISION'd0;
            symbols[11]	= `SYMBOL_PRECISION'd0;
            symbols[12]	= `SYMBOL_PRECISION'd0;
            symbols[13]	= `SYMBOL_PRECISION'd0;
            symbols[14]	= `SYMBOL_PRECISION'd0;
            symbols[15]	= `SYMBOL_PRECISION'd0;
            symbols[16]	= `SYMBOL_PRECISION'd0;
            symbols[17]	= `SYMBOL_PRECISION'd0;
        end
        `SF_SELECT_11: begin
            //sync symbols
            symbols[0]	= `SYMBOL_PRECISION'd1033;
            symbols[1]	= `SYMBOL_PRECISION'd1041;
			//payload symbols
			symbols[2]	= `SYMBOL_PRECISION'd1530;
			symbols[3]	= `SYMBOL_PRECISION'd1610;
			symbols[4]	= `SYMBOL_PRECISION'd398;
            symbols[5]	= `SYMBOL_PRECISION'd490;
            symbols[6]	= `SYMBOL_PRECISION'd54;
            symbols[7]	= `SYMBOL_PRECISION'd1262;
            symbols[8]	= `SYMBOL_PRECISION'd1514;
            symbols[9]	= `SYMBOL_PRECISION'd1646;
            symbols[10]	= `SYMBOL_PRECISION'd578;
            symbols[11]	= `SYMBOL_PRECISION'd1207;
            symbols[12]	= `SYMBOL_PRECISION'd543;
            symbols[13]	= `SYMBOL_PRECISION'd153;
            symbols[14]	= `SYMBOL_PRECISION'd1036;
            symbols[15]	= `SYMBOL_PRECISION'd751;
            symbols[16]	= `SYMBOL_PRECISION'd1552;
            symbols[17]	= `SYMBOL_PRECISION'd780;
        end
        `SF_SELECT_10: begin
            //sync symbols
            symbols[0]	= `SYMBOL_PRECISION'd521;
            symbols[1]	= `SYMBOL_PRECISION'd529;
            //payload symbols
            symbols[2]	= `SYMBOL_PRECISION'd1019;
            symbols[3]	= `SYMBOL_PRECISION'd951;
            symbols[4]	= `SYMBOL_PRECISION'd115;
            symbols[5]	= `SYMBOL_PRECISION'd234;
            symbols[6]	= `SYMBOL_PRECISION'd55;
            symbols[7]	= `SYMBOL_PRECISION'd622;
            symbols[8]	= `SYMBOL_PRECISION'd757;
            symbols[9]	= `SYMBOL_PRECISION'd819;
            symbols[10]	= `SYMBOL_PRECISION'd385;
            symbols[11]	= `SYMBOL_PRECISION'd149;
            symbols[12]	= `SYMBOL_PRECISION'd966;
            symbols[13]	= `SYMBOL_PRECISION'd467;
            symbols[14]	= `SYMBOL_PRECISION'd534;
            symbols[15]	= `SYMBOL_PRECISION'd795;
            symbols[16]	= `SYMBOL_PRECISION'd29;
            symbols[17]	= `SYMBOL_PRECISION'd758;     
        end
        `SF_SELECT_9: begin
            //sync symbols
            symbols[0]	= `SYMBOL_PRECISION'd265;
            symbols[1]	= `SYMBOL_PRECISION'd273;
            //payload symbols
            symbols[2]	= `SYMBOL_PRECISION'd250;
            symbols[3]	= `SYMBOL_PRECISION'd330;
            symbols[4]	= `SYMBOL_PRECISION'd114;
            symbols[5]	= `SYMBOL_PRECISION'd106;
            symbols[6]	= `SYMBOL_PRECISION'd11;
            symbols[7]	= `SYMBOL_PRECISION'd306;
            symbols[8]	= `SYMBOL_PRECISION'd378;
            symbols[9]	= `SYMBOL_PRECISION'd411;
            symbols[10]	= `SYMBOL_PRECISION'd3;
            symbols[11]	= `SYMBOL_PRECISION'd44;
            symbols[12]	= `SYMBOL_PRECISION'd141;
            symbols[13]	= `SYMBOL_PRECISION'd292;
            symbols[14]	= `SYMBOL_PRECISION'd298;
            symbols[15]	= `SYMBOL_PRECISION'd23;
            symbols[16]	= `SYMBOL_PRECISION'd235;
            symbols[17]	= `SYMBOL_PRECISION'd502;
        end
        `SF_SELECT_8: begin
            ////sync symbols
            //symbols[0]	= `SYMBOL_PRECISION'd137;
            //symbols[1]	= `SYMBOL_PRECISION'd145;
            ////payload symbols
            //symbols[2]	= `SYMBOL_PRECISION'd134;
            //symbols[3]	= `SYMBOL_PRECISION'd202;
            //symbols[4]	= `SYMBOL_PRECISION'd13;
            //symbols[5]	= `SYMBOL_PRECISION'd41;
            //symbols[6]	= `SYMBOL_PRECISION'd9;
            //symbols[7]	= `SYMBOL_PRECISION'd158;
            //symbols[8]	= `SYMBOL_PRECISION'd190;
            //symbols[9]	= `SYMBOL_PRECISION'd50;
            //symbols[10]	= `SYMBOL_PRECISION'd131;
            //symbols[11]	= `SYMBOL_PRECISION'd211;
            //symbols[12]	= `SYMBOL_PRECISION'd234;
            //symbols[13]	= `SYMBOL_PRECISION'd134;
            //symbols[14]	= `SYMBOL_PRECISION'd178;
            //symbols[15]	= `SYMBOL_PRECISION'd107;
            //symbols[16]	= `SYMBOL_PRECISION'd151;
            //symbols[17]	= `SYMBOL_PRECISION'd114;

            //new version, corrected
            //sync symbols
            symbols[0]	= `SYMBOL_PRECISION'd8;
            symbols[1]	= `SYMBOL_PRECISION'd16;
            //payload symbols
            symbols[2]	= `SYMBOL_PRECISION'd5;
            symbols[3]	= `SYMBOL_PRECISION'd73;
            symbols[4]	= `SYMBOL_PRECISION'd141;
            symbols[5]	= `SYMBOL_PRECISION'd169;
            symbols[6]	= `SYMBOL_PRECISION'd137;
            symbols[7]	= `SYMBOL_PRECISION'd29;
            symbols[8]	= `SYMBOL_PRECISION'd61;
            symbols[9]	= `SYMBOL_PRECISION'd177;
            symbols[10]	= `SYMBOL_PRECISION'd2;
            symbols[11]	= `SYMBOL_PRECISION'd83;
            symbols[12]	= `SYMBOL_PRECISION'd106;
            symbols[13]	= `SYMBOL_PRECISION'd5;
            symbols[14]	= `SYMBOL_PRECISION'd49;
            symbols[15]	= `SYMBOL_PRECISION'd234;
            symbols[16]	= `SYMBOL_PRECISION'd22;
            symbols[17]	= `SYMBOL_PRECISION'd241;
        end
        `SF_SELECT_7: begin
            //sync symbols
            symbols[0]	= `SYMBOL_PRECISION'd73;
            symbols[1]	= `SYMBOL_PRECISION'd81;
            //payload symbols
            symbols[2]	= `SYMBOL_PRECISION'd70;
            symbols[3]	= `SYMBOL_PRECISION'd117;
            symbols[4]	= `SYMBOL_PRECISION'd13;
            symbols[5]	= `SYMBOL_PRECISION'd21;
            symbols[6]	= `SYMBOL_PRECISION'd5;
            symbols[7]	= `SYMBOL_PRECISION'd78;
            symbols[8]	= `SYMBOL_PRECISION'd94;
            symbols[9]	= `SYMBOL_PRECISION'd101;
            symbols[10]	= `SYMBOL_PRECISION'd69;
            symbols[11]	= `SYMBOL_PRECISION'd28;
            symbols[12]	= `SYMBOL_PRECISION'd46;
            symbols[13]	= `SYMBOL_PRECISION'd89;
            symbols[14]	= `SYMBOL_PRECISION'd113;
            symbols[15]	= `SYMBOL_PRECISION'd84;
            symbols[16]	= `SYMBOL_PRECISION'd89;
            symbols[17]	= `SYMBOL_PRECISION'd80;
        end
        default: begin
            //sync symbols
            symbols[0]	= `SYMBOL_PRECISION'd2057;
            symbols[1]	= `SYMBOL_PRECISION'd2065;
            //payload symbols
            symbols[2]	= `SYMBOL_PRECISION'd2555;
            symbols[3]	= `SYMBOL_PRECISION'd2635;
            symbols[4]	= `SYMBOL_PRECISION'd399;
            symbols[5]	= `SYMBOL_PRECISION'd1003;
            symbols[6]	= `SYMBOL_PRECISION'd55;
            symbols[7]	= `SYMBOL_PRECISION'd2543;
            symbols[8]	= `SYMBOL_PRECISION'd3051;
            symbols[9]	= `SYMBOL_PRECISION'd3279;

            symbols[10]	= `SYMBOL_PRECISION'd0;
            symbols[11]	= `SYMBOL_PRECISION'd0;
            symbols[12]	= `SYMBOL_PRECISION'd0;
            symbols[13]	= `SYMBOL_PRECISION'd0;
            symbols[14]	= `SYMBOL_PRECISION'd0;
            symbols[15]	= `SYMBOL_PRECISION'd0;
            symbols[16]	= `SYMBOL_PRECISION'd0;
            symbols[17]	= `SYMBOL_PRECISION'd0;
        end
    endcase
end
/*** State Machine ***/
always @(*) begin
    if (clkLock == VCC) begin
        if (rst == VSS) begin
            chirpReset   		= VSS;
            next_symVal     = preambleSym;
            next_symType    = `TYPE_UPCHIRP;
            next_state		= STATE_PREAMBLE;	
        end else begin
            next_symVal	=	next_symVal;
            case(current_state)
                STATE_CONST0: begin
                    chirpReset   	= VSS;
                    next_state		= STATE_CONST1;
                    next_symVal     = preambleSym;
                    next_symType    = `TYPE_UPCHIRP;
                end
                STATE_CONST1: begin
                    chirpReset      = VSS;
                    next_state      = STATE_PREAMBLE;
                    next_symVal     = preambleSym;
                    next_symType    = `TYPE_UPCHIRP;
                end
                STATE_PREAMBLE: begin
                    chirpReset  = VCC;
                    if (preambleCounter < preambleSize-`DATA_PRECISION'd1) begin
                        next_symVal = preambleSym;
                    end else begin
                        next_symVal = symbols[0];
                    end

                    if (symDone) begin
                        if (preambleCounter < preambleSize-`DATA_PRECISION'd1) begin
                            next_symType    = `TYPE_UPCHIRP;
                            next_state 	    = STATE_PREAMBLE;
                        end else begin
                            next_symType 	= `TYPE_UPCHIRP;
                            next_state 		= STATE_SYNC_0;
                        end
                    end else begin
                        next_symType    = `TYPE_UPCHIRP;
                        next_state 		= STATE_PREAMBLE;
                    end
                end
                STATE_SYNC_0: begin
                    chirpReset  = VCC;
                    next_symVal = symbols[1];
                    if (symDone) begin
                        next_symType    = `TYPE_UPCHIRP;
                        next_state 		= STATE_SYNC_1;
                    end else begin
                        next_symType    = `TYPE_UPCHIRP;
                        next_state      = STATE_SYNC_0;
                    end
                end
                STATE_SYNC_1: begin
                    chirpReset  = VCC;
                    next_symVal = downSym;
                    if (symDone) begin
                        next_symType    = `TYPE_DOWNCHIRP;
                        next_state 		= STATE_DOWNCHIRP_0;
                    end else begin
                        next_symType    = `TYPE_UPCHIRP;
                        next_state      = STATE_SYNC_1;
                    end
                end    
                STATE_DOWNCHIRP_0: begin
                    chirpReset  = VCC;
                    next_symVal = downSym;
                    if (symDone) begin
                        next_symType    = `TYPE_DOWNCHIRP;
                        next_state 		= STATE_DOWNCHIRP_1;
                    end else begin
                        next_symType    = `TYPE_DOWNCHIRP;
                        next_state      = STATE_DOWNCHIRP_0;
                    end
                end
                STATE_DOWNCHIRP_1: begin
                    chirpReset  = VCC;
                    next_symVal = downSym;
                    if (symDone) begin
                        next_symType    = `TYPE_Q_DOWNCHIRP;
                        next_state 	    = STATE_QDOWNCHIRP;
                    end else begin
                        next_symType    = `TYPE_DOWNCHIRP;
                        next_state 		= STATE_DOWNCHIRP_1;
                    end
                end
                STATE_QDOWNCHIRP: begin
                    chirpReset  = VCC;
                    next_symVal = symbols[2];
                    if (symDone) begin
                        next_symType    = `TYPE_UPCHIRP;
                        next_state 		= STATE_PAYLOAD;
                    end else begin
                        next_symType    = `TYPE_Q_DOWNCHIRP;
                        next_state 		= STATE_QDOWNCHIRP;
                    end
                end
                STATE_PAYLOAD: begin
                    chirpReset  = VCC;
                    if (payloadCounter < payloadSize-`DATA_PRECISION'd1) begin
                        //constant offset because of sync symbols
                        next_symVal	    =	symbols[payloadCounter + `DATA_PRECISION'd3];
                    end else begin
                        next_symVal 	=	preambleSym;
                    end
                    if (symDone) begin
                        if (payloadCounter < payloadSize-`DATA_PRECISION'd1) begin
                            next_symType    = `TYPE_UPCHIRP;
                            next_state 		= STATE_PAYLOAD;
                        end else begin
                            next_symType 	= `TYPE_UPCHIRP;
                            next_state 		= STATE_DONE;
                        end
                    end else begin
                        next_symType 	    = `TYPE_UPCHIRP;
                        next_state		    = STATE_PAYLOAD;
                    end
                end
                     
                STATE_DONE: begin
                    next_symVal     = preambleSym;
                    chirpReset      = VSS;
                    next_symType    = `TYPE_UPCHIRP;
                    next_state      = STATE_DONE;
                end
                default: begin
                    next_symVal     = preambleSym;
                    chirpReset      = VSS;
                    next_symType    = `TYPE_UPCHIRP;
                    next_state      = STATE_CONST0;
                end
            endcase
        end
    end else begin
        chirpReset      = VSS;
        next_symVal     = preambleSym;
        next_symType    = `TYPE_UPCHIRP;
        next_state		= STATE_PREAMBLE;
    end

end
endmodule