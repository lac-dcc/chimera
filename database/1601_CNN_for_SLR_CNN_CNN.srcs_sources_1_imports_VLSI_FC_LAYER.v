// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

`timescale 1ns / 1ps

//A PIXEL IS TAKEN AS INPUT AT EVERY CLOCK PULSE.
module FC_LAYER(
input [35:0] A,
input CLK,
input ENABLE,
input RST,
input [5:0] COUNT,
input [3:0] READ,
output reg DONE,
output reg signed [39:0] OUT_PORT
 );
 
 wire NODE_DONE;
 wire signed [39:0] Z0;
 wire signed [39:0] Z1;
 wire signed [39:0] Z2;
 wire signed [39:0] Z3;
 wire signed [39:0] Z4;
 wire signed [39:0] Z5;
 wire signed [39:0] Z6;
 wire signed [39:0] Z7;
 wire signed [39:0] Z8;
 wire signed [39:0] Z9;
 wire signed [39:0] Z10;
 wire signed [39:0] Z11;
 wire signed [39:0] Z12;
 wire signed [39:0] Z13;
 wire signed [39:0] Z14;
 wire signed [39:0] Z15;
 //reg [5:0] counter; //6 bit counter for 64 pixels(words)
always@(posedge CLK) DONE <= NODE_DONE;
 //CONNECT THE NODES 
 NODE_0 NODE_0 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z0),
 .DONE(NODE_DONE)
 );
 
  NODE_1 NODE_1 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z1)
 );
 
  NODE_2 NODE_2 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z2)
 );
 
  NODE_3 NODE_3 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z3)
 );
 
  NODE_4 NODE_4 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z4)
 );
 
  NODE_5 NODE_5 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z5)
 );
 
  NODE_6 NODE_6 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z6)
 );
 
  NODE_7 NODE_7 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z7)
 );
 
  NODE_8 NODE_8 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z8)
 );
 
  NODE_9 NODE_9 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z9)
 );
 
  NODE_10 NODE_10 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z10)
 );
 
  NODE_11 NODE_11 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z11)
 );
 
  NODE_12 NODE_12 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z12)
 );
 
  NODE_13 NODE_13 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z13)
 );
 
  NODE_14 NODE_14 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z14)
 );
 
  NODE_15 NODE_15 (
 .A(A),
 .step(COUNT),
 .CLK(CLK),
 .ENABLE(ENABLE),
 .RST(RST),
 .OUT(Z15)
 );
   

 /*
 //SYNCRONOUS OUTPUT SWEEP BLOCK, 16 PULSES
 always@(posedge CLK) begin //64 steps for a full image
 if (ENABLE==1 & RST==0) begin
    counter<=counter+1;
    if(counter==6'd0)begin
        PORT_ID<=0; 
    end
    else if(counter==6'd1)begin
        PORT_ID<=1; 
    end
    else if(counter==6'd2)begin
        PORT_ID<=2; 
    end    
    else if(counter==6'd3)begin
        PORT_ID<=3; 
    end  
    else if(counter==6'd4)begin
        PORT_ID<=4; 
    end
    else if(counter==6'd5)begin
        PORT_ID<=5; 
    end    
    else if(counter==6'd6)begin
        PORT_ID<=6; 
    end 
    else if(counter==6'd7)begin
        PORT_ID<=7; 
    end
    else if(counter==6'd8)begin
        PORT_ID<=8; 
    end    
    else if(counter==6'd9)begin
        PORT_ID<=9; 
    end  
    else if(counter==6'd10)begin
        PORT_ID<=10; 
    end
    else if(counter==6'd11)begin
        PORT_ID<=11; 
    end    
    else if(counter==6'd12)begin
        PORT_ID<=12; 
    end    
    else if(counter==6'd13)begin
        PORT_ID<=13; 
    end
    else if(counter==6'd14)begin
        PORT_ID<=14; 
    end    
    else if(counter==6'd15)begin
        PORT_ID<=15; 
    end  
    else if(counter==6'b111111)begin
        counter <= 0; 
    end                
 end
 else if(RST==1)begin
 counter <=6'd0;
 end
 end*/
 reg [39:0] REGBLOCK [15:0];
always@ ( posedge CLK )
 begin
     if (NODE_DONE)
         begin
         case(READ)
             4'd0: OUT_PORT<=REGBLOCK[0];
             4'd1: OUT_PORT<=REGBLOCK[1];
             4'd2: OUT_PORT<=REGBLOCK[2];
             4'd3: OUT_PORT<=REGBLOCK[3];
             4'd4: OUT_PORT<=REGBLOCK[4];
             4'd5: OUT_PORT<=REGBLOCK[5];
             4'd6: OUT_PORT<=REGBLOCK[6];
             4'd7: OUT_PORT<=REGBLOCK[7];
             4'd8: OUT_PORT<=REGBLOCK[8];
             4'd9: OUT_PORT<=REGBLOCK[9];
             4'd10: OUT_PORT<=REGBLOCK[10];
             4'd11: OUT_PORT<=REGBLOCK[11];
             4'd12: OUT_PORT<=REGBLOCK[12];
             4'd13: OUT_PORT<=REGBLOCK[13]; 
             4'd14: OUT_PORT<=REGBLOCK[14];
             4'd15: OUT_PORT<=REGBLOCK[15];
             default: OUT_PORT<= 40'd0;     
         endcase
         end
 end
always@ ( posedge CLK )
begin
    if (NODE_DONE)
        begin
        REGBLOCK[0]<=Z0;
        REGBLOCK[1]<=Z1;
        REGBLOCK[2]<=Z2;
        REGBLOCK[3]<=Z3;
        REGBLOCK[4]<=Z4;
        REGBLOCK[5]<=Z5;
        REGBLOCK[6]<=Z6;
        REGBLOCK[7]<=Z7;
        REGBLOCK[8]<=Z8;
        REGBLOCK[9]<=Z9;
        REGBLOCK[10]<=Z10;
        REGBLOCK[11]<=Z11;
        REGBLOCK[12]<=Z12;
        REGBLOCK[13]<=Z13;  
        REGBLOCK[14]<=Z14;
        REGBLOCK[15]<=Z15;  
  end
  
end
 
endmodule
