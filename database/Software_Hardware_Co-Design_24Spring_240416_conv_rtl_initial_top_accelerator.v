// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

module top_accelerator (
    input  wire                clk          , // Clock
    input  wire                reset        , // Reset
    input  wire  [8*28*28-1:0] i_image      , // Image data
    input  wire  [8*3*3-1  :0] i_kernel     , // Kernel data
    input signed [7:0] weights [675:0][9:0] , // Weights data
    input  wire  [7        :0] bias         , // Bias data
    output reg   [32*10-1  :0] o_output_data, // Output data 
    output reg                 done           // Done signal
);
    reg  [7:0] image [27:0][27:0];
    reg  [7:0] kernel [0:3*3-1];
    wire [31:0] output_data [9:0]; 
    // reshape input image
    integer i, j;
    always @(*) begin
        for (i = 0; i < 28; i = i + 1) begin
            for (j = 0; j < 28; j = j + 1) begin
                image[i][j] = i_image[(i*28 + j) +: 8];
            end
        end
    end
    // reshape input kernel
    always @(*) begin
        for (i = 0; i < 3*3; i = i + 1) begin
            kernel[i] = i_kernel[i*8 +: 8];
        end
    end
    // reshape output data
    always @(*) begin
        for (i = 0; i < 10; i = i + 1) begin
            o_output_data[i*32 +: 32] = output_data[i] ;
        end
    end
    
endmodule