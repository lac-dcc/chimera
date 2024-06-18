// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


`default_nettype none

module ibus
    (
    input wire wb_clk,
    input wire wb_rst,
    // ibus interface
    input wire wb_ibus_cyc,
    /* verilator lint_off UNUSED */
    input wire [31:0] wb_ibus_adr,
    /* verilator lint_on UNUSED */
    output wire wb_ibus_ack,
    output wire [31:0] wb_ibus_rdt,
    // SPI interface
    output wire spi_cs,
    output wire spi_sck,
    output wire spi_mosi,
    input  wire spi_miso,
    output wire ready
);

    // XiP (Execute in place) : fetch ibus requests from Flash

    wire spi_ready;
    wire start;
    wire ack;
    reg fetching = 0;

    assign ack = fetching & spi_ready;

    wire [31:0] spi_rdata;

    always @(posedge wb_clk) begin

        if (start) begin
            fetching <= 1;
        end

        if (fetching & spi_ready) begin
            fetching <= 0;
        end

    end

    // Endian Swap
    wire [31:0] rdata = { spi_rdata[7:0], spi_rdata[15:8], spi_rdata[23:16], spi_rdata[31:24] };
    assign wb_ibus_rdt = wb_ibus_cyc ? rdata : 0;

    reg [7:0] spi_code;
    reg spi_tx_addr;
    reg spi_no_read;
   
    initial spi_code = 0;
    initial spi_tx_addr = 1;
    initial spi_no_read = 0;

    // SPI Flash Command Codes
    localparam SPI_READ      = 8'h03;
    localparam SPI_RESET_EN  = 8'h66;
    localparam SPI_RESET_REQ = 8'h99;

    // State Machine to control reset of the flash
    localparam RESET = 0;
    localparam RESET_EN_START = 1;
    localparam RESET_EN = 2;
    localparam RESET_REQ_START = 3;
    localparam RESET_REQ = 4;
    localparam WAITING = 5;
    localparam RUNNING = 6;

    reg [2:0] state;

    // Set to initiate SPI xfer during reset commands
    reg rst_start = 0;
    // Wait for Flash device to complete reset (~ 30us)
    reg [9:0] wait_ck = 0;

    always @(posedge wb_clk) begin

        if (wb_rst) begin
            state <= RESET;
            wait_ck <= 0;
        end

        if ((state == RESET) & !wb_rst) begin
            // Start sending the RESET_EN command
            state <= RESET_EN_START;
            spi_code <= SPI_RESET_EN;
            spi_tx_addr <= 0;
            spi_no_read <= 1;
            rst_start <= 1;
        end

        if (state == RESET_EN_START) begin
            rst_start <= 0;
            state <= RESET_EN;
        end

        if ((state == RESET_EN) & spi_ready) begin
            // Start sending the RESET_REQ command
            state <= RESET_REQ_START;
            spi_code <= SPI_RESET_REQ;
            spi_tx_addr <= 0;
            spi_no_read <= 1;
            rst_start <= 1;                
        end

        if (state == RESET_REQ_START) begin
            rst_start <= 0;
            state <= RESET_REQ;
        end

        if ((state == RESET_REQ) & spi_ready) begin
            state <= WAITING;
            // Configure for normal running
            spi_code <= SPI_READ;
            spi_tx_addr <= 1;
            spi_no_read <= 0;
        end

        if (state == WAITING) begin
            // Wait >30us for the flash reset to complete
            wait_ck <= wait_ck +1;
            if (wait_ck == 10'h3FF) begin
                state <= RUNNING;
            end
        end

    end

    assign start = (state == RUNNING) ? (wb_ibus_cyc & spi_ready & !fetching) : rst_start;

    spi_tx spi(
        .ck(wb_clk),
        .rst(wb_rst),
        // SPI io
        .cs(spi_cs),
        .sck(spi_sck),
        .mosi(spi_mosi),
        .miso(spi_miso),
        // control
        .code(spi_code),
        .tx_addr(spi_tx_addr),
        .no_read(spi_no_read),
        // WB Bus
        .addr(wb_ibus_adr[23:0]),
        .req(start),
        // SPI status / data
        .rdata(spi_rdata),
        .ready(spi_ready)
    );

    assign wb_ibus_ack = ack && (state == RUNNING);
    assign ready = state == RUNNING;

endmodule

   /*
    *   Device on dbus which makes reads to the ibus
    *   to allow SPI flash contents to be read.
    *
    *   WRITE the fetch address to BASE[0]
    *   READ BASE[0] for the result. 
    *   
    *   ie, to read flash location 0x100008, do
    *
    *   write(base, 0x100008);      // start a flash read
    *   uint32_t data = read(base); // read the data
    */

module ibus_read
# (parameter ADDR=0, ADDR_W=8)
(
    input wire wb_clk,
    input wire wb_rst,
    // dbus interface
    input wire wb_dbus_cyc,
    input wire wb_dbus_we,
    /* verilator lint_off UNUSED */
    input wire [31:0] wb_dbus_adr,
    /* verilator lint_on UNUSED */
    input wire [31:0] wb_dbus_dat,
    output wire [31:0] wb_dbus_rdt,
    output wire wb_dbus_ack,
    // ibus interface
    output wire wb_ibus_cyc,
    output wire [31:0] wb_ibus_adr,
    input wire wb_ibus_ack,
/* verilator lint_off UNUSED */
    input wire [31:0] wb_ibus_rdt,
/* verilator lint_on UNUSED */
    output wire dev_busy
);

    wire cyc;
    /* verilator lint_off UNUSED */
    wire nowt;
    /* verilator lint_on UNUSED */

    chip_select #(.ADDR(ADDR), .WIDTH(ADDR_W))
    dev_cs (
        .wb_ck(wb_clk), 
        .addr(wb_dbus_adr[31:(32-ADDR_W)]), 
        .wb_cyc(wb_dbus_cyc), 
        .wb_rst(wb_rst),
        .ack(nowt), 
        .cyc(cyc)
    );

    reg  ack = 0;
    reg  ibus_ack = 0;
    reg [31:0] rd_addr = 0;
    reg [31:0] rd_data = 32'h0;
    reg busy = 0;

    assign dev_busy = busy;

    always @(posedge wb_clk) begin

        if (wb_rst) begin
            ack <= 0;
            ibus_ack <= 0;
            rd_addr <= 0;
            //busy <= 0;
        end

        if (!wb_dbus_cyc) begin
            ack <= 0;
            ibus_ack <= 0;
        end

        // dbus write
        if (cyc & wb_dbus_we) begin
            // Set the read addr
            rd_addr <= wb_dbus_dat;
            ack <= 1;
        end

        // dbus read
        if (cyc & !wb_dbus_we) begin
            if (!ibus_ack) begin
                // Start an ibus read cycle
                busy <= 1;
            end
        end

        // ack from ibus ends the read
        if (wb_ibus_ack & busy) begin
            busy <= 0;
            rd_data <= wb_ibus_rdt;
            ibus_ack <= 1;
            // Increment the read address for the next read cycle
            rd_addr <= rd_addr + 32'h4;
        end

        if (ibus_ack) begin
            ack <= 1;
        end

    end

    assign wb_dbus_ack = cyc & ack;
    assign wb_dbus_rdt = cyc ? rd_data : 0; 

    assign wb_ibus_cyc = busy;
    assign wb_ibus_adr = busy ? rd_addr : 0; 

endmodule

