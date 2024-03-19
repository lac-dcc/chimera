module Timer #(
parameter Width = 32,

parameter GEN1_PIPEWIDTH = 8 ,	
parameter GEN2_PIPEWIDTH = 8 ,	
parameter GEN3_PIPEWIDTH = 8 ,	
parameter GEN4_PIPEWIDTH = 8 ,	
parameter GEN5_PIPEWIDTH = 8 	

)
(
input [2:0]Gen,
input Reset,
input Pclk,
input Enable,
input Start,
input [2:0]TimerIntervalCode, //001 -> 12ms
output TimeOut
);
reg [Width-1:0] Tick;
reg [Width-1:0] TimerIntervalBase;
reg [Width-1:0] TimerInterval;
parameter Gen1 = 3'b001,Gen2 = 3'b010,Gen3 = 3'b011,Gen4 = 3'b100,Gen5 = 3'b101;
parameter t12ms= 3'b001,t24ms = 3'b010,t48ms = 3'b011,t2ms = 3'b100,t8ms = 3'b101,t0ms = 3'b000;
always @ *
begin
	case({TimerIntervalCode})
		t12ms:begin  
			TimerIntervalBase= 32'h000B71B0 ;//750000 cycle => Gen1 32bit width , 12ms 
		end
		
		t24ms:begin  
			TimerIntervalBase= 32'h16E360 ;//1500000 cycle => Gen1 32bit width , 24ms 
		end

		t48ms:begin  
			TimerIntervalBase= 32'h2DC6C0 ;//3000000cycle => Gen1 48bit width , 48ms 
		end
		t8ms:begin  
			TimerIntervalBase= 32'h7A120 ;//500000cycle => Gen1 48bit width , 48ms 
		end

		t2ms:begin  
			TimerIntervalBase= 32'h1E848 ;//125000 cycle => Gen1 32bit width , 2ms 
		end	
		t0ms:begin  
			TimerIntervalBase= 32'h00000000;//0cycle => Gen1 32bit width , 0ms 
		end
	endcase
end

//for higher Generation multiply the base value by 2 (shift left)
always @ *
begin
	case(Gen)
		Gen1:begin //Gen1  
			 case(GEN1_PIPEWIDTH)
			 32:TimerInterval=TimerIntervalBase<<0<<0 ; //multiply base by 1 (Gen1 32 bit)
			 16:TimerInterval=TimerIntervalBase<<0<<1 ; //multiply base by 2 (Gen1 16 bit)
			 8 :TimerInterval=TimerIntervalBase<<0<<2 ; //multiply base by 4 (Gen1 8 bit)
			 endcase
		end
		Gen2:begin //Gen2  
			 case(GEN2_PIPEWIDTH)
			 32:TimerInterval=TimerIntervalBase<<1<<0 ; //multiply base by 2 for Gen2 (Gen2 32 bit)
			 16:TimerInterval=TimerIntervalBase<<1<<1 ; //multiply base by 2 for Gen2 and another 2 for 16 bit width (Gen2 16 bit)
			 8 :TimerInterval=TimerIntervalBase<<1<<2 ; ///multiply base by 2 for Gen2 and another 4 for 16 bit width (Gen2 32 bit)
			 endcase
		end
		Gen3:begin //Gen3  
			 case(GEN3_PIPEWIDTH)
			 32:TimerInterval=TimerIntervalBase<<2<<0 ; //multiply base by 4 for Gen2 (Gen3 32 bit)
			 16:TimerInterval=TimerIntervalBase<<2<<1 ; //multiply base by 4 for Gen2 and another 2 for 16 bit width (Gen3 16 bit)
			 8 :TimerInterval=TimerIntervalBase<<2<<2 ; //multiply base by 4 for Gen2 and another 4 for 16 bit width (Gen3 32 bit)
			 endcase
		end
		Gen4:begin //Gen3  
			 case(GEN4_PIPEWIDTH)
			 32:TimerInterval=TimerIntervalBase<<3<<0 ; //multiply base by 4 for Gen2 (Gen3 32 bit)
			 16:TimerInterval=TimerIntervalBase<<3<<1 ; //multiply base by 4 for Gen2 and another 2 for 16 bit width (Gen3 16 bit)
			 8 :TimerInterval=TimerIntervalBase<<3<<2 ; //multiply base by 4 for Gen2 and another 4 for 16 bit width (Gen3 32 bit)
			 endcase
		end
		Gen5:begin //Gen3  
			 case(GEN5_PIPEWIDTH)
			 32:TimerInterval=TimerIntervalBase<<5<<0 ; //multiply base by 4 for Gen2 (Gen3 32 bit)
			 16:TimerInterval=TimerIntervalBase<<5<<1 ; //multiply base by 4 for Gen2 and another 2 for 16 bit width (Gen3 16 bit)
			 8 :TimerInterval=TimerIntervalBase<<5<<2 ; //multiply base by 4 for Gen2 and another 4 for 16 bit width (Gen3 32 bit)
			 endcase
		end
	endcase
end
assign TimeOut = (Start)? 0:(Tick >= TimerInterval)? 1:0 ;
always @(posedge Pclk)
begin
if (!Reset||Start) begin
Tick <= 0;
end
else if (Enable)begin
Tick <=Tick +1;
end
end
endmodule