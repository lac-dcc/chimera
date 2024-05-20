// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

//stopwatch_V4.v
// All goals of Level one have been achieved, this stopwatch seeks to add in the functionallity of the flashing lights, when zero.

module stopwatch (
  input clk, reset, Start, Stop, Clear, Countdown,
  output reg [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds
  );
  
  reg running,Down,flashing;
  reg Anode = 1;

	always@(posedge Start,posedge Stop)
	begin
		if(Start)begin 
		running <=1;
		flashing <= 0;
		if(~Countdown) Tenths_Seconds <= Tenths_Seconds +4'd1;
		else begin
		Tenths_Seconds <= 4'd9;
		Ones_Seconds <= 4'd9;
		Tens_Seconds <= 4'd5;
		Minutes <= 4'd9;
		end
		end
		if(Stop)begin 
		running <=0;
		flashing <= 0;
		Anode <= 1;
		end
	end
	
	always@(Countdown)
	begin
		if(~Countdown) Down <=0;
		if(Countdown) Down <=1;
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
		if (running && ~Down)begin
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
				Minutes <= 4'd0; Tens_Seconds <= 4'd0; Ones_Seconds <= 4'd0; Tenths_Seconds <= 4'd0;
				running <=0;
				flashing <=1;
				end
		end
		if (running && Down)begin
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
				Minutes <= 4'd0; Tens_Seconds <= 4'd0; Ones_Seconds <= 4'd0; Tenths_Seconds <= 4'd0;
				running <=0;
				flashing <=1;
				end
			end
	end
	reg [2:0]count = 4'd0;
	
	always@(posedge clk)
		if (flashing) begin
		count <= count +1;
		end
		
	always@(posedge clk)
		if (flashing) begin
			wait (count == 4'd4);
			Anode <= 0;
			wait (count == 4'd5);
			count <= 4'b0;
			wait (count == 4'd4);
			Anode <= 1;
			wait (count == 4'd5);
			count <= 4'b0;
		end
		
			
	

endmodule