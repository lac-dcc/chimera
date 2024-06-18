// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef elevenBitUpCount
`define elevenBitUpCount

module elevenBitUpCount(Enable, Clock, Reset, Done);
    input Enable;
    input Clock;
    input Reset;

    reg [10:0] count;

    output Done;

    always @(posedge Clock) begin
        if (~Reset) begin
            count <= 11'h0; // Reset the counter to zero
        end else begin
            if (Enable) begin
                count <= count + 1'b1; // Increment the counter
            end
        end
    end

    assign Done = count[0] & count[1] & count[2] & count[3] & count[4] & count[5] & count[6] & count[7] & count[8] & count[9] & count[10];
endmodule

`endif
