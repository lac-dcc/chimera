// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module manage_tx(
clk,
reset_n,
 // ack_fifo_wrclk,
ack_pkt,   //[35:34]01:表示数据第一拍  11:表示数据中间拍  10:表示数据最后一拍  [33:32]:有效字节数  [31:0]:报文
ack_wr,
ack_afull, 
//FPGA返回给管理接口的报文有效标志位;这个FIFO非空表示报文FIFO中至少有一个完整的报文了
ack_valid_wr,
ack_valid_afull,

pass_pkt,
pass_pkt_wrreq,
pass_pkt_usedw,
pass_valid_wrreq,
pass_valid,

tx_pkt,
tx_pkt_wrreq,
tx_pkt_valid,
tx_pkt_valid_wrreq,
tx_pkt_usedw
);
input       clk;
input       reset_n;

 // ack_fifo_wrclk,
input [35:0]ack_pkt;   //[35:34]01:表示数据第一拍  11:表示数据中间拍  10:表示数据最后一拍  [33:32]:有效字节数  [31:0]:报文
input       ack_wr;
output      ack_afull; 
//FPGA返回给管理接口的报文有效标志位;这个FIFO非空表示报文FIFO中至少有一个完整的报文了
input       ack_valid_wr;
output       ack_valid_afull;

input[138:0]pass_pkt;
input       pass_pkt_wrreq;
output [7:0]pass_pkt_usedw;
input       pass_valid_wrreq;
input       pass_valid;

output [138:0]tx_pkt;
output        tx_pkt_wrreq;
output        tx_pkt_valid;
output        tx_pkt_valid_wrreq;
input [7:0]   tx_pkt_usedw;

///////////////////////////////////
reg [138:0]tx_pkt;
reg        tx_pkt_wrreq;
reg        tx_pkt_valid;
reg        tx_pkt_valid_wrreq;

reg [3:0]state;
parameter idle_s      = 4'h0,
          ack_head0_s = 4'h1,
          ack_head1_s = 4'h2,
          ack_head2_s = 4'h3,
          ack_head3_s = 4'h4,
          ack_mid0_s  = 4'h5,
          ack_mid1_s  = 4'h6,
          ack_mid2_s  = 4'h7,
          ack_mid3_s  = 4'h8,
          pass_data_s = 4'h9,
          drop_s      = 4'ha,
          wait_s      = 4'hb;
always@(posedge clk or negedge reset_n)
begin
if(~reset_n)begin
   tx_pkt_wrreq       <= 1'b0;
   tx_pkt_valid_wrreq <= 1'b0;
   pass_pkt_rdreq     <= 1'b0;
   pass_valid_rdreq   <= 1'b0;
   ack_rdreq          <= 1'b0; 
   ack_valid_rdreq    <= 1'b0;
   state <= idle_s;
end
else begin
case(state)
idle_s:begin
   tx_pkt_wrreq       <= 1'b0;
   tx_pkt_valid_wrreq <= 1'b0;
   pass_pkt_rdreq     <= 1'b0;
   pass_valid_rdreq   <= 1'b0;
   ack_rdreq          <= 1'b0; 
   ack_valid_rdreq    <= 1'b0;
 if(tx_pkt_usedw <= 8'd161)begin
   if(ack_valid_empty == 1'b0)begin
     ack_rdreq          <= 1'b1; 
     ack_valid_rdreq    <= 1'b1;
     state <= ack_head0_s;
    end
   else if(pass_valid_empty == 1'b0)begin
      if(pass_valid_q==1'b0)begin//drop
         pass_pkt_rdreq     <= 1'b1;
         pass_valid_rdreq   <= 1'b1;
         state <= drop_s;
       end
      else begin
          pass_pkt_rdreq     <= 1'b1;
          pass_valid_rdreq   <= 1'b1;
          state <= pass_data_s;
         end
    end
   else begin
      state <= idle_s;
    end
   end
else begin
  state <= idle_s;
 end
end
ack_head0_s:begin
  ack_rdreq          <= 1'b1; 
  ack_valid_rdreq    <= 1'b0;
  tx_pkt[138:136] <= 3'b101;
  tx_pkt[135:128] <= 8'hf0;
  tx_pkt[127:96]  <= ack_rdata[31:0]; 
  state <= ack_head1_s;
end
ack_head1_s:begin
  tx_pkt[95:64]  <= ack_rdata[31:0]; 
  state <= ack_head2_s;
end
ack_head2_s:begin
  tx_pkt[63:32]  <= ack_rdata[31:0]; 
  state <= ack_head3_s;
end
ack_head3_s:begin
  tx_pkt[31:0]  <= ack_rdata[31:0]; 
  tx_pkt_wrreq  <= 1'b1;
  state <= ack_mid0_s;
end
ack_mid0_s:begin
tx_pkt_wrreq  <= 1'b0;
  if(ack_rdata[35:34]==2'b10)begin//tail
     ack_rdreq  <= 1'b0;
     tx_pkt[138:136] <= 3'b110;
     tx_pkt[135:128] <= 8'h30; 
     tx_pkt[127:96]  <= ack_rdata[31:0]; 
     tx_pkt_wrreq    <= 1'b1;
     tx_pkt_valid_wrreq <= 1'b1;
     tx_pkt_valid <= 1'b1;
     state <= wait_s;
   end
  else begin
     tx_pkt[127:96]  <= ack_rdata[31:0]; 
     state <= ack_mid1_s;
   end
end
ack_mid1_s:begin
  if(ack_rdata[35:34]==2'b10)begin//tail
     ack_rdreq  <= 1'b0;
     tx_pkt[138:136] <= 3'b110;
     tx_pkt[135:128] <= 8'h70; 
     tx_pkt[95:64]  <= ack_rdata[31:0]; 
     tx_pkt_wrreq    <= 1'b1;
     tx_pkt_valid_wrreq <= 1'b1;
     tx_pkt_valid <= 1'b1;
     state <= wait_s;
   end
  else begin
     tx_pkt[95:64]  <= ack_rdata[31:0]; 
     state <= ack_mid2_s;
   end
end
ack_mid2_s:begin
  if(ack_rdata[35:34]==2'b10)begin//tail
     ack_rdreq  <= 1'b0;
     tx_pkt[138:136] <= 3'b110;
     tx_pkt[135:128] <= 8'hb0; 
     tx_pkt[63:32]  <= ack_rdata[31:0]; 
     tx_pkt_wrreq    <= 1'b1;
     tx_pkt_valid_wrreq <= 1'b1;
     tx_pkt_valid <= 1'b1;
     state <= wait_s;
   end
  else begin
     tx_pkt[63:32]  <= ack_rdata[31:0]; 
     state <= ack_mid3_s;
   end
end
ack_mid3_s:begin
  if(ack_rdata[35:34]==2'b10)begin//tail
     ack_rdreq  <= 1'b0;
     tx_pkt[138:136] <= 3'b110;
     tx_pkt[135:128] <= 8'hf0; 
     tx_pkt[31:0]  <= ack_rdata[31:0]; 
     tx_pkt_wrreq    <= 1'b1;
     tx_pkt_valid_wrreq <= 1'b1;
     tx_pkt_valid <= 1'b1;
     state <= wait_s;
   end
  else begin
     tx_pkt[138:136] <= 3'b100;
     tx_pkt[135:128] <= 8'hf0; 
     tx_pkt[31:0]    <= ack_rdata[31:0]; 
     tx_pkt_wrreq    <= 1'b1;
     tx_pkt_valid_wrreq <= 1'b0;
      ack_rdreq  <= 1'b1;
     state <= ack_mid0_s;
   end
end
pass_data_s:begin
   pass_valid_rdreq <= 1'b0;
   tx_pkt <= pass_pkt_q;
   tx_pkt_wrreq <= 1'b1;
   if(pass_pkt_q[138:136] == 3'b110)begin
     tx_pkt_valid_wrreq <= 1'b1;
     tx_pkt_valid    <= 1'b1;
     pass_pkt_rdreq  <= 1'b0;
     state <= wait_s;
    end
   else begin
      pass_pkt_rdreq  <= 1'b1;
      state <= pass_data_s;
    end
end
drop_s:begin
pass_valid_rdreq  <= 1'b0;
if(pass_pkt_q[138:136] == 3'b110)begin
  pass_pkt_rdreq  <= 1'b0;
  state <= wait_s; 
 end
else begin
  pass_pkt_rdreq  <= 1'b1;
  state <= drop_s;
end
end
wait_s:begin
   tx_pkt_wrreq       <= 1'b0;
   tx_pkt_valid_wrreq <= 1'b0;
   pass_pkt_rdreq     <= 1'b0;
   pass_valid_rdreq   <= 1'b0;
   ack_rdreq          <= 1'b0; 
   ack_valid_rdreq    <= 1'b0;
 state <= idle_s;
    end
   endcase
  end
end
reg         pass_pkt_rdreq;
wire [138:0]pass_pkt_q;
wire [7:0]  pass_pkt_usedw;
fifo_256_139 fifo_256_139_manage_tx(
	.aclr(!reset_n),
	.clock(clk),
	.data(pass_pkt),
	.rdreq(pass_pkt_rdreq),
	.wrreq(pass_pkt_wrreq),
	.q(pass_pkt_q),
	.usedw(pass_pkt_usedw)
   );     
reg  pass_valid_rdreq;
wire pass_valid_q;
wire pass_valid_empty;
fifo_64_1 fifo_64_1_manage_tx(
	.aclr(!reset_n),
	.clock(clk),
	.data(pass_valid),
	.rdreq(pass_valid_rdreq),
	.wrreq(pass_valid_wrreq),
	.empty(pass_valid_empty),
	.q(pass_valid_q)
   ); 
 
 //响应报文 报文FIFO 
wire [9:0]  wrusedw_ack; 
reg          ack_rdreq;
wire [35:0]  ack_rdata;
tx_fifo  ack_fifo (
	    .aclr(!reset_n),
	    .data(ack_pkt),
	    .rdclk(clk),
	    .rdreq(ack_rdreq),
	    .wrclk(clk),
	    .wrreq(ack_wr),
	    .q(ack_rdata),
	    .rdempty(),
	    .wrusedw(wrusedw_ack)); 
assign ack_afull = (wrusedw_ack > 10'd640)?1'b1:1'b0;//已经放了2564个字节，还能放1532个字节
  
wire [7:0]  wrusedw_valid_ack; 
reg         ack_valid_rdreq;
wire        ack_valid_rdata;
wire        ack_valid_empty; 	 
	 
tx_valid_fifo ack_valid_fifo(//FPGA返回的报文肯定有效。因为无法判断自己生成的报文错误。
	    .aclr(!reset_n),
	    .data(1'b1),
	    .rdclk(clk),
	    .rdreq(ack_valid_rdreq),
	    .wrclk(clk),
	    .wrreq(ack_valid_wr),
	    .q(ack_valid_rdata),
	    .rdempty(ack_valid_empty),
	    .wrusedw(wrusedw_valid_ack)); 
	 
assign ack_valid_afull = (wrusedw_valid_ack > 8'd250)?1'b1:1'b0; 
endmodule 