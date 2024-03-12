
module logger(
    input wire clk_clk,
    input wire reset_n,

    input wire[127:0] trace_data,
    input wire[1:0] trace_en,
    output wire full,

    input wire clk_dout_clk,
    output wire[127:0] trace_out_data,
    output wire trace_out_valid,
    input wire trace_out_ready

);


wire rdack, rdempty_l, rdempty_u;
wire wrfull_l, wrfull_u;
reg[63:0] wrdata_l, wrdata_u;
wire enabled_data;
reg wrreq_l, wrreq_u;
reg wr_sel;

assign rdack = trace_out_valid & trace_out_ready;
assign trace_out_valid = ~rdempty_l & ~rdempty_u;
assign full = wrfull_l | wrfull_u;
assign enabled_data = (trace_en[1] ? trace_data[127:64] : trace_data[63:0]);

always @(posedge clk_clk or negedge reset_n) begin : proc_wr_sel
    if(~reset_n) begin
        wr_sel <= 0;
        wrreq_l <= 0;
        wrreq_u <= 0;
    end else begin

        if(trace_en[0] & trace_en[1])begin //Both channels enabled
            wrreq_l <= 1;
            wrreq_u <= 1;
            if(~wr_sel)begin 
                wrdata_l <= trace_data[63:0];
                wrdata_u <= trace_data[127:64];
            end else begin 
                wrdata_u <= trace_data[63:0];
                wrdata_l <= trace_data[127:64];
            end
        end else if(trace_en[0] | trace_en[1])begin //Only one channel enabled
            wrreq_l <= ~wr_sel;
            wrreq_u <= wr_sel;
            wrdata_l <= enabled_data;
            wrdata_u <= enabled_data;
            wr_sel <= ~wr_sel;
        end else begin 
            wrreq_l <= 0;
            wrreq_u <= 0;
        end
    end
end

probe_fifo lower_fifo(
    .aclr(~reset_n),
    .data(wrdata_l),
    .rdclk(clk_dout_clk),
    .rdreq(rdack),
    .wrclk(clk_clk),
    .wrreq(wrreq_l),
    .q(trace_out_data[63:0]),
    .rdempty(rdempty_l),
    .wrfull(wrfull_l),
    .rdfull());

probe_fifo upper_fifo(
    .aclr(~reset_n),
    .data(wrdata_u),
    .rdclk(clk_dout_clk),
    .rdreq(rdack),
    .wrclk(clk_clk),
    .wrreq(wrreq_u),
    .q(trace_out_data[127:64]),
    .rdempty(rdempty_u),
    .wrfull(wrfull_u),
    .rdfull());
endmodule // probe
