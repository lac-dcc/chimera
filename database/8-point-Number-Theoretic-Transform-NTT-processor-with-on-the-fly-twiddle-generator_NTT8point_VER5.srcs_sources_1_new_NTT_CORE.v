// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


module NTT_CORE(i,j,N,start1,start2,t,tprev,enable,rw,clock,x1_out,x2_out,tw_ack,buf_ack);

parameter n = 4;
parameter m = 25;
input [n:0] i;
input [n:0] j;
input [n:0] N;
input [n:0] t;
input [n:0] tprev;
input clock;
input enable;
input rw;
input start1,start2;
output wire [m-1:0] x1_out;
output wire [m-1:0] x2_out;
output tw_ack;
output buf_ack;
//output [n:0] index1_out;            //test signal
//output [n:0] index2_out;            //test signal
//output [24:0] u_inp_check;          //test signal
//output [24:0] v_inp_check;          //test signal
//output [24:0] TW_check;             //test signal

wire [m-1:0] u_inp;      //input extracted from memory 
wire [m-1:0] v_inp;      //input extracted from memory
wire [n:0] index1;
wire [n:0] index2;

encapsulate2 ENCAP2(i,j,t,tprev,start1,clock,index1,index2);       //JMOD+BUF INDEX GENERATOR

dualPortMemory MEM1(clock,rw,enable,index1,index2,x1_out,x2_out,u_inp,v_inp);

encapsulate1 ENCAP1(i,j,N,start2,clock,u_inp,v_inp,x1_out,x2_out,tw_ack,buf_ack);  //TWIDDLE GEN+BUF UNIT

endmodule

////////////////////////////////////////////////////////////////////////////////////////////

module encapsulate2(i,j,t,tprev,start,clock,index1,index2);

input [4:0] i;
input [4:0] j;
input [4:0] t;
input [4:0] tprev;
input start;
input clock;
output [4:0] index1;    //for access x[k]
output [4:0] index2;    //for access x[k+t]

wire [4:0] jmod_out;

jmod JMOD1(j,t,clock,jmod_out,start);
index_GEN BUFINDEX1(j,t,i,jmod_out,tprev,index1,index2);

endmodule

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

module index_GEN(j,t,i,jmod,tprev,index1,index2);

input [4:0] j;
input [4:0] t;
input [4:0] i;
input [4:0] jmod;
input [4:0] tprev;
output [4:0] index1;
output [4:0] index2;

wire [4:0] w1,w6,w7,w9,w10;
wire w2,w3,w4,w5,w8;

SUB_4BIT1 SUB1(t,j,w1);
assign w2 = w1[3];
assign w3 = |w1;
assign w4 = ~w3;
or OR1(w5,w2,w4);
assign w8 = |w7;
assign w6 = j*2;

SUB_4BIT1 SUB2(i,5'b00010,w7);

ADDER_4BIT1 ADD1(jmod,tprev,w9);

mux_2to1_4bit1 MUX1(w6,w9,w8,w10);
mux_2to1_4bit1 MUX2(j,w10,w5,index1);

assign index2 = index1 + t;

endmodule


module mux_2to1_4bit1(a,b,sel,data_out);


input [4:0] a;
input [4:0] b;
input sel;

output [4:0] data_out;

assign data_out = sel ? b:a;

endmodule

module SUB_4BIT1(a,b,sub);

input [4:0] a;
input [4:0] b;

output [4:0] sub;


assign sub = a-b;

endmodule

module ADDER_4BIT1(a,b,sum);

input [4:0] a;
input [4:0] b;

output [4:0] sum;


assign sum = a+b;

endmodule

module dualPortMemory(clock,rw,enable,addr1,addr2,data_in1,data_in2,data_out1,data_out2);

parameter n = 4;
parameter word_size = 25;
input clock;
input rw;       //rw = 1 --> read, rw = 0 --> write, provided enable = 1
input enable;
input [word_size-1:0] data_in1;
input [word_size-1:0] data_in2;
input [n:0] addr1;
input [n:0] addr2;

output reg [word_size-1:0] data_out1;
output reg [word_size-1:0] data_out2;

reg [word_size-1:0] NTT_RAM[7:0]; //memory with 8 locations,each having word size 25 bit

initial
begin
    NTT_RAM[0] <= 25'b0000_0000_0000_0000_1111_1010_1;      //501
    NTT_RAM[1] <= 25'b0000_0000_0000_0000_1011_1010_1;      //373
    NTT_RAM[2] <= 25'b0000_0000_0000_0000_0011_0010_1;      //101
    NTT_RAM[3] <= 25'b0000_0000_0000_0000_1001_1000_1;      //305
    NTT_RAM[4] <= 25'b0000_0000_0000_0000_1111_1110_0;      //508
    NTT_RAM[5] <= 25'b0000_0000_0000_0000_0000_1100_0;      //24
    NTT_RAM[6] <= 25'b0000_0000_0000_0000_0011_1010_0;      //116
    NTT_RAM[7] <= 25'b0000_0000_0000_0000_1001_0011_0;      //294
end

always @(posedge clock)
begin
    if(enable)
    begin
        if(rw == 1)  //read enabled
            begin
                data_out1 <= NTT_RAM[addr1];
                data_out2 <= NTT_RAM[addr2];
            end
        else        //write enabled
            begin
                NTT_RAM[addr1] <= data_in1;
                NTT_RAM[addr2] <= data_in2;
            end
    end
    else
        //hold the data at the outputs
        begin
        data_out1 <= data_out1;
        data_out2 <= data_out2;
        end
end

endmodule

module encapsulate1(i,j,N,start,clock,u_inp,v_inp,x1_out,x2_out,tw_ack,buf_ack);

parameter n = 25;
input [4:0] i;
input [4:0] j;
input [4:0] N;
input start;
input clock;
input [n-1:0] u_inp;
input [n-1:0] v_inp;
output [n-1:0] x1_out;
output [n-1:0] x2_out;
output tw_ack;
output buf_ack;

wire [n-1:0] TW_out;

//assign TW_check = TW_out;   //check whether twiddle is obtained or not at output

TW_gen TWIDDLE1(j,i,N,start,clock,tw_ack,TW_out);
BUFunit BUF1(u_inp,v_inp,clock,TW_out,x1_out,x2_out,buf_ack);

endmodule

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

module modQ_tw(inp,clock,tw_ack,b_mod_out);

parameter n = 25;

input clock;
input [n-1:0] inp;
output [n-1:0] b_mod_out;
output tw_ack;

wire start,ack;
wire [n-1:0] b_val;


b_GEN1 GEN1(inp,clock,ack,start,b_val);
b_mod1 MOD1(b_val,clock,start,ack,tw_ack,b_mod_out);

endmodule



module b_GEN1(inp,clock,ack,start,b_val);

parameter n = 25;
parameter Q_reg_size = 12;

input [n-1:0] inp;
input clock;
input ack;
output wire [n-1:0] b_val;

wire [n-1:0] inp_capture;

output reg start;   //for next stage of mod Q reduction

reg [Q_reg_size-1:0] Q = 12'b110100000001;      //modulo 3329

reg [4:0]r_shift;
reg [9:0]temp_val;

wire [n-1:0] s_val;

//inp_capture captures the magnitude of the input
assign inp_capture = inp[n-1] == 0 ? inp : ~inp[n-1:0] + 1;

always @(b_val)
begin
    start <= 1;
end

always@(posedge clock)
begin
    if(ack)
        begin
        if(start)
            start <= 0;
        else
            start <= start;
        end
    else
        start <= start;
end

always @(posedge clock)  
    begin
    if(inp_capture <= 24'b00000000000_1101100000000 )   //6912
        begin
        r_shift  <= 5'b01100;           //12
        temp_val <= 10'b0000000010;     //2
        end
    else if(inp_capture > 24'b00000000000_1101100000000 & inp_capture < 24'b000000001100011101111011) //6912 to 51067
        begin
        r_shift  <= 5'b01101;           //13
        temp_val <= 10'b00000_00011;    //3
        end
    else if(inp_capture >= 24'b000000001100011101111011 & inp_capture < 24'b000011111010010110000010) //51067 to 1025410
        begin
        r_shift  <= 5'b01110;           //14
        temp_val <= 10'b0000000101;     //5
        end
    else if(inp_capture >= 24'b000011111010010110000010 & inp_capture < 24'b011100111001011011001011)  //1025410 to 7575243
        begin
        r_shift  <= 5'b01111;           //15
        temp_val <= 10'b0000001010;     //10
        end
    else //greater than 7575243
        begin
        r_shift   <= 5'b10011;          //19
        temp_val  <= 10'b0010011110;      //158
        end
    end


assign s_val = (inp_capture >> r_shift) * temp_val;
assign b_val = inp[n-1] == 1 ? inp + (s_val * Q) : inp - (s_val * Q); //selection-based approach to support functionality for both +ve
                                                                      //and -ve numbers
endmodule


module b_mod1(b_inp,clock,start,ack,tw_ack,b_mod_out);

parameter n = 25;

input [n-1:0] b_inp;
input clock;
input start;
output [n-1:0] b_mod_out;
output ack;
output tw_ack;
wire sel1,sel2,sel3,sel4,load1,load2,con,msb_b,msb_b_Q;
    
b_mod_datapath1 DATA1(b_inp,clock,sel1,sel2,sel3,con,load1,load2,msb_b,msb_b_Q,b_mod_out);

b_mod_controller1 CON1(clock,start,ack,msb_b,msb_b_Q,sel1,sel2,sel3,load1,load2,con,tw_ack);


endmodule

module b_mod_datapath1(b_inp,clock,sel1,sel2,sel3,con,load1,load2,msb_b,msb_b_Q,b_out_final);

parameter n = 25;
reg [n-1:0] Q = 25'b0000000000000110100000001;   //3329
input [n-1:0] b_inp;
input clock;
input sel1,sel2,sel3,con,load1,load2;

output msb_b;
output msb_b_Q;
output reg[n-1:0] b_out_final;

wire [n-1:0] b_out;
wire [n-1:0] b_mod_out,w1,w2,w3,w4,w5,w6;
wire w7;

assign msb_b = w1[n-1];
assign msb_b_Q = w2[n-1];


//"NOT" the msb of inp and AND it with w8 and feed it into a 2 to 1 MUX
assign w7 = ~b_mod_out[n-1];

mux_2to1_nbit1 MUX1(w6,b_inp,sel1,w1);   //MUX1

adder_cum_sub1 ADDSUB1(w1,con,w2);
//adder_cum_sub ADDSUB2(b_mod_out,w7,b_out_final);
mux_2to1_nbit1 MUX2(w1,w2,sel2,w3);     //MUX2


deMUX1to2_nbit1 deMUX2(w3,sel3,w4,w5);          //deMUX1

PIPO31 REG1(w5,clock,load1,w6);

PIPO31 REG2(w4,clock,load2,b_mod_out);

always @(b_mod_out)
begin
    if(b_mod_out >= 0 & b_mod_out < Q)
    b_out_final = b_mod_out;
    else
    b_out_final = w7 == 1 ? b_mod_out - Q : b_mod_out + Q;
end



endmodule


module mux_2to1_nbit1(a,b,sel,data_out);

parameter n = 25;
input [n-1:0] a;
input [n-1:0] b;
input sel;

output [n-1:0] data_out;

assign data_out = sel ? b:a;

endmodule

module adder_cum_sub1(inp,con,data_out);

//adder cum subtractor based on control input
//con = 0 --> add , con = 1 --> sub

parameter n = 25;

input [n-1:0] inp;
input con;
output [n-1:0] data_out;

reg [n-1:0] Q = 25'b0000000000000110100000001;   //3329

assign data_out = (con == 0) ? inp + Q : inp - Q ; 

endmodule

module deMUX1to2_nbit1(inp,sel,y0,y1);

parameter n = 25;

input [n-1:0] inp;
input sel;
output reg [n-1:0] y0;
output reg [n-1:0] y1;

always @(*)
begin
    case(sel)
        1'b0 : begin
                y0 <= inp;
                y1 <= 25'b0;     
               end
        1'b1 : begin
                y0 <= 25'b0;
                y1 <= inp;
               end
    endcase
end

endmodule

module PIPO31(a,clock,load,reg_out);

parameter n = 25;

input [n-1:0] a;
input clock;
input load;
output reg [n-1:0] reg_out;

always @(posedge clock)
begin
    if(load)
    reg_out <= a;
    else
    reg_out <= reg_out;
end
endmodule

module b_mod_controller1(clock,start,ack,msb_b,msb_b_Q,sel1,sel2,sel3,load1,load2,con,tw_ack);

input clock;
input start;
input msb_b;
input msb_b_Q;
output reg sel1,sel2,sel3,load1,load2,con;
output reg ack;
output reg tw_ack;
reg [1:0] state ; 

initial 
begin
   state <= 2'b00; 
   tw_ack <= 0;
end

always @(posedge clock)
begin
    case(state)
        
        2'b00: begin   
                   sel1 <= 1;
                   sel2 <= 0;
                   sel3 <= 1;
                   tw_ack <= 0;
                   con <= 1; //subtract in the first instance
                   load1 <= 1;
                   if(start)
                        begin
                        ack <= 1;
                        state <= 2'b01;     //goto iterative state
                        end
                   else
                   state <= 2'b00;
                end
                
        2'b01: begin       
                 if(msb_b == 0 & msb_b_Q == 1)   //no reduction required
                    begin
                        sel2 <= 0;
                        sel3 <= 0;
                        load1 <= 0;
                        load2 <= 1;
                        ack <= 0;
                        state <= 2'b10;          //load2 will be activated at this stage
                    end
                 else if(msb_b == 0 & msb_b_Q == 0)   //b > Q
                    begin
                        sel1 <= 0;
                        sel2 <= 1;
                        con <= 1;
                        sel3 <= 1;
                        load1 <= 1;
                        load2 <= 0;
                        ack <= 0;
                        state <= 2'b01;
                    end
                 else if(msb_b == 1 & msb_b_Q == 1)  //b < 0
                    begin
                        sel1 <= 0;
                        sel2 <= 1;
                        con <= 0;
                        sel3 <= 1;
                        load1 <= 1;
                        load2 <= 0;
                        ack <= 0;
                        state <= 2'b01;
                    end
                end
                
        2'b10: begin   //b<0
                    load1 <= 0;
                    load2 <= 1;
                    //tw_ack <= 1;
                    state <= 2'b11;
                end    
                
        2'b11:  begin
                    load2 <= 0;
                    tw_ack <= 1;
                    state <= 2'b00;   //goto first state
                end  
    endcase
    
end

endmodule

module BUFunit(u_inp,v_inp,clock,tw_inp,x1_out,x2_out,ack);

parameter n = 25 ;
parameter m = 12; 

input [n-1:0] u_inp;
input [n-1:0] v_inp;
input clock;
input [m-1:0] tw_inp;
output [n-1:0] x1_out;
output [n-1:0] x2_out;
output reg ack;              //this signal is activated when x2 is obtained at the output,with guarentee, that x1 has been achieved
                              //at the output beforehand
reg flag1,flag2,flag3;
reg [1:0] count;                                 
//wire [n-1:0] w1,w2,w3,w4,w5;
//wire [n-1:0] w1,w2,w3;
reg [n-1:0] w1,w2,w3;
wire [n-1:0] w4,w5;

//assign w1 = u_inp + v_inp;
//assign w2 = u_inp - v_inp;
//assign w3 = w2 * tw_inp;

modQ MOD1(w1,clock,w4);
modQ MOD2(w3,clock,w5);

assign x1_out = w4;
assign x2_out = w5;

initial
begin
    count = 2'b00;     //initialize count to 0 
end

always@(x1_out)
begin
    flag1 <= 1;
end

always@(x2_out)
begin
    flag2 <= 1;
end

always @(tw_inp)      //for the last stage, twiddle will stay constant at 1, so this step won't work for i=2
begin
    if(tw_inp > 0)
    flag3 <= 1;
end

always@(posedge clock)  //flag3
begin
    if(flag3)  //flag3 == 1
    begin
        w1 = u_inp + v_inp;
        w2 = u_inp - v_inp;
        w3 = w2 * tw_inp;
    end
end

always@(posedge clock)
begin
    if(flag1 == 1 & flag2 == 1 & flag3 == 1)
        begin
        ack <= 1;
        count = count + 1;    //increment count only when all flag1,flag2,ack are set
            if(count == 2'b11)  //2 clock cycle reached
            begin
                flag1 <= 0;
                flag2 <= 0;
                flag3 <= 0;
                ack <= 0;
                count <= 2'b00;
            end
            else
            begin
                flag1 <= 1;
                flag2 <= 1;
                flag3 <= 1;
                ack <= 1;
            end
        end
        else
            ack <= 0;
end


endmodule


module modQ(inp,clock,b_mod_out);

parameter n = 25;

input clock;
input [n-1:0] inp;
output [n-1:0] b_mod_out;

wire start,ack;
wire [n-1:0] b_val;


b_GEN GEN1(inp,clock,ack,start,b_val);
b_mod MOD1(b_val,clock,start,ack,b_mod_out);

endmodule



module b_GEN(inp,clock,ack,start,b_val);

parameter n = 25;
parameter Q_reg_size = 12;

input [n-1:0] inp;
input clock;
input ack;
output wire [n-1:0] b_val;

wire [n-1:0] inp_capture;

output reg start;   //for next stage of mod Q reduction

reg [Q_reg_size-1:0] Q = 12'b110100000001;      //modulo 3329

reg [4:0]r_shift;
reg [9:0]temp_val;

wire [n-1:0] s_val;

//inp_capture captures the magnitude of the input
assign inp_capture = inp[n-1] == 0 ? inp : ~inp[n-1:0] + 1;

always @(b_val)
begin
    start <= 1;
end

always@(posedge clock)
begin
    if(ack)
        begin
        if(start)
            start <= 0;
        else
            start <= start;
        end
    else
        start <= start;
end

always @(posedge clock)  
    begin
    if(inp_capture <= 24'b00000000000_1101100000000 )   //6912
        begin
        r_shift  <= 5'b01100;           //12
        temp_val <= 10'b0000000010;     //2
        end
    else if(inp_capture > 24'b00000000000_1101100000000 & inp_capture < 24'b000000001100011101111011) //6912 to 51067
        begin
        r_shift  <= 5'b01101;           //13
        temp_val <= 10'b00000_00011;    //3
        end
    else if(inp_capture >= 24'b000000001100011101111011 & inp_capture < 24'b000011111010010110000010) //51067 to 1025410
        begin
        r_shift  <= 5'b01110;           //14
        temp_val <= 10'b0000000101;     //5
        end
    else if(inp_capture >= 24'b000011111010010110000010 & inp_capture < 24'b011100111001011011001011)  //1025410 to 7575243
        begin
        r_shift  <= 5'b01111;           //15
        temp_val <= 10'b0000001010;     //10
        end
    else //greater than 7575243
        begin
        r_shift   <= 5'b10011;          //19
        temp_val  <= 10'b0010011110;      //158
        end
    end


assign s_val = (inp_capture >> r_shift) * temp_val;
assign b_val = inp[n-1] == 1 ? inp + (s_val * Q) : inp - (s_val * Q); //selection-based approach to support functionality for both +ve
                                                                      //and -ve numbers
endmodule


module b_mod(b_inp,clock,start,ack,b_mod_out);

parameter n = 25;

input [n-1:0] b_inp;
input clock;
input start;
output [n-1:0] b_mod_out;
output ack;
wire sel1,sel2,sel3,sel4,load1,load2,con,msb_b,msb_b_Q;
    
b_mod_datapath DATA1(b_inp,clock,sel1,sel2,sel3,con,load1,load2,msb_b,msb_b_Q,b_mod_out);

b_mod_controller CON1(clock,start,ack,msb_b,msb_b_Q,sel1,sel2,sel3,load1,load2,con);


endmodule

module b_mod_datapath(b_inp,clock,sel1,sel2,sel3,con,load1,load2,msb_b,msb_b_Q,b_out_final);

parameter n = 25;
reg [n-1:0] Q = 25'b0000000000000110100000001;   //3329
input [n-1:0] b_inp;
input clock;
input sel1,sel2,sel3,con,load1,load2;

output msb_b;
output msb_b_Q;
output reg[n-1:0] b_out_final;

wire [n-1:0] b_out;
wire [n-1:0] b_mod_out,w1,w2,w3,w4,w5,w6;
wire w7;

assign msb_b = w1[n-1];
assign msb_b_Q = w2[n-1];


//"NOT" the msb of inp and AND it with w8 and feed it into a 2 to 1 MUX
assign w7 = ~b_mod_out[n-1];

mux_2to1_nbit MUX1(w6,b_inp,sel1,w1);   //MUX1

adder_cum_sub ADDSUB1(w1,con,w2);
//adder_cum_sub ADDSUB2(b_mod_out,w7,b_out_final);
mux_2to1_nbit MUX2(w1,w2,sel2,w3);     //MUX2


deMUX1to2_nbit deMUX2(w3,sel3,w4,w5);          //deMUX1

PIPO3 REG1(w5,clock,load1,w6);

PIPO3 REG2(w4,clock,load2,b_mod_out);

always @(b_mod_out)
begin
    if(b_mod_out >= 0 & b_mod_out < Q)
    b_out_final = b_mod_out;
    else
    b_out_final = w7 == 1 ? b_mod_out - Q : b_mod_out + Q;
end



endmodule


module mux_2to1_nbit(a,b,sel,data_out);

parameter n = 25;
input [n-1:0] a;
input [n-1:0] b;
input sel;

output [n-1:0] data_out;

assign data_out = sel ? b:a;

endmodule

module adder_cum_sub(inp,con,data_out);

//adder cum subtractor based on control input
//con = 0 --> add , con = 1 --> sub

parameter n = 25;

input [n-1:0] inp;
input con;
output [n-1:0] data_out;

reg [n-1:0] Q = 25'b0000000000000110100000001;   //3329

assign data_out = (con == 0) ? inp + Q : inp - Q ; 

endmodule

module deMUX1to2_nbit(inp,sel,y0,y1);

parameter n = 25;

input [n-1:0] inp;
input sel;
output reg [n-1:0] y0;
output reg [n-1:0] y1;

always @(*)
begin
    case(sel)
        1'b0 : begin
                y0 <= inp;
                y1 <= 25'b0;     
               end
        1'b1 : begin
                y0 <= 25'b0;
                y1 <= inp;
               end
    endcase
end

endmodule

module PIPO3(a,clock,load,reg_out);

parameter n = 25;

input [n-1:0] a;
input clock;
input load;
output reg [n-1:0] reg_out;

always @(posedge clock)
begin
    if(load)
    reg_out <= a;
    else
    reg_out <= reg_out;
end
endmodule

module b_mod_controller(clock,start,ack,msb_b,msb_b_Q,sel1,sel2,sel3,load1,load2,con);

input clock;
input start;
input msb_b;
input msb_b_Q;
output reg sel1,sel2,sel3,load1,load2,con;
output reg ack;
reg [1:0] state ; 

initial 
begin
   state <= 2'b00; 
end

always @(posedge clock)
begin
    case(state)
        
        2'b00: begin   
                   sel1 <= 1;
                   sel2 <= 0;
                   sel3 <= 1;
                   con <= 1; //subtract in the first instance
                   load1 <= 1;
                   if(start)
                        begin
                        ack <= 1;
                        state <= 2'b01;     //goto iterative state
                        end
                   else
                   state <= 2'b00;
                end
                
        2'b01: begin       
                 if(msb_b == 0 & msb_b_Q == 1)   //no reduction required
                    begin
                        sel2 <= 0;
                        sel3 <= 0;
                        load1 <= 0;
                        load2 <= 1;
                        ack <= 0;
                        state <= 2'b10;          //load2 will be activated at this stage
                    end
                 else if(msb_b == 0 & msb_b_Q == 0)   //b > Q
                    begin
                        sel1 <= 0;
                        sel2 <= 1;
                        con <= 1;
                        sel3 <= 1;
                        load1 <= 1;
                        load2 <= 0;
                        ack <= 0;
                        state <= 2'b01;
                    end
                 else if(msb_b == 1 & msb_b_Q == 1)  //b < 0
                    begin
                        sel1 <= 0;
                        sel2 <= 1;
                        con <= 0;
                        sel3 <= 1;
                        load1 <= 1;
                        load2 <= 0;
                        ack <= 0;
                        state <= 2'b01;
                    end
                end
                
        2'b10: begin   //b<0
                    load1 <= 0;
                    load2 <= 1;
                    state <= 2'b11;
                end    
                
        2'b11:  begin
                    load2 <= 0;
                    state <= 2'b00;   //goto first state
                end  
    endcase
    
end

endmodule
