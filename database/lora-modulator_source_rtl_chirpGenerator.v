// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include "LoRaTXDefines.v"
`include "RadioDefines.v"

module chirpGenerator(
input                                   chirpReset,
input                                   clk, 
input signed    [`PRECISION-1:0]	    basephase,
input           [`CHIRP_TYPE_SIZE-1:0] 	chirpType, 
input           [`PRECISION-1:0] 		BW_SR,
input           [`PRECISION-1:0] 		phaseInc_val,
input           [`PRECISION-1:0] 		symbol_size,
output wire     [`SinSize-1:0]          outcos, 
output wire     [`SinSize-1:0]          outsin, 
output reg                              done
);
	
reg signed  [`PRECISION-1:0] acc;
reg signed 	[`PRECISION-1:0] accNext;
reg signed  [`PRECISION-1:0] phase;
reg signed 	[`PRECISION-1:0] phaseNext;
reg 			[`PRECISION-1:0] chirp_count;

wire signed [`PRECISION-1:0] phaseNextOut;
wire signed [`PRECISION-1:0] accNextOut;

parameter const1 = 2'd1;
parameter const2 = 2'd2;
parameter const3 = 2'd3;

parameter VSS = 1'b0;

always @(*) begin
    if (chirpReset == VSS) begin
        accNext		=	`PRECISION'd0;
        phaseNext 	=	`PRECISION'd0;
    end else begin
        accNext		=	accNextOut;
        phaseNext	=	phaseNextOut;
    end
end

always @(posedge clk) begin
    if (chirpReset == VSS) begin
        chirp_count     <= `PRECISION'd0;
        acc 			<= `PRECISION'd0;
        phase			<=	`PRECISION'd0;
        done 			<= 1'b0;
    end else begin
        phase <= (chirp_count == `PRECISION'd0) ? basephase : phaseNext;
        acc 	<= accNext;
            
        if (chirpType == `TYPE_Q_DOWNCHIRP) begin
            //chirp_count <= (chirp_count == symbol_size/4-1) ? 0 : chirp_count + 1;
            if ((chirp_count + `PRECISION'd1) == symbol_size) begin
                chirp_count <= `PRECISION'd0;
                done <= 1'b1;
            end else begin
                chirp_count <= chirp_count + `PRECISION'd1;
                done <= 1'b0;
            end
        end else begin
            //chirp_count <= (chirp_count+1 == symbol_size) ? 0 : chirp_count + 1;
            if ((chirp_count + `PRECISION'd1) == symbol_size) begin
                chirp_count <= `PRECISION'd0;
                done <= 1'b1;
            end else begin
                chirp_count <= chirp_count + `PRECISION'd1;
                done <= 1'b0;
            end
        end
    end
end

phaseInc phase_u1(
    .phaseIn(phase),
    .chirpType(chirpType),
    .BW_SR(BW_SR),
    .phaseInc_val(phaseInc_val),
    .phaseOut(phaseNextOut)
);
    
accInc accInc_u1(
    .phaseIn(phase),
    .accIn(acc),
    .accOut(accNextOut)
);

//squareCos squareCos_u1(
    //.angle(acc),
    //.cosOut(outcos)
//);

//squareSin squareSin_u1(
    //.angle(acc),
    //.sinOut(outsin)
//);

cosIdeal cosIdeal_0(
    .angle(acc),
    .cosOut(outcos)
);

sinIdeal sinIdeal_0(
    .angle(acc),
    .sinOut(outsin)
);

endmodule



