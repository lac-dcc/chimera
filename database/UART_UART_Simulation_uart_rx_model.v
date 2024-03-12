////////////////////////////////////////
//file name: uart_rx_model.v
//author: fengzhaomao
//data: 2015-12-4
////////////////////////////////////////

task  uart_rx_model;
	
integer      cnt;
integer      bit_cnt;
integer      parity;

cnt     = 0;
bit_cnt = 0;
parity  = 0;
forever begin
    @(negedge top.rx_data) begin end
    top.start   <= 1'b1;
    top.rx_done <= 1'b0;
    // check start bit
    @(posedge top.baud_rclk) begin
        if(top.rx_data == 1'b0) begin
            $display("start bit is right");
        end
        else begin
            $display("start bit is wrong!");
            $finish;
        end
    end
    // receive data
    repeat(8) begin
        @(posedge top.baud_rclk) begin
            top.rx_data_mem[cnt][bit_cnt] <= top.rx_data;
            parity    <= parity ^ top.rx_data;
            bit_cnt++;
        end
    end
    // check parity bit
    if(top.uart_conf[0]) begin   // check bit control bit
        @(posedge top.baud_rclk) begin
            if(top.uart_conf[1]) begin    // eve check bit
                if(parity == !top.rx_data) begin
                    $display("the UART_TX parity bit is right(eve)");
                end
                else begin
                    $display("the UART_TX parity bit is wrong(eve)!");
                end
            end
            else begin    // odd check bit
                if(parity == top.rx_data) begin
                    $display("the UART_TX parity bit is right(odd)");
                end
                else begin
                    $display("the UART_TX parity bit is wrong(odd)!");
                end
            end
        end
    end
    // check stop bit
    if(top.uart_conf[2]) begin
        @(posedge top.baud_rclk) begin
            if(top.rx_data == 1'b1) begin
                $display("the UART_TX stop bit is right");
            end
            else begin
                $display("the UART_TX stop bit is wrong!");
            end
        end
    end
    // check delay
   /* repeat(top.uart_delay[3:0]) begin
        @(posedge top.baud_rclk) begin
            if(top.rx_data == 1'b1) begin
                $display("the delay between twice send data is right");
            end
            else begin
                $display("the delay between twice send data is wrong!");
            end
        end
    end*/
    cnt++;
    bit_cnt     = 1'b0;
    top.start   = 1'b0;
    top.rx_done = 1'b1;
end

endtask