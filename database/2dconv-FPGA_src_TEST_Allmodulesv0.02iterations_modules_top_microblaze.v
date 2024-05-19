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

module top_microblaze
    #(
      parameter BIT_LEN       = `BIT_LEN,
      parameter CONV_LEN      = `CONV_LEN,
      parameter CONV_LPOS     = `CONV_LPOS,
      parameter M_LEN         = `M_LEN,
      parameter NB_ADDRESS    = `NB_ADDRESS,
      parameter RAM_WIDTH     = `RAM_WIDTH,
      parameter GPIO_D        = `GPIO_D,
      parameter N = 2,
      parameter BITS_IMAGEN = 8,
      parameter BITS_DATA = 13
      )(
        output [3:0] o_led,
        output       uart_rxd_out,
        input        i_CLK,
        input        ck_rst,
        input        uart_txd_in 
    );


    wire [GPIO_D-1:0] gpio_i_data_tri_i;
    wire [GPIO_D-1:0] gpio_o_data_tri_o;
    
    //reste del micro 
    wire reset;
    //clock de entrada al micro
    wire sys_clock;
    //clock de salida del micro
    wire clk_o;
    wire [2:0] ledStates;
    wire led_clock;
    
    // Microconotrolador
    assign reset        = ck_rst;
    assign sys_clock    = i_CLK;
    assign  o_led[3]    = led_clock;
    assign  o_led[2:0]  = ledStates;



    // instacia del Microcontrolador
    design_1
        u_desing_1
            (
             .clock100(clk_o),
             .gpio_rtl_tri_i(gpio_i_data_tri_i),
             .gpio_rtl_tri_o(gpio_o_data_tri_o),
             //.gpio_rtl_tri_t,
             .o_lock_clock(led_clock),
             .reset(reset),
             .sys_clock(sys_clock),
             .usb_uart_rxd(uart_txd_in),
             .usb_uart_txd(uart_rxd_out)
             );
    top_module
        u_ALL
            (
             .gpio_i_data_tri_i(gpio_i_data_tri_i),
             .o_led(ledStates),
             .CLK100MHZ(clk_o),
             .gpio_o_data_tri_o(gpio_o_data_tri_o)
             
             );
endmodule