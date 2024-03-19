// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    always @(*) begin
        left = 0;
        down = 0;
        left = 0;
        right = 0;
        case (scancode)
            16'he06b: begin
                left = 1;
            end
            16'he072: begin
                down = 1;
            end
            16'he074: begin
                right = 1;
            end
            16'he075: begin
                up = 1;
            end
            default: begin
                up = 0;
                down = 0;
                left = 0;
                right = 0;
            end
        endcase
    end
endmodule

