// This program was cloned from: https://github.com/splinedrive/RISCV-KianV-BareMetalStyle
// License: Apache License 2.0

/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
  adjusted for KianV-RISCV rv32ima tapeout by Hirosh Dabui <hirosh@dabui.de>
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

// A behavioral model for a quad I/O SPI PSRAM 

module psram (
    input sck,
    inout [3:0] dio,
    input ce_n
);

  localparam  ST_IDLE = 3'h0,
                ST_CMD  = 3'h1,
                ST_ADDR = 3'h2,
                ST_DUMMY= 3'h3,
                ST_DR   = 3'h4,
                ST_DW   = 3'h5;

  reg [2:0] state = ST_IDLE;
  reg [7:0] cmd;
  reg [23:0] addr;
  reg [7:0] data;
  reg [7:0] cycle_count;

  reg [7:0] RAM[8*1024*1024-1:0];  // 8kbytes

  always @(negedge ce_n or posedge ce_n)
    if (!ce_n) begin
      state <= ST_CMD;
      cycle_count <= 0;
      addr = 24'hFFFFFF;
      data = 0;
    end else if (ce_n) state <= ST_IDLE;

  always @(posedge sck)
    case (state)
      ST_CMD: if (cycle_count == 7) state <= ST_ADDR;
      ST_ADDR:
      if (cycle_count == 13)
        if (cmd == 8'hEB) state <= ST_DUMMY;
        else if (cmd == 8'h38) state <= ST_DW;
      ST_DUMMY: if (cycle_count == 19) state <= ST_DR;
    endcase

  always @(posedge sck)
    case (state)
      ST_CMD:  cmd <= {cmd[6:0], dio[0]};
      ST_ADDR: addr <= {addr[20:0], dio};
      ST_DW:   data <= {data[3:0], dio};
    endcase

  always @(posedge sck) cycle_count <= cycle_count + 1;

  always @(negedge sck or ce_n)
    if (state == ST_DW)
      if (cycle_count >= 16)
        if ((cycle_count - 16) % 2 == 0 || ce_n) begin
          RAM[addr] = data;
          //   $display("PSRAM: Write to %x, value: %x", addr, RAM[addr]);
          addr = addr + 1;
        end

  always @(posedge sck)
    if (state == ST_DUMMY || state == ST_DR)
      if (cycle_count >= 19)
        if ((cycle_count - 19) % 2 == 0) begin
          data = RAM[addr];
          addr = addr + 1;
          //      $display("PSRAM: Read from %x, value: %x", addr-1, data);
        end

  reg [3:0] do_;
  always @(negedge sck)
    if (state == ST_DR) begin
      do_  = data[7:4];
      data = data << 4;
    end

  assign dio = (state == ST_DR) ? do_ : 4'bz;

endmodule
