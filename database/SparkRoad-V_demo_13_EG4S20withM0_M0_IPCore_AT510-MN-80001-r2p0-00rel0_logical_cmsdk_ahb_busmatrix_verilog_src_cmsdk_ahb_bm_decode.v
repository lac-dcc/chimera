//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2001-2013-<<copyright_year>> ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-01-23 11:45:45 +0000 (Wed, 23 Jan 2013) $
//
//      Revision            : $Revision: 234562 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------
//  Abstract             : The MatrixDecode is used to determine which output
//                         stage is required for a particular access. Addresses
//                         that do not map to an Output port are diverted to
//                         the local default slave.
//
//  Notes               : The bus matrix has <<connectivity>> connectivity.
//
//-----------------------------------------------------------------------------

<<timescale_directive>>

module <<matrix_decode_name>> (

    // Common AHB signals
    HCLK,
    HRESETn,

//---------------------------- << start remap >> -------------------------------
    // Internal address remapping control
    remapping_dec,

//----------------------------- << end remap >> --------------------------------
    // Signals from the Input stage
    HREADYS,
    sel_dec,
    decode_addr_dec,
    trans_dec,

//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Bus-switch output <<out>>
    active_dec<<out>>,
    readyout_dec<<out>>,
    resp_dec<<out>>,
    rdata_dec<<out>>,
//---------------------------- << start user >> --------------------------------
    ruser_dec<<out>>,
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
    // Output port selection signals
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    sel_dec<<out>>,
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------

    // Selected Output port data and control signals
    active_dec,
    HREADYOUTS,
    HRESPS,
//---------------------------- << start user >> --------------------------------
    HRUSERS,
//----------------------------- << end user >> ---------------------------------
    HRDATAS

    );


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    input         HCLK;           // AHB System Clock
    input         HRESETn;        // AHB System Reset

//---------------------------- << start remap >> -------------------------------
    // Internal address remapping control
    input   [<<idw_remap>>:0] remapping_dec;      // Internal remap signal

//----------------------------- << end remap >> --------------------------------
    // Signals from the Input stage
    input         HREADYS;        // Transfer done
    input         sel_dec;            // HSEL input
    input [<<addr>>:10] decode_addr_dec;     // HADDR decoder input
    input   [1:0] trans_dec;          // Input port HTRANS signal

//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Bus-switch output MI<<out>>
    input         active_dec<<out>>;        // Output stage MI<<out>> active_dec signal
    input         readyout_dec<<out>>;      // HREADYOUT input
    input   [<<resp>>:0] resp_dec<<out>>;          // HRESP input
    input  [<<data>>:0] rdata_dec<<out>>;         // HRDATA input
//---------------------------- << start user >> --------------------------------
    input  [<<user>>:0] ruser_dec<<out>>;         // HRUSER input
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
    // Output port selection signals
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    output        sel_dec<<out>>;           // HSEL output
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------

    // Selected Output port data and control signals
    output        active_dec;         // Combinatorial active_dec O/P
    output        HREADYOUTS;     // HREADY feedback output
    output  [<<resp>>:0] HRESPS;         // Transfer response
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] HRUSERS;        // User read Data
//----------------------------- << end user >> ---------------------------------
    output [<<data>>:0] HRDATAS;        // Read Data


// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    wire          HCLK;            // AHB System Clock
    wire          HRESETn;         // AHB System Reset
//---------------------------- << start remap >> -------------------------------
    // Internal address remapping control
    wire    [<<idw_remap>>:0] remapping_dec;       // Internal remap signal
//----------------------------- << end remap >> --------------------------------

    // Signals from the Input stage
    wire          HREADYS;         // Transfer done
    wire          sel_dec;             // HSEL input
    wire  [<<addr>>:10] decode_addr_dec;      // HADDR input
    wire    [1:0] trans_dec;           // Input port HTRANS signal

//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Bus-switch output MI<<out>>
    wire          active_dec<<out>>;         // active_dec signal
    wire          readyout_dec<<out>>;       // HREADYOUT input
    wire    [<<resp>>:0] resp_dec<<out>>;           // HRESP input
    wire   [<<data>>:0] rdata_dec<<out>>;          // HRDATA input
//---------------------------- << start user >> --------------------------------
    wire   [<<user>>:0] ruser_dec<<out>>;          // HRUSER input
//----------------------------- << end user >> ---------------------------------
    reg           sel_dec<<out>>;            // HSEL output

//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------

// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------

    // Selected Output port data and control signals
    reg           active_dec;          // Combinatorial active_dec O/P signal
    reg           HREADYOUTS;      // Combinatorial HREADYOUT signal
    reg     [<<resp>>:0] HRESPS;          // Combinatorial HRESPS signal
//---------------------------- << start user >> --------------------------------
    reg    [<<user>>:0] HRUSERS;
//----------------------------- << end user >> ---------------------------------
    reg    [<<data>>:0] HRDATAS;         // Read data bus

    reg     [<<idw_mi>>:0] addr_out_port;     // Address output ports
    reg     [<<idw_mi>>:0] data_out_port;     // Data output ports

    // Default slave signals
    reg           sel_dft_slv;       // HSEL signal
    wire          readyout_dft_slv;  // HREADYOUT signal
    wire    [<<resp>>:0] resp_dft_slv;      // Combinatorial HRESPS signal


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Default slave (accessed when HADDR is unmapped)
//------------------------------------------------------------------------------

  <<default_slave_name>> u_<<default_slave_name>> (

    // Common AHB signals
    .HCLK        (HCLK),
    .HRESETn     (HRESETn),

    // AHB Control signals
    .HSEL        (sel_dft_slv),
    .HTRANS      (trans_dec),
    .HREADY      (HREADYS),
    .HREADYOUT   (readyout_dft_slv),
    .HRESP       (resp_dft_slv)

    );


//------------------------------------------------------------------------------
// Address phase signals
//------------------------------------------------------------------------------

// The address decode is done in two stages. This is so that the address
//  decode occurs in only one process, p_addr_out_portComb, and then the select
//  signal is factored in.
//
// Note that the hexadecimal address values are reformatted to align with the
//  lower bound of decode_addr_dec[<<addr>>:10], which is not a hex character boundary

  always @ (
//----------------------------- << start map >> --------------------------------
             decode_addr_dec or data_out_port or trans_dec
//----------------------------- << end map >> ----------------------------------
//---------------------------- << start remap >> -------------------------------
             decode_addr_dec or
             remapping_dec or data_out_port or trans_dec
//----------------------------- << end remap >> --------------------------------
           )
    begin : p_addr_out_port_comb
//----------------------------- << start map >> --------------------------------
//----------------------------- << start out >> --------------------------------
//----------------------------- << start addr_map >> ---------------------------
//----------------------------- << start addr_region >> ------------------------
      // Address region <<address_map>>
      <<mdelse>>if (((decode_addr_dec >= <<mem_lo>>) & (decode_addr_dec <= <<mem_hi>>))
                           | ((data_out_port == <<idw_mi_v>>'b0<<bin_out>>) & (trans_dec == 2'b00)))
        addr_out_port = <<idw_mi_v>>'b0<<bin_out>>;  // Select Output port MI<<out>>
//------------------------------ << end addr_region >> -------------------------

//----------------------------- << end addr_map >> -----------------------------
//------------------------------ << end out >> ---------------------------------
      else
        addr_out_port = <<idw_mi_v>>'b<<dsid_bin>>;   // Select the default slave
//----------------------------- << end map >> ----------------------------------
//---------------------------- << start remap >> -------------------------------
      case (remapping_dec)  // Composition: <<remapping_vector>>
//----------------------------- << start remap_state >> ------------------------
        <<idw_remap_v>>'b<<bin_remapstate>> : begin
//----------------------------- << start remap_bit >> --------------------------
//----------------------------- << start addr_remap >> -------------------------
//----------------------------- << start remap_region >> -----------------------
          // Remapped address region <<address_map>> due to REMAP[<<remapping_bit>>]
          <<mdelse>>if (((decode_addr_dec >= <<mem_lo>>) & (decode_addr_dec <= <<mem_hi>>))
                           | ((data_out_port == <<idw_mi_v>>'b0<<bin_out>>) & (trans_dec == 2'b00)))
             addr_out_port = <<idw_mi_v>>'b0<<bin_out>>;  // Select Output port MI<<out>>

//------------------------------ << end remap_region >> -------------------------
//----------------------------- << end addr_remap >> ---------------------------
//------------------------------ << end remap_bit >> ---------------------------
//----------------------------- << start out >> --------------------------------
//----------------------------- << start addr_map >> ---------------------------
//----------------------------- << start addr_region >> ------------------------
          // <<region_type>> address region <<address_map>>
          <<mdelse>>if (((decode_addr_dec >= <<mem_lo>>) & (decode_addr_dec <= <<mem_hi>>))
                           | ((data_out_port == <<idw_mi_v>>'b0<<bin_out>>) & (trans_dec == 2'b00)))
             addr_out_port = <<idw_mi_v>>'b0<<bin_out>>;  // Select Output port MI<<out>>
//------------------------------ << end addr_region >> -------------------------

//----------------------------- << end addr_map >> -----------------------------
//------------------------------ << end out >> ---------------------------------
          else
            addr_out_port = <<idw_mi_v>>'b<<dsid_bin>>;   // Select the default slave
        end

//------------------------------ << end remap_state >> -------------------------
        default : addr_out_port = {<<idw_mi_v>>{1'bx}};
      endcase
//----------------------------- << end remap >> --------------------------------
    end // block: p_addr_out_port_comb

  // Select signal decode
  always @ (sel_dec or addr_out_port)
    begin : p_sel_comb
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
      sel_dec<<out>> = 1'b0;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
      sel_dft_slv = 1'b0;

      if (sel_dec)
        case (addr_out_port)
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
          <<idw_mi_v>>'b0<<bin_out>> : sel_dec<<out>> = 1'b1;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
          <<idw_mi_v>>'b<<dsid_bin>> : sel_dft_slv = 1'b1;    // Select the default slave
          default : begin
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
            sel_dec<<out>> = 1'bx;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
            sel_dft_slv = 1'bx;
          end
        endcase // case(addr_out_port)
    end // block: p_sel_comb

// The decoder selects the appropriate active_dec signal depending on which
//  output stage is required for the transfer.
  always @ (
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
             active_dec<<out>> or
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
             addr_out_port
           )
    begin : p_active_comb
      case (addr_out_port)
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
        <<idw_mi_v>>'b0<<bin_out>> : active_dec = active_dec<<out>>;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
        <<idw_mi_v>>'b<<dsid_bin>> : active_dec = 1'b1;         // Select the default slave
        default : active_dec = 1'bx;
      endcase // case(addr_out_port)
    end // block: p_active_comb


//------------------------------------------------------------------------------
// Data phase signals
//------------------------------------------------------------------------------

// The data_out_port needs to be updated when HREADY from the input stage is high.
//  Note: HREADY must be used, not HREADYOUT, because there are occaisions
//  (namely when the holding register gets loaded) when HREADYOUT may be low
//  but HREADY is high, and in this case it is important that the data_out_port
//  gets updated.

  always @ (negedge HRESETn or posedge HCLK)
    begin : p_data_out_port_seq
      if (~HRESETn)
        data_out_port <= {<<idw_mi_v>>{1'b0}};
      else
        if (HREADYS)
          data_out_port <= addr_out_port;
    end // block: p_data_out_port_seq

  // HREADYOUTS output decode
  always @ (
             readyout_dft_slv or
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
             readyout_dec<<out>> or
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
             data_out_port
           )
  begin : p_ready_comb
    case (data_out_port)
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
      <<idw_mi_v>>'b0<<bin_out>> : HREADYOUTS = readyout_dec<<out>>;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
      <<idw_mi_v>>'b<<dsid_bin>> : HREADYOUTS = readyout_dft_slv;    // Select the default slave
      default : HREADYOUTS = 1'bx;
    endcase // case(data_out_port)
  end // block: p_ready_comb

  // HRESPS output decode
  always @ (
             resp_dft_slv or
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
             resp_dec<<out>> or
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
             data_out_port
           )
  begin : p_resp_comb
    case (data_out_port)
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
      <<idw_mi_v>>'b0<<bin_out>> : HRESPS = resp_dec<<out>>;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
      <<idw_mi_v>>'b<<dsid_bin>> : HRESPS = resp_dft_slv;     // Select the default slave
      default : HRESPS = {<<resp_v>>{1'bx}};
    endcase // case (data_out_port)
  end // block: p_resp_comb

  // HRDATAS output decode
  always @ (
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
             rdata_dec<<out>> or
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
             data_out_port
           )
  begin : p_rdata_comb
    case (data_out_port)
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
      <<idw_mi_v>>'b0<<bin_out>> : HRDATAS = rdata_dec<<out>>;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
      <<idw_mi_v>>'b<<dsid_bin>> : HRDATAS = {<<data_v>>{1'b0}};   // Select the default slave
      default : HRDATAS = {<<data_v>>{1'bx}};
    endcase // case (data_out_port)
  end // block: p_rdata_comb
//---------------------------- << start user >> --------------------------------

  // HRUSERS output decode
  always @ (
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
             ruser_dec<<out>> or
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
             data_out_port
           )
  begin : p_ruser_comb
    case (data_out_port)
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
      <<idw_mi_v>>'b0<<bin_out>> : HRUSERS = ruser_dec<<out>>;
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
      <<idw_mi_v>>'b<<dsid_bin>> : HRUSERS = {<<user_v>>{1'b0}};   // Select the default slave
      default : HRUSERS = {<<user_v>>{1'bx}};
    endcase // case (data_out_port)
  end // block: p_ruser_comb
//----------------------------- << end user >> ---------------------------------


endmodule

// --================================= End ===================================--
