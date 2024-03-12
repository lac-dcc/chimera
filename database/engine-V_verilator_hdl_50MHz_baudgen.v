// from fpga4fun

module baudgen #(
	parameter ClkFrequency = 50000000, // 50MHz
	parameter Baud = 115200*4,
	parameter BaudGeneratorAccWidth = 16,
	parameter BaudGeneratorInc = ((Baud<<(BaudGeneratorAccWidth-4))+(ClkFrequency>>5))/(ClkFrequency>>4)
) (
	clk, 
	tick
);

input clk;
output tick;

reg [BaudGeneratorAccWidth:0] BaudGeneratorAcc;
always @(posedge clk)
  BaudGeneratorAcc <= BaudGeneratorAcc[BaudGeneratorAccWidth-1:0] + BaudGeneratorInc;

wire BaudTick = BaudGeneratorAcc[BaudGeneratorAccWidth];

assign tick = BaudTick;

endmodule;