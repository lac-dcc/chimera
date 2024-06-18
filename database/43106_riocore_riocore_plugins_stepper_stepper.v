// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module stepper
    #(
        parameter STEPTYPE = 1
    )
    (
        input clk,
        input enable,
        input signed [31:0] velocity,
        output signed [31:0] position,
        output a1,
        output a2,
        output b1,
        output b2
    );

    localparam TYPE_WAVE = 0;
    localparam TYPE_FULL = 1;
    localparam TYPE_HALF = 2;

    reg step = 0;
    wire DIR;
    assign DIR = (velocity > 0);
    reg [31:0] jointCounter = 32'd0;
    reg [31:0] velocityAbs = 32'd0;
    reg signed [31:0] positionMem = 32'd0;

    reg double = 0;
    reg [2:0] unipos = 0;
    reg [3:0] seq [0:7];
    initial begin
        if (STEPTYPE == TYPE_WAVE || STEPTYPE == TYPE_HALF) begin
            if (STEPTYPE == TYPE_WAVE) begin
                double <= 1;
            end else begin
                double <= 0;
            end
            seq[0] <= 4'b1000;
            seq[1] <= 4'b1100;
            seq[2] <= 4'b0100;
            seq[3] <= 4'b0110;
            seq[4] <= 4'b0010;
            seq[5] <= 4'b0011;
            seq[6] <= 4'b0001;
            seq[7] <= 4'b1001;
        end else if (STEPTYPE == TYPE_FULL) begin
            double <= 1;
            seq[0] <= 4'b1001;
            seq[1] <= 4'b1001;
            seq[2] <= 4'b1100;
            seq[3] <= 4'b1100;
            seq[4] <= 4'b0110;
            seq[5] <= 4'b0110;
            seq[6] <= 4'b0011;
            seq[7] <= 4'b0011;
        end
    end

    assign a1 = enable && (seq[unipos][0]);
    assign a2 = enable && (seq[unipos][1]);
    assign b1 = enable && (seq[unipos][2]);
    assign b2 = enable && (seq[unipos][3]);

    assign position = positionMem;
    always @ (posedge clk) begin
        if (DIR) begin
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
                    if (DIR) begin
                        positionMem <= positionMem + 1;
                        unipos <= unipos + 1 + double;
                    end else begin
                        positionMem <= positionMem - 1;
                        unipos <= unipos - 1 - double;
                    end
                end
            end
        end
    end
endmodule

