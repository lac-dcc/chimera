// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module gpio_tb ();
    
reg clk, reset, read, write,
    pin1, pin2, pin3;
wire [4:0] gpios;
reg [31:0] address, write_data;
wire [31:0] read_data;

always #1 clk = ~clk;

GPIOS #(
    .WIDHT(5)
) GPIOS(
    .clk(clk),
    .reset(reset),
    .read(read),
    .write(write),
    .address(address),
    .write_data(write_data),
    .read_data(read_data),
    .gpio(gpios)
);

assign gpios[4] = pin3;
assign gpios[2] = pin2;
assign gpios[0] = pin1;

initial begin
    $dumpfile("build/gpio.vcd");
    $dumpvars;

    clk = 1'b0;
    reset = 1'b1;
    address = 32'h00000000;
    write_data = 32'h00000000;
    pin1 = 1'b0;
    pin2 = 1'b0;
    pin3 = 1'b0;
    write = 1'b0;
    read = 1'b0;

    #5

    reset = 1'b0;

    #2

    write_data = 32'b00000000000000000000000000010101;
    write = 1'b1;

    #2
    write = 1'b0;

    #4

    write_data = 32'b10000000000000000000000000011111;
    write = 1'b1;

    #2

    write = 1'b0;

    #4

    pin1 = 1'b1;
    pin3 = 1'b1;

    #2

    write_data = 32'b10000000000000000000000000000000;
    write = 1'b1;

    #2

    write = 1'b0;

    #4

    $finish;
end

endmodule
