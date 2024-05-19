// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

module DEDFF(
input           clk,
input           rst,
input           D0,
input           D1,
output          Q
);

parameter VSS = 1'b0;
parameter VCC = 1'b1;

reg pose_edge;
reg neg_edge;
wire Q1;
wire Q2;

assign Q1   = neg_edge ^ D0;
assign Q2   = pose_edge ^ D1;
assign Q    = neg_edge ^ pose_edge;

//Pose Edge
always @(posedge clk) begin
    if (rst == VSS) pose_edge   <= VSS;
    else            pose_edge   <= Q1;
end

//Neg Edge
always @(negedge clk) begin
    if (rst == VSS) neg_edge    <= VSS;
    else            neg_edge    <= Q2;
end

endmodule

