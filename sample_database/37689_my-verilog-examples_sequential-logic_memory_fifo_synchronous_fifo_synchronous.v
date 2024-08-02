// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A synchronous fifo.

module fifo_synchronous_structural(
    input  clk,             // Clock
    input  rst,             // Reset
    // PUSH
    input  [7:0] data_in,   // DATA In
    input  push,            // Push/Write enable
    output full,            // Full
    // POP
    output [7:0] data_out,  // DATA Out
    input  pop,             // Pop/Read enable
    output empty);          // Empty

    //FIFO
    // parameter DATA_WIDTH = 8;
    // parameter ADDR_WIDTH = 4;
    // parameter RAM_DEPTH = (1 << ADDR_WIDTH);

    // DATA TYPES
    wire [3:0] w_ptr;
    wire [3:0] r_ptr;
    wire       w_next;
    wire       r_next;
    parameter  zeros = 8'h00;
    parameter  zero =   1'b0;

    // 16x8 dual port RAM
    dual_port_ram_synchronous_behavioral dual_port_ram_synchronous(
        .clk(clk),           
        .we_A(push),
        .we_B(zero),
        .addr_A(w_ptr),
        .addr_B(r_ptr),
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

    write_ptr write_ptr(
        .clk(clk),
        .rst(rst),
        .w_next(w_next),
        .w_ptr(w_ptr)
    );

    read_ptr read_ptr(
        .clk(clk),
        .rst(rst),
        .r_next(r_next),
        .r_ptr(r_ptr)
    );

    compare_and_status_logic compare_and_status_logic(
        .w_ptr(w_ptr),
        .full(full),
        .r_ptr(r_ptr),
        .empty(empty)
    );

endmodule