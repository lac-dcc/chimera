// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module mem_ctl(
    
    /* Input clocking signal */
    input wire clk,

    /* Address in memory, where to write */
    input wire [31:0]addr,
    /* Data to be written to memory at 'addr' */
    input wire [31:0]data,
    
    /* Write-enable control signal */
    input wire we,

    /* Memory access width */
    input wire [1:0]access_width
);

reg [31:0] value = 0;

always @(posedge clk) begin
    
    /* Simulate write to memory if we is set */
    if (we) begin

        case(access_width)
            3'b00: value = {24'b0, data[7:0]};
            3'b01: value = {16'b0, data[15:0]};
            3'b10: value = data;
        endcase

        $display("[%h] <- %h \n", addr, value);
    end
end

endmodule
