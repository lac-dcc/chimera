// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

// A task is a procedural construct that executes a sequence of statements
// A task doesn’t return a value
// A task can have a zero to unlimited number of outputs (output arguments)
// Tasks can contain time-controlling statements (such as #, wait, etc.)
// Tasks are commonly used for procedural blocks with input/output statements

module task_example;
    // Declare a task called "compare"
    task compare(input int a, b);
        if (a > b)
            $display("a is greater than b");
        else if (a < b)
            $display("a is less than b");
        else
            $display("a is equal to b");
    endtask

    initial begin
        // Call the "compare" task with different arguments
        compare(10, 10);
        compare(5, 9);
        compare(9, 5);
    end

endmodule
