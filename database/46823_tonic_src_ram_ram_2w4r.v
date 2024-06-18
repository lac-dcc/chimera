// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

// Description:
// 2 write / 4 read port memory
// Made out of two 2w/2r memory

`timescale 1ns/1ns

module ram_2w4r #(
    parameter   RAM_TYPE        = -1,
    parameter   RAM_DEPTH       = -1,
    parameter   RAM_ADDR_WIDTH  = -1,
    parameter   RAM_DATA_WIDTH  = -1
)(
    input                           clk,
    input                           rst_n,

    input                           r0_val,
    input   [RAM_ADDR_WIDTH-1:0]    r0_addr,
    output  [RAM_DATA_WIDTH-1:0]    r0_data,

    input                           r1_val,
    input   [RAM_ADDR_WIDTH-1:0]    r1_addr,
    output  [RAM_DATA_WIDTH-1:0]    r1_data,

    input                           r2_val,
    input   [RAM_ADDR_WIDTH-1:0]    r2_addr,
    output  [RAM_DATA_WIDTH-1:0]    r2_data,

    input                           r3_val,
    input   [RAM_ADDR_WIDTH-1:0]    r3_addr,
    output  [RAM_DATA_WIDTH-1:0]    r3_data,

    input                           w0_val,
    input   [RAM_ADDR_WIDTH-1:0]    w0_addr,
    input   [RAM_DATA_WIDTH-1:0]    w0_data,

    input                           w1_val,
    input   [RAM_ADDR_WIDTH-1:0]    w1_addr,
    input   [RAM_DATA_WIDTH-1:0]    w1_data    
);

ram_2w2r #(
    .RAM_TYPE       (RAM_TYPE       ),
    .RAM_DEPTH      (RAM_DEPTH      ),
    .RAM_ADDR_WIDTH (RAM_ADDR_WIDTH ),
    .RAM_DATA_WIDTH (RAM_DATA_WIDTH )
) mem0              (
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .r0_val         (r0_val         ),
    .r0_addr        (r0_addr        ),
    .r0_data        (r0_data        ),
    .r1_val         (r1_val         ),
    .r1_addr        (r1_addr        ),
    .r1_data        (r1_data        ),
    .w0_val         (w0_val         ),
    .w0_addr        (w0_addr        ),
    .w0_data        (w0_data        ),
    .w1_val         (w1_val         ),
    .w1_addr        (w1_addr        ),
    .w1_data        (w1_data        )
);

ram_2w2r #(
    .RAM_TYPE       (RAM_TYPE       ),
    .RAM_DEPTH      (RAM_DEPTH      ),
    .RAM_ADDR_WIDTH (RAM_ADDR_WIDTH ),
    .RAM_DATA_WIDTH (RAM_DATA_WIDTH )
) mem1              (
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .r0_val         (r2_val         ),
    .r0_addr        (r2_addr        ),
    .r0_data        (r2_data        ),
    .r1_val         (r3_val         ),
    .r1_addr        (r3_addr        ),
    .r1_data        (r3_data        ),
    .w0_val         (w0_val         ),
    .w0_addr        (w0_addr        ),
    .w0_data        (w0_data        ),
    .w1_val         (w1_val         ),
    .w1_addr        (w1_addr        ),
    .w1_data        (w1_data        )
);

endmodule
