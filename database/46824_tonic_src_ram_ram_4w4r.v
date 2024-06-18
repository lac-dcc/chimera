// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

// Description:
// Memory with 4 write / 4 read ports
// Read latency: 1 cycle

`timescale 1ns/1ns

module ram_4w4r #(
    parameter   RAM_TYPE        = -1,
    parameter   RAM_DEPTH       = -1,
    parameter   RAM_ADDR_WIDTH  = -1,
    parameter   RAM_DATA_WIDTH  = -1
)(
    input                               clk,
    input                               rst_n,

    input                               r0_val,
    input       [RAM_ADDR_WIDTH-1:0]    r0_addr,
    output      [RAM_DATA_WIDTH-1:0]    r0_data,

    input                               r1_val,
    input       [RAM_ADDR_WIDTH-1:0]    r1_addr,
    output      [RAM_DATA_WIDTH-1:0]    r1_data,

    input                               r2_val,
    input       [RAM_ADDR_WIDTH-1:0]    r2_addr,
    output      [RAM_DATA_WIDTH-1:0]    r2_data,

    input                               r3_val,
    input       [RAM_ADDR_WIDTH-1:0]    r3_addr,
    output      [RAM_DATA_WIDTH-1:0]    r3_data,

    input                               w0_val,
    input       [RAM_ADDR_WIDTH-1:0]    w0_addr,
    input       [RAM_DATA_WIDTH-1:0]    w0_data,

    input                               w1_val,
    input       [RAM_ADDR_WIDTH-1:0]    w1_addr,
    input       [RAM_DATA_WIDTH-1:0]    w1_data,

    input                               w2_val,
    input       [RAM_ADDR_WIDTH-1:0]    w2_addr,
    input       [RAM_DATA_WIDTH-1:0]    w2_data,

    input                               w3_val,
    input       [RAM_ADDR_WIDTH-1:0]    w3_addr,
    input       [RAM_DATA_WIDTH-1:0]    w3_data
);

reg     [RAM_DEPTH-1:0]     mrb;
reg                         r0_mrb_f;
reg                         r1_mrb_f;
reg                         r2_mrb_f;
reg                         r3_mrb_f;

wire                            b0r0_val;
wire    [RAM_ADDR_WIDTH-1:0]    b0r0_addr;
wire    [RAM_DATA_WIDTH-1:0]    b0r0_data;
wire                            b0r1_val;
wire    [RAM_ADDR_WIDTH-1:0]    b0r1_addr;
wire    [RAM_DATA_WIDTH-1:0]    b0r1_data;
wire                            b0r2_val;
wire    [RAM_ADDR_WIDTH-1:0]    b0r2_addr;
wire    [RAM_DATA_WIDTH-1:0]    b0r2_data;
wire                            b0r3_val;
wire    [RAM_ADDR_WIDTH-1:0]    b0r3_addr;
wire    [RAM_DATA_WIDTH-1:0]    b0r3_data;
wire                            b0w0_val;
wire    [RAM_ADDR_WIDTH-1:0]    b0w0_addr;
wire    [RAM_DATA_WIDTH-1:0]    b0w0_data;
wire                            b0w1_val;
wire    [RAM_ADDR_WIDTH-1:0]    b0w1_addr;
wire    [RAM_DATA_WIDTH-1:0]    b0w1_data;

wire                            b1r0_val;
wire    [RAM_ADDR_WIDTH-1:0]    b1r0_addr;
wire    [RAM_DATA_WIDTH-1:0]    b1r0_data;
wire                            b1r1_val;
wire    [RAM_ADDR_WIDTH-1:0]    b1r1_addr;
wire    [RAM_DATA_WIDTH-1:0]    b1r1_data;
wire                            b1r2_val;
wire    [RAM_ADDR_WIDTH-1:0]    b1r2_addr;
wire    [RAM_DATA_WIDTH-1:0]    b1r2_data;
wire                            b1r3_val;
wire    [RAM_ADDR_WIDTH-1:0]    b1r3_addr;
wire    [RAM_DATA_WIDTH-1:0]    b1r3_data;
wire                            b1w0_val;
wire    [RAM_ADDR_WIDTH-1:0]    b1w0_addr;
wire    [RAM_DATA_WIDTH-1:0]    b1w0_data;
wire                            b1w1_val;
wire    [RAM_ADDR_WIDTH-1:0]    b1w1_addr;
wire    [RAM_DATA_WIDTH-1:0]    b1w1_data;

genvar ii;

//-----------------------------------------------------------
// Logic
//-----------------------------------------------------------
assign b0r0_val     = r0_val;
assign b0r0_addr    = r0_addr;
assign b0r1_val     = r1_val;
assign b0r1_addr    = r1_addr;
assign b0r2_val     = r2_val;
assign b0r2_addr    = r2_addr;
assign b0r3_val     = r3_val;
assign b0r3_addr    = r3_addr;
assign b0w0_val     = w0_val;
assign b0w0_addr    = w0_addr;
assign b0w0_data    = w0_data;
assign b0w1_val     = w1_val;
assign b0w1_addr    = w1_addr;
assign b0w1_data    = w1_data;

assign b1r0_val     = r0_val;
assign b1r0_addr    = r0_addr;
assign b1r1_val     = r1_val;
assign b1r1_addr    = r1_addr;
assign b1r2_val     = r2_val;
assign b1r2_addr    = r2_addr;
assign b1r3_val     = r3_val;
assign b1r3_addr    = r3_addr;
assign b1w0_val     = w2_val;
assign b1w0_addr    = w2_addr;
assign b1w0_data    = w2_data;
assign b1w1_val     = w3_val;
assign b1w1_addr    = w3_addr;
assign b1w1_data    = w3_data;

assign r0_data  = ~r0_mrb_f ? b0r0_data : b1r0_data;
assign r1_data  = ~r1_mrb_f ? b0r1_data : b1r1_data;
assign r2_data  = ~r2_mrb_f ? b0r2_data : b1r2_data;
assign r3_data  = ~r3_mrb_f ? b0r3_data : b1r3_data;

generate 
    for (ii = 0; ii < RAM_DEPTH; ii = ii + 1) begin: mrb_gen
        always @(posedge clk) begin
            if (~rst_n) begin
                mrb[ii] <= 1'b0;
            end
            else begin
                // TODO: change to parallel logic?
                mrb[ii] <= (w0_val & (ii == w0_addr)) |
                           (w1_val & (ii == w1_addr))   ? 1'b0 :
                           (w2_val & (ii == w2_addr)) |
                           (w3_val & (ii == w3_addr))   ? 1'b1 : mrb[ii];
            end
        end
    end
endgenerate

always @(posedge clk) begin
    r0_mrb_f <= mrb[r0_addr];
    r1_mrb_f <= mrb[r1_addr];
    r2_mrb_f <= mrb[r2_addr];
    r3_mrb_f <= mrb[r3_addr];
end

ram_2w4r    #(
    .RAM_TYPE       (RAM_TYPE       ),
    .RAM_DEPTH      (RAM_DEPTH      ),
    .RAM_ADDR_WIDTH (RAM_ADDR_WIDTH ),
    .RAM_DATA_WIDTH (RAM_DATA_WIDTH )
)   bank0           (
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .r0_val         (b0r0_val       ),
    .r0_addr        (b0r0_addr      ),
    .r0_data        (b0r0_data      ),
    .r1_val         (b0r1_val       ),
    .r1_addr        (b0r1_addr      ),
    .r1_data        (b0r1_data      ),
    .r2_val         (b0r2_val       ),
    .r2_addr        (b0r2_addr      ),
    .r2_data        (b0r2_data      ),
    .r3_val         (b0r3_val       ),
    .r3_addr        (b0r3_addr      ),
    .r3_data        (b0r3_data      ),
    .w0_val         (b0w0_val       ),
    .w0_addr        (b0w0_addr      ),
    .w0_data        (b0w0_data      ),
    .w1_val         (b0w1_val       ),
    .w1_addr        (b0w1_addr      ),
    .w1_data        (b0w1_data      )    
);

ram_2w4r    #(
    .RAM_TYPE       (RAM_TYPE       ),
    .RAM_DEPTH      (RAM_DEPTH      ),
    .RAM_ADDR_WIDTH (RAM_ADDR_WIDTH ),
    .RAM_DATA_WIDTH (RAM_DATA_WIDTH )
)   bank1           (
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .r0_val         (b1r0_val       ),
    .r0_addr        (b1r0_addr      ),
    .r0_data        (b1r0_data      ),
    .r1_val         (b1r1_val       ),
    .r1_addr        (b1r1_addr      ),
    .r1_data        (b1r1_data      ),
    .r2_val         (b1r2_val       ),
    .r2_addr        (b1r2_addr      ),
    .r2_data        (b1r2_data      ),
    .r3_val         (b1r3_val       ),
    .r3_addr        (b1r3_addr      ),
    .r3_data        (b1r3_data      ),
    .w0_val         (b1w0_val       ),
    .w0_addr        (b1w0_addr      ),
    .w0_data        (b1w0_data      ),
    .w1_val         (b1w1_val       ),
    .w1_addr        (b1w1_addr      ),
    .w1_data        (b1w1_data      )    
);

//-----------------------------------------------------------
// Checker
//-----------------------------------------------------------

`ifdef RAM_CHECKER

// No concurrent read/write or write/write to the same address
always @(posedge clk) begin
    check_collision(w0_val, w0_addr, w1_val, w1_addr);
    check_collision(w0_val, w0_addr, w2_val, w2_addr);
    check_collision(w0_val, w0_addr, w3_val, w3_addr);
    check_collision(w1_val, w1_addr, w2_val, w2_addr);
    check_collision(w1_val, w1_addr, w3_val, w3_addr);
    check_collision(w2_val, w2_addr, w3_val, w3_addr);
end

task check_collision;
input                           p0_val;
input   [RAM_ADDR_WIDTH-1:0]    p0_addr;
input                           p1_val;
input   [RAM_ADDR_WIDTH-1:0]    p1_addr;
begin
    if (p0_val & p1_val & (p0_addr == p1_addr)) begin
        $display("ERROR Checker: %m: Collission at address 0x%h at @%t. No ordering is guaranteed!", p0_addr, $time);
        $stop;
    end
end
endtask

`endif  // RAM_CHECKER


endmodule
