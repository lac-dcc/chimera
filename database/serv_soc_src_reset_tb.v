// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none
`timescale 1ns / 100ps

   /*
    *
    */

module top();

    reg ck = 0;

    always #7 ck <= !ck;

    initial begin
        $dumpfile("serv.vcd");
        $dumpvars(0, top);

        # 5000 ;
        $finish;
    end

    reg rst_req_1 = 0;
    wire rst_1;
    reset #(.LENGTH(1)) reset_1(.ck(ck), .rst_req(rst_req_1), .rst(rst_1));

    reg rst_req_4 = 0;
    wire rst_4;
    reset #(.LENGTH(4)) reset_4(.ck(ck), .rst_req(rst_req_4), .rst(rst_4));

    reg rst_req_17 = 0;
    wire rst_17;
    reset #(.LENGTH(17)) reset_17(.ck(ck), .rst_req(rst_req_17), .rst(rst_17));

    integer i1;
    integer i4;
    integer i17;

    initial begin

        for (i1 = 0; i1 <= 1; i1 = i1 + 1) begin
            tb_assert(rst_1);
            @(posedge ck);
        end

        tb_assert(!rst_1);

    end

    initial begin

        for (i4 = 0; i4 <= 4; i4 = i4 + 1) begin
            tb_assert(rst_4);
            @(posedge ck);
        end

        tb_assert(!rst_4);

    end

    initial begin

        for (i17 = 0; i17 <= 17; i17 = i17 + 1) begin
            tb_assert(rst_17);
            @(posedge ck);
        end

        tb_assert(!rst_17);

        rst_req_17 <= 1;
        @(posedge ck);

        // req should hold the reset on
        for (i17 = 0; i17 <= 25; i17 = i17 + 1) begin
            @(posedge ck);
            tb_assert(rst_17);
        end

        // release the request, wait for reset to end ..
        rst_req_17 <= 0;
        for (i17 = 0; i17 < 17; i17 = i17 + 1) begin
            @(posedge ck);
            tb_assert(rst_17);
        end

        @(posedge ck);
        tb_assert(!rst_17);
    end

endmodule

