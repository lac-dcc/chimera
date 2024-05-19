// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module cr_core (
    input                                       clk,
    input                                       rst_n,

    // inputs
    input           [`FLOW_ID_W-1:0]            enq_fid_in,
    input           [`FLOW_SEQ_NUM_W-1:0]       enq_seq_in,
    input           [`TX_CNT_W-1:0]             enq_seq_tx_id_in,

    input           [`FLOW_ID_W-1:0]            tx_fid_in,

    // outputs
    output          [`FLOW_ID_W-1:0]            tx_enq_fid1,
    output          [`FLOW_ID_W-1:0]            tx_enq_fid2,

    output          [`FLOW_ID_W-1:0]            next_seq_fid,
    output          [`FLOW_SEQ_NUM_W-1:0]       next_seq,
    output          [`TX_CNT_W-1:0]             next_seq_tx_id,
    
    output          [`FLOW_ID_W-1:0]            dp_fid
);

//*********************************************************************************
// Local Parameters
//*********************************************************************************

// Context = pkt_queue, tx_id_queue, 
//           pkt_queue_head, pkt_queue_tail, pkt_queue_size, 
//           ready_to_tx, credit, tx_size,
//           last_cred_update, rate, reach_cap

localparam  CONTEXT_W               = `MAX_QUEUE_BITS + `MAX_TX_ID_BITS + 
                                      3 * `PKT_QUEUE_IND_W + `FLAG_W; 

localparam  READY_TO_TX_START       = `FLAG_W - 1;
localparam  PKT_QUEUE_SIZE_START    = READY_TO_TX_START + `PKT_QUEUE_IND_W;
localparam  PKT_QUEUE_TAIL_START    = PKT_QUEUE_SIZE_START + `PKT_QUEUE_IND_W;
localparam  PKT_QUEUE_HEAD_START    = PKT_QUEUE_TAIL_START + `PKT_QUEUE_IND_W;
localparam  TX_ID_QUEUE_START       = PKT_QUEUE_HEAD_START + `MAX_TX_ID_BITS;
localparam  PKT_QUEUE_START         = TX_ID_QUEUE_START + `MAX_QUEUE_BITS;    


//*********************************************************************************
// Wires and Regs
//*********************************************************************************
// Memory Stage - Flow Ids and Contexts

wire    [`FLOW_ID_W-1:0]    enq_fid_l;
wire    [`FLOW_ID_W-1:0]    tx_fid_l;

wire    [`FLOW_ID_W-1:0]    tx_fid_l_from_store;

wire    [CONTEXT_W-1:0]     enq_cntxt_l;
wire    [CONTEXT_W-1:0]     tx_cntxt_l;

wire    [CONTEXT_W-1:0]     tx_cntxt_l_from_store;

// Credit Logic Stage - Flow Ids and Contexts

reg     [`FLOW_ID_W-1:0]    enq_fid_p;
reg     [`FLOW_ID_W-1:0]    tx_fid_p;

reg     [CONTEXT_W-1:0]     enq_cntxt_p;
reg     [CONTEXT_W-1:0]     tx_cntxt_p;

//// Credit Logic Stage - Merged Contexts

// Enqueue
wire    [CONTEXT_W-1:0]         enq_mrged_cntxt;

reg     [`MAX_QUEUE_BITS-1:0]   enq_mrged_pkt_queue;
reg     [`MAX_TX_ID_BITS-1:0]   enq_mrged_tx_id_queue;
reg     [`PKT_QUEUE_IND_W-1:0]  enq_mrged_pkt_queue_head;
reg     [`PKT_QUEUE_IND_W-1:0]  enq_mrged_pkt_queue_tail;
reg     [`PKT_QUEUE_IND_W-1:0]  enq_mrged_pkt_queue_size;
reg                             enq_mrged_ready_to_tx;

// Transmit
wire    [CONTEXT_W-1:0]         tx_mrged_cntxt;

reg     [`MAX_QUEUE_BITS-1:0]   tx_mrged_pkt_queue;
reg     [`MAX_TX_ID_BITS-1:0]   tx_mrged_tx_id_queue;
reg     [`PKT_QUEUE_IND_W-1:0]  tx_mrged_pkt_queue_head;
reg     [`PKT_QUEUE_IND_W-1:0]  tx_mrged_pkt_queue_tail;
reg     [`PKT_QUEUE_IND_W-1:0]  tx_mrged_pkt_queue_size;
reg                             tx_mrged_ready_to_tx;
reg     [`CRED_W-1:0]           tx_mrged_credit;

//// Credit Logic Stage - Pipeline Inputs and Outputs

// Enqueue
wire    [`MAX_QUEUE_BITS-1:0]       enq_pkt_queue_out;
wire    [`MAX_TX_ID_BITS-1:0]       enq_tx_id_queue_out;
wire    [`PKT_QUEUE_IND_W-1:0]      enq_pkt_queue_tail_out;
wire    [`PKT_QUEUE_IND_W-1:0]      enq_pkt_queue_size_out;

// Transmit
wire    [`PKT_QUEUE_IND_W-1:0]      tx_pkt_queue_head_out;
wire    [`PKT_QUEUE_IND_W-1:0]      tx_pkt_queue_size_out;

//// Memory and Credit Logic Stage - Next Seq Info 
reg     [`FLOW_SEQ_NUM_W-1:0]       enq_seq_p, enq_seq_l;
reg     [`TX_CNT_W-1:0]             enq_seq_tx_id_p, enq_seq_tx_id_l;


// Context Defaults
wire    [CONTEXT_W-1:0]     zero_cntxt;

//*********************************************************************************
// Logic - Context Store Stage
//*********************************************************************************

cntxt_store_2w2r #(.RAM_TYPE        (3                      ),
                   .DEPTH           (`MAX_FLOW_CNT          ),
                   .ADDR_WIDTH      (`MAX_FLOW_CNT_WIDTH    ),
                   .CONTEXT_WIDTH   (CONTEXT_W              )) 
        
         store   (.clk        (clk                    ),
                  .rst_n      (rst_n                  ),

                  .r_fid0     (enq_fid_in             ),
                  .r_fid1     (tx_fid_in              ),

                  .w_fid0     (enq_fid_p              ),
                  .w_fid1     (tx_fid_p               ),

                  .w_cntxt0   (enq_mrged_cntxt        ),
                  .w_cntxt1   (tx_mrged_cntxt         ),
                   
                  .l_fid0     (enq_fid_l              ),
                  .l_fid1     (tx_fid_l_from_store    ),

                  .l_cntxt0   (enq_cntxt_l            ),
                  .l_cntxt1   (tx_cntxt_l_from_store  ));

//*********************************************************************************
// Logic - Credit Logic Stage - Flow IDs and Contexts 
//*********************************************************************************
always @(posedge clk) begin
    if (~rst_n) begin
        enq_seq_l           <= `FLOW_SEQ_NONE;
        enq_seq_tx_id_l     <= {`TX_CNT_W{1'b0}};
    end
    else begin
        enq_seq_l           <= enq_seq_in;
        enq_seq_tx_id_l     <= enq_seq_tx_id_in;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        enq_fid_p           <= `FLOW_ID_NONE;
        tx_fid_p            <= `FLOW_ID_NONE;

        enq_seq_p           <= `FLOW_SEQ_NONE;
        enq_seq_tx_id_p     <= {`TX_CNT_W{1'b0}};
    end
    else begin
        enq_fid_p           <= enq_fid_l;
        tx_fid_p            <= tx_fid_l;

        enq_seq_p           <= enq_seq_l;
        enq_seq_tx_id_p     <= enq_seq_tx_id_l;
    end
end

assign zero_cntxt = {CONTEXT_W{1'b0}};

always @(posedge clk) begin
    if (~rst_n) begin
        enq_cntxt_p         <= zero_cntxt;
        tx_cntxt_p          <= zero_cntxt;
    end
    else begin
        enq_cntxt_p         <= enq_cntxt_l; 
        tx_cntxt_p          <= tx_cntxt_l;
    end
end

//*********************************************************************************
// Logic - Credit Logic Stage - Main Pipelines 
//*********************************************************************************

// Enqueue
cr_enqueue enqueue(
                .enq_seq            (enq_seq_p                                              ),
                .enq_seq_tx_id      (enq_seq_tx_id_p                                        ),

                .pkt_queue_in       (enq_cntxt_p[PKT_QUEUE_START -: `MAX_QUEUE_BITS]        ),
                .tx_id_queue_in     (enq_cntxt_p[TX_ID_QUEUE_START -: `MAX_TX_ID_BITS]      ),
                .pkt_queue_tail_in  (enq_cntxt_p[PKT_QUEUE_TAIL_START -: `PKT_QUEUE_IND_W]  ),
                .pkt_queue_size_in  (enq_cntxt_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W]  ),

                .pkt_queue_out      (enq_pkt_queue_out                                      ),
                .tx_id_queue_out    (enq_tx_id_queue_out                                    ),
                .pkt_queue_tail_out (enq_pkt_queue_tail_out                                 ),
                .pkt_queue_size_out (enq_pkt_queue_size_out                                 )
                );

// Transmit
cr_transmit transmit(
                  .pkt_queue            (tx_cntxt_p[PKT_QUEUE_START -: `MAX_QUEUE_BITS]         ),
                  .tx_id_queue          (tx_cntxt_p[TX_ID_QUEUE_START -: `MAX_TX_ID_BITS]       ),
                  .pkt_queue_head_in    (tx_cntxt_p[PKT_QUEUE_HEAD_START -: `PKT_QUEUE_IND_W]   ),
                  .pkt_queue_size_in    (tx_cntxt_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W]   ),
                    
                  .pkt_queue_head_out   (tx_pkt_queue_head_out                                  ),
                  .pkt_queue_size_out   (tx_pkt_queue_size_out                                  ),

                  .next_seq_out         (next_seq                                               ),
                  .next_seq_tx_id_out   (next_seq_tx_id                                         )
                 );


//*********************************************************************************
// Logic - Credit Logic Stage - Merge 
//*********************************************************************************

assign enq_mrged_cntxt = {enq_mrged_pkt_queue,
                          enq_mrged_tx_id_queue,
                          enq_mrged_pkt_queue_head,
                          enq_mrged_pkt_queue_tail,
                          enq_mrged_pkt_queue_size,
                          enq_mrged_ready_to_tx
};

assign tx_mrged_cntxt =  {tx_mrged_pkt_queue,
                          tx_mrged_tx_id_queue,
                          tx_mrged_pkt_queue_head,
                          tx_mrged_pkt_queue_tail,
                          tx_mrged_pkt_queue_size,
                          tx_mrged_ready_to_tx
};

//****************************
// pkt_queue 
//****************************

wire    didnt_enq;
assign  didnt_enq = enq_seq_p == `FLOW_SEQ_NONE;
  
// Enqueue
always @(*) begin
    enq_mrged_pkt_queue = enq_pkt_queue_out;
end

// Transmit
always @(*) begin
    if (enq_fid_p == tx_fid_p) begin
        tx_mrged_pkt_queue = enq_pkt_queue_out;
    end
    else begin
        tx_mrged_pkt_queue = tx_cntxt_p[PKT_QUEUE_START -: `MAX_QUEUE_BITS];
    end
end

//****************************
// tx_id_queue 
//****************************

// Enqueue
always @(*) begin
    enq_mrged_tx_id_queue = enq_tx_id_queue_out;
end

// Transmit
always @(*) begin
    if (enq_fid_p == tx_fid_p) begin
        tx_mrged_tx_id_queue = enq_tx_id_queue_out;
    end
    else begin
        tx_mrged_tx_id_queue = tx_cntxt_p[TX_ID_QUEUE_START -: `MAX_TX_ID_BITS];
    end
end

//****************************
// pkt_queue_head 
//****************************

// Enqueue
always @(*) begin
    if(enq_fid_p == tx_fid_p) begin
        enq_mrged_pkt_queue_head = tx_pkt_queue_head_out;
    end
    else begin
        enq_mrged_pkt_queue_head = enq_cntxt_p[PKT_QUEUE_HEAD_START -: `PKT_QUEUE_IND_W];
    end
end

// Transmit
always @(*) begin
    tx_mrged_pkt_queue_head = tx_pkt_queue_head_out;
end

//****************************
// pkt_queue_tail 
//****************************

// Enqueue
always @(*) begin
    enq_mrged_pkt_queue_tail = enq_pkt_queue_tail_out;
end 

// Transmit
always @(*) begin
    if (enq_fid_p == tx_fid_p) begin
        tx_mrged_pkt_queue_tail = enq_pkt_queue_tail_out;
    end
    else begin
        tx_mrged_pkt_queue_tail = tx_cntxt_p[PKT_QUEUE_TAIL_START -: `PKT_QUEUE_IND_W];
    end
end

//****************************
// pkt_queue_size
//****************************

// Enqueue
always @(*) begin
    if (enq_fid_p == tx_fid_p) begin
        enq_mrged_pkt_queue_size = enq_cntxt_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W] - {{`PKT_QUEUE_IND_W-1{1'b0}}, didnt_enq};
    end
    else begin
        enq_mrged_pkt_queue_size = enq_pkt_queue_size_out;
    end
end

// Transmit
always @(*) begin
    if (enq_fid_p == tx_fid_p) begin
        tx_mrged_pkt_queue_size = tx_cntxt_p[PKT_QUEUE_SIZE_START -: `PKT_QUEUE_IND_W] - {{`PKT_QUEUE_IND_W-1{1'b0}}, didnt_enq};
    end
    else begin
        tx_mrged_pkt_queue_size = tx_pkt_queue_size_out;
    end
end

//****************************
// ready_to_tx
//****************************

// Enqueue
always @(*) begin
    if (enq_pkt_queue_size_out == 1 & ~didnt_enq) begin
        enq_mrged_ready_to_tx = 1'b1;
    end
    else if (enq_fid_p == tx_fid_p) begin
        enq_mrged_ready_to_tx = tx_mrged_ready_to_tx;
    end
    else begin
        enq_mrged_ready_to_tx = enq_cntxt_p[READY_TO_TX_START -: `FLAG_W];
    end
end

// Transmit
always @(*) begin
    tx_mrged_ready_to_tx = (tx_mrged_pkt_queue_size > {`PKT_QUEUE_IND_W{1'b0}});
end


//*********************************************************************************
// Logic - Credit Logic Stage - Output 
//*********************************************************************************

// tx_enq_fids

assign tx_enq_fid1 = (enq_pkt_queue_size_out == 1 & ~didnt_enq) ? enq_fid_p : `FLOW_ID_NONE;

wire  [`FLOW_ID_W-1:0] tmp_tx_enq_fid2;

assign tmp_tx_enq_fid2 =  (tx_mrged_pkt_queue_size > {`PKT_QUEUE_IND_W{1'b0}})
                           ? tx_fid_p : `FLOW_ID_NONE;

assign tx_fid_l = (tmp_tx_enq_fid2 != `FLOW_ID_NONE &
                     tx_fid_l_from_store == `FLOW_ID_NONE) 
                     ? tmp_tx_enq_fid2 : tx_fid_l_from_store;

assign tx_cntxt_l = (tmp_tx_enq_fid2 != `FLOW_ID_NONE &
                         tx_fid_l_from_store == `FLOW_ID_NONE) 
                        ? tx_mrged_cntxt : tx_cntxt_l_from_store;

assign tx_enq_fid2 = (tmp_tx_enq_fid2 != `FLOW_ID_NONE &
                     tx_fid_l_from_store == `FLOW_ID_NONE) 
                     ? `FLOW_ID_NONE : tmp_tx_enq_fid2;




// next_seq_fid
assign next_seq_fid = tx_fid_p;

// dp_fid
assign dp_fid = tx_fid_p;

// clogb2 function
`include "clogb2.vh"

endmodule
