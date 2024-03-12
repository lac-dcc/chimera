// This is a reg over two clock domains

module clock_reg_latch #(parameter data_size=32 )(
	input                          write_clk,        // the APF clock
	input                          read_clk,        // the system clock
	input                          reset_n,
	input                          write_trigger,
	input [data_size-1:0]          write_data_in,
	output reg [data_size-1:0]     read_data_out
);

reg [data_size-1:0] write_reg_triggered;

always @(posedge write_clk or negedge reset_n) begin
    if (~reset_n) begin
        write_reg_triggered <= 'b0;
    end
    else begin
        if (write_trigger) write_reg_triggered <= write_data_in;
    end
end

reg [data_size-1:0] read_data_clocked_1, read_data_clocked_2;

always @(posedge read_clk or negedge reset_n) begin
    if (~reset_n) begin
        read_data_clocked_1 <= 'b0;
        read_data_clocked_2 <= 'b0;
        read_data_out <= 'b0;
    end
    else begin
        read_data_clocked_1 <= write_reg_triggered;
        read_data_clocked_2 <= read_data_clocked_1;
        read_data_out <= read_data_clocked_2;
    end
end

endmodule