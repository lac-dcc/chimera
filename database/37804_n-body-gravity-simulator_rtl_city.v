// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module city #(parameter max_size = 4096, m10k_address_len = 12, neighborhood_count = 1) 
(
	 input i_clk,
	 input i_rst,

	 input i_sending, // from hps

	 input [m10k_address_len-1:0] i_num_objects,

	 input  [m10k_address_len-1:0] i_pos_write_addr,
	 input  i_pos_we,
	 input  [31:0] i_x_pos_write_data,
	 input  [31:0] i_y_pos_write_data,
	 input  [31:0] i_mass_write_data,

	 input  [m10k_address_len-1:0] i_extern_accel_addr,
	 output  [31:0] o_x_accel,
	 output  [31:0] o_y_accel,

	 output o_done, //sent to hps
	 output [9:0] o_led
);   

//localparam max_neighborhood_m10k_size = (max_size / neighborhood_count)+1;
localparam max_neighborhood_m10k_size = (max_size / neighborhood_count);
localparam neighborhood_m10k_address_len = m10k_address_len - neighborhood_count/2;
   	
wire [neighborhood_count-1:0] w_next;
wire [neighborhood_count-1:0] w_local_done;
  
assign o_done = (w_local_done[0]);

wire w_last_visitor;

wire [31:0] w_visitor_x_pos;
wire [31:0] w_visitor_y_pos;
wire [31:0] w_visitor_mass;
   
wire [m10k_address_len-1:0] w_visitor_index;


 visitor_center #(max_size, m10k_address_len) visitor_generator (
	  .i_clk(i_clk),
	  .i_rst(i_rst),
	  .i_hps_number_of_visitors(i_num_objects),
	  .i_hps_visitor_index(i_pos_write_addr),
	  .i_hps_write_enable(i_pos_we),
	  .i_hps_x(i_x_pos_write_data),
	  .i_hps_y(i_y_pos_write_data),
	  .i_hps_mass(i_mass_write_data),
	  .i_next(w_next[0]),
	  .o_visitor_x_pos(w_visitor_x_pos),
	  .o_visitor_y_pos(w_visitor_y_pos),
	  .o_visitor_mass(w_visitor_mass),
	  .o_visitor_index(w_visitor_index),
	  .o_last_visitor(w_last_visitor)
 );
  
wire [neighborhood_m10k_address_len-1:0] w_neighborhood_max_index;
assign w_neighborhood_max_index = (i_num_objects%neighborhood_count == 0) ? (i_num_objects/neighborhood_count)-'d1 : i_num_objects/neighborhood_count;
    
// top level to bittom level address conversion
wire [neighborhood_m10k_address_len-1:0] w_converted_visitor_index;
wire [neighborhood_m10k_address_len-1:0] w_converted_hps_index;
wire [neighborhood_m10k_address_len-1:0] w_converted_accel_index;

assign w_converted_visitor_index = w_visitor_index/neighborhood_count;
assign w_converted_hps_index = i_pos_write_addr/neighborhood_count;
assign w_converted_accel_index = i_extern_accel_addr/neighborhood_count;
 
//Select signals so that only 1 neighborhood 0's mass for each converted index instead of all of the neighborhoods
reg [neighborhood_count-1:0] r_hps_index_valid;
reg [neighborhood_count-1:0] r_relative_visitor_valid;

integer i;

always @(*)
begin
	  for(i = 0; i < neighborhood_count; i=i+1) 
	  begin
			
			r_hps_index_valid[i] = (i_pos_write_addr % neighborhood_count) == i;
			r_relative_visitor_valid[i] = (w_visitor_index % neighborhood_count) == i;
			
	  end
end
    
wire [31:0] r_local_x_accel_out[0:neighborhood_count-1];
wire [31:0] r_local_y_accel_out[0:neighborhood_count-1];
wire [m10k_address_len-1:0] w_no_comp[0:neighborhood_count-1];
	 
assign o_x_accel = r_local_x_accel_out[i_extern_accel_addr%neighborhood_count];
assign o_y_accel = r_local_y_accel_out[i_extern_accel_addr%neighborhood_count];
assign o_led = w_no_comp[0][9:0];

genvar k;
generate
  
  for(k = 0; k < neighborhood_count; k=k+1) begin : neighborhood_generate
		neighborhood #(max_neighborhood_m10k_size, neighborhood_m10k_address_len, k, m10k_address_len) local_neighborhood(
			 .i_clk(i_clk),
			 .i_rst(i_rst),
			 .i_last_visitor(w_last_visitor),
			 .o_done(w_local_done[k]),
			 .o_next(w_next[k]),
			 .i_sending(i_sending),
			 .i_filling(i_pos_we),
			 .i_max_index(w_neighborhood_max_index),
			 .i_relative_visitor_valid(r_relative_visitor_valid[k]),
			 .i_relative_visitor_index(w_converted_visitor_index),
			 .i_visitor_x_pos(w_visitor_x_pos),
			 .i_visitor_y_pos(w_visitor_y_pos),
			 .i_visitor_mass(w_visitor_mass),

			 .i_pos_write_addr(w_converted_hps_index),
			 .i_pos_we(i_pos_we && r_hps_index_valid[k]),
			 .i_x_pos_write_data_in(i_x_pos_write_data),
			 .i_y_pos_write_data_in(i_y_pos_write_data),

			 .i_extern_accel_addr(w_converted_accel_index),
			 .i_number_of_visitors(i_num_objects),
			 .o_extern_x_accel(r_local_x_accel_out[k]),
			 .o_extern_y_accel(r_local_y_accel_out[k]),
			 .o_number_of_visitors(w_no_comp[k])
			 //.o_led(o_led)
		);
  end
endgenerate

endmodule
