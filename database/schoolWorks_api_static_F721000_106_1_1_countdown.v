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

module displayLight(safe,light);
input safe;
//display current LED light
output [2:0] light;
reg [2:0] light;

always@(safe)
begin
    //display one
    if(safe) light=3'b100;
    //display another one
    else light=3'b001;
end
endmodule

module countdown(reset,clk,out1,out10,light);
input reset,clk;

//display need to declear as output and wire
output [6:0]out1;
output [6:0]out10;
output [2:0]light;

wire [6:0]out1;
wire [6:0]out10;
wire [2:0]light;
//

//logic counter neeed to declear as reg
reg [31:0]count;
reg [7:0]second;
reg safe;
//

displayNumber DISNUM (.in(second),.out10(out10),.out1(out1));
displayLight DISLIT (.safe(safe),.light(light));

always@(posedge clk,negedge reset)
begin
    if(reset)
    begin
        count<=32'd0;
        second<=`countdownTime;
        safe<=1'b1;
    end
    else
    begin
        if(count==`TimeExpire)
        begin
            count<=32'd0;
            if(second==5'd0)
            begin
                second=5'd7;
                safe=1'b0;
            end
            else second=second-1'b1;
        end
        else count<=count+32'd1;
    end
end
endmodule
