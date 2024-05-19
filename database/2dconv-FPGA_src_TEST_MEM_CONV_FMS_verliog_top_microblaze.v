// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps

`define BIT_LEN 8
`define CONV_LEN 20
`define CONV_LPOS 13
`define M_LEN 3
`define GPIO_D 32
`define NB_ADDRESS 10
`define RAM_WIDTH 13
`define NB_IMAGE    10

module top_microblaze#(
    parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter RAM_WIDTH     = `RAM_WIDTH,
    parameter GPIO_D        = `GPIO_D,
    parameter NB_IMAGE      = `NB_IMAGE,
    localparam MEM0         = 1,
    localparam MEM1         = 2,
    localparam MEM2         = 3
    )(
    output  [3:0]  led,
    output         uart_rxd_out,
    input   [3:0]  sw,
    input   [3:0]  btn,
    input          CLK100MHZ,
    input          uart_txd_in 
    );

//-----Mem0ria
    reg [RAM_WIDTH-1:0] i_data_mem0, i_data_mem1, i_data_mem2;
    //wire signed [RAM_WIDTH-1:0] i_mem0;
    //salida de las meomorias
    wire signed [RAM_WIDTH-1:0] mem0_o,mem1_o,mem2_o;

    //select mux direccion y write eneable
    reg wen_0,wen_1,wen_2;
    wire rstm;
    wire [1:0] sel;
    //----------

    //convolucionador ----------------------------------
    reg signed [BIT_LEN-1:0] dmicro0,dmicro1,dmicro2;
    reg signed [RAM_WIDTH-1:0] reg_aux;

    wire k_i; //selector de K/I
    wire valid_conv;
    wire rst_conv;

    //Datos a la entrada del convlucionador    
    wire signed [BIT_LEN-1:0] dato0, dato1, dato2;
    //datos salida del conv 
    wire signed [RAM_WIDTH-1:0] data_oc;
    //entrada de la mem_0

    //fms----------------------------------------------
    reg  [NB_IMAGE-1:0]     imgLength;
    wire [NB_ADDRESS-1:0]   write_add_fsm2conv;
    wire [NB_ADDRESS-1:0]   read_add_fsm2conv;
    wire rst_fsm, valid_fsm, sop, load;

    //micro---------------------------------------------
    wire [GPIO_D-1:0] gpio_i_data_tri_i;
    wire [GPIO_D-1:0] gpio_o_data_tri_o;
    //reste del micro 
    wire reset;
    //clock de entrada al micro
    wire sys_clock;
    //clock de salida del micro
    wire clk_o;
    

    // Microconotrolador (propio)
    assign reset        = sw[0];
    assign sys_clock    = CLK100MHZ;
    
    // Microconotrolador Asignacion GPIO
    //Convolucionador 
    assign rst_conv     = gpio_o_data_tri_o[0]; //primeo en 1 despues en 0 res top y conv
    assign k_i          = gpio_o_data_tri_o[1]; //K/I en 1 para la conv
    
    assign  rst_fsm     = gpio_o_data_tri_o[2];
    assign  sop         = gpio_o_data_tri_o[3];
    assign  valid_fsm   = gpio_o_data_tri_o[4]; //en 1 para la conv
    //estados 
    assign sel[0]       = gpio_o_data_tri_o[5];
    assign sel[1]       = gpio_o_data_tri_o[6];
    assign load         = gpio_o_data_tri_o[7];

    //asignacion de los datos de la memoria o del micro al convolucionador 
    assign dato0 = (k_i==1'b0)?dmicro0:mem0_o[BIT_LEN-1:0];
    assign dato1 = (k_i==1'b0)?dmicro1:mem1_o[BIT_LEN-1:0];
    assign dato2 = (k_i==1'b0)?dmicro2:mem2_o[BIT_LEN-1:0];

    //------------------------
    assign led[0] = wen_0;

    ///////.--------------------------
    assign gpio_i_data_tri_i[RAM_WIDTH-1:0] = mem0_o;
    assign gpio_i_data_tri_i[GPIO_D-1:RAM_WIDTH] = 19'h0;
    //asignacion de la finalizacion al led para un udicador visual.

    initial begin
        dmicro0     = 13'h0;
        dmicro1     = 13'h0;
        dmicro2     = 13'h0;
        i_data_mem1 = 13'h0;
        i_data_mem2 = 13'h0;
        i_data_mem0 = 13'h0;
        imgLength   = 10'd10;//10'd36;
        reg_aux     = 13'h0;
        wen_0       = 1'b0;
        wen_1       = 1'b0;
        wen_2       = 1'b0;
    end
    
    always @(posedge clk_o) begin
        reg_aux <= data_oc;
        //carga de la imagen;
        if(rst_fsm) 
            imgLength <= gpio_o_data_tri_o[RAM_WIDTH+7:8];
        else
            imgLength <= imgLength; 
    end

    always @(*) begin
        case(sel)
            2'b00: begin //carga memoria 0 
                i_data_mem0 = reg_aux;
                i_data_mem1 = 13'h0;
                i_data_mem2 = 13'h0;
                wen_0 = valid_conv;
                wen_1 = 1'b0;
                wen_2 = 1'b0;
            end
            2'b01:begin
                i_data_mem0 = gpio_o_data_tri_o[RAM_WIDTH+7:8];
                i_data_mem1 = 13'h0;
                i_data_mem2 = 13'h0;
                wen_0 = 1'b1;
                wen_1 = 1'b0;
                wen_2 = 1'b0;
            end
            2'b10:begin
                i_data_mem0 = 13'h0;
                i_data_mem1 = gpio_o_data_tri_o[RAM_WIDTH+7:8];
                i_data_mem2 = 13'h0;
                wen_0 = 1'b0;
                wen_1 = 1'b1;
                wen_2 = 1'b0;
            end
            2'b11:begin //covolucion
                i_data_mem0 = 13'h0;
                i_data_mem1 = 13'h0;
                i_data_mem2 = gpio_o_data_tri_o[RAM_WIDTH+7:8];
                wen_0 = 1'b0;
                wen_1 = 1'b0;
                wen_2 = 1'b1;
            end
        endcase
    end
  
    // instacia del Microcontrolador
    design_1 
      u_desing_1(.clock100(clk_o),
            .gpio_rtl_tri_i(gpio_i_data_tri_i),
            .gpio_rtl_tri_o(gpio_o_data_tri_o),
            //.gpio_rtl_tri_t,
            .o_lock_clock(led[3]),
            .reset(reset),
            .sys_clock(sys_clock),
            .usb_uart_rxd(uart_txd_in),
            .usb_uart_txd(uart_rxd_out));
   
   //instancia fms
   Fsmv
        u_fsmv(.o_writeAdd(write_add_fsm2conv),
            .o_readAdd(read_add_fsm2conv),
            .o_EoP(led[2]),
            .o_changeBlock(led[1]),
            .o_fms2conVld(valid_conv),
            .i_imgLength(imgLength),
            .i_CLK(clk_o),
            .i_reset(rst_fsm),
            .i_SoP(sop),
            .i_valid(valid_fsm),
            .i_load(load));


   //inacia de Convolucionador
    Conv
        u_conv(.o_data(data_oc),
            .i_dato0(dato0),
            .i_dato1(dato1),
            .i_dato2(dato2),
            .i_selecK_I(k_i),
            .i_reset(rst_conv),
            .i_valid(valid_conv),
            .CLK100MHZ(clk_o));

    //intancia de la memoria
    bram_memory#(
                .INIT(MEM0))
        u_bram_0 
            (.o_data(mem0_o),
            .i_wrEnable(wen_0),
            .i_data(i_data_mem0),
            .i_writeAdd(write_add_fsm2conv),
            .i_readAdd(read_add_fsm2conv),
            .i_CLK(clk_o));
    
    bram_memory#(
                .INIT(MEM1))
        u_bram_1(.o_data(mem1_o),
            .i_wrEnable(wen_1),
            .i_data(i_data_mem1),
            .i_writeAdd(write_add_fsm2conv),
            .i_readAdd(read_add_fsm2conv),
            .i_CLK(clk_o));
    
    bram_memory#(
                .INIT(MEM2))
        u_bram_2(.o_data(mem2_o),
            .i_wrEnable(wen_2),
            .i_data(i_data_mem2),
            .i_writeAdd(write_add_fsm2conv),
            .i_readAdd(read_add_fsm2conv),
            .i_CLK(clk_o));
endmodule
