module top
(
    // 16 address pins
    input  [15:0] address,

    // Data pins (bidirectional)
    inout [7:0] data,

    // Signals from cartridge
    input nWR,   // Write
    input nRD,   // Reada
    input nCS,   // Chip-select
    
    // LED indicators
    output reg [7:0] led0,
    output led_nwr,
    output led_nrd,
    output led_ncs,

    // Output enable for data level shifter
    output OE

    // 100 MHz clock from FPGA
    input wire          clk,
);

assign led_gbclk = gbclk;
assign led_nwr = nWR;
assign led_nrd = nRD;
assign led_ncs = nCS;

reg[7:0] header_custom [0:47];
reg[7:0] header_original[0:47];
reg[7:0] rom[0:32768];

// Read headers & ROM from files
initial
begin
    $readmemh("original_header.hex",header_original, 0, 47);
    $readmemh("custom_header.hex",header_custom, 0, 47);
    $readmemh("rom.hex",rom, 0, 32768);
end



reg [15:0] idx = 16'h0;
reg [7:0] data_out = 8'd0;
reg output_enable = 1'd0;

// Enable data output if required, otherwise high-impedance
assign data = output_enable ? data_out : 8'bzzzzzzzz;
assign OE = output_enable;

// Indicates whether we should show the fake logo
reg show_custom_logo = 1'd0;

// Indicates whether the ROM 
reg rom_was_read = 1'd0;


always @(posedge clk) begin
    // Reading beginning of logo. Check if the ROM was already read once,
    // if no set show_custom_logo to yes, otherwise to no.
    if(address == 16'h0104) begin
        if(!rom_was_read) begin
            show_custom_logo <= 1'd1;
        end else begin
            show_custom_logo <= 1'd0;
        end
    end

    // If the end of the logo was read, set rom_was_read to yes.
    if(address == 16'h0133) begin
        if(show_custom_logo) begin
            rom_was_read <= 1'd1;
        end else begin
            rom_was_read <= 1'd0;
        end
    end
end


always @(posedge clk) begin

    // Don't output signal if WR, CS, or address[15] are asserted
    // Or READ is not asserted
    if(address[15] || nRD || ~nWR || ~nCS) begin
        output_enable <= 1'd0;

    end else begin

        // Check if the read address falls into the logo area
        if(address >= 16'h0104 && address <= 16'h0133) begin

            // Display custom logo if required
            if(show_custom_logo) begin
                data_out <= header_custom[address - 16'h0104];
            
            // Otherwise show original logo
            end else begin
                data_out <= header_original[address - 16'h0104];
            end

        // Otherwise, simply output the data contained in the ROM
        end else if(address < 16'h8000) begin
            data_out <= rom[address];
            output_enable <= 1'd1;
        end
    end
end

endmodule
