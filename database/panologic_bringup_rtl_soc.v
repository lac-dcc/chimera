
`timescale 1ns/100ps
`default_nettype none

module soc
    #(
        parameter integer LOCAL_RAM_SIZE_KB = 8,
        parameter integer NR_GPIOS          = 8
    ) (
        input wire  clk,
        input wire  reset_,

        output [NR_GPIOS-1:0]   gpio_oe,
        output [NR_GPIOS-1:0]   gpio_do,
        input  [NR_GPIOS-1:0]   gpio_di,

        output wire             sbuf_wr,
        output wire             sbuf_rd,
        output wire [11:0]      sbuf_addr,
        output wire [7:0]       sbuf_wdata,
        input  wire [7:0]       sbuf_rdata,

        output wire             usb_reset_,
        output wire             usb_cs_,
        output wire             usb_wr_,
        output wire             usb_rd_,
        output wire [17:1]      usb_a,
        inout  wire [15:0]      usb_d,
        input  wire             usb_irq
    );

    wire        mem_cmd_valid;
    wire        mem_cmd_ready;
    wire        mem_cmd_instr;
    wire        mem_cmd_wr;
    wire [31:0] mem_cmd_addr;
    wire [31:0] mem_cmd_wdata;
    wire [3:0]  mem_cmd_be;
    wire        mem_rsp_ready;
    wire [31:0] mem_rsp_rdata;

    wire [31:0] irq;
    assign irq = 32'd0;

    reg mem_rsp_ready_local_ram;
    reg [31:0] mem_rsp_rdata_local_ram;

    wire mem_rsp_ready_gpio;
    wire [31:0] mem_rsp_rdata_gpio;

    reg mem_rsp_ready_sbuf;
    reg [31:0] mem_rsp_rdata_sbuf;

    reg mem_rsp_ready_usb;
    reg [31:0] mem_rsp_rdata_usb;

    reg mem_rsp_ready_void;


`ifdef USE_PICORV32
    picorv32_wrapper
`endif
`ifdef USE_ICICLE
    icicle_wrapper
`endif
`ifdef USE_VEXRISCV
    vexriscv_wrapper
`endif
    cpu (
        .clk            (clk),
        .reset_         (reset_),
        .mem_cmd_valid  (mem_cmd_valid),
        .mem_cmd_ready  (mem_cmd_ready),
        .mem_cmd_wr     (mem_cmd_wr),
        .mem_cmd_instr  (mem_cmd_instr),
        .mem_cmd_addr   (mem_cmd_addr),
        .mem_cmd_wdata  (mem_cmd_wdata),
        .mem_cmd_be     (mem_cmd_be),
        .mem_rsp_ready  (mem_rsp_ready),
        .mem_rsp_rdata  (mem_rsp_rdata),
        .irq            (irq        )
    );

`ifndef SYNTHESIS
    initial
        $timeformat(-9,2,"ns",15);

    always @(posedge clk) begin
        if (reset_ != 1'b0) begin
            if (   (mem_cmd_valid === 1'bx)
                || (mem_cmd_valid && mem_cmd_ready ===1'bx)
                || (mem_cmd_valid && mem_cmd_wr && (^mem_cmd_addr === 1'bx || ^mem_cmd_wdata === 1'bx) )
                || (mem_cmd_valid && mem_cmd_ready &&
                        (   mem_cmd_instr === 1'bx
                         || mem_cmd_wr === 1'bx
                         || mem_cmd_be === 1'bx
                        ))
                || (mem_rsp_ready === 1'bx)
                || (mem_rsp_ready && (^mem_rsp_rdata === 1'bx))
                )
            begin
                $display("%t: %m has X on cpu bus. Aborting.", $time);
                @(posedge clk);
                @(posedge clk);
                $finish;
            end
        end
    end
`endif

    //============================================================
    // Address decoder and data multiplexer
    //============================================================

    wire mem_cmd_sel_local_ram, mem_cmd_sel_gpio, mem_cmd_sel_sbuf, mem_cmd_sel_usb, mem_cmd_sel_void;
    reg mem_cmd_sel_local_ram_reg, mem_cmd_sel_gpio_reg, mem_cmd_sel_sbuf_reg, mem_cmd_sel_usb_reg, mem_cmd_sel_void_reg;

    assign mem_cmd_sel_local_ram    = mem_cmd_addr < (LOCAL_RAM_SIZE_KB * 1024);
    assign mem_cmd_sel_gpio         = mem_cmd_addr[31:20] == 12'hf00;
    assign mem_cmd_sel_sbuf         = mem_cmd_addr[31:20] == 12'hf01;
    assign mem_cmd_sel_usb          = mem_cmd_addr[31:20] == 12'hf02;
    assign mem_cmd_sel_void         =    !mem_cmd_sel_local_ram
                                      && !mem_cmd_sel_gpio
                                      && !mem_cmd_sel_sbuf
                                      && !mem_cmd_sel_usb;

    always @(posedge clk) begin

        if (mem_cmd_valid) begin
            mem_cmd_sel_local_ram_reg <= mem_cmd_sel_local_ram;
            mem_cmd_sel_gpio_reg      <= mem_cmd_sel_gpio;
            mem_cmd_sel_sbuf_reg      <= mem_cmd_sel_sbuf;
            mem_cmd_sel_usb_reg       <= mem_cmd_sel_usb;
            mem_cmd_sel_void_reg      <= mem_cmd_sel_void;
        end

        if (!reset_) begin
            mem_cmd_sel_local_ram_reg <= 1'b0;
            mem_cmd_sel_gpio_reg      <= 1'b0;
            mem_cmd_sel_sbuf_reg      <= 1'b0;
            mem_cmd_sel_usb_reg       <= 1'b0;
            mem_cmd_sel_void_reg      <= 1'b0;
        end
    end

    // For now, we don't have any slaves that can stall a write
    assign mem_cmd_ready    = 1'b1;

    assign mem_rsp_rdata = mem_cmd_sel_local_ram_reg ? mem_rsp_rdata_local_ram   :
                           mem_cmd_sel_gpio_reg      ? mem_rsp_rdata_gpio        :
                           mem_cmd_sel_sbuf_reg      ? mem_rsp_rdata_sbuf        :
                           mem_cmd_sel_usb_reg       ? mem_rsp_rdata_usb         :
                                                       32'd0;

    assign mem_rsp_ready = mem_cmd_sel_local_ram_reg ? mem_rsp_ready_local_ram   :
                           mem_cmd_sel_gpio_reg      ? mem_rsp_ready_gpio        :
                           mem_cmd_sel_sbuf_reg      ? mem_rsp_ready_sbuf        :
                           mem_cmd_sel_usb_reg       ? mem_rsp_ready_usb         :
                                                       mem_rsp_ready_void;

    always @(posedge clk) begin
        mem_rsp_ready_void  <= mem_cmd_valid & !mem_cmd_wr && mem_cmd_sel_void;

        if (!reset_) begin
            mem_rsp_ready_void  <= 1'b0;
        end
    end

    //============================================================
    // LOCAL RAM
    //============================================================

    wire [31:0] local_ram_rdata;

    reg mem_rsp_ready_local_ram_p1;

    always @(posedge clk) begin
        mem_rsp_ready_local_ram_p1 <= mem_cmd_valid & !mem_cmd_wr & mem_cmd_sel_local_ram;
        mem_rsp_ready_local_ram    <= mem_rsp_ready_local_ram_p1;

        mem_rsp_rdata_local_ram        <= local_ram_rdata;

        if (!reset_) begin
            mem_rsp_ready_local_ram     <= 1'b0;
            mem_rsp_ready_local_ram_p1  <= 1'b0;
        end
    end

    wire [3:0] local_ram_wr;
    wire local_ram_rd;
    assign local_ram_wr = (mem_cmd_valid && mem_cmd_sel_local_ram &&  mem_cmd_wr) ? mem_cmd_be : 4'b0;
    assign local_ram_rd = (mem_cmd_valid && mem_cmd_sel_local_ram && !mem_cmd_wr);


	local_ram #(.WORDS(LOCAL_RAM_SIZE_KB * 1024/4)) memory (
		.clk(clk),
		.wr(local_ram_wr),
		.rd(local_ram_rd),
		.addr(mem_cmd_addr[17:2]),
		.wdata(mem_cmd_wdata),
		.rdata(local_ram_rdata)
	);

    //============================================================
    // GPIO
    //============================================================


    gpio #(.NR_GPIOS(8)) u_gpio(
        .clk        (clk),
        .reset_     (reset_),

        .mem_cmd_sel    (mem_cmd_sel_gpio),
        .mem_cmd_valid  (mem_cmd_valid),
        .mem_cmd_wr     (mem_cmd_wr),
        .mem_cmd_addr   (mem_cmd_addr[11:0]),
        .mem_cmd_wdata  (mem_cmd_wdata),

        .mem_rsp_ready  (mem_rsp_ready_gpio),
        .mem_rsp_rdata  (mem_rsp_rdata_gpio),

        .gpio_oe(gpio_oe),
        .gpio_do(gpio_do),
        .gpio_di(gpio_di)
    );

    //============================================================
    // SBUF
    //============================================================

    reg mem_rsp_ready_sbuf_p1;

    assign sbuf_addr  = mem_cmd_addr[13:2];
    assign sbuf_wdata = mem_cmd_wdata[7:0];

    always @(posedge clk) begin
        mem_rsp_ready_sbuf_p1 <= mem_cmd_valid & !mem_cmd_wr & mem_cmd_sel_sbuf;
        mem_rsp_ready_sbuf    <= mem_rsp_ready_sbuf_p1;

        mem_rsp_rdata_sbuf    <= { 24'd0, sbuf_rdata };

        if (!reset_) begin
            mem_rsp_ready_sbuf     <= 1'b0;
            mem_rsp_ready_sbuf_p1  <= 1'b0;
        end
    end

    assign sbuf_wr = (mem_cmd_valid && mem_cmd_sel_sbuf &&  mem_cmd_wr) ? mem_cmd_be[0] : 1'b0;
    assign sbuf_rd = (mem_cmd_valid && mem_cmd_sel_sbuf && !mem_cmd_wr);

    //============================================================
    // USB
    //============================================================

    assign usb_reset_   = 1'b1;
    assign usb_cs_      = 1'b1;
    assign usb_rd_      = 1'b1;
    assign usb_wr_      = 1'b1;
    assign usb_a        = 17'd0;
    assign usb_d        = {16{1'bz}};

    always 
    begin
        mem_rsp_ready_usb = 1'b1;
        mem_rsp_rdata_usb = 32'hdeadbeef;
    end

endmodule



