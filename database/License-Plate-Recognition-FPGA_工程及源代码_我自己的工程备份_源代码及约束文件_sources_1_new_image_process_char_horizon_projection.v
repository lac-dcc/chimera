`timescale 1ns/1ns
module char_horizon_projection # (
    parameter    [9:0]    IMG_HDISP = 10'd640,    //640*480
    parameter    [9:0]    IMG_VDISP = 10'd480
)(
    //global clock
    input                clk,                  //cmos video pixel clock
    input                rst_n,                //global reset

    //Image data prepred to be processd
    input                per_frame_vsync,    //Prepared Image data vsync valid signal
    input                per_frame_href ,    //Prepared Image data href vaild  signal
    input                per_frame_clken,    //Prepared Image data output/capture enable clock
    input                per_img_Bit    ,    //Prepared Image Bit flag outout(1: Value, 0:inValid)
    
    //Image data has been processd
    output wire          post_frame_vsync,   //Processed Image data vsync valid signal
    output wire          post_frame_href,    //Processed Image data href vaild  signal
    output wire          post_frame_clken,   //Processed Image data output/capture enable clock
    output wire          post_img_Bit,      //Processed Image Bit flag outout(1: Value, 0:inValid)

    output reg [9:0]     max_line_up ,        //边沿坐标
    output reg [9:0]     max_line_down,
    
    input      [9:0]     horizon_start,        //投影起始列
    input      [9:0]     horizon_end            //投影结束列  
);

reg [9:0]     max_pixel_up  ;
reg [9:0]     max_pixel_down;

reg           per_frame_vsync_r;
reg           per_frame_href_r ;    
reg           per_frame_clken_r;
reg           per_img_Bit_r    ;

reg           per_frame_vsync_r2;
reg           per_frame_href_r2 ;    
reg           per_frame_clken_r2;
reg           per_img_Bit_r2    ;

assign  post_frame_vsync  =  per_frame_vsync_r2;
assign  post_frame_href   =  per_frame_href_r2 ;    
assign  post_frame_clken  =  per_frame_clken_r2;
assign  post_img_Bit      =  per_img_Bit_r2    ;

//------------------------------------------
//lag 1 将输入信号进行两级延迟，便于流水线处理后同步
always@(posedge clk or negedge rst_n)
if(!rst_n) begin    
    per_frame_vsync_r2 <= 1'b0;
    per_frame_href_r2  <= 1'b0;
    per_frame_clken_r2 <= 1'b0;
    per_img_Bit_r2     <= 1'b0;
end
else begin
    per_frame_vsync_r2 <= per_frame_vsync_r;
    per_frame_href_r2  <= per_frame_href_r ;
    per_frame_clken_r2 <= per_frame_clken_r;
    per_img_Bit_r2     <= per_img_Bit_r    ;
end

always@(posedge clk or negedge rst_n)
if(!rst_n) begin
    per_frame_vsync_r  <= 1'b0;
    per_frame_href_r   <= 1'b0;
    per_frame_clken_r  <= 1'b0;
    per_img_Bit_r      <= 1'b0;
end
else begin
    per_frame_vsync_r  <= per_frame_vsync  ;
    per_frame_href_r   <= per_frame_href   ;
    per_frame_clken_r  <= per_frame_clken  ;
    per_img_Bit_r      <= per_img_Bit      ;
end

//得到场同步信号的边沿
wire vsync_pos_flag;
wire vsync_neg_flag;
wire hrefr_pos_flag;
wire hrefr_neg_flag;
assign vsync_pos_flag =   per_frame_vsync_r  & (~per_frame_vsync_r2);
assign vsync_neg_flag = (~per_frame_vsync_r) &   per_frame_vsync_r2;
assign hrefr_pos_flag =   per_frame_href_r  & (~per_frame_href_r2);
assign hrefr_neg_flag = (~per_frame_href_r) &   per_frame_href_r2;

//------------------------------------------
//对输入的像素进行"行/场"方向计数，得到其纵横坐标
reg [9:0]   x_cnt;
reg [9:0]   y_cnt;
always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    x_cnt <= 10'd0;
    y_cnt <= 10'd0;
end
else if(vsync_pos_flag)begin
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

//------------------------------------------
//寄存"行/场"方向计数--延迟一个周期
reg [9:0]   x_cnt_r;
reg [9:0]   y_cnt_r;

always@(posedge clk or negedge rst_n)
if(!rst_n) begin
    x_cnt_r <= 10'd0;
    y_cnt_r <= 10'd0;
end
else begin
    x_cnt_r <= x_cnt;
    y_cnt_r <= y_cnt;
end

//------------------------------------------
//水平方向投影
reg        ram_wr;     //ram写使能
reg  [9:0] ram_wr_data;//ram写数据
wire [9:0] ram_rd_data;//ram读数据
wire [9:0] ram_wr_addr;//ram写地址
wire [9:0] ram_rd_addr;//ram读地址

//ram写使能--除了当前帧的最后一行，都写使能
always @ (posedge clk or negedge rst_n)
if(!rst_n)
    ram_wr <= 1'b0;
else if(per_frame_clken && (y_cnt != IMG_VDISP - 1'b1))
    ram_wr <= 1'b1;
else
    ram_wr <= 1'b0;

//对所有列进行水平投影
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ram_wr_data <= 10'd0;
    end
    else if(y_cnt == 10'd0)//图像的第一行，RAM清零
        ram_wr_data <= 10'd0;
    else if(hrefr_pos_flag)
        ram_wr_data <= 10'd0;
    else if((x_cnt > horizon_start) && (x_cnt < horizon_end))
        ram_wr_data <= ram_wr_data + per_img_Bit_r;
end

//在当前帧的第一行，对RAM所有地址都写入0
assign ram_wr_addr = (y_cnt == 10'd0)  ?  x_cnt : y_cnt_r;
//在当前帧的第一行和最后一行，需要遍历RAM中的数据
assign ram_rd_addr = ((y_cnt == 10'd0) || (y_cnt == IMG_VDISP - 1'b1))  ?  x_cnt : y_cnt;

projection_ram u_projection_ram (
    .clka  (clk           ),// input wire clka
    .wea   (ram_wr        ),// input wire [0 : 0] wea
    .addra (ram_wr_addr   ),// input wire [9 : 0] addra
    .dina  (ram_wr_data   ),// input wire [9 : 0] dina
    
    .clkb  (clk           ),// input wire clkb
    .addrb (ram_rd_addr   ),// input wire [9 : 0] addrb
    .doutb (ram_rd_data   ) // output wire [9 : 0] doutb
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

reg [9:0] max_y_first  ;
reg [9:0] min_y_first  ;
reg [9:0] min_y_last   ;
reg [9:0] max_y_last   ;
reg [3:0] edge_cnt     ;


always @ (posedge clk or negedge rst_n)
if(!rst_n) begin
    max_y_first  <= 10'd0;
    min_y_first  <= 10'd0;
    min_y_last   <= 10'd0;
    max_y_last   <= 10'd0;
    edge_cnt     <= 4'd0 ;
end
else if(per_frame_clken) begin
    if(y_cnt == IMG_VDISP - 1'b1) begin    //图像的最后一行，遍历RAM中的数据，求极值 
        case(edge_cnt)
            //第一个大于30的极大值或陡升的上升沿
            4'd0:begin
                if(rd_data_d3==10'd0 && rd_data_d1>10'd150)begin//该条件用于检测陡升的上升沿
                    min_y_first <= x_cnt_r - 3;
                    edge_cnt    <= edge_cnt + 1'b1;
                end
                else if((rd_data_d2 > rd_data_d1) && (rd_data_d2>10'd30))begin//第一个大于30的极大值
                    max_y_first <= x_cnt_r - 3;
                    edge_cnt    <= edge_cnt + 1'b1;
                end
            end
            //遇到的第一个极小值（上升趋势大于8像素）
            4'd1:begin
                if(rd_data_d2 + 10'd8 < rd_data_d1)begin
                    min_y_first <= x_cnt_r - 3;
                    edge_cnt    <= edge_cnt + 1'b1;
                end
            end
            //不断更新遇到的极小值（上升趋势大于8像素）
            4'd2:begin
                if(rd_data_d2 + 10'd8 < rd_data_d1)begin
                    min_y_last <= x_cnt_r - 3;
                    edge_cnt    <= edge_cnt + 1'b1;
                end
            end
            //遇到的最近一个大于30的极大值
            4'd3:begin
                if( (rd_data_d2 > rd_data_d1) && (rd_data_d2>10'd30))begin
                    max_y_last <= x_cnt_r - 3;
                    edge_cnt   <= edge_cnt + 1'b1;
                end
            end
            //捕捉降低到0的下降沿
            4'd4:begin
                if(rd_data_d1==10'd0 && rd_data_d3>=10'd150)
                    min_y_last <= x_cnt_r - 3;
                //观测是否还有新的上升趋势（上升趋势大于8像素）
                 else if((rd_data_d2+10'd8 < rd_data_d1) && (rd_data_d2!=10'd0))begin
                    min_y_last <= x_cnt_r - 3;
                    edge_cnt   <= 4'd3;
                end
            end
            default: edge_cnt <= 4'd0;
        endcase
    end
    else begin
        edge_cnt     <= 4'd0 ;
    end
end
else if(vsync_neg_flag)begin
    max_y_first <= 10'd0;
    min_y_first <= 10'd0;
    min_y_last  <= 10'd0;
    max_y_last  <= 10'd0;
end

always @ (posedge clk or negedge rst_n)
if(!rst_n) begin
    max_line_up  <= 10'd0;
    max_line_down <= 10'd0;
end
else if(vsync_pos_flag) begin
    max_line_up   <= min_y_first;    
    max_line_down <= min_y_last;
end

//ila_char_horizon1 u_ila_char_horizon (
//	.clk(clk), // input wire clk
//	.probe0(x_cnt), // input wire [9:0]  probe0  
//	.probe1(y_cnt), // input wire [9:0]  probe1 
//	.probe2(ram_rd_addr), // input wire [9:0]  probe2 
//	.probe3(ram_rd_data), // input wire [9:0]  probe3 
//	.probe4(rd_data_d1), // input wire [9:0]  probe4 
//	.probe5(rd_data_d2), // input wire [9:0]  probe5 
//	.probe6(rd_data_d3), // input wire [9:0]  probe6 
//	.probe7(max_y_first), // input wire [9:0]  probe7 
//	.probe8(min_y_first), // input wire [9:0]  probe8 
//	.probe9(min_y_last), // input wire [9:0]  probe9 
//	.probe10(max_y_last) // input wire [9:0]  probe10
//);
endmodule