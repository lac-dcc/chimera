// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module axis_pe
    (
        input wire         aclk,
        input wire         aresetn,
        // *** AXIS slave port ***
        output wire        s_axis_tready,
        input wire [31:0]  s_axis_tdata,
        input wire         s_axis_tvalid,
        input wire         s_axis_tlast,
        // *** AXIS master port ***
        input wire         m_axis_tready,
        output wire [31:0] m_axis_tdata,
        output wire        m_axis_tvalid,
        output wire        m_axis_tlast
    );
    
    wire [7:0] y_out;
    
    // AXI-Stream control
    assign s_axis_tready = m_axis_tready;
    assign m_axis_tdata = {24'h000000, y_out};
    assign m_axis_tvalid = s_axis_tvalid;
    assign m_axis_tlast = s_axis_tlast;
    
    // PE
    pe #(8, 0) pe_0
    (
        .a_in(s_axis_tdata[7:0]),
        .y_in(s_axis_tdata[23:16]),
        .b(s_axis_tdata[15:8]),
        .a_out(),
        .y_out(y_out)
    );
    
endmodule
