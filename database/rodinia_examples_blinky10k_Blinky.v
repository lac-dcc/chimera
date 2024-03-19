module Blinky(
	input wire clk,
   output wire[7:0] bank0,
   output wire[7:0] bank1,
   output wire[7:0] bank2,
   output wire[7:0] bank3
);

reg [31:0] counter;
//reg [35:0] data;

//prom mem(.clka(clk), .clkb(1'b0), .addra({6'b0, counter[6:0]}), .addrb(7'b0), .douta(data), .wea(1'b0), .dina({36'b0}));

assign bank0 = counter[7:0];
assign bank1 = counter[15:8];
assign bank2 = counter[23:16];
assign bank3 = counter[31:24];

always @(posedge clk) begin
        counter <= counter + 1;
end

endmodule
