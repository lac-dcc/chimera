module Switch(clk,reset,ADDR,Switch_WD,IRQ,Switch_RD);
//input
    input clk;
    input reset;

    input [31:0] ADDR;
    input [63:0] Switch_WD;

//output
    output reg IRQ;

    output reg [31:0] Switch_RD;

//sequential logic
    reg [63:0] data;

    always @(*)
        begin
            if(ADDR==32'h0000_7f2c)Switch_RD=data[31:0];
            else if(ADDR==32'h0000_7f30)Switch_RD=data[63:32];
            else Switch_RD=32'h18373531;
        end

    always @(posedge clk)
        begin
            if(reset)
                begin
                    data<=0;
                    IRQ<=0;
                end
            else if(data!=~Switch_WD)
                begin
                    data<=~Switch_WD;   //Switch_WD's bit is 1 when flip is pulled down
                    IRQ<=1;
                end
            else
                begin
                    data<=data;
                    IRQ<=0;
                end
        end

endmodule