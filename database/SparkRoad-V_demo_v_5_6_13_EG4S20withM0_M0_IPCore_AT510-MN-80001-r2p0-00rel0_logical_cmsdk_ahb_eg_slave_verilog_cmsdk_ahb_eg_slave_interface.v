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
//      Checked In          : $Date: 2012-07-30 18:07:21 +0100 (Mon, 30 Jul 2012) $
//
//      Revision            : $Revision: 216980 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB-lite example slave interface module. Transfer AHB-Lite BUS protocol to
//            simple register read write protocol
//-----------------------------------------------------------------------------
module cmsdk_ahb_eg_slave_interface #(
  //parameter for address width
  parameter   ADDRWIDTH=12)
 (
  input  wire                  hclk,       // clock
  input  wire                  hresetn,    // reset

  // AHB connection to master
  input  wire                  hsels,
  input  wire [ADDRWIDTH-1:0]  haddrs,
  input  wire [1:0]            htranss,
  input  wire [2:0]            hsizes,
  input  wire                  hwrites,
  input  wire                  hreadys,
  input  wire [31:0]           hwdatas,

  output wire                  hreadyouts,
  output wire                  hresps,
  output wire [31:0]           hrdatas,

   // Register interface
  output wire [ADDRWIDTH-1:0]  addr,
  output wire                  read_en,
  output wire                  write_en,
  output wire [3:0]            byte_strobe,
  output wire [31:0]           wdata,
  input  wire [31:0]           rdata);

  // ----------------------------------------
  // Internal wires declarations
   wire                   trans_req= hreadys & hsels & htranss[1];
    // transfer request issued only in SEQ and NONSEQ status and slave is
    // selected and last transfer finish

   wire                   ahb_read_req  = trans_req & (~hwrites);// AHB read request
   wire                   ahb_write_req = trans_req &  hwrites;  // AHB write request
   wire                   update_read_req;    // To update the read enable register
   wire                   update_write_req;   // To update the write enable register

   reg  [ADDRWIDTH-1:0]   addr_reg;     // address signal, registered
   reg                    read_en_reg;  // read enable signal, registered
   reg                    write_en_reg; // write enable signal, registered

   reg  [3:0]             byte_strobe_reg; // registered output for byte strobe
   reg  [3:0]             byte_strobe_nxt; // next state for byte_strobe_reg
  //-----------------------------------------------------------
  // Module logic start
  //----------------------------------------------------------

  // Address signal registering, to make the address and data active at the same cycle
  always @(posedge hclk or negedge hresetn)
  begin
    if (~hresetn)
      addr_reg <= {(ADDRWIDTH){1'b0}}; //default address 0 is selected
    else if (trans_req)
      addr_reg <= haddrs[ADDRWIDTH-1:0];
  end


  // register read signal generation
  assign update_read_req = ahb_read_req | (read_en_reg & hreadys); // Update read enable control if
                                 //  1. When there is a valid read request
                                 //  2. When there is an active read, update it at the end of transfer (HREADY=1)

  always @(posedge hclk or negedge hresetn)
  begin
    if (~hresetn)
      begin
        read_en_reg <= 1'b0;
      end
    else if (update_read_req)
      begin
        read_en_reg  <= ahb_read_req;
      end
  end

  // register write signal generation
  assign update_write_req = ahb_write_req |( write_en_reg & hreadys);  // Update write enable control if
                                 //  1. When there is a valid write request
                                 //  2. When there is an active write, update it at the end of transfer (HREADY=1)

  always @(posedge hclk or negedge hresetn)
  begin
    if (~hresetn)
      begin
        write_en_reg <= 1'b0;
      end
    else if (update_write_req)
      begin
        write_en_reg  <= ahb_write_req;
      end
  end

  // byte strobe signal
   always @(hsizes or haddrs)
   begin
     if (hsizes == 3'b000)    //byte
       begin
         case(haddrs[1:0])
           2'b00: byte_strobe_nxt = 4'b0001;
           2'b01: byte_strobe_nxt = 4'b0010;
           2'b10: byte_strobe_nxt = 4'b0100;
           2'b11: byte_strobe_nxt = 4'b1000;
           default: byte_strobe_nxt = 4'bxxxx;
         endcase
       end
     else if (hsizes == 3'b001) //half word
       begin
         if(haddrs[1]==1'b1)
           byte_strobe_nxt = 4'b1100;
         else
           byte_strobe_nxt = 4'b0011;
       end
     else // default 32 bits, word
       begin
           byte_strobe_nxt = 4'b1111;
       end
   end

  always @(posedge hclk or negedge hresetn)
  begin
    if (~hresetn)
      byte_strobe_reg <= {4{1'b0}};
    else if (update_read_req|update_write_req)
      // Update byte strobe registers if
      // 1. if there is a valid read/write transfer request
      // 2. if there is an on going transfer
      byte_strobe_reg  <= byte_strobe_nxt;
  end

  //-----------------------------------------------------------
  // Outputs
  //-----------------------------------------------------------
  // For simplify the timing, the master and slave signals are connected directly, execpt data bus.
  assign addr        = addr_reg[ADDRWIDTH-1:0];
  assign read_en     = read_en_reg;
  assign write_en    = write_en_reg;
  assign wdata       = hwdatas;
  assign byte_strobe = byte_strobe_reg;

  assign hreadyouts  = 1'b1;  // slave always ready
  assign hresps      = 1'b0;  // OKAY response from slave
  assign hrdatas     = rdata;
  //-----------------------------------------------------------
  //Module logic end
  //----------------------------------------------------------


endmodule

