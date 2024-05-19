// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module manage_rx(
   clk,
   reset_n,
////crc_check module interface///
   pkt_wrreq,
   pkt,
   pkt_usedw,
   valid_wrreq,
   valid,
////pkt insert module interface ////  
   datapath_pkt_wrreq,
   datapath_pkt,
   datapath_pkt_usedw,
   datapath_valid_wrreq,
   datapath_valid,
 //////command parse module interface/////////
   command_data,         //command [34:32]001:��ʾ���ݵ�һ��  011:��ʾ�����м���  010:��ʾ��������һ��   111:��ʾ����ͷβͬ�� [31:0]:����
   command_wr,
   command_fifo_full,
   sequence_d,           //[15:0]:�������кţ�[16]:������Ч��־ 1��������Ч 0��������Ч �趪��
   sequence_wr,
   sequence_fifo_full,
   PROXY_MAC,
   PROXY_IP,
   FPGA_MAC,
   FPGA_IP,
   proxy_addr_valid
);
input         clk;
input         reset_n;
////crc_check module interface///
input         pkt_wrreq;
input[138:0]  pkt;
output [7:0]  pkt_usedw;
input         valid_wrreq;
input         valid;
////pkt insert module interface ////  
output        datapath_pkt_wrreq;
output[138:0] datapath_pkt;
input [7:0]   datapath_pkt_usedw;
output        datapath_valid_wrreq;
output        datapath_valid;
 //////command parse module interface/////////
output [34:0] command_data;         //command [34:32]001:��ʾ���ݵ�һ��  011:��ʾ�����м���  010:��ʾ��������һ��   111:��ʾ����ͷβͬ�� [31:0]:����
output        command_wr;
input         command_fifo_full;
output [16:0] sequence_d;           //[15:0]:�������кţ�[16]:������Ч��־ 1��������Ч 0��������Ч �趪��
output        sequence_wr;
input         sequence_fifo_full;

output [47:0] PROXY_MAC; 
output [31:0] PROXY_IP;
output        proxy_addr_valid;
input  [47:0] FPGA_MAC; 
input  [31:0] FPGA_IP;

reg        datapath_pkt_wrreq;
reg[138:0] datapath_pkt;
reg        datapath_valid_wrreq;
reg        datapath_valid;
 //////command parse module interface/////////
reg [34:0] command_data;         //command [34:32]001:��ʾ���ݵ�һ��  011:��ʾ�����м���  010:��ʾ��������һ��   111:��ʾ����ͷβͬ�� [31:0]:����
reg        command_wr;
reg [16:0] sequence_d;           //[15:0]:�������кţ�[16]:������Ч��־ 1��������Ч 0��������Ч �趪��
reg        sequence_wr;

reg [47:0] PROXY_MAC; 
reg [31:0] PROXY_IP;
reg        proxy_addr_valid;

reg [47:0] S_MAC;//?MAC??
reg [31:0] S_IP; //?IP??

reg [47:0] D_MAC;//add by bhf in 2014.5.24
reg [7:0] protocol;//add by bhf in 2014.5.24
reg [138:0] first_pkt;//add by bhf in 2014.5.24
reg [138:0] second_pkt;//add by bhf in 2014.5.24
reg [138:0] third_pkt;//add by bhf in 2014.5.24

reg [15:0]packet_length;//coammand length
reg [15:0]dip_h16;
reg [138:0]pkt_reg;
reg fifo_wr_permit;

reg empty;
reg fifo_valid;
reg [3:0]state;
parameter idle_s         = 4'h0,
          command_smac_s = 4'h1,
          command_type_s = 4'h2,
          command_dip_s  = 4'h3,
          command0_s     = 4'h4,
          command1_s     = 4'h5,
          command2_s     = 4'h6,
          command3_s     = 4'h7,
          command4_s     = 4'h8,
          wr_datapath_s  = 4'h9,
          wait_s         = 4'ha,
          discard_s      = 4'hb,
		    wr_fpkt_s      = 4'hc,//add by bhf in 2014.5.24
		    wr_spkt_s      = 4'hd,//add by bhf in 2014.5.24
		    wr_tpkt_s      = 4'he;//add by bhf in 2014.5.24
		  
always@(posedge clk or negedge reset_n)
begin
if(~reset_n)begin
  datapath_pkt_wrreq <= 1'b0;
  pkt_rdreq <= 1'b0;
  valid_rdreq <= 1'b0;
  empty <= 1'b0;
  fifo_valid <= 1'b0;
  datapath_valid_wrreq <= 1'b0;
  command_wr           <= 1'b0;
  sequence_wr          <= 1'b0;
  proxy_addr_valid    <= 1'b0;
  state <= idle_s;
end
else begin
 fifo_wr_permit     <= ~(command_fifo_full | sequence_fifo_full);// 1:permit
 empty <= valid_empty;
 fifo_valid <= 1'b0;
case(state)
idle_s:begin
    datapath_pkt_wrreq <= 1'b0;
    datapath_valid_wrreq <= 1'b0;
    command_wr           <= 1'b0;
    sequence_wr          <= 1'b0;
	
  if(valid_empty==1'b0)begin
	if(valid_q==1'b0) begin//invalid pkt
       pkt_rdreq<=1'b1;
       valid_rdreq<=1'b1;
       state <= discard_s;
    end
    else begin
        if(fifo_wr_permit == 1'b1)begin 
            pkt_rdreq   <=1'b1;
            valid_rdreq <=1'b1;
            state <= command_smac_s;
        end
        else begin//command fifo afull
            pkt_rdreq<=1'b1;
            valid_rdreq<=1'b1;
            state <= discard_s;
        end
    end
  end
  else begin
	 state <= idle_s;
  end
 end
command_smac_s:begin
  pkt_rdreq<=1'b1;
  valid_rdreq <=1'b0;
  first_pkt   <= pkt_q;//add by bhf in 2014.5.24
  D_MAC       <= pkt_q[127:80];//add by bhf in 2014.5.24
  S_MAC       <= pkt_q[79:32];
  state       <= command_type_s;
end
command_type_s:begin   
      packet_length  <= pkt_q[127:112] - 16'd26;
      S_IP   <= pkt_q[47:16];
      dip_h16 <= pkt_q[15:0];
	  
	  second_pkt   <= pkt_q;//add by bhf in 2014.5.24
	  protocol <= pkt_q[71:64];//add by bhf in 2014.5.24
	  pkt_rdreq<=1'b1;
	  
      state  <= command_dip_s;
 
end
command_dip_s:begin
  pkt_rdreq<=1'b0;
  third_pkt   <= pkt_q;//add by bhf in 2014.5.24
  pkt_reg <= pkt_q;
  if(({dip_h16,pkt_q[127:112]}== FPGA_IP) && (D_MAC == FPGA_MAC) && (protocol == 8'd253))//NMAC okt,dest mac and ip is NetMagic
  begin
     sequence_d[15:0]   <= pkt_q[95:80]; 
     command_data[31:0] <= pkt_q[63:32];
     command_wr         <= 1'b1;
     if(pkt_q[63:56]==8'h01)begin//establish
    	    command_data[34:32] <= 3'b100;
    		PROXY_MAC        <= S_MAC;
    		PROXY_IP         <= S_IP;
    		proxy_addr_valid <= 1'b1;
    		sequence_d[16]      <= 1'b1;
            sequence_wr         <= 1'b1;
    		 if(pkt_q[138:136]==3'b110) begin
               state<=wait_s;
             end  
            else begin
              pkt_rdreq<=1'b1;
              state <= discard_s;
             end   
    	end 
     else if ((pkt_q[63:56]==8'h03) || (pkt_q[63:56]==8'h04)) begin//read or write
        if(packet_length <= 16'h4)begin//only one cycle command
            command_data[34:32] <= 3'b100; 
            command_wr         <= 1'b1;
            sequence_d[16]      <= 1'b1;  //????
    	  	   sequence_wr         <= 1'b1;
            if(pkt_q[138:136]==3'b110) begin
               state<=wait_s;
             end  
            else begin
              pkt_rdreq<=1'b1;
              state <= discard_s;
             end   
          end
        else begin
            command_data[34:32] <= 3'b001;
            command_wr         <= 1'b1;
            sequence_wr         <= 1'b0;
    		packet_length       <= packet_length - 4'h4;
    		state <= command0_s;
          end
      end
	else begin//other nmac pkt is to data path
	   state <= wr_fpkt_s;
	end
  end
  else begin
      state <= wr_fpkt_s;  			 
   end
end

wr_fpkt_s:begin
    if(datapath_pkt_usedw <= 8'd161)begin
        datapath_pkt_wrreq <= 1'b1;
		datapath_pkt <= first_pkt; 
		state <= wr_spkt_s;
    end
    else begin
        pkt_rdreq<=1'b1;
        state <= discard_s;
    end
end
wr_spkt_s:begin
	datapath_pkt_wrreq <= 1'b1;
	datapath_pkt <= second_pkt;  
	state <= wr_tpkt_s;
end
wr_tpkt_s:begin
	datapath_pkt_wrreq <= 1'b1;
	datapath_pkt <= third_pkt;
	pkt_rdreq<=1'b1;
	state <= wr_datapath_s;
end

command0_s:begin
if(packet_length <= 16'h4)begin
  command_data[34:32] <= 3'b010; 
  command_data[31:0]  <= pkt_reg[31:0];
   command_wr         <= 1'b1;
  sequence_d[16]      <= 1'b1;  
  sequence_wr         <= 1'b1;
  if(pkt_reg[138:136]==3'b110) begin
      state<=wait_s;
    end  
  else begin
      pkt_rdreq<=1'b1;
      state <= discard_s;
    end  
 end
else begin
  command_data[34:32] <= 3'b011; 
  command_data[31:0]  <= pkt_reg[31:0];
   command_wr         <= 1'b1;
  packet_length       <= packet_length - 4'h4;
  pkt_rdreq<=1'b1;
  state <= command1_s;
  end
end
command1_s:begin
pkt_rdreq<=1'b0;
pkt_reg <= pkt_q;
if(packet_length <= 16'h4)begin
  command_data[34:32] <= 3'b010; 
  command_data[31:0]  <= pkt_q[127:96];
   command_wr         <= 1'b1;
  sequence_d[16]      <= 1'b1;  
  sequence_wr         <= 1'b1;
  if(pkt_q[138:136]==3'b110) begin
      state<=wait_s;
    end  
  else begin
      pkt_rdreq<=1'b1;
      state <= discard_s;
    end  
 end
else begin
  command_data[34:32] <= 3'b011; 
  command_data[31:0]  <= pkt_q[127:96];
   command_wr         <= 1'b1;
  packet_length       <= packet_length - 4'h4;
  state <= command2_s;
  end
end
command2_s:begin
if(packet_length <= 16'h4)begin
  command_data[34:32] <= 3'b010; 
  command_data[31:0]  <= pkt_reg[95:64];
   command_wr         <= 1'b1;
  sequence_d[16]      <= 1'b1;  
  sequence_wr         <= 1'b1;
  if(pkt_reg[138:136]==3'b110) begin
      state<=wait_s;
    end  
  else begin
      pkt_rdreq<=1'b1;
      state <= discard_s;
    end  
 end
else begin
  command_data[34:32] <= 3'b011; 
  command_data[31:0]  <= pkt_reg[95:64];
   command_wr         <= 1'b1;
  packet_length       <= packet_length - 4'h4;
  state <= command3_s;
  end
end
command3_s:begin
if(packet_length <= 16'h4)begin
  command_data[34:32] <= 3'b010; 
  command_data[31:0]  <= pkt_reg[63:32];
   command_wr         <= 1'b1;
  sequence_d[16]      <= 1'b1;  
  sequence_wr         <= 1'b1;
  if(pkt_reg[138:136]==3'b110) begin
      state<=wait_s;
    end  
  else begin
      pkt_rdreq<=1'b1;
      state <= discard_s;
    end  
 end
else begin
  command_data[34:32] <= 3'b011; 
  command_data[31:0]  <= pkt_reg[63:32];
   command_wr         <= 1'b1;
  packet_length       <= packet_length - 4'h4;
  state <= command4_s;
  end
end
command4_s:begin
if(packet_length <= 16'h4)begin
  command_data[34:32] <= 3'b010; 
  command_data[31:0]  <= pkt_reg[31:0];
   command_wr         <= 1'b1;
  sequence_d[16]      <= 1'b1;  
  sequence_wr         <= 1'b1;
  if(pkt_reg[138:136]==3'b110) begin
      state<=wait_s;
    end  
  else begin
      pkt_rdreq<=1'b1;
      state <= discard_s;
    end  
 end
else begin
  command_data[34:32] <= 3'b011; 
  command_data[31:0]  <= pkt_reg[31:0];
   command_wr         <= 1'b1;
  packet_length       <= packet_length - 4'h4;
  pkt_rdreq<=1'b1;
  state <= command1_s;
  end
end
wr_datapath_s:begin
   valid_rdreq <= 1'b0;
   datapath_pkt <= pkt_q;
   datapath_pkt_wrreq <= 1'b1;
   if(pkt_q[138:136]==3'b110)//tail;
      begin
        pkt_rdreq<=1'b0;
        datapath_valid_wrreq <= 1'b1;
        datapath_valid <= 1'b1;
        state<=wait_s;
      end
    else begin
        pkt_rdreq <= 1'b1;
        state <= wr_datapath_s;
       end
  end
wait_s:begin//wait the fifo empty signal to 1
  datapath_pkt_wrreq <= 1'b0;
  pkt_rdreq <= 1'b0;
  valid_rdreq <= 1'b0;
  datapath_valid_wrreq <= 1'b0;
  command_wr           <= 1'b0;
  sequence_wr          <= 1'b0;
  state <= idle_s;
end
discard_s:begin
  datapath_pkt_wrreq <= 1'b0;
  pkt_rdreq <= 1'b0;
  valid_rdreq <= 1'b0;
  datapath_valid_wrreq <= 1'b0;
  command_wr           <= 1'b0;
  sequence_wr          <= 1'b0;
     if(pkt_q[138:136]==3'b110)//tail;
         begin
           pkt_rdreq<=1'b0;
           state<=wait_s;
          end
     else
         begin
           pkt_rdreq<=1'b1;
           state<=discard_s;
         end
  end
endcase
end
end

reg  pkt_rdreq;
wire [138:0]pkt_q;
wire [7:0]  pkt_usedw;
fifo_256_139 fifo_256_139_manage_rx(
	.aclr(!reset_n),
	.clock(clk),
	.data(pkt),
	.rdreq(pkt_rdreq),
	.wrreq(pkt_wrreq),
	.q(pkt_q),
	.usedw(pkt_usedw)
   );     
reg  valid_rdreq;
wire valid_q;
wire valid_empty;
fifo_64_1 fifo_64_1_manage_rx(
	.aclr(!reset_n),
	.clock(clk),
	.data(valid),
	.rdreq(valid_rdreq),
	.wrreq(valid_wrreq),
	.empty(valid_empty),
	.q(valid_q)
   );     
endmodule 