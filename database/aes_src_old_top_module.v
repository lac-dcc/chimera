// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Hegazy <github.com/ahegazy> <ahegazipro@gmail.com>
*
*	Date: September 2018
* 
* Description: AES Encryption Top module using FSM to move around the processes' steps.
* Language: Verilog
*
*/
module AES_encryption
(
input [7:0] key_byte, state_byte,
input clk,rst,enable, 
output reg [7:0] state_out_byte,
output reg load,ready
);

	integer i,j;
	reg [1:0] fsmCount;
	reg [127:0] key, state; /* input */
	reg enRound,enShft,enMx,enKy;
	wire fRound,fshft,fMx;
	reg  finish;
	reg [127:0] state_transI,state_transO;
	reg [127:0] key_transI;
	wire [127:0] key_transO,state_RoundO,state_subByteO,state_ShiftO,state_MixO;
	reg [3:0] keyNum;
	reg loadFinish;

	AddRoundKey S(.key(key_transI),.state(state_transI),.clk(clk),.rst(rst),.enable(enRound),.state_out(state_RoundO),.load(load),.done(fRound));

  genvar itr;
	generate
		for (itr = 0 ; itr <= 127; itr = itr+32)
			subByte statSub (.state(state_RoundO[itr +:32]) , .state_out(state_subByteO[itr +:32]));
	endgenerate
	
	Shift_Rows Sft (.en(enShft),.clk(clk),.rst(rst),.Data(state_subByteO),.Shifted_Data(state_ShiftO),.done(fshft) );
	MixColumns M (.state(state_transI),.clk (clk),.enable(enMx), .rst(rst),.state_out(state_MixO),.done(fMx));

	singleKeyExpansion k ( .keyInput(key_transI),.clk (clk),.enable(enKy),.reset (rst),.keyNum (keyNum),.keyOutput(key_transO));

initial 
begin 
	i=128;
	j = 0;
end 
	
always @(posedge clk)
	begin 
		if (rst) 
		begin
			loadFinish <= 0;
			key<=128'd0;
			state<=128'd0;
			load<=1'd0;
			ready<=1'd0;
			i <= 128;
			state_out_byte <= 8'h00;
			j <= 0; 

		end 
		else if (enable) 
		begin
			
//Bytes to vector// 
/////////////////////////
			if (i>0) begin
				loadFinish <= 0;
				load<=1'd1;
				key[i-1 -: 8]<=key_byte;
				state[i-1 -: 8]<=state_byte;
				$display ("%b", key);
				i<=i-8;
			end 
			else  
				begin 
				load<=1'd0;
				loadFinish <= 1;
				end
/* vector to bytes*/
		// state_39 to bytes to out  + ready signal  @ finish = 1 ..  

	if(finish)
				begin
					if ( j < 128)
					begin 
						ready <= 1; 
						state_out_byte <= state_transO [j +: 8]; 
						j <= j + 8;
					end
					else 
						ready <= 0;
				end 

		end 
	end 
	
	always @(posedge clk)
	begin 
	if (rst)
	begin 
		keyNum <= 0;
		fsmCount <= 0;
		enMx <= 0;
		enKy <= 0;
		enRound <= 0;
		enShft <= 0;
		keyNum <= 0;
		state_transO <= 0;
	end
	else if( (enable == 1 ) && (loadFinish == 1))

	begin 
			if ( keyNum <= 11 )
			begin 
		/* get here only if the device is enabled and not loading */
			/* FSM */
			case (fsmCount)
				2'b00:
					begin 
					/* round 0 AddroundKey only .. */
							key_transI <= key;
							state_transI <= state;
							keyNum <= 4'h1;
							enRound <= 1;
							enKy <= 1;
							fsmCount <= 2'b01;
					end 
				2'b01:
					begin 
					/* round 1 shiftrows */
						if (fRound == 1)
						begin
							state_transI <= state_RoundO;
							key_transI <= key_transO;
							enKy <= 0;
							enRound <= 0;
							enShft <= 1;
							if ( keyNum < 10)  fsmCount <= 8'b10;
							else fsmCount <= 8'b11;
						end 			
					end 
				2'b10:
				begin
					/* round 1 MixColumns */
						if (fshft == 1)
						begin
							state_transI <= state_ShiftO;
							enShft <= 0;
							enMx <= 1;
							fsmCount <= 8'b11;
						end 
				end 
				2'b11:
				begin 
					/* round 1 AddroundKey */
						if (fMx == 1 || (fshft == 1 && keyNum >= 10))
						begin
						  if(keyNum < 10) state_transI <= state_MixO;
							else 	state_transI <= state_ShiftO;
							enMx <= 0;
							enShft <= 0;
							enKy <= 1;
							enRound <= 1;
							fsmCount <= 8'b01;
							keyNum <= keyNum + 1;
						end 
				end 
//				default: 
				endcase 		
				end 
				else 
				begin 
					/* keyNum > 10 */
					state_transO <= state_RoundO;
					finish <= 1;
					keyNum <= 0;
					fsmCount <= 0;
					enMx <= 0;
					enKy <= 0;
					enRound <= 0;
					enShft <= 0;
				end 
		end
		

		end 

endmodule

	
	
