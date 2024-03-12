module LED(clk,reset,LEDWe,LED_WD,LED_RD,lights);
//input
    input clk;
    input reset;

    input LEDWe;

    input [31:0] LED_WD;
//output
    output [31:0] LED_RD;

    output [31:0] lights;

//sequential logic
    reg [31:0] data;

    assign LED_RD=data;
    assign lights=~data;

    always @(posedge clk)
        begin
            if(reset)data<=32'hffffffff;
            else if(LEDWe)data<=LED_WD;
            else data<=data;
        end

endmodule