// An active low reset signal is used for resetting the counter.
module counter (input clk, input rstn, output reg[3:0] out);
    always @ (posedge clk) begin
    if (! rstn)
        out <= 0;
    else 
        out <= out + 1;
    end
endmodule

module tb_counter;
    reg clk;
    reg rstn;
    wire [3:0] out;
 
    counter c0(.clk(clk), .rstn (rstn), .out (out));

// Generate a clock that should be driven to design
// This clock will flip its value every 5ns -> time period = 10ns -> freq = 100 MHz
    always #5 clk = ~clk;

    initial
    begin
    $dumpfile("vcd/FourBitCounter.vcd");
    $dumpvars(0,tb_counter);

    $display("Clock \t Reset \t Output");
    $monitor("%b %b %b", clk, rstn, out);

        clk <= 0;
        rstn <= 0;
 
        #20   rstn <= 1;
        #80   rstn <= 0;
        #50   rstn <= 1;
        #20
    $finish;
    end
endmodule
