// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define BIT_LEN     8
`define CONV_LEN    20
`define CONV_LPOS   13
`define M_LEN       3
`define GPIO_D      32
`define NB_ADDRESS  10
`define RAM_WIDTH_TOP   13
`define NB_IMAGE    10

module micro_all#(
    parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter RAM_WIDTH_TOP = `RAM_WIDTH_TOP,
    parameter GPIO_D        = `GPIO_D,
    parameter NB_IMAGE		= `NB_IMAGE,
    localparam MEM0         = 1,
    localparam MEM1         = 2,
    localparam MEM2         = 3,
    //Parametrización de estados
    localparam Kernel_load            = 0, 
    localparam ImgSize_load           = 1, 
    localparam Img_load               = 2,
    localparam Data_request           = 3,
    localparam LoadFinish_goToRun     = 4  

    )(
    output[GPIO_D-1:0]	gpio_i_data_tri_i,
    output[2:0] 		o_led,
    input           	i_CLK,
    input [GPIO_D-1:0] 	gpio_o_data_tri_o
    );



    //-----Memoria
    reg [RAM_WIDTH_TOP-1:0] i_data_mem0, i_data_mem1, i_data_mem2;
    //wire signed [RAM_WIDTH-1:0] i_mem0;
    //salida de las meomorias
    wire signed [RAM_WIDTH_TOP-1:0] mem0_o,mem1_o,mem2_o;

    //select mux direccion y write eneable
    reg wen_0,wen_1,wen_2;
    
    
    
    
    
    wire [1:0] sel;
    //----------

    //------------convolucionador ----------------------------------
    wire signed [(BIT_LEN*3)-1:0] dmicro;
    reg signed [RAM_WIDTH_TOP-1:0] reg_aux;

    //wire k_i; //selector de K/I
    //wire valid_conv;
    //wire rst_conv;

    //Datos a la entrada del convlucionador    
    wire signed [BIT_LEN-1:0] dato0, dato1, dato2;
    //datos salida del conv 
    wire signed [RAM_WIDTH_TOP-1:0] data_oc;
    wire valid_toCONV;
    //entrada de la mem_0

    //----------  FSM    ----------------------------------------
    wire [NB_ADDRESS-1:0]   writeAddress_fromFSM_toCONV;
    wire [NB_ADDRESS-1:0]   readAddress_fromFSM_toCONV;
    wire load_wire_fromCTRL_toFSM,SOP_fromFSM_wire,valid_fromFSM_toCONV;
    
    //---- Control block ----------------------------------------
     reg [23:0]   KernelData_latch;
     reg [12:0]   MCUdata_latch;
     wire       validGPIO;    
     wire         rst_all;
     wire [2:0]  GPIOctrl;
     wire [23:0] GPIOdata;
    //Connect from FSM to CONTROL
     wire EOP_fromFSM_toCTRL;
     wire [23:0] krnlData_fromCTRL;    
     //Connect to both
     wire [9:0]imgLength_fromCTRL_toFSM;    
     //Connect to CONTROL
     wire [2:0]ledFSM;    
     //Connect from CONTROL to MCU
     wire EoP_to_MCU;    
     //Connect from CONTROL to FSM
     wire SOP_fromCTRL_toFSM;
     //Connect from ctrl to FSM
     wire valid_fromCTRL_toFSM;
     //Connect from ctrl to Convolutor
     wire valid_fromCTRL_toCONV;
     //Kernel or Image selector, connect from controlBlock to Convolutor
     wire KorI_fromCTRL_toCONV;    
     //Connect from FSM to MCU
     wire changeBlock_fromFSM_toMCU;    
     wire [12:0] output_MCUdata;
     //Salida del modulo
     wire [31:0] outGPIOctrl;
     
     
     
     
     // ----------- Emulador MCU  ------------
     reg [12:0] inputdata_fromMCU;
        
    /*
        BUS DEL GPIO:
        
    [   b31 b30 b29     b28          b27         b26 b25        b24 b23 b22 b21 b20 b19 b18 b17 b16 b15 b14 b13 b12 b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1    b0    ]
         CTRL          VALID     notassigned     SELECT       ------------------------------DATOS----------------------------------------------------     RESET
        
        
    */
    
    
    
    assign rst_all     = gpio_o_data_tri_o[0]; 
    //Selector de memorias
    assign sel[0]       = gpio_o_data_tri_o[25];
    assign sel[1]       = gpio_o_data_tri_o[26];
    assign GPIOdata     = gpio_o_data_tri_o[24:1];
    assign GPIOctrl     = gpio_o_data_tri_o[31:29];
    assign validGPIO    = gpio_o_data_tri_o[28];
    assign {o_led}      = ledFSM;
        

    //asignacion de los datos de la memoria o del micro al convolucionador 
    assign dato0 = (KorI_fromCTRL_toCONV==1'b0)?dmicro[BIT_LEN:0]:mem0_o[BIT_LEN-1:0];
    assign dato1 = (KorI_fromCTRL_toCONV==1'b0)?dmicro[(2*BIT_LEN)-1:BIT_LEN]:mem1_o[BIT_LEN-1:0];
    assign dato2 = (KorI_fromCTRL_toCONV==1'b0)?dmicro[(3*BIT_LEN)-1:(2*BIT_LEN)]:mem2_o[BIT_LEN-1:0];

    // asignacion de la salida de la memoria 0 al micro
    assign gpio_i_data_tri_i[RAM_WIDTH_TOP-1:0] = mem0_o;
    assign gpio_i_data_tri_i[GPIO_D-1:RAM_WIDTH_TOP] = 19'h0;
    //asignacion de la finalizacion al led para un indicador visual.
    
    //-- MUX DE VALIDS --- 
    
    assign valid_toCONV =  (GPIOctrl==LoadFinish_goToRun)? valid_fromFSM_toCONV:valid_fromCTRL_toCONV;
    
    
    

    initial begin
        i_data_mem1       = 13'h0;
        i_data_mem2       = 13'h0;
        i_data_mem0       = 13'h0;
        reg_aux           = 13'h0;
        wen_0             = 1'b0;
        wen_1             = 1'b0;
        wen_2             = 1'b0;
        inputdata_fromMCU = 'd0;
        KernelData_latch  = 'd0;
        MCUdata_latch     = 'd0;

    end
    always @(posedge i_CLK) begin
        reg_aux <= data_oc;
        
        case(GPIOctrl)
                               //Estado de carga de kernel
                               Kernel_load:  begin
                                             KernelData_latch<= krnlData_fromCTRL;          
                                             end
                               /*        
                               //Estado de carga del tamano de la imagen Img_length
                               ImgSize_load:;
                               
                              //Estado de carga de imagen
                               Img_load:;
                               //Pedir dato
                               */
                               Data_request: begin
                                             MCUdata_latch<=output_MCUdata;
                                             end
                                             
                               /* //Termino carga, paso a estado RUN. Se delega el control del sistema                
                               ImgFinished:;
                               */
                               default :;
                                   
        endcase
    
    end //end always clk

    always @(*) begin
    
        
        case(sel)
            2'b00: begin //carga memoria 0 
                i_data_mem0 = reg_aux;
                i_data_mem1 = 13'h0;
                i_data_mem2 = 13'h0;
                wen_0       = valid_fromFSM_toCONV;
                wen_1       = 1'b0;
                wen_2       = 1'b0;
            end
            2'b01:begin
                i_data_mem0 = gpio_o_data_tri_o[RAM_WIDTH_TOP:1];
                i_data_mem1 = 13'h0;
                i_data_mem2 = 13'h0;
                      wen_0 = 1'b1;
                      wen_1 = 1'b0;
                      wen_2 = 1'b0;
            end
            2'b10:begin
                i_data_mem0 = 13'h0;
                i_data_mem1 = gpio_o_data_tri_o[RAM_WIDTH_TOP:1];
                i_data_mem2 = 13'h0;
                wen_0 = 1'b0;
                wen_1 = 1'b1;
                wen_2 = 1'b0;
            end
            2'b11:begin 
                i_data_mem0 = 13'h0;
                i_data_mem1 = 13'h0;
                i_data_mem2 = gpio_o_data_tri_o[RAM_WIDTH_TOP:1];
                wen_0 = 1'b0;
                wen_1 = 1'b0;
                wen_2 = 1'b1;
            end

        endcase
    end
    
    
    
    
   //Instanciación de módulos:
    
   FSMv2
        u_fsmv(.o_writeAdd(writeAddress_fromFSM_toCONV),
               .o_readAdd(readAddress_fromFSM_toCONV),
               .o_EoP(EOP_fromFSM_toCTRL),
               .o_changeBlock(changeBlock_fromFSM_toMCU),
               .o_valid_fromFSM_toCONV(valid_fromFSM_toCONV),
               .o_SOP_fromFSM(SOP_fromFSM_wire),
               .i_imgLength(imgLength_fromCTRL_toFSM),
               .o_led(ledFSM),
               .i_CLK(i_CLK),
               .i_reset(rst_all),
               .i_SoP(SOP_fromCTRL_toFSM),  //Senal de RUN
               .i_valid(valid_fromCTRL_toFSM),
               .i_load(load_wire_fromCTRL_toFSM));


    Convolutor
        u_conv(.o_data(data_oc),
               .i_dato0(dato0),
               .i_dato1(dato1),
               .i_dato2(dato2),
               .i_selecK_I(KorI_fromCTRL_toCONV),
               .i_reset(rst_all),
               .i_valid(valid_toCONV),
               .i_CLK(i_CLK));

    //intancias de memorias
    bram_memory#(
                .INIT(MEM0))
        u_bram_0 
            (.o_data(mem0_o),
             .i_wrEnable(wen_0),
             .i_data(i_data_mem0),
             .i_writeAdd(writeAddress_fromFSM_toCONV),
             .i_readAdd(readAddress_fromFSM_toCONV),
             .i_CLK(i_CLK));
    
    bram_memory#(
                .INIT(MEM1))
        u_bram_1
                (.o_data(mem1_o),
                 .i_wrEnable(wen_1),
                 .i_data(i_data_mem1),
                 .i_writeAdd(writeAddress_fromFSM_toCONV),
                 .i_readAdd(readAddress_fromFSM_toCONV),
                 .i_CLK(i_CLK));
    
    bram_memory#(
                .INIT(MEM2))
        u_bram_2
           (.o_data(mem2_o),
            .i_wrEnable(wen_2),
            .i_data(i_data_mem2),
            .i_writeAdd(writeAddress_fromFSM_toCONV),
            .i_readAdd(readAddress_fromFSM_toCONV),
            .i_CLK(i_CLK));
                

    ControlBlock
   u_RegisterFile
           (
            .i_GPIOdata(GPIOdata),
            .i_MCUdata(inputdata_fromMCU),
            .i_GPIOctrl(GPIOctrl),
            .i_GPIOvalid(validGPIO),
            .i_rst(rst_all),
            .i_CLK(i_CLK),
            .i_EOP_from_FSM(EOP_fromFSM_toCTRL),
            .o_GPIOdata(outGPIOctrl),
            .o_load(load_wire_fromCTRL_toFSM),
            .o_KNLdata(dmicro),
            .o_imgLength(imgLength_fromCTRL_toFSM),
            //.o_led(ledControl),
            .o_EOP_to_MCU(EoP_to_MCU),
            .o_run(SOP_fromCTRL_toFSM),//Senal de RUN
            .o_valid_to_FSM(valid_fromCTRL_toFSM),
            .o_valid_to_CONV(valid_fromCTRL_toCONV),
            .o_KNorIMG(KorI_fromCTRL_toCONV),
            .o_MCUdata(output_MCUdata)
           );

                                      


endmodule