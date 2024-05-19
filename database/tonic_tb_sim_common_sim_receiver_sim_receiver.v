// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

module sim_receiver #(parameter RTT              = -1,
                      parameter LOSS_PROB        = -1)(

    input                           clk,              
    input                           rst_n,           
   
    input   [`FLOW_SEQ_NUM_W-1:0]   next_seq_in,
    input   [`TX_CNT_W-1:0]         next_seq_tx_id_in,
    input   [`FLOW_ID_W-1:0]        next_seq_fid_in,

    output  reg [`FLOW_ID_W-1:0]    resp_fid,
    output  reg [`PKT_TYPE_W-1:0]   resp_pkt_type,
    output  reg [`PKT_DATA_W-1:0]   resp_pkt_data
);    

localparam  LINK_RTT        = RTT;
localparam  LINK_LOSS_PROB  = LOSS_PROB;

reg  [`FLOW_ID_W-1:0]       read_resp_fid;
reg  [`PKT_TYPE_W-1:0]      read_resp_pkt_type;
reg  [`PKT_DATA_W-1:0]      read_resp_pkt_data;

initial begin
    read_resp_fid       = `FLOW_ID_NONE;
    read_resp_pkt_type  = `NONE_PKT;
    read_resp_pkt_data  = {`PKT_DATA_W{1'b0}};
end

initial begin
    $init;
end

always @(posedge clk) begin
    $send_clk;
end

always @(posedge clk) begin
    if (rst_n) begin
        resp_fid        <= read_resp_fid;
        resp_pkt_type   <= read_resp_pkt_type;
        resp_pkt_data   <= read_resp_pkt_data;
    end
    else begin
        resp_fid        <= `FLOW_ID_NONE;
        resp_pkt_type   <= `NONE_PKT;
        resp_pkt_data   <= {`PKT_DATA_W{1'b0}};
    end    
end

always @(posedge clk) begin
    if (rst_n) begin
        $read_inputs;
    end
end

always @(posedge clk) begin
    if (rst_n) begin
        $write_outputs;
    end
end

`include "clogb2.vh"
endmodule
