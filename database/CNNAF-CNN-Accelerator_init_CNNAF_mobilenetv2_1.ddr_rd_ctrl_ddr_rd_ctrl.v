module ddr_rd_ctrl(
    input                       clk_200M,
    input                       rst_n,
    
    input                       ddr_ready,
    output reg                  ddr_rd_req,
    output reg [27:0]           ddr_rd_addr,
    // input [127:0]               ddr_rd_data,
    output reg [3:0]            bl_size
    
    // output                      data_out_vld,
    // output                      w_out_vld,
    // output                      sc_out_vld,
    // output                      bias_out_vld,
    // output [127:0]              data_out,
    
    // output                      mode_change,
    // output [1:0]                op_mode,
    // output reg [7:0]            pic_size
    // output [10:0]               channel_size,
    // output                      stride
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

parameter zero_base = 28'd200_0000;

wire [2:0]                      layer_type[53:0];

wire [6:0]                      pic_size_thre_128;
wire [6:0]                      pic_size_thre_64;
wire [6:0]                      pic_size_thre_32;
wire [6:0]                      pic_size_thre_16;
wire [6:0]                      pic_size_thre_8 ;
wire [6:0]                      pic_size_thre_4 ;

wire [10:0]                     c_size_i[54:0];

wire                            s_value[53:0];

wire [27:0]                     data_base[53:0];

wire [27:0]                     w_base[53:0];

wire [27:0]                     bias_base[53:0];


reg [1:0]                       st_rd_cur;
reg                             ddr_rd_req_r;

reg [20:0]						rd_en_cnt;
reg [10:0]                      w_rd_single_cnt;
reg [10:0]                      w_rd_cycle_cnt;

// wire                            col_row_cycle_match_conv;
reg                             flag_w_rd_done;
reg [7:0]                       pic_size;
wire                            conv_all_done;
wire                            dw_all_done;
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
    else if (layer_type_cur == L_CONV && conv_all_done == 1'b1) begin
        layer_num_cur <= layer_num_cur + 1'b1;
    end
    else if (layer_type_cur == L_DW && dw_all_done == 1'b1) begin
        layer_num_cur <= layer_num_cur + 1'b1;
    end
end

//-------------------------------------------
// rd_en_cnt 
//-------------------------------------------
// reg [20:0]						rd_en_cnt;
wire                            w_op_done_each_conv;
wire                            bias_op_done_each_conv;
wire                            data_op_done_each_conv;
wire                                ddr_handshake;

assign ddr_handshake = ddr_rd_req_r == 1'b1 && ddr_ready == 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
	if(!rst_n) begin
		rd_en_cnt <= 21'b0;
	end
	else if (w_op_done_each_conv == 1'b1 || bias_op_done_each_conv == 1'b1 || data_op_done_each_conv == 1'b1) begin
        rd_en_cnt <= 21'b0;
	end
	else if (ddr_handshake == 1'b1) begin
		rd_en_cnt <= rd_en_cnt + 1'b1;
	end
end

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
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 11'd15) begin
        w_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1) begin
        w_cnt_conv_l1 <= w_cnt_conv_l1 + 1'b1;
    end
end

// wire                            w_op_done_each_conv;
assign w_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 11'd15;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        w_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 11'd15 && w_cnt_conv_l2 == 11'd1) begin
        w_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1 && w_cnt_conv_l1 == 11'd15) begin
        w_cnt_conv_l2 <= w_cnt_conv_l2 + 1'b1;
    end
end

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
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1 && bias_cnt_conv_l1 == 11'd1) begin
        bias_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1) begin
        bias_cnt_conv_l1 <= bias_cnt_conv_l1 + 1'b1;
    end
end

// wire                            bias_op_done_each_conv;
assign bias_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1;

// always @ (posedge clk_200M or negedge rst_n)
// begin
    // if(!rst_n) begin
        // bias_cnt_conv_l2 <= 11'd0;
    // end
    // else if (bias_cnt_conv_l2 == 11'd1 && bias_cnt_conv_l1 == 11'd3 && ddr_handshake == 1'b1) begin
        // bias_cnt_conv_l2 <= 11'd0;
    // end
    // else if (bias_cnt_conv_l1 == 11'd3 && ddr_handshake == 1'b1) begin
        // bias_cnt_conv_l2 <= bias_cnt_conv_l2 + 1'b1;
    // end
// end

//-------------------------------------------
// data counter for conv layer
//-------------------------------------------
reg [10:0]                      data_cnt_conv_l1;
reg [10:0]                      data_cnt_conv_l2;
reg [10:0]                      data_cnt_conv_l3;
reg [10:0]                      data_cnt_conv_l4;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2) begin
        data_cnt_conv_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1) begin
        data_cnt_conv_l1 <= data_cnt_conv_l1 + 1'b1;
    end
end

wire [10:0]                     pic_size_quarter_1;
assign pic_size_quarter_1 = pic_size[7:2] - 1'b1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == pic_size_quarter_1) begin
        data_cnt_conv_l2 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2) begin
        data_cnt_conv_l2 <= data_cnt_conv_l2 + 1'b1;
    end
end

wire [10:0]                     pic_size_half_1;
assign pic_size_half_1 = pic_size[7:1] - 1'b1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == pic_size_quarter_1 && data_cnt_conv_l3 == pic_size_half_1) begin
        data_cnt_conv_l3 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == pic_size_quarter_1) begin
        data_cnt_conv_l3 <= data_cnt_conv_l3 + 1'b1;
    end
end

// wire                            data_op_done_each_conv;
assign data_op_done_each_conv = layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == pic_size_quarter_1 && data_cnt_conv_l3 == pic_size_half_1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_conv_l4 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == pic_size_quarter_1 && data_cnt_conv_l3 == pic_size_half_1 && data_cnt_conv_l4 == 11'd1) begin
        data_cnt_conv_l4 <= 11'd0;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == pic_size_quarter_1 && data_cnt_conv_l3 == pic_size_half_1) begin
        data_cnt_conv_l4 <= data_cnt_conv_l4 + 1'b1;
    end
end

// wire                            conv_all_done;
assign conv_all_done = layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1 && data_cnt_conv_l1 == 11'd2 && data_cnt_conv_l2 == pic_size_quarter_1 && data_cnt_conv_l3 == pic_size_half_1 && data_cnt_conv_l4 == 11'd1;

//-------------------------------------------
// weight counter for DW layer
//-------------------------------------------
reg [10:0]                      w_cnt_dw_l1;
reg [10:0]                      w_cnt_dw_l2;
reg [10:0]                      w_cnt_dw_l3;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        w_cnt_dw_l1 <= 11'd0;
    end
    else if (w_cnt_dw_l1 == 11'd3 && ddr_handshake == 1'b1) begin
        w_cnt_dw_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1) begin
        w_cnt_dw_l1 <= w_cnt_dw_l1 + 1'b1;
    end
end

wire                            w_op_done_each_dw;
assign w_op_done_each_dw = w_cnt_dw_l1 == 11'd3 && ddr_handshake == 1'b1;

wire [10:0]                     ci_quarter;
assign ci_quarter = {2'b0, c_size_i[layer_num_cur][10:2]} - 1'b1;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        w_cnt_dw_l2 <= 11'd0;
    end
    else if (w_cnt_dw_l2 == ci_quarter && w_cnt_dw_l1 == 11'd3 && ddr_handshake == 1'b1) begin
        w_cnt_dw_l2 <= 11'd0;
    end
    else if (w_cnt_dw_l1 == 11'd3 && ddr_handshake == 1'b1) begin
        w_cnt_dw_l2 <= w_cnt_dw_l2 + 1'b1;
    end
end

//-------------------------------------------
// bias counter for DW layer
//-------------------------------------------
reg [10:0]                      bias_cnt_dw_l1;
// reg [10:0]                      bias_cnt_dw_l2;
// reg [10:0]                      bias_cnt_dw_l3;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        bias_cnt_dw_l1 <= 11'd0;
    end
    else if (st_rd_cur == ST_BIAS_RD && bias_cnt_dw_l1 == ci_quarter && ddr_handshake == 1'b1) begin
        bias_cnt_dw_l1 <= 11'd0;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1) begin
        bias_cnt_dw_l1 <= bias_cnt_dw_l1 + 1'b1;
    end
end

wire                            bias_op_done_each_dw;
assign bias_op_done_each_dw = layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1;

//-------------------------------------------
// data counter for DW layer
//-------------------------------------------
reg [10:0]                      data_cnt_dw_l1;
reg [10:0]                      data_cnt_dw_l2;
reg [10:0]                      data_cnt_dw_l3;
reg [10:0]                      data_cnt_dw_l4;
reg [10:0]                      data_cnt_dw_l5;
always @ (posedge clk_200M or negedge rst_n) 
begin
    if(!rst_n) begin
        data_cnt_dw_l1 <= 11'd0;
    end
    else if (data_cnt_dw_l1 == 11'd1 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l1 <= 11'd0;
    end
    // else if (layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD && s_value[layer_num_cur] == 1'b0 && ddr_handshake == 1'b1) begin
        // data_cnt_dw_l1 <= data_cnt_dw_l1 + 1'b1;
    // end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && ddr_handshake == 1'b1 && data_cnt_dw_l4 == 11'd0) begin
        data_cnt_dw_l1 <= data_cnt_dw_l1 + 1'b1;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && ddr_handshake == 1'b1 && data_cnt_dw_l4 == pic_size_quarter_1) begin
        data_cnt_dw_l1 <= data_cnt_dw_l1 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_dw_l2 <= 11'd0;
    end
    else if (data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l2 <= 11'd0;
    end
    else if (data_cnt_dw_l4 == 11'd0 && data_cnt_dw_l1 == 11'd1 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l2 <= data_cnt_dw_l2 + 1'b1;
    end
    else if (data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l1 == 11'd1 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l2 <= data_cnt_dw_l2 + 1'b1;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && data_cnt_dw_l4 == 11'd0 && s_value[layer_num_cur] == 1'b1 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l2 <= data_cnt_dw_l2 + 1'b1;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && data_cnt_dw_l4 > 11'd0 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l2 <= data_cnt_dw_l2 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_dw_l3 <= 11'd0;
    end
    else if (data_cnt_dw_l3 == pic_size_quarter_1 && data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l3 <= 11'd0;
    end
    else if (data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l3 <= data_cnt_dw_l3 + 1'b1;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_dw_l4 <= 11'd0;
    end
    else if (data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l3 == pic_size_quarter_1 && data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l4 <= 11'd0;
    end
    else if (data_cnt_dw_l3 == pic_size_quarter_1 && data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l4 <= data_cnt_dw_l4 + 1'b1;
    end
end

wire                            data_op_done_each_dw;
assign data_op_done_each_dw = data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l3 == pic_size_quarter_1 && data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1;

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        data_cnt_dw_l5 <= 11'd0;
    end
    else if (data_cnt_dw_l5 == ci_quarter && data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l3 == pic_size_quarter_1 && data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l5 <= 11'd0;
    end
    else if (data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l3 == pic_size_quarter_1 && data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1) begin
        data_cnt_dw_l5 <= data_cnt_dw_l5 + 1'b1;
    end
end

// wire                            dw_all_done;
assign dw_all_done = data_cnt_dw_l5 == ci_quarter && data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l3 == pic_size_quarter_1 && data_cnt_dw_l2 == 11'd3 && ddr_handshake == 1'b1;
//-------------------------------------------
// read state 
//-------------------------------------------
// parameter ST_W_RD    = 2'd0;
// parameter ST_SC_RD   = 2'd1;
// parameter ST_BIAS_RD = 2'd2;
// parameter ST_DATA_RD = 2'd3;

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
    else if (layer_type_cur == L_DW && w_op_done_each_dw == 1'b1) begin
        st_rd_cur <= ST_BIAS_RD;
    end
    else if (layer_type_cur == L_DW && bias_op_done_each_dw == 1'b1) begin
        st_rd_cur <= ST_DATA_RD;
    end
    else if (layer_type_cur == L_DW && data_op_done_each_dw == 1'b1) begin
        st_rd_cur <= ST_W_RD;
    end
end

//-------------------------------------------
// ddr ctrl 
//-------------------------------------------
// reg                             ddr_rd_req_r;
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        ddr_rd_req_r <= 1'b0;
    end
    else begin
        ddr_rd_req_r <= 1'b1;
    end
end
always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        ddr_rd_req <= 1'b0;
    end
    else begin
        ddr_rd_req <= ddr_rd_req_r;
    end
end

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        ddr_rd_addr <= 28'b0;
    end
    //--------------------- CONV_MODE ---------------------//
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD && ddr_handshake == 1'b1) begin
        // ddr_rd_addr <= w_base[layer_num_cur] + {w_cnt_conv_l1, 3'b0} - w_cnt_conv_l1 + {w_cnt_conv_l2, 7'b0} - {w_cnt_conv_l2, 4'b0};
        ddr_rd_addr <= w_base[layer_num_cur] + w_cnt_conv_l1*9 + w_cnt_conv_l2*144;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD && ddr_handshake == 1'b1) begin
        // ddr_rd_addr <= 28'd100000 + bias_base[layer_num_cur] + {bias_cnt_conv_l1, 2'b0};
        ddr_rd_addr <= 28'd100000 + bias_base[layer_num_cur] + bias_cnt_conv_l1*4;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD && ddr_handshake == 1'b1) begin
        // ddr_rd_addr <= 28'd600000 + {data_cnt_conv_l1, 12'b0} + {data_cnt_conv_l2, 7'b0} + {data_cnt_conv_l3, 1'b0};
        ddr_rd_addr <= 28'd600000 + data_cnt_conv_l1*129*128/4 + data_cnt_conv_l2*129 + data_cnt_conv_l3*2;
    end
    
    //--------------------- DW_MODE ---------------------//
    else if (layer_type_cur == L_DW && st_rd_cur == ST_W_RD) begin
        // ddr_rd_addr <= w_base[layer_num_cur] + {w_cnt_dw_l1, 1'b0} + w_cnt_dw_l1 + {w_cnt_dw_l2, 4'b0} + {w_cnt_conv_l2, 3'b0};
        ddr_rd_addr <= {w_cnt_dw_l1, 1'b0} + w_cnt_dw_l1 + {w_cnt_dw_l2, 4'b0} + {w_cnt_conv_l2, 3'b0};
    end
    
    else if (layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD) begin
        // ddr_rd_addr <= 28'd100000 + bias_base[layer_num_cur] + bias_cnt_dw_l1;
        ddr_rd_addr <= 28'd100000 + bias_cnt_dw_l1;
    end
    
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && data_cnt_dw_l4 == 11'd0 && data_cnt_dw_l1 == 11'd0)begin
        ddr_rd_addr <= zero_base;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l1 == 11'd1) begin
        ddr_rd_addr <= zero_base;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && data_cnt_dw_l4 == 11'd0 && data_cnt_dw_l1 == 11'd1) begin
        ddr_rd_addr <= 28'd600000 + data_cnt_dw_l2 * pic_size * pic_size / 4 + data_cnt_dw_l3 * pic_size + data_cnt_dw_l5 * pic_size * pic_size;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && data_cnt_dw_l4 > 11'b0 && data_cnt_dw_l1 == 11'd0) begin
        ddr_rd_addr <= 28'd600000 + data_cnt_dw_l2 * pic_size * pic_size / 4 + data_cnt_dw_l3 * pic_size + data_cnt_dw_l5 * pic_size * pic_size + data_cnt_dw_l4 * 4 - 1;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b1) begin
        ddr_rd_addr <= 28'd600000 + data_cnt_dw_l2 * pic_size * pic_size / 4 + data_cnt_dw_l3 * pic_size + data_cnt_dw_l5 * pic_size * pic_size + data_cnt_dw_l4 * 4;
    end
end

//-------------------------------------------
// bl ctrl 
//-------------------------------------------

always @ (posedge clk_200M or negedge rst_n)
begin
    if(!rst_n) begin
        bl_size <= 4'b0;
    end
    //--------------------- CONV_MODE ---------------------//
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_W_RD) begin
        bl_size <= 4'd9;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_BIAS_RD) begin
        bl_size <= 4'd4;
    end
    else if (layer_type_cur == L_CONV && st_rd_cur == ST_DATA_RD) begin
        bl_size <= 4'd3;
    end
    
    //--------------------- DW_MODE ---------------------//
    else if (layer_type_cur == L_DW && st_rd_cur == ST_W_RD) begin
        bl_size <= 4'd3;
    end
    
    else if (layer_type_cur == L_DW && st_rd_cur == ST_BIAS_RD) begin
        bl_size <= 4'd1;
    end
    
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && data_cnt_dw_l4 == 11'd0 && data_cnt_dw_l1 == 11'd0) begin
        bl_size <= 4'd1;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l1 == 11'd1) begin
        bl_size <= 4'd1;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && data_cnt_dw_l4 == 11'd0 && data_cnt_dw_l1 == 11'd1)begin
        bl_size <= 4'd5;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && data_cnt_dw_l4 == pic_size_quarter_1 && data_cnt_dw_l1 == 11'd0) begin
        bl_size <= 4'd5;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b0 && data_cnt_dw_l4 > 11'b0 && data_cnt_dw_l1 == 11'd0) begin
        bl_size <= 4'd6;
    end
    else if (layer_type_cur == L_DW && st_rd_cur == ST_DATA_RD && s_value[layer_num_cur] == 1'b1) begin
        bl_size <= 4'd6;
    end
end

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

//data_base
assign data_base[ 0] = 28'd0;       assign data_base[27] = 28'd446464;
assign data_base[ 1] = 28'd12288;   assign data_base[28] = 28'd447488;
assign data_base[ 2] = 28'd45056;   assign data_base[29] = 28'd453632;
assign data_base[ 3] = 28'd77824;   assign data_base[30] = 28'd459776;
assign data_base[ 4] = 28'd94208;   assign data_base[31] = 28'd460800;
assign data_base[ 5] = 28'd192512;  assign data_base[32] = 28'd466944;
assign data_base[ 6] = 28'd217088;  assign data_base[33] = 28'd473088;
assign data_base[ 7] = 28'd223232;  assign data_base[34] = 28'd474624;
assign data_base[ 8] = 28'd260096;  assign data_base[35] = 28'd483840;
assign data_base[ 9] = 28'd296960;  assign data_base[36] = 28'd493056;
assign data_base[10] = 28'd303104;  assign data_base[37] = 28'd494592;
assign data_base[11] = 28'd339968;  assign data_base[38] = 28'd503808;
assign data_base[12] = 28'd349184;  assign data_base[39] = 28'd513024;
assign data_base[13] = 28'd351232;  assign data_base[40] = 28'd514560;
assign data_base[14] = 28'd363520;  assign data_base[41] = 28'd523776;
assign data_base[15] = 28'd375808;  assign data_base[42] = 28'd526080;
assign data_base[16] = 28'd377856;  assign data_base[43] = 28'd526720;
assign data_base[17] = 28'd390144;  assign data_base[44] = 28'd530560;
assign data_base[18] = 28'd402432;  assign data_base[45] = 28'd534400;
assign data_base[19] = 28'd404480;  assign data_base[46] = 28'd535040;
assign data_base[20] = 28'd416768;  assign data_base[47] = 28'd538880;
assign data_base[21] = 28'd419840;  assign data_base[48] = 28'd542720;
assign data_base[22] = 28'd420864;  assign data_base[49] = 28'd543360;
assign data_base[23] = 28'd427008;  assign data_base[50] = 28'd547200;
assign data_base[24] = 28'd433152;  assign data_base[51] = 28'd551040;
assign data_base[25] = 28'd434176;  assign data_base[52] = 28'd552320;
assign data_base[26] = 28'd440320;  assign data_base[53] = 28'd557440;

//w_base
assign w_base[ 0] = 28'd0    ;  assign w_base[27] = 28'd44336;
assign w_base[ 1] = 28'd216  ;  assign w_base[28] = 28'd50480;
assign w_base[ 2] = 28'd288  ;  assign w_base[29] = 28'd51344;
assign w_base[ 3] = 28'd416  ;  assign w_base[30] = 28'd57488;
assign w_base[ 4] = 28'd800  ;  assign w_base[31] = 28'd63632;
assign w_base[ 5] = 28'd1016 ;  assign w_base[32] = 28'd64496;
assign w_base[ 6] = 28'd1592 ;  assign w_base[33] = 28'd73712;
assign w_base[ 7] = 28'd2456 ;  assign w_base[34] = 28'd87536;
assign w_base[ 8] = 28'd2780 ;  assign w_base[35] = 28'd88832;
assign w_base[ 9] = 28'd3644 ;  assign w_base[36] = 28'd102656;
assign w_base[10] = 28'd4508 ;  assign w_base[37] = 28'd116480;
assign w_base[11] = 28'd4832 ;  assign w_base[38] = 28'd117776;
assign w_base[12] = 28'd5984 ;  assign w_base[39] = 28'd131600;
assign w_base[13] = 28'd7520 ;  assign w_base[40] = 28'd145424;
assign w_base[14] = 28'd7952 ;  assign w_base[41] = 28'd146720;
assign w_base[15] = 28'd9488 ;  assign w_base[42] = 28'd169760;
assign w_base[16] = 28'd11024;  assign w_base[43] = 28'd208160;
assign w_base[17] = 28'd11456;  assign w_base[44] = 28'd210320;
assign w_base[18] = 28'd12992;  assign w_base[45] = 28'd248720;
assign w_base[19] = 28'd14528;  assign w_base[46] = 28'd287120;
assign w_base[20] = 28'd14960;  assign w_base[47] = 28'd289280;
assign w_base[21] = 28'd18032;  assign w_base[48] = 28'd327680;
assign w_base[22] = 28'd24176;  assign w_base[49] = 28'd366080;
assign w_base[23] = 28'd25040;  assign w_base[50] = 28'd368240;
assign w_base[24] = 28'd31184;  assign w_base[51] = 28'd445040;
assign w_base[25] = 28'd37328;  assign w_base[53] = 28'd547440;
assign w_base[26] = 28'd38192;                

//bias_base
assign bias_base[ 0] = 28'd0  ;  assign bias_base[27] = 28'd968 ;
assign bias_base[ 1] = 28'd8  ;  assign bias_base[28] = 28'd1064;
assign bias_base[ 2] = 28'd16 ;  assign bias_base[29] = 28'd1160;
assign bias_base[ 3] = 28'd20 ;  assign bias_base[30] = 28'd1176;
assign bias_base[ 4] = 28'd44 ;  assign bias_base[31] = 28'd1272;
assign bias_base[ 5] = 28'd68 ;  assign bias_base[32] = 28'd1368;
assign bias_base[ 6] = 28'd74 ;  assign bias_base[33] = 28'd1392;
assign bias_base[ 7] = 28'd110;  assign bias_base[34] = 28'd1536;
assign bias_base[ 8] = 28'd146;  assign bias_base[35] = 28'd1680;
assign bias_base[ 9] = 28'd152;  assign bias_base[36] = 28'd1704;
assign bias_base[10] = 28'd188;  assign bias_base[37] = 28'd1848;
assign bias_base[11] = 28'd224;  assign bias_base[38] = 28'd1992;
assign bias_base[12] = 28'd232;  assign bias_base[39] = 28'd2016;
assign bias_base[13] = 28'd280;  assign bias_base[40] = 28'd2160;
assign bias_base[14] = 28'd328;  assign bias_base[41] = 28'd2304;
assign bias_base[15] = 28'd336;  assign bias_base[42] = 28'd2344;
assign bias_base[16] = 28'd384;  assign bias_base[43] = 28'd2584;
assign bias_base[17] = 28'd432;  assign bias_base[44] = 28'd2824;
assign bias_base[18] = 28'd440;  assign bias_base[45] = 28'd2864;
assign bias_base[19] = 28'd488;  assign bias_base[46] = 28'd3104;
assign bias_base[20] = 28'd536;  assign bias_base[47] = 28'd3344;
assign bias_base[21] = 28'd552;  assign bias_base[48] = 28'd3384;
assign bias_base[22] = 28'd648;  assign bias_base[49] = 28'd3624;
assign bias_base[23] = 28'd744;  assign bias_base[50] = 28'd3864;
assign bias_base[24] = 28'd760;  assign bias_base[51] = 28'd3944;
assign bias_base[25] = 28'd856;  assign bias_base[53] = 28'd4264;
assign bias_base[26] = 28'd952;



endmodule