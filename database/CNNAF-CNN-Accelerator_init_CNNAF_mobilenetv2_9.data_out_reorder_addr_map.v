module addr_map(
    input                       clk_200M,
    input                       rst_n,
    
    input [16*32-1:0]           fifo_rd_data,
    input                       fifo_empty,
    output reg                  fifo_rd_req,
    
    output reg                  fifo_wr_req,
    output [128+28+4-1:0]       fifo_wr_all
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

parameter ST_W_RD    = 2'd0;
parameter ST_SC_RD   = 2'd1;
parameter ST_BIAS_RD = 2'd2;
parameter ST_DATA_RD = 2'd3;

wire [2:0]                      layer_type[63:0];

wire [6:0]                      pic_size_thre_128;
wire [6:0]                      pic_size_thre_64;
wire [6:0]                      pic_size_thre_32;
wire [6:0]                      pic_size_thre_16;
wire [6:0]                      pic_size_thre_8 ;
wire [6:0]                      pic_size_thre_4 ;

wire [10:0]                     c_size_i[64:0];

wire                            s_value[63:0];
wire                            conv_data_finish;

reg [7:0]                       pic_size;
//-------------------------------------------
// layer_num_cur counter
//-------------------------------------------
wire [6:0]                      layer_type_cur;
reg [6:0]                       layer_num_cur;
assign layer_type_cur = layer_type[layer_num_cur];

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        layer_num_cur <= 7'b0;
    end
    else if (layer_type_cur == L_CONV && conv_data_finish == 1'b1) begin
        layer_num_cur <= layer_num_cur + 1'b1;
    end
    // else if (layer_type_cur == L_DW && ) begin
        // layer_num_cur <= layer_num_cur + 1'b1;
    // end
end

//-------------------------------------------
// data valid counter
//-------------------------------------------
// reg                             fifo_rd_hs_reg;
// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // fifo_rd_hs_reg <= 1'b0;
    // end
    // else begin
        // fifo_rd_hs_reg <= fifo_empty == 1'b0 && fifo_rd_req == 1'b1;
    // end
// end

wire                            fifo_rd_hs;
assign fifo_rd_hs = fifo_empty == 1'b0 && fifo_rd_req == 1'b1;

reg [10:0]                      data_vld_cnt_l1;
reg                             data_vld_cnt_l2;
reg [10:0]                      data_vld_cnt_l3;
reg [10:0]                      data_vld_cnt_l4;
reg [10:0]                      data_vld_cnt_l5;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_vld_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l1 <= 11'd0;
    end
    else if (fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l1 <= data_vld_cnt_l1 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if (!rst_n) begin
        data_vld_cnt_l2 <= 1'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l2 <= ~data_vld_cnt_l2;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_vld_cnt_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && data_vld_cnt_l3 == 11'd15 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l3 <= data_vld_cnt_l3 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_vld_cnt_l4 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && data_vld_cnt_l3 == 11'd15 && data_vld_cnt_l4 == 11'd63 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l4 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && data_vld_cnt_l3 == 11'd15 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l4 <= data_vld_cnt_l4 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_vld_cnt_l5 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && data_vld_cnt_l3 == 11'd15 && data_vld_cnt_l4 == 11'd63 && data_vld_cnt_l5 == 11'd1 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l5 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && data_vld_cnt_l3 == 11'd15 && data_vld_cnt_l4 == 11'd63 && fifo_rd_hs == 1'b1) begin
        data_vld_cnt_l5 <= data_vld_cnt_l5 + 1'b1;
    end
end

// wire                            conv_data_finish;
assign conv_data_finish = layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && data_vld_cnt_l3 == 11'd15 && data_vld_cnt_l4 == 11'd63 && data_vld_cnt_l5 == 11'd1 && fifo_rd_hs == 1'b1;

//-------------------------------------------
// data cache
//-------------------------------------------
// reg                             data_in_vld_reg;
// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // data_in_vld_reg <= 1'b0;
    // end
    // else begin
        // data_in_vld_reg <= fifo_rd_hs;
    // end
// end
// reg [127:0]                      data_in_reg;
// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // data_in_reg <= 128'b0;
    // end
    // else begin
        // data_in_reg <= fifo_rd_data;
    // end
// end

wire [127:0]                    reorder_wire1[15:0];
reg [127:0]                     reorder_reg1[15:0];

genvar i;
generate
    for(i = 0; i < 16; i = i + 1) begin : reorder_wire1_gen
        assign reorder_wire1[i][ 31: 0] = fifo_rd_data[i*32 + 31 : i*32];
        assign reorder_wire1[i][ 63:32] = reorder_reg1[i][31: 0];
        assign reorder_wire1[i][ 95:64] = reorder_reg1[i][63:32];
        assign reorder_wire1[i][127:96] = reorder_reg1[i][95:64];
    end
endgenerate

integer j;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        for(j = 0; j < 16; j = j + 1) begin
            reorder_reg1[j] <= 128'b0;
        end
    end
    else if (layer_type_cur == L_CONV && fifo_rd_hs == 1'b1) begin
        for(j = 0; j < 16; j = j + 1) begin
            reorder_reg1[j] <= reorder_wire1[j];
        end
    end
end

//-------------------------------------------
// data reorder
//-------------------------------------------
reg [10:0]                      busy_cnt1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        busy_cnt1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && busy_cnt1 == 11'd16) begin
        busy_cnt1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && busy_cnt1 > 11'd0) begin
        busy_cnt1 <= busy_cnt1 + 1'b1;
    end
    else if (layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3 && fifo_rd_hs == 1'b1) begin
        busy_cnt1 <= 11'd1;
    end
end

wire                            data_reg_busy1;
assign data_reg_busy1 = busy_cnt1 > 11'd0 && busy_cnt1 <= 11'd16;

//-------------------------------------------
// generate read request
//-------------------------------------------
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_rd_req <= 1'b0;
    end
    else if (fifo_empty == 1'b0 && layer_type_cur == L_CONV && data_vld_cnt_l1 == 11'd3) begin
        fifo_rd_req <= 1'b0;
    end
    else if (fifo_empty == 1'b0 && layer_type_cur == L_CONV && data_reg_busy1 == 1'b0) begin
        fifo_rd_req <= 1'b1;
    end
    else if (fifo_empty == 1'b0 && layer_type_cur == L_CONV && busy_cnt1 == 11'd14) begin
        fifo_rd_req <= 1'b0;
    end
    else begin
        fifo_rd_req <= 1'b0;
    end
end

//-------------------------------------------
// generate read request and data
//-------------------------------------------
// reg                             fifo_wr_req;
reg [127:0]                     fifo_wr_data_part;
reg [27:0]                      fifo_wr_addr_part;
reg [3:0]                       fifo_wr_bl_part;
// wire [128+28+4-1: 0]            fifo_wr_all;
assign fifo_wr_all = {fifo_wr_addr_part, fifo_wr_data_part};

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_req <= 1'b0;
    end
    else if (layer_type_cur == L_CONV && data_reg_busy1 == 1'b1) begin
        fifo_wr_req <= 1'b1;
    end
    else begin
        fifo_wr_req <= 1'b0;
    end
end

wire [10:0]                     su_cnt;
assign su_cnt = busy_cnt1 - 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_data_part <= 128'b0;
    end
    else if (layer_type_cur == L_CONV && data_reg_busy1 == 1'b1) begin
        fifo_wr_data_part <= reorder_reg1[su_cnt];
    end
    else begin
        fifo_wr_data_part <= 128'b0;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_addr_part <= 28'b0;
    end
    else if (layer_type_cur == L_CONV && data_reg_busy1 == 1'b1) begin
        fifo_wr_addr_part <= su_cnt*pic_size*pic_size/4 + data_vld_cnt_l3 * pic_size + data_vld_cnt_l4 + data_vld_cnt_l5 * pic_size*pic_size*16/4;
    end
    else begin
        fifo_wr_addr_part <= 28'b0;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_bl_part <= 4'b0;
    end
    else if (layer_type_cur == L_CONV && data_reg_busy1 == 1'b1) begin
        fifo_wr_bl_part <= 4'd1;
    end
    else begin
        fifo_wr_bl_part <= 4'd0;
    end
end

//-------------------------------------------
// Network frame parameters
//-------------------------------------------

//layer type
assign layer_type[0]  = L_CONV;  assign layer_type[3] = L_PW;     assign layer_type[6] = L_PW;
assign layer_type[1]  = L_DW;    assign layer_type[4] = L_DW;     assign layer_type[7] = L_DW;
assign layer_type[2]  = L_PW;    assign layer_type[5] = L_PW;     assign layer_type[8] = L_PW_SC;

assign layer_type[10] = L_PW;    assign layer_type[13] = L_PW;    assign layer_type[17] = L_PW;
assign layer_type[11] = L_DW;    assign layer_type[14] = L_DW;    assign layer_type[18] = L_DW;
assign layer_type[12] = L_PW;    assign layer_type[15] = L_PW_SC; assign layer_type[19] = L_PW_SC;

assign layer_type[17] = L_PW;    assign layer_type[21] = L_PW;    assign layer_type[24] = L_PW;
assign layer_type[18] = L_DW;    assign layer_type[22] = L_DW;    assign layer_type[25] = L_DW;
assign layer_type[19] = L_PW_SC; assign layer_type[23] = L_PW;    assign layer_type[26] = L_PW_SC;

assign layer_type[28] = L_PW;    assign layer_type[32] = L_PW;    assign layer_type[36] = L_PW;
assign layer_type[29] = L_DW;    assign layer_type[33] = L_DW;    assign layer_type[37] = L_DW;
assign layer_type[30] = L_PW_SC; assign layer_type[34] = L_PW_SC; assign layer_type[38] = L_PW;

assign layer_type[39] = L_PW;    assign layer_type[43] = L_PW;    assign layer_type[47] = L_PW;
assign layer_type[40] = L_DW;    assign layer_type[44] = L_DW;    assign layer_type[48] = L_DW;
assign layer_type[41] = L_PW_SC; assign layer_type[45] = L_PW_SC; assign layer_type[49] = L_PW;

assign layer_type[50] = L_PW;    assign layer_type[54] = L_PW;    assign layer_type[58] = L_PW;
assign layer_type[51] = L_DW;    assign layer_type[55] = L_DW;    assign layer_type[59] = L_DW;
assign layer_type[52] = L_PW_SC; assign layer_type[56] = L_PW_SC; assign layer_type[60] = L_PW;

assign layer_type[61] = L_PW;
assign layer_type[62] = L_AVGPL;
assign layer_type[63] = L_PW;

assign pic_size_thre_128 = 7'd0;
assign pic_size_thre_64  = 7'd4;
assign pic_size_thre_32  = 7'd11;
assign pic_size_thre_16  = 7'd22;
assign pic_size_thre_8   = 7'd48;
assign pic_size_thre_4   = 7'd62; 

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
        pic_size = 8'd0;
    end
end

//c_size_i
assign c_size_i[0]  = 11'd3;   assign c_size_i[1]  = 11'd32;   assign c_size_i[2]  = 11'd32;
assign c_size_i[3]  = 11'd16;  assign c_size_i[4]  = 11'd96;   assign c_size_i[5]  = 11'd96;
assign c_size_i[6]  = 11'd24;  assign c_size_i[7]  = 11'd144;  assign c_size_i[8]  = 11'd144;
assign c_size_i[10] = 11'd24;  assign c_size_i[11] = 11'd144;  assign c_size_i[12] = 11'd144;
assign c_size_i[13] = 11'd32;  assign c_size_i[14] = 11'd192;  assign c_size_i[15] = 11'd192;
assign c_size_i[17] = 11'd32;  assign c_size_i[18] = 11'd192;  assign c_size_i[19] = 11'd192;
assign c_size_i[21] = 11'd32;  assign c_size_i[22] = 11'd192;  assign c_size_i[23] = 11'd192;
assign c_size_i[24] = 11'd64;  assign c_size_i[25] = 11'd384;  assign c_size_i[26] = 11'd384;
assign c_size_i[28] = 11'd64;  assign c_size_i[29] = 11'd384;  assign c_size_i[30] = 11'd384;
assign c_size_i[32] = 11'd64;  assign c_size_i[33] = 11'd384;  assign c_size_i[34] = 11'd384;
assign c_size_i[36] = 11'd64;  assign c_size_i[37] = 11'd384;  assign c_size_i[38] = 11'd384;
assign c_size_i[39] = 11'd96;  assign c_size_i[40] = 11'd576;  assign c_size_i[41] = 11'd576;
assign c_size_i[43] = 11'd96;  assign c_size_i[44] = 11'd576;  assign c_size_i[45] = 11'd576;
assign c_size_i[47] = 11'd96;  assign c_size_i[48] = 11'd576;  assign c_size_i[49] = 11'd576;
assign c_size_i[50] = 11'd160; assign c_size_i[51] = 11'd960;  assign c_size_i[52] = 11'd960;
assign c_size_i[54] = 11'd160; assign c_size_i[55] = 11'd960;  assign c_size_i[56] = 11'd960;
assign c_size_i[58] = 11'd160; assign c_size_i[59] = 11'd960;  assign c_size_i[60] = 11'd960;
assign c_size_i[61] = 11'd320; assign c_size_i[62] = 11'd1280; assign c_size_i[63] = 11'd1280;
assign c_size_i[64] = 11'd1001;

//stride
assign s_value[0]  = 1'd1; assign s_value[1]  = 1'd0; assign s_value[2]  = 1'd0;
assign s_value[3]  = 1'd0; assign s_value[4]  = 1'd1; assign s_value[5]  = 1'd0;
assign s_value[6]  = 1'd0; assign s_value[7]  = 1'd0; assign s_value[8]  = 1'd0;
assign s_value[10] = 1'd0; assign s_value[11] = 1'd1; assign s_value[12] = 1'd0;
assign s_value[13] = 1'd0; assign s_value[14] = 1'd0; assign s_value[15] = 1'd0;
assign s_value[17] = 1'd0; assign s_value[18] = 1'd0; assign s_value[19] = 1'd0;
assign s_value[21] = 1'd0; assign s_value[22] = 1'd1; assign s_value[23] = 1'd0;
assign s_value[24] = 1'd0; assign s_value[25] = 1'd0; assign s_value[26] = 1'd0;
assign s_value[28] = 1'd0; assign s_value[29] = 1'd0; assign s_value[30] = 1'd0;
assign s_value[32] = 1'd0; assign s_value[33] = 1'd0; assign s_value[34] = 1'd0;
assign s_value[36] = 1'd0; assign s_value[37] = 1'd0; assign s_value[38] = 1'd0;
assign s_value[39] = 1'd0; assign s_value[40] = 1'd0; assign s_value[41] = 1'd0;
assign s_value[43] = 1'd0; assign s_value[44] = 1'd0; assign s_value[45] = 1'd0;
assign s_value[47] = 1'd0; assign s_value[48] = 1'd1; assign s_value[49] = 1'd0;
assign s_value[50] = 1'd0; assign s_value[51] = 1'd0; assign s_value[52] = 1'd0;
assign s_value[54] = 1'd0; assign s_value[55] = 1'd0; assign s_value[56] = 1'd0;
assign s_value[58] = 1'd0; assign s_value[59] = 1'd0; assign s_value[60] = 1'd0;
assign s_value[61] = 1'd0; assign s_value[62] = 1'd0; assign s_value[63] = 1'd0;



endmodule