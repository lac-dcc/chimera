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
//      Checked In          : $Date: 2013-04-10 15:07:36 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243494 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//     AHB interconnect for debug tester
//-----------------------------------------------------------------------------
//
// This block contains AHB address decoder and AHB multiplexors. It has
// 1 master port and 6 slave ports:
// Master   -   AHB Lite from Cortex-M Processor
// Slave 0  -   AHB Default Slave
// Slave 1  -   ROM
// Slave 2  -   RAM
// Slave 3  -   GPIO 0
// Slave 4  -   GPIO 1
// Slave 5  -   Trace Capture Buffer
//-----------------------------------------------------------------------------

module cmsdk_debug_tester_ahb_interconnect
  (// Inputs
   input wire           HCLK,
   input wire           HRESETn,
   input wire [31:0]    HADDR,
   input wire           HREADYOUTS0,
   input wire [31:0]    HRDATAS0,
   input wire           HRESPS0,
   input wire           HREADYOUTS1,
   input wire [31:0]    HRDATAS1,
   input wire           HRESPS1,
   input wire           HREADYOUTS2,
   input wire [31:0]    HRDATAS2,
   input wire           HRESPS2,
   input wire           HREADYOUTS3,
   input wire [31:0]    HRDATAS3,
   input wire           HRESPS3,
   input wire           HREADYOUTS4,
   input wire [31:0]    HRDATAS4,
   input wire           HRESPS4,
   input wire           HREADYOUTS5,
   input wire [31:0]    HRDATAS5,
   input wire           HRESPS5,
   // Output wires
   output wire          HREADY,
   output wire          HRESP,
   output wire [31:0]   HRDATA,
   output wire          HSELS0,
   output wire          HSELS1,
   output wire          HSELS2,
   output wire          HSELS3,
   output wire          HSELS4,
   output wire          HSELS5
   );

  // Registered HSELs (data phase)
  reg   hsel_s0_r;
  reg   hsel_s1_r;
  reg   hsel_s2_r;
  reg   hsel_s3_r;
  reg   hsel_s4_r;
  reg   hsel_s5_r;

  // HSEL Decoder

  // Memory Map
  // ROM Select: 0x0000_0000 to 0x000F_FFFF
  wire  hsel_s1 = (HADDR[31:16] == 16'h0000);

  // RAM Select: 0x2000_0000 to 0x2000_3FFF
  wire  hsel_s2 = (HADDR[31:16] == 16'h2000) & (HADDR[15:14] == 2'b00);

  // GPIO 0 : 0x4000_0000 to 0x4000_0FFF
  wire  hsel_s3 = (HADDR[31:12] == 20'h4000_0);

  // GPIO 1 : 0x4000_1000 to 0x4000_1FFF
  wire  hsel_s4 = (HADDR[31:12] == 20'h4000_1);

  // TCB : 0x4000_2000 to 0x4000_27FF
  wire  hsel_s5 = (HADDR[31:11] == 21'b0100_0000_0000_0000_0010_0);

  // Everything else goes to AHB Default Slave
  wire  hsel_s0 = ~(hsel_s1 | hsel_s2 | hsel_s3 | hsel_s4 | hsel_s5);

  // Registered HSEL
  always @ (posedge HCLK or negedge HRESETn)
    begin
      if (~HRESETn)
        begin
          hsel_s0_r <= 1'b0;
          hsel_s1_r <= 1'b0;
          hsel_s2_r <= 1'b0;
          hsel_s3_r <= 1'b0;
          hsel_s4_r <= 1'b0;
          hsel_s5_r <= 1'b0;
        end
      else if (HREADY)
        begin
          hsel_s0_r <= hsel_s0;
          hsel_s1_r <= hsel_s1;
          hsel_s2_r <= hsel_s2;
          hsel_s3_r <= hsel_s3;
          hsel_s4_r <= hsel_s4;
          hsel_s5_r <= hsel_s5;
        end
    end

    // hready_m, hresp_m, hrdata_m
    wire [31:0] hrdata_m = ({32{hsel_s0_r}} & HRDATAS0) |
                           ({32{hsel_s1_r}} & HRDATAS1) |
                           ({32{hsel_s2_r}} & HRDATAS2) |
                           ({32{hsel_s3_r}} & HRDATAS3) |
                           ({32{hsel_s4_r}} & HRDATAS4) |
                           ({32{hsel_s5_r}} & HRDATAS5);

    wire        hresp_m = (hsel_s0_r & HRESPS0) |
                          (hsel_s1_r & HRESPS1) |
                          (hsel_s2_r & HRESPS2) |
                          (hsel_s3_r & HRESPS3) |
                          (hsel_s4_r & HRESPS4) |
                          (hsel_s5_r & HRESPS5);


    wire        hready_m = (hsel_s0_r & HREADYOUTS0) |
                           (hsel_s1_r & HREADYOUTS1) |
                           (hsel_s2_r & HREADYOUTS2) |
                           (hsel_s3_r & HREADYOUTS3) |
                           (hsel_s4_r & HREADYOUTS4) |
                           (hsel_s5_r & HREADYOUTS5) |
                           // Reply READY if no slave selected (reset)
                           (~(hsel_s0_r | hsel_s1_r | hsel_s2_r | hsel_s3_r | hsel_s4_r | hsel_s5_r));

    // Output assignments
    assign     HSELS0 = hsel_s0;

    assign     HSELS1 = hsel_s1;

    assign     HSELS2 = hsel_s2;

    assign     HSELS3 = hsel_s3;

    assign     HSELS4 = hsel_s4;

    assign     HSELS5 = hsel_s5;

    assign     HREADY = hready_m;

    assign     HRESP = hresp_m;

    assign     HRDATA = hrdata_m;

endmodule
