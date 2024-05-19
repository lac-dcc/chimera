// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define BIT_LEN 8
`define CONV_LEN 20
`define CONV_LPOS 13
`define M_LEN 3
`define GPIO_D 32
`define NB_ADDRESS 10
`define BITS_IMAGE 10
`define RAM_WIDTH 13
`define BITS_STATES   2

module micro_sim#(
    parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter BITS_IMAGE    = `BITS_IMAGE,
    parameter RAM_WIDTH     = `RAM_WIDTH,
    parameter GPIO_D        = `GPIO_D,
    parameter BITS_STATES   = `BITS_STATES,
    localparam limit        =  16384
    )(
    
    output 		   		o_led,
    input           	i_CLK,
    input [GPIO_D-1:0] 	gpio_o_data_tri_o
    );

    
    
    
    //Latcheo
    reg [12:0] MCUdata;   
    reg [14:0] counter;    
    //Para ver que devuelve el puerto de salida o_valid_to_CONV de la instancia del modulo de control
    reg valid_output_latch;
    reg sop_fromfsm_latch;
    //Para ver que devuelve el puerto de salida o_GPIOdata de la instancia del modulo de control
    reg [31:0] controlGPIOoutput_latch;
    reg [12:0] MCUoutput_latch;
    reg        changeBlock_latch;
    reg        EOP_fromFSM_latch;
    wire        load_net;
    wire        sop_fromFSM;
    
    
    //----------- Nets --------------
    wire        valid_for_conv;
    wire [NB_ADDRESS-1:0] wrAdd;
    wire [NB_ADDRESS-1:0] rdAdd;
    //Connect from FSM to CONTROL
    wire EOP_from_FSM_to_CTRL;
    wire [23:0] krnlData;    
    //Connect to both
    wire [9:0]imgLength_from_CTRL_to_FSM;    
    //Connect to CONTROL
    wire ledControl;    
    //Connect from CONTROL to MCU
    wire EoP_to_MCU;    
    //Connect from CONTROL to x
    wire SOP_from_CTRL;
    //Connect from ctrl to FSM
    wire valid_from_ctrl_to_FSM;
    wire validCONV;
    wire KorI;    
    //Connect from FSM to MCU
    wire changeBlock;    
    wire [12:0] output_MCUdata;
    
    // GPIO asignations
    wire validGPIO;    
    wire rst_sw;
    wire [2:0]  GPIOctrl;
    wire [23:0] GPIOdata;    
    
    //Salida del modulo
    wire [31:0] outGPIOctrl;
   
    assign rst_sw                     = gpio_o_data_tri_o[0];   
    assign GPIOctrl                   = gpio_o_data_tri_o[31:29];
    assign validGPIO                  = gpio_o_data_tri_o[28];
    assign GPIOdata                   = gpio_o_data_tri_o[24:1];
   
   
    
    initial begin
        MCUdata     <= 13'd0;
        counter     <= 13'd0;
        sop_fromfsm_latch<=1'b0;
        valid_output_latch<=1'b0;
        controlGPIOoutput_latch<='d0;
        MCUoutput_latch<='d0;
        changeBlock_latch<='d0;
        EOP_fromFSM_latch<='d0;
        
    end
    
    
    

    always @(posedge i_CLK ) begin
        
        valid_output_latch <= valid_for_conv;
        MCUoutput_latch<= output_MCUdata;
        controlGPIOoutput_latch <= outGPIOctrl;
        changeBlock_latch <= changeBlock;
        EOP_fromFSM_latch <=EOP_from_FSM_to_CTRL;
        sop_fromfsm_latch<=sop_fromFSM;
        
        if (rst_sw) begin
            MCUdata     <= 13'd0;
            counter     <= 13'd0;
            sop_fromfsm_latch<=1'b0;
            valid_output_latch<=1'b0;
            controlGPIOoutput_latch<='d0;
            MCUoutput_latch<='d0;
            changeBlock_latch<='d0;
            EOP_fromFSM_latch<='d0;
            
        end
        else begin
            counter <= counter + 1;
                        
            if (counter == limit) begin
                MCUdata<=MCUdata+1;
                
                if (MCUdata==13'b1111111111111)
                    MCUdata<='d0;
            end
                    
        
        end 
        
        
      
    end

ControlBlock
   u_RegisterFile
           (
            .i_GPIOdata(GPIOdata),
            .i_MCUdata(MCUdata),
            .i_GPIOctrl(GPIOctrl),
            .i_GPIOvalid(validGPIO),
            .i_rst(rst_sw),
            .i_CLK(i_CLK),
            .i_EOP_from_FSM(EOP_from_FSM_to_CTRL),
            .o_GPIOdata(outGPIOctrl),
            .o_KNLdata(krnlData),
            .o_imgLength(imgLength_from_CTRL_to_FSM),
            .o_led(ledControl),
            .o_load(load_net),
            .o_EOP_to_MCU(EoP_to_MCU),
            .o_run(SOP_from_CTRL),
            .o_valid_to_FSM(valid_from_ctrl_to_FSM),
            .o_valid_to_CONV(validCONV),
            .o_KNorIMG(KorI),
            .o_MCUdata(output_MCUdata)
           );


FSMv2
   #(  
            .NB_ADDRESS(NB_ADDRESS),
            .NB_IMAGE (BITS_IMAGE),
            .NB_STATES(BITS_STATES)
            )
   u_FSM
		(
		.i_CLK(i_CLK),
		.i_load(load_net),
		.i_reset(rst_sw),
		.i_SoP(SOP_from_CTRL),
		.i_imgLength(imgLength_from_CTRL_to_FSM),
		.i_valid(valid_from_ctrl_to_FSM),
		.o_valid_fromFSM_toCONV(valid_for_conv),
		.o_readAdd(rdAdd),
		.o_SOP_fromFSM(sop_fromFSM),
		.o_writeAdd(wrAdd),
		.o_EoP(EOP_from_FSM_to_CTRL),
		.o_changeBlock(changeBlock)
		);

endmodule