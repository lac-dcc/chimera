// This program was cloned from: https://github.com/PR77/A500_ACCEL_RAM_IDE-Rev-2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
/*
    This file is part of A500_ACCEL_RAM_IDE originally designed by
    Paul Raspa 2017-2018.

    A500_ACCEL_RAM_IDE is free software: you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    A500_ACCEL_RAM_IDE is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with A500_ACCEL_RAM_IDE. If not, see <http://www.gnu.org/licenses/>.

    Revision 0.0 - 20.02.2018:
    Initial revision of revision 2 design.
    
    Revision 0.1 - 03.07.2018
    Update for revision 3 of design.
    
    Revision 0.2 - 29.08.2021
    Code clean up and bug fix improvements.
*/

`define FASTRAM_SIZE_2MB

module ACCEL_RAM_IDE(

    input RESET,
    input MB_CLK,
    input CPU_CLK,
    
    input CPU_AS,
    output MB_AS,
       
    input MB_DTACK,
    output CPU_DTACK,
    
    output reg MB_E_CLK,
    input MB_VPA,    
    output MB_VMA,
        
    input [2:0]	CPU_FC,
    output [2:0] CPU_IPL,
    input CPU_BR,
    input CPU_BG,
    input MB_BGAK,
    output BERR,
    output CPU_AVEC,
    input RW,
    input LDS,
    input UDS,
    input HALT,
        
    // IDE
    output IDE_RW,
    output [1:0] IDE_CS,
    output IDE_RESET,
    output IDE_READ,
    output IDE_WRITE,
    
    // RAM
    output [3:0] RAM_CS,
    
    // SPI
    output SPI_CS,
    output SPI_MOSI,
    output SPI_SCK,
    input SPI_MISO,
    
    // IO Port
    output [1:0] IO_PORT,
    
    // SPARE
    input SPARE_NO_CONNECT,
    
    // Address bus
    input [23:1] ADDRESS,
    
    // Data bus
    inout [15:0] DATA

    );
    
// -- CONFIGURATION

localparam [15:0] manufacturerId = 16'h07B9;
localparam [7:0] productIdFastRAM = 8'd103;
localparam [7:0] productIdSPI = 8'd102;
localparam [7:0] productIdIOPort = 8'd101;
localparam [31:0] serialNumber = 32'd29082021; // Revision date

// --    
    
assign BERR = 1'bZ;
assign CPU_AVEC = 1'bZ;
assign CPU_IPL = 3'bZZZ;

// --- AUTOCONFIG

reg [2:0] configured = 3'b000;
reg [2:0] shutup = 3'b000;
reg [2:0] allConfigured = 3'b000;
reg [3:0] autoConfigData = 4'b0000;
reg [7:0] autoConfigBaseFastRam = 8'b00000000;
reg [7:0] autoConfigBaseSPI = 8'b00000000;
reg [7:0] autoConfigBaseIOPort = 8'b00000000;

wire DS = (LDS & UDS);
wire ACCESS = (!CPU_AS && !DS && RESET);

wire AUTOCONFIG_RANGE = ({ADDRESS[23:16]} == {8'hE8}) && ~&allConfigured;
wire IDE_RANGE = ({ADDRESS[23:16]} == {8'hEF});
wire FASTRAM_RANGE = ({ADDRESS[23:21]} == {autoConfigBaseFastRam[7:5]}) && configured[0];
wire SPI_RANGE = ({ADDRESS[23:16]} == {autoConfigBaseSPI[7:0]}) && configured[1];
wire IOPORT_RANGE = ({ADDRESS[23:16]} == {autoConfigBaseIOPort[7:0]}) && configured[2];

// Create allConfigured array based on "configured" and "shutup" status'.
always @(negedge ACCESS or negedge RESET) begin

    if (RESET == 1'b0) begin
        allConfigured <= 3'b000;
    
    end else begin
    
        allConfigured <= (configured | shutup);
    end
end

// AUTOCONFIG cycle.
always @(posedge ACCESS or negedge RESET) begin

    // Use DS as the entry point to keep this out of a specific clock domain.

    if (RESET == 1'b0) begin
        configured[2:0] <= 3'b000; 
        shutup[2:0] <= 3'b000;
        autoConfigData[3:0] <= 4'b1111;
        autoConfigBaseFastRam[7:0] <= 8'b00000000;
        autoConfigBaseSPI[7:0] <= 8'b00000000;
        autoConfigBaseIOPort[7:0] <= 8'b00000000;
    end else begin

       if (AUTOCONFIG_RANGE == 1'b1 && RW == 1'b0) begin
            // AutoConfig Write sequence. Here is where we receive from the OS the base address for the RAM.
            case (ADDRESS[7:1])
                'h24: begin
                // Written second
                    if (configured[2:0] == 3'b000) begin
                        autoConfigBaseFastRam[7:4] <= DATA[15:12];      // FastRAM
                        configured[0] <= 1'b1;
                    end
                    
                    if (configured[2:0] == 3'b001) begin
                        autoConfigBaseSPI[7:4] <= DATA[15:12];          // SPI
                        configured[1] <= 1'b1;
                    end
                    
                    if (configured[2:0] == 3'b011) begin
                        autoConfigBaseIOPort[7:4] <= DATA[15:12];       // IO Port
                        configured[2] <= 1'b1;
                    end
                end

                'h25: begin
                // Written first
                    if ({configured[2:0] == 3'b000}) autoConfigBaseFastRam[3:0] <= DATA[15:12]; // FastRAM
                    if ({configured[2:0] == 3'b001}) autoConfigBaseSPI[3:0] <= DATA[15:12];     // SPI
                    if ({configured[2:0] == 3'b011}) autoConfigBaseIOPort[3:0] <= DATA[15:12];  // IO Port
                end

                'h26: begin
                // Written asynchronously if the KS decides to not configure a specific device
                    if ({configured[2:0] == 3'b000}) shutup[0] <= 1'b1;   // FastRAM
                    if ({configured[2:0] == 3'b001}) shutup[1] <= 1'b1;   // SPI
                    if ({configured[2:0] == 3'b011}) shutup[2] <= 1'b1;   // IO Port B
                end
                
            endcase
        end

        // AutoConfig Read sequence. Here is where we publish the RAM and I/O port size and hardware attributes.
        case (ADDRESS[7:1])
            'h00: begin
                if ({configured[2:0] == 3'b000}) autoConfigData <= 4'hE;     // (00) FastRAM
                if ({configured[2:0] == 3'b001}) autoConfigData <= 4'hC;     // (00) SPI
                if ({configured[2:0] == 3'b011}) autoConfigData <= 4'hC;     // (00) IO Port
            end
            
            'h01: begin
                `ifdef FASTRAM_SIZE_2MB 
                    if ({configured[2:0] == 3'b000}) autoConfigData <= 4'h6;     // (02) FastRAM (2 MB)
                `else
                    if ({configured[2:0] == 3'b000}) autoConfigData <= 4'h5;     // (02) FastRAM (1 MB)
                `endif
                if ({configured[2:0] == 3'b001}) autoConfigData <= 4'h1;     // (02) SPI
                if ({configured[2:0] == 3'b011}) autoConfigData <= 4'h1;     // (02) IO Port
            end
            
            'h02: begin
                if ({configured[2:0]} == {3'b000}) autoConfigData <= ~productIdFastRAM[7:4];    // (04) FastRAM
                if ({configured[2:0]} == {3'b001}) autoConfigData <= ~productIdSPI[7:4];        // (04) SPI
                if ({configured[2:0]} == {3'b011}) autoConfigData <= ~productIdIOPort[7:4];     // (04) IO Port
            end
            
            'h03: begin
                if ({configured[2:0]} == {3'b000}) autoConfigData <= ~productIdFastRAM[3:0];    // (06) FastRAM
                if ({configured[2:0]} == {3'b001}) autoConfigData <= ~productIdSPI[3:0];        // (06) SPI
                if ({configured[2:0]} == {3'b011}) autoConfigData <= ~productIdIOPort[3:0];     // (06) IO Port
            end
            
            'h04: autoConfigData <= 4'h7;  // (08/0A)
            'h05: autoConfigData <= 4'hF;
            
            'h06: autoConfigData <= 4'hF;  // (0C/0E)
            'h07: autoConfigData <= 4'hF;
            
            'h08: autoConfigData <= ~manufacturerId[15:12]; // (10/12)
            'h09: autoConfigData <= ~manufacturerId[11:8];
            'h0A: autoConfigData <= ~manufacturerId[7:4];   // (14/16)
            'h0B: autoConfigData <= ~manufacturerId[3:0];                
            
            'h0C: autoConfigData <= ~serialNumber[31:28];   // (18/1A)
            'h0D: autoConfigData <= ~serialNumber[27:24];
            'h0E: autoConfigData <= ~serialNumber[23:20];   // (1C/1E)
            'h0F: autoConfigData <= ~serialNumber[19:16];
            'h10: autoConfigData <= ~serialNumber[15:12];   // (20/22)
            'h11: autoConfigData <= ~serialNumber[11:8];
            'h12: autoConfigData <= ~serialNumber[7:4];     // (24/26)
            'h13: autoConfigData <= ~serialNumber[3:0];

            default: 
                autoConfigData <= 4'hF;

        endcase
    end
end

// Output specific AUTOCONFIG data.
assign DATA[15:0] = (AUTOCONFIG_RANGE == 1'b1 && ACCESS && RW == 1'b1 && ~&allConfigured) ? {autoConfigData[3:0], 12'bZZZZZZZZZZZZ} :
                    (SPI_RANGE == 1'b1 && ACCESS && RW == 1'b1) ? {15'bZZZZZZZZZZZZZZZ, SPI_MISO} : 16'bZZZZZZZZZZZZZZZZ;

// --- RAM Control

// RAM control arbitration.
wire RAM3_CS = (UDS == 1'b0) && (~ADDRESS[20]);
wire RAM2_CS = (LDS == 1'b0) && (~ADDRESS[20]);
wire RAM1_CS = (UDS == 1'b0) && (ADDRESS[20]);
wire RAM0_CS = (LDS == 1'b0) && (ADDRESS[20]);

assign RAM_CS[3:0] = FASTRAM_RANGE ? {~RAM3_CS, ~RAM2_CS, ~RAM1_CS, ~RAM0_CS} : {1'b1, 1'b1, 1'b1, 1'b1};

// --- IDE Control

// IDE Port arbitrations.
assign IDE_CS[1:0] = ADDRESS[12] ? {~IDE_RANGE, 1'b1} : {1'b1, ~IDE_RANGE};
assign IDE_RESET = RESET;
assign IDE_READ = ((IDE_RANGE == 1'b1) && (RW == 1'b1) && ACCESS) ? 1'b0 : 1'b1;
assign IDE_WRITE = ((IDE_RANGE == 1'b1) && (RW == 1'b0) && ACCESS) ? 1'b0 : 1'b1;

// 74HCT245 Direction Control. HIGH: A(in) = B(out), LOW: B(in) = A(out).
assign IDE_RW = (IDE_READ == 1'b0) ? 1'b0 : 1'b1;

// --- IO Port Control

reg [1:0] IOPORTData = 2'h0;

// Latch D[15:14] to local IO Port Register during rising edge to S4.
always @(posedge ACCESS or negedge RESET) begin

    if (RESET == 1'b0) begin
        IOPORTData[1:0] <= 2'h0;
    end else begin

        if (IOPORT_RANGE == 1'b1 && RW == 1'b0)
            IOPORTData[1:0] <= DATA[15:14];
    end
end

// IO Port arbitrations.
assign IO_PORT[1:0] = IOPORTData[1:0];

// --- SPI Port Control

reg SPIPortMOSI = 1'b0;
reg SPIPortSCK = 1'b0;
reg SPIPortCS = 1'b1;

// Latch D[15, 7, 0] to local SPI Port Register during rising edge to S4.
always @(posedge ACCESS or negedge RESET) begin

    if (RESET == 1'b0) begin
        SPIPortMOSI <= 1'h0;
        SPIPortSCK <= 1'h0;
        SPIPortCS <= 1'h1;
    end else begin

        if (SPI_RANGE == 1'b1 && RW == 1'b0) begin
            SPIPortCS <= DATA[15];
            SPIPortMOSI <= DATA[7];
            SPIPortSCK <= DATA[0];
        end
    end
end

// SPI Port arbitration
assign SPI_CS = SPIPortCS;
assign SPI_MOSI = SPIPortMOSI;
assign SPI_SCK = SPIPortSCK;

// --- MC6800 Emulator --- Credit to TerribleFire for all the help with this

reg [3:0] eClockRingCounter = 4'h4;
reg MC6800VMA = 1'b1;
reg MC6800DTACK = 1'b1;

wire CPUSPACE = &CPU_FC;

// Let's get the 709379 Hz E_CLOCK out the way by creating it from the motherboard base 7MHz Clock.
always @(posedge MB_CLK) begin
    
    if (eClockRingCounter == 'd9) begin
        eClockRingCounter <= 'd0;
        
    end else begin
    
        eClockRingCounter <= eClockRingCounter + 'd1;

        if (eClockRingCounter == 'd4) begin
            MB_E_CLK <= 'b1;       
        end

        if (eClockRingCounter == 'd8) begin
            MB_E_CLK <= 'b0;
        end
    end
end

// Determine if current Bus Cycle is a 6800 type where VPA has been asserted.
always @(posedge MB_CLK or posedge MB_VPA) begin

    if (RESET == 1'b0) begin
        MC6800VMA <= 1'b1;
    end

    if (MB_VPA == 1'b1) begin
        MC6800VMA <= 1'b1;
    end else begin

        if (eClockRingCounter == 'd9) begin
            MC6800VMA <= 1'b1;
        end

        if (eClockRingCounter == 'd2) begin
            MC6800VMA <= MB_VPA | CPUSPACE;
        end
    end
end

// Generate /DTACK if 6800 Bus Cycle has been emulated (generatedVMA).
always @(posedge MB_CLK or posedge CPU_AS) begin
    
    if (RESET == 1'b0) begin
        MC6800DTACK <= 1'b1;
    end
    
    if (CPU_AS == 1'b1) begin
        MC6800DTACK <= 1'b1;
    end else begin
               
        if (eClockRingCounter == 'd9) begin
            MC6800DTACK <= 1'b1;
        end

        if (eClockRingCounter == 'd8) begin
            MC6800DTACK <= MC6800VMA;
        end
    end 
end

assign MB_VMA = MC6800VMA;

// --- Accelerator

reg delayedMB_AS = 1'b1;
reg delayedMB_DTACK = 1'b1;
reg fastCPU_DTACK = 1'b1;
reg slowCPU_DTACK = 1'b1;

reg [3:0] SLOW_DTACK_WAITSTATES = 4'b0000;

// Shift /CPU_AS into the 7MHz clock domain gated by FASTRAM_RANGE | AUTOCONFIG_RANGE | IDE_RANGE
// (MB_AS is not asserted during internal cycles). Delay /MB_DTACK by 1 7MHz clock cycle to sync
// up to asynchronous CPU_CLK.
always @(posedge MB_CLK or posedge CPU_AS) begin
    
    if (CPU_AS == 1'b1) begin
        delayedMB_DTACK <= 1'b1;
        delayedMB_AS <= 1'b1;
    end else begin
    
        delayedMB_AS <= CPU_AS | FASTRAM_RANGE | AUTOCONFIG_RANGE | IDE_RANGE;
        delayedMB_DTACK <= MB_DTACK;
    end
end

// Generate a slow DTACK for slow internal space resources.
always @(posedge CPU_CLK or posedge CPU_AS) begin
    
    if (CPU_AS == 1'b1) begin
        SLOW_DTACK_WAITSTATES <= 4'b0000;
        slowCPU_DTACK <= 1'b1;
    end else begin
    
        if ((IDE_RANGE == 1'b1 || AUTOCONFIG_RANGE == 1'b1) && ACCESS) begin
            SLOW_DTACK_WAITSTATES <= SLOW_DTACK_WAITSTATES + 1;
            
            if (&SLOW_DTACK_WAITSTATES) begin
                slowCPU_DTACK <= 1'b0;
            end
        end
    end
end

// Generate a fast DTACK for fast interal space resources. Currently set to 2 WS.
always @(posedge CPU_CLK or posedge CPU_AS) begin
    
    if (CPU_AS == 1'b1) begin
        fastCPU_DTACK <= 1'b1;
    end else begin

        fastCPU_DTACK <= ~FASTRAM_RANGE;
               
        // SPI_RANGE and IOPORT_RANGE are handled with slow /DTACKS via GARY.
    end
end

assign CPU_DTACK = (delayedMB_DTACK & fastCPU_DTACK & slowCPU_DTACK & MC6800DTACK);
assign MB_AS = (MB_BGAK && HALT) ? delayedMB_AS : 1'bZ;

endmodule