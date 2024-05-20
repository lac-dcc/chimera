// This program was cloned from: https://github.com/miguelsape/msalazar
// License: Apache License 2.0

module stepper(clk,rst,dir,enable,salida);
	
	input clk,rst,dir,enable; 
	output reg [3:0]salida;	

	localparam S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4; 
	reg[2:0]state, state_next;	

	always@(posedge clk or posedge rst) 			//Logica del estado siguiente
		
		begin
			if(rst) state = S1;
			else state = state_next;
		end	
		
	always@(state,dir,enable,state_next,rst)	   // Maquina de estados
		
		begin
			case (state)
				
				S1:      if(dir && enable) state_next = S2;
					else if(!dir && enable) state_next = S4;
					else if(!enable) state_next = S1;
					
				S2:	      if(dir && enable) state_next = S3;
					 else if(!dir && enable) state_next = S1;
					 else if(!enable) state_next = S2;
								
				S3: 	   if(dir && enable) state_next = S4;
					  else if(!dir && enable) state_next = S2;
					  else if(!enable) state_next = S3;								
														
				S4: 	   if(dir && enable) state_next = S1;
					  else if(!dir && enable) state_next = S3;
					  else if(!enable) state_next = S4;					
			  endcase
		end
				
	always@(posedge clk) 		//Salida tipo Moore
	
		begin
			case (state) 
				S1: salida = 4'b0001;
				S2: salida = 4'b0010;
				S3: salida = 4'b0100;
				S4: salida = 4'b1000;
			endcase
		end
		
endmodule