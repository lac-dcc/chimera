// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define NB_ADDRESS      10
`define NB_IMAGE        10
`define NB_STATES       2
`define N_CONV          1
`define LATENCIA        5
module FSM#(
    parameter NB_ADDRESS= `NB_ADDRESS,
    parameter NB_IMAGE  = `NB_IMAGE,
    parameter NB_STATES = `NB_STATES,
    parameter  N_CONV   = `N_CONV,
    parameter  LATENCIA = `LATENCIA
    )(
    //Definicion de puertos
    output [NB_ADDRESS-1:0]  o_writeAdd,
    output [NB_ADDRESS-1:0]  o_readAdd,
    output                   o_EoP,
    output             [2:0] o_led,
    output                   o_fsm_SOP,
    output                   o_changeBlock,
    output                   o_FSM_valid_conv,
    input  [NB_IMAGE-1:0]    i_imgLength,
    input                    i_CLK,
    input                    i_reset,
    input                    i_SoP,
    input                    i_valid,
    input                    i_load
    );
    //Latcheo de salidas 
    reg [NB_ADDRESS-1:0]                     counterAdd;
    reg [NB_ADDRESS-1:0]           counter_with_latency;
    reg [N_CONV-1:0]                       endOfProcess;
    //registro utulizado para el estado de carga a las memoriras
    reg                                     changeBlock;
    reg                                      sopControl;
    reg                            valid_previous_state;
    //registro utilizado para el valid de convolucionador
    reg                                      fms2conVld;
    //Ni bien se crean los registros, toman esos valores.
    reg [NB_STATES-1:0]  states;

    reg                  w_eop;                 
    integer nconv;

    initial begin
        counterAdd              = `NB_ADDRESS'd0;
        counter_with_latency    = `NB_ADDRESS'd0;
       
        endOfProcess            = `N_CONV'd0;
        changeBlock             = 1'b0;
        sopControl              = 1'b0;
        valid_previous_state    = 1'b0;
        fms2conVld              = 1'b0;
        states                  = `NB_STATES'd0;
    end        
    
    always @(posedge i_CLK) begin  
      	valid_previous_state<=i_valid;
      	if(i_reset)begin
        	counterAdd           <= `NB_ADDRESS'd0;
        	counter_with_latency <= `NB_ADDRESS'd0;
        	endOfProcess         <= `N_CONV'd0;
        	changeBlock          <= 1'b0;
        	sopControl           <= 1'b0;
            fms2conVld           <= 1'b0;
            states               <= `NB_STATES'd0;
      	end
      	else begin
            
            if(states == 2'b00) begin
                counter_with_latency  <= `NB_ADDRESS'd0;
                counterAdd            <= `NB_ADDRESS'd0;
                changeBlock           <= 1'b0;
            
                if(i_load && ~i_SoP && endOfProcess==0) begin
                    //estado de carga
                    states          <= 2'b01;
                    sopControl      <= 1'b0;
                    fms2conVld      <= 1'b0;
                end
                else if(~i_load  && i_SoP && endOfProcess==0) begin
                    //estado de procesamiento
                    states <= 2'b10;
                    sopControl      <= 1'b1;
                    fms2conVld      <= 1'b1;
                end
                else if(~i_load && ~i_SoP && endOfProcess>0)begin
                    //estado de lectura
                    endOfProcess    <= endOfProcess-1;
                    states          <= 2'b01;
                    sopControl      <= 1'b0;
                    fms2conVld      <= 1'b0;
                end
                else begin
                    states          <= states;
                    sopControl      <= 1'b0;
                    fms2conVld      <= 1'b0;
                end
            end
            else if(states == 2'b01)begin
                //Manejo de direcciones en función del valid
                if (i_valid && !valid_previous_state) begin 
                    //Verificación si termino de leer/cargar un bloque
                    if (endOfProcess > 0 && counterAdd==i_imgLength-2)begin
                        counterAdd      <= counterAdd;
                        changeBlock     <= 1'b1;
                        states          <= 2'b00;
                    end
                    else if (counterAdd == i_imgLength) begin
                        counterAdd      <= counterAdd;
                        changeBlock     <= 1'b1;
                        states          <= 2'b00;
                    end
                    else begin
                        counterAdd      <= counterAdd+1;
                        changeBlock     <= changeBlock;
                        states          <= states; 
                    end
                end 
                else 
                    counterAdd   <= counterAdd;
            end
            else if(states == 2'b10) begin
             
                if(counterAdd < i_imgLength)  
                    counterAdd   <= counterAdd+1;
                else 
                    counterAdd   <= counterAdd;
                //Shifteo para el write address, teniendo en cuenta la latencia.
                if(counterAdd>=LATENCIA && counter_with_latency < i_imgLength-2) begin
                    counter_with_latency    <= counter_with_latency +1;
                    fms2conVld              <= fms2conVld;
                    states                  <= states;
                end
                else if(counter_with_latency == i_imgLength-2)begin 
                    //si se llega la tamaño de la imagen reseteo los contadores 
                    changeBlock     <= 1'b1;
                    counter_with_latency    <= counter_with_latency;
                    fms2conVld              <= 1'b0;
                    states                  <= 2'b11;
                end
                else begin
                    counter_with_latency    <= counter_with_latency;
                    fms2conVld              <= fms2conVld;
                    states                  <= states;
                    end
            end
        	else if(states == 2'b11)begin
              endOfProcess            <= N_CONV+1;
                if (~i_SoP) 
                    states   <= 2'b00;
                else 
                    states <= states;  
            end
        end 
    end 
    //end always

    always @(*) begin
        w_eop = 0;
        for(nconv=0; nconv<N_CONV; nconv = nconv +1)
            w_eop = w_eop | endOfProcess[nconv];
    end

     //Assign          
    assign     {o_writeAdd}   =  (sopControl) ? counter_with_latency:counterAdd;//counterAdd;
    assign     {o_readAdd}    =  counterAdd;
    assign          {o_EoP}   =  w_eop;
    assign  {o_changeBlock}   =  changeBlock;
    assign  o_FSM_valid_conv  = fms2conVld;
    assign  o_fsm_SOP         = sopControl;
    assign          o_led[0]  = i_load;
    assign          o_led[1]  = w_eop;
    assign          o_led[2]  = sopControl;
endmodule