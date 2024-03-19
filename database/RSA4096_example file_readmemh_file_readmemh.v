// Verilog code example for file operations
// module declaration
// FROM THIS WEBPAGE: http://fullchipdesign.com/readmemh.htm
module file_readmemh(
	input clk,
	input addr,
	output reg [19:0] data2
	);
/* Declare a array 4 word deep 20 locations wide for 20/4 = 5 hexadecimal words */ 
reg [19:0] data [0:3];
// initialize the hexadecimal reads from the vectors.txt file
initial $readmemh("vectors.txt", data);

parameter MEM_SIZE = 1024;
reg [7:0] mem [0:MEM_SIZE -1];
integer k;

initial
begin
for (k = 0; k < MEM_SIZE - 1; k = k + 1)
begin
mem[k] = 2'h00;
end
end


/* declare an integer for the conditional
statement to read values from test file */
integer i;
/*read and display the values from the text file on screen*/ 
initial begin
        $display("rdata:");
        for (i=0; i < 4; i=i+1)
        $display("%d:%h",i,data[i]);
end     

always @ (posedge clk) begin	
	data2 <= data[0];
end

endmodule 