// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//Reg_access每隔0.1s，完整读一次四个电口是否link，并把link状态给port_link输出。其中，clk为12.5MHZ。
//功能描述：Reg_access模块把reg_enb置为高，reg_op[1:0] 置为10，phy_addr[4:0]
//置为00000，reg_addr[4:0] 置为00001，
//说明为从phy里面读1号寄存器里面的0号端口的link状态信息，并把信息给Port_link[3:0]。读完之后reg_enb置为低。
module reg_access (
		input clk,
		input reset,
		input work_bit,
		//给出的操作指令
		output reg req_enb,
		output reg [1:0] req_op,
		output reg [4:0]phy_addr,
		output reg [4:0]reg_addr,
		output reg [3:0]port_link,
		input  [15:0]data_sta,
		input  sta_enb
);
reg [31:0]cnt;
reg [4:0]state;
reg timer;
parameter	  	idle      =4'd0,
					read_port0=4'h1,
					send_data0=4'h2,
					read_port1=4'd3,
					key_data1 =4'd4,
					send_data1=4'd5,
					read_port2=4'd6,
					key_data2 =4'd7,
					send_data2=4'd8,
					read_port3=4'd9,
					key_data3 =4'hA,
					send_data3=4'hB;
					//
always@(posedge clk,negedge reset)begin//生成计数信息
   if(!reset)begin
					cnt<=32'b0;
					timer<=1'b0;
					end
	else if(cnt<32'd1250000)begin	
				cnt<=cnt+1'b1;
				timer<=1'b0;
		  end
	else begin
			cnt<=32'b0;
			timer<=1'b1;
		  end
 end 

always@(posedge clk,negedge reset)begin
	if(!reset)begin
					req_enb<=1'b0;
					req_op<=2'b10;
					phy_addr<=5'b0;
					port_link<=4'b0;
					state<=idle;
					end
	else begin//每0.1s完整读一次四个电口link信息
			case(state) 
				 idle:  if(timer==1'b1&&work_bit==1'b0)begin//计数0.1s
							state<=read_port0;
							end
							else begin
							state<=idle;//判断是否处于空闲状态，不是继续等待
							end
							//					
		   read_port0: begin//读0号端口的link信息
							req_enb<=1'b1;//
							req_op<=2'b10;//读操作
							phy_addr<=5'd0;//0号端口地址
							reg_addr<=5'd1;//读phy芯片里面的一号寄存器
							if(work_bit==1'b1)begin//判断是否处于空闲状态
								req_enb<=1'b0;
								state<=send_data0;
							end
							else begin
							state<=read_port0;
							end
						end
							//								
		   send_data0:   begin//写link信息,给输出端口
							   if(sta_enb==1'b1)begin//读数据
								port_link[0]<=data_sta[2];
								req_enb<=1'b0;
								state<=read_port1;
								end
								else begin
								state<=send_data0;
								end								
							end
							//						
		   read_port1: 	if(work_bit==1'b0)begin//读1号端口的link信息
								req_enb<=1'b1;
								req_op<=2'b10;
								phy_addr<=5'd1;
								reg_addr<=5'd1;//读phy芯片里面的一号寄存器
								state<=key_data1;
								end
						      else begin
								state<=read_port1;
							   end
							//
			key_data1:	   if(work_bit==1'b1)begin//判断是否处于空闲状态
								req_enb<=1'b0;
								state<=send_data1;
								end
						      else begin
							   state<=key_data1;
						      end	
                           //						
		   send_data1:    begin//写link信息,给输出端口
								if(sta_enb==1'b1)begin//读数据									
									port_link[1]<=data_sta[2];
									req_enb<=1'b0;
									state<=read_port2;
									end
								else begin
									state<=send_data1;
									end
								end
							//
	       read_port2:		if(work_bit==1'b0)begin//读2号端口的link信息
							       req_enb<=1'b1;
							       req_op<=2'b10;
						          phy_addr<=5'd2;
							       reg_addr<=5'd1;//读phy芯片里面的一号寄存器
							       state<=key_data2;
							       end
							       else begin
							       state<=read_port2;
							       end	
							//
			key_data2:	   if(work_bit==1'b1)begin//判断是否处于空闲状态
								req_enb<=1'b0;
								state<=send_data2;
								end
						      else begin
							   state<=key_data2;
						      end	
                           //				
		   send_data2:    begin//写link信息,给输出端口
								   if(sta_enb==1'b1)begin//读数据									
									port_link[2]<=data_sta[2];
									req_enb<=1'b0;
									state<=read_port3;
									end
									else begin
									state<=send_data2;
									end
						      end
		            	//					
		   read_port3:	    begin
							    if(work_bit==1'b0)begin//读3号端口的link信息
							    req_enb<=1'b1;
							    req_op<=2'b10;
						       phy_addr<=5'd3;
							    reg_addr<=5'd1;//读phy芯片里面的一号寄存器
							    state<=key_data3;
							    end
							    else begin
							    state<=read_port3;
							    end
						       end
							//
		    key_data3:	    if(work_bit==1'b1)begin//判断是否处于空闲状态
								  req_enb<=1'b0;
								  state<=send_data3;
						       end
						       else begin
							    state<=key_data3;
						       end	
                           //				
		   send_data3:	    if(sta_enb==1'b1)begin//读数据									
							  	 port_link[3]<=data_sta[2];
							    req_enb<=1'b0;
								 state<=idle;
						       end
						       else begin
								 state<=send_data3;
						       end					 
			default:		    state<=idle;		
			endcase
		end
		end
endmodule
					