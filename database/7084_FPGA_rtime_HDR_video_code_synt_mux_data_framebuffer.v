// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : mux_data_framebuffer              //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 25.04.2018                        //
//Last revision : 26.04.2018                        //
//////////////////////////////////////////////////////
module mux_data_framebuffer
(
	input  logic        clk                   ,
	input  logic        reset_n               ,
	input  logic        start_frame           ,
	input  logic [3:0]  hps_switch            ,
	input  logic [7:0]  parallax_corr         ,
	output logic [7:0]  reg_parallax_corr     ,
	output logic        enable_tone_mapping   ,
	                            
	input  logic[7:0]   r_cam_0		          ,
	input  logic[7:0]   g_cam_0		          ,
	input  logic[7:0]   b_cam_0		          ,
	input  logic        data_valid_cam_0   ,
	input  logic        sop_cam_0		  ,
	input  logic        eop_cam_0	      ,
	                                  
	input  logic[7:0]   r_cam_1		          ,
	input  logic[7:0]   g_cam_1		          ,
	input  logic[7:0]   b_cam_1		          ,
	input  logic        data_valid_cam_1   ,
	input  logic        sop_cam_1		  ,
	input  logic        eop_cam_1	      ,
	                                  
	input  logic[7:0]   r_hdr		          ,
	input  logic[7:0]   g_hdr		          ,
	input  logic[7:0]   b_hdr		          ,
	input  logic        data_valid_hdr     ,
	input  logic        sop_hdr		      ,
	input  logic        eop_hdr	          ,
	                                 
	input  logic[7:0]   r_tm		          ,
	input  logic[7:0]   g_tm		          ,
	input  logic[7:0]   b_tm		          ,
	input  logic        data_valid_tm      ,
	input  logic        sop_tm		      ,
	input  logic        eop_tm             ,
	                                                                           
	output logic [7:0]  r_fb		          ,
	output logic [7:0]  g_fb		          ,
	output logic [7:0]  b_fb		          ,
	output logic        data_fb_valid         ,
	output logic        sop_fb		          ,
	output logic        eop_fb	              

);

reg [3:0] reg_hps_switch;

always @( posedge clk or negedge reset_n)
	if ( !reset_n )
		reg_parallax_corr <= 8'd10;
	else
		if(start_frame) 
		begin
			reg_hps_switch     <= hps_switch;
			reg_parallax_corr  <= parallax_corr;
		end

assign enable_tone_mapping = reg_hps_switch[2];
	
always @( posedge clk )
	casex (reg_hps_switch )
		4'b??01:begin
					r_fb			<= 	r_cam_0		        ;    
					g_fb			<=  g_cam_0		        ;
					b_fb			<=  b_cam_0		        ;
					data_fb_valid	<=  data_valid_cam_0 ;
					sop_fb		  	<=  sop_cam_0		;
					eop_fb	      	<=  eop_cam_0	    ;
				end	                                        
		4'b??10:begin                                      
					r_fb			<= r_cam_1		        ;
					g_fb			<= g_cam_1		        ;
					b_fb			<= b_cam_1		        ;
					data_fb_valid	<= data_valid_cam_1  ;
					sop_fb		  	<= sop_cam_1		    ;
					eop_fb	      	<= eop_cam_1	        ;
				end	                                        
		4'b??11:begin                                       
					r_fb			<= r_hdr		        ;  			
					g_fb			<= g_hdr		        ;  
					b_fb			<= b_hdr		        ;  
					data_fb_valid	<= data_valid_hdr       ; 
					sop_fb		  	<= sop_hdr		        ;  
					eop_fb	      	<= eop_hdr	            ;  			
				end                              
		default:begin                                     
					r_fb			<= r_cam_0		       	;
					g_fb			<= g_cam_0		        ;
					b_fb			<= b_cam_0		        ;
					data_fb_valid	<= data_valid_cam_0  ;
					sop_fb		  	<= sop_cam_0		    ;
					eop_fb	      	<= eop_cam_0	   		;
				end
	endcase
	
endmodule