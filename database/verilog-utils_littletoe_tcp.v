`timescale 1ns / 1ps
`define NULL 0

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:	 Chris Shucksmith
// Description:  Read-only TCP/IP decoder stack, 4x socket streams.
//	
//  Identify and classify TCP payload bytes from packet-orientated TCP/IP frames.
//  Follow up to four extenally configured TCP session/streams for sequence correctness
//
//  Four sockets can be independantly followed, ABCD, documented here genericaly as N. 
//  
//  If TCP packet with SYN flag set is seen matching the src/dest ip/port an initial sequence
//  number is loaded. TCP Payload bytes in-sequence from this are emitted guarded by 
//  outDataMatchN flag. Out of sequence packets are emitted with the lower guard tcp_matchN
//  set, which indicates payload for the right TCP socket, but not in sequenece. A yet-lower
//  priority flag, outDataPayload indicates payload bytes belong *some* unclassified TCP session. 
//
//  Eg. For in-sequence payload bytes of TCPA, outDataMatchA and outDataPayload 
//  are all asserted for every byte in the payload, while tcp_matchA is asserted from the 
//  bytes that identidy the stream until the next stream is selected. Guard it by outDataPayload
//  if that is required.
// 
//  If the tcpN_{src/dest}_{port/ip} registers are modified to follow an established session
//  it is likely a SYN will not be seen. If the next packet should be used to seed the sequence
//  number, assert tcpN_resync for one cycle. This will be latched internally until such a 
//  matching packet arrives. If the context of the packet should be used to determine if the 
//  join is appropriate, based on the context within some higher level protocol, drive 
//  tcp_rejoin within the payload to indicate the rejoin is permitted. Otherwise drive rejoin 
//  with 1 to join at any packet boundary, or zero to join only at SYN packets.
// 
//  TCP sequence number is a modulo 32-bit counter increasing from the 'initial sequence number'
//  seeded from a random value. For a packet of payload length L and sequence number S, the next
//  packet will contain sequence number S+L.
// 
//  As mentioned previously, for packets in-sequence, outDataMatchN is asserted.
//  if the sequence number is below that expected, 'tcp_retran' is asserted, and the 
//  stream sequence number unchanged. If the sequence number is above that expected, 
//  'tcp_gap' is asserted. 
// 
//  TCP retransmission can be benign: packets with 'tcp_retran' can be ignored in the 
//  hope that the retransmission will conclude with the expected packet. Such a scenario can 
//  be caused by a lost-ACK on the reutrn path. A gap however requires active handling. If the
//  active host also experiances the gap and causes retransmission in the usual way (ack'ing a prev
//  sequence number) it is possible the sequence will be resumed autonoumously by that host's actions. 
//  In an imperfect local network however it should be considered that the packet could be lost before
//  this decoder yet reached the active host. In this case, the gap will never be filled, ie. outDataMatchN
//  never resserted.
//
//  Knowledge of the upper-level payload protocol is required to rejoin the stream at a 
//  safe point, or to trigger the active host to reconnect, causing a SYN and reset of the sequence
//  number. By setting tcp_rejoin at a safe-point the logic is asserting to the stack that payload was
//  rejoined and that packets after that should be considered in sequence.
//
//  There is a third classification for packets arriveing more than 1M bytes behind or 1M ahead of the 
//  expected stream position, 'tcp_sequnknown' which is often found when looping a packet capture and
//  may require careful handling. It is not clear when this is asserted, if a retransmission or gap has 
//  occured. Most likely ignoring the packet is the correct action to take, reusming from the next 
//  safe-point.
// 
//  
//
//
////////////////////////////////////////////////////////////////////////////////

module Tcp
	#(
		parameter mac  = 48'h000000000000,
		parameter ip   = 32'h11223344,
		parameter port = 16'd80
	) (
		input CLOCK,
		input newpkt,
		input dataValid,
		input [7:0] data,

		input rejoin,      // assert during a payload, whilst tcp_matchN is asserted but not outDataMatchN to rejoin stream

		// per session
		input [15:0] tcpA_src_port,     tcpB_src_port,      tcpC_src_port,      tcpD_src_port,
		input [31:0] tcpA_src_ip,       tcpB_src_ip,        tcpC_src_ip,        tcpD_src_ip,
		input [15:0] tcpA_dst_port,     tcpB_dst_port,      tcpC_dst_port,      tcpD_dst_port,
		input [31:0] tcpA_dst_ip,       tcpB_dst_ip,        tcpC_dst_ip,        tcpD_dst_ip,
		output reg   outDataMatchA = 0,
		output reg   outDataMatchB = 0,
		output reg   outDataMatchC = 0,
		output reg   outDataMatchD = 0,
		output       tcp_matchA,        tcp_matchB,         tcp_matchC,         tcp_matchD,
		output reg   gappedA = 0,
		output reg   gappedB = 0,
		output reg   gappedC = 0,
		output reg   gappedD = 0,

		output reg [7:0] outData = 0,
		output reg outDataPayload = 0,
		output reg outnewpkt = 0,

		output reg [15:0] tcp_src_port = 0,
		output reg [31:0] tcp_src_ip = 0,
		output reg [15:0] tcp_dst_port = 0,
		output reg [31:0] tcp_dst_ip = 0,

		output reg [7:0] mss = 0

	);

	localparam  [6:0]  sIDLE      = 6'd000;
	localparam  [6:0]  sETH_MACD0 = 6'd002;
	localparam  [6:0]  sETH_MACD1 = 6'd003;
	localparam  [6:0]  sETH_MACD2 = 6'd004;
	localparam  [6:0]  sETH_MACD3 = 6'd005;
	localparam  [6:0]  sETH_MACD4 = 6'd006;
	localparam  [6:0]  sETH_MACD5 = 6'd007;
	localparam  [6:0]  sETH_MACS0 = 6'd008;
	localparam  [6:0]  sETH_MACS1 = 6'd009;
	localparam  [6:0]  sETH_MACS2 = 6'd010;
	localparam  [6:0]  sETH_MACS3 = 6'd011;
	localparam  [6:0]  sETH_MACS4 = 6'd012;
	localparam  [6:0]  sETH_MACS5 = 6'd013;
	localparam  [6:0]  sETH_BADMAC= 6'd014;
	localparam  [6:0]  sETH_TYPE0 = 6'd015;	// type or -> 802.1Q header (TPID)
	localparam  [6:0]  sETH_TYPE1 = 6'd016;	// type

	localparam  [6:0]  sETH_802Q1 = 6'd017;	// 802.1Q header (TPID)
	localparam  [6:0]  sETH_802Q2 = 6'd018;	//   vlan  (TCI)
	localparam  [6:0]  sETH_802Q3 = 6'd019;	//   vlan  (TCI)  => sETH_TYPE0

	// ethertypes
	//  0x0800 IPv4
	//	0x0806 ARP
	//	0x8100 802.1Q frame
	//  0x86DD IPV6
	//
	// error/counter states
	localparam  [6:0]  sETH_TYPE_ERR   = 6'd020;
	localparam  [6:0]  sETH_TYPE_ARP_0 = 6'd021;
	localparam  [6:0]  sETH_TYPE_IPV6  = 6'd022;

	// IPV4 handing
	localparam  [6:0]  sIPV4_VER_SZ	= 6'd030;
	localparam  [6:0]  sIPV4_DSCP	= 6'd031;
	localparam  [6:0]  sIPV4_LEN0	= 6'd032;
	localparam  [6:0]  sIPV4_LEN1	= 6'd033;
	localparam  [6:0]  sIPV4_ID0		= 6'd034;
	localparam  [6:0]  sIPV4_ID1		= 6'd035;
	localparam  [6:0]  sIPV4_FRAG0	= 6'd036;
	localparam  [6:0]  sIPV4_FRAG1	= 6'd037;
	localparam  [6:0]  sIPV4_TTL		= 6'd038;
	localparam  [6:0]  sIPV4_PCOL	= 6'd039;
	localparam  [6:0]  sIPV4_CHK0	= 6'd040;
	localparam  [6:0]  sIPV4_CHK1	= 6'd041;
	localparam  [6:0]  sIPV4_IPSRC0	= 6'd042;
	localparam  [6:0]  sIPV4_IPSRC1	= 6'd043;
	localparam  [6:0]  sIPV4_IPSRC2	= 6'd044;
	localparam  [6:0]  sIPV4_IPSRC3	= 6'd045;
	localparam  [6:0]  sIPV4_IPDST0	= 6'd046;
	localparam  [6:0]  sIPV4_IPDST1	= 6'd047;
	localparam  [6:0]  sIPV4_IPDST2	= 6'd048;
	localparam  [6:0]  sIPV4_IPDST3	= 6'd049;
	localparam  [6:0]  sIPV4_OPTION0		= 6'd050;	// ipv4 options repeat 4bytes
	localparam  [6:0]  sIPV4_OPTION1		= 6'd051;
	localparam  [6:0]  sIPV4_OPTION2		= 6'd052;
	localparam  [6:0]  sIPV4_OPTION3		= 6'd053;

	// IPV4 protocol types
	localparam  [7:0]  IPV4_PCOL_ICMP	= 8'h01;	// ICMP
	localparam  [7:0]  IPV4_PCOL_IGMP	= 8'h02;	// IGMP
	localparam  [7:0]  IPV4_PCOL_TCP		= 8'h06;	// TCP
	localparam  [7:0]  IPV4_PCOL_UDP		= 8'h11;	// UDP
	localparam  [7:0]  IPV4_PCOL_ENCAP	= 8'h62;	// ENCAP
	localparam  [7:0]  IPV4_PCOL_OSPF	= 8'h59;	// OSPF

	// states to handle
	localparam  [6:0]  sICMP0			= 6'd055;
	localparam  [6:0]  sIGMP0			= 6'd056;
	localparam  [6:0]  sUDP0				= 6'd057;
	localparam  [6:0]  sIPV4_TYPE_ERR	= 6'd058;
	localparam  [6:0]  sENCAP0			= 6'd059;
	localparam  [6:0]  sOSPF				= 6'd060;
	localparam  [6:0]  sARP0				= 6'd061;

	localparam  [6:0]  sTCP_SRCP0		= 7'd070;
	localparam  [6:0]  sTCP_SRCP1		= 7'd071;
	localparam  [6:0]  sTCP_DSTP0		= 7'd072;
	localparam  [6:0]  sTCP_DSTP1		= 7'd073;
	localparam  [6:0]  sTCP_SEQ0			= 7'd074;
	localparam  [6:0]  sTCP_SEQ1			= 7'd075;
	localparam  [6:0]  sTCP_SEQ2			= 7'd076;
	localparam  [6:0]  sTCP_SEQ3			= 7'd077;
	localparam  [6:0]  sTCP_ACK0			= 7'd078;
	localparam  [6:0]  sTCP_ACK1			= 7'd079;
	localparam  [6:0]  sTCP_ACK2			= 7'd080;
	localparam  [6:0]  sTCP_ACK3			= 7'd081;
	localparam  [6:0]  sTCP_DATAOFF		= 7'd082;
	localparam  [6:0]  sTCP_FLAGS		= 7'd083;
	localparam  [6:0]  sTCP_WINSZ0		= 7'd084;
	localparam  [6:0]  sTCP_WINSZ1		= 7'd085;
	localparam  [6:0]  sTCP_CHK0			= 7'd086;
	localparam  [6:0]  sTCP_CHK1			= 7'd087;
	localparam  [6:0]  sTCP_URG0			= 7'd088;
	localparam  [6:0]  sTCP_URG1			= 7'd089;
	localparam  [6:0]  sTCP_OPT0			= 7'd090;
	localparam  [6:0]  sTCP_OPT1			= 7'd091;
	localparam  [6:0]  sTCP_OPT2			= 7'd092;
	localparam  [6:0]  sTCP_OPT3			= 7'd093;

	localparam  [6:0]  sTCP_DATA			= 7'd095;


	// fixed size of an IP header (20) and TCP header (20) without any optional headers
	localparam  [15:0]  SZ_IP_TCP_NOOPTIONS	= 16'd20 + 16'd20;

	// hot state
	reg [7:0] pos = 0;

	// Ethernet state
	reg [12:0] eth_vlan = 0;
	reg runt = 0;

	// IPv4 state
	reg [3:0] IPV4_IHeaderLen = 0; 	// decremented at the first byte of each 32 word
									// except first, since value in [4:7] byte 0 so
									// defer decrement until byte 2.
	reg [15:0] IPV4_Size = 0;
	reg [7:0]  IPV4_Pcol = 0;

	// TCP handling
	reg tcpFlagSYN = 0;
	reg tcpFlagACK = 0;
	reg tcpFlagRST = 0;
	reg tcpFlagPSH = 0;
	reg tcpFlagFIN = 0;
	reg [15:0] tcpData = 0;
	reg [3:0] tcpDataOff = 0;
	reg [31:0] tcpSeqBuf = 0;

	reg [31:0] tcpSeqA = 0,  tcpSeqB = 0, tcpSeqC = 0, tcpSeqD = 0;

	// we don't need to reset these in sIDLE as they are asigned before tcp_matches is read
	reg [5:0] msa=0; // match src ip+port
	reg [5:0] mda=0; // match src ip+port
	reg [5:0] msb=0; // match src ip+port
	reg [5:0] mdb=0; // match src ip+port
	reg [5:0] msc=0; // match src ip+port
	reg [5:0] mdc=0; // match src ip+port
	reg [5:0] msd=0; // match src ip+port
	reg [5:0] mdd=0; // match src ip+port

	assign tcp_matchA = (& msa) && (& mda);
	assign tcp_matchB = (& msb) && (& mdb);
	assign tcp_matchC = (& msc) && (& mdc);
	assign tcp_matchD = (& msd) && (& mdd);

	// counters
	reg [7:0] counterEthTypeARP = 0;
	reg [7:0] counterEthTypeIPV6 = 0;
	reg [7:0] counterEthTypeIPV4 = 0;
	reg [7:0] counterEthTypeErr = 0;
	reg [7:0] counterEthMACNotUs = 0;
	reg [7:0] counterEthIPTypeICMP = 0;
	reg [7:0] counterEthIPTypeIGMP = 0;
	reg [7:0] counterEthIPTypeUDP = 0;
	reg [7:0] counterEthIPTypeTCP = 0;
	reg [7:0] counterEthIPTypeOSPF = 0;
	reg [7:0] counterEthIPTypeErr = 0;

	always @(posedge CLOCK)	begin

		if (newpkt) begin
			pos <= sETH_MACD0;
		end else if (dataValid) begin
			case (pos)
				sIDLE:	pos <= (newpkt) ? sETH_MACD0 : sIDLE;
				sETH_MACD0:	pos <= sETH_MACD1;
				sETH_MACD1:	pos <= sETH_MACD2;
				sETH_MACD2:	pos <= sETH_MACD3;
				sETH_MACD3:	pos <= sETH_MACD4;
				sETH_MACD4:	pos <= sETH_MACD5;
				sETH_MACD5:	pos <= sETH_MACS0;
				sETH_MACS0:	pos <= sETH_MACS1;
				sETH_MACS1:	pos <= sETH_MACS2;
				sETH_MACS2:	pos <= sETH_MACS3;
				sETH_MACS3:	pos <= sETH_MACS4;
				sETH_MACS4:	pos <= sETH_MACS5;
				sETH_MACS5:	pos <= sETH_TYPE0;

				sETH_TYPE0:
						// can tell if we are vlan/IPV6 ethertypes from upper byte of TYPE
						// so fork to avoid storing upper type byte for later parsing
						case (data)
							8'h81: pos <= sETH_802Q1;
							8'h86: pos <= sETH_TYPE_IPV6;
							8'h08: pos <= sETH_TYPE1;
							default: pos <= sETH_TYPE_ERR;
						endcase
				sETH_TYPE_ERR: begin
							pos <= sIDLE;
							counterEthTypeErr <= counterEthTypeErr + 1;
						end
				sETH_TYPE_IPV6: begin
							pos <= sIDLE;
							counterEthTypeIPV6 <= counterEthTypeIPV6 + 1;
						end
				sETH_TYPE1:
						// can now fork lower byte of ethertype decoding
						case (data)
							8'h00: pos <= sIPV4_VER_SZ;
							8'h06: pos <= sARP0;
							default: pos <= sETH_TYPE_ERR;
						endcase
				// extended VLAN tag decoding states
				sETH_802Q1: pos <= sETH_802Q2;	// data = 00
				sETH_802Q2: begin
								pos <= sETH_802Q3;	// data = TCI high byte
								// save VLAN tag
								eth_vlan[12:9] <= data[3:0];
						end
				// TRICK: after soaking up the VLAN header, jump back to the ethertype state
				sETH_802Q3: begin
								pos <= sETH_TYPE0;	// data = TCI low byte (vlan TCI[12:0])
								eth_vlan[7:0] <= data[7:0];
						end
				// content states
				sARP0:		begin
								pos <= sIDLE;
								counterEthTypeARP <= counterEthTypeARP + 1;
						end
				// IPv4
				sIPV4_VER_SZ: begin
							pos <= sIPV4_DSCP;
							counterEthTypeIPV4 <= counterEthTypeIPV4 + 1;
							IPV4_IHeaderLen <= data[3:0];
						end
				sIPV4_DSCP:	begin
							pos <= sIPV4_LEN0;
							IPV4_IHeaderLen <= IPV4_IHeaderLen - 1;	// pipelined sub1 4bytes
						end
				sIPV4_LEN0:	begin
							pos <= sIPV4_LEN1;
							IPV4_Size[15:8] <= data;
						end
				sIPV4_LEN1:	begin
							pos <= sIPV4_ID0;
							IPV4_Size[7:0] <= data;
						end
				sIPV4_ID0:	begin
							pos <= sIPV4_ID1;
							IPV4_IHeaderLen <= IPV4_IHeaderLen - 1;	// pipelined sub2 4bytes
						end
				sIPV4_ID1:	begin
							pos <= sIPV4_FRAG0;
						end
				sIPV4_FRAG0:	begin
							pos <= sIPV4_FRAG1;
						end
				sIPV4_FRAG1:	begin
							pos <= sIPV4_TTL;
						end
				sIPV4_TTL:	begin
							pos <= sIPV4_PCOL;
							IPV4_IHeaderLen <= IPV4_IHeaderLen - 1;	// pipelined sub3 4bytes
						end
				sIPV4_PCOL:	begin
							pos <= sIPV4_CHK0;
							IPV4_Pcol <= data;
						end
				sIPV4_CHK0:	begin
							pos <= sIPV4_CHK1;
						end
				sIPV4_CHK1:	begin
							pos <= sIPV4_IPSRC0;
						end
				sIPV4_IPSRC0: begin
							pos <= sIPV4_IPSRC1;
							IPV4_IHeaderLen <= IPV4_IHeaderLen - 1;	// pipelined sub4 4bytes
							msa[0] <= (data == tcpA_src_ip[31:24]);
							msb[0] <= (data == tcpB_src_ip[31:24]);
							msc[0] <= (data == tcpC_src_ip[31:24]);
							msd[0] <= (data == tcpD_src_ip[31:24]);
							tcp_src_ip[31:24] <= data;
						end
				sIPV4_IPSRC1: begin
							pos <= sIPV4_IPSRC2;
							msa[1] <= (data == tcpA_src_ip[23:16]);
							msb[1] <= (data == tcpB_src_ip[23:16]);
							msc[1] <= (data == tcpC_src_ip[23:16]);
							msd[1] <= (data == tcpD_src_ip[23:16]);
							tcp_src_ip[23:16] <= data;
						end
				sIPV4_IPSRC2: begin
							pos <= sIPV4_IPSRC3;
							msa[2] <= (data == tcpA_src_ip[15:8]);
							msb[2] <= (data == tcpB_src_ip[15:8]);
							msc[2] <= (data == tcpC_src_ip[15:8]);
							msd[2] <= (data == tcpD_src_ip[15:8]);
							tcp_src_ip[15:8] <= data;
						end
				sIPV4_IPSRC3: begin
							pos <= sIPV4_IPDST0;
							msa[3] <= (data == tcpA_src_ip[7:0]);
							msb[3] <= (data == tcpB_src_ip[7:0]);
							msc[3] <= (data == tcpC_src_ip[7:0]);
							msd[3] <= (data == tcpD_src_ip[7:0]);
							tcp_src_ip[7:0] <= data;
						end
				sIPV4_IPDST0: begin
							pos <= sIPV4_IPDST1;
							IPV4_IHeaderLen <= IPV4_IHeaderLen - 1;	// pipelined sub5 4bytes
							mda[0] <= (data == tcpA_dst_ip[31:24]);
							mdb[0] <= (data == tcpB_dst_ip[31:24]);
							mdc[0] <= (data == tcpC_dst_ip[31:24]);
							mdd[0] <= (data == tcpD_dst_ip[31:24]);
							tcp_dst_ip[31:24] <= data;
						end
				sIPV4_IPDST1: begin
							pos <= sIPV4_IPDST2;
							mda[1] <= (data == tcpA_dst_ip[23:16]);
							mdb[1] <= (data == tcpB_dst_ip[23:16]);
							mdc[1] <= (data == tcpC_dst_ip[23:16]);
							mdd[1] <= (data == tcpD_dst_ip[23:16]);
							tcp_dst_ip[23:16] <= data;
						end
				sIPV4_IPDST2: begin
							pos <= sIPV4_IPDST3;
							mda[2] <= (data == tcpA_dst_ip[15:8]);
							mdb[2] <= (data == tcpB_dst_ip[15:8]);
							mdc[2] <= (data == tcpC_dst_ip[15:8]);
							mdd[2] <= (data == tcpD_dst_ip[15:8]);
							tcp_dst_ip[15:8] <= data;
						end
				sIPV4_IPDST3: begin
							// if options, loop through OPTIONS0-3 to skip 32bit words, else
							// jump to procotol state saved from pcol byte
							if (IPV4_IHeaderLen == 0)
								case (IPV4_Pcol)
									IPV4_PCOL_ICMP: pos <= sICMP0;
								  	IPV4_PCOL_IGMP: pos <= sIGMP0;
								  	IPV4_PCOL_TCP: pos <= sTCP_SRCP0;
								  	IPV4_PCOL_UDP: pos <= sUDP0;
								  	IPV4_PCOL_ENCAP: pos <= sIPV4_TYPE_ERR;
								  	IPV4_PCOL_OSPF: pos <= sOSPF;
								   	default: pos <= sIPV4_TYPE_ERR;
								endcase
							else pos <= sIPV4_OPTION0;
							mda[3] <= (data == tcpA_dst_ip[7:0]);
							mdb[3] <= (data == tcpB_dst_ip[7:0]);
							mdc[3] <= (data == tcpC_dst_ip[7:0]);
							mdd[3] <= (data == tcpD_dst_ip[7:0]);
							tcp_dst_ip[7:0] <= data;
						end
				 // IPv4 OPTIONS loop
				 sIPV4_OPTION0: begin
							pos <= sIPV4_OPTION1;
							IPV4_IHeaderLen <= IPV4_IHeaderLen - 1;	// pipelined sub2 4bytes
						end
				 sIPV4_OPTION1: begin
							pos <= sIPV4_OPTION2;
						end
				 sIPV4_OPTION2: begin
							pos <= sIPV4_OPTION3;
						end
				 sIPV4_OPTION3: begin
							// fork back to OPTION0 or IPV4_PCOL
							if (IPV4_IHeaderLen == 0)
								case (IPV4_Pcol)
									IPV4_PCOL_ICMP: pos <= sICMP0;
								  	IPV4_PCOL_IGMP: pos <= sIGMP0;
								  	IPV4_PCOL_TCP: pos <= sTCP_SRCP0;
								  	IPV4_PCOL_UDP: pos <= sUDP0;
								  	IPV4_PCOL_ENCAP: pos <= sIPV4_TYPE_ERR;
								  	IPV4_PCOL_OSPF: pos <= sOSPF;
								   	default: pos <= sIPV4_TYPE_ERR;
								endcase
							else pos <= sIPV4_OPTION0;
						end
				// TCP states
				sICMP0:	begin
							pos <= sIDLE;
							counterEthIPTypeICMP <= counterEthIPTypeICMP + 1;
						end
				sIGMP0:	begin
							pos <= sIDLE;
							counterEthIPTypeIGMP <= counterEthIPTypeIGMP + 1;
						end

				sUDP0:	begin
							pos <= sIDLE;
							counterEthIPTypeUDP <= counterEthIPTypeUDP + 1;
						end
				sIPV4_TYPE_ERR: begin
							pos <= sIDLE;
							counterEthIPTypeErr <= counterEthIPTypeErr + 1;
						end
				sOSPF: begin
							pos <= sIDLE;
							counterEthIPTypeOSPF <= counterEthIPTypeOSPF + 1;
						end

				sTCP_SRCP0: begin
							pos <= sTCP_SRCP1;
							counterEthIPTypeTCP <= counterEthIPTypeTCP + 1;
							msa[4] <= (data == tcpA_src_port[15:8]);
							msb[4] <= (data == tcpB_src_port[15:8]);
							msc[4] <= (data == tcpC_src_port[15:8]);
							msd[4] <= (data == tcpD_src_port[15:8]);
							tcp_src_port[15:8] <= data;
						end
				sTCP_SRCP1: begin
							pos <= sTCP_DSTP0;
							msa[5] <= (data == tcpA_src_port[7:0]);
							msb[5] <= (data == tcpB_src_port[7:0]);
							msc[5] <= (data == tcpC_src_port[7:0]);
							msd[5] <= (data == tcpD_src_port[7:0]);
							tcp_src_port[7:0] <= data;
						end
				sTCP_DSTP0: begin
							pos <= sTCP_DSTP1;
							mda[4] <= (data == tcpA_dst_port[15:8]);
							mdb[4] <= (data == tcpB_dst_port[15:8]);
							mdc[4] <= (data == tcpC_dst_port[15:8]);
							mdd[4] <= (data == tcpD_dst_port[15:8]);
							tcp_dst_port[15:8] <= data;
						end
				sTCP_DSTP1: begin
							pos <= sTCP_SEQ0;
							mda[5] <= (data == tcpA_dst_port[7:0]);
							mdb[5] <= (data == tcpB_dst_port[7:0]);
							mdc[5] <= (data == tcpC_dst_port[7:0]);
							mdd[5] <= (data == tcpD_dst_port[7:0]);
							tcp_dst_port[7:0] <= data;
						end
				// it's mandatory to buffer the SEQuence number as we don't know whether to latch
				// to tcpSeqNum (SYN) or compare for gaploss (!SYN)
				sTCP_SEQ0: begin
							pos <= sTCP_SEQ1;
							tcpSeqBuf[31:24] <= data;
						end
				sTCP_SEQ1: begin
							pos <= sTCP_SEQ2;
							tcpSeqBuf[23:16] <= data;
						end
				sTCP_SEQ2: begin
							pos <= sTCP_SEQ3;
							tcpSeqBuf[15:8] <= data;
						end
				sTCP_SEQ3: begin
							pos <= sTCP_ACK0;
							tcpSeqBuf[7:0] <= data;
						end
				sTCP_ACK0: pos <= sTCP_ACK1;
				sTCP_ACK1: pos <= sTCP_ACK2;
				sTCP_ACK2: pos <= sTCP_ACK3;
				sTCP_ACK3: pos <= sTCP_DATAOFF;
				sTCP_DATAOFF: begin
							pos <= sTCP_FLAGS;
							// data offset in d-words, minimum 5
							//  [SRCPDSTP] [SEQ] [ACK] [FLAGs/SZ] [CHK/URG] {[OPTS]} [data]
							tcpDataOff <= data[7:4];
						end
				sTCP_FLAGS: begin
							pos <= sTCP_WINSZ0;
							tcpFlagFIN <= data[0];
							tcpFlagSYN <= data[1];
							tcpFlagRST <= data[2];
							tcpFlagPSH <= data[3];
							tcpFlagACK <= data[4];
						end
				sTCP_WINSZ0: pos <= sTCP_WINSZ1;
				sTCP_WINSZ1: pos <= sTCP_CHK0;
				sTCP_CHK0: pos <= sTCP_CHK1;
				sTCP_CHK1: pos <= sTCP_URG0;
				sTCP_URG0: pos <= sTCP_URG1;
				sTCP_URG1: begin
							pos <= (tcpDataOff != 5) ? sTCP_OPT0 : 	// 5 words in TCP if no options
									(tcpData != 0) ? sTCP_DATA:		// 0 if this last byte (ie. no data)
									sIDLE;
						end
				sTCP_OPT0: begin
							pos <= sTCP_OPT1;
							tcpDataOff <= tcpDataOff - 1; // we've read one dword of options, reduce tcpDataOff towards 5
						end
				sTCP_OPT1: begin
							pos <= sTCP_OPT2;
						end
				sTCP_OPT2: begin
							pos <= sTCP_OPT3;
						end
				sTCP_OPT3: begin
							pos <= (tcpDataOff != 5) ? sTCP_OPT0 :
									(tcpData != 1) ? sTCP_DATA : 		// 1 if this is last byte
									 sIDLE;
						end
				sTCP_DATA: begin
							pos <= (tcpData != 1) ? sTCP_DATA : sIDLE;	// 1 if this is last byte

						end
			endcase

			// if (pos == sETH_MACD0) me0 <= data == mac[47:40];
			// if (pos == sETH_MACD1) me1 <= data == mac[39:32];
			// if (pos == sETH_MACD2) me2 <= data == mac[31:24];
			// if (pos == sETH_MACD3) me3 <= data == mac[23:16];
			// if (pos == sETH_MACD4) me4 <= data == mac[15:8];
			// if (pos == sETH_MACD5) me5 <= data == mac[7:0];

		end

		// load TCP data size assuming no IPV4 options, no TCP options, then decrement during any (valid) optional states
		if (pos == sIPV4_ID0) begin
			tcpData <= IPV4_Size - SZ_IP_TCP_NOOPTIONS;
		end else if ((pos == sIPV4_OPTION0 || pos == sIPV4_OPTION1 || pos == sIPV4_OPTION2 || pos == sIPV4_OPTION3
					|| pos == sTCP_OPT0 || pos == sTCP_OPT1 || pos == sTCP_OPT2 || pos == sTCP_OPT3
					|| pos == sTCP_DATA ) && dataValid) begin
			tcpData <= tcpData - 1;
		end

		// don't raise outnewpkt for SYN/ACK (packets with no data payload)
		// When tcpDataOff has reduced to 5, we have consumed all the TCP header.
		// Independantly, there might not be any tcp payload ("data") in the packet.
		outnewpkt <= dataValid && (
						( (pos == sTCP_URG1) && (tcpData != 0) && (tcpDataOff == 5) ) ||
		           		( (pos == sTCP_OPT3) && (tcpData != 0) && (tcpDataOff == 5) )
		           	);

		outDataMatchA <= dataValid && tcp_matchA && pos == sTCP_DATA;
		outDataMatchB <= dataValid && tcp_matchB && pos == sTCP_DATA;
		outDataMatchC <= dataValid && tcp_matchC && pos == sTCP_DATA;
		outDataMatchD <= dataValid && tcp_matchD && pos == sTCP_DATA;
		outDataPayload <= dataValid && pos == sTCP_DATA;
		outData <= data;

        // some elements of the design are idempotent so can be repeated while a state is held
        // waiting for dataValid. Bring out to this block.

		if (pos == sTCP_WINSZ0) begin
			if (tcpFlagSYN) begin
				if (tcp_matchA) tcpSeqA <= tcpSeqBuf;
				if (tcp_matchB) tcpSeqB <= tcpSeqBuf;
			end else begin
				// no SYN... so tcpSeqBuf should match our "calculated" tcpSeq which has been
				// incremented by the last data payload
				gappedA <= (tcpSeqBuf != tcpSeqA) && tcp_matchA;
				gappedB <= (tcpSeqBuf != tcpSeqB) && tcp_matchB;
			end
		end

	end

endmodule


