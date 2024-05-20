// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`include "params.vh"
module  l1dcache
#( 
    // parameter XLEN = 64,
    // parameter VIRTUAL_ADDR_LEN = 32,
    parameter WB_DATA_LEN = 32
)
(
    `ifdef USE_POWER_PINS
        inout vccd1,	// User area 1 1.8V supply
        inout vssd1,	// User area 1 digital ground
    `endif

    input clk,
    input rstn,
    
    //req
    input  req_valid_i,
    output req_ready_o,
    input  opcode,//0 load ,1 store 
    input [VIRTUAL_ADDR_LEN - 1 : 0] req_addr_i,
    input [2:0]  type_i,
    input [XLEN -1:0] st_data_i,
    input [LSU_LSQ_SIZE_WIDTH - 1 : 0] rob_index_i,

    //resp
    input  resp_ready_i,
    output resp_valid_o,
    output [XLEN -1:0] ld_data_o,
    output [LSU_LSQ_SIZE_WIDTH - 1 : 0] rob_index_o,

    //sram
    output tag_chip_en,
    output tag_write_en,
    output [3:0] write_tag_mask,
    output [7:0] tag_index,
    output [31:0] tag_data_in,
    input  [31:0] tag_out, 

    output data_chip_en_1,
    output data_write_en_1,
    output [3:0] write_data_mask_1,
    output [7:0] data_index_1,
    output [31:0] data_in_1,
    input  [31:0] data_out_1, 

    output data_chip_en_2,
    output data_write_en_2,
    output [3:0] write_data_mask_2,
    output [7:0] data_index_2,
    output [31:0] data_in_2,
    input  [31:0] data_out_2, 

    //memory
    output wb_cyc_o,
    output wb_stb_o,
    output wb_we_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] wb_adr_o,
    output [WB_DATA_LEN-1:0] wb_dat_o,
    output [WB_DATA_LEN/8-1:0] wb_sel_o,
    output [9:0] wb_bl_o,
    output wb_bry_o,
    input  wb_ack_i,
    input  [WB_DATA_LEN -1:0] wb_dat_i
);

reg input_stall = '0;
wire req_hsk;
wire req_hsk_q;
wire s1_ld_tag_is_hit;
wire s1_st_tag_is_hit;
wire s1_ld_tag_is_miss;
wire s1_st_tag_is_miss;
wire refill_hsk;
reg mshr_is_full = '0;
reg [VIRTUAL_ADDR_LEN - 1 : 0] mshr_addr = '0;
reg [2:0] mshr_type;
reg [XLEN -1:0] mshr_data;
reg mshr_opcode;
reg [LSU_LSQ_SIZE_WIDTH - 1 : 0] mshr_rob_index;
wire  s1_opcode_nxt;
wire  [31:0] s1_addr_nxt;
wire  [63:0] s1_data_nxt;
wire  [2:0]  s1_type_nxt;
wire  s1_valid_nxt;
wire  [LSU_LSQ_SIZE_WIDTH - 1:0] s1_rob_index_nxt; 
wire  s1_opcode;
wire  [31:0] s1_addr;
wire  [63:0] s1_data;
wire  [2:0] s1_type;
wire  s1_valid;
wire  [LSU_LSQ_SIZE_WIDTH - 1:0] s1_rob_index;
wire  s2_opcode_nxt;
wire [31:0] s2_addr_nxt;
wire [63:0] s2_data_nxt;
wire [2:0] s2_type_nxt;
wire [LSU_LSQ_SIZE_WIDTH - 1:0] s2_rob_index_nxt;
wire s2_valid_nxt;
wire s2_opcode;
wire [31:0] s2_addr;
wire [63:0] s2_data;
wire [2:0] s2_type;
wire s2_valid;
wire [LSU_LSQ_SIZE_WIDTH - 1:0] s2_rob_index;
wire cache_mem_is_write;
wire cache_mem_is_write_q;
wire [63:0] wb_dat;
wire [31:0] wb_tag;
wire [63:0] st_dat;
wire [31:0] tag_out;
wire [63:0] st_dat_mask;
wire [63:0] wb_ack_i_mask;
wire [7:0] index;
wire [31:0] tag_data_in;
wire [63:0] data_in;
wire [63:0] write_data_in;
wire [63:0] data_out;
wire [7:0] write_data_mask;
wire [7:0] write_data_mask_in;
wire [63:0] ld_data_refill;
wire [63:0] ld_data_cache;
wire refill_hsk_q;
wire req_hsk_mshr_is_full;
wire req_hsk_mshr_is_full_q;
wire s1_st_tag_is_hit_q; 
wire s1_st_tag_is_miss_q;
wire s1_ld_tag_is_hit_q;
wire s1_ld_tag_is_miss_q;
wire s1_opcode_nxt_q;
wire [31:0] s1_addr_nxt_q;
wire [63:0] s1_data_nxt_q;
wire [2:0] s1_type_nxt_q;
wire s1_valid_nxt_q;
wire [LSU_LSQ_SIZE_WIDTH - 1:0] s1_rob_index_nxt_q;
wire s2_opcode_nxt_q;
wire [31:0] s2_addr_nxt_q;
wire [63:0] s2_data_nxt_q;
wire [2:0] s2_type_nxt_q;
wire s2_valid_nxt_q;
wire [LSU_LSQ_SIZE_WIDTH - 1:0] s2_rob_index_nxt_q;
wire req_hsk_q_q;
wire data_chip_en;
wire data_write_en;
wire s1_stall;
wire s2_stall;
wire s1_ena;
wire s2_ena;
wire [31:0] mshr_tag_out;
wire [63:0] mshr_data_out;
wire [31:0] mshr_tag_out_q;
wire [63:0] mshr_data_out_q;
wire burst;
wire [31:0] refill_buffer;
wire [31:0] refill_buffer_q;
wire [63:0] refill_data;
wire burst_q;
reg opcode_save;
reg [VIRTUAL_ADDR_LEN - 1 : 0] addr_save;
reg [2:0] type_save;
reg [XLEN -1:0] data_save;
reg [LSU_LSQ_SIZE_WIDTH - 1 : 0] rob_index_save;
wire [31:0] tag_dout1;
wire [31:0] data_dout1;
wire [31:0] data_dout2;
wire replay;
wire replay_q;
wire replay_q_q;
reg [63:0] data_out_save;
reg start;
reg [31:0] tag_out_save;
wire [31:0] tag_out_use;
wire tag_chip_en_q;
wire tag_write_en_q;
wire s1_stall_q;
wire data_chip_en_q;
wire data_write_en_q;
wire mshr_is_full_q;
wire [63:0] st_hit_dat_mask;
wire [63:0] st_hit_dat_mask_q;
wire [63:0] st_hit_i_mask;
wire [63:0] st_hit_i_mask_q;
wire [63:0] st_hit_dat;
wire [63:0] st_hit_dat_q;
wire s1_st_tag_is_hit_q_q;
wire [31:0] s2_addr_q;
wire [31:0] s1_addr_q;
wire [63:0] data_in_Q;
wire [63:0] data_write_en_Q;
wire req_hsk_q_q_q;
wire refill_hsk_q_q;
/////////////////////////////////////////
//clean sram
reg [7:0] counter = 8'b00000000;
reg reset = '1;

always @(posedge clk) begin

    if(rstn) begin
    reset <= '1;
    if(counter != 8'b11111111) begin
        counter <= counter +1;
    end else if(counter == 8'b11111111) begin
        counter <= 8'b00000000;
    end

    end else begin
        reset <= '0;
    end
end
always @(posedge clk) begin
    if(~rstn) begin
        start <= 1'b1;
    end  
    if(rstn) begin
        start <= 1'b0;
    end
end

assign tag_index = index;
assign data_index_1 = index;
assign data_index_2 = index;
assign data_chip_en_1 = data_chip_en;
assign data_chip_en_2 = data_chip_en;
assign data_write_en_1 = data_write_en;
assign data_write_en_2 = data_write_en;
assign write_data_mask_1 = write_data_mask[3:0]; 
assign write_data_mask_2 = write_data_mask[7:4];
assign data_in_1 = data_in[31:0];
assign data_in_2 = data_in[63:32];
assign data_out = {data_out_2,data_out_1};


wire [63:0] data_in_q;
wire [7:0] write_data_mask_q; 
wire [7:0] index_q;
std_dffr #(.WIDTH(64)) DATA_IN (.clk(clk),.rstn(rstn),.d(data_in),.q(data_in_q));  
std_dffr #(.WIDTH(8)) DATA_MASK (.clk(clk),.rstn(rstn),.d(write_data_mask),.q(write_data_mask_q));  
std_dffr #(.WIDTH(8)) INDEX (.clk(clk),.rstn(rstn),.d(index),.q(index_q));  
assign tag_chip_en = ~(req_hsk | (s2_valid & s2_opcode) | refill_hsk | reset | (refill_hsk_q & input_stall));
assign data_chip_en = ~(req_hsk | (s2_valid & s2_opcode) | refill_hsk | reset | (refill_hsk_q & input_stall));

assign index = reset ? counter :
               refill_hsk ? mshr_addr[10:3] :
               (refill_hsk_q & input_stall) ? addr_save[10:3] :
               req_hsk ? req_addr_i[10:3] :
               (s2_valid & s2_opcode) ? s2_addr[10:3]: 
               8'b0;

assign data_write_en = ~(reset | (s2_valid & s2_opcode) | refill_hsk);
assign tag_write_en = ~(reset | (s2_valid & s2_opcode) | refill_hsk);

assign write_data_mask_in = 
                    (s2_opcode == 1 && s2_type == 3'b000) ?  (8'b00000001 << s2_addr[2:0]):
                    (s2_opcode == 1 && s2_type == 3'b001) ?  (8'b00000011 << s2_addr[2:0]):
                    (s2_opcode == 1 && s2_type == 3'b010) ?  (8'b00001111 << s2_addr[2:0]):
                    (s2_opcode == 1 && s2_type == 3'b011) ?  (8'b11111111 << s2_addr[2:0]):
                    8'b0;
assign write_data_in = 
                    (s2_opcode == 1 && s2_type == 3'b000) ?  (s2_data << 8*s2_addr[2:0]):
                    (s2_opcode == 1 && s2_type == 3'b001) ?  (s2_data << 8*s2_addr[2:0]):
                    (s2_opcode == 1 && s2_type == 3'b010) ?  (s2_data << 8*s2_addr[2:0]):
                    (s2_opcode == 1 && s2_type == 3'b011) ?  (s2_data << 8*s2_addr[2:0]):
                    64'b0;
assign write_data_mask = reset ? 8'b11111111 :
                         refill_hsk ? 8'b11111111 :
                         (s2_valid & s2_opcode) ? write_data_mask_in :
                         8'b0;
                         

assign write_tag_mask = reset ? 4'b1111 :
                        refill_hsk ? 4'b1111 :
                        (s2_valid & s2_opcode) ? 4'b1000: 
                        4'b0;

assign data_in = reset ? 64'hFFFFFFFFFFFFFFFF :
                 refill_hsk ? wb_dat :
                 (s2_valid & s2_opcode) ? write_data_in :
                 64'b0;

                 

assign tag_data_in = reset ? 32'hFFFFFFFF :// F
                     refill_hsk ? wb_tag :
                     (s2_valid & s2_opcode) ? {1'b1,31'b0}: 
                     32'b0;

assign wb_bl_o = wb_stb_o ? 10'b0000000001 : 10'b0000000000;
assign wb_bry_o = wb_stb_o;


//////////////////////////////////////
//replay tag miss req when mshr is full

always @(posedge clk) begin
    if (req_hsk) begin
        opcode_save <= opcode;
        addr_save <= req_addr_i;
        type_save <= type_i;
        data_save <= st_data_i;
        rob_index_save <= rob_index_i;
    end

end


//////////////////////////////////////
// req_ready_o and resp_valid_o and stall

assign s2_stall = refill_hsk;
assign s1_stall = refill_hsk;

always @(posedge clk) begin
    if(rstn) begin
        input_stall <= '0;
    end else begin
    if(mshr_is_full & (s1_ld_tag_is_miss | s1_st_tag_is_miss)) begin
        input_stall <= '1;
    end
    if(refill_hsk_q & input_stall) begin
        input_stall <= '0;
    end
    end
end


std_dffr #(.WIDTH(1)) REFILL_HSK (.clk(clk),.rstn(rstn),.d(refill_hsk),.q(refill_hsk_q));  
std_dffr #(.WIDTH(1)) REFILL_HSK_1 (.clk(clk),.rstn(rstn),.d(refill_hsk_q),.q(refill_hsk_q_q));
assign req_ready_o = rstn ? 1'b1:
                     refill_hsk ? 1'b0 :
                     req_hsk_mshr_is_full_q ? 1'b0 :
                     input_stall ? 1'b0:
                     (req_hsk_q_q & (req_hsk_q | s1_st_tag_is_hit_q)) ? 1'b0:
                     (replay_q_q & req_hsk_q) ? 1'b0:
                     (replay_q_q & s1_st_tag_is_hit_q) ? 1'b0:
                     (s2_valid & opcode) ? 1'b0:
                     (req_hsk_q_q_q & req_hsk_q & refill_hsk_q_q) ? 1'b0:
                     1'b1;

                     
std_dffr #(.WIDTH(1)) REQ_HSK_1 (.clk(clk),.rstn(rstn),.d(req_hsk),.q(req_hsk_q));
std_dffr #(.WIDTH(1)) REQ_HSK_2 (.clk(clk),.rstn(rstn),.d(req_hsk_q),.q(req_hsk_q_q));
std_dffr #(.WIDTH(1)) REQ_HSK_3 (.clk(clk),.rstn(rstn),.d(req_hsk_q_q),.q(req_hsk_q_q_q));
assign req_hsk_mshr_is_full = mshr_is_full & req_hsk;
std_dffr #(.WIDTH(1)) REQ_HSK_MSHR_IS_FULL (.clk(clk),.rstn(rstn),.d(req_hsk_mshr_is_full),.q(req_hsk_mshr_is_full_q));                     
assign resp_valid_o = refill_hsk & ~mshr_opcode ? 1'b1 :
                      (s2_valid & ~s2_opcode)? 1'b1 :
                      1'b0;

assign replay = refill_hsk_q & input_stall ? 1'b1 : 1'b0;
std_dffr #(.WIDTH(1)) REPLAY_1 (.clk(clk),.rstn(rstn),.d(replay),.q(replay_q));
std_dffr #(.WIDTH(1)) REPLAY_2 (.clk(clk),.rstn(rstn),.d(replay_q),.q(replay_q_q));
assign refill_hsk = (wb_ack_i & burst_q & resp_ready_i & ~cache_mem_is_write_q);
// 在verilator中若ack下降和clk的上升沿是同时的，则在clk高电平时会认为wb_ack_i还是高（因为在eval()时尚未ack降低）
//所以目前使ack下降先于clk上升沿，避免这一问题

//////////////////////////////////////
// mshr and mlfb

reg mshr_just_full = '0;

always @(posedge clk) begin
    if(rstn) begin
        mshr_is_full <= '0;
    end
    if((s1_st_tag_is_miss | s1_ld_tag_is_miss) & ~mshr_is_full) begin
        mshr_is_full <= '1;
        mshr_addr <= s1_addr;
        mshr_type <= s1_type;
        mshr_data <= s1_data;
        mshr_opcode <= s1_opcode;
        mshr_rob_index <= s1_rob_index;
        mshr_just_full <='1;
    end else begin
        mshr_just_full <='0;
    end
    if(refill_hsk) begin
        mshr_is_full <= '0;
    end

end
assign mshr_tag_out = ((s1_st_tag_is_miss_q | s1_ld_tag_is_miss_q) & ~mshr_is_full_q & s1_st_tag_is_hit_q_q & (s2_addr_q[10:3] == s1_addr_q[10:3])) ? {1'b1,tag_out_save[30:0]} :
                      ((s1_st_tag_is_miss_q | s1_ld_tag_is_miss_q) & ~mshr_is_full_q) ? tag_out_save : 
                      mshr_tag_out_q;

assign data_write_en_Q = {{8{write_data_mask_q[7]}},{8{write_data_mask_q[6]}},{8{write_data_mask_q[5]}},{8{write_data_mask_q[4]}},{8{write_data_mask_q[3]}},{8{write_data_mask_q[2]}},{8{write_data_mask_q[1]}},{8{write_data_mask_q[0]}}};
assign data_in_Q = (data_write_en_Q & data_in_q) | (~data_write_en_Q & data_out_save);
assign mshr_data_out = ((s1_st_tag_is_miss_q | s1_ld_tag_is_miss_q)& ~mshr_is_full_q & s1_st_tag_is_hit_q_q & (s2_addr_q[10:3] == s1_addr_q[10:3])) ? data_in_Q :
                       ((s1_st_tag_is_miss_q | s1_ld_tag_is_miss_q) & ~mshr_is_full_q) ? data_out_save : 
                       mshr_data_out_q;

std_dffr #(.WIDTH(32)) MSHR_TAG_OUT (.clk(clk),.rstn(rstn),.d(mshr_tag_out),.q(mshr_tag_out_q));
std_dffr #(.WIDTH(64)) MSHR_DATA_OUT (.clk(clk),.rstn(rstn),.d(mshr_data_out),.q(mshr_data_out_q));
std_dffr #(.WIDTH(1)) MSHR_IS_FULL (.clk(clk),.rstn(rstn),.d(mshr_is_full),.q(mshr_is_full_q));
assign refill_data = {wb_dat_i,refill_buffer};
assign refill_buffer = wb_ack_i & burst ? wb_dat_i :
                       refill_buffer_q;
std_dffr #(.WIDTH(32)) REFILL_BUFFER (.clk(clk),.rstn(rstn),.d(refill_buffer),.q(refill_buffer_q));
assign burst = (wb_ack_i & ~burst_q) ? 1'b1:
               (wb_ack_i & burst_q) ? 1'b0:
               burst_q;

std_dffr #(.WIDTH(1)) BURST (.clk(clk),.rstn(rstn),.d(burst),.q(burst_q));

assign cache_mem_is_write = (wb_ack_i & cache_mem_is_write_q & burst_q) ? 1'b0 :
                            (s1_st_tag_is_miss_q | s1_ld_tag_is_miss_q) & (mshr_tag_out[30]==1) ? 1'b0 :
                            (s1_st_tag_is_miss_q | s1_ld_tag_is_miss_q) & mshr_is_full & (mshr_tag_out[31]==1) & mshr_just_full ? 1'b1 :
                            cache_mem_is_write_q; 
std_dffr #(.WIDTH(1)) CACHE_MEM_IS_WRITE (.clk(clk),.rstn(rstn),.d(cache_mem_is_write),.q(cache_mem_is_write_q));
assign wb_stb_o =   wb_ack_i ? 1'b0:
                    wb_cyc_o;
assign wb_cyc_o = 
                  refill_hsk ? 1'b0:
                  mshr_is_full ? 1'b1 :
                  1'b0;


assign wb_we_o = cache_mem_is_write;
assign wb_adr_o = cache_mem_is_write & ~burst ? {mshr_tag_out[20:0],mshr_addr[10:3],3'b000}:
                  cache_mem_is_write & burst ? {mshr_tag_out[20:0],mshr_addr[10:3],3'b100}:
                  ~cache_mem_is_write & ~burst ? {mshr_addr[31:3],3'b000}:
                  ~cache_mem_is_write & burst ? {mshr_addr[31:3],3'b100}:
                  32'b0;                                       
assign wb_dat_o = cache_mem_is_write & ~burst ? mshr_data_out[31:0]:
                  cache_mem_is_write & burst ? mshr_data_out[63:32]:
                  32'b0;
assign wb_sel_o = 4'b1111;


always @(posedge clk) begin
    if(~tag_chip_en_q & tag_write_en_q & refill_hsk & (index_q == index)) begin
        tag_out_save <= tag_data_in;
    end
    if(~tag_chip_en_q & tag_write_en_q & ~(refill_hsk & (index_q == index))) begin
        tag_out_save <= tag_out;
    end  
    if(~tag_chip_en_q & tag_write_en_q & refill_hsk & (index_q == index)) begin
        data_out_save <= data_in;
    end
    if(~data_chip_en_q & data_write_en_q & s1_ld_tag_is_hit & s1_st_tag_is_hit_q & (s2_addr_nxt[31:3] == s2_addr_nxt_q[31:3])) begin
        data_out_save <= st_hit_dat;
    end
    if(~data_chip_en_q & data_write_en_q & ~(s1_ld_tag_is_hit & s1_st_tag_is_hit_q & (s2_addr_nxt[31:3] == s2_addr_nxt_q[31:3])) & ~(refill_hsk & (index_q == index))) begin
        data_out_save <= data_out;
    end
end
std_dffr #(.WIDTH(1)) TAG_CHIP_EN (.clk(clk),.rstn(rstn),.d(tag_chip_en),.q(tag_chip_en_q));
std_dffr #(.WIDTH(1)) TAG_WRITE_EN (.clk(clk),.rstn(rstn),.d(tag_write_en),.q(tag_write_en_q));
std_dffr #(.WIDTH(1)) DATA_CHIP_EN (.clk(clk),.rstn(rstn),.d(data_chip_en),.q(data_chip_en_q));
std_dffr #(.WIDTH(1)) DATA_WRITE_EN (.clk(clk),.rstn(rstn),.d(data_write_en),.q(data_write_en_q));
//s0
assign req_hsk = req_valid_i & req_ready_o & start;

assign s1_opcode_nxt = req_hsk ? opcode :
                       refill_hsk_q & input_stall ? opcode_save : 
                       s1_stall ? s1_opcode_nxt_q :
                       1'b0;
assign s1_addr_nxt = req_hsk ? req_addr_i : 
                       s1_stall ? s1_addr_nxt_q :
                       refill_hsk_q & input_stall ? addr_save : 
                       32'b0;
assign s1_data_nxt =   req_hsk ? st_data_i : 
                       refill_hsk_q & input_stall ? data_save : 
                       s1_stall ? s1_data_nxt_q :
                       64'b0;
assign s1_type_nxt = req_hsk ? type_i : 
                       refill_hsk_q & input_stall ? type_save : 
                       s1_stall ? s1_type_nxt_q :
                       3'b0;
assign s1_rob_index_nxt = req_hsk ? rob_index_i : 
                        refill_hsk_q & input_stall ? rob_index_save : 
                        s1_stall ? s1_rob_index_nxt_q :
                        1'b0;
assign s1_valid_nxt = req_hsk ? 1'b1 :
                      refill_hsk_q & input_stall ? 1'b1 : 
                      s1_stall ? s1_valid_nxt_q :          
                        1'b0;

assign s1_ena = s1_stall ? 1'b0 : 1'b1;



std_dffr #(.WIDTH(1)) S1_OPCODE_Q (.clk(clk),.rstn(rstn),.d(s1_opcode_nxt),.q(s1_opcode_nxt_q));
std_dffr #(.WIDTH(32)) S1_ADDR_Q (.clk(clk),.rstn(rstn),.d(s1_addr_nxt),.q(s1_addr_nxt_q));
std_dffr #(.WIDTH(64)) S1_DATA_Q (.clk(clk),.rstn(rstn),.d(s1_data_nxt),.q(s1_data_nxt_q));
std_dffr #(.WIDTH(3)) S1_TYPE_Q (.clk(clk),.rstn(rstn),.d(s1_type_nxt),.q(s1_type_nxt_q));
std_dffr #(.WIDTH(1)) S1_VALID_Q (.clk(clk),.rstn(rstn),.d(s1_valid_nxt),.q(s1_valid_nxt_q));
std_dffr #(.WIDTH(1)) S1_ROB_INDEX_Q (.clk(clk),.rstn(rstn),.d(s1_rob_index_nxt),.q(s1_rob_index_nxt_q));

std_dffe #(.WIDTH(1)) S1_OPCODE (.clk(clk),.en(s1_ena),.d(s1_opcode_nxt),.q(s1_opcode));
std_dffe #(.WIDTH(32)) S1_ADDR (.clk(clk),.en(s1_ena),.d(s1_addr_nxt),.q(s1_addr));
std_dffe #(.WIDTH(64)) S1_DATA (.clk(clk),.en(s1_ena),.d(s1_data_nxt),.q(s1_data));
std_dffe #(.WIDTH(3)) S1_TYPE (.clk(clk),.en(s1_ena),.d(s1_type_nxt),.q(s1_type));
std_dffe #(.WIDTH(1)) S1_VALID (.clk(clk),.en(s1_ena),.d(s1_valid_nxt),.q(s1_valid));
std_dffe #(.WIDTH(1)) S1_ROB_INDEX (.clk(clk),.en(s1_ena),.d(s1_rob_index_nxt),.q(s1_rob_index));
std_dffr #(.WIDTH(32)) S1_ADDR_Q_Q (.clk(clk),.rstn(rstn),.d(s1_addr),.q(s1_addr_q));

assign tag_out_use =  s1_stall_q ? tag_out_save : tag_out;
std_dffr #(.WIDTH(1)) S1_STALL (.clk(clk),.rstn(rstn),.d(s1_stall),.q(s1_stall_q));
//s1
// assign s1_ld_tag_is_hit = s1_valid & (s1_addr[31:11] == tag_out_use[20:0]) & (s1_opcode==0) & (tag_out_use[30] == 0) & ~((tag_out_use[20:0] == mshr_addr[31:11]) & (mshr_is_full == 1));

// assign s1_st_tag_is_hit = s1_valid & (s1_addr[31:11] == tag_out_use[20:0]) & (s1_opcode==1) & (tag_out_use[30] == 0) & ~((tag_out_use[20:0] == mshr_addr[31:11]) & (mshr_is_full == 1));
assign s1_ld_tag_is_hit = s1_valid & (s1_addr[31:11] == tag_out_use[20:0]) & (s1_opcode==0) & (tag_out_use[30] == 0) & ~((s1_addr[10:3] == mshr_addr[10:3]) & (mshr_is_full == 1));

assign s1_st_tag_is_hit = s1_valid & (s1_addr[31:11] == tag_out_use[20:0]) & (s1_opcode==1) & (tag_out_use[30] == 0) & ~((s1_addr[10:3] == mshr_addr[10:3]) & (mshr_is_full == 1));

assign s1_ld_tag_is_miss = (s1_valid & ~s1_opcode) ? ~s1_ld_tag_is_hit : 1'b0;

assign s1_st_tag_is_miss = (s1_valid & s1_opcode) ? ~s1_st_tag_is_hit : 1'b0;

std_dffr #(.WIDTH(1)) S1_LD_TAG_IS_HIT (.clk(clk),.rstn(rstn),.d(s1_ld_tag_is_hit),.q(s1_ld_tag_is_hit_q));
std_dffr #(.WIDTH(1)) S1_ST_TAG_IS_HIT (.clk(clk),.rstn(rstn),.d(s1_st_tag_is_hit),.q(s1_st_tag_is_hit_q));
std_dffr #(.WIDTH(1)) S1_ST_TAG_IS_HIT_Q (.clk(clk),.rstn(rstn),.d(s1_st_tag_is_hit_q),.q(s1_st_tag_is_hit_q_q));
std_dffr #(.WIDTH(1)) S1_LD_TAG_IS_MISS (.clk(clk),.rstn(rstn),.d(s1_ld_tag_is_miss),.q(s1_ld_tag_is_miss_q));
std_dffr #(.WIDTH(1)) S1_ST_TAG_IS_MISS (.clk(clk),.rstn(rstn),.d(s1_st_tag_is_miss),.q(s1_st_tag_is_miss_q));


assign s2_opcode_nxt = (s1_ld_tag_is_hit | s1_st_tag_is_hit ) ? s1_opcode : 
                       s2_stall ? s2_opcode_nxt_q :
                        1'b0;
assign s2_addr_nxt = (s1_ld_tag_is_hit | s1_st_tag_is_hit ) ? s1_addr : 
                       s2_stall ? s2_addr_nxt_q :
                       32'b0;
assign s2_data_nxt = (s1_ld_tag_is_hit | s1_st_tag_is_hit ) ? s1_data : 
                       s2_stall ? s2_data_nxt_q :
                       64'b0;
assign s2_type_nxt = (s1_ld_tag_is_hit | s1_st_tag_is_hit ) ? s1_type : 
                       s2_stall ? s2_type_nxt_q :
                        3'b0;
assign s2_rob_index_nxt = (s1_ld_tag_is_hit | s1_st_tag_is_hit ) ? s1_rob_index : 
                        s2_stall ? s2_rob_index_nxt_q :
                        1'b0;
assign s2_valid_nxt = (s1_ld_tag_is_hit | s1_st_tag_is_hit ) ? 1'b1 : 
                        s2_stall ? s2_valid_nxt_q :
                        1'b0 ;

assign s2_ena = s2_stall ? 1'b0 : 1'b1;



std_dffr #(.WIDTH(1)) S2_OPCODE_Q (.clk(clk),.rstn(rstn),.d(s2_opcode_nxt),.q(s2_opcode_nxt_q));
std_dffr #(.WIDTH(32)) S2_ADDR_Q (.clk(clk),.rstn(rstn),.d(s2_addr_nxt),.q(s2_addr_nxt_q));
std_dffr #(.WIDTH(64)) S2_DATA_Q (.clk(clk),.rstn(rstn),.d(s2_data_nxt),.q(s2_data_nxt_q));
std_dffr #(.WIDTH(3)) S2_TYPE_Q (.clk(clk),.rstn(rstn),.d(s2_type_nxt),.q(s2_type_nxt_q));
std_dffr #(.WIDTH(1)) S2_VALID_Q (.clk(clk),.rstn(rstn),.d(s2_valid_nxt),.q(s2_valid_nxt_q));
std_dffr #(.WIDTH(1)) S2_ROB_INDEX_Q (.clk(clk),.rstn(rstn),.d(s2_rob_index_nxt),.q(s2_rob_index_nxt_q));

std_dffe #(.WIDTH(1)) S2_OPCODE (.clk(clk),.en(s2_ena),.d(s2_opcode_nxt),.q(s2_opcode));
std_dffe #(.WIDTH(32)) S2_ADDR (.clk(clk),.en(s2_ena),.d(s2_addr_nxt),.q(s2_addr));
std_dffe #(.WIDTH(64)) S2_DATA (.clk(clk),.en(s2_ena),.d(s2_data_nxt),.q(s2_data));
std_dffe #(.WIDTH(3)) S2_TYPE (.clk(clk),.en(s2_ena),.d(s2_type_nxt),.q(s2_type));
std_dffe #(.WIDTH(1)) S2_VALID (.clk(clk),.en(s2_ena),.d(s2_valid_nxt),.q(s2_valid));
std_dffe #(.WIDTH(1)) S2_ROB_INDEX (.clk(clk),.en(s2_ena),.d(s2_rob_index_nxt),.q(s2_rob_index));
std_dffr #(.WIDTH(32)) S2_ADDR_Q_Q (.clk(clk),.rstn(rstn),.d(s2_addr),.q(s2_addr_q));


//s2 resp


assign ld_data_cache = (s2_opcode == 0 && s2_type == 3'b000) ? {{56{data_out_save[s2_addr[2:0]*8+7]}},{data_out_save[s2_addr[2:0]*8+:8]}}:
                       (s2_opcode == 0 && s2_type == 3'b001) ? {{48{data_out_save[s2_addr[2:0]*8+15]}},{data_out_save[s2_addr[2:0]*8+:16]}}:
                       (s2_opcode == 0 && s2_type == 3'b010) ? {{32{data_out_save[s2_addr[2:0]*8+31]}},{data_out_save[s2_addr[2:0]*8+:32]}}:
                       (s2_opcode == 0 && s2_type == 3'b100) ? {56'b0,{data_out_save[s2_addr[2:0]*8+:8]}}:
                       (s2_opcode == 0 && s2_type == 3'b101) ? {48'b0,{data_out_save[s2_addr[2:0]*8+:16]}}:
                       (s2_opcode == 0 && s2_type == 3'b110) ? {32'b0,{data_out_save[s2_addr[2:0]*8+:32]}}:
                       (s2_opcode == 0 && s2_type == 3'b011) ? data_out_save:
                       64'b0;

assign ld_data_refill = (mshr_opcode == 0 && mshr_type == 3'b000) ? {{56{refill_data[mshr_addr[2:0]*8+7]}}, {refill_data[mshr_addr[2:0]*8+:8]}}:
                   (mshr_opcode == 0 && mshr_type == 3'b001) ? {{48{refill_data[mshr_addr[2:0]*8+15]}},{refill_data[mshr_addr[2:0]*8+:16]}}:
                   (mshr_opcode == 0 && mshr_type == 3'b010) ? {{32{refill_data[mshr_addr[2:0]*8+31]}},{refill_data[mshr_addr[2:0]*8+:32]}}:
                   (mshr_opcode == 0 && mshr_type == 3'b110) ? {32'b0,refill_data[mshr_addr[2:0]*8+:32]}:
                   (mshr_opcode == 0 && mshr_type == 3'b100) ? {56'b0,refill_data[mshr_addr[2:0]*8+:8]}:
                   (mshr_opcode == 0 && mshr_type == 3'b101) ? {48'b0,refill_data[mshr_addr[2:0]*8+:16]}:
                   (mshr_opcode == 0 && mshr_type == 3'b011) ? refill_data:
                   64'b0;

assign wb_dat = ~mshr_opcode ? refill_data :
                mshr_opcode ? st_dat :
                64'b0;

assign wb_tag = ~mshr_opcode ? {11'b0,mshr_addr[31:11]} :
                mshr_opcode ? {11'b10000000000,mshr_addr[31:11]} :
                32'b0;

assign st_dat_mask =(mshr_opcode == 1 && mshr_type == 3'b000) ?  64'h00000000000000FF << mshr_addr[2:0]*8 :
                    (mshr_opcode == 1 && mshr_type == 3'b001) ?  64'h000000000000FFFF << mshr_addr[2:0]*8 : 
                    (mshr_opcode == 1 && mshr_type == 3'b010) ?  64'h00000000FFFFFFFF << mshr_addr[2:0]*8 :
                    (mshr_opcode == 1 && mshr_type == 3'b011) ?  64'hFFFFFFFFFFFFFFFF:
                    64'b0;
assign wb_ack_i_mask = ~st_dat_mask & refill_data;

assign st_dat =     (mshr_opcode == 1 && mshr_type == 3'b000) ?  ((mshr_data & 64'hff )<< mshr_addr[2:0]*8) | wb_ack_i_mask :
                    (mshr_opcode == 1 && mshr_type == 3'b001) ?  ((mshr_data & 64'hffff) << mshr_addr[2:0]*8) | wb_ack_i_mask :
                    (mshr_opcode == 1 && mshr_type == 3'b010) ?  ((mshr_data & 64'hffffffff) << mshr_addr[2:0]*8) | wb_ack_i_mask :
                    (mshr_opcode == 1 && mshr_type == 3'b011) ?  (mshr_data << mshr_addr[2:0]*8) | wb_ack_i_mask :
                    64'b0;


assign st_hit_dat_mask =(s1_st_tag_is_hit &&  s1_type == 3'b000) ?  64'h00000000000000FF << s1_addr[2:0]*8 :
                    (s1_st_tag_is_hit && s1_type == 3'b001) ?  64'h000000000000FFFF << s1_addr[2:0]*8 : 
                    (s1_st_tag_is_hit && s1_type == 3'b010) ?  64'h00000000FFFFFFFF << s1_addr[2:0]*8 :
                    (s1_st_tag_is_hit && s1_type == 3'b011) ?  64'hFFFFFFFFFFFFFFFF:
                    st_hit_dat_mask_q;
assign st_hit_i_mask =  s1_st_tag_is_hit ? (~st_hit_dat_mask & data_out) : st_hit_i_mask_q ;

assign st_hit_dat = (s1_st_tag_is_hit && s1_type == 3'b000) ?  ((s1_data & 64'hff)<< s1_addr[2:0]*8) | st_hit_i_mask :
                    (s1_st_tag_is_hit && s1_type == 3'b001) ?  ((s1_data & 64'hffff) << s1_addr[2:0]*8) | st_hit_i_mask :
                    (s1_st_tag_is_hit && s1_type == 3'b010) ?  ((s1_data & 64'hffffffff) << s1_addr[2:0]*8) | st_hit_i_mask :
                    (s1_st_tag_is_hit && s1_type == 3'b011) ?  (s1_data << s1_addr[2:0]*8) | st_hit_i_mask :
                    st_hit_dat_q;

std_dffr #(.WIDTH(64))ST_HIT_DAT_MASK (.clk(clk),.rstn(rstn),.d(st_hit_dat_mask),.q(st_hit_dat_mask_q));
std_dffr #(.WIDTH(64))ST_HIT_I_MASK (.clk(clk),.rstn(rstn),.d(st_hit_i_mask),.q(st_hit_i_mask_q));
std_dffr #(.WIDTH(64))ST_HIT_DAT (.clk(clk),.rstn(rstn),.d(st_hit_dat),.q(st_hit_dat_q));
///resp ld

assign ld_data_o = refill_hsk ? ld_data_refill :
                   s2_valid ? ld_data_cache :
                   64'b0;

assign rob_index_o = refill_hsk ? mshr_rob_index :
                     s2_valid ? s2_rob_index :
                     1'b0;


endmodule
