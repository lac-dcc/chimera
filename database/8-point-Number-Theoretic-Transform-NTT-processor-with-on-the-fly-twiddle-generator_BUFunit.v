// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


//perform any operation ONLY  when the twiddle at the input changes

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