// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module sevenseg(
    input clk,

    input  [23:0] data,
    output [ 7:0] ss,
    output [ 2:0] ssen
);

    // Clock divider parameters
	parameter rate  = 1000;
	parameter clk_f = 100000000;
	parameter clk_d = clk_f / (rate * 3);

    reg [31:0] c;
    reg [2:0] digit = 3'b0;
    reg [7:0] segments;
    always @(posedge clk) begin
        if (c < clk_d)
            c <= c + 1;
        else begin
            c <= 0;

            case (digit)
                3'b001: begin
                    segments <= data[23:16];
                    digit <= 3'b100;
                end
                3'b100: begin
                    segments <= data[15:8];
                    digit <= 3'b010;
                end
                3'b010: begin
                    segments <= data[7:0];
                    digit <= 3'b001;
                end
                default: begin
                    segments <= 8'h00;
                    digit <= 3'b001;
                end
            endcase
        end
    end

    assign ss   = ~segments;
    assign ssen = ~digit;

endmodule


