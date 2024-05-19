// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module tonic (
    input                                   clk,
    input                                   rst_n,

    // inputs
    input           [`FLOW_ID_W-1:0]        incoming_fid_in,
    input           [`PKT_TYPE_W-1:0]       pkt_type_in,
    input           [`PKT_DATA_W-1:0]       pkt_data_in,
 
    input                                   link_avail,
    // outputs
    output                                  next_val,
    output          [`FLOW_SEQ_NUM_W-1:0]   next_seq_out,
    output          [`TX_CNT_W-1:0]         next_seq_tx_id_out,
    output          [`FLOW_ID_W-1:0]        next_seq_fid_out
);

//*********************************************************************************
// Wires and Regs
//*********************************************************************************
wire    [`FLOW_ID_W-1:0]        timeout_fid;
wire    [`FLOW_ID_W-1:0]        dd_incoming_fid;
wire    [`FLOW_ID_W-1:0]        cr_incoming_fid;

// transport engine outputs

wire    [`FLOW_ID_W-1:0]        dd_next_seq_fid;
wire    [`FLOW_SEQ_NUM_W-1:0]   dd_next_seq;
wire    [`TX_CNT_W-1:0]         dd_next_seq_tx_id;

wire    [`FLAG_W-1:0]           dd_timeout_val;
wire    [`FLOW_ID_W-1:0]        dd_timeout_fid;

wire    [`DD_CONTEXT_W-1:0]     dd_cntxt;

// credit engine 

wire    [`FLOW_ID_W-1:0]        tonic_next_seq_fid;
wire    [`FLOW_SEQ_NUM_W-1:0]   tonic_next_seq;
wire    [`TX_CNT_W-1:0]         tonic_next_seq_tx_id;

wire    [`FLOW_ID_W-1:0]        cr_dp_fid;

wire    [`CR_CONTEXT_W-1:0]     cr_cntxt;

wire                            tx_val;

// outq
wire                            outq_w_val;
wire    [`OUTQ_W-1:0]           outq_w_data;
wire    [`OUTQ_W-1:0]           outq_r_data;
wire    [`OUTQ_SIZE_W:0]        outq_size;

wire                            outq_data_avail;
wire                            outq_full;

//// registers between modules

// credit engine
reg     [`FLOW_ID_W-1:0]        enq_fid_0;
reg     [`FLOW_ID_W-1:0]        enq_fid_1;
reg     [`FLOW_ID_W-1:0]        enq_fid_2;
reg     [`FLOW_ID_W-1:0]        enq_fid_3;
reg     [`FLOW_ID_W-1:0]        cr_enq_fid;

reg     [`FLOW_SEQ_NUM_W-1:0]   enq_seq_0;
reg     [`FLOW_SEQ_NUM_W-1:0]   enq_seq_1;
reg     [`FLOW_SEQ_NUM_W-1:0]   enq_seq_2;
reg     [`FLOW_SEQ_NUM_W-1:0]   enq_seq_3;
reg     [`FLOW_SEQ_NUM_W-1:0]   cr_enq_seq;

reg     [`TX_CNT_W-1:0]         enq_seq_tx_id_0;
reg     [`TX_CNT_W-1:0]         enq_seq_tx_id_1;
reg     [`TX_CNT_W-1:0]         enq_seq_tx_id_2;
reg     [`TX_CNT_W-1:0]         enq_seq_tx_id_3;
reg     [`TX_CNT_W-1:0]         cr_enq_seq_tx_id;

reg     [`FLAG_W-1:0]           timeout_val_0;
reg     [`FLAG_W-1:0]           timeout_val_1;
reg     [`FLAG_W-1:0]           timeout_val_2;
reg     [`FLAG_W-1:0]           timeout_val_3;
reg     [`FLAG_W-1:0]           cr_timeout_val;

reg     [`FLOW_ID_W-1:0]        timeout_fid_0;
reg     [`FLOW_ID_W-1:0]        timeout_fid_1;
reg     [`FLOW_ID_W-1:0]        timeout_fid_2;
reg     [`FLOW_ID_W-1:0]        timeout_fid_3;
reg     [`FLOW_ID_W-1:0]        cr_timeout_fid;


reg     [`DD_CONTEXT_W-1:0]     dd_cntxt_0;
reg     [`DD_CONTEXT_W-1:0]     dd_cntxt_1;
reg     [`DD_CONTEXT_W-1:0]     dd_cntxt_2;
reg     [`DD_CONTEXT_W-1:0]     dd_cntxt_3;
reg     [`DD_CONTEXT_W-1:0]     cr_dd_cntxt;


// transport engine
reg     [`FLOW_ID_W-1:0]        dp_fid_0;
reg     [`FLOW_ID_W-1:0]        dp_fid_1;
reg     [`FLOW_ID_W-1:0]        dp_fid_2;
reg     [`FLOW_ID_W-1:0]        dp_fid_3;
reg     [`FLOW_ID_W-1:0]        dd_dp_fid;

reg     [`CR_CONTEXT_W-1:0]     cr_cntxt_0;
reg     [`CR_CONTEXT_W-1:0]     cr_cntxt_1;
reg     [`CR_CONTEXT_W-1:0]     cr_cntxt_2;
reg     [`CR_CONTEXT_W-1:0]     cr_cntxt_3;
reg     [`CR_CONTEXT_W-1:0]     dd_cr_cntxt;

//*********************************************************************************
// Logic - Data Delivery Engine
//*********************************************************************************
assign  dd_incoming_fid   = (pkt_type_in == `SACK_PKT |
                              pkt_type_in == `CACK_PKT | 
                              pkt_type_in == `NACK_PKT |
                              pkt_type_in == `CNP_PKT) ? incoming_fid_in : `FLOW_ID_NONE;

dd_engine dd  (.clk                 (clk                    ),
               .rst_n               (rst_n                  ),

               .dp_fid_in           (dd_dp_fid              ),
               .cr_cntxt_in         (dd_cr_cntxt            ),

               .incoming_fid_in     (dd_incoming_fid        ),
               .pkt_type_in         (pkt_type_in            ), 
               .pkt_data_in         (pkt_data_in            ),

               .next_seq_out        (dd_next_seq            ),
               .next_seq_tx_id_out  (dd_next_seq_tx_id      ),
               .next_seq_fid_out    (dd_next_seq_fid        ),

               .timeout_val_out     (dd_timeout_val         ),
               .timeout_fid_out     (dd_timeout_fid         ),
        
               .dd_cntxt_out        (dd_cntxt               ));
                            

//*********************************************************************************
// Logic - Credit Engine
//*********************************************************************************
assign  cr_incoming_fid   = (pkt_type_in == `PULL_PKT) ? incoming_fid_in : `FLOW_ID_NONE;
assign  timeout_fid       = cr_timeout_val ? cr_timeout_fid : `FLOW_ID_NONE; 

cr_engine cr  (.clk                        (clk                           ),
               .rst_n                      (rst_n                         ),
               
               .enq_fid_in                 (cr_enq_fid                    ),
               .enq_seq_in                 (cr_enq_seq                    ),
               .enq_seq_tx_id_in           (cr_enq_seq_tx_id              ),

               .dd_cntxt_in                (cr_dd_cntxt                   ),

               .incoming_fid_in            (cr_incoming_fid               ),
               .pkt_type_in                (pkt_type_in                   ),
               .pkt_data_in                (pkt_data_in                   ),

               .timeout_fid_in             (timeout_fid                   ),

               .tx_val                     (tx_val                        ),

               .next_seq_out               (tonic_next_seq                ),
               .next_seq_tx_id_out         (tonic_next_seq_tx_id          ),
               .next_seq_fid_out           (tonic_next_seq_fid            ),

               .dp_fid_out                 (cr_dp_fid                     ),
               .cr_cntxt_out               (cr_cntxt                      ));
                        

//*********************************************************************************
// Logic - Output Queue
//*********************************************************************************

assign outq_w_val       = tonic_next_seq_fid != `FLOW_ID_NONE;
assign outq_w_data      = {tonic_next_seq_fid,
                           tonic_next_seq, 
                           tonic_next_seq_tx_id};
 
fifo_1w # (.FIFO_WIDTH      (`OUTQ_W            ),
           .FIFO_DEPTH      (`OUTQ_MAX_SIZE     ))

        outq  (.clk         (clk                ),
               .rst_n       (rst_n              ),

               .w_val       (outq_w_val         ),
               .w_data      (outq_w_data        ),

               .r_val       (link_avail         ),
               .r_data      (outq_r_data        ),

               .size        (outq_size          ),               
               .data_avail  (outq_data_avail    ),
               .full        (outq_full          ));

assign  tx_val              = outq_size < `OUTQ_THRESH;
assign {next_seq_fid_out,
        next_seq_out, 
        next_seq_tx_id_out} = outq_r_data;

assign next_val             = next_seq_fid_out != `FLOW_ID_NONE;

//*********************************************************************************
// Logic - Register Pipeline
//*********************************************************************************

// Data Delivery Engine
always @(posedge clk) begin
    if (~rst_n) begin
        enq_fid_0    <= `FLOW_ID_NONE;
        enq_fid_1    <= `FLOW_ID_NONE;
        enq_fid_2    <= `FLOW_ID_NONE;
        enq_fid_3    <= `FLOW_ID_NONE;
        cr_enq_fid   <= `FLOW_ID_NONE;
    end
    else begin
        enq_fid_0    <= dd_next_seq_fid;
        enq_fid_1    <= enq_fid_0;
        enq_fid_2    <= enq_fid_1;
        enq_fid_3    <= enq_fid_2;
        cr_enq_fid   <= enq_fid_3;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        enq_seq_0    <= `FLOW_SEQ_NONE;
        enq_seq_1    <= `FLOW_SEQ_NONE;
        enq_seq_2    <= `FLOW_SEQ_NONE;
        enq_seq_3    <= `FLOW_SEQ_NONE;
        cr_enq_seq   <= `FLOW_SEQ_NONE;
    end
    else begin
        enq_seq_0    <= dd_next_seq;
        enq_seq_1    <= enq_seq_0;
        enq_seq_2    <= enq_seq_1;
        enq_seq_3    <= enq_seq_2;
        cr_enq_seq   <= enq_seq_3;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        enq_seq_tx_id_0    <= {`TX_CNT_W{1'b0}};
        enq_seq_tx_id_1    <= {`TX_CNT_W{1'b0}};
        enq_seq_tx_id_2    <= {`TX_CNT_W{1'b0}};
        enq_seq_tx_id_3    <= {`TX_CNT_W{1'b0}};
        cr_enq_seq_tx_id   <= {`TX_CNT_W{1'b0}};
    end
    else begin
        enq_seq_tx_id_0    <= dd_next_seq_tx_id;
        enq_seq_tx_id_1    <= enq_seq_tx_id_0;
        enq_seq_tx_id_2    <= enq_seq_tx_id_1;
        enq_seq_tx_id_3    <= enq_seq_tx_id_2;
        cr_enq_seq_tx_id   <= enq_seq_tx_id_3;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        timeout_val_0  <= 1'b0;
        timeout_val_1  <= 1'b0;
        timeout_val_2  <= 1'b0;
        timeout_val_3  <= 1'b0;
        cr_timeout_val <= 1'b0;
    end
    else begin
        timeout_val_0  <= dd_timeout_val;
        timeout_val_1  <= timeout_val_0;
        timeout_val_2  <= timeout_val_1;
        timeout_val_3  <= timeout_val_2;
        cr_timeout_val <= timeout_val_3;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        timeout_fid_0  <= {`FLOW_ID_W{1'b0}};
        timeout_fid_1  <= {`FLOW_ID_W{1'b0}};
        timeout_fid_2  <= {`FLOW_ID_W{1'b0}};
        timeout_fid_3  <= {`FLOW_ID_W{1'b0}};
        cr_timeout_fid <= {`FLOW_ID_W{1'b0}};
    end
    else begin
        timeout_fid_0  <= dd_timeout_fid;
        timeout_fid_1  <= timeout_fid_0;
        timeout_fid_2  <= timeout_fid_1;
        timeout_fid_3  <= timeout_fid_2;
        cr_timeout_fid <= timeout_fid_3;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        dd_cntxt_0    <= {`DD_CONTEXT_W{1'b0}};
        dd_cntxt_1    <= {`DD_CONTEXT_W{1'b0}};
        dd_cntxt_2    <= {`DD_CONTEXT_W{1'b0}};
        dd_cntxt_3    <= {`DD_CONTEXT_W{1'b0}};
        cr_dd_cntxt   <= {`DD_CONTEXT_W{1'b0}};
    end
    else begin
        dd_cntxt_0    <= dd_cntxt;
        dd_cntxt_1    <= dd_cntxt_0;
        dd_cntxt_2    <= dd_cntxt_1;
        dd_cntxt_3    <= dd_cntxt_2;
        cr_dd_cntxt   <= dd_cntxt_3;
    end
end

// Credit Engine
always @(posedge clk) begin
    if (~rst_n) begin
        dp_fid_0     <= `FLOW_ID_NONE;
        dp_fid_1     <= `FLOW_ID_NONE;
        dp_fid_2     <= `FLOW_ID_NONE;
        dp_fid_3     <= `FLOW_ID_NONE;
        dd_dp_fid    <= `FLOW_ID_NONE;
    end
    else begin
        dp_fid_0     <= cr_dp_fid;
        dp_fid_1     <= dp_fid_0;
        dp_fid_2     <= dp_fid_1;
        dp_fid_3     <= dp_fid_2;
        dd_dp_fid    <= dp_fid_3;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        cr_cntxt_0    <= {`CR_CONTEXT_W{1'b0}};
        cr_cntxt_1    <= {`CR_CONTEXT_W{1'b0}};
        cr_cntxt_2    <= {`CR_CONTEXT_W{1'b0}};
        cr_cntxt_3    <= {`CR_CONTEXT_W{1'b0}};
        dd_cr_cntxt   <= {`CR_CONTEXT_W{1'b0}};
    end
    else begin
        cr_cntxt_0    <= cr_cntxt;
        cr_cntxt_1    <= cr_cntxt_0;
        cr_cntxt_2    <= cr_cntxt_1;
        cr_cntxt_3    <= cr_cntxt_2;
        dd_cr_cntxt   <= cr_cntxt_3;
    end
end

// clogb2 function
`include "clogb2.vh"

endmodule
