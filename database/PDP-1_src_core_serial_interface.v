module serial_controller (
	input 						clk,				// 50mhz
	input							serial_clock, 	//	2.5mhz for the transport
	input							reset_l,
	
	input							slave_core,
	
   input [9:0] 				pixel_x_addr_cpu,
   input [9:0] 				pixel_y_addr_cpu,
   input							pixel_shift_cpu,
   input [2:0]					pixel_brightness_cpu,
	
	output reg [9:0] 			pixel_x_addr_wire,
   output reg [9:0] 			pixel_y_addr_wire,
   output reg					pixel_shift_wire,
   output reg [2:0]			pixel_brightness_wire,
	
	input	[15:0]				cont1_key,
	input	[15:0]				cont2_key,
	
	output reg	[15:0]		cont2_key_internal,
	
	
	
	// GBA link port
	inout							port_tran_si,
	output	reg				port_tran_si_dir,
	inout							port_tran_so,
	output	reg				port_tran_so_dir,
	inout							port_tran_sck,
	output	reg				port_tran_sck_dir

);


// 50mhz Core

always @(posedge clk or negedge reset_l) begin
	if (~reset_l) begin
		pixel_x_addr_wire			<= 'b0;
		pixel_y_addr_wire			<= 'b0;
		pixel_shift_wire			<= 'b0;
		pixel_brightness_wire	<= 'b0;
		cont2_key_internal 		<= 'b0;
	end
	else begin
		if (slave_core) begin
			pixel_x_addr_wire			<= 'b0;
			pixel_y_addr_wire			<= 'b0;
			pixel_shift_wire			<= 'b0;
			pixel_brightness_wire	<= 'b0;
			cont2_key_internal 		<= 'b0;
		end
		else if (master_state == 0) begin
			pixel_x_addr_wire			<= pixel_x_addr_cpu;
			pixel_y_addr_wire			<= pixel_y_addr_cpu;
			pixel_shift_wire			<= pixel_shift_cpu;
			pixel_brightness_wire	<= pixel_brightness_cpu;
			cont2_key_internal 		<= cont2_key;
		end
	end	
end


// link port is input only
assign port_tran_so = 1'bz;
assign port_tran_si = 1'bz;
assign port_tran_sck = 1'bz;


// 2.5mhzmhz core


always @(posedge serial_clock or negedge reset_l) begin
	if (~reset_l) begin
		port_tran_so_dir 		<= 1'b0;
		port_tran_si_dir 		<= 1'b0;
		port_tran_sck_dir 	<= 1'b0;
	end
	else begin
		if (slave_core) begin
			port_tran_so_dir 		<= 1'b0;
			port_tran_si_dir 		<= 1'b0;
			port_tran_sck_dir 	<= 1'b0;
		end
		else begin
			port_tran_so_dir 		<= 1'b0;
			port_tran_si_dir 		<= 1'b0;
			port_tran_sck_dir 	<= 1'b0;
		end
	end	
end


parameter	idle				=			'd0;
parameter	test_high		=			'd1;
parameter	test_low			=			'd2;
parameter	test_check		=			'd3;
parameter 	master_idle 	=			'd4;
parameter 	master_start_h	=			'd5;
parameter 	master_start_l	=			'd6;
parameter 	master_high_h 	=			'd7;
parameter 	master_high_l 	=			'd8;
parameter 	master_low_h	=			'd9;
parameter 	master_low_l	=			'd10;
parameter 	slave_idle 		=			'd11;
parameter 	slave_start_h	=			'd12;
parameter 	slave_start_l	=			'd13;
parameter 	slave_high_h 	=			'd14;
parameter 	slave_high_l 	=			'd15;
parameter 	slave_low_h		=			'd16;
parameter 	slave_low_l		=			'd17;

reg [9:0] master_counter;

reg [3:0] master_state;
reg [3:0] slave_state;

reg data_out;

always @(posedge serial_clock or negedge reset_l) begin
	if (~reset_l) begin
		master_state 	<= idle;
		slave_state 	<= idle;
		master_counter <= 'b0;
//		slave_core 		<= 1'b0;
	end
	else begin
		master_counter <= master_counter + 1;
		case (master_state)
			idle : begin
//				slave_core <= 1'b0;
				data_out		<= 1'b1;
				if 	  (port_tran_si == 1'b1 &&  master_counter[9]) master_state <= test_high;
				else if (port_tran_si == 1'b1 && ~master_counter[9]) master_state <= test_low;
				else if (port_tran_si == 1'b0) master_state <= idle;
			end
			test_high : begin
				data_out		<= 1'b1;
				if 	  (port_tran_si == 1'b1 && ~master_counter[9]) master_state <= test_low;
				else if (port_tran_si == 1'b1 &&  master_counter[9]) master_state <= test_high;
				else if (port_tran_si == 1'b0 && ~master_counter[9]) master_state <= test_low;
				else if (port_tran_si == 1'b0 &&  master_counter[9]) master_state <= master_idle;
			end		
			test_low	 : begin
				data_out		<= 1'b0;
				if 	  (port_tran_si == 1'b1 && ~master_counter[9]) master_state <= test_low;
				else if (port_tran_si == 1'b1 &&  master_counter[9]) master_state <= test_high;
				else if (port_tran_si == 1'b0 && ~master_counter[9]) master_state <= test_low;
				else if (port_tran_si == 1'b0 &&  master_counter[9]) master_state <= master_idle;
			end	
			test_check : begin
			
			end
			master_idle : begin

			end 	
			master_start_h : begin

			end	
			master_start_l : begin

			end	
			master_high_h : begin

			end 	
			master_high_l : begin

			end 	
			master_low_h : begin

			end	
			master_low_l : begin

			end	
			slave_idle : begin

			end 		
			slave_start_h : begin

			end	
			slave_start_l : begin

			end	
			slave_high_h : begin

			end 	
			slave_high_l : begin

			end 	
			slave_low_h : begin

			end		
			slave_low_l : begin

			end		
			default : begin

			end
		
		endcase
	end
end

endmodule