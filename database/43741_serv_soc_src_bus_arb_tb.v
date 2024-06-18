// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none
`timescale 1ns / 100ps

   /*
    *
    */

module top ();

    reg wb_clk = 0;

    always #7 wb_clk <= !wb_clk;

    reg wb_rst = 1;

    initial begin
        $dumpfile("serv.vcd");
        $dumpvars(0, top);

        @(posedge wb_clk);
        @(posedge wb_clk);

        wb_rst <= 0;
    end

    //  iBus arbitration

    reg  wb_ibus_cyc = 0;
    reg  [31:0] wb_ibus_adr = 0;
    wire wb_ibus_ack;
    wire [31:0] wb_ibus_rdt;

    reg  f_cyc = 0;
    reg  [31:0] f_adr = 0;
    wire f_ack;
    wire [31:0] f_rdt;

    wire s_cyc;
    wire  [31:0] s_adr;
    reg  s_ack = 0;
    reg  [31:0] s_rdt = 0;

    wire busy;

    bus_arb ibus_arb(
        .wb_clk(wb_clk),
        // CPU is the priority channel
        .a_cyc(wb_ibus_cyc),
        .a_adr(wb_ibus_adr),
        .a_ack(wb_ibus_ack),
        .a_rdt(wb_ibus_rdt),
        // Flash_read at a lower priority
        .b_cyc(f_cyc),
        .b_adr(f_adr),
        .b_ack(f_ack),
        .b_rdt(f_rdt),
        // Connect to the ibus SPI controller
        .x_cyc(s_cyc),
        .x_adr(s_adr),
        .x_ack(s_ack),
        .x_rdt(s_rdt),
        .busy(busy)
    );

    // TODO : simulate slow device
    always @(posedge wb_clk) begin
        if (s_cyc) begin
            s_ack <= 1;
            s_rdt <= s_adr;
        end
        if (s_ack) begin
            s_ack <= 0;
            s_rdt <= 0;
        end
    end    

    reg [31:0] ibus_data = 32'hZ;
    reg ibus_ready = 0;
    reg [31:0] fbus_data = 32'hZ;
    reg fbus_ready = 0;

    // Latch data.
    // Clear *_cyc on *_ack

    always @(posedge wb_clk) begin

        if (f_ack) begin
            f_cyc <= 0;
            f_adr <= 32'hZ;
            // latch the data
            fbus_data <= f_rdt;
            fbus_ready <= 1;
        end

        if (wb_ibus_ack) begin
            wb_ibus_cyc <= 0;
            wb_ibus_adr <= 32'hZ;
            // latch the data
            ibus_data <= wb_ibus_rdt;
            ibus_ready <= 1;
        end

    end

    task ifetch(input [31:0] addr);

        begin
            // Request ibus fetch
            wb_ibus_cyc <= 1;
            wb_ibus_adr <= addr;
            ibus_data <= 32'hZ;
            ibus_ready <= 0;
        end

    endtask

    task ffetch(input [31:0] addr);

        begin
            // Request fbus fetch
            f_cyc <= 1;
            f_adr <= addr;
            fbus_data <= 32'hZ;
            fbus_ready <= 0;
        end

    endtask

    task die;

        begin
            @(posedge wb_clk);
            @(posedge wb_clk);
            @(posedge wb_clk);
            @(posedge wb_clk);
            @(posedge wb_clk);
            @(posedge wb_clk);
            @(posedge wb_clk);
            @(posedge wb_clk);
            @(posedge wb_clk);
            $finish;
        end

    endtask

    initial begin
        wait(!wb_rst);
        @(posedge wb_clk);

        // fetch in ibus
        ifetch(32'h100000);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'h100000);

        wait(!busy);

        // fetch on fbus
        ffetch(32'h123456);
        wait(fbus_ready);
        tb_assert(fbus_data == 32'h123456);

        wait(!busy);
 
        // fetch both simultaneous : A should go first
        ifetch(32'hfaceface);
        ffetch(32'hcafecafe);
        @(posedge wb_clk);

        wait(ibus_ready);
        tb_assert(ibus_data == 32'hfaceface);
        wait(fbus_ready);
        //tb_assert(fbus_data == 32'hcafecafe);
        @(posedge wb_clk);

        wait(!busy);

        // start A, then make B req while busy
        ifetch(32'h34343434);
        @(posedge wb_clk);
        ffetch(32'h34563456);
        @(posedge wb_clk);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'h34343434);
        wait(fbus_ready);
        tb_assert(fbus_data == 32'h34563456);
        @(posedge wb_clk);

        wait(!busy);

        // start B, then make A req while busy
        ffetch(32'hcafecafe);
        @(posedge wb_clk);
        ifetch(32'hfaceface);
        @(posedge wb_clk);
        wait(fbus_ready);
        tb_assert(fbus_data == 32'hcafecafe);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'hfaceface);
        @(posedge wb_clk);

        wait(!busy);

        // Try different staggering of start A .. B

        // A ck ck ck B
        ifetch(32'haaaaaaa1);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        ffetch(32'hbbbbbbb1);
        @(posedge wb_clk);

        wait(fbus_ready);
        tb_assert(fbus_data == 32'hbbbbbbb1);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'haaaaaaa1);
        @(posedge wb_clk);

        wait(!busy);

        // A ck ck B
        ifetch(32'haaaaaaa2);
        @(posedge wb_clk);
        @(posedge wb_clk);
        ffetch(32'hbbbbbbb2);
        @(posedge wb_clk);

        wait(fbus_ready);
        tb_assert(fbus_data == 32'hbbbbbbb2);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'haaaaaaa2);
        @(posedge wb_clk);

        wait(!busy);

        // A ck B
        ifetch(32'haaaaaaa3);
        @(posedge wb_clk);
        ffetch(32'hbbbbbbb3);
        @(posedge wb_clk);

        wait(fbus_ready);
        tb_assert(fbus_data == 32'hbbbbbbb3);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'haaaaaaa3);
        @(posedge wb_clk);

        wait(!busy);

        // A & B
        ifetch(32'haaaaaaa4);
        ffetch(32'hbbbbbbb4);
        @(posedge wb_clk);

        wait(fbus_ready);
        tb_assert(fbus_data == 32'hbbbbbbb4);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'haaaaaaa4);
        @(posedge wb_clk);

        wait(!busy);

        // B ck A
        ffetch(32'hbbbbbbb5);
        @(posedge wb_clk);
        ifetch(32'haaaaaaa5);
        @(posedge wb_clk);

        wait(fbus_ready);
        tb_assert(fbus_data == 32'hbbbbbbb5);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'haaaaaaa5);
        @(posedge wb_clk);

        wait(!busy);

        // B ck ck A
        ffetch(32'hbbbbbbb6);
        @(posedge wb_clk);
        @(posedge wb_clk);
        ifetch(32'haaaaaaa6);
        @(posedge wb_clk);

        wait(fbus_ready);
        tb_assert(fbus_data == 32'hbbbbbbb6);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'haaaaaaa6);
        @(posedge wb_clk);

        wait(!busy);

        // B ck ck ck A
        ffetch(32'hbbbbbbb7);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        ifetch(32'haaaaaaa7);
        @(posedge wb_clk);

        wait(fbus_ready);
        tb_assert(fbus_data == 32'hbbbbbbb7);
        wait(ibus_ready);
        tb_assert(ibus_data == 32'haaaaaaa7);
        @(posedge wb_clk);

        wait(!busy);

        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        $finish;
    end

endmodule

