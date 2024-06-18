// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-line to 1-line data selector/multiplexer.
// Based on the 7400-series integrated circuits used in my programable-8-bit-microprocessor.
   
module jeff_74x151_behavioral(
    input                d0,                  // DATA IN
    input                d1,                  // 
    input                d2,                  // 
    input                d3,                  // 
    input                d4,                  // 
    input                d5,                  // 
    input                d6,                  // 
    input                d7,                  // 
    input                a,                   // SELECT
    input                b,                   // 
    input                c,                   // 
    input                en,                  // ENABLE
    output reg           y,                   // DATA OUT
    output               w                    // INVERTED OUTPUT
);

    assign w = ~y;

    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ ( * ) begin
        if (en) begin
            case({c,b,a})
                3'b000 : y <= d0;
                3'b001 : y <= d1;
                3'b010 : y <= d2;
                3'b011 : y <= d3;
                3'b100 : y <= d4;
                3'b101 : y <= d5;
                3'b110 : y <= d6;
                3'b111 : y <= d7;
            endcase
        end else begin
            y <= 1'b1;
        end
    end

endmodule
