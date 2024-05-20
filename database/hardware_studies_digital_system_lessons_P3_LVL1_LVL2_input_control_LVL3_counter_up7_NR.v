// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module counter_up7_NR(
    input wire clk, clear, 
    output reg out
    );
    reg [4:0] count = 4'b1111;
    always @(posedge clk) 
        begin
            if (count == 4'b000) begin
                count = count + 1;        
                out = 1;
            end else if (count == 4'b1111) begin
                if(clear) begin
                count = 3'b000;
                end
                out = 0;
            end else begin 
                count = count + 1;
                out = 0;
            end
        end
endmodule