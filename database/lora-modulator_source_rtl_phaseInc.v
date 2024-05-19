// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"

module phaseInc(
input signed 		[`PRECISION-1:0]        phaseIn,
input 				[`CHIRP_TYPE_SIZE-1:0] 	chirpType, 
input 				[`PRECISION-1:0] 		BW_SR,
input 				[`PRECISION-1:0] 		phaseInc_val,
output reg signed	[`PRECISION-1:0] 	    phaseOut
);


reg 	[`PRECISION-1:0] BW_SR_2x;

always @(*) begin
    BW_SR_2x = $signed(BW_SR << 1);
    
    //if (chirpType == `TYPE_UPCHIRP) begin
        //phaseOut = $signed(phaseIn + phaseInc_val);
        //
        //////clip chirp symbol at sampling rate
        //if ($signed(phaseOut) > $signed(BW_SR)) begin
            //phaseOut = $signed(phaseOut - BW_SR_2x);
        //end
    //end else begin
        //phaseOut = $signed(phaseIn - phaseInc_val);
        //////clip chirp symbol at bandwidth
        //if ($signed(phaseOut) < $signed(-1*BW_SR)) begin
            //phaseOut = $signed(phaseOut + BW_SR_2x);
        //end else if ($signed(phaseOut) > $signed(BW_SR)) begin
            //phaseOut = $signed(phaseOut - BW_SR_2x);
        //end
    //end

    //new version
    if (chirpType == `TYPE_UPCHIRP) begin
        phaseOut = $signed(phaseIn + phaseInc_val);
    end else begin
        phaseOut = $signed(phaseIn - phaseInc_val);
    end

    
    ////clip chirp symbol at sampling rate
    if ($signed(phaseOut) > $signed(BW_SR)) begin
        phaseOut = $signed(phaseOut - BW_SR_2x);
    end else if ($signed(phaseOut) < $signed(-1*BW_SR)) begin
        phaseOut = $signed(phaseOut + BW_SR_2x);
    end
end

endmodule

