// This program was cloned from: https://github.com/archlabo/Frix
// License: BSD 2-Clause "Simplified" License

/*
 * Copyright (c) 2015, Arch Laboratory
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

module bios_loader (
                    input wire        clk,
                    input wire        rst,
                    output reg [27:0] address,
                    output reg [3:0]  byteenable,
                    output reg        write,
                    output reg [31:0] writedata,
                    output reg        read,
                    input wire [31:0] readdata,
                    input wire        waitrequest
                    );

    parameter PIO_OUTPUT_ADDR = 32'h00008860;
    parameter DRIVER_SD_ADDR  = 32'h00000000;

    parameter BIOS_SECTOR  = 72;
    parameter BIOS_SIZE    = (64*1024);
    parameter BIOS_ADDR    = 32'hF0000 | 32'h8000000;
    parameter VBIOS_SECTOR = 8;
    parameter VBIOS_SIZE   = (32*1024);
    parameter VBIOS_ADDR   = 32'hC0000 | 32'h8000000;

    parameter CTRL_READ = 2;

    reg [31:0]                        state;
    always @(posedge clk) begin
        if(rst) state <= 1;
        else if(state != 0 && (!(waitrequest && write))) state <= state + 1;
    end

    always @(posedge clk) begin
        if(rst) begin
            write      <= 0;
            read       <= 0;
            writedata  <= 0;
            address    <= 0;
            byteenable <= 4'b0000;
        end else if(!(waitrequest && write))begin
            case(state)
              20000000: begin
                  // set pio_output to 1 (set ao486_reset to low)
                  address  <= PIO_OUTPUT_ADDR;
                  writedata <= 32'h1;
                  write    <= 1;
              end
              20001000: begin
                  // load bios
                  // bios address
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR;
                  writedata <= BIOS_ADDR;
              end
              20002000: begin
                  // load bios
                  // SD sector
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR + 4;
                  writedata <= BIOS_SECTOR;
              end
              20003000: begin
                  // load bios
                  // sector count
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR + 8;
                  writedata <= BIOS_SIZE / 512;
              end
              20004000: begin
                  // load bios
                  // control READ
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR + 12;
                  writedata <= CTRL_READ;
              end
              40004000: begin
                  // load vbios
                  // vbios address
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR;
                  writedata <= VBIOS_ADDR;
              end
              40005000: begin
                  // load vbios
                  // SD sector
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR + 4;
                  writedata <= VBIOS_SECTOR;
              end
              40006000: begin
                  // load vbios
                  // sector count
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR + 8;
                  writedata <= VBIOS_SIZE / 512;
              end
              40007000: begin
                  // load vbios
                  // control READ
                  write    <= 1;
                  address  <= DRIVER_SD_ADDR + 12;
                  writedata <= CTRL_READ;
              end
              60007000: begin
                  // set pio_output to 0 (set ao486_reset to high)
                  address  <= PIO_OUTPUT_ADDR;
                  writedata <= 32'h0;
                  write    <= 1;
              end
              default: begin
                  write <= 0;
                  writedata  <= 0;
                  address    <= 0;
              end
            endcase
        end
    end
endmodule
