/*
/---------------------------------------------/

sps_complete 置1以后 分辨率信号pic_width_in_mbs_minus1和pic_height_in_map_units_minus1有效，

/---------------------------------------------/

img_wr_n 置0的时候，地址和数据是有效的，

img_wr_n 
________   __________
        |_|
数据     __
xxxxxxxx|_|xxxxxxxxxx

地址(mb_h,mb_v,intra16_pred_num)
         _
xxxxxxxx|_|xxxxxxxxxx

/---------------------------------------------/

slice_end 代表一片结束，或者一帧结束，一般一帧就是一片

/---------------------------------------------/

(mb_v,mb_h):    16*16块的横纵坐标   

(0,0)   (0,1)   (0,2)   (0,3)
(1,0)   (1,1)   (1,2)   (1,3)
(2,0)   (2,1)   (2,2)   (2,3)

/---------------------------------------------/

intra16_pred_num ：代表一个16*16块中的4*4 坐标  取值-1 - 49
其中0-15 是y ...18-33 是u ...34-49 是v   -1,16,17为解码需要，不生成最终的像素

 0  1  4  5        uv类似
 2  3  6  7
 8  9  12 13
10  11 14 15


总结来说，每一组有效的(mb_v,mb_h,intra16_pred_num),对应16个有效的像素点。
*/
`include "timescale.v"
`include "define.v"


module a_tb();

reg clk,reset_n; 
reg [15:0] ai_data;
wire ai_we,ao_next;


wire [7:0]  pic_width_in_mbs_minus1,pic_height_in_map_units_minus1;
wire [31:0] img0,img1,img2,img3;
wire img_wr_n,slice_end,sps_complete;
wire [6:0] mb_h,mb_v;
wire [5:0] intra16_pred_num;
reg [0:63] mem [0:8000000];
reg [0:512000000] BS_buffer;
reg [0:31] i;
reg [31:0] pc_count;

initial begin
  
  $readmemh("dat/bird.dat",mem);
  for(i=0;i<32'd8000000;i=i+1)
    BS_buffer[64*i +: 64] <= mem[i];
 
end  

always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		pc_count <= 0;
	else if(ao_next)
		pc_count <= pc_count + 1;

always@(pc_count or BS_buffer)
	ai_data = BS_buffer[(pc_count<<4) +: 16];

assign ai_we = 1;


initial begin
	clk = 1'b1;
	reset_n = 1'b1;
	
	#100 reset_n = 1'b0;
	#100 reset_n = 1'b1;
	//#3000000000 $stop;
	end

always begin
	#50 clk = ~clk;
       end



h264i h264i_tb(
	.clk(clk),.reset_n(reset_n),
   .ai_data(ai_data),
   .ai_we(ai_we),
   .ao_next(ao_next),
	.slice_end(slice_end),.sps_complete(sps_complete),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),
	.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.img0(img0),.img1(img1),.img2(img2),.img3(img3),
	.img_wr_n(img_wr_n),.mb_h(mb_h),.mb_v(mb_v),
	.intra16_pred_num(intra16_pred_num)
);

reg [15:0] frame_num;
always @(posedge clk or negedge reset_n)
	if(reset_n == 0)
		frame_num <= 0;
	else if(slice_end)
		frame_num <= frame_num + 16'd1;


wire [7:0] hundred,decade,unit;

assign hundred = frame_num / 100 + 8'd48;
assign decade = (frame_num % 100) / 10 + 8'd48;
assign unit = frame_num % 10 + 8'd48;

integer file;
integer j;
reg [23:0] nn;


reg [31:0] y [522239:0];
reg [31:0] u [522239:0];
reg [31:0] v [522239:0];

wire [1:0] yuv_sel;
assign yuv_sel = intra16_pred_num < 6'd16 ? 0 : 
		 intra16_pred_num < 6'd34 ? 1 : 2;

wire [5:0] num;
assign num = intra16_pred_num < 6'd16 ? intra16_pred_num :
	     intra16_pred_num < 6'd34 ? intra16_pred_num - 6'd18 : intra16_pred_num - 6'd34;

wire [31:0] i_offset;
reg  [31:0] i_de;
assign i_offset = {25'd0,mb_h} * 32'd4 + {25'd0,mb_v} * 32'd480 * 32'd16;

always@(num)
	case(num[3:0])
	0:	i_de = 0;
	1:	i_de = 1;
	2:	i_de = 32'd1920;
	3:	i_de = 32'd1921;
	4:	i_de = 2;
	5:	i_de = 3; 
	6:	i_de = 32'd1922;
	7:	i_de = 32'd1923;
	8:	i_de = 32'd3840;
	9:	i_de = 32'd3841;
	10:	i_de = 32'd5760;
	11:	i_de = 32'd5761;
	12:	i_de = 32'd3842;
	13:	i_de = 32'd3843;
	14:	i_de = 32'd5762;
	15:	i_de = 32'd5763;
	endcase
		
always@(img_wr_n or yuv_sel or i_offset or i_de or img0 or img1 or img2 or img3)
	if(img_wr_n == 0)begin
		if(yuv_sel == 0)begin
			y[i_offset + i_de] 	     = img0;
			y[i_offset + i_de + 32'd480] = img1;
			y[i_offset + i_de + 32'd960] = img2;
			y[i_offset + i_de + 32'd1440] = img3;end
		else if(yuv_sel == 1)begin
			u[i_offset + i_de] 	     = img0;
			u[i_offset + i_de + 32'd480] = img1;
			u[i_offset + i_de + 32'd960] = img2;
			u[i_offset + i_de + 32'd1440] = img3;end
		else if(yuv_sel == 2)begin
			v[i_offset + i_de] 	     = img0;
			v[i_offset + i_de + 32'd480] = img1;
			v[i_offset + i_de + 32'd960] = img2;
			v[i_offset + i_de + 32'd1440] = img3;end
	end



always@(slice_end or hundred or decade or unit )
	if( slice_end)begin
		nn = {hundred,decade,unit};
		file = $fopen(nn,"w");
		for(j=0;j < 522240;j=j+1)begin
		$fdisplay (file,"%h", y[j][7:0]);
		$fdisplay (file,"%h", y[j][15:8]);
		$fdisplay (file,"%h", y[j][23:16]);
		$fdisplay (file,"%h", y[j][31:24]);end
		
		for(j=0;j < 522240;j=j+1)begin
		$fdisplay (file,"%h", u[j][7:0]);
		$fdisplay (file,"%h", u[j][15:8]);
		$fdisplay (file,"%h", u[j][23:16]);
		$fdisplay (file,"%h", u[j][31:24]);end
		
		for(j=0;j < 522240;j=j+1)begin
		$fdisplay (file,"%h", v[j][7:0]);
		$fdisplay (file,"%h", v[j][15:8]);
		$fdisplay (file,"%h", v[j][23:16]);
		$fdisplay (file,"%h", v[j][31:24]);end
		
		$fclose(file);
		end

















/*
wire [15:0] width_div4,width_div8;

assign width_div4 = {6'b0,(pic_width_in_mbs_minus1 + 8'b1),2'b0};
assign width_div8 = {7'b0,(pic_width_in_mbs_minus1 + 8'b1),1'b0};



assign luma_i = ({9'b0,bo_addr_luma[10:0]}) * {4'b0,width_div4} + ({11'b0,bo_addr_luma[19:11]});

assign chroma_i = ({8'b0,bo_addr_chroma[9:0]}) * {2'b0,width_div8} + ({10'b0,bo_addr_chroma[17:10]});


wire[19:0] addr_y,addr_uv;

reg [31:0] y [522239:0];
reg [31:0] u [130559:0];
reg [31:0] v [130559:0];

assign addr_y = {12'b0,(pic_width_in_mbs_minus1 + 8'b1)}*{12'b0,(pic_height_in_map_units_minus1 + 8'b1)} << 6;
assign addr_uv = {12'b0,(pic_width_in_mbs_minus1 + 8'b1)}*{12'b0,(pic_height_in_map_units_minus1 + 8'b1)} << 4;

always@(posedge clk or negedge reset_n)
	if(bo_we_luma)
		y[luma_i] <= bo_data;
	else if(bo_we_chroma && bo_addr_chroma[18] == 0)
		u[chroma_i] <= bo_data;
	else if(bo_we_chroma && bo_addr_chroma[18] == 1)
		v[chroma_i] <= bo_data;


always@(co_lastMB_DF or hundred or decade or unit )
	if(co_lastMB_DF )begin
		nn = {hundred,decade,unit};
		file = $fopen(nn,"w");
		for(j=0;j < addr_y;j=j+1)begin
		$fdisplay (file,"%h", y[j][7:0]);
		$fdisplay (file,"%h", y[j][15:8]);
		$fdisplay (file,"%h", y[j][23:16]);
		$fdisplay (file,"%h", y[j][31:24]);end
		
		for(j=0;j < addr_uv;j=j+1)begin
		$fdisplay (file,"%h", u[j][7:0]);
		$fdisplay (file,"%h", u[j][15:8]);
		$fdisplay (file,"%h", u[j][23:16]);
		$fdisplay (file,"%h", u[j][31:24]);end
		
		for(j=0;j < addr_uv;j=j+1)begin
		$fdisplay (file,"%h", v[j][7:0]);
		$fdisplay (file,"%h", v[j][15:8]);
		$fdisplay (file,"%h", v[j][23:16]);
		$fdisplay (file,"%h", v[j][31:24]);end
		
		$fclose(file);
		end

*/




/*
wire [19:0] luma_i;
wire [17:0] chroma_i;

assign luma_i = (bo_addr_luma[10:0]) * 480 + (bo_addr_luma[19:11]);
assign chroma_i = (bo_addr_chroma[9:0]) * 240 + (bo_addr_chroma[17:10]);

always@(posedge clk or negedge reset_n)
	if(bo_we_luma)begin
		y[luma_i] <= bo_data;end
	else if(bo_we_chroma && bo_addr_chroma[18] == 0)begin
		u[chroma_i] <= bo_data;end
	else if(bo_we_chroma && bo_addr_chroma[18] == 1)begin
		v[chroma_i] <= bo_data;end


always@(co_lastMB_DF or hundred or decade or unit )
	if(co_lastMB_DF )begin
		nn = {hundred,decade,unit};
		file = $fopen(nn,"w");
		for(j=0;j<522240;j=j+1)begin
		$fdisplay (file,"%h", y[j][7:0]);
		$fdisplay (file,"%h", y[j][15:8]);
		$fdisplay (file,"%h", y[j][23:16]);
		$fdisplay (file,"%h", y[j][31:24]);end
		
		for(j=0;j<130560;j=j+1)begin
		$fdisplay (file,"%h", u[j][7:0]);
		$fdisplay (file,"%h", u[j][15:8]);
		$fdisplay (file,"%h", u[j][23:16]);
		$fdisplay (file,"%h", u[j][31:24]);end
		
		for(j=0;j<130560;j=j+1)begin
		$fdisplay (file,"%h", v[j][7:0]);
		$fdisplay (file,"%h", v[j][15:8]);
		$fdisplay (file,"%h", v[j][23:16]);
		$fdisplay (file,"%h", v[j][31:24]);end
		
		$fclose(file);
		end


*/





/*wire [15:0] width_div4,width_div8;

assign width_div4 = {6'b0,(pic_width_in_mbs_minus1 + 8'b1),2'b0};
assign width_div8 = {7'b0,(pic_width_in_mbs_minus1 + 8'b1),1'b0};

wire [19:0] luma_i;
wire [17:0] chroma_i;

assign luma_i = ({9'b0,bo_addr_luma[10:0]}) * {4'b0,width_div4} + ({11'b0,bo_addr_luma[19:11]});
assign chroma_i = ({8'b0,bo_addr_chroma[9:0]}) * {2'b0,width_div8} + ({10'b0,bo_addr_chroma[17:10]});


wire[19:0] addr_y,addr_uv;

assign addr_y = {12'b0,(pic_width_in_mbs_minus1 + 8'b1)}*{12'b0,(pic_height_in_map_units_minus1 + 8'b1)} << 6;
assign addr_uv = {12'b0,(pic_width_in_mbs_minus1 + 8'b1)}*{12'b0,(pic_height_in_map_units_minus1 + 8'b1)} << 4;

always@(posedge clk or negedge reset_n)
	if(bo_we_luma)
		y[luma_i] <= bo_data;
	else if(bo_we_chroma && bo_addr_chroma[18] == 0)
		u[chroma_i] <= bo_data;
	else if(bo_we_chroma && bo_addr_chroma[18] == 1)
		v[chroma_i] <= bo_data;

*/





endmodule
