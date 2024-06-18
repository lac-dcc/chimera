// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


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
    end

    //  SPI Bus
    wire spi_cs;
    wire spi_sck;
    wire spi_mosi;
    reg  spi_miso = 0;

    //  iBus : CPU -> ibus_arb
    reg  wb_ibus_cyc = 0;
    reg  [31:0] wb_ibus_adr = 32'hZ;
    wire wb_ibus_ack;
    wire [31:0] wb_ibus_rdt;

    //  iBus : ibus_read -> ibus_arb
    wire b_cyc;
    wire [31:0] b_adr;
    wire b_ack;
    wire [31:0] b_rdt;

    //  Connection from ibus_arb to ibus_spi controller
    wire x_cyc;
    wire [31:0] x_adr;
    wire x_ack;
    wire [31:0] x_rdt;
    wire busy;

    bus_arb bus_arb(
        .wb_clk(wb_clk),
        .a_cyc(wb_ibus_cyc),
        .a_adr(wb_ibus_adr),
        .a_ack(wb_ibus_ack),
        .a_rdt(wb_ibus_rdt),
        .b_cyc(b_cyc),
        .b_adr(b_adr),
        .b_ack(b_ack),
        .b_rdt(b_rdt),
        .x_cyc(x_cyc),
        .x_adr(x_adr),
        .x_ack(x_ack),
        .x_rdt(x_rdt),
        .busy(busy)
    );

    // ibus_spi controller driven by ibus_arb

    ibus ibus (
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_ibus_cyc(x_cyc),
        .wb_ibus_adr(x_adr),
        .wb_ibus_ack(x_ack),
        .wb_ibus_rdt(x_rdt),
        .spi_cs(spi_cs),
        .spi_sck(spi_sck),
        .spi_mosi(spi_mosi),
        .spi_miso(spi_miso)
    );

    //  ibus_dbus bridge device

    reg  wb_dbus_cyc = 0;
    reg  wb_dbus_we = 0;
    reg  [31:0] wb_dbus_adr = 32'hZ;
    reg  [31:0] wb_dbus_dat = 32'hZ;
    wire [31:0] wb_dbus_rdt;
    wire wb_dbus_ack;
    wire dev_busy;

    ibus_read #(.ADDR(8'h40), .ADDR_W(8))
    ibus_read(
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_cyc(wb_dbus_cyc),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_rdt(wb_dbus_rdt),
        .wb_dbus_ack(wb_dbus_ack),
        .wb_ibus_cyc(b_cyc),
        .wb_ibus_adr(b_adr),
        .wb_ibus_ack(b_ack),
        .wb_ibus_rdt(b_rdt),
        .dev_busy(dev_busy)
    );

    //  Control / response for wb_ibus_*
    //  Simulate CPU iBus request / response

    reg [31:0] ibus_data = 32'hZ;
    reg ibus_ready = 0;

    always @(posedge wb_clk) begin
        if (wb_ibus_ack) begin
            wb_ibus_cyc <= 0;
            ibus_data <= wb_ibus_rdt;
            ibus_ready <= 1;
        end
    end

    task ifetch(input [32:0] addr);

        begin
            wb_ibus_cyc <= 1;
            wb_ibus_adr <= addr;
            ibus_ready <= 0;
        end

    endtask

    reg [31:0] dbus_data = 32'hZ;
    reg dbus_ready = 0;

    always @(posedge wb_clk) begin
        if (wb_dbus_ack) begin
            wb_dbus_cyc <= 0;
            wb_dbus_we <= 0;
            wb_dbus_adr <= 32'hZ;
            wb_dbus_dat <= 32'hZ;
            if (!wb_dbus_we) begin
                dbus_data <= wb_dbus_rdt;
                dbus_ready <= 1;
            end
        end
    end

    task dwrite(input [31:0] addr, input [31:0] data);

        begin

            wb_dbus_cyc <= 1;
            wb_dbus_adr <= addr;
            wb_dbus_dat <= data;
            wb_dbus_we <= 1;
            dbus_ready <= 0;

        end

    endtask

    task dread(input [31:0] addr);

        begin

            wb_dbus_cyc <= 1;
            wb_dbus_adr <= addr;
            wb_dbus_we <= 0;
            dbus_ready <= 0;

        end

    endtask

    //  Tests

    initial begin

        wait(!wb_rst);

        @(posedge wb_clk);
        @(posedge wb_clk);

        // ibus SPI controller has long reset sequence
        // as it has to send 0x66 0x99 commands to the Flash device
        // then wait 30us.

        spi_miso <= 0;
        ifetch(32'h12345678);
        @(posedge wb_clk);

        wait(ibus_ready);
        tb_assert(ibus_data == 0);

        spi_miso <= 1;
        ifetch(32'h12345678);
        @(posedge wb_clk);

        wait(ibus_ready);
        tb_assert(ibus_data == 32'hffffffff);
        @(posedge wb_clk);

        // dbus write / read cycle
        wait(!busy);
        dwrite(32'h4000_0000, 32'h12341234);
        @(posedge wb_clk);
        wait(!wb_dbus_cyc);

        @(posedge wb_clk);
        dread(32'h4000_0000);
        @(posedge wb_clk);
        wait(dbus_ready);
        //tb_assert(dbus_data == 32'hffffffff);
        @(posedge wb_clk);

        // Another dbus read
        spi_miso <= 0;
        @(posedge wb_clk);
        dread(32'h4000_0000);
        @(posedge wb_clk);
        wait(dbus_ready);
        tb_assert(dbus_data == 32'h00000000);
        @(posedge wb_clk);

        // Start an ifetch 
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        spi_miso <= 1;
        ifetch(32'h12345678);

        // Another dbus read shortly after the ifetch
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        dread(32'h4000_0000);

        // ibus read should complete first
        wait(ibus_ready);
        tb_assert(ibus_data == 32'hffffffff);

        // then the dbus read completes
        wait(dbus_ready);
        tb_assert(dbus_data == 32'hffffffff);
        @(posedge wb_clk);

        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        spi_miso <= 0;
        dread(32'h4000_0000);
        @(posedge wb_clk);
        wait(dbus_ready);
        tb_assert(dbus_data == 32'h00000000);
        @(posedge wb_clk);

        //  Check Reset
        wb_rst <= 1;
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        wb_rst <= 0;

        # 100000;
        $finish();

    end

endmodule


