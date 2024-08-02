// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

//////////////////
// tf64_pcie_exi defines
/////////////////
//`define  RANDOM_SEQUENCE

  /*  Time parameters  */
`define  T_DELAY_AFTER                      0.0
`define  T_DELTA                            0.1
`define  T_PIO_INTERVAL                    50.0
`define  T_DMA_INTERVAL                   300.0
`define  T_RX_NO_FC_PERIOD            1900000.0
`define  T_TX_NO_FC_PERIOD            1500000.0

  /* Memory size for simulation */
`define  C_ARRAY_DIMENSION              4096

  /* Start indices */
`define  PIO_START_INDEX                'H0300
`define  DMA_START_INDEX                'H0000

  /* Request completion boundary */
`define  C_RCB_16_DW                    'H10
`define  C_RCB_32_DW                    'H20

  /* BAR */
`define  C_BAR0_HIT                    7'H01
`define  C_BAR1_HIT                    7'H02
`define  C_BAR2_HIT                    7'H03
`define  C_BAR3_HIT                    7'H04
`define  C_BAR4_HIT                    7'H05
`define  C_BAR5_HIT                    7'H06
`define  C_BAR6_HIT                    7'H07
`define  C_NO_BAR_HIT                  7'H00


  /* Requester ID and Completer ID */
`define  C_HOST_WRREQ_ID              16'H0ABC
`define  C_HOST_RDREQ_ID              16'HE1E2
`define  C_HOST_CPLD_ID               16'HC01D

  /* 1st header */
`define  HEADER0_MWR3_                32'H40000000
`define  HEADER0_MWR4_                32'H60000000
`define  HEADER0_MRD3_                32'H00000000
`define  HEADER0_MRD4_                32'H20000000
`define  HEADER0_CPLD                 32'H4A000000
`define  HEADER0_CPL                  32'H0A000000
`define  HEADER0_MSG                  32'H34000001

  /* Message codes */
`define  C_MSG_CODE_INTA               8'H20
`define  C_MSG_CODE_INTA_N             8'H24

  /* Payload type */
`define  USE_PRIVATE                    1
`define  USE_PUBLIC                     0

  /* General registers */
`define  C_ADDR_VERSION                 32'H0000
`define  C_ADDR_IRQ_STAT                32'H0008
`define  C_ADDR_IRQ_EN                  32'H0010
`define  C_ADDR_SDRAM_PG                32'H001C
`define  C_ADDR_GSR                     32'H0020
`define  C_ADDR_WB_PG                   32'H0024
`define  C_ADDR_GCR                     32'H0028

  /* Control registers for special ports */
`define  C_ADDR_MRD_CTRL                32'H0074
`define  C_ADDR_TX_CTRL                 32'H0078
`define  C_ADDR_ICAP                    32'H007C
`define  C_ADDR_EB_STACON               32'H0090

  /* Downstream DMA channel registers */
`define  C_ADDR_DMA_DS_PAH              32'H0050
`define  C_ADDR_DMA_DS_CTRL             32'H006C
`define  C_ADDR_DMA_DS_STA              32'H0070

  /* Upstream DMA channel registers */
`define  C_ADDR_DMA_US_PAH              32'H002C
`define  C_ADDR_DMA_US_CTRL             32'H0048
`define  C_ADDR_DMA_US_STA              32'H004C

  /* DMA-specific constants */
`define  C_DMA_RST_CMD                  32'H0200000A


  // ***************************************** //
  //                   Tasks                   //
  // ***************************************** //

task dword_pack_data_store;
  input [31:0]  dword;
  input [10:0]  offset;

  begin
    board.RP.tx_usrapp.DATA_STORE[offset*4 + 3] = dword[31:24];
    board.RP.tx_usrapp.DATA_STORE[offset*4 + 2] = dword[23:16];
    board.RP.tx_usrapp.DATA_STORE[offset*4 + 1] = dword[15:8];
    board.RP.tx_usrapp.DATA_STORE[offset*4 + 0] = dword[7:0];
  end
endtask //dword_pack_data_store
  ///////////////////////////////////////////////
  //    Copy random data to tx send buffer     //
  ///////////////////////////////////////////////
task Copy_rnd_data;

  reg [7:0] i;

  begin
    for (i = 0; i <= 100; i = i + 1) begin
      board.RP.tx_usrapp.DATA_STORE[i*4 + 3] = board.D_Array[i][31:24];
      board.RP.tx_usrapp.DATA_STORE[i*4 + 2] = board.D_Array[i][23:16];
      board.RP.tx_usrapp.DATA_STORE[i*4 + 1] = board.D_Array[i][15:8];
      board.RP.tx_usrapp.DATA_STORE[i*4 + 0] = board.D_Array[i][7:0];
    end
  end
endtask // Copy_rnd_data

  ///////////////////////////////////////////////
  //                                           //
  //   Feed TLP to Rx: MRd, MWr, Cpl/D, Msg    //
  //                                           //
  ///////////////////////////////////////////////
  task TLP_Feed_Rx;
    input [ 6:0]  BAR_Hit_N;     // Which BAR is hit

    reg [63:0]    sys_addr;
    reg [31:0]    hdr_type;
    reg [31:0]    hdr_mask;

  begin

    hdr_mask = 32'hFF000000;
    hdr_type = board.Hdr_Array[0] & hdr_mask;
    if (board.Hdr_Array[0][29]) begin //64bit address
      sys_addr[63:32] = board.RP.tx_usrapp.BAR_INIT_P_BAR[BAR_Hit_N] +
        board.Hdr_Array[2];
      sys_addr[31:0] = board.RP.tx_usrapp.BAR_INIT_P_BAR[BAR_Hit_N - 1];
      sys_addr = sys_addr + board.Hdr_Array[3];
    end else begin
      sys_addr = board.RP.tx_usrapp.BAR_INIT_P_BAR[BAR_Hit_N - 1] +
        board.Hdr_Array[2];
    end

    if ((board.Hdr_Array[0] & 32'hFF000000) == `HEADER0_MWR4_) begin
      board.RP.tx_usrapp.TSK_TX_MEMORY_WRITE_64(board.Hdr_Array[1][15:8],
						board.Hdr_Array[0][22:20],
						board.Hdr_Array[0][9:0],
						sys_addr,
						board.Hdr_Array[0][7:4],
						board.Hdr_Array[0][3:0],
						0);
    end
    else if ((board.Hdr_Array[0] & 32'hFF000000) == `HEADER0_MWR3_) begin
      board.RP.tx_usrapp.TSK_TX_MEMORY_WRITE_32(board.Hdr_Array[1][15:8],
						board.Hdr_Array[0][22:20],
						board.Hdr_Array[0][9:0],
						sys_addr[31:0],
						board.Hdr_Array[0][7:4],
						board.Hdr_Array[0][3:0],
						0);
    end
    else if ((board.Hdr_Array[0] & 32'hFF000000) == `HEADER0_MRD4_) begin
      board.RP.tx_usrapp.TSK_TX_MEMORY_READ_64(board.Hdr_Array[1][15:8],
					       board.Hdr_Array[0][22:20],
					       board.Hdr_Array[0][9:0],
					       sys_addr,
					       board.Hdr_Array[0][7:4],
					       board.Hdr_Array[0][3:0]);
    end
    else if ((board.Hdr_Array[0] & 32'hFF000000) == `HEADER0_MRD3_) begin
      board.RP.tx_usrapp.TSK_TX_MEMORY_READ_32(board.Hdr_Array[1][15:8],
					       board.Hdr_Array[0][22:20],
					       board.Hdr_Array[0][9:0],
					       sys_addr[31:0],
					       board.Hdr_Array[0][7:4],
					       board.Hdr_Array[0][3:0]);
    end
    else if ((board.Hdr_Array[0] & 32'hFF000000) == `HEADER0_CPLD) begin
      board.RP.tx_usrapp.TSK_TX_COMPLETION_DATA(board.Hdr_Array[2][15:8],
						board.Hdr_Array[0][22:20],
						board.Hdr_Array[0][9:0],
						board.Hdr_Array[1][11:0],
						board.Hdr_Array[2][6:0],
						board.Hdr_Array[1][15:13],
						0);
    end
    else if ((board.Hdr_Array[0] & 32'hFF000000) == `HEADER0_CPL) begin
      board.RP.tx_usrapp.TSK_TX_COMPLETION(board.Hdr_Array[2][15:8],
					   board.Hdr_Array[0][22:20],
					   board.Hdr_Array[0][9:0],
					   board.Hdr_Array[1][15:13]);
    end
    else if ((board.Hdr_Array[0] & 32'hFF000000) == `HEADER0_MSG) begin
      board.RP.tx_usrapp.TSK_TX_MESSAGE(board.Hdr_Array[1][15:8],
					board.Hdr_Array[0][22:20],
					board.Hdr_Array[0][9:0],
					0, //board.RP.tx_usrapp.DATA_STORE[7:0],
					board.Hdr_Array[0][26:24],
					board.Hdr_Array[1][7:0]);
    end
    else begin
      $display("%d ns: TLP_Feed_Rx: unknown header type!", $time);
      #10 $finish;
    end
    
  end
  endtask


    /////////////////////////////////////////////
   //                                         //
  //   Function -  Endian Inversion 64-bit   //
 //                                         //
/////////////////////////////////////////////
   function [31:00] Inv_Endian;
   input [31:00] Data;
   begin
      Inv_Endian = {Data[ 7: 0], Data[15: 8], Data[23:16], Data[31:24]};
   end
   endfunction

