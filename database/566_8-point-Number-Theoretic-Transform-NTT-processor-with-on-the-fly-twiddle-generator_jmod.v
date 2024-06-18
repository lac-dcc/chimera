// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


module jmod(j,t,clock,jmod_out,start);
  
  parameter n =4 ;
     
  input [n:0] j;
  input [n:0] t;
  input clock;
  input start;
  output [n:0] jmod_out;
  
   
  wire load1,load2,sel1,sel2,msb;
    
  jmod_controller CON(clock,sel1,sel2,load1,load2,msb,start);
  jmod_datapath DATA(j,t,clock,load1,load2,sel1,sel2,msb,jmod_out);
                
endmodule

module jmod_datapath(j,t,clock,load1,load2,sel1,sel2,msb_out,jmod_out);
  
  parameter n = 4;
  
  input [n:0] j;  //range 0 to 4 for 8 point NTT
  input [n:0] t;  //max value of 4 for 8 point NTT
  input clock;
  input load1;
  input load2;
  input sel1;
  input sel2;
  output [n:0] jmod_out;                      
  output msb_out;
    
  wire [n:0] w1,w2,w3,w4,w5;
  
  assign msb_out = w3[n];
   
  mux_2to1_4bit MUX4(j,w3,sel1,w1);
  SUB_4BIT SUB4(w1,t,w2);
  PIPO REG1(w2,clock,load1,w3);
  //demux_1to2_4bit deMUX4(w3,sel2,w4,w5);
  ADDER_4BIT ADD4(w4,t,w5);
  PIPO REG2(w3,clock,load1,w4);
  PIPO REG3(w5,clock,load2,jmod_out);
  
endmodule

module jmod_controller(clock,sel1,sel2,load1,load2,msb_in,start);

    input clock;
    input start;
    input msb_in;
    output reg sel1;
    output reg sel2;
    output reg load1;
    output reg load2;
  
    reg [1:0] state;
  
      initial 
      begin
      	state <= 2'b00;
      end
  
  always @(posedge clock)
    begin
      
      case(state)
        
        2'b00 : begin
          		sel1  <= 0;
          		sel2  <= 1;
                load1 <= 1;
                load2 <= 0;
                if(start)
          		state <= 2'b01;
          		else
          		state <= 2'b00;
                end

	    2'b01 : begin
	            
			    if(msb_in == 1)
			        begin
			        load1 <= 0;
			        load2 <= 1;
                    state <= 2'b10;   //last state
			        end
			    else
			        begin
			        load1 <= 1;
			        load2 <= 0;
                    sel1 <= 1;
                    state <= 2'b01;
			        end  
		        end
		        
        2'b10: begin     
               load2 <= 0 ; 
               state <= 2'b00;
               end
                  
      endcase
      
    end

endmodule

module mux_2to1_4bit(a,b,sel,data_out);


input [4:0] a;
input [4:0] b;
input sel;

output [4:0] data_out;

assign data_out = sel ? b:a;

endmodule

module SUB_4BIT(a,b,sub);

input [4:0] a;
input [4:0] b;

output [4:0] sub;


assign sub = a-b;

endmodule

module PIPO(a,clock,load,reg_out);

input [4:0] a;
input clock;
input load;
output reg [4:0] reg_out;

always @(posedge clock)
begin
    if(load)
    reg_out <= a;
end
endmodule

module ADDER_4BIT(a,b,sum);

input [4:0] a;
input [4:0] b;

output [4:0] sum;


assign sum = a+b;

endmodule
