// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"
`include "RadioDefines.v"

module loraModulator(
input                               clk,
input                               rst,
input       [`SYMBOL_PRECISION-1:0] symVal,     //FORMAT IS: Tn = 257 + 2n
input       [`CHIRP_TYPE_SIZE-1:0]  symType,    //Upchirp(00), Downchirp(01), Quarter Downchirp(10)
input 	    [`SF_SELECT_SIZE-1:0]   SF_select,
input		[`BW_SELECT_SIZE-1:0]	BW_select,
output      [`ILength-1:0]          I,
output      [`QLength-1:0]          Q,
output reg                          IQStart,
output                              symDone
);

reg [`SF_SIZE-1:0]			SF;
reg [`SIZE_8-1:0]		    BW_shift_scale;

reg [`SYMBOL_PRECISION-1:0] offset;
reg [`SYMBOL_PRECISION-1:0] chirp_size;

//constant module connections
wire [`PRECISION-1:0] 		BW_SR;
wire [`PRECISION-1:0] 		phaseInc_val;
wire [`PRECISION-1:0] 		symbol_size;

//chirpGenerator module connections
wire signed [`PRECISION-1:0]	initPhase_phaseOut;
wire [`SinSize-1:0] chirp_I;
wire [`SinSize-1:0] chirp_Q;

assign I = {chirp_I, 1'b0};
assign Q = {chirp_Q, 1'b0};
	
//###################################################################################################
//reg and wires assignments
always @(posedge clk) begin
    if (rst == 1'b0) begin
        IQStart <= 1'b0;
    end else begin
        IQStart <= 1'b1;
    end
end
//###################################################################################################	
/** Spreading factor selection**/
always @(*) begin
    case (SF_select)
        `SF_SELECT_12: begin
            SF			=	`SF_12;
            offset		=	`OFFSET_SF12;
            chirp_size	=	`CHIRP_SIZE_SF12;
        end
        `SF_SELECT_11: begin
            SF			= 	`SF_11;
            offset		=	`OFFSET_SF11;
            chirp_size	=	`CHIRP_SIZE_SF11;
        end
        `SF_SELECT_10: begin
            SF			= 	`SF_10;
            offset		=	`OFFSET_SF10;
            chirp_size	=	`CHIRP_SIZE_SF10;
        end
        `SF_SELECT_9: begin
            SF				= 	`SF_9;
            offset		=	`OFFSET_SF9;
            chirp_size	=	`CHIRP_SIZE_SF9;
        end
        `SF_SELECT_8: begin
            SF				= 	`SF_8;
            offset		=	`OFFSET_SF8;
            chirp_size	=	`CHIRP_SIZE_SF8;
        end
        `SF_SELECT_7: begin
            SF				= 	`SF_7;
            offset		=	`OFFSET_SF7;
            chirp_size	=	`CHIRP_SIZE_SF7;
        end
        default: begin
            SF			=	`SF_12;
            offset		=	`OFFSET_SF12;
            chirp_size	=	`CHIRP_SIZE_SF12;
        end
    endcase
end
//###################################################################################################
/*
*   Spreading factor selection.
*   This supports up to BW125k.
*   For more BWs, needs to update this statement.
*/
always @(*) begin
    case (BW_select)
        `BW_SELECT_500: begin
            BW_shift_scale	=	`minBW_SR_Ratio_Power - 3;
        end
        `BW_SELECT_250: begin
            BW_shift_scale	=	`minBW_SR_Ratio_Power - 4;
        end
        `BW_SELECT_125: begin
            BW_shift_scale	=	`minBW_SR_Ratio_Power - 5;
        end
        `BW_SELECT_62_5: begin
            BW_shift_scale	=	`minBW_SR_Ratio_Power - 6;
        end
        `BW_SELECT_31_25: begin
            BW_shift_scale	=	`minBW_SR_Ratio_Power - 7;
        end
        default: begin
            BW_shift_scale	=	`minBW_SR_Ratio_Power - 3;
        end
    endcase
end
//###################################################################################################
constant constant0(
    .clk(clk),
    .chirp_type(symType),
    .SF_select(SF_select),
    .BW_shift_scale(BW_shift_scale),
    .BW_SR(BW_SR),
    .phaseInc_val(phaseInc_val),
    .symbol_size(symbol_size)
);

initialPhase initPhase0(
    .clk(clk),
    .chirp_type(symType),
    .symbol(symVal),
    .BW_shift_scale(BW_shift_scale),
    .offset(offset),
    .chirp_size(chirp_size),
    .SF(SF),
    .BW_SR(BW_SR),
    .phaseOut(initPhase_phaseOut)
)/* syn_preserve = "TRUE" */;
			
chirpGenerator chirpGen0(
    .chirpReset(rst),
    .clk(clk),
    .basephase(initPhase_phaseOut),
    .chirpType(symType),
    .BW_SR(BW_SR),
    .phaseInc_val(phaseInc_val),
    .symbol_size(symbol_size),
    .outcos(chirp_I),
    .outsin(chirp_Q),
    .done(symDone)
);
endmodule