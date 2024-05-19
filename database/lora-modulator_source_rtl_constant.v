// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"

module constant(
input		                            clk,
input           [`CHIRP_TYPE_SIZE-1:0]  chirp_type,
input			[`SF_SELECT_SIZE-1:0]	SF_select,
input		    [`SIZE_8-1:0]           BW_shift_scale,
(* syn_preserve = "TRUE" *) output reg	    [`PRECISION-1:0] 		BW_SR,
(* syn_preserve = "TRUE" *) output reg	    [`PRECISION-1:0] 		phaseInc_val,
(* syn_preserve = "TRUE" *) output reg	    [`PRECISION-1:0] 		symbol_size
);

reg [`SF_SIZE-1:0]	SF;

reg	[`PRECISION-1:0] 	phaseInc_val0;
reg	[`PRECISION-1:0] 	symbol_size0;
    
always @(*) begin
    case (SF_select)
        `SF_SELECT_12: begin
            SF	=	`SF_12;
        end
        `SF_SELECT_11: begin
            SF	=	`SF_11;
        end
        `SF_SELECT_10: begin
            SF	=	`SF_10;
        end
        `SF_SELECT_9: begin
            SF	=	`SF_9;
        end
        `SF_SELECT_8: begin
            SF	=	`SF_8;
        end
        `SF_SELECT_7: begin
            SF	=	`SF_7;
        end
        `SF_SELECT_6: begin
            SF	=	`SF_6;
        end
        default: begin
            SF	=	`SF_12;
        end
    endcase
end

always @(*) begin
    phaseInc_val0	= (`BW2_SCALE_SR2_MIN << (2*BW_shift_scale + 1));
    phaseInc_val0	= (phaseInc_val0 >> SF);
end

always @(*) begin
    symbol_size0	= (1 << (`minBW_SR_Ratio_Power - BW_shift_scale));
    symbol_size0	= (symbol_size0 << SF);
    ////commented this line, since SR is not 12M.
    //symbol_size0	= symbol_size0 * 3;
    if (chirp_type == `TYPE_Q_DOWNCHIRP)
        symbol_size0 = symbol_size0 >> 2;
end


always @(posedge clk) begin
    BW_SR           <= (`BW_SCALE_SR_MIN << BW_shift_scale);

    phaseInc_val    <= phaseInc_val0;
    
    symbol_size     <= symbol_size0;
end		
		
endmodule





