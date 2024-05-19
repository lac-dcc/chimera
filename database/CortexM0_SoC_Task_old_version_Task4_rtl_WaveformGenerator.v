// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module WaveformGenerator (
    input           clk,
    input           wgen, // waveform generator enable signal
    input           rstn,
    output   [7:0]  DACdata,
    output          WRn,
    output          CSn,
    output          DACsel
);

reg  [7:0]          addr_reg;

wire [7:0]          addr_next;
assign               addr_next   =   (addr_reg == 8'd200) ? 8'd0 : addr_reg + 1;

always @ (posedge clk) begin
    if (~rstn) begin
        addr_reg                <=  8'b0;
    end
    else begin
        addr_reg                <=  addr_next;
    end
end

wire [7:0]          addr;
assign              addr        =   addr_reg;

wire [7:0]         rom_data;
WaveformROM    #(
    .ADDR_WIDTH             (8) 
)   sinROM   (
    .clka                   (clk),
    .addra                  (addr),
    .douta                  (rom_data)
);

assign DACdata = (wgen)?rom_data:8'b0;
assign {WRn, CSn, DACsel} = 3'b000;

endmodule