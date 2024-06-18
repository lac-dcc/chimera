// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module counter(
    input               clk,
    input               rstn,
    output  reg  [2:0]  cnt
); 

always@(posedge clk, negedge rstn) begin
    if (!rstn) begin
        cnt <= 0;
    end else begin
        if (cnt == 3'b101) begin
            cnt <= 0;
        end else begin
            cnt <= cnt + 1'b1;
        end
    end
end

endmodule