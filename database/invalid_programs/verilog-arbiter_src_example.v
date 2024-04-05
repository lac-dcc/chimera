/**
 * Module: example
 *
 * Description:
 *  A parametrized example that uses the arbiter and timers. The 'request'
 *  asks for ownership of shared resource. The 'grant' indicates that
 *  ownership has been given. The 'active' is high when an actor (any actor)
 *  has been granted ownership.
 *
 * Created:
 *  Sun Jun  2 16:23:21 EDT 2013
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _example_ `define _example_

`include "timer.v"
`include "arbiter.v"

module example
  #(parameter
    NUM_PORTS   = 3,
    TIMEOUT     = 10)
   (input                       clk,
    input                       rst,

    input       [NUM_PORTS-1:0] request,
    output      [NUM_PORTS-1:0] grant,

    output                      active
);


    /**
     * Local parameters
     */

`ifdef VERBOSE
    initial $display("Bus example with timeout %d", TIMEOUT);
`endif


    /**
     * Internal signals
     */

    wire [NUM_PORTS-1:0]  timed_req;
    wire [NUM_PORTS-1:0]  timed_grant;



    /**
     * Implementation
     */


    arbiter #(
        .NUM_PORTS (NUM_PORTS))
    arbiter_ (
        .clk       (clk),
        .rst       (rst),
        .request   (timed_req),
        .grant     (timed_grant),
        .active    (active)
    );


    genvar xx;
    generate
        for (xx = 0; xx < NUM_PORTS; xx = xx + 1) begin : TIMER_

            timer #(
                .TIMEOUT (TIMEOUT))
            timer_ (
                .clk       (clk),
                .rst       (rst),

                .up_req     (request[xx]),
                .up_grant   (grant[xx]),
                .up_ack     (),

                .down_req   (timed_req[xx]),
                .down_grant (timed_grant[xx]),
                .down_ack   ()
            );

        end
    endgenerate



endmodule

`endif //  `ifndef _example_
