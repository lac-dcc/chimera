`timescale 1ns / 1ps

`define DEF_MAC_ADDR	48
`define DEF_VLAN		32
`define DEF_ETHTYPE		16

`define TYPE_IPV4		16'h0008
`define TYPE_ARP		16'h0608

`define PROT_ICMP		8'h01
`define PROT_TCP		8'h06
`define PROT_UDP		8'h11

`define SUB_PARSE(idx) \
	case(sub_parse_val_out_type[idx]) \
		2'b01: val_2B_nxt[sub_parse_val_out_seq[idx]] = sub_parse_val_out[idx][15:0]; \
		2'b10: val_4B_nxt[sub_parse_val_out_seq[idx]] = sub_parse_val_out[idx][31:0]; \
		2'b11: val_6B_nxt[sub_parse_val_out_seq[idx]] = sub_parse_val_out[idx][47:0]; \
	endcase \

`define SWAP_BYTE_ORDER(idx) \
	assign val_6B_swapped[idx] = {	val_6B[idx][0+:8], \
									val_6B[idx][8+:8], \
									val_6B[idx][16+:8], \
									val_6B[idx][24+:8], \
									val_6B[idx][32+:8], \
									val_6B[idx][40+:8]}; \
	assign val_4B_swapped[idx] = {	val_4B[idx][0+:8], \
									val_4B[idx][8+:8], \
									val_4B[idx][16+:8], \
									val_4B[idx][24+:8]}; \
	assign val_2B_swapped[idx] = {	val_2B[idx][0+:8], \
									val_2B[idx][8+:8]}; \

module parser_do_parsing #(
	parameter C_AXIS_DATA_WIDTH = 256,
	parameter C_AXIS_TUSER_WIDTH = 128,
	parameter PKT_HDR_LEN = (6+4+2)*8*8+256, // check with the doc
	parameter PARSER_MOD_ID = 3'b0,
	parameter C_NUM_SEGS = 4,
	parameter C_VLANID_WIDTH = 12
)
(
	input											axis_clk,
	input											aresetn,

	input [C_NUM_SEGS*C_AXIS_DATA_WIDTH-1:0]		tdata_segs,
	input [C_AXIS_TUSER_WIDTH-1:0]					tuser_1st,
	input											segs_valid,
	input [159:0]									bram_out,


	input											stg_ready_in,
	// output

	// phv output
	output reg										parser_valid,
	output reg [PKT_HDR_LEN-1:0]					pkt_hdr_vec,

	output reg [C_VLANID_WIDTH-1:0]					out_vlan,
	output reg										out_vlan_valid,
	input											out_vlan_ready

);

localparam			IDLE=0,
					WAIT_1CYCLE_RAM=1,
					START_SUB_PARSE=2,
					FINISH_SUB_PARSE=3,
					GET_PHV_OUTPUT=4,
					OUTPUT=5;
					

//
reg [PKT_HDR_LEN-1:0]	pkt_hdr_vec_next;
reg parser_valid_next;
reg [3:0] state, state_next;
reg [C_VLANID_WIDTH-1:0]	out_vlan_next;
reg							out_vlan_valid_next;

// parsing actions
wire [15:0] parse_action [0:9];		// we have 10 parse action

assign parse_action[9] = bram_out[0+:16];
assign parse_action[8] = bram_out[16+:16];
assign parse_action[7] = bram_out[32+:16];
assign parse_action[6] = bram_out[48+:16];
assign parse_action[5] = bram_out[64+:16];
assign parse_action[4] = bram_out[80+:16];
assign parse_action[3] = bram_out[96+:16];
assign parse_action[2] = bram_out[112+:16];
assign parse_action[1] = bram_out[128+:16];
assign parse_action[0] = bram_out[144+:16];


reg [9:0] sub_parse_act_valid;
reg [15:0] sub_parse_act [0:9];
wire [47:0] sub_parse_val_out [0:9];
wire [9:0] sub_parse_val_out_valid;
wire [1:0] sub_parse_val_out_type [0:9];
wire [2:0] sub_parse_val_out_seq [0:9];

reg [47:0] val_6B [0:7];
reg [31:0] val_4B [0:7];
reg [15:0] val_2B [0:7];
reg [47:0] val_6B_nxt [0:7];
reg [31:0] val_4B_nxt [0:7];
reg [15:0] val_2B_nxt [0:7];

wire [47:0] val_6B_swapped [0:7];
wire [31:0] val_4B_swapped [0:7];
wire [15:0] val_2B_swapped [0:7];

`SWAP_BYTE_ORDER(0)
`SWAP_BYTE_ORDER(1)
`SWAP_BYTE_ORDER(2)
`SWAP_BYTE_ORDER(3)
`SWAP_BYTE_ORDER(4)
`SWAP_BYTE_ORDER(5)
`SWAP_BYTE_ORDER(6)
`SWAP_BYTE_ORDER(7)

always @(*) begin
	state_next = state;
	//
	parser_valid_next = 0;
	pkt_hdr_vec_next = pkt_hdr_vec;
	//
	out_vlan_next = out_vlan;
	out_vlan_valid_next = 0;
	//
	val_2B_nxt[0]=val_2B[0];
	val_2B_nxt[1]=val_2B[1];
	val_2B_nxt[2]=val_2B[2];
	val_2B_nxt[3]=val_2B[3];
	val_2B_nxt[4]=val_2B[4];
	val_2B_nxt[5]=val_2B[5];
	val_2B_nxt[6]=val_2B[6];
	val_2B_nxt[7]=val_2B[7];
	val_4B_nxt[0]=val_4B[0];
	val_4B_nxt[1]=val_4B[1];
	val_4B_nxt[2]=val_4B[2];
	val_4B_nxt[3]=val_4B[3];
	val_4B_nxt[4]=val_4B[4];
	val_4B_nxt[5]=val_4B[5];
	val_4B_nxt[6]=val_4B[6];
	val_4B_nxt[7]=val_4B[7];
	val_6B_nxt[0]=val_6B[0];
	val_6B_nxt[1]=val_6B[1];
	val_6B_nxt[2]=val_6B[2];
	val_6B_nxt[3]=val_6B[3];
	val_6B_nxt[4]=val_6B[4];
	val_6B_nxt[5]=val_6B[5];
	val_6B_nxt[6]=val_6B[6];
	val_6B_nxt[7]=val_6B[7];
	//
	sub_parse_act_valid = 10'b0;
	//

	case (state)
		IDLE: begin
			if (segs_valid) begin
				out_vlan_next = tdata_segs[116+:12];
				sub_parse_act_valid = 10'b1111111111;
				state_next = FINISH_SUB_PARSE;
			end
		end
		FINISH_SUB_PARSE: begin
			state_next = GET_PHV_OUTPUT;

			`SUB_PARSE(0)
			`SUB_PARSE(1)
			`SUB_PARSE(2)
			`SUB_PARSE(3)
			`SUB_PARSE(4)
			`SUB_PARSE(5)
			`SUB_PARSE(6)
			`SUB_PARSE(7)
			`SUB_PARSE(8)
			`SUB_PARSE(9)
		end
		GET_PHV_OUTPUT: begin
			if (out_vlan_ready) begin
				out_vlan_valid_next = 1;
			end
			state_next = OUTPUT;
			pkt_hdr_vec_next ={val_6B_swapped[7], val_6B_swapped[6], val_6B_swapped[5], val_6B_swapped[4], val_6B_swapped[3], val_6B_swapped[2], val_6B_swapped[1], val_6B_swapped[0],
							val_4B_swapped[7], val_4B_swapped[6], val_4B_swapped[5], val_4B_swapped[4], val_4B_swapped[3], val_4B_swapped[2], val_4B_swapped[1], val_4B_swapped[0],
							val_2B_swapped[7], val_2B_swapped[6], val_2B_swapped[5], val_2B_swapped[4], val_2B_swapped[3], val_2B_swapped[2], val_2B_swapped[1], val_2B_swapped[0],
							// Tao: manually set output port to 1 for eazy test
							// {115{1'b0}}, vlan_id, 1'b0, tuser_1st[127:32], 8'h04, tuser_1st[23:0]};
							{115{1'b0}}, out_vlan, 1'b0, tuser_1st[127:32], 8'h04, tuser_1st[23:0]};
							// {115{1'b0}}, vlan_id, 1'b0, tuser_1st};
							// {128{1'b0}}, tuser_1st[127:32], 8'h04, tuser_1st[23:0]};
		end
		OUTPUT: begin
			if (stg_ready_in) begin
				parser_valid_next = 1;
				state_next = IDLE;
				
				// zero out
				val_2B_nxt[0]=0;
				val_2B_nxt[1]=0;
				val_2B_nxt[2]=0;
				val_2B_nxt[3]=0;
				val_2B_nxt[4]=0;
				val_2B_nxt[5]=0;
				val_2B_nxt[6]=0;
				val_2B_nxt[7]=0;
				val_4B_nxt[0]=0;
				val_4B_nxt[1]=0;
				val_4B_nxt[2]=0;
				val_4B_nxt[3]=0;
				val_4B_nxt[4]=0;
				val_4B_nxt[5]=0;
				val_4B_nxt[6]=0;
				val_4B_nxt[7]=0;
				val_6B_nxt[0]=0;
				val_6B_nxt[1]=0;
				val_6B_nxt[2]=0;
				val_6B_nxt[3]=0;
				val_6B_nxt[4]=0;
				val_6B_nxt[5]=0;
				val_6B_nxt[6]=0;
				val_6B_nxt[7]=0;
			end
		end
	endcase
end



always @(posedge axis_clk) begin
	if (~aresetn) begin
		state <= IDLE;
		//
		pkt_hdr_vec <= 0;
		parser_valid <= 0;
		//
		out_vlan <= 0;
		out_vlan_valid <= 0;
		//
		val_2B[0] <= 0;
		val_2B[1] <= 0;
		val_2B[2] <= 0;
		val_2B[3] <= 0;
		val_2B[4] <= 0;
		val_2B[5] <= 0;
		val_2B[6] <= 0;
		val_2B[7] <= 0;
		val_4B[0] <= 0;
		val_4B[1] <= 0;
		val_4B[2] <= 0;
		val_4B[3] <= 0;
		val_4B[4] <= 0;
		val_4B[5] <= 0;
		val_4B[6] <= 0;
		val_4B[7] <= 0;
		val_6B[0] <= 0;
		val_6B[1] <= 0;
		val_6B[2] <= 0;
		val_6B[3] <= 0;
		val_6B[4] <= 0;
		val_6B[5] <= 0;
		val_6B[6] <= 0;
		val_6B[7] <= 0;
	end
	else begin
		state <= state_next;
		//
		pkt_hdr_vec <= pkt_hdr_vec_next;
		parser_valid <= parser_valid_next;
		//
		out_vlan <= out_vlan_next;
		out_vlan_valid <= out_vlan_valid_next;
		//
		val_2B[0] <= val_2B_nxt[0];
		val_2B[1] <= val_2B_nxt[1];
		val_2B[2] <= val_2B_nxt[2];
		val_2B[3] <= val_2B_nxt[3];
		val_2B[4] <= val_2B_nxt[4];
		val_2B[5] <= val_2B_nxt[5];
		val_2B[6] <= val_2B_nxt[6];
		val_2B[7] <= val_2B_nxt[7];
		val_4B[0] <= val_4B_nxt[0];
		val_4B[1] <= val_4B_nxt[1];
		val_4B[2] <= val_4B_nxt[2];
		val_4B[3] <= val_4B_nxt[3];
		val_4B[4] <= val_4B_nxt[4];
		val_4B[5] <= val_4B_nxt[5];
		val_4B[6] <= val_4B_nxt[6];
		val_4B[7] <= val_4B_nxt[7];
		val_6B[0] <= val_6B_nxt[0];
		val_6B[1] <= val_6B_nxt[1];
		val_6B[2] <= val_6B_nxt[2];
		val_6B[3] <= val_6B_nxt[3];
		val_6B[4] <= val_6B_nxt[4];
		val_6B[5] <= val_6B_nxt[5];
		val_6B[6] <= val_6B_nxt[6];
		val_6B[7] <= val_6B_nxt[7];
	end
end

// =============================================================== //
// sub parser
generate
	genvar index;
	for (index=0; index<10; index=index+1) begin:
		sub_op
		sub_parser #(
			.PKTS_HDR_LEN(),
			.PARSE_ACT_LEN(),
			.VAL_OUT_LEN()
		)
		sub_parser (
			.clk				(axis_clk),
			.aresetn			(aresetn),

			.parse_act_valid	(sub_parse_act_valid[index]),
			// .parse_act			(sub_parse_act[index]),
			.parse_act			(parse_action[index]),

			.pkts_hdr			(tdata_segs),
			.val_out_valid		(sub_parse_val_out_valid[index]),
			.val_out			(sub_parse_val_out[index]),
			.val_out_type		(sub_parse_val_out_type[index]),
			.val_out_seq		(sub_parse_val_out_seq[index])
		);
	end
endgenerate


endmodule
