// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

`ifndef _MEM_MODEL_
`define _MEM_MODEL_

`timescale 1 ns / 1 ns

module mem_model # (
    parameter FAMILY           = "LIFCL",
    parameter ADDR_DEPTH_A     = 16384,
    parameter DATA_WIDTH_A     = 32,
    parameter ADDR_DEPTH_B     = 16384,
    parameter DATA_WIDTH_B     = 32,
    parameter REGMODE_A        = "reg",
    parameter REGMODE_B        = "reg",
    parameter RESETMODE        = "sync",
    parameter RESET_RELEASE    = "sync",
    parameter BYTE_ENABLE_A    = 0,
    parameter BYTE_ENABLE_B    = 0,
    parameter WRITE_MODE_A     = "normal",
    parameter WRITE_MODE_B     = "normal",
    parameter UNALIGNED_READ   = 0,
    parameter INIT_MODE        = "none",
    parameter INIT_FILE        = "none",
    parameter INIT_FILE_FORMAT = "hex",
    parameter ADDR_WIDTH_A     = clog2(ADDR_DEPTH_A),
    parameter ADDR_WIDTH_B     = clog2(ADDR_DEPTH_B),
    parameter BYTE_WIDTH_A     = roundUP(DATA_WIDTH_A, 8),
    parameter BYTE_WIDTH_B     = roundUP(DATA_WIDTH_B, 8),
    parameter BYTE_POL         = 1'b0
)(
// --------------------------
// ----- Common Signals -----
// --------------------------
    input                         clk_a_i,
    input                         clk_b_i,
// --------------------------
// ----- Port A signals -----
// --------------------------
    input                         rst_a_i,
    input                         clk_en_a_i,
    input                         rdout_clken_a_i,
    input                         wr_en_a_i,
    input [DATA_WIDTH_A-1:0]      wr_data_a_i,
    input [ADDR_WIDTH_A-1:0]      addr_a_i,
    input [BYTE_WIDTH_A-1:0]      ben_a_i,

    output reg [DATA_WIDTH_A-1:0] rd_data_a_o,

// --------------------------
// ----- Port B signals -----
// --------------------------

    input                         rst_b_i,
    input                         clk_en_b_i,
    input                         rdout_clken_b_i,
    input                         wr_en_b_i,
    input [DATA_WIDTH_B-1:0]      wr_data_b_i,
    input [ADDR_WIDTH_B-1:0]      addr_b_i,
    input [BYTE_WIDTH_B-1:0]      ben_b_i,

    output reg [DATA_WIDTH_B-1:0] rd_data_b_o
);

reg [DATA_WIDTH_A-1:0] mem [ADDR_DEPTH_A-1:0];

integer i0, i1;
initial begin
    if(REGMODE_B == "reg") rd_data_b_o = {DATA_WIDTH_B{1'b0}};
    if(REGMODE_A == "reg") rd_data_a_o = {DATA_WIDTH_A{1'b0}};
end

initial begin
    if(INIT_MODE == "mem_file") begin
        if(INIT_FILE_FORMAT == "bin" || INIT_FILE_FORMAT == "binary") begin
            $readmemb(INIT_FILE, mem, 0, ADDR_DEPTH_A-1);
        end
        else begin
            $readmemh(INIT_FILE, mem, 0, ADDR_DEPTH_A-1);
        end
    end
    else begin
        for(i0 = 0; i0 < (2 ** ADDR_WIDTH_A); i0 = i0 + 1) begin
            mem[i0] = (INIT_MODE == "all_one") ? {DATA_WIDTH_A{1'b1}} : {DATA_WIDTH_A{1'b0}};
        end
    end
end

genvar ben0, split0;
if(DATA_WIDTH_A == DATA_WIDTH_B) begin : A_EQ_B
    /*
     *    WRITING AT PORT A
     */

    if(BYTE_ENABLE_A == 0) begin : _BEN_A_DIS
        always @ (posedge clk_a_i) begin
            if(wr_en_a_i & clk_en_a_i) begin
                mem[addr_a_i] <= wr_data_a_i;
            end
        end
    end
    else begin : _BEN_A_EN
        wire [7:0] act_wr_data_a [BYTE_WIDTH_A-1:0];
        wire [DATA_WIDTH_A-1:0] pref_data_a;
        assign pref_data_a = mem[addr_a_i];
        for(ben0 = 0; ben0 < BYTE_WIDTH_A; ben0 = ben0 + 1) begin
            assign act_wr_data_a[ben0] = (ben_a_i[ben0] == BYTE_POL) ? wr_data_a_i[ben0*8 +: 8] : pref_data_a[ben0*8 +: 8];
        end
        wire [DATA_WIDTH_A-1:0] wr_data_a_t;
        for(ben0 = 0; ben0 < BYTE_WIDTH_A; ben0 = ben0 + 1) begin
            assign wr_data_a_t [ben0*8 +: 8] = act_wr_data_a[ben0];
        end
        always @ (posedge clk_a_i) begin
            if(wr_en_a_i & clk_en_a_i) begin
                mem[addr_a_i] <= wr_data_a_t;
            end
        end
    end

    /*
     *    WRITING AT PORT B
     */

    if(BYTE_ENABLE_B == 0) begin : _BEN_B_DIS
        always @ (posedge clk_b_i) begin
            if(wr_en_b_i & clk_en_b_i) begin
                mem[addr_b_i] <= wr_data_b_i;
            end
        end
    end
    else begin : _BEN_B_EN
        wire [7:0] act_wr_data_b [BYTE_WIDTH_B-1:0];
        wire [DATA_WIDTH_B-1:0] pref_data_b;
        assign pref_data_b = mem[addr_b_i];
        for(ben0 = 0; ben0 < BYTE_WIDTH_B; ben0 = ben0 + 1) begin
            assign act_wr_data_b[ben0] = (ben_b_i[ben0] == BYTE_POL) ? wr_data_b_i[ben0*8 +: 8] : pref_data_b[ben0*8 +: 8];
        end
        wire [DATA_WIDTH_B-1:0] wr_data_b_t;
        for(ben0 = 0; ben0 < BYTE_WIDTH_B; ben0 = ben0 + 1) begin
            assign wr_data_b_t[ben0*8 +: 8] = act_wr_data_b[ben0];
        end

        always @ (posedge clk_b_i) begin
            if(wr_en_b_i & clk_en_b_i) begin
                mem[addr_b_i] <= wr_data_b_t;
            end
        end
    end

    /*
     *    READING AT PORT A
     */

    wire [DATA_WIDTH_A-1:0] out_mem_raw_a = (addr_a_i >= ADDR_DEPTH_A) ? {DATA_WIDTH_A{(INIT_MODE == "all_one") ? 1'b1 : 1'b0}} : mem[addr_a_i];
    reg [DATA_WIDTH_A-1:0] data_out_buff_a = {DATA_WIDTH_A{(INIT_MODE == "all_one") ? 1'b1 : 1'b0}};

    if(WRITE_MODE_A == "read-before-write") begin : _RBW
        always @ (posedge clk_a_i) begin 
            if(clk_en_a_i) begin
                data_out_buff_a <= out_mem_raw_a;
            end
        end
    end
    else begin
        always @ (posedge clk_a_i) begin : _NORM
            if(~wr_en_a_i & clk_en_a_i) begin
                data_out_buff_a <= out_mem_raw_a;
            end
        end
    end

    if(REGMODE_A == "noreg") begin
        always @ (*) begin
            rd_data_a_o = data_out_buff_a;
        end
    end
    else begin
        always @ (posedge clk_a_i) begin
            if(rdout_clken_a_i) begin
                rd_data_a_o <= data_out_buff_a;
            end
        end
    end

    /*
     *    READING AT PORT B
     */

    wire [DATA_WIDTH_B-1:0] out_mem_raw_b = (addr_b_i >= ADDR_DEPTH_B) ? {DATA_WIDTH_A{(INIT_MODE == "all_one") ? 1'b1 : 1'b0}} : mem[addr_b_i];
    reg [DATA_WIDTH_B-1:0] data_out_buff_b = {DATA_WIDTH_A{(INIT_MODE == "all_one") ? 1'b1 : 1'b0}};
    always @ (posedge clk_b_i) begin
        if(~wr_en_b_i & clk_en_b_i) begin
            data_out_buff_b <= out_mem_raw_b;
        end
    end

    if(REGMODE_B == "noreg") begin
        always @ (*) begin
            rd_data_b_o = data_out_buff_b;
        end
    end
    else begin
        always @ (posedge clk_b_i) begin
            if(rdout_clken_b_i) begin
                rd_data_b_o <= data_out_buff_b;
            end
        end
    end
end
else if (DATA_WIDTH_A > DATA_WIDTH_B) begin : A_GR_B
    /*
     *    WRITING AT PORT A
     */
    if(BYTE_ENABLE_A == 0) begin
        always @ (posedge clk_a_i) begin
            if(wr_en_a_i & clk_en_a_i) begin
                mem[addr_a_i] <= wr_data_a_i;
            end
        end
    end
    else begin
        wire [DATA_WIDTH_A-1:0] pref_data_a;
        assign pref_data_a = mem[addr_a_i];
        wire [DATA_WIDTH_A-1:0] wr_data_a_t;
        for(ben0 = 0; ben0 < BYTE_WIDTH_A; ben0 = ben0 + 1) begin
            assign wr_data_a_t[ben0*8 +: 8] = (ben_a_i[ben0] == BYTE_POL) ? wr_data_a_i[ben0*8 +: 8] : 
                                                                            pref_data_a[ben0*8 +: 8];
        end

        always @ (posedge clk_a_i) begin
            if(wr_en_a_i & clk_en_a_i) begin
                mem[addr_a_i] <= wr_data_a_t;
            end
        end
    end
    /*
     *    WRITING AT PORT B
     */
    wire [ADDR_WIDTH_A-1:0] addr_a_eq_wr_w = addr_b_i[ADDR_WIDTH_B-1:(ADDR_WIDTH_B-ADDR_WIDTH_A)];
    wire [ADDR_WIDTH_B-(ADDR_WIDTH_A+1):0] addr_excess_b = addr_b_i[ADDR_WIDTH_B-(ADDR_WIDTH_A+1):0];
    wire [DATA_WIDTH_A-1:0] data_a_eq_wr_w = mem[addr_a_eq_wr_w];
    wire [DATA_WIDTH_A-1:0] wr_data_b_t;
    if(BYTE_ENABLE_B == 0) begin
        for(split0 = 0; split0 < 2**(ADDR_WIDTH_B-ADDR_WIDTH_A); split0 = split0 + 1) begin
            assign wr_data_b_t[split0*DATA_WIDTH_B +: DATA_WIDTH_B] = (addr_excess_b == split0) ? wr_data_b_i :
                                                                                                  data_a_eq_wr_w[split0*DATA_WIDTH_B +: DATA_WIDTH_B];
        end
    end
    else begin
        for(split0 = 0; split0 < 2**(ADDR_WIDTH_B-ADDR_WIDTH_A); split0 = split0 + 1) begin
            for(ben0 = 0; ben0 < BYTE_WIDTH_B; ben0 = ben0 + 1) begin
                assign wr_data_b_t[split0*DATA_WIDTH_B+ben0*8 +: 8] = ((addr_excess_b == split0) && (ben_b_i[ben0] == BYTE_POL)) ? wr_data_b_i[ben0*8 +: 8] : 
                                                                                                                                   data_a_eq_wr_w[split0*DATA_WIDTH_B+ben0*8 +: 8];
            end
        end
    end

    always @ (posedge clk_b_i) begin
        if(wr_en_b_i & clk_en_b_i) begin
            mem[addr_a_eq_wr_w] <= wr_data_b_t;
        end
    end

    /*
     *    READING AT PORT A
     */
    wire [DATA_WIDTH_A-1:0] out_mem_raw_a = mem[addr_a_i];
    reg [DATA_WIDTH_A-1:0] data_out_buff_a = {DATA_WIDTH_A{1'b0}};
    always @ (posedge clk_a_i) begin
        if(~wr_en_a_i & clk_en_a_i) begin
            data_out_buff_a <= out_mem_raw_a;
        end
    end
    if(REGMODE_A == "noreg") begin
        always @ (*) begin
            rd_data_a_o = data_out_buff_a;
        end
    end
    else begin
        always @ (posedge clk_a_i) begin
            if(rdout_clken_a_i) begin
                rd_data_a_o <= data_out_buff_a;
            end
        end
    end
    /*
     *    READING AT PORT B
     */
    wire [DATA_WIDTH_A-1:0] out_mem_adj_b = data_a_eq_wr_w >> (DATA_WIDTH_B*addr_excess_b);
    wire [DATA_WIDTH_B-1:0] out_mem_raw_b  = out_mem_adj_b[DATA_WIDTH_B-1:0];
    reg [DATA_WIDTH_B-1:0] data_out_buff_b = {DATA_WIDTH_B{1'b0}};
    always @ (posedge clk_b_i) begin
        if(~wr_en_b_i & clk_en_b_i) begin
            data_out_buff_b <= out_mem_raw_b;
        end
    end
    if(REGMODE_B == "noreg") begin
        always @ (*) begin
            rd_data_b_o = data_out_buff_b;
        end
    end
    else begin
        always @ (posedge clk_b_i) begin
            if(rdout_clken_b_i) begin
                rd_data_b_o <= data_out_buff_b;
            end
        end
    end
end
else begin : A_LT_B
    /*
     *    WRITING AT PORT A
     */
    if(BYTE_ENABLE_A == 0) begin
        always @ (posedge clk_a_i) begin
            if(wr_en_a_i & clk_en_a_i) begin
                mem[addr_a_i] <= wr_data_a_i;
            end
        end
    end
    else begin
        wire [DATA_WIDTH_A-1:0] pref_data_a;
        assign pref_data_a = mem[addr_a_i];
        wire [DATA_WIDTH_A-1:0] wr_data_a_t;
        for(ben0 = 0; ben0 < BYTE_WIDTH_A; ben0 = ben0 + 1) begin
            assign wr_data_a_t[ben0*8 +: 8] = (ben_a_i[ben0] == BYTE_POL) ? wr_data_a_i[ben0*8 +: 8] : 
                                                                            pref_data_a[ben0*8 +: 8];
        end

        always @ (posedge clk_a_i) begin
            if(wr_en_a_i & clk_en_a_i) begin
                mem[addr_a_i] <= wr_data_a_t;
            end
        end
    end

    /*
     *    WRITING AT PORT B
     */
    localparam W_FACTOR = DATA_WIDTH_B/DATA_WIDTH_A;
    wire [ADDR_WIDTH_A-1:0] addr_a_eq_wr_w;
    assign addr_a_eq_wr_w[ADDR_WIDTH_A-1:(ADDR_WIDTH_A-ADDR_WIDTH_B)] = addr_b_i;
    assign addr_a_eq_wr_w[ADDR_WIDTH_A-(ADDR_WIDTH_B+1):0] = {(ADDR_WIDTH_A-ADDR_WIDTH_B){1'b0}};
    if(BYTE_ENABLE_B == 0) begin
        for(split0 = 0; split0 < W_FACTOR; split0 = split0 + 1) begin
            always @ (posedge clk_b_i) begin
                if(wr_en_b_i & clk_en_b_i) begin
                    mem[addr_a_eq_wr_w + split0] <= wr_data_b_i[DATA_WIDTH_A*split0 +: DATA_WIDTH_A];
                end
            end
        end
    end
    else begin
        localparam EQUIV_BENLEN_B = DATA_WIDTH_B/8;
        wire [DATA_WIDTH_B-1:0] old_data_b_w;
        wire [DATA_WIDTH_B-1:0] ben_force_w;
        wire [DATA_WIDTH_B-1:0] towrite_w;
        for(ben0 = 0; ben0 < EQUIV_BENLEN_B; ben0 = ben0 + 1) begin
            assign ben_force_w[ben0*8 +: 8] = {8{ben_b_i[ben0]}};
        end
        for(split0 = 0; split0 < W_FACTOR; split0 = split0 + 1) begin
            assign old_data_b_w [DATA_WIDTH_A*split0 +: DATA_WIDTH_A] = mem[addr_a_eq_wr_w + split0];
            always @ (posedge clk_b_i) begin
                if(wr_en_b_i & clk_en_b_i) begin
                    mem[addr_a_eq_wr_w + split0] <= towrite_w[DATA_WIDTH_A*split0 +: DATA_WIDTH_A];
                end
            end
        end
        for(split0 = 0; split0 < DATA_WIDTH_B; split0 = split0 + 1) begin
            assign towrite_w[split0] = (ben_force_w[split0] == BYTE_POL) ? wr_data_b_i[split0] : old_data_b_w[split0];
        end
    end

    /*
     *    READING AT PORT A
     */
    wire [DATA_WIDTH_A-1:0] out_mem_raw_a = mem[addr_a_i];
    reg [DATA_WIDTH_A-1:0] data_out_buff_a = {DATA_WIDTH_A{1'b0}};
    always @ (posedge clk_a_i) begin
        if(~wr_en_a_i & clk_en_a_i) begin
            data_out_buff_a <= out_mem_raw_a;
        end
    end
    if(REGMODE_A == "noreg") begin
        always @ (*) begin
            rd_data_a_o = data_out_buff_a;
        end
    end
    else begin
        always @ (posedge clk_a_i) begin
            if(rdout_clken_a_i) begin
                rd_data_a_o <= data_out_buff_a;
            end
        end
    end

    /*
     *    READING AT PORT B
     */
    wire [DATA_WIDTH_B-1:0] out_mem_raw_b;
    for(split0 = 0; split0 < W_FACTOR; split0 = split0 + 1) begin
        assign out_mem_raw_b[DATA_WIDTH_A*split0 +: DATA_WIDTH_A] = mem[addr_a_eq_wr_w + split0];
    end
    reg [DATA_WIDTH_B-1:0] data_out_buff_b = {DATA_WIDTH_B{1'b0}};
    always @ (posedge clk_b_i) begin
        if(~wr_en_b_i & clk_en_b_i) begin
            data_out_buff_b <= out_mem_raw_b;
        end
    end
    if(REGMODE_B == "noreg") begin
        always @ (*) begin
            rd_data_b_o = data_out_buff_b;
        end
    end
    else begin
        always @ (posedge clk_b_i) begin
            if(rdout_clken_b_i) begin
                rd_data_b_o <= data_out_buff_b;
            end
        end
    end
end

function [31:0] roundUP;
    input [31:0] dividend;
    input [31:0] divisor;
    begin
        if(divisor == 1) begin
            roundUP = dividend;
        end
        else if(dividend <= divisor) begin
            roundUP = 1;
        end
        else begin
            roundUP = dividend/divisor + (((dividend % divisor) == 0) ? 0 : 1);
        end
    end
endfunction

function [31:0] clog2;
    input [31:0] value;
    reg   [31:0] num;
    begin
        num = value - 1;
        for (clog2=0; num>0; clog2=clog2+1) num = num>>1;
    end
endfunction

endmodule
`endif