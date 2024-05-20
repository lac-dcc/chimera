// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef thirteenBitUpCounter
`define thirteenBitUpCounter

module thirteenBitUpCounter(Enable, Clock, Reset, count);
    input Enable;
    input Clock;
    input Reset;

    output reg [12:0] count;

    always @(posedge Clock) begin
        if (Reset) begin
            count <= 13'h0; // Reset the counter to zero
        end else begin
            if (Enable) begin
                count <= count + 1'b1; // Increment the counter
            end
        end
    end

endmodule

`endif
