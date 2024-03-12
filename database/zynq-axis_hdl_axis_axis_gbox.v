/**
 * Module:
 *  axis_gbox
 *
 * Description:
 *  The AXIS Gear Box will serializes or deserializes a stream of data
 *  depending of the relative widths of the streams. Is only one register deep.
 *
 *  Serializes the 'up' data word into multiple smaller 'down' data words. The
 *  module will stall when the dn_rdy flag deasserts.
 *
 *  Deserializes multiple 'up' flow bus data words into a single, larger
 *  'down' data words. Arranges them first to the right and moving left. If
 *  there is a pause in the incoming 'up' stream the values already written
 *  into the larger 'down' word will stay until enough 'up' data has been sent
 *  in to complete the 'down' word unless a 'up_last' signal forces the down
 *  transfer. The module will stall when the 'dn_rdy' flag deasserts.
 *
 * Testbench:
 *  axis_gbox_tb.v
 *
 * Created:
 *  Sun Jun  3 17:57:34 PDT 2018
 *
 * Authors:
 *  Berin Martini (berin.martini@gmail.com)
 */
`ifndef _axis_gbox_
`define _axis_gbox_


module axis_gbox
  #(parameter
    DATA_UP_WIDTH   = 2,
    DATA_DN_WIDTH   = 8)
   (input                           clk,
    input                           rst,

    input       [DATA_UP_WIDTH-1:0] up_data,
    input                           up_last,
    input                           up_val,
    output                          up_rdy,

    output      [DATA_DN_WIDTH-1:0] dn_data,
    output                          dn_last,
    output                          dn_val,
    input                           dn_rdy
);


    /**
     * Local parameters
     */


`ifdef VERBOSE
    initial begin
        $display("<axis_gbox> up words: %d, dn word: %d\n"
                , DATA_UP_WIDTH
                , DATA_DN_WIDTH
                );
`endif

    /**
     * Internal signals
     */


    /**
     * Implementation
     */

    generate
        if (DATA_UP_WIDTH == DATA_DN_WIDTH) begin : PASS_

            reg  [DATA_DN_WIDTH-1:0]    dn_data_i;
            reg                         dn_last_i;
            reg                         dn_val_i;


            assign up_rdy   = dn_rdy;

            assign dn_data  = dn_data_i;

            assign dn_last  = dn_last_i & dn_rdy;

            assign dn_val   = dn_val_i & dn_rdy;


            always @(posedge clk)
                if (dn_rdy & up_val) begin
                    dn_data_i <= up_data;
                end


            always @(posedge clk)
                if      (rst)       dn_last_i <= 1'b0;
                else if (dn_rdy)    dn_last_i <= up_val & up_last;


            always @(posedge clk)
                if      (rst)       dn_val_i <= 1'b0;
                else if (dn_rdy)    dn_val_i <= up_val;


        end
        else if (DATA_UP_WIDTH > DATA_DN_WIDTH) begin : SERIAL_

            localparam DATA_NB = DATA_UP_WIDTH/DATA_DN_WIDTH;


            wire [2*DATA_NB-1:0]        token_nx;
            reg  [DATA_NB-1:0]          token;
            reg  [DATA_UP_WIDTH-1:0]    serial_data;
            reg  [DATA_NB-1:0]          serial_last;
            reg  [DATA_NB-1:0]          serial_valid;


            assign up_rdy   = dn_rdy & token[0];

            assign dn_data  = serial_data[0 +: DATA_DN_WIDTH];

            assign dn_last  = serial_last[0] & dn_rdy;

            assign dn_val   = serial_valid[0] & dn_rdy;

            assign token_nx = {token, token};


            always @(posedge clk)
                if (rst) token <= 'b1;
                else if (dn_rdy) begin

                    if ( ~token[0] | (up_rdy & up_val)) begin
                        token <= token_nx[DATA_NB-1 +: DATA_NB];
                    end
                end


            always @(posedge clk)
                if (dn_rdy) begin

                    serial_data <= serial_data >> DATA_DN_WIDTH;
                    if (up_rdy & up_val) begin
                        serial_data <= up_data;
                    end
                end


            always @(posedge clk)
                if (rst) serial_last <= 'b0;
                else if (dn_rdy) begin

                    serial_last <= serial_last >> 1;
                    if (up_rdy & up_val & up_last) begin
                        serial_last             <= 'b0;
                        serial_last[DATA_NB-1]  <= 1'b1;
                    end
                end


            always @(posedge clk)
                if (rst) serial_valid <= 'b0;
                else if (dn_rdy) begin

                    serial_valid <= serial_valid >> 1;
                    if (up_rdy & up_val) begin
                        serial_valid <= {DATA_NB{1'b1}};
                    end
                end


        end
        else if (DATA_UP_WIDTH < DATA_DN_WIDTH) begin : DSERIAL_

            localparam DATA_NB = DATA_DN_WIDTH/DATA_UP_WIDTH;

            integer                     ii;
            wire [2*DATA_NB-1:0]        token_nx;
            reg  [DATA_NB-1:0]          token;
            reg  [DATA_DN_WIDTH-1:0]    dn_data_i;
            reg                         dn_last_i;
            reg                         dn_val_i;


            assign up_rdy   = dn_rdy;

            assign dn_data  = dn_data_i;

            assign dn_last  = dn_last_i & dn_rdy;

            assign dn_val   = dn_val_i & dn_rdy;

            assign token_nx = {token, token};


            always @(posedge clk)
                if (rst) dn_last_i <= 1'b0;
                else if (dn_rdy) begin
                    dn_last_i <= up_val & up_last;
                end


            always @(posedge clk)
                if (rst) dn_val_i <= 1'b0;
                else if (dn_rdy) begin
                    dn_val_i <= (token[DATA_NB-1] & up_val) | (up_val & up_last);
                end


            always @(posedge clk)
                if (rst | (dn_rdy & up_val & up_last)) token <= 'b1;
                else if (dn_rdy & up_val) begin
                    token <= token_nx[DATA_NB-1 +: DATA_NB];
                end


            always @(posedge clk)
                for (ii=0; ii<DATA_NB; ii=ii+1) begin
                    if (dn_rdy & token[ii]) begin
                        dn_data_i[ii*DATA_UP_WIDTH +: DATA_UP_WIDTH] <= up_data;
                    end
                end

        end
    endgenerate


endmodule

`endif //  `ifndef _axis_gbox_
