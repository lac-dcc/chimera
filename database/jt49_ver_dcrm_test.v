`timescale 1ns / 1ps

module test;

reg clk, rst;

initial begin
    clk = 1'b0;
    forever clk = #12500 ~clk;
end

integer simcnt;

initial begin
    rst = 1'b1;
    #30000 rst=1'b0;
    $display("Reset over: simulation starts");
    for( simcnt=0; simcnt<1000; simcnt=simcnt+1)
        #1000_000;
    $finish;
end

wire signed [7:0] dout;

reg [15:0] cnt;
wire [7:0] din;

always @(posedge clk)
    if( rst ) begin
        cnt <= 0;
    end else begin
        cnt <= cnt + 1;
    end

assign din = cnt[10:5]  + cnt[3:0];
// assign din = cnt[7:0];

jt49_dcrm2 UUT(
    .clk  ( clk   ),
    .cen  ( 1'b1  ),
    .rst  ( rst   ),
    .din  ( din   ),
    .dout ( dout  )
);

`ifndef NCVERILOG
    initial begin
        $display("DUMP enabled");
        $dumpfile("test.lxt");
        $dumpvars;
        $dumpon;
    end
`else
    initial begin
        $display("NC Verilog: will dump all signals");
        $shm_open("test.shm");
        $shm_probe(UUT,"AS");
    end
`endif

endmodule