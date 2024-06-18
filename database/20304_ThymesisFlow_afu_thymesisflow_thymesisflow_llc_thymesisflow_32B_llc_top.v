// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
// Module designer: Dimitris Syrivelis
// Backup: Christian Pinto, Michele Gazzetti

`timescale 1ns / 10ps

// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_32B_llc_top  (
        input             usr_clk
      , input             reset_n
      // AXI-S clock domain crossing egress (tx) fifo interface
      , input             egress_fifo_tvalid
      , output            egress_fifo_tready
      , input  [255:0]    egress_fifo_tdata
     // AXI-S clock domain crossing ingress (rx) fifo interface
      , output            ingress_fifo_tvalid
      , input             ingress_fifo_tready
      , output  [255:0]   ingress_fifo_tdata
      , input   [9:0]     ingress_data_count
     // AXI-S framing interface tx to 32B serdes 
      , output  [255:0]   serdes_tx_tdata
      , output  [31:0]    serdes_tx_tkeep
      , output            serdes_tx_tlast
      , input             serdes_tx_tready
      , output            serdes_tx_tvalid
     // AXI-S framing interface rx 32B serdes, tready ommitted as serdes  RX cannot stall. 
      , input  [255:0]    serdes_rx_tdata
      , input  [31:0]     serdes_rx_tkeep
      , input             serdes_rx_tlast
      , input             serdes_rx_tvalid
     // CRC check of the delivered flit at serdes  
      , input             serdes_rx_crc_ok
      , input             serdes_rx_crc_valid
      , input             channel_up
     // addr and data interface to BRAM
      , output [7:0]      framer_bram_writea
      , output [7:0]      framer_bram_reada
      , output [255:0]    framer_bram_din
      , input  [255:0]    framer_bram_dout
      , output            framer_bram_wen 
);



wire           stall_push;
wire           parser_is_stalled;
wire  [5:0]    resend_remote_frame_id;
wire           resend_remote_frame_id_valid;
wire  [5:0]    resend_frame_id;
wire           resend_frame_id_valid;

wire  [255:0]  driver_egr_tdata;
wire           driver_egr_tvalid;
wire           driver_egr_tready;
wire  [255:0]  driver_igr_tdata;
wire           driver_igr_tvalid;
wire           driver_igr_tready;

//llc framer driver
thymesisflow_llc_egress_driver TF_32B_DRIVER_EGR
       ( 

         .clock              (usr_clk)               
        ,.reset_n            (reset_n)          
 
        ,.driver_in_tdata    (egress_fifo_tdata)
        ,.driver_in_tvalid   (egress_fifo_tvalid)
        ,.driver_in_tready   (egress_fifo_tready)

        ,.driver_out_tdata   (driver_egr_tdata)
        ,.driver_out_tvalid  (driver_egr_tvalid)
        ,.driver_out_tready  (driver_egr_tready)

);

// llc framer
thymesisflow_llc_framer TFLLC_32B_FRAMER
       (
         .clock                        (usr_clk)
        ,.fifo_in_tdata                (driver_egr_tdata)
        ,.fifo_in_tready               (driver_egr_tready)
        ,.fifo_in_tvalid               (driver_egr_tvalid)
        ,.fifo_out_tdata               (serdes_tx_tdata)
        ,.fifo_out_tkeep               (serdes_tx_tkeep)
        ,.fifo_out_tlast               (serdes_tx_tlast)
        ,.fifo_out_tready              (serdes_tx_tready)
        ,.fifo_out_tvalid              (serdes_tx_tvalid)
        ,.read_data                    (framer_bram_dout)
        ,.reada                        (framer_bram_reada)
        ,.remote_resend_frame_id       (resend_remote_frame_id)
        ,.remote_resend_frame_id_valid (resend_remote_frame_id_valid)
        ,.resend_frame_id              (resend_frame_id)
        ,.resend_frame_id_valid        (resend_frame_id_valid)
        ,.reset_n                      (reset_n)
        ,.wen                          (framer_bram_wen)
        ,.write_data                   (framer_bram_din)
        ,.writea                       (framer_bram_writea)

      );

thymesisflow_llc_parser TFLLC_PARSER
       (
         .clock                         (usr_clk)
        ,.reset_n                       (reset_n)
        ,.crc_ok                        (serdes_rx_crc_ok)
        ,.crc_valid                     (serdes_rx_crc_valid)
        ,.fifo_in_tdata                 (serdes_rx_tdata)
        ,.fifo_in_tkeep                 (serdes_rx_tkeep)
        ,.fifo_in_tlast                 (serdes_rx_tlast)
        ,.fifo_in_tvalid                (serdes_rx_tvalid)
        ,.fifo_out_tdata                (driver_igr_tdata)
        ,.fifo_out_tready               (driver_igr_tready)
        ,.fifo_out_tvalid               (driver_igr_tvalid)
        ,.resend_frame_id               (resend_frame_id)
        ,.resend_frame_id_valid         (resend_frame_id_valid)
        ,.resend_remote_frame_id        (resend_remote_frame_id)
        ,.resend_remote_frame_id_valid  (resend_remote_frame_id_valid)

       );

//llc parser driver
thymesisflow_llc_ingress_driver TF_32B_DRIVER_IGR 
       ( 

         .clock               (usr_clk)               
        ,.reset_n             (reset_n)  

        ,.driver_in_tdata     (driver_igr_tdata)
        ,.driver_in_tvalid    (driver_igr_tvalid)
        ,.driver_in_tready    (driver_igr_tready)

        ,.driver_out_tdata    (ingress_fifo_tdata)
        ,.driver_out_tvalid   (ingress_fifo_tvalid)
        ,.driver_out_tready   (ingress_fifo_tready)

);


endmodule
