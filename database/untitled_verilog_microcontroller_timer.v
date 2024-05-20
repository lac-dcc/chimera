// This program was cloned from: https://github.com/glacc/untitled_verilog_microcontroller
// License: CERN Open Hardware Licence Version 2 - Strongly Reciprocal

module timer (

	input		[1:0]		rs,
	input		rden,
	input		wren,
	input		en,

	input		[7:0]		data_in,
	output	[7:0]		data_out,
	output	[7:0]		data_out_direct,

	output	interrupt,

	input		clk_io,
	input		clk_tmr,

	input		rst
);

	parameter	int_pulse_length = 4'd10;
	reg	[3:0]		int_pulse_counter = 4'd0;
	assign	interrupt = int_pulse_counter > 4'd0;

	reg	enable_flag	= 1'b0;
	reg	int_enable_flag = 1'b0;
	reg	auto_reload_flag = 1'b0;

	reg	timer_flag_pos = 1'b0;
	reg	timer_flag_neg = 1'b0;
	wire	timer_flag;
	assign	timer_flag = timer_flag_pos ^ timer_flag_neg;

	reg	running_flag = 1'b0;
	reg	finished_flag = 1'b0;
	
	reg	[7:0]		clock_counter = 8'h00;
	reg	[7:0]		divider = 8'h00;

	reg	[15:0]	timer_latch = 16'h0000;
	reg	[15:0]	timer_counter = 16'h0000;
	
	wire	[7:0]		flags;
	assign	flags = {enable_flag, timer_flag, auto_reload_flag, int_enable_flag, 4'b0000}; 

	reg	[7:0]		data_out_latch = 8'b00000000;
	assign	data_out = (en & rden & !wren) ? data_out_latch : 8'bzzzzzzzz;
	assign	data_out_direct = (en & rden & !wren) ?
										rs == 2'd0 ? timer_latch[15:8] : 
										rs == 2'd1 ? timer_latch[7:0] : 
										rs == 2'd2 ? divider :
										rs == 2'd3 ? flags : 
										8'bzzzzzzzz : 8'bzzzzzzzz;

	always @(posedge clk_tmr or negedge rst) begin

		if (!rst) begin
			int_pulse_counter = 4'd0;

			running_flag = 1'b0;
			finished_flag = 1'b0;
			timer_flag_pos = 1'b0;

			clock_counter = 8'h00;
			timer_counter = 16'h0000;

		end else begin
			if (int_pulse_counter > 4'd0)
				int_pulse_counter = int_pulse_counter - 1'b1;

			if (enable_flag) begin
				if (timer_latch > 0 && !finished_flag) begin
					if (running_flag) begin
						if (clock_counter >= divider) begin
							if (timer_counter == 16'h0000) begin
								if (!timer_flag) begin
									if (int_enable_flag) begin
										//interrupt = 1'b1;
										int_pulse_counter = int_pulse_length;
									end
									
									timer_flag_pos = ~timer_flag_pos;
								end

								if (auto_reload_flag) begin
									timer_counter = timer_latch;
								end else begin
									running_flag = 1'b0;
									finished_flag = 1'b1;
								end
							end else
								timer_counter = timer_counter - 1'b1;

							clock_counter = 8'h00;
						end else
							clock_counter = clock_counter + 1'b1;
					end else begin
						clock_counter = 8'h00;
						timer_counter = timer_latch;
						running_flag = 1'b1;
					end
				end
			end else begin
				running_flag = 1'b0;
				finished_flag = 1'b0;
			end
		end
		
	end

	always @(posedge clk_io or negedge rst) begin

		if (!rst) begin
			enable_flag = 1'b0;
			int_enable_flag = 1'b0;
			timer_flag_neg = 1'b0;
			auto_reload_flag = 1'b0;

			divider = 4'h0;

			timer_latch <= 16'h0000;
		end else if (en) begin
			if (wren) begin
				case (rs)
					2'd0:
						timer_latch[15:8] = data_in;
					2'd1:
						timer_latch[7:0] = data_in;
					2'd2:
						divider = data_in;
					2'd3: begin
						enable_flag = data_in[7];

						if (timer_flag && data_in[6])
							timer_flag_neg = ~timer_flag_neg;

						auto_reload_flag = data_in[5];
						int_enable_flag = data_in[4];
					end
				endcase
			end else if (rden) begin
				case (rs)
					2'd0:
						data_out_latch = timer_latch[15:8];
					2'd1:
						data_out_latch = timer_latch[7:0];
					2'd2:
						data_out_latch = divider;
					2'd3:
						data_out_latch = flags;
				endcase
			end
		end
		
	end

endmodule