`timescale 10ns/1ns
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    usb_test 
// Description: If the FIFO of EP2 is not empty and 
//              the EP6 is not full, Read the 16bit data from EP2 FIFO
//              and send to EP6 FIFO.  
//////////////////////////////////////////////////////////////////////////////////
module usb_test(
    input fpga_gclk,                       //FPGA Clock Input 50Mhz
    input reset_n,                         //FPGA Reset input
    output reg [1:0] usb_fifoaddr,         //CY68013 FIFO Address
    output reg usb_slcs,                   //CY68013 Chipset select
    output reg usb_sloe,                   //CY68013 Data output enable
    output reg usb_slrd,                   //CY68013 READ indication
    output reg usb_slwr,                   //CY68013 Write indication
    inout [15:0] usb_fd,                   //CY68013 Data
    input usb_flaga,                       //CY68013 EP2 FIFO empty indication; 1:not empty; 0: empty
    input usb_flagb,                       //CY68013 EP4 FIFO empty indication; 1:not empty; 0: empty
    input usb_flagc                        //CY68013 EP6 FIFO full indication; 1:not full; 0: full
	 
    );

reg[15:0] data_reg;

reg bus_busy;                              
reg access_req;                            
reg usb_fd_en;            //控制USB Data的方向

reg [4:0] usb_state; 
reg [4:0] i; 

parameter IDLE=5'd0; 
parameter EP2_RD_CMD=5'd1; 
parameter EP2_RD_DATA=5'd2; 
parameter EP2_RD_OVER=5'd3; 
parameter EP6_WR_CMD=5'd4; 
parameter EP6_WR_OVER=5'd5; 
            

/* Generate USB read/write access request*/
always @(negedge fpga_gclk or negedge reset_n)
begin
   if (~reset_n ) begin
      access_req<=1'b0;
	end
   else begin
      if (usb_flaga & usb_flagc & (bus_busy==1'b0))     //如果EP2的FIFO不空，EP6的FIFO不满，而且状态为idle
          access_req<=1'b1;                             //USB读写请求
      else 
          access_req<=1'b0;
   end
end

  
/* Generate USB read and write command*/
always @(posedge fpga_gclk or negedge reset_n)
  begin
   if (~reset_n) begin
		 usb_fifoaddr<=2'b00;
       usb_slcs<=1'b0;		
		 usb_sloe<=1'b1;		
       usb_slrd<=1'b1;	
		 usb_slwr<=1'b1;
       usb_fd_en<=1'b0;	
	    usb_state<=IDLE;		 
   end		
   else begin
	     case(usb_state)
        IDLE:begin
			        usb_fifoaddr<=2'b00;	
                 i<=0;
					  usb_fd_en<=1'b0;					  
		           if (access_req==1'b1) begin                                   
						  usb_state<=EP2_RD_CMD;                //开始读USB EP2 FIFO的数据
						  bus_busy<=1'b1;                       //状态变忙
			        end				
                 else begin
				       bus_busy<=1'b0;		  
						 usb_state<=IDLE;  
					  end	 
        end
        EP2_RD_CMD:begin                               //发送EP2端口FIFO的数据读命令，先拉低OE信号，再拉低RD信号                        
			     if(i==2) begin
                	usb_slrd<=1'b1;
                	usb_sloe<=1'b0;	                   //OE信号变低					
                  i<=i+1'b1;
              end
              else if(i==8) begin
                	usb_slrd<=1'b0;                      //RD信号变低			
                	usb_sloe<=1'b0;						
                  i<=0;	
						usb_state<=EP2_RD_DATA;  
              end
              else begin
				      i<=i+1'b1;
				  end
        end		  
		  EP2_RD_DATA:begin                              //读取EP2中的数据
              if(i==8) begin
                	usb_slrd<=1'b1;                      //RD信号变高,读取数据			
                	usb_sloe<=1'b0;						
                  i<=0;	
						usb_state<=EP2_RD_OVER;
			         data_reg<=usb_fd;	                   //读取数据
              end
              else begin
                	usb_slrd<=1'b0;                      		
                	usb_sloe<=1'b0;					  
				      i<=i+1'b1;
				  end
		 end		  
		 EP2_RD_OVER:begin
              if(i==4) begin
                	usb_slrd<=1'b1;                      //OE信号变高,读取数据完成			
                	usb_sloe<=1'b1;						
                  i<=0;	
			         usb_fifoaddr<=2'b10;							
						usb_state<=EP6_WR_CMD;
              end
              else begin
                	usb_slrd<=1'b1;                      		
                	usb_sloe<=1'b0;					  
				      i<=i+1'b1;
				  end
		 end	
		 EP6_WR_CMD:begin		                            //EP6端口写入数据，slwr变低后，再变高
              if(i==8) begin
                  usb_slwr<=1'b1;
                  i<=0;							
						usb_state<=EP6_WR_OVER;
              end
              else begin
                  usb_slwr<=1'b0;	
						usb_fd_en<=1'b1;                     //数据总线改为输出						
				      i<=i+1'b1;
				  end
		 end		  
		 EP6_WR_OVER:begin		                         //EP6写完成                    
              if(i==4) begin
                  usb_fd_en<=1'b0;
				      bus_busy<=1'b0;
                  i<=0;							
						usb_state<=IDLE;
              end
              else begin		  
				      i<=i+1'b1;
				  end
		 end
       default:usb_state<=IDLE;
       endcase
	 end
  end  
  
assign usb_fd = usb_fd_en?data_reg:16'bz;       //USB数据总线输入输出改变

endmodule
