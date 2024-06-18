// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`ifdef FPGA
	`include "log.vh"
`endif

module bus_read #(
	parameter DATA_LEN = 16,
	parameter BUS_ADDR_LEN = 3,
	parameter PE_NO = 0,
//	parameter numPe = 8,
//	parameter ADDR_LEN = `C_LOG_2(`BUS_FIFO_DEPTH),
//	parameter DEPTH = `BUS_FIFO_DEPTH,
	parameter NUM_ELEM = 8,
	parameter NUM_PIPELINE_STAGES = 0,
	parameter FIFO_DEPTH = 8
)
(

	input clk,
	input rstn,
    input stall,
    
	input [DATA_LEN-1:0] data_from_bus,
	input [BUS_ADDR_LEN-1:0] addr_from_bus,
	input valid_from_bus,

	input [BUS_ADDR_LEN-1:0] src_addr_in,
	input src_rq_in,

	output [DATA_LEN-1:0] src_data_w,
	output  reg src_valid_r,

	output reg [NUM_ELEM-1:0] rd_buffer_full

);

reg [BUS_ADDR_LEN-1:0] src_addr,src_addr_d;
reg src_rq;
reg src_valid_retain;
wire src_valid_w;

wire [DATA_LEN-1:0] data_from_fifo[0:NUM_ELEM-1];
reg [DATA_LEN-1:0] data_from_bus_q;
reg [BUS_ADDR_LEN-1:0] addr_from_bus_q;
reg valid_from_bus_q;
wire [NUM_ELEM-1:0] wr_en,rd_en,wr_full,empty;
reg stall_d;

always @(posedge clk or negedge rstn) begin
    if(~rstn)
        src_valid_r <= 1'b0;
    else
        src_valid_r <= (src_valid_r && stall) || src_valid_w;
end

always @(posedge clk or negedge rstn) begin
    if(~rstn) begin
        src_addr <= {BUS_ADDR_LEN{1'b0}};
        src_addr_d <= {BUS_ADDR_LEN{1'b0}};
        src_rq <= 1'b0;
        src_valid_retain <= 1'b0;
    end
    else if(~stall) begin
        src_addr <= src_addr_in;
        src_addr_d <= src_addr;
        src_rq <= src_rq_in;
        src_valid_retain <= 1'b0;
    end
    else begin
        src_addr <= src_addr;
        src_addr_d <= src_addr;
        src_rq <= src_valid_w ? 1'b0:src_rq;
        src_valid_retain <= src_valid_r ? 1'b1 : src_valid_retain ;
    end
end
always @(posedge clk or negedge rstn) begin
    if(~rstn)
        stall_d <= 1'b0;
    else
        stall_d <= stall;
 end
always @(posedge clk or negedge rstn) begin
    if(~rstn) begin
        data_from_bus_q <= {DATA_LEN{1'b0}};
        addr_from_bus_q <= {BUS_ADDR_LEN{1'b0}};
        valid_from_bus_q <= 1'b0;
    end
    else begin
        data_from_bus_q <= data_from_bus;
        addr_from_bus_q <= addr_from_bus;
        valid_from_bus_q <= valid_from_bus;
    end
end




assign src_valid_w = |rd_en;
assign src_data_w = data_from_fifo[src_addr_d];
generate
for(genvar gv=0;gv<NUM_ELEM;gv=gv+1) begin : GEN_FIFO
    assign wr_en[gv] = (addr_from_bus_q == gv) && valid_from_bus_q;
    assign rd_en[gv] = (src_addr == gv) && src_rq && ~empty[gv] ;
    
    if(gv == PE_NO || gv == (PE_NO+7)%NUM_ELEM) begin
        assign data_from_fifo[gv] = {DATA_LEN{1'b0}};
        assign wr_full[gv] = 1'b0;
        assign empty[gv] = 1'b1;
    end
    else begin
        fifo_bus_read #(.DATA_LEN(DATA_LEN),
        .DEPTH(FIFO_DEPTH),
        .NUM_PIPELINE_STAGES(NUM_PIPELINE_STAGES)
        )
            fifo_wrt_to_bus 
            (
                .clk		(clk		        ),
                .rstn		(rstn		        ),
                .wr_data	(data_from_bus_q    ),
                .wr_en		(wr_en[gv]	        ),
                .rd_en		(rd_en[gv]	        ),
            
                .rd_data	(data_from_fifo[gv]	),
                .full		(wr_full[gv]	    ),
                .empty_w		(empty[gv]	        )
            );
     end
end
endgenerate

always @(posedge clk or negedge rstn) begin
    if(~rstn) begin
        rd_buffer_full <= {NUM_ELEM{1'b0}};
    end
    else begin
        rd_buffer_full <= wr_full;
    end
end
endmodule

