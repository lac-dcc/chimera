/**
 * Module: timer
 *
 * Description:
 *  A parametrized timer used with the arbiter to time limit a connection to
 *  the arbiter. Interface is a 3 way handshake. 'Request' asks for ownership of
 *  shared resource. 'Grant' indicates that ownership has been given.
 *  'Acknowledge' is used to indicate that an actor is set to use the shared
 *  resource.
 *
 * Created:
 *  Sun Jun  2 16:23:21 EDT 2013
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _timer_ `define _timer_


module timer
  #(parameter
    TIMEOUT = 100)
   (input       clk,
    input       rst,

    input       up_req,
    output      up_grant,
    input       up_ack,

    output      down_req,
    input       down_grant,
    output      down_ack
);


    /**
     * Local parameters
     */

`ifdef VERBOSE
    initial $display("Bus timer with timeout %d", TIMEOUT);
`endif


    /**
     * Internal signals
     */

    wire        timeout;
    reg  [31:0] counter;


    /**
     * Implementation
     */

    assign up_grant = down_grant;

    assign down_ack = up_ack;

    assign timeout = (TIMEOUT == counter);

    assign down_req = up_req & ~timeout;


    always @(posedge clk)
        if (rst) counter <= 'b0;
        else begin
            counter <= 'b0;

            if (down_grant & ~timeout) begin
                counter <= counter + 1'b1;
            end
        end


endmodule

`endif //  `ifndef _timer_
