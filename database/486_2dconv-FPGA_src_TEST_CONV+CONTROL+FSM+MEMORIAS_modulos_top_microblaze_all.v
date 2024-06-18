// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

`timescale 1ns / 1ps


`define NB_ADDRESS      10
`define NB_IMAGE        10


module top_microblaze_all
    (
        input           	 i_CLK,
        input 	[3:0]        sw,
        input 	[3:0]        btn,
        output 	[3:0]        o_led,
        output          	 uart_rxd_out,
        input           	 uart_txd_in, 
        input                ck_rst
    );
        
        parameter BITS_ADDRESS= `NB_ADDRESS;
        parameter BITS_IMAGE  = `NB_IMAGE;
        
        wire [31:0]gpio_i_data_tri_i;
        wire [31:0]gpio_o_data_tri_o;
        wire rst;
        wire sys_clock;
        wire uart_rtl_rxd;
        wire uart_rtl_txd;
        wire [2:0] ledstates;
        
        //Senales nuevas
        wire led_warning;
        wire valid;
        wire reset_sw;
        wire clock1;
        wire clock2;
       
    
        //Assigns:
        assign  rst                         = ck_rst;
        assign  sys_clock                   = i_CLK;
        assign  uart_rtl_rxd                = uart_txd_in;
        assign  uart_rxd_out                = uart_rtl_txd;
        assign  o_led[3]                    = led_warning;
        assign  o_led[2:0]                  = ledstates;
        
        

//MICRO NUEVO
  design_1
        u_microblaze
           (.clock100(clock2),
            .gpio_rtl_tri_i(gpio_i_data_tri_i),
            .gpio_rtl_tri_o(gpio_o_data_tri_o),
            .o_lock_clock(led_warning),
            .reset(rst),
            .sys_clock(sys_clock),
            .usb_uart_rxd(uart_rtl_rxd),
            .usb_uart_txd(uart_rtl_txd)
            );
    

    micro_all
        u_topMicro(
            .gpio_i_data_tri_i(gpio_i_data_tri_i),
            .o_led(ledstates),
            .i_CLK(clock2),
            .gpio_o_data_tri_o(gpio_o_data_tri_o)
            );
  

endmodule