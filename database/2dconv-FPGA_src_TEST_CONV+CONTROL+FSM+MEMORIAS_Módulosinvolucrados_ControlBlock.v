// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Create Date: 02.11.2017 22:55:31
// Design Name: Control Block
// Module Name: controlBlock
// Project Name: Img project
// Target Devices: Arty 7
// Tool Versions: 2017.3
// Description: Register file
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module ControlBlock(    //Definicion de puertos
                      input  [23:0] i_GPIOdata,
                      input  [12:0] i_MCUdata,
                      input   [2:0] i_GPIOctrl,
                      input         i_GPIOvalid,
                      input         i_rst,
                      input         i_CLK,
                      input         i_EOP_from_FSM,
                     
                     
                      output [31:0] o_GPIOdata,
                      output [23:0] o_KNLdata,
                      output [12:0] o_MCUdata,
                      output  [9:0] o_imgLength,
                      //output  [2:0] o_led, //o_estado
                      output        o_EOP_to_MCU,
                      output        o_run,
                      output        o_valid_to_FSM,
                      output        o_valid_to_CONV,
                      output        o_KNorIMG,
                      output        o_load
);

    
     /*      Register file:
           
           BITS MÁS SIGNIFICATIVOS (GPIO[31:29])
           
                Código instrucción              Acción
                
                     000                      Cargar kernell
                     001                      Cargar Img_size
                     010                      Cargar Imagen
                     011                      Pedir dato
                     100                      Cambio de estado (a precesamiento)
                     -----------------------------------------
                     101-111                  No utilizados
                     ---------------------------------------
           
           LSB ( GPIOctrl) -> VALID (bit 28 desde top_microblaze; están los buses separados)
    
        */
      
  //Parametrización
  localparam Kernel_load     = 0; 
  localparam ImgSize_load    = 1; 
  localparam Img_load        = 2;
  localparam Data_request    = 3;
  localparam LoadFinish_goToRun     = 4;  

 

  reg    [23:0] dataKERNEL;
  reg    [23:0] dataGPIO;
  reg    [12:0] dataMCU;  
  reg    [9:0] imgLength;   
  reg           validFSM;
  reg           validCONV;
  reg           GPIO_valid_previous_state;
  reg           KI;
  reg           load_reg;
  reg           loadControl;
  reg           run_reg;
  reg           EoPMCU_reg;
  //reg           go_to_leds;
  reg           runControl;
  // En principio no haria falta el latcheo: reg [3:0] controlGPIO;
    
 //Registers:
  assign {o_valid_to_FSM}  = validFSM;
  assign {o_valid_to_CONV} = validCONV;
  assign {o_KNorIMG}       = KI;
  assign {o_imgLength}     = imgLength;
  assign {o_GPIOdata}      = dataGPIO;
  assign {o_MCUdata}       = dataMCU;
  assign {o_run}           = run_reg;
  assign {o_EOP_to_MCU}    = EoPMCU_reg;
  assign {o_KNLdata}       = dataKERNEL;
  assign {o_load}          = load_reg;   
  
   
  //assign {o_led} = (i_GPIOctrl == Kernel_load )? 3'b001 : ( i_GPIOctrl == ImgSize_load)? 3'b010 : ( i_GPIOctrl == Img_load)? 3'b100: (i_GPIOctrl == Data_request )? 3'b011: (i_GPIOctrl == LoadFinish_goToRun)?3'b111: 3'b000 ;
  
         
    always @(posedge i_CLK) begin
    
       GPIO_valid_previous_state<=i_GPIOvalid;
       //No afecta que todo el tiempo latchee ambos puertos a los registros internos
       dataMCU<=i_MCUdata;
       dataGPIO<=i_GPIOdata;
    
       if(i_rst) begin
                      
                 
                 dataGPIO   <=    'd0;
                 load_reg   <= 'd0;
                dataKERNEL  <=  24'd0;
                   dataMCU  <=  13'd0;
                  imgLength <=  10'd0;
                 //go_to_led  <=   3'd0;
                  validFSM  <=   1'b0;
                 validCONV  <=   1'b0;
 GPIO_valid_previous_state  <=   1'b0;
                    run_reg <=   1'b0;
                 EoPMCU_reg <=   1'b0;  
                 loadControl<=   1'b1; 
                 runControl <=   1'b0;
                        KI  <=   1'b0; //definido asi en la documentación.
       end
       else begin    
              //!run_reg => no estoy en estado RUN (si estoy en el mismo, este modulo no cede el control)
              if(run_reg==1'b0 && runControl==1'b0) begin  
               
                case (i_GPIOctrl)
               
                        //Carga kernell
                        Kernel_load:  begin
                                         //Modo kernell activo por bajo
                                         load_reg<=1'b0;      
                                         KI<=1'b0;
                                         dataKERNEL<=i_GPIOdata;
                                         if (i_GPIOvalid && !GPIO_valid_previous_state)
                                                validCONV<=1'b1;
                                         else 
                                                validCONV<=1'b0;
                                 
                                      end
                                
                        //Carga del tamano de la imagen Img_length
                        ImgSize_load: begin
                                        KI<=1'b0;
                                        imgLength<=dataGPIO[9:0];
                                        load_reg<=1'b0;
                                        
                                        
                                      end 
            
                       //Cargar imagen
                        Img_load:     begin
                                         KI<=1'b0;
                                         //Levanto senal de carga para la FSM
                                         if (loadControl==1'b1) begin
                                             load_reg<=1'b1;
                                             loadControl<=1'b0;
                                         end
                                         else
                                            load_reg<=1'b0;
                                                                                     
                                            
                                         EoPMCU_reg<=1'b0;
                                         
                                         if (i_GPIOvalid && GPIO_valid_previous_state==1'b0)
                                             validFSM<=1'b1;
                                         else 
                                             validFSM<=1'b0;
                                        
                                      end 
                        
                                                                
                        LoadFinish_goToRun: begin
                                        KI<=1'b1;
                                        //Termino carga, paso a estado RUN. Se delega el control del sistema
                                        run_reg<=1'b1;
                                        runControl<=1'b1;
                                        
                                        //Bajo senal de carga para la FSM
                                        load_reg <=1'b0;
                        
                                     
                                     end
                                     
                                     
                                     
                             
                        default :   ;
                endcase 
                
                end
                else if (i_EOP_from_FSM && runControl==1'b1) begin
                            //Estando en RUN, al recibir la senal End Of Process del FSM, debo SALIR del estado mencionado
                            //Es decir, se termino la etapa de procesamiento, y se pasa a la etapa OUT poniendo en alto EoP_MCU
                           
                            if (i_GPIOctrl == Data_request) begin
                                     
                                if (i_GPIOvalid && GPIO_valid_previous_state==1'b0)
                                   validFSM<=1'b1;
                                else 
                                   validFSM<=1'b0;
                                
                            end
                           
                    load_reg   <=1'b0;
                    EoPMCU_reg <=1'b1;
                    run_reg    <=1'b0;
                    KI         <=1'b0;
                    //Hay que bajarlo? Hasta cuando??

                end
 
        end//End if/else rst
        
    end //End always
    
    
endmodule
