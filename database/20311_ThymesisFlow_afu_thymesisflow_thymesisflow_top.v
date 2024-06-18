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
// ******************************************************************************************************************************
// File Name          :  thymesisflow_top.v
// Project            :  ThymesisFlow-P top file for OpenCAPI disaggregated memory bridge
//                       top file stitching the various modules
// Module Description : This file acts as the top file of the thymesisflow AFU remote memory extension.
// ******************************************************************************************************************************

// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_top  (

        input              clock
      , input              reset_n
      //OpenCAPI TLX command flit AXI-S channel
      , input  [162:0]     ocx_tlx_cmd_flit_in_tdata
      , input              ocx_tlx_cmd_flit_in_tvalid
      , output             ocx_tlx_cmd_flit_in_tready
      //OpenCAPI TLX cmddata flit AXI-S channel
      , input  [512:0]     ocx_tlx_cmddata_flit_in_tdata
      , input              ocx_tlx_cmddata_flit_in_tvalid
      , output             ocx_tlx_cmddata_flit_in_tready
      //OpenCAPI TLx Response (cmd/data combined channel) to issued commands
      , output [551:0]     ocx_tlx_resp_tdata
      , output             ocx_tlx_resp_tvalid
      , input              ocx_tlx_resp_tready
      //OpenCAPI TL Response cmd flit
      , input  [39:0]      ocx_tl_resp_tdata
      , input              ocx_tl_resp_tvalid
      , output             ocx_tl_resp_tready
      //OpenCAPI TL Response data AXI-S channel
      , input  [519:0]     ocx_tl_resp_data_tdata
      , input              ocx_tl_resp_data_tvalid
      , output             ocx_tl_resp_data_tready
      //OpenCAPI mem TLx cmd
      , output [199:0]     ocx_tlx_cmd_tdata
      , output             ocx_tlx_cmd_tvalid
      , input              ocx_tlx_cmd_tready
      //OpenCAPI mem TLx data
      , output [519:0]     ocx_tlx_data_tdata
      , output             ocx_tlx_data_tvalid
      , input              ocx_tlx_data_tready
      //Throttles the push of responses when a backlog threshold is violated
      , output [31:0]      tl_resp_fifo_axis_data_count
      //FPGA GTY and reference clock pins coming from the design top file
      , input              serdes_init_clock
      , input              serdes_start0
      , input              serdes_start1
      //mem mode enable by sending ACTAG
      , input              mem_mode_enable
      // Active ACTAG
      , input  [11:0]      active_actag
      //mem mode rty timeout in case of rty cmd responses
      , input  [35:0]      rty_timeout
      // QSFP0 external FPGA pins
      , input              qsfp0_ref_clk_n 
      , input              qsfp0_ref_clk_p 
      , input  [0:3]       qsfp0_rx_n
      , input  [0:3]       qsfp0_rx_p
      , output [0:3]       qsfp0_tx_n
      , output [0:3]       qsfp0_tx_p  
     // QSFP1 external FPGA pins
      , input              qsfp1_ref_clk_n 
      , input              qsfp1_ref_clk_p 
      , input  [0:3]       qsfp1_rx_n
      , input  [0:3]       qsfp1_rx_p
      , output [0:3]       qsfp1_tx_n
      , output [0:3]       qsfp1_tx_p     

);

wire           qsfp0_usr_clk;
wire           qsfp1_usr_clk;
wire           power_on_qsfp0_rout;
wire           power_on_qsfp1_rout;

//Compute glue logic internal wires
wire  [519:0]  ocx_compute_egress_in_tdata;
wire           ocx_compute_egress_in_tvalid;
wire           ocx_compute_egress_in_tready;
wire  [511:0]  ocx_compute_netflit_out_tdata;
wire           ocx_compute_netflit_out_tvalid;
wire           ocx_compute_netflit_out_tready;
wire  [255:0]  clkcross0_egress_fifo_out_tdata;
wire           clkcross0_egress_fifo_out_tvalid;
wire           clkcross0_egress_fifo_out_tready;
wire  [255:0]  clkcross1_egress_fifo_out_tdata;
wire           clkcross1_egress_fifo_out_tvalid;
wire           clkcross1_egress_fifo_out_tready;
wire  [511:0]  ocx_compute_netflit_in_tdata;
wire           ocx_compute_netflit_in_tvalid;
wire           ocx_compute_netflit_in_tready;
wire  [255:0]  clkcross0_ingress_fifo_out_tdata;
wire           clkcross0_ingress_fifo_out_tvalid;
wire           clkcross0_ingress_fifo_out_tready;
wire  [31:0]   clkcross0_ingress_fifo_axis_data_count;
wire  [255:0]  clkcross1_ingress_fifo_out_tdata;
wire           clkcross1_ingress_fifo_out_tvalid;
wire           clkcross1_ingress_fifo_out_tready;
wire  [31:0]   clkcross1_ingress_fifo_axis_data_count;

wire [255:0]   ing_in_tdata0;
wire           ing_in_tready0;
wire           ing_in_tvalid0;
wire [255:0]   ing_in_tdata1;
wire           ing_in_tready1;
wire           ing_in_tvalid1;

wire [255:0]   egr_out_tdata0;
wire           egr_out_tready0;
wire           egr_out_tvalid0;
wire [255:0]   egr_out_tdata1;
wire           egr_out_tready1;
wire           egr_out_tvalid1;


//Memory glue logic internal wires
wire  [511:0]  memory_netflit_out_tdata;
wire           memory_netflit_out_tvalid;
wire           memory_netflit_out_tready;
wire  [511:0]  memory_netflit_in_tdata;
wire           memory_netflit_in_tvalid;
wire           memory_netflit_in_tready;
wire [511:0]   mem_ingr_buf_tdata;
wire           mem_ingr_buf_tvalid;
wire           mem_ingr_buf_tready;

//QSFP0 interface wires
wire           qsfp0_channel_up;
wire           qsfp0_crc_ok;
wire           qsfp0_crc_valid;
wire           qsfp0_pma_init;
wire  [255:0]  qsfp0_rx_tdata;
wire  [31:0]   qsfp0_rx_tkeep;
wire           qsfp0_rx_tvalid;
wire           qsfp0_rx_tlast;
wire  [255:0]  qsfp0_tx_tdata;
wire  [31:0]   qsfp0_tx_tkeep;
wire           qsfp0_tx_tvalid;
wire           qsfp0_tx_tlast;
wire           qsfp0_tx_tready;
wire           qsfp0_power_on_rpb;
//QSFP1 interface wires
wire           qsfp1_channel_up;
wire           qsfp1_crc_ok;
wire           qsfp1_crc_valid;
wire           qsfp1_pma_init;
wire  [255:0]  qsfp1_rx_tdata;
wire  [31:0]   qsfp1_rx_tkeep;
wire           qsfp1_rx_tvalid;
wire           qsfp1_rx_tlast;
wire  [255:0]  qsfp1_tx_tdata;
wire  [31:0]   qsfp1_tx_tkeep;
wire           qsfp1_tx_tvalid;
wire           qsfp1_tx_tlast;
wire           qsfp1_tx_tready;
wire           qsfp1_power_on_rpb;
//Framer BRAM0 interface wires
wire  [7:0]    framer_bram_writea0;
wire  [7:0]    framer_bram_reada0;
wire  [255:0]  framer_bram_din0;
wire  [255:0]  framer_bram_dout0;
wire           framer_bram_wen0;
//Framer BRAM1 interface wires
wire  [7:0]    framer_bram_writea1;
wire  [7:0]    framer_bram_reada1;
wire  [255:0]  framer_bram_din1;
wire  [255:0]  framer_bram_dout1;
wire           framer_bram_wen1;

//Cmd lookup BRAM interface wires
wire [31:0]    memory_egress_cmdlookup_in_portA_addr;
wire           memory_egress_cmdlookup_in_portA_clk;
wire [255:0]   memory_egress_cmdlookup_in_portA_din;
wire [255:0]   memory_egress_cmdlookup_in_portA_dout;
wire           memory_egress_cmdlookup_in_portA_en;
wire           memory_egress_cmdlookup_in_portA_rst;
wire [31:0]    memory_egress_cmdlookup_in_portA_we;

wire [31:0]    memory_ingress_cmdlookup_out_portA_addr;
wire           memory_ingress_cmdlookup_out_portA_clk;
wire [255:0]   memory_ingress_cmdlookup_out_portA_din;
wire [255:0]   memory_ingress_cmdlookup_out_portA_dout;
wire           memory_ingress_cmdlookup_out_portA_en;
wire           memory_ingress_cmdlookup_out_portA_rst;
wire [31:0]    memory_ingress_cmdlookup_out_portA_we;

//Data lookup BRAM0 interface wires
wire [31:0]    memory_egress_datalookup0_in_portA_addr;
wire           memory_egress_datalookup0_in_portA_clk;
wire [511:0]   memory_egress_datalookup0_in_portA_din;
wire [511:0]   memory_egress_datalookup0_in_portA_dout;
wire           memory_egress_datalookup0_in_portA_en;
wire           memory_egress_datalookup0_in_portA_rst;
wire [63:0]    memory_egress_datalookup0_in_portA_we;

wire [31:0]    memory_ingress_datalookup0_out_portA_addr;
wire           memory_ingress_datalookup0_out_portA_clk;
wire [511:0]   memory_ingress_datalookup0_out_portA_din;
wire [511:0]   memory_ingress_datalookup0_out_portA_dout;
wire           memory_ingress_datalookup0_out_portA_en;
wire           memory_ingress_datalookup0_out_portA_rst;
wire [63:0]    memory_ingress_datalookup0_out_portA_we;

//Data lookup BRAM1 interface wires
wire [31:0]    memory_egress_datalookup1_in_portA_addr;
wire           memory_egress_datalookup1_in_portA_clk;
wire [511:0]   memory_egress_datalookup1_in_portA_din;
wire [511:0]   memory_egress_datalookup1_in_portA_dout;
wire           memory_egress_datalookup1_in_portA_en;
wire           memory_egress_datalookup1_in_portA_rst;
wire [63:0]    memory_egress_datalookup1_in_portA_we;

wire [31:0]    memory_ingress_datalookup1_out_portA_addr;
wire           memory_ingress_datalookup1_out_portA_clk;
wire [511:0]   memory_ingress_datalookup1_out_portA_din;
wire [511:0]   memory_ingress_datalookup1_out_portA_dout;
wire           memory_ingress_datalookup1_out_portA_en;
wire           memory_ingress_datalookup1_out_portA_rst;
wire [63:0]    memory_ingress_datalookup1_out_portA_we;

//capptag recycle fifo interface  wires 
wire [15:0]    capptag_fifo_m_axis_tdata;
wire           capptag_fifo_m_axis_tready;
wire           capptag_fifo_m_axis_tvalid;
wire [15:0]    memory_egress_capptag_fifo_out_tdata;
wire           memory_egress_capptag_fifo_out_tready;
wire           memory_egress_capptag_fifo_out_tvalid;

//afu_tlx_data fifo interface wires
wire [511:0]  afu_tlx_data_fifo_m_axis_tdata;
wire          afu_tlx_data_fifo_m_axis_tready;
wire          afu_tlx_data_fifo_m_axis_tvalid;
wire [511:0]  memory_egress_rty_fifo_out_tdata;
wire          memory_egress_rty_fifo_out_tready;
wire          memory_egress_rty_fifo_out_tvalid;

//tl_data fifo interface wires
wire [519:0]  tl_resp_data_fifo_m_axis_tdata;
wire          tl_resp_data_fifo_m_axis_tready;
wire          tl_resp_data_fifo_m_axis_tvalid;

//tl_resp fifo interface wires to facilitate lookup
wire [255:0]  tl_resp_fifo_m_axis_tdata;
wire          tl_resp_fifo_m_axis_tready;
wire          tl_resp_fifo_m_axis_tvalid;
wire [255:0]  memory_egress_tl_fifo_resp_out_tdata;
wire          memory_egress_tl_fifo_resp_out_tready;
wire          memory_egress_tl_fifo_resp_out_tvalid;

//credit management wires
wire [7:0]  qsfp0_rem_ingress_init_creds;
wire [7:0]  qsfp0_rem_ingress_ret_creds;
wire        qsfp0_rem_ingress_getall_creds;
wire        qsfp0_rem_ingress_cons_cred;
wire [7:0]  qsfp0_rem_ingress_avail_creds;

wire [7:0]  qsfp0_loc_ingress_init_creds;
wire [7:0]  qsfp0_loc_ingress_ret_creds;
wire        qsfp0_loc_ingress_getall_creds;
wire        qsfp0_loc_ingress_cons_cred;
wire [7:0]  qsfp0_loc_ingress_avail_creds;

wire [7:0]  qsfp1_rem_ingress_init_creds;
wire [7:0]  qsfp1_rem_ingress_ret_creds;
wire        qsfp1_rem_ingress_getall_creds;
wire        qsfp1_rem_ingress_cons_cred;
wire [7:0]  qsfp1_rem_ingress_avail_creds;

wire [7:0]  qsfp1_loc_ingress_init_creds;
wire [7:0]  qsfp1_loc_ingress_ret_creds;
wire        qsfp1_loc_ingress_getall_creds;
wire        qsfp1_loc_ingress_cons_cred;
wire [7:0]  qsfp1_loc_ingress_avail_creds;

wire [255:0]  qsfp0_bckpr_tdata;
wire          qsfp0_bckpr_tready;
wire          qsfp0_bckpr_tvalid;

wire [255:0]  qsfp1_bckpr_tdata;
wire          qsfp1_bckpr_tready;
wire          qsfp1_bckpr_tvalid;

wire [255:0] qsfp0_bckpr_tdata_ing;
wire         qsfp0_bckpr_tvalid_ing;
wire         qsfp0_bckpr_tready_ing;

wire [255:0] qsfp1_bckpr_tdata_ing;
wire         qsfp1_bckpr_tvalid_ing;
wire         qsfp1_bckpr_tready_ing;

wire [1:0] arb_req_mem_ingr;
wire       arb_req_nxt_mem_ingr;
wire [1:0] arb_sel_mem_ingr;

wire [1:0] c_arb_req_mem_ingr;
wire       c_arb_req_nxt_mem_ingr;
wire [1:0] c_arb_sel_mem_ingr;



//disable credit manager ports that are not used
assign      qsfp0_rem_ingress_getall_creds = 1'b0;
assign      qsfp0_loc_ingress_cons_cred = 1'b0;
assign      qsfp1_rem_ingress_getall_creds = 1'b0;
assign      qsfp1_loc_ingress_cons_cred = 1'b0;


aurora_power_on_reset AURORA_RESET_CONTROL0
     (
         .clock                      (serdes_init_clock)
        ,.pma_init                  (qsfp0_pma_init)
        ,.reset_n                   (serdes_start0)
        ,.rout_n                    (power_on_qsfp0_rout)
        ,.rpb                       (qsfp0_power_on_rpb)
        ,.sys_out_aurora_r          (1'b0)
     );

aurora_power_on_reset AURORA_RESET_CONTROL1
     (
         .clock                     (serdes_init_clock)
        ,.pma_init                  (qsfp1_pma_init)
        ,.reset_n                   (serdes_start1)
        ,.rout_n                    (power_on_qsfp1_rout)
        ,.rpb                       (qsfp1_power_on_rpb)
        ,.sys_out_aurora_r          (1'b0)
     );


           
`ifndef TFMEMORY

dataflit_fifo TF_TLX_AFU_DATAFIFO
       (
         .m_axis_tdata              (ocx_compute_egress_in_tdata)
        ,.m_axis_tready             (ocx_compute_egress_in_tready)
        ,.m_axis_tvalid             (ocx_compute_egress_in_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              ({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ocx_tlx_cmddata_flit_in_tdata})
        ,.s_axis_tready             (ocx_tlx_cmddata_flit_in_tready)
        ,.s_axis_tvalid             (ocx_tlx_cmddata_flit_in_tvalid)
       );


 thymesisflow_64B_compute_egress_adapter TF_COMPUTE_EGRESS_ADAPTER (

          .clock                  (clock)
         ,.reset_n                (reset_n)

         ,.adapter_in_cmd_tdata   ({1'b0,1'b0,1'b0,1'b0,1'b0,ocx_tlx_cmd_flit_in_tdata})  // AXI-S prot 8 byte aligned boundary
         ,.adapter_in_cmd_tvalid  (ocx_tlx_cmd_flit_in_tvalid)
         ,.adapter_in_cmd_tready  (ocx_tlx_cmd_flit_in_tready)

         ,.adapter_in_data_tdata  (ocx_compute_egress_in_tdata)
         ,.adapter_in_data_tvalid (ocx_compute_egress_in_tvalid)
         ,.adapter_in_data_tready (ocx_compute_egress_in_tready)

         ,.adapter_out_tdata      (ocx_compute_netflit_out_tdata)
         ,.adapter_out_tvalid     (ocx_compute_netflit_out_tvalid)
         ,.adapter_out_tready     (ocx_compute_netflit_out_tready)

       );

thymesisflow_64B_32B_routing_egress TF_COMPUTE_ROUTING_EGR
      (

         .clock                     (clock)                   
        ,.reset_n                   (reset_n)

        ,.egr_route_in_tdata         (ocx_compute_netflit_out_tdata)
        ,.egr_route_in_tvalid        (ocx_compute_netflit_out_tvalid)
        ,.egr_route_in_tready        (ocx_compute_netflit_out_tready)

        ,.egr_route_out_tdata0       (egr_out_tdata0)
        ,.egr_route_out_tvalid0      (egr_out_tvalid0)
        ,.egr_route_out_tready0      (egr_out_tready0)
        
        ,.egr_route_out_tdata1       (egr_out_tdata1)
        ,.egr_route_out_tvalid1      (egr_out_tvalid1)
        ,.egr_route_out_tready1      (egr_out_tready1)

      );

//routes 32B flits to AXI-S 64B flit OpenCAPI aware.
thymesisflow_32B_64B_routing_compute_ingress TF_COMPUTE_ROUTING_INGR 
      (
         .clock                     (clock)         
        ,.reset_n                   (reset_n) 
        
        ,.route_in_tdata0           (ing_in_tdata0)
        ,.route_in_tvalid0          (ing_in_tvalid0)
        ,.route_in_tready0          (ing_in_tready0)

        ,.route_in_tdata1           (ing_in_tdata1)
        ,.route_in_tvalid1          (ing_in_tvalid1)
        ,.route_in_tready1          (ing_in_tready1)

        ,.route_out_tdata           (ocx_tlx_resp_tdata)
        ,.route_out_tvalid          (ocx_tlx_resp_tvalid)
        ,.route_out_tready          (ocx_tlx_resp_tready)

        ,.arb_req                   (c_arb_req_mem_ingr)
        ,.arb_req_nxt               (c_arb_req_nxt_mem_ingr)
        ,.arb_sel                   (c_arb_sel_mem_ingr)

      );
      


thymesisflow_rr_arbiter#(.SIZE(2))  TF_COMPUTE_RR_ARB_INGR
      (
           .clock                   (clock)
          ,.reset_n                 (reset_n)
          ,.request_vector          (c_arb_req_mem_ingr)
          ,.request_nxt             (c_arb_req_nxt_mem_ingr)
          ,.selected                (c_arb_sel_mem_ingr)              
      );

 


`endif  
//End of !TFMEMORY

// modules that implement the memory side below.
`ifndef TFCOMPUTE

 thymesisflow_memory_ingress  TF_MEMORY_INGRESS (


            .clock                        (clock)
           ,.reset_n                      (reset_n)
           ,.active_actag                 (active_actag)


           ,.capptag_fifo_tdata           (capptag_fifo_m_axis_tdata)
           ,.capptag_fifo_tready          (capptag_fifo_m_axis_tready)
           ,.capptag_fifo_tvalid          (capptag_fifo_m_axis_tvalid)

           ,.cmdlookup_port_addr          (memory_ingress_cmdlookup_out_portA_addr)
           ,.cmdlookup_port_din           (memory_ingress_cmdlookup_out_portA_din)
           ,.cmdlookup_port_dout          (memory_ingress_cmdlookup_out_portA_dout)
           ,.cmdlookup_port_en            (memory_ingress_cmdlookup_out_portA_en)
           ,.cmdlookup_port_rst           (memory_ingress_cmdlookup_out_portA_rst)
           ,.cmdlookup_in_port_we         (memory_ingress_cmdlookup_out_portA_we)

           ,.d0lookup_port_addr           (memory_ingress_datalookup0_out_portA_addr)
           ,.d0lookup_port_din            (memory_ingress_datalookup0_out_portA_din)
           ,.d0lookup_port_dout           (memory_ingress_datalookup0_out_portA_dout)
           ,.d0lookup_port_en             (memory_ingress_datalookup0_out_portA_en)
           ,.d0lookup_port_rst            (memory_ingress_datalookup0_out_portA_rst)
           ,.d0lookup_in_port_we          (memory_ingress_datalookup0_out_portA_we)

           ,.d1lookup_port_addr           (memory_ingress_datalookup1_out_portA_addr)
           ,.d1lookup_port_din            (memory_ingress_datalookup1_out_portA_din)
           ,.d1lookup_port_dout           (memory_ingress_datalookup1_out_portA_dout)
           ,.d1lookup_port_en             (memory_ingress_datalookup1_out_portA_en)
           ,.d1lookup_port_rst            (memory_ingress_datalookup1_out_portA_rst)
           ,.d1lookup_in_port_we          (memory_ingress_datalookup1_out_portA_we)

           ,.netflit_in_tdata             (memory_netflit_in_tdata)
           ,.netflit_in_tvalid            (memory_netflit_in_tvalid)
           ,.netflit_in_tready            (memory_netflit_in_tready)

           ,.rty_in_tdata                 (afu_tlx_data_fifo_m_axis_tdata)
           ,.rty_in_tvalid                (afu_tlx_data_fifo_m_axis_tvalid)
           ,.rty_in_tready                (afu_tlx_data_fifo_m_axis_tready)

           ,.enable                       (mem_mode_enable)

           ,.tlx_cmd_tdata                (ocx_tlx_cmd_tdata)
           ,.tlx_cmd_tvalid               (ocx_tlx_cmd_tvalid)
           ,.tlx_cmd_tready               (ocx_tlx_cmd_tready)

           ,.tlx_data_tdata               (ocx_tlx_data_tdata)
           ,.tlx_data_tvalid              (ocx_tlx_data_tvalid)
           ,.tlx_data_tready              (ocx_tlx_data_tready)
   );


ocx_memory_egress_lookup  TF_MEMORY_EGRESS_LOOKUP
       (
         .ap_clk                        (clock)
        ,.ap_rst_n                      (reset_n)

        ,.cmdlookup_in_V_Addr_A         (memory_egress_cmdlookup_in_portA_addr)
        ,.cmdlookup_in_V_Clk_A          (memory_egress_cmdlookup_in_portA_clk)
        ,.cmdlookup_in_V_Din_A          (memory_egress_cmdlookup_in_portA_din)
        ,.cmdlookup_in_V_Dout_A         (memory_egress_cmdlookup_in_portA_dout)
        ,.cmdlookup_in_V_EN_A           (memory_egress_cmdlookup_in_portA_en)
        ,.cmdlookup_in_V_Rst_A          (memory_egress_cmdlookup_in_portA_rst)
        ,.cmdlookup_in_V_WEN_A          (memory_egress_cmdlookup_in_portA_we)

        ,.tl_fifo_resp_out_V_V_TDATA    (memory_egress_tl_fifo_resp_out_tdata)
        ,.tl_fifo_resp_out_V_V_TREADY   (memory_egress_tl_fifo_resp_out_tready)
        ,.tl_fifo_resp_out_V_V_TVALID   (memory_egress_tl_fifo_resp_out_tvalid)

        ,.tl_resp_V_V_TDATA             (ocx_tl_resp_tdata)
        ,.tl_resp_V_V_TREADY            (ocx_tl_resp_tready)
        ,.tl_resp_V_V_TVALID            (ocx_tl_resp_tvalid)
       
       );


ocx_memory_egress TF_MEMORY_EGRESS
       (
         .ap_clk                        (clock)
        ,.ap_rst_n                      (reset_n)

        ,.capptag_fifo_out_V_V_TDATA    (memory_egress_capptag_fifo_out_tdata)
        ,.capptag_fifo_out_V_V_TREADY   (memory_egress_capptag_fifo_out_tready)
        ,.capptag_fifo_out_V_V_TVALID   (memory_egress_capptag_fifo_out_tvalid)

        ,.data0lookup_in_V_Addr_A       (memory_egress_datalookup0_in_portA_addr)
        ,.data0lookup_in_V_Clk_A        (memory_egress_datalookup0_in_portA_clk)
        ,.data0lookup_in_V_Din_A        (memory_egress_datalookup0_in_portA_din)
        ,.data0lookup_in_V_Dout_A       (memory_egress_datalookup0_in_portA_dout)
        ,.data0lookup_in_V_EN_A         (memory_egress_datalookup0_in_portA_en)
        ,.data0lookup_in_V_Rst_A        (memory_egress_datalookup0_in_portA_rst)
        ,.data0lookup_in_V_WEN_A        (memory_egress_datalookup0_in_portA_we)

        ,.data1lookup_in_V_Addr_A       (memory_egress_datalookup1_in_portA_addr)
        ,.data1lookup_in_V_Clk_A        (memory_egress_datalookup1_in_portA_clk)
        ,.data1lookup_in_V_Din_A        (memory_egress_datalookup1_in_portA_din)
        ,.data1lookup_in_V_Dout_A       (memory_egress_datalookup1_in_portA_dout)
        ,.data1lookup_in_V_EN_A         (memory_egress_datalookup1_in_portA_en)
        ,.data1lookup_in_V_Rst_A        (memory_egress_datalookup1_in_portA_rst)
        ,.data1lookup_in_V_WEN_A        (memory_egress_datalookup1_in_portA_we)

        ,.data2lookup_in_V_Dout_A       (512'b0)
        ,.data3lookup_in_V_Dout_A       (512'b0)

        ,.enable_V                      (mem_mode_enable)

        ,.net_resp_out_V_V_TDATA        (memory_netflit_out_tdata)
        ,.net_resp_out_V_V_TREADY       (memory_netflit_out_tready)
        ,.net_resp_out_V_V_TVALID       (memory_netflit_out_tvalid)

        ,.rtry_timeout_V                (rty_timeout)

        ,.rty_issue_fifo_out_V_V_TDATA  (memory_egress_rty_fifo_out_tdata)
        ,.rty_issue_fifo_out_V_V_TREADY (memory_egress_rty_fifo_out_tready)
        ,.rty_issue_fifo_out_V_V_TVALID (memory_egress_rty_fifo_out_tvalid)
 
        ,.tl_fifo_data_V_V_TDATA        (tl_resp_data_fifo_m_axis_tdata)
        ,.tl_fifo_data_V_V_TREADY       (tl_resp_data_fifo_m_axis_tready)
        ,.tl_fifo_data_V_V_TVALID       (tl_resp_data_fifo_m_axis_tvalid)

        ,.tl_fifo_resp_V_V_TDATA        (tl_resp_fifo_m_axis_tdata)
        ,.tl_fifo_resp_V_V_TREADY       (tl_resp_fifo_m_axis_tready)
        ,.tl_fifo_resp_V_V_TVALID       (tl_resp_fifo_m_axis_tvalid)

       );


tl_resp_fifo TF_TL_RESP_FIFO
       (
         .axis_data_count           (tl_resp_fifo_axis_data_count)
        ,.m_axis_tdata              (tl_resp_fifo_m_axis_tdata)
        ,.m_axis_tready             (tl_resp_fifo_m_axis_tready)
        ,.m_axis_tvalid             (tl_resp_fifo_m_axis_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              (memory_egress_tl_fifo_resp_out_tdata)
        ,.s_axis_tready             (memory_egress_tl_fifo_resp_out_tready)
        ,.s_axis_tvalid             (memory_egress_tl_fifo_resp_out_tvalid)
       ); 

dataflit_fifo TF_AFU_TLX_DATA_FIFO
       (
         .m_axis_tdata              (tl_resp_data_fifo_m_axis_tdata)
        ,.m_axis_tready             (tl_resp_data_fifo_m_axis_tready)
        ,.m_axis_tvalid             (tl_resp_data_fifo_m_axis_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              (ocx_tl_resp_data_tdata)
        ,.s_axis_tready             (ocx_tl_resp_data_tready)
        ,.s_axis_tvalid             (ocx_tl_resp_data_tvalid)
       );


rty_data_fifo TF_RTY_DATA_FIFO
       (
         .m_axis_tdata              (afu_tlx_data_fifo_m_axis_tdata)
        ,.m_axis_tready             (afu_tlx_data_fifo_m_axis_tready)
        ,.m_axis_tvalid             (afu_tlx_data_fifo_m_axis_tvalid)
        ,.s_axis_aclk               (clock)
        ,.s_axis_aresetn            (reset_n)
        ,.s_axis_tdata              (memory_egress_rty_fifo_out_tdata)
        ,.s_axis_tready             (memory_egress_rty_fifo_out_tready)
        ,.s_axis_tvalid             (memory_egress_rty_fifo_out_tvalid)
       );

capptag_fifo TF_CAPPTAG_FIFO
      (
         .m_axis_tdata             (capptag_fifo_m_axis_tdata)
        ,.m_axis_tready            (capptag_fifo_m_axis_tready)
        ,.m_axis_tvalid            (capptag_fifo_m_axis_tvalid)
        ,.s_axis_aclk              (clock)
        ,.s_axis_aresetn           (reset_n)
        ,.s_axis_tdata             (memory_egress_capptag_fifo_out_tdata)
        ,.s_axis_tready            (memory_egress_capptag_fifo_out_tready)
        ,.s_axis_tvalid            (memory_egress_capptag_fifo_out_tvalid)
      );

//Lookup BRAM cmd fifo that stores flits between egress and ingress paths
cmd_lookup_bram   TF_CMD_LOOKUP_BRAM
      (
         .addra                    (memory_ingress_cmdlookup_out_portA_addr)
        ,.addrb                    (memory_egress_cmdlookup_in_portA_addr)
        ,.clka                     (clock)
        ,.clkb                     (clock)
        ,.dina                     (memory_ingress_cmdlookup_out_portA_din)
        ,.dinb                     (memory_egress_cmdlookup_in_portA_din)
        ,.douta                    (memory_ingress_cmdlookup_out_portA_dout)
        ,.doutb                    (memory_egress_cmdlookup_in_portA_dout)
        ,.ena                      (memory_ingress_cmdlookup_out_portA_en)
        ,.enb                      (memory_egress_cmdlookup_in_portA_en)
        ,.rsta                     (memory_ingress_cmdlookup_out_portA_rst)
        ,.rstb                     (memory_egress_cmdlookup_in_portA_rst)
        ,.wea                      (memory_ingress_cmdlookup_out_portA_we)
        ,.web                      (memory_egress_cmdlookup_in_portA_we)
      );

//Lookup BRAM data fifos that stores 64B flits between egress and ingress paths
data_lookup_bram   TF_DATA_LOOKUP_BRAM0
      (
         .addra                    (memory_ingress_datalookup0_out_portA_addr)
        ,.addrb                    (memory_egress_datalookup0_in_portA_addr)
        ,.clka                     (clock)
        ,.clkb                     (clock)
        ,.dina                     (memory_ingress_datalookup0_out_portA_din)
        ,.dinb                     (memory_egress_datalookup0_in_portA_din)
        ,.douta                    (memory_ingress_datalookup0_out_portA_dout)
        ,.doutb                    (memory_egress_datalookup0_in_portA_dout)
        ,.ena                      (memory_ingress_datalookup0_out_portA_en)
        ,.enb                      (memory_egress_datalookup0_in_portA_en)
        ,.rsta                     (memory_ingress_datalookup0_out_portA_rst)
        ,.rstb                     (memory_egress_datalookup0_in_portA_rst)
        ,.wea                      (memory_ingress_datalookup0_out_portA_we)
        ,.web                      (memory_egress_datalookup0_in_portA_we)
      );

data_lookup_bram   TF_DATA_LOOKUP_BRAM1
      (
         .addra                    (memory_ingress_datalookup1_out_portA_addr)
        ,.addrb                    (memory_egress_datalookup1_in_portA_addr)
        ,.clka                     (clock)
        ,.clkb                     (clock)
        ,.dina                     (memory_ingress_datalookup1_out_portA_din)
        ,.dinb                     (memory_egress_datalookup1_in_portA_din)
        ,.douta                    (memory_ingress_datalookup1_out_portA_dout)
        ,.doutb                    (memory_egress_datalookup1_in_portA_dout)
        ,.ena                      (memory_ingress_datalookup1_out_portA_en)
        ,.enb                      (memory_egress_datalookup1_in_portA_en)
        ,.rsta                     (memory_ingress_datalookup1_out_portA_rst)
        ,.rstb                     (memory_egress_datalookup1_in_portA_rst)
        ,.wea                      (memory_ingress_datalookup1_out_portA_we)
        ,.web                      (memory_egress_datalookup1_in_portA_we)
      );


//routes 2x AXI-S 32B flits to AXI-S 64B flit OpenCAPI aware.
thymesisflow_32B_64B_routing_memory_ingress TF_MEMORY_ROUTING_INGR 
      (
         .clock                     (clock)         
        ,.reset_n                   (reset_n) 
        
        ,.route_in_tdata0           (ing_in_tdata0)
        ,.route_in_tvalid0          (ing_in_tvalid0)
        ,.route_in_tready0          (ing_in_tready0)

        ,.route_in_tdata1           (ing_in_tdata1)
        ,.route_in_tvalid1          (ing_in_tvalid1)
        ,.route_in_tready1          (ing_in_tready1)

        ,.route_out_tdata           (memory_netflit_in_tdata)
        ,.route_out_tvalid          (memory_netflit_in_tvalid)
        ,.route_out_tready          (memory_netflit_in_tready)

        ,.arb_req                   (arb_req_mem_ingr)
        ,.arb_req_nxt               (arb_req_nxt_mem_ingr)
        ,.arb_sel                   (arb_sel_mem_ingr)

      );
      


thymesisflow_rr_arbiter#(.SIZE(2))  TF_MEMORY_RR_ARB_INGR
      (
           .clock                   (clock)
          ,.reset_n                 (reset)
          ,.request_vector          (arb_req_mem_ingr)
          ,.request_nxt             (arb_req_nxt_mem_ingr)
          ,.selected                (arb_sel_mem_ingr)              
      );

      
thymesisflow_64B_32B_routing_egress TF_MEMORY_ROUTING_EGR
      (

         .clock                     (clock)                   
        ,.reset_n                   (reset_n)

        ,.egr_route_in_tdata         (memory_netflit_out_tdata)
        ,.egr_route_in_tvalid        (memory_netflit_out_tvalid)
        ,.egr_route_in_tready        (memory_netflit_out_tready)

        ,.egr_route_out_tdata0       (egr_out_tdata0)
        ,.egr_route_out_tvalid0      (egr_out_tvalid0)
        ,.egr_route_out_tready0      (egr_out_tready0)
        
        ,.egr_route_out_tdata1       (egr_out_tdata1)
        ,.egr_route_out_tvalid1      (egr_out_tvalid1)
        ,.egr_route_out_tready1      (egr_out_tready1)

      );



`endif

//--------------->QSFP0 Network Pipeline
clock_domain_cross_fifo TF_QSFP0_LLC_INGRESS_FIFO 
      (
         .axis_data_count          (clkcross0_ingress_fifo_axis_data_count)
        ,.m_axis_aclk              (clock)
        ,.m_axis_aresetn           (reset_n)
        ,.m_axis_tdata             (qsfp0_bckpr_tdata_ing)
        ,.m_axis_tready            (qsfp0_bckpr_tready_ing)
        ,.m_axis_tvalid            (qsfp0_bckpr_tvalid_ing)
        ,.s_axis_aclk              (qsfp0_usr_clk)
        ,.s_axis_aresetn           (power_on_qsfp0_rout)
        ,.s_axis_tdata             (clkcross0_ingress_fifo_out_tdata)
        ,.s_axis_tready            (clkcross0_ingress_fifo_out_tready)
        ,.s_axis_tvalid            (clkcross0_ingress_fifo_out_tvalid)

      );


//Fifo below implements crossing between OCAPI transceiver clk domain and QSFP0 clk domain
clock_domain_cross_fifo  TF_QSFP0_LLC_EGRESS_FIFO
      (
         .m_axis_aclk              (qsfp0_usr_clk)
        ,.m_axis_aresetn           (power_on_qsfp0_rout)
        ,.m_axis_tdata             (clkcross0_egress_fifo_out_tdata)
        ,.m_axis_tready            (clkcross0_egress_fifo_out_tready)
        ,.m_axis_tvalid            (clkcross0_egress_fifo_out_tvalid)
        ,.s_axis_aclk              (clock)
        ,.s_axis_aresetn           (reset_n)
        ,.s_axis_tdata             (qsfp0_bckpr_tdata)
        ,.s_axis_tready            (qsfp0_bckpr_tready)
        ,.s_axis_tvalid            (qsfp0_bckpr_tvalid)
      );


// QSFP0 Backpressure

thymesisflow_32B_bckpressure_ingress TF_MEMORY_BCKPR_ING_QSFP0 
      (

        .clock                      (clock)
       ,.reset_n                    (reset_n)

       , .bckpr_in_tdata            (qsfp0_bckpr_tdata_ing)
       , .bckpr_in_tvalid           (qsfp0_bckpr_tvalid_ing)
       , .bckpr_in_tready           (qsfp0_bckpr_tready_ing)

       , .bckpr_out_tdata           (ing_in_tdata0)
       , .bckpr_out_tvalid          (ing_in_tvalid0)
       , .bckpr_out_tready          (ing_in_tready0)

       //Credit manager interface
       , .cnt_local_rx_creds        (qsfp0_loc_ingress_ret_creds)
       , .local_creds_init          (qsfp0_loc_ingress_init_creds)
       , .ret_remote_rx_creds       (qsfp0_rem_ingress_ret_creds)

);


thymesisflow_32B_bckpressure_egress TF_MEMORY_BCKPR_EGR_QSFP0 
      (

        .clock                      (clock)
       ,.reset_n                    (reset_n)

       ,.bckpr_in_tdata             (egr_out_tdata0)
       ,.bckpr_in_tvalid            (egr_out_tvalid0)
       ,.bckpr_in_tready            (egr_out_tready0)

  // 32B AXI-STREAM
       , .bckpr_out_tdata           (qsfp0_bckpr_tdata)
       , .bckpr_out_tvalid          (qsfp0_bckpr_tvalid)
       , .bckpr_out_tready          (qsfp0_bckpr_tready)

       //Credit manager interface
       , .port_creds_avail          (qsfp0_rem_ingress_avail_creds)
       , .port_consume_creds        (qsfp0_rem_ingress_cons_cred)
       , .port_initial_creds        (qsfp0_rem_ingress_init_creds)
       , .local_rx_creds            (qsfp0_loc_ingress_avail_creds)
       , .local_rx_getall           (qsfp0_loc_ingress_getall_creds)

);



// QSFP0 pipelines Ingress Egress credit managers
thymesisflow_credit_mgr#(.MSB(7))   TF_QSFP0_REMOTE_INGR_CMGR              
(
   .clock                    (clock)
  ,.resetn                   (reset_n)
  //, input reset_counter
  
  ,.initial_credits          (qsfp0_rem_ingress_init_creds)               
  ,.returned_credits         (qsfp0_rem_ingress_ret_creds)
  ,.get_all_credits          (qsfp0_rem_ingress_getall_creds)

  ,.consume_credit           (qsfp0_rem_ingress_cons_cred)
  ,.credits_available        (qsfp0_rem_ingress_avail_creds)

) ;

thymesisflow_credit_mgr#(.MSB(7))   TF_QSFP0_LOCAL_INGR_CMGR              
(
   .clock                    (clock)
  ,.resetn                   (reset_n)
  //, input reset_counter
  
  ,.initial_credits          (qsfp0_loc_ingress_init_creds)               
  ,.returned_credits         (qsfp0_loc_ingress_ret_creds)
  ,.get_all_credits          (qsfp0_loc_ingress_getall_creds)

  ,.consume_credit           (qsfp0_loc_ingress_cons_cred)
  ,.credits_available        (qsfp0_loc_ingress_avail_creds)

);


thymesisflow_32B_llc_top TFLLC_32B_QSFP0  
     (
       .usr_clk                    (qsfp0_usr_clk)
      ,.reset_n                    (power_on_qsfp0_rout)
      // AXI-S clock domain crossing egress (tx) fifo interface
      ,.egress_fifo_tvalid         (clkcross0_egress_fifo_out_tvalid)
      ,.egress_fifo_tready         (clkcross0_egress_fifo_out_tready)
      ,.egress_fifo_tdata          (clkcross0_egress_fifo_out_tdata)
     // AXI-S clock domain crossing ingress (rx) fifo interface
      ,.ingress_fifo_tvalid        (clkcross0_ingress_fifo_out_tvalid)
      ,.ingress_fifo_tready        (clkcross0_ingress_fifo_out_tready)
      ,.ingress_fifo_tdata         (clkcross0_ingress_fifo_out_tdata)
      ,.ingress_data_count         (clkcross0_ingress_fifo_axis_data_count[9:0])
     // AXI-S framing interface tx to 32B serdes 
      ,.serdes_tx_tdata            (qsfp0_tx_tdata)
      ,.serdes_tx_tkeep            (qsfp0_tx_tkeep)
      ,.serdes_tx_tlast            (qsfp0_tx_tlast)
      ,.serdes_tx_tready           (qsfp0_tx_tready) 
      ,.serdes_tx_tvalid           (qsfp0_tx_tvalid)
     // AXI-S framing interface rx 32B serdes, tready ommitted as serdes  RX cannot stall. 
      ,.serdes_rx_tdata            (qsfp0_rx_tdata)
      ,.serdes_rx_tkeep            (qsfp0_rx_tkeep)
      ,.serdes_rx_tlast            (qsfp0_rx_tlast)
      ,.serdes_rx_tvalid           (qsfp0_rx_tvalid)
     // CRC check of the delivered flit at serdes  
      ,.serdes_rx_crc_ok           (qsfp0_crc_ok)
      ,.serdes_rx_crc_valid        (qsfp0_crc_valid)
     // addr and data interface to BRAM
      ,.framer_bram_writea         (framer_bram_writea0)
      ,.framer_bram_reada          (framer_bram_reada0)
      ,.framer_bram_din            (framer_bram_din0)
      ,.framer_bram_dout           (framer_bram_dout0)
      ,.framer_bram_wen            (framer_bram_wen0)
     );

//TFLLC_32B BRAM below
//The module below is a xilinx bram generator module created by 
//../ip/thymesisflow_llc_bram.tcl
thymesisflow_llc_framer_bram_32B  TFLLC_FRAMER_BRAM0_32B
       (
         .addra                     (framer_bram_writea0)
        ,.addrb                     (framer_bram_reada0)
        ,.clka                      (qsfp0_usr_clk)
        ,.clkb                      (qsfp0_usr_clk)
        ,.dina                      (framer_bram_din0)
        ,.doutb                     (framer_bram_dout0)
        ,.wea                       (framer_bram_wen0)
       );


//Aurora Quad transceiver core instance
aurora_qsfp0 AURORA_QSFP0_CORE
       (
         .channel_up                (qsfp0_channel_up)
        ,.crc_pass_fail_n           (qsfp0_crc_ok)
        ,.crc_valid                 (qsfp0_crc_valid)
        ,.gt_refclk1_n              (qsfp0_ref_clk_n)
        ,.gt_refclk1_p              (qsfp0_ref_clk_p)
        ,.gt_rxcdrovrden_in         (1'b0)
        ,.init_clk                  (serdes_init_clock)
        ,.loopback                  ({1'b0,1'b0,1'b0})
        ,.m_axi_rx_tdata            (qsfp0_rx_tdata)
        ,.m_axi_rx_tkeep            (qsfp0_rx_tkeep)
        ,.m_axi_rx_tlast            (qsfp0_rx_tlast)
        ,.m_axi_rx_tvalid           (qsfp0_rx_tvalid)
        ,.pma_init                  (qsfp0_pma_init)
        ,.power_down                (1'b0)
        ,.reset_pb                  (qsfp0_power_on_rpb)
        ,.rxn                       (qsfp0_rx_n)
        ,.rxp                       (qsfp0_rx_p)
        ,.s_axi_tx_tdata            (qsfp0_tx_tdata)
        ,.s_axi_tx_tkeep            (qsfp0_tx_tkeep)
        ,.s_axi_tx_tlast            (qsfp0_tx_tlast)
        ,.s_axi_tx_tready           (qsfp0_tx_tready)
        ,.s_axi_tx_tvalid           (qsfp0_tx_tvalid)
        ,.txn                       (qsfp0_tx_n)
        ,.txp                       (qsfp0_tx_p)
        ,.user_clk_out              (qsfp0_usr_clk)
      );

//end of QSFP0
//---------------> QSFP1 NETWORK PIPELINE

//Egress clock domain crossing fifo
clock_domain_cross_fifo  TF_QSFP1_LLC_EGRESS_FIFO
      (
         .m_axis_aclk              (qsfp1_usr_clk)
        ,.m_axis_aresetn           (power_on_qsfp1_rout)
        ,.m_axis_tdata             (clkcross1_egress_fifo_out_tdata)
        ,.m_axis_tready            (clkcross1_egress_fifo_out_tready)
        ,.m_axis_tvalid            (clkcross1_egress_fifo_out_tvalid)
        ,.s_axis_aclk              (clock)
        ,.s_axis_aresetn           (reset_n)
        ,.s_axis_tdata             (qsfp1_bckpr_tdata)
        ,.s_axis_tready            (qsfp1_bckpr_tready)
        ,.s_axis_tvalid            (qsfp1_bckpr_tvalid)

      );

//ingress clock domain crossing fifo
clock_domain_cross_fifo TF_QSFP1_LLC_INGRESS_FIFO 
      (
         .axis_data_count          (clkcross1_ingress_fifo_axis_data_count)
        ,.m_axis_aclk              (clock)
        ,.m_axis_aresetn           (reset_n)
        ,.m_axis_tdata             (qsfp1_bckpr_tdata_ing)
        ,.m_axis_tready            (qsfp1_bckpr_tready_ing)
        ,.m_axis_tvalid            (qsfp1_bckpr_tvalid_ing)
        ,.s_axis_aclk              (qsfp1_usr_clk)
        ,.s_axis_aresetn           (power_on_qsfp1_rout)
        ,.s_axis_tdata             (clkcross1_ingress_fifo_out_tdata)
        ,.s_axis_tready            (clkcross1_ingress_fifo_out_tready)
        ,.s_axis_tvalid            (clkcross1_ingress_fifo_out_tvalid)
      );

thymesisflow_32B_bckpressure_ingress TF_MEMORY_BCKPR_ING_QSFP1 
      (

        .clock                      (clock)
       ,.reset_n                    (reset_n)

       , .bckpr_in_tdata            (qsfp1_bckpr_tdata_ing)
       , .bckpr_in_tvalid           (qsfp1_bckpr_tvalid_ing)
       , .bckpr_in_tready           (qsfp1_bckpr_tready_ing)

       , .bckpr_out_tdata           (ing_in_tdata1)
       , .bckpr_out_tvalid          (ing_in_tvalid1)
       , .bckpr_out_tready          (ing_in_tready1)

       //Credit manager interface
       , .cnt_local_rx_creds        (qsfp1_loc_ingress_ret_creds)
       , .local_creds_init          (qsfp1_loc_ingress_init_creds)
       , .ret_remote_rx_creds       (qsfp1_rem_ingress_ret_creds)

);


thymesisflow_32B_bckpressure_egress TF_MEMORY_BCKPR_EGR_QSFP1 
      (

        .clock                      (clock)
       ,.reset_n                    (reset_n)

       ,.bckpr_in_tdata             (egr_out_tdata1)
       ,.bckpr_in_tvalid            (egr_out_tvalid1)
       ,.bckpr_in_tready            (egr_out_tready1)

      // 32B AXI-STREAM
       , .bckpr_out_tdata           (qsfp1_bckpr_tdata)
       , .bckpr_out_tvalid          (qsfp1_bckpr_tvalid)
       , .bckpr_out_tready          (qsfp1_bckpr_tready)

       //Credit manager interface
       , .port_creds_avail          (qsfp1_rem_ingress_avail_creds)
       , .port_consume_creds        (qsfp1_rem_ingress_cons_cred)
       , .port_initial_creds        (qsfp1_rem_ingress_init_creds)
       , .local_rx_creds            (qsfp1_loc_ingress_avail_creds)
       , .local_rx_getall           (qsfp1_loc_ingress_getall_creds)

);

//credit managers

thymesisflow_credit_mgr#(.MSB(7))   TF_QSFP1_REMOTE_INGR_CMGR              
(
   .clock                    (clock)
  ,.resetn                   (reset_n)
  //, input reset_counter
  
  ,.initial_credits          (qsfp1_rem_ingress_init_creds)               
  ,.returned_credits         (qsfp1_rem_ingress_ret_creds)
  ,.get_all_credits          (qsfp1_rem_ingress_getall_creds)

  ,.consume_credit           (qsfp1_rem_ingress_cons_cred)
  ,.credits_available        (qsfp1_rem_ingress_avail_creds)

) ;

thymesisflow_credit_mgr#(.MSB(7))   TF_QSFP1_LOCAL_INGR_CMGR              
(
   .clock                    (clock)
  ,.resetn                   (reset_n)
  //, input reset_counter
  
  ,.initial_credits          (qsfp1_loc_ingress_init_creds)               
  ,.returned_credits         (qsfp1_loc_ingress_ret_creds)
  ,.get_all_credits          (qsfp1_loc_ingress_getall_creds)

  ,.consume_credit           (qsfp1_loc_ingress_cons_cred)
  ,.credits_available        (qsfp1_loc_ingress_avail_creds)

);


thymesisflow_32B_llc_top TFLLC_32B_QSFP1 
     (
       .usr_clk                    (qsfp1_usr_clk)
      ,.reset_n                    (power_on_qsfp1_rout)
      // AXI-S clock domain crossing egress (tx) fifo interface
      ,.egress_fifo_tvalid         (clkcross1_egress_fifo_out_tvalid)
      ,.egress_fifo_tready         (clkcross1_egress_fifo_out_tready)
      ,.egress_fifo_tdata          (clkcross1_egress_fifo_out_tdata)
     // AXI-S clock domain crossing ingress (rx) fifo interface
      ,.ingress_fifo_tvalid        (clkcross1_ingress_fifo_out_tvalid)
      ,.ingress_fifo_tready        (clkcross1_ingress_fifo_out_tready)
      ,.ingress_fifo_tdata         (clkcross1_ingress_fifo_out_tdata)
      ,.ingress_data_count         (clkcross1_ingress_fifo_axis_data_count[9:0])
     // AXI-S framing interface tx to 32B serdes 
      ,.serdes_tx_tdata            (qsfp1_tx_tdata)
      ,.serdes_tx_tkeep            (qsfp1_tx_tkeep)
      ,.serdes_tx_tlast            (qsfp1_tx_tlast)
      ,.serdes_tx_tready           (qsfp1_tx_tready) 
      ,.serdes_tx_tvalid           (qsfp1_tx_tvalid)
     // AXI-S framing interface rx 32B serdes, tready ommitted as serdes  RX cannot stall. 
      ,.serdes_rx_tdata            (qsfp1_rx_tdata)
      ,.serdes_rx_tkeep            (qsfp1_rx_tkeep)
      ,.serdes_rx_tlast            (qsfp1_rx_tlast)
      ,.serdes_rx_tvalid           (qsfp1_rx_tvalid)
     // CRC check of the delivered flit at serdes  
      ,.serdes_rx_crc_ok           (qsfp1_crc_ok)
      ,.serdes_rx_crc_valid        (qsfp1_crc_valid)
     // addr and data interface to BRAM
      ,.framer_bram_writea         (framer_bram_writea1)
      ,.framer_bram_reada          (framer_bram_reada1)
      ,.framer_bram_din            (framer_bram_din1)
      ,.framer_bram_dout           (framer_bram_dout1)
      ,.framer_bram_wen            (framer_bram_wen1)
     );


//TFLLC_32B BRAM below
//The module below is a xilinx bram generator module created by 
//../ip/create_thymesisflow_llc_bram.tcl
thymesisflow_llc_framer_bram_32B  TFLLC_FRAMER_BRAM1_32B
       (
         .addra                        (framer_bram_writea1)
        ,.addrb                        (framer_bram_reada1)
        ,.clka                         (qsfp1_usr_clk)
        ,.clkb                         (qsfp1_usr_clk)
        ,.dina                         (framer_bram_din1)
        ,.doutb                        (framer_bram_dout1)
        ,.wea                          (framer_bram_wen1)
       );

//Aurora Quad transceiver core instance
aurora_qsfp1 AURORA_QSFP1_CORE
       (
         .channel_up                (qsfp1_channel_up)
        ,.crc_pass_fail_n           (qsfp1_crc_ok)
        ,.crc_valid                 (qsfp1_crc_valid)
        ,.gt_refclk1_n              (qsfp1_ref_clk_n)
        ,.gt_refclk1_p              (qsfp1_ref_clk_p)
        ,.gt_rxcdrovrden_in         (1'b0)
        ,.init_clk                  (serdes_init_clock)
        ,.loopback                  ({1'b0,1'b0,1'b0})
        ,.m_axi_rx_tdata            (qsfp1_rx_tdata)
        ,.m_axi_rx_tkeep            (qsfp1_rx_tkeep)
        ,.m_axi_rx_tlast            (qsfp1_rx_tlast)
        ,.m_axi_rx_tvalid           (qsfp1_rx_tvalid)
        ,.pma_init                  (qsfp1_pma_init)
        ,.power_down                (1'b0)
        ,.reset_pb                  (qsfp1_power_on_rpb)
        ,.rxn                       (qsfp1_rx_n)
        ,.rxp                       (qsfp1_rx_p)
        ,.s_axi_tx_tdata            (qsfp1_tx_tdata)
        ,.s_axi_tx_tkeep            (qsfp1_tx_tkeep)
        ,.s_axi_tx_tlast            (qsfp1_tx_tlast)
        ,.s_axi_tx_tready           (qsfp1_tx_tready)
        ,.s_axi_tx_tvalid           (qsfp1_tx_tvalid)
        ,.txn                       (qsfp1_tx_n)
        ,.txp                       (qsfp1_tx_p)
        ,.user_clk_out              (qsfp1_usr_clk)
      );



endmodule
