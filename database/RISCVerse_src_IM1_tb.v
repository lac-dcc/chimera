// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License


module IM1_tb;

    // Parameters
    parameter data_width = 32;
    parameter addr_width = 32;

    // Inputs
    reg clk;
    reg rst;
    reg mem_en;
    reg rd_wr; // 1 for read, 0 for write
    reg [addr_width-1:0] read_addr;
    reg [addr_width-1:0] write_addr;
    reg [data_width-1:0] write_data;

    // Outputs
    wire [data_width-1:0] read_data;

    // Instantiate the IM module
    IM1 #(
        .data_width(data_width),
        .addr_width(addr_width)
    ) uut (
        .clk(clk),
        .rst(rst),
        .mem_en(mem_en),
        .rd_wr(rd_wr),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data(read_data)
    );

	
    initial begin 
	$dumpfile("IM1.vcd");
	$dumpvars(0);
	end  

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        rst = 1;
        mem_en = 0;
        rd_wr = 0;
        read_addr = 0;
        write_addr = 0;
        write_data = 0;

        // Reset the system
        #10;
        rst = 0;

        // Write data to memory
        #20;
        rst = 1;
        mem_en = 1;
        rd_wr = 0; // Write operation
        read_addr = 0;
        write_addr = 32'h00000002;
        write_data = 32'h12345678;
        
        #20;
        read_addr = 32'h00000003;
        write_addr = 32'h00000008;
        write_data = 32'hAABBCCDD;
        #20;
        mem_en = 0;

        // Read data from memory
        #20;
        mem_en = 1;
        rd_wr = 1; // Read operation
        #20;
        
        read_addr = 32'h00000008;
	#20;
	
	read_addr = 32'h00000004;
	#20;
	
	mem_en = 1;
        rd_wr = 0; 
        #20;
        
        mem_en = 0;
	rd_wr = 0; 
        #20;
        
        // End of test
        #40;
        $stop;
    end

endmodule
