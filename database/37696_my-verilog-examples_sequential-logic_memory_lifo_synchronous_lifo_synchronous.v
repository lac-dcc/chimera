// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A synchronous fifo.

module lifo_synchronous_structural(
    input  clk,             // Clock
    input  rst,             // Reset
    input  [7:0] data_in,   // DATA In
    input  push,            // Write enable
    output full,            // Full
    output [7:0] data_out,  // DATA Out
    input  pop,             // Read enable
    output empty);          // Empty

    //FIFO
    // parameter DATA_WIDTH = 8;
    // parameter ADDR_WIDTH = 4;
    // parameter RAM_DEPTH = (1 << ADDR_WIDTH);

    // DATA TYPES
    wire [3:0] wrt_ptr, rd_ptr;
    wire       w_next;
    wire       r_next;
    parameter  zeros = 8'h00;
    parameter  zero =   1'b0;

    // 16x8 dual port RAM
    dual_port_ram_synchronous_behavioral dual_port_ram_synchronous(
        .clk(clk),           
        .we_A(push),
        .we_B(zero),
        .addr_A(wrt_ptr),
        .addr_B(rd_ptr),
        .data_in_A(data_in),
        .data_in_B(zeros),
        .data_out_A(),
        .data_out_B(data_out)
    );

    write_logic write_logic(
        .we(push),
        .full(full),
        .w_next(w_next)
    );

    read_logic read_logic(
        .re(pop),
        .empty(empty),
        .r_next(r_next)
    );

    stack_ptr_control stack_ptr_control(
        .clk(clk),
        .rst(rst),
        .w_next(w_next),
        .r_next(r_next),
        .wrt_ptr(wrt_ptr),
        .rd_ptr(rd_ptr)
    );

    compare_and_status_logic compare_and_status_logic(
        .wrt_ptr(wrt_ptr),
        .full(full),
        .empty(empty)
    );

endmodule