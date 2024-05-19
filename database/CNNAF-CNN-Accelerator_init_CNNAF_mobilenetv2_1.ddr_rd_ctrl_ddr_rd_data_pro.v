// This program was cloned from: https://github.com/eda-lab/CNNAF-CNN-Accelerator_init
// License: MIT License

module ddr_rd_data_pro(
    input                       clk_200M,
    input                       rst_n,
    
    input                       ddr_vld,
    input [127:0]               ddr_data_out,
    
    output reg                  data_out_vld,
    output reg                  w_out_vld,
    output reg                  sc_out_vld,
    output reg                  bias_out_vld,
    output reg [127:0]          data_out,
    
    // output reg                  mode_change,
    // output reg [1:0]            op_mode,
    output reg [7:0]            pic_size,
    output  [10:0]              channel_size,
    output                      stride
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

wire [2:0]                      layer_type[53:0];

wire [6:0]                      pic_size_thre_128;
wire [6:0]                      pic_size_thre_64;
wire [6:0]                      pic_size_thre_32;
wire [6:0]                      pic_size_thre_16;
wire [6:0]                      pic_size_thre_8 ;
wire [6:0]                      pic_size_thre_4 ;
wire [6:0]                      layer_type_cur;
reg [6:0]                       layer_num_cur;

wire [10:0]                     c_size_i[54:0];
wire                            s_value[53:0];

reg [1:0]                       st_rd_cur;

//-------------------------------------------
// ddr_vld counter
//-------------------------------------------
// reg [10:0]                      ddr_vld_cnt;
// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // ddr_vld_cnt <= 11'd0;
    // end
    // else if () begin
        // ddr_vld_cnt <= 11'd0;
    // end
    // else if (ddr_vld == 1'b1) begin
        // ddr_vld_cnt <= ddr_vld_cnt + 1'b1;
    // end
// end

//-------------------------------------------
// weight counter for conv layer
//-------------------------------------------
reg [10:0]                      w_cnt_conv_l1;
reg [10:0]                      w_cnt_conv_l2;
reg [10:0]                      w_cnt_conv_l3;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        w_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1 && w_cnt_conv_l1 == 11'd8) begin
        w_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1) begin
        w_cnt_conv_l1 <= w_cnt_conv_l1 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        w_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1 && w_cnt_conv_l1 == 11'd8 && w_cnt_conv_l2 == 11'd15) begin
        w_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1 && w_cnt_conv_l1 == 11'd8) begin
        w_cnt_conv_l2 <= w_cnt_conv_l2 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        w_cnt_conv_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1 && w_cnt_conv_l1 == 11'd8 && w_cnt_conv_l2 == 11'd15 && w_cnt_conv_l3 == 11'd1) begin
        w_cnt_conv_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1 && w_cnt_conv_l1 == 11'd8 && w_cnt_conv_l2 == 11'd15) begin
        w_cnt_conv_l3 <= w_cnt_conv_l3 + 1'b1;
    end
end

wire                            w_op_done_each_conv;
assign w_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_vld == 1'b1 && w_cnt_conv_l1 == 11'd8 && w_cnt_conv_l2 == 11'd15;
//-------------------------------------------
// bias counter for conv layer
//-------------------------------------------
reg [10:0]                      bias_cnt_conv_l1;
reg [10:0]                      bias_cnt_conv_l2;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        bias_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1 && bias_cnt_conv_l1 == 11'd3) begin
        bias_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1) begin
        bias_cnt_conv_l1 <= bias_cnt_conv_l1 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        bias_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1 && bias_cnt_conv_l1 == 11'd3 && bias_cnt_conv_l2 == 11'd1) begin
        bias_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1 && bias_cnt_conv_l1 == 11'd3) begin
        bias_cnt_conv_l2 <= bias_cnt_conv_l2 + 1'b1;
    end
end

wire                            bias_op_done_each_conv;
assign bias_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1 && bias_cnt_conv_l1 == 11'd3;
//-------------------------------------------
// data counter for conv layer
//-------------------------------------------
reg [10:0]                      data_cnt_conv_l1;
reg [10:0]                      data_cnt_conv_l2;
reg [10:0]                      data_cnt_conv_l3;
reg [10:0]                      data_cnt_conv_l4;
reg [10:0]                      data_cnt_conv_l5;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2) begin
        data_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1) begin
        data_cnt_conv_l1 <= data_cnt_conv_l1 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2) begin
        data_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2) begin
        data_cnt_conv_l2 <= data_cnt_conv_l2 + 1'b1;
    end
end

wire [10:0]                     pic_size_quarter_1;
assign pic_size_quarter_1 = pic_size[7:2] - 1'b1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2 && data_cnt_conv_l3 == pic_size_quarter_1) begin
        data_cnt_conv_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2) begin
        data_cnt_conv_l3 <= data_cnt_conv_l3 + 1'b1;
    end
end

wire [10:0]                     pic_size_half_1;
assign pic_size_half_1 = pic_size[7:1] - 1'b1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l4 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2 && data_cnt_conv_l3 == pic_size_quarter_1 && data_cnt_conv_l4 == pic_size_half_1) begin
        data_cnt_conv_l4 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2 && data_cnt_conv_l3 == pic_size_quarter_1) begin
        data_cnt_conv_l4 <= data_cnt_conv_l4 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l5 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2 && data_cnt_conv_l3 == pic_size_quarter_1 && data_cnt_conv_l4 == pic_size_half_1 && data_cnt_conv_l5 == 11'd1) begin
        data_cnt_conv_l5 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2 && data_cnt_conv_l3 == pic_size_quarter_1 && data_cnt_conv_l4 == pic_size_half_1) begin
        data_cnt_conv_l5 <= data_cnt_conv_l5 + 1'b1;
    end
end

wire                            data_op_done_each_conv;
assign data_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2 && data_cnt_conv_l3 == pic_size_quarter_1 && data_cnt_conv_l4 == pic_size_half_1;

wire                            conv_all_done;
assign conv_all_done = layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == 11'd2 && data_cnt_conv_l3 == pic_size_quarter_1 && data_cnt_conv_l4 == pic_size_half_1 && data_cnt_conv_l5 == 11'd1;

//-------------------------------------------
// state change
//-------------------------------------------
// reg [1:0]                       st_rd_cur;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        st_rd_cur <= 2'd0;
    end
    else if (layer_type_cur == L_CONV && w_op_done_each_conv == 1'b1) begin
        st_rd_cur <= ST_BIAS_RD;
    end
    else if (layer_type_cur == L_CONV && bias_op_done_each_conv == 1'b1) begin
        st_rd_cur <= ST_DATA_RD;
    end
    else if (layer_type_cur == L_CONV && data_op_done_each_conv == 1'b1) begin
        st_rd_cur <= ST_W_RD;
    end
end

//-------------------------------------------
// layer_num_cur counter
//-------------------------------------------
assign layer_type_cur = layer_type[layer_num_cur];

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        layer_num_cur <= 7'b0;
    end
    else if (layer_type_cur == L_CONV && ddr_vld == 1'b1 && conv_all_done == 1'b1) begin
        layer_num_cur <= layer_num_cur + 1'b1;
    end
end

//-------------------------------------------
// output valid control
//-------------------------------------------
// reg                  data_out_vld,
// reg                  w_out_vld,
// reg                  sc_out_vld,
// reg                  bias_out_vld,
// reg [127:0]          data_out,
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        w_out_vld <= 1'b0;
    end
    else if (st_rd_cur == ST_W_RD && ddr_vld == 1'b1) begin
        w_out_vld <= 1'b1;
    end
    else begin
        w_out_vld <= 1'b0;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        sc_out_vld <= 1'b0;
    end
    else if (st_rd_cur == ST_SC_RD && ddr_vld == 1'b1) begin
        sc_out_vld <= 1'b1;
    end
    else begin
        sc_out_vld <= 1'b0;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        bias_out_vld <= 1'b0;
    end
    else if (st_rd_cur == ST_BIAS_RD && ddr_vld == 1'b1) begin
        bias_out_vld <= 1'b1;
    end
    else begin
        bias_out_vld <= 1'b0;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_out_vld <= 1'b0;
    end
    else if (st_rd_cur == ST_DATA_RD && ddr_vld == 1'b1) begin
        data_out_vld <= 1'b1;
    end
    else begin
        data_out_vld <= 1'b0;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_out <= 128'b0;
    end
    else if (ddr_vld == 1'b1) begin
        data_out <= ddr_data_out;
    end
    else begin
        data_out <= 128'b0;
    end
end

//-------------------------------------------
// generate control signal
//-------------------------------------------
// reg                             flag_initial;
// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // flag_initial <= 1'b0;
    // end
    // else if (ddr_vld == 1'b1 && layer_type_cur == L_CONV && w_cnt_conv_l1 == 11'd0 && w_cnt_conv_l2 == 11'd0 && w_cnt_conv_l3 == 11'd0) begin
        // flag_initial <= 1'b1;
    // end
// end

// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // mode_change <= 1'b0;
    // end
    // else if (ddr_vld == 1'b1 && layer_type_cur == L_CONV && w_cnt_conv_l1 == 11'd0 && w_cnt_conv_l2 == 11'd0 && w_cnt_conv_l3 == 11'd0 && flag_initial == 1'b0) begin
        // mode_change <= 1'b1;
    // end
    // else if (ddr_vld == 1'b1 && layer_type_cur == L_CONV && conv_all_done == 1'b1) begin
        // mode_change <= 1'b1;
    // end
    // else begin
        // mode_change <= 1'b0;
    // end
// end

// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // op_mode <= 2'b0;
    // end
    // else if (layer_type_cur == L_PW_SC) begin
        // op_mode <= L_PW[1:0];
    // end
    // else begin
        // op_mode <= layer_type_cur[1:0];
    // end
// end

// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // channel_size <= 11'd0;
    // end
    // else begin
        // channel_size <= c_size_i[layer_num_cur];
    // end
// end
assign channel_size = c_size_i[layer_num_cur];

assign stride = s_value[layer_num_cur];

//-------------------------------------------
// Network frame parameters
//-------------------------------------------
//layer type
assign layer_type[0]  = L_CONV;  assign layer_type[18] = L_PW;     assign layer_type[36] = L_PW;   
assign layer_type[1]  = L_DW;    assign layer_type[19] = L_DW;     assign layer_type[37] = L_DW;   
assign layer_type[2]  = L_PW;    assign layer_type[20] = L_PW;     assign layer_type[38] = L_PW_SC;

assign layer_type[3] = L_PW;     assign layer_type[21] = L_PW;     assign layer_type[39] = L_PW;
assign layer_type[4] = L_DW;     assign layer_type[22] = L_DW;     assign layer_type[40] = L_DW;
assign layer_type[5] = L_PW;     assign layer_type[23] = L_PW_SC;  assign layer_type[41] = L_PW;

assign layer_type[6] = L_PW;     assign layer_type[24] = L_PW;     assign layer_type[42] = L_PW;
assign layer_type[7] = L_DW;     assign layer_type[25] = L_DW;     assign layer_type[43] = L_DW;
assign layer_type[8] = L_PW_SC;  assign layer_type[26] = L_PW_SC;  assign layer_type[44] = L_PW_SC;

assign layer_type[9 ] = L_PW;    assign layer_type[27] = L_PW;     assign layer_type[45] = L_PW;   
assign layer_type[10] = L_DW;    assign layer_type[28] = L_DW;     assign layer_type[46] = L_DW;   
assign layer_type[11] = L_PW;    assign layer_type[29] = L_PW_SC;  assign layer_type[47] = L_PW_SC;

assign layer_type[12] = L_PW;    assign layer_type[30] = L_PW;     assign layer_type[48] = L_PW;
assign layer_type[13] = L_DW;    assign layer_type[31] = L_DW;     assign layer_type[49] = L_DW;
assign layer_type[14] = L_PW_SC; assign layer_type[32] = L_PW;     assign layer_type[50] = L_PW;

assign layer_type[15] = L_PW;    assign layer_type[33] = L_PW;     assign layer_type[51] = L_PW;
assign layer_type[16] = L_DW;    assign layer_type[34] = L_DW;     assign layer_type[52] = L_AVGPL;
assign layer_type[17] = L_PW_SC; assign layer_type[35] = L_PW_SC;  assign layer_type[53] = L_PW;


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
assign c_size_i[ 0] = 11'd3   ; assign c_size_i[19] = 11'd192 ; assign c_size_i[37] = 11'd576 ; 
assign c_size_i[ 1] = 11'd32  ; assign c_size_i[20] = 11'd192 ; assign c_size_i[38] = 11'd576 ;
assign c_size_i[ 2] = 11'd32  ; assign c_size_i[21] = 11'd64  ; assign c_size_i[39] = 11'd96  ; 
assign c_size_i[ 3] = 11'd16  ; assign c_size_i[22] = 11'd384 ; assign c_size_i[40] = 11'd576 ; 
assign c_size_i[ 4] = 11'd96  ; assign c_size_i[23] = 11'd384 ; assign c_size_i[41] = 11'd576 ;
assign c_size_i[ 5] = 11'd96  ; assign c_size_i[24] = 11'd64  ; assign c_size_i[42] = 11'd160 ; 
assign c_size_i[ 6] = 11'd24  ; assign c_size_i[25] = 11'd384 ; assign c_size_i[43] = 11'd960 ; 
assign c_size_i[ 7] = 11'd144 ; assign c_size_i[26] = 11'd384 ; assign c_size_i[44] = 11'd960 ;
assign c_size_i[ 8] = 11'd144 ; assign c_size_i[27] = 11'd64  ; assign c_size_i[45] = 11'd160 ; 
assign c_size_i[ 9] = 11'd24  ; assign c_size_i[28] = 11'd384 ; assign c_size_i[46] = 11'd960 ; 
assign c_size_i[10] = 11'd144 ; assign c_size_i[29] = 11'd384 ; assign c_size_i[47] = 11'd960 ;
assign c_size_i[11] = 11'd144 ; assign c_size_i[30] = 11'd64  ; assign c_size_i[48] = 11'd160 ; 
assign c_size_i[12] = 11'd32  ; assign c_size_i[31] = 11'd384 ; assign c_size_i[49] = 11'd960 ; 
assign c_size_i[13] = 11'd192 ; assign c_size_i[32] = 11'd384 ; assign c_size_i[50] = 11'd960 ;
assign c_size_i[14] = 11'd192 ; assign c_size_i[33] = 11'd96  ; assign c_size_i[51] = 11'd320 ; 
assign c_size_i[15] = 11'd32  ; assign c_size_i[34] = 11'd576 ; assign c_size_i[52] = 11'd1280; 
assign c_size_i[16] = 11'd192 ; assign c_size_i[35] = 11'd576 ; assign c_size_i[53] = 11'd1280;
assign c_size_i[17] = 11'd192 ; assign c_size_i[36] = 11'd96  ; assign c_size_i[54] = 11'd1001;
assign c_size_i[18] = 11'd32  ; 

//stride
assign s_value[ 0] = 1'd1; assign s_value[18] = 1'd0; assign s_value[36] = 1'd0;
assign s_value[ 1] = 1'd0; assign s_value[19] = 1'd1; assign s_value[37] = 1'd0;
assign s_value[ 2] = 1'd0; assign s_value[20] = 1'd0; assign s_value[38] = 1'd0;
assign s_value[ 3] = 1'd0; assign s_value[21] = 1'd0; assign s_value[39] = 1'd0;
assign s_value[ 4] = 1'd1; assign s_value[22] = 1'd0; assign s_value[40] = 1'd1;
assign s_value[ 5] = 1'd0; assign s_value[23] = 1'd0; assign s_value[41] = 1'd0;
assign s_value[ 6] = 1'd0; assign s_value[24] = 1'd0; assign s_value[42] = 1'd0;
assign s_value[ 7] = 1'd0; assign s_value[25] = 1'd0; assign s_value[43] = 1'd0;
assign s_value[ 8] = 1'd0; assign s_value[26] = 1'd0; assign s_value[44] = 1'd0;
assign s_value[ 9] = 1'd0; assign s_value[27] = 1'd0; assign s_value[45] = 1'd0;
assign s_value[10] = 1'd1; assign s_value[28] = 1'd0; assign s_value[46] = 1'd0;
assign s_value[11] = 1'd0; assign s_value[29] = 1'd0; assign s_value[47] = 1'd0;
assign s_value[12] = 1'd0; assign s_value[30] = 1'd0; assign s_value[48] = 1'd0;
assign s_value[13] = 1'd0; assign s_value[31] = 1'd0; assign s_value[49] = 1'd0;
assign s_value[14] = 1'd0; assign s_value[32] = 1'd0; assign s_value[50] = 1'd0;
assign s_value[15] = 1'd0; assign s_value[33] = 1'd0; assign s_value[51] = 1'd0;
assign s_value[16] = 1'd0; assign s_value[34] = 1'd0; assign s_value[52] = 1'd0;
assign s_value[17] = 1'd0; assign s_value[35] = 1'd0; assign s_value[53] = 1'd0;


endmodule
