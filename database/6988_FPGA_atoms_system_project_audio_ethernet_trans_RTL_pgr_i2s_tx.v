// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//******************************************************************

//******************************************************************
`timescale 1ns/1ns
module pgr_i2s_tx
#(
    parameter DATA_WIDTH = 8
)
(
    input                       sck,
    input                       rst_n,

    input                       ws,
    output                      sda,
    input   [DATA_WIDTH - 1:0]  ldata,
    output                      l_req,
    input   [DATA_WIDTH - 1:0]  rdata,
    output                      r_req
);

reg     [DATA_WIDTH - 1:0]  sr;
wire    [DATA_WIDTH - 1:0]  data;

assign sda = sr[DATA_WIDTH - 1]; //送sr最高位

reg [1:0]   ws_d;
wire        ws_e;

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
    begin
        ws_d <= 2'b0;
    end
    else
    begin
        ws_d <= {ws_d[0],ws};
    end
end

assign ws_e = ^ws_d;

assign data = ws_d[0] ? rdata : ldata; //在ws时序下把对应的左右通道对应的数据送出去

always @(negedge sck or negedge rst_n)
begin
    if(~rst_n)
        sr <= {DATA_WIDTH{1'b0}};
    else if(ws_e)
        sr <= data;
    else
        sr <= {sr[DATA_WIDTH - 2:0],1'b0}; //sr左移
end

assign r_req = ws_e & ws_d[0];
assign l_req = ws_e & ~ws_d[0];

endmodule //pgr_i2s_tx
