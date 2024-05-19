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

        # 50000;
        $finish;
    end

    // cpu bus
    reg  [31:0] wb_dbus_adr = 32'hZ;
    reg  [31:0] wb_dbus_dat = 32'hZ;
    reg  [3:0] wb_dbus_sel = 4'h0;
    reg  wb_dbus_we = 1'b0;
    reg  wb_dbus_cyc = 1'b0;
    wire [31:0] rdt;
    wire ack;
    wire baud_en;
    wire tx;
    wire busy;

    assign baud_en = 1;

    uart #(.ADDR(8'h40), .AWIDTH(8))
    uart (
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_sel(wb_dbus_sel),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_cyc(wb_dbus_cyc),
        .rdt(rdt),
        .ack(ack),
        .baud_en(baud_en),
        .tx(tx),
        .busy(busy)
    );

    always @(posedge wb_clk) begin
        if (ack) begin
            wb_dbus_adr <= 32'hZ;
            wb_dbus_dat <= 32'hZ;
            wb_dbus_sel <= 4'h0;
            wb_dbus_we <= 0;
            wb_dbus_cyc <= 0;
        end
    end

    task write(input [31:0] addr, input [31:0] data);

        begin
            wb_dbus_adr <= addr;
            wb_dbus_dat <= data;
            wb_dbus_sel <= 4'h1;
            wb_dbus_we <= 1;
            wb_dbus_cyc <= 1;
        end

    endtask

    always @(posedge wb_clk) begin
        if (!wb_dbus_cyc) begin
            tb_assert(rdt == 0);
        end
    end

    integer i;

    initial begin
        wait(!wb_rst);
        @(posedge wb_clk);

        tb_assert(!busy);

        write(32'h4000_0000, 32'h40);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(wb_dbus_cyc == 0);
        tb_assert(busy);
        @(posedge wb_clk);
        @(posedge wb_clk);

        write(32'h4000_0000, 32'haa);
        @(posedge wb_clk);
        tb_assert(busy);
        @(posedge wb_clk);

        wait(!wb_dbus_cyc);
        tb_assert(busy);

        // 10 cycles to shift out the tx data
        // 1 cycle to indicate not busy
        for (i = 0; i < 11; i = i + 1) begin
            tb_assert(busy);
            @(posedge wb_clk);
        end

        tb_assert(!busy);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);

        write(32'h4000_0000, 32'hfe);
        @(posedge wb_clk);
        wait(!wb_dbus_cyc);
        tb_assert(busy);
        write(32'h4000_0000, 32'h01);
        @(posedge wb_clk);
        wait(!wb_dbus_cyc);
        tb_assert(busy);
    end

endmodule
