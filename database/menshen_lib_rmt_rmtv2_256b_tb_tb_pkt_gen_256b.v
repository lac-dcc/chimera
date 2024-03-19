`timescale 1ns / 1ps

module tb_pkt_gen #(
	parameter C_S_AXIS_DATA_WIDTH = 256,
	parameter C_S_AXIS_TUSER_WIDTH = 128
)();

localparam CYCLE = 4;

reg								clk;
reg								aresetn;
reg								start;
reg [15:0]						pkt_len;

reg [C_S_AXIS_DATA_WIDTH-1:0]		s_axis_tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]	s_axis_tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		s_axis_tuser;
reg									s_axis_tvalid;
wire								s_axis_tready;
reg									s_axis_tlast;

wire [C_S_AXIS_DATA_WIDTH-1:0]		    m_axis_tdata;
wire [((C_S_AXIS_DATA_WIDTH/8))-1:0]    m_axis_tkeep;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		    m_axis_tuser;
wire								    m_axis_tvalid;
reg										m_axis_tready;
wire									m_axis_tlast;


always begin
	#(CYCLE/2) clk = ~clk;
end

initial begin
	clk = 0;
	aresetn = 1;
	start = 0;
	pkt_len = 1;
	m_axis_tready = 1;

	#100;
	aresetn = 0; // reset all the values
	#100;
	aresetn = 1;
	start = 1;
end

rmt_wrapper #(
	.C_S_AXI_DATA_WIDTH(),
	.C_S_AXI_ADDR_WIDTH(),
	.C_BASEADDR(),
	.C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
	.C_S_AXIS_TUSER_WIDTH(),
	.C_M_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
	.PHV_ADDR_WIDTH()
)rmt_wrapper_ins
(
	.clk(clk),		// axis clk
	.aresetn(aresetn),	

	// input Slave AXI Stream
	.s_axis_tdata(s_axis_tdata),
	.s_axis_tkeep(s_axis_tkeep),
	.s_axis_tuser(s_axis_tuser),
	.s_axis_tvalid(s_axis_tvalid),
	.s_axis_tready(s_axis_tready),
	.s_axis_tlast(s_axis_tlast),

	// output Master AXI Stream
	.m_axis_tdata(m_axis_tdata),
	.m_axis_tkeep(m_axis_tkeep),
	.m_axis_tuser(m_axis_tuser),
	.m_axis_tvalid(m_axis_tvalid),
	.m_axis_tready(1'b1),
	.m_axis_tlast(m_axis_tlast)
	
);


reg [63:0] counter;
reg [63:0] c_counter, c_counter_next;
reg [63:0] cycle_counter;
reg [63:0] byte_counter;
reg [63:0] snd_counter, snd_counter_next;
reg [63:0] rcv_counter;

localparam	PKT_0=0,
			PKT_1=1;

reg [C_S_AXIS_DATA_WIDTH-1:0]		tdata;
reg [((C_S_AXIS_DATA_WIDTH/8))-1:0]	tkeep;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		tuser;
reg									tvalid;
reg									tlast;

reg [2:0] state, state_next;


always @(*) begin
	state_next = state;
	c_counter_next = c_counter;

	tdata = 0;
	tkeep = 0;
	tuser = 0;
	tlast = 0;
	tvalid = 0;

	snd_counter_next = snd_counter;

	case (state)
		PKT_0: begin
			if (start && s_axis_tready) begin
				tdata = 256'h6f6fd79b1140000001002e000045000802000081a401bdfefd3c050000000000;
				tkeep = {32{1'b1}};
				tuser = 0;
				tlast = 0;
				tvalid = 1;

				state_next = PKT_1;
				c_counter_next = 1;
			end
		end
		PKT_1: begin
			if (start && s_axis_tready) begin
				if (pkt_len > c_counter) begin
					tdata = c_counter + counter;
					tkeep = {32{1'b1}};
					tuser = 0;
					tlast = 0;
					tvalid = 1;

					c_counter_next = c_counter+1;
				end
				else begin
					tdata = c_counter + counter;
					tkeep = {32{1'b1}};
					tuser = 0;
					tlast = 1;
					tvalid = 1;
					state_next = PKT_0;
					c_counter_next = 0;

					snd_counter_next = snd_counter+1;
				end
			end
		end
	endcase
end

always @(posedge clk) begin
	if (~aresetn) begin
		counter <= 1;
		c_counter <= 0;
		cycle_counter <= 0;

		state <= PKT_0;

		snd_counter <= 0;
		//
		s_axis_tdata <= 0;
		s_axis_tkeep <= 0;
		s_axis_tuser <= 0;
		s_axis_tlast <= 0;
		s_axis_tvalid <= 0;
	end
	else begin
		state <= state_next;
		c_counter <= c_counter_next;
		if (start) begin
			cycle_counter <= cycle_counter+1;
		end
		snd_counter <= snd_counter_next;
		//
		s_axis_tdata <= tdata;
		s_axis_tkeep <= tkeep;
		s_axis_tuser <= tuser;
		s_axis_tlast <= tlast;
		s_axis_tvalid <= tvalid;
	end
end

// check
reg [63:0] check_seq_counter;
reg [63:0] check_counter;
reg [2:0] pk_start;
always@(posedge clk) begin
	if(~aresetn) begin
		check_counter <= 0;
		check_seq_counter <= 1;
		pk_start <= 1;
		byte_counter <= 0;

		rcv_counter <= 0;
	end
	if(m_axis_tvalid) begin
		check_counter <= check_counter +1;
		byte_counter <= byte_counter + 256/8;
		if (m_axis_tlast) begin
			rcv_counter <= rcv_counter+1;
		end
		if(pk_start == 1) begin
			pk_start <= 2;
		end
		else if (pk_start == 2) begin
			check_seq_counter = m_axis_tdata - check_counter;
			pk_start <= 0;
		end
		else if(!m_axis_tlast) begin
			if(m_axis_tkeep != {32{1'b1}}) begin
				$display("ERROR in compare %x with %x", m_axis_tdata, check_counter + check_seq_counter);
			end
		end
		else if(m_axis_tlast) begin
			if(m_axis_tkeep != {32{1'b1}}) begin
				$display("ERROR in compare %x with %x", m_axis_tdata, check_counter + check_seq_counter);
			end
			$display("DEBUG, received: %d", m_axis_tdata);
			// if (m_axis_tdata != 2) begin
			// 	$display("error, received: %d", m_axis_tdata);
			// 	$finish;
			// end
			pk_start <= 1;
			check_counter <= 0;
			check_seq_counter <= check_seq_counter + 1; 

		end
	end
end

always @(*) begin
	if (byte_counter >= 16000 * 70 || counter > 10000) begin
		// aresetn = 0;
		start = 0;

		// $finish;
	end
end

endmodule
