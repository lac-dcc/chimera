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
// Abstract : Simple 16-bit SRAM component behavioral model
//-----------------------------------------------------------------------------

module cmsdk_sram256x16 #(
  parameter  AW       = 18, // Address width
  parameter  filename = "")
 (
  input  wire  [AW-1:0]     Address,
  inout  wire  [15:0]       DataIO,
  input  wire               WEn,
  input  wire               OEn,
  input  wire               CEn,
  input  wire               LBn,
  input  wire               UBn);

reg    [7:0]         ram_data[0:((1<<AW)-1)]; // 256k byte of RAM data
integer              i;                 // Loop counter
wire                 out_enable_lb;       // Lower byte output enable
wire                 out_enable_ub;       // Upper byte output enable
wire   [AW-1:0]      array_addr;
reg    [15:0]        read_data;


// Start of main code
// Initialize RAM
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

// Read control
assign array_addr   = {Address[AW-1:1], 1'b0};
assign out_enable_lb = ((WEn) & (~OEn) & (~CEn) & (~LBn));
assign out_enable_ub = ((WEn) & (~OEn) & (~CEn) & (~UBn));

// Read from array
always @(array_addr or WEn or OEn or CEn)
begin
  if ((WEn) & (~OEn) & (~CEn))
    begin
    read_data[ 7:0] = ram_data[array_addr];
    read_data[15:8] = ram_data[array_addr+1];
    end
  else
    begin
    read_data[ 7:0] = 8'hxx;
    read_data[15:8] = 8'hxx;
    end
end

// Output tristate buffer
assign DataIO[ 7:0] = (out_enable_lb) ? read_data[ 7:0] : 8'hzz;
assign DataIO[15:8] = (out_enable_ub) ? read_data[15:8] : 8'hzz;

// Write
always @(array_addr or WEn or CEn or LBn or UBn or DataIO)
begin
  if ((~WEn) & (~CEn))
    begin
    if (~LBn)
      begin
      ram_data[array_addr  ] = DataIO[ 7:0];
      end
    if (~UBn)
      begin
      ram_data[array_addr+1] = DataIO[15:8];
      end
    end
end

endmodule
