// This program was cloned from: https://github.com/WangXuan95/FPGA-LZMA-compressor
// License: GNU General Public License v3.0


module lzma_compressor_top (
    input  wire        rstn,
    input  wire        clk,
    // input : raw data stream
    output wire        i_ready,
    input  wire        i_valid,
    input  wire        i_last,
    input  wire [ 7:0] i_data,
    // output : LZMA stream  // Note! need to add an additional 13-byte fixed header before the output stream to make up a complete "LZMA" file format. The 13 bytes are : {0x5E, 0x00, 0x00, 0x02, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}
    output wire        o_valid,
    output wire [ 7:0] o_data,
    output wire        o_last   // end of a LZMA stream
);

    
wire          a_ready;
wire          a_valid;
wire          a_last;
wire   [16:0] a_pos;
wire   [ 2:0] a_type;
wire   [ 7:0] a_byte;
wire   [ 7:0] a_prevbyte;
wire   [ 7:0] a_matchbyte;
wire   [ 8:0] a_len;
wire   [16:0] a_dist;

wire   [ 3:0] a_pos_state     = a_pos[3:0];
wire   [ 8:0] a_len_or_byte   = (a_type==3'd0) ? {1'b0, a_byte}                  : a_len;
wire   [16:0] a_dist_or_bytes = (a_type==3'd0) ? {1'b0, a_matchbyte, a_prevbyte} : a_dist;

    
wire          b_ready;
wire          b_valid;
wire          b_last;
wire   [ 3:0] b_pos_state;
wire   [ 2:0] b_type;
wire   [ 8:0] b_len_or_byte;
wire   [16:0] b_dist_or_bytes;


lzma_search u_lzma_search (
    .rstn            ( rstn                ),
    .clk             ( clk                 ),
    .i_ready         ( i_ready             ),
    .i_valid         ( i_valid             ),
    .i_last          ( i_last              ),
    .i_data          ( i_data              ),
    .o_ready         ( a_ready             ),
    .o_valid         ( a_valid             ),
    .o_last          ( a_last              ),
    .o_pos           ( a_pos               ),
    .o_type          ( a_type              ),
    .o_byte          ( a_byte              ),
    .o_prevbyte      ( a_prevbyte          ),
    .o_matchbyte     ( a_matchbyte         ),
    .o_len           ( a_len               ),
    .o_dist          ( a_dist              )
);


sync_fifo #(
    .DW              ( 1 + 4 + 3 + 9 + 17  )
) u_sync_fifo (
    .rstn            ( rstn                ),
    .clk             ( clk                 ),
    .i_rdy           ( a_ready             ),
    .i_en            ( a_valid             ),
    .i_data          ( {a_last, a_pos_state, a_type, a_len_or_byte, a_dist_or_bytes} ),
    .o_rdy           ( b_ready             ),
    .o_en            ( b_valid             ),
    .o_data          ( {b_last, b_pos_state, b_type, b_len_or_byte, b_dist_or_bytes} )
);


lzma_range_coder u_lzma_range_coder (
    .rstn            ( rstn                ),
    .clk             ( clk                 ),
    .i_ready         ( b_ready             ),
    .i_valid         ( b_valid             ),
    .i_last          ( b_last              ),
    .i_pos_state     ( b_pos_state         ),
    .i_type          ( b_type              ),
    .i_len_or_byte   ( b_len_or_byte       ),
    .i_dist_or_bytes ( b_dist_or_bytes     ),
    .o_valid         ( o_valid             ),
    .o_data          ( o_data              ),
    .o_last          ( o_last              )
);


//tb_lzma_search_compare u_tb_lzma_search_compare (         // only for simulation
//    .clk             ( clk                 ),
//    .i_valid         ( i_valid & i_ready   ),
//    .i_last          ( i_last              ),
//    .i_byte          ( i_data              ),
//    .o_valid         ( a_valid & a_ready   ),
//    .o_last          ( a_last              ),
//    .o_pos           ( a_pos               ),
//    .o_type          ( a_type              ),
//    .o_byte          ( a_byte              ),
//    .o_prevbyte      ( a_prevbyte          ),
//    .o_matchbyte     ( a_matchbyte         ),
//    .o_len           ( a_len               ),
//    .o_dist          ( a_dist              )
//);


endmodule

