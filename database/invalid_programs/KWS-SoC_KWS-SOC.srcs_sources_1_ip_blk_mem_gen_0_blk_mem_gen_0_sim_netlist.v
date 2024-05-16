// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Aug 17 14:25:00 2020
// Host        : LAPTOP-5KE3GPT6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/wulian/DD/KWS-SOC-8bit/KWS-SOC.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.701475 mW" *) 
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
  (* C_READ_DEPTH_A = "9716" *) 
  (* C_READ_DEPTH_B = "9716" *) 
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
  (* C_WRITE_DEPTH_A = "9716" *) 
  (* C_WRITE_DEPTH_B = "9716" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
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

(* ORIG_REF_NAME = "bindec" *) 
module blk_mem_gen_0_bindec
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

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module blk_mem_gen_0_blk_mem_gen_generic_cstr
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

  blk_mem_gen_0_bindec \bindec_a.bindec_inst_a 
       (.addra(addra[13:11]),
        .ena(ena),
        .ena_array(ena_array));
  blk_mem_gen_0_blk_mem_gen_mux \has_mux_a.A 
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
  blk_mem_gen_0_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina[0]),
        .douta(douta[0]),
        .ena(ena),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized9 \ramloop[10].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[10].ram.r_n_0 ,\ramloop[10].ram.r_n_1 ,\ramloop[10].ram.r_n_2 ,\ramloop[10].ram.r_n_3 ,\ramloop[10].ram.r_n_4 ,\ramloop[10].ram.r_n_5 ,\ramloop[10].ram.r_n_6 ,\ramloop[10].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[10].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\ramloop[7].ram.r_n_9 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[31:23]),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized10 \ramloop[11].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[11].ram.r_n_0 ,\ramloop[11].ram.r_n_1 ,\ramloop[11].ram.r_n_2 ,\ramloop[11].ram.r_n_3 ,\ramloop[11].ram.r_n_4 ,\ramloop[11].ram.r_n_5 ,\ramloop[11].ram.r_n_6 ,\ramloop[11].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[11].ram.r_n_8 ),
        .addra(addra),
        .clka(clka),
        .dina(dina[31:23]),
        .ena(ena),
        .ram_ena(ram_ena),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 }),
        .addra(addra),
        .addra_13_sp_1(\ramloop[1].ram.r_n_2 ),
        .clka(clka),
        .dina(dina[2:1]),
        .ena(ena),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.DOADO({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 }),
        .addra(addra),
        .clka(clka),
        .dina(dina[4:1]),
        .ena(ena),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\ramloop[1].ram.r_n_2 ),
        .addra(addra[12:0]),
        .clka(clka),
        .dina(dina[4:3]),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[4].ram.r_n_8 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\ramloop[7].ram.r_n_9 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[13:5]),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[5].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[13:5]),
        .ram_ena(ram_ena),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .DOPADOP(\ramloop[6].ram.r_n_8 ),
        .addra(addra[10:0]),
        .clka(clka),
        .dina(dina[13:5]),
        .ena_array(ena_array),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[7].ram.r_n_8 ),
        .addra(addra),
        .clka(clka),
        .dina(dina[22:14]),
        .ena(ena),
        .ena_0(\ramloop[7].ram.r_n_9 ),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized7 \ramloop[8].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[8].ram.r_n_0 ,\ramloop[8].ram.r_n_1 ,\ramloop[8].ram.r_n_2 ,\ramloop[8].ram.r_n_3 ,\ramloop[8].ram.r_n_4 ,\ramloop[8].ram.r_n_5 ,\ramloop[8].ram.r_n_6 ,\ramloop[8].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[8].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .dina(dina[22:14]),
        .ram_ena(ram_ena),
        .wea(wea));
  blk_mem_gen_0_blk_mem_gen_prim_width__parameterized8 \ramloop[9].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[9].ram.r_n_0 ,\ramloop[9].ram.r_n_1 ,\ramloop[9].ram.r_n_2 ,\ramloop[9].ram.r_n_3 ,\ramloop[9].ram.r_n_4 ,\ramloop[9].ram.r_n_5 ,\ramloop[9].ram.r_n_6 ,\ramloop[9].ram.r_n_7 ,\ramloop[9].ram.r_n_8 ,\ramloop[9].ram.r_n_9 ,\ramloop[9].ram.r_n_10 ,\ramloop[9].ram.r_n_11 ,\ramloop[9].ram.r_n_12 ,\ramloop[9].ram.r_n_13 ,\ramloop[9].ram.r_n_14 ,\ramloop[9].ram.r_n_15 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ({\ramloop[9].ram.r_n_16 ,\ramloop[9].ram.r_n_17 }),
        .addra(addra[10:0]),
        .clka(clka),
        .dina(dina[31:14]),
        .ena_array(ena_array),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_mux" *) 
module blk_mem_gen_0_blk_mem_gen_mux
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

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized0
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
  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .addra(addra),
        .addra_13_sp_1(addra_13_sn_1),
        .clka(clka),
        .dina(dina),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized1
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.DOADO(DOADO),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized10
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized10 \prim_init.ram 
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
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized2
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized2 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized3
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized3 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized4
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized4 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ram_ena(ram_ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized5
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized5 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .DOPADOP(DOPADOP),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena_array(ena_array),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized6
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized6 \prim_init.ram 
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
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized7
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized7 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ram_ena(ram_ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized8
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized8 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .ena_array(ena_array),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module blk_mem_gen_0_blk_mem_gen_prim_width__parameterized9
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

  blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized9 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_2 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ),
        .addra(addra),
        .clka(clka),
        .dina(dina),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init
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
    .INIT_02(256'h84E5D922E400F8F754417275B1FBA5627299838F6E35F64C0B8BC33B045868E1),
    .INIT_03(256'h681D6DC487CB9DBF53C309F43EE2492EA04E1BC5FC35CDC4B1ABC1A539B744E2),
    .INIT_04(256'h5421B9493BEF8FED6B4FF25E0E58387094BE2D9BE691966EB4A1B47985729BD3),
    .INIT_05(256'h6E67788C88957646969966D97096A6865A5C1862F175D745F16BF1C0E67D8BB9),
    .INIT_06(256'h52F4CF4848934A20E7143F7CB0FCAE4766FB50F1BDB416A92BD63C73E112E918),
    .INIT_07(256'hCC01D39ABF1BE539732F319E1C6CB66AA84F0B379DE7EE32AF7968BDD356DC5E),
    .INIT_08(256'h5C50A017CF06E2A42538AC687D9105610A2E0437F84272815C5E608A26710E9B),
    .INIT_09(256'hD0EA2D8EE264587B29619DA5FB0BAF40CF9EA2FF7E02D43AEBEEEB68D8A0E9B1),
    .INIT_0A(256'h71E69BE0359342EA768FC5307145CAED44A2ED6BFB40A12EB9C3FE262E8821ED),
    .INIT_0B(256'h85EAD1784931CB7E12098E0EC794280D1594AB6FB82BE2D3FA309D8FDDCF1D51),
    .INIT_0C(256'h190DE499D7C608898AAF715DE900824ADD3DCE9D7F161335F7E8C2879AFF7B74),
    .INIT_0D(256'h2FA6B9F8AE4843573CEFBB999966FDEF65F160FEBC27EFAF862BEC4B435F6371),
    .INIT_0E(256'h6BE4380542F6BD4442CDF3AC2919B2CD0291DDBD2163B93F26733D424BFA3D78),
    .INIT_0F(256'h48B39E802F7E8582A04C4EE7DEA0C93967E9CA7C3E44C43F1F62A5A403DD38D4),
    .INIT_10(256'hCB67E975492154BF9C5C0A50473E8A7ACAEA4F104C012B2ADAE8905F1685BD0F),
    .INIT_11(256'h99A06B34AEF239D7DEB6ECB5B7DD73645CD36B5AB980BDF6D1AD13286EE34665),
    .INIT_12(256'h8ED54BFE326DC626D5FA5FABAEDBDA70D955DD78877BC02637D40844926D4D85),
    .INIT_13(256'h95FE3201F855D2E1734236B71CAF794BE9691DAD8E091C18DA9DE888A41BAE6C),
    .INIT_14(256'h0306F9DF1D2D99D3FD156A4DC9D83F660370D1C00F026B24B63298CF30253B78),
    .INIT_15(256'h0FC615B11118CADFA27393AFA9B87EBB2EC2AA12C0306E3D771E97F12250CA31),
    .INIT_16(256'hC09B476272F5739813A66CBD3CB382F67E23F0B4F3F5B3B8AAB6AC83C933B61B),
    .INIT_17(256'h41267F250F85AC6022C4CE86091E7945E6E8563D64A0BF85487E56BAD98CF54D),
    .INIT_18(256'hA244C3D4E2BE4B45E1BF6E8316AEE66ABC7A75C99BAF09EB57E5CF155D346954),
    .INIT_19(256'h6048298F610EE96092CB1C759F810C592187DBFCE9900FA4B30733C7398503E5),
    .INIT_1A(256'h40E52843D1EB65C149DE8D06F54D9FDCF313AD1E0E092997EF38A2D385E7E9ED),
    .INIT_1B(256'h19691F723853E2D87C517FBD1FA2149B150C89FA31277733CAA5113D241764BA),
    .INIT_1C(256'hA4B8C318BF8A491A3E347C0298A4F4CCEB76A0F42F665327BDEA124D7FBFEAFA),
    .INIT_1D(256'h27CEFD556F5EFBB24C8B3E9AEE92A6D84C4E1047D177EBD90EB67FA4ECF1760F),
    .INIT_1E(256'h69DE305D2605B5F1EDF545285AF889D9C3F09006DDA74DD61846C1BCA9207E7E),
    .INIT_1F(256'h303FE7BCD184340F0A6387893DE5CB2D5D38F3FB6DAE51753CE52D900073A635),
    .INIT_20(256'hF7240CE26FDAE4AA6EEF2E273414632ED028D58DC7016CBF49BB4722E85613DB),
    .INIT_21(256'h0DA25254C18F8B68A125519B20E90159E9F7C84C40CE70556503CBDA3F60F314),
    .INIT_22(256'h96140C5771F75113DC6545E1FC00FA7EB4330CAFD942040115D420D947200883),
    .INIT_23(256'h98C157B8ED5DA36ED4971D8BB4E677A16719FC5F99E894696E030E8AD128EF51),
    .INIT_24(256'h7884F53A8952348BF8000877F858E997DC327A0064A0B57EB34EEF562EB09542),
    .INIT_25(256'h000C167D93EB3EB3FC9CFC8D22C4A6159C71A976EE18BA0B193FDE6638DF285A),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized0
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
    .INIT_05(256'h6F9F0714A78CDDD4D95FFE86FEB34B7EF0DC23984615D6799EA784F50F434000),
    .INIT_06(256'hC8C4BA993F76B756F40A3FBF36830B55DF867CFABC6DEE4217BBFB548046AB6F),
    .INIT_07(256'h8770058A8C665308C533E6434FE960B3FBE0A0D1A8652E5A3433D7DC4ED0D200),
    .INIT_08(256'h34D6B4DED05E9BD06ED9659AF9F09CB6CE5F3E020B6747318FF36C33488BE3B3),
    .INIT_09(256'hE308A4779755BA5F1EBCCA2AC6CD98E44C50643710CCF83E19C7494355AAEF56),
    .INIT_0A(256'hF8B690191444376133CFDD01FC3EC28A3D17D229E2711607A6B626BCBC9CE44D),
    .INIT_0B(256'hDA99E4055ECD78D8BFD911176C0E8207A6F50A2537EFF7409618A4C9421A7022),
    .INIT_0C(256'hB60A1CECB2646E701C257988304C84D640EFABCD5D9279D958C7D2A4FAEBDA8A),
    .INIT_0D(256'h27A87738AC86D363EBD19A6A949FBF0ECE35D93D1174067209F00C07D3CCDA1E),
    .INIT_0E(256'h80018322A8395D97FC8460D9CC571D049F38945FA9467F037747427AA58D8E4B),
    .INIT_0F(256'hF57587C5994B4D0288136F838C63765F0E6B544C691260EEE4F2BA01D026096A),
    .INIT_10(256'h2C1501DF5BDE43293F52DB0A574F3CBBD0A8A33AF1BCE51151CF5C22927A33E0),
    .INIT_11(256'hEFBFE4E4298EC286608769388D2035F036110DF7376680CB04E9CB5072DE939D),
    .INIT_12(256'hC598867A038B752877490799766D59880B23BC6A5E3C2A8FFE9C8EE8022AFE62),
    .INIT_13(256'hAA4961D873750C9A114AF4EAF88AAA268BFBBB5A8A7B3BB6AEE3A84564442050),
    .INIT_14(256'h5EE031F5DCABEFA164EBEF49A0796FA67BBB7D28AA135F0B5C209C11A18123FC),
    .INIT_15(256'h986C4BDAFA73FCF76016E664863961B3ADF26C606075B4B90F9C9FDAF585138B),
    .INIT_16(256'h51F2F9DD6877F6C6ED918848BDDDF2F624BA71E9DFFC1CB78B9005A9F6D3E742),
    .INIT_17(256'h40E5172255B4324197372D849BBB9E6D6BE7D77548DAC7DFEB44F62DDBDF603A),
    .INIT_18(256'hDCE888B5A0010778B087FD5D260B45AD510B3CAE30008BEF779C9043AA7F4171),
    .INIT_19(256'hA297AC8C9AA575427B0D2FD5AC720800B31A72756C8E82A5DDDDBD3D0FE20C9A),
    .INIT_1A(256'hAC0E481C9D8AE0F7B3C17B6B7E982476D68C94018849D2945D5CFFD7C2CBF606),
    .INIT_1B(256'h47D721653988EA7B5E6B645F8E0EED95EBB6A54A57C81CFDB76B30C5BC561906),
    .INIT_1C(256'h295E36A3BC1C7ED0647B0BABDA6999105016E6B1D3526D620797D2F2B4A0F393),
    .INIT_1D(256'h2D5D78BFF9E150C2F44CA3FA234622483F293AED19DD57BE5092E479FEDF6F16),
    .INIT_1E(256'h7FBFA2E2394581E1D9CE4F76D307C71A81DA0895EC06F41703D9A6A3A8824381),
    .INIT_1F(256'hD06EAC7A673B415F9A91E59D61F622C6EC7BD7A61313CD3B72D1061BB3FEE361),
    .INIT_20(256'hC6F911B2FF92C64104F8E6560D07ADD0BE62F16C2C857F65FDE3BE9641CE1238),
    .INIT_21(256'hA1584EC800D990DF2D6415500FE141AA6A5811493CE82EFEFBF68DDA21D136FD),
    .INIT_22(256'hD60ADD85D8703930E9E5068C2F21F57F9FEBF491000E1557E0DCE3C1A37C4082),
    .INIT_23(256'hDCFF56BB4B28331D72AE7A2379407E7FAD815EC8BE1B53C295A273488BA3E64C),
    .INIT_24(256'h98BD0D604455D5D51021BD1BB2DEA7B156B835C305A20B7711D43FEA8EC8936D),
    .INIT_25(256'h88B8A5293CC6D701D5D433E2447CDE9ABEB2E18D618F0EB5299525EE29204446),
    .INIT_26(256'hA4203E59C9DCBC91FFE0616FCB29C018986B46FCE15B1268D1EEDAD015477FA2),
    .INIT_27(256'hC14258A8ACE97845E3135394935506DB49D0322CB30D5667BA06C3C8E655F094),
    .INIT_28(256'h39C808C853CA32C19482F445FDF32CBC76413F23356197192C8C9B7307B8D0D3),
    .INIT_29(256'hCFB181455139E686A4EFECB76592B95D98BC208CD814D2D12D1AC21E1D80E50D),
    .INIT_2A(256'h33631EB42117B3D5300ADF7DA19651B8729578A64FE5752A4CFFE95AF69DD2B4),
    .INIT_2B(256'hF28554082FD1ABEBB12B036F63027A8FDD8DD62B85AB33DDD25E0B70CC4AD698),
    .INIT_2C(256'h44ADDA155B7A336D1DE26BC7B75DFC178AE353732B5CBE1FF885F578DD5A05CC),
    .INIT_2D(256'h599243CB67FD1E60EF7368375A0D6CB5E18B6BC938C6DE664C664562FF31F16B),
    .INIT_2E(256'hDB4D4775DD918C080A1FB16110A2751BF8B6FE95D14D9555CB3F001B41B614FD),
    .INIT_2F(256'hB7138229448CFE036DA563D83EDE6F94644333F0545FB234A33137D8E43284C2),
    .INIT_30(256'h6D97BEB7FFB65071580CE0045180F41090AA340BCB43B023F7F20D6A54C538B1),
    .INIT_31(256'hD49D10B898DDB0192C82AA04FB00A10E7CC2CBF59F91F823C92A2C67A7D88562),
    .INIT_32(256'h59691341E13820D9655FC28E4C7A277C2A72ADAFC8F992654C22D869FECF789F),
    .INIT_33(256'hF98165E675548DD57F6C3E84FBF1439FAF9C6C0AA164AF4524DAA2B7BBCC19EC),
    .INIT_34(256'h2AB572333042408575D6040823FCE77DADFBB99C164E8C39A6575D19E5D5CCBF),
    .INIT_35(256'h496061116520640D4EBD1A85C3CA61BA7A6CD8A043053D534FDE3A529FA2F0DF),
    .INIT_36(256'h1ACE346E6E0018475CB6C738659E873AFA113C07A3A347F1CBA89648D3440705),
    .INIT_37(256'hB0B0DEBE7EE339A7BACB79E255B17B1BDB5AE29D1912E28945AB8F2734F80721),
    .INIT_38(256'h56780E686AF9B60E7F0DD3C6DCE09B23D0351A0052159E0013DAA5B40B443462),
    .INIT_39(256'h26DD0D287D1312F94BCBD31E639A0E77DFD4ADB47EDE53F46D13503136AB8EFA),
    .INIT_3A(256'h6DE550723A4CF2BA1FAFECA00117E8F07D2FFBB4C22F1FA9EB469E0C5CFC859E),
    .INIT_3B(256'hA75ADD0B378FE7B2602A7263468CB6CCBC429D160C1AC22E162D7D8024D4E035),
    .INIT_3C(256'h410A9DDAE48D681FF97BA61F3ADE28F1082000C3E3711DFCE168F14283A68CA4),
    .INIT_3D(256'h5DCCCBDCBCE57CA48F9EA0BC48E467BB191497489AC32EF18C4A214BB82F5193),
    .INIT_3E(256'hAFD509747CE61DDC88CCCBA6EAA38F1AA11237E943A894E53EE7564088DC512A),
    .INIT_3F(256'h7BA36B9837A7CB5ED95C19E4396B6593A4B15C69EF467EDC9A623C91ADA71236),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized1
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
    .INIT_00(256'hE61A9D1DB88D616C1B7B81F5B31B5E763814903E2A3600ED2997A409AE0C4DFE),
    .INIT_01(256'h7DD7CBAD417183C4CC7862ACB8731AE5C3BFC988D0E22D76105B72FDF20355C6),
    .INIT_02(256'h314D886892CADB9B253BB4E778956B755E96E2D134187BDFAA67904925C67199),
    .INIT_03(256'h90D4EEFBE6F55977993FE3DD94ECC277BB5934FEBC7AD609D90B0E81838F1E58),
    .INIT_04(256'h41F59D4D54428D6C7698D87D06629D6798024BBE1B0BB92C220DD3E3859CDAE8),
    .INIT_05(256'hF0E5E7167782EAC60FB95B7BACA2CEB7074B0EC9A07873B86B201AF3270C0CF9),
    .INIT_06(256'hBE7634B083FC6D760C173933E76AF79946ACD41E878500508B0251B1DE64EA70),
    .INIT_07(256'hB242BBCD1C07A31F416CDD436AD562A67A1196C4E9235BEAD2BB6EEAB2E08426),
    .INIT_08(256'hB1E8F16BBC4035348B867ABDD7320D6C3DCBA3F4C2814AC6ABE6AADFFA697BDE),
    .INIT_09(256'h4C40D8BA509B726AF7F437DEC2C257A186E41EFD6FE9F98E294D72DF5B4AFBB6),
    .INIT_0A(256'hB7E975CE93ACAA1245DCDDCA556BB644974081E0C3BA4F0DA4B8A4D1A72869E2),
    .INIT_0B(256'hC6AE704D5AB0FE4C0FEED4707501120FB3A9353F50BCB14E4B217E5570B89882),
    .INIT_0C(256'h181FC61A375ED73B8618D37C00A28AEBE664DCFA7E0ADA56AA64D87E05962C43),
    .INIT_0D(256'hD56F0DE222CB44227847EBFEC897E5CA4AF0085B7CC7C1A124F4312549C367CF),
    .INIT_0E(256'h06CD809B98DB442F44090D25D58FFB471A0A913E7E1DCF8C8CBFCA671F9E5E06),
    .INIT_0F(256'h079F59ACEC547276FE36C62D2A839312E75D2263B8F21316FDE84EA83ACADA20),
    .INIT_10(256'hC9AFBA3352832BCEE415D7E9D004D19A29BB3CF303F22ADAA36E7D1890AF2608),
    .INIT_11(256'h8CE66A6AF38CA60BD7D57047F979B99D777DA4F620538137BB2642B90A78502A),
    .INIT_12(256'hBD13AA64DEB37782124FF318DEDC700E4EB210FCA0BD8056076FF9115FCF86B8),
    .INIT_13(256'hF839EF1DC9C28478D4C586CC7949D72C8B40BB3D6D94B55EFBA1B9DA343648D1),
    .INIT_14(256'hE046C12F5F2E70D267941CEE27570F2DBAC45E54B0DDB0B30077DE9D397E5D3D),
    .INIT_15(256'h389318668D6D69A07143AF0507ADD960962682A7CE289F9EB549B358605D8157),
    .INIT_16(256'hAE62051D9AED4A4351C7C16DFB3A79C75C760C4F1D3DFC76D204549164BEF3FD),
    .INIT_17(256'h000000000000AAF91E8B18868677B0AF909A2EEF790D7513A73A58A3219688A5),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized10
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
    .INITP_00(256'h76B6D8E5D978900BB45AD9B3DB9AD3B4C4664BB3BC4ADC47B66AD9D4AEB653B2),
    .INITP_01(256'hF0C402F8A2E6D0CFE4679BF518BC9ABB36B0D151984ED02955B4D00F94B582B5),
    .INITP_02(256'h8AE4D9D4F380FAC18EDCF1F18AFD8AF5AAFCD8F49170D841B2F601B099B11838),
    .INITP_03(256'h0103F475E80C9A956FEBFB5F2C11655DBBF00CCB90D4AE54A35453EAC049BBFB),
    .INITP_04(256'h0DD802C5FF57FB3BAEF73FB537FB51BF1C5B3C542449FBBB33B5FF3C981688C0),
    .INITP_05(256'hF77AC3450ED9802C4185E37A88957FFB08F9ABBE64CE217F88857EF4C842EA8F),
    .INITP_06(256'h4148944851A1A40CA448574A947621FB8C440000144CC8055E25DA7D04232E19),
    .INITP_07(256'h41ACC3DF671275625D3DAB7737CFDCB12D0EAEFACA91D2C0E9F578EFC2260000),
    .INITP_08(256'h7F048FF4D6A2136AC007D30CE11E95E1F75E7357951E81603434F9819ED8B118),
    .INITP_09(256'hE20704BF0B1DCFC8F31611E861D821C12317A61F401625A3EB078D27870C946B),
    .INITP_0A(256'hE60BB2A3990FB82E6F45E23B4774F6921758B1999CAC99B8CF448D1767002926),
    .INITP_0B(256'h378D4A721C1C2A3BCB2DE50EEB5D3B08C6C78FC7454E5D2B676C251F2138219D),
    .INITP_0C(256'h234F715F754B49DD7505C61ADD2C413810653F23C18204147049C10275822339),
    .INITP_0D(256'hEF248C982D45B4A210A7FB72EB6779CD8116C90429D2AAD93B9C214D1614423D),
    .INITP_0E(256'hA88784C3722B86F921E67224170E4DE1C3672EBA58817EA9D2446F593FC08DA0),
    .INITP_0F(256'h39E39DF0C1C1A5F6F233ADC1915F002F569A8DAB6A6E8F99CCA81CD90D7974A0),
    .INIT_00(256'hF10BF505F3FCF10CBE09D69E29ECDE2702ED15EF030ECDFCBB3BC2D01F0CCF36),
    .INIT_01(256'hEB16D6C826DCE32A31D2EF13F533E20FC4F143EFDA0C08FBC6ED08FF59BE251B),
    .INIT_02(256'hF70ECEE8ECC621430EF72F21F617E406E4E600E4FAF90B390FD3330D17E3E0CD),
    .INIT_03(256'hDFEE00021CDA05470FCFEA071CFDE5170EFB250FBB0ACDF0C14EF8D03110F8E2),
    .INIT_04(256'hE8F50DC9BB1CF8E9CE3F0AC8F521C901D7D529E10100E9D0C710B5A624EC000E),
    .INIT_05(256'hD808B0EC04CB033F17D119F7D213FC0BE6EB13E9B70412F3F201FBAB0F0CEBF8),
    .INIT_06(256'hD8E80FF9DF3408DA01E3F7F5D4211B21CB1417E703121C070704082FF823E1E2),
    .INIT_07(256'h01FAD7E63EF7DD0FCE01C89F53D3EC0CADCA16F1B84A1B14E5F9E4250EEB0DF7),
    .INIT_08(256'hE8310DD831D70743CC19CFD741C20596D50D09180411F74FDE21DCFD3ADA04A2),
    .INIT_09(256'h15FD03DE16D305FBBE17F6FB48D11F27B7D407DF3024260007170D06D2FDD992),
    .INIT_0A(256'hCB1408E5D942240833FC0742FEE0F53DC2F60DE70B1814002D04D904BE2516DE),
    .INIT_0B(256'h1F1DB3DD00CBBB41B229D0BF6711270BF2E116BD075A0AE53DD904E902190AFF),
    .INIT_0C(256'h344953F1E61B1B17D401B1F1FBED1C14FE1223DFE834D305E825B2E1E410F4AD),
    .INIT_0D(256'hA0F7B1181DFB17240A95F8340FCAE7DEF8164FE3A408EFFBD4F3E6FA09CD56F8),
    .INIT_0E(256'hD71CCB124614ED21C4D4F00C35DDF909D0EE14FE120E3623D4AD1E16FAE0E6F1),
    .INIT_0F(256'hA6EAE4D846000528ECE910022EF703090A151D072C11F725F6D7ECEAE91F1E09),
    .INIT_10(256'hF82B11CBF64305F5BA01E6F0132B2EFC0E4131D9FE0B0F1F161BE5C5E71B0E09),
    .INIT_11(256'hB613CBF85A17F612FE89E4F403C7F812223D0F0D00230BF7C80BDCDF02352C0A),
    .INIT_12(256'hD81B13CA141C07D50DE9DBE553401116C8D807B6D12024191BC11722090444ED),
    .INIT_13(256'hD905DE59C110E962C8D0F3EAF4D00A0CEFF023BCE331260CDED7EEF141FD5A3D),
    .INIT_14(256'hDB430011D109C945E8E6EED4FAAA3EB7DF4B101FF113B963DCBFCEE512CB3387),
    .INIT_15(256'hC9131221B5FFDD18A4FC03F8F0A83F37EAFEE5AC041403E4FFF9F4F1214341B8),
    .INIT_16(256'hC4E0E09E0A2AF4F5E8070B2B4D0A0A47C2CFE0C8C507F715F6EE0D2E472B08E1),
    .INIT_17(256'hAB310275F737FB1BD6E0DB0A05B40839CCD805A2D20715D5F2EA07EF23F35B18),
    .INIT_18(256'hA8D019550E386A5616D74B9CBA261BE6C38BC9ECCB30E6C3D3F0F8F7DC2745BC),
    .INIT_19(256'hC228FD4D1E1CE7EC72DA14EA0CB4553813E326E82F3AEACCF0FBDC575F65C34C),
    .INIT_1A(256'hFC1D2DBF2F022F0CEAEE21DA4EEB2218900C9B25C8F48E3638DE54EC94EE161E),
    .INIT_1B(256'h826B92FDC805F1E2F8EFD68A152A357F1E1D7C26BDFA2233E6CC7421A710D9E6),
    .INIT_1C(256'h223DF943FEFD05181C130ED25F2216BF32F4E0519CAB39E11CF511D1DDB800D3),
    .INIT_1D(256'h79CDBA2CE6F6A0C3D3AEBA35ED33E5D5A0FFB7EBE121DCBC1AED2D53B9DBFA9D),
    .INIT_1E(256'h64F6B94BBA141E6820121684FA6A260FBE0A42A5E344F227BA091DC91AFB1EFE),
    .INIT_1F(256'h5A1A6E253C2600DF18224C803C12FD6EA2F5BEBD20C926084BD95FD021C980D4),
    .INIT_20(256'h811511E1C1668E1E503B67B859DBEE27E3415E39CE033605DAF7AD2F330B2B3D),
    .INIT_21(256'h0B27C09F0201E7BFBF1195E413EE0CD67CE79DF087C5CBCB090785F5B8AF0009),
    .INIT_22(256'h084CC0604F9F253904A60D59B20800C6E1B1D8EDE02CD8F2B35AE1F3E70CCFF0),
    .INIT_23(256'h34821195EEB0014427E75186EA61E88A0833A8FBE0D1151F2FFF43B3676B581D),
    .INIT_24(256'h4D4196EC4295F3958DFFBDC5FF27E3D733CD0EC21D3707A9AF3FE1F1B2E5FDF0),
    .INIT_25(256'h9A369559AEF7E162F4ECEAB602C0E49F3864B4FABDCBE9FDE911BD5A05BB50B3),
    .INIT_26(256'hE8F2FBD9BB82BBFA20C455A910F2D694F5EBD4B9C301CF7A0515F195E907D3FB),
    .INIT_27(256'h746A350BED8D37C3D9EF00A7BC383775322FBC044011F433DEF3111D05DD5DE9),
    .INIT_28(256'hEABB3351A2201F442EB6B2861855DF32E9BEFA11D652BB36F4101012FEFEFB9B),
    .INIT_29(256'hD21C2500C61E3227F60A6E2E2AC83DF40CE8D0F590F2E542ECECF8F20FF0319A),
    .INIT_2A(256'h0297B00E34C44304F2EA008EA4D0A7190E3FE705753945C307A9F775C3F8F7EE),
    .INIT_2B(256'h46180B3DA4591F36F2FAC8FADB1475C0B804CA488803FAECE24A92EAB1E7F214),
    .INIT_2C(256'hD51C1814EB480021B20455EF24F13EF986DBFDFCB3D3EFC3C3FDF4A7392BF7D7),
    .INIT_2D(256'h65DE5E4D4C417CFAC44A521407F930EBE9E5B0422500C38417DAEAEFDD53F12A),
    .INIT_2E(256'h272907019FCECB07FBDB05CFD90D27F9DE261A531D3E41020A28FE1AF8865240),
    .INIT_2F(256'hF9CB7DF12BDDE3883DD3C9B99F3C9D52B2BA3124393ADCD849EC002008FC43CA),
    .INIT_30(256'h9C00816506D22D5B6A2AF044101CD76E1E457D11BADDF558002748F1EE2D06E1),
    .INIT_31(256'h04B82ED4C4F9DD2D201AD42C3CD93BE7D9CD15BCD327D50729E9E1CFD1ED0FF6),
    .INIT_32(256'h624A19ED2DF20D3534821647FCF2403496A42561CD1A06371D223E5C06FC0FC8),
    .INIT_33(256'h6028372BE2F0224642DC1B265AF0564E01286E143268341B292A673A5F606D36),
    .INIT_34(256'hC94C0DF62AD5182131DEFEDF36DCFB092931EE48554618E7F5FDE3D4BB3FB9EA),
    .INIT_35(256'hF622F73A16CE243C48CA547DC200500E55D27CB829E0FBC72EF51F15A945FB0F),
    .INIT_36(256'h43FA22DA52272EFBEE00CD7B39251FC88A58A54902F8160406560808BBBF6231),
    .INIT_37(256'h20F55B02450A17E851E412AAF2142915C2286DDB33F2271F557D8959E63C6C0C),
    .INIT_38(256'hFDE0450D5801B6052B1FF41046E8F7CCB8E4FABABEE4EAECA8D8DCEAF6AEF227),
    .INIT_39(256'hCBF0C207D20042D4C3D4C1BA40A441CC34CFBDA4E94B7149F5CADD1EE0FCA8DA),
    .INIT_3A(256'h8EEA6004F83BCD1A922012F3113243B8B39B3CD3094BDC1EE3A92E1D0C445513),
    .INIT_3B(256'h034EAC48DAC602EE0C761D3BEC81C935E863F4499FE9CE05D47AA9E0B522AE5C),
    .INIT_3C(256'h0915F2C05EA2F9A3A1C73D17F3C3CDD0D1DD6DD99AC54B666F14CBB9240A70EF),
    .INIT_3D(256'h21D056BBFC9E4FB93341DBA393E92BF4F600D707C439FCD934DAF4E343CCDBE1),
    .INIT_3E(256'h2CF4962844B0C1E71F0D2FE55E3AE54B3CD8EAB90EE70CAE3A9DC8381747F855),
    .INIT_3F(256'h64F43A283B5E17F7FC85E811D48A323BF1C4261A0E4BD6A7F3C31AC0D3E2F6EA),
    .INIT_40(256'h200D82F5FFF6BD1BFBFB19F6E805692FD497C4DB274221E146043FF5B585811C),
    .INIT_41(256'h0320EBF655DD7017358EBBB812EC3431A9F0F589D26F60B0A2390E05111843F9),
    .INIT_42(256'hCB3E0FE40BD740E1420917F7BD7C8C243B317115246227CC0FB8EE2C157F261B),
    .INIT_43(256'hC6F2C0E25AEF9FEC34C14CBAC297F6374FC8FBD33510AADA1FFF2AC25AB4E9AE),
    .INIT_44(256'hBFDBCF14032A13A945151EC9D86F7622BB237FC907B01FEEE4AEE86E333967B2),
    .INIT_45(256'hE99573193601193C7018223610FFD2CD60C12EE87108C885D0466E26D2C51C17),
    .INIT_46(256'hFBFF1876909EE81ABC22AD152F0AC286243811752632B29B2BA2B623BD72E32A),
    .INIT_47(256'h05DAC2A8DDD9A8907F5D253C246F2618F70F0D0FD8E2A0DAD39679A501FC0124),
    .INIT_48(256'h53290A1C3BAFD49B8D772824DAEB1646F00963D20ABF3D1723E6870CC9A8BDB8),
    .INIT_49(256'hF49BD719EA75E1B0398D0F0850EACCA6ED014F62F4FF30D4DF52EA0160B4897F),
    .INIT_4A(256'h37BF1D244A0C2B60075C98EB00DEDCB36503FB253C981CDFCE23D70F0706ECA0),
    .INIT_4B(256'h011BEB69761171D77E2B7EA20E8393D7A521C7464B92614001D216E6E2A2BEF7),
    .INIT_4C(256'h68F9E9951F7690BFA9D269F1F7832D745E16EE8C4F452325F279509F119947E4),
    .INIT_4D(256'hF1F6FBBB162CCCE90AA222D55663B0346D1144D5743168AD9FA4DE5CE377876C),
    .INIT_4E(256'h05421108EE2DDAF467877296BD8522C3D9C14700ECD6DCC7A9656E53AD6F8B49),
    .INIT_4F(256'hE3A9EF2A2916652F1499120461AC9EE728094F0B02A81681E369EC99C0B0E993),
    .INIT_50(256'h5CBCD62182E8F4F3C0624907552240780A35E554D6266555260DF6A127F4DC23),
    .INIT_51(256'hB1F3454BE8EC4EDD60A4517253D4170DAF3E3811EADA136F735972CB49A8EEE7),
    .INIT_52(256'hA4391AD886BB4727EC1C8C4DBEED3A06741B0F96B5202DB3A33CCD90E0534B60),
    .INIT_53(256'h4F0533C850E8919F9FEF4F9BA324094C79417D5F094C05DBA1A61BEB6C6326D2),
    .INIT_54(256'h1C9939487A90955F3EC4CEB52A83284069EED5EF42C5D853B12401C12003D50D),
    .INIT_55(256'h76E9BE41BAD2E2D5ACF62F4D4ACE02CBD7EEDB6E2428CE071C0ECEDBEC12AB7F),
    .INIT_56(256'h834327FFC8310A72771E040BF0A1F5F6C49BDD9DD34277092AD8C33A56E9FC27),
    .INIT_57(256'h50E9F12995D4F82C002F722B910A85FDA103DDC72B4CE200D629B1244126E791),
    .INIT_58(256'h52288E312C0701E760A0AAAEFB6713909185DE290A6083E1F6BC3C70D1C76FBD),
    .INIT_59(256'h1FB4DD572FC17F771F9FFEA6FEB642144A3D97392DA539D326201DA69CCFE7D2),
    .INIT_5A(256'h26CD240623E829F60FF04F47E9EA878A07FC24BE9EBA55EF4C46BA0AD727F9CF),
    .INIT_5B(256'hDFD949431FD7BA15F9AD427F42BA7CA3795F6376D2FFEDD8E2C9073D06D78DFB),
    .INIT_5C(256'hF0A8E921E030F5CF46F088F78ED42CF2A457DDE4D818D7C38038260F967C520B),
    .INIT_5D(256'h79E05153EC0BB97F7821FD65FDFA25A47DA2F03A43B606878C78053ACDE7FD3C),
    .INIT_5E(256'h01671BCFB0E7034855241CF8C1B339015B8AFF2AAA4DCA3188478694A401D0F8),
    .INIT_5F(256'h0914BDF0478CD57AD41506678AE62FDE80D63C35DE1AA64A69D7F8C80A17D62D),
    .INIT_60(256'h32A897C717EA4B93D6957E5B4034EB106584B63B161B81DB583992A8E7470AF7),
    .INIT_61(256'h19C0C7DB5D280A0A4EF42126CA2E31EBBCD5414123141688466E63881C5AEE25),
    .INIT_62(256'hF7F111258048648FF40A484D1B35D4642E650E1000F735605C1315CA478B1449),
    .INIT_63(256'h1F2253B16C4E213B28AFF1760DF727D24504BACFF0A4B0D1464FEB35312AA9AC),
    .INIT_64(256'hB8EA42DFD4CA1EB32E9C9403BEFD63939DE72E10681439DE0A2EDE64B4266A2C),
    .INIT_65(256'h05D0C2F702C17070570C181557E420ECF6F28A8105D7D73769AD4EADA037F318),
    .INIT_66(256'h59DFC38E05985AC264BC4452FC6692FD4ED43B61F43411E5D6FF16E5ADA908D4),
    .INIT_67(256'h5B39F51F280FB77F07E86860FFD4B5F9139E9FDC541F1DFB52C800FCCBF6FDE5),
    .INIT_68(256'h7008007C26CED7000D1F13D11BDA4B3188B93805286CE9294462A8CEA6F22A96),
    .INIT_69(256'h3228C0EAFB3FE6DFFC181E76B8D30A575003C8593134BBAD07B3023CBAE842EA),
    .INIT_6A(256'h0A2E8945A41917F99C8419AE6847B757AE46BA59870FD3578B7212EA9F626974),
    .INIT_6B(256'hF5381F21292E8EE2550A79D71DEED612E6FB4481EA2A19B14108240934D4215E),
    .INIT_6C(256'hC2F1F847CF4EF59711EBBE41BDADABFB4189BDB5740F15E4B6F25B2D6DD748D3),
    .INIT_6D(256'h11532FF93F381B40F60EDC2A04D2C7FFD7A8E6B4BF5DC2DC0DCECFF76C307A70),
    .INIT_6E(256'h356EEF41F8C821FF43FD17274FBA048FF505D69808D4540E736893322306763F),
    .INIT_6F(256'hBBA3C527F6DBC3CD3F11F97711CA151FDC571E14BCCF0030D42A3EDEFA4E1D1A),
    .INIT_70(256'h163BF9DCA8B8AEACF3B64A20445D0F06B2544E39A3D05AB4BB08C6195F1E3A7E),
    .INIT_71(256'h6DDA0DF9C062F56C32F0141027C6401B70B3D05EE0F19FF66BA36CEA9E4102F7),
    .INIT_72(256'h22AF559C7E150E00DE3D024D275038AF0CA6C8DCE5ACDC4BAC2DC70BB5213D83),
    .INIT_73(256'h82F728482E32D4E274D4F14C28F29B8E1104CC25FBE0CA36E93AF9EC9247C42E),
    .INIT_74(256'h64553CEF2AF7A2A72C0A0638B67BC7181DB61A09D66A2CC9CAF6E3332B2897FB),
    .INIT_75(256'h3530E52D493839FEE8A4A3192E93DE1740C4A9D1224BF3575451C4056BD7251F),
    .INIT_76(256'h2DEAF58A9B16F66D0027E215B11CDBEFEE3342293AB4C94EEBE8CCF8D52C1BC6),
    .INIT_77(256'hF343F51E7A2F2C08FE204E703FB49D97C90F45165848193A94AC04321E1CDBF6),
    .INIT_78(256'h0C432A17D6CB8FF40EDBD2BAFF4A06AE25B4EC7E05E5390BC527F125161A0B1E),
    .INIT_79(256'hD78C0C099BD45108BB07DF05E13F3533515A7DDEC6A12204EDF089BB9D6C0AFD),
    .INIT_7A(256'h1F85FE0DEBCBAD0691EECA3AEAA9C203EC4D5649F6BDB8DDFB294DDAA42151E9),
    .INIT_7B(256'h3FD4187D0EB4F6038F6924BD9D3FE442FE622E6CE6DC2E7DF765F61AEA4BDAE9),
    .INIT_7C(256'hF5122CF1685344BD30CC08E4E2ABD8C569282809060A8D071B0FBD57D2E9B0E5),
    .INIT_7D(256'hF395F7676C7573735469C3DB4A03DCF0935DCD42B8CD5CCAC2E5275543443662),
    .INIT_7E(256'h98C13C3E3C2727F2CC9034722A1F29BAD41FE83964BD5D94E0E485C76BABC72D),
    .INIT_7F(256'h029AFBE1930363C4E598FF202E2DDCBAB83D64909B6180D9B2B5E9F3226C164E),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized2
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
    .INIT_05(256'h00D6D07E9D4E521E6E2725D5C6C2537C718DC02577A8DE378DE378DE0781E0B8),
    .INIT_06(256'h1C69AADA0C11230211DBF2C4895756069E22E60FD686483DB7A53502088D5469),
    .INIT_07(256'h36484DF35E0BB42E209E347A56A0927A0EFDA9079CEEBE22F8D469A5CA584A38),
    .INIT_08(256'hB5826D74323ACC223F38E81F0854328D4810589A192F80235C9FCBFA1CF44687),
    .INIT_09(256'h193F1FA97759A0E8CB14150FD4B5EB433B3BAF37C8AE3BE5E897893B9E76A8C5),
    .INIT_0A(256'h3906FBB39A234EA6501915144251A0813283C91C82F7B6A02379037BDE8C8E02),
    .INIT_0B(256'h569B9A6D63F757891D4850EA6F10BB056D022AC884C5615362A8446920B50CBD),
    .INIT_0C(256'hD4BC4D71A49A83A0C40FD57FF8CD8D7F3FB6FE23A714E1B3B56DE6CDA01D20C2),
    .INIT_0D(256'h745A8DB58303F9DF44506AF9FC3E0C0CC24431E86DD205905F9E8B6FF20FCED3),
    .INIT_0E(256'h0AD2251E244B2E129EB714E87EC7E244A06570E78DD6AECF2CE4914A2798A366),
    .INIT_0F(256'hE87B5F9352C03846B409E57542A7429ADDE41FEB6451D35D8BD8E74BC0BE9ECD),
    .INIT_10(256'h6587998B27FE8B7EA968994A1A931FF68F26E8E2021AF2AFFA9A21AAC97D9655),
    .INIT_11(256'h0DE8C4C3AEBA7B714DE7AE9BC9E995509FA01272A698DF087093E792C2680983),
    .INIT_12(256'h23AA624F5416AD3CFC187492FDDB1DC0B175D3970FC5D7981F96D23BF889C42A),
    .INIT_13(256'hAF1C05840AC0A02B4648625D7A685C6DCDAAB455ADE0EDD24394D90C086705C4),
    .INIT_14(256'h0A6ED7B9A512A10C7280CB07D972DA9EA258E8C42BB4BF20270E7949164CF223),
    .INIT_15(256'hB8521EF30B930FFA84DE8382B409AD0136276E516D33900EDD6B697C196878BF),
    .INIT_16(256'hFA23DB2FE6CCEAB536083F96EC58A77A1822CEAF336C7A533B7660D34C38EEC5),
    .INIT_17(256'h5CDFB7670B2508E4D534FB9C73998D72F7A9D160929A2A14B7CD1E99921A97C0),
    .INIT_18(256'hFE8DEA0C90E654229B9B1ABB7C48947873773AD4321D2C12B723D0C867120897),
    .INIT_19(256'h4A7B6A66DA6DAA2C03D4535DBD834F4F4E0FE3F19AA6ECACFAED45DBA01EB61B),
    .INIT_1A(256'hBAEF0428CB17A0A710B2E9AB5A82D912FED06F2B0BC13AAF0435715820B43DD5),
    .INIT_1B(256'h0D5C1AC4534E1D11A76A4BD8EA88CCD2B6C8F5E9A89285B26FB61CBA88283AED),
    .INIT_1C(256'hC19887A3DA01800373DC098E9275DA7AB7AC4350AAA2C2019040BF943E4793E5),
    .INIT_1D(256'hE47285894C8B5F3C95900A9D1C04ECD56CDFF07BE220CC87714E02AB73C55825),
    .INIT_1E(256'h6260A8EF6807842AB8BA93FE3912F8D891213196187414AD6414DDAF20E1231E),
    .INIT_1F(256'h371F530B61FEA3C2DE11B1EC2C33A5BF7073B800CA3DEF92878978D7E7032370),
    .INIT_20(256'h2FB4904FD10D80BB65E4E99C76C5170167BD840C21736B42DD2ED6122302AAF2),
    .INIT_21(256'h1C324521E10440B52EE5BF98014EC976220215BEC9FB816507C91FE5AECD416B),
    .INIT_22(256'h106438150AA178A21900389D03818F87DA55DA025E7116C6FB9622487D614DBB),
    .INIT_23(256'h9E7A600F7018F310C15F17922222E31C64AE3DAC7A071CC261F4B07F4E698BF7),
    .INIT_24(256'hF17097D5277E3501D83DC184C89A3CAE250AF9B909E518699192282F96A202F8),
    .INIT_25(256'h20CA5C0EF83F3E014DA8667FFCE1CBCEFDAC32FB11DA331E94DC137EE3655012),
    .INIT_26(256'h178F339D8D2F191472A3C14EC24ABBED44E8FD59CA818D9D38B783189B2692E9),
    .INIT_27(256'h2F510D12DC23371173C48014246FD339E1B617D5DEBD016BBE82C0CE2E0153EE),
    .INIT_28(256'hC2CF4126596154063C5ECB9E9C6B1C2CADE2061843D9C9CA660CE5C91D3C2C94),
    .INIT_29(256'h4FE11719CF57E5588AD2CD7C1DA96A464A4A8E80BA574752FB640AD5E41709B0),
    .INIT_2A(256'h460BFCE75EE87A662138FCBECCF8EDA816BA64EC23870593AFA67E1A84B0494C),
    .INIT_2B(256'h806F71BFB53F37A78DFCE8576100D6681644230066058E5E0648EA1C43622BB0),
    .INIT_2C(256'hF0D477910E96684D278080C3195EAD020C4837EA0A7E4BEEF5EA17189205D5C7),
    .INIT_2D(256'h546D87AFE17A99D65C38258871848ADD59C7451E93589A2ECB05EBF76AE504D2),
    .INIT_2E(256'h908ED07B3295A8FB7A152D9777D45417CD4AF684020CADFE56E8655F8C981795),
    .INIT_2F(256'h00C45073CD752A34EFB20C4F32EEAE3F8209949A75832543ABD153E23F0B9EDE),
    .INIT_30(256'hE5872978882E47458A678E6CB75BB7BF8E13855E4D885519140333E8B32C2A64),
    .INIT_31(256'h5F8836B6AEEE877CF8A79A207148B997437436726A87375EBCAE3BF4745796F0),
    .INIT_32(256'h8B753DE6617A63C406A7DD17CA690C0F64A38E1D45A9B974B267B39CDFCBFEC0),
    .INIT_33(256'hBC025DBDCD508CCB9EF7B9EA93AC6A32D8FE00EC818981A9F84BAED476B607B0),
    .INIT_34(256'h497BB982FB4EDFAA3E14FA1BFE30117F0C7DCD588842D3295DC5B7A38FE724C1),
    .INIT_35(256'h366DFC95D9F38E249C0069A529B8C3CE45C82B7DEA639C90F4EF1E6C8F07CCED),
    .INIT_36(256'hD6522CE20B200E0CF77889BA645D23DCCAFF7B6FF773B4603CB718D0F6FAEC48),
    .INIT_37(256'h4D63251279B51243A00BB19EB41FD35273C674D6C040A97A3780F2928C66F456),
    .INIT_38(256'hF96E3FDD3D4DAF3485F0F39392BF8CDFE06118DCE83FF0678F19E6036D74608D),
    .INIT_39(256'hE798A0B8CEA1C9310625963BE6990F7358B5E5B34F2E7440C3A784C8B6AFCAF5),
    .INIT_3A(256'h3B767DD458D0D9395C54AEFC618A5BD8EC4ADCF3C72533D1C2D032739EB5DA99),
    .INIT_3B(256'hAF8615A0C7C323FC85E9F329F44F920DC0AF3CD3EE3B8A0B520E1BCEE9356721),
    .INIT_3C(256'h776EE8FEF9475EA53407042A28B77B28A52EAF3886F3A7AB4CE346020D0A626D),
    .INIT_3D(256'h3A35F881AFDF42A41BEC4162C76F1CC276253B721E2C99CABC260E608DB875CC),
    .INIT_3E(256'h05BCC3C5CBDD678C244F9230892A12B4358E7D5A29A1FF908C814A42E19E4734),
    .INIT_3F(256'h90BFCBB9889CEA64D0EECBAF939B273A6DAC485ED86ACBC2C9CC655F5C4EE9D1),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized3
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
    .INITP_02(256'h6EB0D9BA37F225EE0077A40000021080E70C2430E7B492DB492D7E7E7E7E7EB3),
    .INITP_03(256'h565774AF2CDA87D91A9F554F7DA45245D5DF251DA97A8F0826CBC8820972C724),
    .INITP_04(256'h7F93E135F03743ACB45A4C209B2D3ED23CCBFC01C50E492D76638B86D415FA77),
    .INITP_05(256'h077DC1E380116477DF282189D5869317BE78840FD0123A827A8E2BA8C976BD36),
    .INITP_06(256'h479D50E13A85183F2CA4AE7F698FADE0BD1E66BBE4F4466A9BBC7AF74686FEBB),
    .INITP_07(256'h790A4928B9CA58FDF714A073FC64B0E853461082ADD3811A2255995B38F82A13),
    .INITP_08(256'hA8530107258502F8D005E8F7264FBE04B397CDD57C120E988F102FD51AD9A5A8),
    .INITP_09(256'h1943CAFBDD2A3530E068C4B653FC62CBF2A67D39E0C4123A68BBD1BAAC2CE02E),
    .INITP_0A(256'h9DD12DB9FD46DF3ED6F93067E67B904E5D39BA2B4E790D52BF55C2537C816E56),
    .INITP_0B(256'h59C009133585B6FADB4323D998DD730C0447BC074A81DF3498F063A778367D11),
    .INITP_0C(256'hFFFEC75109EA6387EAC7974915BA9518022726869EB855DD62C4B87550CBFFEA),
    .INITP_0D(256'h54F4F08DBE695FC1C032B48EB56DCDA8001B6DF3315610A0D0137FE819DDF787),
    .INITP_0E(256'h8A7DD7A6DA1C9FD6CD95A36DCA25796CFCF033E8CBC9B7E08FB1EB8BD4C5FCEC),
    .INITP_0F(256'h354B61058489A53F31FCA12105F535D5455F645FF95BEB8AC13FEBE9EDA54BAC),
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
    .INIT_17(256'h804178A0D7DF20A74F2FA070819707D862F77A0963C8A645601264D67BB5DF1F),
    .INIT_18(256'h8F70A04FD74FF01787A7C888C9884190F8F9D72F57D048D83000202769F8F788),
    .INIT_19(256'h7797E749A8C8D88758E0A080C8E877D8A80760910781619847E9D8E81977F008),
    .INIT_1A(256'hDF70B06057E03F3657FFB79097A0182FD820E86A2F51083FF038F8D77F57075F),
    .INIT_1B(256'h6F08B027C780A76FCF7F2FA82F5138278130A022B7E948B8E8E8E980879F2F88),
    .INIT_1C(256'h87C787E8D79038B0C70F7FCF7098A710FFF978B7E0A7E0205E1070A7A1A8B028),
    .INIT_1D(256'h707F1E976F373F083890F0B898A897D8208068994708A740306F784098C78F7F),
    .INIT_1E(256'h40C7F788201090CFB027808FEF17B01F981717A7CFBFE7178727D09F68375800),
    .INIT_1F(256'h5F98F0D939289171F7C87FF117B0A038E7B8FF92F099416018B8785AE85807E7),
    .INIT_20(256'hF838A711FF87B7BFE800D8EF0706A0EF27F007D2181801595749185147D9A047),
    .INIT_21(256'h60284F48117F28F76FA7004F0840E7083F9030B180F04938D86158A258E1A8E7),
    .INIT_22(256'h7027979861C7DFBF18F8E0A8600037DF418F36A000B7081F70A0986FFF0777B7),
    .INIT_23(256'h97162F9F176A59CE0027FF18E09658211F5878E2915FF25886D047EA18C85197),
    .INIT_24(256'hF06E8F988FB98270F741175080209718000F2E102681295FE0EE708750E0C727),
    .INIT_25(256'hB8B92198F88E87B8471E78E020E7B8B727D9B91A37F77D80FF26508FAF578077),
    .INIT_26(256'h4F47263EDF7918B77000C8EF78BF60C8FF51B1E92F1717B0AEDFB0B0A7D0B007),
    .INIT_27(256'h3138B607F83171E669A0C72630CEE0477760E890C1484F788FAF59E01F58E037),
    .INIT_28(256'hF8670FAF56597198B19FA76640FF4F0037080627FE6A8167F8677F9740A0976F),
    .INIT_29(256'h807077DF50F12227C6427EC7F70080A8868171D9EFE65FB797667F38C04769A7),
    .INIT_2A(256'h887F9881A8487188C7D1BFFFC0A8882A505078CF694959D08019F7CFD6C120B0),
    .INIT_2B(256'h00B0F850F0706F1895974F3FBF3FCF16F0591838B740FFFF262F4070C0303850),
    .INIT_2C(256'hFFF11F47D8C711B0D861DF6F5EC0C8EF98C0FF5F58C8683127F0E8F82077B747),
    .INIT_2D(256'h7F794600E198EA0130FAB6DF775168A8AF08672726D837680F1F4018DFF180A0),
    .INIT_2E(256'h9138DF1871B9B13117C1E8575FC80711885F1788397932A92F02D6EF60F0FFE9),
    .INIT_2F(256'h06382051FFCF6F6870F02A773FA02FB89F00C7B6E66188184E9050906F79AF1A),
    .INIT_30(256'h3D6ECF68D8C8FF49EFE861506FF9DFA1EE1EC958A7AEA7C197A841C1D67038F1),
    .INIT_31(256'h119866CFD6A9B9A8C7FFB627B8FDFF568951E7762F1A7960C798AE4F815EB739),
    .INIT_32(256'hE5F7A818E897DF276F5F42FF97B0FF26799027FF3FFAE0115FC0464000EDDFB7),
    .INIT_33(256'hBD78E1788F8E3E218709C090DF50AFBFA1605F705E1258F04E69B6DE01E6B0D2),
    .INIT_34(256'h85FFCF90C7BF3FD898E932E73E706F49EE9F480938078EB8EF08090F3729B769),
    .INIT_35(256'hEF00C840401060D071A611609F48A88769B1C698FEB961D868B0D69F719DB0D2),
    .INIT_36(256'h27F7B81FA869A1D0C1E76F3788302F90BF8F305FA018680069C7A05FC0593F31),
    .INIT_37(256'hB12F67B07738B8EACDE277F7FE061760E9211EFFC10030E12D599F7067270738),
    .INIT_38(256'hC7B7682FC918A04871DFE90FF030B0C6791036A0900958E31669FF5087079F4F),
    .INIT_39(256'h16C77858211F2860B096A010AE094147A19867782FE140D24579FF404FD79010),
    .INIT_3A(256'hA607B7B891282928E17F0050AEA14838777E7850B848581FD036A920E071C1E9),
    .INIT_3B(256'h19591868B0D808BFF1E720F8D27DC067B2F99FB8C9D769AA3E92866837508088),
    .INIT_3C(256'h1FDF102F7FC00701114FC708703FF1C7A012802820DF27D8D14F97513896E848),
    .INIT_3D(256'h679F17E848EF6199C60169C785E817A089108E69BA0839808E8FE9AE76286F6F),
    .INIT_3E(256'hEF49B0BF3878BFD7A1B0BF78719E51B70F380799C0B730E00ED851BF6EA077F8),
    .INIT_3F(256'h50104F8F10C008687947DFB011FE320847EF38E879A84889474840906F108FB8),
    .INIT_40(256'h6F9830186779772701B0D85920753836A7605F27972FD0B0014717F8A86621D0),
    .INIT_41(256'h0051F81FA710467A70207097C66831EFA9B827C9E248A1E03DE7A957D551A7F7),
    .INIT_42(256'h20C06068D060569B072948FFC03880A6D841802F9F68CFCAA9715FF7B720607F),
    .INIT_43(256'hD08630E888F9CAB587A810E8C857A8E018B660A758F760F58F30196019CEF7AE),
    .INIT_44(256'hE8085077006FA7727799CF1008C8B9D096F670B89098086F47F1507841EF7089),
    .INIT_45(256'hB021AFB7B79FAE53101A9FC0EF20205007FEB708A9D8818F36B8518F99403F97),
    .INIT_46(256'hE8002828DE606FDB50D92710276FA74787F87047AE3FCE824010E81F2720614F),
    .INIT_47(256'h39297E4F3666609FAFBF91600900D8280FA6907F119720DD5FDFC9D8698E31B6),
    .INIT_48(256'hB731B70FB7C0886737D908E71A467847C1AF0748607F3750F870EF71D068B988),
    .INIT_49(256'h49CFA7623860A7D7E766E14F49F85780A03940F7C9C187D799A8AF67C83000D7),
    .INIT_4A(256'hF05F57EF78503869880F483F009F88177F7631203828AFE1D1CF773F2759B07F),
    .INIT_4B(256'hBF8E21D79638F5E9D0AFF1776059AF4779182FD021D89036F89FFF50C7677D97),
    .INIT_4C(256'hA8E0E71E37D8BF381F3067E0D8D80641C067283841982FCF89579FC0FFE7D0C9),
    .INIT_4D(256'h30F86650AF9F600238476070DDE0DFEEE831F8D067F1D610F091D7D7BF1F9858),
    .INIT_4E(256'h80F0C82F17E8C7873E6688861750D8AEA86DA1D7EAF0012F42C167A050EFFFE0),
    .INIT_4F(256'h47AF88BEB0C00758887097CFA778B817785960F0367937A8D76968682007E7D6),
    .INIT_50(256'h8926E0E17748C797317517B227B907270F575E85B90719606857001E96F7C096),
    .INIT_51(256'h0E26D7075697F7D8AE8877B9A8B86650A7CF3E575F769847A60F4F9078405E9F),
    .INIT_52(256'h4FD09148EED1DEB89E8827FEB83781555870902FB777477161082E6E98CF8910),
    .INIT_53(256'hB887A7177768A0C860012097BF66C09137FF6AC0D60150F0174F8067C9E7B0B2),
    .INIT_54(256'h7EBAEF0658CF700507B57FC7BFEF48186FE7361FEFD8EF209E2790A931D7B7B0),
    .INIT_55(256'hC75027C7E180A758B867BFC8065F37F8990F5701C937D0BEF7B08040890199E0),
    .INIT_56(256'h402950304077FF6A4958DF0E86673147F19691B8D1E070474928D8B769F1B177),
    .INIT_57(256'h5108187188598880B1A0B7C8401FB119DE38F8167D6EAF285086FD48208D97D8),
    .INIT_58(256'h98F0779F9078D8A8EF1757DF4F67B7BF473E6F39F0C8D8905877DF2820980078),
    .INIT_59(256'h2E97279F488EE8799747F6969E58CE76E01F100F80482F40681868F87097A8B5),
    .INIT_5A(256'hF057912FA818F04FA8701EFFB770FF88F8A9DF8131D070D8DE788748D88FE950),
    .INIT_5B(256'hB6777021E7C5987777B876F7B7D868AFF0E957A961E08F07F79FC729599159FE),
    .INIT_5C(256'h1E258FB760A076300840506030802D06BFFFB0D88FF93710A06929BFF8E08077),
    .INIT_5D(256'hFEDDA86ED770FFB00F9940F5B71858E7972F29E0A66F9699E0EF10D6A6903801),
    .INIT_5E(256'hC099C8317F5F20672186E78F77EF719958B9722F07D9CF3E1727F740D83E68F7),
    .INIT_5F(256'h62109790804849AD773997C6125611BF18F7067F40AD08703867E7E82088E0DA),
    .INIT_60(256'h670818F0A727122EE7F9585826BF6749BF983160E1A0F8CF9FF7602049084977),
    .INIT_61(256'hE918802F99C910D7CAB09780ADC0B03830E0F2212999F6F879281E70DEE6D947),
    .INIT_62(256'hDF31F8EF3671A0DF2780CFC746DF0F50B14F68994A70575E806750786167E1F0),
    .INIT_63(256'h16982E3F5EA0D6F0805848B870FFBF07C8C751BE60BA61CE6F4FE96801B8E031),
    .INIT_64(256'h0F973F495E272FC0A1BFB057088EC8C8D73601A899F7D8D67F0808AF18281098),
    .INIT_65(256'hB958AF078699EEE6CF5E31672180D8293177F830285860B7F8C0E788C11FA818),
    .INIT_66(256'h09D62807F5F736513265F83FAF08172046DFF758A618D7F7F8798786E8D7C590),
    .INIT_67(256'h8B5BB36363A383639B8B63AB6B83C3E8B69A27BF3907E7D9E06887A8407EF0D8),
    .INIT_68(256'h002018AFD087C7D0777E18E7D877BFB86757E0A70F4FD838B82727274FD0BF6B),
    .INIT_69(256'hE8F807DF2FA03018D8B02FC8C06F7857403748DEDFB008BF87F7984FDF879F37),
    .INIT_6A(256'hD8A74080C0B0B1FF781868F818007FCFE088D087202980885040001870F02027),
    .INIT_6B(256'h47D757B02098D877384940E12040384017674FAFC8AF3F6F375708E0488FA89F),
    .INIT_6C(256'hB80FA8D73756C8FF671FE8C7078F8FF08FBF2F07D09737F0970FA77FD73F9FF0),
    .INIT_6D(256'hF7071010B09100802077A8904828CF8F17F780D70F679F072F08105FD777F897),
    .INIT_6E(256'hB7E870E6BFA72F77DF4F3F58367877A8C77017BFD7F0CFE05667671007A08F7F),
    .INIT_6F(256'h801F6758485879C8D168A7092837790040EF7887E048C747A7685FA8E0CF47BF),
    .INIT_70(256'h384F9880F0A8713041B81F20C9BFE288405F1F300060C10048C8801058CFC27F),
    .INIT_71(256'h4857B8B81817E949C979A7D8D1475A802F8030B7182F3F2F4F1F58E7A030F0A8),
    .INIT_72(256'hD00F081ECF0F57A0EF9F0F8747EF07DF371780AFF7A7AF40FF378F2FE75FB7A7),
    .INIT_73(256'h2770A028E86F9159E8B857E830570A17E7EF9FCFA008B740DE2FB85887F7A71F),
    .INIT_74(256'hBF58AF172FD04058777FB6277F561E48B7308FCF7778512887975D3800B687E8),
    .INIT_75(256'h30B7D827B8C0BF3EF0BF38F06F28788F3FB070571F2760898F7FDDB0009FC628),
    .INIT_76(256'h8FEF183ED009EF5728B1B8D007E86057B047B0AE01C1F7CF6F2010905738C81F),
    .INIT_77(256'hA737F85E4870B8271F4911D84F88172067D9FFA8DF3061DFB707DE8878F60677),
    .INIT_78(256'h3F205F77176819C8CF1616F86FC666A0DF58571876B7D120C857EE5FA0777686),
    .INIT_79(256'h4FD79826B8907F2E58F888B03F38E8D0DFB00750DFC7316987AE8E7830876FD0),
    .INIT_7A(256'h56CF1F178FF75D8F77B6D818383F27F787DF47E03FE72E47AE56C8503018371F),
    .INIT_7B(256'h28D02FF73727C807506FB53F970787687FC7DFB070F8CFB77FEFA890B0001F88),
    .INIT_7C(256'h3F4850F0A7E8C03F9FE01EA7DF6F68164FB7D02880F0C9A730F89666B7BFA09F),
    .INIT_7D(256'hC828EF28C8F7C01727702DCFAFCF1860EFE89FCF088F6510663FE8B02FF7284E),
    .INIT_7E(256'h77F087CFE02F0630C67698F8E8C83EB8372F27C8F7871EEF67C610408FD7F75E),
    .INIT_7F(256'hE0E7FF276780B006B7C0D69F28F7DFD8AF1FD0C707BF26FF6766D9A0D7314F78),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized4
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
    .INITP_00(256'h975FC4E4A68788B43326FBC50B36D55FDE1FD2760D261D481089906DBDCCD3F5),
    .INITP_01(256'hADDC8F9D35E8172C35BF3D7F7FF5B535E2A589F6DE60044500AA4885C76FF22C),
    .INITP_02(256'h7213A1BEA09FF3BD0435B52A21520256E63E903B9897FFA88759563D14FD1F7E),
    .INITP_03(256'h72D286F44B0A518490ADDE24F20F94D7A3683101B38A37D526E0AF755BAD97B1),
    .INITP_04(256'h85648330B831C443AB1FF6E7EBD2B5741DF0481E677DAD1383F004C2716C803D),
    .INITP_05(256'hE23D8E459265D49CF290FB05CF141D85F2EA1ADC816509ACC74491B5F6AE301B),
    .INITP_06(256'hA70B4B18D7943194A033D6EB4D948B748668AD7FFA9096A78101DF757D1B4902),
    .INITP_07(256'h53D70E0289A28DCF10838CD73CC366E8CE271BAC294206BE626F51C7D775FFFD),
    .INITP_08(256'h26AC494C0A5225C63B5D50AC3EE612271735974E595950375313392054AEC395),
    .INITP_09(256'h9A5585644B5028ADC82C98E920DAF9197DDBA42C8E5C05F461F5F2EBA092C11D),
    .INITP_0A(256'hC592162E11FA9DF7B7DC0B248FC9C36281A524F24660CDDD0B17C2C43345D3F5),
    .INITP_0B(256'hB5C78A6AB24C48EB18A8A288FC23A876926C9C1CEB00ABF25AA1CBCBCC7FFCD6),
    .INITP_0C(256'h8A44AF4FD9281EA1FFBC43776FC8587435C2E1811723C92988090E5D1A14F17C),
    .INITP_0D(256'h7F802504A140945038CFAFD4B5F82EA99A988B8F1730ED8667721EEAD8A2D3B5),
    .INITP_0E(256'h054ABFFB1C46D1A4E1AED6DF545EFC86EF7A7F16C80FBECFCF236D9755F381C9),
    .INITP_0F(256'h3A4FAE7FE399868F0B7717BA4AF329A19CE04D7BD6F0E8DCE8BBB7196DB4F0F7),
    .INIT_00(256'h97FFF79758E7F0FFA768F7E7984FD0BFEF3808F7582F80C7D0478EEF003FB84F),
    .INIT_01(256'h90177096D77FAF08C718E748C0B05FA8871768C8605F01BE9FFFF7F8EFCF185F),
    .INIT_02(256'h4168004F0F8F1FE0872FBFC8506707C05887F0DF6750EFF70F0847A7F8D7D7A0),
    .INIT_03(256'h00D08F57271748703FC808C870680F6F1E577077DF674F3F479817D800174737),
    .INIT_04(256'h971838A746E7D767508F7ECF371F5090579868EFB7B0A7AF18E0F7D8A7DFB7CF),
    .INIT_05(256'h11BF30EFF83038101FB00FE8F75F0F3F3F48B8F05E1F2F5EA7FF17D74757EF58),
    .INIT_06(256'hC9CF57F657E8B74F47EF37477080E8B000982836DFA8070F1680E887B86F709F),
    .INIT_07(256'h4FD75009C85889A839E80E00CF076667601701D718A84F8FB6B71888687F5017),
    .INIT_08(256'h6E362028BF48B07030EF77F7D0005798D786B008E797C12868606E08F70FEF37),
    .INIT_09(256'hE60F07B05797400F4F37FE5FFFC8B7200158B0AF3F3068006F00485677589897),
    .INIT_0A(256'h893F5F2FE8B9978F1FD61F27E8A0D850200028660FD06F07CE17F7369760C86F),
    .INIT_0B(256'hB75718B847D7D0C811171EAF9018BE2859F0873EBFD02817EFAEFF9F2070C877),
    .INIT_0C(256'hD0F708FF68D6A837EF88A878809097B778B8DFEF11DE80477F8960EF885027A7),
    .INIT_0D(256'h4867BFC8C697FFC0A0D6D7C63F07B63F50367F8F7917A01E5781975090C9C968),
    .INIT_0E(256'h28A0C74FFE482FF8400E4F277F976F4F401FF0D0A7FF60B08F4688875827CE00),
    .INIT_0F(256'h4787C75727DF2720C70F288F00A78E4F98AF801779A7AF40DF38E0D0C978385F),
    .INIT_10(256'hF867589710DF30FF5858277800E050AF70C847BE186FF04F877968E8A068AF20),
    .INIT_11(256'hA08F9F6846585000E7D6E76737C7C69778D7FFFFF1A718BF58597F5830701027),
    .INIT_12(256'hF8576858D77F38278F405097C7612F2787A808CF3F8FA817975F672F1F70EF47),
    .INIT_13(256'h47C7682107682739508F7537B71780DFE8D719E7909F08A76790E8F8F0112757),
    .INIT_14(256'h4F37CFB09FD8FF08501F7797D7671758073FD030F0006F38303F3718D09FB961),
    .INIT_15(256'h6FDF8740DFD0EE61E05FCE70DF17083EB090507F767F504F40A81F2E68E05EF0),
    .INIT_16(256'h2010A017FFE71908EF70CF9F2FE807369FDF10509F0601AF77894F566631A7F0),
    .INIT_17(256'h10A7E73036113E5970870D207FBF6856C70F8020D70EB8E7B768E7F7B72077CE),
    .INIT_18(256'h0137C7C70E585828F71086889978974090E7A880A8D7A88707EFE81F2F688F01),
    .INIT_19(256'hDF9170C0197ABF809740B16030FA186138292F273621CF917078F8DE2F27F7B1),
    .INIT_1A(256'hFEA7E90F180010B8573050B80E7947204FE88A96C9B0005607DC01B009205741),
    .INIT_1B(256'hD85F87E1582F319E8F58D79EFF30B6A1500716B70700FE1728F07ED8004F00A1),
    .INIT_1C(256'h873F2E7879B0292FE0C068102920A7D006D74680CF10D8B927A5206F4EBECF9F),
    .INIT_1D(256'h107841785F763828E10138E9001798FF1F48C8B030576E20C73E9997DEA80F8E),
    .INIT_1E(256'h9068E0CFA95AE7B8EF90E2C878B9CFB848F731CF37783707E7BF016038FF5FB7),
    .INIT_1F(256'hC8C880B8A04019A84819BFC1689841D766F6CF82B0100F2EFE3E9FAFF097DF6F),
    .INIT_20(256'h41F70F18A06A8F0047BFE157242111462000E701C8794F9070107811568840A1),
    .INIT_21(256'h0FA0E0002F4780BE60DFFEF770DF1F30C8CF375F3F8FB788F6EF67185586D5AF),
    .INIT_22(256'hD27FEF52E88726094FBFC9300F47B667E7505F60073F98B6D279D60AA747470E),
    .INIT_23(256'hA8E791F7D85F384ED758F1803852F850F807C0C1708DE8FA08CE40872F309F07),
    .INIT_24(256'hA78EC70080BEF0D0703ECF5DD75EAFF76790FEA17D003F20D051B64F9DDE9080),
    .INIT_25(256'h4F2770F11AC8707EEDD7D0F9B8E0C8B14F05E7C9E08E60875FC69906E00F00B6),
    .INIT_26(256'hDE6786B709A03797DEF00020AF1066BFAF60B7573E3FFFDF384F4F667EE0880F),
    .INIT_27(256'h30BE85E146053901C88A1F158FAF30A0D7D0B830BF18177088A7B741E917C1C0),
    .INIT_28(256'hE148AE2E60C12F16C0492F1849089700C86931B03161AFA0E0F14801B008A8A8),
    .INIT_29(256'hC987D9B11178AF5F8F28E8A90028171F415F49D82F87587E102127713AA6D8B7),
    .INIT_2A(256'hB270DAC8D7B8165A40FD377180CE38CEB6F026506DF6B868A63727A6F66D3F00),
    .INIT_2B(256'h08A0813E87975EC7362E58F2D957682E40E7D0314FD67EF61F6E577052B59088),
    .INIT_2C(256'h1869892000C0D7DF97707870F7EEE778C73EFE78E63E8F28F1D7F624CE256FA1),
    .INIT_2D(256'hBE98918F4FD9D700605EA0EF11DF227FDD9067260FD7B028FEEFBEBF6E36A038),
    .INIT_2E(256'hBF007610B797677781D1774868286727180830680AF1F08A97F76AFFAF092029),
    .INIT_2F(256'h2FF81F681F7E876F273E879ED5FE4FFF17B0F0B0204737D8C07F398F4197602F),
    .INIT_30(256'h68A810FFC82710804928700FD9F93890504F49D90298378EA1194029501A6680),
    .INIT_31(256'h07F121CFBF408759D0A94041F728F71EEF4198E696282F365F51578FE62E6FC0),
    .INIT_32(256'h9848179740691871505839F881B0384F506188300919666FC7073818E86AB957),
    .INIT_33(256'h8727582F4909C09E7E50613939A23F36676068AF07D1314EAF81E071400150F0),
    .INIT_34(256'h87190017C9D128986FB8515F3FBF61F88E508E2FD61710AAC8685F56146EDF7E),
    .INIT_35(256'h4150DF609A01B7200008E1E1F9C706E89F28E64E17C87080B848E77F7FC77F77),
    .INIT_36(256'hE8C74190B717E77FF1A7A89F297EA098E84730F018D8FFA87666A16778583700),
    .INIT_37(256'hE061F710A7A0CFE230128FFEAF48E0C7964FD68F46D75728387F4F965C9FB7B7),
    .INIT_38(256'h7777786EE768C017C8DF4FF95FA7FE3A13C3637BABCB63ABD3ABC38BAB53CB48),
    .INIT_39(256'h3DC81F0E71C7F76147A620570E60EF605859D1E688A78808D586EFC7084FD020),
    .INIT_3A(256'h67EFF6B18FAF6918AAC8465878304178E7C8B7C85FF888709F48C7805751C787),
    .INIT_3B(256'h9819995830489067355828E1683F9F56A0B8C770109160271960C9E85707975E),
    .INIT_3C(256'h6F4650B7964E86705E27BF1E5057FE6FCFD13E67C77F891FB010A7402E696761),
    .INIT_3D(256'hB6677746A89187EF67D057E9E809A1673030F72D606E50A83FA838287798C0AF),
    .INIT_3E(256'h80300F7776CEF01F2169F5689FA0681FA937782FA819206F213841FE6F6EE8B8),
    .INIT_3F(256'h47391008F60883494E474FCA01102F28DF997FC73E4669B207068E4F37C75FB8),
    .INIT_40(256'h72A7151759C9269649AF7ABF4F80A81999B8706648E0EF58B25E71EE41DE7FE6),
    .INIT_41(256'hB09FC0C881B8D8E807E857E000D1A7B0020F16963769555E61891A97C73FDF59),
    .INIT_42(256'h676000B0EF9F99B08EA7A6B0471F5820981EFF6768187FEEC7DE49400F7E60B0),
    .INIT_43(256'h27E0F811889F2FD72F5FD59FF0DED6C7E870C7079F00990867E7801750B14776),
    .INIT_44(256'h36169FD1BF80F75A898E8DB9FE28E8B1E9DDB520A1D8175FC280E90E30E63917),
    .INIT_45(256'hF75FF0B03007BAB9B127EF471DA647FFF697C8FF7677E93030B617D230B9EEC0),
    .INIT_46(256'hA9BE9869515996350657517E802F0170B90750F7998195BF1F4F2F8F187E0F88),
    .INIT_47(256'h7F2110E0C029FF293120DD2B686F673E2A9FAD565121A67F90CFD06869EDF070),
    .INIT_48(256'hBEF8784F4EBFF10248F7FE99B7410FF7714FC626FF291EDD6E2E010ED92F77EF),
    .INIT_49(256'h5EEEE16F90D79168E7392D415E2F7F40A809E0AE66977F1A78A858F2AE189000),
    .INIT_4A(256'hE099B09726470FDF2DF84FB95806205669CE3E47D006355590E17001989E2050),
    .INIT_4B(256'h9E793910B9970AF188A85559D97E48F878BF1717CFE11EB70777DDAA51C040A2),
    .INIT_4C(256'h473F7F1F5FD78FD8B6F05F4FD63077E0D6CFAF8FD0E60FB098B029A6BE692E88),
    .INIT_4D(256'h20F8D0C7B8417078860925C9689640C88967BFD63730E7E987E0E28E1EA76710),
    .INIT_4E(256'hBFF8785F88E108A8DF075CCA49007788663F99DEEE80D96175B7D8C0E82758A0),
    .INIT_4F(256'h16F879F8A7B138D9188F1581397F5697700F60507F10E711F718FEB1E6680EA1),
    .INIT_50(256'h60EF288080DE2F07D8DF8756E0A0A1CE0EF6B02866A7E8E036DE80A97591C071),
    .INIT_51(256'h410071D9115F58219757889797B8167F279A72019F58505148D8C6186890F81F),
    .INIT_52(256'hE1202F4E570AFA77368DAF1E3EF8FE92F77FCFD63EF9225066E0376E51AF8EBE),
    .INIT_53(256'hF8E1C88110964D48CFEE97FF78F86140773F86B008026A2807FF59DE38CE373F),
    .INIT_54(256'h48A002A167C87D106F2015E0DFEFD88A89085660A07801DF2CFEA9E89F87BFC6),
    .INIT_55(256'hF7F23A4118CF18D7D849A74F1009AE8E5E47A0D1794846A7F050853147C021B8),
    .INIT_56(256'hF60F68CF31F04F2108C109773F676902A7EFB7589EE8C1EF25260010E78606AF),
    .INIT_57(256'hD18F1FEEAAE8B8CF5E87FEB84ECE9FE8D85E00A7A1E82F37A8D99EF686DE39AF),
    .INIT_58(256'h51F0B8876E38400DC0A820B957F2F699676647671D00429615E5A0B281F21615),
    .INIT_59(256'hD560FFE169C170D008AFBE78000F7FC7866E1FF0CFE8497FD76F9F0A72E0CE7A),
    .INIT_5A(256'h60FE50F977CF57B1811FBF57465ED8D2A71FF1E86E6700E057DFF9794131C006),
    .INIT_5B(256'h3887006990B88F20F8A1B9015DADF98758A96866A04EFFC9A948DF078EAE1FD7),
    .INIT_5C(256'hD14E3F6FA047C71608175EBE99F6984AA899915075902B27BD6DD7E06AE17FBD),
    .INIT_5D(256'hBF5078A0E937A89598113198FED0E66F98A79061A1409F6F876FB800A7CFCF70),
    .INIT_5E(256'h5FC75A3FEE7EFAC076EE172146685E223F19B2D7172F61472FA8F7485E6A5E47),
    .INIT_5F(256'hB736EE5F5880A1E04957984E023668600ED9907F9EB62B71EEDECF90CEB0FFD0),
    .INIT_60(256'hDF27782FE84196B79731D1CD8ACF06B006DF2157F7570B212E20F7C8472AF8D1),
    .INIT_61(256'hB8F757A19F86492FD161B821E0305E4900CF18E812BFB665DEF701213806A078),
    .INIT_62(256'hF6382AA628CEC818574916C1191747629FA018F6D01F0A102DC6F01A4F5FF5D8),
    .INIT_63(256'hA7AD3FEF5127DF0EB081D66151B7771F7E661F1E9980D097871F0641B28F178E),
    .INIT_64(256'h0928A7AF0606B9680710D8DE67C9E781D03ED84E95B140561F3ECF6D76C800D0),
    .INIT_65(256'hB82FB120C1D073087691758A87887840F929C00F306EA8D0406600E0CFD10F07),
    .INIT_66(256'h3F46689F28875230EFB8E57F525EED506040497EC628E1F811564950A8C71FF7),
    .INIT_67(256'h2015400708BF384EA618EEEA32B8DEE07ED83FBF00F0CB10CEB148C23A3F80F1),
    .INIT_68(256'h763FD7780E60E0A0482E471048FE3E88F067D8DFDF2E2940CF16CA1EB7E8F80E),
    .INIT_69(256'h1F38F0E1077F0FC28FC716C807DF1162505869B078710F3F919727B8E637D129),
    .INIT_6A(256'h3FF990C661B0C937208660B78E6E18B7D8304FA74FB1905F59F9DE761E9FC262),
    .INIT_6B(256'hD297CF5FB0F800F72F805FD0AEDFFF57FFDE17D131B7498FD090B171E126F8BF),
    .INIT_6C(256'h5020276981E83EA7CE8F972708E768AE6648A838557FC1C77870C95FF0E98F38),
    .INIT_6D(256'h509120F0A0C71748586756E0874000B7DF30363EC9D06E153F4919A767B93708),
    .INIT_6E(256'h1E0F1159B0B871E6BED6D6B7EFE82105D89FC008D77A5F70CFC8A16F5820BFD6),
    .INIT_6F(256'h5048307E1FAF4016D0DF08AF314FEFAE07C227113DC1213773F2471EBE41C020),
    .INIT_70(256'h81877E2E1F36971F31410178270041695A797776D8E9F8D0C1F870A9DF779FF6),
    .INIT_71(256'h0F70DFF8464740E1D0E880AEF6975881CEF8FE8780979FA738A905505E885197),
    .INIT_72(256'h7E01B7B847E848EE48518067A7FF887F1888B8A8FEB65898CF46106FC940CD47),
    .INIT_73(256'h4F562A9FF1B8D10D6F673EC8C7897F5F98CF075807A07F58D02EFEE7A032373E),
    .INIT_74(256'h1F07E8F778966060BFD7AF89B0B0805FAE8EC95E474EB8A93E90F068DF3780B6),
    .INIT_75(256'h182EE9E0B0F0C0410FAF5EE0B7D08F7748171FC9385766F91E787FB13E887778),
    .INIT_76(256'hA6D0CF2086160E50BE67616F0780E608465037BFB0268868D030575777607F65),
    .INIT_77(256'hA9E7A098D1F01037C74810BF67210147EEEFE796D7C88887F8E01F69779838F7),
    .INIT_78(256'h6149A838CF0908061BBFE796DE38D228BE06309FF731C8A89D5B6E577816BF00),
    .INIT_79(256'h47688FB7B7A09F8ED22050CFC089A07140800FA0EEAF6F0F588840A6EF3961FE),
    .INIT_7A(256'h203E48F10F7FBEB756E1A80F88A84039AF29D0E09757B05F407890D887C05957),
    .INIT_7B(256'hE899B96FD7C937399ED0F010A8F1D778771F18167F37B028E8C6568807B898B1),
    .INIT_7C(256'hE7BEE77F07B1D74227E7782827D2501FC0B8811180189727D0801E1878F08895),
    .INIT_7D(256'hCE495EFAA63FA0B0EF8F8778E04855877FCF608EB987A9670700F080E08907E9),
    .INIT_7E(256'h6718A027D8CEF9BFA8E12E0878DF508E37E6885F9190EE8F41672FAF88EE1EE8),
    .INIT_7F(256'hB88139D09849B0754022866F46FFF207EF07402730B176873F780FDE38277089),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized5
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
    .INITP_00(256'h8B6A9541EF86CCCDE431E81EDC980E20A5C8CFF0FD0483641AC47F88141F0626),
    .INITP_01(256'hA682D2E908E4834C198367C48604AF85638009481D282E7FF6F99F86CAD287DE),
    .INITP_02(256'h16469400FB44B46DD586E92D7002FA962343E2BE3F07E5AC7240D19D99EA4AB7),
    .INITP_03(256'hD51C0FCA40CA21C300F7F396DB001F40C66721662ED62DE129E1866927FA5B54),
    .INITP_04(256'h047CF5CDA06FA1A1D8CCEFBCB5617560F2A4467A60E391F31042AF1993EA42B2),
    .INITP_05(256'h00084400613015B37E4C4C0C1347DDE0883888C0C0A1E142557C5343FBFBF461),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hAF9F30A804F1110821BFF0583A1AB7FF4776A8B91E207FD8E6D7AFEED756B6C8),
    .INIT_01(256'h76FF1191264778884DC737C6DFF1E8B88F17112D49A9E8FECF57A83E81EE97B7),
    .INIT_02(256'h1011C8A9E75970CFB052377FBEAF6A5746771F871F61C0286FF169B0F81798D8),
    .INIT_03(256'h27E8A886D910282E2E3917F08997B8D078B1FFE7C8E150B8D0D83F0047EF0137),
    .INIT_04(256'hE80FAF50F728C6D1F0801F9838F8E8358F69BF4E70FF885891192FB697A088DE),
    .INIT_05(256'h303E586EA001B030969FDF087718C77088D8FF17DFB8AF403050608F578E67F1),
    .INIT_06(256'h0808874EB121E0801EF5F1E85058D74010D8B717D0C7C0693259401F40113739),
    .INIT_07(256'h2878D8911EC9FFA18FD79EB790B1072FE6F1C71881D73867C7CE4EB5B0ED2040),
    .INIT_08(256'h9000E72EC12E91968888710007E84F22F9C759D9A7B2F7F87FDF6660E00638E0),
    .INIT_09(256'hA915C54AD8B0F8B861B2902878A10776089EC0300F1FD92FFF29404650B028B6),
    .INIT_0A(256'hDF9F3756C9CF877F80FF914119CF3648F81FFF6F00179FA8477FDF08807FBE47),
    .INIT_0B(256'hC84978C017C83140A137F8B9CFC8F79039B7B09710CF5F009FD7C84978502808),
    .INIT_0C(256'hEE2E18CFC0895756DCA8B7E79AD2AF81E2A407A2F8581FFA97B20818FE995EB9),
    .INIT_0D(256'h87EE48DF713E8E96ED78987A37C7B7D030D65F37D0C40FA1894F3E02B687EF9E),
    .INIT_0E(256'hB6571059D0C01560E620FE77C248B84FF73777A81F4D9D80B131F6015E10B679),
    .INIT_0F(256'hE0300FE8B06F5F10682FB1DF773106DF8F70377F91D71052088080191F7F704E),
    .INIT_10(256'h30BF9F21C75F08F89FA8AF49610800B0BFD0D08D3EFF4E30C846A74990065948),
    .INIT_11(256'h389000066648B0F15F9F67984F184709512658265FBFA0A066B076D8B7E83017),
    .INIT_12(256'h185849E13E5FBF455F1FC6EF9811C198D887D74FFFEE57E64F56A787066799F1),
    .INIT_13(256'hA746A0A0386F1E584EC9462AB93A0677BEF18627EE2FF7768FD766B820A7317F),
    .INIT_14(256'hA04780B70800F7E190A097C9998F203F6E8FAEE60A5EE691384F798A9F77CED8),
    .INIT_15(256'hF7992826C8DECF470797A037478611C8989F270E377E9737776EAF90FF7800E7),
    .INIT_16(256'hA7D8B710580030184869FF189001BFFEF726081FEB05AEF95E38083A964F3E5F),
    .INIT_17(256'hB0BF8F78E8A71768470187DF46207EFF07480FEE2E58CFD05FBFC71848C7A948),
    .INIT_18(256'hEE2F37106886DFC7E8BEC06F60DFDF20A901CAA8C790A670A9C065D9605EAFB1),
    .INIT_19(256'h7158DB9E26C1482F971F965EF148D8F757B6E672E9C100D05031A0B89030C61F),
    .INIT_1A(256'h98F80F67C9C021582807F089789907364F09A0C0098888B758E86957A880E9B7),
    .INIT_1B(256'h779707D9A078B88A2A4149E0A9F92078781FB878885FA72F1EBF8860867087B8),
    .INIT_1C(256'hCF29E741AAA8511097D711F038CEA7850E27F8908F10CED0A7E6A62FFAB0582E),
    .INIT_1D(256'h11F7DFA1A0917F70F8A1C79071B9112787A8F828482EA7D85F5F9FB72E08A718),
    .INIT_1E(256'h2FA087A149B08E9099989F715E1791E747971F3F17B0276E56FE46FE5FD7794F),
    .INIT_1F(256'h40C7805E2F4847A76F76B71717BF3F716027471F09F0506F697090A9CFD096DF),
    .INIT_20(256'hEF673096E0089FBF10D0F7FF1F866F88B7D0DFD66286B0585870D0E109083F47),
    .INIT_21(256'h60F76FEF7148F95098F06960409E275FE697C8FF776F6057C747B11FD8A1D757),
    .INIT_22(256'h17603F60B9D188AF997F992039FE987FA0D872265F5926FFC707BEDF4FD8D7E8),
    .INIT_23(256'h27DF0C1859806FF7BF0129D04928381FC86FCF58317087D098101860FFEFBE6E),
    .INIT_24(256'h49D0F7D020C01F58E1283FB0E8C9006658989828463A9F81E8B625081A0798E8),
    .INIT_25(256'h51373FC1572FE17969810F503E3FB75837A787671F382798A69F2E08D768E737),
    .INIT_26(256'h6025A7F1E717470FC749675787CA87EEA6966047379ECFBED697419898E7E7B0),
    .INIT_27(256'h8DC828C5C608A8D0384478D8BABF7B20AE41401E077F9FF0A9068881C9A020D0),
    .INIT_28(256'hE0673E3898AFF90857DF18773738EF5888A618F74E35E630A718F6910871980E),
    .INIT_29(256'h9676DFE8BFBFA87E48B888D8FE0ED790E0496160F808C167E910C1417191E377),
    .INIT_2A(256'h271659CF388818382740EEDFB837A0267070C068C03005E8E920D88688B1D09F),
    .INIT_2B(256'hC8D0464070682018D0DFC8D8F836C86867A98E48C7E057D88088B02847A80F9F),
    .INIT_2C(256'h2F7E96487050F8E8C856C63DA80EDE176E18199120280458A07609B5BE305E98),
    .INIT_2D(256'h419E4051CE4D50E8572FF4478E868EB8D00FBFE770F9E8AF87DFE847588DDF11),
    .INIT_2E(256'hB7B7D71EE1F87748BE8EE626F0BF98B09EDF75FFDE7E979650717F28D0CD6827),
    .INIT_2F(256'h000000000000000000000000289306401FF7F00EE8F018409077B090E760B656),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized6
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
    .INITP_02(256'h239BA07BCD38CBD4662BD3AC6358C6358772DB4EE18F6F18F6F1A5A5A5A5A5D2),
    .INITP_03(256'h1D8061C665707E1ADFD75285E0FF292A20D31A60841A920438858A0CE9776532),
    .INITP_04(256'h47ABEC47B72D885DC04FE048359825A2AF83B1704D5C6FCB0DFEA445F79E41D7),
    .INITP_05(256'h084D389C8011CB72CD1BF80CCB978804748FBCCD8E618B34C98FEC6E550A2586),
    .INITP_06(256'hC12DD16206DA029C08D10731A871A8C6A8411430124511A305A98021A8DBA845),
    .INITP_07(256'h4305AFF002009569BF71F170126A0E0C0305E91232521040229FEDF8318BDD61),
    .INITP_08(256'h83F099C2C2CBA7EBD26E9840EC7BBD10B8A0A8404F6AF05AC2E9A97A06C010C1),
    .INITP_09(256'h2D50DDE84C7E54458967D08D58B1778B7A6BFA386031CECEB0886900E9B80686),
    .INITP_0A(256'h160EE3F9C996062D88BC344D633EA6FBCFF246F9467EF9589071BE980A0EFC1C),
    .INITP_0B(256'h294C2ABFB51521095D66FF43CE9E1729CBE49318CC2ABB4BCB1E1773A3726D05),
    .INITP_0C(256'hFFFFC2A66FABF7FAFE1815967D4A1500F7FE4E1884307F80194516114046B72B),
    .INITP_0D(256'hF301795D4D7DDDF4B193D6FFFEFFC57E15178FEE910080102023E7FF6E7E2FF7),
    .INITP_0E(256'hB6E1DB9CA3E096E0B3E55353DBDDFF9C53006D5D5DFDDFFC320189FC3200B301),
    .INITP_0F(256'hDAF3DF8775D67FD00B623BD49BE2DAB24AA3B7151FD31FD122C3EF9DFFDFFF9E),
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
    .INIT_17(256'h5C6FBBDC0B13EFF0F70C1BBFD03CBD456A7D2BD65FAD2BE87241AB97EECFB3D0),
    .INIT_18(256'hA0E0B468FB306B730CFFE3D308D488F82BD3D49418F35B9F502CEBCC383BDC40),
    .INIT_19(256'h2C3CEFECC0635750F81F58F807FC77C3FB18702CB8149C1C442C6CFCE8F03B48),
    .INIT_1A(256'hEB3413B09BF01013045B1FDBB76C8C7CF33C749C2C83D4144858542C0768B418),
    .INIT_1B(256'h038FC813205B0053BFD738B33B5FF4A83844BFF0A00BA07418DCC49F8F10781B),
    .INIT_1C(256'h94D3DB1F2F138433C7B0B77C9C8BF4FC236BA053B09083F8483BD414A827A81F),
    .INIT_1D(256'hFCB04C23AB84CB68C7AF70F36BFBC0AF28FF2CAF1C7FD828D80B64AC37A31BE3),
    .INIT_1E(256'h0CE8D3784F4B83777B6BA0EF5338903433F8B41CBBFFCB1F03370CD78B43E444),
    .INIT_1F(256'h2B1F5CA710F3902098030C9BC8B7A36F6FDBB84B704BBC2CE47C60D8DF0FFF4B),
    .INIT_20(256'hEF90CC001BBFD3F7AF505457C0DBDC376FEB7C7F7428303CF4684C1C2403F3EF),
    .INIT_21(256'h4C145753A0537FD3B4D3A8B4C4C3C33FFFA8E15BE0A470DB0B6C48B8AC2B13D8),
    .INIT_22(256'h07883C64D82F3FFB58CF3CBCCFBB2C0004FF8CA8ABA4C4DFEC975308E773D0CB),
    .INIT_23(256'hA468A438F781D9E4C79C430847C86FC79B68A8E7FC4724142498B8348470671B),
    .INIT_24(256'h7708CCDC33C110EF8B190FDCA37308CC687CD88013C544B4E71CD85B10C35F88),
    .INIT_25(256'h8BB4037F147304B0306B3087F45FE0A384B3D0EC1F376074C4C47B10A0040CB8),
    .INIT_26(256'hAB1334D88851D5942BB5F36BB70B1B232C400817AC146C5B8087A7F864E34080),
    .INIT_27(256'h30AF1048CF75F873EFB9B01390437B7B2CD0A757A8E8347F182BBB6F0CF3AC00),
    .INIT_28(256'h3BCB28A8836931DF67D0035FC8DB9BB43F7CD8701FB951A7F7B503633C07B3FC),
    .INIT_29(256'hFCBF67FBFB441474C73D4017C760BF9B64B0FB6393E328673C702B60BC90F440),
    .INIT_2A(256'hE73FE41BF3D0CC4C7B60EC1F378837C8A408F37FCF0CC0E4075D7CBF6F140B3B),
    .INIT_2B(256'h13F8DBD30F9B876495CB6F70FCECCC48E721FCC884EF88977100D0C460575CCF),
    .INIT_2C(256'h67EBC3C8E344B060EBB964F4843377E4CB0C5B07B820C75B2D3717AF18776810),
    .INIT_2D(256'hB7EFBBACD6FC0730002008E3EBCC90DC67C0ABACC44CD0433590348C5897200B),
    .INIT_2E(256'h6B00DFEC3BA8441C7C6C348708F8008F80D3779CBFACA89444C8E0EF60D7AB4F),
    .INIT_2F(256'h183054A04F6CBB485C17AC7BEF531C3B2F08BF97EC440C7FF1DB77F4EC6B342F),
    .INIT_30(256'hA027F48CBF3B6F20EFA8B4DC9C4BE398CB44DB53EB58CF9C0F9C803F839C6CDF),
    .INIT_31(256'h5B1C10579F8427AFE3D87314F873ABE7C7637F3FA72DBB18177FA3204C4B8BE4),
    .INIT_32(256'h17234704075800280878484760BF80C86303C4E49C3793FCCC4BCB5020D3EFEB),
    .INIT_33(256'hFBC09767B7304C2C54A4D8E3632763FB833BABECDCA46B0F5FA037FC448B5B2B),
    .INIT_34(256'hF8A7DF749748D4383BB408DF1B3F88F49FD4BC905F543070FF6C68309464C048),
    .INIT_35(256'hA0AC6F5497C8340847EFDF70206B107B6BA41350AFE8EBFF28D383A454276BD7),
    .INIT_36(256'h08675F431B986474BF4BB4F4B474FC1370A424973790E0709817DB63FFBF57C3),
    .INIT_37(256'hC778E8385F2F27DF17205C1BAFE73C308728B8AB1744DBE31FFCE018201FF44B),
    .INIT_38(256'hB8C8EFE34B3C1CF0A70F67E7AF74BC14BB30E8CCBBF80FA328F4780300035B60),
    .INIT_39(256'h59ECEF781C907824DC531413C4CBB490C7AC2C0FDBFF679F9C884CB3D4770F7F),
    .INIT_3A(256'h3C78EFDF3398EC8407E704034050B76774C818B810A41C4C3CD040EF2B581B2F),
    .INIT_3B(256'h888B05A35388E7AF3F5F5B1734DFC3A933A8302B831B4B0B0F181CB4006FFB7B),
    .INIT_3C(256'hD88FC0FF8F07504438E0EB84E057F0345FFC000F04EC3C630BC0BF9498AF54B0),
    .INIT_3D(256'hAF13B89B9CE3C34B30C0DC607B8F70B86BCC40E0D32C104834BBE4E4B758788B),
    .INIT_3E(256'hC7F85C67C3E04467033B6F973C1FFC141C18109FDBB370C4B47BA804EF0334DB),
    .INIT_3F(256'h4804046F63109CD71FDC6BDF24BFC4EC3053DC2827F3EC9FFC1CE8E897C47428),
    .INIT_40(256'h14BC343F5FD0C364A3FC53A7082F186B136C8CF097581F27C7E87B6F240FC0DC),
    .INIT_41(256'h80D9FCCC674F739FE0D4B853587818E447483818338337FBB00FBCC8E78FC0CB),
    .INIT_42(256'h0868EC17DB6390D46CD09033B400CC24C4950C14074F0F8C209C44DF6828C808),
    .INIT_43(256'hC63B4BAB981C8327F724C878D75387F7876A3F0390A4B0371BA09C30AB2FEF0B),
    .INIT_44(256'hBC9D1480ECC73F901CF7FCF4E46BFF47CF7783EFC7C864E0230858D4D37B70CC),
    .INIT_45(256'h9C9474179B5BAB240CACB02C10ECBCDB9B2AFF98373070305FE73F4C3B479323),
    .INIT_46(256'hACF5A4C40F17E407EC8C4C185C43F0FBF80C085C17EC7FBCE8787B2B9C3864FC),
    .INIT_47(256'h8B9C1810733024FFD4C303534C8067AB974FCFBB9CA05CFBC7B09824FB531B0F),
    .INIT_48(256'hBF709B149B1307B8AC0BEFB7C8332C306F332FA830E0FD10D820A4D02FE76F3B),
    .INIT_49(256'hE80F73B878D4BF38FF1C3480AF203BDF67B89B3C8434C0FBB87988D84784A807),
    .INIT_4A(256'h5F4B7F74606410083B30FCE86C7754B8786450BFE4C8A7A0E9E7177BD3CCD884),
    .INIT_4B(256'h58FCB7BBCF6043687B74B8607824CB14C3EC373FA3AF402737BCC3EB0737A46F),
    .INIT_4C(256'h4CDF13F4E4AC1F0BC3B0CBFF13134C3958A71CE070A3406CBF5541A4CF84C777),
    .INIT_4D(256'hAF9F7F7C545B87C86464CFC8BFDC3BE297F06CA72C47C434C2081B0FF0B85754),
    .INIT_4E(256'h6B84B394CFE33827406053F8DBB01B89548412781C37A04F58B120743C57A334),
    .INIT_4F(256'h4030A03FCBAC549F40F77C8C0C084C2F8FDC103FAF9C4F5CB3EF7733BF546804),
    .INIT_50(256'h70634B07732B547C7854145CD044B234645CCB9F2FCC505830C4142FA7FE0840),
    .INIT_51(256'h9B3327477F3C277B078F7743686760CFAB77D05BBCAC437B3773378368103343),
    .INIT_52(256'h24B7CF8CC2DF6F037394FC6AC8B438EA6F89DB20532F4083CBBC201C9B070B0B),
    .INIT_53(256'hF85B034F2FFBEBF758746B6F4347A7EFCFD30B1F5F9C84CB24FF829FC8C768BB),
    .INIT_54(256'h0CDF8B441C166F5C34BFFFF77FB34F9F0CDFD03703C0682C9B9438571807FFC8),
    .INIT_55(256'h8FA384EB678F3724CF28664B58D44FE727B07B6C50AC6813C4A02C5CE0DB0C7F),
    .INIT_56(256'h707C7743C72B7B67A44FACCCF0FFA01C7B4B3C675F77F0437034CFBF87AB33A4),
    .INIT_57(256'hC7DCB434347CDB346CB3005824504C0F1C27D7107F3B5CF7C7597F8393B7E488),
    .INIT_58(256'h7B6AC4EF7F3C48F8E3D86BD378B7884C23ACABAFB3F31CDBE453AC04EC5CB09F),
    .INIT_59(256'h8B087003A81F8490C6083767CF9C0338473703602C74E74B87805FFC43B7C4BF),
    .INIT_5A(256'hB7CB63F4ABA8544F5B50E437E404AF37D3EBD358B377CB2FEFF05B703B07EC1C),
    .INIT_5B(256'h5CB73B20C04AA30413906B537B9ADE8F7B5C5B3C00C7F0B4E02C5CE080987773),
    .INIT_5C(256'h93C8807BDFDB6454802708DC148BBB9707170FDF33C06BAF1C23DC1FEF2B8470),
    .INIT_5D(256'h97572BCCC7980F5B7424C01463636863ED681FA7804C8FBC1B9330B72F8C504B),
    .INIT_5E(256'h2B21FBF46CB3309C6C9C4110DCCC20670098F807B8473BF07D28A76360207CE0),
    .INIT_5F(256'h2B8FEDF827A047B6A73C3B0881B3287C1388DC60338CF42F48045CCF546B8367),
    .INIT_60(256'h4ECC6847488873448FD75030283CFEB76B6FBBE49B75CFF37F8B7430B49CF8BC),
    .INIT_61(256'hB8480FB4D44F7F7444F30C6898E7ACFC53882B7743D4634040C4B0AF5C3B0C20),
    .INIT_62(256'hAED4982E00737B9CACF7CFEF97609D68AC7BB0FBB88BFC88FB9B14B4A32B1C17),
    .INIT_63(256'hD4F030CF04DBF7F06314B0B7A0FBF3FC3C6C2768C0B8CB4C284810D8D428F87F),
    .INIT_64(256'hA4F45CFBD8A3648FA8B3EF3B7B44774CA33814C8302353B7BC5C841B27B03032),
    .INIT_65(256'hA2FCEC9CB7A87F23433459BC68B34393183C53745047704B080F98A53B80934B),
    .INIT_66(256'h3C6854E8C3AABCD8ECC3D3348FF4C38FC8F7C3DC23C46AB3A78F40DFF3273B2B),
    .INIT_67(256'hC5C9D9C9B9A9BDC5C999C1ADB9E5C9BBCF284468006BEB2F38435C5428F8DB17),
    .INIT_68(256'h10B08C4BBF98731B0B9BA4A7A363E8131F23D313FCDBE6F7EB7CE0D4249FB3C9),
    .INIT_69(256'h6333E037804C38380464F44B9424FFBB94EFB7331F6FBBDFBBCBD768C7A4E4A4),
    .INIT_6A(256'hD80C20D3142C58EB1C90183330085710D868180B3C144024086448CC8C2C5870),
    .INIT_6B(256'h0C2088B090F45CC0084864E35CFCE3F7EC233718E3E3EFFBEBD7EF0FAC207B0B),
    .INIT_6C(256'h9FC4ABDF7C7BC313ECA3B7748763F497BFAB0C280BF30BFF0BBCEF80E704C0A4),
    .INIT_6D(256'hF324E8C8347C64B0D83843C33410F3C0AFD323E718E38B18A7E894CCD31377FC),
    .INIT_6E(256'h03E733078FDF0BB44F8FA788F76C40E7BBEF00AB57FB5F1FCFFFECE408786013),
    .INIT_6F(256'hA8E35C93E524BCE0646B2BBC88730EE043FFF3CF5F20678C23DC3C9CD79F68AB),
    .INIT_70(256'h2C135C93C07CB4405C334428B8932AA3B8673077845CA0C468933B4874A74203),
    .INIT_71(256'h0C2C44E39C50C3204C102B43787C0E8FE717171C6B2C1FAFF360B878A3642BE7),
    .INIT_72(256'h43EF24AC6BF04383BF5BB0EC87D83CFBBFA00BFB83EBD717D7AFC7A47350549B),
    .INIT_73(256'h34CFF453C40898D8945F73E740B0321023CFF333AFE8678727C7038CA7E05874),
    .INIT_74(256'hEB4B3BB4E747BFB8C8FC2B648F9F309FC73BB3B3FBDB5037984B2F807F836487),
    .INIT_75(256'hBCCBFCDC7C0FB81F7764DC8F44DB279F6FCF238C1C0C970B34DF278C1303FCA7),
    .INIT_76(256'h84CF9037780CAB0CDC64B07318872F8CCC6410F77CC793E7AFB088B7283F4234),
    .INIT_77(256'hBC6880D024BCDF68A4BCF47730232BABBF573BE7BF53F323DB086FD0BBC32850),
    .INIT_78(256'hF7BBE3A8F3F3E45BFFFC9B3487DFFC63D36BD3B053CB73B3AF4C3BCC7763C8B8),
    .INIT_79(256'h0CCBEC5C0824ECFF8070038B445FCED7C78FD304E3DB5B5BE357B7A8C750008B),
    .INIT_7A(256'h4E075370B323BCBF48AB58FCAFE3EF53262B6FC0EB3384EF23CC5CFC1FD32FF8),
    .INIT_7B(256'h18C33C1BE443CF6FCB535F3B689F8383C308BB8C4423B888001334587B23639B),
    .INIT_7C(256'hD05034C79C976FEFFFFBCB473CABBC87A0B44B9B900BA34BB35393CF84A7D827),
    .INIT_7D(256'h202C4307D070D7F73FFBE3034C83BCF00A04EBFCA4FBC8C320C804CC504B3497),
    .INIT_7E(256'h52F0D0A45F6314E45790ACAC1F87F0FF12C8CBECA36394EB40D40CE07BCE074F),
    .INIT_7F(256'h98C40FBFC83F8B43BBF3A7CF6C9F3F57CFC84FC8E84B9463B824342C133FE46B),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized7
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
    .INITP_00(256'hA75C92D738F7B99607F5797A794FFAA083D77A88837407FD82BD715BFA497ACA),
    .INITP_01(256'h0247774DA30F01416E4A334C777C3351F75F59D598A338A4E757B0E66F7AE7D0),
    .INITP_02(256'hDF29273E01794F2DDE2322DEDF01DF57DA20AC5D63FA29E9644C7754774C777D),
    .INITP_03(256'h1102D0ACA0511974E19B7C7FF6C51779D64B491A7A24B080B26AC85A30EAE996),
    .INITP_04(256'h3FD145773A329EFF36090FA5C77FCFD432EC57BD0FB0D0BAD7E86FF5F84DD77F),
    .INITP_05(256'hBEF2A882FBFF1A0094058A9E893567DF360A040C46023D9221021A0A72069242),
    .INITP_06(256'h6A813BF0853F300D20508B7F259349EF302281AA7B103DCA4707EFDE1303F655),
    .INITP_07(256'h0B5185CC23F3144D93FE351BC3EEF6B1C0375D28061ADCD390A26FA0B4C3FFFF),
    .INITP_08(256'hACE5B0E9C838318AF6014905FBD4FA0E1645F8C2AD78E38DADA1B45B59E74B3E),
    .INITP_09(256'h6B4951D3A4EDE0DFB114D4867DBE8E4EF7476A81E291F17076E0E493DDC467AC),
    .INITP_0A(256'h685BF96BF5973B255535A1133315B5B7E3FBEBB047106AA2F92A9BD91138E258),
    .INITP_0B(256'hAA5218C5FE8FAD4487FA892E33106A19FDD1E7775BBA8A4FBFC07F27171FD20F),
    .INITP_0C(256'h778B2F0F6801B33C94981FD61915C200B36E997A791C4E6DB82B78213B529F5D),
    .INITP_0D(256'hF7FB4003BBFD40A9FA0384B053DFF63DB8BA539237271F8A0D055B4002FB5200),
    .INITP_0E(256'hE40BE202A9DA528ABA3535DF5506910140228CB06419097FB20946C560861818),
    .INITP_0F(256'h3EA44D704606563FF774E478950197F591DC49C5DE8D55E79AFFA4B956480FD2),
    .INIT_00(256'h9BA3DBF3881F770B47E70374BF2F238F032B98D39C54E717DBEB0F5B6433D78F),
    .INIT_01(256'hCC4424AB8B3F9B14E7248B50D3531CF717C0E46F207824BC58EF7FD8A35F9FEF),
    .INIT_02(256'hB478584C231FC4C704A097386CC7085C144430538FE397CF88FCB038FB870CEC),
    .INIT_03(256'hF0730C97A313BFAC98A80CA727B7D8B703A3E8937034635CE4175B7FFC1B0310),
    .INIT_04(256'h232498848C4433DF04B00B03BCF3D787F753F0C7941FA713D403F73B13737F73),
    .INIT_05(256'h2010142F57BF3BAF74D8BBA85FBB287F0BBBCB9FBC840FF767BBFCF0F03FC303),
    .INIT_06(256'h1B28F0A498376F302FD38CF078D7AB6FFF68F0ECFBC034F81F4727CF7C7FA80C),
    .INIT_07(256'hE71B841818681BE3E497587063B3130FBF0028786C97FC10A7F364E8788BB890),
    .INIT_08(256'h0397C058F4AC7FCBC42FD77CBB03C74BB7C3A710588C83C8205823AC0B274B28),
    .INIT_09(256'hA3CCB03C6C2488CCBCA82F84179BC3CCDC53F4DC23882C6827DB70244CCBF05B),
    .INIT_0A(256'hBF5C70B4AFC76310705BC0444C1094784C3CE0F8FC8724802F6BEC2090F71073),
    .INIT_0B(256'hCFF3EFF0004827776C90576888DBE3AB13FC2894EF380CE04FEB37E394DB2780),
    .INIT_0C(256'h84E7D0B7ABF38BD88743CF9BDC93A04F5354DB8F7C0B58AC20580BCB101318E7),
    .INIT_0D(256'h97E8D22FD4E7AF1710B04C53830FEF833834ACFB5730C48CA89F5B03E4CF0F23),
    .INIT_0E(256'hE714F2434857D4DB30107C84AFF7F7DC8B1817574C3F1FCB18B810683F431390),
    .INIT_0F(256'h63204A080817E01728E05D4F1FB3AB943FF0808087EF63AC33104B2F6BE358CF),
    .INIT_10(256'h0CD0E897A4D3A8B01BBF1F13A88710333CD0C89FC7EB37F4081BC79FF39B23C4),
    .INIT_11(256'h72F0A73C2CB3132330D35877DBA30F4710F3D8F373D35BDC90682FA7248B583B),
    .INIT_12(256'h63E4D7234B60C4E0EBE0C8F3BF0BF317471BFF17EB6F17EBC3D0FB3CD30B37DC),
    .INIT_13(256'h9FFB1F8C8023B72C6434AF1F4723275FFB5CFC13F8C82814B0F81BA393CC33DF),
    .INIT_14(256'h94940BD8B8A8E3DC482C341F481817F488D050E490FCB7DC14F044FBCCF7E7D8),
    .INIT_15(256'hE8780C68F8F3AB043C28FF3B842FACD70360EB83174FD407E0FC2BCCA7D7EF54),
    .INIT_16(256'hA7582730030C1CD417E490E7D31733EF07EF0B77C3F0A8F33754E72FCFDF3FDB),
    .INIT_17(256'hA4736FC0A8A883C804309C17F4273BA74F4CD7043BF8E4CB171CD3CF97ABCF3F),
    .INIT_18(256'h68A8B48B50E467902FF4F78F3F938C0773DFB0B0AC0F64A3EB1B77B864E49008),
    .INIT_19(256'h103883B828C4CB9D5C092F84789FCC1F838C3B204F4F1A8348D712F254E76C9B),
    .INIT_1A(256'h5FD07BF0FC6CDB0C7850C02B6C7F8B6D0CD3477FDC302C5818B0A03011886468),
    .INIT_1B(256'h129F1FDF98C960336F00137CCFC3FBA71CAD8833D04007A4C030137CD81824CF),
    .INIT_1C(256'h5F9BD76F8930CF102CB0806CF82C17DC482307B427D7BB9B4533DC87EB2C475F),
    .INIT_1D(256'hB79025BB443744DCDA6454D388D8D8E35FC7BADBC3E76C2050344FC49B5B74D3),
    .INIT_1E(256'h6027A394575C7C6858899400FB44CFE4130F3CD4F8502CC89BA0DCC0986F330B),
    .INIT_1F(256'h7CFC28EFC8E43B94C4687C3B9C14DB05008708EC9084103097DF482FAFFFE054),
    .INIT_20(256'h7C03969097D49C10288F67ACEF3F48BCD0B58C9808FC28287CA0DCE7E4C89FEF),
    .INIT_21(256'hBBBF40D3344C74FBF7F3F787903020140FCF6C0F5F6F28BF93CBE4B033C0B3E4),
    .INIT_22(256'hDC5B7A71F7B3D3F4442C7B95333C083F7F8B40DB43AF344B7353B49F8C28C728),
    .INIT_23(256'h086323513F3CEC30EF78B77C4C2C671C98BF06D46F887FC4B0F87F83FB170F28),
    .INIT_24(256'h1F171E182727C7627B43CF7B9F47F8529E3B624783BF6B53D033EF620B72E0A8),
    .INIT_25(256'hE4D34B288FE8C0784044383927ECF7C72B0B4A789F7B93B88BD7E3487B9B0F33),
    .INIT_26(256'h2B677E4F6F64C9681470E0C0632140631B6F27BF9C67E41B436BC4AB5B2FEFD8),
    .INIT_27(256'h6A17AF50787753CFDBA733D8432EE0B8338190741CDBABE4C4C847ABE8347798),
    .INIT_28(256'h04C8F4574C53DB4863301768B4B32F20F77C50D32484EC54707868ECBB8CAFA6),
    .INIT_29(256'h83CCA82864280FD880484C68BC40E06BA34349C7645B347BCF98CC33CC7BAB93),
    .INIT_2A(256'h6F79B4531373D7A3788F5F643023CC7A53F7ABB09B86D78FDBC4AFE4B20E3C9C),
    .INIT_2B(256'h577370ECBC648BD46B101FC95F9FA3644378085764DC40B75B2F3C1C9BE73358),
    .INIT_2C(256'hBF4C7C8CD71F53F7FC7CB8C03C8F67635B88EB47BB077F966787472B8BEB54A7),
    .INIT_2D(256'h745F4B9864A72B54F800281FC498FCB77F8E4B3BA313A73B8B1317BB74AF5014),
    .INIT_2E(256'hE3D028D7E850B3DC7FDFC7A7B49B8CE0C4E4175CF41F9739E09084A727003C35),
    .INIT_2F(256'hDFCA77E76F7BCB37538F2E5BFF12B04713484BA5F3346790A580FC38684B5C53),
    .INIT_30(256'h7C6FECC88F1448E838287FF4CB9B874F50F3B0AC4C6878FF50AC6CDD38B81827),
    .INIT_31(256'hCB1851243CCCFBEC9428906458D89FC47B1BE4237F5BD4B3ABF3E3A308B3A433),
    .INIT_32(256'h8CA8E490E7446FB02CACD4EBA0687080A45C70F0AC24BBE49039AC7C5C4CE39F),
    .INIT_33(256'h2CC40C58747DD09D14DCF414E00538307B8D1838B48FDDE48F1FFF4FE01CCF53),
    .INIT_34(256'hE40058142BDF50E4947730ECF89484ABE3284B0C535707CEFB5FD363789FA419),
    .INIT_35(256'hC888AB0000542789AD15DBE05824001BCC0837A740ABB6E42BD7EBEBDC3860FC),
    .INIT_36(256'h0B88897394FB1A8F9337ACEE45BF1870C32493FBF068748C5810844B7DE73420),
    .INIT_37(256'h3FECEFB0A7CF9A1BA0380B371F8A34E43C3BEB6023209BD7386B5C3ACF2CBC30),
    .INIT_38(256'h1B17E0DF3B9F2AD8EF77306F140C40D1B5B9B99DE1CDC5ADFDA9D195F5A9C11A),
    .INIT_39(256'h941773B07434B3183C73EC9B7403E7CBB0C37CABE7F06CB3F397F8678F779430),
    .INIT_3A(256'h8847433388DCC40BACB3B0A95CB45F20CF60A347FBA35B34EFF097844B20B373),
    .INIT_3B(256'h330834483C9B073420A49BF76B2F336403872F905C5008B7C38C4778F4E37F38),
    .INIT_3C(256'hF0A4935C0BBF7CE45448F7F77C5C9F1FFF77C4E3A0B8DFEC6F4740C80CA4B7F8),
    .INIT_3D(256'hF4DC88905773A47B877828E3E7789F9F90588F6C238B0B83971F7037E05844E3),
    .INIT_3E(256'h17F40324944794FB8F344BDF0781D0B08C0008740F97283F77A37090788F3F57),
    .INIT_3F(256'h13B03393908BBFA7805C8BBA60C03424A4A4A0C34883ABB4CCED0837F704F84F),
    .INIT_40(256'hA8EB30DC9807F5ACDFEFC7B08FA6C22F5F74006CD02CECAF179F7830FC52D2AB),
    .INIT_41(256'h8CE3D7DF3BAF3F479818980BBB508FBF840013035B6C900470E71F75700BB6B4),
    .INIT_42(256'hE414A718778B1B6C9C37BBA75F089843576CB8D0937430047F9C478C70923F67),
    .INIT_43(256'h9FE4371F6B3F6F54084C93FFA0EBBFD7E704BCFCF0AC8334EC3FBFFF477CF8A8),
    .INIT_44(256'hD308DB1CE34847F0E30BA4AF0B801613DB33B4E47877A86814EC8F6D808E6260),
    .INIT_45(256'hB7DC87A79739B32B1890DB2F0CFC9B665BF84F48633C5BFB2404BFABB747538F),
    .INIT_46(256'hD4B7481B10C893185C13D8E490D800748D2AB3B40C4FB337A39731C00DA3576C),
    .INIT_47(256'h53392C9C47C49F2494ECD70CBB6C2F58C0D21BC4F8BCA727373F94F4F4C7DB14),
    .INIT_48(256'hC3B4D80917747C6058C0B3F6CB9067ACF34B805820807724D02C88283C1F9B03),
    .INIT_49(256'h28EFBC845F24A77760EF94EBD028280F7314F813607D30CFC34097FC70289647),
    .INIT_4A(256'h0E94B08B9377C00C83731BF7C7703FE8F937237C38E3B4547FF3C384BC530808),
    .INIT_4B(256'h9A575B8B5F2F60C3BAC72BEB6FB833FBF3F3B84840A734EBC7246F0B8B3C77C3),
    .INIT_4C(256'hDDCCD0C4A4288B2457A6F027C3F3DC840903147C5BFFFB86B08B6CD87773EC42),
    .INIT_4D(256'h7672BBDF977858905011D3C79BF80CD0782C38A70FE018D4DC1B5F7CE7EFBCBF),
    .INIT_4E(256'h274A73A39BCC40AB13FC0BD3BC4DD060BD479007B6232CEC94F4448CA2373CFA),
    .INIT_4F(256'hF2EC7F2AB7B45778449BD333E450D79F0FBCD7A7548700D8A7AC46BB00A858C7),
    .INIT_50(256'h4F3B1FEF64BF5460F04BB77450D78C58055AB4672F77AB6768AFF0A38776C8F3),
    .INIT_51(256'hBB8C0F8B3323889758FCCF64417C5AB3B3036BB46B0FDC409F9C739075D84883),
    .INIT_52(256'h6BF0482F5C54F850242A7884FCC714742B9454844A1460D3C8BE302FB887D442),
    .INIT_53(256'h8BD7331074346FA87CBCD3E0403F6030C060BCFFAC10C88CEB3B386FC0A00CE9),
    .INIT_54(256'h23F86827DBCB777CEB0C241B0490CC74C02371246754B088CC9E245398FC1BD0),
    .INIT_55(256'h1363336F78136B8BE7B863F004187487CC10EF4FABF84BD784D46B582C7BAB6C),
    .INIT_56(256'h50787F778BB4580820534B3B08D4BB85C4CF1C6CC204804037B35357CF1C1026),
    .INIT_57(256'h674601E0FF2B432BDFCCB727E1DFA71FA8DBD07770386B0C27F40F70E4F8DFF8),
    .INIT_58(256'h12A87F8CE0969150182F44178C47F8B00270DFA734AAB4E4235F0F3F93DFB5A8),
    .INIT_59(256'hD844439B16D3B0E4AB1F2B6F7814A02B275F8004D7A2683CBBC4E3FFAFAB348F),
    .INIT_5A(256'h04BF630B3F94E44B236B2860D1B8D4B7A32CAA30186BB8C3F30CC727702C8C9C),
    .INIT_5B(256'hCC3F5858B89C54C9B49F54806BD81F807C33E49007A0E0142C6B9057349CECEB),
    .INIT_5C(256'h83ABA3E32FCCE59905681BD058B458F883F0FAC82C8B64CC4C8F73EF0F2769C8),
    .INIT_5D(256'h4B23E0EF53A454593C6C7860C44F6CC02F2B9218F8842C9197E44374F7CC14BB),
    .INIT_5E(256'h676353E807C73E1C4BF7D4C7BF2F4D84600CBC889BF8D47343CFE05CABB8805A),
    .INIT_5F(256'h3090DE30E05FC80407CF43178420218FC6B47CE0646C471F64E4187B0B5077BC),
    .INIT_60(256'h4C0FC74403E0FC24B4773C6B00A4A10CCFAB7483387CB0B388C85717AB4B0C67),
    .INIT_61(256'h2367F3E3CC64701097A7AB0C077CC97A506CEFD718E78C197716B0087C88204F),
    .INIT_62(256'hC7B0F7C33CCBBBA89C3C97ECF0DC4B5863AC698C10ABF40350A0F40FC864E9F3),
    .INIT_63(256'h6018CBDA241340BC53BBD03348C46B002F634BC73470A8E06288147BB404752F),
    .INIT_64(256'h7C001FA40F77708B74346EC83BA3E4DFCFC735500F6050383C3C82AF3848A554),
    .INIT_65(256'h7313B7A7847A1F04BAB41713CFD4AC34878B4454C7FCA7FFF198D7530853E8C0),
    .INIT_66(256'hE7E3CF1BE7BF0CE01B631C0843A8FCAF23A880438ED874FCD0DC1BA0F86410BB),
    .INIT_67(256'h9BF8AB9B00B780A8F7BB0078F8C860F853D797670082B48F9F5B4D7B73008B8F),
    .INIT_68(256'h141B67AF5373BFBB6CE4CFB3371CE0E316C8653C1A4CD8D01C404E937750A88C),
    .INIT_69(256'h68DB23B0449B57370773546E23BC9C3C08B8400FF3E3CBA7A7F3A82827E83C67),
    .INIT_6A(256'h2F53D88F0BDB37E7091180A09DE41BAF1F3F1490DBC7B0D3A47F8C34F06A1377),
    .INIT_6B(256'hF773FBB3E7C88FAC9F2FC784C78C28372F37736427737BFCEFEC7FB83F331F6B),
    .INIT_6C(256'h9B9F1F60E4A3F3BC8BC03CE8F0B790D0E8C0CB2814C7EC73BF1CE768EB90607C),
    .INIT_6D(256'hD09BEBBFBF87286440500C8FB334E8CCDBF36750EFB32C30FC18E4C08C070740),
    .INIT_6E(256'h8FA453A053538C7F788CB7FC503358C0B3FC2C2C08A9AD046F1074143C510B64),
    .INIT_6F(256'hFC3450A057BCBB5C8F84E1D8C0762F2CE4D0701F6CCF58B31924E45D7477D318),
    .INIT_70(256'h08BFDC43782BDF976F86530F2CA88F6BA820AB507BC31C5BFFA77BC8B75078C3),
    .INIT_71(256'hC36B7BB74C1C449FF430203C6B549B603CDB2B9422D6D343A4A8E36A98CB3BC7),
    .INIT_72(256'h33678C0F708CB8036FD83CF48753A3C73709476FF73F389493B38C4C7F5F67B0),
    .INIT_73(256'h53A36008CF1FAF689484B868DF845A0F1B930488D70CC74FE44CD01373FC0044),
    .INIT_74(256'h38F04FAB5C8F8FD437CF6B8B93F4FCF7F7A32B5F0A7303CF83A0CBE7DB0BF4DC),
    .INIT_75(256'h7343A33857D72008E09D7753036B1CE0035F48E324B3D4B700476867C7AB34FB),
    .INIT_76(256'hB06FA8F3E46F2488241F40189CA793D3577C6DBF2730B7E783449F43A40CFFC4),
    .INIT_77(256'hDBA3DF0F9CFF682078433894580C9F147BB36BDB472FEB8734274487BB18D853),
    .INIT_78(256'h179707D863D86867835344D814F33F57F31B5F54CBDC407C7470D7130B10A7B7),
    .INIT_79(256'h363F77CB5318894BBF5C8BF7F0F3BB47DF64E03FB8AFFB2F249BD0DB8B240C0B),
    .INIT_7A(256'h9FFC54E7E4CFA769E06F6F8604C4E4C353AC979C179C4C9CD0ABD7DB5BC7AFF8),
    .INIT_7B(256'h26480BF367DC5474FBC35B10E4EC849B30088C840F1BF09FD0C363DF3FC4E37B),
    .INIT_7C(256'h0B67B0FC18EC349F8C1337638FD840C24B2C3B746F6087447CC06B436CF839DF),
    .INIT_7D(256'h70E0E8B35848CFCFC35BF49F43A30B5B5F2C901FECC85C2347FC6FE7FF0CC373),
    .INIT_7E(256'hB790FB903F3BDB270B744844B3E36FCFCAC7545850E87300181490F7C483BCAF),
    .INIT_7F(256'h6F6CB77F4FE89B8884809C10D0BB83072F58C300D4BB4F5FE0CB2BEC4B50335F),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized8
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
    .INITP_00(256'h5FA71DAA4136FE8090E1A3A2F687814D1E9973ADBAA7889C923FA6973B4941BD),
    .INITP_01(256'hE4582F00E8B94F3C28420C1ED3BE8398C97F25DE90A3BDDD6E31E739B9D1F21C),
    .INITP_02(256'h8081880119468073104009C1FFF48F5C0E492064622520B8F41F01C603276CCF),
    .INITP_03(256'h10DD9738C410AE77394A01659F9BC913196EC31A98DADCF62C3501485D7E242C),
    .INITP_04(256'h10B7D45BFB37CCFFFFB540BFBBFD9F2472903C0496B0B71E384F486394E89313),
    .INITP_05(256'h357C3F23FF9CB79A890B002F491BAFABEE94FFD7DAB9B65D8008104AD8CBB654),
    .INITP_06(256'h075935A31D9BFF5C000040032F26417EF52140280B526865D9DF47368496189C),
    .INITP_07(256'hF711EFDD501BEAE38DDEC873DEB4F30C2640007DBE2FFFBE0D5E85C79CEEC4CD),
    .INITP_08(256'h680B5364C5F8292E87410546F4F4A75C004A01072B7C6391DE9D9F93804ACCCA),
    .INITP_09(256'hA0BC17D2788B93F40A7F2D7C336DB26DC2DB4DA4FEDBF1FF045E2E0395E44178),
    .INITP_0A(256'hB6E9B6DAAC317FF07D7B6B8C79510EDA91CC6E0E51044210F3BD3820A8FDAEEC),
    .INITP_0B(256'h000000C23CFAA9B0823A9F8A0D81C7E9BD340829DD7B2EEE0EB94E6526BA7437),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h4421EFC9A884E3C47DF45CDBAA3B51146BFC2600389B014BE453ADEFF9970B90),
    .INIT_01(256'hF5BC0B483470B24F1650A3EFABC5EFD2745C70F70577F044506B855BC7ABC567),
    .INIT_02(256'h9A63D5C7F81CD043BE0FA0401594F3BFAC673610EF8B07FCC83F4D87D73F0E6B),
    .INIT_03(256'h160C3D0CC1B4F23BEE501DD8A68F19556DC7B94F8684DFD8940BF697EF4027E2),
    .INIT_04(256'h937BBDF44A20EEA8B20C1CA437ECC394BC78143B26274DE80FF4287FEBBF0BDB),
    .INIT_05(256'hCE2829F72C4F023FBB43F9EB208301C7ECDCA2080248BE24F278FA1F3A309E27),
    .INIT_06(256'h29E7204334E391372C5BE5CB19F0C662E51BBFEF89A4B658D8582A0826B34624),
    .INIT_07(256'h6F8723E4B5DF7F6CC247B49C3458F59D53DB3DFFF3A73128D7DBE6D0BA3CB02C),
    .INIT_08(256'hE470E914E2AB89FCAFCB1F2F08135A10E7D8BD9C705F6A300E086E96A9DC7E90),
    .INIT_09(256'h6FC0FAA7B1DFFCC804DCE7E7300B05C78926EC4C1B38ADAE0CA3EBB48CDD8B94),
    .INIT_0A(256'hECF73DCB107E3AA0FA765CDB1A9BD7E89604B9DCC1DF11A2EDB343B8F97721F0),
    .INIT_0B(256'hE3F4580BD8CB19F41170D747BDFFB9E413C86EC71FB31994E4040164A59CDED3),
    .INIT_0C(256'h5DBF1D87480CF780843FB1BCB3E4EEC4B66C26CF4A60F810FC281DF0E67F16F0),
    .INIT_0D(256'h0A7FDA23CC0F082D4983606C21F7DA2436674ED4F9740054324435BBA94CCBC8),
    .INIT_0E(256'hFDE7FE7BAA744C2BBA2CF7779834273731A74FF7C358CDE4589BD5F7E158088C),
    .INIT_0F(256'hEFC4D4BF1FFC309C496341D4B68F7C5B5A24F2FBFF68D3A0589F02B40A774C88),
    .INIT_10(256'h5AAB583440AFE9302064F25717C7C1EB094BD61BBD8B6C37F543383CDBF7A9A9),
    .INIT_11(256'h2BB6931B4F703B0304F7612469A8FFC058F7226B363825F8D7CD0C47290AEC48),
    .INIT_12(256'h27038C38226C7BD75CC4C08C19735FAC264FFE3108C45298D880B1C0C4B33A97),
    .INIT_13(256'h3E342414D3B0E81853284040A07A0BF48018F28C2A47A688659C9CBC2BA9108F),
    .INIT_14(256'hA7A3F5E0CFF3E3CCE7B3D76705FF202BF4241023F993FD432D5F2B6BC3CB463C),
    .INIT_15(256'h108C29CC3C180E07171F34D31844046C12B01247F60F13DCF7F4422C446C1D78),
    .INIT_16(256'h346449D8EEAC1FC80DA010281F9CE21CD8B84A3F1EB01AAC0FECFBE84448EBD0),
    .INIT_17(256'hF69C58584C284828EA40589C40E437FBF47B00A0EE781690108C260C204C39E8),
    .INIT_18(256'h695715D7C7F41B547F37E74CB9AAD838929CF6D119879044621C0884F954183B),
    .INIT_19(256'hAE869E0BCB7F569D7A07BB52234F03B12E480A54C8984BB4F5DF646292D74448),
    .INIT_1A(256'hAE855BB77ADC3E1FBB036747BC4789F693A70B7791102608E9637DEB6357DCFF),
    .INIT_1B(256'h6EC3113B62F483DF1D66F5E7F7207FC391530BFF2A78E18463DB17C3F012EB6F),
    .INIT_1C(256'hA63073A39FD0E250AC0B6B38F46BC11BF14F1A13F1E0994C2C2F1B776FFF5F2F),
    .INIT_1D(256'h0A24AF6CCDF40FBC45134A5FD89BFC6824543CB0967B53870727CAA32F6F0720),
    .INIT_1E(256'hF464003441B1466B3E706020124B1EF3E8E49A5BF394D86C1974ED4C65D8BBEF),
    .INIT_1F(256'h2E0737B4009C0C28FD2F07ABDBB301A8DA4B07AC05ACE3C81888FBF0F814088C),
    .INIT_20(256'h6ED4019C51DC646C4DF0FEFFF0A4284AF0676127461443A8400C753F5650EDFC),
    .INIT_21(256'h72FCF3ECDA0C801B77F3441CA9A4996B4BE05868F47706241BFF68C00A57FBF4),
    .INIT_22(256'hCA1F13BB5FE8F0C0D858D58C587868A3DECFB98041DFFDFC7CA42DECBDFDF68F),
    .INIT_23(256'h13D4F7F3AC54EC88C64B014C4A5B4EE73C33A35BF7172A544A3D0A8C0BF52A65),
    .INIT_24(256'h9A1BD94F685BE420A9FBCBEEF3684183D1CB2B5BF1A8B16D1820FDCF2F286835),
    .INIT_25(256'hE75F9BE38372BBC4D6D4BBCF518B27171D3862103A243C5BECAFE5BF836FAF6B),
    .INIT_26(256'hE5ABD1C7EE17C7F00034DDE00BF3D9CFED3F7213EBFF2217C597B94BC787AFF3),
    .INIT_27(256'h60DC5D333E53D875FC5FC9B419ECDF50B43C956B736F061C514000B8CA88CBBB),
    .INIT_28(256'hFE1855DBAC2C86EBE7074817A892C57B865CF16735D0C3F705070193813362AC),
    .INIT_29(256'hEE7412801A583A272290227CFE24142020503FD05228380449F04E84FE048FCF),
    .INIT_2A(256'hC9F3093FF233E2B8C05BB3E3E4581B97D618C99715D79820079731AFF18003EB),
    .INIT_2B(256'hDDCFA43FD770AE63BE8B09A73BDF484BBF9BC3ABEB70C558DFE02517196BA9F0),
    .INIT_2C(256'h68235807CCA879CF3473597BCA63CBA47418B02BAF6FF363A3DECAC7E40BB56F),
    .INIT_2D(256'hE85F0E7BEA6B4FDC1A70280CE64CF358347020340AB810680240DA88F1F8D133),
    .INIT_2E(256'hA1E3C3C0F5BC97D3C4E42DE3C39F4293BE3499AF17FCD3E0EC2805E3E250D014),
    .INIT_2F(256'h320CEDD70DB80FE845EFFDA0C5AF443C2E80B1ACC7B4EDD8246CF8FC0A57C78C),
    .INIT_30(256'h8EA0DC84453C7EBB704B4D68A203CEDF145B09B7E3736E2AE82469F8E5287248),
    .INIT_31(256'hDBE81954F4132DF0B9C819CBEDEBEDDF0FA31A1723B7E7BF021FD9F317E39894),
    .INIT_32(256'h22944478FE1CF12F45D043FF004BCA1867FCFEE8F46FCA5B21C7A04865831DF7),
    .INIT_33(256'hDD63E3D8A97303E43AFCC250B07C9600281F5C8C2E4746CC602CE845867C2223),
    .INIT_34(256'h3664AE84B5A3D3B03834DE6713B0D2271D9014672E5C2FCB37E7EDABF1A7F2E4),
    .INIT_35(256'h2C4C102C4E545A6C2A070A07507836004DE0447048A422071840442342308B8F),
    .INIT_36(256'h3058113F955F6078E2373FD0D85BE39BE5DC9DE3F123D364557C33DFE7831678),
    .INIT_37(256'h3C442EB08B64CFD3372C2E78A66F01D81E79EA0C11DF6E1F8604CE2738E4EBAF),
    .INIT_38(256'hF22435B4B3932674B7E7BEAFAE00E44FF1B8C48F61D44453F1573453AFC38A30),
    .INIT_39(256'h146C2CF4CDC03D7B33E395BBF227CE30E07048685DFC4FDFFDA77EDF3F4389DF),
    .INIT_3A(256'hEC37DDBBF783AE5F1E30B61CCBABBD7BDFEBADB8EBABF35FC808E987A95FD858),
    .INIT_3B(256'h1A50FE78091CF4544FA04A58580B1AC870100ED0422B401771D8F5C7F9AC117F),
    .INIT_3C(256'hD53F013BEBFFDC44E680A74F7B741817F7EFF77F3260E1440080200FB7FB0063),
    .INIT_3D(256'h9C19F2C3E5AC852BAD80CBC0E4631E37ED83582B97D78AAF116F6974B5CFC37B),
    .INIT_3E(256'h03F049F43458163449DB19E3CA07DB9BDBFB9A13D430D874D3F3FE247067E51F),
    .INIT_3F(256'hBBEBC3EB1FF3A337026003AB483425F3C3D0DE83E3AFD5C3BB9325FFFB602FF4),
    .INIT_40(256'hFCF866132AB09E1B29730248C023B44C87EF2423DF3B1637E77C2698F243DC1C),
    .INIT_41(256'hF7DB0D8CF990D417E6530FC0E9D705CBFE2F0F83D3A3F1BBD63B0FA41213D7C4),
    .INIT_42(256'h1677949CCC2FA1EC55F8AA0BFB909C1849A8CCA842C5C34FEC03652B100341B7),
    .INIT_43(256'h34281AC00E6C1DC3299434CCE868E22C2E5C5833464847C71A442A601B8FE5BF),
    .INIT_44(256'hD58BFFA0593006D4A424AF30CBF050F3C6ABEC1709E7DFA357BC39B48150008B),
    .INIT_45(256'hDA5888EC090FE99317D0643B1ED81A401A443EFF3FAB2FB341672813652BB82B),
    .INIT_46(256'hD3B4206F57CC3997F180C1C8EC1F3C2446A8BE0CFA173FE80A67D464FFF7DA14),
    .INIT_47(256'h6220F237B2705A0F619C662070639D5803DF17CC3844F3B025D8A23F81C0383C),
    .INIT_48(256'hE21C17F0AB33516CC3ADE4A00678065B4640AAEF963B30202170C618BAA42030),
    .INIT_49(256'h18AC32343BEF021B13F043DFD1F0DA4B2E20FA08D9C0D4504C6438141E70F0C4),
    .INIT_4A(256'hD3D7DF9BF357BA04D7D70DBFDA17CBE3B37BCBA31A3F335FDFC3D193F767E9B4),
    .INIT_4B(256'hC17414205680BF26D3DC017DF61BAB905DA70AB04DE75A375A7F8C0059570218),
    .INIT_4C(256'h8E47B54716E3F36C4D8BCE64D320792CBE03DF500EFF68B427ABECB38E2379FF),
    .INIT_4D(256'h44472237C657FA200B63F94CEF9CC7511218E200E19F17EC2FFBD02B95EB1C83),
    .INIT_4E(256'h0218E9CCDAB06293B460268FF870F3EAD21B4FF74A50B3D0F193FF534BEC125B),
    .INIT_4F(256'h8E68A6813E0C10239A34D4C3BFA06A2B18442FB75E1F01BB659F2B7F2CF8DE2C),
    .INIT_50(256'hC0B7EB4FBCA40CA7C9CBC92CE3770367B08FFDEFC78FA61DFBD1C40CC5B008C7),
    .INIT_51(256'hF36FCB7F1A7BD597E817B9BCE3BB45CC2E37D3EBCE4B00801E8CC86C08670E34),
    .INIT_52(256'h52785C3838D094FC6A843E901BD4181B6BF8604020A1EAAD6AFD296C52E82850),
    .INIT_53(256'h6CCB21634EAC2BAFB84045F777502E4311F076377F87F0332C6B281C09BFFAB0),
    .INIT_54(256'h2BC78DD3CC5B2F84192B63DC1E4003430C032607FB9CF23B67B813D89C1AB877),
    .INIT_55(256'h2F239DFBAB644BC03B73DB8C762C5BFC69335EC4B4079170F3C806588D302043),
    .INIT_56(256'hBA00DFA4D5D0188B001773FB024B296445AFB79EF9048FFC9F24EB0818802C58),
    .INIT_57(256'h4453E79C01F7788CF11FC6584800478CF26F47EB0F839C4B49F72B83B210AC24),
    .INIT_58(256'h0C03A42B11B77842C43BDB63D250F43C23E6A11341B412400C4855B027A3BDC4),
    .INIT_59(256'h3A58181C65EFD813C43401B88E97052335C40844E5F872783987E20B3DDC1BF8),
    .INIT_5A(256'hC9D851DC59E755A4499EC3E31C175312182CC04CFDCCD05B57F38A2BDF54EE68),
    .INIT_5B(256'hAAF86DDEC1632DBF406BAFDF65AB5C5A1A7823F3A84F4A871A064E53A3EB75F8),
    .INIT_5C(256'h1E7C1C1357EC59E378334E182A142FF37DF304781D734D2F3F6C8043424C454B),
    .INIT_5D(256'h7403287B3FD7FE432C07E1EF242374FFB8483978BFD7DFC42C10243BB0340C0C),
    .INIT_5E(256'h341C9F93C9B40C30B5DF893376286A5CC030DC5B38030D78FC7B739C2C541C0C),
    .INIT_5F(256'h00000000000000000000000000000000000000000000000074433E31839EF614),
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
module blk_mem_gen_0_blk_mem_gen_prim_wrapper_init__parameterized9
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
    .INITP_02(256'hEDF12C000000C1E0F0F87C3E0F83E0F8E07C0FC1F81FC07E03F8F00FF00FF007),
    .INITP_03(256'h408E822E44703448714DE296414A95685469C14A11295ADEDA9D9ADE2C62D160),
    .INITP_04(256'h70608C8D29218483A5888C10F0669461B0718086640034187140A29E35588087),
    .INITP_05(256'h5C1C5686A8A8A1A8A9A0568601B8141217945493A9BC08A08089AC90F468C52B),
    .INITP_06(256'h0C0E2025D8FCA078A4C9B46148871896581120411CD13065206D24E07E171CA2),
    .INITP_07(256'h44E9A89E2548A89A2C9EAC52198FD5186449810CA4E8F22890F90416B4F92087),
    .INITP_08(256'hD460F9A9851198130506F00D8414FB8CF87CF1AD3247A4134552A4375DC97569),
    .INITP_09(256'h72D11D8BE5F9FAB57053F83D7EF925BFF69B5DB94C946419F4D31280C9503110),
    .INITP_0A(256'h5B9C65A3E1DA8490147B355D5C896DEF5FFB5B5217BBBDE3EFEEB67AEF36DE99),
    .INITP_0B(256'h68E03137870A6E09FAD9BE4A265FABDA08851029FEE60961753F71DD3BBF8804),
    .INITP_0C(256'h00011800DD155BD3E27B72E0C70EBA425753D779413C150D7E932F93A1340D82),
    .INITP_0D(256'h0A15BAF3B65BF6F2FE05238A6CFF7FFED8A5B0FAC98CC284D4841E192F3872A2),
    .INITP_0E(256'h5905F6FE5D905C001881F4EDE6EB777E8E95F7CDB7FBF75A8B15FDCE82948584),
    .INITP_0F(256'hAF434CAB5AEFF03EDD415EEEBD409B48EF413ECF56697CCE19816CEBE66BE7FE),
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
    .INIT_17(256'hD6C4E91AF8BA11C7E5C6F8FF036215A4682E016E2B027E7D807D707F777F777C),
    .INIT_18(256'h2507D720CBDE6C030EC9D1130E07FB49D4F33DF60A0D34ED38FEFD3B285E5B48),
    .INIT_19(256'hBCBE2BFDE75EFC3AC1206AE2C6ED04C7E72204DEE528CB30D4FE0CD8E9DFEE44),
    .INIT_1A(256'h1D300AF83A2750E42022EA17AF3A29F807C450D5E05ECB32CECC2CD4EEC1AE10),
    .INIT_1B(256'h28DC31EA26C0522025ABD03BFA5C45B3E6E4122B419015F40EFD1F08E608EE08),
    .INIT_1C(256'h11D92F1C182002B843C10345FD65F505BE2003F807D006C518FEE716F36C3F3C),
    .INIT_1D(256'h27DBCEE663050DDF61D1240BD8ED63E7EABBFC012A80C926E90A68C810E5DC13),
    .INIT_1E(256'h70C913064CD548395EEDF1CD2C10121C7A31E3C069D949401CEE5A2FDF0A5960),
    .INIT_1F(256'h00F802D1344B362CEB401C0EEEC29E0EEE631D642678D242056FF238CC96E314),
    .INIT_20(256'h5727E9DE9CBB37D703D260D7E7397510EA4D32C4442E0220E74D5A0C26B697FD),
    .INIT_21(256'h34F0F0F4650F18E909D90D291F238D08D528F3C45A63F416E41F40F8CEF0F03B),
    .INIT_22(256'h58DFC41269DF60194C01422B37098074522FE9BA4BD94701570126ECDF203137),
    .INIT_23(256'hDD34F9B04D119D3547DABAFE28305FBBFD2229AB583C0C14FA1D173008F2D86C),
    .INIT_24(256'hF8F2CFF51465644345E0FC4711E8E016C40635CE38E3463139F2C75E1E2633D0),
    .INIT_25(256'hAD73E634008C72F4B80B602CDB472D09DD315164F8BA7608100772EE15761412),
    .INIT_26(256'h030EFF17FA0B5FFF8E02BB64175C84A5D51E4C54078644329E359C1B3507F0B1),
    .INIT_27(256'h06E3D4AA123FAF3351E0A76E010C230FE1610B64ADB7542AE23BAE04DEFD17D6),
    .INIT_28(256'hC8D5F4E710F934099CD8EC2CCB6A3714D2E0170E1CEF52ED731AEA08E84EF7E2),
    .INIT_29(256'hCF23009E0D54282FE7220228DB0029AFA577F748E7DD4C14FE418AF44349551E),
    .INIT_2A(256'hCD4AD880C54135F8F41DC5DEAEE0549913140A94FF6A3725BE0CE53B16302C40),
    .INIT_2B(256'h4A01718F1EC5C8FCE536A4CA33E7054151DA83937BE30402E3564ED89F37D2D3),
    .INIT_2C(256'h277D1E92031A7FFBCB60D8EDD86A85053F025098598E000E500E9AF2920BE034),
    .INIT_2D(256'hED6FE268F91B6EDB922AF0150F2E1B4F43F53D9D5DD8E24EE41A3A186BD9E466),
    .INIT_2E(256'hF142C04ADE165E0E9C30B83BC422163BBD2FCAA2257A11EDE43BC547E05C1D60),
    .INIT_2F(256'h70F43CCEC3CE302C32530CDCEDE33A0D5ACC81DF29D2E44CEF428023A7EFCC52),
    .INIT_30(256'h1DDAFFD093F4FE220D8D52B717AEFBBB715423D867E63C58FC05F60E2403E817),
    .INIT_31(256'h0000E62E701130050972C336E7FE30BF214A9C3078FE5E24F6969D480A164E07),
    .INIT_32(256'h864A2EA074F2946CE0F154FA080302ED460EF4FF4800083539D2B13A0AEA3BCD),
    .INIT_33(256'h3FFA77A08D369688100310FC021450AF3E46A027200D3C34489E070D02523EC2),
    .INIT_34(256'h33DE51048F202C14C06D623112C6FCBD61021FF0B52E1426E74322EC18B7E714),
    .INIT_35(256'hB666F60249DE146897F12A1ED64A26D9F868B2FE52CF41436494A55F3E663A9F),
    .INIT_36(256'hA8EC08E8EE1F031ECBFDE0D99FFC2126AA0AE8123A38552407B6F2DCBF4F406C),
    .INIT_37(256'h1F0F0834FAFA30171E3E0712F5F1FC033F7DD827645E2E35565DFD0602D43FEA),
    .INIT_38(256'h8C8CEFF748E81631B1B4FECED54C39EB3F3BF645030B4049FC01032000AEE2FD),
    .INIT_39(256'h7A8019E67400238297AECCF4DB5339ED014B14382FF75E45116533DF45B6E830),
    .INIT_3A(256'hB22AE30522F61752D6A7E014C2361F3CC0F8E4BB3C22FA160403E636F03A0488),
    .INIT_3B(256'h1EEEFC1014C4850724D20E48C467B2D9FB61020E1D585ECB6A3A5805F8AE271A),
    .INIT_3C(256'h2A0C32B7F02207D8D8014B20D7B2FDEAE6D84CFE44BF81DE080218F2FD31863A),
    .INIT_3D(256'h0770F34BD1FD2791F27113C7FAD29C53F783BF1FEFB82E2348FB2DD12206FE02),
    .INIT_3E(256'h1C04E2182ED481EE00D6122CBE44D602C906B45DE9052C31DE7537D2DB208A2B),
    .INIT_3F(256'h2AAE001608B6330DE2C8F632F649ECF3D936B536D11F3789DD2105FBEEE8B620),
    .INIT_40(256'h20E00AF4FCF32DE4E7B74420B04876D838D6F0EF2ED42CE01BDFFE2CDE2A62D5),
    .INIT_41(256'h3FFB0E2C30D42BF803F14DFC531CB841D948E1401DCC66914235E3AF2FE6CDAC),
    .INIT_42(256'h0E39CEF81B05ED290CDB150E41C0DBD2D543F6480ED4340E1C3B48AD8310E7C4),
    .INIT_43(256'hD9C08D91E514241007F4C5F496D05830CDCCADAE2108BAD8E41BE238C8E666FC),
    .INIT_44(256'hF92F0C4C6FF7522004177DA71FEE052AF7C2EDB1C91DFAE3EE2C0411D4DE1814),
    .INIT_45(256'h2325204034CA51F22609570079F1ED4ECBDAC7D90D2C2E1A10371616A2EA20C6),
    .INIT_46(256'hFB214C443ACE1BE02B036CD071340FB7F9042CE4FE0931250B217BD4351AE5F5),
    .INIT_47(256'hFDFC98C002EC44170189DB130A565466B190EF8FDD244693E93FEC3C962A94EE),
    .INIT_48(256'hF9E7450ABB1C08DF57FC2FFB071608402250D0FA3603C5E6335446FE1A099556),
    .INIT_49(256'hFDE881FB6EF3160CF5EC20C01B0AC8EA362957B0313CEC43E63A70148C344420),
    .INIT_4A(256'h14FD171CBEF6780CA24839E706E2342155FBF80205F1932A294586D0F71B2DEE),
    .INIT_4B(256'hBAB1A3B71FFB8934FA0F37B2C724A3BA41E501D7FBA60588F820F5CBEF2812DA),
    .INIT_4C(256'h0AEFDCD19BF89070EBD5C3C7C44024DB201159610A6F518FB972C4D4BD7ECDE5),
    .INIT_4D(256'h39E6E8E02558004722D141CA4859D7F1C5F9D2EBB2461322090090F8C5EB18C1),
    .INIT_4E(256'hC8E1C408ADF118D8DEE7F397E7835BCCB2CDB4C79C0DA002422BFEA488A300C7),
    .INIT_4F(256'h2CCCFFF40109921FA8C53AA5203E4E98552952E9E7F92ED5B7192152D74CD288),
    .INIT_50(256'h98F4D80AC770E3EA362CECB44D8DC332F37D2BA5DFB3BE14D25B00ABF9530ECA),
    .INIT_51(256'hF9FA9C216CD05A92A8DFBF2DE8CCFC35F318B5E367CDB1128F9ED4B3DB30B858),
    .INIT_52(256'h2C1B0EDE1CAFF78AFE0FE179CB2DA782F509DBC9F5EE12FFD8D9A04C156AD6E0),
    .INIT_53(256'h1FE154E0CBD7F1E5F1CFCF97BA26EBDC21E952F2A041FDFA16BB4BF1494ED81D),
    .INIT_54(256'h02BB01FAE8DC0709FC290D37BF4723F20FF2B32CD0B923DCE7D5A30FF7FA9FB5),
    .INIT_55(256'h150C2CEE07B0460223DE95B9E305E6E41624DBE538FF2CFA18D3129CE7F162CD),
    .INIT_56(256'hFFB7E60A1B1402A1F3AC06D5E615D95C6E340A2C0AFB0714F20611D64F4B6263),
    .INIT_57(256'h72EA2485B81FE1BCC01238F0DCF3800E29E1E93E14EA37E7DF2BF5370112FD9D),
    .INIT_58(256'h133CC7E5C4248BFDAB05E7BDD8B6E1C6DA5D3304C7054E11083E581A1C71041F),
    .INIT_59(256'h1B91EEC41DC407B10308EAC5D3FFB3DE42A2C0E91A1133E3B2E303ABDCF039CB),
    .INIT_5A(256'hB7FBDEEBBDFD8E10FA967D4E1DAA952C2D063109F38E1DE958C5EC80522C6F9F),
    .INIT_5B(256'h27374C1EAF146F0BF38B37483EBB5D9C294852FB1246B90F1476E02BB10646DA),
    .INIT_5C(256'h03299E0013AFF71E5BEE007DE9FF63C2DC16EA01F023ADFBD8C80FA2EF38E42B),
    .INIT_5D(256'hBAA5A2FFEB0BF045C6CB13D0D253056F9933F287D7F3E30D08E36C12C8368F19),
    .INIT_5E(256'hE4220D2F6CFDF8D526601A32BC3BF86932BCF780C6F8D447109C202C89103ACB),
    .INIT_5F(256'h58F2CD33FC5C366B9299CE663B0782060E64D3F02B308BF4630CF1EB5BB7D3B5),
    .INIT_60(256'h3857CE04300208AC603BFAD41AEF1B26639E5F3FC6E931E9DA561164210CF129),
    .INIT_61(256'h06F0D0EFE5F6CE1BB63538DA7025F6FD6274C235F6FDF5ECBA7C46B53008F8ED),
    .INIT_62(256'h6FF92076022F1AFC6400D1DDF8FC0C1C280309F925E765E553065A94FAF614FE),
    .INIT_63(256'h51E34BF330DBD5B72DE807E12387CB947CF300AA1DFFE7A420EEBCF37F1624FA),
    .INIT_64(256'hDEE7613359CFE2B110094E34F5C6A10CDA06E8FBE453E8410CD4221C6006F01E),
    .INIT_65(256'hADCDBD035919A39854C0F4CDDF96A6980AF2C4A31227D62DD4FEF41C4C0D2F62),
    .INIT_66(256'h8CCB39E4E1A301EB3B3C01B437F517D309E10FC1D629A5F5D3E733D5070E99CC),
    .INIT_67(256'hE4E8D4E0D0E8E6F6D8E8E8DADEC4CCD32D2916D6E63445061334111A0C05150C),
    .INIT_68(256'h0E21F522FFD3D1F4040FF1DFC7070B1E06F0FFE82B01F307E127F901101FD5D6),
    .INIT_69(256'hF6E011E40CFE081EE02E033022D42F19131909D8DAD5D501050F21D3D1011BE9),
    .INIT_6A(256'hB9C22C1FCC1C08F9F6060E0AF8F60C14CBEA2C100802F01AF6002E154AD23212),
    .INIT_6B(256'hC2DC3CFFC01B0C01FC08EC1516ED1DE1E302CCF42105031BCBEFF9D0DB17F722),
    .INIT_6C(256'h25CFC30FD7FB0918E7E5FBCBF1F9D3E101D9DCE2E8C1ECDDD0E3DDDDDDFBCB06),
    .INIT_6D(256'hB9C0FFDBD8F0E23D2122182702FC01F7231DBC230205F5EEEF071F0FF503CF1B),
    .INIT_6E(256'hD619C28C21F1EC1D18B71DC7E717E2EFC9F7E26F05F7EC05F1D7D7F10A07D626),
    .INIT_6F(256'h1D236B29EA16FD13122A38EE34B406E5D801E167D31AE40FCADDCCE3011DDCDF),
    .INIT_70(256'hCC327F3D0808E538C81420F21AEA3828E506631526FC03EBDA221A2240DA2C3C),
    .INIT_71(256'hC0346515D800DFEC0E1C36E4369E24F9C7E0C2A6FFE404EFFDA51701D3D9F616),
    .INIT_72(256'hD009AC9B0DE5F2F9FBD3E9F9F507DEB7D1EDBAB11DFDD5DF0DB91BD7CB13F400),
    .INIT_73(256'hFC113D4BF0CEC701EA3066FA0CB404E4C6F3D9680BF5F4EFFEEB0605D5E30ACF),
    .INIT_74(256'hC7F5D2051FD8BB27E1C5E617A903FABB13F5D1D521FFF3E1059AC6E9DBD9EE24),
    .INIT_75(256'h273069C1E2101904FB3B1510180738DDB4DFEEE91ECC0B1FD691BA29B0DE13E1),
    .INIT_76(256'h41E667FAA6F049F8F93323DA4C0C0C220DFA26D9EAED072823514900520C3C4E),
    .INIT_77(256'h43E821DDE4094FE41B491F2220E608B7F7BDF6FB3BECF131FBB2D4FFC7E5D820),
    .INIT_78(256'hCDE1C5032DF3CD1513AFCE07D705D3DFD1DBC51F29D5DBF7E9AADEFB95D9E520),
    .INIT_79(256'h121A47D0D8222FEEED4F4E2044281F9D13E1BD2CE7C1071FF19E9C11BB07B6A5),
    .INIT_7A(256'h0EFE16D503F5D5611DC3FA17DE030BBF22E8F6EBEBDB176DEBDF0211DCC1DC33),
    .INIT_7B(256'hE8DBF038E5FCD3A05D8E2D14121A01BF3310FFBDF4DBFD3DD0E42C01D487F69D),
    .INIT_7C(256'hBF26F8F5E5F22BC523CF2D2E00282914E51306F1DD18E7920BBE2D37F8560B28),
    .INIT_7D(256'hDEE82CFCEDE60DC7109139162C5833DB02EC21D7D7F1F73FE5F3CA07B8E9CA3E),
    .INIT_7E(256'h08F117D5F60BDA79C9E1D805EAC3D1C1F8CFF7F7090119650515B8F1C2DBC630),
    .INIT_7F(256'hD715F419D1E6F7D8658D210B2E28FFD101E51805D1D7277DF500CA0EB209CDB7),
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

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module blk_mem_gen_0_blk_mem_gen_top
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

  blk_mem_gen_0_blk_mem_gen_generic_cstr \valid.cstr 
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
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.701475 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
(* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "9716" *) (* C_READ_DEPTH_B = "9716" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "32" *) (* C_READ_WIDTH_B = "32" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "1" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "9716" *) 
(* C_WRITE_DEPTH_B = "9716" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_4" *) (* downgradeipidentifiedwarnings = "yes" *) 
module blk_mem_gen_0_blk_mem_gen_v8_4_4
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
  blk_mem_gen_0_blk_mem_gen_v8_4_4_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_4_synth" *) 
module blk_mem_gen_0_blk_mem_gen_v8_4_4_synth
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

  blk_mem_gen_0_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
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
