// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0



//module TW_gen(j,i,N,start,clock,tw_ack,TW_out);
module TW_gen(j,i,N,start,clock,tw_ack1,TW_out);

input [4:0] j;
input [4:0] i;
input [4:0] N;
input clock;
input start;
output [24:0] TW_out;
//define a new tw ack1
output tw_ack1 ;
wire tw_ack;
//output tw_ack;
assign tw_ack1 =  |TW_out & tw_ack;

wire [15:0] Ggen_out;
//reg [25:0] expand;
wire [25:0] expand;

SELtoG_generator SEL2(j,i,N,start,clock,Ggen_out);

//always @(Ggen_out)
//begin
//    expand = {9'b0,Ggen_out};
//end

assign expand = {9'b0,Ggen_out};

modQ_tw MOD1(expand,clock,tw_ack,TW_out);

endmodule

module SELtoG_generator(j,i,N,start,clock,Ggen_out);

parameter n = 4;
parameter reg_size = 16;

input [n:0] j;
input [n:0] i;
input [n:0] N;
input start;
input clock;
output [reg_size-1:0] Ggen_out;

wire [n:0] sel;
wire ack;

selector_TWgen SEL1(j,i,N,clock,start,sel,ack);
G_generator GGEN1(clock,sel,ack,Ggen_out);

endmodule

module selector_TWgen(j,i,N,clock,start,sel_out,ack);

parameter n = 4;

input [n:0] j;
input [n:0] i;
input [n:0] N;
input clock;
input start;
output [n:0] sel_out;
output ack;

//ack is set to 1 once output(sel_out) is loaded

wire [n:0] w1,w2;

assign w1 = j<<i;
assign w2 = N>>i;

mod_redc REDC(w1,w2,clock,sel_out,ack,start);

endmodule


module mod_redc(j,t,clock,jmod_out,ack,start);

parameter n =4 ;
     
  input [n:0] j;
  input [n:0] t;
  input clock;
  input start;
  output ack;
  output [n:0] jmod_out;
  
  wire load1,load2,sel1,sel2,msb;
    
  jmod_controller1 CON(clock,sel1,sel2,load1,load2,msb,start,ack);
  jmod_datapath1 DATA(j,t,clock,load1,load2,sel1,sel2,msb,jmod_out);

endmodule

module jmod_datapath1(j,t,clock,load1,load2,sel1,sel2,msb_out,jmod_out);
  
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
  assign w1_out = w1;
  assign w2_out = w2;
  assign w3_out = w3;
  assign w4_out = w4;
  
  mux_2to1_4bit2 MUX4(j,w3,sel1,w1);
  SUB_4BIT2 SUB4(w1,t,w2);
  PIPO2 REG1(w2,clock,load1,w3);
  //demux_1to2_4bit deMUX4(w3,sel2,w4,w5);
  ADDER_4BIT2 ADD4(w4,t,w5);
  PIPO2 REG2(w3,clock,load1,w4);
  PIPO2 REG3(w5,clock,load2,jmod_out);
  
endmodule


module mux_2to1_4bit2(a,b,sel,data_out);

parameter n = 4;
input [n:0] a;
input [n:0] b;
input sel;

output [n:0] data_out;

assign data_out = sel ? b:a;

endmodule

module SUB_4BIT2(a,b,sub);
parameter n = 4;
input [n:0] a;
input [n:0] b;

output [n:0] sub;


assign sub = a-b;

endmodule

module PIPO2(a,clock,load,reg_out);
parameter n = 4;
input [n:0] a;
input clock;
input load;
output reg [n:0] reg_out;

always @(posedge clock)
begin
    if(load)
    reg_out <= a;
end
endmodule

module ADDER_4BIT2(a,b,sum);
parameter n = 4;
input [n:0] a;
input [n:0] b;

output [n:0] sum;


assign sum = a+b;

endmodule

module jmod_controller1(clock,sel1,sel2,load1,load2,msb_in,start,ack);

    input clock;
    input start;
    input msb_in;
    output reg ack; //set ack to 1 once select is loaded to the output
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
                ack <= 0;
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
               ack <= 1; 
               state <= 2'b00;
               end
                  
      endcase
      
    end

endmodule



module G_generator(clock,select,ack_sig,gen_out);

parameter reg_size = 16; 

input clock;
//input [5:0] select;
input [4:0] select;
input ack_sig;
//input [reg_size-1:0] GEN;
output [reg_size-1:0] gen_out;

wire sel1,load1,load2;
wire [1:0] sel2;

//Ggen_datapath DATA(clock,sel1,sel2,load1,load2,GEN,gen_out);
Ggen_datapath DATA(clock,sel1,sel2,load1,load2,gen_out);
Ggen_controller CON(clock,select,sel1,sel2,load1,load2,ack_sig);

endmodule

module Ggen_datapath(clock,sel1,sel2,load1,load2,gen_out,w1_out,w7_out);

parameter reg_size = 16;
//parameter gen_size = 6;    

reg [reg_size-1:0] GEN = 16'b00000000__00101000;   //40

input clock;
input sel1;
input [1:0] sel2;
input load1;
input load2;
//input [reg_size-1:0] GEN;
output [reg_size-1:0] gen_out;
output [reg_size-1:0] w1_out;
output [reg_size-1:0] w7_out;


wire [reg_size-1:0] w1,w2,w3,w4,w5,w7,w8;
assign w1_out = w1;
assign w7_out = w7;

assign w8 = GEN;

//mux_2to1 MUX1(16'b0000000000101000,w6,sel1,w1);
mux_2to1 MUX1(GEN,w5,sel1,w1);
PIPO1 REG1(w1,clock,load1,w2);
PIPO1 REG2(w7,clock,load2,gen_out);

assign w3 = w2 << 5;
assign w4 = w2 << 3;
assign w5 = w3 + w4;


MUX_4to1 MUX2(16'b00000000_00000001,w8,w1,16'b00000000_00000000,sel2,w7);

endmodule


module Ggen_controller(clock,select,sel1,sel2,load1,load2,ack_sig);

input clock;
input [4:0] select;                //from sel_twiddleGEN
input ack_sig;                     //from sel_twiddleGEN, once 1, start the process
output reg sel1,load1,load2;
output reg [1:0] sel2;

reg ack_capture;
reg [1:0] state;
reg [4:0] count ;//= select;
reg [4:0] iterate;// = select - 1;

always @(posedge ack_sig)
    begin
    ack_capture  = 1;
    end
    
initial 
      begin
        //count <= select;
        //iterate <= select -1 ;
//        load1 <= 0;
//        load2 <= 0;
//        sel1 <= 0;
      	state <= 2'b10;
      end
      
always @(posedge clock)
begin

    case(state)
    
        2'b10: begin
               //reg initialization stage
               count <= select;
               iterate <= select - 2 ;
               load1 <= 1;
               sel1 <= 0;
               load2 <= 0;
               sel2 <= 2'b10; 
               if(ack_sig)
                state <= 2'b00;   //start the process
               else
                state <= 2'b10;   //remain in the same state
               end
    
    
        2'b00: begin
               if(count == 5'b00000)
                begin
                ack_capture <= 0;
                sel2 <= 2'b00;
                load2 <= 1;
                //goto last state
                state <= 2'b11;
                end
               else if(count == 5'b00001)
                begin
                ack_capture <= 0;
                sel2 <= 2'b01;
                load2 <= 1;
                //goto last state
                state <= 2'b11;
                end
               else if(count > 1)
               begin
               //goto iterative state
               ack_capture <= 0;
               sel1 <= 0;
               state <= 2'b01;
               end
               end
        
        2'b01: begin
                if(iterate > 0)
                begin
                    //begin the iteration and loop back to state 01
                    load1 <= 1;
                    load2 <= 0;
                    sel1 <= 1;
                    sel2 <= 2'b10; //set at 2
                    iterate = iterate - 1;
                    state <= 2'b01;
                end
                else if(iterate == 0)
                    begin
                    //goto last state
                    load1 <= 0; 
                    sel2 <= 2'b10; 
                    sel1 <= 1;
                    state <= 2'b11;
                    end
               end
               
         2'b11: begin
                load2 <= 1;
                state <= 2'b10;  //goto the first initial state
                end
        
    endcase
end

endmodule


module mux_2to1(a,b,sel,data_out);

parameter n = 16;

input [n-1:0] a;
input [n-1:0] b;
input sel;

output [n-1:0] data_out;

assign data_out = sel ? b:a;

endmodule

module PIPO1(a,clock,load,reg_out);

parameter n = 16;

input [n-1:0] a;
input clock;
input load;
output reg [n-1:0] reg_out;

always @(posedge clock)
begin
    if(load)
    reg_out <= a;
end
endmodule


module MUX_4to1(a,b,c,d,sel,mux_out);

parameter n = 16;
input [n-1:0] a;
input [n-1:0] b;
input [n-1:0] c;
input [n-1:0] d;
input [1:0] sel;
output reg [n-1:0] mux_out;

always @(*)
begin
    case(sel)
    2'b00: mux_out = a;
    2'b01: mux_out = b;
    2'b10: mux_out = c;
    2'b11: mux_out = d;
    endcase
end

endmodule
