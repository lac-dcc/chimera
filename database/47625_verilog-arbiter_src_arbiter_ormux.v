// This program was cloned from: https://github.com/bmartini/verilog-arbiter
// License: MIT License

/**
 * Module: arbiter
 *
 * Description:
 *  A look ahead, round-robing parametrized arbiter.
 *
 * <> request
 *  each bit is controlled by an actor and each actor can 'request' ownership
 *  of the shared resource by bring high its request bit.
 *
 * <> grant
 *  when an actor has been given ownership of shared resource its 'grant' bit
 *  is driven high
 *
 * <> active
 *  is brought high by the arbiter when (any) actor has been given ownership
 *  of shared resource.
 *
 *
 * Created: Sat Jun  1 20:26:44 EDT 2013
 *
 * Author:  Berin Martini // berin.martini@gmail.com
 */
`ifndef _arbiter_ `define _arbiter_


module arbiter
  #(parameter
    NUM_PORTS = 6)
   (input                       clk,
    input                       rst,
    input      [NUM_PORTS-1:0]  request,
    output reg [NUM_PORTS-1:0]  grant,
    output reg                  active
);


    /**
     * Local parameters
     */

    localparam WRAP_LENGTH = 2*NUM_PORTS;

`ifdef VERBOSE
    initial $display("Bus arbiter with %d units", NUM_PORTS);
`endif


    /**
     * Internal signals
     */

    wire                    next;
    wire [NUM_PORTS-1:0]    order;
    wire [NUM_PORTS-1:0]    order_right;
    wire [NUM_PORTS-1:0]    gate;

    reg  [NUM_PORTS-1:0]    token;
    wire [NUM_PORTS-1:0]    token_nx;
    wire [NUM_PORTS-1:0]    token_lookahead [NUM_PORTS-1:0];
    wire [WRAP_LENGTH-1:0]  token_wrap;

    wire [NUM_PORTS-1:0]    token_gated     [0:NUM_PORTS-1];
    wire [NUM_PORTS-1:0]    invert          [0:NUM_PORTS-1];

    /**
     * Implementation
     */

    assign token_wrap   = {token, token};

    assign next         = ~|(token & request);

    assign order_right  = (order_right>>1) | order;

    assign gate         = (order_right>>1) ^ order_right;


    always @(posedge clk)
        grant <= token & request;


    always @(posedge clk)
        active <= |(token & request);


    always @(posedge clk)
        if      (rst)               token <= 'b1;
        else if (next & |(gate))    token <= token_nx;


    genvar xx;
    genvar zz;
    generate
        for (xx = 0; xx < NUM_PORTS; xx = xx + 1) begin : ORDER_

            assign token_lookahead[xx]  = token_wrap[xx +: NUM_PORTS];

            assign order[xx]            = |(token_lookahead[xx] & request);

            assign token_gated[xx]      = gate[xx] ? token_lookahead[xx] : {NUM_PORTS{1'b0}};

            assign token_nx[xx]         = |(invert[xx]);


            for (zz = 0; zz < NUM_PORTS; zz=zz+1) begin : INVERT_
                assign invert[xx][zz] = token_gated[zz][xx];
            end
        end
    endgenerate


endmodule

`endif //  `ifndef _arbiter_
