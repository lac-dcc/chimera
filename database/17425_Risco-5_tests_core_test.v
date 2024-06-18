// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module core_tb();

reg clk, reset;
wire memory_read, memory_write, slave_read, slave_write,
    slave1_read, slave1_write;
wire [31:0] address, write_data, read_data,
    slave_address, slave_write_data, slave_read_data,
    slave1_address, slave1_write_data, slave1_read_data;

always #1 clk = ~clk;

Core #(
    .BOOT_ADDRESS(32'h00000000)
) Core(
    .clk(clk),
    .reset(reset),
    .memory_read(memory_read),
    .memory_write(memory_write),
    .write_data(write_data),
    .read_data(read_data),
    .address(address)
);

Memory #(
    .MEMORY_FILE("software/memory/lw.hex"),
    .MEMORY_SIZE(4096)
) Memory(
    .clk(clk),
    .reset(reset),
    .memory_read(slave_read),
    .memory_write(slave_write),
    .write_data(slave_write_data),
    .read_data(slave_read_data),
    .address(slave_address)
);

BUS Bus(
    .read(memory_read),
    .write(memory_write),
    .write_data(write_data),
    .read_data(read_data),
    .address(address),

    .slave_0_read(slave_read),
    .slave_0_write(slave_write),
    .slave_0_read_data(slave_read_data),
    .slave_0_address(slave_address),
    .slave_0_write_data(slave_write_data),

    .slave_1_read(slave1_read),
    .slave_1_write(slave1_write),
    .slave_1_read_data(slave1_read_data),
    .slave_1_address(slave1_address),
    .slave_1_write_data(slave1_write_data)
);

LEDs Leds(
    .clk(clk),
    .reset(reset),
    .read(slave1_read),
    .write(slave1_write),
    .write_data(slave1_write_data),
    .read_data(slave1_read_data),
    .address(slave1_address)
);

initial begin
    $dumpfile("build/core.vcd");
    $dumpvars;

    clk = 1'b0;
    reset = 1'b1;
    #6
    reset = 1'b0;
    #120

    $finish;
end

endmodule
