// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// digital tube data

module digital_tube_data
(
    input clk,
    input rst_n,
    input [47:0] data,
    output reg [7:0] seg,
    output reg [5:0] sel
);

    reg [15:0] cnt16; // 0 ~ 65535

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            cnt16 <= 16'b0;
            seg <= 8'b0000_0000;
            sel <= 6'b000_001;
        end else begin
            cnt16 <= cnt16 + 16'b1;
            if (cnt16 == 16'hffff) begin
                case (sel)
                    6'b000_001: begin
                        sel <= 6'b000_010;
                        seg <= data[15:8];
                    end
                    6'b000_010: begin
                        sel <= 6'b000_100;
                        seg <= data[23:16];
                    end
                    6'b000_100: begin
                        sel <= 6'b001_000;
                        seg <= data[31:24];
                    end
                    6'b001_000: begin
                        sel <= 6'b010_000;
                        seg <= data[39:32];
                    end
                    6'b010_000: begin
                        sel <= 6'b100_000;
                        seg <= data[47:40];
                    end
                    6'b100_000: begin
                        sel <= 6'b000_001;
                        seg <= data[7:0];
                    end
                    default: begin
                        sel <= 6'b000_001;
                        seg <= data[7:0];
                    end
                endcase
            end
        end
    end

endmodule
