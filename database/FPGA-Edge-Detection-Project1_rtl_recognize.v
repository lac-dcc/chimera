module recognize(
	// input signal
	input clk,
	input rst,
	
	// input data 
	input en,
	input VS,
	input [19:0] iDATA_length,
	input [19:0] iDATA_area,
	input [19:0] fingertip_data,
    output  [19:0] mydata,
    output   my_en,
	// output data
	output reg [7:0] result
	
);

reg [1:0] state;
reg [22:0] cnt;	// 延时计数
assign mydata=fingertip_data;
assign my_en=en;
// 根据周长和面积的计数判断状态
/*parameter  MAX_NUM = 23'd5000_000;      // 计数器计数的最大值

//reg define
reg    [22:0]   cnt ;                   // 计数器，用于计时100ms
reg             flag;                   // 标志信号

always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        cnt <= 23'b0;
        flag<= 1'b0;
    end
    else if (cnt < MAX_NUM - 1'b1) begin
        cnt <= cnt + 1'b1;
        flag<= 1'b0;
    end
    else begin
        cnt <= 23'b0;
        flag <= 1'b1;
    end
end */
always @ (posedge clk or negedge rst)
begin 
	if(!rst)
		begin 
			result <= 8'h00;
		end
    else if(my_en)
    begin
        if(mydata > 20'd300 )
            begin
                result <= 8'h01;			// 全掌->前进		
            end
        else if((mydata  > 20'd220)&& (mydata < 20'd280))
            begin
                result <= 8'h02;			// 拳头->后退
            end
        else if((mydata < 20'd200))
			begin
				result <= 8'h03;			// 一指->左转
			end 
        else
                result <= 8'h00;
    end

end       
/*always @ (posedge clk or negedge rst)
begin 
	if(!rst)
		begin 
			result <= 8'b0;
			cnt <= 23'd0;
		end
		
	else
		begin
			if(!en)
				begin
					result <= 8'b0;
					cnt <= 23'd0;
				end
				
			else
				begin
					case(state)
						2'b00:
							begin
							if(fingertip_data < 20'd200 )
									begin
										if(cnt == 23'd5)
											begin
												result <= 8'd1;			// 全掌->前进

												cnt <= 23'd0;
											end
											
										else cnt <= cnt + 23'd1;
									end
									
								else
									begin
										cnt <= 23'd0;
										state <= 2'b01;
									end 
							end
							
						2'b01:
							begin
								if(fingertip_data > 20'd210 && fingertip_data < 20'd300)
									begin
										if(cnt == 23'd5)
											begin
												result <= 8'd2;			// 拳头->后退
												cnt <= 23'd0;
											end
										
										else cnt <= cnt + 23'd1;
									end
									
								else
									begin
										state <= 2'b10;
										cnt <= 23'd0;
									end
							end
							
						2'b10:
							begin
								if(fingertip_data > 20'd310)
									begin
										if(cnt == 23'd5)
											begin
												result <= 8'd3;	// 一指->左转
												cnt <= 23'd0;
											end
										
										else cnt <= cnt + 23'd1;
									end
									
								else
									begin
										cnt <= 23'd0;
										state <= 2'b00;
									end
							end
							
					
													
						default:
							begin
								state <= 2'b00;
								result <= 8'b0;
								cnt <= 23'd0;
							end
					
					endcase
				end
		end

end*/


endmodule
