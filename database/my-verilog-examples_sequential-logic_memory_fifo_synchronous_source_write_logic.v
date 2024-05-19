// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A synchronous fifo write logic

module write_logic (
    input       we,              // Write enable
    input       full,            // Full
    output reg  w_next);         // Write next

    //If FIFO full write counter should not increment
    always @(*) begin
        if (we && (!full))
            w_next=1;
        else
            w_next=0;
    end

endmodule