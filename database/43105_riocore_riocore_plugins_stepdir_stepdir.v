// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module stepdir
    (
        input clk,
        input enable,
        input signed [31:0] velocity,
        output signed [31:0] position,
        output dir,
        output reg step = 0,
        output en
    );
    assign dir = (velocity > 0);
    reg [31:0] jointCounter = 32'd0;
    reg [31:0] velocityAbs = 32'd0;
    reg signed [31:0] positionMem = 32'd0;
    assign en = enable;
    assign position = positionMem;
    always @ (posedge clk) begin
        if (dir) begin
            velocityAbs <= velocity;
        end else begin
            velocityAbs <= -velocity;
        end
        jointCounter <= jointCounter + 1;
        if (velocity != 0 && enable == 1) begin
            if (jointCounter >= velocityAbs) begin
                step <= ~step;
                jointCounter <= 32'b0;
                if (step) begin
                    if (dir) begin
                        positionMem <= positionMem + 1;
                    end else begin
                        positionMem <= positionMem - 1;
                    end
                end
            end
        end
    end
endmodule

