`timescale 1ns / 1ps

module tb_bram #(
	parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128
)
();
reg				                        clk;
reg				                        rst_n;

reg  [4:0]								addrb;
wire [159:0]                            bram_out;

reg [4:0]								addra;
reg [159:0]								dataa;
reg wr_en;

wire empty, nearly_full;

reg [3:0] data_in;
reg data_rd_en, data_wr_en;
wire [3:0] data_out;

//clk signal
localparam CYCLE = 10;

always begin
    #(CYCLE/2) clk = ~clk;
end

//reset signal
initial begin
    clk = 0;
    rst_n = 1;
    #(10);
    rst_n = 0; //reset all the values
    #(10);
    rst_n = 1;
end

reg vlan_id_valid;

initial begin
    #(2*CYCLE+CYCLE/2)
   


	addra <= 1;
	dataa <= 160'h1111111111111111111111111111111111111111;
	wr_en <= 1;
	#CYCLE
	wr_en <= 0;
	#(10*CYCLE)
	addra <= 2;
	dataa <= 160'h2222222222222222222222222222222222222222;
	wr_en <= 1;
	#CYCLE
	wr_en <= 0;
	#(10*CYCLE)
	addra <= 3;
	dataa <= 160'h3333333333333333333333333333333333333333;
	wr_en <= 1;
	#CYCLE
	wr_en <= 0;
	#(10*CYCLE)


	vlan_id_valid <= 1;
	addrb <= 1;
    #CYCLE
	addrb <= 2;
    #CYCLE
	addrb <= 3;
    #CYCLE
	addrb <= 1;
    #CYCLE
	addrb <= 2;
    #CYCLE
	addrb <= 3;
    #CYCLE
	addrb <= 1;
    #CYCLE
	addrb <= 2;
    #CYCLE
	addrb <= 3;
    #CYCLE
	vlan_id_valid <= 0;
    #CYCLE
    #CYCLE
    #CYCLE
    #CYCLE
    #CYCLE
	data_in <= 4;
	data_wr_en <= 1;
	#CYCLE
	data_wr_en <= 0;
	#CYCLE
	#CYCLE
	#CYCLE
	#CYCLE
	#CYCLE
	#CYCLE
	#CYCLE
	#CYCLE
	data_rd_en <= 1;
	#CYCLE
	data_rd_en <= 0;


    #(40*CYCLE);
end

localparam	BRAM_IDLE=0,
			BRAM_CYCLE_1=1,
			BRAM_CYCLE_2=2,
			BRAM_CYCLE_3=3;

reg [2:0] bram_state, bram_state_next;
reg out_bram_valid_next, out_bram_valid;

always @(*) begin
	bram_state_next = bram_state;

	out_bram_valid_next = 0;

	case (bram_state) 
		BRAM_IDLE: begin
			if (vlan_id_valid) begin
				bram_state_next = BRAM_CYCLE_1;
			end
		end
		BRAM_CYCLE_1: begin
			if (vlan_id_valid) begin
				bram_state_next = BRAM_CYCLE_1;
			end
			else begin
				bram_state_next = BRAM_IDLE;
			end
			out_bram_valid_next = 1;
		end
	endcase
end

always @(posedge clk) begin
	if (~rst_n) begin
		bram_state <= BRAM_IDLE;

		out_bram_valid <= 0;

	end
	else begin

		bram_state <= bram_state_next;
		out_bram_valid <= out_bram_valid_next;
	end
end

parse_act_ram_ip
parse_act_ram_0
(
	// write port
	.clka		(clk),
	.addra		(addra),
	.dina		(dataa),
	.ena		(1'b1),
	.wea		(wr_en),

	//
	.clkb		(clk),
	.addrb		(addrb), // TODO: note that we may change due to little or big endian
	.doutb		(bram_out),
	.enb		(1'b1) // always set to 1
);


fallthrough_small_fifo #(
	.WIDTH(4),
	.MAX_DEPTH_BITS(4)
)
fifo
(
	.din			(data_in),
	.wr_en			(data_wr_en),

	.dout			(data_out),
	.rd_en			(data_rd_en),

	.full			(),
	.prog_full		(),
	.nearly_full	(nearly_full),
	.empty			(empty),
	.reset			(~rst_n),
	.clk			(clk)
);

endmodule
