// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          Edge Detector RTL
// File:            edge_detector.v
// Date created:    2021-05-31
// Author:          Aleksandar Lilic
// Description:     Simple edge detector module that detects rising edge
//                  on the input signal 
//                  Creates a one clock wide pulse on successful detection
//
// Version history:
//      2021-05-31  AL  0.1.0 - Initial
//      2021-05-31  AL  1.0.0 - Release
//-----------------------------------------------------------------------------

module edge_detector #(
    parameter WIDTH = 1
)(
    input   wire             clk,
    input   wire             rst,
    input   wire [WIDTH-1:0] signal_in,
    output  wire [WIDTH-1:0] edge_detect_pulse
);

//-----------------------------------------------------------------------------
// Signals
reg [WIDTH-1:0] catch;
reg [WIDTH-1:0] catch_q1;

//-----------------------------------------------------------------------------
// Edge detector
always @(posedge clk) begin
    if (rst) begin
        catch    <= {WIDTH{1'b0}};
        catch_q1 <= {WIDTH{1'b0}};
    end
    else begin
        catch    <= signal_in;
        catch_q1 <= catch;
    end
end

// Input was low and it's high now
assign edge_detect_pulse = (catch & ~catch_q1);

endmodule
