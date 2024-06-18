// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module Memory #(
    parameter MEMORY_FILE = "",
    parameter MEMORY_SIZE = 4096
)(
    input wire clk,
    input wire reset,
    input wire memory_read,
    input wire memory_write,
    input wire [2:0] option,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output wire memory_response,
    output reg [31:0] read_data
);

reg [31:0] memory [(MEMORY_SIZE/4)-1: 0];
wire [31:0] buffer;
`ifdef __ICARUS__
integer i;
`endif

assign memory_response = memory_read | memory_write;

assign buffer = (memory_read == 1'b1) ? memory[{2'b00, address[31:2]}] : 32'h00000000;

initial begin
    //memory_response = 1'b0;
    `ifdef __ICARUS__
        for (i = 0; i < (MEMORY_SIZE/4)-1; i = i + 1) begin
            memory[i] = 32'h00000000; 
        end
    `endif

    if(MEMORY_FILE != "") begin
        $readmemh(MEMORY_FILE, memory, 0, (MEMORY_SIZE/4) - 1);
    end
end
/*
always @(posedge clk ) begin
    memory_response <= 1'b0;

    if(memory_read | memory_write) begin
        memory_response <= 1'b1;
    end
end
*/
always @(posedge clk) begin
    if(memory_write == 1'b1) begin
        if(option[0] == 1'b1) begin
            memory[{2'b00, address[31:2]}] <= {buffer[31:16], write_data[15:0]};
        end else if(option[1] == 1'b1) begin
            memory[{2'b00, address[31:2]}] <= write_data;
        end else begin
            memory[{2'b00, address[31:2]}] <= {buffer[31:8], write_data[7:0]};;
        end
    end
end

always @(*) begin
    case (option)
        3'b000: read_data = {{24{buffer[7]}}, buffer[7:0]};
        3'b001: read_data = {{16{buffer[15]}}, buffer[15:0]};
        3'b100: read_data = {24'h000000 ,buffer[7:0]};
        3'b101: read_data = {16'h0000 ,buffer[15:0]};
        3'b010: read_data = buffer;
        default: read_data = buffer;
    endcase
end
    
endmodule
