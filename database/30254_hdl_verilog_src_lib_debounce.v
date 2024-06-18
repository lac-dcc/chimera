// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-07-27 by mza
// originally from file mza-test008.16-segment-driver.button-debounce-duration-counter.v
// last updated 2024-04-10 by mza

// see module button_debounce in file synchronizer.v as well

`ifndef DEBOUNCE_LIB
`define DEBOUNCE_LIB

module debounceV1 #(
	parameter SIMULATION = 0,
	parameter TIMEOUT = SIMULATION ? 16 : 120000
) (
	input clock,
	input polarity,
	input raw_button_input,
	output reg button_active = 0
);
	reg [$clog2(TIMEOUT)+1:0] counter = 0;
	reg old_status = 0;
	reg new_status = 0;
	always @(posedge clock) begin
		if (counter==0) begin // idle, so time to check raw_button_input...
			if (raw_button_input==polarity) begin
				new_status <= 1; // raw_button_input is active
				if (old_status==0) begin // old_status != new_status, so act, then implement delay before checking again
					counter <= TIMEOUT;
					button_active <= 1;
				end
			end else begin
				new_status <= 0; // raw_button_input is inactive
				if (old_status==1) begin // old_status != new_status, so implement delay before checking again
					counter <= TIMEOUT;
					button_active <= 0;
				end
			end
		end else begin
			counter <= counter - 1'b1;
			button_active <= new_status;
		end
		old_status <= new_status;
	end
endmodule // debounce

module debounce #(
	parameter CLOCK_FREQUENCY = 100000000,
	parameter TIMEOUT_IN_MILLISECONDS = 50,
	parameter MILLISECONDS_PER_SECOND = 1000,
	parameter COUNTER_PICKOFF = $clog2(CLOCK_FREQUENCY/MILLISECONDS_PER_SECOND*TIMEOUT_IN_MILLISECONDS) // 23
) (
	input clock,
	input polarity,
	input raw_button_input,
	output reg button_activated_pulse = 0,
	output reg button_deactivated_pulse = 0,
	output reg button_active = 0
);
	reg [COUNTER_PICKOFF:0] counter = 0;
	localparam BUTTON_PIPELINE_PICKOFF = 3;
	reg [BUTTON_PIPELINE_PICKOFF:0] button_pipeline = 0;
	reg old_status = 0;
	reg new_status = 0;
	always @(posedge clock) begin
		button_activated_pulse <= 0;
		button_deactivated_pulse <= 0;
		button_pipeline <= { button_pipeline[BUTTON_PIPELINE_PICKOFF-1:0], raw_button_input };
		if (counter==0) begin // idle, so time to check raw_button_input...
			if (button_pipeline[BUTTON_PIPELINE_PICKOFF]==polarity) begin
				new_status <= 1; // raw_button_input is active
				if (old_status==0) begin // old_status != new_status, so act, then implement delay before checking again
					counter[COUNTER_PICKOFF] <= 1;
					button_activated_pulse <= 1;
					button_active <= 1;
				end
			end else begin
				new_status <= 0; // raw_button_input is inactive
				if (old_status==1) begin // old_status != new_status, so implement delay before checking again
					counter[COUNTER_PICKOFF] <= 1;
					button_deactivated_pulse <= 1;
					button_active <= 0;
				end
			end
		end else begin
			counter <= counter - 1'b1;
			button_active <= new_status;
		end
		old_status <= new_status;
	end
endmodule // debounce

module debounce_tb;
	reg clock = 0;
	reg raw_button_input = 0;
	reg polarity = 1;
	wire button_active;
	wire button_activated_pulse;
	wire button_deactivated_pulse;
	//debounce #() mydbV1 (.clock(clock), .raw_button_input(raw_button_input), .polarity(polarity), .button_active(button_active));
	debounce #(.COUNTER_PICKOFF(5)) mydb (.clock(clock), .raw_button_input(raw_button_input), .polarity(polarity), .button_activated_pulse(button_activated_pulse), .button_deactivated_pulse(button_deactivated_pulse), .button_active(button_active));
	initial begin
		#100;
		// quick tap
		raw_button_input = 1; #4; raw_button_input = 0; #6; raw_button_input = 1; #8; raw_button_input = 0; #7; raw_button_input = 1;
		#10;
		raw_button_input = 0; #7; raw_button_input = 1; #6; raw_button_input = 0; #8; raw_button_input = 1; #4; raw_button_input = 0;
		#400;
		// longer tap
		raw_button_input = 1; #9; raw_button_input = 0; #3; raw_button_input = 1; #5; raw_button_input = 0; #7; raw_button_input = 1;
		#150;
		raw_button_input = 0; #7; raw_button_input = 1; #7; raw_button_input = 0; #9; raw_button_input = 1; #5; raw_button_input = 0;
		#400;
		// hold button down for a while (longer than the debounce timer)
		raw_button_input = 1; #4; raw_button_input = 0; #6; raw_button_input = 1; #8; raw_button_input = 0; #7; raw_button_input = 1;
		#400;
		raw_button_input = 0; #7; raw_button_input = 1; #7; raw_button_input = 0; #9; raw_button_input = 1; #5; raw_button_input = 0;
		#100;
		$finish;
	end
	always begin
		#2;
		clock <= ~clock;
	end
endmodule

`endif

