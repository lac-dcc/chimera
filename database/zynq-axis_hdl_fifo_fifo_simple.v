/**
 * Module:
 *  fifo_simple
 *
 * Description:
 *  A simple FIFO, with synchronous clock for both the pop and push ports.
 *
 * Testbench:
 *  fifo_simple_tb.v
 *
 * Created:
 *  Sun Nov 30 13:39:40 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _fifo_simple_
`define _fifo_simple_


module fifo_simple
  #(parameter
    DATA_WIDTH  = 16,
    ADDR_WIDTH  = 16)
   (input                           clk,
    input                           rst,

    output reg  [ADDR_WIDTH:0]      count,
    output reg                      full,
    output reg                      full_a,
    output reg                      empty,
    output reg                      empty_a,

    input                           push,
    input       [DATA_WIDTH-1:0]    push_data,

    input                           pop,
    output reg  [DATA_WIDTH-1:0]    pop_data
);

    /**
     * Local parameters
     */

    localparam DEPTH = 1<<ADDR_WIDTH;


`ifdef VERBOSE
    initial $display("fifo sync with depth: %d", DEPTH);
`endif


    /**
     * Internal signals
     */

    reg  [DATA_WIDTH-1:0]       mem [0:DEPTH-1];

    reg  [ADDR_WIDTH:0]         push_ptr;
    wire [ADDR_WIDTH:0]         push_ptr_nx;
    reg  [ADDR_WIDTH:0]         pop_ptr;
    wire [ADDR_WIDTH:0]         pop_ptr_nx;

    wire [ADDR_WIDTH-1:0]       push_addr;
    wire [ADDR_WIDTH-1:0]       push_addr_nx;
    wire [ADDR_WIDTH-1:0]       pop_addr;
    wire [ADDR_WIDTH-1:0]       pop_addr_nx;

    wire                        full_nx;
    wire                        empty_nx;

    wire                        full_a_nx;
    wire [ADDR_WIDTH-1:0]       push_addr_a_nx;
    wire [ADDR_WIDTH:0]         push_ptr_a_nx;
    wire                        empty_a_nx;
    wire [ADDR_WIDTH-1:0]       pop_addr_a_nx;
    wire [ADDR_WIDTH:0]         pop_ptr_a_nx;


    /**
     * Implementation
     */

    assign push_addr    = push_ptr      [ADDR_WIDTH-1:0];

    assign push_addr_nx = push_ptr_nx   [ADDR_WIDTH-1:0];

    assign pop_addr     = pop_ptr       [ADDR_WIDTH-1:0];

    assign pop_addr_nx  = pop_ptr_nx    [ADDR_WIDTH-1:0];


    // full next
    assign full_nx  = (push_addr_nx == pop_addr) & (push_ptr_nx[ADDR_WIDTH] != pop_ptr[ADDR_WIDTH]);

    // almost full next
    assign push_ptr_a_nx    = push_ptr_nx + 1;

    assign push_addr_a_nx   = push_ptr_a_nx[0 +: ADDR_WIDTH];

    assign full_a_nx =
        (push_addr_a_nx == pop_addr) & (push_ptr_a_nx[ADDR_WIDTH] != pop_ptr[ADDR_WIDTH]);


    // empty next
    assign empty_nx = (push_addr == pop_addr_nx) & (push_ptr[ADDR_WIDTH] == pop_ptr_nx[ADDR_WIDTH]);

    // almost empty next
    assign pop_ptr_a_nx     = pop_ptr_nx + 1;

    assign pop_addr_a_nx    = pop_ptr_a_nx[0 +: ADDR_WIDTH];

    assign empty_a_nx =
        (push_addr == pop_addr_a_nx) & (push_ptr[ADDR_WIDTH] == pop_ptr_a_nx[ADDR_WIDTH]);


    // pop next
    assign pop_ptr_nx   = pop_ptr + {{ADDR_WIDTH-1{1'b0}}, (pop & ~empty)};

    // push next
    assign push_ptr_nx  = push_ptr + {{ADDR_WIDTH-1{1'b0}}, (push & ~full)};


    // registered population count.
    always @(posedge clk)
        if (rst) begin
            count <= 'b0;
        end
        else begin
            if (push_ptr[ADDR_WIDTH] == pop_ptr_nx[ADDR_WIDTH]) begin
                count <= (push_addr - pop_addr_nx);
            end
            else begin
                count <= DEPTH - pop_addr_nx + push_addr;
            end
        end


    // registered full flag
    always @(posedge clk)
        if (rst)    full    <= 1'b0;
        else        full    <= full_nx;


    // almost full flag
    always @(posedge clk)
        if (rst)    full_a  <= 1'b0;
        else        full_a  <= full_a_nx | full_nx;


    // registered empty flag
    always @(posedge clk)
        if (rst)    empty   <= 1'b1;
        else        empty   <= empty_nx;


    // almost empty flag
    always @(posedge clk)
        if (rst)    empty_a <= 1'b1;
        else        empty_a <= empty_a_nx | empty_nx;


    // memory read-address pointer
    always @(posedge clk)
        if (rst)    pop_ptr <= 0;
        else        pop_ptr <= pop_ptr_nx;


    // read from memory
    always @(posedge clk)
        if (pop & ~empty) pop_data <= mem[pop_addr];


    // memory write-address pointer
    always @(posedge clk)
        if (rst)    push_ptr    <= 0;
        else        push_ptr    <= push_ptr_nx;


    // write to memory
    always @(posedge clk)
        if (push & ~full) mem[push_addr] <= push_data;



endmodule

`endif //  `ifndef _fifo_simple_
