// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

`timescale 1ns/1ps
module tb_voice_trans_cache(

);

parameter CLK_PERIOD = 1024;
reg         clk;
reg         sck;
reg         rst;
reg [15:0]  ldata_in;

wire        voice_href ;
wire        voice_vsync;
wire [7:0]  ldata_out     ;   

voice_trans_cache t_voice_trans_cache(
    .dlrc           (clk),
    .sck            (sck),
    .rst            (rst),

    .ldata_in       (ldata_in),
    .voice_href     (voice_href ),
    .voice_vsync    (voice_vsync),
    .ldata_out      (ldata_out  )
);

always #(CLK_PERIOD / 2) clk = ~clk;
always #(CLK_PERIOD / 32) sck = ~sck;

integer i;
initial begin
    clk <= 1'b0;
    sck <= 1'b0;
    rst <= 1'b0;
    #550;
    rst <= 1'b1;
    ldata_in <= 16'd40;

    for(i=0;i<10_000 * 50;i=i+1) begin
        @(posedge clk);
        ldata_in <= ldata_in + 1'b1;
    end

    #100;
    $stop;
end

GTP_GRS GRS_INST(
.GRS_N (grs_n)
);

endmodule