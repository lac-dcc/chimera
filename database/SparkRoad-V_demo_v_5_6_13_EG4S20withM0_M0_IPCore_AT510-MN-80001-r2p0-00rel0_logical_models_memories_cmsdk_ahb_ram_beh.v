//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-04-10 15:27:13 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243506 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Simple AHB RAM behavioral model
//-----------------------------------------------------------------------------
module cmsdk_ahb_ram_beh #(
  parameter AW       = 16,// Address width
  parameter filename = "",
  parameter WS_N     = 0, // First access wait state
  parameter WS_S     = 0) // Subsequent access wait state
 (
  input  wire          HCLK,    // Clock
  input  wire          HRESETn, // Reset
  input  wire          HSEL,    // Device select
  input  wire [AW-1:0] HADDR,   // Address
  input  wire [1:0]    HTRANS,  // Transfer control
  input  wire [2:0]    HSIZE,   // Transfer size
  input  wire          HWRITE,  // Write control
  input  wire [31:0]   HWDATA,  // Write data
  input  wire          HREADY,  // Transfer phase done
  output wire          HREADYOUT, // Device ready
  output wire [31:0]   HRDATA,  // Read data output
  output wire          HRESP);   // Device response (always OKAY)

  // Internal signals
  reg    [7:0]  ram_data[0:((1<<AW)-1)]; // 64k byte of RAM data
  wire          read_valid;     // Address phase read valid
  wire          write_valid;    // Address phase write valid
  reg           read_enable;    // Data phase read enable
  reg           write_enable;   // Data phase write enable
  reg    [3:0]  reg_byte_lane;  // Data phase byte lane
  reg    [3:0]  next_byte_lane; // Next state of reg_byte_lane

  reg    [7:0]  rdata_out_0;    // Read Data Output byte#0
  reg    [7:0]  rdata_out_1;    // Read Data Output byte#1
  reg    [7:0]  rdata_out_2;    // Read Data Output byte#2
  reg    [7:0]  rdata_out_3;    // Read Data Output byte#3
  reg [AW-1:0]  word_addr;      // Word aligned address
  wire [AW-1:0] nxt_word_addr;  // Word aligned address
  integer       i;              // Loop counter

  // Wait state control
  wire  [31:0]  nxt_waitstate_cnt;
  reg   [31:0]  reg_waitstate_cnt;
  wire          sequential_access;

  // Start of main code
  // Initialize ROM
  initial
    begin
    for (i=0;i<(1<<AW);i=i+1)
      begin
      ram_data[i] = 8'h00; //Initialize all data to 0
      end
      if (filename != "")
        begin
        $readmemh(filename, ram_data); // Then read in program code
        end
    end

  // Generate read control (address phase)
  assign read_valid  = HSEL & HREADY & HTRANS[1] & (~HWRITE);
  // Generate write control (address phase)
  assign write_valid = HSEL & HREADY & HTRANS[1] & HWRITE;

  // Read enable for each byte (address phase)
  always @(read_valid or write_valid or HADDR or HSIZE)
  begin
  if (read_valid | write_valid)
    begin
    case (HSIZE)
      0 : // Byte
        begin
        case (HADDR[1:0])
          0: next_byte_lane = 4'b0001; // Byte 0
          1: next_byte_lane = 4'b0010; // Byte 1
          2: next_byte_lane = 4'b0100; // Byte 2
          3: next_byte_lane = 4'b1000; // Byte 3
          default:next_byte_lane = 4'b0000; // Address not valid
        endcase
        end
      1 : // Halfword
        begin
        if (HADDR[1])
          next_byte_lane = 4'b1100; // Upper halfword
        else
          next_byte_lane = 4'b0011; // Lower halfword
        end
      default : // Word
        next_byte_lane = 4'b1111; // Whole word
    endcase
    end
  else
    next_byte_lane = 4'b0000; // Not reading
  end

  // Registering control signals to data phase
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      begin
      reg_byte_lane <= 4'b0000;
      read_enable   <= 1'b0;
      write_enable  <= 1'b0;
      word_addr     <= {AW{1'b0}};
      end
    else if (HREADY)
      begin
      reg_byte_lane <= next_byte_lane;
      read_enable   <= read_valid;
      write_enable  <= write_valid;
      word_addr     <= nxt_word_addr;
      end
  end

  assign nxt_word_addr = {HADDR[AW-1:2], 2'b00};

  // Read operation
  always @(read_enable or reg_byte_lane or word_addr)
    if ((read_enable & reg_byte_lane[0]))
      rdata_out_0 = ram_data[word_addr  ];
    else
      rdata_out_0 = 8'h00;

  always @(read_enable or reg_byte_lane or word_addr)
    if ((read_enable & reg_byte_lane[1]))
      rdata_out_1 = ram_data[word_addr+1];
    else
      rdata_out_1 = 8'h00;

  always @(read_enable or reg_byte_lane or word_addr)
    if ((read_enable & reg_byte_lane[2]))
      rdata_out_2 = ram_data[word_addr+2];
    else
      rdata_out_2 = 8'h00;

  always @(read_enable or reg_byte_lane or word_addr)
    if ((read_enable & reg_byte_lane[3]))
      rdata_out_3 = ram_data[word_addr+3];
    else
      rdata_out_3 = 8'h00;

  // Registered write
  always @(posedge HCLK)
  begin
    if (write_enable &  reg_byte_lane[0])
      begin
      ram_data[word_addr  ] = HWDATA[ 7: 0];
      end
    if (write_enable &  reg_byte_lane[1])
      begin
      ram_data[word_addr+1] = HWDATA[15: 8];
      end
    if (write_enable &  reg_byte_lane[2])
      begin
      ram_data[word_addr+2] = HWDATA[23:16];
      end
    if (write_enable &  reg_byte_lane[3])
      begin
      ram_data[word_addr+3] = HWDATA[31:24];
      end
  end

  // Wait state control
    //  Wait state generate treat access as sequential if
    //  HTRANS = 2'b11, or access address is in the same word,
    //  or if the access is in the next word
  assign sequential_access = (HTRANS==2'b11) |
                            (HADDR[AW-1:2] == word_addr[AW-1:2]) |
                            (HADDR[AW-1:2] == (word_addr[AW-1:2]+1));
  assign nxt_waitstate_cnt = (read_valid|write_valid) ?
                             ((sequential_access) ? WS_S : WS_N) :
                             ((reg_waitstate_cnt!=0) ? (reg_waitstate_cnt - 1) : 0);
    // Register wait state counter
  always @(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      reg_waitstate_cnt <= 0;
    else
      reg_waitstate_cnt <= nxt_waitstate_cnt;
  end

  // Connect to top level
  assign HREADYOUT = (reg_waitstate_cnt==0) ? 1'b1 : 1'b0;
  assign HRESP     = 1'b0; // Always response with OKAY
  // Read data output
  assign HRDATA    = {rdata_out_3, rdata_out_2, rdata_out_1,rdata_out_0};

endmodule
