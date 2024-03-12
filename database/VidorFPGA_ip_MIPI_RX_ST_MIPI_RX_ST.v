/*
* Copyright 2018 ARDUINO SA (http://www.arduino.cc/)
* This file is part of Vidor IP.
* Copyright (c) 2018
* Authors: Dario Pennisi
*
* This software is released under:
* The GNU General Public License, which covers the main part of 
* Vidor IP
* The terms of this license can be found at:
* https://www.gnu.org/licenses/gpl-3.0.en.html
*
* You can be released from the requirements of the above licenses by purchasing
* a commercial license. Buying such a license is mandatory if you want to modify or
* otherwise use the software for commercial activities involving the Arduino
* software without disclosing the source code of your own applications. To purchase
* a commercial license, send an email to license@arduino.cc.
*
*/

module MIPI_RX
(
  input  [1:0]  iMIPI_D,
  input         iMIPI_CLK,

  output [23:0] oMIPI_DATA,
  output        oMIPI_START,
  output oMIPI_DATAVALID
);


wire [1:0] wMIPI_DH;
wire [1:0] wMIPI_DL;
reg [2:0] rMIPI_ZC ;
reg [11:0] rMIPI_D0,rMIPI_D1 ;
reg rMIPI_HDR, rMIPI_HDR2;
reg rMIPI_VSTART;
reg rMIPI_VDATA;
reg rMIPI_BAYERPOL ;
reg [15:0] rMIPI_LINEMEM [639:0];
reg rMIPI_PIXELVALID;
reg rDMIPI_PIXELVALID;
reg rMIPI_PIXELVALID2;
reg rMIPI_DATAVALID;
reg [7:0] rMIPI_R0[1:0] ;
reg [7:0] rMIPI_G0[1:0] ;
reg [7:0] rMIPI_B0[1:0] ;
reg [7:0] rMIPI_R1[1:0] ;
reg [7:0] rMIPI_G1[1:0] ;
reg [7:0] rMIPI_B1[1:0] ;
reg [2:0] rPRESCALE ;
reg [15:0] rWC      ;
reg rPHASE ;
wire [15:0] wMIPI_DATA      ;
wire [31:0] wMIPI_LB_RAM_DATA;
wire [31:0] wMIPI_LB_DATA;
reg  [47:0] rPREV_MIPI_DATA;
reg rFIRST_LINE;

localparam cMIPI_HT_VSTART = 0;
localparam cMIPI_HT_VEND = 1;
localparam cMIPI_HT_HSTART = 2;
localparam cMIPI_HT_HEND = 3;
localparam cMIPI_HT_RAW8 = 42;

altddio_in #(
  .intended_device_family ( "Cyclone 10 LP"),
  .invert_input_clocks    ( "OFF"),
  .lpm_hint               ( "UNUSED"),
  .lpm_type               ( "altddio_in"),
  .power_up_high          ( "OFF"),
  .width                  ( 2)
) ALTDDIO_IN_INST (
  .datain    (iMIPI_D),
  .inclock   (iMIPI_CLK),
  .dataout_h (wMIPI_DH),
  .dataout_l (wMIPI_DL),
  .aclr      (1'b0),
  .aset      (1'b0),
  .inclocken (1'b1),
  .sclr      (1'b0),
  .sset      (1'b0)
  );

assign wMIPI_LB_DATA= rFIRST_LINE ? 0: wMIPI_LB_RAM_DATA;

altsyncram #(
  .address_aclr_b                     ( "NONE" ),
  .address_reg_b                      ( "CLOCK0" ),
  .clock_enable_input_a               ( "BYPASS" ),
  .clock_enable_input_b               ( "BYPASS" ),
  .clock_enable_output_b              ( "BYPASS" ),
  .intended_device_family             ( "Cyclone 10 LP" ),
  .lpm_type                           ( "altsyncram" ),
  .numwords_a                         ( 1024 ),
  .numwords_b                         ( 1024 ),
  .operation_mode                     ( "DUAL_PORT" ),
  .outdata_aclr_b                     ( "NONE" ),
  .outdata_reg_b                      ( "UNREGISTERED" ),
  .power_up_uninitialized             ( "FALSE" ),
  .read_during_write_mode_mixed_ports ( "DONT_CARE" ),
  .widthad_a                          ( 10 ),
  .widthad_b                          ( 10 ),
  .width_a                            ( 32 ),
  .width_b                            ( 32 ),
  .width_byteena_a                    ( 1 )
) LINE_BUFFER (
  .address_a      (rWC),
  .address_b      (rWC),
  .clock0         (iMIPI_CLK),
  .data_a         ({wMIPI_LB_DATA[15:0],wMIPI_DATA}),
  .wren_a         (rMIPI_DATAVALID&rMIPI_VDATA),
  .q_b            (wMIPI_LB_RAM_DATA),
  .aclr0          (1'b0),
  .aclr1          (1'b0),
  .addressstall_a (1'b0),
  .addressstall_b (1'b0),
  .byteena_a      (1'b1),
  .byteena_b      (1'b1),
  .clock1         (1'b1),
  .clocken0       (1'b1),
  .clocken1       (1'b1),
  .clocken2       (1'b1),
  .clocken3       (1'b1),
  .data_b         ({32{1'b1}}),
  .eccstatus      (),
  .q_a            (),
  .rden_a         (1'b1),
  .rden_b         (1'b1),
  .wren_b         (1'b0)
);


assign wMIPI_DATA = {rMIPI_D1[7:0],rMIPI_D0[7:0]};

always @(posedge iMIPI_CLK)
begin
  // we are receiving 2 bits per clock due to DDR so we need to align data based on phase detection.
  // for this puropse our input shifters are 1 extra bit long to accomodate the extra bit needed
  // to realign data and always have 8 bits out of the shifters
  rMIPI_D0<= rPHASE ? {wMIPI_DH[0],wMIPI_DL[0],rMIPI_D0[8:2]} : {wMIPI_DH[0],wMIPI_DL[0],rMIPI_D0[9:2]};
  rMIPI_D1<= rPHASE ? {wMIPI_DH[1],wMIPI_DL[1],rMIPI_D1[8:2]} : {wMIPI_DH[1],wMIPI_DL[1],rMIPI_D1[9:2]};
  // increment prescaler at each clock
  rPRESCALE<= rPRESCALE+1;
  // make sure these signals go high only for one clock
  rMIPI_DATAVALID<=0;
  rMIPI_PIXELVALID<=0;
  rMIPI_PIXELVALID2<=0;
  // count zeros which are used as a preamble for header
  if (rMIPI_D0[1:0]==0 && rMIPI_D1[1:0]==0) begin
    if (!rMIPI_ZC[2]) 
      rMIPI_ZC<=rMIPI_ZC+1;
  end else begin
    rMIPI_ZC <=0;
  end
  // look for header on both channels and make sure tit's preceeded by zeros
  if ((rMIPI_D0[7:0]==8'b10111000) && (rMIPI_D1[7:0]==8'b10111000) && !rMIPI_VDATA && rMIPI_ZC[2]) begin
    rPRESCALE <=1;
    rMIPI_HDR <= 1;
  end else if ((rMIPI_D0[8:1]==8'b10111000) && (rMIPI_D1[8:1]==8'b10111000) && !rMIPI_VDATA && rMIPI_ZC[2]) begin
    rPRESCALE <=1;
    rMIPI_HDR <= 1;
    // we found header but at opposite phase. we need to reverse phase and re-align data registers
    rPHASE <=!rPHASE;
    if (!rPHASE) begin
      rMIPI_D0<= {wMIPI_DH[0],wMIPI_DL[0],rMIPI_D0[9:3]};
      rMIPI_D1<= {wMIPI_DH[1],wMIPI_DL[1],rMIPI_D1[9:3]};
    end else begin
      rMIPI_D0<= {wMIPI_DH[0],wMIPI_DL[0],rMIPI_D0[8:1]};
      rMIPI_D1<= {wMIPI_DH[1],wMIPI_DL[1],rMIPI_D1[8:1]};
    end
  end
  // no header.. check if prescaler count indicates we received a full byte
  else if (rPRESCALE[1:0]==3&&(!rMIPI_VDATA|rMIPI_HDR2)) begin
    // ... in which case we emit datavalid
    rMIPI_DATAVALID <=1;
  end
  else if ((rPRESCALE[1:0]==3)&&rMIPI_VDATA)
    rMIPI_DATAVALID <=1;
  
  // we received a full byte...
  if (rMIPI_DATAVALID)
  begin
    // is this the first byte of the header?
    if (rMIPI_HDR)
    begin
      // yes... flag next will be second byte of the header
      rMIPI_HDR  <= 0;
      rMIPI_HDR2 <= 1;
      // check data to see which packet kind this is
      case (wMIPI_DATA[7:0])
        cMIPI_HT_VSTART: begin
          // vertical sync. emit a valid data with start flag and reset bayer polarity
          rMIPI_VSTART   <= 1; 
          rMIPI_PIXELVALID <=1;
          rMIPI_BAYERPOL <= 0;
        end
        cMIPI_HT_RAW8: begin
          // 8 bit bayer data. record word count and get ready for data phase 
          rMIPI_VDATA  <= 1; 
          rWC[7:0]     <= wMIPI_DATA[15:8];
        end
      endcase
    end
    else if (rMIPI_HDR2) begin
      // second part of the header... clear some flags
      rMIPI_HDR2 <=0;
      rMIPI_VSTART <=0;
      rFIRST_LINE<=0;
      // this was a vsync. let's remember next is the first line
      if (rMIPI_VSTART) rFIRST_LINE<=1;
      // this is a video packet. let's record the rest of the word count
      if (rMIPI_VDATA) rWC[15:0] <= {wMIPI_DATA[7:0],rWC[7:0]}-2;
      rPREV_MIPI_DATA<=0;
    end
    else if (rMIPI_VDATA) begin
      // we are receiving bayer data and need to convert it to rgb.
      // to do this we record data in a line buffer to have memory of the previous two lines. line buffer has 32 bits and
      // its 16 lower bits contain pevious line while its 16 upper bits contain the second last line.
      // data is coming in as follows:
      // rMIPI_BAYERPOL=1
      // G00 R10 G20 R30          rPREV_MIPI_DATA[39:32] rPREV_MIPI_DATA[47:40] wMIPI_LB_DATA[23:16] wMIPI_LB_DATA[31:24]
      // B01 G11 B21 G31          rPREV_MIPI_DATA[23:16] rPREV_MIPI_DATA[31:24] wMIPI_LB_DATA[7:0]   wMIPI_LB_DATA[15:9]
      // G02 R12 G22 R32          rPREV_MIPI_DATA[7:0]   rPREV_MIPI_DATA[15:8]  wMIPI_DATA[7:0]      wMIPI_DATA[15:8]

      // rMIPI_BAYERPOL=1
      // B00 G10 B20 G30          rPREV_MIPI_DATA[39:32] rPREV_MIPI_DATA[47:40] wMIPI_LB_DATA[23:16] wMIPI_LB_DATA[31:24]
      // G01 R11 G21 R31          rPREV_MIPI_DATA[23:16] rPREV_MIPI_DATA[31:24] wMIPI_LB_DATA[7:0]   wMIPI_LB_DATA[15:9]
      // B02 G12 B22 G32          rPREV_MIPI_DATA[7:0]   rPREV_MIPI_DATA[15:8]  wMIPI_DATA[7:0]      wMIPI_DATA[15:8]
   
      // let's remember the last data that came in.
      rPREV_MIPI_DATA<={wMIPI_LB_DATA,wMIPI_DATA};

      // here we do some math to interpolate pixels to convert from bayer to rgb. since we receive 2 lanes
      // we compute two pixels at time
      if (rMIPI_BAYERPOL) begin
        // this pixel has green info (G11)
        // red 0 is interpolation of top and bottom red pixels (R10+R12)
        rMIPI_R0[1] <= ({1'b0,rPREV_MIPI_DATA[47:40]}+{1'b0,rPREV_MIPI_DATA[15:8]})>>1;
        // green 0 is interpolated with a x pattern where center (G11) value has weight 4 and diagonals (G00,G20,G02 and G22) have weight 1
        rMIPI_G0[1] <=
                    ({1'b0,rPREV_MIPI_DATA[31:24],2'b0}+
                     {3'b0,wMIPI_DATA[7:0]}+
                     {3'b0,rPREV_MIPI_DATA[7:0]}+
                     {3'b0,rPREV_MIPI_DATA[39:32]}+
                     {3'b0,wMIPI_LB_DATA[23:16]})>>3;
        // blue 0 is interpolation of left and right blue pixels (B01+B21)
        rMIPI_B0[1] <= ({1'b0,rPREV_MIPI_DATA[23:16]}+{1'b0,wMIPI_LB_DATA[7:0]})>>1;
        
        // this pixel has blue info (B21)
        // red 1 pixel is the interpolation of a x pattern without center value (R10, R30, R12, R32)
        rMIPI_R1[1] <= ({2'b0,rPREV_MIPI_DATA[47:40]}+
                     {2'b0,wMIPI_LB_DATA[31:24]}     +
                     {2'b0,rPREV_MIPI_DATA[15:8]} +
                     {2'b0,wMIPI_DATA[15:8]}         )>>2;
        // green 1 pixel is the interpolation of a + pattern without center (G20,G11,G31,G22)
        rMIPI_G1[1] <= ({2'b0,rPREV_MIPI_DATA[31:24]}+
                     {2'b0,wMIPI_LB_DATA[15:8]}      +
                     {2'b0,wMIPI_LB_DATA[23:16]}     +
                     {2'b0,wMIPI_DATA[7:0]}          )>>2;
        // blue 1 pixel is the exact pixel value from input (B21)
        rMIPI_B1[1] <= wMIPI_LB_DATA[7:0];
      end else begin
        // this pixel has red info (R11)
        // red 0 pixel is the exact pixel value from input (R11)
        rMIPI_R0[0] <= rPREV_MIPI_DATA[31:24];
        // green 0 pixel is the interpolation of a + pattern without center (G10,G01,G21,G12)
        rMIPI_G0[0] <= ({2'b0,rPREV_MIPI_DATA[47:40]}+
                     {2'b0,wMIPI_LB_DATA[7:0]}       +
                     {2'b0,rPREV_MIPI_DATA[15:8]} +
                     {2'b0,rPREV_MIPI_DATA[23:16]})>>2;
        // blue 0 pixel is the interpolation of a x pattern without center value (B00, B20, B02, B22)
        rMIPI_B0[0] <= ({2'b0,rPREV_MIPI_DATA[39:32]}+
                     {2'b0,wMIPI_LB_DATA[23:16]}     +
                     {2'b0,rPREV_MIPI_DATA[7:0]}  +
                     {2'b0,wMIPI_DATA[7:0]}          )>>2;
        // this pixel has green info (G21)
        // red 1 is interpolation of left and right blue pixels (R11+R31)
        rMIPI_R1[0] <= ({1'b0,rPREV_MIPI_DATA[31:24]}+{1'b0,wMIPI_LB_DATA[15:8]})>>1;
        // green 1 is interpolated with a x pattern where center (G21) value has weight 4 and diagonals (G10,G30,G12 and G32) have weight 1
        rMIPI_G1[0] <= 
                    ({1'b0,wMIPI_LB_DATA[7:0], 2'b0}+
                     {3'b0,wMIPI_DATA[15:8]}+
                     {3'b0,rPREV_MIPI_DATA[15:8]}+
                     {3'b0,rPREV_MIPI_DATA[47:40]}+
                     {3'b0,wMIPI_LB_DATA[31:24]})>>3;
        // blue 1 is interpolation of top and bottom red pixels (B20+B22)
        rMIPI_B1[0] <= ({1'b0,wMIPI_LB_DATA[23:16]}+{1'b0,wMIPI_DATA[7:0]})>>1;
      end
      // issue pixel valid
      rMIPI_PIXELVALID <=1;
      // decrement word count by number of lanes
      rWC<=rWC-2;
      // if data packet is over...
      if (rWC==0) begin
        // exit from data phase if we are in it and invert bayer polarity
        rMIPI_VDATA<=0;
        if (rMIPI_VDATA) begin
          rMIPI_BAYERPOL<=!rMIPI_BAYERPOL;
        end
      end
    end
  end
  // since we are outputting two pixels we need to issue a second pixelvalid
  rDMIPI_PIXELVALID<=rMIPI_PIXELVALID;
  if (rDMIPI_PIXELVALID&&!rMIPI_VSTART)
  begin
    rMIPI_PIXELVALID2 <=1;
  end
end

assign   oMIPI_DATA = rMIPI_PIXELVALID ? {rMIPI_R0[rMIPI_BAYERPOL],rMIPI_G0[rMIPI_BAYERPOL], rMIPI_B0[rMIPI_BAYERPOL]} : {rMIPI_R1[rMIPI_BAYERPOL],rMIPI_G1[rMIPI_BAYERPOL], rMIPI_B1[rMIPI_BAYERPOL]};
assign   oMIPI_START = rMIPI_VSTART;
assign   oMIPI_DATAVALID = rFIRST_LINE ? 0 : rMIPI_PIXELVALID|rMIPI_PIXELVALID2;
  
endmodule

  