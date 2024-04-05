/** \file
 * Interface with a Vive Lighthouse v1
 *
 * Measure the raw sweep times for the sensor.
 * This also reports the lengths of the two sync pulses so that
 * the correct axis and OOTX can be assigned.

                 Data      Data      Angle
                <----->   <-----><------------>
_____   ________       ___       _____________   ___________
     |_|        |_____|   |_____|             |_|
    Sweep        Sync0     Sync1             Sweep

 * Sync0 is from lighthouse A, sync1 is from lighthouse B
 *
 * at 48 MHz every sync pulse is a 512 tick window
 * so we only look at the top few bits,
 * which encode the skip/data/axis bits:
 *
 * length = 3072 + axis*512 + data*1024 + skip*2048
 *
 * This disagrees with https://github.com/nairol/LighthouseRedox/blob/master/docs/Light%20Emissions.md
 * but matches what I've seen on my lighthouses.
 */

/*
 * Parse an entire frame and output the angle at 20-bits of resolution
 * The strobe goes high when there is a valid sensor reading; axis
 * indicates which lighthouse sent it and which rotor on that lighthouse.
 * OOTX data contains both lighthouse OOTX bits
 */
module lighthouse_sensor(
	input clk,
	input reset,
	input [SENSORS-1:0] raw_pins,
	output angle_strobe,
	output [ANGLE_BITS-1:0] angle,
	output [SENSOR_BITS-1:0] sensor,
	output reg lighthouse,
	output reg axis,
	output data_strobe,
	output data
);
	parameter SENSORS = 1;
	parameter SENSOR_BITS = `CLOG2(SENSORS);
	parameter WIDTH = 20;
	parameter MHZ = 48;
	parameter MAX_COUNTER = 20'h80000;
	parameter ANGLE_BITS = 20;

	// clock shared between all of the sensors
	reg [WIDTH-1:0] counter;
	reg [WIDTH-1:0] fall_counter;
	reg [WIDTH-1:0] rise_counter;

	// the pulse length encodes information about the lighthouse
	// and laser being used
	wire skip_raw;
	wire data_raw;
	wire axis_raw;
	wire sync_valid;
	lighthouse_sync_decode #(.MHZ(MHZ)) sync_decode(
		counter[WIDTH-1:9], skip_raw, data_raw, axis_raw, sync_valid);

	// logical AND all of the raw input pins so that
	// any falling edge will be clocked
	reg all_sync;
	reg all_prev;
	wire all_rise = all_sync && !all_prev;
	wire all_fall = !all_sync && all_prev;

	// buffer all of the pins with edge capture strobes
	reg [SENSORS-1:0] rise_strobe;
	reg [SENSORS-1:0] fall_strobe;

	genvar x;
	for(x=0 ; x < SENSORS ; x = x + 1)
		edge_capture sensors_edge(
			.clk(clk),
			.reset(reset),
			.raw_pin(raw_pins[x]),
			.rise_strobe(rise_strobe[x]), 
			.fall_strobe(fall_strobe[x])
		);

	// track the rising and falling edge of the entire input array
	// for detecting the sync pulses.
	// detects if the counter has gone too long, in which case falling
	// edge restarts the counter
	localparam WAIT_SYNC0_START	= 0;
	localparam WAIT_SYNC0_END	= 1;
	localparam WAIT_SYNC1_START	= 2;
	localparam WAIT_SYNC1_END	= 3;
	localparam WAIT_SENSORS		= 4;
	reg [5:0] state;
	always @(posedge clk)
	begin
		// default is no data bit strobe
		data_strobe <= 0;

		// buffer the big AND gate
		all_prev <= all_sync;
		all_sync <= &raw_pins;

		// default is always increment counter
		counter <= counter + 1;

		if (reset) begin
			counter <= 0;
			state <= WAIT_SYNC0_START;
		end else
		if (counter > MAX_COUNTER) begin
			// if we've timed out, reset the FSM
			state <= WAIT_SYNC0_START;
		end else
		case (state)
		WAIT_SYNC0_START: if (all_fall) begin
			// very first sync bit, restart the counter
			counter <= 0;
			state <= WAIT_SYNC0_END;
		end
		WAIT_SYNC0_END: if (all_rise) begin
			// end of the first sync bit
			// if the length is reasonable, record it and
			// move to the next state
			if (!sync_valid) begin
				state <= WAIT_SYNC0_START;
			end else begin
				state <= WAIT_SYNC1_START;
				if (!skip_raw) begin
					// this is the valid output
					data <= data_raw;
					axis <= axis_raw;
					lighthouse <= 0;
					data_strobe <= 1;
				end
			end
		end
		WAIT_SYNC1_START: if (all_fall) begin
			// start of the second sync bit
			state <= WAIT_SYNC1_END;
			counter <= 0;
		end
		WAIT_SYNC1_END: if (all_rise) begin
			// end of the second sync bit
			if (!sync_valid) begin
				state <= WAIT_SYNC0_START;
			end else begin
				state <= WAIT_SENSORS;
				counter <= 0;

				if (!skip_raw) begin
					data <= data_raw;
					axis <= axis_raw;
					lighthouse <= 1;
					data_strobe <= 1;
				end
			end
		end
		WAIT_SENSORS: begin
			// do nothing, timeout will eventually happen
		end
		default: begin
			// should never happen
			state <= WAIT_SYNC0_START;
		end
		endcase
	end

	// select which sensor has the newest reading
	wire [SENSOR_BITS-1:0] sensor;
	wire new_sample;

	integer i;
	always @(*)
	begin
		new_sample <= 0;
		for(i = 0 ; i < SENSORS ; i++)
		begin
			if (fall_strobe[i]) begin
				sensor <= i;
				new_sample <= 1;
			end
		end
	end

	// find the first sensors with a low pin
	always @(posedge clk)
	begin
		angle_strobe <= 0;

		if (reset) begin
			// nothing to do
		end else
		if (state == WAIT_SENSORS && new_sample) begin
			// there has been a falling edge of a sensor
			angle_strobe <= 1;
			angle <= counter;
		end
	end
endmodule

module lighthouse_sync_decode(
	input [10:0] sync,
	output skip,
	output data,
	output axis,
	output valid
);
	parameter MHZ = 48; // we should do something with this

	assign valid = (6 <= sync) && (sync <= 13);

	wire [2:0] type = sync - 6;
	assign skip = type[2];
	assign data = type[1];
	assign axis = type[0];
endmodule


module edge_capture(
	input clk,
	input reset,
	input raw_pin,
	output rise_strobe,
	output fall_strobe
);
	reg pin0;
	reg pin1;
	reg pin2;

	always @(posedge clk)
	begin
		// defaults
		rise_strobe <= 0;
		fall_strobe <= 0;

		// flop the raw pin the ensure stability
		pin0 <= raw_pin;
		pin1 <= pin0;
		pin2 <= pin1;

		if (reset) begin
			// nothing to do
		end else
		if (pin2 != pin1) begin
			rise_strobe <= !pin2;
			fall_strobe <=  pin2;
		end
	end

endmodule
