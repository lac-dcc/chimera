// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module REGISTER_FILE_TB;

    parameter DATA_WIDTH = 32;
    parameter REG_DEPTH = 32;
    parameter ADD_WIDTH = 5;

    reg clk, reset_n, write_enable;
    reg [ADD_WIDTH - 1 : 0] read_address_1,read_address_2, write_address;
    reg [DATA_WIDTH - 1 : 0] write_data;
    wire [DATA_WIDTH - 1 : 0] read_data_1, read_data_2;

    REGISTER_FILE dut(.clk(clk),
                      .reset_n(reset_n),
                      .write_enable(write_enable),
                      .read_address_1(read_address_1),
                      .read_address_2(read_address_2),
                      .write_address(write_address),
                      .read_data_1(read_data_1),
                      .read_data_2(read_data_2),
                      .write_data(write_data));

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin

        reset_n = 0;
        write_enable = 1'bx;
        read_address_1 = 5'bxxxxx;
        read_address_2 = 5'bxxxxx;
        write_address = 5'bxxxxx;
        write_data = 32'hxxxx_xxxx;

        #5
        reset_n = 1; // Release reset
	#2
        reset_n = 0;
        write_enable = 1;
        read_address_1 = 31;
        read_address_2 = 16;

	#2
        reset_n = 1;
        #5
        // Test writing to a register
        write_address = 5;
        write_data = 32'hA5A5A5A5;
        read_address_1 = 6;
        read_address_2 = 4; // Unused address in this case

        #12
        write_enable = 0;

        #5
        // Read back from the register
        read_address_1 = 5;
        read_address_2 = 3; // Unused address in this case
        write_enable = 1;

        #7
        // Test reset behavior
        reset_n = 0;
        write_enable = 0;

        #7
        reset_n = 1;

        #7
        // Check if registers are cleared
        read_address_1 = 5;

        $finish;

    end

endmodule