// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module	transmit(
input							clk,
input							reset,
input							mode, //1:cengdie wang   0:shi wang

input							pkt_ctl_valid, //contorl
input				[138:0]	pkt_ctl,
output			[7:0]		pkt_ctl_usedw,
//rule 
input							rule_wr,
input				[19:0]	rule, //  [19] lisp pkt capsulate flag  [18:8] length  [7:0] out port;
//pkt  
input							pkt_out_valid,
input				[138:0]	pkt_out,
output			[7:0]		pkt_out_usedw,

output	reg	        um2cdp_rule_wrreq,
output	reg	[29:0]  um2cdp_rule,
output	reg	        um2cdp_data_valid,
output	reg	[138:0] um2cdp_data,
input 			[4:0]   cdp2um_rule_usedw,
input         			  cdp2um_tx_enable	);



wire	[138:0]	pkt_ctl_q;
reg				pkt_ctl_rdreq;

wire	[138:0]	pkt_out_q;
reg				pkt_out_rdreq;

wire	[19:0]	rule_q;
reg				rule_rdreq;
wire				rule_empty;
reg	[19:0]	rule_q_r;
reg				flag;
reg				cut_pkt_flag;
reg	[10:0]	lisp_payload_r1;
reg	[10:0]	lisp_payload_r2;
reg	[138:0]	lisp_h1,lisp_h2,lisp_h3,lisp_h4,lisp_h5;
reg	[6:0]		count_reg;
reg	[138:0]	pkt_out_q_r;	
reg [4:0] current_state;

parameter	idle_s							=	5'd0,
				idle_s1						=	5'd1,
            trans_ctl_s  					=	5'd2,
				paser_rule_s				=	5'd3,
				trans_body_s				=	5'd4,	
				trans_lisp_h1_s				=	5'd5,
				trans_lisp_h2_s				=	5'd6,
				trans_lisp_h3_s				=	5'd7,
				trans_lisp_h4_s				=	5'd8,
				trans_lisp_h5_s				=	5'd9,
				trans_lisp_body_s			=	5'd10,
				trans_second_lisp_h1_s		=	5'd11,
				trans_second_lisp_h2_5_s	=	5'd12,
				trans_second_lisp_body_s	=	5'd13,
				wait_enable_s				=	5'd14,
				wait_second_enable_s		=	5'd15,
				wait_ctl_enable_s			=	5'd16;
always @ (posedge clk or negedge reset)
if(!reset)	begin
	um2cdp_rule_wrreq	<=	1'b0;
	um2cdp_rule			<=	30'b0;
	um2cdp_data_valid	<=	1'b0;
	um2cdp_data			<=	1'b0;
	pkt_ctl_rdreq		<=	1'b0;
	pkt_out_rdreq		<=	1'b0;
	rule_rdreq			<=	1'b0;
	flag					<=	1'b0;
	rule_q_r				<=	20'b0;
	lisp_payload_r1	<=	11'b0;
	lisp_payload_r2	<=	11'b0;
	lisp_h1				<=	139'b0;
	lisp_h2				<=	139'b0;
	lisp_h3				<=	139'b0;
	lisp_h4				<=	139'b0;
	lisp_h5				<=	139'b0;
	cut_pkt_flag		<=	1'b0;
	count_reg			<=	7'b0;
	pkt_out_q_r			<=	139'b0;
	current_state		<=	idle_s;
	end
	else	begin
		case(current_state)
			idle_s:	begin
				um2cdp_rule_wrreq	<=	1'b0;
				um2cdp_rule			<=	30'b0;
				um2cdp_data_valid	<=	1'b0;
				um2cdp_data			<=	1'b0;
				pkt_ctl_rdreq		<=	1'b0;
				pkt_out_rdreq		<=	1'b0;
				rule_rdreq			<=	1'b0;
				if(rule_empty == 1'b1)	begin
					current_state		<=	idle_s1;
					end
					else	begin
						if(cdp2um_rule_usedw[4:0]<5'd30)	begin
							rule_rdreq			<=	1'b1;
							rule_q_r				<=	rule_q;
							current_state		<=	paser_rule_s;
							end
							else	begin
								current_state		<=	idle_s;
								end								
						end				
				end
			idle_s1:	begin
				um2cdp_rule_wrreq	<=	1'b0;
				um2cdp_rule			<=	30'b0;
				um2cdp_data_valid	<=	1'b0;
				um2cdp_data			<=	1'b0;
				pkt_ctl_rdreq		<=	1'b0;
				pkt_out_rdreq		<=	1'b0;
				rule_rdreq			<=	1'b0;
				if(pkt_ctl_usedw[7:0] == 8'b0)	begin
					current_state		<=	idle_s;
					end
					else	begin
						if(cdp2um_rule_usedw[4:0]<5'd29)	begin
							//pkt_ctl_rdreq		<=	1'b1;
							flag					<=	1'b1;
							current_state		<=	wait_ctl_enable_s;
							end
							else	begin
								current_state		<=	idle_s1;
								end
						end
				end
			wait_ctl_enable_s:	begin
				if(cdp2um_tx_enable == 1'b1)	begin
					pkt_ctl_rdreq		<=	1'b1;
					current_state		<=	trans_ctl_s;
					end
					else	begin
						current_state		<=	wait_ctl_enable_s;
						end
				end
			paser_rule_s:	begin
				rule_rdreq			<=	1'b0;
				if(rule_q_r[19] == 1'b0)	begin	
					pkt_out_rdreq		<=	1'b0;
					flag					<=	1'b1;
					um2cdp_rule_wrreq	<=	1'b1;
					um2cdp_rule			<=	{22'b0,rule_q_r[7:0]};
					current_state		<=	wait_enable_s;
					end
					else	begin
						um2cdp_rule_wrreq	<=	1'b1;
						um2cdp_rule			<=	{22'b0,rule_q_r[7:0]};
						if(rule_q_r[18:8] >11'd1300)	begin
							cut_pkt_flag			<=	1'b1;
							lisp_payload_r1		<=	11'd1024 + 11'd26;
							lisp_payload_r2		<=	rule_q_r[17:8] + 11'd26;
							pkt_out_rdreq			<=	1'b1;
							pkt_out_q_r				<=	pkt_out_q;
							current_state			<=	trans_lisp_h1_s;
							end
							else	begin
								cut_pkt_flag			<=	1'b0;
								lisp_payload_r1		<=	rule_q_r[18:8] + 11'd26;
								pkt_out_rdreq			<=	1'b1;
								pkt_out_q_r				<=	pkt_out_q;
								current_state			<=	trans_lisp_h1_s;
								end
						end
				end
			wait_enable_s:	begin
				um2cdp_rule_wrreq	<=	1'b0;
				if(cdp2um_tx_enable == 1'b1)	begin
					pkt_out_rdreq			<=	1'b1;
					current_state		<=	trans_body_s;
					end
					else	begin
						current_state		<=	wait_enable_s;
						end
				
				end
			trans_lisp_h1_s:	begin
				um2cdp_rule_wrreq	<=	1'b0;
				pkt_out_rdreq			<=	1'b0;
				if(cdp2um_tx_enable == 1'b1)	begin
					lisp_h1				<=	pkt_out_q_r;
					um2cdp_data_valid	<=	1'b1;
					pkt_out_rdreq			<=	1'b1;
					um2cdp_data			<=	pkt_out_q_r;
					current_state		<=	trans_lisp_h2_s;
					end
					else	begin
						current_state			<=	trans_lisp_h1_s;
						end				
				end
			trans_lisp_h2_s:	begin
				lisp_h2				<=	{pkt_out_q[138:112],5'b0,lisp_payload_r2[10:0],pkt_out_q[95:0]};
				um2cdp_data_valid	<=	1'b1;
				um2cdp_data			<=	{pkt_out_q[138:112],5'b0,lisp_payload_r1[10:0],pkt_out_q[95:0]};
				current_state		<=	trans_lisp_h3_s;
				end
			trans_lisp_h3_s:	begin
				lisp_h3				<=	pkt_out_q;
				um2cdp_data_valid	<=	1'b1;
				um2cdp_data			<=	pkt_out_q;
				current_state		<=	trans_lisp_h4_s;
				end
			trans_lisp_h4_s:	begin
				lisp_h4				<=	pkt_out_q;
				um2cdp_data_valid	<=	1'b1;
				um2cdp_data			<=	pkt_out_q;
				current_state		<=	trans_lisp_h5_s;
				end
			trans_lisp_h5_s:	begin
				lisp_h5				<=	{pkt_out_q[138:80],8'd1,pkt_out_q[71:56],8'd1,48'b0};				
				um2cdp_data_valid	<=	1'b1;
				um2cdp_data			<=	{pkt_out_q[138:80],7'd0,cut_pkt_flag,pkt_out_q[71:56],8'd0,48'b0};	
				count_reg			<=	7'd0;
				pkt_out_rdreq			<=	1'b1;//zq
				current_state		<=	trans_lisp_body_s;
				end
			trans_lisp_body_s:	begin
				if(cut_pkt_flag == 1'b1)	begin
					if(count_reg	==	7'd63)	begin
						pkt_out_rdreq		<=	1'b0;
						um2cdp_data_valid	<=	1'b1;
						um2cdp_rule_wrreq	<=	1'b1;
						um2cdp_rule			<=	{22'b0,rule_q_r[7:0]};
						um2cdp_data			<=	{3'b110,pkt_out_q[135:0]};
						current_state		<=	wait_second_enable_s;
						end
						else	begin
							um2cdp_data_valid	<=	1'b1;
							um2cdp_data			<=	pkt_out_q;
							count_reg	<=	count_reg +	1'b1;
							current_state		<=	trans_lisp_body_s;
							end
					end
					else	begin
						if(pkt_out_q[138:136] == 3'b110)	begin
							pkt_out_rdreq		<=	1'b0;
							um2cdp_data_valid	<=	1'b1;
							um2cdp_data			<=	pkt_out_q;
							//um2cdp_rule_wrreq	<=	1'b1;
							//um2cdp_rule			<=	{22'b0,rule_q_r[7:0]};
							current_state		<=	idle_s1;
							end
							else	begin
								um2cdp_data_valid	<=	1'b1;
								um2cdp_data			<=	pkt_out_q;
								current_state		<=	trans_lisp_body_s;
								end
						end
				end
			wait_second_enable_s:	begin
				um2cdp_data_valid	<=	1'b0;
				um2cdp_rule_wrreq	<=	1'b0;
				if(cdp2um_tx_enable == 1'b1)	begin
					pkt_out_rdreq		<=	1'b0;
					current_state		<=	trans_second_lisp_h1_s;
					end
					else	begin
						current_state		<=	wait_second_enable_s;
						end
				end
			trans_second_lisp_h1_s:	begin
					um2cdp_data_valid	<=	1'b1;
					count_reg			<=	7'd0;
					um2cdp_data			<=	lisp_h1;
					current_state		<=	trans_second_lisp_h2_5_s;
				end
			trans_second_lisp_h2_5_s:	begin
				count_reg	<=	count_reg	+ 1'b1;
				case(count_reg[1:0])
					3'd0:	begin
						um2cdp_data			<=	lisp_h2;
						current_state		<=	trans_second_lisp_h2_5_s;
						end
					3'd1:	begin
						um2cdp_data			<=	lisp_h3;
						current_state		<=	trans_second_lisp_h2_5_s;
						end
					3'd2:	begin
						um2cdp_data			<=	lisp_h4;
						current_state		<=	trans_second_lisp_h2_5_s;
						end
					3'd3:	begin
						um2cdp_data			<=	lisp_h5;
						pkt_out_rdreq		<=	1'b1;
						current_state		<=	trans_second_lisp_body_s;
						end
					endcase
				end
			trans_second_lisp_body_s:	begin
				if(pkt_out_q[138:136] ==3'b110)	begin
					um2cdp_data_valid	<=	1'b1;
					pkt_out_rdreq		<=	1'b0;
					cut_pkt_flag			<=	1'b0;
					um2cdp_data			<={3'b110,pkt_out_q[135:0]};
					//um2cdp_rule_wrreq	<=	1'b1;
					//um2cdp_rule			<=	{22'b0,rule_q_r[7:0]};
					current_state		<=	idle_s1;
					end
					else	begin
						um2cdp_data_valid	<=	1'b1;
						um2cdp_data			<=pkt_out_q[138:0];
						current_state		<=	trans_second_lisp_body_s;
						end
				end
			trans_body_s:	begin
				flag					<=	1'b0;
				if(pkt_out_q[138:136] == 3'b110)	begin
					um2cdp_data_valid	<=	1'b1;
					pkt_out_rdreq		<=	1'b0;
					um2cdp_data			<={3'b110,pkt_out_q[135:0]};
					current_state		<=	idle_s1;
					end
					else	begin
						current_state		<=	trans_body_s;
						if(flag == 1'b1)	begin
							um2cdp_data_valid	<=	1'b1;
							um2cdp_data			<={3'b101,pkt_out_q[135:0]};
							end
							else	begin
								um2cdp_data_valid	<=	1'b1;
								um2cdp_data			<={3'b100,pkt_out_q[135:0]};
								end
						end
				end
			trans_ctl_s:	begin
				flag					<=	1'b0;
				if(pkt_ctl_q[138:136] == 3'b110)	begin
					um2cdp_data_valid	<=	1'b1;
					pkt_ctl_rdreq		<=	1'b0;
					um2cdp_data			<={3'b110,pkt_ctl_q[135:0]};
					//um2cdp_rule_wrreq	<=	1'b1;
					//um2cdp_rule			<=	{22'b0,8'h1};
					current_state		<=	idle_s;
					end
					else	begin
						current_state		<=	trans_ctl_s;
						if(flag == 1'b1)	begin
							um2cdp_data_valid	<=	1'b1;
							um2cdp_data			<={3'b101,pkt_ctl_q[135:0]};
							end
							else	begin
								um2cdp_data_valid	<=	1'b1;
								um2cdp_data			<={3'b100,pkt_ctl_q[135:0]};
								end
						end
				end
			endcase
		end

fifo_20_64 rule_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(rule),
.rdreq		(rule_rdreq),
.wrreq		(rule_wr),
.empty		(rule_empty),
.q				(rule_q));

fifo_139_256 pkt_out_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(pkt_out),
.rdreq		(pkt_out_rdreq),
.wrreq		(pkt_out_valid),
.q				(pkt_out_q),
.usedw		(pkt_out_usedw));

fifo_139_256 pkt_ctl_fifo(
.aclr			(!reset),
.clock		(clk),
.data			(pkt_ctl),
.rdreq		(pkt_ctl_rdreq),
.wrreq		(pkt_ctl_valid&(!mode)),
.q				(pkt_ctl_q),
.usedw		(pkt_ctl_usedw));
endmodule	