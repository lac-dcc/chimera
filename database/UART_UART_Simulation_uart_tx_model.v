////////////////////////////////////////
//file name: uart_tx_model.v
//author: fengzhaomao
//data: 2015-11-27
////////////////////////////////////////

task    uart_tx_model;
input  integer    tx_num;
reg                parity;
integer            bit_cnt;
integer            delay;
integer            tx_time;
begin
    bit_cnt = 0;
    tx_time = 0;
    repeat(tx_num) begin
        if(top.tx_cnt > 999) begin
            top.tx_cnt        <= 0;
        end
        @(posedge top.baud_tclk) begin
            top.tx_data       <= 1'b0;                         // start bit
        end
        parity                <= ^top.tx_data_mem[top.tx_cnt];
        repeat(8) begin
            @(posedge top.baud_tclk) begin
                top.tx_data   <= top.tx_data_mem[top.tx_cnt][bit_cnt];//data bit
                bit_cnt++;
            end
        end
        if(top.uart_conf[0]) begin
            if(top.uart_conf[1]) begin
                @(posedge top.baud_tclk) begin
            	      top.tx_data <= !parity;                    // eve check bit
            	  end
            end
            else begin
                @(posedge top.baud_tclk) begin
                    top.tx_data <= parity;                     // odd check bit
                end
            end
        end
        if(top.uart_conf[3]) begin                            // st_check
            @(posedge top.baud_tclk) begin
                top.tx_data     <= 1'b1;                       // stop bit 
            end
        end
        top.tx_cnt++;
        bit_cnt                  = 0;
        delay                    = $dist_uniform(2,2,100);
        repeat(delay) begin
            @(posedge top.baud_tclk) begin 
                top.tx_data     <= 1'b1;
            end
        end
        //$display("send %d data",tx_time);
        tx_time++;
    end
end

endtask