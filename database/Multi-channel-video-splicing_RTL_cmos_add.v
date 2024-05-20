// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

/*
20211025
2021.10.27 
*/

module cmos_add(
    input           sys_rst_n,
    input           cmos0_pclk,
    input           cmos0_href,
    input[15:0]     cmos0_data,
    input           cmos0_vsync,

    input           cmos1_pclk,
    input           cmos1_href,
    input[15:0]     cmos1_data,
    input           cmos1_vsync,
/*
    input           cmos0_en,
    input           cmos1_en,
    input           splicing_en,
*/
    output          pixel_vsync,
    output          pixel_href,
    output reg [15:0]    pixel_data
);

// 使能信号
reg cmos0_en;
reg cmos1_en;
reg splicing_en;

always @(posedge cmos0_pclk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        cmos0_en <= 'b0;
        cmos1_en <= 'b0;
        splicing_en <= 'b0;
    end
    else begin
        cmos0_en <= 1'b1;
        cmos1_en <= 1'b1;
        splicing_en <= 1'b1;
    end
end


//计数器对系统时钟计数，计时0.2秒，场信号采样时钟
reg [23:0] counter;
reg counter_clk;
always @(posedge cmos0_pclk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        counter <= 24'd0;
        counter_clk <= 1'b0;
    end
    else if (counter < 24'd10_0000)
        counter <= counter + 1'b1;
    else begin
        counter <= 24'd0;
        counter_clk <= ~counter_clk;
    end
end


wire [15:0]     cmos0_data_rd;
wire            cmos1_write_full;
fifo_pong u_fifo_pong(
    .Data       (cmos0_data         ), //input [15:0] Data
    .Reset      (~sys_rst_n         ), //input Reset
    .WrClk      (cmos0_pclk         ), //input WrClk
    .RdClk      (cmos0_pclk         ), //input RdClk
    .WrEn       (cmos0_href         ), //input WrEn
    .RdEn       (~cmos1_href        ), //input RdEn
//    .RdEn       (~empty        ), //input RdEn
    .Q          (cmos0_data_rd      ), //output [15:0] Q
    .Empty      (empty              ), //output Empty
    .Full       (cmos1_write_full   ) //output Full
);

//将empty信号打到cmos0_pclk里
reg empty_vsync;
reg fifo_empty;
always @(posedge cmos1_pclk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        empty_vsync <= 1'b0;
        fifo_empty <= 1'b0;
    end
    else if(~empty) begin
        fifo_empty <= ~empty;
        empty_vsync <= fifo_empty;
    end
    else begin
        fifo_empty <= 1'b0;
        empty_vsync <= 1'b0;
    end
end

//对cmos0_href进行计数
reg  [10:0]     cmos0_href_cnt;
always @(posedge cmos0_pclk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cmos0_href_cnt <= 11'd0;
    else if(cmos0_href)
        cmos0_href_cnt <= cmos0_href_cnt + 11'd1;
    else if(empty)
        cmos0_href_cnt <= 11'd0;
end

//在cmos1_href后继续延时cmos0_href长度，以达到两个摄像头数据拼接成一行的效果
reg             cmos0_href_reg;
reg   [10:0]    cmos0_delay;
always @(posedge cmos0_pclk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        cmos0_href_reg <= 1'b0;
        cmos0_delay <= 11'd0;
    end
    else if(~cmos1_href && cmos0_delay < 10'd640) begin
        cmos0_delay <= cmos0_delay + 11'd1;
        cmos0_href_reg <= 1'b1;
    end
    else if(~cmos1_href && cmos0_delay >= 10'd640) begin
        cmos0_href_reg <= 1'b0;
    end
    else if(cmos1_href) cmos0_delay <= 10'd0;
end


///cmos_vsync信号2分频作pixel_vsync信号
reg [1:0] vsync_add_clk_cnt;
always @(posedge cmos0_vsync or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        vsync_add_clk_cnt <= 2'b0;
    end
    else if (vsync_add_clk_cnt >= 2'd2) begin
        vsync_add_clk_cnt <= 2'b0;
    end
    else begin
        vsync_add_clk_cnt <= vsync_add_clk_cnt + 2'b1;
    end
end

assign pixel_vsync = (vsync_add_clk_cnt ^ 2'd1) ? 1'b0 : cmos0_vsync ;



//cam1行像素点计数
reg [11:0]      cam1_pixel_cnt;//行像素计数器
always @(posedge cmos1_pclk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        cam1_pixel_cnt <= 12'd0;
    else if (!pixel_href) begin
        cam1_pixel_cnt <= 12'd0;
    end
    else begin
        cam1_pixel_cnt <= cam1_pixel_cnt + 12'd1;
    end
end

//像素偏差位置设置
localparam PIXEL_OFFSET = 12'd80;
wire pixel_offset_flag = (cam1_pixel_cnt < PIXEL_OFFSET && cam1_pixel_cnt > 16'b0) ? 1'b1 : 1'b0;
wire pixel_increase_flag = (cam1_pixel_cnt > (PIXEL_OFFSET-1) && cam1_pixel_cnt <= (641 + PIXEL_OFFSET)) ? 1'b1 : 1'b0;

wire [15:0]     cmos0_data_splicing;
wire            fifo_splicing_full;
wire            fifo_splicing_empty;
fifo_pong u_fifo_splicing(
    .Data       (cmos0_data         ), //input [15:0] Data
    .Reset      (~sys_rst_n         ), //input Reset
    .WrClk      (cmos0_pclk         ), //input WrClk
    .RdClk      (cmos1_pclk         ), //input RdClk
    .WrEn       (cmos0_href         ), //input WrEn
    .RdEn       (pixel_increase_flag), //input RdEn
//    .RdEn       (1'b1), //input RdEn
    .Q          (cmos0_data_splicing), //output [15:0] Q
    .Empty      (fifo_splicing_empty), //output Empty
    .Full       (fifo_splicing_full ) //output Full
);


reg [4:0] R;
reg [5:0] G;
reg [4:0] B;
/*
always @(*) begin
    if (!pixel_flip_flag) begin //上半屏
        pixel_data <= cmos1_href ? cmos1_data : cmos0_data_rd;
//          pixel_data <= cmos1_href ? 16'd0 : 16'd0;
    end
    else if(pixel_flip_flag) begin
//        R <= cmos1_data[14:11] + cmos0_data_rd[14:11];
//        G <= cmos1_data[9:5]   + cmos0_data_rd[9:5];
//        B <= cmos1_data[3:0]   + cmos0_data_rd[3:0];
//        pixel_data <= {R,G,B};
        pixel_data <= cmos1_href ? 16'd0 : 16'd0;
    end
end
*/

reg [15:0]     fusion_data;
//RBG加权平均
always @(*) begin
    if(cam1_pixel_cnt < PIXEL_OFFSET) begin
//        fusion_data[4:0] = (cmos1_data[4:0] >> 2) + (cmos0_data[4:0] >> 1);
//        fusion_data[10:5] = (cmos1_data[10:5] >> 2) + (cmos0_data[10:5] >> 1);
//        fusion_data[15:11] = (cmos1_data[15:11] >> 2) + (cmos0_data[15:11] >> 1);
        fusion_data = cmos1_data;
    end 
    else if((cam1_pixel_cnt >= PIXEL_OFFSET) && (cam1_pixel_cnt <= PIXEL_OFFSET + 12'd10)) begin
        fusion_data[4:0] = (cmos1_data[4:0] >> 1) + (cmos0_data_splicing[4:0] >> 1);
        fusion_data[10:5] = (cmos1_data[10:5] >> 1) + (cmos0_data_splicing[10:5] >> 1);
        fusion_data[15:11] = (cmos1_data[15:11] >> 1) + (cmos0_data_splicing[15:11] >> 1);
    end
    else begin
        fusion_data = cmos0_data_splicing;
    end
end

//移位拼接
always @(*) begin
//pixel_data = (vsync_add_clk_cnt ^ 2'd1) ?  (cmos1_href ? cmos1_data : cmos0_data_rd) : 16'd0;
    case (vsync_add_clk_cnt)//上下分屏显示，用vsync分屏信号做标志
        2'd0 : begin //下360行
            if (splicing_en) begin
                pixel_data = pixel_offset_flag ? cmos1_data : ~fifo_splicing_empty ? fusion_data : 1'b0;
            end
            else begin
                pixel_data = 16'd0;
            end
        end
        2'd1 : begin//上360行
//            pixel_data = cmos1_href ? cmos1_data : cmos0_data_rd;
            if (cmos1_href) begin
                pixel_data = cmos1_en ? cmos1_data : 16'd0;
            end
            else begin
                pixel_data = cmos0_en ? cmos0_data_rd : 16'd0;
            end
        end
        default : begin
            if (splicing_en) begin
                pixel_data = pixel_offset_flag ? cmos1_data : ~fifo_splicing_empty ? fusion_data : 1'b0;
            end
            else begin
                pixel_data = 16'd0;
            end
        end
    endcase
end

assign pixel_href =  cmos1_href | (~ empty);

endmodule
