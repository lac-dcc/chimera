// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none
`timescale 1ns / 100ps

   /*
    *
    */

module top();

    reg ck = 0;

    always #50 ck <= !ck;

    initial begin
        $dumpfile("serv.vcd");
        $dumpvars(0, top);
    end

    reg rst_req = 0;
    wire rst;
    reset #(.LENGTH(5)) reset(.ck(ck), .rst_req(rst_req), .rst(rst));

    wire cs;
    wire sck;
    wire mosi;
    reg miso = 0;
    wire [31:0] rdata;
    wire ready;

    reg [7:0] code = 8'h03;
    reg [23:0] addr = 24'hZ;
    reg  tx_addr = 1;
    reg  no_read = 0;
    reg  req = 0;

    spi_tx spi_tx(
        .ck(ck),
        .rst(rst),
        .cs(cs),
        .sck(sck),
        .mosi(mosi),
        .miso(miso),
        .code(code),
        .addr(addr),
        .tx_addr(tx_addr),
        .no_read(no_read),
        .req(req),
        .rdata(rdata),
        .ready(ready)
    );

    task read(input [23:0] rd_addr);

        begin
            addr <= rd_addr;
            req <= 1;
            @(posedge ck);
            req <= 0;
            @(posedge ck);
        end

    endtask

    realtime t1, t2;
    integer i, t3;

    initial begin
        wait(!rst);
        @(posedge ck);

        // normal read "03 aa aa aa dd dd dd dd" cycle
        miso <= 0;
        tx_addr <= 1;
        no_read <= 0;
        t1 = $realtime;
        read(24'h123456);

        wait(ready);
        t2 = $realtime;
        @(posedge ck);
        tb_assert(rdata == 32'h00000000);
        tb_assert(cs);
        tb_assert(!sck);
        tb_assert(mosi);

        // check the cycle takes (64-bit * 2) + 1
        t3 = t2 - t1;
        tb_assert(t3 == ((1 + (64 * 2)) * 100));

        // short write "03"
        miso <= 1;
        tx_addr <= 0;
        no_read <= 1;
        t1 = $realtime;
        read(24'h123456);

        wait(ready);
        t2 = $realtime;
        @(posedge ck);
        //tb_assert(rdata == 32'hffffffff);
        tb_assert(cs);
        tb_assert(!sck);
        tb_assert(mosi);

        t3 = t2 - t1;
        tb_assert(t3 == ((1 + (8 * 2)) * 100));

        // short write, normal read "03 dd dd dd dd"
        miso <= 0;
        tx_addr <= 0;
        no_read <= 0;
        t1 = $realtime;
        read(24'h123456);

        wait(ready);
        t2 = $realtime;
        @(posedge ck);
        tb_assert(rdata == 32'h00000000);
        tb_assert(cs);
        tb_assert(!sck);
        tb_assert(mosi);

        t3 = t2 - t1;
        tb_assert(t3 == ((1 + (40 * 2)) * 100));

        // normal read "03 aa aa aa dd dd dd dd" cycle
        // interrupted by reset
        miso <= 1;
        tx_addr <= 1;
        no_read <= 0;
        t1 = $realtime;
        read(24'haaaaaa);

        for (i = 0; i < 50; i = i + 1) begin
            @(posedge ck);        
        end

        // reset request
        rst_req <= 1;
        @(posedge ck);        
        rst_req <= 0;

        wait(ready);
        t2 = $realtime;
        @(posedge ck);
        //tb_assert(rdata == 32'hffffffff);
        tb_assert(cs);
        tb_assert(!sck);
        tb_assert(mosi);

        // check the cycle takes less than (64-bit * 2) + 1
        t3 = t2 - t1;
        tb_assert(t3 < ((1 + (64 * 2)) * 100));

        // wait for end of reset
        wait(!rst);
        @(posedge ck);

        // short write "03"
        miso <= 1;
        tx_addr <= 0;
        no_read <= 1;
        t1 = $realtime;
        read(24'h123456);

        wait(ready);
        t2 = $realtime;
        @(posedge ck);
        tb_assert(cs);
        tb_assert(!sck);
        tb_assert(mosi);

        t3 = t2 - t1;
        tb_assert(t3 == ((1 + (8 * 2)) * 100));

        @(posedge ck);
        @(posedge ck);
        $finish;
    end

endmodule

