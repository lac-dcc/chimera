// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"

module initialPhase(
input                                       clk,
input               [`CHIRP_TYPE_SIZE-1:0]  chirp_type,
input               [`SYMBOL_PRECISION-1:0]	symbol,
input		        [`SIZE_8-1:0]			BW_shift_scale,
input		        [`SYMBOL_PRECISION-1:0] offset,
input 		        [`SYMBOL_PRECISION-1:0] chirp_size,
input		        [`SF_SIZE-1:0]			SF,
input 		        [`PRECISION-1:0] 		BW_SR,
(* syn_preserve = "TRUE" *) output reg signed   [`PRECISION-1:0] 		phaseOut
);

reg [`SYMBOL_PRECISION-1:0] phaseStart;
reg signed [`PRECISION-1:0] phaseOut0;

always @(*) begin
    //phaseStart = $signed(symbol - offset);
    //if ($signed(phaseStart) < 0) begin
        //phaseStart = $signed(phaseStart + chirp_size);
    //end
                
    phaseStart = $signed(symbol);
            
    //new version
    phaseOut0 = `BW_SCALE_SR_MIN >> (SF-1-BW_shift_scale);
    phaseOut0 = $signed(phaseOut0 * phaseStart);

    //phaseOut0 = dir ? $signed(phaseOut0 - BW_SR) : $signed(phaseOut0 + BW_SR);
    if (chirp_type == `TYPE_UPCHIRP)
        phaseOut0 = $signed(phaseOut0 - BW_SR);
    else
        phaseOut0 = $signed(phaseOut0 + BW_SR);
end

always @(posedge clk) begin
    phaseOut <= phaseOut0;
end

endmodule
