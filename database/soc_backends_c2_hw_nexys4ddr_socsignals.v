
                 input uart_rxd,
                 output uart_txd,

                 output [15:0] LED,

                 output            vsync,
                 output            hsync,
                 output [3:0]      vga_red,
                 output [3:0]      vga_green,
                 output [3:0]      vga_blue,

                 output [7:0]      SEG,
                 output [7:0]      AN,

`ifdef ENABLE_SOUND                       
                 // Audio PWM pin
                 output pwm_out,
                 output aud_sd,
`endif                       
