// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230701

`default_nettype none
module SoundGenerator #(
	parameter  CLOCK_HZ = 10_000_000
)(
	input wire Clock,
	input wire Reset,
	
	input wire Start_i,
	input wire Finish_i,
	input wire [15:0] Duration_ms_i,
	input wire [15:0] HalfPeriod_us_i,
	
	output wire SoundWave_o,
	output wire Busy_o,
	output wire Done_o
);
	
	// 1 millisecond pulse generator
	wire TickMilli;
	StrobeGenerator #(
		.CLOCK_HZ(CLOCK_HZ),
		.PERIOD_US(1000)
	) StrobeGeneratorMilli(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(Busy_o || Start_i),
		.Strobe_o(TickMilli)
	);
	
	// 1 microsecond pulse generator
	wire TickMicro;
	StrobeGenerator #(
		.CLOCK_HZ(CLOCK_HZ),
		.PERIOD_US(1)
	) StrobeGeneratorMicro(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(Busy_o || Start_i),
		.Strobe_o(TickMicro)
	);
	
	// Timer to measure duration of the sound
	reg [15:0] DurationTimer;
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			DurationTimer <= 0;
		else if(Start_i)
			DurationTimer <= Duration_ms_i;
		else if(Busy_o && TickMilli)
			DurationTimer <= DurationTimer - 1'b1;
		else if(Finish_i)
			DurationTimer <= 0;
	end
	
	// Busy signal
	assign Busy_o = |DurationTimer;
	
	// End edge detector of Busy signal
	reg BusyPrevious;
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			BusyPrevious <= 0;
		else
			BusyPrevious <= Busy_o;
	end
	
	assign Done_o = !Busy_o && BusyPrevious;
	
	// Sound frequency
	reg        Signal;
	reg [15:0] HalfPeriodCopy;
	reg [15:0] HalfPeriodTimer;
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Signal	        <= 0;
			HalfPeriodCopy  <= 0;
			HalfPeriodTimer <= 0;
		end else begin
			if(Start_i) begin
				HalfPeriodTimer <= HalfPeriod_us_i;
				HalfPeriodCopy  <= HalfPeriod_us_i;
				DebugMessage();
			end else if(HalfPeriodCopy != 16'd0) begin
				if(TickMicro && Busy_o) begin
					if(HalfPeriodTimer == 16'd0) begin
						Signal          <= ~Signal;
						HalfPeriodTimer <= HalfPeriodCopy;
					end else begin
						HalfPeriodTimer <= HalfPeriodTimer - 1'b1;
					end
				end
			end else begin
				Signal <= 1'b0;
			end
		end
	end
	
	assign SoundWave_o = Busy_o ? Signal : 1'b0;
	
	// Print debug message with frequency and other params
	task DebugMessage(); 
		begin: message
			integer Frequency;
			if(HalfPeriod_us_i == 16'd0)
				Frequency = 0;
			else
				Frequency = 1_000_000 / ((HalfPeriod_us_i + 1) * 2);
			$display("%t %d %d %d", 
				$realtime, 
				Duration_ms_i,
				HalfPeriod_us_i,
				Frequency
			);
		end
	endtask
	
endmodule
`default_nettype wire
