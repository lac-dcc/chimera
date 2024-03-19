`timescale 1ns / 1ps

module q7segIO(
        input [31:0] addr,
        inout [31:0] data,
        input wr,
        input clk
    );
    
reg data_out;
reg [3:0] DCBA0;
reg [3:0] DCBA1;
reg [3:0] DCBA2;
reg [3:0] DCBA3;
reg [3:0] swA;
reg [3:0] swB;
reg [3:0] swOP;

wire seg,dp,an0,an1,an2,an3,num0,num1,num2,num3;

//buffer high impedance
assign data = (wr == 0) ? data_out :32'bz;

//q7seg component
quad7seg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,clk);
 
always @(posedge clk)
begin
    //write
    if(wr) 
        begin
        //map six address
            if(addr == 32'h0000FFF0) begin
                DCBA0 = data;
            end
            else if (addr == 32'h0000FFF4) begin
                DCBA1 = data;
            end
            else if (addr == 32'h0000FFF8) begin
                DCBA2 = data;
            end
            else if (addr == 32'h0000FFFC) begin
                DCBA3 = data;
            end
            else if (addr == 32'h0000FFE0) begin
                swA = data;
            end
            else if (addr == 32'h0000FFE4) begin
                swB = data;
            end
            else if (addr == 32'h0000FFE8) begin
                swOP = data;
            end
        end
    //read
    else if (!wr) 
        begin
        //map six address
            if(addr == 32'h0000FFF0) begin
                data_out = DCBA0;
            end
            else if (addr == 32'h0000FFF4) begin
                data_out = DCBA1;
            end
            else if (addr == 32'h0000FFF8) begin
                data_out = DCBA2;
            end
            else if (addr == 32'h0000FFFC) begin
                data_out = DCBA3;
            end
            else if (addr == 32'h0000FFE0) begin
                data_out = swA;
            end
            else if (addr == 32'h0000FFE4) begin
                data_out = swB;
            end
            else if (addr == 32'h0000FFE8) begin
                data_out = swOP;
            end
        end
end

endmodule
