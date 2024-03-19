`timescale 1ns/1ps

module lookup(
clk,
reset, 

localbus_cs_n,
localbus_rd_wr,
localbus_data,
localbus_ale,
localbus_ack_n,
localbus_data_out,

metadata_valid,
metadata,


countid_valid,
countid


);
input           clk;
input           reset;

input           localbus_cs_n;
input           localbus_rd_wr;
input [31:0]    localbus_data;
input           localbus_ale;
output  wire    localbus_ack_n;
output  wire  [31:0]  localbus_data_out;

input           metadata_valid;
input [287:0]   metadata;// 32*9

output  wire    countid_valid;
output  wire  [5:0]   countid;// rule num_max = 64;

//-------temp------//
wire            localbus_ale_temp[0:3];
wire            localbus_ack_n_temp[0:3];
wire  [31:0]    localbus_data_out_temp[0:3];
wire            bv_out_valid[0:3];
wire  [35:0]    bv_out[0:3];
wire            bv_and_valid;
wire  [63:0]    bv_and;

assign  localbus_ale_temp[0] = (localbus_data[18:16] == 3'd0)? localbus_ale:1'b0;
assign  localbus_ale_temp[1] = (localbus_data[18:16] == 3'd1)? localbus_ale:1'b0;
assign  localbus_ale_temp[2] = (localbus_data[18:16] == 3'd2)? localbus_ale:1'b0;
assign  localbus_ale_temp[3] = (localbus_data[18:16] == 3'd3)? localbus_ale:1'b0;

assign  localbus_ack_n  = (localbus_ack_n_temp[0] == 1'b0)? 1'b0:
                          (localbus_ack_n_temp[1] == 1'b0)? 1'b0:
                          (localbus_ack_n_temp[2] == 1'b0)? 1'b0:
                          (localbus_ack_n_temp[3] == 1'b0)? 1'b0:
                          1'b1;
                          
assign  localbus_data_out = (localbus_ack_n_temp[0] == 1'b0)? localbus_data_out_temp[0]:
                            (localbus_ack_n_temp[1] == 1'b0)? localbus_data_out_temp[1]:
                            (localbus_ack_n_temp[2] == 1'b0)? localbus_data_out_temp[2]:
                            (localbus_ack_n_temp[3] == 1'b0)? localbus_data_out_temp[3]:
                            32'b0;
                                                      
generate
    genvar i;
    for(i=0; i<4; i=i+1) begin : search_engine
      search_engine se(
      .clk(clk),
      .reset(reset),
      .key_in_valid(metadata_valid),
      .key_in(metadata[((i+1)*72-1):i*72]),
      .bv_out_valid(bv_out_valid[i]),
      .bv_out(bv_out[i]),
      .localbus_cs_n(localbus_cs_n),
      .localbus_rd_wr(localbus_rd_wr),
      .localbus_data(localbus_data),
		  .localbus_ale(localbus_ale_temp[i]),
		  .localbus_ack_n(localbus_ack_n_temp[i]),
		  .localbus_data_out(localbus_data_out_temp[i])
      );
    end
endgenerate

bv_and_4 bv_and_4(
.clk(clk),
.reset(reset),
.bv_in_valid(bv_out_valid[0]),
.bv_1(bv_out[0]),
.bv_2(bv_out[1]),
.bv_3(bv_out[2]),
.bv_4(bv_out[3]),
.bv_out_valid(bv_and_valid),
.bv_out(bv_and)
);

calculate_countid calculate_countid(
.clk(clk),
.reset(reset),
.bv_in_valid(bv_and_valid),
.bv_in(bv_and),
.countid_valid(countid_valid),
.countid(countid)
);


endmodule