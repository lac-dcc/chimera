`define TimeExpire 32'd50000000

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
            5'd0: out10=7'b1000000;
            5'd1: out10=7'b1111001;
            5'd2: out10=7'b0100100;
            5'd3: out10=7'b0110000;
            5'd4: out10=7'b0011001;
            5'd5: out10=7'b0010010;
            5'd6: out10=7'b0000010;
            5'd7: out10=7'b1011000;
            5'd8: out10=7'b0000000;
            5'd9: out10=7'b0010000;
    endcase
    case(in%10)
            5'd0: out1=7'b1000000;
            5'd1: out1=7'b1111001;
            5'd2: out1=7'b0100100;
            5'd3: out1=7'b0110000;
            5'd4: out1=7'b0011001;
            5'd5: out1=7'b0010010;
            5'd6: out1=7'b0000010;
            5'd7: out1=7'b1011000;
            5'd8: out1=7'b0000000;
            5'd9: out1=7'b0010000;
    endcase
end
endmodule

module displayLight(in,light);
input [7:0] in;
//display current LED light
output [7:0] light;
reg [7:0] light;

always@(in)
begin
    //display green one
    if(in>=5'd13&&in<=5'd3) light=3'b100;
    //display yellow one
    else light=3'b010;
end
endmodule

module lab11(reset,clk,button,outScore1,outScore10,outSecond1,outSecond10,light);
input reset,clk;
input [7:0]button;
//display need to declear as output and wire
output [6:0]outScore1;
output [6:0]outScore10;

output [6:0]outSecond1;
output [6:0]outSecond10;

output [7:0]light;

wire [6:0]outScore1;
wire [6:0]outScore10;

wire [6:0]outSecond1;
wire [6:0]outSecond10;

wire [7:0]light;

//

//logic counter neeed to declear as reg
reg [31:0]count;
reg [7:0]second;
reg [7:0]score;
reg [7:0]rand;
//
displayNumber DISSECOND (.in(second),.out10(outSecond10),.out1(outSecond1));
displayNumber DISSCORE (.in(score),.out10(outScore10),.out1(outScore1));
displayLight DISLIT (.in(second),.light(light));


always@(posedge clk,negedge reset)
begin
    if(reset)
    begin
        count<=32'd0;
        second<=5'd13;
        rand<={$random} % 60;
    end
    else
    begin
        if(count==`TimeExpire)
        begin
            count<=32'd0;
            if(second==5'd0)
            begin
                second=5'd13;
            end
            else
            begin
                second=second-1'b1;
            end
        end
        else count<=count+32'd1;
    end
end
endmodule
