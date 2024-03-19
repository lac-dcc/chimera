`timescale 1ns/1ns
module VIP_horizon_projection
#(
	parameter	[9:0]	IMG_HDISP = 10'd640,	//640*480
	parameter	[9:0]	IMG_VDISP = 10'd480
)
(
	//global clock
	input				clk,  				//cmos video pixel clock
	input				rst_n,				//global reset

	//Image data prepred to be processd
	input				per_frame_vsync,	//Prepared Image data vsync valid signal
	input				per_frame_href,		//Prepared Image data href vaild  signal
	input				per_frame_clken,	//Prepared Image data output/capture enable clock
	input				per_img_Bit,		//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	output				post_frame_vsync,	//Processed Image data vsync valid signal
	output				post_frame_href,	//Processed Image data href vaild  signal
	output				post_frame_clken,	//Processed Image data output/capture enable clock
	output				post_img_Bit, 		//Processed Image Bit flag outout(1: Value, 0:inValid)

    output reg [9:0] 	max_line_up ,        //边沿坐标
    output reg [9:0] 	max_line_down,
	
    input      [9:0] 	horizon_start,		//投影起始列
    input      [9:0] 	horizon_end			//投影结束列  
);

reg [9:0] 	max_pixel_up  ;
reg [9:0] 	max_pixel_down;

reg			per_frame_vsync_r;
reg			per_frame_href_r;	
reg			per_frame_clken_r;
reg  		per_img_Bit_r;

reg			per_frame_vsync_r2;
reg			per_frame_href_r2;	
reg			per_frame_clken_r2;
reg         per_img_Bit_r2;

assign	post_frame_vsync 	= 	per_frame_vsync_r2;
assign	post_frame_href 	= 	per_frame_href_r2;	
assign	post_frame_clken 	= 	per_frame_clken_r2;
assign  post_img_Bit     	=   per_img_Bit_r2;

//------------------------------------------
//lag 1 clocks signal sync  

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		per_frame_vsync_r2 	<= 0;
		per_frame_href_r2 	<= 0;
		per_frame_clken_r2 	<= 0;
		per_img_Bit_r2		<= 0;
		end
	else
		begin
		per_frame_vsync_r2 	<= 	per_frame_vsync_r 	;
		per_frame_href_r2	<= 	per_frame_href_r 	;
		per_frame_clken_r2 	<= 	per_frame_clken_r 	;
		per_img_Bit_r2		<= 	per_img_Bit_r		;
		end
end

//------------------------------------------
//lag 1 clocks signal sync  

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		per_frame_vsync_r 	<= 0;
		per_frame_href_r 	<= 0;
		per_frame_clken_r 	<= 0;
		per_img_Bit_r		<= 0;
		end
	else
		begin
		per_frame_vsync_r 	<= 	per_frame_vsync	;
		per_frame_href_r	<= 	per_frame_href	;
		per_frame_clken_r 	<= 	per_frame_clken	;
		per_img_Bit_r	    <= 	per_img_Bit		;
		end
end

wire vsync_pos_flag;
wire vsync_neg_flag;

assign vsync_pos_flag = per_frame_vsync    & (~per_frame_vsync_r);
assign vsync_neg_flag = (~per_frame_vsync) & per_frame_vsync_r;

//------------------------------------------
//对输入的像素进行“行/场”方向计数，得到其纵横坐标
reg [9:0]  	x_cnt;
reg [9:0]   y_cnt;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			x_cnt <= 10'd0;
			y_cnt <= 10'd0;
		end
	else
		if(vsync_pos_flag)begin
			x_cnt <= 10'd0;
			y_cnt <= 10'd0;
		end
		else if(per_frame_clken) begin
			if(x_cnt < IMG_HDISP - 1) begin
				x_cnt <= x_cnt + 1'b1;
				y_cnt <= y_cnt;
			end
			else begin
				x_cnt <= 10'd0;
				y_cnt <= y_cnt + 1'b1;
			end
		end
end

//------------------------------------------
//寄存“行/场”方向计数
reg [9:0]  	x_cnt_r;
reg [9:0]   y_cnt_r;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			x_cnt_r <= 10'd0;
			y_cnt_r <= 10'd0;
		end
	else begin
			x_cnt_r <= x_cnt;
            y_cnt_r <= y_cnt;
		end
end

//------------------------------------------
//水平方向投影
reg  		ram_wr;
wire [9:0] 	ram_wr_data;
wire [9:0] 	ram_rd_data;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ram_wr <= 1'b0;
    end
    else if(per_frame_clken && (y_cnt != IMG_VDISP - 1'b1))
        ram_wr <= 1'b1;
    else
        ram_wr <= 1'b0;
end

//对所有列进行水平投影
//assign ram_wr_data = (y_cnt == 10'd0) ? 10'd0 : 				//图像的第一行，RAM清零
//                        per_img_Bit_r ? ram_rd_data + 1'b1 :
//                            ram_rd_data;

assign ram_wr_data = (y_cnt == 10'd0) ? 10'd0 : 				//图像的第一行，RAM清零
                        ((x_cnt > horizon_start) && (x_cnt < horizon_end)) ? (ram_rd_data + per_img_Bit_r) :
                            ram_rd_data;

wire [9:0] ram_wr_addr;
//在图像人的第一行和最后一行，需要遍历RAM中的数据
assign ram_wr_addr = (y_cnt == 10'd0)  ?  x_cnt : y_cnt_r;


wire [9:0] ram_rd_addr;
//在图像人的第一行和最后一行，需要遍历RAM中的数据
assign ram_rd_addr = ((y_cnt == 10'd0) || (y_cnt == IMG_VDISP - 1'b1))  ?  x_cnt : y_cnt;

ram	u_projection_ram (
	.wrclock 	( clk ),
	.wren 		( ram_wr ),
	.wraddress 	( ram_wr_addr ),
	.data 		( ram_wr_data ),
	
	.rdclock 	( clk ),
	.rdaddress 	( ram_rd_addr ),
	.q 			( ram_rd_data )
	);
	
reg [9:0] rd_data_d1;
reg [9:0] rd_data_d2;
reg [9:0] rd_data_d3;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_data_d1 <= 10'd0;
        rd_data_d2 <= 10'd0;
    end
    else if(per_frame_clken) begin
        rd_data_d1 <= ram_rd_data;
        rd_data_d2 <= rd_data_d1;
        rd_data_d3 <= rd_data_d2;
	end
end

reg [9:0] max_num1  ;
reg [9:0] max_y1    ;
reg [9:0] max_num2  ;
reg [9:0] max_y2    ;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        max_y1   <= 10'd0;
        max_num1 <= 10'd0;
        max_y2   <= 10'd0;
        max_num2 <= 10'd0;
    end
    else if(per_frame_clken) begin

        if(y_cnt == IMG_VDISP - 1'b1) begin    //图像的最后一行，遍历RAM中的数据，求极值 
			if((rd_data_d2 == 10'd0) && (ram_rd_data > 10'd40)) begin	//上升沿
			    max_y1		<= x_cnt_r-4;
				max_num1	<= rd_data_d1;
			end	
			else if((rd_data_d3 == 10'd0) && (ram_rd_data > 10'd40)) begin	//上升沿
			    max_y1		<= x_cnt_r-4;
				max_num1	<= rd_data_d1;
			end	
			
			if((rd_data_d2 > 10'd40) && (ram_rd_data == 10'd0)) begin	//下降沿
			    max_y2   	<= x_cnt_r-4;
				max_num2  	<= rd_data_d1;
			end	
			else if((rd_data_d3 > 10'd40) && (ram_rd_data == 10'd0)) begin	//下降沿
			    max_y2   	<= x_cnt_r-4;
				max_num2  	<= rd_data_d1;
			end	
		
		end
		
	end
	else if(vsync_pos_flag)begin
        max_y1   <= 10'd0;
        max_num1 <= 10'd0;
        max_y2   <= 10'd0;
        max_num2 <= 10'd0;
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        max_line_up  <= 10'd0;
        max_line_down <= 10'd0;
        max_pixel_up  <= 10'd0;
        max_pixel_down <= 10'd0;
    end
    else if(vsync_neg_flag) begin
		max_line_up   <= max_y1;
		max_pixel_up  <= max_num1;
		
		max_line_down  <= max_y2;
		max_pixel_down <= max_num2;
    end   
end
	
/*
reg [9:0] max_num1  ;
reg [9:0] max_y1    ;
reg [9:0] max_num2  ;
reg [9:0] max_y2    ;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        max_num1 <= 10'd0;
        max_y1   <= 10'd0;
        max_num2 <= 10'd0;
        max_y2   <= 10'd0;
    end
    else if(per_frame_clken) begin

        if(y_cnt == IMG_VDISP - 1'b1) begin    //图像的最后一行，遍历RAM中的数据，求极值 
            if(ram_rd_data >= max_num1) begin
                max_num1 <= ram_rd_data;
                max_y1   <= x_cnt_r;
                
                if(x_cnt_r - 3 > max_y1 ) begin  //排除相邻几个极大值
                    max_num2 <= max_num1;
                    max_y2   <= max_y1;
                end
                
            end
            else if(ram_rd_data > max_num2) begin
            
                if(x_cnt_r - 3 > max_y1) begin
                    max_num2 <= ram_rd_data;
                    max_y2   <= x_cnt_r;
                end
            end
        end
        else begin
            max_num1 <= 10'd0;
            max_y1   <= 10'd0;
            max_num2 <= 10'd0;
            max_y2   <= 10'd0;
        end
        
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        max_line_up  <= 10'd0;
        max_line_down <= 10'd0;
        max_pixel_up  <= 10'd0;
        max_pixel_down <= 10'd0;
    end
    else if((y_cnt == IMG_VDISP) && vsync_neg_flag) begin
            if(max_y1 > max_y2) begin
                max_line_up   <= max_y2;
                max_pixel_up  <= max_num2;
                
                max_line_down  <= max_y1;
                max_pixel_down <= max_num1;
            end
            else begin 
                max_line_up   <= max_y1;
                max_pixel_up  <= max_num1;
                
                max_line_down  <= max_y2;
                max_pixel_down <= max_num2;
            end
    end   
end
*/
endmodule
