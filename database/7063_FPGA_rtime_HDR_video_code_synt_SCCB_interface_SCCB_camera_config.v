// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : SCCB_camera_config                //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 03.04.2018                        //
//Last revision : 30.04.2018                        //
//////////////////////////////////////////////////////
module SCCB_camera_config
(
	input  logic                        clk_sys           ,             
	input  logic                        reset_n           ,
	input  logic [1:0]                  select_initial_cam,
	output logic                        ready_ov5640      ,
	input  logic                        start_ov5640      ,
	input  logic [15:0]                 address_ov5640    ,
	input  logic [7:0]                  data_ov5640       ,
	input  logic                        xclk_cam          ,
	input  logic                        clk_23            ,
	input  logic                        err_ch0           ,
	input  logic                        err_ch1           ,
	output logic                        clk_cam_0_o       ,
	output logic                        clk_cam_1_o       ,
	output logic                        RESETB_0          ,
	output logic                        RESETB_1          ,
	output logic                        PWDN_0            ,
	output logic                        PWDN_1            ,
	output logic                        SIOC_0            , 
	inout  logic                        SIOD_0            ,
	output logic                        SIOC_1            , 
	inout  logic                        SIOD_1     	
);

reg                 reg_SIOD_0 ;
reg                 reg_SIOD_1 ;  
SCCB_interface SCCB_interface_inst
(
	.clk               (clk_sys                     ),
	.start             (start_ov5640                ), // <-
	.address           (address_ov5640              ), // <-
	.data              (data_ov5640                 ), // <-
	.ready             (ready_ov5640                ), // ->
	.SIOC_oe           (SIOC_o                      ), // ->
	.SIOD_oe           (SIOD_o                      ) // ->
);
always_comb
begin
	case(select_initial_cam)
		2'b00: 
		begin
			SIOC_0  =SIOC_o ? 1'b0 : 1'bz;
	        reg_SIOD_0  =SIOD_o ? 1'b0 : 1'bz;
            SIOC_1  =SIOC_o ? 1'b0 : 1'bz;
            reg_SIOD_1  =SIOD_o ? 1'b0 : 1'bz;
		end
		2'b01:
		begin
			SIOC_0  =SIOC_o ? 1'b0 : 1'bz;
	        reg_SIOD_0  =SIOD_o ? 1'b0 : 1'bz;
            SIOC_1  = 1'bz;
            reg_SIOD_1  = 1'bz;
		end
		2'b10:
		begin
			SIOC_0  = 1'bz;
	        reg_SIOD_0  = 1'bz;
            SIOC_1  = SIOC_o ? 1'b0 : 1'bz;
            reg_SIOD_1  = SIOD_o ? 1'b0 : 1'bz;
		end
		default:
		begin
			SIOC_0  = 1'bz;
	        reg_SIOD_0  = 1'bz;
            SIOC_1  = 1'bz;
            reg_SIOD_1  = 1'bz;
		end
	endcase
end			

reg [14:0] cnt_clk24;
wire stop = cnt_clk24 == 'd2500;
reg running;
reg sh_reset_n;
wire p_reset_n = reset_n & !sh_reset_n;
always @(posedge xclk_cam, negedge reset_n)
	if (~reset_n) 
		sh_reset_n <='0;
	else 
		sh_reset_n <= 1;
always @(posedge xclk_cam, negedge reset_n)
	if (~reset_n) 
		running <='0;
	else if(stop)
		running <= '0;
	else if(p_reset_n)
		running <= 1;
always @(posedge xclk_cam, negedge reset_n)
	if (~reset_n) 
		cnt_clk24 <='0;
	else if(running)
		cnt_clk24 <= cnt_clk24+1;
		
always @(posedge xclk_cam, negedge reset_n)
	if (~reset_n) 
		RESETB_0 <='0;
	else if(stop)
		RESETB_0 <= 1;
		
assign 	RESETB_1 =RESETB_0;
assign PWDN_0      = !reset_n;
assign PWDN_1      = !reset_n;
assign SIOD_0      = reg_SIOD_0 ;
assign SIOD_1      = reg_SIOD_1 ;
assign clk_cam_0_o = err_ch0 ? clk_23 : xclk_cam ;
assign clk_cam_1_o = err_ch1 ? clk_23 : xclk_cam ;


endmodule