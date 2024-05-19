// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module regex_acc #(
    parameter DATA_WIDTH      = 128,
    parameter STRB_WIDTH      = (DATA_WIDTH/8),
    parameter PMEM_ADDR_WIDTH = 8,
    parameter SLOW_M_B_LINES  = 4096,
    parameter ACC_ADDR_WIDTH  = $clog2(SLOW_M_B_LINES),
    parameter PMEM_SEL_BITS   = PMEM_ADDR_WIDTH-$clog2(STRB_WIDTH)
                                -1-$clog2(SLOW_M_B_LINES),
    parameter ACC_MEM_BLOCKS  = 2**PMEM_SEL_BITS,
    parameter LEN_WIDTH       = 16
) (
    input  wire                                     clk,
    input  wire                                     rst,

    input  wire [PMEM_ADDR_WIDTH-1:0]               cmd_addr,
    input  wire [LEN_WIDTH-1:0]                     cmd_len,
    input  wire                                     cmd_valid,
    input  wire                                     cmd_stop,
    output wire                                     cmd_ready,

    output wire                                     status_match,
    output wire                                     status_done,

    output wire [ACC_MEM_BLOCKS-1:0]                acc_en_b1,
    output wire [ACC_MEM_BLOCKS*STRB_WIDTH-1:0]     acc_wen_b1,
    output wire [ACC_MEM_BLOCKS*ACC_ADDR_WIDTH-1:0] acc_addr_b1,
    output wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_wr_data_b1,
    input  wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_rd_data_b1,

    output wire [ACC_MEM_BLOCKS-1:0]                acc_en_b2,
    output wire [ACC_MEM_BLOCKS*STRB_WIDTH-1:0]     acc_wen_b2,
    output wire [ACC_MEM_BLOCKS*ACC_ADDR_WIDTH-1:0] acc_addr_b2,
    output wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_wr_data_b2,
    input  wire [ACC_MEM_BLOCKS*DATA_WIDTH-1:0]     acc_rd_data_b2
);

// Internal paramaters
parameter LINE_ADDR_BITS       = $clog2(STRB_WIDTH);
parameter PMEM_SEL_BITS_MIN1 = PMEM_SEL_BITS>0 ? PMEM_SEL_BITS : 1;

reg [PMEM_ADDR_WIDTH-1:0] addr_reg = 0, addr_next;
reg [LEN_WIDTH-1:0] len_reg = 0, len_next;

reg cmd_ready_reg = 1'b0, cmd_ready_next;

reg status_match_reg = 1'b0, status_match_next;
reg status_done_reg = 1'b0, status_done_next;

reg rd_en_reg = 1'b0, rd_en_next;

reg ctrl_en_reg = 0, ctrl_en_next;
reg ctrl_start_reg = 0, ctrl_start_next;
reg ctrl_stop_reg = 0, ctrl_stop_next;
reg [LINE_ADDR_BITS:0] ctrl_addr_reg = 0, ctrl_addr_next;

reg [7:0] re_data_reg = 0, re_data_next;
reg re_reset_reg = 0, re_reset_next;
wire re_match;

assign cmd_ready = cmd_ready_reg;

assign status_match = status_match_reg;
assign status_done = status_done_reg;

assign acc_en_b1 = (!addr_reg[LINE_ADDR_BITS] && rd_en_reg) ? (PMEM_SEL_BITS > 0 ? 1 << addr_reg[LINE_ADDR_BITS+1+ACC_ADDR_WIDTH +: PMEM_SEL_BITS_MIN1] : 1'b1) : 0;
assign acc_wen_b1 = 0;
assign acc_addr_b1 = {ACC_MEM_BLOCKS{addr_reg[LINE_ADDR_BITS+1 +: ACC_ADDR_WIDTH]}};
assign acc_wr_data_b1 = 0;

assign acc_en_b2 = (addr_reg[LINE_ADDR_BITS] && rd_en_reg) ? (PMEM_SEL_BITS > 0 ? 1 << addr_reg[LINE_ADDR_BITS+1+ACC_ADDR_WIDTH +: PMEM_SEL_BITS_MIN1] : 1'b1) : 0;
assign acc_wen_b2 = 0;
assign acc_addr_b2 = {ACC_MEM_BLOCKS{addr_reg[LINE_ADDR_BITS+1 +: ACC_ADDR_WIDTH]}};
assign acc_wr_data_b2 = 0;

re re_inst(
    .clk(clk),
    .rst_n(!re_reset_reg),
    .in(re_data_reg),
    .match(re_match)
);

always @* begin
    addr_next = addr_reg;
    len_next = len_reg;

    cmd_ready_next = cmd_ready_reg;

    status_match_next = status_match_reg;
    status_done_next = status_done_reg;

    rd_en_next = 1'b0;

    ctrl_en_next = rd_en_reg;
    ctrl_start_next = 1'b0;
    ctrl_stop_next = 1'b0;
    ctrl_addr_next = addr_reg;

    if (cmd_stop) begin
        len_next = 0;
        rd_en_next = 1'b0;
        ctrl_start_next = 1'b0;
        cmd_ready_next = 1'b1;
    end
    else if (cmd_ready_reg && cmd_valid) begin
        addr_next = cmd_addr;
        len_next = cmd_len;
        rd_en_next = 1'b1;
        ctrl_start_next = 1'b1;
        cmd_ready_next = 1'b0;
    end
    // read data
    else if (len_reg > 1) begin
        addr_next = addr_reg + 1;
        len_next = len_reg - 1;
        rd_en_next = 1'b1;
    end else begin
        cmd_ready_next = 1'b1;
    end

    ctrl_stop_next = (rd_en_reg && !rd_en_next) | cmd_stop;

    re_data_next = re_data_reg;
    re_reset_next = 1'b0;

    // handle read data
    if (ctrl_en_reg) begin
        if (!ctrl_addr_reg[LINE_ADDR_BITS]) begin
            re_data_next = acc_rd_data_b1[(ctrl_addr_reg[LINE_ADDR_BITS-1:0]*8)+(PMEM_SEL_BITS > 0 ? addr_reg[LINE_ADDR_BITS+1+ACC_ADDR_WIDTH +: PMEM_SEL_BITS_MIN1]*DATA_WIDTH : 0) +: 8];
        end else begin
            re_data_next = acc_rd_data_b2[(ctrl_addr_reg[LINE_ADDR_BITS-1:0]*8)+(PMEM_SEL_BITS > 0 ? addr_reg[LINE_ADDR_BITS+1+ACC_ADDR_WIDTH +: PMEM_SEL_BITS_MIN1]*DATA_WIDTH : 0) +: 8];
        end

        status_match_next = status_match_reg | re_match;
    end
    if (ctrl_stop_reg) begin
        status_done_next = 1'b1;
        re_reset_next = 1'b1;
    end
    if (ctrl_start_reg) begin
        status_match_next = 1'b0;
        status_done_next = 1'b0;
        re_reset_next = 1'b1;
    end

end

always @(posedge clk) begin
    addr_reg <= addr_next;
    len_reg <= len_next;

    cmd_ready_reg <= cmd_ready_next;

    status_match_reg <= status_match_next;
    status_done_reg <= status_done_next;

    rd_en_reg <= rd_en_next;

    ctrl_en_reg <= ctrl_en_next;
    ctrl_start_reg <= ctrl_start_next;
    ctrl_stop_reg <= ctrl_stop_next;
    ctrl_addr_reg <= ctrl_addr_next;

    re_data_reg <= re_data_next;
    re_reset_reg <= re_reset_next;

    if (rst) begin
        cmd_ready_reg <= 1'b0;

        status_match_reg <= 1'b0;
        status_done_reg <= 1'b0;

        rd_en_reg <= 1'b0;

        ctrl_en_reg <= 1'b0;
        ctrl_start_reg <= 1'b0;
        ctrl_stop_reg <= 1'b0;
    end
end

endmodule
