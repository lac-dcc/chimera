// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input in,
    output out);

reg out;

    always @ (in)
    begin
        out = in;
    end

endmodule