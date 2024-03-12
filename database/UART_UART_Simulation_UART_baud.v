////////////////////////////////////////
//file name: UART_baud.v
//author: fengzhaomao
//data: 2015-11-27
////////////////////////////////////////

task    UART_baud;

reg  [9:0]      divde_1;
reg  [3:0]      divde_2;
reg  [13:0]     baud_value;
reg  [13:0]     baud_cnt1;
reg  [13:0]     baud_cnt2;

baud_cnt1 = 14'h0;
baud_cnt2 = 14'h0;
baud_value = 14'h0;
divde_1   = 10'h0;
divde_2   = 4'h0;

fork
forever begin
    @(posedge top.clk) begin 	
    	
		    if(top.psel && top.penable && top.pwrite) begin
		    	
		        case(top.paddr)
		        4'h0: begin
		            top.uart_tx          <= top.pwdata;
		        end
		        4'h1: begin
		            top.uart_rx          <= top.pwdata;
		        end
		        4'h2: begin
		            divde_1              <= top.pwdata[9:0];
		            divde_2              <= top.pwdata[15:12];
		            top.uart_baud        <= top.pwdata;
		       
		        end
		        4'h3: begin
		            top.uart_conf        <= top.pwdata;
		        end
		        4'h4: begin
		            top.uart_rxtrig      <= top.pwdata;
		        end
		        4'h5: begin
		            top.uart_txtrig      <= top.pwdata;
		        end
		        4'h6: begin
		            top.uart_delay       <= top.pwdata;
		        end
		        4'h7: begin
		            top.uart_status      <= top.uart_status&(!top.pwdata);
		        end
		        4'h8: begin
		            top.uart_rxfifo_stat <= top.pwdata;
		        end
		        4'h9: begin
		            top.uart_txfifo_stat <= top.pwdata;
		        end
		        endcase
		    end
	 end
end    
  
forever   begin
    // produce send data baud clk
    @(posedge top.clk26m) begin
        baud_value               <= (divde_1 + 1'b1)*(divde_2 + 1'b1);
        baud_cnt1                 <= baud_cnt1 + 1'b1;
        if(baud_cnt1 < (baud_value/2)) begin
            top.baud_tclk        <= 1'b1;
        end
        else begin
            if(baud_cnt1 > (baud_value - 1'b1)) begin
                baud_cnt1         <= 14'h0;
            end
            top.baud_tclk        <= 1'b0;
        end
    end
end
 
  
 forever   begin
    @(posedge top.clk26m) begin
      	if(top.start) begin
            baud_value               <= (divde_1 + 1'b1)*(divde_2 + 1'b1);
            baud_cnt2                 <= baud_cnt2 + 1'b1;
            if(baud_cnt2 == (baud_value/2)) begin
                top.baud_rclk        <= 1'b1;
            end
            else begin
                if(baud_cnt2 > (baud_value - 1'b1)) begin
                    baud_cnt2         <= 14'h0;
                end
                top.baud_rclk        <= 1'b0;
            end
        end
        else begin
            baud_cnt2         <= 14'h0;
            top.baud_rclk        <= 1'b0;
        end
    end
end 

join

endtask
