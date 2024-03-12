`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    camera_capture 
//////////////////////////////////////////////////////////////////////////////////
module camera_capture(
	input reg_conf_done,	
	input camera_pclk,
   input camera_href,
	input camera_vsync,
	input [7:0] camera_data,	
	output reg ddr_wren,                             //ddr camera写入信号, 高写
	output reg [63:0] ddr_data_camera,               //ddr camera写入数据
	output reg ddr_addr_wr_set,                      //ddr 地址复位信号,高复位ddr的写地址
	output reg [11:0] camera_h_count,            //only for chipscope debug
	output reg [10:0] camera_v_count,             //only for chipscope debug
	output reg [1:0] frame_switch,
	input output_done ,
	input nframe      
);

//reg ddr_wren;
//reg [63:0] ddr_data_camera;
//reg ddr_addr_wr_set;

reg [63:0] camera_data_reg;
reg [3:0] counter;

reg camera_vsync_buf1;
reg camera_vsync_buf2;
reg flag_data ;
reg [7:0]camera_data_buf ;
reg [2:0]nframe_counter ;
reg nframe_flag   ;
reg output_done_buf1 ;
reg output_done_buf2 ;
reg output_done_flag ;
reg output_done_buf_flag = 1 ;
reg change_nframe_switch;
reg change_nframe_switch_buf1;
reg change_nframe_switch_buf2;
/*always @ ( posedge camera_pclk  )
	begin
		change_nframe_switch_buf1 <= frame_switch[0] ;
		change_nframe_switch_buf2 <= change_nframe_switch_buf1 ;
		change_nframe_switch      <= change_nframe_switch_buf1 ^ change_nframe_switch_buf2;
	end*/
always @ ( posedge camera_pclk or posedge nframe )
	begin
		if ( nframe )
			output_done_buf_flag <= 0 ;
		else
			if ( output_done_flag )
				output_done_buf_flag <= 1  ;
			
	end
always @ ( posedge camera_pclk or posedge nframe  )
	begin
		if ( nframe )
			begin
				output_done_buf1 <= 0 ;
				output_done_buf2 <= 0 ;
				output_done_flag <= 0 ;
			end
		else
			begin
				output_done_buf1 <= output_done ;
				output_done_buf2 <= output_done_buf1 ;
				output_done_flag <= output_done_buf2 && output_done_buf1 ;
			end
	end
//always @ ( posedge camera_pclk  )
//	begin
//		if ( camera_vsync_buf1&~camera_vsync_buf2)
//			begin
//		    camera_data_buf <= 8'h00 ;
//			 flag_data       <= 0   ;
//			end
//		else
//			if ( camera_v_count== 1 )
//				begin
//						{camera_data_buf,flag_data} <= {camera_data_buf,flag_data} + 1 ;
//				end
//			else
//				if ( camera_v_count== 720 )
//				begin
//					 {camera_data_buf,flag_data} <= {camera_data_buf,flag_data} + camera_href ;
//				end
//				else
//					if ( camera_v_count== 2 )
//						begin
//							camera_data_buf <= 8'h00 ;
//						end
//					else
//						if ( camera_v_count== 3 )
//							begin
//								camera_data_buf <= 8'hBB ;
//							end
//						else
//							begin
//								camera_data_buf <= 8'h00 ;
//							end
//	end


//产生camera行计数  
always @(posedge camera_pclk)
begin
	 if (!reg_conf_done) 
       camera_h_count<=1;
	 else if((camera_href==1'b1) & (camera_vsync==1'b0))  
       camera_h_count<=camera_h_count+1'b1;	  
	 else 
	 	 camera_h_count<=1;
 
end
reg v_buf1;
reg v_buf2;
reg v_buf_flag;
always @ ( posedge camera_pclk )
	begin
		v_buf1 <= (camera_href==1'b1) & (camera_vsync==1'b0) ;
		v_buf2 <= v_buf1 ;
		v_buf_flag <= v_buf2 && (~v_buf1) ;
	end
//产生camera列计数
always @(posedge camera_pclk)
begin
	 if (camera_vsync_buf2&~camera_vsync_buf1) 
		begin
       camera_v_count<=1;
		 //camera_data_buf <= 0 ;
		end
	 else if(camera_h_count == 2560)
		begin
       camera_v_count<=camera_v_count+1'b1;
		 //camera_data_buf <= camera_data_buf + 1 ;
		 end 
	 else 
	 	 camera_v_count<=camera_v_count;
		 
end
	
//产生camera数据存储到DDR中的请求信号 8->64
always @(posedge camera_pclk)
begin
	 if (!reg_conf_done) begin 
			camera_data_reg<=0;
			ddr_wren<=1'b0;
			counter<=0;
	 end	
	 else if((camera_href==1'b1) & (camera_vsync==1'b0) )begin//& (output_done_buf_flag == 1) ) begin   
		   if(counter<7) begin                              //读取前0~6个camera数据	  
				 camera_data_reg<={camera_data_reg[55:0],camera_data};
				 counter<=counter+1'b1;
				 ddr_wren<=1'b0;
			end
			else begin                                       //读取第7个camera数据		  
				 ddr_data_camera<={camera_data_reg[55:0],camera_data};
				 camera_data_reg<=0;
				 counter<=0; 
			    ddr_wren<=1'b1;                              //接收到8个bytes数据,产生ddr写信号				 
			end
	  end
	  else begin
				camera_data_reg<=0;
				ddr_wren<=1'b0;
				counter<=0;
	  end
end

//----------------------------------------------------
//产生camera数据存储的地址复位信号
  always @(posedge camera_pclk)
   if (!reg_conf_done) begin
	    camera_vsync_buf1<=1'b0;
		 camera_vsync_buf2<=1'b0;
	    ddr_addr_wr_set<=1'b0;
		 frame_switch<=0;
		 nframe_counter <= 0 ;
		 nframe_flag <= 0 ;
   end
   else begin
		 camera_vsync_buf1<=camera_vsync;
		 camera_vsync_buf2<=camera_vsync_buf1;
       if (camera_vsync_buf2&(~camera_vsync_buf1))      //检测vsync的下降沿,ddr的写地址复位
			ddr_addr_wr_set<=~ddr_addr_wr_set;
//		   ddr_addr_wr_set<=1'b1;
//		 else
//		   ddr_addr_wr_set<=1'b0;

       if (camera_vsync_buf1& (~camera_vsync_buf2) )      //检测vsync的上降沿,Frame读和写的地址空间交换
		   frame_switch<=frame_switch + output_done_buf_flag;
   
   end

		
endmodule

