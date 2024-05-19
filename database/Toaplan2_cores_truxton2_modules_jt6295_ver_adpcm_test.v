// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module test;

reg  rst;
wire irq;
reg  clk, cen=1'b0;
reg [3:0] din=0, en=4'd1;
wire signed [11:0] sound;

wire [3:0] data0 = en[0] ? din : 4'd0;

always @(posedge clk) en <= {en[2:0], en[3]};

jt6295_adpcm uut(
    .rst        ( rst       ),
    .clk        ( clk       ),
    .cen        ( 1'b1      ),
    .en         ( en[0] & ~rst ),
    .att        ( 4'd0      ),
    .data       ( data0     ),
    .sound      ( sound     )
);


reg [7:0] data[0:1024*32-1];
reg [3:0] sine_data[0:19];

integer f,fcnt;

initial begin
    sine_data[0] = 0;
    sine_data[1] = 0;
    sine_data[2] = 0;
    sine_data[3] = 3;
    sine_data[4] = 3;
    sine_data[5] = 3;
    sine_data[6] = 7;
    sine_data[7] = 4'hf;
    sine_data[8] = 4'h7;
    sine_data[9] = 4'hf;
    sine_data[10] = 4'h4;
    sine_data[11] = 4'hc;
    sine_data[12] = 4'h4;
    sine_data[13] = 4'hc;
    sine_data[14] = 4'h4; // repeat from here
    sine_data[15] = 4'h0;
    sine_data[16] = 4'h9;
    sine_data[17] = 4'hc;
    sine_data[18] = 4'h8;
    sine_data[19] = 4'h1;
end

initial begin
    clk=1'b0;
    forever #325.521 clk=~clk;
`ifndef SINESIM
    f=$fopen("adpcm_din.bin","rb");
    fcnt=$fread(data,f);
    $fclose(f);
`endif
end

initial begin
    rst = 1'b0;
    #150 rst=1'b1;
    #750 rst=1'b0;
end

integer cnt=0;

always @(posedge clk) if(cen) begin
`ifdef SINESIM
    din <= sine_data[cnt];
    cnt <= cnt<19 ? cnt+1 : 14;
    if( $time>10_000_000) $finish;
`else
    din <= data[cnt];
    cnt <= cnt+1;
    if( cnt==fcnt/2 ) $finish;
`endif
end

integer cen_cnt=0;

always @(posedge clk) begin
    cen <= 1'b0;
    if(cen_cnt==0) cen<=1'b1;
    cen_cnt <= cen_cnt==0 ? 3 : (cen_cnt-1);
end

`ifndef NCVERILOG
    initial begin
        $dumpfile("test.lxt");
        $dumpvars(0,test);
        $dumpon;
    end
`else
    initial begin
        $shm_open("test.shm");
        $shm_probe(test,"AS");
    end
`endif

endmodule