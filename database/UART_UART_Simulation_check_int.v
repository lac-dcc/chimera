////////////////////////////////////////
//file name: check_int.v
//author: fengzhaomao
//data: 2015-11-29
////////////////////////////////////////

task  check_int;
integer       i;
integer       j;
integer       k;

i = 0;
j = 16;
k = 0;
fork
forever begin
    // when more than two interrupt is active,if use posedge uart_int,
    // this module will work once,so use wait
    wait(top.uart_int);
    @(posedge top.clk) begin end
    read_reg(top.uart_status_addr,top.uart_status);
    if(top.uart_status[0]) begin        // tx_int
        @(posedge top.clk) begin end
        read_reg(top.uart_txfifo_stat_addr,top.uart_txfifo_stat);
        if(top.uart_txfifo_stat[3:0]==top.uart_txtrig[3:0]) begin
            $display("tx_int is right^-^");
            repeat(5'd16 - top.uart_txtrig[3:0]) begin
                @(posedge top.clk) begin end
                write_reg(top.uart_tx_addr,{24'h0,top.tx_data_mem[j]});
                j++;
                if(j > 999) begin
                    j = 0;
                end
            end
        end
        else begin
            $display("tx_int is wrong,txfifo_stat¡Ùtxtrig!!!");
             $finish;
        end
    end
    if(top.uart_status[1]) begin         // rx_int
        @(posedge top.clk) begin end
        read_reg(top.uart_rxfifo_stat_addr,top.uart_rxfifo_stat);
        if(top.uart_rxfifo_stat[3:0]==(top.uart_rxtrig[3:0]-1'b1)) begin
            $display("rx_int is right^-^");
            // read all data,and check data
            repeat(top.uart_rxtrig[3:0]) begin
                @(posedge top.clk) begin end
                read_reg(top.uart_rx_addr,top.uart_rx);
                if(top.uart_rx[7:0]==top.tx_data_mem[i]) begin
                    $display("the %d data is right^_^",i);
                    $display("compared %d memory",i);
                end
                else begin
                    $display("the %d data is wrong!!!",i);
                    $finish;
                end
                i++;
                if(i>999) begin
                    i = 0;
                end
            end
        end
        else begin
            $display("tx_int is wrong,rxfifo_stat¡Ùrxtrig!!!");
            $finish;
        end
    end
    if(top.uart_status[2]) begin
        $display("parity check error!");
        //$finish;
    end
    else begin
        $display("parity check is right~~~");
    end
    if(top.uart_status[3]) begin
        $display("stop bit check error!");
        //$finish;
    end
    else begin
        $display("stop bit check righ~~~");
    end
    write_reg(top.uart_status_addr,top.uart_status);
    $display("clean uart_status..");
end

forever begin
    @(posedge top.rx_done) begin end
    if(top.tx_data_mem[k] == top.rx_data_mem[k]) begin
        $display("received %d data is right",k);
    end
    else begin
        $display("received %d data is wrong!",k);
        $finish;
    end
    k++;
    if(k > 999) begin
        k = 0;
    end
end

join
endtask