module	action(
input									clk,
input									reset,
input						[7:0]		xtr_id,
//act 
input 								action_valid,
input 					[15:0]  	action,
input 								action_data_valid,
input 					[351:0] 	action_data,	

//pkt addr
input						[4:0]		pkt_addr,  //[4] == 1:cutpkt  0:nocut pkt
input									pkt_addr_wr,

input						[63:0]	metadata_data,
input									metadata_data_wr,

// cut pkt addr recycle
output	reg			[3:0]		pkt_out_recycle_addr,
output	reg						pkt_out_recycle_addr_wr,
//nopktcut pkt addr recycle
output	reg			[3:0]		nocutpkt_out_recycle_addr,
output	reg						nocutpkt_out_recycle_addr_wr,	

//no cut ram READ
output	reg			[10:0]	nocut_pkt_ram_rd_addr,
output	reg						nocut_pkt_ram_rd,
input						[138:0]	nocut_pkt_ram_data_q,
//cut pkt RAM READ
output	reg			[10:0]	ram_rd_addr,
output	reg						ram_rd,
input						[138:0]	ram_data_q,
//rule out
output	reg						rule_wr,
output	reg			[19:0]	rule, //  [19] lisp pkt capsulate flag  [18:8] length  [7:0] out port;
//pkt out 
output	reg						pkt_out_valid,
output	reg			[138:0]	pkt_out,
input						[7:0]		pkt_out_usedw
);

wire	[15:0]	action_q;
reg				action_rdreq;
wire				action_empty;

wire	[351:0]	action_data_q;
reg				action_data_rdreq;
wire				action_data_empty;

wire	[4:0]	pkt_addr_q;
wire			pkt_addr_empty;
reg			pkt_addr_rdreq;

wire	[63:0] 	metadata_data_q;
wire				metadata_data_empty;
reg				metadata_data_rdreq;	

reg	[15:0]	action_q_r;
reg	[351:0]	action_data_q_r;
reg	[63:0]	metadata_data_q_r;
reg	[10:0]	length_r;
reg				flag_head;
reg	[7:0]		count_id;
reg [3:0] current_state;

parameter	idle_s					=	4'd0,
				action_s					=	4'd1,
				capsulate_lisp_h1_s	=	4'd2,
				capsulate_lisp_h2_s	=	4'd3,
				capsulate_lisp_h3_s	=	4'd4,
				capsulate_lisp_h4_s	=	4'd5,
				capsulate_lisp_h5_s	=	4'd6,
				discard_s				=	4'd7,
				wait_read1_s			=	4'd8,
				wait_read2_s			=	4'd9,
				//wait_read3_s			=	4'd10,
				wait_read4_s			=	4'd11,
				tran_b_s					=	4'd12;
always @ (posedge clk or negedge reset)
if(!reset)	begin
	action_rdreq						<=	1'b0;
	action_data_rdreq					<=	1'b0;
	pkt_addr_rdreq						<=	1'b0;
	pkt_out_recycle_addr_wr			<=	1'b0;
	pkt_out_recycle_addr				<=	4'b0;
	nocutpkt_out_recycle_addr_wr	<=	1'b0;
	nocutpkt_out_recycle_addr		<=	4'b0;
	nocut_pkt_ram_rd_addr			<=	11'b0;
	nocut_pkt_ram_rd					<=	1'b0;
	ram_rd_addr							<=	11'b0;
	ram_rd								<=	1'b0;
	rule_wr								<=	1'b0;
	rule									<=	20'b0;
	pkt_out_valid						<=	1'b0;
	pkt_out								<=	139'b0;
	action_data_q_r					<=	352'b0;
	action_q_r							<=	16'b0;
	metadata_data_q_r					<=	64'b0;
	flag_head							<=	1'b0;
	length_r								<=	11'b0;
	metadata_data_rdreq				<=	1'b0;
	count_id								<=	8'b0;
	current_state						<=	idle_s;
	end
	else	begin
		case(current_state)
			idle_s:	begin
				action_rdreq						<=	1'b0;
				action_data_rdreq					<=	1'b0;
				pkt_addr_rdreq						<=	1'b0;
				pkt_out_recycle_addr_wr			<=	1'b0;
				pkt_out_recycle_addr				<=	4'b0;
				nocutpkt_out_recycle_addr_wr	<=	1'b0;
				nocutpkt_out_recycle_addr		<=	4'b0;
				nocut_pkt_ram_rd_addr			<=	11'b0;
				nocut_pkt_ram_rd					<=	1'b0;
				ram_rd_addr							<=	11'b0;
				ram_rd								<=	1'b0;
				rule_wr								<=	1'b0;
				rule									<=	20'b0;
				pkt_out_valid						<=	1'b0;
				flag_head							<=	1'b0;	
				pkt_out								<=	139'b0;
				length_r								<=	11'b0;
				if((action_empty == 1'b0)&&(action_data_empty == 1'b0))	begin
					action_rdreq						<=	1'b1;
					action_data_rdreq					<=	1'b1;
					metadata_data_rdreq				<=	1'b1;
					action_data_q_r					<=	action_data_q;
					action_q_r							<=	action_q;
					metadata_data_q_r					<=	metadata_data_q;
					current_state						<=	action_s;
					end
					else	begin
						current_state						<=	idle_s;
						end
				end
			action_s:	begin
				action_rdreq						<=	1'b0;
				action_data_rdreq					<=	1'b0;
				metadata_data_rdreq				<=	1'b0;
				if(action_q_r[7:0] == 8'b0)	begin//discard
					pkt_addr_rdreq		<=	1'b1;
					current_state		<=	discard_s;
					end
					else	begin
						if(action_q_r[15] == 1'b1) begin////capsulate action_data;
							if(pkt_out_usedw[7] == 1'b1)	begin
								current_state						<=	action_s;
								end
								else	begin
									current_state						<=	capsulate_lisp_h1_s;
									end
							end
							else	begin //dedecapsulate ceng-die-wang;
								if(pkt_out_usedw[7] == 1'b1)	begin
								current_state						<=	action_s;
								end
								else	begin
									if(pkt_addr_q[4] == 1'b1)	begin
										ram_rd_addr	<=	{pkt_addr_q[3:0],7'b0};
										ram_rd		<=	1'b1;
										end
										else	begin
											nocut_pkt_ram_rd_addr	<=	{pkt_addr_q[3:0],7'b0};
											nocut_pkt_ram_rd			<=	1'b1;
											end
									current_state						<=	wait_read1_s;
									end
								end
						end					
				end
			capsulate_lisp_h1_s:	begin
				pkt_out 			<= {3'b101,4'hf,4'b0,action_data_q_r[95:0],16'h86dd,metadata_data_q_r[63:48]};
				pkt_out_valid	<=	1'b1;
				current_state	<=	capsulate_lisp_h2_s;
				end
			capsulate_lisp_h2_s:	begin
				 pkt_out <= {3'b100,4'hf,4'b0,metadata_data_q_r[47:32],16'd1104,8'd17,metadata_data_q_r[7:0],action_data_q_r[351:272]};
				 pkt_out_valid	<=	1'b1;
				 current_state	<=	capsulate_lisp_h3_s;
				end
			capsulate_lisp_h3_s:	begin
				pkt_out_valid	<=	1'b1;
				pkt_out <= {3'b100,4'hf,4'b0,action_data_q_r[271:144]};
				if(pkt_addr_q[4] == 1'b1)	begin
					ram_rd_addr	<=	{pkt_addr_q[3:0],7'b0};
					ram_rd		<=	1'b1;
					end
					else	begin
						nocut_pkt_ram_rd_addr	<=	{pkt_addr_q[3:0],7'b0};
						nocut_pkt_ram_rd			<=	1'b1;
						end
				current_state	<=	capsulate_lisp_h4_s;
				end
			capsulate_lisp_h4_s:	begin
				 pkt_out <= {3'b100,4'hf,4'b0,action_data_q_r[143:96],16'd4344,16'd4341,16'd1024,32'b0};
				 pkt_out_valid	<=	1'b1;
				 if(pkt_addr_q[4] == 1'b1)	begin
					ram_rd_addr	<=	ram_rd_addr + 1'b1;
					ram_rd		<=	1'b1;
					end
					else	begin
						nocut_pkt_ram_rd_addr	<=	nocut_pkt_ram_rd_addr + 1'b1;
						nocut_pkt_ram_rd			<=	1'b1;
						end
				 current_state	<=	capsulate_lisp_h5_s;
				end
			capsulate_lisp_h5_s	:begin
				pkt_out <= {3'b100,4'hf,4'b0,48'b0,8'd0,xtr_id,count_id,8'd0,48'b0};
				 pkt_out_valid	<=	1'b1;
				 count_id	<=	count_id + 1'b1;
				 current_state	<=	tran_b_s;
				 length_r		<=	11'b0;
				if(pkt_addr_q[4] == 1'b1)	begin
					ram_rd_addr	<=	ram_rd_addr + 1'b1;
					ram_rd		<=	1'b1;
					end
					else	begin
						nocut_pkt_ram_rd_addr	<=	nocut_pkt_ram_rd_addr + 1'b1;
						nocut_pkt_ram_rd			<=	1'b1;
						end
				end
			tran_b_s:	begin
				//length_r	<=	length_r +11'd16;
				if(pkt_addr_q[4] == 1'b1)	begin
					if(ram_data_q[138:136] == 3'b110)	begin
						ram_rd						<=	1'b0;						
						pkt_out						<=	{3'b110,ram_data_q[135:0]};
						pkt_out_valid				<=	1'b1;						
						pkt_addr_rdreq				<=	1'b1;
						pkt_out_recycle_addr		<=	pkt_addr_q[3:0];
						pkt_out_recycle_addr_wr		<=	1'b1;
						rule_wr						<=	1'b1;						
						rule[19]					<=	1'b1;
						rule[18:8]					<=	length_r + ram_data_q[135:131] +11'd1;
						rule[7:0]					<=	action_q_r[7:0];
						current_state				<=	idle_s;
						end
						else	begin
							ram_rd_addr		<=	ram_rd_addr + 1'b1;
							ram_rd			<=	1'b1;
							length_r			<=	length_r +11'd16;
							pkt_out			<=	{3'b100,ram_data_q[135:0]};
							pkt_out_valid	<=	1'b1;
							current_state	<=	tran_b_s;
							end
					end
					else	begin
						if(nocut_pkt_ram_data_q[138:136] == 3'b110)	begin
							nocut_pkt_ram_rd					<=	1'b0;
							
							pkt_out								<=	{3'b110,nocut_pkt_ram_data_q[135:0]};
							pkt_out_valid						<=	1'b1;
							
							pkt_addr_rdreq						<=	1'b1;
							nocutpkt_out_recycle_addr_wr	<=	1'b1;
							nocutpkt_out_recycle_addr		<=	pkt_addr_q[3:0];
							rule_wr								<=	1'b1;
							rule[19]					<=	1'b1;
							rule[18:8]					<=	length_r + nocut_pkt_ram_data_q[135:131] +11'd1;
							rule[7:0]					<=	action_q_r[7:0];
							current_state						<=	idle_s;
							end
							else	begin
								nocut_pkt_ram_rd_addr	<=	nocut_pkt_ram_rd_addr + 1'b1;
								nocut_pkt_ram_rd			<=	1'b1;
								length_r						<=	length_r +11'd16;
								pkt_out						<=	{3'b100,nocut_pkt_ram_data_q[135:0]};
								pkt_out_valid				<=	1'b1;
								current_state				<=	tran_b_s;
								end
						end
				end
			wait_read1_s:	begin
				flag_head	<=	1'b1;
				if(pkt_addr_q[4] == 1'b1)	begin
					ram_rd_addr	<=	{pkt_addr_q[3:0],7'b0} + 1'b1;
					ram_rd		<=	1'b1;
					end
					else	begin
						nocut_pkt_ram_rd_addr	<=	{pkt_addr_q[3:0],7'b0} + 1'b1;
						nocut_pkt_ram_rd			<=	1'b1;
						end
					current_state						<=	wait_read4_s;
				end
			/*wait_read3_s:	begin
				flag_head	<=	1'b1;
				if(pkt_addr_q[4] == 1'b1)	begin
					ram_rd_addr	<=	ram_rd_addr + 1'b1;
					ram_rd		<=	1'b1;
					end
					else	begin
						nocut_pkt_ram_rd_addr	<=	nocut_pkt_ram_rd_addr + 1'b1;
						nocut_pkt_ram_rd			<=	1'b1;
						end
					current_state						<=	wait_read4_s;
				end*/
			wait_read4_s:	begin
				flag_head	<=	1'b1;
				if(pkt_addr_q[4] == 1'b1)	begin
					ram_rd_addr	<=	ram_rd_addr + 1'b1;
					ram_rd		<=	1'b1;
					end
					else	begin
						nocut_pkt_ram_rd_addr	<=	nocut_pkt_ram_rd_addr + 1'b1;
						nocut_pkt_ram_rd			<=	1'b1;
						end
					current_state						<=	wait_read2_s;
				end
			wait_read2_s:	begin
				flag_head	<=	1'b0;
				if(pkt_addr_q[4] == 1'b1)	begin
					pkt_out_valid	<=	1'b1;
					if((flag_head == 1'b1)&&(action_q_r[13] == 1'b1))	begin
						pkt_out			<=	{ram_data_q[138:128],action_data_q_r[95:0],ram_data_q[31:0]};
						end
						else	begin
							pkt_out			<=	ram_data_q;
							end					
					if(ram_data_q[138:136] == 3'b110)	begin
						ram_rd_addr	<=	ram_rd_addr + 1'b1;
						ram_rd		<=	1'b0;
						pkt_addr_rdreq	<=	1'b1;
						pkt_out_recycle_addr	<=	pkt_addr_q[3:0];
						pkt_out_recycle_addr_wr	<=	1'b1;
						rule_wr						<=	1'b1;
						rule							<=	{1'b0,11'b0,action_q_r[7:0]};
						current_state				<=	idle_s;
						end
						else	begin
							ram_rd_addr	<=	ram_rd_addr + 1'b1;
							ram_rd		<=	1'b1;
							current_state	<=	wait_read2_s;
							end
					end
					else	begin
						pkt_out_valid	<=	1'b1;
						if((flag_head == 1'b1)&&(action_q_r[13] == 1'b1))	begin
						pkt_out			<=	{nocut_pkt_ram_data_q[138:128],action_data_q_r[95:0],nocut_pkt_ram_data_q[31:0]};
						end
						else	begin
							pkt_out			<=	nocut_pkt_ram_data_q;
							end
						if(nocut_pkt_ram_data_q[138:136] == 3'b110)	begin
							nocut_pkt_ram_rd_addr	<=	nocut_pkt_ram_rd_addr + 1'b1;
							nocut_pkt_ram_rd			<=	1'b0;
							pkt_addr_rdreq				<=	1'b1;
							nocutpkt_out_recycle_addr_wr	<=	1'b1;
							nocutpkt_out_recycle_addr		<=	pkt_addr_q[3:0];
							rule_wr								<=	1'b1;
							rule									<=	{1'b0,11'b0,action_q_r[7:0]};
							current_state						<=	idle_s;
							end
							else	begin
								nocut_pkt_ram_rd_addr	<=	nocut_pkt_ram_rd_addr + 1'b1;
								nocut_pkt_ram_rd			<=	1'b1;
								current_state				<=	wait_read2_s;
								end
						end
				end
			discard_s:	begin
				current_state						<=	idle_s;
				pkt_addr_rdreq		<=	1'b0;
				if(pkt_addr_q[4] == 1'b1)	begin
					pkt_out_recycle_addr_wr	<=	1'b1;
					pkt_out_recycle_addr		<=	pkt_addr_q[3:0];
					end
					else	begin
						nocutpkt_out_recycle_addr_wr	<=	1'b1;
						nocutpkt_out_recycle_addr		<=	pkt_addr_q[3:0];
						end
				end
			endcase
		end


fifo_64_32 metadata_data_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(metadata_data),
.rdreq		(metadata_data_rdreq),
.wrreq		(metadata_data_wr),
.empty		(metadata_data_empty),
.q				(metadata_data_q));		
		
fifo_16_32 action_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(action),
.rdreq		(action_rdreq),
.wrreq		(action_valid),
.empty		(action_empty),
.q				(action_q));

fifo_352_32 action_data_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(action_data),
.rdreq		(action_data_rdreq),
.wrreq		(action_data_valid),
.empty		(action_data_empty),
.q				(action_data_q));

fifo_5_32 pkt_addr_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(pkt_addr),
.rdreq		(pkt_addr_rdreq),
.wrreq		(pkt_addr_wr),
.empty		(pkt_addr_empty),
.q				(pkt_addr_q));

endmodule	