/*
GottaGoFast FW for SukkoPera's OpenAmiga500FastRamExpansion
Copyright 2021 Matthew Harlum

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

// Config defines
`define autoconfig     // If disabled RAM is always mapped to $200000-9FFFFF
//`define cdtv         // Uncomment to build CDTV compatible version
//`define Size_4MB     // 4MB Maximum, Only uses memory chips U7 & U8

module SukkoGottaGoFast(
    input CLK,
    input RESETn,
    input UDSn,
    input LDSn,
    input ASn,
    inout [15:12] DBUS,
    input [23:16] ADDR_HI,
    input [6:1]   ADDR_LO,
    output reg mux_switch,
    output RAS0n,
    output RAS1n,
    output RAS2n,
    output RAS3n,
    output UCASn,
    output LCASn,
    output reg MA0,
    output reg MA1
    );

// Memory controller

reg ram_cycle;
reg access_ras;
reg access_ucas;
reg access_lcas;
reg refresh_ras;
reg refresh_cas;
reg [7:0] addr_match;
reg AS_last;
reg RWn;

`ifdef autoconfig
// Autoconfig
localparam [15:0] mfg_id  = 16'h07DB;
localparam [7:0]  prod_id = 8'd03;
localparam [15:0] serial  = 16'd420;

localparam Offer_Block1 = 3'b000,
           Offer_Block2 = 3'b001,
           Offer_Block3 = 3'b010,
           Offer_Block4 = 3'b011,
           SHUTUP       = 3'b100;

wire autoconfig_cycle;
reg shutup = 0;
reg configured;
reg [3:0] data_out;

// Autoconfig bus snooping
//
// For some reason Kickstart 2 and up scan the chain multiple times
// Thanks to this we can snoop on autoconfig cycles and then speak up once
// every other board is done being configured.
// No CFGIN connection needed!
reg [3:0] mfg_bad;
reg snoop_cfg;
reg snoop_cfg_next;
reg [3:0] board_reg00;
reg [3:0] board_reg01;
reg [3:0] snooped_autoconfig_state;
reg autoconfig_setup;
reg [3:0] dbus_latched;
reg CFGOUTn;

always @(posedge CLK)
begin
  dbus_latched <= DBUS[15:12];
end

always @(posedge UDSn or negedge RESETn)
begin
  if (!RESETn) begin
    snoop_cfg_next <= 1'b0;
    snoop_cfg <= 1'b0;
    mfg_bad <= 'b0;
    snooped_autoconfig_state <= Offer_Block1;
  end else if (ADDR_HI[23:16] == 8'hE8 & RWn) begin
    case (ADDR_LO[6:1])
    // Chain snooping
    //
    // If Reserved byte is not $F or manufacturer id is $FFFF then no board is answering
    // Once this happens we can set ourselves up to talk to the next autoconfig query


    // Sniff board configuration sizes so we can shrink our offering appropriately
    'h00>>1:
     board_reg00 <= dbus_latched;
    'h02>>1:
     board_reg01 <= dbus_latched;

    'h0C>>1:
      if (!(dbus_latched == 4'hF)) begin // Reserved byte - Should be $FF
        snoop_cfg_next <= 1;
      end
    'h10>>1:
      if (dbus_latched == 4'hF) begin // Manufacturer ID - Should not be $FFFF
        mfg_bad[3] <= 1;
      end
    'h12>>1:
      if (dbus_latched == 4'hF) begin // Manufacturer ID - Should not be $FFFF
        mfg_bad[2] <= 1;
      end
    'h14>>1:
      if (dbus_latched == 4'hF) begin // Manufacturer ID - Should not be $FFFF
        mfg_bad[1] <= 1;
      end
    'h16>>1:
      if (dbus_latched == 4'hF) begin // Manufacturer ID - Should not be $FFFF
        mfg_bad[0] <= 1;
      end
    'h3C>>1:
      if (snoop_cfg_next == 1) begin
       snoop_cfg <= 1;
      end else if (mfg_bad[3:0] == 4'b1111) begin
       snoop_cfg <= 1;
      end
    endcase
  end else if (ADDR_HI[23:16] == 8'hE8 & !RWn & !snoop_cfg) begin
    // The other board is now being given it's address
    // Adjust our offering appropriately
    if (ADDR_LO[6:1] == 'h48>>1) begin
      if (board_reg00[3:2] == 2'b11) begin
        case (board_reg01[2:0])
          3'b000: // 8MB
          snooped_autoconfig_state <= SHUTUP;
         3'b100, 3'b101, 3'b110: // 512k/1/2MB
           if (snooped_autoconfig_state < SHUTUP) begin
            snooped_autoconfig_state <= snooped_autoconfig_state + 1;
           end
         3'b111: // 4MB
           if (snooped_autoconfig_state < Offer_Block3) begin
            snooped_autoconfig_state <= snooped_autoconfig_state + 2;
           end else begin
            snooped_autoconfig_state <= SHUTUP;
           end
        endcase
      end
    end
  end
end

reg [2:0] autoconfig_state;

assign DBUS[15:12] = (autoconfig_cycle & RWn & !ASn & !UDSn) ? data_out[3:0] : 4'bZ;

assign autoconfig_cycle = (ADDR_HI[23:16] == 8'hE8) & snoop_cfg & CFGOUTn;

// Register Config in/out at end of bus cycle
always @(posedge ASn or negedge RESETn)
begin
  if (!RESETn) begin
    CFGOUTn <= 1'b1;
  end else begin
    CFGOUTn <= !shutup;
  end
end

// Offer up to 8MB in 2MB Blocks
always @(posedge CLK or negedge RESETn)
begin
  if (!RESETn) begin
    data_out <= 'bZ;
  end else if (autoconfig_cycle & RWn) begin
    case (ADDR_LO[6:1])      
      'h00:   data_out <= 4'b1110;
      'h01:   data_out <= 4'b0110;
      'h02:   data_out <= ~prod_id[7:4]; // Product number
      'h03:   data_out <= ~prod_id[3:0]; // Product number
      'h04:   data_out <= ~4'b1000;
      'h05:   data_out <= ~4'b0000;
      'h08:   data_out <= ~mfg_id[15:12]; // Manufacturer ID
      'h09:   data_out <= ~mfg_id[11:8];  // Manufacturer ID
      'h0A:   data_out <= ~mfg_id[7:4];   // Manufacturer ID
      'h0B:   data_out <= ~mfg_id[3:0];   // Manufacturer ID
      'h10:   data_out <= ~serial[15:12]; // Serial number
      'h11:   data_out <= ~serial[11:8];  // Serial number
      'h12:   data_out <= ~serial[7:4];   // Serial number
      'h13:   data_out <= ~serial[3:0];   // Serial number
      'h20:   data_out <= 4'b0;
      'h21:   data_out <= 4'b0;
      default: data_out <= 4'hF;
    endcase
  end
end

always @(negedge UDSn or negedge RESETn)
begin
  if (!RESETn) begin
    configured       <= 1'b0;
    shutup           <= 1'b0;
    addr_match       <= 8'b00000000;
    autoconfig_state <= Offer_Block1;
    autoconfig_setup <= 1'b0;
  end else if (autoconfig_setup == 0 & snoop_cfg == 1) begin
    autoconfig_state <= snooped_autoconfig_state;
    autoconfig_setup <= 1;
    if (snooped_autoconfig_state == SHUTUP) begin
      shutup <= 1;
    end
  end else if (autoconfig_cycle & !ASn & !RWn) begin
    if (ADDR_LO[6:1] == 'h26) begin
      // Shutup register
      shutup <= 1;
    end
    else if (ADDR_LO[6:1] == 'h24) begin
      // Configure Address Register
      begin
        case(DBUS)
          4'h2:    addr_match <= (addr_match|8'b00000011);
          4'h4:    addr_match <= (addr_match|8'b00001100);
          4'h6:    addr_match <= (addr_match|8'b00110000);
          4'h8:    addr_match <= (addr_match|8'b11000000);
        endcase
        if (autoconfig_state < Offer_Block4) begin
          autoconfig_state <= autoconfig_state + 1;
        end else begin
          shutup <= 1;
        end
      end
      configured <= 1'b1;
    end
  end
end
`endif


// Memory controller
`ifndef Size_4MB
assign RAS0n = !((ADDR_HI[22:21] == 2'b01 & access_ras) | (refresh_ras & refresh_cas)); // $200000-3FFFFF
assign RAS1n = !((ADDR_HI[22:21] == 2'b10 & access_ras) | (refresh_ras & refresh_cas)); // $400000-5FFFFF
assign RAS2n = !((ADDR_HI[22:21] == 2'b11 & access_ras) | (refresh_ras & refresh_cas)); // $600000-7FFFFF
assign RAS3n = !((ADDR_HI[22:21] == 2'b00 & access_ras) | (refresh_ras & refresh_cas)); // $800000-9FFFFF
`else
assign RAS0n = 1'b1;
assign RAS1n = 1'b1;
assign RAS2n = !((ADDR_HI[21] == 1'b0 & access_ras) | (refresh_ras & refresh_cas));
assign RAS3n = !((ADDR_HI[21] == 1'b1 & access_ras) | (refresh_ras & refresh_cas));
`endif

assign UCASn = !((access_ucas) | refresh_cas);
assign LCASn = !((access_lcas) | refresh_cas);

// CAS before RAS refresh
// CAS Asserted in S1 & S2
// RAS Asserted in S2
always @(negedge CLK or negedge RESETn)
begin
  if (!RESETn) begin
    refresh_cas <= 1'b0;
  end else begin
    refresh_cas <= (!refresh_cas & ASn & !access_ras);
  end
end

always @(posedge CLK or negedge RESETn)
begin
  if (!RESETn) begin
    refresh_ras <= 1'b0;
  end else begin
    refresh_ras <= refresh_cas;
  end
end

// Memory access
always @(negedge CLK or negedge RESETn)
begin
  if (!RESETn) begin
    ram_cycle = 1'b0;
  end else begin
`ifdef autoconfig
    ram_cycle = (
      ((ADDR_HI[23:20] == 4'h2) & addr_match[0]) |
      ((ADDR_HI[23:20] == 4'h3) & addr_match[1]) |
      ((ADDR_HI[23:20] == 4'h4) & addr_match[2]) |
      ((ADDR_HI[23:20] == 4'h5) & addr_match[3]) |
      ((ADDR_HI[23:20] == 4'h6) & addr_match[4]) |
      ((ADDR_HI[23:20] == 4'h7) & addr_match[5]) |
      ((ADDR_HI[23:20] == 4'h8) & addr_match[6]) |
      ((ADDR_HI[23:20] == 4'h9) & addr_match[7])
      ) & !ASn & configured;
`else
    ram_cycle = ((ADDR_HI[23:20] >= 4'h2) & (ADDR_HI[23:20] <= 4'h9) & !ASn);
`endif
  end
end

always @(posedge CLK or posedge ASn)
begin
  if (ASn) begin
    access_ras  <= 1'b0;
    access_ucas <= 1'b0;
    access_lcas <= 1'b0;
  end else begin
    access_ras  <= (ram_cycle & !access_ucas & !access_lcas); // Assert @ S4, Deassert @ S7
    access_ucas <= (access_ras & !UDSn);                      // Assert @ S6, Deassert @ S7
    access_lcas <= (access_ras & !LDSn);                      // Assert @ S6, Deassert @ S7
  end
end

// Row/Col mux
// Switch to ROW address at falling edge of S0
// Switch to column address at falling edge of S4
always @(negedge CLK)
begin
  mux_switch <= access_ras;
  if (access_ras) begin
    MA0 <= ADDR_HI[19];
    MA1 <= ADDR_HI[20];
  end else begin
    MA0 <= ADDR_LO[1];
    MA1 <= ADDR_LO[2];
  end
end


// R/W Hack because no CPLD pin for R/W
always @(posedge CLK or posedge ASn)
begin
  if (ASn) begin
    RWn <= 1'b1;
  end else begin
    if (!ASn & AS_last) begin
      if (UDSn & LDSn) begin
        RWn <= 1'b0;
      end else begin
        RWn <= 1'b1;
      end
    end
  end
end

always @(posedge CLK) begin
  AS_last <= ASn;
end
endmodule
