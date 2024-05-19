// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module check_100_1000(
   rgmii_rx_clk,//网口rgmii_rx_clk  25MHz时网口速率为100M、125MHz时网口速率为1000M
   sys_clk,//用125M的本板时钟
   sys_rst_n,
   SPEED_IS_100_1000//1：100M   0:1000M
);
input rgmii_rx_clk;
input sys_clk;
input sys_rst_n;
output SPEED_IS_100_1000;
reg SPEED_IS_100_1000;
reg [6:0]timer;
reg rst_fifo;
reg wrreq;
reg [1:0]state;
parameter idle_s = 2'b00,
          wait_s = 2'b01,
          rst_fifo_s = 2'b10;
always@(posedge sys_clk or negedge sys_rst_n)
begin
if(sys_rst_n==1'b0)begin
	SPEED_IS_100_1000 <= 1'b0;//默认为1000M
	timer	<= 7'b0;
	state <= idle_s;
end
else case(state)
idle_s:begin
  if(timer[3]==1'b1)begin
    wrreq <= 1'b1;
    timer <= 7'b0;
    state <= wait_s;
   end
 else begin
   
    timer	<= timer + 1'b1;
    state  <= idle_s;
   end
  end
wait_s:begin
  if(timer[6]==1'b1)begin
      if(rdusedw <= 7'd40)begin
         SPEED_IS_100_1000 <= 1'b1;//100M
       end
      else begin
         SPEED_IS_100_1000 <= 1'b0;//1000M
       end
      timer <= 7'b0;
      wrreq <= 1'b0;
      state <= rst_fifo_s;
   end
  else begin
     timer	<= timer + 1'b1;
     state  <= wait_s; 
   end
end
rst_fifo_s:begin
   if(timer[6]==1'b1)begin
     rst_fifo <= 1'b0; 
     timer <= 7'b0;
     state <= idle_s;
    end
   else begin
     rst_fifo <= 1'b1;
     timer	<= timer + 1'b1;
     state  <= rst_fifo_s; 
   end
end
default:begin
  SPEED_IS_100_1000 <= 1'b0;//默认为1000M
	timer	<= 7'b0;
	state <= idle_s;
end
endcase
end
wire [6:0]rdusedw;
check_fifo check_fifo(
	.aclr(rst_fifo|(~sys_rst_n)),
	.data(1'b1),
	.rdclk(sys_clk),
	.rdreq(1'b0),
	.wrclk(rgmii_rx_clk),
	.wrreq(wrreq),
	.q(),
	.rdempty(),
	.rdusedw(rdusedw),
	.wrfull());
endmodule 