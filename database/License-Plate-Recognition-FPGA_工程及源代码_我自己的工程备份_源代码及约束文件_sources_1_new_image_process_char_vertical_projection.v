`timescale 1ns/1ns
module char_vertical_projection #(
    parameter    [9:0]    IMG_HDISP = 10'd640,    //640*480
    parameter    [9:0]    IMG_VDISP = 10'd480
)(
    //global clock
    input                clk,                  //cmos video pixel clock
    input                rst_n,                //global reset

    //Image data prepred to be processd
    input                per_frame_vsync,//Prepared Image data vsync valid signal
    input                per_frame_href ,//Prepared Image data href vaild  signal
    input                per_frame_clken,//Prepared Image data output/capture enable clock
    input                per_img_Bit    ,//Prepared Image Bit flag outout(1: Value, 0:inValid)
    
    input      [9:0]     vertical_start,  //投影起始行
    input      [9:0]     vertical_end,    //投影结束行         
    //输出边沿坐标
    output reg [9:0]    char1_line_left ,//垂直投影结果
    output reg [9:0]    char1_line_right,
    output reg [9:0]    char2_line_left ,
    output reg [9:0]    char2_line_right,
    output reg [9:0]    char3_line_left ,
    output reg [9:0]    char3_line_right,
    output reg [9:0]    char4_line_left ,
    output reg [9:0]    char4_line_right,
    output reg [9:0]    char5_line_left ,
    output reg [9:0]    char5_line_right,
    output reg [9:0]    char6_line_left ,
    output reg [9:0]    char6_line_right,
    output reg [9:0]    char7_line_left ,
    output reg [9:0]    char7_line_right,
    
    //Image data has been processd
    output                post_frame_vsync,//Processed Image data vsync valid signal
    output                post_frame_href ,//Processed Image data href vaild  signal
    output                post_frame_clken,//Processed Image data output/capture enable clock
    output                post_img_Bit     //Processed Image Bit flag outout(1: Value, 0:inValid)
);

reg [9:0]     max_pixel_left ;
reg [9:0]     max_pixel_right;

reg            per_frame_vsync_r;
reg            per_frame_href_r;    
reg            per_frame_clken_r;
reg          per_img_Bit_r;

reg            per_frame_vsync_r2;
reg            per_frame_href_r2;    
reg            per_frame_clken_r2;
reg         per_img_Bit_r2;

assign    post_frame_vsync     =    per_frame_vsync_r2;
assign    post_frame_href      =    per_frame_href_r2;    
assign    post_frame_clken     =    per_frame_clken_r2;
assign    post_img_Bit         =    per_img_Bit_r2;

//------------------------------------------
//lag 1 clocks signal sync  
always@(posedge clk or negedge rst_n)begin
if(!rst_n)begin
    per_frame_vsync_r2     <= 0;
    per_frame_href_r2     <= 0;
    per_frame_clken_r2     <= 0;
    per_img_Bit_r2        <= 0;
end
else begin
    per_frame_vsync_r2     <=     per_frame_vsync_r     ;
    per_frame_href_r2    <=     per_frame_href_r     ;
    per_frame_clken_r2     <=     per_frame_clken_r     ;
    per_img_Bit_r2        <=     per_img_Bit_r        ;
end
end

//------------------------------------------
//lag 1 clocks signal sync  
always@(posedge clk or negedge rst_n)begin
if(!rst_n) begin
    per_frame_vsync_r     <= 0;
    per_frame_href_r     <= 0;
    per_frame_clken_r     <= 0;
    per_img_Bit_r        <= 0;
end
else begin
    per_frame_vsync_r     <=     per_frame_vsync    ;
    per_frame_href_r    <=     per_frame_href    ;
    per_frame_clken_r     <=     per_frame_clken    ;
    per_img_Bit_r        <=     per_img_Bit        ;
end
end

wire vsync_pos_flag;
wire vsync_neg_flag;
wire hrefr_neg_flag;
assign vsync_pos_flag =   per_frame_vsync_r  & (~per_frame_vsync_r2);
assign vsync_neg_flag = (~per_frame_vsync_r) &   per_frame_vsync_r2;
assign hrefr_neg_flag = (~per_frame_href_r) & per_frame_href_r2;

//------------------------------------------
//对输入的像素进行"行/场"方向计数，得到其纵横坐标
reg [9:0]      x_cnt;
reg [9:0]   y_cnt;
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)begin
        x_cnt <= 10'd0;
        y_cnt <= 10'd0;
    end
    else if(vsync_neg_flag)begin
        x_cnt <= 10'd0;
        y_cnt <= 10'd0;
    end
    else if(hrefr_neg_flag)begin
        x_cnt <= 10'd0;
        y_cnt <= y_cnt + 1'b1;
    end
    else if(per_frame_clken_r) begin
        x_cnt <= x_cnt + 1'b1;
    end
end

//------------------------------------------
//寄存"行/场"方向计数
reg [9:0]      x_cnt_d1;
reg [9:0]   y_cnt_d1;
reg [9:0]      x_cnt_r;
reg [9:0]   y_cnt_r;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        begin
            x_cnt_r <= 10'd0;
            y_cnt_r <= 10'd0;
        end
    else begin
            x_cnt_d1 <= x_cnt;
            x_cnt_r  <= x_cnt_d1;
            y_cnt_d1 <= y_cnt;
            y_cnt_r  <= y_cnt_d1;
        end
end

//------------------------------------------
//竖直方向投影
reg          clken_d1;
reg          ram_wr;
wire  [9:0]    ram_wr_data;
wire  [9:0]    ram_rd_data;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        clken_d1  <= 1'b0;
        ram_wr    <= 1'b0;
    end
    else if(per_frame_clken)begin
        clken_d1  <= 1'b1;
        ram_wr <= clken_d1;
    end
    else begin
        clken_d1  <= 1'b0;
        ram_wr <= clken_d1;
    end
end

//对整帧进行投影
// assign ram_wr_data = (y_cnt == 10'd0) ? 10'd0 :                     //第一行，初始化RAM为0
//                         per_img_Bit_r ? ram_rd_data + 1'b1 :
//                             ram_rd_data;
//在指定的行数之间进行投影
assign ram_wr_data = (y_cnt == 10'd0) ? 10'd0 :                     //第一行，初始化RAM为0
                        ((y_cnt > vertical_start) && (y_cnt < vertical_end)) ? (ram_rd_data + per_img_Bit_r) :  
                            ram_rd_data;

projection_ram u_projection_ram (
  .clka  (clk           ),// input wire clka
  .wea   (ram_wr        ),// input wire [0 : 0] wea
  .addra (x_cnt_d1       ),// input wire [9 : 0] addra
  .dina  (ram_wr_data   ),// input wire [9 : 0] dina
  
  .clkb  (clk           ),// input wire clkb
  .addrb (x_cnt         ),// input wire [9 : 0] addrb
  .doutb (ram_rd_data   ) // output wire [9 : 0] doutb
);

reg [9:0] rd_data_d1;
reg [9:0] rd_data_d2;
reg [9:0] rd_data_d3;
reg [9:0] rd_data_d4;
reg [9:0] rd_data_d5;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_data_d1 <= 10'd0;
        rd_data_d2 <= 10'd0;
        rd_data_d3 <= 10'd0;
        rd_data_d4 <= 10'd0;
        rd_data_d5 <= 10'd0;
    end
    else if(per_frame_clken) begin
        rd_data_d1 <= ram_rd_data;
        rd_data_d2 <= rd_data_d1;
        rd_data_d3 <= rd_data_d2;
        rd_data_d4 <= rd_data_d3;
        rd_data_d5 <= rd_data_d4;
    end
end

//------------------------------------------
//进行最后的判决
reg [3:0] char_left_cnt;//对字符的左边沿进行计数
reg [3:0] char_right_cnt;//对字符的右边沿进行计数
reg [5:0] char_edge_cnt;//对字符的边沿进行计数
reg [9:0] max1_line_left ;
reg [9:0] max1_line_right;
reg [9:0] max2_line_left ;
reg [9:0] max2_line_right;
reg [9:0] max3_line_left ;
reg [9:0] max3_line_right;
reg [9:0] max4_line_left ;
reg [9:0] max4_line_right;
reg [9:0] max5_line_left ;
reg [9:0] max5_line_right;
reg [9:0] max6_line_left ;
reg [9:0] max6_line_right;
reg [9:0] max7_line_left ;
reg [9:0] max7_line_right;

wire char_posedge;
wire char_negedge;
assign char_posedge = (rd_data_d3==10'd0 && rd_data_d1>=10'd5);
assign char_negedge = (rd_data_d3>=10'd5 && rd_data_d1==10'd0);

always @ (posedge clk or negedge rst_n)
if(!rst_n) begin
//    char_left_cnt    <= 4'd0;
//    char_right_cnt   <= 4'd0;
    char_edge_cnt   <= 6'd0 ;
    max1_line_left  <= 10'd0;
    max1_line_right <= 10'd0;
    max2_line_left  <= 10'd0;
    max2_line_right <= 10'd0;
    max3_line_left  <= 10'd0;
    max3_line_right <= 10'd0;
    max4_line_left  <= 10'd0;
    max4_line_right <= 10'd0;
    max5_line_left  <= 10'd0;
    max5_line_right <= 10'd0;
    max6_line_left  <= 10'd0;
    max6_line_right <= 10'd0;
    max7_line_left  <= 10'd0;
    max7_line_right <= 10'd0;
end
else if(per_frame_clken) begin
    if(y_cnt == IMG_VDISP - 1'b1) begin
        //逐个进行边沿的判断
        case(char_edge_cnt)
            //汉字边界
            6'd0:begin 
                max1_line_left  <= char_posedge ? (x_cnt_r-2) : max1_line_left;
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max1_line_right <= x_cnt_r-2;
                end
            end
            6'd1:begin 
                max1_line_right <= char_negedge ? (x_cnt_r-2) : max1_line_right;
                if(char_posedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max2_line_left  <= x_cnt_r-2;
                end
            end
            //第一个字母边界
            6'd2:begin 
                max2_line_left  <= char_posedge ? (x_cnt_r-2) : max2_line_left;
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max2_line_right <= x_cnt_r-2;
                end
            end
            6'd3:begin 
                max2_line_right <= char_negedge ? (x_cnt_r-2) : max2_line_right;
                if(char_posedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                end
            end
            //点
            6'd4:begin 
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                end
            end
            6'd5:begin 
                if(char_posedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max3_line_left  <= x_cnt_r-2;
                end
            end
            //数字1
            6'd6:begin 
                max3_line_left  <= char_posedge ? (x_cnt_r-2) : max3_line_left;
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max3_line_right <= x_cnt_r-2;
                end
            end
            6'd7:begin 
                max3_line_right <= char_negedge ? (x_cnt_r-2) : max3_line_right;
                if(char_posedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max4_line_left  <= x_cnt_r-2;
                end
            end
            //数字2
            6'd8:begin 
                max4_line_left  <= char_posedge ? (x_cnt_r-2) : max4_line_left;
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max4_line_right <= x_cnt_r-2;
                end
            end
            6'd9:begin 
                max4_line_right <= char_negedge ? (x_cnt_r-2) : max4_line_right;
                if(char_posedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max5_line_left  <= x_cnt_r-2;
                end
            end
            //数字3
            6'd10:begin 
                max5_line_left  <= char_posedge ? (x_cnt_r-2) : max5_line_left;
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max5_line_right <= x_cnt_r-2;
                end
            end
            6'd11:begin 
                max5_line_right <= char_negedge ? (x_cnt_r-2) : max5_line_right;
                if(char_posedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max6_line_left  <= x_cnt_r-2;
                end
            end
            //数字4
            6'd12:begin 
                max6_line_left  <= char_posedge ? (x_cnt_r-2) : max6_line_left;
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max6_line_right <= x_cnt_r-2;
                end
            end
            6'd13:begin 
                max6_line_right <= char_negedge ? (x_cnt_r-2) : max6_line_right;
                if(char_posedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max7_line_left  <= x_cnt_r-2;
                end
            end
            //数字5
            6'd14:begin 
                max7_line_left  <= char_posedge ? (x_cnt_r-2) : max7_line_left;
                if(char_negedge)begin
                    char_edge_cnt   <= char_edge_cnt+1'b1;
                    max7_line_right <= x_cnt_r-2;
                end
            end
            6'd15:begin 
                max7_line_right <= char_negedge ? (x_cnt_r-2) : max7_line_right;
            end
            default: char_edge_cnt   <= 6'd0 ;
        endcase
    end
    else begin
//        char_left_cnt    <= 4'd0;
//        char_right_cnt   <= 4'd0;
    char_edge_cnt   <= 6'd0 ;
    end 
end

//场同步上升沿更新数据
always @ (posedge clk or negedge rst_n)
if(!rst_n) begin
    char1_line_left  <= 10'd0;
    char1_line_right <= 10'd0;
    char2_line_left  <= 10'd0;
    char2_line_right <= 10'd0;
    char3_line_left  <= 10'd0;
    char3_line_right <= 10'd0;
    char4_line_left  <= 10'd0;
    char4_line_right <= 10'd0;
    char5_line_left  <= 10'd0;
    char5_line_right <= 10'd0;
    char6_line_left  <= 10'd0;
    char6_line_right <= 10'd0;
    char7_line_left  <= 10'd0;
    char7_line_right <= 10'd0;
end
else if(vsync_pos_flag) begin
    char1_line_left  <= max1_line_left ;
    char1_line_right <= max1_line_right;
    char2_line_left  <= max2_line_left ;
    char2_line_right <= max2_line_right;
    char3_line_left  <= max3_line_left ;
    char3_line_right <= max3_line_right;
    char4_line_left  <= max4_line_left ;
    char4_line_right <= max4_line_right;
    char5_line_left  <= max5_line_left ;
    char5_line_right <= max5_line_right;
    char6_line_left  <= max6_line_left ;
    char6_line_right <= max6_line_right;
    char7_line_left  <= max7_line_left ;
    char7_line_right <= max7_line_right;
end

endmodule
