`ifdef FPGA
	`include "config.vh"
`endif
module bus_pipeline #(
	parameter NUM_PE = 8,
	parameter DATA_LEN = 16,
	parameter BUS_ADDR_LEN = 3,
	parameter NUM_STAGES = 3
)
(
	input clk,
	input rstn,
	////////////////////////////////////////////////////////
	input [BUS_ADDR_LEN*NUM_PE-1:0] i_addr_to_bus,
	input [DATA_LEN*NUM_PE-1:0] i_data_to_bus,
	input [NUM_PE-1:0] valid_to_bus,

	input [NUM_PE*NUM_PE-1:0] i_rd_buffer_full,
	//////////////
	output [BUS_ADDR_LEN*NUM_PE-1:0] o_addr_to_bus_p,
	output [DATA_LEN*NUM_PE-1:0] o_data_to_bus_p,
	output [NUM_PE-1:0] valid_to_bus_p,

	output [NUM_PE*NUM_PE-1:0] o_rd_buffer_full_p,
	/////////////////////////////////////////////////////////
	
	/////////////////////////////////////////////////////////
	input  [DATA_LEN-1:0] data_bus,
	input  [BUS_ADDR_LEN-1:0] addr_bus,
	
	input  [NUM_PE-1:0] wr_to_bus,
	input  [NUM_PE-1:0] rd_from_bus,
	//////////////
	output  [DATA_LEN*NUM_PE-1:0] o_data_bus_p,
	output  [BUS_ADDR_LEN*NUM_PE-1:0] o_addr_bus_p,
	
	output  [NUM_PE-1:0] wr_to_bus_p,
	output  [NUM_PE-1:0] rd_from_bus_p
	/////////////////////////////////////////////////////////
);


////////////////////////////////////////////////////////
wire [BUS_ADDR_LEN-1:0] addr_to_bus[0:NUM_PE-1];
wire [DATA_LEN-1:0] data_to_bus[0:NUM_PE-1];
wire [NUM_PE-1:0] rd_buffer_full[0:NUM_PE-1];
///////////////
wire [BUS_ADDR_LEN-1:0] addr_to_bus_p[0:NUM_PE-1];
wire [DATA_LEN-1:0] data_to_bus_p[0:NUM_PE-1];
wire [NUM_PE-1:0] rd_buffer_full_p[0:NUM_PE-1];
wire  [DATA_LEN-1:0] data_bus_p[0:NUM_PE-1];
wire  [BUS_ADDR_LEN-1:0] addr_bus_p[0:NUM_PE-1];
/////////////////////////////////////////////////////////

generate
for(genvar i=0;i<NUM_PE;i=i+1) begin
	assign addr_to_bus[i] = i_addr_to_bus[(i+1)*BUS_ADDR_LEN-1: i*BUS_ADDR_LEN];
	assign data_to_bus[i] = i_data_to_bus[(i+1)*DATA_LEN-1: i*DATA_LEN];
	assign rd_buffer_full[i] = i_rd_buffer_full[(i+1)*NUM_PE-1: i*NUM_PE];
	
	
	assign o_addr_to_bus_p[(i+1)*BUS_ADDR_LEN-1: i*BUS_ADDR_LEN] = addr_to_bus_p[i];
	assign o_data_to_bus_p[(i+1)*DATA_LEN-1: i*DATA_LEN] = data_to_bus_p[i];
	assign o_rd_buffer_full_p[(i+1)*NUM_PE-1: i*NUM_PE] = rd_buffer_full_p[i];
	assign o_data_bus_p[(i+1)*DATA_LEN-1: i*DATA_LEN] = data_bus_p[i];
	assign o_addr_bus_p[(i+1)*BUS_ADDR_LEN-1: i*BUS_ADDR_LEN] = addr_bus_p[i];
	
end
endgenerate

generate
if(NUM_STAGES != 0 ) begin
	/////////////////////////////////////////////////////////////////////////////
	reg [BUS_ADDR_LEN-1:0] addr_to_bus_t[0:NUM_STAGES-1][0:NUM_PE-1];
	reg [DATA_LEN-1:0] data_to_bus_t[0:NUM_STAGES-1][0:NUM_PE-1];
	reg [NUM_PE-1:0] valid_to_bus_t[0:NUM_STAGES-1];
	reg [NUM_PE-1:0] rd_buffer_full_t[0:NUM_STAGES-1][0:NUM_PE-1];
	
    for(genvar gv =0;gv< NUM_STAGES;gv=gv+1) begin
    for(genvar gv2 =0;gv2< NUM_PE;gv2=gv2+1) begin
        always @(posedge clk or negedge rstn)
            begin
                if(~rstn) begin
                    addr_to_bus_t[gv][gv2] <= {BUS_ADDR_LEN{1'b0}};
                    data_to_bus_t[gv][gv2] <= {DATA_LEN{1'b0}};
                    rd_buffer_full_t[gv][gv2] <= {NUM_PE{1'b0}};
				end
                else begin
                    addr_to_bus_t[gv][gv2] <= (gv == 0) ? addr_to_bus[gv2] : addr_to_bus_t[gv-1][gv2];
                    data_to_bus_t[gv][gv2] <= (gv == 0) ? data_to_bus[gv2] : data_to_bus_t[gv-1][gv2];
                    rd_buffer_full_t[gv][gv2] <= (gv == 0) ? rd_buffer_full[gv2] : rd_buffer_full_t[gv-1][gv2];
				end
            end
     end
     end
     for(genvar gv =0;gv< NUM_STAGES;gv=gv+1)
        begin
        always @(posedge clk or negedge rstn)
            begin
                if(~rstn) begin
                    valid_to_bus_t[gv] <= {NUM_PE{1'b0}};
				end
                else begin
                    valid_to_bus_t[gv] <= (gv == 0) ? valid_to_bus : valid_to_bus_t[gv-1];
				end
            end
         end
     for(genvar gv =0;gv< NUM_PE;gv=gv+1) begin
         assign addr_to_bus_p[gv] = addr_to_bus_t[NUM_STAGES-1][gv];
         assign data_to_bus_p[gv] = data_to_bus_t[NUM_STAGES-1][gv];
         assign rd_buffer_full_p[gv] = rd_buffer_full_t[NUM_STAGES-1][gv];
     end
     assign valid_to_bus_p = valid_to_bus_t[NUM_STAGES-1];
     
	 ////////////////////////////////////////////////////////////////////////////////
	reg [DATA_LEN-1:0] data_bus_t[0:NUM_STAGES-1][0:NUM_PE-1];
	reg [BUS_ADDR_LEN-1:0] addr_bus_t[0:NUM_STAGES-1][0:NUM_PE-1];
	reg [NUM_PE-1:0] wr_to_bus_t[0:NUM_STAGES-1];
	reg [NUM_PE-1:0] rd_from_bus_t[0:NUM_STAGES-1];
	reg [NUM_PE-1:0] rd_from_bus_tt[0:NUM_STAGES-1];
	reg [NUM_PE-1:0] rd_from_bus_ttt[0:NUM_STAGES-1];
	
    for(genvar gv =0;gv< NUM_STAGES;gv=gv+1) begin
    for(genvar gv2 =0;gv2< NUM_PE;gv2=gv2+1) begin
        always @(posedge clk or negedge rstn)
            begin
                if(~rstn) begin
                    data_bus_t[gv][gv2] <= {DATA_LEN{1'b0}};
                    addr_bus_t[gv][gv2] <= {BUS_ADDR_LEN{1'b0}};
				end
                else begin
                    data_bus_t[gv][gv2] <= (gv == 0) ? data_bus : data_bus_t[gv-1][gv2];
                    addr_bus_t[gv][gv2] <= (gv == 0) ? addr_bus : addr_bus_t[gv-1][gv2];
				end
            end
     end
     end
     for(genvar gv =0;gv< NUM_STAGES;gv=gv+1)
        begin
        always @(posedge clk or negedge rstn)
            begin
                if(~rstn) begin
                    wr_to_bus_t[gv] <= {NUM_PE{1'b0}};
                    rd_from_bus_t[gv] <= {NUM_PE{1'b0}};
                    rd_from_bus_tt[gv] <= {NUM_PE{1'b0}};
                    rd_from_bus_ttt[gv] <= {NUM_PE{1'b0}};
				end
                else begin
                    wr_to_bus_t[gv] <= (gv == 0) ? wr_to_bus : wr_to_bus_t[gv-1];
                    rd_from_bus_t[gv] <= (gv == 0) ? rd_from_bus : rd_from_bus_t[gv-1];
                    rd_from_bus_tt[gv] <= (gv == 0) ? rd_from_bus_t[NUM_STAGES-1] : rd_from_bus_tt[gv-1];
                    rd_from_bus_ttt[gv] <= (gv == 0) ? rd_from_bus_tt[NUM_STAGES-1] : rd_from_bus_ttt[gv-1];
				end
            end
         end
     for(genvar gv =0;gv< NUM_PE;gv=gv+1) begin
         assign data_bus_p[gv] = data_bus_t[NUM_STAGES-1][gv];
         assign addr_bus_p[gv] = addr_bus_t[NUM_STAGES-1][gv];
     end
     assign wr_to_bus_p = wr_to_bus_t[NUM_STAGES-1];
     `ifdef USE_TRI_STATE
        assign rd_from_bus_p = rd_from_bus_ttt[NUM_STAGES-1];
     `else
        assign rd_from_bus_p = rd_from_bus_t[NUM_STAGES-1];
     `endif
	 
end    
else begin
    for(genvar gv =0;gv< NUM_PE;gv=gv+1) begin
        assign addr_to_bus_p[gv] = addr_to_bus[gv];
        assign data_to_bus_p[gv] = data_to_bus[gv];
        assign rd_buffer_full_p[gv] = rd_buffer_full[gv];
    end
	assign valid_to_bus_p = valid_to_bus;
	
	
	for(genvar gv2 =0;gv2< NUM_PE;gv2=gv2+1)
        begin
        assign data_bus_p[gv2] = data_bus;
        assign addr_bus_p[gv2] = addr_bus;
    end
    assign wr_to_bus_p = wr_to_bus;
    assign rd_from_bus_p = rd_from_bus;
end
endgenerate

endmodule
