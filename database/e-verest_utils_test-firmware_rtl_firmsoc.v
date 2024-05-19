// This program was cloned from: https://github.com/cbalint13/e-verest
// License: Apache License 2.0

/*
 *  e-VEREST firmware
 *
 *  Copyright (C) 2017  Claire Xenia Wolf <claire@yosyshq.com>
 *  Copyright (C) 2018  gatecat <gatecat@ds0.me>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

`ifdef PICORV32_V
`error "firmsoc.v must be read before picorv32.v!"
`endif

`define PICORV32_REGS picosoc_regs

module firmsoc (
    input fifo_ft_clk,
    output uart_tx,
    input uart_rx
);

    wire fifo_ft_clk;
    wire clk_cpu;
    wire clk_spi;

`ifdef SYNTHESIS
    // ecp5 pll
    EHXPLLL #(
        .PLLRST_ENA("DISABLED"),
        .INTFB_WAKE("DISABLED"),
        .STDBY_ENABLE("DISABLED"),
        .DPHASE_SOURCE("DISABLED"),
        .OUTDIVIDER_MUXA("DIVA"),
        .OUTDIVIDER_MUXB("DIVB"),
        .OUTDIVIDER_MUXC("DIVC"),
        .OUTDIVIDER_MUXD("DIVD"),
        .CLKI_DIV(2),
        .CLKOP_ENABLE("ENABLED"),
        .CLKOP_DIV(12),
        .CLKOP_CPHASE(5),
        .CLKOP_FPHASE(0),
        .FEEDBK_PATH("CLKOP"),
        .CLKFB_DIV(1)
    ) pll_i (
        .RST(1'b0),
        .STDBY(1'b0),
        .CLKI(fifo_ft_clk),
        .CLKOP(clk_cpu),
        .CLKFB(clk_cpu),
        .CLKINTFB(),
        .PHASESEL0(1'b0),
        .PHASESEL1(1'b0),
        .PHASEDIR(1'b1),
        .PHASESTEP(1'b1),
        .PHASELOADREG(1'b1),
        .PLLWAKESYNC(1'b0),
        .ENCLKOP(1'b0),
    );
`else
    // testbench
    div_clk div_two_clk(
        .clk(fifo_ft_clk),
        .div2_clk(clk_cpu)
    );
    assign clk_spi = fifo_ft_clk;
`endif

    reg [5:0] reset_cnt = 0;
    wire resetn = &reset_cnt;

    always @(posedge clk_cpu) begin
        reset_cnt <= reset_cnt + !resetn;
    end

    parameter integer MEM_WORDS = 8192;
    parameter [31:0] STACKADDR = 32'h 0000_0000 + (4*MEM_WORDS);       // end of memory
    parameter [31:0] PROGADDR_RESET = 32'h 0000_0000;       // start of memory

    reg [31:0] ram [0:MEM_WORDS-1];
    initial $readmemh("out/everest_fw.hex", ram);
    reg [31:0] ram_rdata;
    reg ram_ready;

    wire mem_valid;
    wire mem_instr;
    wire mem_ready;
    wire [31:0] mem_addr;
    wire [31:0] mem_wdata;
    wire [3:0] mem_wstrb;
    wire [31:0] mem_rdata;

    always @(posedge clk_cpu)
        begin
        ram_ready <= 1'b0;
        if (mem_addr[31:24] == 8'h00 && mem_valid) begin
            if (mem_wstrb[0]) ram[mem_addr[23:2]][7:0] <= mem_wdata[7:0];
            if (mem_wstrb[1]) ram[mem_addr[23:2]][15:8] <= mem_wdata[15:8];
            if (mem_wstrb[2]) ram[mem_addr[23:2]][23:16] <= mem_wdata[23:16];
            if (mem_wstrb[3]) ram[mem_addr[23:2]][31:24] <= mem_wdata[31:24];

            ram_rdata <= ram[mem_addr[23:2]];
            ram_ready <= 1'b1;
        end
        end

    wire iomem_valid;
    reg iomem_ready;
    wire [31:0] iomem_addr;
    wire [31:0] iomem_wdata;
    wire [3:0] iomem_wstrb;
    wire [31:0] iomem_rdata;

    assign iomem_valid = mem_valid && (mem_addr[31:24] > 8'h 01);
    assign iomem_wstrb = mem_wstrb;
    assign iomem_addr = mem_addr;
    assign iomem_wdata = mem_wdata;

    wire        simpleuart_reg_div_sel = mem_valid && (mem_addr == 32'h 0200_0004);
    wire [31:0] simpleuart_reg_div_do;

    wire        simpleuart_reg_dat_sel = mem_valid && (mem_addr == 32'h 0200_0008);
    wire [31:0] simpleuart_reg_dat_do;
    wire simpleuart_reg_dat_wait;

    always @(posedge clk_cpu) begin
        iomem_ready <= 1'b0;
      if (iomem_valid && iomem_wstrb[0] && mem_addr == 32'h 02000000) begin
            iomem_ready <= 1'b1;
        end
    end

    assign mem_ready = (iomem_valid && iomem_ready) ||
                       simpleuart_reg_div_sel || (simpleuart_reg_dat_sel && !simpleuart_reg_dat_wait) ||
                                         ram_ready;

    assign mem_rdata = simpleuart_reg_div_sel ? simpleuart_reg_div_do :
                                         simpleuart_reg_dat_sel ? simpleuart_reg_dat_do :
                                             ram_rdata;
    picorv32 #(
        .STACKADDR(STACKADDR),
        .PROGADDR_RESET(PROGADDR_RESET),
        .PROGADDR_IRQ(32'h 0000_0000),
        .BARREL_SHIFTER(0),
        .COMPRESSED_ISA(0),
        .ENABLE_MUL(0),
        .ENABLE_DIV(0),
        .ENABLE_IRQ(0),
        .ENABLE_IRQ_QREGS(0)
    ) cpu (
        .clk         (clk_cpu    ),
        .resetn      (resetn     ),
        .mem_valid   (mem_valid  ),
        .mem_instr   (mem_instr  ),
        .mem_ready   (mem_ready  ),
        .mem_addr    (mem_addr   ),
        .mem_wdata   (mem_wdata  ),
        .mem_wstrb   (mem_wstrb  ),
        .mem_rdata   (mem_rdata  )
    );

    simpleuart simpleuart (
        .clk         (clk_cpu    ),
        .resetn      (resetn     ),

        .ser_tx      (uart_tx    ),
        .ser_rx      (uart_rx    ),

        .reg_div_we  (simpleuart_reg_div_sel ? mem_wstrb : 4'b 0000),
        .reg_div_di  (mem_wdata),
        .reg_div_do  (simpleuart_reg_div_do),

        .reg_dat_we  (simpleuart_reg_dat_sel ? mem_wstrb[0] : 1'b 0),
        .reg_dat_re  (simpleuart_reg_dat_sel && !mem_wstrb),
        .reg_dat_di  (mem_wdata),
        .reg_dat_do  (simpleuart_reg_dat_do),
        .reg_dat_wait(simpleuart_reg_dat_wait)
);

endmodule

// Implementation note:
// Replace the following two modules with wrappers for your SRAM cells.

module picosoc_regs (
    input clk, wen,
    input [5:0] waddr,
    input [5:0] raddr1,
    input [5:0] raddr2,
    input [31:0] wdata,
    output [31:0] rdata1,
    output [31:0] rdata2
);
    reg [31:0] regs [0:31];

    always @(posedge clk)
        if (wen) regs[waddr[4:0]] <= wdata;

    assign rdata1 = regs[raddr1[4:0]];
    assign rdata2 = regs[raddr2[4:0]];
endmodule
