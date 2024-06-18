// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

module lockbox #(
    parameter WIDTH = 128
) (input clk, input resetn, input en, input op, input [WIDTH-1:0] secret, input [WIDTH-1:0] password, output [WIDTH-1:0] out);

reg [WIDTH-1:0] stored_secret;
reg [WIDTH-1:0] stored_password;
reg [WIDTH-1:0] returned_secret;

always @(posedge clk) begin
    if (!resetn) begin
        returned_secret <= 0;
    end else if (en) begin
        if (op) begin
            // store
            stored_secret <= secret;
            stored_password <= password;
            returned_secret <= 0;
        end else begin
            // get
            if (password == stored_password) begin
                returned_secret <= stored_secret;
            end else begin
                returned_secret <= 0;
            end
            stored_secret <= 0;
            // it's secure even if we don't clear the password!
            // just requires being a bit clever with the refinement relation
            // (there's no longer an abstraction function that works)
            //
            // stored_password <= 0;
        end
    end else begin
        returned_secret <= 0;
    end
end
assign out = returned_secret;

endmodule
