// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// A function performs a calculation and returns a single value (i.e. has only 1 output)
// A function can only have one output (return value)
// Functions cannot include timing delays. They are purely combinational
// Functions are suitable for combinational logic where you need to compute a value based on inputs

module function_example;
    // Declare a function called "addition"
    function int addition(input int x, y);
        return x + y; // Perform the addition and return the result
    endfunction

    initial begin
        int result;
        // Call the "addition" function and store the result
        result = addition(5, 7);
        $display("Result of addition: %d", result);
    end
endmodule
