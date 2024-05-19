// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_microblaze
    #(
      parameter N = 2,
      parameter STATES = 3,
      parameter BITS_IMAGEN = 11,
      parameter BITS_DATA = BITS_IMAGEN,
      parameter BITS_ADDR = 10
      )(
        input        CLK,
        input [3:0]  sw,
        input [3:0]  btn,
        output [3:0] o_led,
        output       uart_rxd_out,
        input        uart_txd_in 
        );
    
    
    //Old micro (dejar!)
    wire [31:0]   gpio_i_data_tri_i;
    wire [31:0]   gpio_o_data_tri_o;
    wire          reset;
    wire          sys_clock;
    wire          uart_rtl_rxd;
    wire          uart_rtl_txd;
    
    //Senales nuevas
    wire          led_warning;
    wire          led_m1;
    wire          led_m2;
    wire          valid;
    wire          enable;
    wire          init;
    wire          reset_sw;
    wire          clock1;
    wire          clock2;
    
    //Wires propios de los modulos
    
    wire [N*BITS_IMAGEN-1:0] DataConv; // a mano
    wire [BITS_DATA-1:0]     Data; // a mano
    wire [(N+2)*BITS_IMAGEN-1:0] MemData; // from memory
    wire [BITS_ADDR-1:0]         WAddr; // a mano
    wire                         RAddr; // a mano
    wire                        chblk; // a mano
    wire                        sop;// a mano
    wire                        eop;// a mano
    //wire                        rst;// a mano
    //wire                        clk;// a mano
    
    wire [3*N*BITS_IMAGEN-1:0]  DataConv; // ?
    wire [BITS_DATA-1:0]        Data; // ?
    wire [N+1:0]                we; // to memory
    wire [BITS_ADDR-1:0]        WAddr, RAddr; // to memory
    wire [(N+2)*BITS_IMAGEN-1:0] MemData; // to memory
                                   
                                   
    //Assigns:
    assign  reset           = sw[0];
    assign  sys_clock       = CLK;
    assign  uart_rtl_rxd    = uart_txd_in;
    assign  uart_rxd_out    = uart_rtl_txd;
    //assign  gpio_i_data_tri_i   = {{24{1'b0}},sw,btn};
    //assign  led                 =  gpio_o_data_tri_o[3:0];
    ////////////////////////
    assign i_dA_m1=16'b1111111111111111;
    assign i_dA_m2=16'b1010101010101010;
    assign  reset_sw         = gpio_o_data_tri_o[0];
    assign  enable           = gpio_o_data_tri_o[1];
    assign  init             = gpio_o_data_tri_o[2];
    assign  valid            = gpio_o_data_tri_o[3];
    assign  i_addressB       = gpio_o_data_tri_o[19:4];
    assign  reset            = sw[0];
    assign  sys_clock        = CLK;
    assign  uart_rtl_rxd     = uart_txd_in;
    assign  uart_rxd_out     = uart_rtl_txd;
    //assign  gpio_i_data_tri_i   = {{24{1'b0}},sw,btn};
    assign o_led[0]          = led_m1&led_m2;
    assign o_led[1]          = led_warning;
    
    //MICRO NUEVO
    
    design_1
        u_MCU
            (.clock100(clock2),
             .gpio_rtl_tri_i(gpio_i_data_tri_i),
             .gpio_rtl_tri_o(gpio_o_data_tri_o),
             .o_lock_clock(led_warning),
             .reset(reset),
             .sys_clock(sys_clock),
             .usb_uart_rxd(uart_rtl_rxd),
             .usb_uart_txd(uart_rtl_txd)
             );
    
    MCU
        u_MemCU
            (
             .i_DataConv(DataConv),
             .i_Data(Data),
             .i_MemData(MemData),
             .i_WAddr(WAddr),
             .i_RAddr(RAddr),
             .i_chblk(chblk),
             .i_sop(sop),
             .i_eop(eop),
             .rst(),
             .clk(clock2),
             
             .o_DataConv(),
             .o_Data(),
             .o_we(),
             .o_WAddr(),
             .o_RAddr(),
             .o_MemData()
             )
    //memory instances
    memory begin
        u_memory_1
            (
             .i_wrEnable(),
             .i_CLK(),
             .i_writeAdd(),
             .i_readAdd(),
             .i_data(),
         
             .o_data(),
             );
    
        u_memory_2
            (
             .i_wrEnable(),
             .i_CLK(),
             .i_writeAdd(),
             .i_readAdd(),
             .i_data(),
             
             .o_data(),
             );
    end
        

endmodule
