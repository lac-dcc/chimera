// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

// Shift right
module shr(input wire[31:0] a, input wire[31:0] b, output wire[31:0] result);

	assign result = a >> b;

endmodule


// Arithmetic shift right
module shra(input wire[31:0] a, input wire[31:0] b, output reg[31:0] result);

    always @(*) begin
        // Perform the shift
        result = a >>> b;

        // If the original number was negative, fill in the shifted bits with 1s
        if (a[31]) begin
            result = result | ((32'hFFFFFFFF << (32-b)));
        end
    end

endmodule

// Shift left
module shl(input wire[31:0] a, input wire[31:0] b, output wire[31:0] result);

	assign result = a << b;

endmodule