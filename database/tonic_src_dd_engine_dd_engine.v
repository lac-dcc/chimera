// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module dd_engine (
    input                                   clk,
    input                                   rst_n,

    // inputs
    input           [`FLOW_ID_W-1:0]        dp_fid_in,
    input           [`CR_CONTEXT_W-1:0]     cr_cntxt_in,

    input           [`FLOW_ID_W-1:0]        incoming_fid_in,
    input           [`PKT_TYPE_W-1:0]       pkt_type_in,
    input           [`PKT_DATA_W-1:0]       pkt_data_in,

    // outputs
    output          [`FLOW_SEQ_NUM_W-1:0]   next_seq_out,
    output          [`TX_CNT_W-1:0]         next_seq_tx_id_out,
    output          [`FLOW_ID_W-1:0]        next_seq_fid_out,

    output          [`FLAG_W-1:0]           timeout_val_out,
    output          [`FLOW_ID_W-1:0]        timeout_fid_out,

    output          [`DD_CONTEXT_W-1:0]     dd_cntxt_out
);

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

// Non-idle Fifo

wire    [`FLOW_ID_W-1:0]        next_fid_in;

reg     [`FLOW_ID_W-1:0]        next_enq_fid1_q;
reg     [`FLOW_ID_W-1:0]        next_enq_fid2_q;
reg     [`FLOW_ID_W-1:0]        next_enq_fid3_q;
reg     [`FLOW_ID_W-1:0]        next_enq_fid4_q;

wire                            w_val_fid1;
wire                            w_val_fid2;
wire                            w_val_fid3;
wire                            w_val_fid4;

wire                            r_val_next_fid;
wire    [`FLOW_ID_W - 1:0]      r_data;
wire    [`FLOW_ID_W:0]          ni_fifo_size;
wire                            ni_fifo_full;
wire                            ni_fifo_data_avail;

// transport engine wires

wire    [`FLOW_ID_W-1:0]        next_enq_fid1;
wire    [`FLOW_ID_W-1:0]        next_enq_fid2;
wire    [`FLOW_ID_W-1:0]        next_enq_fid3;
wire    [`FLOW_ID_W-1:0]        next_enq_fid4;


//*********************************************************************************
// Logic - Queues
//*********************************************************************************

// non-idle

always @(posedge  clk) begin
    if (~rst_n) begin
        next_enq_fid1_q <= `FLOW_ID_NONE;
        next_enq_fid2_q <= `FLOW_ID_NONE;
        next_enq_fid3_q <= `FLOW_ID_NONE;
        next_enq_fid4_q <= `FLOW_ID_NONE;
    end
    else begin
        next_enq_fid1_q <= next_enq_fid1;
        next_enq_fid2_q <= next_enq_fid2;
        next_enq_fid3_q <= next_enq_fid3;
        next_enq_fid4_q <= next_enq_fid4;
    end
end

assign  w_val_fid1 = next_enq_fid1_q != `FLOW_ID_NONE;
assign  w_val_fid2 = next_enq_fid2_q != `FLOW_ID_NONE;
assign  w_val_fid3 = next_enq_fid3_q != `FLOW_ID_NONE;
assign  w_val_fid4 = next_enq_fid4_q != `FLOW_ID_NONE;

assign  r_val_next_fid = 1'b1;

fifo_4w #(.FIFO_WIDTH (`FLOW_ID_W),
          .FIFO_DEPTH (`MAX_FLOW_CNT)) non_idle_fifo (.clk          (clk                ),
                                                      .rst_n        (rst_n              ),
                                                      .w_val_0      (w_val_fid1         ),
                                                      .w_data_0     (next_enq_fid1_q    ),
                                                      .w_val_1      (w_val_fid2         ),
                                                      .w_data_1     (next_enq_fid2_q    ),
                                                      .w_val_2      (w_val_fid3         ),
                                                      .w_data_2     (next_enq_fid3_q    ), 
                                                      .w_val_3      (w_val_fid4         ),
                                                      .w_data_3     (next_enq_fid4_q    ),
                                                      .r_val        (r_val_next_fid     ),
                                                      .r_data       (r_data             ),
                                                      .full         (ni_fifo_full       ),
                                                      .size         (ni_fifo_size       ),
                                                      .data_avail   (ni_fifo_data_avail ));


//*********************************************************************************
// Logic - Transport Engine
//*********************************************************************************

assign next_fid_in = r_val_next_fid ? r_data : `FLOW_ID_NONE;

dd_core core  (.clk                 (clk                ),
               .rst_n               (rst_n              ),
               .next_fid_in         (next_fid_in        ),

               .dp_fid_in           (dp_fid_in          ),
               .cr_cntxt_in         (cr_cntxt_in        ),

               .incoming_fid_in     (incoming_fid_in    ),
               .pkt_type_in         (pkt_type_in        ),
               .pkt_data_in         (pkt_data_in        ),

               .next_seq_out        (next_seq_out       ),
               .next_seq_tx_id_out  (next_seq_tx_id_out ),
               .next_seq_fid_out    (next_seq_fid_out   ),
              
               .timeout_val_out     (timeout_val_out    ),
               .timeout_fid_out     (timeout_fid_out    ),
               .dd_cntxt_out        (dd_cntxt_out       ), 
               
               .next_enq_fid1       (next_enq_fid1      ),
               .next_enq_fid2       (next_enq_fid2      ),
               .next_enq_fid3       (next_enq_fid3      ),
               .next_enq_fid4       (next_enq_fid4      )
               );

// clogb2 function
`include "clogb2.vh"

endmodule
