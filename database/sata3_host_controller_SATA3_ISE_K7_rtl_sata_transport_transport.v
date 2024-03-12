/********************************SATA COMMAND LAYER & TRANSPORT LAYER IMPLEMENTATION*****************************************

************************************************************************************************************/
module sata_transport (
   input                clk,
   input                reset,                   
   input                DMA_RQST,                     // host sets during DMA Read or Write operations
   input   [31:0]       data_in,                      // from host : shadow register write data
   input   [4:0]        addr_reg,                     // Address line 
   input   [31:0]       data_link_in,                 // from link layer to transport data_in
   input                LINK_DMA_ABORT,               // Notification  from  Link layer that the DMA Abort primitive was received
   input                link_fis_recved_frm_dev,      // from link layer to inform that new fis received from PHY
   input                phy_detect,                   // from link phy detection
   input                H_write,                      // from host to transport ...reg H_write
   input                H_read,                       // from host to transport ...reg H_read
   input                link_txr_rdy,                 // from link, link sends it satus when link receive txr rdy from transport
   input                r_ok,                         // from link successful reception
   input                r_error,                      // from link error in reception
   input                illegal_state,                // from link link denotes illegal state transition to transport
   input                end_status,                   // from link eof
   output      [31:0]   data_link_out,                // from transport data out to link
   output               FRAME_END_T,                  // T-layer indicates all data for the frame has been transferred
   output  reg          IPF,                          // interrupt bit is set by the device, TL set  interrupt pending flag to host
   output  reg          hold_L,                       // to link layer :To indicate that the RX Fifo is full
   output               WRITE_HOLD_U,                 // inform the host Layer that  the TX  Fifo is full or RX fifo is empty
   output               READ_HOLD_U,
   output  reg          txr_rdy,                      // to link layer transport is H_ready to send pkt to link
   output  reg [31:0]   data_out,                     // data read from transport to host
   output  reg          EscapeCF_T,                   // During SRST Link layer shall be informed to send  EscapeCF_TP   by TL.
   
   output  reg          UNRECGNZD_FIS_T,              // to LL :asserted, when the host TL receives a FIS with unknown type
   output  reg          FIS_ERR,                      // to link layer
   output  reg          Good_status_T,                // to LL : Asserted in return to getting the VALID_CRC_T from the LL
   output  reg          cmd_done,                     // to host : inidicates that the given command is over 
   input     [31:0]     DMA_TX_DATA_IN,               // from host : data line for DMA write operation
   input                DMA_TX_WEN,                   // from host : data write enable signal to TX FIFO during DMA write
   output    [31:0]     DMA_RX_DATA_OUT,              // to host : data line for DMA read operation
   input                DMA_RX_REN,                   // from host : data read enable signal to RX FIFO during DMA read
   input                VALID_CRC_T,                  // from LL : no CRC error
   input                data_out_vld_T,               // from LL : valid data
   input                CRC_ERR_T,                    // from LL :  CRC error
   input                DMA_INIT,                     // from host : completed DMA initialization
   output  reg          DMA_END,
   output               DATA_RDY_T,                   // to LL : T-layer indicates the availability of next Dword 
   output               RX_FIFO_RDY,                  // Receive FIFO ready
   input                data_link_rd_en_t,            // read enable from link layer for tx data out
   input                PIO_CLK_IN,                   // Clock for PIO transfer
   input                DMA_CLK_IN,                   // Clock for DMA transfer
   input                CE,                           // Chip enable,
   input                RX_FIFO_RESET,                // RX fifo reset
   input                TX_FIFO_RESET,                // TX fifo reset
   output reg           DMA_data_rcv_error            // Indicates error during DMA data receive

   ); 
   


   parameter    DMA_WR_MAX_COUNT = 'h2000; //'h200; //'d8192 bytes
      
   reg [7:0 ]   command_register;       
   reg [15:0]   features_register;
   reg [7:0 ]   control_register;
   reg [7:0 ]   dev_head_register;
   reg [7:0 ]   error_register;
   reg [15:0]   lba_low_register;      // lba [0:7] and for 48 bit adrssing prvs value lba[24:31] 
   reg [15:0]   lba_mid_register;      // lba [8:15] and for 48 bit adrssing prvs value lba[32:39]
   reg [15:0]   lba_high_register;     // lba [0:7] and for 48 bit adrssing prvs value lba[40:47] 
   reg [15:0]   sector_count_register;
   reg [7:0 ]   status_register;
   reg [31:0]   data_register_in;
   wire [31:0]   data_register_out;
   
                

/***********************************************************************************************************/
/*-------------------------DEVISE CONTROL REGISTER--------------    
 |  7   |   6   |   5   |   4   |   3   |   2    |  1     | 0  |                    
 |  HOB |   -   |   -   |   -   |   -   |   SRST |  nIEN  | 0  |        
 ---------------------------------------------------------------
 
 
    7.HOB    : higher order byte is defined by the 48bit Address feature set.
              A H_write to any Command register shall clear the HOB bit to zero.       
    2.SRST   :software reset bit
    1.nIEN   :intrupt enable bit                                               

 
    
  -----------------DEVISE/HEAD REGISTER-----------------------------------------
  | 7       |   6   |   5   |   4   |   3   |   2        |  1        |  0      |                    
  | -       |   L   |   -   |   -   |  DEV  |   HS3      |  HS1      |  HS0    |                
  ------------------------------------------------------------------------------
  
  1.DEV   : devise selection bit
  2.HS3
  3.HS2   : Head select bits. The HS3 through HS0 contain bits 24-27 of the LBA.
  4.HS0     At command completion, these bits are updated to reflect the current LBA bits24-27
  
  
  
   -------------------ERROR REGISTER-------------------------------------------
    |   7   |   6   |   5   |   4   |   3   |   2    |  1          | 0        |                   
    | ICRC  |  UNC  |   0   |  IDNF |  0    |   ABRT |      TKONF  |    AMNF  |            
   ----------------------------------------------------------------------------
   
• ICRC  :   Interface CRC Error. CRC=1 indicates a CRC error has occurred on the data bus
            during a Ultra-DMA transfer.
• UNC   :   Uncorrectable Data Error. UNC=1 indicates an uncorrectable 
            data error has been encountered.
• IDNF  :   ID Not Found. IDN=1 indicates the requested sector's ID field cound not be found .
• ABRT  :   Aborted Command. ABT=1 indicates the requested command has been aborted 
            due to a device status error or an invalid parameter in an output register.
• TKONF :   Track 0 Not Found. T0N=1 indicates track 0 was not found during a 
            Recalibrate command.
• AMNF  :   Address Mark Not Found. When AMN=1, it indicates that the data address mark 
            has not been found after finding the correct ID field for the requested sector.
    
 
          
   -------------------STATUS REGISTER-------------------------------------------------
    |   7       |   6   |   5   |   4          |   3    |   2     |  1      | 0      |                      
    |  BSY      |  DRDY |   DF  |  DSC         |  DRQ   |   CORR  | IDX     |   ERR  |         
   -----------------------------------------------------------------------------------
 Definition :
 1.BSY  :   busy bit
 2.DRDY :   devise H_ready bit
 3.DF   :   devise fault
 4.DSC  :   devise seek complete
 5.DRQ  :   data request
 6.corr :   corrected data
 7.IDX  :   index
 8.ERR  :   error

 
 
*********************************************************************************************************** */

/***********internal signals**********************/

   reg [31:0]       fis_reg_DW0;
   reg [31:0]       fis_reg_DW1;
   reg [31:0]       fis_reg_DW2;
   reg [31:0]       fis_reg_DW3;
   reg [31:0]       fis_reg_DW4;
   reg [31:0]       fis_reg_DW5;
   reg [31:0]       fis_reg_DW6;
   reg [31:0]       DMA_Buffer_Identifier_Low;
   reg [31:0]       DMA_Buffer_Identifier_High;
   reg [31:0]       DMA_Buffer_Offset;
   reg [31:0]       DMA_Transfer_Count;
   reg [2:0]        fis_count;
   reg [4:0]        state;
   reg              detection;
   reg              cmd_en;
   reg              ctrl_en;
   reg              tx_wen_pio;
   reg [15:0]       count;
   reg [15:0]       H_read_count;
   reg              rcv_fifo_wr_en;
   reg  [31:0]      data_rcv_fifo;
   reg              prvs_pio;
   reg              Status_init;
   reg              Pending_DMA;
   reg              ctrl_srst_en;
   reg   [15:0]     Transfer_cnt_PIO;
   reg   [15:0]     recv_pio_dma_cnt;
   reg              rcv_fifo_rd_en_dly;

   // added by Shameerudheen
   reg       [31:0] data_link_out_int;
   reg              data_link_out_wr_en;
   reg              tl_ll_tx_fifo_reset;
   reg              pio_rcv_flag;
   reg              tx_fifo_pio_rd_en;
   reg       [7:0]  temp_status_reg;
   reg              direction_bit; //1 device to host; 0 host to device
   reg              tx_fifo_pio_wr_en;
   reg      [31:0]  rcv_fifo_din;
   //reg      [31:0]  Transfer_cnt_DMA;
   reg              DMA_rcv_flag;
   reg      [15:0]  recv_dma_cnt;
   reg              tx_fifo_dma_rd_en;
   reg       [3:0]  rst_delay_count;
   reg       [4:0]  dest_state;
   
   wire             tx_fifo1_reset;
   wire             rx_fifo1_reset;
   
   
   
   wire             tx_fifo_empty;
   wire[31:0]       tx_fifo_dout;
   wire             rcv_fifo_full;
   wire             rcv_fifo_almost_empty;
   wire [31:0]      rcv_fifo_data_out;
   wire             tx_wen_fifo; 
   wire [31:0]      tx_data_fifo;
   wire             rcv_fifo_rd_en;
   wire             rx_ren_pio;
   wire             txr_ren_pio;
   //wire             tx_fifo_dma_rd_en;
   wire             link_txr_rdy_PIO;
   
   // added by Shameerudheen
   wire             tl_ll_tx_fifo_empty;
   wire             tl_ll_tx_fifo_almost_empty;
   wire             rcv_fifo_prog_full;
   wire             rx_fifo_pio_rd_en;
   wire             rx_fifo_rd_clk;
   wire             tx_fifo_prog_full;
   wire             tl_ll_tx_fifo_full;
   wire             tx_fifo_almost_empty;
   
   wire      [31:0] tx_fifo_din;

/*************************states************************************/

   
   parameter HT_HostIdle           =   5'h 0       ;
   parameter HT_ChkTyp             =   5'h 1       ;
   parameter HT_CmdFIS             =   5'h 2       ;
   parameter HT_CntrlFIS           =   5'h 3       ;
   parameter HT_DMASTUPFIS         =   5'h 4       ;
   parameter HT_DMASTUPTransStatus =   5'h 5       ;
   parameter HT_CtrlTransStatus    =   5'h 6       ;
   parameter HT_PIOOTrans2         =   5'h 7       ;
   parameter HT_RegFIS             =   5'h 8       ;
   parameter HT_DB_FIS             =   5'h 9       ;
   parameter HT_DMA_FIS            =   5'h A      ;
   parameter HT_PS_FIS             =   5'h B      ;
   parameter HT_DS_FIS             =   5'h C      ;
   parameter HT_RcvBIST            =   5'h D      ;
   parameter HT_DMAITrans          =   5'h E      ;
   parameter HT_PIOITrans1         =   5'h F      ;
   parameter HT_CmdTransStatus     =   5'h 10      ;
   parameter HT_RegTransStatus     =   5'h 11      ;
   parameter HT_PIOEnd             =   5'h 12      ;
   parameter HT_PIOOTrans1         =   5'h 13      ;
   parameter HT_PIOITrans2         =   5'h 14      ;
   parameter HT_DMAOTrans1         =   5'h 15      ;
   parameter HT_DMAOTrans2         =   5'h 16      ;
   parameter HT_DMAEnd             =   5'h 17      ;
   parameter HT_tl_ll_tx_fifo_rst_delay = 5'h 18;       
   
/***************ADDRESS PARAMETER***************************************/


   parameter cmd_reg               =  8'd1        ;
   parameter ctrl_reg              =  8'd2        ;
   parameter feature_reg           =  8'd3        ;
   parameter stuts_reg             =  8'd4        ;
   parameter head_reg              =  8'd5        ;
   parameter error_reg             =  8'd6        ;
   parameter lba_low               =  8'd7        ;
   parameter lba_mid               =  8'd8        ;
   parameter lba_high              =  8'd9        ;
   parameter sect_count            =  8'd10       ;
   parameter data_reg              =  8'd11       ;
   
   parameter DEVICE_RESET          = 8'h08       ;
   
   //assign Transfer_cnt_DMA      = sector_count_register;
   assign rx_ren_pio            = (~rcv_fifo_almost_empty);
   assign txr_ren_pio           = (~tx_fifo_empty && link_txr_rdy_PIO && (state == HT_PIOOTrans2 ) && (count!= 'd2044));
   assign link_txr_rdy_PIO      = link_txr_rdy? 1'b1:txr_ren_pio;
   //assign tx_fifo_dma_rd_en     = (~tx_fifo_empty && link_txr_rdy_PIO && (state == HT_DMAOTrans2 ) && (count!= 'd2044));
   
  always @(posedge clk)
  begin
    if(reset) begin
      rcv_fifo_rd_en_dly   <=      1'b0;
    end   
    else begin
      rcv_fifo_rd_en_dly   <=      rx_ren_pio;
    end
  end  

  
  
  //***************************** makindg PIO Data Transfer count *****************************
  always @(posedge clk, posedge reset) begin
    if(reset) begin  
      Transfer_cnt_PIO       <= 1'b0  ;
    end
    else begin
      if(state == HT_PIOITrans1 || state == HT_PIOOTrans1) begin  
        Transfer_cnt_PIO  <= fis_reg_DW4[15:0] ; 
      end
      else begin
        Transfer_cnt_PIO <= Transfer_cnt_PIO ;
      end
    end
  end  

  //***************************** makindg cmd _en & cntrl_en signals *****************************
  always @(posedge clk) begin
    if(reset) begin  
      cmd_en       <= 1'b0  ;
      ctrl_en      <= 1'b0  ;    
      ctrl_srst_en <= 1'b0  ;
    end
    else if(addr_reg == cmd_reg && H_write && CE &&((!status_register[7] && !status_register[3]) || (data_in == DEVICE_RESET)))
      cmd_en <= 1'b1 ;
    else if(addr_reg == ctrl_reg && H_write && CE) begin  
      if(data_in[2] == 1'b1)
        ctrl_srst_en <= 1'b1 ;
      else
        ctrl_en     <=  1'b1 ;    
    end
    else if(state == HT_CmdTransStatus && r_ok)
      cmd_en       <= 1'b0  ;
    else if(state == HT_CtrlTransStatus && r_ok) begin  
      if(ctrl_srst_en)
        ctrl_srst_en  <= 1'b0 ;
      else
        ctrl_en <= 1'b0 ;
    end
    else begin
      cmd_en       <=  cmd_en       ;
      ctrl_en      <=  ctrl_en      ;    
      ctrl_srst_en <=  ctrl_srst_en ;
    end
    
  end

  //*****************************************status register updation******************************************************

  always @(posedge clk, posedge reset)
  begin
    if(reset) begin   
      Status_init     <= 1'b0  ;
      detection       <= 1'b0  ;
      status_register <= 8'h80 ; 
    end
    else if(phy_detect && !Status_init) begin                            
      status_register <= 8'h80 ; 
      detection       <= 1'b1  ;
      Status_init     <= 1'b1  ;
    end
    else if(!phy_detect && Status_init) begin 
      status_register <= 8'hff ; 
      detection       <= 1'b0  ;
      Status_init     <= 1'b0  ;
    end  
    else if(state == HT_RegTransStatus && VALID_CRC_T)  begin  
      status_register <= fis_reg_DW0[23:16] ;
    end
    else if(H_write && (addr_reg == cmd_reg ) && CE) begin  
      status_register[7] <= 1'd1 ;
    end 
    else if(H_write && CE && (addr_reg == ctrl_reg) && (data_in[2]== 1'b1)) begin  
      status_register[7] <= 1'd1 ;
    end
    else if(state == HT_PIOITrans1) begin 
      //status_register <= fis_reg_DW0[23:16] ; 
      status_register <= temp_status_reg ; // Updating initial status during PIO read
    end
    else if(state == HT_PIOOTrans1 ) begin 
      //status_register <= fis_reg_DW0[23:16];
      status_register <= temp_status_reg; // Updating initial status during PIO write
    end
    else if(state == HT_PIOEnd ) begin
      status_register[7:1] <= fis_reg_DW3[31:23]; //Ending status, error bit updating seperatly
      //for PIO DATA transfer error reporting; need to check whether this bit has to be updated or any other bit.
      if(illegal_state || r_error || CRC_ERR_T) begin 
        status_register[0] <= 1;
      end 
      else if(r_ok || VALID_CRC_T) begin
        status_register[0] <= 0;
      end 
      else begin
        status_register[0] <= status_register[0];
      end
    end
    //for DMA DATA transfer error reporting; need to check whether this bit has to be updated or any other bit.
    else if(state == HT_DMAEnd && (illegal_state || r_error || CRC_ERR_T) ) begin
      status_register[0] <= 1;
      status_register[7] <= 1'd0;
      status_register[3] <= 1'd0;
    end 
    else if(state == HT_DMAEnd && (r_ok || VALID_CRC_T) ) begin
      status_register[0] <= 0;
    end
    else if (state == HT_PIOITrans1 || state == HT_PIOITrans2 || state == HT_PIOOTrans2 ||
             state == HT_PIOOTrans1 || state == HT_DMAOTrans1 || state == HT_DMAOTrans2 || state == HT_DMAITrans) begin
      if (illegal_state) begin
        status_register[0] <= 1;
      end
      else begin
        status_register[0] <= 0;
      end
    end
    else begin
      status_register <= status_register; //Ending status
    end
  end //always
  
  
  //IPF Iterupt pending flag setting.
  always @(posedge clk, posedge reset)
  begin
    if(reset) begin
      IPF <= 0;
    end
    else begin
      if((state == HT_RegTransStatus && VALID_CRC_T) ||                                        
              (state == HT_PIOITrans1) || 
              (state == HT_PIOOTrans1) ) begin
              
        IPF <= fis_reg_DW0[14];
      end
      else if(state == HT_DMAEnd && (r_ok || VALID_CRC_T) ) begin
        IPF <= 1;
      end
      else if (H_write && addr_reg == cmd_reg && CE) begin
        IPF <= 0;
      end
      else if (H_read && addr_reg == stuts_reg && CE) begin
        IPF <= 0;
      end
      else begin
        IPF <= IPF;
      end        
    end
  end //always
  
  
  //*************************************************************************************************
  //..................register writing for shadow registers and trigger generation..................*
  //*************************************************************************************************
  always @(posedge clk)
  begin
    if(reset) begin
      command_register      <=  8'hff     ;
      control_register      <=  8'h00     ;
      features_register     <=  16'h0000  ;           
      dev_head_register     <=  8'h00     ;  
      error_register        <=  8'h00    ;     
      lba_low_register      <=  16'h0000  ;    
      lba_mid_register      <=  16'h0000  ;    
      lba_high_register     <=  16'h0000  ;   
      sector_count_register <=  16'h0000  ;               
      data_register_in      <=  32'd0   ;
      //IPF                   <=  1'b0    ; 
      //HOLD_U                <=  1'b0    ;
      tx_wen_pio            <=  1'b0    ;
      tx_fifo_pio_wr_en     <= 0;
    end
  // shadow register writing.........only bsy bit and drdy is proper........//
    else begin
      //if(H_write && !DMA_RQST) begin
      if(H_write && CE) begin
        case(addr_reg )
          cmd_reg: begin
            tx_fifo_pio_wr_en <= 0;
            if((!status_register[7] && !status_register[3]) || (data_in == DEVICE_RESET) )begin        
              command_register <= data_in ;       
            end
            else begin
              command_register <= command_register ;       
            end  
          end
          ctrl_reg: begin
            control_register <= data_in ;  
          end
          feature_reg: begin
            tx_fifo_pio_wr_en <= 0;
            if((!status_register[7] && !status_register[3]))begin        
              features_register <= data_in ;   
            end
            else begin
              features_register <= features_register ;       
            end  
          end
          head_reg: begin
            tx_fifo_pio_wr_en <= 0;
            if((!status_register[7] && !status_register[3]))begin        
              dev_head_register <= data_in ;  
            end
            else begin
              dev_head_register <= dev_head_register ;       
            end  
          end
          error_reg: begin
            tx_fifo_pio_wr_en <= 0;
            error_register <= data_in ;
          end 
          lba_low: begin
            tx_fifo_pio_wr_en <= 0;
            if((!status_register[7] && !status_register[3]))begin        
              lba_low_register <= data_in ;   
            end
            else begin
              lba_low_register <= lba_low_register ;       
            end  
          end
          lba_mid: begin
            tx_fifo_pio_wr_en <= 0;
            if((!status_register[7] && !status_register[3]))begin        
              lba_mid_register <= data_in ;
            end
            else begin
              lba_mid_register <= lba_mid_register ;       
            end  
          end
          lba_high: begin
            tx_fifo_pio_wr_en <= 0;
            if((!status_register[7] && !status_register[3]))begin        
              lba_high_register <= data_in ;
            end
            else begin
              lba_high_register <= lba_high_register ;       
            end  
          end
          sect_count: begin
            tx_fifo_pio_wr_en <= 0;
            if((!status_register[7] && !status_register[3]))begin        
              sector_count_register <= data_in;
            end
            else begin
              sector_count_register <= sector_count_register;       
            end  
          end
          data_reg: begin
            //if((!status_register[7] && status_register[3]))begin 
            data_register_in  <= data_in;
            tx_fifo_pio_wr_en <= 1;
            //end
            //else begin
            //  data_register_in  <= 32'h0;
            //  tx_fifo_pio_wr_en <= 0;              
            //end
          end                      
        endcase
      end 
      else if((state == HT_RegTransStatus && VALID_CRC_T) ||                                        
              (state == HT_PIOITrans1) || 
              (state == HT_PIOOTrans1) ) begin
        //if (control_register[1] == 1) begin
        //  IPF <= 0;
        //end
        //else begin
        //  IPF <= fis_reg_DW0[14];
        //end
        error_register        <=  fis_reg_DW0[31:24];
        dev_head_register     <=  fis_reg_DW1[31:24];
        lba_low_register      <=  {fis_reg_DW2[7:0], fis_reg_DW1[7:0]};
        lba_mid_register      <=  {fis_reg_DW2[15:8], fis_reg_DW1[15:8]};
        lba_high_register     <=  {fis_reg_DW2[23:16], fis_reg_DW1[23:16]};
        sector_count_register <=  fis_reg_DW3[15:0];
        tx_fifo_pio_wr_en     <= 0; 
      end
      else begin
        tx_wen_pio        <= 0;
        tx_fifo_pio_wr_en <= 0; 
        //HOLD_U     <= 1'b0;
      end
    end
  end   
  
  
            
  //*********************************************************************
  // ..........H_readING OF SHADOW REGISTER...............................*
  //*********************************************************************

  // shadow register H_reading.........only bsy bit and drdy is proper....//  
  //always @(posedge clk)
  always @(*)
  begin
     if(H_read && detection && CE ) begin       
       case(addr_reg)            
         cmd_reg     :   
         begin       
           data_out <= command_register;           
         end                                 
         ctrl_reg    :                       
         begin                               
           data_out <=  control_register;
         end                                 
         feature_reg :                       
         begin                               
           data_out <= features_register;   
         end                                 
         head_reg    :                       
         begin                               
           data_out <= dev_head_register;   
         end                                 
         error_reg   :                       
         begin                               
           data_out <= error_register;
         end                                 
         lba_low     :                       
         begin                               
           data_out <= lba_low_register;   
         end                                 
         lba_mid     :                       
         begin                               
           data_out <= lba_mid_register;
         end                                 
         lba_high    :                       
         begin                               
           data_out <= lba_high_register;
         end                                 
         sect_count  : 
         begin
           data_out <= sector_count_register;
         end
         stuts_reg: 
         begin
           data_out <= status_register;
         end                                 
         data_reg:                           
         begin
           data_out <= data_register_out; 
         end                                 
         default:                        
         begin                               
          data_out <= 'h80;         
         end                                    
       endcase                             
     end                                   
     else begin                                 
       data_out <= 'h80; 
     end
  end 

  //*************************************************************************
  //.....................MAIN STATE.........................................*
  //*************************************************************************

  always @(posedge clk) begin
    if (reset) begin  
      txr_rdy             <= 1'b0;
      state               <= HT_HostIdle ;
      H_read_count        <= 16'd0;
      rcv_fifo_wr_en      <= 1'b0;
      data_rcv_fifo       <= 32'd0;
      data_link_out_int   <= 32'd0;
      //frame_end_T        <= 1'b0;
      FIS_ERR             <= 1'b0;
      UNRECGNZD_FIS_T     <= 1'b0;
      Good_status_T       <= 1'b0;
      hold_L              <= 1'b0;
      recv_pio_dma_cnt    <= 16'd0;
      count               <= 16'b0;
      cmd_done            <= 1'd0;
      prvs_pio            <= 1'b0;
      fis_reg_DW0         <= 32'b0;
      fis_reg_DW1         <= 32'b0;
      fis_reg_DW2         <= 32'b0;
      fis_reg_DW3         <= 32'b0;
      fis_reg_DW4         <= 32'b0;
      fis_reg_DW5         <= 32'b0;
      fis_reg_DW6         <= 32'b0;
      fis_count           <= 3'd0;
      EscapeCF_T          <= 1'b0;
      //data_rdy_T         <= 1'b0;
      tl_ll_tx_fifo_reset <= 0;
      data_link_out_wr_en <= 0;
      pio_rcv_flag  <= 0;
      tx_fifo_pio_rd_en   <= 0;
      temp_status_reg     <= 8'h00;
      direction_bit       <= 1;
      //Transfer_cnt_DMA  <= 32'b0;
      DMA_rcv_flag        <= 0;
      recv_dma_cnt        <= 16'h0;
      rst_delay_count     <= 3'h0;
      DMA_data_rcv_error  <= 0;
    end  
    else if(detection) begin
    
      case(state)
        HT_HostIdle: begin
          data_rcv_fifo       <= 32'd0;
          FIS_ERR             <= 1'b0;
          UNRECGNZD_FIS_T     <= 1'b0;
          Good_status_T       <= 1'b0;
          EscapeCF_T          <= 1'b0;
          //data_link_out_wr_en <= 0;
          //frame_end_T     <= 1'b0;
          pio_rcv_flag        <= 0;
          DMA_rcv_flag        <= 0;
          recv_dma_cnt        <= 16'h0;
          rst_delay_count     <= 3'h0;
          DMA_data_rcv_error  <= 0;
          
          if(link_fis_recved_frm_dev ) begin      
            state      <= HT_ChkTyp;
            fis_count  <= 3'd0;        
          end
          else if(ctrl_srst_en) begin      
            dest_state          <= HT_CntrlFIS;
            state               <= HT_tl_ll_tx_fifo_rst_delay;
            //txr_rdy             <= 1'b1;
            fis_count           <= 3'd0;
            tl_ll_tx_fifo_reset <= 1; 
          end
          else if(cmd_en) begin      
            dest_state          <= HT_CmdFIS;
            state               <= HT_tl_ll_tx_fifo_rst_delay;
            //txr_rdy             <= 1'b1;   
            fis_count           <= 3'd0;
            tl_ll_tx_fifo_reset <= 1;      
          end
          else if(ctrl_en) begin      
            //txr_rdy   <= 1'b1;
            dest_state          <= HT_CntrlFIS;
            state               <= HT_tl_ll_tx_fifo_rst_delay;   
            fis_count           <= 3'd0;
            tl_ll_tx_fifo_reset <= 1;
          end
          else if(prvs_pio  && !tx_fifo_empty ) begin  //H_write && (addr_reg == data_reg)
            tl_ll_tx_fifo_reset <= 0;
            if(link_txr_rdy) begin      
              data_link_out_int   <= 32'h0046;
              data_link_out_wr_en <= 1;
              tx_fifo_pio_rd_en   <= 1;
              txr_rdy             <= 1'b0;
              state               <= HT_PIOOTrans2;
              prvs_pio            <= 1'b0;
            end
            else begin
              state               <= HT_HostIdle; 
              txr_rdy             <= 1'b1; 
              prvs_pio            <= 1'b1;
              data_link_out_wr_en <= 0;
              tx_fifo_pio_rd_en   <= 0;
            end
          end
          //else if(DMA_RQST || Pending_DMA) begin                        //hav to check later     
          else if(Pending_DMA) begin                        
            state   <= HT_DMASTUPFIS; 
            txr_rdy <= 1'b1;
            tl_ll_tx_fifo_reset <= 1;
            tx_fifo_pio_rd_en   <= 0;
          end
        end
        
        HT_tl_ll_tx_fifo_rst_delay: begin
          rst_delay_count <= rst_delay_count + 1;
          tl_ll_tx_fifo_reset <= 0;
          if (rst_delay_count == 3'h 4) begin
            state   <= dest_state;
            txr_rdy <= 1;
          end
          else begin
            state  <= HT_tl_ll_tx_fifo_rst_delay;
            txr_rdy <= 0;
          end
        end
        
        HT_ChkTyp:
        begin
          if(illegal_state) begin       
            state           <= HT_HostIdle;
            UNRECGNZD_FIS_T <= 0;
          end
          else if(data_out_vld_T) begin 
            fis_count   <= fis_count + 1'b 1;
            fis_reg_DW0 <= data_link_in;
            
            if(data_link_in[7:0] == 8'h34) begin       //Reg FIS       
              state           <= HT_RegFIS;
              prvs_pio        <= 1'b0;
              UNRECGNZD_FIS_T <= 0;
            end
            else if(data_link_in[7:0] == 8'hA1) begin  //Set Device Bits FIS Device to Host
              state           <= HT_DB_FIS;
              prvs_pio        <= 1'b0;
              UNRECGNZD_FIS_T <= 0;
            end
            else if(data_link_in[7:0] == 8'h39) begin  //DMA Active FIS Device to Host
              state           <= HT_DMA_FIS;
              prvs_pio        <= 1'b0;
              UNRECGNZD_FIS_T <= 0;
            end
            else if(data_link_in[7:0] == 8'h5F) begin  //PIO Setup FIS Device to Host
              state           <= HT_PS_FIS;
              prvs_pio        <= 1'b1;
              UNRECGNZD_FIS_T <= 0;
              temp_status_reg <= data_link_in[23:16];
            end
            else if(data_link_in[7:0] == 8'h41) begin  //DMA Setup FIS -- Bidirectional
              state           <= HT_HostIdle; // HT_DS_FIS; not implemented
              prvs_pio        <= 1'b0;
              UNRECGNZD_FIS_T <= 0;
            end
            else if(data_link_in[7:0] == 8'h58) begin  //BIST Active FIS Bi-Directional
              state           <= HT_HostIdle; //HT_RcvBIST; not implemented
              prvs_pio        <= 1'b0;
              UNRECGNZD_FIS_T <= 0;
            end
            else if(data_link_in[7:0] == 8'h46  && prvs_pio) begin     //DATA FIS Biderectional and previous PIO FIS
              state            <= HT_PIOITrans1;
              rcv_fifo_wr_en   <= 0;
              recv_pio_dma_cnt <= recv_pio_dma_cnt + 'd4; 
              prvs_pio         <= 1'b0;
              UNRECGNZD_FIS_T  <= 0;
            end
            else if(data_link_in[7:0] == 8'h46) begin   //DATA FIS Biderectional no previous PIO (for DMA)
              state            <= HT_DMAITrans;
              prvs_pio         <= 1'b0;
              UNRECGNZD_FIS_T  <= 0;
              recv_dma_cnt     <= 16'h0;
              rcv_fifo_wr_en   <= 0;
              DMA_rcv_flag     <= 1;
              //Transfer_cnt_DMA <= Transfer_cnt_DMA - 'd4;
            end
            else begin          
              state           <= HT_HostIdle;
              UNRECGNZD_FIS_T <= 1;
            end
          end         
          else begin
            state           <= state;
            UNRECGNZD_FIS_T <= 0;
          end
        end
          
        HT_CmdFIS: begin  
        
          tl_ll_tx_fifo_reset <= 0;
          
          if(link_fis_recved_frm_dev) begin      
            state               <= HT_ChkTyp;        // new Fis is received in the linklayer from device
            fis_count           <= 0;
            data_link_out_wr_en <= 0;
          end
          else if(illegal_state) begin      
            state               <= HT_HostIdle;
            fis_count           <= 0;
            data_link_out_wr_en <= 0;
          end
          else if(link_txr_rdy) begin      
            txr_rdy             <= 0;
            data_link_out_int   <= {features_register[7:0],command_register,8'h80,8'h27};
            fis_count           <= fis_count + 1;
            //data_rdy_T          <= 1'b1;
            state               <= state;
            data_link_out_wr_en <= 1;
          end
          else if(fis_count == 1) begin      
            data_link_out_int   <= {dev_head_register,lba_high_register[7:0],lba_mid_register[7:0],lba_low_register[7:0]};
            fis_count           <= fis_count + 1;
            state               <= state ;
            data_link_out_wr_en <= 1;
          end
          else if(fis_count == 2) begin      
            data_link_out_int   <= {features_register[15:8],lba_high_register[15:8],lba_mid_register[15:8],lba_low_register[15:8]} ;   
            fis_count           <= fis_count + 1 ;
            state               <= state ;
            data_link_out_wr_en <= 1;
          end
          else if(fis_count == 3) begin      
            data_link_out_int   <= {control_register,8'd0,sector_count_register[15:8],sector_count_register[7:0]} ;    
            fis_count           <= fis_count + 1;
            //data_rdy_T    <= 1'b0;
            state               <= state;
            data_link_out_wr_en <= 1;
            //Transfer_cnt_DMA    <= {7'b0, sector_count_register[15:0], 9'b0};
          end
          else if(fis_count == 4) begin      
            data_link_out_int   <= {32'h00};
            fis_count           <= 0;
            state               <= HT_CmdTransStatus;
            data_link_out_wr_en <= 1;
            //frame_end_T   <= 1'b1;
          end
          else begin
            state               <= state;
            data_link_out_wr_en <= 0;
          end 
        end
        
        HT_CmdTransStatus: begin
          data_link_out_wr_en <= 0;
          if(r_ok) begin      
            state <= HT_HostIdle ;
            cmd_done   <= 1'b1;
          end
          else if(r_error || illegal_state) begin      
            state <= HT_HostIdle ;
            cmd_done   <= 1'b0;
          end
          else begin      
            state <= state  ;
          end
        end   
                       
        HT_CntrlFIS:
        begin
          tl_ll_tx_fifo_reset <= 0;
          if(link_fis_recved_frm_dev) begin      
            state <= HT_ChkTyp ;        // new Fis is received in the linklayer from device
            fis_count  <= 3'd0      ;        
          end
          else if(illegal_state) begin      
            state <= HT_HostIdle ;
            data_link_out_wr_en <= 0;
          end
          else if(link_txr_rdy) begin      
            txr_rdy             <= 1'b0        ;
            //data_link_out_int   <= {features_register[7:0],command_register,8'h00,8'h27} ;
            data_link_out_int   <= {24'h 0, 8'h 27};
            data_link_out_wr_en <= 1;
            fis_count           <= fis_count+1 ;
            //data_rdy_T        <= 1'b1        ;
            state               <= state ;
          end
          else if(fis_count==3'd1) begin      
            //data_link_out_int <= {dev_head_register,lba_high_register[7:0],lba_mid_register[7:0],lba_low_register[7:0]} ;
            data_link_out_int <= 32'h 0;
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1 ;
            state    <= state ;
          end
          else if(fis_count==3'd2) begin      
            //data_link_out_int <= {features_register[15:8],lba_high_register[15:8],lba_mid_register[15:8],lba_low_register[15:8]} ; 
            data_link_out_int <= 32'h 0;            
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1 ;
            state    <= state ;
          end
          else if(fis_count==3'd3) begin      
            //data_link_out_int <= {control_register,8'd0,sector_count_register[15:8],sector_count_register[7:0]}  ; 
            data_link_out_int <= {control_register, 24'h 0};            
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1 ;
            //data_rdy_T    <=  1'b0               ;
            state    <= state ;
          end
          else if(fis_count==3'd4) begin      
            data_link_out_int <=  {32'h00}           ;
            data_link_out_wr_en <= 1;
            fis_count     <=  3'd0               ;
            state    <=  HT_CtrlTransStatus ;
            //frame_end_T   <=  1'b1               ;
          end
          else begin      
            state <= state ;
            data_link_out_wr_en <= 0;
          end 
        end         
             
        HT_CtrlTransStatus:
        begin
          data_link_out_wr_en <= 0;
          if(r_ok) begin       
            state <= HT_HostIdle ;
          end
          else if(r_error || illegal_state) begin       
            state <= HT_HostIdle ;
          end
          else begin      
            state <= state ;
          end
        end          
            
        HT_DMASTUPFIS:
        begin
          tl_ll_tx_fifo_reset <= 0;
          if(link_fis_recved_frm_dev) begin       
            state <= HT_ChkTyp ;        // new Fis is received in the linklayer from device
            fis_count  <= 3'd0      ;        
          end
          else if(illegal_state) begin      
            data_link_out_wr_en <= 0;
            state <= HT_HostIdle ;
          end 
          else if(link_txr_rdy) begin       
            txr_rdy       <= 1'b0                ;
            data_link_out_int <= {16'h0,8'h50,8'h41} ;
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1         ;
            //data_rdy_T    <= 1'b1                ;
            state    <= state ;
          end
          else if(fis_count==3'd1) begin       
            data_link_out_int <= DMA_Buffer_Identifier_Low ;
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1               ;
            state    <= state ;
          end
          else if(fis_count==3'd2) begin       
            data_link_out_int <= DMA_Buffer_Identifier_High ;   
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1                ;
            state    <= state ;
          end
          else if(fis_count==3'd3) begin       
            data_link_out_int <= 32'h0       ;    
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1 ;
            state    <= state ;
          end
          else if(fis_count==3'd4) begin       
            data_link_out_int <= DMA_Buffer_Offset ;
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1       ;
            state    <= state ;
          end
          else if(fis_count==3'd5) begin       
            data_link_out_int <= DMA_Transfer_Count ;
            data_link_out_wr_en <= 1;
            fis_count     <= fis_count+1        ;
            //data_rdy_T    <= 1'b0                  ;
            state    <= state ;
          end
          else if(fis_count==3'd6) begin       
            data_link_out_int <= 32'h0                 ;
            data_link_out_wr_en <= 1;
            fis_count     <= 3'd0                  ;
            state    <= HT_DMASTUPTransStatus ;
            //frame_end_T   <= 1'b1                  ;
          end                        
          else begin                  
            state <= state  ;
            data_link_out_wr_en <= 0;
          end 
        end         
            
        HT_DMASTUPTransStatus:
        begin
          data_link_out_wr_en <= 0;
          if(r_error || illegal_state) begin       
            Pending_DMA <= 1'b1        ;
            state  <= HT_HostIdle ;
          end
          else if(r_ok) begin       
            Pending_DMA <= 1'b0        ;
            state  <= HT_HostIdle ;
          end
          else begin       
            Pending_DMA <= Pending_DMA ;
            state  <= state  ;
          end
        end  
            
        HT_DMA_FIS:   //DMA Activate FIS
        begin
          if(VALID_CRC_T) begin       
            Good_status_T       <= 1'b1;
            dest_state          <= HT_DMAOTrans1;
            state               <= HT_tl_ll_tx_fifo_rst_delay;  
            tl_ll_tx_fifo_reset <= 1;
          end            
          else if(CRC_ERR_T) begin                                   
            state         <= HT_HostIdle ;
            Good_status_T <= 1'b0;
          end
          else if(illegal_state) begin       
            state <= HT_HostIdle ;
            Good_status_T <= 0;
          end
          else begin      
            state         <=  HT_DMA_FIS ;
            Good_status_T <= 0;
          end
        end
            
        HT_DMAOTrans1:
        begin
          Good_status_T       <= 0;
          tl_ll_tx_fifo_reset <= 0;
          if(control_register[2] || (command_register == DEVICE_RESET)) begin       
            state               <= HT_HostIdle;
            EscapeCF_T          <= 1'b1;
            tl_ll_tx_fifo_reset <= 0;
            tx_fifo_dma_rd_en   <= 0;
          end
          //else if(!DMA_INIT) begin
          else if(!DMA_RQST) begin
            state               <= HT_DMAOTrans1;
            EscapeCF_T          <= 1'b0;
            tl_ll_tx_fifo_reset <= 0;
            tx_fifo_dma_rd_en   <= 0;
          end
          else if(DMA_RQST) begin 
             if(link_txr_rdy) begin      
              data_link_out_int   <= 32'h0046;
              data_link_out_wr_en <= 1;
              tx_fifo_dma_rd_en   <= 1;
              txr_rdy             <= 1'b0;
              state               <= HT_DMAOTrans2;
              prvs_pio            <= 1'b0;
            end
            else begin
              state               <= HT_DMAOTrans1; 
              txr_rdy             <= 1'b1; 
              data_link_out_wr_en <= 0;
              tx_fifo_dma_rd_en   <= 0;
            end
            EscapeCF_T          <= 1'b0;
            recv_pio_dma_cnt    <= 0;
          end            
          else begin 
            state               <= HT_DMAOTrans1;
            EscapeCF_T          <= 1'b0;
            tl_ll_tx_fifo_reset <= 0;
            tx_fifo_dma_rd_en   <= 0;
          end            
        end
               
        HT_DMAOTrans2:
        begin
          tl_ll_tx_fifo_reset <= 0;
          data_link_out_int   <= tx_fifo_dout;
          if(LINK_DMA_ABORT) begin      
            state               <= HT_DMAEnd;
            tx_fifo_dma_rd_en   <= 0;
            data_link_out_wr_en <= 0;
          end
          else if(illegal_state) begin      
            state               <= HT_HostIdle;
            tx_fifo_dma_rd_en   <= 0;
            data_link_out_wr_en <= 0;
          end
          else if(control_register[2] || (command_register == DEVICE_RESET)) begin      
            state               <= HT_HostIdle;
            EscapeCF_T          <= 1'b1;
            tx_fifo_dma_rd_en   <= 0;
            data_link_out_wr_en <= 0;
          end
          
          else if(tx_fifo_empty || recv_pio_dma_cnt == DMA_WR_MAX_COUNT ) begin
            state               <= HT_DMAEnd;
            count               <= 16'b0;
            tx_fifo_dma_rd_en   <= 0;
            data_link_out_wr_en <= 0;
            recv_pio_dma_cnt <= 16'b0;          
          end
          else if(!tl_ll_tx_fifo_full && !tx_fifo_empty) begin 
            if (tx_fifo_almost_empty || recv_pio_dma_cnt == (DMA_WR_MAX_COUNT - 4)) begin
              tx_fifo_dma_rd_en   <= 0;
            end
            else begin
              tx_fifo_dma_rd_en   <= 1;
            end        
            data_link_out_wr_en <= 1;
            recv_pio_dma_cnt    <= recv_pio_dma_cnt+'d4;
            state               <= HT_DMAOTrans2;
          end
          else begin      
            tx_fifo_dma_rd_en   <= 0;
            data_link_out_wr_en <= 0;
            state               <= HT_DMAOTrans2 ;
            recv_pio_dma_cnt    <= recv_pio_dma_cnt;
          end
        end
      
          
        HT_DMAEnd:
        begin
          if (DMA_rcv_flag) begin
            if (VALID_CRC_T) begin
              Good_status_T  <= 1;
              state          <= HT_HostIdle;
              EscapeCF_T     <= 0;
              rcv_fifo_wr_en <= 0;
            end
            else if (CRC_ERR_T || illegal_state) begin
              Good_status_T      <= 0;
              state              <= HT_HostIdle;
              EscapeCF_T         <= 0;
              rcv_fifo_wr_en     <= 0;
              DMA_data_rcv_error <= 1;
            end
            else begin
              Good_status_T  <= 0;
              state          <= HT_DMAEnd;
              EscapeCF_T     <= 0;
              rcv_fifo_wr_en <= 0;
            end 
          end
          else begin
            if (illegal_state) begin 
              Good_status_T  <= 0;
              state          <= HT_HostIdle;
              EscapeCF_T     <= 0;
              rcv_fifo_wr_en <= 0;
            end
            else if (r_ok || r_error) begin
              Good_status_T  <= 0;
              state          <= HT_HostIdle;
              EscapeCF_T     <= 0;
              rcv_fifo_wr_en <= 0;
            end
            else begin
              Good_status_T  <= 0;
              state          <= HT_DMAEnd;
              EscapeCF_T     <= 0;
              rcv_fifo_wr_en <= 0;
            end
          end
        end
            
        HT_DMAITrans:
        begin
          if (control_register[2]|| (command_register == DEVICE_RESET)) begin      
            EscapeCF_T    <= 1;
            state         <= HT_HostIdle;
          end      
          else if(illegal_state) begin       
            state              <= HT_HostIdle;
            EscapeCF_T         <= 0;
            DMA_data_rcv_error <= 1;
          end 
          else if (end_status) begin
            EscapeCF_T     <= 0;
            state          <= HT_DMAEnd;
            rcv_fifo_wr_en <= 0;
          end
          else begin
            if (data_out_vld_T) begin       
              data_rcv_fifo  <= data_link_in;
              state          <= HT_DMAITrans;
              EscapeCF_T     <= 0;
              rcv_fifo_wr_en   <= 1;
            end
            else begin        
              rcv_fifo_wr_en   <= 0;
              EscapeCF_T       <= 0;
              state            <= HT_DMAITrans;
            end
          end
        end
                                    
        HT_RegFIS:
        begin
          if(illegal_state) begin       
            state <= HT_HostIdle ;
            
          end
          else if(fis_count <= 3'd4 && data_out_vld_T ) begin 
             state <= state ;
             fis_count <= fis_count+1'b 1 ;
             if(fis_count == 'd1) begin
               fis_reg_DW1 <= data_link_in ;
             end
             else if(fis_count =='d2) begin
               fis_reg_DW2 <= data_link_in ;
             end
             else if(fis_count =='d3) begin
               fis_reg_DW3 <= data_link_in ;
             end
             else if(fis_count =='d4) begin
               fis_reg_DW4 <= data_link_in ;
             end
          end
          else if(end_status) begin                          
            state <= HT_RegTransStatus ;
          end
          else begin        
            state     <= state ;
            fis_count <= fis_count  ;
          end
        end
                  
        HT_RegTransStatus:
        begin
          if(CRC_ERR_T || illegal_state) begin       
            FIS_ERR    <= 1'b1        ;
            state <= HT_HostIdle ;
            Good_status_T <= 1'b0     ;
          end
          else if(VALID_CRC_T) begin       
            Good_status_T <= 1'b1        ;
            state    <= HT_HostIdle ;
          end
          else begin
            state <= state ;
            Good_status_T <= Good_status_T ;
          end
        end   
        HT_PS_FIS: begin
          if(fis_count <= 3'd4 && data_out_vld_T) begin       
            fis_count <= fis_count+1;
            state     <= state;
            if(fis_count == 'd1) begin
              fis_reg_DW1 <= data_link_in;
            end
            else if(fis_count ==3'd2) begin
              fis_reg_DW2 <= data_link_in;
            end
            else if(fis_count ==3'd3) begin
               fis_reg_DW3 <= data_link_in;
            end
            else if(fis_count ==3'd4) begin
               fis_reg_DW4 <= data_link_in;
            end
          end
          else if(VALID_CRC_T) begin       
            Good_status_T <= 1'b1 ;
            direction_bit <= fis_reg_DW0[13];
            if(fis_reg_DW0[13] == 0) begin     //data transfer Direction host to device   
              state        <= HT_PIOOTrans1;
              H_read_count <= 'd0;
            end
            else begin          
              state        <= HT_HostIdle;
              H_read_count <= 'd0;
            end
          end
          else if(CRC_ERR_T) begin       
            FIS_ERR       <= 1;
            state         <= HT_HostIdle;
            Good_status_T <= 0;
            prvs_pio      <= 0;
          end
          else if(illegal_state) begin
            state    <= HT_HostIdle;
            prvs_pio <= 0;
          end
          else begin        
            state      <= state;
            fis_count  <= fis_count;
          end
        end
        
        HT_PIOOTrans1:
        begin
          state               <= HT_tl_ll_tx_fifo_rst_delay;
          dest_state          <= HT_HostIdle;
          tl_ll_tx_fifo_reset <= 1;
        end
               
        HT_PIOOTrans2:
        begin
          tl_ll_tx_fifo_reset <= 0;
          if(LINK_DMA_ABORT) begin      
            state <= HT_PIOEnd;
            tx_fifo_pio_rd_en   <= 0;
            data_link_out_wr_en <= 0;
          end
          else if(illegal_state) begin      
            state <= HT_HostIdle;
            tx_fifo_pio_rd_en   <= 0;
            data_link_out_wr_en <= 0;
          end
          else if(control_register[2] || (command_register == DEVICE_RESET)) begin      
            state      <= HT_HostIdle;
            EscapeCF_T <= 1'b1;
            tx_fifo_pio_rd_en   <= 0;
            data_link_out_wr_en <= 0;
          end
          //else if(link_txr_rdy) begin      
          //  data_link_out_int <= 32'h0046;
          //  txr_rdy           <= 1'b0;
          //  state             <= state;
            //data_rdy_T    <= 1'b1;
          //end 
          else if(recv_pio_dma_cnt == Transfer_cnt_PIO || recv_pio_dma_cnt == 'd2048 ) begin        
            state       <= HT_PIOEnd;
            hold_L      <= 1'b0;
            //frame_end_T <= 1'b1; 
            count       <= 16'b0;
            tx_fifo_pio_rd_en   <= 0;
            data_link_out_wr_en <= 0;
            
            if((recv_pio_dma_cnt == 'd2048)) begin
              recv_pio_dma_cnt <= recv_pio_dma_cnt;
            end
            else begin
              recv_pio_dma_cnt <= 16'b0;
            end       
          end
          else if(recv_pio_dma_cnt < Transfer_cnt_PIO && !tl_ll_tx_fifo_full && !tx_fifo_empty) begin 
            hold_L        <= 1'b0    ;
            data_link_out_int   <= tx_fifo_dout;
            if (recv_pio_dma_cnt < (Transfer_cnt_PIO - 'd4)) begin
              tx_fifo_pio_rd_en   <= 1;
            end
            else begin
              tx_fifo_pio_rd_en   <= 0;
            end
            data_link_out_wr_en <= 1;
            recv_pio_dma_cnt    <= recv_pio_dma_cnt+'d4  ;
            count               <= count+'d4  ;
            state               <= state ;
          end
          else begin      
            tx_fifo_pio_rd_en   <= 0;
            data_link_out_wr_en <= 0;
            state               <= state ;
            recv_pio_dma_cnt    <= recv_pio_dma_cnt;
          end
        end
        
        HT_PIOEnd: begin
          rcv_fifo_wr_en <= 0;
          if (pio_rcv_flag == 1) begin
            if (VALID_CRC_T) begin
              state         <= HT_HostIdle;
              Good_status_T <= 1;
            end
            else if (CRC_ERR_T || illegal_state) begin
              state         <= HT_HostIdle;
              Good_status_T <= 0;
            end
            else begin
              state         <= HT_PIOEnd;
              Good_status_T <= 0;
            end            
          end
          else begin
            if (illegal_state) begin 
              Good_status_T  <= 0;
              state          <= HT_HostIdle;
            end
            else if (r_ok || r_error) begin
              Good_status_T  <= 0;
              state          <= HT_HostIdle;
            end
            else begin
              Good_status_T  <= 0;
              state          <= HT_PIOEnd;
            end
          end  
        end
                     
        HT_PIOITrans1: begin
          if(data_out_vld_T) begin
            state            <= HT_PIOITrans2; 
            recv_pio_dma_cnt <= recv_pio_dma_cnt + 'd4;
            rcv_fifo_wr_en   <= 1;
          end
          else if(control_register[2] || (command_register == DEVICE_RESET)) begin     
            state          <= HT_HostIdle;
            EscapeCF_T     <= 1'b1;
            rcv_fifo_wr_en <= 0;
          end
          else if(illegal_state) begin     
            state          <= HT_HostIdle ;
            EscapeCF_T     <= 1'b0;
            rcv_fifo_wr_en <= 0;
          end
          else begin
            EscapeCF_T       <= 1'b0;
            recv_pio_dma_cnt <= recv_pio_dma_cnt;
            state            <= HT_PIOITrans2;
            rcv_fifo_wr_en   <= 0;
          end
        end
                         
        HT_PIOITrans2: begin
          if(LINK_DMA_ABORT) begin      
            pio_rcv_flag   <= 1;
            state          <= HT_PIOEnd;
            pio_rcv_flag  <= 1'b0;
            rcv_fifo_wr_en <= 0;
          end
          else if(illegal_state) begin 
            state          <= HT_HostIdle;
            pio_rcv_flag   <= 0;
            rcv_fifo_wr_en <= 0;
          end
          else if(control_register[2] || (command_register == DEVICE_RESET)) begin      
            state          <= HT_HostIdle;
            pio_rcv_flag   <= 0;
            rcv_fifo_wr_en <= 0;
          end
          else if((recv_pio_dma_cnt == 'd2048) || (recv_pio_dma_cnt > Transfer_cnt_PIO)) begin
            rcv_fifo_wr_en <= 0;     
            state          <= HT_PIOEnd; 
            pio_rcv_flag   <= 1;
            if((recv_pio_dma_cnt == 'd2048)) begin
              recv_pio_dma_cnt <= recv_pio_dma_cnt;
            end
            else begin
              recv_pio_dma_cnt <= 16'b0;   
            end       
          end
          else if(recv_pio_dma_cnt <= Transfer_cnt_PIO) begin
            state <= HT_PIOITrans2; 
            if (data_out_vld_T) begin
              recv_pio_dma_cnt <= recv_pio_dma_cnt + 'd4;
              rcv_fifo_wr_en   <= 1;
            end
            else begin
              recv_pio_dma_cnt <= recv_pio_dma_cnt;
              rcv_fifo_wr_en   <= 0;
            end            
          end
          else begin      
            state          <=  state;
            Good_status_T  <= 0;
            rcv_fifo_wr_en <= 0;
          end
        end
      endcase
    end
  end // main state machine end
              
                    


  // transmit fifo ...........................
   assign tx_fifo_din       = DMA_RQST ? DMA_TX_DATA_IN : data_register_in ;    //   transmit data from dma to tx fifo connected to   sata_din
   assign tx_fifo_wr_en     = DMA_RQST ? (DMA_TX_WEN && CE)   : tx_fifo_pio_wr_en;
   assign tx_fifo_rd_en     = DMA_RQST ? tx_fifo_dma_rd_en    : tx_fifo_pio_rd_en;
   //assign tx_fifo_pio_wr_en = H_write && (!status_register[7]) && status_register[3];
               
  //receiver fifo...............................
  assign DMA_RX_DATA_OUT    = DMA_RQST  ?    rcv_fifo_data_out   : 32'h0;
  assign RX_FIFO_RDY        = !rcv_fifo_prog_full; 
  assign data_register_out  = rcv_fifo_data_out;
  assign rx_fifo_pio_rd_en  = H_read && detection && (addr_reg == data_reg) && CE; // && (!status_register[7]);
  assign rcv_fifo_rd_en     = DMA_RQST  ? (DMA_RX_REN && CE) : rx_fifo_pio_rd_en;
  //assign HOLD_U       = direction_bit ? rcv_fifo_almost_empty : tx_fifo_prog_full;
  assign WRITE_HOLD_U       = tx_fifo_prog_full;
  assign READ_HOLD_U        = rcv_fifo_almost_empty; 
  
  always @(posedge clk) 
  begin
    rcv_fifo_din <= data_link_in;
  end
  
  BUFGMUX_CTRL BUFGMUX_CTRL_inst (
    .O (rx_fifo_rd_clk ),    // Clock MUX output
    .I0(PIO_CLK_IN),         // Clock0 input
    .I1(DMA_CLK_IN),         // Clock1 input
    .S (DMA_RQST)            // Clock select input
   );

  assign tx_fifo1_reset = reset || TX_FIFO_RESET;

  //PIO and DMA Transmit FIO
  fifo_generator_v8_3 TX_FIFO1 (
    .rst           (tx_fifo1_reset),      // input rst
    .wr_clk        (rx_fifo_rd_clk),      // input wr_clk
    .rd_clk        (clk),                 // input rd_clk
    .din           (tx_fifo_din),         // input [31 : 0] din
    .wr_en         (tx_fifo_wr_en),       // input wr_en
    .rd_en         (tx_fifo_rd_en),       // input rd_en
    .dout          (tx_fifo_dout),        // output [31 : 0] dout
    .full          (),                    // output full
    .empty         (tx_fifo_empty),       // output empty
    .almost_empty  (tx_fifo_almost_empty),
    .prog_full     (tx_fifo_prog_full)    // output prog_full
  );
  
  assign rx_fifo1_reset = reset || RX_FIFO_RESET;
  
  //PIO and DMA Receive FIFO  
  RX_FIFO RX_FIFO1 (
    .rst          (rx_fifo1_reset),        // input rst
    .wr_clk       (clk),                   // input wr_clk
    .rd_clk       (rx_fifo_rd_clk),        // input rd_clk
    .din          (rcv_fifo_din),          // input [31 : 0] din
    .wr_en        (rcv_fifo_wr_en),        // input wr_en
    .rd_en        (rcv_fifo_rd_en),        // input rd_en
    .dout         (rcv_fifo_data_out),     // output [31 : 0] dout
    .full         (rcv_fifo_full),         // output full
    .empty        (rcv_fifo_almost_empty), // output empty
    .almost_empty (),
    .prog_full    (rcv_fifo_prog_full),    // output prog_full
    .rd_data_count()
  ); 
  
  
  //General Transmit FIFO
  TX_FIFO TL_LL_TX_FIFO (
    .clk          (clk),                     // input clk
    .rst          (tl_ll_tx_fifo_reset),     // input rst
    .din          (data_link_out_int),       // input [31 : 0] din
    .wr_en        (data_link_out_wr_en),     // input wr_en
    .rd_en        (data_link_rd_en_t),       // input rd_en
    .dout         (data_link_out),           // output [31 : 0] dout
    .full         (tl_ll_tx_fifo_full),      // output full
    .empty        (tl_ll_tx_fifo_empty),     // output empty 
    .almost_full  (),                        // output prog_full
    .almost_empty (tl_ll_tx_fifo_almost_empty) // output prog_empty
  );

  assign FRAME_END_T  = tl_ll_tx_fifo_empty;
  assign DATA_RDY_T   = !tl_ll_tx_fifo_almost_empty;


            
endmodule