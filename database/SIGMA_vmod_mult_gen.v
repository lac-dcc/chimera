/////////////////////////////////////////////////////////////////////////

// Design: mult_gen.v
// Author: Eric Qin

// Description: Generate multiple multierplier switches in 1-D structure

/////////////////////////////////////////////////////////////////////////


module mult_gen # (
	parameter IN_DATA_TYPE = 16,
	parameter OUT_DATA_TYPE = 32,
	parameter NUM_PES = 64) (
	clk, 
	rst,
	i_valid, 
	i_data_bus,
	i_stationary,
	o_valid,
	o_data_bus
);

	input clk;
	input rst;
	input i_valid;
	input [NUM_PES * IN_DATA_TYPE -1 :0] i_data_bus;
	input i_stationary;
	output reg o_valid;
	output reg [NUM_PES * OUT_DATA_TYPE -1 :0] o_data_bus;
	
	reg r_valid;
	reg r_stationary;
	
	// FF i_valid and i_stationary for timing fix
	always @ (posedge clk) begin
		r_valid <= i_valid;
		r_stationary <= i_stationary;
	end
		
	// connect the output of benes distribution network to the mult switches	
	genvar i;
	generate
		for (i=0; i < NUM_PES; i=i+1) begin: mult_units

			if (i == 0) begin : with_valid
				// declare mult switcih
				mult_switch my_mult_switch (
					.clk(clk),
					.rst(rst),
					.i_valid(r_valid),
					.i_data(i_data_bus[i*IN_DATA_TYPE +: IN_DATA_TYPE]),
					.i_stationary(r_stationary),
					.o_valid(o_valid),
					.o_data(o_data_bus[i*OUT_DATA_TYPE +: OUT_DATA_TYPE])
				);
			end else begin : without_valid
				mult_switch my_mult_switch (
					.clk(clk),
					.rst(rst),
					.i_valid(r_valid),
					.i_stationary(r_stationary),
					.i_data(i_data_bus[i*IN_DATA_TYPE +: IN_DATA_TYPE]),
					.o_valid(), // not needed (as mult switch 0 already determines logic)
					.o_data(o_data_bus[i*OUT_DATA_TYPE +: OUT_DATA_TYPE])
				);
			end
		end
	endgenerate

endmodule



