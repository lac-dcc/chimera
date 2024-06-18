// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : hps_register_ov5640               //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 02.04.2018                        //
//Last revision : 26.04.2018                        //
//////////////////////////////////////////////////////

module hps_register_ov5640
(
	input  logic                        clk_sys              ,             
	input  logic                        reset_n              ,
	input  logic                        ready_ov5640         ,
	output logic                        start_ov5640         ,
	output logic [15:0]                 address_ov5640       ,
	output logic [7:0]                  data_ov5640          ,
	output logic [31:0]                 reg_addr_buf_1       ,
	output logic [31:0]                 reg_addr_buf_2       ,
	output logic [31:0]                 reg_addr_buf_3       ,
	output logic [3:0]                  hps_switch           ,
	output logic [3:0]                  hist_switch          ,
	output logic                        hist_enable          ,
	output logic [7:0]                  parallax_corr        ,
	output logic [1:0]                  select_cam_initial   ,
	output logic [7:0]                  div_coef             ,
	output logic [7:0]                  shift_coef           ,
	output logic signed 	[4:0]	    coef_conv[3][3]      ,
	output logic                        start_write_image2ddr,
	output logic [8:0]                  hps_control_S        ,
	output logic [8:0]                  hps_control_V        ,
	// bridge hps2-to-fpga                          
	avl_ifc.avl_write_slave_port        avl_h2f_write    
);
// адреса регистров //
localparam ADDR_BUF_1         = 16'd0  ;
localparam ADDR_BUF_2         = 16'd1  ;
localparam ADDR_HPS_switch    = 16'd2  ;
localparam ADDR_parallax_corr = 16'd3  ;
localparam ADDR_select_camera = 16'd4  ;
localparam ADDR_div_coef      = 16'd5  ;
localparam ADDR_shift_coef    = 16'd6  ;
localparam ADDR_coef_00       = 16'd7  ;
localparam ADDR_coef_01       = 16'd8  ;
localparam ADDR_coef_02       = 16'd9  ;
localparam ADDR_coef_10       = 16'd10 ;
localparam ADDR_coef_11       = 16'd11 ;
localparam ADDR_coef_12       = 16'd12 ;
localparam ADDR_coef_20       = 16'd13 ;
localparam ADDR_coef_21       = 16'd14 ;
localparam ADDR_coef_22       = 16'd15 ;
localparam ADDR_BUF_3         = 16'd16 ;
localparam ADDR_HIST_switch   = 16'd17 ;
localparam ADDR_HIST_enable   = 16'd18 ;
localparam ADDR_CONTROL_S     = 16'd19 ;
localparam ADDR_CONTROL_V     = 16'd20 ;
localparam ADDR_enable_fb     = 16'hFFFF;

wire write_hps = avl_h2f_write.chipselect &  avl_h2f_write.write;
reg [7:0]  data_camera;
reg [15:0] addr_camera;
reg reg_enable_fb;
reg [1:0]sh_reg;

enum logic [4:0]
{
    wait_transaction    ,
	config_camera       , 
	write_BUF_1         ,
	write_BUF_2         ,
	write_BUF_3         ,
	write_HPS_switch    ,
	write_HIST_switch   ,
	write_HIST_enable   ,
	write_parallax_corr ,
	write_select_camera ,
	write_div_coef      ,
	write_shift_coef    ,
	write_coef_00       ,
	write_coef_01       ,
	write_coef_02       ,
	write_coef_10       ,
	write_coef_11       ,
	write_coef_12       ,
	write_coef_20       ,
	write_coef_21       ,
	write_coef_22       ,
	write_enable_fb     ,
	write_control_s     ,
	write_control_v     
}reg_sel;


// выбор регистра для записи со стороны HPS
always_comb
	if( write_hps )
		case(avl_h2f_write.address)
			ADDR_BUF_1        :   reg_sel = write_BUF_1         ;
			ADDR_BUF_2        :   reg_sel = write_BUF_2         ;
			ADDR_BUF_3        :   reg_sel = write_BUF_3         ;
			ADDR_HPS_switch   :   reg_sel = write_HPS_switch    ;
			ADDR_HIST_switch   :  reg_sel = write_HIST_switch   ;
			ADDR_HIST_enable   :  reg_sel = write_HIST_enable   ;
			ADDR_parallax_corr:   reg_sel = write_parallax_corr ;
			ADDR_select_camera:   reg_sel = write_select_camera ;
			ADDR_div_coef     :   reg_sel = write_div_coef      ;
			ADDR_shift_coef   :   reg_sel = write_shift_coef    ;
			ADDR_coef_00      :   reg_sel = write_coef_00       ;
			ADDR_coef_01      :   reg_sel = write_coef_01       ;
			ADDR_coef_02      :   reg_sel = write_coef_02       ;
			ADDR_coef_10      :   reg_sel = write_coef_10       ;
			ADDR_coef_11      :   reg_sel = write_coef_11       ;
			ADDR_coef_12      :   reg_sel = write_coef_12       ;
			ADDR_coef_20      :   reg_sel = write_coef_20       ;
			ADDR_coef_21      :   reg_sel = write_coef_21       ;
			ADDR_coef_22      :   reg_sel = write_coef_22       ;
			ADDR_enable_fb    :   reg_sel = write_enable_fb     ;
			ADDR_CONTROL_S    :   reg_sel = write_control_s     ;
			ADDR_CONTROL_V    :   reg_sel = write_control_v     ;
			default           :   reg_sel = config_camera       ;
		endcase
	else
		reg_sel = wait_transaction;

// write data to fpga register from hps2fpga bridge		
always_ff @( posedge clk_sys or negedge reset_n )	
	if (~reset_n )	  
	begin
		reg_addr_buf_1        <= '0;
		reg_addr_buf_2        <= '0;
		hps_switch            <= '0;
		hist_switch           <= '0;
		parallax_corr         <= 'd10;
		select_cam_initial    <= '0;
		div_coef              <= 'd1;  
		shift_coef            <= '0;
		coef_conv[0][0]       <= '0;
		coef_conv[0][1]       <= '0;
		coef_conv[0][2]       <= '0;
		coef_conv[1][0]       <= '0;
		coef_conv[1][1]       <= 'd1;
		coef_conv[1][2]       <= '0;
		coef_conv[2][0]       <= '0;
		coef_conv[2][1]       <= '0;
		coef_conv[2][2]       <= '0;
		data_camera           <= '0;
		reg_enable_fb         <= '0;
	end 	
	else 
	begin
		case(reg_sel)
			write_BUF_1         :  reg_addr_buf_1        <= avl_h2f_write.writedata[31:0];
			write_BUF_2         :  reg_addr_buf_2        <= avl_h2f_write.writedata[31:0];
			write_BUF_3         :  reg_addr_buf_3        <= avl_h2f_write.writedata[31:0];
			write_HPS_switch    :  hps_switch            <= avl_h2f_write.writedata[ 7:0];
			write_HIST_switch   :  hist_switch           <= avl_h2f_write.writedata[ 3:0];
			write_HIST_enable   :  hist_enable           <= avl_h2f_write.writedata[   0];
			write_parallax_corr :  parallax_corr         <= avl_h2f_write.writedata[ 7:0];			
			write_select_camera :  select_cam_initial    <= avl_h2f_write.writedata[ 1:0];			
			write_div_coef      :  div_coef              <= avl_h2f_write.writedata[ 7:0];			
			write_shift_coef    :  shift_coef            <= avl_h2f_write.writedata[ 7:0];			
			write_coef_00       :  coef_conv[0][0]       <= avl_h2f_write.writedata[ 4:0];
			write_coef_01       :  coef_conv[0][1]       <= avl_h2f_write.writedata[ 4:0];
			write_coef_02       :  coef_conv[0][2]       <= avl_h2f_write.writedata[ 4:0];
			write_coef_10       :  coef_conv[1][0]       <= avl_h2f_write.writedata[ 4:0];
            write_coef_11       :  coef_conv[1][1]       <= avl_h2f_write.writedata[ 4:0];	
            write_coef_12       :  coef_conv[1][2]       <= avl_h2f_write.writedata[ 4:0];
            write_coef_20       :  coef_conv[2][0]       <= avl_h2f_write.writedata[ 4:0];
            write_coef_21       :  coef_conv[2][1]       <= avl_h2f_write.writedata[ 4:0];
            write_coef_22       :  coef_conv[2][2]       <= avl_h2f_write.writedata[ 4:0];
            write_enable_fb     :  reg_enable_fb         <= avl_h2f_write.writedata[   0];
            write_control_s     :  hps_control_S         <= avl_h2f_write.writedata[ 8:0];
            write_control_v     :  hps_control_V         <= avl_h2f_write.writedata[ 8:0];
            config_camera       :  data_camera           <= avl_h2f_write.writedata[ 7:0];
		endcase	
	end



wire valid_camera_config = (reg_sel == config_camera);
assign start_write_image2ddr = reg_enable_fb & !sh_reg[0];	
always_ff @( posedge clk_sys or negedge reset_n )
	if(~reset_n)
		addr_camera <='0;
	else 
		addr_camera <=  avl_h2f_write.address[15:0];
		
always_ff @( posedge clk_sys or negedge reset_n )
	if(~reset_n)
		sh_reg <='0;
	else 
		sh_reg <= {valid_camera_config ,reg_enable_fb} ;		
wire [23:0] fifo_in  =sh_reg[1] ? { data_camera, addr_camera } : 24'd0;
wire [23:0] fifo_out;
wire empty;
wire rdreq =  !empty & ready_ov5640;		
reg  sh_rdreq;
		
always_ff @( posedge clk_sys or negedge reset_n )	
	if (~reset_n )
		sh_rdreq <= 0;
	else
		sh_rdreq <= rdreq;
fifo_avl_mm  fifo_avl_mm_inst 
(
	.wrclk   (clk_sys        ),
	.rdclk   (clk_sys        ),
	.data    (fifo_in        ),
	.rdreq   (rdreq          ),//
	.wrreq   (sh_reg[1]      ),
	.rdempty (empty          ),
	.wrfull  (               ),
	.q       (fifo_out       ),
	.rdusedw (               )
);	
assign start_ov5640   = sh_rdreq;
assign address_ov5640 = fifo_out[15:0];
assign data_ov5640    = fifo_out[23:16];

endmodule