`timescale 1 ns / 1 ps
module testbench;


   reg clk = 1;
   always #5 clk = ~clk;


   wire LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8;

   wire [7:0] LEDS;

   assign LEDS = {LED8, LED7, LED6, LED5, LED4, LED3, LED2, LED1};
   

   wire dummy;
   reg  rdummy;
   always @(posedge clk) rdummy <= dummy;
   
   top soc ( .clk(clk),
	     .LED1(LED1),
	     .LED2(LED2),
	     .LED3(LED3),
	     .LED4(LED4),
	     .LED5(LED5),
	     .LED6(LED6),
	     .LED7(LED7),
	     .LED8(LED8),
             .RXD(1'b0),
             .TXD(dummy),
             .rst(1'b1)
             );
   

   	initial begin
	   $monitor("%x", LEDS);
	   repeat (400000) @(posedge clk);
	   $finish;
	end

endmodule
