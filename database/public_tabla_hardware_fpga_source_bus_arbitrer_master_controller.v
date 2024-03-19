`ifdef FPGA
	`include "config.vh"
`endif
module master_controller #(
	parameter NUM_PE = 8,
	parameter DATA_LEN = 16,
	parameter BUS_ADDR_LEN = 3,
	parameter NUM_STAGES = 3
)
(
	input clk,
	input rstn,

	input [BUS_ADDR_LEN*NUM_PE-1:0] addr_to_bus_i,
	input [DATA_LEN*NUM_PE-1:0] data_to_bus_i,
	input [NUM_PE-1:0] valid_to_bus,

	input [NUM_PE*NUM_PE-1:0] rd_buffer_full_i,
	
	`ifdef USE_TRI_STATE
        input[DATA_LEN-1:0] data_bus,
        input[BUS_ADDR_LEN-1:0] addr_bus,
    `else
        output reg [DATA_LEN-1:0] data_bus,
        output reg [BUS_ADDR_LEN-1:0] addr_bus,
    `endif
	
	output [NUM_PE-1:0] wr_to_bus,
	output [NUM_PE-1:0] rd_from_bus
);

wire [BUS_ADDR_LEN-1:0] addr_to_bus[0:NUM_PE-1];
wire [DATA_LEN-1:0] data_to_bus[0:NUM_PE-1];
wire [NUM_PE-1:0] rd_buffer_full[0:NUM_PE-1];

generate
for(genvar i=0;i<NUM_PE;i=i+1) begin
	assign addr_to_bus[i] = addr_to_bus_i[(i+1)*BUS_ADDR_LEN-1: i*BUS_ADDR_LEN];
	assign data_to_bus[i] = data_to_bus_i[(i+1)*DATA_LEN-1: i*DATA_LEN];
	assign rd_buffer_full[i] = rd_buffer_full_i[(i+1)*NUM_PE-1: i*NUM_PE];
end
endgenerate
wire [DATA_LEN-1:0] data_bus_r;
wire [BUS_ADDR_LEN-1:0] addr_bus_r;
	
reg [NUM_PE-1:0] wr_to_bus_r;
wire actual_buffer_full;
reg [NUM_PE-1:0] wr_to_bus_d;
wire [NUM_PE-1:0] wr_to_bus_p;
reg [NUM_PE-1:0] pe_priority,valid,buffer_full;
reg [BUS_ADDR_LEN-1:0] addr[NUM_PE-1:0];
reg [DATA_LEN-1:0] data[NUM_PE-1:0];
wire [NUM_PE-1:0] valid_masked;

wire [NUM_PE-1:0] bus_control,bus_control_1,bus_control_2,bus_control_q1,bus_control_q2;
wire [BUS_ADDR_LEN-1:0] addr_temp[NUM_PE-1:0];
wire [NUM_PE-1:0] addr_rearranged[BUS_ADDR_LEN-1:0];
wire [BUS_ADDR_LEN-1:0] addr_final;
reg [NUM_PE-1:0] rd_from_bus_q,rd_from_bus_q2;
genvar i,j;

generate
if(NUM_STAGES == 0 ) begin
    assign wr_to_bus_p = {NUM_PE{1'b0}};
end
else begin
    localparam NUM_STAGES2 = 2*NUM_STAGES;
    reg [NUM_PE-1:0] wr_to_bus_t[0:NUM_STAGES2-1];
    for(genvar gv =0;gv< NUM_STAGES2;gv=gv+1)
        begin
            always @(posedge clk or negedge rstn)
            begin
                if(~rstn)
                    wr_to_bus_t[gv] <= {NUM_PE{1'b0}};
                else
                    wr_to_bus_t[gv] <= (gv == 0) ? wr_to_bus_d : wr_to_bus_t[gv-1];
            end
        end
    wire [NUM_STAGES2-1:0] wr_to_bus_t_r[0:NUM_PE-1];
    for(genvar gv =0;gv< NUM_PE;gv=gv+1)
        begin
        for(genvar gv2 =0;gv2< NUM_STAGES2;gv2=gv2+1) begin
            assign wr_to_bus_t_r[gv][gv2] = wr_to_bus_t[gv2][gv];
        end
        assign  wr_to_bus_p[gv] =  |wr_to_bus_t_r[gv];
     end
end
endgenerate

wire [NUM_PE-1:0] rd_buffer_full_w;
generate
	for( i=0 ; i <NUM_PE ; i = i+1) begin
	   assign rd_buffer_full_w[i] = |rd_buffer_full[i];
	end
endgenerate

always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		pe_priority <= {1'b1,{NUM_PE-1{1'b1}}};
		valid <= {NUM_PE{1'b0}};
//		buffer_full <= {NUM_PE{1'b0}};
	end
	else begin
		pe_priority <= pe_priority[NUM_PE-2] ? {pe_priority[NUM_PE-2:0],1'b0} :{1'b1,{NUM_PE-1{1'b1}}} ;
		valid <= valid_to_bus & ~bus_control & ~wr_to_bus_r & ~wr_to_bus_d&~wr_to_bus_p;
//		buffer_full <= rd_buffer_full;
	end
end

assign valid_masked = valid & pe_priority;



generate
	for( i=0 ; i <NUM_PE ; i = i+1) begin
	   	always @(posedge clk) begin
           		addr[i] <= addr_to_bus[i][BUS_ADDR_LEN-1:0];
           		data[i] <= data_to_bus[i];
        	end
		assign bus_control_q1[i] = i == 0 ? 1'b0 : bus_control_1[i-1] ||bus_control_q1[i-1];
		assign bus_control_q2[i] = i == 0 ? 1'b0 : bus_control_2[i-1] ||bus_control_q2[i-1];

		assign bus_control_1[i] =  valid[i] &&(~bus_control_q1[i])&&(~rd_buffer_full[addr[i]]);
		assign bus_control_2[i] =  valid_masked[i] &&(~bus_control_q2[i])&&(~rd_buffer_full[addr[i]][i]);
		assign addr_temp[i] = addr[i] & {BUS_ADDR_LEN{bus_control[i]}};
	end
endgenerate


assign bus_control = (|bus_control_2) ? bus_control_2 : bus_control_1;

generate
	for( i=0 ; i <BUS_ADDR_LEN ; i = i+1) begin
		for( j=0 ; j <NUM_PE ; j = j+1) begin
			assign addr_rearranged[i][j] = addr_temp[j][i];
		end
		assign addr_final[i] = |addr_rearranged[i];
	end
endgenerate


assign actual_buffer_full = |(rd_buffer_full[addr_final]&bus_control);



always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		rd_from_bus_q <= {NUM_PE{1'b0}};
		rd_from_bus_q2 <= {NUM_PE{1'b0}};
		wr_to_bus_r <= {NUM_PE{1'b0}};
		wr_to_bus_d <= {NUM_PE{1'b0}};
	end
	else begin
		rd_from_bus_q <= actual_buffer_full? {NUM_PE{1'b0}}:(1<<addr_final) & {NUM_PE{|bus_control}};
		rd_from_bus_q2 <=  rd_from_bus_q;
		wr_to_bus_r <= actual_buffer_full? {NUM_PE{1'b0}}:bus_control;
		wr_to_bus_d <= wr_to_bus_r;
	end
end
assign wr_to_bus = wr_to_bus_r;

`ifndef USE_TRI_STATE
    reg [DATA_LEN-1:0] data_bus_d;
    reg [BUS_ADDR_LEN-1:0] addr_bus_d;
    wire [DATA_LEN-1:0] data_bus_t[0:NUM_PE-1];
    wire [NUM_PE-1:0] data_bus_t_r[0:DATA_LEN-1];
    wire [BUS_ADDR_LEN-1:0] addr_bus_t[0:NUM_PE-1];
    wire [NUM_PE-1:0] addr_bus_t_r[0:BUS_ADDR_LEN-1];

    generate 
    for(genvar i=0;i<NUM_PE;i=i+1) begin
        assign data_bus_t[i] = data[i] &{DATA_LEN{bus_control[i]}};
        assign addr_bus_t[i] = i &{BUS_ADDR_LEN{bus_control[i]}};
    end
    for(genvar i=0;i<NUM_PE;i=i+1) begin
        for(genvar j=0;j<DATA_LEN;j=j+1) begin
            assign data_bus_t_r[j][i] = data_bus_t[i][j];
        end
    end
    for(genvar i=0;i<NUM_PE;i=i+1) begin
        for(genvar j=0;j<BUS_ADDR_LEN;j=j+1) begin
            assign addr_bus_t_r[j][i] = addr_bus_t[i][j];
        end
    end
    
    for(genvar j=0;j<DATA_LEN;j=j+1) begin
        assign data_bus_r[j] = |data_bus_t_r[j];
    end
    for(genvar j=0;j<BUS_ADDR_LEN;j=j+1) begin
        assign addr_bus_r[j] = |addr_bus_t_r[j];
    end
    endgenerate
    
    
//    always @(*) 
//    begin
//       data_bus_r = {DATA_LEN{1'b0}};
//       addr_bus_r = {BUS_ADDR_LEN{1'b0}};
//       for(genvar i1 = 0; i1 < NUM_PE; i1=i1+1) begin
//          if (bus_control == (1 << i)) begin 
//             data_bus_r = data[i];
//             addr_bus_r = i;
//          end
//       end
//    end
    
    always @(posedge clk) begin
        if(~rstn) begin
            data_bus_d <= {NUM_PE{1'b0}};
            data_bus <= {NUM_PE{1'b0}};
            addr_bus_d <= {BUS_ADDR_LEN{1'b0}};
            addr_bus <= {BUS_ADDR_LEN{1'b0}};
        end
        else begin
            data_bus_d <= data_bus_r;
            data_bus <= data_bus_d;
            addr_bus_d <= addr_bus_r;
            addr_bus <= addr_bus_d;
        end
    end
    assign rd_from_bus = rd_from_bus_q;
`else
assign rd_from_bus = rd_from_bus_q;
`endif
endmodule
