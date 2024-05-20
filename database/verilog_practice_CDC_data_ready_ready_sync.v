// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module ready_sync #(
    parameter DATA_WIDTH = 8
) (
    // input  wire clk1,
    // input  wire rstn1,
    input  wire clk2,
    input  wire rstn2,
    input  wire ready,
    input  wire [DATA_WIDTH-1:0] data,
    output reg [DATA_WIDTH-1:0] data_out
);  

    // Synchronize ready signal
    reg [2:0]ready_sync;
    always @(posedge clk2 or negedge rstn2) begin
        if (~rstn2) begin
            ready_sync <= 3'b000;
        end else begin
            ready_sync <= {ready_sync[1:0], ready};
        end
    end

    // dout enable
    wire dout_en;
    assign dout_en = ~ready_sync[2] & ready_sync[1]; // rising edge

    // Synchronize data
    reg [DATA_WIDTH-1:0] data_sync;
    always @(posedge clk2 or negedge rstn2) begin
        if (~rstn2) begin
            data_sync <= {DATA_WIDTH{1'b0}};
        end else begin
            if (dout_en) begin
                data_sync <= data;
            end else
                data_sync <= data_sync;
        end
    end

    // data_out
    always @(posedge clk2 or negedge rstn2) begin
        if (~rstn2) begin
            data_out <= {DATA_WIDTH{1'b0}};
        end else begin
            data_out <= data_sync;
        end
    end  
    
endmodule