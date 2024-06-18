// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

`timescale 1ns/1ps
module test_fifo_test(

   );

parameter WR_PERIOD = 10;
parameter RD_PERIOD = 12;

reg wr_clk;
reg rst;
reg rd_clk;

always #(WR_PERIOD/2) wr_clk = ~wr_clk;
always #(RD_PERIOD/2) rd_clk = ~rd_clk;

fifo_test test_fifo_t(
    .wr_clk        (wr_clk),
    .rst            (rst),
    .rd_clk          (rd_clk)
);

initial begin
    wr_clk <= 1'b0;
    rd_clk <= 1'b0;
    rst <= 1'b0;
    #500;
    rst <= 1'b1;
    #40000;
    $stop;
end

GTP_GRS GRS_INST(
.GRS_N (grs_n)
);

endmodule