// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux_16x1_tb;

// Parameters
parameter WIDTH = 16; // Data width
parameter SEL_WIDTH = 4; // Selection width

// Inputs
reg [WIDTH-1:0] data_in;
reg [SEL_WIDTH-1:0] select;

// Output
wire data_out;

// Instantiate the mux_16x1 module
mux_16x1 uut (
    .data_in(data_in),
    .select(select),
    .data_out(data_out)
);

// Monitor statements for displaying input and output values
initial begin
    $monitor("Time = %0t: data_in = %b, select = %b, data_out = %b", $time, data_in, select, data_out);
end

// Stimulus
initial begin
    // Initialize inputs
    data_in = 16'b0;
    select = 4'b0000;
    
    // Apply test cases
    #10 data_in = 16'b1010101010101010; // Input data
    #10 select = 4'b0001; // Select input 1
    
    #10 select = 4'b0010; // Select input 2
    
    #10 select = 4'b0011; // Select input 3
    
    // Add more test cases as needed...
    
    // End simulation
    #10 $finish;
end

// Dump VCD file
initial begin
    $dumpfile("mux_16x1_tb.vcd");
    $dumpvars(0, mux_16x1_tb);
end

endmodule
