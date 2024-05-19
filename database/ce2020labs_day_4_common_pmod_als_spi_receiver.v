// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

module pmod_als_spi_receiver
(
    input             clock,
    input             reset,
    output            cs,
    output            sck,
    input             sdo,
    output reg [15:0] value
);

    reg [21:0] cnt;
    reg [15:0] shift;

    always @ (posedge clock or posedge reset)
    begin       
        if (reset)
            cnt <= 22'b100;
        else
            cnt <= cnt + 22'b1;
    end

    assign sck = ~ cnt [3];
    assign cs  =   cnt [8];

    wire sample_bit = ( cs == 1'b0 && cnt [3:0] == 4'b1111 );
    wire value_done = ( cnt [21:0] == 22'b0 );

    always @ (posedge clock or posedge reset)
    begin       
        if (reset)
        begin       
            shift <= 16'h0000;
            value <= 16'h0000;
        end
        else if (sample_bit)
        begin       
            shift <= (shift << 1) | sdo;
        end
        else if (value_done)
        begin       
            value <= shift;
        end
    end

endmodule
