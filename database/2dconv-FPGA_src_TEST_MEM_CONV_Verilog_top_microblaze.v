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

module top_microblaze#(
    parameter BIT_LEN       = `BIT_LEN,
    parameter CONV_LEN      = `CONV_LEN,
    parameter CONV_LPOS     = `CONV_LPOS,
    parameter M_LEN         = `M_LEN,
    parameter NB_ADDRESS    = `NB_ADDRESS,
    parameter RAM_WIDTH     = `RAM_WIDTH,
    parameter GPIO_D        = `GPIO_D,
    localparam MEMO         = 1,
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

    reg signed [BIT_LEN-1:0] dmicro0,dmicro1,dmicro2;

    reg [NB_ADDRESS-1:0] write_add;
    reg [NB_ADDRESS-1:0] read_add;
    reg [RAM_WIDTH-1:0] i_data_mem1, i_data_mem2;
    //-----cambios
    reg [RAM_WIDTH-1:0] reg_aux;
    //----------
    reg ending;

    wire [GPIO_D-1:0] gpio_i_data_tri_i;
    wire [GPIO_D-1:0] gpio_o_data_tri_o;
    wire [NB_ADDRESS-1:0] write_address_MEM;
    wire [NB_ADDRESS-1:0] read_address_MEM;
    
    //reste del micro 
    wire reset;
    //clock de entrada al micro
    wire sys_clock;
    //clock de salida del micro
    wire clk_o;
    
    
    wire k_i; //selector de K/I
    wire valid;
    wire rst;

    //Datos a la entrada del convlucionador    
    wire signed [BIT_LEN-1:0] dato0, dato1, dato2;
    //datos salida del conv 
    wire signed [RAM_WIDTH-1:0] data_oc;
    //entrada de la mem_0
    wire signed [RAM_WIDTH-1:0] i_mem0;
    //salida de las meomorias
    wire signed [RAM_WIDTH-1:0] mem0_o,mem1_o,mem2_o;
    //select mux direccion y write eneable
    wire rstm,wen;

    // Microconotrolador
    assign reset        = sw[0];
    assign sys_clock    = CLK100MHZ;
    
    assign rst      = gpio_o_data_tri_o[0]; //primeo en 1 despues en 0 res top y conv
    assign k_i      = gpio_o_data_tri_o[1]; //K/I en 1 para la conv
    assign valid    = gpio_o_data_tri_o[2]; //en 1 para la conv
    assign rstm     = gpio_o_data_tri_o[3]; //seleccion aal addres del micro o del top
    assign wen      = gpio_o_data_tri_o[4];
        
    //asignacion de los datos de la memoria o del micro al convolucionador 
    assign dato0 = (k_i==1'b0)?dmicro0:mem0_o[BIT_LEN-1:0];
    assign dato1 = (k_i==1'b0)?dmicro1:mem1_o[BIT_LEN-1:0];
    assign dato2 = (k_i==1'b0)?dmicro2:mem2_o[BIT_LEN-1:0];

    //asignacion de la salida del convolucionador a la primera memoria 
    assign i_mem0 = reg_aux;
    // asignacon de la direccion de lectura de un registro local o del gpio
    assign read_address_MEM = (rstm==1'b0)?gpio_o_data_tri_o[NB_ADDRESS+7:8]:read_add;
    // asignacion de la direccion de escritura de un registro local
    assign write_address_MEM = write_add;
    // asignacion de la salida de la memoria 0 al micro
    assign gpio_i_data_tri_i[RAM_WIDTH-1:0] = mem0_o;
    assign gpio_i_data_tri_i[GPIO_D-1:RAM_WIDTH] = 19'h0;
    //asignacion de la finalizacion al led para un udicador visual.
    assign led[0] = ~ending;

    initial begin
        dmicro0     = {BIT_LEN{1'b0}};
        dmicro1     = {BIT_LEN{1'b0}};
        dmicro2     = {BIT_LEN{1'b0}};
        read_add    = {NB_ADDRESS{1'b1}};
        write_add   = {NB_ADDRESS{1'b1}};
        ending      = 1'b1;
        i_data_mem1 = {RAM_WIDTH{1'b0}};
        i_data_mem2 = {RAM_WIDTH{1'b0}};
        reg_aux     <= {RAM_WIDTH{1'b0}};
    end

    always @(posedge clk_o ) begin
        if (rst) begin
            // reset
            read_add    <= {NB_ADDRESS{1'b0}};
            write_add   <= {NB_ADDRESS{1'b0}};
            ending      <= 1'b1;
            dmicro0     <= 8'h94;
            dmicro1     = {BIT_LEN{1'b0}};
            dmicro2     = {BIT_LEN{1'b0}};
            i_data_mem1 = {RAM_WIDTH{1'b0}};
            i_data_mem2 = {RAM_WIDTH{1'b0}};
            reg_aux     <= {RAM_WIDTH{1'b0}};
        end
        else if (valid==1'b1 && ending==1'b1) begin
            dmicro0     <= dmicro0;
            dmicro1     <= dmicro1;
            dmicro2     <= dmicro2;
            
            reg_aux     <= data_oc;
            read_add    <= read_add +1;
            
            if (read_add >= 10'h6 && read_add <= 10'd440)
                write_add   <= write_add +1;
            else write_add   <= write_add;
            
            if(read_add == 10'd440) ending <=0;           
            else ending <= ending;
        end
        else begin
            read_add    <= read_add;
            write_add   <= write_add;
            ending      <= ending;
            i_data_mem1 <= i_data_mem1;
            i_data_mem2 <= i_data_mem2;
            dmicro0     <= dmicro0;
            dmicro1     <= dmicro1;
            dmicro2     <= dmicro2;
        end
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
   
   //inacia de Convolucionador
    Conv
        u_conv(.o_data(data_oc),
            .i_dato0(dato0),
            .i_dato1(dato1),
            .i_dato2(dato2),
            .i_selecK_I(k_i),
            .i_reset(rst),
            .i_valid(valid),
            .CLK100MHZ(clk_o));

    //intancia de la memoria
    bram_memory#(
                .INIT(MEMO))
        u_bram_0(.o_data(mem0_o),
            .i_wrEnable(wen),
            .i_data(i_mem0),
            .i_writeAdd(write_address_MEM),
            .i_readAdd(read_address_MEM),
            .i_CLK(CLK100MHZ));
    
    bram_memory#(
                .INIT(MEM1))
        u_bram_1(.o_data(mem1_o),
            .i_wrEnable(wen),
            .i_data(i_data_mem1),
            .i_writeAdd(write_address_MEM),
            .i_readAdd(read_address_MEM),
            .i_CLK(CLK100MHZ));
    
    bram_memory#(
                .INIT(MEM2))
        u_bram_2(.o_data(mem2_o),
            .i_wrEnable(wen),
            .i_data(i_data_mem2),
            .i_writeAdd(write_address_MEM),
            .i_readAdd(read_address_MEM),
            .i_CLK(CLK100MHZ));
                
endmodule
