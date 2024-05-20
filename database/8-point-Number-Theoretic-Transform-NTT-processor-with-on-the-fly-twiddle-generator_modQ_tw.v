// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0



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