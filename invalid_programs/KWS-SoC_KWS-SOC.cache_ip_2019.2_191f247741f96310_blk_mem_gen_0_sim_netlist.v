// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Aug 17 14:02:01 2020
// Host        : LAPTOP-5KE3GPT6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [13:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [13:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "14" *) 
  (* C_ADDRB_WIDTH = "14" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "5" *) 
  (* C_COUNT_36K_BRAM = "7" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.705689 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "9706" *) 
  (* C_READ_DEPTH_B = "9706" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "9706" *) 
  (* C_WRITE_DEPTH_B = "9706" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[13:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[13:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bindec
   (ena_array,
    addra,
    ena);
  output [0:0]ena_array;
  input [2:0]addra;
  input ena;

  wire [2:0]addra;
  wire ena;
  wire [0:0]ena_array;

  LUT4 #(
    .INIT(16'h1000)) 
    ENOUT
       (.I0(addra[1]),
        .I1(addra[0]),
        .I2(addra[2]),
        .I3(ena),
        .O(ena_array));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [13:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [4:4]ena_array;
  wire ram_ena;
  wire \ramloop[10].ram.r_n_0 ;
  wire \ramloop[10].ram.r_n_1 ;
  wire \ramloop[10].ram.r_n_2 ;
  wire \ramloop[10].ram.r_n_3 ;
  wire \ramloop[10].ram.r_n_4 ;
  wire \ramloop[10].ram.r_n_5 ;
  wire \ramloop[10].ram.r_n_6 ;
  wire \ramloop[10].ram.r_n_7 ;
  wire \ramloop[10].ram.r_n_8 ;
  wire \ramloop[11].ram.r_n_0 ;
  wire \ramloop[11].ram.r_n_1 ;
  wire \ramloop[11].ram.r_n_2 ;
  wire \ramloop[11].ram.r_n_3 ;
  wire \ramloop[11].ram.r_n_4 ;
  wire \ramloop[11].ram.r_n_5 ;
  wire \ramloop[11].ram.r_n_6 ;
  wire \ramloop[11].ram.r_n_7 ;
  wire \ramloop[11].ram.r_n_8 ;
  wire \ramloop[1].ram.r_n_0 ;
  wire \ramloop[1].ram.r_n_1 ;
  wire \ramloop[1].ram.r_n_2 ;
  wire \ramloop[2].ram.r_n_0 ;
  wire \ramloop[2].ram.r_n_1 ;
  wire \ramloop[2].ram.r_n_2 ;
  wire \ramloop[2].ram.r_n_3 ;
  wire \ramloop[3].ram.r_n_0 ;
  wire \ramloop[3].ram.r_n_1 ;
  wire \ramloop[4].ram.r_n_0 ;
  wire \ramloop[4].ram.r_n_1 ;
  wire \ramloop[4].ram.r_n_2 ;
  wire \ramloop[4].ram.r_n_3 ;
  wire \ramloop[4].ram.r_n_4 ;
  wire \ramloop[4].ram.r_n_5 ;
  wire \ramloop[4].ram.r_n_6 ;
  wire \ramloop[4].ram.r_n_7 ;
  wire \ramloop[4].ram.r_n_8 ;
  wire \ramloop[5].ram.r_n_0 ;
  wire \ramloop[5].ram.r_n_1 ;
  wire \ramloop[5].ram.r_n_2 ;
  wire \ramloop[5].ram.r_n_3 ;
  wire \ramloop[5].ram.r_n_4 ;
  wire \ramloop[5].ram.r_n_5 ;
  wire \ramloop[5].ram.r_n_6 ;
  wire \ramloop[5].ram.r_n_7 ;
  wire \ramloop[5].ram.r_n_8 ;
  wire \ramloop[6].ram.r_n_0 ;
  wire \ramloop[6].ram.r_n_1 ;
  wire \ramloop[6].ram.r_n_2 ;
  wire \ramloop[6].ram.r_n_3 ;
  wire \ramloop[6].ram.r_n_4 ;
  wire \ramloop[6].ram.r_n_5 ;
  wire \ramloop[6].ram.r_n_6 ;
  wire \ramloop[6].ram.r_n_7 ;
  wire \ramloop[6].ram.r_n_8 ;
  wire \ramloop[7].ram.r_n_0 ;
  wire \ramloop[7].ram.r_n_1 ;
  wire \ramloop[7].ram.r_n_2 ;
  wire \ramloop[7].ram.r_n_3 ;
  wire \ramloop[7].ram.r_n_4 ;
  wire \ramloop[7].ram.r_n_5 ;
  wire \ramloop[7].ram.r_n_6 ;
  wire \ramloop[7].ram.r_n_7 ;
  wire \ramloop[7].ram.r_n_8 ;
  wire \ramloop[7].ram.r_n_9 ;
  wire \ramloop[8].ram.r_n_0 ;
  wire \ramloop[8].ram.r_n_1 ;
  wire \ramloop[8].ram.r_n_2 ;
  wire \ramloop[8].ram.r_n_3 ;
  wire \ramloop[8].ram.r_n_4 ;
  wire \ramloop[8].ram.r_n_5 ;
  wire \ramloop[8].ram.r_n_6 ;
  wire \ramloop[8].ram.r_n_7 ;
  wire \ramloop[8].ram.r_n_8 ;
  wire \ramloop[9].ram.r_n_0 ;
  wire \ramloop[9].ram.r_n_1 ;
  wire \ramloop[9].ram.r_n_10 ;
  wire \ramloop[9].ram.r_n_11 ;
  wire \ramloop[9].ram.r_n_12 ;
  wire \ramloop[9].ram.r_n_13 ;
  wire \ramloop[9].ram.r_n_14 ;
  wire \ramloop[9].ram.r_n_15 ;
  wire \ramloop[9].ram.r_n_16 ;
  wire \ramloop[9].ram.r_n_17 ;
  wire \ramloop[9].ram.r_n_2 ;
  wire \ramloop[9].ram.r_n_3 ;
  wire \ramloop[9].ram.r_n_4 ;
  wire \ramloop[9].ram.r_n_5 ;
  wire \ramloop[9].ram.r_n_6 ;
  wire \ramloop[9].ram.r_n_7 ;
  wire \ramloop[9].ram.r_n_8 ;
  wire \ramloop[9].ram.r_n_9 ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bindec \bindec_a.bindec_inst_a 
       (.addra(addra[13:11]),
        .ena(ena),
        .ena_array(ena_array));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux \has_mux_a.A 
       (.DOADO({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 }),
        .DOPADOP(\ramloop[6].ram.r_n_8 ),
        .addra(addra[13:11]),
        .clka(clka),
        .douta(douta[31:1]),
        .\douta[12] ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .\douta[12]_0 ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\douta[12]_1 ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\douta[13] (\ramloop[5].ram.r_n_8 ),
        .\douta[13]_0 (\ramloop[4].ram.r_n_8 ),
        .\douta[21] ({\ramloop[8].ram.r_n_0 ,\ramloop[8].ram.r_n_1 ,\ramloop[8].ram.r_n_2 ,\ramloop[8].ram.r_n_3 ,\ramloop[8].ram.r_n_4 ,\ramloop[8].ram.r_n_5 ,\ramloop[8].ram.r_n_6 ,\ramloop[8].ram.r_n_7 }),
        .\douta[21]_0 ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .\douta[22] (\ramloop[8].ram.r_n_8 ),
        .\douta[22]_0 (\ramloop[7].ram.r_n_8 ),
        .\douta[2] ({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 }),
        .\douta[30] ({\ramloop[9].ram.r_n_0 ,\ramloop[9].ram.r_n_1 ,\ramloop[9].ram.r_n_2 ,\ramloop[9].ram.r_n_3 ,\ramloop[9].ram.r_n_4 ,\ramloop[9].ram.r_n_5 ,\ramloop[9].ram.r_n_6 ,\ramloop[9].ram.r_n_7 ,\ramloop[9].ram.r_n_8 ,\ramloop[9].ram.r_n_9 ,\ramloop[9].ram.r_n_10 ,\ramloop[9].ram.r_n_11 ,\ramloop[9].ram.r_n_12 ,\ramloop[9].ram.r_n_13 ,\ramloop[9].ram.r_n_14 ,\ramloop[9].ram.r_n_15 }),
        .\douta[30]_0 ({\ramloop[11].ram.r_n_0 ,\ramloop[11].ram.r_n_1 ,\ramloop[11].ram.r_n_2 ,\ramloop[11].ram.r_n_3 ,\ramloop[11].ram.r_n_4 ,\ramloop[11].ram.r_n_5 ,\ramloop[11].ram.r_n_6 ,\ramloop[11].ram.r_n_7 }),
        .\douta[30]_1 ({\ramloop[10].ram.r_n_0 ,\ramloop[10].ram.r_n_1 ,\ramloop[10].ram.r_n_2 ,\ramloop[10].ram.r_n_3 ,\ramloop[10].ram.r_n_4 ,\ramloop[10].ram.r_n_5 ,\ramloop[10].ram.r_n_6 ,\ramloop[10].ram.r_n_7 }),
        .\douta[31] ({\ramloop[9].ram.r_n_16 ,\ramloop[9].ram.r_n_17 }),
        .\douta[31]_0 (\ramloop[11].ram.r_n_8 ),
        .\douta[31]_1 (\ramloop[10].ram.r_n_8 ),
        .\douta[4] ({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 }),
        .ena(ena));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina[0]),
        .douta(douta[0]),
        .ena(ena),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized9 \ramloop[10].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[10].ram.r_n_0 ,\ramloop[10].ram.r_n_1 ,\ramloop[10].ram.r_n_2 ,\ramloop[10].ram.r_n_3 ,\ramloop[10].ram.r_n_4 ,\ramloop[10].ram.r_n_5 ,\ramloop[10].ram.r_n_6 ,\ramloop[10].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[10].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\ramloop[7].ram.r_n_9 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[31:23]),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized10 \ramloop[11].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[11].ram.r_n_0 ,\ramloop[11].ram.r_n_1 ,\ramloop[11].ram.r_n_2 ,\ramloop[11].ram.r_n_3 ,\ramloop[11].ram.r_n_4 ,\ramloop[11].ram.r_n_5 ,\ramloop[11].ram.r_n_6 ,\ramloop[11].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[11].ram.r_n_8 ),
        .addra(addra),
        .clka(clka),
        .dina(dina[31:23]),
        .ena(ena),
        .ram_ena(ram_ena),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 }),
        .addra(addra),
        .addra_13_sp_1(\ramloop[1].ram.r_n_2 ),
        .clka(clka),
        .dina(dina[2:1]),
        .ena(ena),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.DOADO({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 }),
        .addra(addra),
        .clka(clka),
        .dina(dina[4:1]),
        .ena(ena),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\ramloop[1].ram.r_n_2 ),
        .addra(addra[12:0]),
        .clka(clka),
        .dina(dina[4:3]),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[4].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\ramloop[7].ram.r_n_9 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[13:5]),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[5].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[13:5]),
        .ram_ena(ram_ena),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .DOPADOP(\ramloop[6].ram.r_n_8 ),
        .addra(addra[10:0]),
        .clka(clka),
        .dina(dina[13:5]),
        .ena_array(ena_array),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[7].ram.r_n_8 ),
        .addra(addra),
        .clka(clka),
        .dina(dina[22:14]),
        .ena(ena),
        .ena_0(\ramloop[7].ram.r_n_9 ),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized7 \ramloop[8].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[8].ram.r_n_0 ,\ramloop[8].ram.r_n_1 ,\ramloop[8].ram.r_n_2 ,\ramloop[8].ram.r_n_3 ,\ramloop[8].ram.r_n_4 ,\ramloop[8].ram.r_n_5 ,\ramloop[8].ram.r_n_6 ,\ramloop[8].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[8].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[22:14]),
        .ram_ena(ram_ena),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized8 \ramloop[9].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[9].ram.r_n_0 ,\ramloop[9].ram.r_n_1 ,\ramloop[9].ram.r_n_2 ,\ramloop[9].ram.r_n_3 ,\ramloop[9].ram.r_n_4 ,\ramloop[9].ram.r_n_5 ,\ramloop[9].ram.r_n_6 ,\ramloop[9].ram.r_n_7 ,\ramloop[9].ram.r_n_8 ,\ramloop[9].ram.r_n_9 ,\ramloop[9].ram.r_n_10 ,\ramloop[9].ram.r_n_11 ,\ramloop[9].ram.r_n_12 ,\ramloop[9].ram.r_n_13 ,\ramloop[9].ram.r_n_14 ,\ramloop[9].ram.r_n_15 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ({\ramloop[9].ram.r_n_16 ,\ramloop[9].ram.r_n_17 }),
        .addra(addra[10:0]),
        .clka(clka),
        .dina(dina[31:14]),
        .ena_array(ena_array),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux
   (douta,
    addra,
    ena,
    clka,
    DOADO,
    \douta[2] ,
    \douta[4] ,
    \douta[12] ,
    \douta[12]_0 ,
    \douta[12]_1 ,
    DOPADOP,
    \douta[13] ,
    \douta[13]_0 ,
    \douta[30] ,
    \douta[21] ,
    \douta[21]_0 ,
    \douta[31] ,
    \douta[22] ,
    \douta[22]_0 ,
    \douta[30]_0 ,
    \douta[30]_1 ,
    \douta[31]_0 ,
    \douta[31]_1 );
  output [30:0]douta;
  input [2:0]addra;
  input ena;
  input clka;
  input [3:0]DOADO;
  input [1:0]\douta[2] ;
  input [1:0]\douta[4] ;
  input [7:0]\douta[12] ;
  input [7:0]\douta[12]_0 ;
  input [7:0]\douta[12]_1 ;
  input [0:0]DOPADOP;
  input [0:0]\douta[13] ;
  input [0:0]\douta[13]_0 ;
  input [15:0]\douta[30] ;
  input [7:0]\douta[21] ;
  input [7:0]\douta[21]_0 ;
  input [1:0]\douta[31] ;
  input [0:0]\douta[22] ;
  input [0:0]\douta[22]_0 ;
  input [7:0]\douta[30]_0 ;
  input [7:0]\douta[30]_1 ;
  input [0:0]\douta[31]_0 ;
  input [0:0]\douta[31]_1 ;

  wire [3:0]DOADO;
  wire [0:0]DOPADOP;
  wire [2:0]addra;
  wire clka;
  wire [30:0]douta;
  wire [7:0]\douta[12] ;
  wire [7:0]\douta[12]_0 ;
  wire [7:0]\douta[12]_1 ;
  wire [0:0]\douta[13] ;
  wire [0:0]\douta[13]_0 ;
  wire [7:0]\douta[21] ;
  wire [7:0]\douta[21]_0 ;
  wire [0:0]\douta[22] ;
  wire [0:0]\douta[22]_0 ;
  wire [1:0]\douta[2] ;
  wire [15:0]\douta[30] ;
  wire [7:0]\douta[30]_0 ;
  wire [7:0]\douta[30]_1 ;
  wire [1:0]\douta[31] ;
  wire [0:0]\douta[31]_0 ;
  wire [0:0]\douta[31]_1 ;
  wire [1:0]\douta[4] ;
  wire ena;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1_n_0 ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe[1]_i_1_n_0 ;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe[2]_i_1_n_0 ;
  wire [2:0]sel_pipe;

  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[10]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [5]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [5]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [5]),
        .O(douta[9]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[11]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [6]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [6]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [6]),
        .O(douta[10]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[12]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [7]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [7]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [7]),
        .O(douta[11]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[13]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(DOPADOP),
        .I2(sel_pipe[2]),
        .I3(\douta[13] ),
        .I4(sel_pipe[1]),
        .I5(\douta[13]_0 ),
        .O(douta[12]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[14]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [0]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [0]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [0]),
        .O(douta[13]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[15]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [1]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [1]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [1]),
        .O(douta[14]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[16]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [2]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [2]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [2]),
        .O(douta[15]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[17]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [3]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [3]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [3]),
        .O(douta[16]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[18]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [4]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [4]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [4]),
        .O(douta[17]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[19]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [5]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [5]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [5]),
        .O(douta[18]));
  LUT4 #(
    .INIT(16'h2F20)) 
    \douta[1]_INST_0 
       (.I0(DOADO[0]),
        .I1(sel_pipe[1]),
        .I2(sel_pipe[2]),
        .I3(\douta[2] [0]),
        .O(douta[0]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[20]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [6]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [6]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [6]),
        .O(douta[19]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[21]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [7]),
        .I2(sel_pipe[2]),
        .I3(\douta[21] [7]),
        .I4(sel_pipe[1]),
        .I5(\douta[21]_0 [7]),
        .O(douta[20]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[22]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[31] [0]),
        .I2(sel_pipe[2]),
        .I3(\douta[22] ),
        .I4(sel_pipe[1]),
        .I5(\douta[22]_0 ),
        .O(douta[21]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[23]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [8]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [0]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [0]),
        .O(douta[22]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[24]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [9]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [1]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [1]),
        .O(douta[23]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[25]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [10]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [2]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [2]),
        .O(douta[24]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[26]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [11]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [3]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [3]),
        .O(douta[25]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[27]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [12]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [4]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [4]),
        .O(douta[26]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[28]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [13]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [5]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [5]),
        .O(douta[27]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[29]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [14]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [6]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [6]),
        .O(douta[28]));
  LUT4 #(
    .INIT(16'h2F20)) 
    \douta[2]_INST_0 
       (.I0(DOADO[1]),
        .I1(sel_pipe[1]),
        .I2(sel_pipe[2]),
        .I3(\douta[2] [1]),
        .O(douta[1]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[30]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[30] [15]),
        .I2(sel_pipe[2]),
        .I3(\douta[30]_0 [7]),
        .I4(sel_pipe[1]),
        .I5(\douta[30]_1 [7]),
        .O(douta[29]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[31]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[31] [1]),
        .I2(sel_pipe[2]),
        .I3(\douta[31]_0 ),
        .I4(sel_pipe[1]),
        .I5(\douta[31]_1 ),
        .O(douta[30]));
  LUT4 #(
    .INIT(16'h2F20)) 
    \douta[3]_INST_0 
       (.I0(DOADO[2]),
        .I1(sel_pipe[1]),
        .I2(sel_pipe[2]),
        .I3(\douta[4] [0]),
        .O(douta[2]));
  LUT4 #(
    .INIT(16'h2F20)) 
    \douta[4]_INST_0 
       (.I0(DOADO[3]),
        .I1(sel_pipe[1]),
        .I2(sel_pipe[2]),
        .I3(\douta[4] [1]),
        .O(douta[3]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[5]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [0]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [0]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [0]),
        .O(douta[4]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[6]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [1]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [1]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [1]),
        .O(douta[5]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[7]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [2]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [2]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [2]),
        .O(douta[6]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[8]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [3]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [3]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [3]),
        .O(douta[7]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \douta[9]_INST_0 
       (.I0(sel_pipe[0]),
        .I1(\douta[12] [4]),
        .I2(sel_pipe[2]),
        .I3(\douta[12]_0 [4]),
        .I4(sel_pipe[1]),
        .I5(\douta[12]_1 [4]),
        .O(douta[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1 
       (.I0(addra[0]),
        .I1(ena),
        .I2(sel_pipe[0]),
        .O(\no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe[1]_i_1 
       (.I0(addra[1]),
        .I1(ena),
        .I2(sel_pipe[1]),
        .O(\no_softecc_sel_reg.ce_pri.sel_pipe[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe[2]_i_1 
       (.I0(addra[2]),
        .I1(ena),
        .I2(sel_pipe[2]),
        .O(\no_softecc_sel_reg.ce_pri.sel_pipe[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] 
       (.C(clka),
        .CE(1'b1),
        .D(\no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1_n_0 ),
        .Q(sel_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[1] 
       (.C(clka),
        .CE(1'b1),
        .D(\no_softecc_sel_reg.ce_pri.sel_pipe[1]_i_1_n_0 ),
        .Q(sel_pipe[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[2] 
       (.C(clka),
        .CE(1'b1),
        .D(\no_softecc_sel_reg.ce_pri.sel_pipe[2]_i_1_n_0 ),
        .Q(sel_pipe[2]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [0:0]douta;
  input clka;
  input ena;
  input [13:0]addra;
  input [0:0]dina;
  input [0:0]wea;

  wire [13:0]addra;
  wire clka;
  wire [0:0]dina;
  wire [0:0]douta;
  wire ena;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ,
    addra_13_sp_1,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  output addra_13_sp_1;
  input clka;
  input [13:0]addra;
  input [1:0]dina;
  input [0:0]wea;
  input ena;

  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  wire [13:0]addra;
  wire addra_13_sn_1;
  wire clka;
  wire [1:0]dina;
  wire ena;
  wire [0:0]wea;

  assign addra_13_sp_1 = addra_13_sn_1;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .addra(addra),
        .addra_13_sp_1(addra_13_sn_1),
        .clka(clka),
        .dina(dina),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1
   (DOADO,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [3:0]DOADO;
  input clka;
  input [13:0]addra;
  input [3:0]dina;
  input [0:0]wea;
  input ena;

  wire [3:0]DOADO;
  wire [13:0]addra;
  wire clka;
  wire [3:0]dina;
  wire ena;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.DOADO(DOADO),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized10
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    ram_ena,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output ram_ena;
  input clka;
  input [13:0]addra;
  input [8:0]dina;
  input [0:0]wea;
  input ena;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [13:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ena;
  wire ram_ena;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized10 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena(ena),
        .ram_ena(ram_ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ,
    clka,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ,
    addra,
    dina,
    wea);
  output [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  input clka;
  input \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  input [12:0]addra;
  input [1:0]dina;
  input [0:0]wea;

  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  wire [12:0]addra;
  wire clka;
  wire [1:0]dina;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ram_ena,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input ram_ena;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ram_ena;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ram_ena(ram_ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ,
    DOPADOP,
    clka,
    ena_array,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  output [0:0]DOPADOP;
  input clka;
  input [0:0]ena_array;
  input [10:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  wire [0:0]DOPADOP;
  wire [10:0]addra;
  wire clka;
  wire [8:0]dina;
  wire [0:0]ena_array;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .DOPADOP(DOPADOP),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena_array(ena_array),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    ena_0,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output ena_0;
  input clka;
  input [13:0]addra;
  input [8:0]dina;
  input [0:0]wea;
  input ena;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [13:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ena;
  wire ena_0;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena(ena),
        .ena_0(ena_0),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized7
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ram_ena,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input ram_ena;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ram_ena;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized7 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ram_ena(ram_ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized8
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ena_array,
    addra,
    dina,
    wea);
  output [15:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input [0:0]ena_array;
  input [10:0]addra;
  input [17:0]dina;
  input [0:0]wea;

  wire [15:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [10:0]addra;
  wire clka;
  wire [17:0]dina;
  wire [0:0]ena_array;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized8 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena_array(ena_array),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized9
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized9 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [0:0]douta;
  input clka;
  input ena;
  input [13:0]addra;
  input [0:0]dina;
  input [0:0]wea;

  wire [13:0]addra;
  wire clka;
  wire [0:0]dina;
  wire [0:0]douta;
  wire ena;
  wire [0:0]wea;
  wire [15:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hF3FA35048B78F2213B679CDBDB39E6DC844F1ED120AC5FCF4D6C30CEB3D72394),
    .INIT_01(256'hB7A92AB5DA07A928394757E41E5EDF09176D23000000000029C4EBCD730C36B2),
    .INIT_02(256'h38A13976E400F8F754417275B1FBA5627299838F6E35F64C0B8BC33B045868E1),
    .INIT_03(256'hF4DA075B7121F2E76FD4F0C27D0FB8924BA81386F17F0D73712C6AF0694E6DD1),
    .INIT_04(256'hEE55086E524EFBE3FB5AD3FC9783960E1C252F8B66F9A4659BAD286D1E615CA6),
    .INIT_05(256'h461B99DE2322255D91A5A659B65C25A9A196970618BC5D75D17C5AFC70399F62),
    .INIT_06(256'h1794BD33D21224D28839C50FDF2C3F2B91D9BED43C6F6D05AA4AF58F1CF844BA),
    .INIT_07(256'hA6F30074E6AFC6F94E5CCBCC67871B2D9AAA13C2CDE779FB8CABDE5A2F74D5B7),
    .INIT_08(256'h6C57142805F3C1B8A9094E2B1A1F644158428B810DFE109CA057179822899C43),
    .INIT_09(256'h7B743A8B63B899161ECA5867697EC2EBD033E7A8BFDF80B50EBAFBBADA36283A),
    .INIT_0A(256'h545C79A6F80D64D0BA9DA3F14C1C5172BB5128BB5AFED0284BAE70FF898BA208),
    .INIT_0B(256'hDD217AB45E124C72DF84826383B1E50A0345652ADBEE0AF8B4FE8C2763F773C7),
    .INIT_0C(256'hDC4643792675F1822262ABDC577A402092B74F73A75FC584CD7DFA30A1E6BFDE),
    .INIT_0D(256'h5E0BE9AE7E2B9210D5CF3BEEE66659BF7BD97C583FAF09FBEBE18AFB12D0D7D8),
    .INIT_0E(256'h351AF90E0150BDAF5110B37CEB0A466CB340A4776F4858EE4FC99CCF5092FE8F),
    .INIT_0F(256'h43D22CE7A00BDFA160A81313B9F7A8324E59FA729F0F91310FC7D8A96900F74E),
    .INIT_10(256'h9972D9FA5D5248552FE717029411CFA29EB2BA93C413004ACAB6BA2417C5A16F),
    .INIT_11(256'h6166681ACD2BBC8E75F7ADBB2D6DF75CD91734DAD6AE602F7DB46B44CA1BB8D1),
    .INIT_12(256'h9B23B552FF8C9B7189B57E97EAEBB6F69C3655775E21DEF0098DF50211249B53),
    .INIT_13(256'hDE257F8C807E1574B85CD08DADC72BDE52FA5A476B6382470636A77A222906EB),
    .INIT_14(256'h8C40C1BE77C74B6674FF455A9372760FD980DC347003C09AC92D8CA633CC094E),
    .INIT_15(256'h86C3F1856C444632B7E89CE4EBEA6E1FAECBB0AA84B00C1B8F5DC7A5FC489432),
    .INIT_16(256'h537026D1D89CBD5CE604E99B2F4F2CE0BD9F88FC2D3CFD6CEE2AADAB20F24CED),
    .INIT_17(256'h5510499FC943E16B1808B133A182479E5179BA158F59282FE1521F95AEB6633D),
    .INIT_18(256'hF9689130F538AF92D1786FDBA0C5ABB99AAF1E9D7266EBC27AD5F973C5574D1A),
    .INIT_19(256'h7B58120A63D843BA5824B2C71D67E043164861F6FF3A6403E92CC1CCF1CE6140),
    .INIT_1A(256'h2E90394A10F47AD9705277A341BD5367F73CC4EB4783824A65FBCE28B4E179FA),
    .INIT_1B(256'hBE865A47DC8E14F8B61F145FEF47E88526C543227E8C49DDCCF2A9444F4905D9),
    .INIT_1C(256'h83E92E30C62FE292468F8D1F00A6293D333ADDA83D0BD994C9EF7A84935FEFFA),
    .INIT_1D(256'h9F89F3BF555BD7BEEC9322CFA6BBA4A9B613138411F45DFAF643AD9FE93B3C5D),
    .INIT_1E(256'h8D5A778C1749816D7C7B7D514A16BE227670FC2401B769D3758611B06F2A481F),
    .INIT_1F(256'hF6CC0FF9EF34610D03C298E1E24F7972CB574E3CFEDB6B945D4F394B64001CE9),
    .INIT_20(256'hC53DC903389BF6B92A9BBBCB89CD0518CBB40A356371C05B2FD26ED1C8BA1584),
    .INIT_21(256'h20C36894953063E2DA28495466C83A40567A7DF21310339C155940F2F68FD83C),
    .INIT_22(256'hD465850315DC7DD444F71951787F003E9FAD0CC32BF65081004575083651C802),
    .INIT_23(256'h50A63055EE3B5768DBB525C762ED399DE859C67F17E67A251A5B80C3A2B44A3B),
    .INIT_24(256'h169E213D4EA2548D22FE00021DFE163A65F70C9E8019282D5FACD3BBD58BAC25),
    .INIT_25(256'h000003059F64FACFACFF273F2348B12985671C6A5DBB862E82C64FF7998E37CA),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:1],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ,
    addra_13_sp_1,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  output addra_13_sp_1;
  input clka;
  input [13:0]addra;
  input [1:0]dina;
  input [0:0]wea;
  input ena;

  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  wire [13:0]addra;
  wire addra_13_sn_1;
  wire clka;
  wire [1:0]dina;
  wire ena;
  wire [0:0]wea;
  wire [15:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  assign addra_13_sp_1 = addra_13_sn_1;
  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hD70AFD4F9EAA5F23D0CFD86178E7309D6EE553181445F0F68DCC07C77A0F578C),
    .INIT_01(256'h760CDB2D4927F307C8F5AAB6F17FA0D779F36BE5D84F874411D2F1275BE9CF6D),
    .INIT_02(256'h5A5A3654157EFFFFFFFFFFFFFFFFFFFF32D5F0ADD3D033729F0F511424C55BB9),
    .INIT_03(256'h506AA51716514754CCE666E01B1D5B475947AE7DF711BAAE4226C1BABC13155F),
    .INIT_04(256'h3C829A8A70EC0483DCE5893AA1165B84BBFCE8B6AF53FCC3F2B3F733F5A3024E),
    .INIT_05(256'h6AB6F6F9F0714A78D95FFE86FEB34B7EF0DC23984615D6799EA784F50F434000),
    .INIT_06(256'h0D200C8C4BA993F76B756F40A3FBF36830B55DF867CFABC6DEE4217BBFB54804),
    .INIT_07(256'hBE3B38770058A8C665308C533E6434FE960B3FBE0A0D1A8652E5A3433D7DC4ED),
    .INIT_08(256'hAEF5634D6B4DED05E9BD06ED9659AF9F09CB6CE5F3E020B6747318FF36C33488),
    .INIT_09(256'hCE44DE308A4779755BA5F1EBCCA2AC6CD98E44C50643710CCF83E19C7494355A),
    .INIT_0A(256'hA7022F8B690191444376133CFDD01FC3EC28A3D17D229E2711607A6B626BCBC9),
    .INIT_0B(256'hBDA8ADA99E4055ECD78D8BFD911176C0E8207A6F50A2537EFF7409618A4C9421),
    .INIT_0C(256'hCDA1EB60A1CECB2646E701C257988304C84D640EFABCD5D9279D958C7D2A4FAE),
    .INIT_0D(256'hD8E4B27A87738AC86D363EBD19A6A949FBF0ECE35D93D1174067209F00C07D3C),
    .INIT_0E(256'h6096A80018322A8395D97FC8460D9CC571D049F38945FA9467F037747427AA58),
    .INIT_0F(256'hA33E0F57587C5994B4D0288136F838C63765F0E6B544C691260EEE4F2BA01D02),
    .INIT_10(256'hE939D2C1501DF5BDE43293F52DB0A574F3CBBD0A8A33AF1BCE51151CF5C22927),
    .INIT_11(256'hAFE62EFBFE4E4298EC286608769388D2035F036110DF7376680CB04E9CB5072D),
    .INIT_12(256'h42050C598867A038B752877490799766D59880B23BC6A5E3C2A8FFE9C8EE8022),
    .INIT_13(256'h123FCAA4961D873750C9A114AF4EAF88AAA268BFBBB5A8A7B3BB6AEE3A845644),
    .INIT_14(256'h5138B5EE031F5DCABEFA164EBEF49A0796FA67BBB7D28AA135F0B5C209C11A18),
    .INIT_15(256'h3E742986C4BDAFA73FCF76016E664863961B3ADF26C606075B4B90F9C9FDAF58),
    .INIT_16(256'hF603A51F2F9DD6877F6C6ED918848BDDDF2F624BA71E9DFFC1CB78B9005A9F6D),
    .INIT_17(256'hF417140E5172255B4324197372D849BBB9E6D6BE7D77548DAC7DFEB44F62DDBD),
    .INIT_18(256'h20C9ADCE888B5A0010778B087FD5D260B45AD510B3CAE30008BEF779C9043AA7),
    .INIT_19(256'hBF606A297AC8C9AA575427B0D2FD5AC720800B31A72756C8E82A5DDDDBD3D0FE),
    .INIT_1A(256'h61906AC0E481C9D8AE0F7B3C17B6B7E982476D68C94018849D2945D5CFFD7C2C),
    .INIT_1B(256'h0F39347D721653988EA7B5E6B645F8E0EED95EBB6A54A57C81CFDB76B30C5BC5),
    .INIT_1C(256'hF6F16295E36A3BC1C7ED0647B0BABDA6999105016E6B1D3526D620797D2F2B4A),
    .INIT_1D(256'h243812D5D78BFF9E150C2F44CA3FA234622483F293AED19DD57BE5092E479FED),
    .INIT_1E(256'hEE3617FBFA2E2394581E1D9CE4F76D307C71A81DA0895EC06F41703D9A6A3A88),
    .INIT_1F(256'hE1238D06EAC7A673B415F9A91E59D61F622C6EC7BD7A61313CD3B72D1061BB3F),
    .INIT_20(256'h136FDC6F911B2FF92C64104F8E6560D07ADD0BE62F16C2C857F65FDE3BE9641C),
    .INIT_21(256'hC4082A1584EC800D990DF2D6415500FE141AA6A5811493CE82EFEFBF68DDA21D),
    .INIT_22(256'h3E64CD60ADD85D8703930E9E5068C2F21F57F9FEBF491000E1557E0DCE3C1A37),
    .INIT_23(256'h8936DDCFF56BB4B28331D72AE7A2379407E7FAD815EC8BE1B53C295A273488BA),
    .INIT_24(256'h0444698BD0D604455D5D51021BD1BB2DEA7B156B835C305A20B7711D43FEA8EC),
    .INIT_25(256'h77FA288B8A5293CC6D701D5D433E2447CDE9ABEB2E18D618F0EB5299525EE292),
    .INIT_26(256'h5F094A4203E59C9DCBC91FFE0616FCB29C018986B46FCE15B1268D1EEDAD0154),
    .INIT_27(256'h8D0D3C14258A8ACE97845E3135394935506DB49D0322CB30D5667BA06C3C8E65),
    .INIT_28(256'h0E50D39C808C853CA32C19482F445FDF32CBC76413F23356197192C8C9B7307B),
    .INIT_29(256'hDD2B4CFB181455139E686A4EFECB76592B95D98BC208CD814D2D12D1AC21E1D8),
    .INIT_2A(256'hAD69833631EB42117B3D5300ADF7DA19651B8729578A64FE5752A4CFFE95AF69),
    .INIT_2B(256'hA05CCF28554082FD1ABEBB12B036F63027A8FDD8DD62B85AB33DDD25E0B70CC4),
    .INIT_2C(256'h1F16B44ADDA155B7A336D1DE26BC7B75DFC178AE353732B5CBE1FF885F578DD5),
    .INIT_2D(256'h614FD599243CB67FD1E60EF7368375A0D6CB5E18B6BC938C6DE664C664562FF3),
    .INIT_2E(256'h284C2DB4D4775DD918C080A1FB16110A2751BF8B6FE95D14D9555CB3F001B41B),
    .INIT_2F(256'h538B1B7138229448CFE036DA563D83EDE6F94644333F0545FB234A33137D8E43),
    .INIT_30(256'h885626D97BEB7FFB65071580CE0045180F41090AA340BCB43B023F7F20D6A54C),
    .INIT_31(256'hF789FD49D10B898DDB0192C82AA04FB00A10E7CC2CBF59F91F823C92A2C67A7D),
    .INIT_32(256'hC19EC59691341E13820D9655FC28E4C7A277C2A72ADAFC8F992654C22D869FEC),
    .INIT_33(256'h5CCBFF98165E675548DD57F6C3E84FBF1439FAF9C6C0AA164AF4524DAA2B7BBC),
    .INIT_34(256'h2F0DF2AB572333042408575D6040823FCE77DADFBB99C164E8C39A6575D19E5D),
    .INIT_35(256'h40705496061116520640D4EBD1A85C3CA61BA7A6CD8A043053D534FDE3A529FA),
    .INIT_36(256'h807211ACE346E6E0018475CB6C738659E873AFA113C07A3A347F1CBA89648D34),
    .INIT_37(256'h43462B0B0DEBE7EE339A7BACB79E255B17B1BDB5AE29D1912E28945AB8F2734F),
    .INIT_38(256'hB8EFA56780E686AF9B60E7F0DD3C6DCE09B23D0351A0052159E0013DAA5B40B4),
    .INIT_39(256'hC859E26DD0D287D1312F94BCBD31E639A0E77DFD4ADB47EDE53F46D13503136A),
    .INIT_3A(256'h4E0356DE550723A4CF2BA1FAFECA00117E8F07D2FFBB4C22F1FA9EB469E0C5CF),
    .INIT_3B(256'h68CA4A75ADD0B378FE7B2602A7263468CB6CCBC429D160C1AC22E162D7D8024D),
    .INIT_3C(256'hF5193410A9DDAE48D681FF97BA61F3ADE28F1082000C3E3711DFCE168F14283A),
    .INIT_3D(256'hC512A5DCCCBDCBCE57CA48F9EA0BC48E467BB191497489AC32EF18C4A214BB82),
    .INIT_3E(256'h71236AFD509747CE61DDC88CCCBA6EAA38F1AA11237E943A894E53EE7564088D),
    .INIT_3F(256'h1A01E7BA36B9837A7CB5ED95C19E4396B6593A4B15C69EF467EDC9A623C91ADA),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra[12:0],1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:2],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(addra_13_sn_1),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT2 #(
    .INIT(4'h4)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_i_1__0 
       (.I0(addra[13]),
        .I1(ena),
        .O(addra_13_sn_1));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1
   (DOADO,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [3:0]DOADO;
  input clka;
  input [13:0]addra;
  input [3:0]dina;
  input [0:0]wea;
  input ena;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_i_1_n_0 ;
  wire [3:0]DOADO;
  wire [13:0]addra;
  wire clka;
  wire [3:0]dina;
  wire ena;
  wire [0:0]wea;
  wire [15:4]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFDF20355C6E61A9D1DB88D616C1B7B81F5B31B5E763814903E2A3600ED2997A4),
    .INIT_01(256'h4925C671997DD7CBAD417183C4CC7862ACB8731AE5C3BFC988D0E22D76105B72),
    .INIT_02(256'h81838F1E58314D886892CADB9B253BB4E778956B755E96E2D134187BDFAA6790),
    .INIT_03(256'hE3859CDAE890D4EEFBE6F55977993FE3DD94ECC277BB5934FEBC7AD609D90B0E),
    .INIT_04(256'hF3270C0CF941F59D4D54428D6C7698D87D06629D6798024BBE1B0BB92C220DD3),
    .INIT_05(256'hB1DE64EA70F0E5E7167782EAC60FB95B7BACA2CEB7074B0EC9A07873B86B201A),
    .INIT_06(256'hEAB2E08426BE7634B083FC6D760C173933E76AF79946ACD41E878500508B0251),
    .INIT_07(256'hDFFA697BDEB242BBCD1C07A31F416CDD436AD562A67A1196C4E9235BEAD2BB6E),
    .INIT_08(256'hDF5B4AFBB6B1E8F16BBC4035348B867ABDD7320D6C3DCBA3F4C2814AC6ABE6AA),
    .INIT_09(256'hD1A72869E24C40D8BA509B726AF7F437DEC2C257A186E41EFD6FE9F98E294D72),
    .INIT_0A(256'h5570B89882B7E975CE93ACAA1245DCDDCA556BB644974081E0C3BA4F0DA4B8A4),
    .INIT_0B(256'h7E05962C43C6AE704D5AB0FE4C0FEED4707501120FB3A9353F50BCB14E4B217E),
    .INIT_0C(256'h2549C367CF181FC61A375ED73B8618D37C00A28AEBE664DCFA7E0ADA56AA64D8),
    .INIT_0D(256'h671F9E5E06D56F0DE222CB44227847EBFEC897E5CA4AF0085B7CC7C1A124F431),
    .INIT_0E(256'hA83ACADA2006CD809B98DB442F44090D25D58FFB471A0A913E7E1DCF8C8CBFCA),
    .INIT_0F(256'h1890AF2608079F59ACEC547276FE36C62D2A839312E75D2263B8F21316FDE84E),
    .INIT_10(256'hB90A78502AC9AFBA3352832BCEE415D7E9D004D19A29BB3CF303F22ADAA36E7D),
    .INIT_11(256'h115FCF86B88CE66A6AF38CA60BD7D57047F979B99D777DA4F620538137BB2642),
    .INIT_12(256'hDA343648D1BD13AA64DEB37782124FF318DEDC700E4EB210FCA0BD8056076FF9),
    .INIT_13(256'h9D397E5D3DF839EF1DC9C28478D4C586CC7949D72C8B40BB3D6D94B55EFBA1B9),
    .INIT_14(256'h58605D8157E046C12F5F2E70D267941CEE27570F2DBAC45E54B0DDB0B30077DE),
    .INIT_15(256'h9164BEF3FD389318668D6D69A07143AF0507ADD960962682A7CE289F9EB549B3),
    .INIT_16(256'hA3219688A5AE62051D9AED4A4351C7C16DFB3A79C75C760C4F1D3DFC76D20454),
    .INIT_17(256'h0000000000000000000000AAF91E8B18868677B0AF909A2EEF790D7513A73A58),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(4),
    .READ_WIDTH_B(4),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(4),
    .WRITE_WIDTH_B(4)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra[11:0],1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:4],DOADO}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_i_1_n_0 ),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'h08)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_i_1 
       (.I0(ena),
        .I1(addra[13]),
        .I2(addra[12]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized10
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    ram_ena,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  output ram_ena;
  input clka;
  input [13:0]addra;
  input [8:0]dina;
  input [0:0]wea;
  input ena;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [13:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ena;
  wire ram_ena;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'hAD5DADB639765E2402ED16B66CF6E6B4ED311992ECEF12B711ED9AB6752BAD94),
    .INITP_01(256'h0E3C3100BE28B9B433F919E6FD462F26AECDAC34546613B40A556D3403E52D60),
    .INITP_02(256'hFEE2B936753CE03EB063B73C7C62BF62BD6ABF363D245C36106CBD806C266C46),
    .INITP_03(256'h300040FD1D7A0326A55BFAFED7CB0459576EFC0332E4352B9528D514FAB0126E),
    .INITP_04(256'hA3C37600B17FD5FECEEBBDCFED4DFED46FC716CF1509127EEECCED7FCF2605A2),
    .INITP_05(256'h867DDEB0D143B6600B106178DEA2255FFEC23E6AEF9933885FE2215FBD3210BA),
    .INITP_06(256'h001052251214686903291215D2A51D887EE3110000051332015789769F4108CB),
    .INITP_07(256'h46106B30F7D9C49D58974F6ADDCDF3F72C4B43ABBEB2A474B03A7D5E3BF08980),
    .INITP_08(256'h1ADFC123FD35A884DAB001F4C33847A5787DD79CD5E547A0580D0D3E6067B62C),
    .INITP_09(256'h49B881C12FC2C773F23CC5847A1876087048C5E987D0058968FAC1E349E1C325),
    .INITP_0A(256'h677982ECA8E643EE0B9BD1788ED1DD3DA485D62C66672B266E33D12345D9C00A),
    .INITP_0B(256'hCE4DE3529C87070A8EF2CB7943BAD74EC231B1E3F1D153974AD9DB0947C84E08),
    .INITP_0C(256'h8F48D3DC57DD52D2775D417186B74B104E04194FC8F06081051C1270409D6088),
    .INITP_0D(256'h683BC923260B516D288429FEDCBAD9DE736045B2410A74AAB64EE70853458510),
    .INITP_0E(256'h282A21E130DC8AE1BE48799C8905C3937870D9CBAE96205FAA74911BD64FF023),
    .INITP_0F(256'h838E78E77C3070697DBC8CEB706457C00BD5A6A36ADA9BA3E6732A0736435E5D),
    .INIT_00(256'h08FBC6ED08FF59BE251BF10BF505F3FCF10CBE09D69E29ECDE2702ED15EF030E),
    .INIT_01(256'h0B390FD3330D17E3E0CDEB16D6C826DCE32A31D2EF13F533E20FC4F143EFDA0C),
    .INIT_02(256'hCDF0C14EF8D03110F8E2F70ECEE8ECC621430EF72F21F617E406E4E600E4FAF9),
    .INIT_03(256'hE9D0C710B5A624EC000EDFEE00021CDA05470FCFEA071CFDE5170EFB250FBB0A),
    .INIT_04(256'h12F3F201FBAB0F0CEBF8E8F50DC9BB1CF8E9CE3F0AC8F521C901D7D529E10100),
    .INIT_05(256'h1C070704082FF823E1E2D808B0EC04CB033F17D119F7D213FC0BE6EB13E9B704),
    .INIT_06(256'h1B14E5F9E4250EEB0DF7D8E80FF9DF3408DA01E3F7F5D4211B21CB1417E70312),
    .INIT_07(256'hF74FDE21DCFD3ADA04A201FAD7E63EF7DD0FCE01C89F53D3EC0CADCA16F1B84A),
    .INIT_08(256'h260007170D06D2FDD992E8310DD831D70743CC19CFD741C20596D50D09180411),
    .INIT_09(256'h14002D04D904BE2516DE15FD03DE16D305FBBE17F6FB48D11F27B7D407DF3024),
    .INIT_0A(256'h0AE53DD904E902190AFFCB1408E5D942240833FC0742FEE0F53DC2F60DE70B18),
    .INIT_0B(256'hD305E825B2E1E410F4AD1F1DB3DD00CBBB41B229D0BF6711270BF2E116BD075A),
    .INIT_0C(256'hEFFBD4F3E6FA09CD56F8344953F1E61B1B17D401B1F1FBED1C14FE1223DFE834),
    .INIT_0D(256'h3623D4AD1E16FAE0E6F1A0F7B1181DFB17240A95F8340FCAE7DEF8164FE3A408),
    .INIT_0E(256'hF725F6D7ECEAE91F1E09D71CCB124614ED21C4D4F00C35DDF909D0EE14FE120E),
    .INIT_0F(256'h0F1F161BE5C5E71B0E09A6EAE4D846000528ECE910022EF703090A151D072C11),
    .INIT_10(256'h0BF7C80BDCDF02352C0AF82B11CBF64305F5BA01E6F0132B2EFC0E4131D9FE0B),
    .INIT_11(256'h24191BC11722090444EDB613CBF85A17F612FE89E4F403C7F812223D0F0D0023),
    .INIT_12(256'h260CDED7EEF141FD5A3DD81B13CA141C07D50DE9DBE553401116C8D807B6D120),
    .INIT_13(256'hB963DCBFCEE512CB3387D905DE59C110E962C8D0F3EAF4D00A0CEFF023BCE331),
    .INIT_14(256'h03E4FFF9F4F1214341B8DB430011D109C945E8E6EED4FAAA3EB7DF4B101FF113),
    .INIT_15(256'hF715F6EE0D2E472B08E1C9131221B5FFDD18A4FC03F8F0A83F37EAFEE5AC0414),
    .INIT_16(256'h15D5F2EA07EF23F35B18C4E0E09E0A2AF4F5E8070B2B4D0A0A47C2CFE0C8C507),
    .INIT_17(256'hE6C3D3F0F8F7DC2745BCAB310275F737FB1BD6E0DB0A05B40839CCD805A2D207),
    .INIT_18(256'hEACCF0FBDC575F65C34CA8D019550E386A5616D74B9CBA261BE6C38BC9ECCB30),
    .INIT_19(256'h8E3638DE54EC94EE161EC228FD4D1E1CE7EC72DA14EA0CB4553813E326E82F3A),
    .INIT_1A(256'h2233E6CC7421A710D9E6FC1D2DBF2F022F0CEAEE21DA4EEB2218900C9B25C8F4),
    .INIT_1B(256'h39E11CF511D1DDB800D3826B92FDC805F1E2F8EFD68A152A357F1E1D7C26BDFA),
    .INIT_1C(256'hDCBC1AED2D53B9DBFA9D223DF943FEFD05181C130ED25F2216BF32F4E0519CAB),
    .INIT_1D(256'hF227BA091DC91AFB1EFE79CDBA2CE6F6A0C3D3AEBA35ED33E5D5A0FFB7EBE121),
    .INIT_1E(256'h26084BD95FD021C980D464F6B94BBA141E6820121684FA6A260FBE0A42A5E344),
    .INIT_1F(256'h3605DAF7AD2F330B2B3D5A1A6E253C2600DF18224C803C12FD6EA2F5BEBD20C9),
    .INIT_20(256'hCBCB090785F5B8AF0009811511E1C1668E1E503B67B859DBEE27E3415E39CE03),
    .INIT_21(256'hD8F2B35AE1F3E70CCFF00B27C09F0201E7BFBF1195E413EE0CD67CE79DF087C5),
    .INIT_22(256'h151F2FFF43B3676B581D084CC0604F9F253904A60D59B20800C6E1B1D8EDE02C),
    .INIT_23(256'h07A9AF3FE1F1B2E5FDF034821195EEB0014427E75186EA61E88A0833A8FBE0D1),
    .INIT_24(256'hE9FDE911BD5A05BB50B34D4196EC4295F3958DFFBDC5FF27E3D733CD0EC21D37),
    .INIT_25(256'hCF7A0515F195E907D3FB9A369559AEF7E162F4ECEAB602C0E49F3864B4FABDCB),
    .INIT_26(256'hF433DEF3111D05DD5DE9E8F2FBD9BB82BBFA20C455A910F2D694F5EBD4B9C301),
    .INIT_27(256'hBB36F4101012FEFEFB9B746A350BED8D37C3D9EF00A7BC383775322FBC044011),
    .INIT_28(256'hE542ECECF8F20FF0319AEABB3351A2201F442EB6B2861855DF32E9BEFA11D652),
    .INIT_29(256'h45C307A9F775C3F8F7EED21C2500C61E3227F60A6E2E2AC83DF40CE8D0F590F2),
    .INIT_2A(256'hFAECE24A92EAB1E7F2140297B00E34C44304F2EA008EA4D0A7190E3FE7057539),
    .INIT_2B(256'hEFC3C3FDF4A7392BF7D746180B3DA4591F36F2FAC8FADB1475C0B804CA488803),
    .INIT_2C(256'hC38417DAEAEFDD53F12AD51C1814EB480021B20455EF24F13EF986DBFDFCB3D3),
    .INIT_2D(256'h41020A28FE1AF886524065DE5E4D4C417CFAC44A521407F930EBE9E5B0422500),
    .INIT_2E(256'hDCD849EC002008FC43CA272907019FCECB07FBDB05CFD90D27F9DE261A531D3E),
    .INIT_2F(256'hF558002748F1EE2D06E1F9CB7DF12BDDE3883DD3C9B99F3C9D52B2BA3124393A),
    .INIT_30(256'hD50729E9E1CFD1ED0FF69C00816506D22D5B6A2AF044101CD76E1E457D11BADD),
    .INIT_31(256'h06371D223E5C06FC0FC804B82ED4C4F9DD2D201AD42C3CD93BE7D9CD15BCD327),
    .INIT_32(256'h341B292A673A5F606D36624A19ED2DF20D3534821647FCF2403496A42561CD1A),
    .INIT_33(256'h18E7F5FDE3D4BB3FB9EA6028372BE2F0224642DC1B265AF0564E01286E143268),
    .INIT_34(256'hFBC72EF51F15A945FB0FC94C0DF62AD5182131DEFEDF36DCFB092931EE485546),
    .INIT_35(256'h160406560808BBBF6231F622F73A16CE243C48CA547DC200500E55D27CB829E0),
    .INIT_36(256'h271F557D8959E63C6C0C43FA22DA52272EFBEE00CD7B39251FC88A58A54902F8),
    .INIT_37(256'hEAECA8D8DCEAF6AEF22720F55B02450A17E851E412AAF2142915C2286DDB33F2),
    .INIT_38(256'h7149F5CADD1EE0FCA8DAFDE0450D5801B6052B1FF41046E8F7CCB8E4FABABEE4),
    .INIT_39(256'hDC1EE3A92E1D0C445513CBF0C207D20042D4C3D4C1BA40A441CC34CFBDA4E94B),
    .INIT_3A(256'hCE05D47AA9E0B522AE5C8EEA6004F83BCD1A922012F3113243B8B39B3CD3094B),
    .INIT_3B(256'h4B666F14CBB9240A70EF034EAC48DAC602EE0C761D3BEC81C935E863F4499FE9),
    .INIT_3C(256'hFCD934DAF4E343CCDBE10915F2C05EA2F9A3A1C73D17F3C3CDD0D1DD6DD99AC5),
    .INIT_3D(256'h0CAE3A9DC8381747F85521D056BBFC9E4FB93341DBA393E92BF4F600D707C439),
    .INIT_3E(256'hD6A7F3C31AC0D3E2F6EA2CF4962844B0C1E71F0D2FE55E3AE54B3CD8EAB90EE7),
    .INIT_3F(256'h21E146043FF5B585811C64F43A283B5E17F7FC85E811D48A323BF1C4261A0E4B),
    .INIT_40(256'h60B0A2390E05111843F9200D82F5FFF6BD1BFBFB19F6E805692FD497C4DB2742),
    .INIT_41(256'h27CC0FB8EE2C157F261B0320EBF655DD7017358EBBB812EC3431A9F0F589D26F),
    .INIT_42(256'hAADA1FFF2AC25AB4E9AECB3E0FE40BD740E1420917F7BD7C8C243B3171152462),
    .INIT_43(256'h1FEEE4AEE86E333967B2C6F2C0E25AEF9FEC34C14CBAC297F6374FC8FBD33510),
    .INIT_44(256'hC885D0466E26D2C51C17BFDBCF14032A13A945151EC9D86F7622BB237FC907B0),
    .INIT_45(256'hB29B2BA2B623BD72E32AE99573193601193C7018223610FFD2CD60C12EE87108),
    .INIT_46(256'hA0DAD39679A501FC0124FBFF1876909EE81ABC22AD152F0AC286243811752632),
    .INIT_47(256'h3D1723E6870CC9A8BDB805DAC2A8DDD9A8907F5D253C246F2618F70F0D0FD8E2),
    .INIT_48(256'h30D4DF52EA0160B4897F53290A1C3BAFD49B8D772824DAEB1646F00963D20ABF),
    .INIT_49(256'h1CDFCE23D70F0706ECA0F49BD719EA75E1B0398D0F0850EACCA6ED014F62F4FF),
    .INIT_4A(256'h614001D216E6E2A2BEF737BF1D244A0C2B60075C98EB00DEDCB36503FB253C98),
    .INIT_4B(256'h2325F279509F119947E4011BEB69761171D77E2B7EA20E8393D7A521C7464B92),
    .INIT_4C(256'h68AD9FA4DE5CE377876C68F9E9951F7690BFA9D269F1F7832D745E16EE8C4F45),
    .INIT_4D(256'hDCC7A9656E53AD6F8B49F1F6FBBB162CCCE90AA222D55663B0346D1144D57431),
    .INIT_4E(256'h1681E369EC99C0B0E99305421108EE2DDAF467877296BD8522C3D9C14700ECD6),
    .INIT_4F(256'h6555260DF6A127F4DC23E3A9EF2A2916652F1499120461AC9EE728094F0B02A8),
    .INIT_50(256'h136F735972CB49A8EEE75CBCD62182E8F4F3C0624907552240780A35E554D626),
    .INIT_51(256'h2DB3A33CCD90E0534B60B1F3454BE8EC4EDD60A4517253D4170DAF3E3811EADA),
    .INIT_52(256'h05DBA1A61BEB6C6326D2A4391AD886BB4727EC1C8C4DBEED3A06741B0F96B520),
    .INIT_53(256'hD853B12401C12003D50D4F0533C850E8919F9FEF4F9BA324094C79417D5F094C),
    .INIT_54(256'hCE071C0ECEDBEC12AB7F1C9939487A90955F3EC4CEB52A83284069EED5EF42C5),
    .INIT_55(256'h77092AD8C33A56E9FC2776E9BE41BAD2E2D5ACF62F4D4ACE02CBD7EEDB6E2428),
    .INIT_56(256'hE200D629B1244126E791834327FFC8310A72771E040BF0A1F5F6C49BDD9DD342),
    .INIT_57(256'h83E1F6BC3C70D1C76FBD50E9F12995D4F82C002F722B910A85FDA103DDC72B4C),
    .INIT_58(256'h39D326201DA69CCFE7D252288E312C0701E760A0AAAEFB6713909185DE290A60),
    .INIT_59(256'h55EF4C46BA0AD727F9CF1FB4DD572FC17F771F9FFEA6FEB642144A3D97392DA5),
    .INIT_5A(256'hEDD8E2C9073D06D78DFB26CD240623E829F60FF04F47E9EA878A07FC24BE9EBA),
    .INIT_5B(256'hD7C38038260F967C520BDFD949431FD7BA15F9AD427F42BA7CA3795F6376D2FF),
    .INIT_5C(256'h06878C78053ACDE7FD3CF0A8E921E030F5CF46F088F78ED42CF2A457DDE4D818),
    .INIT_5D(256'hCA3188478694A401D0F879E05153EC0BB97F7821FD65FDFA25A47DA2F03A43B6),
    .INIT_5E(256'hA64A69D7F8C80A17D62D01671BCFB0E7034855241CF8C1B339015B8AFF2AAA4D),
    .INIT_5F(256'h81DB583992A8E7470AF70914BDF0478CD57AD41506678AE62FDE80D63C35DE1A),
    .INIT_60(256'h1688466E63881C5AEE2532A897C717EA4B93D6957E5B4034EB106584B63B161B),
    .INIT_61(256'h35605C1315CA478B144919C0C7DB5D280A0A4EF42126CA2E31EBBCD541412314),
    .INIT_62(256'hB0D1464FEB35312AA9ACF7F111258048648FF40A484D1B35D4642E650E1000F7),
    .INIT_63(256'h39DE0A2EDE64B4266A2C1F2253B16C4E213B28AFF1760DF727D24504BACFF0A4),
    .INIT_64(256'hD73769AD4EADA037F318B8EA42DFD4CA1EB32E9C9403BEFD63939DE72E106814),
    .INIT_65(256'h11E5D6FF16E5ADA908D405D0C2F702C17070570C181557E420ECF6F28A8105D7),
    .INIT_66(256'h1DFB52C800FCCBF6FDE559DFC38E05985AC264BC4452FC6692FD4ED43B61F434),
    .INIT_67(256'hE9294462A8CEA6F22A965B39F51F280FB77F07E86860FFD4B5F9139E9FDC541F),
    .INIT_68(256'hBBAD07B3023CBAE842EA7008007C26CED7000D1F13D11BDA4B3188B93805286C),
    .INIT_69(256'hD3578B7212EA9F6269743228C0EAFB3FE6DFFC181E76B8D30A575003C8593134),
    .INIT_6A(256'h19B14108240934D4215E0A2E8945A41917F99C8419AE6847B757AE46BA59870F),
    .INIT_6B(256'h15E4B6F25B2D6DD748D3F5381F21292E8EE2550A79D71DEED612E6FB4481EA2A),
    .INIT_6C(256'hC2DC0DCECFF76C307A70C2F1F847CF4EF59711EBBE41BDADABFB4189BDB5740F),
    .INIT_6D(256'h540E736893322306763F11532FF93F381B40F60EDC2A04D2C7FFD7A8E6B4BF5D),
    .INIT_6E(256'h0030D42A3EDEFA4E1D1A356EEF41F8C821FF43FD17274FBA048FF505D69808D4),
    .INIT_6F(256'h5AB4BB08C6195F1E3A7EBBA3C527F6DBC3CD3F11F97711CA151FDC571E14BCCF),
    .INIT_70(256'h9FF66BA36CEA9E4102F7163BF9DCA8B8AEACF3B64A20445D0F06B2544E39A3D0),
    .INIT_71(256'hDC4BAC2DC70BB5213D836DDA0DF9C062F56C32F0141027C6401B70B3D05EE0F1),
    .INIT_72(256'hCA36E93AF9EC9247C42E22AF559C7E150E00DE3D024D275038AF0CA6C8DCE5AC),
    .INIT_73(256'h2CC9CAF6E3332B2897FB82F728482E32D4E274D4F14C28F29B8E1104CC25FBE0),
    .INIT_74(256'hF3575451C4056BD7251F64553CEF2AF7A2A72C0A0638B67BC7181DB61A09D66A),
    .INIT_75(256'hC94EEBE8CCF8D52C1BC63530E52D493839FEE8A4A3192E93DE1740C4A9D1224B),
    .INIT_76(256'h193A94AC04321E1CDBF62DEAF58A9B16F66D0027E215B11CDBEFEE3342293AB4),
    .INIT_77(256'h390BC527F125161A0B1EF343F51E7A2F2C08FE204E703FB49D97C90F45165848),
    .INIT_78(256'h2204EDF089BB9D6C0AFD0C432A17D6CB8FF40EDBD2BAFF4A06AE25B4EC7E05E5),
    .INIT_79(256'hB8DDFB294DDAA42151E9D78C0C099BD45108BB07DF05E13F3533515A7DDEC6A1),
    .INIT_7A(256'h2E7DF765F61AEA4BDAE91F85FE0DEBCBAD0691EECA3AEAA9C203EC4D5649F6BD),
    .INIT_7B(256'h8D071B0FBD57D2E9B0E53FD4187D0EB4F6038F6924BD9D3FE442FE622E6CE6DC),
    .INIT_7C(256'h5CCAC2E5275543443662F5122CF1685344BD30CC08E4E2ABD8C569282809060A),
    .INIT_7D(256'h5D94E0E485C76BABC72DF395F7676C7573735469C3DB4A03DCF0935DCD42B8CD),
    .INIT_7E(256'h80D9B2B5E9F3226C164E98C13C3E3C2727F2CC9034722A1F29BAD41FE83964BD),
    .INIT_7F(256'hAA516B263801E4ADF90B029AFBE1930363C4E598FF202E2DDCBAB83D64909B61),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,dina[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ram_ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'h08)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__0 
       (.I0(addra[12]),
        .I1(ena),
        .I2(addra[13]),
        .O(ram_ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ,
    clka,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_1 ,
    addra,
    dina,
    wea);
  output [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  input clka;
  input \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_1 ;
  input [12:0]addra;
  input [1:0]dina;
  input [0:0]wea;

  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_1 ;
  wire [12:0]addra;
  wire clka;
  wire [1:0]dina;
  wire [0:0]wea;
  wire [15:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h2987F796BEA62F9AC31CD26B79E7B5CA9FF72F9201F2F06E94AF70D95C116070),
    .INIT_01(256'hA35EDB6DE98734C3A6F89ABE96DFD26862C43CDED3F2E75965DB8FC7B73C1389),
    .INIT_02(256'h64A99946447F555555555555555555550D094435670DFA16B90F8F4086F8DFF6),
    .INIT_03(256'h41C8741CC741DF74C04799F454E51F65A613EBD0F85BEBEBE4041BEBFD109165),
    .INIT_04(256'h7F843315349C49CB5E61BDBE6AFC9EB37E72BD0EC027C1E7C5D7C5D7C6971C97),
    .INIT_05(256'hD546900D6D07E9D46E2725D5C6C2537C718DC02577A8DE378DE378DE0781E0B8),
    .INIT_06(256'h84A381C69AADA0C11230211DBF2C4895756069E22E60FD686483DB7A53502088),
    .INIT_07(256'h4468736484DF35E0BB42E209E347A56A0927A0EFDA9079CEEBE22F8D469A5CA5),
    .INIT_08(256'h6A8C5B5826D74323ACC223F38E81F0854328D4810589A192F80235C9FCBFA1CF),
    .INIT_09(256'hC8E02193F1FA97759A0E8CB14150FD4B5EB433B3BAF37C8AE3BE5E897893B9E7),
    .INIT_0A(256'h50CBD3906FBB39A234EA6501915144251A0813283C91C82F7B6A02379037BDE8),
    .INIT_0B(256'hD20C2569B9A6D63F757891D4850EA6F10BB056D022AC884C5615362A8446920B),
    .INIT_0C(256'hFCED3D4BC4D71A49A83A0C40FD57FF8CD8D7F3FB6FE23A714E1B3B56DE6CDA01),
    .INIT_0D(256'h8A366745A8DB58303F9DF44506AF9FC3E0C0CC24431E86DD205905F9E8B6FF20),
    .INIT_0E(256'hE9ECD0AD2251E244B2E129EB714E87EC7E244A06570E78DD6AECF2CE4914A279),
    .INIT_0F(256'hD9655E87B5F9352C03846B409E57542A7429ADDE41FEB6451D35D8BD8E74BC0B),
    .INIT_10(256'h809836587998B27FE8B7EA968994A1A931FF68F26E8E2021AF2AFFA9A21AAC97),
    .INIT_11(256'h9C42A0DE8C4C3AEBA7B714DE7AE9BC9E995509FA01272A698DF087093E792C26),
    .INIT_12(256'h705C423AA624F5416AD3CFC187492FDDB1DC0B175D3970FC5D7981F96D23BF88),
    .INIT_13(256'hCF223AF1C05840AC0A02B4648625D7A685C6DCDAAB455ADE0EDD24394D90C086),
    .INIT_14(256'h878BF0A6ED7B9A512A10C7280CB07D972DA9EA258E8C42BB4BF20270E7949164),
    .INIT_15(256'h8EEC5B8521EF30B930FFA84DE8382B409AD0136276E516D33900EDD6B697C196),
    .INIT_16(256'hA97C0FA23DB2FE6CCEAB536083F96EC58A77A1822CEAF336C7A533B7660D34C3),
    .INIT_17(256'h208975CDFB7670B2508E4D534FB9C73998D72F7A9D160929A2A14B7CD1E99921),
    .INIT_18(256'hEB61BFE8DEA0C90E654229B9B1ABB7C48947873773AD4321D2C12B723D0C8671),
    .INIT_19(256'h43DD54A7B6A66DA6DAA2C03D4535DBD834F4F4E0FE3F19AA6ECACFAED45DBA01),
    .INIT_1A(256'h83AEDBAEF0428CB17A0A710B2E9AB5A82D912FED06F2B0BC13AAF0435715820B),
    .INIT_1B(256'h793E50D5C1AC4534E1D11A76A4BD8EA88CCD2B6C8F5E9A89285B26FB61CBA882),
    .INIT_1C(256'h55825C19887A3DA01800373DC098E9275DA7AB7AC4350AAA2C2019040BF943E4),
    .INIT_1D(256'h1231EE47285894C8B5F3C95900A9D1C04ECD56CDFF07BE220CC87714E02AB73C),
    .INIT_1E(256'h323706260A8EF6807842AB8BA93FE3912F8D891213196187414AD6414DDAF20E),
    .INIT_1F(256'h2AAF2371F530B61FEA3C2DE11B1EC2C33A5BF7073B800CA3DEF92878978D7E70),
    .INIT_20(256'hD416B2FB4904FD10D80BB65E4E99C76C5170167BD840C21736B42DD2ED612230),
    .INIT_21(256'h14DBB1C324521E10440B52EE5BF98014EC976220215BEC9FB816507C91FE5AEC),
    .INIT_22(256'h98BF7106438150AA178A21900389D03818F87DA55DA025E7116C6FB9622487D6),
    .INIT_23(256'h202F89E7A600F7018F310C15F17922222E31C64AE3DAC7A071CC261F4B07F4E6),
    .INIT_24(256'h55012F17097D5277E3501D83DC184C89A3CAE250AF9B909E518699192282F96A),
    .INIT_25(256'h692E920CA5C0EF83F3E014DA8667FFCE1CBCEFDAC32FB11DA331E94DC137EE36),
    .INIT_26(256'h153EE178F339D8D2F191472A3C14EC24ABBED44E8FD59CA818D9D38B783189B2),
    .INIT_27(256'hC2C942F510D12DC23371173C48014246FD339E1B617D5DEBD016BBE82C0CE2E0),
    .INIT_28(256'h709B0C2CF4126596154063C5ECB9E9C6B1C2CADE2061843D9C9CA660CE5C91D3),
    .INIT_29(256'h0494C4FE11719CF57E5588AD2CD7C1DA96A464A4A8E80BA574752FB640AD5E41),
    .INIT_2A(256'h22BB0460BFCE75EE87A662138FCBECCF8EDA816BA64EC23870593AFA67E1A84B),
    .INIT_2B(256'h5D5C7806F71BFB53F37A78DFCE8576100D6681644230066058E5E0648EA1C436),
    .INIT_2C(256'h504D2F0D477910E96684D278080C3195EAD020C4837EA0A7E4BEEF5EA1718920),
    .INIT_2D(256'h81795546D87AFE17A99D65C38258871848ADD59C7451E93589A2ECB05EBF76AE),
    .INIT_2E(256'hB9EDE908ED07B3295A8FB7A152D9777D45417CD4AF684020CADFE56E8655F8C9),
    .INIT_2F(256'hC2A6400C45073CD752A34EFB20C4F32EEAE3F8209949A75832543ABD153E23F0),
    .INIT_30(256'h796F0E5872978882E47458A678E6CB75BB7BF8E13855E4D885519140333E8B32),
    .INIT_31(256'hBFEC05F8836B6AEEE877CF8A79A207148B997437436726A87375EBCAE3BF4745),
    .INIT_32(256'h607B08B753DE6617A63C406A7DD17CA690C0F64A38E1D45A9B974B267B39CDFC),
    .INIT_33(256'h724C1BC025DBDCD508CCB9EF7B9EA93AC6A32D8FE00EC818981A9F84BAED476B),
    .INIT_34(256'h7CCED497BB982FB4EDFAA3E14FA1BFE30117F0C7DCD588842D3295DC5B7A38FE),
    .INIT_35(256'hAEC48366DFC95D9F38E249C0069A529B8C3CE45C82B7DEA639C90F4EF1E6C8F0),
    .INIT_36(256'h6F456D6522CE20B200E0CF77889BA645D23DCCAFF7B6FF773B4603CB718D0F6F),
    .INIT_37(256'h4608D4D63251279B51243A00BB19EB41FD35273C674D6C040A97A3780F2928C6),
    .INIT_38(256'hFCAF5F96E3FDD3D4DAF3485F0F39392BF8CDFE06118DCE83FF0678F19E6036D7),
    .INIT_39(256'h5DA99E798A0B8CEA1C9310625963BE6990F7358B5E5B34F2E7440C3A784C8B6A),
    .INIT_3A(256'h567213B767DD458D0D9395C54AEFC618A5BD8EC4ADCF3C72533D1C2D032739EB),
    .INIT_3B(256'hA626DAF8615A0C7C323FC85E9F329F44F920DC0AF3CD3EE3B8A0B520E1BCEE93),
    .INIT_3C(256'h875CC776EE8FEF9475EA53407042A28B77B28A52EAF3886F3A7AB4CE346020D0),
    .INIT_3D(256'hE47343A35F881AFDF42A41BEC4162C76F1CC276253B721E2C99CABC260E608DB),
    .INIT_3E(256'hEE9D105BCC3C5CBDD678C244F9230892A12B4358E7D5A29A1FF908C814A42E19),
    .INIT_3F(256'h2B37F90BFCBB9889CEA64D0EECBAF939B273A6DAC485ED86ACBC2C9CC655F5C4),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:2],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_1 ),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h5607FFF25815F5EBAF7A197BDE985EF5D7AFA81A4FFFE06A1450CC04482FC782),
    .INITP_01(256'h6CDB36CDB192C3498D556AA556AA556A4256AAFFFFFFFFFF41E3F41220330A28),
    .INITP_02(256'hC91BAC3637F225EE0077A40000021080E70C2430E7B492DB492D7E7E7E7E7EB3),
    .INITP_03(256'h9DD595DD2BCB36A1F646A7D553DF6914917577C9476A5EA3C209B2F220825CB1),
    .INITP_04(256'h4D9FE4F84D7C0DD0EB2D16930826CB4FB48F32FF007143924B5D98E2E1B5057E),
    .INITP_05(256'hAEC1DF7078E004591DF7CA08627561A4C5EF9E2103F4048EA09EA38AEA325DAF),
    .INITP_06(256'h84D1E754384EA1460FCB292B9FDA63EB782F4799AEF93D119AA6EF1EBDD1A1BF),
    .INITP_07(256'h6A1E42924A2E72963F7DC5281CFF192C3A14D18420AB74E04688956656CE3E0A),
    .INITP_08(256'h0BAA14C041C96140BE34017A3DC993EF812CE5F3755F0483A623C40BF546B669),
    .INITP_09(256'h958650F2BEF74A8D4C381A312D94FF18B2FCA99F4E7831048E9A2EF46EAB0B38),
    .INITP_0A(256'h4467744B6E7F51B7CFB5BE4C19F99EE413974E6E8AD39E4354AFD57094DF205B),
    .INITP_0B(256'hFA96700244CD616DBEB6D0C8F666375CC30111EF01D2A077CD263C18E9DE0D9F),
    .INITP_0C(256'hE1FFFFB1D4427A98E1FAB1E5D2456EA5460089C9A1A7AE157758B12E1D5432FF),
    .INITP_0D(256'h3B153D3C236F9A57F0700CAD23AD5B736A0006DB7CCC5584283404DFFA06777D),
    .INITP_0E(256'hEB229F75E9B68727F5B36568DB72895E5B3F3C0CFA32F26DF823EC7AE2F5317F),
    .INITP_0F(256'hFD4D52D8416122694FCC7F2848417D4D755157D917FE56FAE2B04FFAFA7B6952),
    .INIT_00(256'h3804738F5FED80C0A948ADE3F7EED8C4C6F15715322303D3D87537590EFA2300),
    .INIT_01(256'h857DBA41153AB485B33F5D0887E01A3B4B4F4E4E556A93D434B9698FB54F6707),
    .INIT_02(256'hF9A738AE0D5588AABABDB39E815D350ABF6B1FDEAB8C8496C81C983E121A57CF),
    .INIT_03(256'h430E89B593256B671B88B0933494B4963CA7D9D4992A89B7B78930AE0536432E),
    .INIT_04(256'hF38DC291FAFF9ED8AE202DD71E0385A565C4C464A78B13401188A66BDAF3B626),
    .INIT_05(256'h26B6F3DA6BA6881140138BA764C4C465A585031ED72D20AED89EFFFA91C28DF3),
    .INIT_06(256'h2E433605AE3089B7B7892A99D4D9A73C96B4943493B0881B676B2593B5890E43),
    .INIT_07(256'hCF571A123E981CC896848CABDE1F6BBF0A355D819EB3BDBAAA88550DAE38A7F9),
    .INIT_08(256'h07674FB58F69B934D4936A554E4E4F4B3B1AE087085D3FB385B43A1541BA7D85),
    .INIT_09(256'h0023FA0E593775D8D30323321557F1C6C4D8EEF7E3AD48A9C080ED5F8F730438),
    .INIT_0A(256'hC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9),
    .INIT_0B(256'hE2746DA6A66D74E206CA195F0C6B1F88133A86910396165FC9C9C9C9C9C9C9C9),
    .INIT_0C(256'hE6A636FD7DC3C37DFD36A6E6DA592C235F16960391863A13881F6B0C5F19CA06),
    .INIT_0D(256'h74A6E2196B139116232C59DAE6A636FD7CC2C37DFD36A6E6DA592C23232C59DA),
    .INIT_0E(256'h1691136B19E2A574CA0C8886965F033A1F5F066D6D065F1F3A035F9686880CCA),
    .INIT_0F(256'h223C3C22443A37383A44223C3C22443A37383A44223C3C22443A37373A44223C),
    .INIT_10(256'h96135F74745F139696135F74745F139696135F74745F13963C22443A37383A44),
    .INIT_11(256'h36DA2359A67C7DA65923DA36C3FDE62C96135F74755F139696135F74745F1396),
    .INIT_12(256'h5F86168806746B032CE6FCC436DA2359A67C7DA65923DA36C2FDE62C2CE6FDC3),
    .INIT_13(256'h036A73068817865FA4193A5F13CA6E0C91961FE2E21F96910C6DCA135F3A19A6),
    .INIT_14(256'hB22221B244B22221B2CDB22221B211B22222B255B22222B233B22222B2EFB222),
    .INIT_15(256'h0C963A06063A960CA76B1713E2CA86035F6D1F5F8874199121B200B22221B222),
    .INIT_16(256'h81B7DBC4B37160E89633F0EB6985B2B5901975885F1F6C5F0386CAE213166AA4),
    .INIT_17(256'h48D83000202769F8F788804178A0D7DF20A74F2FA070819707D862F77A0963C8),
    .INIT_18(256'h619847E9D8E81977F0088F70A04FD74FF01787A7C888C9884190F8F9D72F57D0),
    .INIT_19(256'h083FF038F8D77F57075F7797E749A8C8D88758E0A080C8E877D8A80760910781),
    .INIT_1A(256'h48B8E8E8E980879F2F88DF70B06057E03F3657FFB79097A0182FD820E86A2F51),
    .INIT_1B(256'hE0205E1070A7A1A8B0286F08B027C780A76FCF7F2FA82F5138278130A022B7E9),
    .INIT_1C(256'hA740306F784098C78F7F87C787E8D79038B0C70F7FCF7098A710FFF978B7E0A7),
    .INIT_1D(256'hE7178727D09F68375800707F1E976F373F083890F0B898A897D8208068994708),
    .INIT_1E(256'h416018B8785AE85807E740C7F788201090CFB027808FEF17B01F981717A7CFBF),
    .INIT_1F(256'h01595749185147D9A0475F98F0D939289171F7C87FF117B0A038E7B8FF92F099),
    .INIT_20(256'h4938D86158A258E1A8E7F838A711FF87B7BFE800D8EF0706A0EF27F007D21818),
    .INIT_21(256'h081F70A0986FFF0777B760284F48117F28F76FA7004F0840E7083F9030B180F0),
    .INIT_22(256'hF25886D047EA18C851977027979861C7DFBF18F8E0A8600037DF418F36A000B7),
    .INIT_23(256'h295FE0EE708750E0C72797162F9F176A59CE0027FF18E09658211F5878E2915F),
    .INIT_24(256'h7D80FF26508FAF578077F06E8F988FB98270F741175080209718000F2E102681),
    .INIT_25(256'h17B0AEDFB0B0A7D0B007B8B92198F88E87B8471E78E020E7B8B727D9B91A37F7),
    .INIT_26(256'h4F788FAF59E01F58E0374F47263EDF7918B77000C8EF78BF60C8FF51B1E92F17),
    .INIT_27(256'h8167F8677F9740A0976F3138B607F83171E669A0C72630CEE0477760E890C148),
    .INIT_28(256'h5FB797667F38C04769A7F8670FAF56597198B19FA76640FF4F0037080627FE6A),
    .INIT_29(256'h59D08019F7CFD6C120B0807077DF50F12227C6427EC7F70080A8868171D9EFE6),
    .INIT_2A(256'hFFFF262F4070C0303850887F9881A8487188C7D1BFFFC0A8882A505078CF6949),
    .INIT_2B(256'h683127F0E8F82077B74700B0F850F0706F1895974F3FBF3FCF16F0591838B740),
    .INIT_2C(256'h37680F1F4018DFF180A0FFF11F47D8C711B0D861DF6F5EC0C8EF98C0FF5F58C8),
    .INIT_2D(256'h32A92F02D6EF60F0FFE97F794600E198EA0130FAB6DF775168A8AF08672726D8),
    .INIT_2E(256'h88184E9050906F79AF1A9138DF1871B9B13117C1E8575FC80711885F17883979),
    .INIT_2F(256'hA7C197A841C1D67038F106382051FFCF6F6870F02A773FA02FB89F00C7B6E661),
    .INIT_30(256'h7960C798AE4F815EB7393D6ECF68D8C8FF49EFE861506FF9DFA1EE1EC958A7AE),
    .INIT_31(256'hE0115FC0464000EDDFB7119866CFD6A9B9A8C7FFB627B8FDFF568951E7762F1A),
    .INIT_32(256'h58F04E69B6DE01E6B0D2E5F7A818E897DF276F5F42FF97B0FF26799027FF3FFA),
    .INIT_33(256'h8EB8EF08090F3729B769BD78E1788F8E3E218709C090DF50AFBFA1605F705E12),
    .INIT_34(256'h61D868B0D69F719DB0D285FFCF90C7BF3FD898E932E73E706F49EE9F48093807),
    .INIT_35(256'h680069C7A05FC0593F31EF00C840401060D071A611609F48A88769B1C698FEB9),
    .INIT_36(256'h30E12D599F706727073827F7B81FA869A1D0C1E76F3788302F90BF8F305FA018),
    .INIT_37(256'h58E31669FF5087079F4FB12F67B07738B8EACDE277F7FE061760E9211EFFC100),
    .INIT_38(256'h40D24579FF404FD79010C7B7682FC918A04871DFE90FF030B0C6791036A09009),
    .INIT_39(256'h581FD036A920E071C1E916C77858211F2860B096A010AE094147A19867782FE1),
    .INIT_3A(256'h69AA3E92866837508088A607B7B891282928E17F0050AEA14838777E7850B848),
    .INIT_3B(256'h27D8D14F97513896E84819591868B0D808BFF1E720F8D27DC067B2F99FB8C9D7),
    .INIT_3C(256'h39808E8FE9AE76286F6F1FDF102F7FC00701114FC708703FF1C7A012802820DF),
    .INIT_3D(256'h30E00ED851BF6EA077F8679F17E848EF6199C60169C785E817A089108E69BA08),
    .INIT_3E(256'h4889474840906F108FB8EF49B0BF3878BFD7A1B0BF78719E51B70F380799C0B7),
    .INIT_3F(256'hD0B0014717F8A86621D050104F8F10C008687947DFB011FE320847EF38E879A8),
    .INIT_40(256'hA1E03DE7A957D551A7F76F9830186779772701B0D85920753836A7605F27972F),
    .INIT_41(256'hCFCAA9715FF7B720607F0051F81FA710467A70207097C66831EFA9B827C9E248),
    .INIT_42(256'h60F58F30196019CEF7AE20C06068D060569B072948FFC03880A6D841802F9F68),
    .INIT_43(256'h086F47F1507841EF7089D08630E888F9CAB587A810E8C857A8E018B660A758F7),
    .INIT_44(256'h818F36B8518F99403F97E8085077006FA7727799CF1008C8B9D096F670B89098),
    .INIT_45(256'hCE824010E81F2720614FB021AFB7B79FAE53101A9FC0EF20205007FEB708A9D8),
    .INIT_46(256'h20DD5FDFC9D8698E31B6E8002828DE606FDB50D92710276FA74787F87047AE3F),
    .INIT_47(256'h3750F870EF71D068B98839297E4F3666609FAFBF91600900D8280FA6907F1197),
    .INIT_48(256'h87D799A8AF67C83000D7B731B70FB7C0886737D908E71A467847C1AF0748607F),
    .INIT_49(256'hAFE1D1CF773F2759B07F49CFA7623860A7D7E766E14F49F85780A03940F7C9C1),
    .INIT_4A(256'h9036F89FFF50C7677D97F05F57EF78503869880F483F009F88177F7631203828),
    .INIT_4B(256'h2FCF89579FC0FFE7D0C9BF8E21D79638F5E9D0AFF1776059AF4779182FD021D8),
    .INIT_4C(256'hD610F091D7D7BF1F9858A8E0E71E37D8BF381F3067E0D8D80641C06728384198),
    .INIT_4D(256'h012F42C167A050EFFFE030F86650AF9F600238476070DDE0DFEEE831F8D067F1),
    .INIT_4E(256'h37A8D76968682007E7D680F0C82F17E8C7873E6688861750D8AEA86DA1D7EAF0),
    .INIT_4F(256'h19606857001E96F7C09647AF88BEB0C00758887097CFA778B817785960F03679),
    .INIT_50(256'h9847A60F4F9078405E9F8926E0E17748C797317517B227B907270F575E85B907),
    .INIT_51(256'h477161082E6E98CF89100E26D7075697F7D8AE8877B9A8B86650A7CF3E575F76),
    .INIT_52(256'h50F0174F8067C9E7B0B24FD09148EED1DEB89E8827FEB83781555870902FB777),
    .INIT_53(256'hEF209E2790A931D7B7B0B887A7177768A0C860012097BF66C09137FF6AC0D601),
    .INIT_54(256'hD0BEF7B08040890199E07EBAEF0658CF700507B57FC7BFEF48186FE7361FEFD8),
    .INIT_55(256'h70474928D8B769F1B177C75027C7E180A758B867BFC8065F37F8990F5701C937),
    .INIT_56(256'hAF285086FD48208D97D8402950304077FF6A4958DF0E86673147F19691B8D1E0),
    .INIT_57(256'hD8905877DF28209800785108187188598880B1A0B7C8401FB119DE38F8167D6E),
    .INIT_58(256'h2F40681868F87097A8B598F0779F9078D8A8EF1757DF4F67B7BF473E6F39F0C8),
    .INIT_59(256'h70D8DE788748D88FE9502E97279F488EE8799747F6969E58CE76E01F100F8048),
    .INIT_5A(256'h8F07F79FC729599159FEF057912FA818F04FA8701EFFB770FF88F8A9DF8131D0),
    .INIT_5B(256'h3710A06929BFF8E08077B6777021E7C5987777B876F7B7D868AFF0E957A961E0),
    .INIT_5C(256'h9699E0EF10D6A69038011E258FB760A076300840506030802D06BFFFB0D88FF9),
    .INIT_5D(256'hCF3E1727F740D83E68F7FEDDA86ED770FFB00F9940F5B71858E7972F29E0A66F),
    .INIT_5E(256'h08703867E7E82088E0DAC099C8317F5F20672186E78F77EF719958B9722F07D9),
    .INIT_5F(256'hF8CF9FF760204908497762109790804849AD773997C6125611BF18F7067F40AD),
    .INIT_60(256'hF6F879281E70DEE6D947670818F0A727122EE7F9585826BF6749BF983160E1A0),
    .INIT_61(256'h575E806750786167E1F0E918802F99C910D7CAB09780ADC0B03830E0F2212999),
    .INIT_62(256'h61CE6F4FE96801B8E031DF31F8EF3671A0DF2780CFC746DF0F50B14F68994A70),
    .INIT_63(256'hD8D67F0808AF1828109816982E3F5EA0D6F0805848B870FFBF07C8C751BE60BA),
    .INIT_64(256'h60B7F8C0E788C11FA8180F973F495E272FC0A1BFB057088EC8C8D73601A899F7),
    .INIT_65(256'hD7F7F8798786E8D7C590B958AF078699EEE6CF5E31672180D8293177F8302858),
    .INIT_66(256'hE7D9E06887A8407EF0D809D62807F5F736513265F83FAF08172046DFF758A618),
    .INIT_67(256'hD838B82727274FD0BF6B8B5BB36363A383639B8B63AB6B83C3E8B69A27BF3907),
    .INIT_68(256'h08BF87F7984FDF879F37002018AFD087C7D0777E18E7D877BFB86757E0A70F4F),
    .INIT_69(256'h80885040001870F02027E8F807DF2FA03018D8B02FC8C06F7857403748DEDFB0),
    .INIT_6A(256'h3F6F375708E0488FA89FD8A74080C0B0B1FF781868F818007FCFE088D0872029),
    .INIT_6B(256'h37F0970FA77FD73F9FF047D757B02098D877384940E12040384017674FAFC8AF),
    .INIT_6C(256'h9F072F08105FD777F897B80FA8D73756C8FF671FE8C7078F8FF08FBF2F07D097),
    .INIT_6D(256'hCFE05667671007A08F7FF7071010B09100802077A8904828CF8F17F780D70F67),
    .INIT_6E(256'hC747A7685FA8E0CF47BFB7E870E6BFA72F77DF4F3F58367877A8C77017BFD7F0),
    .INIT_6F(256'hC10048C8801058CFC27F801F6758485879C8D168A7092837790040EF7887E048),
    .INIT_70(256'h3F2F4F1F58E7A030F0A8384F9880F0A8713041B81F20C9BFE288405F1F300060),
    .INIT_71(256'hAF40FF378F2FE75FB7A74857B8B81817E949C979A7D8D1475A802F8030B7182F),
    .INIT_72(256'hB740DE2FB85887F7A71FD00F081ECF0F57A0EF9F0F8747EF07DF371780AFF7A7),
    .INIT_73(256'h512887975D3800B687E82770A028E86F9159E8B857E830570A17E7EF9FCFA008),
    .INIT_74(256'h60898F7FDDB0009FC628BF58AF172FD04058777FB6277F561E48B7308FCF7778),
    .INIT_75(256'hF7CF6F2010905738C81F30B7D827B8C0BF3EF0BF38F06F28788F3FB070571F27),
    .INIT_76(256'h61DFB707DE8878F606778FEF183ED009EF5728B1B8D007E86057B047B0AE01C1),
    .INIT_77(256'hD120C857EE5FA0777686A737F85E4870B8271F4911D84F88172067D9FFA8DF30),
    .INIT_78(256'h316987AE8E7830876FD03F205F77176819C8CF1616F86FC666A0DF58571876B7),
    .INIT_79(256'h2E47AE56C8503018371F4FD79826B8907F2E58F888B03F38E8D0DFB00750DFC7),
    .INIT_7A(256'hCFB77FEFA890B0001F8856CF1F178FF75D8F77B6D818383F27F787DF47E03FE7),
    .INIT_7B(256'hC9A730F89666B7BFA09F28D02FF73727C807506FB53F970787687FC7DFB070F8),
    .INIT_7C(256'h6510663FE8B02FF7284E3F4850F0A7E8C03F9FE01EA7DF6F68164FB7D02880F0),
    .INIT_7D(256'h1EEF67C610408FD7F75EC828EF28C8F7C01727702DCFAFCF1860EFE89FCF088F),
    .INIT_7E(256'h26FF6766D9A0D7314F7877F087CFE02F0630C67698F8E8C83EB8372F27C8F787),
    .INIT_7F(256'h80C7D0478EEF003FB84FE0E7FF276780B006B7C0D69F28F7DFD8AF1FD0C707BF),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,dina[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    ram_ena,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input ram_ena;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ram_ena;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h8B25D7F13929A1E22D0CC9BEF142CDB557F787F49D834987520422641B6F7334),
    .INITP_01(256'hDFAB7723E74D7A05CB0D6FCF5FDFFD6D4D78A9627DB7980111402A922171DBFC),
    .INITP_02(256'hEC5C84E86FA827FCEF410D6D4A88548095B98FA40EE625FFEA21D6558F453F47),
    .INITP_03(256'h0F5CB4A1BD12C29461242B77893C83E535E8DA0C406CE28DF549B82BDD56EB65),
    .INITP_04(256'h06E15920CC2E0C7110EAC7FDB9FAF4AD5D077C120799DF6B44E0FC01309C5B20),
    .INITP_05(256'h40B88F6391649975273CA43EC173C507617CBA86B72059426B31D1246D7DAB8C),
    .INITP_06(256'hFF69C2D2C635E50C65280CF5BAD36522DD219A2B5FFEA425A9E04077DD5F46D2),
    .INITP_07(256'hE554F5C380A268A373C420E335CF30D9BA3389C6EB0A5081AF989BD471F5DD7F),
    .INITP_08(256'h4749AB1253029489718ED7542B0FB98489C5CD65D39656540DD4C4CE48152BB0),
    .INITP_09(256'hFD6695615912D40A2B720B263A4836BE465F76E90B2397017D187D7CBAE824B0),
    .INITP_0A(256'h35B164858B847EA77DEDF702C923F270D8A069493C9198337742C5F0B10CD174),
    .INITP_0B(256'h5F2D71E29AAC93123AC62A28A23F08EA1DA49B27073AC02AFC96A872F2F31FFF),
    .INITP_0C(256'hED62912BD3F64A07A87FEF10DDDBF2161D0D70B86045C8F24A6202439746853C),
    .INITP_0D(256'h725FE00941285025140E33EBF52D7E0BAA66A622E3C5CC3B6199DC87BAB628B4),
    .INITP_0E(256'h3DC152AFFEC711B469386BB5B7D517BF21BBDE9FC5B203EFB3F3C8DB65D57CE0),
    .INITP_0F(256'h898E93EB9FF8E661A3C2DDC5EE92BCCA686738135EF5BC3A373A2EEDC65B6D3C),
    .INIT_00(256'h01BE9FFFF7F8EFCF185F97FFF79758E7F0FFA768F7E7984FD0BFEF3808F7582F),
    .INIT_01(256'hEFF70F0847A7F8D7D7A090177096D77FAF08C718E748C0B05FA8871768C8605F),
    .INIT_02(256'h4F3F479817D8001747374168004F0F8F1FE0872FBFC8506707C05887F0DF6750),
    .INIT_03(256'hA7AF18E0F7D8A7DFB7CF00D08F57271748703FC808C870680F6F1E577077DF67),
    .INIT_04(256'h2F5EA7FF17D74757EF58971838A746E7D767508F7ECF371F5090579868EFB7B0),
    .INIT_05(256'h070F1680E887B86F709F11BF30EFF83038101FB00FE8F75F0F3F3F48B8F05E1F),
    .INIT_06(256'h4F8FB6B71888687F5017C9CF57F657E8B74F47EF37477080E8B000982836DFA8),
    .INIT_07(256'hC12868606E08F70FEF374FD75009C85889A839E80E00CF076667601701D718A8),
    .INIT_08(256'h68006F004856775898976E362028BF48B07030EF77F7D0005798D786B008E797),
    .INIT_09(256'h6F07CE17F7369760C86FE60F07B05797400F4F37FE5FFFC8B7200158B0AF3F30),
    .INIT_0A(256'h2817EFAEFF9F2070C877893F5F2FE8B9978F1FD61F27E8A0D850200028660FD0),
    .INIT_0B(256'h80477F8960EF885027A7B75718B847D7D0C811171EAF9018BE2859F0873EBFD0),
    .INIT_0C(256'hA01E5781975090C9C968D0F708FF68D6A837EF88A878809097B778B8DFEF11DE),
    .INIT_0D(256'h60B08F4688875827CE004867BFC8C697FFC0A0D6D7C63F07B63F50367F8F7917),
    .INIT_0E(256'hAF40DF38E0D0C978385F28A0C74FFE482FF8400E4F277F976F4F401FF0D0A7FF),
    .INIT_0F(256'hF04F877968E8A068AF204787C75727DF2720C70F288F00A78E4F98AF801779A7),
    .INIT_10(256'h18BF58597F5830701027F867589710DF30FF5858277800E050AF70C847BE186F),
    .INIT_11(256'hA817975F672F1F70EF47A08F9F6846585000E7D6E76737C7C69778D7FFFFF1A7),
    .INIT_12(256'h08A76790E8F8F0112757F8576858D77F38278F405097C7612F2787A808CF3F8F),
    .INIT_13(256'h6F38303F3718D09FB96147C7682107682739508F7537B71780DFE8D719E7909F),
    .INIT_14(256'h504F40A81F2E68E05EF04F37CFB09FD8FF08501F7797D7671758073FD030F000),
    .INIT_15(256'h01AF77894F566631A7F06FDF8740DFD0EE61E05FCE70DF17083EB090507F767F),
    .INIT_16(256'hB8E7B768E7F7B72077CE2010A017FFE71908EF70CF9F2FE807369FDF10509F06),
    .INIT_17(256'hA88707EFE81F2F688F0110A7E73036113E5970870D207FBF6856C70F8020D70E),
    .INIT_18(256'hCF917078F8DE2F27F7B10137C7C70E585828F71086889978974090E7A880A8D7),
    .INIT_19(256'h005607DC01B009205741DF9170C0197ABF809740B16030FA186138292F273621),
    .INIT_1A(256'hFE1728F07ED8004F00A1FEA7E90F180010B8573050B80E7947204FE88A96C9B0),
    .INIT_1B(256'hD8B927A5206F4EBECF9FD85F87E1582F319E8F58D79EFF30B6A1500716B70700),
    .INIT_1C(256'h6E20C73E9997DEA80F8E873F2E7879B0292FE0C068102920A7D006D74680CF10),
    .INIT_1D(256'h3707E7BF016038FF5FB7107841785F763828E10138E9001798FF1F48C8B03057),
    .INIT_1E(256'h0F2EFE3E9FAFF097DF6F9068E0CFA95AE7B8EF90E2C878B9CFB848F731CF3778),
    .INIT_1F(256'h4F9070107811568840A1C8C880B8A04019A84819BFC1689841D766F6CF82B010),
    .INIT_20(256'hB788F6EF67185586D5AF41F70F18A06A8F0047BFE157242111462000E701C879),
    .INIT_21(256'h98B6D279D60AA747470E0FA0E0002F4780BE60DFFEF770DF1F30C8CF375F3F8F),
    .INIT_22(256'hE8FA08CE40872F309F07D27FEF52E88726094FBFC9300F47B667E7505F60073F),
    .INIT_23(256'h3F20D051B64F9DDE9080A8E791F7D85F384ED758F1803852F850F807C0C1708D),
    .INIT_24(256'h60875FC69906E00F00B6A78EC70080BEF0D0703ECF5DD75EAFF76790FEA17D00),
    .INIT_25(256'hFFDF384F4F667EE0880F4F2770F11AC8707EEDD7D0F9B8E0C8B14F05E7C9E08E),
    .INIT_26(256'h177088A7B741E917C1C0DE6786B709A03797DEF00020AF1066BFAF60B7573E3F),
    .INIT_27(256'hAFA0E0F14801B008A8A830BE85E146053901C88A1F158FAF30A0D7D0B830BF18),
    .INIT_28(256'h587E102127713AA6D8B7E148AE2E60C12F16C0492F1849089700C86931B03161),
    .INIT_29(256'hB868A63727A6F66D3F00C987D9B11178AF5F8F28E8A90028171F415F49D82F87),
    .INIT_2A(256'h7EF61F6E577052B59088B270DAC8D7B8165A40FD377180CE38CEB6F026506DF6),
    .INIT_2B(256'h8F28F1D7F624CE256FA108A0813E87975EC7362E58F2D957682E40E7D0314FD6),
    .INIT_2C(256'hB028FEEFBEBF6E36A0381869892000C0D7DF97707870F7EEE778C73EFE78E63E),
    .INIT_2D(256'hF08A97F76AFFAF092029BE98918F4FD9D700605EA0EF11DF227FDD9067260FD7),
    .INIT_2E(256'h37D8C07F398F4197602FBF007610B797677781D1774868286727180830680AF1),
    .INIT_2F(256'h378EA1194029501A66802FF81F681F7E876F273E879ED5FE4FFF17B0F0B02047),
    .INIT_30(256'h2F365F51578FE62E6FC068A810FFC82710804928700FD9F93890504F49D90298),
    .INIT_31(256'h666FC7073818E86AB95707F121CFBF408759D0A94041F728F71EEF4198E69628),
    .INIT_32(256'h314EAF81E071400150F09848179740691871505839F881B0384F506188300919),
    .INIT_33(256'h10AAC8685F56146EDF7E8727582F4909C09E7E50613939A23F36676068AF07D1),
    .INIT_34(256'h7080B848E77F7FC77F7787190017C9D128986FB8515F3FBF61F88E508E2FD617),
    .INIT_35(256'hFFA87666A167785837004150DF609A01B7200008E1E1F9C706E89F28E64E17C8),
    .INIT_36(256'h5728387F4F965C9FB7B7E8C74190B717E77FF1A7A89F297EA098E84730F018D8),
    .INIT_37(256'h63ABD3ABC38BAB53CB48E061F710A7A0CFE230128FFEAF48E0C7964FD68F46D7),
    .INIT_38(256'h8808D586EFC7084FD0207777786EE768C017C8DF4FF95FA7FE3A13C3637BABCB),
    .INIT_39(256'h88709F48C7805751C7873DC81F0E71C7F76147A620570E60EF605859D1E688A7),
    .INIT_3A(256'h60271960C9E85707975E67EFF6B18FAF6918AAC8465878304178E7C8B7C85FF8),
    .INIT_3B(256'h891FB010A7402E6967619819995830489067355828E1683F9F56A0B8C7701091),
    .INIT_3C(256'h50A83FA838287798C0AF6F4650B7964E86705E27BF1E5057FE6FCFD13E67C77F),
    .INIT_3D(256'h206F213841FE6F6EE8B8B6677746A89187EF67D057E9E809A1673030F72D606E),
    .INIT_3E(256'h69B207068E4F37C75FB880300F7776CEF01F2169F5689FA0681FA937782FA819),
    .INIT_3F(256'hEF58B25E71EE41DE7FE647391008F60883494E474FCA01102F28DF997FC73E46),
    .INIT_40(256'h555E61891A97C73FDF5972A7151759C9269649AF7ABF4F80A81999B8706648E0),
    .INIT_41(256'h7FEEC7DE49400F7E60B0B09FC0C881B8D8E807E857E000D1A7B0020F16963769),
    .INIT_42(256'h990867E7801750B14776676000B0EF9F99B08EA7A6B0471F5820981EFF676818),
    .INIT_43(256'h175FC280E90E30E6391727E0F811889F2FD72F5FD59FF0DED6C7E870C7079F00),
    .INIT_44(256'hE93030B617D230B9EEC036169FD1BF80F75A898E8DB9FE28E8B1E9DDB520A1D8),
    .INIT_45(256'h95BF1F4F2F8F187E0F88F75FF0B03007BAB9B127EF471DA647FFF697C8FF7677),
    .INIT_46(256'hA67F90CFD06869EDF070A9BE9869515996350657517E802F0170B90750F79981),
    .INIT_47(256'h1EDD6E2E010ED92F77EF7F2110E0C029FF293120DD2B686F673E2A9FAD565121),
    .INIT_48(256'h7F1A78A858F2AE189000BEF8784F4EBFF10248F7FE99B7410FF7714FC626FF29),
    .INIT_49(256'h355590E17001989E20505EEEE16F90D79168E7392D415E2F7F40A809E0AE6697),
    .INIT_4A(256'h1EB70777DDAA51C040A2E099B09726470FDF2DF84FB95806205669CE3E47D006),
    .INIT_4B(256'h0FB098B029A6BE692E889E793910B9970AF188A85559D97E48F878BF1717CFE1),
    .INIT_4C(256'hE7E987E0E28E1EA76710473F7F1F5FD78FD8B6F05F4FD63077E0D6CFAF8FD0E6),
    .INIT_4D(256'hD96175B7D8C0E82758A020F8D0C7B8417078860925C9689640C88967BFD63730),
    .INIT_4E(256'hE711F718FEB1E6680EA1BFF8785F88E108A8DF075CCA49007788663F99DEEE80),
    .INIT_4F(256'hE8E036DE80A97591C07116F879F8A7B138D9188F1581397F5697700F60507F10),
    .INIT_50(256'h505148D8C6186890F81F60EF288080DE2F07D8DF8756E0A0A1CE0EF6B02866A7),
    .INIT_51(256'h225066E0376E51AF8EBE410071D9115F58219757889797B8167F279A72019F58),
    .INIT_52(256'h6A2807FF59DE38CE373FE1202F4E570AFA77368DAF1E3EF8FE92F77FCFD63EF9),
    .INIT_53(256'h01DF2CFEA9E89F87BFC6F8E1C88110964D48CFEE97FF78F86140773F86B00802),
    .INIT_54(256'h46A7F050853147C021B848A002A167C87D106F2015E0DFEFD88A89085660A078),
    .INIT_55(256'hC1EF25260010E78606AFF7F23A4118CF18D7D849A74F1009AE8E5E47A0D17948),
    .INIT_56(256'h2F37A8D99EF686DE39AFF60F68CF31F04F2108C109773F676902A7EFB7589EE8),
    .INIT_57(256'h429615E5A0B281F21615D18F1FEEAAE8B8CF5E87FEB84ECE9FE8D85E00A7A1E8),
    .INIT_58(256'h497FD76F9F0A72E0CE7A51F0B8876E38400DC0A820B957F2F699676647671D00),
    .INIT_59(256'h00E057DFF9794131C006D560FFE169C170D008AFBE78000F7FC7866E1FF0CFE8),
    .INIT_5A(256'hFFC9A948DF078EAE1FD760FE50F977CF57B1811FBF57465ED8D2A71FF1E86E67),
    .INIT_5B(256'h2B27BD6DD7E06AE17FBD3887006990B88F20F8A1B9015DADF98758A96866A04E),
    .INIT_5C(256'h9F6F876FB800A7CFCF70D14E3F6FA047C71608175EBE99F6984AA89991507590),
    .INIT_5D(256'h61472FA8F7485E6A5E47BF5078A0E937A89598113198FED0E66F98A79061A140),
    .INIT_5E(256'h2B71EEDECF90CEB0FFD05FC75A3FEE7EFAC076EE172146685E223F19B2D7172F),
    .INIT_5F(256'h0B212E20F7C8472AF8D1B736EE5F5880A1E04957984E023668600ED9907F9EB6),
    .INIT_60(256'hB665DEF701213806A078DF27782FE84196B79731D1CD8ACF06B006DF2157F757),
    .INIT_61(256'h0A102DC6F01A4F5FF5D8B8F757A19F86492FD161B821E0305E4900CF18E812BF),
    .INIT_62(256'hD097871F0641B28F178EF6382AA628CEC818574916C1191747629FA018F6D01F),
    .INIT_63(256'h40561F3ECF6D76C800D0A7AD3FEF5127DF0EB081D66151B7771F7E661F1E9980),
    .INIT_64(256'hA8D0406600E0CFD10F070928A7AF0606B9680710D8DE67C9E781D03ED84E95B1),
    .INIT_65(256'hE1F811564950A8C71FF7B82FB120C1D073087691758A87887840F929C00F306E),
    .INIT_66(256'hCB10CEB148C23A3F80F13F46689F28875230EFB8E57F525EED506040497EC628),
    .INIT_67(256'h2940CF16CA1EB7E8F80E2015400708BF384EA618EEEA32B8DEE07ED83FBF00F0),
    .INIT_68(256'h0F3F919727B8E637D129763FD7780E60E0A0482E471048FE3E88F067D8DFDF2E),
    .INIT_69(256'h905F59F9DE761E9FC2621F38F0E1077F0FC28FC716C807DF1162505869B07871),
    .INIT_6A(256'h498FD090B171E126F8BF3FF990C661B0C937208660B78E6E18B7D8304FA74FB1),
    .INIT_6B(256'hC1C77870C95FF0E98F38D297CF5FB0F800F72F805FD0AEDFFF57FFDE17D131B7),
    .INIT_6C(256'h6E153F4919A767B937085020276981E83EA7CE8F972708E768AE6648A838557F),
    .INIT_6D(256'h5F70CFC8A16F5820BFD6509120F0A0C71748586756E0874000B7DF30363EC9D0),
    .INIT_6E(256'h213773F2471EBE41C0201E0F1159B0B871E6BED6D6B7EFE82105D89FC008D77A),
    .INIT_6F(256'hF8D0C1F870A9DF779FF65048307E1FAF4016D0DF08AF314FEFAE07C227113DC1),
    .INIT_70(256'h9FA738A905505E88519781877E2E1F36971F31410178270041695A797776D8E9),
    .INIT_71(256'h5898CF46106FC940CD470F70DFF8464740E1D0E880AEF6975881CEF8FE878097),
    .INIT_72(256'h7F58D02EFEE7A032373E7E01B7B847E848EE48518067A7FF887F1888B8A8FEB6),
    .INIT_73(256'hB8A93E90F068DF3780B64F562A9FF1B8D10D6F673EC8C7897F5F98CF075807A0),
    .INIT_74(256'h66F91E787FB13E8877781F07E8F778966060BFD7AF89B0B0805FAE8EC95E474E),
    .INIT_75(256'h8868D030575777607F65182EE9E0B0F0C0410FAF5EE0B7D08F7748171FC93857),
    .INIT_76(256'h8887F8E01F69779838F7A6D0CF2086160E50BE67616F0780E608465037BFB026),
    .INIT_77(256'hC8A89D5B6E577816BF00A9E7A098D1F01037C74810BF67210147EEEFE796D7C8),
    .INIT_78(256'h6F0F588840A6EF3961FE6149A838CF0908061BBFE796DE38D228BE06309FF731),
    .INIT_79(256'hB05F407890D887C0595747688FB7B7A09F8ED22050CFC089A07140800FA0EEAF),
    .INIT_7A(256'hB028E8C6568807B898B1203E48F10F7FBEB756E1A80F88A84039AF29D0E09757),
    .INIT_7B(256'h9727D0801E1878F08895E899B96FD7C937399ED0F010A8F1D778771F18167F37),
    .INIT_7C(256'hA9670700F080E08907E9E7BEE77F07B1D74227E7782827D2501FC0B881118018),
    .INIT_7D(256'hEE8F41672FAF88EE1EE8CE495EFAA63FA0B0EF8F8778E04855877FCF608EB987),
    .INIT_7E(256'h76873F780FDE382770896718A027D8CEF9BFA8E12E0878DF508E37E6885F9190),
    .INIT_7F(256'h7FD8E6D7AFEED756B6C8B88139D09849B0754022866F46FFF207EF07402730B1),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,dina[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ram_ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ,
    DOPADOP,
    clka,
    ena_array,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  output [0:0]DOPADOP;
  input clka;
  input [0:0]ena_array;
  input [10:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  wire [0:0]DOPADOP;
  wire [10:0]addra;
  wire clka;
  wire [8:0]dina;
  wire [0:0]ena_array;
  wire [0:0]wea;
  wire [15:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'hF7A2DAA5507BE1B333790C7A07B7260388297233FC3F4120D906B11FE20507C1),
    .INITP_01(256'hADE9A0B4BA423920D30660D9F121812BE158E00252074A0B9FFDBE67E1B2B4A1),
    .INITP_02(256'hD50591A5003ED12D1B7561BA4B5C00BEA588D0F8AF8FC1F96B1C903467667A92),
    .INITP_03(256'hACB54703F290328870C03DFCE5B6C007D03199C8598BB58B784A78619A49FE96),
    .INITP_04(256'h18411F3D73681BE86876333BEF2D585D583CA9119E9838E47CC410ABC664FA90),
    .INITP_05(256'h0000021100184C056CDF93130304D1F778220E223030287850955F14D0FEFEFD),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hE8FECF57A83E81EE97B7AF9F30A804F1110821BFF0583A1AB7FF4776A8B91E20),
    .INIT_01(256'hC0286FF169B0F81798D876FF1191264778884DC737C6DFF1E8B88F17112D49A9),
    .INIT_02(256'h50B8D0D83F0047EF01371011C8A9E75970CFB052377FBEAF6A5746771F871F61),
    .INIT_03(256'h885891192FB697A088DE27E8A886D910282E2E3917F08997B8D078B1FFE7C8E1),
    .INIT_04(256'hAF403050608F578E67F1E80FAF50F728C6D1F0801F9838F8E8358F69BF4E70FF),
    .INIT_05(256'hC0693259401F40113739303E586EA001B030969FDF087718C77088D8FF17DFB8),
    .INIT_06(256'h3867C7CE4EB5B0ED20400808874EB121E0801EF5F1E85058D74010D8B717D0C7),
    .INIT_07(256'hF7F87FDF6660E00638E02878D8911EC9FFA18FD79EB790B1072FE6F1C71881D7),
    .INIT_08(256'hD92FFF29404650B028B69000E72EC12E91968888710007E84F22F9C759D9A7B2),
    .INIT_09(256'h9FA8477FDF08807FBE47A915C54AD8B0F8B861B2902878A10776089EC0300F1F),
    .INIT_0A(256'h5F009FD7C84978502808DF9F3756C9CF877F80FF914119CF3648F81FFF6F0017),
    .INIT_0B(256'h1FFA97B20818FE995EB9C84978C017C83140A137F8B9CFC8F79039B7B09710CF),
    .INIT_0C(256'h0FA1894F3E02B687EF9EEE2E18CFC0895756DCA8B7E79AD2AF81E2A407A2F858),
    .INIT_0D(256'h9D80B131F6015E10B67987EE48DF713E8E96ED78987A37C7B7D030D65F37D0C4),
    .INIT_0E(256'h1052088080191F7F704EB6571059D0C01560E620FE77C248B84FF73777A81F4D),
    .INIT_0F(256'h4E30C846A74990065948E0300FE8B06F5F10682FB1DF773106DF8F70377F91D7),
    .INIT_10(256'hA0A066B076D8B7E8301730BF9F21C75F08F89FA8AF49610800B0BFD0D08D3EFF),
    .INIT_11(256'h57E64F56A787066799F1389000066648B0F15F9F67984F184709512658265FBF),
    .INIT_12(256'hF7768FD766B820A7317F185849E13E5FBF455F1FC6EF9811C198D887D74FFFEE),
    .INIT_13(256'hE691384F798A9F77CED8A746A0A0386F1E584EC9462AB93A0677BEF18627EE2F),
    .INIT_14(256'h9737776EAF90FF7800E7A04780B70800F7E190A097C9998F203F6E8FAEE60A5E),
    .INIT_15(256'hAEF95E38083A964F3E5FF7992826C8DECF470797A037478611C8989F270E377E),
    .INIT_16(256'hCFD05FBFC71848C7A948A7D8B710580030184869FF189001BFFEF726081FEB05),
    .INIT_17(256'hA670A9C065D9605EAFB1B0BF8F78E8A71768470187DF46207EFF07480FEE2E58),
    .INIT_18(256'h00D05031A0B89030C61FEE2F37106886DFC7E8BEC06F60DFDF20A901CAA8C790),
    .INIT_19(256'h88B758E86957A880E9B77158DB9E26C1482F971F965EF148D8F757B6E672E9C1),
    .INIT_1A(256'hA72F1EBF8860867087B898F80F67C9C021582807F089789907364F09A0C00988),
    .INIT_1B(256'hCED0A7E6A62FFAB0582E779707D9A078B88A2A4149E0A9F92078781FB878885F),
    .INIT_1C(256'hA7D85F5F9FB72E08A718CF29E741AAA8511097D711F038CEA7850E27F8908F10),
    .INIT_1D(256'h276E56FE46FE5FD7794F11F7DFA1A0917F70F8A1C79071B9112787A8F828482E),
    .INIT_1E(256'h506F697090A9CFD096DF2FA087A149B08E9099989F715E1791E747971F3F17B0),
    .INIT_1F(256'hB0585870D0E109083F4740C7805E2F4847A76F76B71717BF3F716027471F09F0),
    .INIT_20(256'h6057C747B11FD8A1D757EF673096E0089FBF10D0F7FF1F866F88B7D0DFD66286),
    .INIT_21(256'h26FFC707BEDF4FD8D7E860F76FEF7148F95098F06960409E275FE697C8FF776F),
    .INIT_22(256'h87D098101860FFEFBE6E17603F60B9D188AF997F992039FE987FA0D872265F59),
    .INIT_23(256'h9F81E8B625081A0798E827DF0C1859806FF7BF0129D04928381FC86FCF583170),
    .INIT_24(256'h2798A69F2E08D768E73749D0F7D020C01F58E1283FB0E8C9006658989828463A),
    .INIT_25(256'hCFBED697419898E7E7B051373FC1572FE17969810F503E3FB75837A787671F38),
    .INIT_26(256'h9FF0A9068881C9A020D06025A7F1E717470FC749675787CA87EEA6966047379E),
    .INIT_27(256'hE630A718F6910871980E8DC828C5C608A8D0384478D8BABF7B20AE41401E077F),
    .INIT_28(256'hC167E910C1417191E377E0673E3898AFF90857DF18773738EF5888A618F74E35),
    .INIT_29(256'h05E8E920D88688B1D09F9676DFE8BFBFA87E48B888D8FE0ED790E0496160F808),
    .INIT_2A(256'h57D88088B02847A80F9F271659CF388818382740EEDFB837A0267070C068C030),
    .INIT_2B(256'h0458A07609B5BE305E98C8D0464070682018D0DFC8D8F836C86867A98E48C7E0),
    .INIT_2C(256'hE8AF87DFE847588DDF112F7E96487050F8E8C856C63DA80EDE176E1819912028),
    .INIT_2D(256'h979650717F28D0CD6827419E4051CE4D50E8572FF4478E868EB8D00FBFE770F9),
    .INIT_2E(256'h18409077B090E760B656B7B7D71EE1F87748BE8EE626F0BF98B09EDF75FFDE7E),
    .INIT_2F(256'h00000000000000000000000000000000000000000000289306401FF7F00EE8F0),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,dina[8]}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1],DOPADOP}),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    ena_0,
    clka,
    addra,
    dina,
    wea,
    ena);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  output ena_0;
  input clka;
  input [13:0]addra;
  input [8:0]dina;
  input [0:0]wea;
  input ena;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [13:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ena;
  wire ena_0;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h1FFF0000001FFFFFFFFFFFFFFFFFFFFFFFFFF8000000FFF8003FC01F0387115E),
    .INITP_01(256'hF4BD2F4BCC1F5AF833F294FF294FFE0CA5307FFFFFFFFFFF7A88E1C0F803FC00),
    .INITP_02(256'h4C88E6E8CD38CBD4662BD3AC6358C6358772DB4EE18F6F18F6F1A5A5A5A5A5D2),
    .INITP_03(256'h75C7601871995C1F86B7F5D4A1783FCA4A8834C6982106A4810E2162833A5DD9),
    .INITP_04(256'h6191EAFB11EDCB62177013F8120D660968ABE0EC5C13571BF2C37FA9117DE790),
    .INITP_05(256'h1142134E27200472DCB346FE0332E5E2011D23EF33639862CD3263FB1B954289),
    .INITP_06(256'h58704B745881B680A7023441CC6A1C6A31AA10450C04914468C16A60086A36EA),
    .INITP_07(256'h3050C16BFC0080255A6FDC7C5C049A838300C17A448C94841008A7FB7E0C62F7),
    .INITP_08(256'hA1A0FC2670B0B2E9FAF49BA6103B1EEF442E282A1013DABC16B0BA6A5E81B004),
    .INITP_09(256'h070B54377A131F95116259F423562C5DE2DE9AFE8E180C73B3AC221A403A6E01),
    .INITP_0A(256'h414583B8FE7265818B622F0D1358CFA9BEF3FC91BE519FBE56241C6FA60283BF),
    .INITP_0B(256'hCACA530AAFED4548425759BFD0F3A785CA72F924C6330AAED2F2C785DCE8DC9B),
    .INITP_0C(256'hFDFFFFF0A99BEAFDFEBF8605659F5285403DFF9386210C1FE0065145845011AD),
    .INITP_0D(256'hC07CC05E57535F777D2C64F5BFFFBFF15F8545E3FBA44020040808F9FFDB9F8B),
    .INITP_0E(256'hE7ADB876E728F825B82CF954D4F6F77FE714C01B57577F77FF0C80627F0C802C),
    .INITP_0F(256'hB2B6BCF7E1DD759FF402D88EF526F8B6AC92A8EDC547F4C7F448B0FBE77FF7FF),
    .INIT_00(256'hE4B68A5F350DCD823AF5B27336FA8D26C56A168FFE79012B6D927B2D932D2D00),
    .INIT_01(256'hB4A18E7B69564432200EFAD7B59372513010F1D2B395785B3F2308DBA7744313),
    .INIT_02(256'h978D847A70665C52483E342A20160C02F0DCC8B4A08C7864503C281501EEDAC7),
    .INIT_03(256'h9A948E87817A736C655E564F473F372F271F160E05FDF4EBE2D9D0C6BDB4AAA1),
    .INIT_04(256'hFFFFFFFEFDFCFBFAF8F7F5F2F0EEEBE8E5E1DEDAD6D2CECAC5C0BBB6B1ABA6A0),
    .INIT_05(256'hA0A6ABB1B6BBC0C5CACED2D6DADEE1E5E8EBEEF0F2F5F7F8FAFBFCFDFEFFFFFF),
    .INIT_06(256'hA1AAB4BDC6D0D9E2EBF4FD050E161F272F373F474F565E656C737A81878E949A),
    .INIT_07(256'hC7DAEE0115283C5064788CA0B4C8DCF0020C16202A343E48525C66707A848D97),
    .INIT_08(256'h134374A7DB08233F5B7895B3D2F11030517293B5D7FA0E20324456697B8EA1B4),
    .INIT_09(256'h002D2D932D7B926D2B0179FE8F166AC5268DFA3673B2F53A82CD0D355F8AB6E4),
    .INIT_0A(256'h9393939393939393939393939393939393939393939393939393939393939393),
    .INIT_0B(256'hE2CA5D3F3F5DCAE27AFE7FF9376DA0CFF91F3F5B71828D939393939393939393),
    .INIT_0C(256'hB852BDBC573E3E57BCBD52B80C4E7A91938D82715B3F1FF9CFA06D37F97FFE7A),
    .INIT_0D(256'hCA3FE27F6DF95B8D917A4E0CB852BDBC573E3E57BCBD52B80C4E7A91917A4E0C),
    .INIT_0E(256'h8D5BF96D7FE23FCAFE37CF3F8293711FA0F97A5D5D7AF9A01F7193823FCF37FE),
    .INIT_0F(256'h30888830873F3D3D3F8730888830873F3D3D3F8730888830873F3D3D3F873088),
    .INIT_10(256'h82F9F9CACAF9F98282F9F9CACAF9F98282F9F9CACAF9F9828830873F3D3D3F87),
    .INIT_11(256'hBD0C914E525757524E910CBD3EBCB87A82F9F9CACAF9F98282F9F9CACAF9F982),
    .INIT_12(256'hF93F8DCF7ACA6D717AB8BC3EBD0C914E525757524E910CBD3EBCB87A7AB8BC3E),
    .INIT_13(256'h716DCA7ACF8D3FF93F7F1F93F9FE5D375B82A0E2E2A0825B375DFEF9931F7F3F),
    .INIT_14(256'h1A67671A361A67671A9E1A67671AD01A67671A021A67671A691A67671A371A67),
    .INIT_15(256'h37821F7A7A1F82373F6D8DF9E2FE3F71F95DA093CFCA7F5B671A041A67671A9D),
    .INIT_16(256'hC713D50F0267725688587C2F227456595B7FCACF93A05DF9713FFEE2F98D6D3F),
    .INIT_17(256'h5B9F502CEBCC383BDC405C6FBBDC0B13EFF0F70C1BBFD03CBD456A7D2BD65FAD),
    .INIT_18(256'h9C1C442C6CFCE8F03B48A0E0B468FB306B730CFFE3D308D488F82BD3D49418F3),
    .INIT_19(256'hD4144858542C0768B4182C3CEFECC0635750F81F58F807FC77C3FB18702CB814),
    .INIT_1A(256'hA07418DCC49F8F10781BEB3413B09BF01013045B1FDBB76C8C7CF33C749C2C83),
    .INIT_1B(256'h83F8483BD414A827A81F038FC813205B0053BFD738B33B5FF4A83844BFF0A00B),
    .INIT_1C(256'hD828D80B64AC37A31BE394D3DB1F2F138433C7B0B77C9C8BF4FC236BA053B090),
    .INIT_1D(256'hCB1F03370CD78B43E444FCB04C23AB84CB68C7AF70F36BFBC0AF28FF2CAF1C7F),
    .INIT_1E(256'hBC2CE47C60D8DF0FFF4B0CE8D3784F4B83777B6BA0EF5338903433F8B41CBBFF),
    .INIT_1F(256'h303CF4684C1C2403F3EF2B1F5CA710F3902098030C9BC8B7A36F6FDBB84B704B),
    .INIT_20(256'h70DB0B6C48B8AC2B13D8EF90CC001BBFD3F7AF505457C0DBDC376FEB7C7F7428),
    .INIT_21(256'hC4DFEC975308E773D0CB4C145753A0537FD3B4D3A8B4C4C3C33FFFA8E15BE0A4),
    .INIT_22(256'h24142498B8348470671B07883C64D82F3FFB58CF3CBCCFBB2C0004FF8CA8ABA4),
    .INIT_23(256'h44B4E71CD85B10C35F88A468A438F781D9E4C79C430847C86FC79B68A8E7FC47),
    .INIT_24(256'h6074C4C47B10A0040CB87708CCDC33C110EF8B190FDCA37308CC687CD88013C5),
    .INIT_25(256'h6C5B8087A7F864E340808BB4037F147304B0306B3087F45FE0A384B3D0EC1F37),
    .INIT_26(256'h347F182BBB6F0CF3AC00AB1334D88851D5942BB5F36BB70B1B232C400817AC14),
    .INIT_27(256'h51A7F7B503633C07B3FC30AF1048CF75F873EFB9B01390437B7B2CD0A757A8E8),
    .INIT_28(256'h28673C702B60BC90F4403BCB28A8836931DF67D0035FC8DB9BB43F7CD8701FB9),
    .INIT_29(256'hC0E4075D7CBF6F140B3BFCBF67FBFB441474C73D4017C760BF9B64B0FB6393E3),
    .INIT_2A(256'h88977100D0C460575CCFE73FE41BF3D0CC4C7B60EC1F378837C8A408F37FCF0C),
    .INIT_2B(256'hC75B2D3717AF1877681013F8DBD30F9B876495CB6F70FCECCC48E721FCC884EF),
    .INIT_2C(256'hD0433590348C5897200B67EBC3C8E344B060EBB964F4843377E4CB0C5B07B820),
    .INIT_2D(256'hA89444C8E0EF60D7AB4FB7EFBBACD6FC0730002008E3EBCC90DC67C0ABACC44C),
    .INIT_2E(256'h0C7FF1DB77F4EC6B342F6B00DFEC3BA8441C7C6C348708F8008F80D3779CBFAC),
    .INIT_2F(256'hCF9C0F9C803F839C6CDF183054A04F6CBB485C17AC7BEF531C3B2F08BF97EC44),
    .INIT_30(256'hBB18177FA3204C4B8BE4A027F48CBF3B6F20EFA8B4DC9C4BE398CB44DB53EB58),
    .INIT_31(256'h93FCCC4BCB5020D3EFEB5B1C10579F8427AFE3D87314F873ABE7C7637F3FA72D),
    .INIT_32(256'h6B0F5FA037FC448B5B2B17234704075800280878484760BF80C86303C4E49C37),
    .INIT_33(256'h3070FF6C68309464C048FBC09767B7304C2C54A4D8E3632763FB833BABECDCA4),
    .INIT_34(256'hEBFF28D383A454276BD7F8A7DF749748D4383BB408DF1B3F88F49FD4BC905F54),
    .INIT_35(256'hE0709817DB63FFBF57C3A0AC6F5497C8340847EFDF70206B107B6BA41350AFE8),
    .INIT_36(256'hDBE31FFCE018201FF44B08675F431B986474BF4BB4F4B474FC1370A424973790),
    .INIT_37(256'h0FA328F4780300035B60C778E8385F2F27DF17205C1BAFE73C308728B8AB1744),
    .INIT_38(256'h679F9C884CB3D4770F7FB8C8EFE34B3C1CF0A70F67E7AF74BC14BB30E8CCBBF8),
    .INIT_39(256'h1C4C3CD040EF2B581B2F59ECEF781C907824DC531413C4CBB490C7AC2C0FDBFF),
    .INIT_3A(256'h4B0B0F181CB4006FFB7B3C78EFDF3398EC8407E704034050B76774C818B810A4),
    .INIT_3B(256'h3C630BC0BF9498AF54B0888B05A35388E7AF3F5F5B1734DFC3A933A8302B831B),
    .INIT_3C(256'h104834BBE4E4B758788BD88FC0FF8F07504438E0EB84E057F0345FFC000F04EC),
    .INIT_3D(256'h70C4B47BA804EF0334DBAF13B89B9CE3C34B30C0DC607B8F70B86BCC40E0D32C),
    .INIT_3E(256'hEC9FFC1CE8E897C47428C7F85C67C3E04467033B6F973C1FFC141C18109FDBB3),
    .INIT_3F(256'h1F27C7E87B6F240FC0DC4804046F63109CD71FDC6BDF24BFC4EC3053DC2827F3),
    .INIT_40(256'h37FBB00FBCC8E78FC0CB14BC343F5FD0C364A3FC53A7082F186B136C8CF09758),
    .INIT_41(256'h0F8C209C44DF6828C80880D9FCCC674F739FE0D4B853587818E4474838183383),
    .INIT_42(256'hB0371BA09C30AB2FEF0B0868EC17DB6390D46CD09033B400CC24C4950C14074F),
    .INIT_43(256'h64E0230858D4D37B70CCC63B4BAB981C8327F724C878D75387F7876A3F0390A4),
    .INIT_44(256'h70305FE73F4C3B479323BC9D1480ECC73F901CF7FCF4E46BFF47CF7783EFC7C8),
    .INIT_45(256'h7FBCE8787B2B9C3864FC9C9474179B5BAB240CACB02C10ECBCDB9B2AFF983730),
    .INIT_46(256'h5CFBC7B09824FB531B0FACF5A4C40F17E407EC8C4C185C43F0FBF80C085C17EC),
    .INIT_47(256'hFD10D820A4D02FE76F3B8B9C1810733024FFD4C303534C8067AB974FCFBB9CA0),
    .INIT_48(256'hC0FBB87988D84784A807BF709B149B1307B8AC0BEFB7C8332C306F332FA830E0),
    .INIT_49(256'hA7A0E9E7177BD3CCD884E80F73B878D4BF38FF1C3480AF203BDF67B89B3C8434),
    .INIT_4A(256'h402737BCC3EB0737A46F5F4B7F74606410083B30FCE86C7754B8786450BFE4C8),
    .INIT_4B(256'h406CBF5541A4CF84C77758FCB7BBCF6043687B74B8607824CB14C3EC373FA3AF),
    .INIT_4C(256'hC434C2081B0FF0B857544CDF13F4E4AC1F0BC3B0CBFF13134C3958A71CE070A3),
    .INIT_4D(256'hA04F58B120743C57A334AF9F7F7C545B87C86464CFC8BFDC3BE297F06CA72C47),
    .INIT_4E(256'h4F5CB3EF7733BF5468046B84B394CFE33827406053F8DBB01B89548412781C37),
    .INIT_4F(256'h505830C4142FA7FE08404030A03FCBAC549F40F77C8C0C084C2F8FDC103FAF9C),
    .INIT_50(256'h437B377337836810334370634B07732B547C7854145CD044B234645CCB9F2FCC),
    .INIT_51(256'h4083CBBC201C9B070B0B9B3327477F3C277B078F7743686760CFAB77D05BBCAC),
    .INIT_52(256'h84CB24FF829FC8C768BB24B7CF8CC2DF6F037394FC6AC8B438EA6F89DB20532F),
    .INIT_53(256'h682C9B9438571807FFC8F85B034F2FFBEBF758746B6F4347A7EFCFD30B1F5F9C),
    .INIT_54(256'h6813C4A02C5CE0DB0C7F0CDF8B441C166F5C34BFFFF77FB34F9F0CDFD03703C0),
    .INIT_55(256'hF0437034CFBF87AB33A48FA384EB678F3724CF28664B58D44FE727B07B6C50AC),
    .INIT_56(256'h5CF7C7597F8393B7E488707C7743C72B7B67A44FACCCF0FFA01C7B4B3C675F77),
    .INIT_57(256'h1CDBE453AC04EC5CB09FC7DCB434347CDB346CB3005824504C0F1C27D7107F3B),
    .INIT_58(256'hE74B87805FFC43B7C4BF7B6AC4EF7F3C48F8E3D86BD378B7884C23ACABAFB3F3),
    .INIT_59(256'hCB2FEFF05B703B07EC1C8B087003A81F8490C6083767CF9C0338473703602C74),
    .INIT_5A(256'hF0B4E02C5CE080987773B7CB63F4ABA8544F5B50E437E404AF37D3EBD358B377),
    .INIT_5B(256'h6BAF1C23DC1FEF2B84705CB73B20C04AA30413906B537B9ADE8F7B5C5B3C00C7),
    .INIT_5C(256'h8FBC1B9330B72F8C504B93C8807BDFDB6454802708DC148BBB9707170FDF33C0),
    .INIT_5D(256'h3BF07D28A76360207CE097572BCCC7980F5B7424C01463636863ED681FA7804C),
    .INIT_5E(256'hF42F48045CCF546B83672B21FBF46CB3309C6C9C4110DCCC20670098F807B847),
    .INIT_5F(256'hCFF37F8B7430B49CF8BC2B8FEDF827A047B6A73C3B0881B3287C1388DC60338C),
    .INIT_60(256'h634040C4B0AF5C3B0C204ECC6847488873448FD75030283CFEB76B6FBBE49B75),
    .INIT_61(256'hFC88FB9B14B4A32B1C17B8480FB4D44F7F7444F30C6898E7ACFC53882B7743D4),
    .INIT_62(256'hCB4C284810D8D428F87FAED4982E00737B9CACF7CFEF97609D68AC7BB0FBB88B),
    .INIT_63(256'h53B7BC5C841B27B03032D4F030CF04DBF7F06314B0B7A0FBF3FC3C6C2768C0B8),
    .INIT_64(256'h704B080F98A53B80934BA4F45CFBD8A3648FA8B3EF3B7B44774CA33814C83023),
    .INIT_65(256'h6AB3A78F40DFF3273B2BA2FCEC9CB7A87F23433459BC68B34393183C53745047),
    .INIT_66(256'hEB2F38435C5428F8DB173C6854E8C3AABCD8ECC3D3348FF4C38FC8F7C3DC23C4),
    .INIT_67(256'hE6F7EB7CE0D4249FB3C9C5C9D9C9B9A9BDC5C999C1ADB9E5C9BBCF284468006B),
    .INIT_68(256'hBBDFBBCBD768C7A4E4A410B08C4BBF98731B0B9BA4A7A363E8131F23D313FCDB),
    .INIT_69(256'h4024086448CC8C2C58706333E037804C38380464F44B9424FFBB94EFB7331F6F),
    .INIT_6A(256'hEFFBEBD7EF0FAC207B0BD80C20D3142C58EB1C90183330085710D868180B3C14),
    .INIT_6B(256'h0BFF0BBCEF80E704C0A40C2088B090F45CC0084864E35CFCE3F7EC233718E3E3),
    .INIT_6C(256'h8B18A7E894CCD31377FC9FC4ABDF7C7BC313ECA3B7748763F497BFAB0C280BF3),
    .INIT_6D(256'h5F1FCFFFECE408786013F324E8C8347C64B0D83843C33410F3C0AFD323E718E3),
    .INIT_6E(256'h678C23DC3C9CD79F68AB03E733078FDF0BB44F8FA788F76C40E7BBEF00AB57FB),
    .INIT_6F(256'hA0C468933B4874A74203A8E35C93E524BCE0646B2BBC88730EE043FFF3CF5F20),
    .INIT_70(256'h1FAFF360B878A3642BE72C135C93C07CB4405C334428B8932AA3B8673077845C),
    .INIT_71(256'hD717D7AFC7A47350549B0C2C44E39C50C3204C102B43787C0E8FE717171C6B2C),
    .INIT_72(256'h678727C7038CA7E0587443EF24AC6BF04383BF5BB0EC87D83CFBBFA00BFB83EB),
    .INIT_73(256'h5037984B2F807F83648734CFF453C40898D8945F73E740B0321023CFF333AFE8),
    .INIT_74(256'h970B34DF278C1303FCA7EB4B3BB4E747BFB8C8FC2B648F9F309FC73BB3B3FBDB),
    .INIT_75(256'h93E7AFB088B7283F4234BCCBFCDC7C0FB81F7764DC8F44DB279F6FCF238C1C0C),
    .INIT_76(256'hF323DB086FD0BBC3285084CF9037780CAB0CDC64B07318872F8CCC6410F77CC7),
    .INIT_77(256'h73B3AF4C3BCC7763C8B8BC6880D024BCDF68A4BCF47730232BABBF573BE7BF53),
    .INIT_78(256'h5B5BE357B7A8C750008BF7BBE3A8F3F3E45BFFFC9B3487DFFC63D36BD3B053CB),
    .INIT_79(256'h84EF23CC5CFC1FD32FF80CCBEC5C0824ECFF8070038B445FCED7C78FD304E3DB),
    .INIT_7A(256'hB888001334587B23639B4E075370B323BCBF48AB58FCAFE3EF53262B6FC0EB33),
    .INIT_7B(256'hA34BB35393CF84A7D82718C33C1BE443CF6FCB535F3B689F8383C308BB8C4423),
    .INIT_7C(256'hC8C320C804CC504B3497D05034C79C976FEFFFFBCB473CABBC87A0B44B9B900B),
    .INIT_7D(256'h94EB40D40CE07BCE074F202C4307D070D7F73FFBE3034C83BCF00A04EBFCA4FB),
    .INIT_7E(256'h9463B824342C133FE46B52F0D0A45F6314E45790ACAC1F87F0FF12C8CBECA363),
    .INIT_7F(256'hE717DBEB0F5B6433D78F98C40FBFC83F8B43BBF3A7CF6C9F3F57CFC84FC8E84B),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra[11:0],1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,dina[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_0),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'h02)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1 
       (.I0(ena),
        .I1(addra[12]),
        .I2(addra[13]),
        .O(ena_0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized7
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    ram_ena,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input ram_ena;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire ram_ena;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'hF429D724B5CE3DEE6581FD5E5E9E53FEA820F5DEA220DD01FF60AF5C56FE925E),
    .INITP_01(256'hDF4091DDD368C3C0505B928CD31DDF0CD47DD7D6756628CE2939D5EC399BDEB9),
    .INITP_02(256'h65B7CA49CF805E53CB7788C8B7B7C077D5F6882B1758FE8A7A59131DD51DD31D),
    .INITP_03(256'hDFC440B42B2814465D3866DF1FFDB145DE7592D2469E892C202C9AB2168C3ABA),
    .INITP_04(256'h908FF4515DCE8CA7BFCD8243E971DFF3F50CBB15EF43EC342EB5FA1BFD7E1375),
    .INITP_05(256'h956FBCAA20BEFFC680250162A7A24D59F7CD82810311808F64884086829C81A4),
    .INITP_06(256'hFFDAA04EFC214FCC03481422DFC964D27BCC08A06A9EC40F7291C1FBF784C0FD),
    .INITP_07(256'hCF82D4617308FCC51364FF8D46F0FBBDAC700DD74A0186B734E4289BE82D30FF),
    .INITP_08(256'hEB2B396C3A720E0C62BD8052417EF53E8385917E30AB5E38E36B686D16D679D2),
    .INITP_09(256'h961AD25474E93B7837EC4535219F6FA393BDD1DAA078A47C5C1DB83924F77119),
    .INITP_0A(256'h83DA16FE5AFD65CEC9554D6844CCC56D6DF8FEFAEC11C41AA8BE4AA6F6444E38),
    .INITP_0B(256'hD76A9486317FA3EB5121FEA24B8CC41A867F7479DDD6EEA293EFF01FC9C5C7F4),
    .INITP_0C(256'h801DE2CBC3DA006CCF252607F5864570802CDBA65E9E47139B6E0ADE084ED4A7),
    .INITP_0D(256'h063DFED000EEFF502A7E80E12C14F7FD8F6E2E94E48DC9C7E2834156D000BED4),
    .INITP_0E(256'hF4B902F880AA7694A2AE8D4D77D541A4405008A32C1906425FEC8251B1582186),
    .INITP_0F(256'h65CFA9135C1181958FFDDD391E254065FD6477127177A35579E6BFE92E559203),
    .INIT_00(256'h24BC58EF7FD8A35F9FEF9BA3DBF3881F770B47E70374BF2F238F032B98D39C54),
    .INIT_01(256'h97CF88FCB038FB870CECCC4424AB8B3F9B14E7248B50D3531CF717C0E46F2078),
    .INIT_02(256'h635CE4175B7FFC1B0310B478584C231FC4C704A097386CC7085C144430538FE3),
    .INIT_03(256'hA713D403F73B13737F73F0730C97A313BFAC98A80CA727B7D8B703A3E8937034),
    .INIT_04(256'h0FF767BBFCF0F03FC303232498848C4433DF04B00B03BCF3D787F753F0C7941F),
    .INIT_05(256'h34F81F4727CF7C7FA80C2010142F57BF3BAF74D8BBA85FBB287F0BBBCB9FBC84),
    .INIT_06(256'hFC10A7F364E8788BB8901B28F0A498376F302FD38CF078D7AB6FFF68F0ECFBC0),
    .INIT_07(256'h83C8205823AC0B274B28E71B841818681BE3E497587063B3130FBF0028786C97),
    .INIT_08(256'h2C6827DB70244CCBF05B0397C058F4AC7FCBC42FD77CBB03C74BB7C3A710588C),
    .INIT_09(256'h24802F6BEC2090F71073A3CCB03C6C2488CCBCA82F84179BC3CCDC53F4DC2388),
    .INIT_0A(256'h0CE04FEB37E394DB2780BF5C70B4AFC76310705BC0444C1094784C3CE0F8FC87),
    .INIT_0B(256'h58AC20580BCB101318E7CFF3EFF0004827776C90576888DBE3AB13FC2894EF38),
    .INIT_0C(256'hC48CA89F5B03E4CF0F2384E7D0B7ABF38BD88743CF9BDC93A04F5354DB8F7C0B),
    .INIT_0D(256'h1FCB18B810683F43139097E8D22FD4E7AF1710B04C53830FEF833834ACFB5730),
    .INIT_0E(256'h63AC33104B2F6BE358CFE714F2434857D4DB30107C84AFF7F7DC8B1817574C3F),
    .INIT_0F(256'h37F4081BC79FF39B23C463204A080817E01728E05D4F1FB3AB943FF0808087EF),
    .INIT_10(256'h5BDC90682FA7248B583B0CD0E897A4D3A8B01BBF1F13A88710333CD0C89FC7EB),
    .INIT_11(256'h17EBC3D0FB3CD30B37DC72F0A73C2CB3132330D35877DBA30F4710F3D8F373D3),
    .INIT_12(256'h2814B0F81BA393CC33DF63E4D7234B60C4E0EBE0C8F3BF0BF317471BFF17EB6F),
    .INIT_13(256'hB7DC14F044FBCCF7E7D89FFB1F8C8023B72C6434AF1F4723275FFB5CFC13F8C8),
    .INIT_14(256'hD407E0FC2BCCA7D7EF5494940BD8B8A8E3DC482C341F481817F488D050E490FC),
    .INIT_15(256'hA8F33754E72FCFDF3FDBE8780C68F8F3AB043C28FF3B842FACD70360EB83174F),
    .INIT_16(256'hE4CB171CD3CF97ABCF3FA7582730030C1CD417E490E7D31733EF07EF0B77C3F0),
    .INIT_17(256'h64A3EB1B77B864E49008A4736FC0A8A883C804309C17F4273BA74F4CD7043BF8),
    .INIT_18(256'h1A8348D712F254E76C9B68A8B48B50E467902FF4F78F3F938C0773DFB0B0AC0F),
    .INIT_19(256'h2C5818B0A03011886468103883B828C4CB9D5C092F84789FCC1F838C3B204F4F),
    .INIT_1A(256'h07A4C030137CD81824CF5FD07BF0FC6CDB0C7850C02B6C7F8B6D0CD3477FDC30),
    .INIT_1B(256'hBB9B4533DC87EB2C475F129F1FDF98C960336F00137CCFC3FBA71CAD8833D040),
    .INIT_1C(256'h6C2050344FC49B5B74D35F9BD76F8930CF102CB0806CF82C17DC482307B427D7),
    .INIT_1D(256'h2CC89BA0DCC0986F330BB79025BB443744DCDA6454D388D8D8E35FC7BADBC3E7),
    .INIT_1E(256'h103097DF482FAFFFE0546027A394575C7C6858899400FB44CFE4130F3CD4F850),
    .INIT_1F(256'h28287CA0DCE7E4C89FEF7CFC28EFC8E43B94C4687C3B9C14DB05008708EC9084),
    .INIT_20(256'h28BF93CBE4B033C0B3E47C03969097D49C10288F67ACEF3F48BCD0B58C9808FC),
    .INIT_21(256'h344B7353B49F8C28C728BBBF40D3344C74FBF7F3F787903020140FCF6C0F5F6F),
    .INIT_22(256'h7FC4B0F87F83FB170F28DC5B7A71F7B3D3F4442C7B95333C083F7F8B40DB43AF),
    .INIT_23(256'h6B53D033EF620B72E0A8086323513F3CEC30EF78B77C4C2C671C98BF06D46F88),
    .INIT_24(256'h93B88BD7E3487B9B0F331F171E182727C7627B43CF7B9F47F8529E3B624783BF),
    .INIT_25(256'hE41B436BC4AB5B2FEFD8E4D34B288FE8C0784044383927ECF7C72B0B4A789F7B),
    .INIT_26(256'hABE4C4C847ABE83477982B677E4F6F64C9681470E0C0632140631B6F27BF9C67),
    .INIT_27(256'hEC54707868ECBB8CAFA66A17AF50787753CFDBA733D8432EE0B8338190741CDB),
    .INIT_28(256'h347BCF98CC33CC7BAB9304C8F4574C53DB4863301768B4B32F20F77C50D32484),
    .INIT_29(256'hD78FDBC4AFE4B20E3C9C83CCA82864280FD880484C68BC40E06BA34349C7645B),
    .INIT_2A(256'h40B75B2F3C1C9BE733586F79B4531373D7A3788F5F643023CC7A53F7ABB09B86),
    .INIT_2B(256'h7F966787472B8BEB54A7577370ECBC648BD46B101FC95F9FA3644378085764DC),
    .INIT_2C(256'hA73B8B1317BB74AF5014BF4C7C8CD71F53F7FC7CB8C03C8F67635B88EB47BB07),
    .INIT_2D(256'h9739E09084A727003C35745F4B9864A72B54F800281FC498FCB77F8E4B3BA313),
    .INIT_2E(256'h6790A580FC38684B5C53E3D028D7E850B3DC7FDFC7A7B49B8CE0C4E4175CF41F),
    .INIT_2F(256'h78FF50AC6CDD38B81827DFCA77E76F7BCB37538F2E5BFF12B04713484BA5F334),
    .INIT_30(256'hD4B3ABF3E3A308B3A4337C6FECC88F1448E838287FF4CB9B874F50F3B0AC4C68),
    .INIT_31(256'hBBE49039AC7C5C4CE39FCB1851243CCCFBEC9428906458D89FC47B1BE4237F5B),
    .INIT_32(256'hDDE48F1FFF4FE01CCF538CA8E490E7446FB02CACD4EBA0687080A45C70F0AC24),
    .INIT_33(256'h07CEFB5FD363789FA4192CC40C58747DD09D14DCF414E00538307B8D1838B48F),
    .INIT_34(256'hB6E42BD7EBEBDC3860FCE40058142BDF50E4947730ECF89484ABE3284B0C5357),
    .INIT_35(256'h748C5810844B7DE73420C888AB0000542789AD15DBE05824001BCC0837A740AB),
    .INIT_36(256'h9BD7386B5C3ACF2CBC300B88897394FB1A8F9337ACEE45BF1870C32493FBF068),
    .INIT_37(256'hC5ADFDA9D195F5A9C11A3FECEFB0A7CF9A1BA0380B371F8A34E43C3BEB602320),
    .INIT_38(256'h6CB3F397F8678F7794301B17E0DF3B9F2AD8EF77306F140C40D1B5B9B99DE1CD),
    .INIT_39(256'h5B34EFF097844B20B373941773B07434B3183C73EC9B7403E7CBB0C37CABE7F0),
    .INIT_3A(256'h08B7C38C4778F4E37F388847433388DCC40BACB3B0A95CB45F20CF60A347FBA3),
    .INIT_3B(256'hDFEC6F4740C80CA4B7F8330834483C9B073420A49BF76B2F336403872F905C50),
    .INIT_3C(256'h0B83971F7037E05844E3F0A4935C0BBF7CE45448F7F77C5C9F1FFF77C4E3A0B8),
    .INIT_3D(256'h283F77A37090788F3F57F4DC88905773A47B877828E3E7789F9F90588F6C238B),
    .INIT_3E(256'hABB4CCED0837F704F84F17F40324944794FB8F344BDF0781D0B08C0008740F97),
    .INIT_3F(256'hECAF179F7830FC52D2AB13B03393908BBFA7805C8BBA60C03424A4A4A0C34883),
    .INIT_40(256'h900470E71F75700BB6B4A8EB30DC9807F5ACDFEFC7B08FA6C22F5F74006CD02C),
    .INIT_41(256'h30047F9C478C70923F678CE3D7DF3BAF3F479818980BBB508FBF840013035B6C),
    .INIT_42(256'h8334EC3FBFFF477CF8A8E414A718778B1B6C9C37BBA75F089843576CB8D09374),
    .INIT_43(256'hA86814EC8F6D808E62609FE4371F6B3F6F54084C93FFA0EBBFD7E704BCFCF0AC),
    .INIT_44(256'h5BFB2404BFABB747538FD308DB1CE34847F0E30BA4AF0B801613DB33B4E47877),
    .INIT_45(256'hB337A39731C00DA3576CB7DC87A79739B32B1890DB2F0CFC9B665BF84F48633C),
    .INIT_46(256'hA727373F94F4F4C7DB14D4B7481B10C893185C13D8E490D800748D2AB3B40C4F),
    .INIT_47(256'h7724D02C88283C1F9B0353392C9C47C49F2494ECD70CBB6C2F58C0D21BC4F8BC),
    .INIT_48(256'h30CFC34097FC70289647C3B4D80917747C6058C0B3F6CB9067ACF34B80582080),
    .INIT_49(256'hB4547FF3C384BC53080828EFBC845F24A77760EF94EBD028280F7314F813607D),
    .INIT_4A(256'h34EBC7246F0B8B3C77C30E94B08B9377C00C83731BF7C7703FE8F937237C38E3),
    .INIT_4B(256'hFB86B08B6CD87773EC429A575B8B5F2F60C3BAC72BEB6FB833FBF3F3B84840A7),
    .INIT_4C(256'h18D4DC1B5F7CE7EFBCBFDDCCD0C4A4288B2457A6F027C3F3DC840903147C5BFF),
    .INIT_4D(256'h2CEC94F4448CA2373CFA7672BBDF977858905011D3C79BF80CD0782C38A70FE0),
    .INIT_4E(256'h00D8A7AC46BB00A858C7274A73A39BCC40AB13FC0BD3BC4DD060BD479007B623),
    .INIT_4F(256'hAB6768AFF0A38776C8F3F2EC7F2AB7B45778449BD333E450D79F0FBCD7A75487),
    .INIT_50(256'hDC409F9C739075D848834F3B1FEF64BF5460F04BB77450D78C58055AB4672F77),
    .INIT_51(256'h60D3C8BE302FB887D442BB8C0F8B3323889758FCCF64417C5AB3B3036BB46B0F),
    .INIT_52(256'hC88CEB3B386FC0A00CE96BF0482F5C54F850242A7884FCC714742B9454844A14),
    .INIT_53(256'hB088CC9E245398FC1BD08BD7331074346FA87CBCD3E0403F6030C060BCFFAC10),
    .INIT_54(256'h4BD784D46B582C7BAB6C23F86827DBCB777CEB0C241B0490CC74C02371246754),
    .INIT_55(256'h804037B35357CF1C10261363336F78136B8BE7B863F004187487CC10EF4FABF8),
    .INIT_56(256'h6B0C27F40F70E4F8DFF850787F778BB4580820534B3B08D4BB85C4CF1C6CC204),
    .INIT_57(256'hB4E4235F0F3F93DFB5A8674601E0FF2B432BDFCCB727E1DFA71FA8DBD0777038),
    .INIT_58(256'h683CBBC4E3FFAFAB348F12A87F8CE0969150182F44178C47F8B00270DFA734AA),
    .INIT_59(256'hB8C3F30CC727702C8C9CD844439B16D3B0E4AB1F2B6F7814A02B275F8004D7A2),
    .INIT_5A(256'hE0142C6B9057349CECEB04BF630B3F94E44B236B2860D1B8D4B7A32CAA30186B),
    .INIT_5B(256'h64CC4C8F73EF0F2769C8CC3F5858B89C54C9B49F54806BD81F807C33E49007A0),
    .INIT_5C(256'h2C9197E44374F7CC14BB83ABA3E32FCCE59905681BD058B458F883F0FAC82C8B),
    .INIT_5D(256'hD47343CFE05CABB8805A4B23E0EF53A454593C6C7860C44F6CC02F2B9218F884),
    .INIT_5E(256'h471F64E4187B0B5077BC676353E807C73E1C4BF7D4C7BF2F4D84600CBC889BF8),
    .INIT_5F(256'hB0B388C85717AB4B0C673090DE30E05FC80407CF43178420218FC6B47CE0646C),
    .INIT_60(256'h8C197716B0087C88204F4C0FC74403E0FC24B4773C6B00A4A10CCFAB7483387C),
    .INIT_61(256'hF40350A0F40FC864E9F32367F3E3CC64701097A7AB0C077CC97A506CEFD718E7),
    .INIT_62(256'hA8E06288147BB404752FC7B0F7C33CCBBBA89C3C97ECF0DC4B5863AC698C10AB),
    .INIT_63(256'h50383C3C82AF3848A5546018CBDA241340BC53BBD03348C46B002F634BC73470),
    .INIT_64(256'hA7FFF198D7530853E8C07C001FA40F77708B74346EC83BA3E4DFCFC735500F60),
    .INIT_65(256'h74FCD0DC1BA0F86410BB7313B7A7847A1F04BAB41713CFD4AC34878B4454C7FC),
    .INIT_66(256'hB48F9F5B4D7B73008B8FE7E3CF1BE7BF0CE01B631C0843A8FCAF23A880438ED8),
    .INIT_67(256'hD8D01C404E937750A88C9BF8AB9B00B780A8F7BB0078F8C860F853D797670082),
    .INIT_68(256'hCBA7A7F3A82827E83C67141B67AF5373BFBB6CE4CFB3371CE0E316C8653C1A4C),
    .INIT_69(256'hB0D3A47F8C34F06A137768DB23B0449B57370773546E23BC9C3C08B8400FF3E3),
    .INIT_6A(256'h7BFCEFEC7FB83F331F6B2F53D88F0BDB37E7091180A09DE41BAF1F3F1490DBC7),
    .INIT_6B(256'hEC73BF1CE768EB90607CF773FBB3E7C88FAC9F2FC784C78C28372F3773642773),
    .INIT_6C(256'h2C30FC18E4C08C0707409B9F1F60E4A3F3BC8BC03CE8F0B790D0E8C0CB2814C7),
    .INIT_6D(256'hAD046F1074143C510B64D09BEBBFBF87286440500C8FB334E8CCDBF36750EFB3),
    .INIT_6E(256'h58B31924E45D7477D3188FA453A053538C7F788CB7FC503358C0B3FC2C2C08A9),
    .INIT_6F(256'h1C5BFFA77BC8B75078C3FC3450A057BCBB5C8F84E1D8C0762F2CE4D0701F6CCF),
    .INIT_70(256'hD343A4A8E36A98CB3BC708BFDC43782BDF976F86530F2CA88F6BA820AB507BC3),
    .INIT_71(256'h389493B38C4C7F5F67B0C36B7BB74C1C449FF430203C6B549B603CDB2B9422D6),
    .INIT_72(256'hC74FE44CD01373FC004433678C0F708CB8036FD83CF48753A3C73709476FF73F),
    .INIT_73(256'h03CF83A0CBE7DB0BF4DC53A36008CF1FAF689484B868DF845A0F1B930488D70C),
    .INIT_74(256'hD4B700476867C7AB34FB38F04FAB5C8F8FD437CF6B8B93F4FCF7F7A32B5F0A73),
    .INIT_75(256'hB7E783449F43A40CFFC47343A33857D72008E09D7753036B1CE0035F48E324B3),
    .INIT_76(256'hEB8734274487BB18D853B06FA8F3E46F2488241F40189CA793D3577C6DBF2730),
    .INIT_77(256'h407C7470D7130B10A7B7DBA3DF0F9CFF682078433894580C9F147BB36BDB472F),
    .INIT_78(256'hFB2F249BD0DB8B240C0B179707D863D86867835344D814F33F57F31B5F54CBDC),
    .INIT_79(256'h4C9CD0ABD7DB5BC7AFF8363F77CB5318894BBF5C8BF7F0F3BB47DF64E03FB8AF),
    .INIT_7A(256'hF09FD0C363DF3FC4E37B9FFC54E7E4CFA769E06F6F8604C4E4C353AC979C179C),
    .INIT_7B(256'h87447CC06B436CF839DF26480BF367DC5474FBC35B10E4EC849B30088C840F1B),
    .INIT_7C(256'h5C2347FC6FE7FF0CC3730B67B0FC18EC349F8C1337638FD840C24B2C3B746F60),
    .INIT_7D(256'h7300181490F7C483BCAF70E0E8B35848CFCFC35BF49F43A30B5B5F2C901FECC8),
    .INIT_7E(256'h4F5FE0CB2BEC4B50335FB790FB903F3BDB270B744844B3E36FCFCAC7545850E8),
    .INIT_7F(256'h3B14FC009B4B53EF97906F6CB77F4FE89B8884809C10D0BB83072F58C300D4BB),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,dina[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ram_ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized8
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    ena_array,
    addra,
    dina,
    wea);
  output [15:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input [0:0]ena_array;
  input [10:0]addra;
  input [17:0]dina;
  input [0:0]wea;

  wire [15:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [1:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [10:0]addra;
  wire clka;
  wire [17:0]dina;
  wire [0:0]ena_array;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h1F21C5FA71DAA4136FE8090E1A3A2F687814D1E9973ADBAA7889C923FA6973B4),
    .INITP_01(256'h76CCFE4582F00E8B94F3C28420C1ED3BE8398C97F25DE90A3BDDD6E31E739B9D),
    .INITP_02(256'hE242C8081880119468073104009C1FFF48F5C0E492064622520B8F41F01C6032),
    .INITP_03(256'h8931310DD9738C410AE77394A01659F9BC913196EC31A98DADCF62C3501485D7),
    .INITP_04(256'hBB65410B7D45BFB37CCFFFFB540BFBBFD9F2472903C0496B0B71E384F486394E),
    .INITP_05(256'h6189C357C3F23FF9CB79A890B002F491BAFABEE94FFD7DAB9B65D8008104AD8C),
    .INITP_06(256'hEC4CD075935A31D9BFF5C000040032F26417EF52140280B526865D9DF4736849),
    .INITP_07(256'hACCCAF711EFDD501BEAE38DDEC873DEB4F30C2640007DBE2FFFBE0D5E85C79CE),
    .INITP_08(256'h44178680B5364C5F8292E87410546F4F4A75C004A01072B7C6391DE9D9F93804),
    .INITP_09(256'hDAEECA0BC17D2788B93F40A7F2D7C336DB26DC2DB4DA4FEDBF1FF045E2E0395E),
    .INITP_0A(256'hA7437B6E9B6DAAC317FF07D7B6B8C79510EDA91CC6E0E51044210F3BD3820A8F),
    .INITP_0B(256'h00000000000C23CFAA9B0823A9F8A0D81C7E9BD340829DD7B2EEE0EB94E6526B),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hABC5EFD2745C70F70577F044506B855BC7ABC5674421EFC9A884E3C47DF45CDB),
    .INIT_01(256'h1594F3BFAC673610EF8B07FCC83F4D87D73F0E6BF5BC0B483470B24F1650A3EF),
    .INIT_02(256'hA68F19556DC7B94F8684DFD8940BF697EF4027E29A63D5C7F81CD043BE0FA040),
    .INIT_03(256'h37ECC394BC78143B26274DE80FF4287FEBBF0BDB160C3D0CC1B4F23BEE501DD8),
    .INIT_04(256'h208301C7ECDCA2080248BE24F278FA1F3A309E27937BBDF44A20EEA8B20C1CA4),
    .INIT_05(256'h19F0C662E51BBFEF89A4B658D8582A0826B34624CE2829F72C4F023FBB43F9EB),
    .INIT_06(256'h3458F59D53DB3DFFF3A73128D7DBE6D0BA3CB02C29E7204334E391372C5BE5CB),
    .INIT_07(256'h08135A10E7D8BD9C705F6A300E086E96A9DC7E906F8723E4B5DF7F6CC247B49C),
    .INIT_08(256'h300B05C78926EC4C1B38ADAE0CA3EBB48CDD8B94E470E914E2AB89FCAFCB1F2F),
    .INIT_09(256'h1A9BD7E89604B9DCC1DF11A2EDB343B8F97721F06FC0FAA7B1DFFCC804DCE7E7),
    .INIT_0A(256'hBDFFB9E413C86EC71FB31994E4040164A59CDED3ECF73DCB107E3AA0FA765CDB),
    .INIT_0B(256'hB3E4EEC4B66C26CF4A60F810FC281DF0E67F16F0E3F4580BD8CB19F41170D747),
    .INIT_0C(256'h21F7DA2436674ED4F9740054324435BBA94CCBC85DBF1D87480CF780843FB1BC),
    .INIT_0D(256'h9834273731A74FF7C358CDE4589BD5F7E158088C0A7FDA23CC0F082D4983606C),
    .INIT_0E(256'hB68F7C5B5A24F2FBFF68D3A0589F02B40A774C88FDE7FE7BAA744C2BBA2CF777),
    .INIT_0F(256'h17C7C1EB094BD61BBD8B6C37F543383CDBF7A9A9EFC4D4BF1FFC309C496341D4),
    .INIT_10(256'h69A8FFC058F7226B363825F8D7CD0C47290AEC485AAB583440AFE9302064F257),
    .INIT_11(256'h19735FAC264FFE3108C45298D880B1C0C4B33A972BB6931B4F703B0304F76124),
    .INIT_12(256'hA07A0BF48018F28C2A47A688659C9CBC2BA9108F27038C38226C7BD75CC4C08C),
    .INIT_13(256'h05FF202BF4241023F993FD432D5F2B6BC3CB463C3E342414D3B0E81853284040),
    .INIT_14(256'h1844046C12B01247F60F13DCF7F4422C446C1D78A7A3F5E0CFF3E3CCE7B3D767),
    .INIT_15(256'h1F9CE21CD8B84A3F1EB01AAC0FECFBE84448EBD0108C29CC3C180E07171F34D3),
    .INIT_16(256'h40E437FBF47B00A0EE781690108C260C204C39E8346449D8EEAC1FC80DA01028),
    .INIT_17(256'hB9AAD838929CF6D119879044621C0884F954183BF69C58584C284828EA40589C),
    .INIT_18(256'h234F03B12E480A54C8984BB4F5DF646292D74448695715D7C7F41B547F37E74C),
    .INIT_19(256'hBC4789F693A70B7791102608E9637DEB6357DCFFAE869E0BCB7F569D7A07BB52),
    .INIT_1A(256'hF7207FC391530BFF2A78E18463DB17C3F012EB6FAE855BB77ADC3E1FBB036747),
    .INIT_1B(256'hF46BC11BF14F1A13F1E0994C2C2F1B776FFF5F2F6EC3113B62F483DF1D66F5E7),
    .INIT_1C(256'hD89BFC6824543CB0967B53870727CAA32F6F0720A63073A39FD0E250AC0B6B38),
    .INIT_1D(256'h124B1EF3E8E49A5BF394D86C1974ED4C65D8BBEF0A24AF6CCDF40FBC45134A5F),
    .INIT_1E(256'hDBB301A8DA4B07AC05ACE3C81888FBF0F814088CF464003441B1466B3E706020),
    .INIT_1F(256'hF0A4284AF0676127461443A8400C753F5650EDFC2E0737B4009C0C28FD2F07AB),
    .INIT_20(256'hA9A4996B4BE05868F47706241BFF68C00A57FBF46ED4019C51DC646C4DF0FEFF),
    .INIT_21(256'h587868A3DECFB98041DFFDFC7CA42DECBDFDF68F72FCF3ECDA0C801B77F3441C),
    .INIT_22(256'h4A5B4EE73C33A35BF7172A544A3D0A8C0BF52A65CA1F13BB5FE8F0C0D858D58C),
    .INIT_23(256'hF3684183D1CB2B5BF1A8B16D1820FDCF2F28683513D4F7F3AC54EC88C64B014C),
    .INIT_24(256'h518B27171D3862103A243C5BECAFE5BF836FAF6B9A1BD94F685BE420A9FBCBEE),
    .INIT_25(256'h0BF3D9CFED3F7213EBFF2217C597B94BC787AFF3E75F9BE38372BBC4D6D4BBCF),
    .INIT_26(256'h19ECDF50B43C956B736F061C514000B8CA88CBBBE5ABD1C7EE17C7F00034DDE0),
    .INIT_27(256'hA892C57B865CF16735D0C3F705070193813362AC60DC5D333E53D875FC5FC9B4),
    .INIT_28(256'hFE24142020503FD05228380449F04E84FE048FCFFE1855DBAC2C86EBE7074817),
    .INIT_29(256'hE4581B97D618C99715D79820079731AFF18003EBEE7412801A583A272290227C),
    .INIT_2A(256'h3BDF484BBF9BC3ABEB70C558DFE02517196BA9F0C9F3093FF233E2B8C05BB3E3),
    .INIT_2B(256'hCA63CBA47418B02BAF6FF363A3DECAC7E40BB56FDDCFA43FD770AE63BE8B09A7),
    .INIT_2C(256'hE64CF358347020340AB810680240DA88F1F8D13368235807CCA879CF3473597B),
    .INIT_2D(256'hC39F4293BE3499AF17FCD3E0EC2805E3E250D014E85F0E7BEA6B4FDC1A70280C),
    .INIT_2E(256'hC5AF443C2E80B1ACC7B4EDD8246CF8FC0A57C78CA1E3C3C0F5BC97D3C4E42DE3),
    .INIT_2F(256'hA203CEDF145B09B7E3736E2AE82469F8E5287248320CEDD70DB80FE845EFFDA0),
    .INIT_30(256'hEDEBEDDF0FA31A1723B7E7BF021FD9F317E398948EA0DC84453C7EBB704B4D68),
    .INIT_31(256'h004BCA1867FCFEE8F46FCA5B21C7A04865831DF7DBE81954F4132DF0B9C819CB),
    .INIT_32(256'hB07C9600281F5C8C2E4746CC602CE845867C222322944478FE1CF12F45D043FF),
    .INIT_33(256'h13B0D2271D9014672E5C2FCB37E7EDABF1A7F2E4DD63E3D8A97303E43AFCC250),
    .INIT_34(256'h507836004DE0447048A422071840442342308B8F3664AE84B5A3D3B03834DE67),
    .INIT_35(256'hD85BE39BE5DC9DE3F123D364557C33DFE78316782C4C102C4E545A6C2A070A07),
    .INIT_36(256'hA66F01D81E79EA0C11DF6E1F8604CE2738E4EBAF3058113F955F6078E2373FD0),
    .INIT_37(256'hAE00E44FF1B8C48F61D44453F1573453AFC38A303C442EB08B64CFD3372C2E78),
    .INIT_38(256'hF227CE30E07048685DFC4FDFFDA77EDF3F4389DFF22435B4B3932674B7E7BEAF),
    .INIT_39(256'hCBABBD7BDFEBADB8EBABF35FC808E987A95FD858146C2CF4CDC03D7B33E395BB),
    .INIT_3A(256'h580B1AC870100ED0422B401771D8F5C7F9AC117FEC37DDBBF783AE5F1E30B61C),
    .INIT_3B(256'h7B741817F7EFF77F3260E1440080200FB7FB00631A50FE78091CF4544FA04A58),
    .INIT_3C(256'hE4631E37ED83582B97D78AAF116F6974B5CFC37BD53F013BEBFFDC44E680A74F),
    .INIT_3D(256'hCA07DB9BDBFB9A13D430D874D3F3FE247067E51F9C19F2C3E5AC852BAD80CBC0),
    .INIT_3E(256'h483425F3C3D0DE83E3AFD5C3BB9325FFFB602FF403F049F43458163449DB19E3),
    .INIT_3F(256'hC023B44C87EF2423DF3B1637E77C2698F243DC1CBBEBC3EB1FF3A337026003AB),
    .INIT_40(256'hE9D705CBFE2F0F83D3A3F1BBD63B0FA41213D7C4FCF866132AB09E1B29730248),
    .INIT_41(256'hFB909C1849A8CCA842C5C34FEC03652B100341B7F7DB0D8CF990D417E6530FC0),
    .INIT_42(256'hE868E22C2E5C5833464847C71A442A601B8FE5BF1677949CCC2FA1EC55F8AA0B),
    .INIT_43(256'hCBF050F3C6ABEC1709E7DFA357BC39B48150008B34281AC00E6C1DC3299434CC),
    .INIT_44(256'h1ED81A401A443EFF3FAB2FB341672813652BB82BD58BFFA0593006D4A424AF30),
    .INIT_45(256'hEC1F3C2446A8BE0CFA173FE80A67D464FFF7DA14DA5888EC090FE99317D0643B),
    .INIT_46(256'h70639D5803DF17CC3844F3B025D8A23F81C0383CD3B4206F57CC3997F180C1C8),
    .INIT_47(256'h0678065B4640AAEF963B30202170C618BAA420306220F237B2705A0F619C6620),
    .INIT_48(256'hD1F0DA4B2E20FA08D9C0D4504C6438141E70F0C4E21C17F0AB33516CC3ADE4A0),
    .INIT_49(256'hDA17CBE3B37BCBA31A3F335FDFC3D193F767E9B418AC32343BEF021B13F043DF),
    .INIT_4A(256'hF61BAB905DA70AB04DE75A375A7F8C0059570218D3D7DF9BF357BA04D7D70DBF),
    .INIT_4B(256'hD320792CBE03DF500EFF68B427ABECB38E2379FFC17414205680BF26D3DC017D),
    .INIT_4C(256'hEF9CC7511218E200E19F17EC2FFBD02B95EB1C838E47B54716E3F36C4D8BCE64),
    .INIT_4D(256'hF870F3EAD21B4FF74A50B3D0F193FF534BEC125B44472237C657FA200B63F94C),
    .INIT_4E(256'hBFA06A2B18442FB75E1F01BB659F2B7F2CF8DE2C0218E9CCDAB06293B460268F),
    .INIT_4F(256'hE3770367B08FFDEFC78FA61DFBD1C40CC5B008C78E68A6813E0C10239A34D4C3),
    .INIT_50(256'hE3BB45CC2E37D3EBCE4B00801E8CC86C08670E34C0B7EB4FBCA40CA7C9CBC92C),
    .INIT_51(256'h1BD4181B6BF8604020A1EAAD6AFD296C52E82850F36FCB7F1A7BD597E817B9BC),
    .INIT_52(256'h77502E4311F076377F87F0332C6B281C09BFFAB052785C3838D094FC6A843E90),
    .INIT_53(256'h1E4003430C032607FB9CF23B67B813D89C1AB8776CCB21634EAC2BAFB84045F7),
    .INIT_54(256'h762C5BFC69335EC4B4079170F3C806588D3020432BC78DD3CC5B2F84192B63DC),
    .INIT_55(256'h024B296445AFB79EF9048FFC9F24EB0818802C582F239DFBAB644BC03B73DB8C),
    .INIT_56(256'h4800478CF26F47EB0F839C4B49F72B83B210AC24BA00DFA4D5D0188B001773FB),
    .INIT_57(256'hD250F43C23E6A11341B412400C4855B027A3BDC44453E79C01F7788CF11FC658),
    .INIT_58(256'h8E97052335C40844E5F872783987E20B3DDC1BF80C03A42B11B77842C43BDB63),
    .INIT_59(256'h1C175312182CC04CFDCCD05B57F38A2BDF54EE683A58181C65EFD813C43401B8),
    .INIT_5A(256'h65AB5C5A1A7823F3A84F4A871A064E53A3EB75F8C9D851DC59E755A4499EC3E3),
    .INIT_5B(256'h2A142FF37DF304781D734D2F3F6C8043424C454BAAF86DDEC1632DBF406BAFDF),
    .INIT_5C(256'h242374FFB8483978BFD7DFC42C10243BB0340C0C1E7C1C1357EC59E378334E18),
    .INIT_5D(256'h76286A5CC030DC5B38030D78FC7B739C2C541C0C7403287B3FD7FE432C07E1EF),
    .INIT_5E(256'h00000000000000000000000074433E31839EF614341C9F93C9B40C30B5DF8933),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[16:9],dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,dina[17],dina[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:16],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:2],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized9
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ,
    addra,
    dina,
    wea);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  input [11:0]addra;
  input [8:0]dina;
  input [0:0]wea;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ;
  wire [11:0]addra;
  wire clka;
  wire [8:0]dina;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'hFE007FE0FE000FFF80003FFFFC00FFFFF0000000000000000000000000000000),
    .INITP_02(256'h583B7C4B0000C1E0F0F87C3E0F83E0F8E07C0FC1F81FC07E03F8F00FF00FF007),
    .INITP_03(256'h21D023A08B911C0D121C5378A59052A55A151A7052844A56B7B6A766B78B18B4),
    .INITP_04(256'h4ADC1823234A486120E96223043C19A5186C1C602199000D061C5028A78D5620),
    .INITP_05(256'h28970715A1AA2A286A2A6815A1806E050485E51524EA6F022820226B243D1A31),
    .INITP_06(256'h21C3038809763F281E29326D185221C6259604481047344C19481B49381F85C7),
    .INITP_07(256'h5A513A6A2789522A268B27AB148663F54619126043293A3C8A243E4105AD3E48),
    .INITP_08(256'h4435183E6A61446604C141BC0361053EE33E1F3C6B4C91E904D154A90DD7725D),
    .INITP_09(256'hA65CB44762F97E7EAD5C14FE0F5FBE496FFDA6D76E532519067D34C4A032540C),
    .INITP_0A(256'h0116E71968F876A124051ECD5757225B7BD7FED6D485EEEF78FBFBAD9EBBCDB7),
    .INITP_0B(256'h609A380C4DE1C29B827EB66F928997EAF68221440A7FB982585D4FDC774EEFE2),
    .INITP_0C(256'hA880004600374556F4F89EDCB831C3AE9095D4F5DE504F05435FA4CBE4E84D03),
    .INITP_0D(256'h6102856EBCED96FDBCBF8148E29B3FDFFFB6296C3EB26330A1352107864BCE1C),
    .INITP_0E(256'hFF96417DBF9764170006207D3B79BADDDFA3A57DF36DFEFDD6A2C57F73A0A521),
    .INITP_0F(256'hECABD0D32AD6BBFC0FB75057BBAF5026D23BD04FB3D59A5F3386605B3AF99AF9),
    .INIT_00(256'h7B7B7B7B7B7B7A7A7A7A7A7A7A79797979797978787878777776767574737100),
    .INIT_01(256'h7D7D7D7D7D7D7D7D7D7D7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7B7B7B7B7B),
    .INIT_02(256'h7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D),
    .INIT_03(256'h7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E),
    .INIT_04(256'h7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E),
    .INIT_05(256'h7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E),
    .INIT_06(256'h7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E),
    .INIT_07(256'h7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E),
    .INIT_08(256'h7B7B7B7B7B7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7D7D7D7D7D7D7D7D7D7D),
    .INIT_09(256'h007173747576767777787878787979797979797A7A7A7A7A7A7A7B7B7B7B7B7B),
    .INIT_0A(256'h7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C),
    .INIT_0B(256'h7A7A797878797A7A7B7B7B7B7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C),
    .INIT_0C(256'h7C7C7B7B7A79797A7B7B7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7B7B7B7B),
    .INIT_0D(256'h7A787A7B7C7C7C7C7C7C7C7C7C7C7B7B7A79797A7B7B7C7C7C7C7C7C7C7C7C7C),
    .INIT_0E(256'h7C7C7C7C7B7A787A7B7C7C7C7C7C7C7C7C7B7B79797B7B7C7C7C7C7C7C7C7C7B),
    .INIT_0F(256'h7C7C7C7C7C7B7A7A7B7C7C7C7C7C7C7B7A7A7B7C7C7C7C7C7C7B7A7A7B7C7C7C),
    .INIT_10(256'h7C7C7B7A7A7B7C7C7C7C7B7A7A7B7C7C7C7C7B7A7A7B7C7C7C7C7C7B7A7A7B7C),
    .INIT_11(256'h7B7C7C7C7C7A7A7C7C7C7C7B797B7C7C7C7C7B7A7A7B7C7C7C7C7B7A7A7B7C7C),
    .INIT_12(256'h7B7C7C7C7B7A7C7C7C7C7B797B7C7C7C7C7A7A7C7C7C7C7B797B7C7C7C7C7B79),
    .INIT_13(256'h7C7C7A7B7C7C7C7B787B7C7C7C7B797C7C7C7C7A7A7C7C7C7C797B7C7C7C7B78),
    .INIT_14(256'h7C7C7C7C677C7C7C7C667C7C7C7C667C7C7C7C667C7C7C7C657C7C7C7C637C7C),
    .INIT_15(256'h7C7C7C7B7B7C7C7C787C7C7C7A7B7C7C7B797C7C7C7A7B7C7C7C677C7C7C7C67),
    .INIT_16(256'h888687868886878586868586868886877C7B7A7C7C7C797B7C7C7B7A7C7C7C78),
    .INIT_17(256'h34ED38FEFD3B285E5B48D6C4E91AF8BA11C7E5C6F8FF036215A4682E016E2B02),
    .INIT_18(256'hCB30D4FE0CD8E9DFEE442507D720CBDE6C030EC9D1130E07FB49D4F33DF60A0D),
    .INIT_19(256'hCB32CECC2CD4EEC1AE10BCBE2BFDE75EFC3AC1206AE2C6ED04C7E72204DEE528),
    .INIT_1A(256'h15F40EFD1F08E608EE081D300AF83A2750E42022EA17AF3A29F807C450D5E05E),
    .INIT_1B(256'h06C518FEE716F36C3F3C28DC31EA26C0522025ABD03BFA5C45B3E6E4122B4190),
    .INIT_1C(256'hC926E90A68C810E5DC1311D92F1C182002B843C10345FD65F505BE2003F807D0),
    .INIT_1D(256'h49401CEE5A2FDF0A596027DBCEE663050DDF61D1240BD8ED63E7EABBFC012A80),
    .INIT_1E(256'hD242056FF238CC96E31470C913064CD548395EEDF1CD2C10121C7A31E3C069D9),
    .INIT_1F(256'h0220E74D5A0C26B697FD00F802D1344B362CEB401C0EEEC29E0EEE631D642678),
    .INIT_20(256'hF416E41F40F8CEF0F03B5727E9DE9CBB37D703D260D7E7397510EA4D32C4442E),
    .INIT_21(256'h4701570126ECDF20313734F0F0F4650F18E909D90D291F238D08D528F3C45A63),
    .INIT_22(256'h0C14FA1D173008F2D86C58DFC41269DF60194C01422B37098074522FE9BA4BD9),
    .INIT_23(256'h463139F2C75E1E2633D0DD34F9B04D119D3547DABAFE28305FBBFD2229AB583C),
    .INIT_24(256'h7608100772EE15761412F8F2CFF51465644345E0FC4711E8E016C40635CE38E3),
    .INIT_25(256'h44329E359C1B3507F0B1AD73E634008C72F4B80B602CDB472D09DD315164F8BA),
    .INIT_26(256'h542AE23BAE04DEFD17D6030EFF17FA0B5FFF8E02BB64175C84A5D51E4C540786),
    .INIT_27(256'h52ED731AEA08E84EF7E206E3D4AA123FAF3351E0A76E010C230FE1610B64ADB7),
    .INIT_28(256'h4C14FE418AF44349551EC8D5F4E710F934099CD8EC2CCB6A3714D2E0170E1CEF),
    .INIT_29(256'h3725BE0CE53B16302C40CF23009E0D54282FE7220228DB0029AFA577F748E7DD),
    .INIT_2A(256'h0402E3564ED89F37D2D3CD4AD880C54135F8F41DC5DEAEE0549913140A94FF6A),
    .INIT_2B(256'h000E500E9AF2920BE0344A01718F1EC5C8FCE536A4CA33E7054151DA83937BE3),
    .INIT_2C(256'hE24EE41A3A186BD9E466277D1E92031A7FFBCB60D8EDD86A85053F025098598E),
    .INIT_2D(256'h11EDE43BC547E05C1D60ED6FE268F91B6EDB922AF0150F2E1B4F43F53D9D5DD8),
    .INIT_2E(256'hE44CEF428023A7EFCC52F142C04ADE165E0E9C30B83BC422163BBD2FCAA2257A),
    .INIT_2F(256'h3C58FC05F60E2403E81770F43CCEC3CE302C32530CDCEDE33A0D5ACC81DF29D2),
    .INIT_30(256'h5E24F6969D480A164E071DDAFFD093F4FE220D8D52B717AEFBBB715423D867E6),
    .INIT_31(256'h083539D2B13A0AEA3BCD0000E62E701130050972C336E7FE30BF214A9C3078FE),
    .INIT_32(256'h3C34489E070D02523EC2864A2EA074F2946CE0F154FA080302ED460EF4FF4800),
    .INIT_33(256'h1426E74322EC18B7E7143FFA77A08D369688100310FC021450AF3E46A027200D),
    .INIT_34(256'h41436494A55F3E663A9F33DE51048F202C14C06D623112C6FCBD61021FF0B52E),
    .INIT_35(256'h552407B6F2DCBF4F406CB666F60249DE146897F12A1ED64A26D9F868B2FE52CF),
    .INIT_36(256'h2E35565DFD0602D43FEAA8EC08E8EE1F031ECBFDE0D99FFC2126AA0AE8123A38),
    .INIT_37(256'h4049FC01032000AEE2FD1F0F0834FAFA30171E3E0712F5F1FC033F7DD827645E),
    .INIT_38(256'h5E45116533DF45B6E8308C8CEFF748E81631B1B4FECED54C39EB3F3BF645030B),
    .INIT_39(256'hFA160403E636F03A04887A8019E67400238297AECCF4DB5339ED014B14382FF7),
    .INIT_3A(256'h5ECB6A3A5805F8AE271AB22AE30522F61752D6A7E014C2361F3CC0F8E4BB3C22),
    .INIT_3B(256'h81DE080218F2FD31863A1EEEFC1014C4850724D20E48C467B2D9FB61020E1D58),
    .INIT_3C(256'h2E2348FB2DD12206FE022A0C32B7F02207D8D8014B20D7B2FDEAE6D84CFE44BF),
    .INIT_3D(256'h2C31DE7537D2DB208A2B0770F34BD1FD2791F27113C7FAD29C53F783BF1FEFB8),
    .INIT_3E(256'h3789DD2105FBEEE8B6201C04E2182ED481EE00D6122CBE44D602C906B45DE905),
    .INIT_3F(256'h2CE01BDFFE2CDE2A62D52AAE001608B6330DE2C8F632F649ECF3D936B536D11F),
    .INIT_40(256'h66914235E3AF2FE6CDAC20E00AF4FCF32DE4E7B74420B04876D838D6F0EF2ED4),
    .INIT_41(256'h340E1C3B48AD8310E7C43FFB0E2C30D42BF803F14DFC531CB841D948E1401DCC),
    .INIT_42(256'hBAD8E41BE238C8E666FC0E39CEF81B05ED290CDB150E41C0DBD2D543F6480ED4),
    .INIT_43(256'hFAE3EE2C0411D4DE1814D9C08D91E514241007F4C5F496D05830CDCCADAE2108),
    .INIT_44(256'h2E1A10371616A2EA20C6F92F0C4C6FF7522004177DA71FEE052AF7C2EDB1C91D),
    .INIT_45(256'h31250B217BD4351AE5F52325204034CA51F22609570079F1ED4ECBDAC7D90D2C),
    .INIT_46(256'h4693E93FEC3C962A94EEFB214C443ACE1BE02B036CD071340FB7F9042CE4FE09),
    .INIT_47(256'hC5E6335446FE1A099556FDFC98C002EC44170189DB130A565466B190EF8FDD24),
    .INIT_48(256'hEC43E63A70148C344420F9E7450ABB1C08DF57FC2FFB071608402250D0FA3603),
    .INIT_49(256'h932A294586D0F71B2DEEFDE881FB6EF3160CF5EC20C01B0AC8EA362957B0313C),
    .INIT_4A(256'h0588F820F5CBEF2812DA14FD171CBEF6780CA24839E706E2342155FBF80205F1),
    .INIT_4B(256'h518FB972C4D4BD7ECDE5BAB1A3B71FFB8934FA0F37B2C724A3BA41E501D7FBA6),
    .INIT_4C(256'h1322090090F8C5EB18C10AEFDCD19BF89070EBD5C3C7C44024DB201159610A6F),
    .INIT_4D(256'hA002422BFEA488A300C739E6E8E02558004722D141CA4859D7F1C5F9D2EBB246),
    .INIT_4E(256'h2ED5B7192152D74CD288C8E1C408ADF118D8DEE7F397E7835BCCB2CDB4C79C0D),
    .INIT_4F(256'hBE14D25B00ABF9530ECA2CCCFFF40109921FA8C53AA5203E4E98552952E9E7F9),
    .INIT_50(256'hB1128F9ED4B3DB30B85898F4D80AC770E3EA362CECB44D8DC332F37D2BA5DFB3),
    .INIT_51(256'h12FFD8D9A04C156AD6E0F9FA9C216CD05A92A8DFBF2DE8CCFC35F318B5E367CD),
    .INIT_52(256'hFDFA16BB4BF1494ED81D2C1B0EDE1CAFF78AFE0FE179CB2DA782F509DBC9F5EE),
    .INIT_53(256'h23DCE7D5A30FF7FA9FB51FE154E0CBD7F1E5F1CFCF97BA26EBDC21E952F2A041),
    .INIT_54(256'h2CFA18D3129CE7F162CD02BB01FAE8DC0709FC290D37BF4723F20FF2B32CD0B9),
    .INIT_55(256'h0714F20611D64F4B6263150C2CEE07B0460223DE95B9E305E6E41624DBE538FF),
    .INIT_56(256'h37E7DF2BF5370112FD9DFFB7E60A1B1402A1F3AC06D5E615D95C6E340A2C0AFB),
    .INIT_57(256'h4E11083E581A1C71041F72EA2485B81FE1BCC01238F0DCF3800E29E1E93E14EA),
    .INIT_58(256'h33E3B2E303ABDCF039CB133CC7E5C4248BFDAB05E7BDD8B6E1C6DA5D3304C705),
    .INIT_59(256'h1DE958C5EC80522C6F9F1B91EEC41DC407B10308EAC5D3FFB3DE42A2C0E91A11),
    .INIT_5A(256'hB90F1476E02BB10646DAB7FBDEEBBDFD8E10FA967D4E1DAA952C2D063109F38E),
    .INIT_5B(256'hADFBD8C80FA2EF38E42B27374C1EAF146F0BF38B37483EBB5D9C294852FB1246),
    .INIT_5C(256'hE30D08E36C12C8368F1903299E0013AFF71E5BEE007DE9FF63C2DC16EA01F023),
    .INIT_5D(256'hD447109C202C89103ACBBAA5A2FFEB0BF045C6CB13D0D253056F9933F287D7F3),
    .INIT_5E(256'h8BF4630CF1EB5BB7D3B5E4220D2F6CFDF8D526601A32BC3BF86932BCF780C6F8),
    .INIT_5F(256'h31E9DA561164210CF12958F2CD33FC5C366B9299CE663B0782060E64D3F02B30),
    .INIT_60(256'hF5ECBA7C46B53008F8ED3857CE04300208AC603BFAD41AEF1B26639E5F3FC6E9),
    .INIT_61(256'h65E553065A94FAF614FE06F0D0EFE5F6CE1BB63538DA7025F6FD6274C235F6FD),
    .INIT_62(256'hE7A420EEBCF37F1624FA6FF92076022F1AFC6400D1DDF8FC0C1C280309F925E7),
    .INIT_63(256'hE8410CD4221C6006F01E51E34BF330DBD5B72DE807E12387CB947CF300AA1DFF),
    .INIT_64(256'hD62DD4FEF41C4C0D2F62DEE7613359CFE2B110094E34F5C6A10CDA06E8FBE453),
    .INIT_65(256'hA5F5D3E733D5070E99CCADCDBD035919A39854C0F4CDDF96A6980AF2C4A31227),
    .INIT_66(256'h45061334111A0C05150C8CCB39E4E1A301EB3B3C01B437F517D309E10FC1D629),
    .INIT_67(256'hF307E127F901101FD5D6E4E8D4E0D0E8E6F6D8E8E8DADEC4CCD32D2916D6E634),
    .INIT_68(256'hD501050F21D3D1011BE90E21F522FFD3D1F4040FF1DFC7070B1E06F0FFE82B01),
    .INIT_69(256'hF01AF6002E154AD23212F6E011E40CFE081EE02E033022D42F19131909D8DAD5),
    .INIT_6A(256'h031BCBEFF9D0DB17F722B9C22C1FCC1C08F9F6060E0AF8F60C14CBEA2C100802),
    .INIT_6B(256'hECDDD0E3DDDDDDFBCB06C2DC3CFFC01B0C01FC08EC1516ED1DE1E302CCF42105),
    .INIT_6C(256'hF5EEEF071F0FF503CF1B25CFC30FD7FB0918E7E5FBCBF1F9D3E101D9DCE2E8C1),
    .INIT_6D(256'hEC05F1D7D7F10A07D626B9C0FFDBD8F0E23D2122182702FC01F7231DBC230205),
    .INIT_6E(256'hE40FCADDCCE3011DDCDFD619C28C21F1EC1D18B71DC7E717E2EFC9F7E26F05F7),
    .INIT_6F(256'h03EBDA221A2240DA2C3C1D236B29EA16FD13122A38EE34B406E5D801E167D31A),
    .INIT_70(256'h04EFFDA51701D3D9F616CC327F3D0808E538C81420F21AEA3828E506631526FC),
    .INIT_71(256'hD5DF0DB91BD7CB13F400C0346515D800DFEC0E1C36E4369E24F9C7E0C2A6FFE4),
    .INIT_72(256'hF4EFFEEB0605D5E30ACFD009AC9B0DE5F2F9FBD3E9F9F507DEB7D1EDBAB11DFD),
    .INIT_73(256'hF3E1059AC6E9DBD9EE24FC113D4BF0CEC701EA3066FA0CB404E4C6F3D9680BF5),
    .INIT_74(256'h0B1FD691BA29B0DE13E1C7F5D2051FD8BB27E1C5E617A903FABB13F5D1D521FF),
    .INIT_75(256'h072823514900520C3C4E273069C1E2101904FB3B1510180738DDB4DFEEE91ECC),
    .INIT_76(256'hF131FBB2D4FFC7E5D82041E667FAA6F049F8F93323DA4C0C0C220DFA26D9EAED),
    .INIT_77(256'hDBF7E9AADEFB95D9E52043E821DDE4094FE41B491F2220E608B7F7BDF6FB3BEC),
    .INIT_78(256'h071FF19E9C11BB07B6A5CDE1C5032DF3CD1513AFCE07D705D3DFD1DBC51F29D5),
    .INIT_79(256'h176DEBDF0211DCC1DC33121A47D0D8222FEEED4F4E2044281F9D13E1BD2CE7C1),
    .INIT_7A(256'hFD3DD0E42C01D487F69D0EFE16D503F5D5611DC3FA17DE030BBF22E8F6EBEBDB),
    .INIT_7B(256'hE7920BBE2D37F8560B28E8DBF038E5FCD3A05D8E2D14121A01BF3310FFBDF4DB),
    .INIT_7C(256'hF73FE5F3CA07B8E9CA3EBF26F8F5E5F22BC523CF2D2E00282914E51306F1DD18),
    .INIT_7D(256'h19650515B8F1C2DBC630DEE82CFCEDE60DC7109139162C5833DB02EC21D7D7F1),
    .INIT_7E(256'h277DF500CA0EB209CDB708F117D5F60BDA79C9E1D805EAC3D1C1F8CFF7F70901),
    .INIT_7F(256'hCDFCBB3BC2D01F0CCF36D715F419D1E6F7D8658D210B2E28FFD101E51805D1D7),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[7:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,dina[8]}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 ),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [13:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "14" *) (* C_ADDRB_WIDTH = "14" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "5" *) 
(* C_COUNT_36K_BRAM = "7" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.705689 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
(* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "9706" *) (* C_READ_DEPTH_B = "9706" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "32" *) (* C_READ_WIDTH_B = "32" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "1" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "9706" *) 
(* C_WRITE_DEPTH_B = "9706" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [13:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [13:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [13:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [13:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[13] = \<const0> ;
  assign rdaddrecc[12] = \<const0> ;
  assign rdaddrecc[11] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[13] = \<const0> ;
  assign s_axi_rdaddrecc[12] = \<const0> ;
  assign s_axi_rdaddrecc[11] = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [13:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [13:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
