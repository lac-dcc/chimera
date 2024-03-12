////////////////////////////////////////
//file name: tc01_00.v
//author: fengzhaomao
//data: 2015-11-29
////////////////////////////////////////

task  tc01_00;
input  integer    run_num;

reg  [9:0]         baud;
reg  [2:0]         conf;
reg		[15:0]			 rdata;
integer            i;
integer            run_time;
integer            seed;

run_time = 0;
seed     = 0;
// memory initialize
for(i=0;i<1000;i++) begin
    top.tx_data_mem[i] = {$random} % 255;    //$dist_uniform(seed,5,255);
end
repeat(run_num) begin
    baud = $dist_uniform(seed,13,676);
    conf = {$random} % 7;   //$dist_uniform(seed,0,7);
    @(posedge top.clk) begin end
    write_reg(top.uart_baud_addr,{20'hf,2'b0,baud});
    @(posedge top.clk) begin end
    write_reg(top.uart_txtrig_addr,32'ha);
    @(posedge top.clk) begin end
    write_reg(top.uart_rxtrig_addr,32'ha);
    @(posedge top.clk) begin end
    write_reg(top.uart_conf_addr,{26'h0,3'b111,conf});
    
      uart_tx_model(10);
    
    $display("------run -------%d ",run_time);
    run_time++;
    seed++;
end
$stop;
endtask