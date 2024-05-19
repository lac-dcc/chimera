// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

/* Memory mapped modules */
   // BUFG BUFG1 (.O(clk), .I(sys_clk_in));  // TODO: PLL

   wire clk200mhz;
   wire clk25mhz;

   clk_wiz_0 clk_1
    (
        // Clock in ports
        .clk_in1(sys_clk_in),
        .resetn(0),
        // Clock out ports  
        .clk_out2(clk),
        .clk_out1(clk200mhz),
        .clk_out3(clk25mhz),
        // Status and control signals        
        .locked()            
    );     


   assign rst = sys_reset;

   ledwriter ledwr1 (.clk(clk),
                     .rst(rst),
                     
                     .LED(LED),
                     
                     .addr_b(ram_addr_in_b),
                     .data_b_in(ram_data_out_b),
                     .data_b_we(ram_we_out));

   sevensegmm seg7 (.clk(clk),
                    .rst(rst),
                    .addr_b(ram_addr_in_b),
                    .data_b_in(ram_data_out_b),
                    .data_b_we(ram_we_out),
                    .seg(SEG),
                    .an(AN));


/*
   wire [31:0]     data_bus_in_uart;
   wire            data_bus_strobe_uart;

   uartmm uart1(.clk(clk),
                .rst(rst),

                // Module external signals: TODO: generate?
                .TX(uart_txd),
                .RX(uart_rxd),
                //////////
                
                .data_b(data_bus_in_uart),
                .addr_b(ram_addr_in_b),
                .strobe_b(data_bus_strobe_uart),
                .data_b_in(ram_data_out_b),
                .data_b_we(ram_we_out)
                );
*/

/* VGA module */

wire vga_clsrq;

wire vga_clsack;

wire [19:0] vmem_in_addr;

wire [7:0] vmem_in_data;
wire [7:0] vmem_p1_out_data;

wire vmem_we;
wire vmem_re;

wire vmem_select;

wire vmem_bufswap;
wire vga_scan;


wire                    [3:0]   rgb;
assign vga_red = rgb;
assign vga_green = rgb;
assign vga_blue = rgb;

vgatopgfx vga1(.clk(clk),
               .rst(rst),

               .clk25mhz(clk25mhz),
               
	       .hsync(hsync),
	       .vsync(vsync),
	       .rgb(rgb),
               
               .clsrq(vga_clsrq),
               .clsack(vga_clsack),
               .vmem_in_addr(vmem_in_addr),
               .vmem_in_data(vmem_in_data),
               .vmem_we(vmem_we),
               .vmem_re(vmem_re),
               .vmem_p1_out_data(vmem_p1_out_data),

               .bufswap(vmem_bufswap),
               .vga_scan(vga_scan)
               );

`ifdef ENABLE_SOUND
   wire            sound_clr_full;
   wire [15:0]     sound_clr_sample;
   wire [15:0]     sound_clr_rate;
   wire            sound_clr_req;

   assign aud_sd = 1;
   
   soundctl  sound1 ( .clk(clk),
                      .rst(rst),
                      .sound_clr_full(sound_clr_full),
                      .sound_clr_sample(sound_clr_sample),
                      .sound_clr_rate(sound_clr_rate),
                      .sound_clr_req(sound_clr_req),
                      .pwm_out(pwm_out)
                      );


  
`endif
