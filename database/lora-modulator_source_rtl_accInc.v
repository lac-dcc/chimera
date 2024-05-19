// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"

module accInc(
	input signed        [`PRECISION-1:0] 	phaseIn,
	input signed        [`PRECISION-1:0] 	accIn,
	output reg signed   [`PRECISION-1:0]    accOut
);
	
//###################################################################################################
always @(*) begin
    accOut = $signed(accIn + phaseIn);

    // hangle negative
    if ($signed(accOut) < 0) begin
        accOut = $signed(accOut + `SCALE_2X);
    end

    // mod(accInc,2)
    if ($signed(accOut) >= $signed(`SCALE_2X)) begin
        accOut = $signed(accOut - `SCALE_2X);
    end		
end
	
endmodule
    