// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module	pkt_recomb(
input							clk,
input							reset,

input							pkt_metadata_cut_out_valid,
input				[359:0]	pkt_metadata_cut_out,

input				[138:0]	pkt_cut_data,
input							pkt_cut_data_valid,
output			[7:0]		pkt_cut_data_usedw,

input							buf_addr_wr,
input				[3:0]		buf_addr,

output	reg	[3:0]		aging_recycle_addr,
output	reg				aging_recycle_addr_wr,

output	reg	[339:0]	pkt_metadata_out,  //[339:336]==pkt_addr,[335:0] 
output	reg				pkt_metadata_out_valid,

input				[10:0]	ram_rd_addr,
input							ram_rd,
output			[138:0]	ram_data_q				
);

wire	[3:0]		buf_addr_q;
reg				buf_addr_rd;
wire				buf_addr_empty;

wire	[138:0]	pkt_cut_data_q;
reg				pkt_cut_data_rdreq;
reg				pkt_metadata_cut_out_rdreq;
wire	[359:0]	pkt_metadata_cut_out_q;
wire				pkt_metadata_cut_out_empty;


reg	[138:0]	ram_data_in;
reg	[10:0]	ram_wr_addr;
reg				ram_wr;

reg	[359:0]	pkt_metadata_cut_out_q_r;
reg	[3:0]		count;
reg	[127:0] 	addr_3_0_pkt_a_timing; //[127:96]==addr3 [95:64]=addr2 [63:32]=addr1 [31:0]==addr0
												//[31:0] valid+timing(15)+id(16) 
reg	[127:0] 	addr_7_4_pkt_a_timing; //[127:96]==addr3 [95:64]=addr2 [63:32]=addr1 [31:0]==addr0
												//[31:0] valid+timing(15)+id(16) 												
reg	[127:0]	addr_11_8_pkt_a_timing; //[127:96]==addr3 [95:64]=addr2 [63:32]=addr1 [31:0]==addr0
												//[31:0] valid+timing(15)+id(16) 
reg	[127:0] 	addr_15_12_pkt_a_timing; //[127:96]==addr3 [95:64]=addr2 [63:32]=addr1 [31:0]==addr0
												//[31:0] valid+timing(15)+id(16) 												
reg	[10:0]	buf_addr_q_r;
reg	[3:0]		timing_count;
reg				flag;					
reg	[63:0]	count_timing;
reg	[14:0]	timing;
						
reg [2:0] current_state;
parameter	idle_s				=	3'd0,
				initial_s			=	3'd1,
            parse_metadata_s  =	3'd2,
				trans_b_s			=	3'd3,
				delete_5clock		=	3'd4,
				discard_s			=	3'd5,
				check_aging_s		=	3'd6;
always @ (posedge clk or negedge reset)
if(!reset)	begin
	pkt_metadata_cut_out_rdreq	<=	1'b0;
	pkt_cut_data_rdreq			<=	1'b0;
	//buf_addr							<=	4'b0;
	buf_addr_rd						<=	1'b0;
	//buf_addr_wr						<=	1'b0;
	flag								<=	1'b0;
	count								<=	4'b0;
	buf_addr_q_r					<=	11'b0;
	addr_3_0_pkt_a_timing		<=	128'b0;
	addr_7_4_pkt_a_timing		<=	128'b0;
	addr_11_8_pkt_a_timing		<=	128'b0;
	addr_15_12_pkt_a_timing		<=	128'b0;
	ram_data_in						<=	139'b0;
	ram_wr_addr						<=	11'b0;
	ram_wr							<=	1'b0;
	pkt_metadata_out				<=	340'b0;
	pkt_metadata_out_valid		<=	1'b0;
	aging_recycle_addr			<=	4'b0;
	aging_recycle_addr_wr		<=	1'b0;
	timing_count					<=	4'b0;
	current_state					<=	initial_s;
	end
	else	begin
		case(current_state)
			initial_s:	begin	
				if(count == 4'hf)	begin
					count			<=	4'b0;
					current_state	<=	idle_s;
					end
					else	begin
						count				<=	count + 1'b1;
						current_state	<=	initial_s;						
						end
				end
			idle_s:	begin
				count								<=	4'b0;
				ram_data_in						<=	139'b0;
				ram_wr_addr						<=	11'b0;
				ram_wr							<=	1'b0;
				pkt_metadata_out_valid		<=	1'b0;
				aging_recycle_addr_wr		<=	1'b0;
				if((buf_addr_empty == 1'b0)&&(pkt_metadata_cut_out_empty == 1'b0))	begin
					pkt_metadata_cut_out_rdreq	<=	1'b1;
					pkt_metadata_cut_out_q_r	<=	pkt_metadata_cut_out_q;
					current_state	<=	parse_metadata_s;
					end
					else	begin
						current_state	<=	idle_s;
						end
				end
			parse_metadata_s:	begin
				pkt_metadata_cut_out_rdreq	<=	1'b0;
				if(pkt_metadata_cut_out_q_r[354] == 1'b0)	begin  //part 0
					pkt_cut_data_rdreq	<=	1'b1;
					count			<=	4'b0;
					buf_addr_q_r	<=	{buf_addr_q[3:0],7'b0};
					
					buf_addr_rd		<=	1'b1;
					flag				<=	1'b0;
					current_state	<=	delete_5clock;
					case(buf_addr_q)
						4'b0000:	addr_3_0_pkt_a_timing[31:0]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b0001:	addr_3_0_pkt_a_timing[63:32]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b0010:	addr_3_0_pkt_a_timing[95:64]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};	
						4'b0011:	addr_3_0_pkt_a_timing[127:96]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};	
						4'b0100:	addr_7_4_pkt_a_timing[31:0]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b0101:	addr_7_4_pkt_a_timing[63:32]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b0110:	addr_7_4_pkt_a_timing[95:64]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};	
						4'b0111:	addr_7_4_pkt_a_timing[127:96]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};	
						4'b1000:	addr_11_8_pkt_a_timing[31:0]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b1001:	addr_11_8_pkt_a_timing[63:32]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b1010:	addr_11_8_pkt_a_timing[95:64]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};	
						4'b1011:	addr_11_8_pkt_a_timing[127:96]	<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};	
						4'b1100:	addr_15_12_pkt_a_timing[31:0]		<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b1101:	addr_15_12_pkt_a_timing[63:32]	<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};
						4'b1110:	addr_15_12_pkt_a_timing[95:64]	<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};	
						default:	addr_15_12_pkt_a_timing[127:96]	<=	{1'b1,timing[14:0],pkt_metadata_cut_out_q_r[351:336]};									
						endcase
					end
					else	begin //part 1
						flag						<=	1'b1;
						pkt_cut_data_rdreq	<=	1'b1;
						if(pkt_metadata_cut_out_q_r[351:336] == addr_3_0_pkt_a_timing[15:0])	begin
							buf_addr_q_r	<=	{4'h0,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_3_0_pkt_a_timing[47:32])	begin
							buf_addr_q_r	<=	{4'h1,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_3_0_pkt_a_timing[79:64])	begin
							buf_addr_q_r	<=	{4'h2,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_3_0_pkt_a_timing[111:96])	begin
							buf_addr_q_r	<=	{4'h3,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else if(pkt_metadata_cut_out_q_r[351:336] == addr_7_4_pkt_a_timing[15:0])	begin
							buf_addr_q_r	<=	{4'h4,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_7_4_pkt_a_timing[47:32])	begin
							buf_addr_q_r	<=	{4'h5,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_7_4_pkt_a_timing[79:64])	begin
							buf_addr_q_r	<=	{4'h6,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_7_4_pkt_a_timing[111:96])	begin
							buf_addr_q_r	<=	{4'h7,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_11_8_pkt_a_timing[15:0])	begin
							buf_addr_q_r	<=	{4'h8,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_11_8_pkt_a_timing[47:32])	begin
							buf_addr_q_r	<=	{4'h9,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_11_8_pkt_a_timing[79:64])	begin
							buf_addr_q_r	<=	{4'ha,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_11_8_pkt_a_timing[111:96])	begin
							buf_addr_q_r	<=	{4'hb,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else if(pkt_metadata_cut_out_q_r[351:336] == addr_15_12_pkt_a_timing[15:0])	begin
							buf_addr_q_r	<=	{4'hc,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_15_12_pkt_a_timing[47:32])	begin
							buf_addr_q_r	<=	{4'hd,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_15_12_pkt_a_timing[79:64])	begin
							buf_addr_q_r	<=	{4'he,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	if(pkt_metadata_cut_out_q_r[351:336] == addr_15_12_pkt_a_timing[111:96])	begin
							buf_addr_q_r	<=	{4'hf,7'b0}	+11'd64;
							current_state	<=	delete_5clock;
							end
							else	begin
								current_state	<=	discard_s;
								end
						end
				end
			delete_5clock:	begin
				buf_addr_rd		<=	1'b0;				
				if(count	==	4'd4)	begin
					current_state	<=	trans_b_s;
					end
					else	begin
						count	<=	count + 1'b1;
						current_state	<=	delete_5clock;
						end
				end
			trans_b_s:	begin
										
					if(pkt_cut_data_q[138:136] == 3'b110)	begin
						pkt_cut_data_rdreq	<=	1'b0;
						if(flag == 1'b1)	begin
							pkt_metadata_out_valid		<=	1'b1;
							pkt_metadata_out		<=	{buf_addr_q_r[10:7],pkt_metadata_cut_out_q_r[335:0]};
							ram_data_in		<=	{3'b110,pkt_cut_data_q[135:0]};
							ram_wr_addr		<=	buf_addr_q_r;
							ram_wr			<=	1'b1;
							current_state		<=	check_aging_s;
							end
							else	begin
								ram_data_in		<=	{3'b100,pkt_cut_data_q[135:0]};
								ram_wr_addr		<=	buf_addr_q_r;
								ram_wr			<=	1'b1;
								current_state			<=	idle_s;
								end
						
						end
						else	begin
							buf_addr_q_r	<=	buf_addr_q_r +	1'b1;
							ram_data_in		<=	{3'b100,pkt_cut_data_q[135:0]};
							ram_wr_addr		<=	buf_addr_q_r;
							ram_wr			<=	1'b1;
							current_state	<=	trans_b_s;
							end
					
				end
			check_aging_s:	begin
				ram_data_in		<=	139'b0;
				ram_wr_addr		<=	11'b0;
				ram_wr			<=	1'b0;
				timing_count	<=	timing_count + 1'b1;
				pkt_metadata_out_valid		<=	1'b0;
				case(timing_count)
					4'b0000:	begin
						if(addr_3_0_pkt_a_timing[31] == 1'b1)	begin
							if(timing == addr_3_0_pkt_a_timing[30:16])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_3_0_pkt_a_timing[30:16])	begin
								if(timing > addr_3_0_pkt_a_timing[30:16] +15'd4) begin
									aging_recycle_addr		<=	4'h0;
									aging_recycle_addr_wr	<=	1'b1;
									addr_3_0_pkt_a_timing[31:0]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_3_0_pkt_a_timing[30:16]>15'd4)	begin
										aging_recycle_addr				<=	4'h0;
										aging_recycle_addr_wr			<=	1'b1;
										addr_3_0_pkt_a_timing[31:0]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end
							else	begin
								current_state			<=	check_aging_s;
								end						
						end	
					4'b0001:	begin
						if(addr_3_0_pkt_a_timing[63] == 1'b1)	begin
							if(timing == addr_3_0_pkt_a_timing[62:48])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_3_0_pkt_a_timing[62:48])	begin
								if(timing > addr_3_0_pkt_a_timing[62:48] +15'd4) begin
									aging_recycle_addr		<=	4'h1;
									aging_recycle_addr_wr	<=	1'b1;
									addr_3_0_pkt_a_timing[63:32]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_3_0_pkt_a_timing[62:48]>15'd4)	begin
										aging_recycle_addr				<=	4'h1;
										aging_recycle_addr_wr			<=	1'b1;
										addr_3_0_pkt_a_timing[63:32]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b0010:	begin
						if(addr_3_0_pkt_a_timing[95] == 1'b1)	begin
							if(timing == addr_3_0_pkt_a_timing[94:80])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_3_0_pkt_a_timing[94:80])	begin
								if(timing > addr_3_0_pkt_a_timing[94:80] +15'd4) begin
									aging_recycle_addr		<=	4'h2;
									aging_recycle_addr_wr	<=	1'b1;
									addr_3_0_pkt_a_timing[95:64]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_3_0_pkt_a_timing[94:80]>15'd4)	begin
										aging_recycle_addr				<=	4'h2;
										aging_recycle_addr_wr			<=	1'b1;
										addr_3_0_pkt_a_timing[95:64]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b0011:	begin
						if(addr_3_0_pkt_a_timing[127] == 1'b1)	begin
							if(timing == addr_3_0_pkt_a_timing[126:112])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_3_0_pkt_a_timing[126:112])	begin
								if(timing > addr_3_0_pkt_a_timing[126:112] +15'd4) begin
									aging_recycle_addr		<=	4'h3;
									aging_recycle_addr_wr	<=	1'b1;
									addr_3_0_pkt_a_timing[127:96]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_3_0_pkt_a_timing[126:112]>15'd4)	begin
										aging_recycle_addr				<=	4'h3;
										aging_recycle_addr_wr			<=	1'b1;
										addr_3_0_pkt_a_timing[127:96]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b0100:	begin
						if(addr_7_4_pkt_a_timing[31] == 1'b1)	begin
							if(timing == addr_7_4_pkt_a_timing[30:16])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_7_4_pkt_a_timing[30:16])	begin
								if(timing > addr_7_4_pkt_a_timing[30:16] +15'd4) begin
									aging_recycle_addr		<=	4'h4;
									aging_recycle_addr_wr	<=	1'b1;
									addr_7_4_pkt_a_timing[31:0]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_7_4_pkt_a_timing[30:16]>15'd4)	begin
										aging_recycle_addr				<=	4'h4;
										aging_recycle_addr_wr			<=	1'b1;
										addr_7_4_pkt_a_timing[31:0]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end
							else	begin
								current_state			<=	check_aging_s;
								end						
						end	
					4'b0101:	begin
						if(addr_7_4_pkt_a_timing[63] == 1'b1)	begin
							if(timing == addr_7_4_pkt_a_timing[62:48])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_7_4_pkt_a_timing[62:48])	begin
								if(timing > addr_7_4_pkt_a_timing[62:48] +15'd4) begin
									aging_recycle_addr		<=	4'h5;
									aging_recycle_addr_wr	<=	1'b1;
									addr_7_4_pkt_a_timing[63:32]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_7_4_pkt_a_timing[62:48]>15'd4)	begin
										aging_recycle_addr				<=	4'h5;
										aging_recycle_addr_wr			<=	1'b1;
										addr_7_4_pkt_a_timing[63:32]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b0110:	begin
						if(addr_7_4_pkt_a_timing[95] == 1'b1)	begin
							if(timing == addr_7_4_pkt_a_timing[94:80])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_7_4_pkt_a_timing[94:80])	begin
								if(timing > addr_7_4_pkt_a_timing[94:80] +15'd4) begin
									aging_recycle_addr		<=	4'h6;
									aging_recycle_addr_wr	<=	1'b1;
									addr_7_4_pkt_a_timing[95:64]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_7_4_pkt_a_timing[94:80]>15'd4)	begin
										aging_recycle_addr				<=	4'h6;
										aging_recycle_addr_wr			<=	1'b1;
										addr_7_4_pkt_a_timing[95:64]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b0111:	begin
						if(addr_7_4_pkt_a_timing[127] == 1'b1)	begin
							if(timing == addr_7_4_pkt_a_timing[126:112])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_7_4_pkt_a_timing[126:112])	begin
								if(timing > addr_7_4_pkt_a_timing[126:112] +15'd4) begin
									aging_recycle_addr		<=	4'h7;
									aging_recycle_addr_wr	<=	1'b1;
									addr_7_4_pkt_a_timing[127:96]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_7_4_pkt_a_timing[126:112]>15'd4)	begin
										aging_recycle_addr				<=	4'h7;
										aging_recycle_addr_wr			<=	1'b1;
										addr_7_4_pkt_a_timing[127:96]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b1000:	begin
						if(addr_11_8_pkt_a_timing[31] == 1'b1)	begin
							if(timing == addr_11_8_pkt_a_timing[30:16])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_11_8_pkt_a_timing[30:16])	begin
								if(timing > addr_11_8_pkt_a_timing[30:16] +15'd4) begin
									aging_recycle_addr		<=	4'h8;
									aging_recycle_addr_wr	<=	1'b1;
									addr_11_8_pkt_a_timing[31:0]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_11_8_pkt_a_timing[30:16]>15'd4)	begin
										aging_recycle_addr				<=	4'h8;
										aging_recycle_addr_wr			<=	1'b1;
										addr_11_8_pkt_a_timing[31:0]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end
							else	begin
								current_state			<=	check_aging_s;
								end						
						end	
					4'b1001:	begin
						if(addr_11_8_pkt_a_timing[63] == 1'b1)	begin
							if(timing == addr_11_8_pkt_a_timing[62:48])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_11_8_pkt_a_timing[62:48])	begin
								if(timing > addr_11_8_pkt_a_timing[62:48] +15'd4) begin
									aging_recycle_addr		<=	4'h9;
									aging_recycle_addr_wr	<=	1'b1;
									addr_11_8_pkt_a_timing[63:32]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_11_8_pkt_a_timing[62:48]>15'd4)	begin
										aging_recycle_addr				<=	4'h9;
										aging_recycle_addr_wr			<=	1'b1;
										addr_11_8_pkt_a_timing[63:32]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b1010:	begin
						if(addr_11_8_pkt_a_timing[95] == 1'b1)	begin
							if(timing == addr_11_8_pkt_a_timing[94:80])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_11_8_pkt_a_timing[94:80])	begin
								if(timing > addr_11_8_pkt_a_timing[94:80] +15'd4) begin
									aging_recycle_addr		<=	4'ha;
									aging_recycle_addr_wr	<=	1'b1;
									addr_11_8_pkt_a_timing[95:64]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_11_8_pkt_a_timing[94:80]>15'd4)	begin
										aging_recycle_addr				<=	4'ha;
										aging_recycle_addr_wr			<=	1'b1;
										addr_11_8_pkt_a_timing[95:64]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b1011:	begin
						if(addr_11_8_pkt_a_timing[127] == 1'b1)	begin
							if(timing == addr_11_8_pkt_a_timing[126:112])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_11_8_pkt_a_timing[126:112])	begin
								if(timing > addr_11_8_pkt_a_timing[126:112] +15'd4) begin
									aging_recycle_addr		<=	4'hb;
									aging_recycle_addr_wr	<=	1'b1;
									addr_11_8_pkt_a_timing[127:96]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_11_8_pkt_a_timing[126:112]>15'd4)	begin
										aging_recycle_addr				<=	4'hb;
										aging_recycle_addr_wr			<=	1'b1;
										addr_11_8_pkt_a_timing[127:96]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b1100:	begin
						if(addr_15_12_pkt_a_timing[31] == 1'b1)	begin
							if(timing == addr_15_12_pkt_a_timing[30:16])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_15_12_pkt_a_timing[30:16])	begin
								if(timing > addr_15_12_pkt_a_timing[30:16] +15'd4) begin
									aging_recycle_addr		<=	4'hc;
									aging_recycle_addr_wr	<=	1'b1;
									addr_15_12_pkt_a_timing[31:0]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_15_12_pkt_a_timing[30:16]>15'd4)	begin
										aging_recycle_addr				<=	4'hc;
										aging_recycle_addr_wr			<=	1'b1;
										addr_15_12_pkt_a_timing[31:0]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end
							else	begin
								current_state			<=	check_aging_s;
								end						
						end	
					4'b1101:	begin
						if(addr_15_12_pkt_a_timing[63] == 1'b1)	begin
							if(timing == addr_15_12_pkt_a_timing[62:48])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_15_12_pkt_a_timing[62:48])	begin
								if(timing > addr_15_12_pkt_a_timing[62:48] +15'd4) begin
									aging_recycle_addr		<=	4'hd;
									aging_recycle_addr_wr	<=	1'b1;
									addr_15_12_pkt_a_timing[63:32]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_15_12_pkt_a_timing[62:48]>15'd4)	begin
										aging_recycle_addr				<=	4'hd;
										aging_recycle_addr_wr			<=	1'b1;
										addr_15_12_pkt_a_timing[63:32]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					4'b1110:	begin
						if(addr_3_0_pkt_a_timing[95] == 1'b1)	begin
							if(timing == addr_15_12_pkt_a_timing[94:80])	begin
								current_state			<=	check_aging_s;
								end
								else
							if(timing > addr_3_0_pkt_a_timing[94:80])	begin
								if(timing > addr_3_0_pkt_a_timing[94:80] +15'd4) begin
									aging_recycle_addr		<=	4'he;
									aging_recycle_addr_wr	<=	1'b1;
									addr_3_0_pkt_a_timing[95:64]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	check_aging_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_3_0_pkt_a_timing[94:80]>15'd4)	begin
										aging_recycle_addr				<=	4'he;
										aging_recycle_addr_wr			<=	1'b1;
										addr_3_0_pkt_a_timing[95:64]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	check_aging_s;
											end
								end
							end													
						else	begin
							current_state			<=	check_aging_s;
							end
						end
					default:	begin
						if(addr_15_12_pkt_a_timing[127] == 1'b1)	begin
							if(timing == addr_15_12_pkt_a_timing[126:112])	begin
								current_state			<=	idle_s;
								end
								else
							if(timing > addr_15_12_pkt_a_timing[126:112])	begin
								if(timing > addr_15_12_pkt_a_timing[126:112] +15'd4) begin
									aging_recycle_addr		<=	4'hf;
									aging_recycle_addr_wr	<=	1'b1;
									addr_15_12_pkt_a_timing[127:96]	<=	32'b0;
									current_state				<=	idle_s;
									end
									else	begin
										current_state			<=	idle_s;
										end
								end
								else	begin
									if(15'h7fff+ timing	-	addr_15_12_pkt_a_timing[126:112]>15'd4)	begin
										aging_recycle_addr				<=	4'hf;
										aging_recycle_addr_wr			<=	1'b1;
										addr_15_12_pkt_a_timing[127:96]	<=	32'b0;
										current_state						<=	idle_s;
										end
										else	begin
											current_state			<=	idle_s;
											end
								end
							end
						else	begin
							current_state			<=	idle_s;
							end
						end
					endcase
				
				end
			discard_s:	begin				
				if(pkt_cut_data_q[138:136] == 3'b110)	begin
					pkt_cut_data_rdreq	<=	1'b0;
					current_state			<=	idle_s;
					end
					else	begin
						current_state			<=	discard_s;
						end
				end
			
			endcase
		end

//////////////////////////////////aging timing 
always @ (posedge clk or negedge reset)
if(!reset)	begin
	timing			<=	15'b0;
	count_timing	<=	64'b0;
	end
	else	begin
		if(count_timing == 64'd125000000)	begin
			timing	<=	timing + 1'b1;
			count_timing	<=	64'b0;
			end
			else	begin
				count_timing	<=	count_timing + 1'b1;
				end
		end		
fifo_4_16	fifo_4_16_addr (
.aclr			(!reset),
.clock		(clk),
.data			(buf_addr),
.rdreq		(buf_addr_rd),
.wrreq		(buf_addr_wr),
.empty		(buf_addr_empty),
.q				(buf_addr_q));		


ram_2048_139	ram_2048_139 (
.aclr			(!reset),
.clock		(clk),
.data			(ram_data_in),
.rdaddress	(ram_rd_addr),
.rden			(ram_rd),
.wraddress	(ram_wr_addr),
.wren			(ram_wr),
.q				(ram_data_q));

		
fifo_139_256 pkt_cut_data_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(pkt_cut_data),
.rdreq		(pkt_cut_data_rdreq),
.wrreq		(pkt_cut_data_valid),
.q				(pkt_cut_data_q),
.usedw		(pkt_cut_data_usedw));

fifo_360_64 pkt_metadata_cut_out_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(pkt_metadata_cut_out),
.rdreq		(pkt_metadata_cut_out_rdreq),
.wrreq		(pkt_metadata_cut_out_valid),
.empty		(pkt_metadata_cut_out_empty),
.q				(pkt_metadata_cut_out_q));		
endmodule	