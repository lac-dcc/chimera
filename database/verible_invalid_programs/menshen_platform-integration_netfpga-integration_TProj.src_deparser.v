`timescale 1ns / 1ps

`define STATE_REASS_IDX_BITSIZE(idx, bit_size, ed_state, bytes) \
	STATE_REASS_``idx``_``bit_size: begin \
		case(parse_action[idx][3:1]) \
			0 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*0)+:(bit_size)]; \
			end \
			1 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*1)+:(bit_size)]; \
			end \
			2 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*2)+:(bit_size)]; \
			end \
			3 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*3)+:(bit_size)]; \
			end \
			4 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*4)+:(bit_size)]; \
			end \
			5 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*5)+:(bit_size)]; \
			end \
			6 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*6)+:(bit_size)]; \
			end \
			7 : begin \
				pkts_tdata_stored_r[(parse_action_ind[(idx)])*8 +:(bit_size)] = phv_fifo_out[(PHV_``bytes``B_START_POS+(bit_size)*7)+:(bit_size)]; \
			end \
			default : begin \
			end \
		endcase \
		state_next = (ed_state); \
	end \

`define STATE_REASSEMBLE_DATA(idx, ed_state) \
	REASSEMBLE_DATA_``idx: begin \
		if (parse_action[(idx)][0] == 1'b1) begin \
			case(parse_action[(idx)][5:4]) \
				1 : begin \
					state_next = STATE_REASS_``idx``_16; \
				end \
				2 : begin \
					state_next = STATE_REASS_``idx``_32; \
				end \
				3 : begin \
					state_next = STATE_REASS_``idx``_48; \
				end \
				default : begin \
				end \
			endcase \
		end \
		else begin \
			state_next = (ed_state); \
		end \
	end \


module deparser #(
	parameter	C_AXIS_DATA_WIDTH = 256,
	parameter	C_AXIS_TUSER_WIDTH = 128,
	parameter	C_PKT_VEC_WIDTH = (6+4+2)*8*8+20*5+256
)
(
	input									clk,
	input									aresetn,

	input [C_AXIS_DATA_WIDTH-1:0]			pkt_fifo_tdata,
	input [C_AXIS_DATA_WIDTH/8-1:0]			pkt_fifo_tkeep,
	input [C_AXIS_TUSER_WIDTH-1:0]			pkt_fifo_tuser,
	// input									pkt_fifo_tvalid,
	input									pkt_fifo_tlast,
	input									pkt_fifo_empty,
	output reg								pkt_fifo_rd_en,

	input [C_PKT_VEC_WIDTH-1:0]				phv_fifo_out,
	input									phv_fifo_empty,
	output reg								phv_fifo_rd_en,

	output reg [C_AXIS_DATA_WIDTH-1:0]		depar_out_tdata,
	output reg [C_AXIS_DATA_WIDTH/8-1:0]	depar_out_tkeep,
	output reg [C_AXIS_TUSER_WIDTH-1:0]		depar_out_tuser,
	output reg								depar_out_tvalid,
	output reg								depar_out_tlast,
	input									depar_out_tready
);

//=====================================deparser part
localparam WAIT_TILL_PARSE_DONE = 0; 
localparam WAIT_PKT_1 = 1;
localparam WAIT_PKT_2 = 2;
localparam WAIT_PKT_3 = 3;
localparam REASSEMBLE_DATA_0 = 4;
localparam REASSEMBLE_DATA_1 = 5;
localparam REASSEMBLE_DATA_2 = 6;
localparam STATE_REASS_0_16 = 7;
localparam STATE_REASS_0_32 = 8;
localparam STATE_REASS_0_48 = 9;
localparam STATE_REASS_1_16 = 10;
localparam STATE_REASS_1_32 = 11;
localparam STATE_REASS_1_48 = 12;
localparam STATE_REASS_2_16 = 13;
localparam STATE_REASS_2_32 = 14;
localparam STATE_REASS_2_48 = 15;
localparam FLUSH_PKT_0 = 16;
localparam FLUSH_PKT_1 = 17;
localparam FLUSH_PKT_2 = 18;
localparam FLUSH_PKT_3 = 19;
localparam FLUSH_PKT = 20;

reg [4*C_AXIS_DATA_WIDTH-1:0]		pkts_tdata_stored_r;
reg [4*C_AXIS_DATA_WIDTH-1:0]		pkts_tdata_stored;
reg [4*C_AXIS_TUSER_WIDTH-1:0]	pkts_tuser_stored_r;
reg [4*C_AXIS_TUSER_WIDTH-1:0]	pkts_tuser_stored;
reg [4*(C_AXIS_DATA_WIDTH/8)-1:0]	pkts_tkeep_stored_r;
reg [4*(C_AXIS_DATA_WIDTH/8)-1:0]	pkts_tkeep_stored;
reg [3:0]							pkts_tlast_stored_r;
reg [3:0]							pkts_tlast_stored;

reg [4:0] state, state_next;

reg [11:0] vlan_id; // vlan id
wire [259:0] bram_out;
wire [6:0] parse_action_ind [0:9];

wire [15:0] parse_action [0:9];		// we have 10 parse action

assign parse_action[9] = bram_out[100+:16];
assign parse_action[8] = bram_out[116+:16];
assign parse_action[7] = bram_out[132+:16];
assign parse_action[6] = bram_out[148+:16];
assign parse_action[5] = bram_out[164+:16];
assign parse_action[4] = bram_out[180+:16];
assign parse_action[3] = bram_out[196+:16];
assign parse_action[2] = bram_out[212+:16];
assign parse_action[1] = bram_out[228+:16];
assign parse_action[0] = bram_out[244+:16];

assign parse_action_ind[0] = parse_action[0][12:6];
assign parse_action_ind[1] = parse_action[1][12:6];
assign parse_action_ind[2] = parse_action[2][12:6];
assign parse_action_ind[3] = parse_action[3][12:6];
assign parse_action_ind[4] = parse_action[4][12:6];
assign parse_action_ind[5] = parse_action[5][12:6];
assign parse_action_ind[6] = parse_action[6][12:6];
assign parse_action_ind[7] = parse_action[7][12:6];
assign parse_action_ind[8] = parse_action[8][12:6];
assign parse_action_ind[9] = parse_action[9][12:6];

localparam PHV_2B_START_POS = 20*5+256;
localparam PHV_4B_START_POS = 20*5+256+16*8;
localparam PHV_6B_START_POS = 20*5+256+16*8+32*8;

always @(*) begin

	// remember to set depar_out_tdata, tuser, tkeep, tlast, tvalid
	depar_out_tdata = 0;
	depar_out_tuser = 0;
	depar_out_tkeep = 0;
	depar_out_tlast = 0;
	depar_out_tvalid = 0;
	// fifo rd signals
	pkt_fifo_rd_en = 0;
	phv_fifo_rd_en = 0;

	pkts_tdata_stored_r = pkts_tdata_stored;
	pkts_tuser_stored_r = pkts_tuser_stored;
	pkts_tkeep_stored_r = pkts_tkeep_stored;
	pkts_tlast_stored_r = pkts_tlast_stored;

	state_next = state;
	//
	case (state)
		WAIT_TILL_PARSE_DONE: begin // later will be modifed to PROCESSING done
			if (!pkt_fifo_empty && !phv_fifo_empty) begin // both pkt and phv fifo are not empty
				pkts_tdata_stored_r[0+:C_AXIS_DATA_WIDTH] = pkt_fifo_tdata;
				// pkts_tuser_stored_r[0+:C_S_AXIS_TUSER_WIDTH] = pkt_fifo_tuser;
				pkts_tuser_stored_r[0+:C_AXIS_TUSER_WIDTH] = phv_fifo_out[0+:128];
				pkts_tkeep_stored_r[0+:(C_AXIS_DATA_WIDTH/8)] = pkt_fifo_tuser;
				pkts_tlast_stored_r[0] = pkt_fifo_tlast;
				
				pkt_fifo_rd_en = 1;
				// vlan_id = pkt_fifo_tdata[120+:4];
				vlan_id = phv_fifo_out[129+:12];

				state_next = WAIT_PKT_1;
			end
		end
		WAIT_PKT_1: begin
			pkts_tdata_stored_r[(C_AXIS_DATA_WIDTH*1)+:C_AXIS_DATA_WIDTH] = pkt_fifo_tdata;
			pkts_tuser_stored_r[(C_AXIS_TUSER_WIDTH*1)+:C_AXIS_TUSER_WIDTH] = pkt_fifo_tuser;
			pkts_tkeep_stored_r[(C_AXIS_DATA_WIDTH/8*1)+:(C_AXIS_DATA_WIDTH/8)] = pkt_fifo_tkeep;
			pkts_tlast_stored_r[1] = pkt_fifo_tlast;

			pkt_fifo_rd_en = 1;
			if (pkt_fifo_tlast) begin
				state_next = REASSEMBLE_DATA_0;
			end
			else begin
				state_next = WAIT_PKT_2;
			end
		end
		WAIT_PKT_2: begin
			pkts_tdata_stored_r[(C_AXIS_DATA_WIDTH*2)+:C_AXIS_DATA_WIDTH] = pkt_fifo_tdata;
			pkts_tuser_stored_r[(C_AXIS_TUSER_WIDTH*2)+:C_AXIS_TUSER_WIDTH] = pkt_fifo_tuser;
			pkts_tkeep_stored_r[(C_AXIS_DATA_WIDTH/8*2)+:(C_AXIS_DATA_WIDTH/8)] = pkt_fifo_tkeep;
			pkts_tlast_stored_r[2] = pkt_fifo_tlast;

			pkt_fifo_rd_en = 1;
			if (pkt_fifo_tlast) begin
				state_next = REASSEMBLE_DATA_0;
			end
			else begin
				state_next = WAIT_PKT_3;
			end
		end
		WAIT_PKT_3: begin
			pkts_tdata_stored_r[(C_AXIS_DATA_WIDTH*3)+:C_AXIS_DATA_WIDTH] = pkt_fifo_tdata;
			pkts_tuser_stored_r[(C_AXIS_TUSER_WIDTH*3)+:C_AXIS_TUSER_WIDTH] = pkt_fifo_tuser;
			pkts_tkeep_stored_r[(C_AXIS_DATA_WIDTH/8*3)+:(C_AXIS_DATA_WIDTH/8)] = pkt_fifo_tkeep;
			pkts_tlast_stored_r[3] = pkt_fifo_tlast;

			pkt_fifo_rd_en = 1;
			state_next = REASSEMBLE_DATA_0;
		end

		`STATE_REASSEMBLE_DATA(0, REASSEMBLE_DATA_1)
		`STATE_REASS_IDX_BITSIZE(0, 16, REASSEMBLE_DATA_1, 2)
		`STATE_REASS_IDX_BITSIZE(0, 32, REASSEMBLE_DATA_1, 4)
		`STATE_REASS_IDX_BITSIZE(0, 48, REASSEMBLE_DATA_1, 6)
		`STATE_REASSEMBLE_DATA(1, REASSEMBLE_DATA_2)
		`STATE_REASS_IDX_BITSIZE(1, 16, REASSEMBLE_DATA_2, 2)
		`STATE_REASS_IDX_BITSIZE(1, 32, REASSEMBLE_DATA_2, 4)
		`STATE_REASS_IDX_BITSIZE(1, 48, REASSEMBLE_DATA_2, 6)
		`STATE_REASSEMBLE_DATA(2, FLUSH_PKT_0)
		`STATE_REASS_IDX_BITSIZE(2, 16, FLUSH_PKT_0, 2)
		`STATE_REASS_IDX_BITSIZE(2, 32, FLUSH_PKT_0, 4)
		`STATE_REASS_IDX_BITSIZE(2, 48, FLUSH_PKT_0, 6)

		// `STATE_REASSEMBLE_DATA(2, REASSEMBLE_DATA_2, REASSEMBLE_DATA_3)
		// `STATE_REASSEMBLE_DATA(3, REASSEMBLE_DATA_3, REASSEMBLE_DATA_4)
		// `STATE_REASSEMBLE_DATA(4, REASSEMBLE_DATA_4, REASSEMBLE_DATA_5)
		// `STATE_REASSEMBLE_DATA(5, REASSEMBLE_DATA_5, REASSEMBLE_DATA_6)
		// `STATE_REASSEMBLE_DATA(6, REASSEMBLE_DATA_6, REASSEMBLE_DATA_7)
		// `STATE_REASSEMBLE_DATA(7, REASSEMBLE_DATA_7, REASSEMBLE_DATA_8)
		// `STATE_REASSEMBLE_DATA(8, REASSEMBLE_DATA_8, REASSEMBLE_DATA_9)
		// `STATE_REASSEMBLE_DATA_LAST(9, REASSEMBLE_DATA_9, FLUSH_PKT_0)

		FLUSH_PKT_0: begin
			phv_fifo_rd_en = 1;
			depar_out_tdata = pkts_tdata_stored[(C_AXIS_DATA_WIDTH*0)+:C_AXIS_DATA_WIDTH];
			depar_out_tuser = pkts_tuser_stored[(C_AXIS_TUSER_WIDTH*0)+:C_AXIS_TUSER_WIDTH];
			depar_out_tkeep = pkts_tkeep_stored[(C_AXIS_DATA_WIDTH/8*0)+:(C_AXIS_DATA_WIDTH/8)];
			depar_out_tlast = pkts_tlast_stored[0];
			depar_out_tvalid = 1;

			if (depar_out_tready) begin
				if (pkts_tlast_stored[0]) begin
					state_next = WAIT_TILL_PARSE_DONE;
				end
				else begin
					state_next = FLUSH_PKT_1;
				end
			end
		end
		FLUSH_PKT_1: begin
			depar_out_tdata = pkts_tdata_stored[(C_AXIS_DATA_WIDTH*1)+:C_AXIS_DATA_WIDTH];
			depar_out_tuser = pkts_tuser_stored[(C_AXIS_TUSER_WIDTH*1)+:C_AXIS_TUSER_WIDTH];
			depar_out_tkeep = pkts_tkeep_stored[(C_AXIS_DATA_WIDTH/8*1)+:(C_AXIS_DATA_WIDTH/8)];
			depar_out_tlast = pkts_tlast_stored[1];
			depar_out_tvalid = 1;

			if (depar_out_tready) begin
				if (pkts_tlast_stored[1]) begin
					state_next = WAIT_TILL_PARSE_DONE;
				end
				else begin
					state_next = FLUSH_PKT_2;
				end
			end
		end
		FLUSH_PKT_2: begin
			depar_out_tdata = pkts_tdata_stored[(C_AXIS_DATA_WIDTH*2)+:C_AXIS_DATA_WIDTH];
			depar_out_tuser = pkts_tuser_stored[(C_AXIS_TUSER_WIDTH*2)+:C_AXIS_TUSER_WIDTH];
			depar_out_tkeep = pkts_tkeep_stored[(C_AXIS_DATA_WIDTH/8*2)+:(C_AXIS_DATA_WIDTH/8)];
			depar_out_tlast = pkts_tlast_stored[2];
			depar_out_tvalid = 1;

			if (depar_out_tready) begin
				if (pkts_tlast_stored[2]) begin
					state_next = WAIT_TILL_PARSE_DONE;
				end
				else begin
					state_next = FLUSH_PKT_3;
				end
			end
		end
		FLUSH_PKT_3: begin
			depar_out_tdata = pkts_tdata_stored[(C_AXIS_DATA_WIDTH*3)+:C_AXIS_DATA_WIDTH];
			depar_out_tuser = pkts_tuser_stored[(C_AXIS_TUSER_WIDTH*3)+:C_AXIS_TUSER_WIDTH];
			depar_out_tkeep = pkts_tkeep_stored[(C_AXIS_DATA_WIDTH/8*3)+:(C_AXIS_DATA_WIDTH/8)];
			depar_out_tlast = pkts_tlast_stored[3];
			depar_out_tvalid = 1;

			if (depar_out_tready) begin
				if (pkts_tlast_stored[3]) begin
					state_next = WAIT_TILL_PARSE_DONE;
				end
				else begin
					state_next = FLUSH_PKT;
				end
			end
		end
		FLUSH_PKT: begin
			if (!pkt_fifo_empty) begin
				depar_out_tvalid = pkt_fifo_tdata;
				depar_out_tuser = pkt_fifo_tuser;
				depar_out_tkeep = pkt_fifo_tkeep;
				depar_out_tlast = pkt_fifo_tlast;
				depar_out_tvalid = 1;
				if(depar_out_tready) begin
					pkt_fifo_rd_en = 1;
					if (pkt_fifo_tlast) begin
						state_next = WAIT_TILL_PARSE_DONE;
					end
					else begin
						state_next = FLUSH_PKT;
					end
				end
			end
		end
	endcase
end

always @(posedge clk) begin
	if (~aresetn) begin
		state <= WAIT_TILL_PARSE_DONE;

		pkts_tdata_stored <= 0;
		pkts_tuser_stored <= 0;
		pkts_tkeep_stored <= 0;
		pkts_tlast_stored <= 0;
	end
	else begin
		state <= state_next;

		pkts_tdata_stored <= pkts_tdata_stored_r;
		pkts_tuser_stored <= pkts_tuser_stored_r;
		pkts_tkeep_stored <= pkts_tkeep_stored_r;
		pkts_tlast_stored <= pkts_tlast_stored_r;
	end
end

parse_act_ram_ip #(
	.C_INIT_FILE_NAME	("./parse_act_ram_init_file.mif"),
	.C_LOAD_INIT_FILE	(1)
)
parse_act_ram
(
	// write port
	.clka		(clk),
	.addra		(),
	.dina		(),
	.ena		(),
	.wea		(),

	//
	.clkb		(clk),
	.addrb		(vlan_id[7:4]),
	.doutb		(bram_out),
	.enb		(1'b1) // always set to 1
);

endmodule
