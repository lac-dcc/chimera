// This program was cloned from: https://github.com/leeja-j/router_tinytapeout
// License: Apache License 2.0



module router_reg_tb();

reg clock,resetn,pkt_valid,fifo_full,detect_add,ld_state,laf_state,full_state,lfd_state,rst_int_reg;
reg [2:0]data_in;
wire err,parity_done,low_packet_valid;
wire [2:0]dout;
integer i;
parameter cycle=10;


router_reg DUT(clock,resetn,pkt_valid,data_in,fifo_full,detect_add,ld_state,laf_state,full_state,lfd_state,rst_int_reg,err,parity_done,low_packet_valid,dout);

initial
begin
  clock=1'b0;
  forever #(cycle/2) clock=~clock;
end

task rst();
  begin
    @(negedge clock)
    resetn=1'b0;
    @(negedge clock)
    resetn=1'b1;
  end
endtask

task initialize();
  begin
   pkt_valid<=1'b0;
   fifo_full<=1'b0;
   detect_add<=1'b0;
   ld_state<=1'b0;
   laf_state<=1'b0;
   full_state<=1'b0;
   lfd_state<=1'b0;
   rst_int_reg<=1'b0;
  end
endtask

task good_pkt_gen_reg;

reg[7:0]payload_data,parity1,header1;
reg[5:0]payload_len;
reg[1:0]addr;

begin
 @(negedge clock)
 payload_len=6'd5;
 addr=2'b10;
 pkt_valid=1;
 detect_add=1;
 header1={payload_len,addr};
 parity1=0^header1;
 data_in=header1;
 @(negedge clock);
 detect_add=0;
 lfd_state=1;
 full_state=0;
 fifo_full=0;
 laf_state=0;
 for(i=0;i<payload_len;i=i+1)
 begin
 @(negedge clock);
  lfd_state=0;
  ld_state=1;
  payload_data={$random}%256;
  data_in=payload_data;
  parity1=parity1^data_in;
 end
 @(negedge clock);
 pkt_valid=0;
 data_in=parity1;
 @(negedge clock);
 ld_state=0;
 end
 endtask


task bad_pkt_gen_reg;

reg[7:0]payload_data,parity1,header1;
reg[5:0]payload_len;
reg[1:0]addr;

begin
 @(negedge clock)
 payload_len=6'd5;
 addr=2'b10;
 pkt_valid=1;
 detect_add=1;
 header1={payload_len,addr};
 parity1=0^header1;
 data_in=header1;
 @(negedge clock);
 detect_add=0;
 lfd_state=1;
 full_state=0;
 fifo_full=0;
 laf_state=0;
 for(i=0;i<payload_len;i=i+1)
 begin
 @(negedge clock);
  lfd_state=0;
  ld_state=1;
  payload_data={$random}%256;
  data_in=payload_data;
  parity1=parity1^data_in;
 end
 @(negedge clock);
 pkt_valid=0;
 data_in=46;
 @(negedge clock);
 ld_state=0;
 end
 endtask
 
 
 initial
 begin
 rst();
 initialize();
 good_pkt_gen_reg;
 rst();
 bad_pkt_gen_reg;
 #20
 
 $finish;
 end

 
 initial
 begin
 $dumpfile("Router_reg.vcd");
 $dumpvars;
 end

 endmodule
