`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    ov5640_vga 
//////////////////////////////////////////////////////////////////////////////////
module ov5640_vga(
   input clk_50M,
	input reset_n,
   output [3:0] led,               //led灯指示
	input key1,                     //control the camera flash LED 

	//Camera接口信号
	output camera_xclk,             //cmos externl clock
	output camera_reset,
   output camera_pwnd,
	
	input camera_pclk,              //cmos pxiel clock
   input camera_href,              //cmos hsync refrence
	input camera_vsync,             //cmos vsync
	input [7:0] camera_data,        //cmos data
	output i2c_sclk,                //cmos i2c clock
	inout i2c_sdat,	              //cmos i2c data

   //DDR的接口信号
   inout  [15:0]            mcb3_dram_dq,
   output [13:0]            mcb3_dram_a,
   output [2:0]             mcb3_dram_ba,
   output                   mcb3_dram_ras_n,
   output                   mcb3_dram_cas_n,
   output                   mcb3_dram_we_n,
   output                   mcb3_dram_odt,
   output                   mcb3_dram_cke,
   output                   mcb3_dram_dm,
   inout                    mcb3_dram_udqs,
   inout                    mcb3_dram_udqs_n,
   inout                    mcb3_rzq,
   inout                    mcb3_zio,
   output                   mcb3_dram_udm,
   inout                    mcb3_dram_dqs,
   inout                    mcb3_dram_dqs_n,
   output                   mcb3_dram_ck,
   output                   mcb3_dram_ck_n,
	
	 //VGA的接口信号
	 output [4:0]            vga_r,
    output [5:0]            vga_g,
    output [4:0]            vga_b,
    output                  vga_hsync,
    output                  vga_vsync,
	input  usb_clk ,
	input  flagA_EP6EF,
	input  flagB_EP6FF,
	input  flagC_EP8EF,
	input  flagD_EP8FF,
	output [15:0]USB_DATA,
	output [1:0]USB_FIFO_ADR ,
	output USB_SLWR,
	output USB_SLRD,
	output USB_SLOE
		
    );


wire reg_conf_done;
wire c3_rst0;

wire ddr_wren;
wire [63:0] ddr_data_camera;
wire ddr_addr_wr_set;

wire ddr_rden;
wire ddr_rd_cmd;
wire [63:0] ddr_data_vga;
wire ddr_addr_rd_set;

wire [1:0] config_step;	
wire initial_en;

wire [11:0] camera_h_count;
wire [10:0] camera_v_count;

wire [10 : 0] x_cnt;
wire [9 : 0]  y_cnt;	

wire clock_20k;
wire ack;

wire c3_clk0;

wire camera_rstn;

wire [1:0] frame_switch;

assign led[0]=c3_rst0?1'b1:1'b0;                   //led0为ddr calibrate完成指示信号,亮说明初始化完成
assign led[1]=reg_conf_done?1'b0:1'b1;             //led1为图像已存入DDR中完成指示信号,亮说明存储已完成
assign led[2]=c3_p0_wr_full?1'b0:1'b1;             //led2为写数据不足指示信号,亮说明错误
assign led[3]=c3_p0_cmd_full?1'b0:1'b1;            //led3为读数据over指示信号,亮说明错误

assign camera_xclk=camera_clk;
assign camera_reset=camera_rstn;

wire [2:0] ddr_write_state;

wire ddr_rd_req;
wire ddr_wr_req;
wire [4:0] vga_r_reg;
wire [5:0] vga_g_reg;
wire [4:0] vga_b_reg;
wire strobe_flash;
wire [8:0]reg_index;
reg nframe_buf1 = 1    ;
	reg nframe_buf2 = 1 ;
	reg nframe_buf3 = 1 ;
	reg nframe       ;
	wire nframe_wire ;
/////////////////////////////////
wire data_pulse    ;
wire [15:0]data_in ;
wire usb_de        ;
wire output_done   ;
assign data_in[4:0]   = vga_r_reg ;
assign data_in[10:5]  = vga_g_reg ;
assign data_in[15:11] = vga_b_reg ;

usb_controller usb_controller (
    .usb_clk(usb_clk), 
    .flagA_EP6EF(flagA_EP6EF), 
    .flagB_EP6FF(flagB_EP6FF), 
    .flagC_EP8EF(flagC_EP8EF), 
    .flagD_EP8FF(flagD_EP8FF), 
    .USB_DATA(USB_DATA), 
    .USB_FIFO_ADR(USB_FIFO_ADR), 
    .PKTEND(PKTEND), 
    .USB_SLWR(USB_SLWR), 
    .USB_SLRD(USB_SLRD), 
    .USB_SLOE(USB_SLOE), 
    .data_in(data_in), 
    .data_pulse(data_pulse), 
    .nframe(nframe_wire), 
    .send_out(usb_de)
    );
//上电延迟部分
power_on_delay	power_on_delay_inst(
	.clk_50M                 (camera_clk),
	.reset_n                 (reset_n),	
	.camera_rstn             (camera_rstn),
	.camera_pwnd             (camera_pwnd),
	.initial_en              (initial_en)		
);

//Camera初始化部分,Camera LED FLASH control
reg_config	reg_config_inst(
	.clk_25M                 (camera_clk),
	.camera_rstn             (camera_rstn),
	.initial_en              (initial_en),		
	.i2c_sclk                (i2c_sclk),
	.i2c_sdat                (i2c_sdat),
	.reg_conf_done           (reg_conf_done),
	.strobe_flash            (strobe_flash),
	.reg_index               (reg_index),
	.clock_20k               (clock_20k),
	.key1                    (key1)
);

//Camera采样部分
camera_capture	camera_capture_inst(
	.reg_conf_done           (reg_conf_done),	
	.camera_pclk             (camera_pclk),
	.camera_href             (camera_href),
	.camera_vsync            (camera_vsync),
	.camera_data             (camera_data),
	.ddr_wren                (ddr_wren),
	.ddr_data_camera         (ddr_data_camera),
	.ddr_addr_wr_set         (ddr_addr_wr_set),
	.camera_h_count          (camera_h_count),	
	.camera_v_count          (camera_v_count),
	.frame_switch            (frame_switch),
	.output_done             (output_done),
	.nframe                  (nframe_wire)
);
wire c3_calib_done ;	
	assign nframe_wire = nframe ;
	always @ ( posedge usb_clk )
		begin
			if ( c3_rst0 || !c3_calib_done )
				begin
					nframe_buf1 <= 0;
					nframe_buf2 <= 0;
					nframe_buf3 <= 0;
					nframe      <= 1;
				end
			else
				begin
					nframe_buf1 <= frame_switch[0];
					nframe_buf2 <= nframe_buf1    ;
					nframe_buf3 <= nframe_buf2    ;
					nframe      <= nframe_buf3 ^ nframe_buf2 ;
				end
		end
//	VGA显示控制部分
vga_disp	vga_disp_inst(
	.vga_clk                 (usb_clk),
	.vga_rst                 (nframe_wire),	
	
	.ddr_data_vga            (ddr_data_vga),
	.vga_r                   (vga_r),
	.vga_g                   (vga_g),
	.vga_b                   (vga_b),
	.vga_r_reg               (vga_r_reg),
	.vga_g_reg               (vga_g_reg),
	.vga_b_reg               (vga_b_reg),
	.vga_hsync               (vga_hsync),	
	.vga_vsync               (vga_vsync),
	.ddr_addr_rd_set         (ddr_addr_rd_set),
	.ddr_rden                (ddr_rden),
	.ddr_rd_cmd              (ddr_rd_cmd),
	.x_cnt                   (x_cnt),
	.y_cnt                   (y_cnt),
	.usb_de                  (usb_de),
	.data_pulse              (data_pulse),
	.output_done             (output_done)
);


//DDR读写控制部分
ddr_rw ddr_rw_inst(
	.c3_calib_done           (c3_calib_done),
	.camera_clk              (camera_clk),               //Camera时钟24MHz 
   .vga_clk                 (vga_clk),                  //VGA时钟输出25MHz 
   .c3_clk0                 (c3_clk0),                  // 
	.usb_clk                 (usb_clk),
   .nframe                  ( nframe_wire ),
	.frame_switch            (frame_switch),  	        //camera输入和VGA输出乒乓切换
//camera_capture模块接口信号 	
	.ddr_data_camera         (ddr_data_camera),
	.ddr_addr_wr_set         (ddr_addr_wr_set),	
	.ddr_wren                (ddr_wren),	
	.ddr_write_state         (ddr_write_state),
	.ddr_wr_req              (ddr_wr_req),	

//vga_disply模块接口信号 	
	.ddr_data_vga            (ddr_data_vga),
	.ddr_addr_rd_set         (ddr_addr_rd_set),
	.ddr_rden                (ddr_rden),
	.ddr_rd_cmd              (ddr_rd_cmd),
	.ddr_rd_req              (ddr_rd_req),	
	
	.c3_p0_wr_underrun       (c3_p0_wr_underrun),
	.c3_p0_wr_full           (c3_p0_wr_full),
	.c3_p0_cmd_full          (c3_p0_cmd_full),
	.c3_p1_rd_overflow       (c3_p1_rd_overflow),	
	.c3_p1_rd_empty          (c3_p1_rd_empty),	
	.c3_p1_cmd_full          (c3_p1_cmd_full),	
	.mcb3_dram_dq            (mcb3_dram_dq),	
	.mcb3_dram_a             (mcb3_dram_a),	
	.mcb3_dram_ba            (mcb3_dram_ba),	
	.mcb3_dram_ras_n         (mcb3_dram_ras_n),	
	.mcb3_dram_cas_n         (mcb3_dram_cas_n),	
	.mcb3_dram_we_n          (mcb3_dram_we_n),
	.mcb3_dram_odt           (mcb3_dram_odt),	
	.mcb3_dram_cke           (mcb3_dram_cke),	
	.mcb3_dram_dm            (mcb3_dram_dm),	
	.mcb3_dram_udqs          (mcb3_dram_udqs),	
	.mcb3_dram_udqs_n        (mcb3_dram_udqs_n),	
	.mcb3_rzq                (mcb3_rzq),	
	.mcb3_zio                (mcb3_zio),	
	.mcb3_dram_udm           (mcb3_dram_udm),
	.c3_sys_clk              (clk_50M),	
	.c3_sys_rst_n            (reset_n),
	.c3_rst0                 (c3_rst0),
	.mcb3_dram_dqs           (mcb3_dram_dqs),
	.mcb3_dram_dqs_n         (mcb3_dram_dqs_n),
	.mcb3_dram_ck            (mcb3_dram_ck),
	.mcb3_dram_ck_n          (mcb3_dram_ck_n)

);


wire [35:0]   CONTROL0;
wire [255:0]  TRIG0;
//chipscope_icon icon_debug (
//    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
//);
//
//chipscope_ila ila_filter_debug (
//    .CONTROL(CONTROL0), // INOUT BUS [35:0]
//   // .CLK(dma_clk),      // IN
//    .CLK(clock_20k),      // IN
//    .TRIG0(TRIG0)      // IN BUS [255:0]
//    //.TRIG_OUT(TRIG_OUT0)
//);                                                     
                                                       
  

assign  TRIG0[4:0]=vga_r;                                               
assign  TRIG0[10:5]=vga_g;           
assign  TRIG0[15:11]=vga_b;           
assign  TRIG0[16]=vga_hsync;
assign  TRIG0[17]=vga_vsync;
assign  TRIG0[81:18]=ddr_data_camera;
assign  TRIG0[82]=ddr_rd_req;

assign  TRIG0[101:94]=camera_data;
assign  TRIG0[102]=camera_href;
assign  TRIG0[103]=camera_vsync;
assign  TRIG0[104]=ddr_wr_req;
assign  TRIG0[116:105]=camera_h_count;
assign  TRIG0[127:117]=camera_v_count;

assign  TRIG0[138:128]=x_cnt;
assign  TRIG0[148:139]=y_cnt;
assign  TRIG0[212:149]=ddr_data_vga;

assign  TRIG0[215:213]=ddr_write_state;

assign TRIG0[216]=strobe_flash;
assign TRIG0[225:217]=reg_index;
endmodule

