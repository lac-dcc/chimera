// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module clk_division #(
    parameter DIVCLK_CNTMAX = 24999
)(
    input   clk_in,
    input   rstn,
    output  divclk
);

reg [31:0] cnt;              
reg divclk_reg;

always@(posedge clk_in, negedge rstn) begin
    if (!rstn) begin
        cnt <= 0;
        divclk_reg <= 0;
    end else begin
        if(cnt == DIVCLK_CNTMAX) begin
            cnt <= 0;
            divclk_reg <= ~divclk_reg;
        end
        else begin
            cnt <= cnt + 1;  
        end
    end
end 

assign divclk = divclk_reg;

endmodule