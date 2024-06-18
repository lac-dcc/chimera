// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`ifdef FPGA
	`include "config.vh"
`endif
module slave_controller #(
	parameter BUS_ADDR_LEN = 3,
	parameter DATA_LEN = 16,
	parameter PE_ID = {BUS_ADDR_LEN{1'b0}},
	parameter NUM_ELEM = 8,
	parameter NUM_STAGES = 0,
	parameter FIFO_DEPTH = 8
)
(

	input clk,
	input rstn,
    input stall,
    
	input [BUS_ADDR_LEN-1:0] dest_addr,
	input dest_valid,
	input [DATA_LEN-1:0] dest_data,

	input [BUS_ADDR_LEN-1:0] src_addr,
	input src_rq,
    `ifdef USE_TRI_STATE
        inout [DATA_LEN-1:0] bus_data,
        inout [BUS_ADDR_LEN-1:0] addr_bus,
    `else
        input [DATA_LEN-1:0] bus_data,
        input [BUS_ADDR_LEN-1:0] addr_bus,
    `endif
	input rd_from_bus,

	input wr_to_bus,

	output [DATA_LEN-1:0] src_data,
	output src_valid,

	output [DATA_LEN-1:0] data_to_bus,
	output [BUS_ADDR_LEN-1:0] addr_to_bus,
	output reg valid_to_bus,

	output wr_fifo_full,

	output [NUM_ELEM-1:0] rd_buffer_full
);

localparam FIFO_BITWIDTH = ((BUS_ADDR_LEN+DATA_LEN)%2 == 1) ? BUS_ADDR_LEN+DATA_LEN+1 : BUS_ADDR_LEN+DATA_LEN;


wire [BUS_ADDR_LEN+DATA_LEN-1:0] data_to_fifo;
wire [FIFO_BITWIDTH-1:0] data_from_fifo;
wire rd_en_to_fifo,wr_en_to_fifo,fifo_empty;
wire [DATA_LEN-1:0] data_from_bus;
wire [BUS_ADDR_LEN-1:0] addr_from_bus;
reg fifo_empty_d;

reg sent_to_bus;
reg valid_from_bus,valid_from_bus_i;
assign addr_to_bus = data_from_fifo[BUS_ADDR_LEN-1:0];
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		sent_to_bus <= 1'b0;
//		valid_from_bus <= 1'b0;
		valid_from_bus_i <= 1'b0;
	end
	else begin
		sent_to_bus <= wr_to_bus;
//		valid_from_bus <= valid_from_bus_i;
		valid_from_bus_i <= rd_from_bus;
	end
end
`ifdef USE_TRI_STATE

    wire [DATA_LEN-1:0] data_from_bus_p,data_to_bus_p;
    wire [BUS_ADDR_LEN-1:0] addr_from_bus_p;
    wire  sent_to_bus_p;
    
    generate
    if(NUM_STAGES == 0 ) begin
        assign sent_to_bus_p = sent_to_bus;
        assign data_to_bus_p = data_to_bus;
        assign data_from_bus_p = bus_data;
        assign addr_from_bus_p = addr_bus;
    end
    else begin
        reg [DATA_LEN-1:0] data_from_bus_t[0:NUM_STAGES-1],data_to_bus_t[0:NUM_STAGES-1];
        reg [BUS_ADDR_LEN-1:0] addr_from_bus_t[0:NUM_STAGES-1];
        reg [NUM_STAGES-1:0] sent_to_bus_t;
        for(genvar gv=0;gv<NUM_STAGES;gv=gv+1) begin
            always @(posedge clk or negedge rstn)
            begin
                if(~rstn) begin
                    sent_to_bus_t[gv] <= 1'b0;
                    data_to_bus_t[gv] <= {DATA_LEN{1'b0}};
                    data_from_bus_t[gv] <= {DATA_LEN{1'b0}};
                    addr_from_bus_t[gv] <= {BUS_ADDR_LEN{1'b0}};
                end
                else begin
                    sent_to_bus_t[gv] <= (gv == 0) ? sent_to_bus : sent_to_bus_t[gv-1];
                    data_to_bus_t[gv] <= (gv == 0) ? data_to_bus : data_to_bus_t[gv-1];
                    data_from_bus_t[gv] <= (gv == 0) ? bus_data : data_from_bus_t[gv-1];
                    addr_from_bus_t[gv] <= (gv == 0) ? addr_bus : addr_from_bus_t[gv-1];
                end
            end
        end
        
        assign sent_to_bus_p = sent_to_bus_t[NUM_STAGES-1];
        assign data_to_bus_p = data_to_bus_t[NUM_STAGES-1];
        assign data_from_bus_p = data_from_bus_t[NUM_STAGES-1];
        assign addr_from_bus_p = addr_from_bus_t[NUM_STAGES-1];
    end
    endgenerate
    assign bus_data = sent_to_bus_p ? data_to_bus_p : {DATA_LEN{1'bz}};
    assign addr_bus = sent_to_bus_p ? PE_ID : {BUS_ADDR_LEN{1'bz}};
       
    assign data_from_bus = data_from_bus_p;
    assign addr_from_bus = addr_from_bus_p;
    
`else
    assign data_from_bus = bus_data;
    assign addr_from_bus = addr_bus;
`endif
assign data_to_bus = data_from_fifo[BUS_ADDR_LEN+DATA_LEN-1:BUS_ADDR_LEN];




assign data_to_fifo = {dest_data,dest_addr};
assign rd_en_to_fifo = (sent_to_bus && ~fifo_empty) || (fifo_empty_d && ~fifo_empty && ~valid_to_bus);
assign wr_en_to_fifo = dest_valid ;

always @(posedge clk or negedge rstn) begin
    if(~rstn) begin
        fifo_empty_d <= 1'b1;
        valid_to_bus <= 1'b0;
    end
    else begin
	   fifo_empty_d <= fifo_empty;
	   valid_to_bus <= rd_en_to_fifo || (~sent_to_bus && valid_to_bus);// ? 1'b1 : valid_to_bus;
	end
end


wire [FIFO_BITWIDTH-1:0] data_to_fifo_w;

assign data_to_fifo_w = ((BUS_ADDR_LEN+DATA_LEN)%2 == 1) ? {1'b0,data_to_fifo}: data_to_fifo;

fifo_bus #(.DATA_LEN(FIFO_BITWIDTH))
fifo_wrt_to_bus 
(
	.clk		(clk		),
	.rstn		(rstn		),
	.wr_data	(data_to_fifo_w	),
	.wr_en		(wr_en_to_fifo	),
	.rd_en		(rd_en_to_fifo	),

	.rd_data	(data_from_fifo	),
	.full		(wr_fifo_full	),
	.empty		(fifo_empty	)
);

bus_read #(.DATA_LEN(DATA_LEN),
.BUS_ADDR_LEN(BUS_ADDR_LEN),
.PE_NO(PE_ID),
.NUM_ELEM(NUM_ELEM),
.FIFO_DEPTH(FIFO_DEPTH),
.NUM_PIPELINE_STAGES(NUM_STAGES))
read_from_bus
(
	.clk		(clk		),
	.rstn		(rstn		),
	.stall      (stall),
	.data_from_bus	(data_from_bus	),
	.addr_from_bus	(addr_from_bus	),
	.valid_from_bus	(valid_from_bus_i	),
	.src_addr_in	(src_addr	),
	.src_rq_in		(src_rq		),

	.src_data_w	(src_data	),
	.src_valid_r(src_valid	),
	.rd_buffer_full	(rd_buffer_full	)
);

endmodule
