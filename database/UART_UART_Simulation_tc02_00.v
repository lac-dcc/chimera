////////////////////////////////////////
//file name: tc02_00.v
//author: fengzhaomao
//data: 2015-12-5
////////////////////////////////////////

task  tc02_00;

reg  [9:0]         baud;
reg  [2:0]         conf;
reg  [3:0]         delay;
reg  [3:0]         rxtrig;
reg  [3:0]         txtrig;

integer            i;
integer            j;
integer            seed;

seed     = 0;
j        = 0;
// memory initialize
for(i=0;i<1000;i++) begin
    top.tx_data_mem[i] = $dist_uniform(seed,5,255);
end

begin
    baud  = $dist_uniform(seed,13,676);
    conf  = $dist_uniform(seed,0,7);
    delay = $dist_uniform(seed,0,15);
    rxtrig = $dist_uniform(seed,4,14);
    txtrig = $dist_uniform(seed,4,14);
    write_reg(top.uart_baud_addr,{20'hf,2'b0,baud});
    @(posedge top.clk) begin end
    write_reg(top.uart_txtrig_addr,{28'h0,txtrig});
    @(posedge top.clk) begin end
    write_reg(top.uart_rxtrig_addr,{28'h0,rxtrig});
    @(posedge top.clk) begin end
    write_reg(top.uart_conf_addr,{26'h0,3'b111,conf});
    @(posedge top.clk) begin end
    write_reg(top.uart_delay_addr,{28'h0,delay});
    repeat(16) begin
        @(posedge top.clk) begin end
        write_reg(top.uart_tx_addr,top.tx_data_mem[j]);
        j++;
        if(j > 999) begin
            j = 0;
        end
        $display("write %d data",j);
    end
    seed++;
end
endtask
