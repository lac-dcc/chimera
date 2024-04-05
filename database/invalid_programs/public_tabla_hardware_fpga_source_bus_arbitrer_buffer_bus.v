`ifdef FPGA
	`include "log.vh"
`endif

module buffer_bus #(
	parameter DATA_LEN = 16,
	parameter BUS_ADDR_LEN = 3,
	parameter ADDR_LEN = `C_LOG_2(`BUS_FIFO_DEPTH),
	parameter DEPTH = `BUS_FIFO_DEPTH
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
	output  src_valid_r,

	output reg rd_buffer_full

);

reg [BUS_ADDR_LEN-1:0] src_addr;
reg src_rq;
reg src_valid_retain;
wire src_valid_w;

assign src_valid_r = src_valid_retain || src_valid_w;
always @(posedge clk or negedge rstn) begin
    if(~rstn) begin
        src_addr <= {BUS_ADDR_LEN{1'b0}};
        src_rq <= 1'b0;
        src_valid_retain <= 1'b0;
    end
    else if(~stall) begin
        src_addr <= src_addr_in;
        src_rq <= src_rq_in;
        src_valid_retain <= 1'b0;
    end
    else begin
        src_addr <= src_addr;
        src_rq <= src_valid_w ? 1'b0:src_rq;
        src_valid_retain <= src_valid_w ? 1'b1 : src_valid_retain ;
    end
//    else if(~src_rq || src_valid_w) begin
//        src_addr <= stall? src_addr :src_addr_in;
//        src_rq <= (stall && src_valid_w) ? 1'b0 :(stall? src_rq :src_rq_in);
//    end
end
reg [DATA_LEN+BUS_ADDR_LEN:0] data_to_reg;
wire [DATA_LEN+BUS_ADDR_LEN:0] data_to_reg_w;
reg [DATA_LEN+BUS_ADDR_LEN:0] data_to_reg_q;
reg [DATA_LEN+BUS_ADDR_LEN:0] reg_bank[DEPTH-1:0];

wire [DEPTH-1:0] rqd_data,rqd_data_mask,rqd_data_encoded,shift_en_qualifier,valid_rearranged;
wire [DEPTH-1:0] shift_en,shift_en_qualifier_w;

wire [DEPTH-1:0] data_rearranged[0:DATA_LEN-1];
wire [DATA_LEN-1:0] data_muxed;
wire rd_buffer_full_w; //src_valid_w,

assign data_to_reg_w = {data_from_bus,addr_from_bus,valid_from_bus};

always @(posedge clk or negedge rstn) begin
	if(~rstn)
		data_to_reg <= {DATA_LEN+BUS_ADDR_LEN+1{1'b0}};
	else if(data_to_reg_q[0] && (~rd_buffer_full_w|| src_valid_w))
		data_to_reg <= data_to_reg_q;
  else if(~rd_buffer_full_w|| src_valid_w)
    data_to_reg <= {DATA_LEN+BUS_ADDR_LEN+1{1'b0}};
end

always @(posedge clk or negedge rstn) begin
	if(~rstn)
		data_to_reg_q <= {DATA_LEN+BUS_ADDR_LEN+1{1'b0}};
	else if(data_to_reg_w[0] )//&& (~rd_buffer_full_w || src_valid_w))
		data_to_reg_q <= data_to_reg_w;
  else //if(~rd_buffer_full_w)
    data_to_reg_q <= {DATA_LEN+BUS_ADDR_LEN+1{1'b0}};
end

genvar gv,gv1,gv2;

generate
	for( gv=1 ; gv <DEPTH ; gv = gv+1) begin
		always @(posedge clk or negedge rstn) begin
			if(~rstn)
				reg_bank[gv] <= {DATA_LEN+BUS_ADDR_LEN+1{1'b0}};
			else if(shift_en[gv])
				reg_bank[gv] <= reg_bank[gv-1];
      else
        reg_bank[gv] <= (gv == DEPTH-1)? reg_bank[gv] : ((shift_en[gv+1]||rqd_data_encoded[gv]) ? {DATA_LEN+BUS_ADDR_LEN+1{1'b0}} : reg_bank[gv]);
		end
		assign rqd_data[gv] = (reg_bank[gv][BUS_ADDR_LEN:1] == src_addr)&&reg_bank[gv][0]&&src_rq;
	end
endgenerate

always @(posedge clk or negedge rstn) begin
	if(~rstn)
		reg_bank[0] <= {DATA_LEN+BUS_ADDR_LEN+1{1'b0}};
	else if(shift_en[0])
		reg_bank[0] <= data_to_reg;
	else if(shift_en[1]||rqd_data_encoded[0])
		reg_bank[0] <= {DATA_LEN+BUS_ADDR_LEN+1{1'b0}};
end

assign rqd_data[0] = (reg_bank[0][BUS_ADDR_LEN:1] == src_addr)&&reg_bank[0][0]&&src_rq;

assign rqd_data_mask = {1'b0,rqd_data_mask[DEPTH-1:1]}|{1'b0,rqd_data[DEPTH-1:1]};

assign rqd_data_encoded = rqd_data & ~rqd_data_mask; //{1'b1,~rqd_data_encoded[DEPTH-1:1]};
assign src_valid_w = |rqd_data;

assign rd_buffer_full_w = (&valid_rearranged[DEPTH-2:0])&&(valid_rearranged[DEPTH-1]||data_to_reg[0]);

generate
	for( gv1=0 ; gv1 <DEPTH ; gv1 = gv1+1) begin
		for( gv2=0 ; gv2 <DATA_LEN ; gv2 = gv2+1) begin
			assign data_rearranged[gv2][gv1] = reg_bank[gv1][BUS_ADDR_LEN+1+gv2] && rqd_data_encoded[gv1];
		end
		assign valid_rearranged[gv1] = reg_bank[gv1][0];
		
	end
	for( gv1=0 ; gv1 <DATA_LEN ; gv1 = gv1+1) begin
		assign data_muxed[gv1] = |data_rearranged[gv1];
	end

endgenerate

//always @(posedge clk or negedge rstn) begin
//	if(~rstn) 
//		shift_en <= {DEPTH{1'b0}};
//	else
assign	shift_en = {valid_rearranged[DEPTH-2:0],data_to_reg[0]}&~{rqd_data_encoded[DEPTH-2:0],1'b0} & (~{valid_rearranged[DEPTH-1:0]} | {1'b0,shift_en[DEPTH-1:1]} | rqd_data_encoded);
//end

assign src_data_w = data_muxed;
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
//		src_data <= {DATA_LEN{1'b0}};
//		src_valid <= 1'b0;
		rd_buffer_full <= 1'b0;
	end
  else begin 
//    if(~src_valid || ~stall) begin 
//		src_data <= data_muxed;
//		src_valid <= src_valid_w;
//	end
		rd_buffer_full <= rd_buffer_full_w;
	end
end

endmodule

