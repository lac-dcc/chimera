// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

module horizontal_counter (
    input clk_25MHz,
    output reg enable_V_counter =0,
    output reg [15:0] H_count_value =0
);
    always@(posedge clk_25MHz )begin
        if(H_count_value < 799) begin
            H_count_value <= H_count_value +1;
            enable_V_counter <= 0; //disable vertical counter
        end
        else begin
            H_count_value <=0; //reset Horizontal Counter
            enable_V_counter <= 1;
        end
    end

endmodule