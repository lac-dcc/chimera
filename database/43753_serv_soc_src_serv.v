// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none

   /*
    *
    */

module top(
    input wire CLK, 
    output wire TX, 
    output wire FLASH_SCK,
    output wire FLASH_SSB,
    output wire FLASH_IO0,
    input  wire FLASH_IO1,
    output wire FLASH_IO2,
    output wire FLASH_IO3,
    output wire LED1,
    output wire LED2,
    output wire LED3,
    output wire LED4,
    output wire LED5,
    output wire P1A1,
    output wire P1A2,
    output wire P1A3,
    output wire P1A4,
    output wire P1B1,
    output wire P1B2,
    output wire P1B3,
    output wire P1B4
);

    // Device addresses (addr[31:24])
    localparam GPIO_ADDR  = 8'h40;
    localparam UART_ADDR  = 8'h50;
    localparam FLASH_ADDR = 8'h70;
    localparam TIMER_ADDR = 8'hc0;
    // Run code from this location in memory (Flash)
    localparam RESET_PC   = 32'h0010_0000;

    localparam RUN_SLOW = 0;        // Divide the CPU clock down for development
    localparam RESET_LOOP = 0;      // Repeatedly reset the CPU
    localparam TIMER_ENABLED = 1;   // Hardware Timer

    // PLL
    wire pll_ck;
    /* verilator lint_off UNUSED */
    wire locked;
    /* verilator lint_on UNUSED */
    pll clock(.clock_in(CLK), .clock_out(pll_ck), .locked(locked));

    // Conditonally slow the cpu clock down for development.
    generate
        wire ck;
        if (RUN_SLOW) begin
            reg [3:0] scale = 0;

            always @(posedge pll_ck) begin
                scale <= scale + 1;
            end

        assign ck = scale[3];
        end else begin
            assign ck = pll_ck;
        end
    endgenerate

    // Reset generator
    wire reset_req;
    wire rst;

    reset #(.LENGTH(80)) reset(.ck(ck), .rst_req(reset_req), .rst(rst));

    // Continually Reset the cpu (for development)

    generate 
        if (RESET_LOOP) begin
            reg [(RUN_SLOW ? 21 : 24):0] reseter = 0;

            always @(posedge ck) begin
                reseter <= reseter + 1;
            end

            assign reset_req = reseter == 0;
        end else begin
            assign reset_req = 0;
        end
    endgenerate

    // CPU dbus

    wire [31:0] wb_dbus_adr;
    wire [31:0] wb_dbus_dat;
    wire [31:0] wb_dbus_rdt;
    wire [3:0] wb_dbus_sel;
    wire wb_dbus_we;
    wire wb_dbus_cyc;
    wire wb_dbus_ack;

    // CPU ibus

    wire wb_clk;
    wire wb_rst;
    wire [31:0] wb_ibus_adr;
    wire [31:0] wb_ibus_rdt;
    wire wb_ibus_cyc;
    wire wb_ibus_ack;

    assign wb_clk = ck;
    assign wb_rst = rst;

    //  RAM

    wire ram_ack;
    wire ram_cyc;
    wire [31:0] ram_rdt;

    chip_select #(.ADDR(0), .WIDTH(2))
    cs_ram (
        .wb_ck(wb_clk),
        .addr(wb_dbus_adr[31:30]),
        .wb_cyc(wb_dbus_cyc),
        .wb_rst(wb_rst),
        .ack(ram_ack),
        .cyc(ram_cyc)
    );
  
    //  Dbus RAM

    sp_ram ram (
        .ck(wb_clk),
        .addr(wb_dbus_adr),
        .cyc(ram_cyc),
        .we(wb_dbus_we),
        .sel(wb_dbus_sel),
        .wdata(wb_dbus_dat),
        .rdata(ram_rdt)
    );

    //  Risc-V 64-bit Timer

    wire timer_ack;
    wire timer_irq;
    wire [31:0] timer_rdt;

    generate

        if (TIMER_ENABLED) begin

            wire timer_cyc;

            chip_select #(.ADDR(TIMER_ADDR), .WIDTH(8))
            cs_timer (
                .wb_ck(wb_clk),
                .addr(wb_dbus_adr[31:24]),
                .wb_cyc(wb_dbus_cyc),
                .wb_rst(wb_rst),
                .ack(timer_ack),
                .cyc(timer_cyc)
            );

            timer timer (
                .wb_clk(wb_clk),
                .wb_rst(wb_rst),
                .ck_en(1'b1), // no prescale
                .wb_dbus_dat(wb_dbus_dat),
                .wb_dbus_adr(wb_dbus_adr),
                .wb_dbus_we(wb_dbus_we),
                .cyc(timer_cyc),
                .irq(timer_irq),
                .rdt(timer_rdt)
            );

        end else begin

            //  No timer hardware
            assign timer_ack = 0;
            assign timer_irq = 0;
            assign timer_rdt = 0;

        end
    endgenerate

    //  UART

    wire baud_en;

    uart_baud #(.DIVIDE(RUN_SLOW ? 17 : 278)) uart_clock (.ck(wb_clk), .baud_ck(baud_en));

    wire [31:0] uart_rdt;
    wire uart_ack;
    wire tx;
    /* verilator lint_off UNUSED */
    wire tx_busy;
    /* verilator lint_on UNUSED */
    
    uart #(.ADDR(UART_ADDR), .AWIDTH(8))
    uart_io (
        // cpu bus
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_sel(wb_dbus_sel),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_cyc(wb_dbus_cyc),
        .rdt(uart_rdt),
        .ack(uart_ack),
        // IO
        .baud_en(baud_en),
        .tx(tx),
        .busy(tx_busy)
    );

    //  GPIO

    wire [31:0] gpio_rdt;
    wire gpio_ack;

    /* verilator lint_off UNUSED */
    wire [7:0] gpio_reg;
    /* verilator lint_on UNUSED */
 
    gpio #(.ADDR(GPIO_ADDR), .AWIDTH(8))
    gpio_io (
        // cpu bus
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_sel(wb_dbus_sel),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_cyc(wb_dbus_cyc),
        .rdt(gpio_rdt),
        .ack(gpio_ack),
        // IO
        .gpio(gpio_reg)
    );

    //  SPI Flash interface

    wire spi_cs;
    wire spi_sck;
    wire spi_miso;
    wire spi_mosi;

    // connect to the flash chip
    assign FLASH_SCK = spi_sck;
    assign FLASH_SSB = spi_cs;
    assign FLASH_IO0 = spi_mosi;
    assign spi_miso = FLASH_IO1;
    assign FLASH_IO2 = 1;
    assign FLASH_IO3 = 1;

    // flash_read connection to ibus arb
    wire [31:0] f_adr;
    wire [31:0] f_rdt;
    wire f_cyc;
    wire f_ack;
    // flash_read dbus arb
    wire flash_ack;
    wire [31:0] flash_rdt;
    /* verilator lint_off UNUSED */
    wire flash_busy;
    /* verilator lint_on UNUSED */

    ibus_read #(.ADDR(FLASH_ADDR))
    flash_read (
        .wb_clk(wb_clk),
        .wb_rst(wb_rst),
        .wb_dbus_cyc(wb_dbus_cyc),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .wb_dbus_ack(flash_ack),
        .wb_dbus_rdt(flash_rdt),
        .wb_ibus_cyc(f_cyc),
        .wb_ibus_adr(f_adr),
        .wb_ibus_ack(f_ack),
        .wb_ibus_rdt(f_rdt),
        .dev_busy(flash_busy)
    );

    // SPI flash ibus interface
    // Run XiP over this

    wire [31:0] s_adr;
    wire [31:0] s_rdt;
    wire s_cyc;
    wire s_ack;
    wire ibus_ready;

    ibus ibus (
        .wb_clk(ck),
        .wb_rst(rst),
        // iBus interface
        .wb_ibus_adr(s_adr),
        .wb_ibus_rdt(s_rdt),
        .wb_ibus_cyc(s_cyc),
        .wb_ibus_ack(s_ack),
        // SPI interface
        .spi_cs(spi_cs),
        .spi_sck(spi_sck),
        .spi_miso(spi_miso),
        .spi_mosi(spi_mosi),
        .ready(ibus_ready)
    );

    //  iBus arbitration between CPU and flash_read

    /* verilator lint_off UNUSED */
    wire arb_busy;
    /* verilator lint_on UNUSED */

    bus_arb ibus_arb(
        .wb_clk(ck),
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
        .busy(arb_busy)
    );

    // OR the dbus peripherals *_rdt & *_ack together
    // They must be 0 when not active.

    assign wb_dbus_rdt = timer_rdt | ram_rdt | uart_rdt | gpio_rdt | flash_rdt;
    assign wb_dbus_ack = timer_ack | ram_ack | uart_ack | gpio_ack | flash_ack;

    // SERV CPU

    parameter with_csr = 1;

    serv_rf_top #(.RESET_PC(RESET_PC), .WITH_CSR(with_csr))
    cpu (
        .clk      (wb_clk),
        .i_rst    (wb_rst),
        .i_timer_irq  (timer_irq),
        // iBus
        .o_ibus_adr   (wb_ibus_adr),
        .o_ibus_cyc   (wb_ibus_cyc),
        .i_ibus_rdt   (wb_ibus_rdt),
        .i_ibus_ack   (wb_ibus_ack),
        // dBus
        .o_dbus_adr   (wb_dbus_adr),
        .o_dbus_dat   (wb_dbus_dat),
        .o_dbus_sel   (wb_dbus_sel),
        .o_dbus_we    (wb_dbus_we),
        .o_dbus_cyc   (wb_dbus_cyc),
        .i_dbus_rdt   (wb_dbus_rdt),
        .i_dbus_ack   (wb_dbus_ack)
    );

    //  IO

    assign TX = tx;
    assign LED1 = gpio_reg[0];
    assign LED2 = gpio_reg[1];
    assign LED3 = gpio_reg[2];
    assign LED4 = gpio_reg[3];
    assign LED5 = gpio_reg[4];

    //  Test pins

    assign P1A1 = tx;
    assign P1A2 = timer_irq;
    assign P1A3 = f_cyc;
    assign P1A4 = tx_busy;
    assign P1B1 = ibus_ready;
    assign P1B2 = 0;
    assign P1B3 = 0;
    assign P1B4 = 0;

endmodule
