// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define BIT_LEN     8
`define CONV_LEN    20
`define CONV_LPOS   13
`define M_LEN       3

`define BIT_LEN     8
`define CONV_LEN    20
`define CONV_LPOS   13
`define M_LEN       3
`define GPIO_D      32
`define NB_ADDRESS  10

module micro_sim
    #(
      parameter BIT_LEN       = `BIT_LEN,
      parameter CONV_LEN      = `CONV_LEN,
      parameter CONV_LPOS     = `CONV_LPOS,
      parameter M_LEN         = `M_LEN,
      parameter NB_ADDRESS    = `NB_ADDRESS,
      parameter RAM_WIDTH     = 13,
      parameter GPIO_D        = `GPIO_D,
      parameter N = 4,
      parameter BITS_IMAGEN = 8,
      parameter BITS_DATA = 13,
      localparam Kernel_load            = 0, 
      localparam ImgSize_load           = 1, 
      localparam Img_load               = 2,
      localparam Data_request           = 3,
      localparam LoadFinish_goToRun = 4 
      )(
        output [GPIO_D-1:0] gpio_i_data_tri_i,
        output [2:0]        o_led,
        input               CLK100MHZ,
        input [GPIO_D-1:0]  gpio_o_data_tri_o
        );
    
    genvar                  i;
    

    wire [23:0]             i_GPIOdata;
    wire [2:0]              i_GPIOctrl;
    wire                    i_GPIOvalid;
    /////////// WIRES AGREGADOS //////////////
    wire [N*BITS_DATA-1:0]  conv_DataConv_mcu;
    wire [(N+2)*BITS_DATA-1:0] mem_MemData_mcu;
    wire                       rst;
    
    wire [3*N*BITS_IMAGEN-1:0] mcu_DataConv_conv;
    wire [BITS_DATA-1:0]       mcu_Data_ctrl;
    wire [N+1:0]               mcu_we_mem;
    wire [NB_ADDRESS-1:0]      mcu_WAddr_mem, mcu_RAddr_mem;
    wire [(N+2)*BITS_DATA-1:0] mcu_MemData_mem;
    wire                       fsm_eop_ctrl, fsm_sop_mcu, fsm_chblk_mcu, fsm_valid_conv;
    wire [NB_ADDRESS-1:0]      fsm_RAddr_mcu, fsm_WAddr_mcu;

    ////////////////////////////////////////////
    
    // REGISTROS MODULOS FALTANTES

    wire                        ctrl_valid_conv, ctrl_ki_conv;
    wire [BITS_IMAGEN-1:0]      ctrl_Data_mcu;
    wire                        ctrl_load_fsm, ctrl_sop_fsm, ctrl_valid_fsm;
    wire [NB_ADDRESS-1:0]       ctrl_imglen_fsm;
    wire [23:0]                 ctrl_kernel_conv;


    wire                        validCONV;
    wire [3*N*BITS_IMAGEN-1:0]  dataCONV;

    generate
        for (i = 0; i < N; i = i+1) begin
            assign dataCONV[(i+1)*3*BITS_IMAGEN-1 -: 3*BITS_IMAGEN] = (ctrl_ki_conv) ? mcu_DataConv_conv[(i+1)*3*BITS_IMAGEN-1 -: 3*BITS_IMAGEN] : ctrl_kernel_conv;
        end
        
    endgenerate

    assign validCONV = (i_GPIOctrl == LoadFinish_goToRun) ? fsm_valid_conv : ctrl_valid_conv;
    
    assign rst = gpio_o_data_tri_o[0];
    assign i_GPIOdata = gpio_o_data_tri_o[24:1];
    assign i_GPIOctrl = gpio_o_data_tri_o[31:29];
    assign i_GPIOvalid = gpio_o_data_tri_o[28];

    

    //asignacion de la finalizacion al led para un udicador visual.
    assign o_led = {ctrl_load_fsm, fsm_sop_mcu, fsm_eop_ctrl};
    // instacia del Microcontrolador
    //instancia CONTROL
    ControlBlock
        u_control
            (
             .i_GPIOdata(i_GPIOdata),
             .i_MCUdata(mcu_Data_ctrl),
             .i_GPIOctrl(i_GPIOctrl),
             .i_GPIOvalid(i_GPIOvalid),
             .i_rst(rst),
             .i_CLK(CLK100MHZ),
             .i_EOP_from_FSM(fsm_eop_ctrl),

             .o_GPIOdata(gpio_i_data_tri_i),
             .o_KNLdata(ctrl_kernel_conv),
             .o_MCUdata(ctrl_Data_mcu),
             .o_imgLength(ctrl_imglen_fsm),
             .o_run(ctrl_sop_fsm),
             .o_valid_to_FSM(ctrl_valid_fsm),
             .o_valid_to_CONV(ctrl_valid_conv),
             .o_KNorIMG(ctrl_ki_conv),
             .o_load(ctrl_load_fsm)
             );
    //instancia FSM
    Fsmv#(.NB_ADDRESS(NB_ADDRESS),
         .N_CONV(N))
        u_FSM
            (
             .o_writeAdd(fsm_WAddr_mcu),
             .o_readAdd(fsm_RAddr_mcu),
             .o_EoP(fsm_eop_ctrl),
             .o_sopross(fsm_sop_mcu),
             .o_changeBlock(fsm_chblk_mcu),
             .o_fms2conVld(fsm_valid_conv),
             .i_imgLength(ctrl_imglen_fsm),
             .i_CLK(CLK100MHZ),
             .i_reset(rst),
             .i_SoP(ctrl_sop_fsm),
             .i_valid(ctrl_valid_fsm),
             .i_load(ctrl_load_fsm)
             );
        
   //inacia de Convolucionador
    generate
        for (i = 0; i < N; i = i+1) begin : gen_conv
            Conv u_conv
                 (.o_data(conv_DataConv_mcu[(i+1)*BITS_DATA-1 -: BITS_DATA]),
                  .i_dato0(dataCONV[(i*3+1)*BITS_IMAGEN-1 -: BITS_IMAGEN]),
                  .i_dato1(dataCONV[(i*3+2)*BITS_IMAGEN-1 -: BITS_IMAGEN]),
                  .i_dato2(dataCONV[(i*3+3)*BITS_IMAGEN-1 -: BITS_IMAGEN]),
                  .i_selecK_I(ctrl_ki_conv),
                  .i_reset(rst),
                  .i_valid(validCONV),
                  .CLK100MHZ(CLK100MHZ)
                  );
        end
    endgenerate
    
    
    //instancia MCU
    MCU#(.BITS_ADDR(NB_ADDRESS), 
        .N(N))
        u_MemCU
            (
             .i_DataConv(conv_DataConv_mcu),
             .i_Data(ctrl_Data_mcu),
             .i_MemData(mem_MemData_mcu),
             .i_WAddr(fsm_WAddr_mcu),
             .i_RAddr(fsm_RAddr_mcu),
             .i_chblk(fsm_chblk_mcu),
             .i_sop(fsm_sop_mcu),
             .i_eop(fsm_eop_ctrl),
             .rst(rst),
             .clk(CLK100MHZ),

             .o_DataConv(mcu_DataConv_conv),
             .o_Data(mcu_Data_ctrl),
             .o_we(mcu_we_mem),
             .o_WAddr(mcu_WAddr_mem),
             .o_RAddr(mcu_RAddr_mem),
             .o_MemData(mcu_MemData_mem)
             );
            
    //intancia de la memoria

    generate
        for (i = 0; i < (N+2); i = i+1) begin : gen_memory
            //memory#(.INIT_FILE({"mem0" + i, ".txt"}), .NB_ADDRESS(NB_ADDRESS)) u_mem
            memory#(.NB_ADDRESS(NB_ADDRESS)) u_mem
                 (
                  .i_wrEnable(mcu_we_mem[i]),
                  .i_CLK(CLK100MHZ),
                  .i_writeAdd(mcu_WAddr_mem),
                  .i_readAdd(mcu_RAddr_mem),
                  .i_data(mcu_MemData_mem[(i+1)*BITS_DATA-1 -: BITS_DATA]),
                  
                  .o_data(mem_MemData_mcu[(i+1)*BITS_DATA-1 -: BITS_DATA])
                  );
            
        end
        
    endgenerate
                

endmodule