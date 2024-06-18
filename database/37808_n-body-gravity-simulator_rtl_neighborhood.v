// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module neighborhood #(parameter max_m10k_size = 4096, m10k_address_len = 12, town_index = 0, obj_address_len=12) 
(	 input  i_clk,
    input  i_rst,
    input  i_last_visitor,  // sent after the last visitor is sent from visitor center 

    output  reg o_done,  // acceleration computation completed 
    output  o_next, //  sent to visitor center for requesting next visitor

    
    input  i_sending, // sending acceleration to HPS

   
    input  i_filling,  // filling new x and y pos 

    
    input  [m10k_address_len-1:0] i_max_index, // no of bodies in each neighborhood

    ////////////////////// below two signals are used to detect zero mass///////////////////////////
    input  i_relative_visitor_valid, // specifies whether the visitor belongs to that neighborhood or not
    input  [m10k_address_len-1:0] i_relative_visitor_index, // visitor relative index wrt to neighborhood

    
    input  [31:0] i_visitor_x_pos,
    input  [31:0] i_visitor_y_pos,
    input  [31:0] i_visitor_mass,
    
	/////////////////////////////////////// related to HPS ///////////////////////////////////
	
	/////////////////////////////////////// written by HPS ///////////////////////////////////
    
    input  [m10k_address_len-1:0] i_pos_write_addr,
    input  i_pos_we, 
	 input  [31:0] i_x_pos_write_data_in,
    input  [31:0] i_y_pos_write_data_in,
	 
	 
	 ///////////////////////////////////// ready by HPS ////////////////////////////////////
    input  [m10k_address_len-1:0] i_extern_accel_addr,
	 
	 input [obj_address_len-1:0] i_number_of_visitors,
    output  [31:0] o_extern_x_accel,
    output  [31:0] o_extern_y_accel,
	 //output [9:0] o_led
	 output  [obj_address_len-1:0] o_number_of_visitors
	 
	 /////////////////////////////////////// related to HPS ///////////////////////////////////

); 




reg [obj_address_len-1:0] r_no_of_visitors_completed;
reg [2:0] cur_state, nxt_state;
localparam reset_state = 3'd0;
localparam fill_state = 3'd1;
localparam calc_state = 3'd2;
localparam send_state = 3'd3;
localparam wait_state = 3'd4;


wire [31:0] w_mass_input;

wire [31:0] w_x_accel_sum;
wire [31:0] w_y_accel_sum;

 
reg [m10k_address_len-1:0] r_pos_read_addr;
wire [31:0] w_x_pos_read_data;
wire [31:0] w_y_pos_read_data;


reg signed [m10k_address_len-1:0] r_accel_read_addr;
reg signed [m10k_address_len-1:0] r_accel_write_addr;
wire [m10k_address_len-1:0] w_accel_write_addr;


wire [31:0] w_x_accel_read_data;
wire [31:0] w_y_accel_read_data;


wire [31:0] w_x_accel_data_in;
wire [31:0] w_y_accel_data_in;


reg r_calc_writeback_ready;
reg r_done;
wire w_done;

//assign w_done = (i_last_visitor && r_no_of_visitors_completed >= i_number_of_visitors)  ;
//assign o_done = w_done;

assign w_done = (r_no_of_visitors_completed >= i_number_of_visitors) ? 1'b1 : 1'b0 ;
assign o_number_of_visitors = r_no_of_visitors_completed;
wire w_zero_mass;
reg r_zero_mass_1;
reg r_zero_mass_2;

wire w_accel_we;

assign w_x_accel_data_in = (cur_state == calc_state)? w_x_accel_sum : 'd0 ;
assign w_y_accel_data_in = (cur_state == calc_state)? w_y_accel_sum : 'd0 ;
assign w_accel_write_addr = (cur_state == calc_state)? r_accel_write_addr : i_extern_accel_addr;

//there is no need of making w_accel_we as high because in this case hps will be writing into positions but not accelerations
assign w_accel_we = ((cur_state == calc_state && r_calc_writeback_ready && !w_done) || cur_state == fill_state) ? 1'b1 : 1'b0;

assign o_next = (r_pos_read_addr == i_max_index) && (cur_state == calc_state);

assign w_zero_mass = (i_relative_visitor_valid && i_relative_visitor_index == r_pos_read_addr);

//assign o_led[6]=w_accel_we;
//assign o_led[5:3]=cur_state;
//assign o_led[2:0]=w_accel_write_addr;

always @(posedge i_clk) begin
  r_zero_mass_1 <= w_zero_mass;
  r_zero_mass_2 <= r_zero_mass_1;
  o_done <= w_done;
end

assign w_mass_input = (r_zero_mass_2) ? 32'd0 : i_visitor_mass;

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
  
		reset_state: if(i_filling) nxt_state = fill_state; else nxt_state = wait_state;
	
						 
		fill_state: if(!i_filling) nxt_state = calc_state;
						
						
		calc_state: if(w_done) nxt_state = wait_state;
					   
						
						
		send_state: if(!i_sending)  nxt_state = wait_state;
	 
		wait_state: if(i_filling) nxt_state = fill_state; else if(i_sending) nxt_state = send_state;
		
  endcase
  
end

always @(posedge i_clk) 
begin
  case (cur_state)
  
  reset_state: begin
						r_done <= 'b0;
						r_no_of_visitors_completed <= 'd0;
					end
			 
		
  fill_state: begin
					 r_done <= 'b0;
					 if(!i_filling) 
					 begin
						  r_pos_read_addr <= 'd0;
						  r_accel_read_addr <= -'d16; 
						  r_accel_write_addr <= -'d20; 
						  r_calc_writeback_ready <= 1'b0;
						  r_no_of_visitors_completed <= 'd0;
					 end
		        end
		
  calc_state: begin

		
					 if(r_pos_read_addr == i_max_index) 
						  r_pos_read_addr <= 'd0; 
					 else 
						  r_pos_read_addr <= r_pos_read_addr + 1;

				
					 if(r_accel_read_addr == i_max_index) 
						  r_accel_read_addr <= 'd0; 
					 else
						  r_accel_read_addr <= r_accel_read_addr + 1; 

					 
					 if(r_accel_write_addr == i_max_index) 
						  r_accel_write_addr <= 'd0;
					 else
						  r_accel_write_addr <= r_accel_write_addr + 1;
					 
					
					 if(r_accel_write_addr == -1) // according to me it should be -1 not 1;
						  r_calc_writeback_ready <= 1;
			
//					 if((i_last_visitor && r_accel_write_addr >= i_max_index))
//						  r_done <= 'b1;

					if(r_accel_write_addr == i_max_index)
						r_no_of_visitors_completed <= r_no_of_visitors_completed + 1;
						
					
				end
		
	send_state: r_done <= 'b0;

	default: begin
		  // do nothing
		end
  endcase
  
end


wire [31:0] w_extern_x_accel, w_extern_y_accel;

assign o_extern_x_accel = w_extern_x_accel;
assign o_extern_y_accel = w_extern_y_accel;

m10k #(max_m10k_size, m10k_address_len) neighborhood_x_pos( 
        .clock(i_clk),
		  
        // reading port for use with the gravity solver
        .address_a(r_pos_read_addr),
        .data_a(),
        .q_a(w_x_pos_read_data),
        .wren_a(1'd0),

        // writing port for the hps to write to
        .address_b(i_pos_write_addr),
        .data_b(i_x_pos_write_data_in),
        .q_b(),
        .wren_b(i_pos_we)
 );
 m10k #(max_m10k_size, m10k_address_len) neighborhood_y_pos( 
	  .clock(i_clk),
	
	  // reading port for use with the gravity solver
	  .address_a(r_pos_read_addr),
	  .data_a(),
	  .q_a(w_y_pos_read_data),
	  .wren_a(1'd0),

	  // writing port for the hps to write to
	  .address_b(i_pos_write_addr),
	  .data_b(i_y_pos_write_data_in),
	  .q_b(),
	  .wren_b(i_pos_we)
 );
 m10k #(max_m10k_size, m10k_address_len) neighborhood_x_accel( 
	  .clock(i_clk),
	  
	  // read data into the gravity solver
	  .address_a(r_accel_read_addr),
	  .data_a(),
	  .q_a(w_x_accel_read_data),
	  .wren_a(1'd0),

	  // shared write to zero m10k, read to HPS, write from solver
	  .address_b(w_accel_write_addr),
	  .data_b(w_x_accel_data_in),
	  .q_b(w_extern_x_accel),
	  .wren_b(w_accel_we)
 );

 m10k #(max_m10k_size, m10k_address_len) neighborhood_y_accel( 
	  .clock(i_clk),
	  
	  // read data into the gravity solver
	  .address_a(r_accel_read_addr),
	  .data_a(),
	  .q_a(w_y_accel_read_data),
	  .wren_a(1'd0),
	  
	  // shared write to zero m10k, read to HPS, write from solver
	  .address_b(w_accel_write_addr),
	  .data_b(w_y_accel_data_in),
	  .q_b(w_extern_y_accel),
	  .wren_b(w_accel_we)
 );

 // accelerator
 accelerator  core( 
	  .i_clk(i_clk), 
	  .i_rst(i_rst),
	  .i_b1_x(w_x_pos_read_data), 
	  .i_b1_y(w_y_pos_read_data), 
	  .i_b2_x(i_visitor_x_pos), 
	  .i_b2_y(i_visitor_y_pos), 
	  .i_m_b2(w_mass_input), 
	  .i_a_b1_x(w_x_accel_read_data), 
	  .i_a_b1_y(w_y_accel_read_data), 
	  .o_a_b1_x(w_x_accel_sum), 
	  .o_a_b1_y(w_y_accel_sum) 
 );

endmodule
