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

    reg [31:0] wb_dbus_dat = 32'hZ;
    reg [31:0] wb_dbus_adr = 32'hZ;
    reg wb_dbus_cyc = 0;
    reg wb_dbus_we = 0;
    wire ack;
    wire cyc;
    wire irq;
    wire [31:0] rdt;

    chip_select #(.ADDR(8'hc0), .WIDTH(8))
    cs_timer (
        .wb_ck(wb_clk),
        .addr(wb_dbus_adr[31:24]),
        .wb_cyc(wb_dbus_cyc),
        .wb_rst(wb_rst),
        .ack(ack),
        .cyc(cyc)
    );

    // force initial mtime setting to test for 32-bit rollover
    localparam start = 64'h12345678fffffff0;
  
    timer #(.INITIAL(start)) timer (
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .ck_en(1'b1),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_we(wb_dbus_we),
        .cyc(cyc),
        .irq(irq),
        .rdt(rdt)
    );

    task write (input [31:0] addr, input [31:0] data);

        begin
            wb_dbus_adr <= addr;
            wb_dbus_dat <= data;
            wb_dbus_we <= 1;
            wb_dbus_cyc <= 1;
            @(posedge wb_clk);
        end

    endtask

    reg [31:0] rd_rdt = 0;

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
        if (!cyc) begin
            tb_assert(rdt == 0);
        end
    end

    // clock should track mtime
    reg [63:0] clock = start;
    reg [63:0] now = 0;

    always @(posedge wb_clk) begin
        if (wb_rst) begin
            clock <= start;
            now <= 0;
        end else begin
            clock <= clock + 1;
        end

        // latch the time an irq occurred
        if (irq & (now == 0)) begin
            now <= clock;
        end
    end

    integer i;

    initial begin
        wait(!wb_rst);
        @(posedge wb_clk);

        // write mtimecmp
        write(32'hc0000008, 32'h12341234);
        wait(!cyc);
        @(posedge wb_clk);
        write(32'hc000000c, 32'habcdabcd);
        wait(!cyc);
        @(posedge wb_clk);

        // read mtimecmp
        read(32'hc0000008);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h12341234);

        read(32'hc000000c);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'habcdabcd);

        // check roll-over of mtime reads
        now <= clock + 1;
        @(posedge wb_clk);
        // assert we are just about to roll over
        tb_assert(now == 64'h12345678fffffffd);

        read(32'hc0000000);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == now[31:0]);

        // pause before reading the hi word
        for (i = 0; i < 20; i = i + 1) begin
            @(posedge wb_clk);        
        end

        // the hi word should have been frozen at the lo read
        read(32'hc0000004);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == now[63:32]);

        // check we have rolled over
        now <= clock + 1;
        read(32'hc0000000);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == now[31:0]);

        read(32'hc0000004);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h12345679);

        //  Check reset
        wb_rst <= 1;
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        wb_rst <= 0;

        // check mtime was reset
        read(32'hc0000000);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'hfffffff0);

        read(32'hc0000004);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h12345678);

        // check mtimecmp was reset
        read(32'hc0000008);
        wait(!cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 0);

        read(32'hc000000c);
        wait(!cyc);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 0);

        // Test interrupt on timer compare

        //  reset
        wb_rst <= 1;
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        wb_rst <= 0;

        // set mtimecmp to interrupt on rollover
        write(32'hc0000008, 32'h0);
        wait(!cyc);
        @(posedge wb_clk);

        write(32'hc000000c, 32'h12345679);
        wait(!cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);

        tb_assert(!irq);
        wait(irq);

        // read mtime
        read(32'hc0000000);
        wait(!cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt[31:8] == 24'h0);

        read(32'hc0000004);
        wait(!cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h12345679);

        tb_assert(irq);

        //  Clear the irq by writing a higher mtimecmp value
        write(32'hc0000008, 32'hffff0000);
        wait(!cyc);
        @(posedge wb_clk);

        write(32'hc000000c, 32'h12345679);
        wait(!cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(!irq);

        @(posedge wb_clk);
        @(posedge wb_clk);

        // Check for read/write interleaved
        
        wb_rst <= 1;
        @(posedge wb_clk);
        @(posedge wb_clk);
        wb_rst <= 0;

        @(posedge wb_clk);

        read (32'hc0000000); // read mtime lo
        wait(!cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'hfffffff1);
        
        write(32'hc0000008, 32'hbbbbbbbb); // write cmp
        wait(!cyc);
        @(posedge wb_clk);
        write(32'hc000000c, 32'haaaaaaaa); // write cmp
        wait(!cyc);
        @(posedge wb_clk);

        read (32'hc0000004); // read mtime hi
        wait(!cyc);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(rd_rdt == 32'h12345678);

        @(posedge wb_clk);
        @(posedge wb_clk);
        $finish;         
    end

endmodule
    
