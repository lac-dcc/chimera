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
//      Checked In          : $Date: 2013-01-09 12:55:25 +0000 (Wed, 09 Jan 2013) $
//
//      Revision            : $Revision: 233070 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : APB example slave register module.
//            Support AMBA APB3 interface
//            This is an example slave with four 32-bit registers, provides write
//            and read operation. The Data and address valid at the same clock
//            cycle.
//-----------------------------------------------------------------------------

module cmsdk_apb3_eg_slave_reg #(
  // parameter for address width
  parameter   ADDRWIDTH = 12)
 (
  input  wire                   pclk,       // clock
  input  wire                   presetn,    // reset

  // Register interface
  input  wire [ADDRWIDTH-1:0]   addr,
  input  wire                   read_en,
  input  wire                   write_en,
  input  wire [31:0]            wdata,
  input  wire [3:0]             ecorevnum,
  output reg  [31:0]            rdata);

 // Local ID parameters, APB3 example slave has part number of 818
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID4 = 32'h00000004; // 0xFD0 : PID 4
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID5 = 32'h00000000; // 0xFD4 : PID 5
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID6 = 32'h00000000; // 0xFD8 : PID 6
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID7 = 32'h00000000; // 0xFDC : PID 7
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID0 = 32'h00000018; // 0xFE0 : PID 0 APB3 Example slave part number[7:0]
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID1 = 32'h000000B8; // 0xFE4 : PID 1 [7:4] jep106_id_3_0. [3:0] part number [11:8]
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID2 = 32'h0000001B; // 0xFE8 : PID 2 [7:4] revision, [3] jedec_used. [2:0] jep106_id_6_4
localparam  ARM_CMSDK_APB3_EG_SLAVE_PID3 = 32'h00000000; // 0xFEC : PID 3
localparam  ARM_CMSDK_APB3_EG_SLAVE_CID0 = 32'h0000000D; // 0xFF0 : CID 0
localparam  ARM_CMSDK_APB3_EG_SLAVE_CID1 = 32'h000000F0; // 0xFF4 : CID 1 PrimeCell class
localparam  ARM_CMSDK_APB3_EG_SLAVE_CID2 = 32'h00000005; // 0xFF8 : CID 2
localparam  ARM_CMSDK_APB3_EG_SLAVE_CID3 = 32'h000000B1; // 0xFFC : CID 3
         // Note : Customer changing the design should modify
         // - jep106 value (www.jedec.org)
         // - part number (customer define)
         // - Optional revision and modification number (e.g. rXpY)


 //------------------------------------------------------------------------------
 // internal signals
 //------------------------------------------------------------------------------

  reg    [31:0]            data0;
  reg    [31:0]            data1;
  reg    [31:0]            data2;
  reg    [31:0]            data3;
  wire   [3:0]             wr_sel;

 //------------------------------------------------------------------------------
 // module logic start
 //------------------------------------------------------------------------------
  // Address decoding for write operations
  assign wr_sel[0] = ((addr[(ADDRWIDTH-1):2]==10'b0000000000)&(write_en)) ? 1'b1: 1'b0;
  assign wr_sel[1] = ((addr[(ADDRWIDTH-1):2]==10'b0000000001)&(write_en)) ? 1'b1: 1'b0;
  assign wr_sel[2] = ((addr[(ADDRWIDTH-1):2]==10'b0000000010)&(write_en)) ? 1'b1: 1'b0;
  assign wr_sel[3] = ((addr[(ADDRWIDTH-1):2]==10'b0000000011)&(write_en)) ? 1'b1: 1'b0;


 // register write, byte enable


 // Data register: data0
  always @(posedge pclk or negedge presetn)
    begin
    if (~presetn)
      begin
        data0 <= {32{1'b0}}; // Reset data 0 to 0x00000000
      end
    else if (wr_sel[0])
      begin
        data0[31:0] <= wdata[31:0];
      end
    end


 // Data register: data1
  always @(posedge pclk or negedge presetn)
    begin
    if (~presetn)
      begin
        data1 <= {32{1'b0}}; // Reset data 1 to 0x00000000
      end
    else if (wr_sel[1])
      begin
        data1[31:0] <= wdata[31:0];
      end
    end


  // Data register: data2
  always @(posedge pclk or negedge presetn)
    begin
    if (~presetn)
      begin
        data2 <= {32{1'b0}}; // Reset data 2 to 0x00000000
      end
    else if (wr_sel[2])
      begin
        data2[31:0] <= wdata[31:0];
      end
    end


  // Data register: data3
  always @(posedge pclk or negedge presetn)
    begin
    if (~presetn)
      begin
        data3 <= {32{1'b0}}; // Reset data 3 to 0x00000000
      end
    else if (wr_sel[3])
      begin
        data3[31:0] <= wdata[31:0];
      end
    end


 // register read

always @ (read_en or addr or data0 or data1 or data2 or data3 or ecorevnum)
 begin
   case (read_en)
     1'b1:
     begin
       if (addr[11:4] == 8'h00) begin
         case(addr[3:2])
           2'b00: rdata =  data0;
           2'b01: rdata =  data1;
           2'b10: rdata =  data2;
           2'b11: rdata =  data3;
           default: rdata = {32{1'bx}};
         endcase
       end
       else if (addr[11:6] == 6'h3F) begin
         case(addr[5:2])
          // Peripheral IDs and Component IDs.
          // AHB example slave has part number of 818
         4'b0100: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID4; // 0xFD0 : PID 4
         4'b0101: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID5; // 0xFD4 : PID 5
         4'b0110: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID6; // 0xFD8 : PID 6
         4'b0111: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID7; // 0xFDC : PID 7
         4'b1000: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID0; // 0xFE0 : PID 0 APB Example slave part number[7:0]
         4'b1001: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID1; // 0xFE4 : PID 1 [7:4] jep106_id_3_0. [3:0] part number [11:8]
         4'b1010: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID2; // 0xFE8 : PID 2 [7:4] revision, [3] jedec_used. [2:0] jep106_id_6_4
         4'b1011: rdata ={ARM_CMSDK_APB3_EG_SLAVE_PID3[31:8], ecorevnum[3:0], 4'h0};
                                         // 0xFEC : PID 3 [7:4] ECO rev number, [3:0]  modification number
         4'b1100: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID0; // 0xFF0 : CID 0
         4'b1101: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID1; // 0xFF4 : CID 1 PrimeCell class
         4'b1110: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID2; // 0xFF8 : CID 2
         4'b1111: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID3; // 0xFFC : CID 3
         // Note : Customer changing the design should modify
         // - jep106 value (www.jedec.org)
         // - part number (customer define)
         // - Optional revision and modification number (e.g. rXpY)
         4'b0000, 4'b0001,4'b0010,4'b0011: rdata = {32'h00000000}; // Unused
         default: rdata =  {32{1'bx}};  // x propogation
         endcase
       end
       else begin
         rdata = {32'h00000000}; // default
       end
   end
   1'b0:
     begin
       rdata =  {32{1'b0}};
     end
   default:
     begin
       rdata =  {32{1'bx}};
     end
   endcase
 end


 //------------------------------------------------------------------------------
 // module logic end
 //------------------------------------------------------------------------------



 endmodule
