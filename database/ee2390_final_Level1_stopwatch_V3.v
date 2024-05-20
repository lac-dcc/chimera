// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

//stopwatch_V3.v

module stopwatch (
  input clk, reset, Start, Stop, Clear, Countdown,
  output reg [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds
  );
  
     reg running,nice_D;
	always@(posedge clk)
	begin
		if(Start) running <=1;
		if(Stop) running <=0;
	end
	
	always@(Countdown)
	begin
		if(~Countdown) nice_D <=0;
		else nice_D <=1;
	end
	
	always@(posedge clk) begin
			if (reset) begin
				Minutes 		<= 4'd0;
				Tens_Seconds	<= 4'd0;
				Ones_Seconds	<= 4'd0;
				Tenths_Seconds	<= 4'd0;
			end 
		end
	
	always@(posedge clk)begin
		if (running && ~nice_D)begin
			if (Tenths_Seconds == 4'd9) begin // Check if tenths_seconds reaches 9
				Tenths_Seconds <= 0;		  // Reset to 0 on reaching 9
				Ones_Seconds <= Ones_Seconds + 1;
			end else begin
				Tenths_Seconds <= Tenths_Seconds + 1; // Increment tenths_seconds 
			end
			if (Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9) begin
					Ones_Seconds <= 0;
					Tens_Seconds <= Tens_Seconds +1;
				end
			if (Tens_Seconds == 4'd5 && Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9 ) begin
				Tens_Seconds <= 0;
				Minutes <= Minutes +1;
				end
			if (Minutes == 4'd9 && Tens_Seconds == 4'd5 && Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9) begin
				Minutes <= 0;
				end
		end
		// Count down logic
		if (running && nice_D)begin
			if (Tenths_Seconds == 4'd0) begin
				Tenths_Seconds <= 4'd9;
				Ones_Seconds <= Ones_Seconds - 1;
				end else begin
					Tenths_Seconds <= Tenths_Seconds -1;
					end
			if(Ones_Seconds == 4'd0 && Tenths_Seconds == 4'b0) begin
				Ones_Seconds <= 4'd9;
				Tens_Seconds <= Tens_Seconds - 1;
				end
			if (Tens_Seconds == 4'd0 && Ones_Seconds == 4'd0 && Tenths_Seconds == 4'd0 ) begin
				Tens_Seconds <= 4'd5;
				Minutes <= Minutes -1;
				end
			if (Minutes == 4'd0 && Tens_Seconds == 4'd0 && Ones_Seconds == 4'd0 && Tenths_Seconds == 4'd0) begin
				Minutes <= 4'd9;
				end
			end
	end

endmodule