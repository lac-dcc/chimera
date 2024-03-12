`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 			Gpixel
// Engineer: 			HangWang
// 
// Create Date:    	16:28:29 11/25/2014 
// Module Name:    	sensor_controller
// Project Name: 		GVISION200
// Target Devices: 	Spartan-6 xc6slx150-3fg900
// Tool versions: 	ISE13.1
// Description: 		generate control signals.
// Revision: 
// 		V1.0-First created
//////////////////////////////////////////////////////////////////////////////////
module sensor_controller(clk_rxg, rst_rx_n,
	reg_camera_control, reg_test_image_enable,
	training_done, //grab_done,
	cmd_start_training, cmd_gen_test_image, sensor_reset_n, frame_req
	);

	// clock & reset
	input				clk_rxg;
	input				rst_rx_n;
	
	// register
	input [7:0]		reg_camera_control;
	input				reg_test_image_enable;
	
	// done
	input				training_done;
	//input				grab_done;
	
	// cmd
	output			cmd_start_training;
	output			cmd_gen_test_image;
	output			sensor_reset_n;
	output			frame_req;
	
	
	reg				cmd_start_training;
	reg				cmd_gen_test_image;
	
	reg				sensor_reset_n;
	reg				frame_req;
	reg [9:0]		cnt_frame_req;
	
	reg [7:0]		fsm_controller;
	parameter 		s_IDLE 		= 8'b0000_0001,
						s_RESET		= 8'b0000_0010,
						s_TRAINING	= 8'b0000_0100,
						s_GRAB		= 8'b0000_1000;
	
	reg [7:0]		reg_camera_control_q;
	reg [7:0]		cnt_reset;
	
	reg				training_done_q;
	reg				training_done_qq;
	//reg				grab_done_q;
	
	
	
	always @(posedge clk_rxg) begin
		if (!rst_rx_n) begin
			fsm_controller			<= s_IDLE;
			
			cmd_start_training	<= 1'b0;
			cmd_gen_test_image	<= 1'b0;
			
			sensor_reset_n			<= 1'b0;
			frame_req				<= 1'b0;
			
			reg_camera_control_q	<= 8'b0000_0000;
			training_done_q		<= 1'b0;
			training_done_qq		<= 1'b0;
			cnt_reset				<= 8'd0;
			cnt_frame_req			<= 10'd0;
		end
		else begin
			sensor_reset_n			<= 1'b1;
			reg_camera_control_q	<= reg_camera_control;
			training_done_q		<= training_done;
			training_done_qq		<= training_done_q;
			//grab_done_q				<= grab_done;
			
			if (reg_camera_control[7] == 1'b1 && reg_camera_control_q[7] == 1'b0) begin
				fsm_controller		<= s_IDLE;
			end
			else begin
				case (fsm_controller) 
					s_IDLE:		begin
										// cc(0)
										if (reg_camera_control[0] == 1'b1 && reg_camera_control_q[0] == 1'b0) begin
											
										end
										// cc(1)
										if (reg_camera_control[1] == 1'b1 && reg_camera_control_q[1] == 1'b0) begin
											
										end
										// cc(2): reset sensor
										if (reg_camera_control[2] == 1'b1 && reg_camera_control_q[2] == 1'b0) begin
											fsm_controller			<= s_RESET;
											cnt_reset				<= 8'b1111_1111;
											sensor_reset_n			<= 1'b0;
										end
										// cc(3): start training
										if (reg_camera_control[3] == 1'b1 && reg_camera_control_q[3] == 1'b0) begin
											fsm_controller			<= s_TRAINING;
											cmd_start_training	<= 1'b1;
										end
										// cc(4): frame request
										if (reg_camera_control[4] == 1'b1 && reg_camera_control_q[4] == 1'b0) begin
											frame_req				<= 1'b1;
											fsm_controller			<= s_GRAB;
										end
										// cc(5): tbd
										if (reg_camera_control[5] == 1'b1 && reg_camera_control_q[5] == 1'b0) begin
										
										end
										// cc(6): tbd
										if (reg_camera_control[6] == 1'b1 && reg_camera_control_q[6] == 1'b0) begin
										
										end

									end
					s_RESET:		begin
										if (cnt_reset == 8'd0) begin
											sensor_reset_n	<= 1'b1;
											fsm_controller	<= s_IDLE;
										end
										else begin
											cnt_reset		<= cnt_reset - 8'd1; 
											sensor_reset_n	<= 1'b0;
										end
									end
					s_TRAINING:	begin
										if ((training_done_q == 1) && (training_done_qq == 0)) begin
											fsm_controller				<= s_IDLE;
											cmd_start_training		<= 1'b0;
										end
									end
					s_GRAB:		begin
										if (reg_test_image_enable == 1) begin
											cmd_gen_test_image	<= 1'b1;
										end
										if	(cnt_frame_req == 10'd10)begin
											fsm_controller			<= s_IDLE;
											cmd_gen_test_image	<= 1'b0;
											frame_req				<= 1'b0;
										end
										else begin
											cnt_frame_req			<= cnt_frame_req + 10'd1;
										end
										/*if ((grab_done == 1) && (grab_done_q == 0))begin
											fsm_controller			<= s_IDLE;
											cmd_gen_test_image	<= 1'b0;
											frame_req				<= 1'b0;
										end*/
									end
					
				endcase
			end
		end
	end	

endmodule
