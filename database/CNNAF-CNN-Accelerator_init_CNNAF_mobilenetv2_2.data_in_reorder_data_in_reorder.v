module data_in_reorder(
    input                       clk_200M,
    input                       rst_n,
    
    input [127:0]               data_in,
    input                       data_in_vld,
    
    output reg                  fifo_wr_en,
    output [768+7+1+1+8-1:0]      fifo_wr_all
    //fifo_wr_all = {fifo_wr_layer_type_cur, fifo_wr_calc_en, fifo_wr_acc_s, fifo_wr_acc_s, fifo_wr_data};
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

wire [10:0]                     c_size_i[54:0];

wire                            s_value[53:0];
wire                            conv_all_done;
wire                            dw_all_done;
wire                            pw_all_done;
reg [7:0]                       pic_size;
wire [10:0]                     pic_size_quarter_1;

wire                            conv_temp_vld1;
wire                            conv_temp_vld2;
wire                            conv_temp_vld3;
wire                            dw_temp_vld1;
wire                            dw_temp_vld2;
//-------------------------------------------
// layer_num_cur counter
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

reg [6:0]                      layer_type_cur_temp;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        layer_type_cur_temp <= 7'd0;
    end
    else if (conv_temp_vld1 == 1'b1 || conv_temp_vld2 == 1'b1 || conv_temp_vld3 == 1'b1) begin
        layer_type_cur_temp <= layer_type_cur_temp;
    end
    else if (dw_temp_vld1 == 1'b1 || dw_temp_vld2 == 1'b1) begin
        layer_type_cur_temp <= layer_type_cur_temp;
    end
    else begin
        layer_type_cur_temp <= layer_type_cur;
    end
end

reg [10:0]                      pic_size_quarter_1_temp;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        pic_size_quarter_1_temp <= 7'd0;
    end
    else if (conv_temp_vld1 == 1'b1 || conv_temp_vld2 == 1'b1 || conv_temp_vld3 == 1'b1) begin
        pic_size_quarter_1_temp <= pic_size_quarter_1_temp;
    end
    else if (dw_temp_vld1 == 1'b1 || dw_temp_vld2 == 1'b1) begin
        pic_size_quarter_1_temp <= pic_size_quarter_1_temp;
    end
    else begin
        pic_size_quarter_1_temp <= pic_size_quarter_1;
    end
end

reg                             s_value_cur_temp;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        s_value_cur_temp <= 1'd0;
    end
    else if (conv_temp_vld1 == 1'b1 || conv_temp_vld2 == 1'b1 || conv_temp_vld3 == 1'b1) begin
        s_value_cur_temp <= s_value_cur_temp;
    end
    else if (dw_temp_vld1 == 1'b1 || dw_temp_vld2 == 1'b1) begin
        s_value_cur_temp <= s_value_cur_temp;
    end
    else begin
        s_value_cur_temp <= s_value[layer_num_cur];
    end
end

//-------------------------------------------
// data counter for conv layer 
//-------------------------------------------
reg [10:0]                      conv_data_cnt_l1;
reg [10:0]                      conv_data_cnt_l2;
reg [10:0]                      conv_data_cnt_l3;
reg [10:0]                      conv_data_cnt_l4;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_data_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8) begin
        conv_data_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1) begin
        conv_data_cnt_l1 <= conv_data_cnt_l1 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_data_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_data_cnt_l2 == 11'd31) begin
        conv_data_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8) begin
        conv_data_cnt_l2 <= conv_data_cnt_l2 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_data_cnt_l3 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_data_cnt_l2 == 11'd31 && conv_data_cnt_l3 == 11'd63) begin
        conv_data_cnt_l3 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_data_cnt_l2 == 11'd31) begin
        conv_data_cnt_l3 <= conv_data_cnt_l3 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_data_cnt_l4 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_data_cnt_l2 == 11'd31 && conv_data_cnt_l3 == 11'd63 && conv_data_cnt_l4 == 11'd1) begin
        conv_data_cnt_l4 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_data_cnt_l2 == 11'd31 && conv_data_cnt_l3 == 11'd63) begin
        conv_data_cnt_l4 <= conv_data_cnt_l4 + 1'b1;
    end
end

// wire                            conv_all_done;
assign conv_all_done = layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_data_cnt_l2 == 11'd31 && conv_data_cnt_l3 == 11'd63 && conv_data_cnt_l4 == 11'd1;

//-------------------------------------------
//counter for temp data filling of conv layer
//-------------------------------------------
reg [10:0]                      conv_temp_cnt;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_temp_cnt <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_temp_cnt == 11'd2) begin
        conv_temp_cnt <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_data_cnt_l2 == 11'd31) begin
        conv_temp_cnt <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8) begin
        conv_temp_cnt <= conv_temp_cnt + 1'b1;
    end
end
//-------------------------------------------
// Conv layer buffer 1 effective flag control
//-------------------------------------------
reg [10:0]                      conv_data_cnt_l2_temp;
// reg [10:0]                      data_cnt_conv_l2_reg;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_data_cnt_l2_temp <= 11'd0;
        // data_cnt_conv_l2_reg <= 11'd0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8) begin
        // data_cnt_conv_l2_reg <= conv_data_cnt_l2;
        conv_data_cnt_l2_temp <= conv_data_cnt_l2;
    end
end

// wire                            conv_temp_vld1;
reg [10:0]                      conv_temp_vld1_cnt;

reg                             conv_temp_trig1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_temp_vld1_cnt <= 11'b0;
    end
    // else if (layer_type_cur == L_CONV && conv_data_cnt_l2_temp == 11'd0 && conv_temp_vld1_cnt == 11'd3) begin
        // conv_temp_vld1_cnt <= 11'b0;
    // end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld1_cnt == 11'd6) begin
        conv_temp_vld1_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_temp_cnt == 11'd0 && conv_temp_trig1 == 1'b0 && conv_data_cnt_l2 == 11'd0) begin
        conv_temp_vld1_cnt <= 11'd4;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_temp_cnt == 11'd0 && conv_temp_trig1 == 1'b0) begin
        conv_temp_vld1_cnt <= 11'b1;
    end
    else if (conv_temp_vld1_cnt > 11'd0) begin
        conv_temp_vld1_cnt <= conv_temp_vld1_cnt + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_temp_trig1 <= 1'b0;
    end
    else if (conv_temp_cnt != 11'd0 && conv_data_cnt_l1 == 11'd0 && data_in_vld == 1'b1) begin
        conv_temp_trig1 <= 1'b0;
    end
    else if (conv_temp_cnt == 11'd0 && conv_data_cnt_l1 == 11'd8 && data_in_vld == 1'b1) begin
        conv_temp_trig1 <= 1'b1;
    end
end

assign conv_temp_vld1 = conv_temp_vld1_cnt > 11'd0;
//-------------------------------------------
// Conv layer buffer 2 effective flag control
//-------------------------------------------
// wire                            conv_temp_vld2;
reg [10:0]                      conv_temp_vld2_cnt;
reg                             conv_temp_trig2;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_temp_vld2_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd6 && conv_data_cnt_l2_temp != 11'd31) begin
        conv_temp_vld2_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd9 && conv_data_cnt_l2_temp == 11'd31) begin
        conv_temp_vld2_cnt <= 11'b0;
    end
    
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_temp_cnt == 11'd1 && conv_temp_trig2 == 1'b0) begin
        conv_temp_vld2_cnt <= 11'b1;
    end
    else if (conv_temp_vld2_cnt > 11'd0) begin
        conv_temp_vld2_cnt <= conv_temp_vld2_cnt + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_temp_trig2 <= 1'b0;
    end
    else if (conv_temp_cnt != 11'd1 && conv_data_cnt_l1 == 11'd0 && data_in_vld == 1'b1) begin
        conv_temp_trig2 <= 1'b0;
    end
    else if (conv_temp_cnt == 11'd1 && conv_data_cnt_l1 == 11'd8 && data_in_vld == 1'b1) begin
        conv_temp_trig2 <= 1'b1;
    end
end

assign conv_temp_vld2 = conv_temp_vld2_cnt > 11'd0;
//-------------------------------------------
// Conv layer buffer 3 effective flag control
//-------------------------------------------
// wire                            conv_temp_vld3;
reg [10:0]                      conv_temp_vld3_cnt;
reg                             conv_temp_trig3;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_temp_vld3_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld3_cnt == 11'd6) begin
        conv_temp_vld3_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_data_cnt_l1 == 11'd8 && conv_temp_cnt == 11'd2 && conv_temp_trig3 == 1'b0) begin
        conv_temp_vld3_cnt <= 11'b1;
    end
    else if (conv_temp_vld3_cnt > 11'd0) begin
        conv_temp_vld3_cnt <= conv_temp_vld3_cnt + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        conv_temp_trig3 <= 1'b0;
    end
    else if (conv_temp_cnt != 11'd2 && conv_data_cnt_l1 == 11'd0 && data_in_vld == 1'b1) begin
        conv_temp_trig3 <= 1'b0;
    end
    else if (conv_temp_cnt == 11'd2 && conv_data_cnt_l1 == 11'd8 && data_in_vld == 1'b1) begin
        conv_temp_trig3 <= 1'b1;
    end
end

assign conv_temp_vld3 = conv_temp_vld3_cnt > 11'd0;

//-------------------------------------------
// data conter for DW layer
//-------------------------------------------
reg [10:0]                      dw_data_cnt_l1;
reg [10:0]                      dw_data_cnt_l2;
reg [10:0]                      dw_data_cnt_l3;
reg [10:0]                      dw_data_cnt_l4;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_data_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23) begin
        dw_data_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1) begin
        dw_data_cnt_l1 <= dw_data_cnt_l1 + 1'b1;
    end
end

// wire [10:0]                     pic_size_quarter_1;
assign pic_size_quarter_1 = pic_size[7:2] - 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_data_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp) begin
        dw_data_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23) begin
        dw_data_cnt_l2 <= dw_data_cnt_l2 + 1'b1;
    end
end

wire [10:0]                     pic_size_half_1;
assign pic_size_half_1 = pic_size[7:1] - 1'b1;
wire [10:0]                     pic_size_1;
assign pic_size_1 = pic_size[7:0] - 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_data_cnt_l3 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_quarter_1_temp) begin
        dw_data_cnt_l3 <= 11'd0;
    end
    // else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_1 &&s_value[layer_num_cur] == 1'b0) begin
        // dw_data_cnt_l3 <= 11'd0;
    // end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp) begin
        dw_data_cnt_l3 <= dw_data_cnt_l3 + 1'b1;
    end
end

wire [10:0]                     c_size_i_quarter_1;
assign  c_size_i_quarter_1 = c_size_i[layer_num_cur][10:2] - 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_data_cnt_l4 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_quarter_1_temp &&dw_data_cnt_l4 == c_size_i_quarter_1) begin
        dw_data_cnt_l4 <= 11'd0;
    end
    // else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_1 && s_value[layer_num_cur] == 1'b0 && dw_data_cnt_l4 == c_size_i_quarter_1) begin
        // dw_data_cnt_l4 <= 11'd0;
    // end
    // else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_half_1 && s_value[layer_num_cur] == 1'b1) begin
        // dw_data_cnt_l4 <= dw_data_cnt_l4 + 1'b1;
    // end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_quarter_1_temp) begin
        dw_data_cnt_l4 <= dw_data_cnt_l4 + 1'b1;
    end
end

// wire                            dw_all_done;
assign dw_all_done = layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_quarter_1_temp &&dw_data_cnt_l4 == c_size_i_quarter_1;
    // s_value[layer_num_cur] ? 
    // layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_half_1 && dw_data_cnt_l4 == c_size_i_quarter_1 :
    // layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_data_cnt_l2 == pic_size_quarter_1_temp && dw_data_cnt_l3 == pic_size_1 && dw_data_cnt_l4 == c_size_i_quarter_1;
//-------------------------------------------
// counter for temp data filling of DW layer
//-------------------------------------------
reg [10:0]                      dw_temp_cnt;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_temp_cnt <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_temp_cnt == 11'd1) begin
        dw_temp_cnt <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23) begin
        dw_temp_cnt <= dw_temp_cnt + 1'b1;
    end
end
//-------------------------------------------
// DW layer buffer 1 effective flag control
//-------------------------------------------
reg [10:0]                      dw_data_cnt_l2_temp;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_data_cnt_l2_temp <= 11'd0;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23) begin
        dw_data_cnt_l2_temp <= dw_data_cnt_l2;
    end
end

// wire                            dw_temp_vld1;
reg [10:0]                      dw_temp_vld1_cnt;
reg                             dw_temp_trig1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_temp_vld1_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd5 && dw_data_cnt_l2_temp == 11'd0) begin
        dw_temp_vld1_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd5 && dw_data_cnt_l2_temp < pic_size_quarter_1_temp) begin
        dw_temp_vld1_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd6 && dw_data_cnt_l2_temp == pic_size_quarter_1_temp) begin
        dw_temp_vld1_cnt <= 11'b0;
    end
    
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_temp_cnt == 11'd0 && dw_temp_trig1 == 1'b0 && dw_data_cnt_l2 == 11'b0 && s_value[layer_num_cur] == 1'b0) begin
        dw_temp_vld1_cnt <= 11'b1;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_temp_cnt == 11'd0 && dw_temp_trig1 == 1'b0) begin
        dw_temp_vld1_cnt <= 11'd2;
    end
    else if (dw_temp_vld1_cnt > 11'd0) begin
        dw_temp_vld1_cnt <= dw_temp_vld1_cnt + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_temp_trig1 <= 1'b0;
    end
    else if (dw_temp_cnt != 11'd0 && dw_data_cnt_l1 == 11'd0 && data_in_vld == 1'b1) begin
        dw_temp_trig1 <= 1'b0;
    end
    else if (dw_temp_cnt == 11'd0 && dw_data_cnt_l1 == 11'd23 && data_in_vld == 1'b1) begin
        dw_temp_trig1 <= 1'b1;
    end
end

assign dw_temp_vld1 = dw_temp_vld1_cnt > 11'd0;

//-------------------------------------------
// DW layer buffer 2 effective flag control
//-------------------------------------------
// wire                            dw_temp_vld2;
reg [10:0]                      dw_temp_vld2_cnt;
reg                             dw_temp_trig2;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_temp_vld2_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd5 && dw_data_cnt_l2_temp == 11'd0) begin
        dw_temp_vld2_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd5 && dw_data_cnt_l2_temp < pic_size_quarter_1_temp) begin
        dw_temp_vld2_cnt <= 11'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd6 && dw_data_cnt_l2_temp == pic_size_quarter_1_temp) begin
        dw_temp_vld2_cnt <= 11'b0;
    end
    
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_temp_cnt == 11'd1 && dw_temp_trig2 == 1'b0 && dw_data_cnt_l2 == 11'b0 && s_value[layer_num_cur] == 1'b0) begin
        dw_temp_vld2_cnt <= 11'b1;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_data_cnt_l1 == 11'd23 && dw_temp_cnt == 11'd1 && dw_temp_trig2 == 1'b0) begin
        dw_temp_vld2_cnt <= 11'd2;
    end
    else if (dw_temp_vld2_cnt > 11'd0) begin
        dw_temp_vld2_cnt <= dw_temp_vld2_cnt + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        dw_temp_trig2 <= 1'b0;
    end
    else if (dw_temp_cnt != 11'd1 && dw_data_cnt_l1 == 11'd0 && data_in_vld == 1'b1) begin
        dw_temp_trig2 <= 1'b0;
    end
    else if (dw_temp_cnt == 11'd1 && dw_data_cnt_l1 == 11'd23 && data_in_vld == 1'b1) begin
        dw_temp_trig2 <= 1'b1;
    end
end

assign dw_temp_vld2 = dw_temp_vld2_cnt > 11'd0;
//-------------------------------------------
// data counter for PW layer
//-------------------------------------------
reg [10:0]                      pw_data_cnt_l1;
reg [10:0]                      pw_data_cnt_l2;
reg [10:0]                      pw_data_cnt_l3;
reg [10:0]                      pw_data_cnt_l4;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        pw_data_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1) begin
        pw_data_cnt_l1 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1) begin
        pw_data_cnt_l1 <= pw_data_cnt_l1 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        pw_data_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1 && pw_data_cnt_l2 == pic_size_1) begin
        pw_data_cnt_l2 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1) begin
        pw_data_cnt_l2 <= pw_data_cnt_l2 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        pw_data_cnt_l3 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1 && pw_data_cnt_l2 == pic_size_1 && pw_data_cnt_l3 == pic_size_1) begin
        pw_data_cnt_l3 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1 && pw_data_cnt_l2 == pic_size_1) begin
        pw_data_cnt_l3 <= pw_data_cnt_l3 + 1'b1;
    end
end

wire [10:0]                     c_size_o_d16_1;
assign c_size_o_d16_1 = c_size_i[layer_num_cur + 1] == 11'd24 ? 11'd1 : c_size_i[layer_num_cur + 1][10:4] - 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        pw_data_cnt_l4 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1 && pw_data_cnt_l2 == pic_size_1 && pw_data_cnt_l3 == pic_size_1 && pw_data_cnt_l4 == c_size_o_d16_1) begin
        pw_data_cnt_l4 <= 11'd0;
    end
    else if (layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1 && pw_data_cnt_l2 == pic_size_1 && pw_data_cnt_l3 == pic_size_1) begin
        pw_data_cnt_l4 <= pw_data_cnt_l4 + 1'b1;
    end
end

// wire                            pw_all_done;
assign pw_all_done = layer_type_cur_temp == L_PW && data_in_vld == 1'b1 && pw_data_cnt_l1 == c_size_i_quarter_1 && pw_data_cnt_l2 == pic_size_1 && pw_data_cnt_l3 == pic_size_1 && pw_data_cnt_l4 == c_size_o_d16_1;
//-------------------------------------------
// data cache
//-------------------------------------------
reg [127 : 0]                   data_temp[47:0];
wire [31:0]                     data_temp_view[47:0][3:0];
genvar i;
generate
    for(i = 0; i < 48; i = i + 1) begin : data_temp_view_gen
        assign data_temp_view[i][0] = data_temp[i][ 31: 0];
        assign data_temp_view[i][1] = data_temp[i][ 63:32];
        assign data_temp_view[i][2] = data_temp[i][ 95:64];
        assign data_temp_view[i][3] = data_temp[i][127:96];
    end
endgenerate


integer j;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        for(j = 0; j < 48; j = j + 1) begin
            data_temp[j] <= 128'b0;
        end
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_temp_cnt == 11'd0) begin
        data_temp[conv_data_cnt_l1] <= data_in;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_temp_cnt == 11'd1) begin
        data_temp[conv_data_cnt_l1 + 9] <= data_in;
    end
    else if (layer_type_cur_temp == L_CONV && data_in_vld == 1'b1 && conv_temp_cnt == 11'd2) begin
        data_temp[conv_data_cnt_l1 + 18] <= data_in;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_temp_cnt == 11'd0) begin
        data_temp[dw_data_cnt_l1] <= data_in;
    end
    else if (layer_type_cur_temp == L_DW && data_in_vld == 1'b1 && dw_temp_cnt == 11'd1) begin
        data_temp[dw_data_cnt_l1 + 24] <= data_in;
    end
end

reg [767:0]                     fifo_wr_data;
wire [31:0]                     fifo_wr_data_view[23:0];
generate
    for(i = 0; i < 24; i = i + 1) begin : fifo_wr_data_view_gen
        assign fifo_wr_data_view[i] = fifo_wr_data[i*32+31:i*32];
    end
endgenerate

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_data <= 768'b0;
    end
    //---------------------- CONV_MODE ----------------------//
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld1_cnt == 11'd1) begin
        fifo_wr_data[287:0] <= {data_temp[2][31:0], data_temp[2+18][127:64], 
                                data_temp[1][31:0], data_temp[1+18][127:64], 
                                data_temp[0][31:0], data_temp[0+18][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld1_cnt == 11'd2) begin
        fifo_wr_data[287:0] <= {data_temp[5][31:0], data_temp[5+18][127:64],
                                data_temp[4][31:0], data_temp[4+18][127:64],
                                data_temp[3][31:0], data_temp[3+18][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld1_cnt == 11'd3) begin
        fifo_wr_data[287:0] <= {data_temp[8][31:0], data_temp[8+18][127:64], 
                                data_temp[7][31:0], data_temp[7+18][127:64], 
                                data_temp[6][31:0], data_temp[6+18][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld1_cnt == 11'd4) begin
        fifo_wr_data[287:0] <= {data_temp[2][95:0],
                                data_temp[1][95:0], 
                                data_temp[0][95:0]};
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld1_cnt == 11'd5) begin
        fifo_wr_data[287:0] <= {data_temp[5][95:0], 
                                data_temp[4][95:0],
                                data_temp[3][95:0]};
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld1_cnt == 11'd6) begin
        fifo_wr_data[287:0] <= {data_temp[8][95:0], 
                                data_temp[7][95:0],
                                data_temp[6][95:0]};
    end
    
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd1) begin
        fifo_wr_data[287:0] <= {data_temp[2+9][31:0], data_temp[2][127:64], 
                                data_temp[1+9][31:0], data_temp[1][127:64], 
                                data_temp[0+9][31:0], data_temp[0][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd2) begin
        fifo_wr_data[287:0] <= {data_temp[5+9][31:0], data_temp[5][127:64],
                                data_temp[4+9][31:0], data_temp[4][127:64],
                                data_temp[3+9][31:0], data_temp[3][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd3) begin
        fifo_wr_data[287:0] <= {data_temp[8+9][31:0], data_temp[8][127:64], 
                                data_temp[7+9][31:0], data_temp[7][127:64], 
                                data_temp[6+9][31:0], data_temp[6][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd4) begin
        fifo_wr_data[287:0] <= {data_temp[2+9][95:0],
                                data_temp[1+9][95:0], 
                                data_temp[0+9][95:0]};
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd5) begin
        fifo_wr_data[287:0] <= {data_temp[5+9][95:0], 
                                data_temp[4+9][95:0],
                                data_temp[3+9][95:0]};
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd6) begin
        fifo_wr_data[287:0] <= {data_temp[8+9][95:0], 
                                data_temp[7+9][95:0],
                                data_temp[6+9][95:0]};
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd7) begin
        fifo_wr_data[287:0] <= {32'd0, data_temp[2+9][127:64], 
                                32'd0, data_temp[1+9][127:64],  
                                32'd0, data_temp[0+9][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd8) begin
        fifo_wr_data[287:0] <= {32'd0, data_temp[5+9][127:64], 
                                32'd0, data_temp[4+9][127:64],
                                32'd0, data_temp[3+9][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld2_cnt == 11'd9) begin
        fifo_wr_data[287:0] <= {32'd0, data_temp[8+9][127:64], 
                                32'd0, data_temp[7+9][127:64],
                                32'd0, data_temp[6+9][127:64] };
    end
        
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld3_cnt == 11'd1) begin
        fifo_wr_data[287:0] <= {data_temp[2+18][31:0], data_temp[2+9][127:64], 
                                data_temp[1+18][31:0], data_temp[1+9][127:64], 
                                data_temp[0+18][31:0], data_temp[0+9][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld3_cnt == 11'd2) begin
        fifo_wr_data[287:0] <= {data_temp[5+18][31:0], data_temp[5+9][127:64],
                                data_temp[4+18][31:0], data_temp[4+9][127:64],
                                data_temp[3+18][31:0], data_temp[3+9][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld3_cnt == 11'd3) begin
        fifo_wr_data[287:0] <= {data_temp[8+18][31:0], data_temp[8+9][127:64], 
                                data_temp[7+18][31:0], data_temp[7+9][127:64], 
                                data_temp[6+18][31:0], data_temp[6+9][127:64] };
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld3_cnt == 11'd4) begin
        fifo_wr_data[287:0] <= {data_temp[2+18][95:0],
                                data_temp[1+18][95:0], 
                                data_temp[0+18][95:0]};
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld3_cnt == 11'd5) begin
        fifo_wr_data[287:0] <= {data_temp[5+18][95:0], 
                                data_temp[4+18][95:0],
                                data_temp[3+18][95:0]};
    end
    else if (layer_type_cur_temp == L_CONV && conv_temp_vld3_cnt == 11'd6) begin
        fifo_wr_data[287:0] <= {data_temp[8+18][95:0], 
                                data_temp[7+18][95:0],
                                data_temp[6+18][95:0]};
    end
    
    //---------------------- DW_MODE ----------------------//
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd1) begin
        fifo_wr_data <= 768'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd2) begin
        fifo_wr_data <= {data_temp[23][31:0], data_temp[22][31:0], data_temp[21][31:0], data_temp[20][31:0], 
                         data_temp[19][31:0], data_temp[18][31:0], data_temp[17][31:0], data_temp[16][31:0], data_temp[15][31:0], 
                         data_temp[14][31:0], data_temp[13][31:0], data_temp[12][31:0], data_temp[11][31:0], data_temp[10][31:0],  
                         data_temp[ 9][31:0], data_temp[ 8][31:0], data_temp[ 7][31:0], data_temp[ 6][31:0], data_temp[ 5][31:0], 
                         data_temp[ 4][31:0], data_temp[ 3][31:0], data_temp[ 2][31:0], data_temp[ 1][31:0], data_temp[ 0][31:0]  };
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd3) begin
        fifo_wr_data <= {data_temp[23][63:32], data_temp[22][63:32], data_temp[21][63:32], data_temp[20][63:32], 
                         data_temp[19][63:32], data_temp[18][63:32], data_temp[17][63:32], data_temp[16][63:32], data_temp[15][63:32], 
                         data_temp[14][63:32], data_temp[13][63:32], data_temp[12][63:32], data_temp[11][63:32], data_temp[10][63:32],  
                         data_temp[ 9][63:32], data_temp[ 8][63:32], data_temp[ 7][63:32], data_temp[ 6][63:32], data_temp[ 5][63:32], 
                         data_temp[ 4][63:32], data_temp[ 3][63:32], data_temp[ 2][63:32], data_temp[ 1][63:32], data_temp[ 0][63:32]  };
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd4) begin
        fifo_wr_data <= {data_temp[23][95:64], data_temp[22][95:64], data_temp[21][95:64], data_temp[20][95:64], 
                         data_temp[19][95:64], data_temp[18][95:64], data_temp[17][95:64], data_temp[16][95:64], data_temp[15][95:64], 
                         data_temp[14][95:64], data_temp[13][95:64], data_temp[12][95:64], data_temp[11][95:64], data_temp[10][95:64],  
                         data_temp[ 9][95:64], data_temp[ 8][95:64], data_temp[ 7][95:64], data_temp[ 6][95:64], data_temp[ 5][95:64], 
                         data_temp[ 4][95:64], data_temp[ 3][95:64], data_temp[ 2][95:64], data_temp[ 1][95:64], data_temp[ 0][95:64]  };
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd5) begin
        fifo_wr_data <= {data_temp[23][127:96], data_temp[22][127:96], data_temp[21][127:96], data_temp[20][127:96], 
                         data_temp[19][127:96], data_temp[18][127:96], data_temp[17][127:96], data_temp[16][127:96], data_temp[15][127:96], 
                         data_temp[14][127:96], data_temp[13][127:96], data_temp[12][127:96], data_temp[11][127:96], data_temp[10][127:96],  
                         data_temp[ 9][127:96], data_temp[ 8][127:96], data_temp[ 7][127:96], data_temp[ 6][127:96], data_temp[ 5][127:96], 
                         data_temp[ 4][127:96], data_temp[ 3][127:96], data_temp[ 2][127:96], data_temp[ 1][127:96], data_temp[ 0][127:96]  };
    end    
    else if (layer_type_cur_temp == L_DW && dw_temp_vld1_cnt == 11'd6) begin
        fifo_wr_data <= 768'b0;
    end
    
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd1) begin
        fifo_wr_data <= 768'b0;
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd2) begin
        fifo_wr_data <= {data_temp[23+24][31:0], data_temp[22+24][31:0], data_temp[21+24][31:0], data_temp[20+24][31:0], 
                         data_temp[19+24][31:0], data_temp[18+24][31:0], data_temp[17+24][31:0], data_temp[16+24][31:0], data_temp[15+24][31:0], 
                         data_temp[14+24][31:0], data_temp[13+24][31:0], data_temp[12+24][31:0], data_temp[11+24][31:0], data_temp[10+24][31:0],  
                         data_temp[ 9+24][31:0], data_temp[ 8+24][31:0], data_temp[ 7+24][31:0], data_temp[ 6+24][31:0], data_temp[ 5+24][31:0], 
                         data_temp[ 4+24][31:0], data_temp[ 3+24][31:0], data_temp[ 2+24][31:0], data_temp[ 1+24][31:0], data_temp[ 0+24][31:0]  };
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd3) begin
        fifo_wr_data <= {data_temp[23+24][63:32], data_temp[22+24][63:32], data_temp[21+24][63:32], data_temp[20+24][63:32], 
                         data_temp[19+24][63:32], data_temp[18+24][63:32], data_temp[17+24][63:32], data_temp[16+24][63:32], data_temp[15+24][63:32], 
                         data_temp[14+24][63:32], data_temp[13+24][63:32], data_temp[12+24][63:32], data_temp[11+24][63:32], data_temp[10+24][63:32],  
                         data_temp[ 9+24][63:32], data_temp[ 8+24][63:32], data_temp[ 7+24][63:32], data_temp[ 6+24][63:32], data_temp[ 5+24][63:32], 
                         data_temp[ 4+24][63:32], data_temp[ 3+24][63:32], data_temp[ 2+24][63:32], data_temp[ 1+24][63:32], data_temp[ 0+24][63:32]  };
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd4) begin
        fifo_wr_data <= {data_temp[23+24][95:64], data_temp[22+24][95:64], data_temp[21+24][95:64], data_temp[20+24][95:64], 
                         data_temp[19+24][95:64], data_temp[18+24][95:64], data_temp[17+24][95:64], data_temp[16+24][95:64], data_temp[15+24][95:64], 
                         data_temp[14+24][95:64], data_temp[13+24][95:64], data_temp[12+24][95:64], data_temp[11+24][95:64], data_temp[10+24][95:64],  
                         data_temp[ 9+24][95:64], data_temp[ 8+24][95:64], data_temp[ 7+24][95:64], data_temp[ 6+24][95:64], data_temp[ 5+24][95:64], 
                         data_temp[ 4+24][95:64], data_temp[ 3+24][95:64], data_temp[ 2+24][95:64], data_temp[ 1+24][95:64], data_temp[ 0+24][95:64]  };
    end
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd5) begin
        fifo_wr_data <= {data_temp[23+24][127:96], data_temp[22+24][127:96], data_temp[21+24][127:96], data_temp[20+24][127:96], 
                         data_temp[19+24][127:96], data_temp[18+24][127:96], data_temp[17+24][127:96], data_temp[16+24][127:96], data_temp[15+24][127:96], 
                         data_temp[14+24][127:96], data_temp[13+24][127:96], data_temp[12+24][127:96], data_temp[11+24][127:96], data_temp[10+24][127:96],  
                         data_temp[ 9+24][127:96], data_temp[ 8+24][127:96], data_temp[ 7+24][127:96], data_temp[ 6+24][127:96], data_temp[ 5+24][127:96], 
                         data_temp[ 4+24][127:96], data_temp[ 3+24][127:96], data_temp[ 2+24][127:96], data_temp[ 1+24][127:96], data_temp[ 0+24][127:96]  };
    end    
    else if (layer_type_cur_temp == L_DW && dw_temp_vld2_cnt == 11'd6) begin
        fifo_wr_data <= 768'b0;
    end
end
//-------------------------------------------
// generate control signal
//-------------------------------------------
// reg                             fifo_wr_en;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_en <= 1'b0;
    end
    else if (conv_temp_vld1 == 1'b1 || conv_temp_vld2 == 1'b1 || conv_temp_vld3 == 1'b1) begin
        fifo_wr_en <= 1'b1;
    end
    else if (dw_temp_vld1 == 1'b1 || dw_temp_vld2 == 1'b1) begin
        fifo_wr_en <= 1'b1;
    end
    else begin
        fifo_wr_en <= 1'b0;
    end
end

reg  [6:0]                      fifo_wr_layer_type_cur;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_layer_type_cur <= 7'b0;
    end
    else begin
        fifo_wr_layer_type_cur <= layer_type_cur_temp;
    end
end

reg                             fifo_wr_calc_en;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_calc_en <= 1'b0;
    end
    else if (layer_type_cur_temp == L_CONV) begin
        fifo_wr_calc_en <= 1'b1;
    end
    else if (layer_type_cur_temp == L_DW && s_value_cur_temp == 1'b0) begin
        fifo_wr_calc_en <= 1'b1;
    end
    else if (layer_type_cur_temp == L_DW && s_value_cur_temp == 1'b1 && dw_data_cnt_l2_temp == 11'd0 &&  dw_temp_vld1_cnt == 11'd4) begin
        fifo_wr_calc_en <= 1'b1;
    end
    else if (layer_type_cur_temp == L_DW && s_value_cur_temp == 1'b1 && dw_data_cnt_l2_temp != 11'd0 &&  (dw_temp_vld1_cnt == 11'd2 || dw_temp_vld1_cnt == 11'd4)) begin
        fifo_wr_calc_en <= 1'b1;
    end
    else if (layer_type_cur_temp == L_DW && s_value_cur_temp == 1'b1 && dw_data_cnt_l2_temp != 11'd0 &&  (dw_temp_vld2_cnt == 11'd2 || dw_temp_vld2_cnt == 11'd4 || dw_temp_vld2_cnt == 11'd6)) begin
        fifo_wr_calc_en <= 1'b1;
    end
    else begin
        fifo_wr_calc_en <= 1'b0;
    end
end

reg                             fifo_wr_acc_s;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_acc_s <= 1'b0;
    end
    else if (conv_temp_vld1_cnt == 11'd1 || conv_temp_vld1_cnt == 11'd4) begin
        fifo_wr_acc_s <= 1'b1;
    end
    else if (conv_temp_vld2_cnt == 11'd1 || conv_temp_vld2_cnt == 11'd4 || conv_temp_vld2_cnt == 11'd7) begin
        fifo_wr_acc_s <= 1'b1;
    end
    else if (conv_temp_vld3_cnt == 11'd1 || conv_temp_vld3_cnt == 11'd4) begin
        fifo_wr_acc_s <= 1'b1;
    end
    else begin
        fifo_wr_acc_s <= 1'b0;
    end
end

reg [7:0]                       fifo_wr_acc_para;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        fifo_wr_acc_para <= 8'b0;
    end
    else if (layer_type_cur_temp == L_CONV) begin
        fifo_wr_acc_para <= 8'd2;
    end
    else if (layer_type_cur_temp == L_DW) begin
        fifo_wr_acc_para <= 8'd0;
    end
    else begin
        fifo_wr_acc_para <= 8'd0;
    end
end

assign fifo_wr_all = {fifo_wr_layer_type_cur, fifo_wr_calc_en, fifo_wr_acc_s, fifo_wr_acc_para, fifo_wr_data};
//-------------------------------------------
// Network frame parameters
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