`define TimeExpire 32'd50000000
`define countdownTime 8'd10

//display number between 0 to 99
module displayNumber(in,out10,out1);
//input number
input [7:0]in;
//out10 mean 10's, out1 mean 1's
output [6:0]out10;
output [6:0]out1;
reg [6:0]out10;
reg [6:0]out1;

always@(in)
begin
    case(in%100-in%10)
            8'd0: out10=7'b1000000;
            8'd1: out10=7'b1111001;
            8'd2: out10=7'b0100100;
            8'd3: out10=7'b0110000;
            8'd4: out10=7'b0011001;
            8'd5: out10=7'b0010010;
            8'd6: out10=7'b0000010;
            8'd7: out10=7'b1011000;
            8'd8: out10=7'b0000000;
            8'd9: out10=7'b0010000;
    endcase
    case(in%10)
            8'd0: out1=7'b1000000;
            8'd1: out1=7'b1111001;
            8'd2: out1=7'b0100100;
            8'd3: out1=7'b0110000;
            8'd4: out1=7'b0011001;
            8'd5: out1=7'b0010010;
            8'd6: out1=7'b0000010;
            8'd7: out1=7'b1011000;
            8'd8: out1=7'b0000000;
            8'd9: out1=7'b0010000;
    endcase
end
endmodule

module window(reset,out1,out10,light,switch,finish);
input reset;
input [7:0] switch;

//display need to declear as output and wire
output [6:0]out1;
output [6:0]out10;
output [7:0]light;
output finish;

wire [6:0]out1;
wire [6:0]out10;
//

//logic counter neeed to declear as reg
reg [7:0]tries;
reg [7:0]light;
reg [3:0] i;
reg finish;
//

displayNumber DISNUM (.in(tries),.out10(out10),.out1(out1));

always@(reset)
begin
    if(reset)
    begin
        tries<=8'd0;
        finish<=1'b0;
        i=($random)%8;
        light=8'b00000000;
        light[i]=1'b1;
    end
end

always@(switch)
begin
    for(i=4'd0;i<4'd8;i++)
    begin
        if(switch[i]==1'b1)
        begin
            if(i>=1) light[i-4'd1]=~light[i-1];
            if(i<=6) light[i+1]=~light[i+1];
            light[i]=~light[i];
            tries<=tries+1'd1;
        end
    end
    if(light==8'b00000000) finish=1'b1;
end

endmodule
