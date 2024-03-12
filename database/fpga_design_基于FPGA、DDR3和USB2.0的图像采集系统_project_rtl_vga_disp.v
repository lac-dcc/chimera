`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    vga_test 
//////////////////////////////////////////////////////////////////////////////////
module vga_disp(
			input vga_clk,
	      input vga_rst,                 
	      input [63:0] ddr_data_vga,          //DDR中的图像数据			
			input data_pulse,
			
			output vga_hsync,
			output vga_vsync,
			output [4:0] vga_r,
			output [5:0] vga_g,
			output [4:0] vga_b,
	      output reg [10 : 0] x_cnt,
         output reg [9 : 0]  y_cnt,	
         output reg ddr_addr_rd_set,         //ddr读地址复位信号
			output reg ddr_rd_cmd,
	      output reg ddr_rden,
			output reg usb_de,
			output reg output_done,
			output reg [4:0] vga_r_reg,
			output reg [5:0] vga_g_reg,
			output reg [4:0] vga_b_reg
    );

//-----------------------------------------------------------//
// 水平扫描参数的设定1280*768 VGA 60FPS_79.5MHz
//-----------------------------------------------------------//
parameter LinePeriod =1664;            //行周期数
parameter H_SyncPulse=128;             //行同步脉冲（Sync a）
parameter H_BackPorch=192 ;            //显示后沿（Back porch b）
parameter H_ActivePix=1280;            //显示时序段（Display interval c）
parameter H_FrontPorch=64;             //显示前沿（Front porch d）

parameter Hde_start=320;
parameter Hde_usb_end = 1344;
parameter Hde_end=1600;
//-----------------------------------------------------------//
// 垂直扫描参数的设定1280*768 VGA 60FPS_79.5MHz
//------------------- ----------------------------------------//
parameter FramePeriod =790;           //列周期数
parameter V_SyncPulse=7;              //列同步脉冲（Sync o）
parameter V_BackPorch=12 ;            //显示后沿（Back porch p）
parameter V_ActivePix=768;            //显示时序段（Display interval q）
parameter V_FrontPorch=3;             //显示前沿（Front porch r）

parameter Vde_start=19;
parameter Vde_end=739;                //实际显示720个像数


//reg[4 : 0] vga_r_reg;
//reg[5 : 0] vga_g_reg;
//reg[4 : 0] vga_b_reg;  
  
reg hsync_r;
reg vsync_r; 
reg hsync_de;
reg vsync_de;
reg usb_de_buf;
 
reg [127:0] ddr_data_reg;               //ddr的输入数据存储 （高64可能没用上）
reg [3:0] num_counter;       
		  
reg vsync_buf1;
reg vsync_buf2; 

//----------------------------------------------------------------
////////// 水平扫描计数
//----------------------------------------------------------------
reg read_flag ;
always @ (posedge vga_clk or posedge vga_rst )
 begin
       if(vga_rst)    x_cnt <= 1;
       else if(x_cnt == LinePeriod) x_cnt <= 1;
       else if ( usb_de ) x_cnt <= x_cnt+ data_pulse ;
		 else	x_cnt <= x_cnt+ 1;
 end
always @ (posedge vga_clk or posedge vga_rst)
	begin
		if ( vga_rst )
			begin
				read_flag <= 0 ;
			end
		else
			if ( usb_de_buf )
				begin
					read_flag <= data_pulse && vsync_de ;
				end
			else
				begin
					read_flag <= hsync_de && vsync_de ;
				end
	end
always @ (posedge vga_clk or posedge vga_rst)
	begin
		if ( vga_rst )
			usb_de <= 0 ;
		else
			usb_de <= usb_de_buf	 && vsync_de ;
	end
//----------------------------------------------------------------
////////// 水平扫描信号hsync,hsync_de产生
//----------------------------------------------------------------
always @ (posedge vga_clk or posedge vga_rst)////No impact on our design
   begin
       if(vga_rst) hsync_r <= 1'b1;
       else if(x_cnt == 1) hsync_r <= 1'b0;             //产生hsync信号
       else if(x_cnt == H_SyncPulse) hsync_r <= 1'b1;
		 
		 		 
	    if(vga_rst) 
			begin
				hsync_de  <= 1'b0;
				usb_de_buf<= 1'b0;
			end
       else if(x_cnt == Hde_start)
					begin
						hsync_de  <= 1'b1;    //产生hsync_de信号
						usb_de_buf<= 1'b1;
					end
       else if(x_cnt == Hde_end) hsync_de <= 1'b0;	
		 else	if ( x_cnt == Hde_usb_end ) usb_de_buf   <= 1'b0;
		 
		 if (vga_rst)
			begin
				ddr_rd_cmd <= 1'b0;  
			end
		 else
			if(vsync_de ) 
				begin
					if( (x_cnt == 250) | (x_cnt == 410) | (x_cnt == 570) | (x_cnt == 730) | (x_cnt == 890) | (x_cnt == 1050) | (x_cnt == 1210) | (x_cnt == 1370))        //在一行的8个地方产生DDR busrt读命令
						ddr_rd_cmd <= 1'b1;    
					else
						ddr_rd_cmd <= 1'b0; 
				end 				     
			else 
     			 ddr_rd_cmd <= 1'b0;  	
 
	end

//----------------------------------------------------------------
////////// 垂直扫描计数
//----------------------------------------------------------------
always @ ( posedge vga_clk or posedge vga_rst  )
	begin
		if ( vga_rst )
			begin
				output_done <= 0 ;
			end
		else
			if(y_cnt == FramePeriod)
				output_done <= 1 ;
	end
always @ (posedge vga_clk or posedge vga_rst)
 begin
       if(vga_rst) y_cnt <= 1;
		 else	if(y_cnt == FramePeriod) y_cnt <= y_cnt;//y_cnt <= 1;
		 else if(x_cnt == LinePeriod) y_cnt <= y_cnt+1;
				
 end
//----------------------------------------------------------------
////////// 垂直扫描信号vsync, vsync_de产生
//----------------------------------------------------------------
always @ (posedge vga_clk or posedge vga_rst)
  begin
       if(vga_rst) vsync_r <= 1'b0;
       else if(y_cnt == 1) vsync_r <= 1'b0;             //产生vsync信号
       else if(y_cnt == V_SyncPulse) vsync_r <= 1'b1;
		 
	    if(vga_rst) vsync_de <= 1'b0;
       else if(y_cnt == Vde_start) vsync_de <= 1'b1;    //产生vsync_de信号
       else if(y_cnt == Vde_end) vsync_de <= 1'b0;	 
  end
		 

//----------------------------------------------------------------
////////// ddr地址复位处理程序（相同的）
//---------------------------------------------------------------- 
always @(posedge vga_clk or posedge vga_rst )
begin
   if (vga_rst) begin
	    vsync_buf1<=1'b0;
		 vsync_buf2<=1'b0;
	    ddr_addr_rd_set<=1'b0;
   end
   else begin
		 vsync_buf1<=vsync_r;
		 vsync_buf2<=vsync_buf1;
       if (~vsync_buf2&vsync_buf1)      //检测vsync的下降沿,ddr的地址复位
		   ddr_addr_rd_set<=1'b1;
		 else
		   ddr_addr_rd_set<=1'b0;		   
	end
end

//----------------------------------------------------------------
////////// ddr读请求信号产生程序	, 64bit的DDR数据转成4个像素输出
//---------------------------------------------------------------- 
 always @(negedge vga_clk or posedge vga_rst )
 begin
   if (vga_rst) begin
		 ddr_data_reg<=128'd0;
		 vga_r_reg<=5'd0;
		 vga_g_reg<=6'd0;
		 vga_b_reg<=5'd0;
		 num_counter<=4'b0000;
		 ddr_rden<=1'b0;   
   end
   else begin
    if (read_flag ) begin             //如果VGA输出有效的图像数据
		       case(num_counter)
			    4'b0000:begin                                      //第N个像数（1，5....)
                  vga_b_reg<=ddr_data_reg[15:11];           
                  vga_g_reg<=ddr_data_reg[10:5];
                  vga_r_reg<=ddr_data_reg[4:0];
						num_counter<=4'b0001;
						ddr_rden<=~ddr_rden;                              //ddr读数据请求
						ddr_data_reg<=ddr_data_vga;
				 end
			    4'b0001:begin 
						vga_b_reg<=ddr_data_reg[63:59];
                  vga_g_reg<=ddr_data_reg[58:53];
                  vga_r_reg<=ddr_data_reg[52:48];//第N+1个像数（2，6....)
                  num_counter<=4'b0010;
             end						
			    4'b0010:begin
						vga_b_reg<=ddr_data_reg[47:43];
                  vga_g_reg<=ddr_data_reg[42:37];
                  vga_r_reg<=ddr_data_reg[36:32];//第N+2个像数（3，7....)
						num_counter<=4'b0011;	
				 end
			    4'b0011:begin                                   //第N+3个像数（4，8....)	
						vga_b_reg<=ddr_data_reg[31:27];
                  vga_g_reg<=ddr_data_reg[26:21];
                  vga_r_reg<=ddr_data_reg[20:16];
						//ddr_data_reg<=ddr_data_vga;
						num_counter<=4'b0000;
             end				
             default:begin
					  vga_b_reg<=5'd0;                    
                 vga_g_reg<=6'd0;
                 vga_r_reg<=5'd0;
					  num_counter<=4'b0000;	
					  ddr_rden<=1'b0;
				 end
				 endcase;
		end
		else begin
//				vga_b_reg<=5'd0;                    
//            vga_g_reg<=6'd0;
//            vga_r_reg<=5'd0;
				num_counter<=4'b0000;
			   ddr_data_reg<=ddr_data_vga;                     //ddr数据改变
		end
	 end
end



assign vga_hsync = hsync_r;
assign vga_vsync = vsync_r;  

assign vga_r = (hsync_de & vsync_de)?vga_r_reg:5'b00000;
assign vga_g = (hsync_de & vsync_de)?vga_g_reg:6'b000000;
assign vga_b = (hsync_de & vsync_de)?vga_b_reg:5'b00000;


endmodule
