// This program was cloned from: https://github.com/Darkborderman/schoolWorks
// License: BSD 2-Clause "Simplified" License

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

module displayGraph(safe,row,column,count);
//decide is green/yellow time or not
input safe;
input [31:0] count;
//display matrix
output [7:0] row;
output [7:0] column;

reg [7:0]row;
reg [7:0]column;

always@(safe)
begin
    if(safe)
    begin
        if(count%8==4'd0)
        begin
            row=8'b01111111;
            column=8'b00011000;
        end
        if(count%8==4'd1)
        begin
            row=8'b10111111;
            column=8'b00100100;
        end
        if(count%8==4'd2)
        begin
            row=8'b11011111;
            column=8'b01000010;
        end
        if(count%8==4'd3)
        begin
            row=8'b11101111;
            column=8'b11000011;
        end
        if(count%8==4'd4)
        begin
            row=8'b11110111;
            column=8'b01000010;
        end
        if(count%8==4'd5)
        begin
            row=8'b11111011;
            column=8'b01000010;
        end
        if(count%8==4'd6)
        begin
            row=8'b11111101;
            column=8'b01000010;
        end
        if(count%8==4'd7)
        begin
            row=8'b11111110;
            column=8'b01111110;
        end
    end
else
    begin
        if(count%8==4'd0)
        begin
            row=8'b01111111;
            column=8'b00011000;
        end
        if(count%8==4'd1)
        begin
            row=8'b10111111;
            column=8'b00011000;
        end
        if(count%8==4'd2)
        begin
            row=8'b11011111;
            column=8'b00111100;
        end
        if(count%8==4'd3)
        begin
            row=8'b11101111;
            column=8'b01111110;
        end
        if(count%8==4'd4)
        begin
            row=8'b11110111;
            column=8'b01011010;
        end
        if(count%8==4'd5)
        begin
            row=8'b11111011;
            column=8'b00011000;
        end
        if(count%8==4'd6)
        begin
            row=8'b11111101;
            column=8'b00100100;
        end
        if(count%8==4'd7)
        begin
            row=8'b11111110;
            column=8'b00100100;
        end
    end
end
endmodule

module displayLight(in,safe,light);
input [4:0] in;
input safe;
//display current LED light
output [2:0] light;
reg [2:0] light;

always@(in&&safe)
begin
    if(safe)
    begin
        //display green one
        if(in>=5'd13&&in<=5'd3) light=3'b100;
        //display yellow one
        else light=3'b010;
    end
    //display red one
    else light=3'b001;
end
endmodule

module lab11(reset,clk,out1,out10,row,column,light);
input reset,clk;

//display need to declear as output and wire
output [6:0]out1;
output [6:0]out10;
output [7:0]row;
output [7:0]column;
output [2:0]light;

wire [6:0]out1;
wire [6:0]out10;
wire [7:0]row;
wire [7:0]column;
wire [2:0]light;
//

//logic counter neeed to declear as reg
reg [31:0]count;
reg [4:0]second;
reg safe;
//

displayNumber DISNUM (.in(second),.out10(out10),.out1(out1));
displayGraph DISGPH (.safe(safe),.row(row),.column(column),.count(count));
displayLight DISLIT (.in(second),.safe(safe),.light(light));

always@(posedge clk,negedge reset)
begin
    if(reset)
    begin
        count<=32'd0;
        second<=5'd13;
        safe<=1'b1;
    end
    else
    begin
        if(count==`TimeExpire)
        begin
            count<=32'd0;
            if(second==5'd0&&safe==1'b1)
            begin
                second=5'd7;
                safe=1'b0;
            end
            else if(second==5'd0&&safe==1'b0)
            begin
                second=5'd13;
                safe=1'b1;
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
