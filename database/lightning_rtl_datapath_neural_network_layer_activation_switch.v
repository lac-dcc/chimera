/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: layer_activation_switch.v
File Explanation: this module describes the logic to switch sram-based data for first layer action and inter_layer_buffer-based data for subsequent layers
File Start Time: March 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none

module layer_activation_switch # (
    parameter DATA_WIDTH = 256  // the bus bandwidth for the glue logic is 256 for the DAC 
)(
    input wire clk,
    input wire rst,
    
    input wire [2:0] layer,

    input wire [DATA_WIDTH-1:0] initial_layer_tdata,
    input wire initial_layer_tvalid,
    input wire initial_layer_tlast,

    input wire [DATA_WIDTH-1:0] intermediate_layer_tdata,
    input wire intermediate_layer_tvalid,
    input wire intermediate_layer_tlast,

    output reg [DATA_WIDTH-1:0] m_layer_tdata,
    output reg m_layer_tvalid,
    output reg m_layer_tlast
);  
    wire [DATA_WIDTH-1:0] delayed_intermediate_layer_tdata;
    wire delayed_intermediate_layer_tvalid;
    wire delayed_intermediate_layer_tlast;

    always @ (posedge clk) begin
        if (rst) begin
            m_layer_tdata <= {DATA_WIDTH{1'b0}};
            m_layer_tvalid <= 1'b0;
            m_layer_tlast <= 1'b0;
        end else begin
            case (layer)
                3'b001 : begin
                    m_layer_tdata <= initial_layer_tdata;
                    m_layer_tvalid <= initial_layer_tvalid;
                    m_layer_tlast <= initial_layer_tlast;
                end 
                3'b010: begin
                    m_layer_tdata <= delayed_intermediate_layer_tdata << 7;
                    m_layer_tvalid <= delayed_intermediate_layer_tvalid;
                    m_layer_tlast <= delayed_intermediate_layer_tlast;
                end 
                3'b100: begin
                    m_layer_tdata <= delayed_intermediate_layer_tdata << 7;
                    m_layer_tvalid <= delayed_intermediate_layer_tvalid;
                    m_layer_tlast <= delayed_intermediate_layer_tlast;
                end
                default: begin
                    m_layer_tdata <= {DATA_WIDTH{1'b0}};
                    m_layer_tvalid <= 1'b0;
                    m_layer_tlast <= 1'b0;
                end
            endcase
        end
    end

    // also need to shift bu 7 bits to match the 8b accuracy on 16/14b DAC
    generate
        axis_delay # (
            .DATA_WIDTH(DATA_WIDTH),
            .LATENCY(2)
        ) following_layer_buffer_delay_inst (
            .clk(clk),
            .rst(rst),
            .s_axis_tdata(intermediate_layer_tdata),
            .s_axis_tvalid(intermediate_layer_tvalid),
            .s_axis_tlast(intermediate_layer_tlast),
            .m_axis_tdata(delayed_intermediate_layer_tdata),
            .m_axis_tvalid(delayed_intermediate_layer_tvalid),
            .m_axis_tlast(delayed_intermediate_layer_tlast)
        );
    endgenerate
endmodule


`resetall
