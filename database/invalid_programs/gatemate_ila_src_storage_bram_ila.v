// Single Port RAM (NO_CHANGE)
module bram_ila #(
    parameter DATA_WIDTH=32,
    parameter ADDR_WIDTH=9,
    parameter SIGNAL_SYNCHRONISATION=0
    )(
    input wire we,
    input wire clk,
    input wire rclk,
    input wire [DATA_WIDTH-1:0] di,
    input wire [ADDR_WIDTH-1:0] addr_read,
    input wire [ADDR_WIDTH-1:0] addr_write,
    output reg [DATA_WIDTH-1:0] do
    );

    localparam WORD = (DATA_WIDTH-1);
    localparam DEPTH = (2**ADDR_WIDTH-1);
    reg [WORD:0] memory [0:DEPTH];
    reg [WORD:0] pipeline [SIGNAL_SYNCHRONISATION:0];

    generate
        if (SIGNAL_SYNCHRONISATION > 0) begin
            genvar i;
            for (i = 0; i < SIGNAL_SYNCHRONISATION; i = i+1) begin : loop
                always @(posedge clk) begin
                    pipeline[i+1] <= pipeline[i];
                end
            end
            always @(posedge clk) begin
                pipeline[0] <= di;
                if (we) begin
                    memory[addr_write] <= pipeline[SIGNAL_SYNCHRONISATION];
                end
            end
        end else begin
            always @(posedge clk) begin
                if (we) begin
                    memory[addr_write] <= di;
                end
            end
        end
    endgenerate
    always @(posedge rclk) begin
            do <= memory[addr_read];
    end


    endmodule