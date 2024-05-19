// This program was cloned from: https://github.com/ZiyangYE/General-Slow-DDR3-Interface
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps

module tb;

reg clk;
wire inv_clk = ~clk;
reg resetn;

//ddr interface
wire [13:0] addr;
wire [2:0] bank;
wire cs;
wire cas;
wire ras;
wire we;
wire clk_p;
wire clk_n;
wire cke;
wire odt;
wire rst_n;
wire [1:0] dm;
wire [15:0] dq;
wire [1:0] dqs_p;
wire [1:0] dqs_n;

//user interface
wire rd_valid;
reg rd_rdy;
wire [15:0] rd_payload;
wire wr_rdy;
reg wr_valid;
wire [15:0] wr_payload;
wire [26:0] address;
wire init_fin;

//counter
reg [15:0] rdwr_cnt;

assign address = {11'd0,rdwr_cnt};
assign wr_payload = rdwr_cnt;

initial begin
    clk=0;
    resetn=0;

    //init user interface
    rd_rdy=0;
    wr_valid=0;
    rdwr_cnt=0;

    #10
    resetn=1;

    //wait unitl init finish
    @(init_fin)
    wr_valid=1;

    //write 32768*16bits
    @(rdwr_cnt==32768)
    wr_valid=0;
    rdwr_cnt=0;

    rd_rdy=1;

    //read 32768*16bits
    @(rdwr_cnt==32768)
    rd_rdy=0;

    $display("\n\n----------Test Passed----------\n");

    $finish();
end


always@(posedge clk)begin
    if(wr_rdy || rd_valid)
        rdwr_cnt<=rdwr_cnt+1;

    if(rd_valid && rdwr_cnt!=rd_payload)begin
        $display("\n----------Read Data Error----------");
        $display("The read payload is %d, it shoube be %d\n",rd_payload,rdwr_cnt);
        $finish();
    end
end

always begin
    #5 clk=~clk; //5ns period, sys clk is 100MHz
end

ddr3 ddr_module(
    .rst_n(rst_n),
    .ck(clk_p),
    .ck_n(clk_n),
    .cke(cke),
    .cs_n(cs),
    .ras_n(ras),
    .cas_n(cas),
    .we_n(we),

    .dm_tdqs(dm),
    .ba(bank),
    .addr(addr),
    .dq(dq),
    .dqs(dqs_p),
    .dqs_n(dqs_n),
    .odt(odt)
);


slowDDR3 ddr_interface(
    .inv_clk(inv_clk),

    .phyIO_address(addr),
    .phyIO_bank(bank),
    .phyIO_cs(cs),
    .phyIO_cas(cas),
    .phyIO_ras(ras),
    .phyIO_we(we),
    .phyIO_clk_p(clk_p),
    .phyIO_clk_n(clk_n),
    .phyIO_cke(cke),
    .phyIO_odt(odt),
    .phyIO_rst_n(rst_n),
    .phyIO_dm(dm),
    .phyIO_dq(dq),
    .phyIO_dqs_p(dqs_p),
    .phyIO_dqs_n(dqs_n),


    .sysIO_dataRd_valid(rd_valid),
    .sysIO_dataRd_ready(rd_rdy),
    .sysIO_dataRd_payload(rd_payload),
    .sysIO_dataWr_ready(wr_rdy),
    .sysIO_dataWr_valid(wr_valid),
    .sysIO_dataWr_payload(wr_payload),
    .sysIO_address(address),
    .sysIO_initFin(init_fin),

    .clk(clk),
    .resetn(resetn)
);


endmodule
