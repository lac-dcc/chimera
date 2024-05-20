// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module visitor_center #(parameter max_m10k_size = 4096, m10k_address_len = 12)
(  input  i_clk,
	input  i_rst,
	input  i_next, // output of neighborhood zero which makes visitor_centre to send next visitor
	
	
	input  [m10k_address_len-1:0] i_hps_number_of_visitors, // total number of bodies
	
	
	////////////////////// writing into m10k/////////////////////////////////////
	
	input  [m10k_address_len-1:0] i_hps_visitor_index, // address when HPS is writing the new  x and y  positions
	input  i_hps_write_enable, 
	input [31:0] i_hps_x, // new x pos
	input [31:0] i_hps_y, // new y pos
	input [31:0] i_hps_mass,
 
	////////////////////// writing into m10k/////////////////////////////////////
	
	

	
	////////////////////// reading from m10k/////////////////////////////////////
	
	output  [31:0] o_visitor_x_pos, // current x_pos of visitor
	output  [31:0] o_visitor_y_pos, // current y_pos of visitor
	output  [31:0] o_visitor_mass, // mass of visitor
	
	
	output  [m10k_address_len-1:0] o_visitor_index,
	///////////////////// reading from m10k/////////////////////////////////////
	
	
	
	output  o_last_visitor // last visitor which is helpful in calculating done signal
);  

localparam reset_state = 2'b00;
localparam hps_fill_state = 2'b01;
localparam calc_state = 2'b10;
localparam wait_state = 2'b11;  


reg [m10k_address_len-1:0] r_current_visitor; // index of current visitor being sent

reg [1:0] cur_state, nxt_state;

reg r_last_visitor;

assign o_last_visitor = r_last_visitor;


wire [m10k_address_len-1:0] w_visitor_index;


assign w_visitor_index = r_current_visitor;
assign o_visitor_index = w_visitor_index;
 
 
always @(posedge i_clk ) 
begin
	if(!i_rst)
		cur_state <= reset_state;
	  
	 else
		cur_state <= nxt_state;
end
		
always @(*)
begin
	nxt_state = cur_state;

	case (cur_state)
	reset_state: if(i_hps_write_enable) nxt_state = hps_fill_state; else nxt_state = wait_state;
	
	hps_fill_state: if(!i_hps_write_enable) nxt_state = calc_state;

	calc_state: if (r_current_visitor >= i_hps_number_of_visitors - 1)  nxt_state = wait_state;
	
	wait_state: if(i_hps_write_enable) nxt_state = hps_fill_state;
		
	endcase
 end
 
 
always @(*)
begin
	
	case(cur_state)
	reset_state, hps_fill_state: r_last_visitor = 'd0;
											  
					 
	calc_state: if(r_current_visitor >= i_hps_number_of_visitors - 1) r_last_visitor = 1'b1;
			
	default:r_last_visitor = 'd0;
	endcase
end

always @(posedge i_clk )
begin

	if(!i_rst || cur_state == hps_fill_state)
		r_current_visitor <= 'd0;
		
	else if(cur_state == calc_state && i_next)
		r_current_visitor <= r_current_visitor + 'd1;
		
end


		
	
wire [31:0] w_visitor_x_pos;
wire [31:0] w_visitor_y_pos;
wire [31:0] w_visitor_mass;


assign o_visitor_x_pos = w_visitor_x_pos;
assign o_visitor_y_pos = w_visitor_y_pos;
assign o_visitor_mass = w_visitor_mass;
 
 
 m10k #(max_m10k_size, m10k_address_len) visitor_x_pos_mem( 
	  .clock(i_clk),
	 
	  // reading port for sending to towns
	  .address_a(w_visitor_index),
	  .data_a(),
	  .q_a(w_visitor_x_pos),
	  .wren_a(1'd0),

	  // writing port for the hps to write to
	  .address_b(i_hps_visitor_index),
	  .data_b(i_hps_x),
	  .q_b(),
	  .wren_b(i_hps_write_enable)
 );

 m10k #(max_m10k_size, m10k_address_len) visitor_y_pos_mem( 
	  .clock(i_clk),
	  
	  // reading port for sending to towns
	  .address_a(w_visitor_index),
	  .data_a(),
	  .q_a(w_visitor_y_pos),
	  .wren_a(1'd0),

	  // writing port for the hps to write to
	  .address_b(i_hps_visitor_index),
	  .data_b(i_hps_y),
	  .q_b(),
	  .wren_b(i_hps_write_enable)
 );

 m10k #(max_m10k_size, m10k_address_len) visitor_mass_mem( 
	  .clock(i_clk),
	 
	  // reading port for sending to towns
	  .address_a(w_visitor_index),
	  .data_a(),
	  .q_a(w_visitor_mass),
	  .wren_a(1'd0),

	  // writing port for the hps to write to
	  .address_b(i_hps_visitor_index),
	  .data_b(i_hps_mass),
	  .q_b(),
	  .wren_b(i_hps_write_enable)
 );

endmodule