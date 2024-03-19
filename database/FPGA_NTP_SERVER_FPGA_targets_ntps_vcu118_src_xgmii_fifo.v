`default_nettype none

module xgmii_fifo (
    input  wire        wr_rst,    // synchronous to write clock
    input  wire        wr_clk,
    input  wire [63:0] wr_data,
    input  wire [ 7:0] wr_ctrl,

    input  wire        rd_clk,
    output wire [63:0] rd_data,
    output wire [ 7:0] rd_ctrl
);

wire [63:0] rd_data_int;
wire [ 7:0] rd_ctrl_int;

wire empty;
wire prog_empty;
wire wr_en;
reg rd_en = 0;
reg rd_en2 = 0;

assign wr_en = (wr_data != 64'h0707070707070707 || wr_ctrl != 8'hff);

  wire wr_rst_busy;
  wire rd_rst_busy;

assign rd_data = rd_en && rd_en2 ? rd_data_int : 64'h0707070707070707;
assign rd_ctrl = rd_en && rd_en2 ? rd_ctrl_int :  8'hff;

always @(posedge rd_clk) begin

  if (!prog_empty)
    rd_en <= 1;
  else if (empty)
    rd_en <= 0;
  rd_en2 <= rd_en;
end

xgmii_fifo_int xgmii_fifo_int_i (
    .srst(wr_rst),
    .wr_clk(wr_clk),
    .wr_en(wr_en),
    .din({wr_data,wr_ctrl}),
    .full(),

    .rd_clk(rd_clk),
    .rd_en(rd_en),
    .dout({rd_data_int,rd_ctrl_int}),
    .empty(empty),
    .prog_empty(prog_empty),
    
    .wr_rst_busy(wr_rst_busy),
    .rd_rst_busy(rd_rst_busy)
  );

endmodule
