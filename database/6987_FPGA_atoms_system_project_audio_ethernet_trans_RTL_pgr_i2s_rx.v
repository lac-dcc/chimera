// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//******************************************************************

//******************************************************************
`timescale 1ns/1ns
module pgr_i2s_rx
#(
    parameter DATA_WIDTH = 8
)
(
    input                           sck,
    input                           rst_n,

    input                           ws,
    input                           sda,

    output  reg [DATA_WIDTH - 1:0]  data,
    output  reg                     l_vld,
    output  reg                     r_vld
);

reg [DATA_WIDTH - 1:0]  sr;

localparam CNT_WIDTH = LOG2(DATA_WIDTH);//对数，以2为底

reg [1:0]               ws_d;
wire                    ws_e;
reg [CNT_WIDTH:0]   cnt;

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        ws_d <= 2'b0;
    else
        ws_d <= {ws_d[0],ws};
end

assign ws_e = ^ ws_d;

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        cnt <= {DATA_WIDTH+1{1'b0}};
    else if(ws_e)
        cnt <= {DATA_WIDTH+1{1'b0}};
    else if(cnt >= DATA_WIDTH)
        cnt <= DATA_WIDTH;
    else
        cnt <= cnt + {{CNT_WIDTH{1'b0}},1'b1};
end

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        sr <= {DATA_WIDTH{1'b0}};
    else if(ws_e)
        sr <= {{DATA_WIDTH-1{1'b0}},sda};
    else if(cnt < DATA_WIDTH)
        sr <= {sr[DATA_WIDTH-2:0],sda};
end

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        data <= {DATA_WIDTH{1'b0}};
    else if(ws_e)
        data <= sr;
end

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        r_vld <= 1'b0;
    else if(ws_e && ws_d[1])
        r_vld <= 1'b1;
    else
        r_vld <= 1'b0;
end

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        l_vld <= 1'b0;
    else if(ws_e && ~ws_d[1])
        l_vld <= 1'b1;
    else
        l_vld <= 1'b0;
end

function integer LOG2;
    input integer dep;
    begin
        LOG2 = 0;
        while (dep > 1)
        begin
            dep  = dep >> 1;
            LOG2 = LOG2 + 1;
        end
    end
endfunction

endmodule //pgr_i2s_rx
