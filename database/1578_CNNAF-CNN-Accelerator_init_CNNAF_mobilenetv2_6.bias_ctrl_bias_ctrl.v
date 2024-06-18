// This program was cloned from: https://github.com/eda-lab/CNNAF-CNN-Accelerator_init
// License: MIT License

module bias_ctrl(
    input                       clk_200M,
    input                       rst_n,
    
    input                       bias_in_vld,
    input [127:0]               bias_in,
    
    output reg                  fifo_wr_en,
    output reg [32*16-1 : 0]    fifo_wr_data
);
//-------------------------------------------
// regs & wires & parameters
//-------------------------------------------
parameter CONV_MODE  = 2'd0;
parameter DW_MODE    = 2'd1;
parameter PW_MODE    = 2'd2;
parameter AVGPL_MODE = 2'd3;

parameter L_CONV  = 3'd0;
parameter L_DW    = 3'd1;
parameter L_PW    = 3'd2;
parameter L_AVGPL = 3'd3;
parameter L_PW_SC = 3'd4;

wire [2:0]                      layer_type[63:0];

wire [6:0]                      pic_size_thre_128;
wire [6:0]                      pic_size_thre_64;
wire [6:0]                      pic_size_thre_32;
wire [6:0]                      pic_size_thre_16;
wire [6:0]                      pic_size_thre_8 ;
wire [6:0]                      pic_size_thre_4 ;

wire [10:0]                     c_size_i[64:0];

wire                            s_value[63:0];
wire                            conv_all_done;
wire                            dw_all_done;
wire                            pw_all_done;
reg [7:0]                       pic_size;
//-------------------------------------------
// layer_num_cur 计数
//-------------------------------------------
wire [6:0]                      layer_type_cur;
reg [6:0]                       layer_num_cur;
assign layer_type_cur = layer_type[layer_num_cur] == L_PW_SC ? L_PW : layer_type[layer_num_cur];

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        layer_num_cur <= 7'd0;
    end
    else if (layer_type_cur == L_CONV && conv_all_done == 1'b1) begin
        layer_num_cur <= layer_num_cur + 1'b1;
    end
    else if (layer_type_cur == L_DW && dw_all_done == 1'b1) begin
        layer_num_cur <= layer_num_cur + 1'b1;
    end
    else if (layer_type_cur == L_PW && pw_all_done == 1'b1) begin
        layer_num_cur <= layer_num_cur + 1'b1;
    end
end

//-------------------------------------------
// conv 层 bias 计数
//-------------------------------------------
reg [10:0]                      conv_bias_cnt_l1;
reg [10:0]                      conv_bias_cnt_l2;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd3) begin
        conv_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1) begin
        conv_bias_cnt_l1 <= conv_bias_cnt_l1 + 1'b1;
    end
end

wire                            conv_temp_rd_vld;
assign conv_temp_rd_vld = layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd3;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_bias_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd3 && conv_bias_cnt_l2 == 11'd1) begin
        conv_bias_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd3) begin
        conv_bias_cnt_l2 <= conv_bias_cnt_l2 + 1'b1;
    end
end

assign conv_all_done = layer_type_cur == L_CONV && bias_in_vld == 1'b1 && conv_bias_cnt_l1 == 11'd3 && conv_bias_cnt_l2 == 11'd1;

//-------------------------------------------
// dw 层 bias 计数
//-------------------------------------------
reg [10:0]                      dw_bias_cnt_l1;
reg [10:0]                      dw_bias_cnt_l2;

wire [10:0]                     c_size_i_quarter_1;
assign c_size_i_quarter_1 = c_size_i[layer_num_cur][10:2] - 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && bias_in_vld == 1'b1 && dw_bias_cnt_l1 == c_size_i_quarter_1) begin
        dw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && bias_in_vld == 1'b1) begin
        dw_bias_cnt_l1 <= dw_bias_cnt_l1 + 1'b1;
    end
end

wire                            dw_temp_rd_vld;
assign dw_temp_rd_vld = layer_type_cur == L_DW && bias_in_vld == 1'b1;

assign dw_all_done = layer_type_cur == L_DW && bias_in_vld == 1'b1 && dw_bias_cnt_l1 == c_size_i_quarter_1;

//-------------------------------------------
// pw 层 bias 计数
//-------------------------------------------
reg [10:0]                      pw_bias_cnt_l1;
reg [10:0]                      pw_bias_cnt_l2;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        pw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_PW && bias_in_vld == 1'b1 && pw_bias_cnt_l1 == 11'd3) begin
        pw_bias_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_PW && bias_in_vld == 1'b1) begin
        pw_bias_cnt_l1 <= pw_bias_cnt_l1 + 1'b1;
    end
end

wire                            pw_temp_rd_vld;
assign pw_temp_rd_vld = layer_type_cur == L_PW && bias_in_vld == 1'b1 && pw_bias_cnt_l1 == 11'd3;

wire [10:0]                     c_size_o_quarter_1;
assign c_size_o_quarter_1 = c_size_i[layer_num_cur + 1][10:2] - 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        pw_bias_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_PW && bias_in_vld == 1'b1 && pw_bias_cnt_l1 == 11'd3 && pw_bias_cnt_l2 == c_size_o_quarter_1) begin
        pw_bias_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_PW && bias_in_vld == 1'b1 && pw_bias_cnt_l1 == 11'd3) begin
        pw_bias_cnt_l2 <= pw_bias_cnt_l2 + 1'b1;
    end
end

assign pw_all_done = layer_type_cur == L_PW && bias_in_vld == 1'b1 && pw_bias_cnt_l1 == 11'd3 && pw_bias_cnt_l2 == c_size_o_quarter_1;
//-------------------------------------------
// 缓冲区
//-------------------------------------------
reg [127:0]                     bias_temp[3:0];
integer j;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        for(j = 0; j < 4; j = j + 1) begin
            bias_temp[j] <= 128'b0;
        end
    end
    else if (layer_type_cur == L_CONV && bias_in_vld == 1'b1) begin
        bias_temp[conv_bias_cnt_l1] <= bias_in;
    end
    else if (layer_type_cur == L_PW && bias_in_vld == 1'b1) begin
        bias_temp[pw_bias_cnt_l1] <= bias_in;
    end
end

//-------------------------------------------
// fifo 写控制生成
//-------------------------------------------
// reg                             fifo_wr_en;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_en <= 1'b0;
    end
    else if (conv_temp_rd_vld == 1'b1) begin
        fifo_wr_en <= 1'b1;
    end
    else if (dw_temp_rd_vld == 1'b1) begin
        fifo_wr_en <= 1'b1;
    end
    else if (pw_temp_rd_vld == 1'b1) begin
        fifo_wr_en <= 1'b1;
    end
    else begin
        fifo_wr_en <= 1'b0;
    end
end

// reg [32*16-1 : 0]               fifo_wr_data;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_data <= 512'b0;
    end
    else if (conv_temp_rd_vld == 1'b1) begin
        fifo_wr_data <= {bias_in, bias_temp[2], bias_temp[1], bias_temp[0]};
    end
    else if (dw_temp_rd_vld == 1'b1) begin
        fifo_wr_data <= {{4{bias_in[127:96]}}, 
                         {4{bias_in[ 95:64]}}, 
                         {4{bias_in[ 63:32]}}, 
                         {4{bias_in[ 31: 0]}}};
    end
    else if (pw_temp_rd_vld == 1'b1) begin
        fifo_wr_data <= {bias_in, bias_temp[2], bias_temp[1], bias_temp[0]};
    end
    else begin
        fifo_wr_data <= 512'b0;
    end
end

//-------------------------------------------
// 网络框架参数
//-------------------------------------------
//layer type
assign layer_type[0]  = L_CONV;  assign layer_type[3] = L_PW;     assign layer_type[6] = L_PW;
assign layer_type[1]  = L_DW;    assign layer_type[4] = L_DW;     assign layer_type[7] = L_DW;
assign layer_type[2]  = L_PW;    assign layer_type[5] = L_PW;     assign layer_type[8] = L_PW_SC;

assign layer_type[9 ] = L_PW;    assign layer_type[12] = L_PW;    assign layer_type[15] = L_PW;
assign layer_type[10] = L_DW;    assign layer_type[13] = L_DW;    assign layer_type[16] = L_DW;
assign layer_type[11] = L_PW;    assign layer_type[14] = L_PW_SC; assign layer_type[17] = L_PW_SC;

assign layer_type[18] = L_PW;    assign layer_type[21] = L_PW;    assign layer_type[24] = L_PW;
assign layer_type[19] = L_DW;    assign layer_type[22] = L_DW;    assign layer_type[25] = L_DW;
assign layer_type[20] = L_PW;    assign layer_type[23] = L_PW_SC; assign layer_type[26] = L_PW_SC;

assign layer_type[27] = L_PW;    assign layer_type[30] = L_PW;    assign layer_type[33] = L_PW;
assign layer_type[28] = L_DW;    assign layer_type[31] = L_DW;    assign layer_type[34] = L_DW;
assign layer_type[29] = L_PW_SC; assign layer_type[32] = L_PW;    assign layer_type[35] = L_PW_SC;

assign layer_type[36] = L_PW;    assign layer_type[39] = L_PW;    assign layer_type[42] = L_PW;
assign layer_type[37] = L_DW;    assign layer_type[40] = L_DW;    assign layer_type[43] = L_DW;
assign layer_type[38] = L_PW_SC; assign layer_type[41] = L_PW;    assign layer_type[44] = L_PW_SC;

assign layer_type[45] = L_PW;    assign layer_type[48] = L_PW;    assign layer_type[51] = L_PW;
assign layer_type[46] = L_DW;    assign layer_type[49] = L_DW;    assign layer_type[52] = L_AVGPL;
assign layer_type[47] = L_PW_SC; assign layer_type[50] = L_PW;    assign layer_type[53] = L_PW;

assign pic_size_thre_128 = 7'd0;
assign pic_size_thre_64  = 7'd4;
assign pic_size_thre_32  = 7'd10;
assign pic_size_thre_16  = 7'd19;
assign pic_size_thre_8   = 7'd40;
assign pic_size_thre_4   = 7'd52; 

always @ (*)
begin
    if (layer_num_cur <= pic_size_thre_128) begin
        pic_size = 8'd128;
    end
    else if (layer_num_cur <= pic_size_thre_64) begin
        pic_size = 8'd64;
    end
    else if (layer_num_cur <= pic_size_thre_32) begin
        pic_size = 8'd32;
    end
    else if (layer_num_cur <= pic_size_thre_16) begin
        pic_size = 8'd16;
    end
    else if (layer_num_cur <= pic_size_thre_8) begin
        pic_size = 8'd8;
    end
    else if (layer_num_cur <= pic_size_thre_4) begin
        pic_size = 8'd4;
    end
    else begin
        pic_size = 8'd1;
    end
end

//c_size_i
assign c_size_i[ 0] = 11'd3   ; assign c_size_i[ 1] = 11'd32  ; assign c_size_i[ 2] = 11'd32  ;
assign c_size_i[ 3] = 11'd16  ; assign c_size_i[ 4] = 11'd96  ; assign c_size_i[ 5] = 11'd96  ;
assign c_size_i[ 6] = 11'd24  ; assign c_size_i[ 7] = 11'd144 ; assign c_size_i[ 8] = 11'd144 ;
assign c_size_i[ 9] = 11'd24  ; assign c_size_i[10] = 11'd144 ; assign c_size_i[11] = 11'd144 ;
assign c_size_i[12] = 11'd32  ; assign c_size_i[13] = 11'd192 ; assign c_size_i[14] = 11'd192 ;
assign c_size_i[15] = 11'd32  ; assign c_size_i[16] = 11'd192 ; assign c_size_i[17] = 11'd192 ;
assign c_size_i[18] = 11'd32  ; assign c_size_i[19] = 11'd192 ; assign c_size_i[20] = 11'd192 ;
assign c_size_i[21] = 11'd64  ; assign c_size_i[22] = 11'd384 ; assign c_size_i[23] = 11'd384 ;
assign c_size_i[24] = 11'd64  ; assign c_size_i[25] = 11'd384 ; assign c_size_i[26] = 11'd384 ;
assign c_size_i[27] = 11'd64  ; assign c_size_i[28] = 11'd384 ; assign c_size_i[29] = 11'd384 ;
assign c_size_i[30] = 11'd64  ; assign c_size_i[31] = 11'd384 ; assign c_size_i[32] = 11'd384 ;
assign c_size_i[33] = 11'd96  ; assign c_size_i[34] = 11'd576 ; assign c_size_i[35] = 11'd576 ;
assign c_size_i[36] = 11'd96  ; assign c_size_i[37] = 11'd576 ; assign c_size_i[38] = 11'd576 ;
assign c_size_i[39] = 11'd96  ; assign c_size_i[40] = 11'd576 ; assign c_size_i[41] = 11'd576 ;
assign c_size_i[42] = 11'd160 ; assign c_size_i[43] = 11'd960 ; assign c_size_i[44] = 11'd960 ;
assign c_size_i[45] = 11'd160 ; assign c_size_i[46] = 11'd960 ; assign c_size_i[47] = 11'd960 ;
assign c_size_i[48] = 11'd160 ; assign c_size_i[49] = 11'd960 ; assign c_size_i[50] = 11'd960 ;
assign c_size_i[51] = 11'd320 ; assign c_size_i[52] = 11'd1280; assign c_size_i[53] = 11'd1280;
assign c_size_i[54] = 11'd1001;

//stride
assign s_value[ 0] = 1'd1; assign s_value[ 1] = 1'd0; assign s_value[ 2] = 1'd0;
assign s_value[ 3] = 1'd0; assign s_value[ 4] = 1'd1; assign s_value[ 5] = 1'd0;
assign s_value[ 6] = 1'd0; assign s_value[ 7] = 1'd0; assign s_value[ 8] = 1'd0;
assign s_value[ 9] = 1'd0; assign s_value[10] = 1'd1; assign s_value[11] = 1'd0;
assign s_value[12] = 1'd0; assign s_value[13] = 1'd0; assign s_value[14] = 1'd0;
assign s_value[15] = 1'd0; assign s_value[16] = 1'd0; assign s_value[17] = 1'd0;
assign s_value[18] = 1'd0; assign s_value[19] = 1'd1; assign s_value[20] = 1'd0;
assign s_value[21] = 1'd0; assign s_value[22] = 1'd0; assign s_value[23] = 1'd0;
assign s_value[24] = 1'd0; assign s_value[25] = 1'd0; assign s_value[26] = 1'd0;
assign s_value[27] = 1'd0; assign s_value[28] = 1'd0; assign s_value[29] = 1'd0;
assign s_value[30] = 1'd0; assign s_value[31] = 1'd0; assign s_value[32] = 1'd0;
assign s_value[33] = 1'd0; assign s_value[34] = 1'd0; assign s_value[35] = 1'd0;
assign s_value[36] = 1'd0; assign s_value[37] = 1'd0; assign s_value[38] = 1'd0;
assign s_value[39] = 1'd0; assign s_value[40] = 1'd1; assign s_value[41] = 1'd0;
assign s_value[42] = 1'd0; assign s_value[43] = 1'd0; assign s_value[44] = 1'd0;
assign s_value[45] = 1'd0; assign s_value[46] = 1'd0; assign s_value[47] = 1'd0;
assign s_value[48] = 1'd0; assign s_value[49] = 1'd0; assign s_value[50] = 1'd0;
assign s_value[51] = 1'd0; assign s_value[52] = 1'd0; assign s_value[53] = 1'd0;


endmodule