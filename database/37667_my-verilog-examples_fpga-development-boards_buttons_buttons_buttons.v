// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A few different ways to use buttons on a FPGA development board.

// BUTTON 1 --------------------------------------------------------
// PRESS AND RELEASE OF THE BUTTON SYNCHRONOUSLY (SYNCHRONOUS PRESS AND RELEASE)
module button1_sync_push_release_behavioral (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN
    output reg      out);           // PULSE FOR 1 CLOCK CYCLE

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk) begin
            if (pressed) begin          // BUTTON PRESSED
                out <= 1'b1;
            end else begin              //  BUTTON NOT PRESSED
                out <= 1'b0;
            end
    end

endmodule

// BUTTON 2 --------------------------------------------------------
// PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED (SYNCHRONOUS PRESS)
module button2_sync_clock_pulse_behavioral (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output reg      out);           // PULSE FOR 1 CLOCK CYCLE

    reg lock = 0;

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk) begin
            if (pressed & ~lock) begin              // BUTTON PRESSED
                lock <= 1'b1;                       // - Lock
                out <= 1'b1;                        // - Pulse
            end else if (~pressed & lock) begin     // RELEASE LOCK
                lock <= 1'b0;
                out <= 1'b0;
            end else begin
                out <= 1'b0;
            end
    end

endmodule

// BUTTON 3 --------------------------------------------------------
// TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW (SYNCHRONOUS PRESSES)
module button3_sync_two_presses_behavioral (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output          out);           // TWO PRESSES

    reg lock = 0;
    reg toggle = 0;

    assign out = toggle;

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (pressed & ~lock) begin              // BUTTON PRESSED
            lock <= 1'b1;                       // - Lock
            toggle <= ~toggle;                  // - Toggle
        end else if (~pressed & lock) begin     // WAIT TILL BUTTON RELEASED
            lock <= 1'b0;                       // - Release Lock
        end
    end

endmodule

//************************************************************************************************
// DON'T USE THESE, THE SYNTHSIS TOOL WILL YELL AT YOU. I DESIGNED THEM FOR FUN

// BUTTON 4 --------------------------------------------------------
// PULSE HIGH FOR 1 CLOCK CYCLE WHEN BUTTON PRESSED (ASYNCHRONOUS PRESS)
// DON'T USE - HERE FOR FUN
module button4_async_clock_pulse_behavioral (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output          out);           // PULSE FOR 1 CLOCK CYCLE

    reg was_pressed = 0;
    reg lock = 0;
    reg pre_out = 0;

    assign out = pre_out;

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk or posedge pressed) begin
        if (pressed & ~was_pressed & ~lock) begin       // BUTTON PRESSED - Then forget about it until later
            was_pressed <= 1'b1;
        end else if (was_pressed & ~lock) begin         // OUT HIGH
            lock <= 1;
            was_pressed <= 0;
            pre_out <= 1'b1;
        end else if (lock & out) begin                  // OUT LOW
            pre_out <= 1'b0;
        end else if (~pressed & lock) begin             // WAIT TILL BUTTON RELEASED
            lock <= 1'b0;
        end
    end

endmodule

// BUTTON 5 --------------------------------------------------------
// TWO PRESSES - FIRST PRESS HIGH, SECOND PRESS LOW (ASYNCHRONOUS PRESSES)
// DON'T USE - HERE FOR FUN
module button5_async_two_presses_behavioral (
    input           clk,            // CLOCK
    input           pressed,        // BUTTON IN (YOU CAN HOLD AND RELEASE WHENEVER)
    output          out);           // PULSE FOR 1 CLOCK CYCLE

    reg was_pressed = 0;
    reg lock = 0;
    reg toggle = 0;

    assign out = toggle;

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @(posedge clk or posedge pressed) begin
        if (pressed & ~was_pressed & ~lock) begin       // BUTTON PRESSED - Then forget about it for now
            was_pressed <= 1'b1;
        end else if (was_pressed & ~lock) begin         // OUT HIGH
            toggle <= ~toggle;                          // - toggle
            was_pressed <= 1'b0;
            lock <= 1;
        end else if (~pressed & lock) begin             // WAIT TILL BUTTON RELEASED
            lock <= 1'b0;
        end
    end

endmodule
