// This program was cloned from: https://github.com/weenslab/fpga101
// License: MIT License

`timescale 1ns / 1ps

module axis_nn_tb();
    localparam T = 10;
    
    reg aclk;
    reg aresetn;
    
    wire s_axis_tready;
    reg [63:0] s_axis_tdata;
    reg s_axis_tvalid;
    reg s_axis_tlast;
    
    reg m_axis_tready;
    wire [63:0] m_axis_tdata;
    wire m_axis_tvalid;
    wire m_axis_tlast;
    
    axis_nn dut
    (
        .aclk(aclk),
        .aresetn(aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tlast(s_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tvalid(m_axis_tvalid),
        .m_axis_tlast(m_axis_tlast)
    );
    
    always
    begin
        aclk = 0;
        #(T/2);
        aclk = 1;
        #(T/2);
    end

    initial
    begin
        s_axis_tdata = 0;
        s_axis_tvalid = 0;
        s_axis_tlast = 0;
        m_axis_tready = 1;
        
        aresetn = 0;
        #(T*5);
        aresetn = 1;
        #(T*5);

        s_axis_tvalid = 1;
        s_axis_tdata = 64'b0000000000000000_1011000001111010_0000010101111010_0000010101111010;
        #T;
        s_axis_tdata = 64'b0000000000000000_1111110001100110_0000001111100001_0000001100010100;
        #T;
        s_axis_tdata = 64'b0000000000000000_1111110001110000_0000001010001111_0000010000110011;
        #T; 
        s_axis_tdata = 64'b1111010110100011_0000000001010001_1111101011000010_0001110001110000;
        #T;
        s_axis_tdata = 64'b0000000011001100_0000011111100001_0000011010000101_1110001110011001;
        #T;
        s_axis_tdata = 64'b0001010000000000_0001010000000000_0010000000000000_0010000000000000;
        #T;
        s_axis_tdata = 64'b0001010000000000_0010000000000000_0001010000000000_0010000000000000;
        s_axis_tlast = 1;
        #T;
        s_axis_tvalid = 0;
        s_axis_tdata = 0; 
        s_axis_tlast = 0;   
    end
        
endmodule
