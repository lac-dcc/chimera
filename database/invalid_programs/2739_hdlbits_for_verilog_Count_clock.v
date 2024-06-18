// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    reg se1,se2,se3,se4,se5,se6,se7;
    //instantiating 1 counter for each digit
    countsm1 s1(clk,reset,ena,1,ss[3:0]);
    countsm2 s2(clk,reset,ena,se1,ss[7:4]);
    countsm1 m1(clk,reset,ena,se2,mm[3:0]);
    countsm2 m2(clk,reset,ena,se3,mm[7:4]);
    counth1 h1(clk,reset,ena,se4,se6,hh[3:0]);
    counth2 h2(clk,reset,ena,se5,se6,hh[7:4]);
    countampm ap(clk,reset,ena,se7,pm); 
    always @(posedge clk) begin
        //necessary conditions for firing higher counters
        se1<=((ss[3:0]==4'd8 && ena) || (ss[3:0]==4'd9 && ~ena))?1:0;
        se2<=(ss[3:0]==4'd8 && ss[7:4]==4'd5)?1:0;
        se3<=(ss[3:0]==4'd8 && ss[7:4]==4'd5 && mm[3:0]==4'd9)?1:0;
        se4<=(ss[3:0]==4'd8 && ss[7:4]==4'd5 && mm[3:0]==4'd9 && mm[7:4]== 4'd5)?1:0;
        se5<=(ss[3:0]==4'd8 && ss[7:4]==4'd5 && mm[3:0]==4'd9 && mm[7:4]== 4'd5 && hh[3:0]==4'd9);
        se6<=(ss[3:0]==4'd8 && ss[7:4]==4'd5 && mm[3:0]==4'd9 && mm[7:4]== 4'd5 && hh[3:0]==4'd2 && hh[7:4]==4'd1)?1:0;
        se7<=(ss[3:0]==4'd8 && ss[7:4]==4'd5 && mm[3:0]==4'd9 && mm[7:4]== 4'd5 && hh[3:0]==4'd1 && hh[7:4]==4'd1)?1:0;
    end    
endmodule

module countsm1(
    input clk,
  	input reset,
    input ena1,
    input ena2,
    output reg [3:0] q);
    always @(posedge clk) begin
        if (reset) begin  
      		q <= 0;
        end else if(ena1 && ena2) begin
            q <=(q==9)?4'd0:q+1;
        end 
    end   
endmodule
        
module countsm2(
    input clk,
  	input reset,
    input ena1,
    input ena2,
    output reg [7:4] q);
    always @(posedge clk) begin
        if (reset) begin  
      		q <= 0;
        end else if(ena1 && ena2) begin
            q <=(q==5)?4'd0:q+1;
        end 
    end    
endmodule
        

module counth1(
    input clk,
  	input reset,
    input ena1,
    input ena2,
    input ena3,
    output reg [3:0] q);
    always @(posedge clk) begin
        if (reset) begin  
      		q <= 4'd2;
            //pm<=0;
        end else if(ena1 && ena2) begin
            //q <=(q==4'd9)?4'd0:q+1;
            if(ena3)
                q<=4'd1;
            else if(q==4'd9)
                q<=4'd0;
            else
                q<=q+1;
        end 
    end    
endmodule

module counth2(
    input clk,
  	input reset,
    input ena1,
    input ena2,
    input ena3,
    output reg [7:4] q);
    always @(posedge clk) begin
        if (reset) begin  
      		q <= 4'd1;
        end else if(ena1) begin
            if(ena2)
                q<=4'd1;
            else if(ena3)
                q<=4'd0;
        end 
    end    
endmodule

module countampm(
    input clk,
  	input reset,
    input ena1,
    input ena2,
    output pm);
    always @(posedge clk) begin
        if (reset) begin  
            pm<=0;
        end else if(ena1 && ena2) begin
            pm<=~pm;
        end 
    end    
endmodule          
