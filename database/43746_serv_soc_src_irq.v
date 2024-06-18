// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


module irq_reg 
    #(parameter ADDR=0, ADDR_W=8, REG_WIDTH=8)
(
    // Wishbone bus
    input wire wb_clk,
    input wire wb_rst,
    /* verilator lint_off UNUSED */
    input wire [31:0] wb_dbus_adr,
    input wire [31:0] wb_dbus_dat,
    /* verilator lint_on UNUSED */
    input wire wb_dbus_we,
    input wire wb_dbus_cyc,
    output wire ack,
    output wire [31:0] rdt,
    // Irq lines
    input wire [REG_WIDTH-1:0] irq_in,
    output wire irq
);

    wire cyc;

    chip_select #(.ADDR(ADDR), .WIDTH(ADDR_W)) 
    cs_irq(
        .wb_ck(wb_clk),
        .wb_rst(wb_rst),
        .addr(wb_dbus_adr[31:32-ADDR_W]),
        .wb_cyc(wb_dbus_cyc),
        .ack(ack),
        .cyc(cyc)
    );

    reg [REG_WIDTH-1:0] enable_reg = 0;
    reg [REG_WIDTH-1:0] state_reg = 0;
    reg [REG_WIDTH-1:0] prev_reg = 0;

    wire [2:0] addr;
    assign addr = wb_dbus_adr[4:2];

    wire rd, wr;
    assign rd = cyc & !wb_dbus_we;
    assign wr = cyc & wb_dbus_we;

    reg [REG_WIDTH-1:0] rd_data = 0;

    wire [REG_WIDTH-1:0] irq_detect;

    // detect rising edges on irq_in
    assign irq_detect = irq_in & ~prev_reg;

    always @(posedge wb_clk) begin

        prev_reg <= irq_in;

        if (rd & (addr == 0)) begin
            rd_data <= enable_reg; 
        end

        if (rd & (addr == 1)) begin
            rd_data <= state_reg; 
        end

        // no reg mapped for rd addr=2
        if (rd & (addr == 3)) begin
            rd_data <= irq_in; 
        end

        if (wr & (addr == 0)) begin
            enable_reg <= wb_dbus_dat[REG_WIDTH-1:0];
        end

        if (wr & (addr == 2)) begin
            // ACK the irq (clear the reg) by clearing specific bits
            state_reg <= state_reg & ~wb_dbus_dat[REG_WIDTH-1:0];
        end

        if (wr & (addr == 4)) begin
            // set bits in enable reg
            enable_reg <= enable_reg | wb_dbus_dat[REG_WIDTH-1:0];
        end

        if (wr & (addr == 5)) begin
            // clr bits in enable reg
            enable_reg <= enable_reg & ~wb_dbus_dat[REG_WIDTH-1:0];
        end

        if (irq_detect != 0) begin
            // SET the irq on any enabled irq detect
            state_reg <= state_reg | (enable_reg & irq_detect);
        end

    end

    assign rdt = (rd & ack) ? { {(32-REG_WIDTH){ 1'b0 }}, rd_data } : 0;
    assign irq = | (state_reg & enable_reg);

endmodule

