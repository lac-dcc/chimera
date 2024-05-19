// This program was cloned from: https://github.com/ic7x24/verilog-mini-demo
// License: MIT License

// ================================================================ 
// Verilog Mini Demo Project 
//  
// Licensed under the MIT License.
// 
// github  : https://github.com/ic7x24/verilog-mini-demo 
// ================================================================

module mini_fir_ctrl (    
    input        clk,
    input        rst_n,
    input  [3:0] i_addr,
    input  [7:0] i_data_wr,
    input        i_wr,
    input        i_rd,
    output     [7:0] o_data_rd,
    output reg [7:0] o_fir_ctrl,
    output reg [7:0] o_coeff_00,
    output reg [7:0] o_coeff_01,
    output reg [7:0] o_coeff_02,
    output reg [7:0] o_coeff_03,
    output reg [7:0] o_coeff_04,
    output reg [7:0] o_coeff_05,
    output reg [7:0] o_coeff_06
);

localparam COEFF_00_ID = 4'h0;
localparam COEFF_01_ID = 4'h1;
localparam COEFF_02_ID = 4'h2;
localparam COEFF_03_ID = 4'h3;
localparam COEFF_04_ID = 4'h4;
localparam COEFF_05_ID = 4'h5;
localparam COEFF_06_ID = 4'h6;

localparam FIR_CTRL_ID = 4'hf;

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin        
        o_coeff_00 <= 8'h00;
        o_coeff_01 <= 8'h00;
        o_coeff_02 <= 8'h00;
        o_coeff_03 <= 8'h00;
        o_coeff_04 <= 8'h00;
        o_coeff_05 <= 8'h00;
        o_coeff_06 <= 8'h00;
        o_fir_ctrl <= 8'h00;
    end
    else if(i_wr) begin
        case(i_addr[3:0])            
            COEFF_00_ID: o_coeff_00 <= i_data_wr; 
            COEFF_01_ID: o_coeff_01 <= i_data_wr; 
            COEFF_02_ID: o_coeff_02 <= i_data_wr; 
            COEFF_03_ID: o_coeff_03 <= i_data_wr; 
            COEFF_04_ID: o_coeff_04 <= i_data_wr; 
            COEFF_05_ID: o_coeff_05 <= i_data_wr; 
            COEFF_06_ID: o_coeff_06 <= i_data_wr; 
            FIR_CTRL_ID: o_fir_ctrl <= i_data_wr; 
            default ;
        endcase
    end
end

reg [7:0] reg_out_mux;
always @* begin
    case(i_addr[3:0])            
        COEFF_00_ID: reg_out_mux = o_coeff_00; 
        COEFF_01_ID: reg_out_mux = o_coeff_01; 
        COEFF_02_ID: reg_out_mux = o_coeff_02; 
        COEFF_03_ID: reg_out_mux = o_coeff_03; 
        COEFF_04_ID: reg_out_mux = o_coeff_04; 
        COEFF_05_ID: reg_out_mux = o_coeff_05; 
        COEFF_06_ID: reg_out_mux = o_coeff_06; 
        FIR_CTRL_ID: reg_out_mux = o_fir_ctrl;    
            default: reg_out_mux = 8'd0;     
    endcase
end

assign o_data_rd = i_rd ? reg_out_mux : 8'd0;


endmodule
