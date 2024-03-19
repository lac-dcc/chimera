`timescale 1ns / 1ps


module mockIO(
        output seg,
        output dp,
        output an,
        input wr,
        input clock,
        input [15:0] address,
        inout [31:0] data,
        input [11:0] sw
    );

reg [3:0] DCBA0,DCBA1,DCBA2,DCBA3;
wire [3:0] A,B,OP;
wire [18:0] tclk;
wire targetClk;
wire num0,num1,num2,num3;

reg	[31:0]	data_out;
// Tri-State buffer
assign data=(wr==0) ? data_out:32'bz;

assign tclk[0] = clock;
genvar c;
generate for(c=0;c<18;c=c+1)
begin
    clockDiv fdiv(tclk[c+1],tclk[c]);
end endgenerate
clockDiv fdivTarget(targetClk,tclk[18]);

assign num0 = DCBA0;
assign num1 = DCBA1;
assign num2 = DCBA2;
assign num3 = DCBA3;
assign an = {an3,an2,an1,an0};

quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);

assign A = sw[3:0];
assign B = sw[7:4];
assign OP = sw[11:8];

//decode address 
always @(posedge clock)
begin
    if(wr)
        begin
            if(address == 16'hFFF0) begin 
                DCBA0 = data[3:0];
            end
            else if (address == 16'hFFF4) begin
                DCBA1 = data[3:0];
            end
            else if (address == 16'hFFF8) begin
                DCBA2 = data[3:0];
            end
            else if (address == 16'hFFFC) begin
                DCBA3 = data[3:0];
            end
//            else if (address == 16'hFFE0) begin
//                A = data[3:0];
//            end
//            else if (address == 16'hFFE4) begin
//            end
//            else if (address == 16'hFFE8) begin
//            end
        end
    else if(!wr) 
        begin
            if(address == 16'hFFF0) begin 
                data_out = {28'b0,DCBA0};
            end
            else if (address == 16'hFFF4) begin
                data_out = {28'b0,DCBA1};
            end
            else if (address == 16'hFFF8) begin
                data_out = {28'b0,DCBA2};
            end
            else if (address == 16'hFFFC) begin
                data_out = {28'b0,DCBA3};
            end
            else if (address == 16'hFFE0) begin
                data_out = {28'b0,A};
            end
            else if (address == 16'hFFE4) begin
                data_out = {28'b0,B};
            end
            else if (address == 16'hFFE8) begin
                data_out = {28'b0,OP};
            end
        end
end

    
endmodule
