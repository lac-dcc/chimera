// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

// Description:
// In case of conflicting R/W to the same address returns data from a write
// Doesn't guarantee any ordering between two writes to the same address

`timescale 1ns/1ns

module ram_2w2r #(
    parameter   RAM_TYPE        = -1,
    parameter   RAM_DEPTH       = -1,
    parameter   RAM_ADDR_WIDTH  = -1,
    parameter   RAM_DATA_WIDTH  = -1
) (
    input                           clk,
    input                           rst_n,

    input                           r0_val,
    input   [RAM_ADDR_WIDTH-1:0]    r0_addr,
    output  [RAM_DATA_WIDTH-1:0]    r0_data,

    input                           r1_val,
    input   [RAM_ADDR_WIDTH-1:0]    r1_addr,
    output  [RAM_DATA_WIDTH-1:0]    r1_data,

    input                           w0_val,
    input   [RAM_ADDR_WIDTH-1:0]    w0_addr,
    input   [RAM_DATA_WIDTH-1:0]    w0_data,

    input                           w1_val,
    input   [RAM_ADDR_WIDTH-1:0]    w1_addr,
    input   [RAM_DATA_WIDTH-1:0]    w1_data
);
// MRB - most recent bank storage for every address
reg     [RAM_DEPTH-1:0]         mrb;
reg                             r0_mrb_f;
reg                             r1_mrb_f;

wire                            r0_mrb;
wire                            r1_mrb;
wire                            w0_bank;
wire                            w1_bank;

wire                            b0_ena;
wire                            b0_wea;
wire    [RAM_ADDR_WIDTH-1:0]    b0_addra;
wire    [RAM_DATA_WIDTH-1:0]    b0_dina;
wire    [RAM_DATA_WIDTH-1:0]    b0_douta;
wire                            b0_enb;
wire                            b0_web;
wire    [RAM_ADDR_WIDTH-1:0]    b0_addrb;
wire    [RAM_DATA_WIDTH-1:0]    b0_dinb;
wire    [RAM_DATA_WIDTH-1:0]    b0_doutb;
wire                            b1_ena;
wire                            b1_wea;
wire    [RAM_ADDR_WIDTH-1:0]    b1_addra;
wire    [RAM_DATA_WIDTH-1:0]    b1_dina;
wire    [RAM_DATA_WIDTH-1:0]    b1_douta;
wire                            b1_enb;
wire                            b1_web;
wire    [RAM_ADDR_WIDTH-1:0]    b1_addrb;
wire    [RAM_DATA_WIDTH-1:0]    b1_dinb;
wire    [RAM_DATA_WIDTH-1:0]    b1_doutb;

genvar ii;

//-----------------------------------------------------------
// Logic
//-----------------------------------------------------------
assign r0_mrb = mrb[r0_addr];
assign r1_mrb = mrb[r1_addr];
// write data to bank 1 only if there is a read from bank 0
assign w0_bank = r0_val & ~r0_mrb;
assign w1_bank = r1_val & ~r1_mrb;

// Bank 0 Port a
assign b0_ena   = (r0_val & ~r0_mrb) | (w0_val & ~w0_bank);
assign b0_wea   = w0_val & ~w0_bank;
assign b0_addra = (r0_val & ~r0_mrb) ? r0_addr : w0_addr;
assign b0_dina  = w0_data;
// Bank 0 Port b
assign b0_enb   = (r1_val & ~r1_mrb) | (w1_val & ~w1_bank);
assign b0_web   = w1_val & ~w1_bank;
assign b0_addrb = (r1_val & ~r1_mrb) ? r1_addr : w1_addr;
assign b0_dinb  = w1_data;

// Bank 1 Port a
assign b1_ena   = (r0_val & r0_mrb) | (w0_val & w0_bank);
assign b1_wea   = w0_val & w0_bank;
assign b1_addra = (r0_val & r0_mrb) ? r0_addr : w0_addr;
assign b1_dina  = w0_data;
// Bank 1 Port b
assign b1_enb   = (r1_val & r1_mrb) | (w1_val & w1_bank);
assign b1_web   = w1_val & w1_bank;
assign b1_addrb = (r1_val & r1_mrb) ? r1_addr : w1_addr;
assign b1_dinb  = w1_data;

assign r0_data  = ~r0_mrb_f ? b0_douta : b1_douta;
assign r1_data  = ~r1_mrb_f ? b0_doutb : b1_doutb;

generate
    for (ii = 0; ii < RAM_DEPTH; ii = ii + 1) begin: mrb_gen
        always @(posedge clk) begin
            if (~rst_n) begin
                mrb[ii] <= 1'b0;
            end
            else begin
                // TODO: change to parallel logic
                mrb[ii] <=  w0_val & (ii == w0_addr) ? w0_bank :
                            w1_val & (ii == w1_addr) ? w1_bank : mrb[ii];
            end
        end
    end
endgenerate

always @(posedge clk) begin
    r0_mrb_f <= r0_mrb;
    r1_mrb_f <= r1_mrb;
end


ram_2p_wrapper  #(
    .RAM_TYPE       (RAM_TYPE       ),
    .RAM_DEPTH      (RAM_DEPTH      ),
    .RAM_ADDR_WIDTH (RAM_ADDR_WIDTH ),
    .RAM_DATA_WIDTH (RAM_DATA_WIDTH )
) bank0     (
    .rst_n      (rst_n              ),
    .clka       (clk                ),
    .ena        (b0_ena             ),
    .wea        (b0_wea             ),
    .addra      (b0_addra           ),
    .dina       (b0_dina            ),
    .douta      (b0_douta           ),
    .clkb       (clk                ),
    .enb        (b0_enb             ),
    .web        (b0_web             ),
    .addrb      (b0_addrb           ),
    .dinb       (b0_dinb            ),
    .doutb      (b0_doutb           ) 
);

ram_2p_wrapper  #(
    .RAM_TYPE       (RAM_TYPE       ),
    .RAM_DEPTH      (RAM_DEPTH      ),
    .RAM_ADDR_WIDTH (RAM_ADDR_WIDTH ),
    .RAM_DATA_WIDTH (RAM_DATA_WIDTH )
) bank1         (
    .rst_n      (rst_n              ),
    .clka       (clk                ),
    .ena        (b1_ena             ),
    .wea        (b1_wea             ),
    .addra      (b1_addra           ),
    .dina       (b1_dina            ),
    .douta      (b1_douta           ),
    .clkb       (clk                ),
    .enb        (b1_enb             ),
    .web        (b1_web             ),
    .addrb      (b1_addrb           ),
    .dinb       (b1_dinb            ),
    .doutb      (b1_doutb           ) 
);

//-----------------------------------------------------------
// Checker
//-----------------------------------------------------------
`ifdef RAM_CHECKER

// No more than one write to the same address
always @(posedge clk) begin
    if (w0_val & w1_val & (w0_addr == w1_addr)) begin
        $display("ERROR Checker: %m: two write to address 0x%h in the same cycle @%t. No particular ordering between writes is guaranteed",  w0_addr, $time);
    $stop;
    end
end

`endif

endmodule
