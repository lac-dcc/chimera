// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none
`timescale 1ns / 100ps

   /*
    *
    */

module top();

    reg wb_clk = 0;

    always #7 wb_clk <= !wb_clk;

    reg wb_rst = 1;

    initial begin
        $dumpfile("serv.vcd");
        $dumpvars(0, top);

        @(posedge wb_clk);
        @(posedge wb_clk);

        wb_rst <= 0;

        # 5000
        $finish;
    end

    localparam REG_WIDTH = 8;

    reg [31:0] wb_dbus_dat = 32'hZ;
    reg [31:0] wb_dbus_adr = 32'hZ;
    reg wb_dbus_cyc = 0;
    reg wb_dbus_we = 0;
    wire ack;
    wire irq;
    wire [31:0] rdt;
    reg  [REG_WIDTH-1:0] irq_in = 8'h0;

    reg [31:0] rd_rdt = 0;

    task write (input [31:0] addr, input [31:0] data);

        begin
            wb_dbus_adr <= addr;
            wb_dbus_dat <= data;
            wb_dbus_we <= 1;
            wb_dbus_cyc <= 1;
            @(posedge wb_clk);
        end

    endtask

    task read (input [31:0] addr);

        begin
            wb_dbus_adr <= addr;
            wb_dbus_we <= 0;
            wb_dbus_cyc <= 1;
            rd_rdt <= 32'hZ;
            @(posedge wb_clk);
        end

    endtask

    // simulate the CPU
    always @(posedge wb_clk) begin
        if (ack) begin
            if (!wb_dbus_we) begin
                rd_rdt <= rdt;
            end
            wb_dbus_adr <= 32'hZ;
            wb_dbus_dat <= 32'hZ;
            wb_dbus_we <= 0;
            wb_dbus_cyc <= 0;
        end
    end

    // check that rdt is never set outside of cyc cycle
    always @(posedge wb_clk) begin
        if (!wb_dbus_cyc) begin
            tb_assert(rdt == 0);
        end
    end

    irq_reg #(.ADDR(8'h30), .ADDR_W(8), .REG_WIDTH(REG_WIDTH))
    irq_reg 
    (
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_cyc(wb_dbus_cyc),
        .ack(ack),
        .rdt(rdt),
        .irq_in(irq_in),
        .irq(irq)
    );

    localparam base = 32'h3000_0000;
    localparam REG_ENABLE = base;
    localparam REG_STATE  = base + 4;
    localparam REG_ACK    = base + 8;
    localparam REG_SIGNAL = base + 12;
    localparam REG_SET_EN = base + 16;
    localparam REG_CLR_EN = base + 20;

    initial begin
        wait(!wb_rst);
        @(posedge wb_clk);

        // set irq_enable reg
        write(REG_ENABLE, 32'h0000_000e);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        tb_assert(!irq);

        // read irq_enable reg
        read(REG_ENABLE);
        @(posedge wb_clk);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h000e);

        // read irq_state reg
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h0);

        // set an irq input line
        irq_in[1] <= 1;
        @(posedge wb_clk);

        // read irq_signal reg
        read(REG_SIGNAL);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h2);
        tb_assert(irq);

        // read irq_state reg
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h2);
        tb_assert(irq);

        // set an irq input line
        irq_in[3] <= 1;
        @(posedge wb_clk);

        // read irq_signal reg
        read(REG_SIGNAL);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'ha);
        tb_assert(irq);

        // read irq_state reg
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'ha);
        tb_assert(irq);

        // clr an irq line
        irq_in[3] <= 0;
        @(posedge wb_clk);

        // read irq_signal reg (line[3] now lo)
        read(REG_SIGNAL);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h2);
        tb_assert(irq);

        // read irq_state reg (line[3] still latched)
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'ha);
        tb_assert(irq);

        // ACK irq on line[3]
        write(REG_ACK, 32'h0000_0008);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        tb_assert(irq);

        // read irq_state reg (line[3] now cleared)
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h2);
        tb_assert(irq);

        // ACK irq on line[1] : irq should end
        write(REG_ACK, 32'h0000_0002);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        tb_assert(!irq);

        // read irq_signal reg (line[1] still hi)
        read(REG_SIGNAL);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h2);
        tb_assert(!irq);

        // read irq_state reg (both irqs now cleared)
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h0);
        tb_assert(!irq);

        // irq line[0] is not irq_enabled

        irq_in[0] <= 1;
        irq_in[1] <= 0;
        @(posedge wb_clk);
        tb_assert(!irq);

        // read irq_signal reg (line[0] still hi)
        read(REG_SIGNAL);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h1);
        tb_assert(!irq);

        // read irq_state reg (no irqs active)
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h0);
        tb_assert(!irq);

        // set the enable bit in the irq reg
        // this should not generate an interrupt on the active line[0]
        // as we only detect edges.

        // enable irqs in line[0]
        write(REG_SET_EN, 32'h0000_0001);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(!irq);

        // read irq_enable reg : check the bit was set
        read(REG_ENABLE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h000f);
        tb_assert(!irq);

        // clr the other enable bits
        write(REG_CLR_EN, 32'h0000_000e);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(!irq);

        // read irq_enable reg : should be just line[0] set
        read(REG_ENABLE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h0001);
        tb_assert(!irq);

        // remove the line[0] irq then re-assert
        irq_in[0] <= 0;
        @(posedge wb_clk);
        irq_in[0] <= 1;
        @(posedge wb_clk);
        @(posedge wb_clk);
        // should cause irq
        tb_assert(irq);

        // disabling the irq should clear it
        write(REG_CLR_EN, 32'h0000_0001);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(!irq);

        // However, it has not been ACKed, so will still appear active
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h1);
        tb_assert(!irq);

        // ACK irq on line[0]
        write(REG_ACK, 32'h0000_0001);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        tb_assert(!irq);

        // state should now be clear
        read(REG_STATE);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h0);
        tb_assert(!irq);

        // raise an irq line : not enabled yet
        irq_in[2] <= 1;
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(!irq);

        // enable the irq : should not raise an irq
        write(REG_SET_EN, 32'h0000_0004);
        wait(!wb_dbus_cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(!irq);

    end

endmodule
