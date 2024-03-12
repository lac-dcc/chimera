/* Memory mapped modules */


   // Generate 25.00MHz

   reg [1:0]    clkdiv;  // divider
   always @(posedge sys_clk_in)
     begin
           case (clkdiv)
             2'b11: clkdiv <= 2'b10;
             2'b10: clkdiv <= 2'b00;
             2'b00: clkdiv <= 2'b01;
             2'b01: clkdiv <= 2'b11;
           endcase
     end
   assign clk = clkdiv[1];
   
   // Bi-directional SRAM data pins
   wire [15:0] sram_in;
   wire [15:0] sram_out;
   wire data_we;
 
   wire sram_vga_busy;
   wire [2:0] rgb;

   // AMBER: #ffff33
   assign red=rgb[1]?4'he:4'b0;
   assign green=rgb[0]?4'he:4'b0;
   assign blue=rgb[2]?4'h3:4'b0;
   
   SB_IO
     #(
       .PIN_TYPE(6'b 1010_01)
       )
   sram_data_pins [15:0]
     (
      .PACKAGE_PIN(DAT),
      .OUTPUT_ENABLE(data_we_cpu),
      .D_OUT_0(sram_out),
      .D_IN_0(sram_in)
      );

   assign RAMCS_b = 1'b0;
   assign RAMOE_b = !data_we;
   assign RAMWE_b = (data_we);
   assign RAMUB_b = 1'b0;
   assign RAMLB_b = 1'b0;

   wire [17:0] sram_adr_vga;
   wire [17:0] sram_adr_cpu;

   assign ADR = grant_vga?sram_adr_vga:grant_cpu?sram_adr_cpu:0;
   wire data_we_cpu;
   assign data_we = grant_vga?1:(!data_we_cpu);

   wire data_rq_cpu;
   wire data_rq_vga;
   wire grant_cpu;
   wire grant_vga;

   arbiter arb1 (.clk(clk),
                 .rst(!rst),
                 .req0(data_rq_cpu),
                 .req1(data_rq_vga),
                 .req2(0), .req3(0),
                 .gnt0(grant_cpu),
                 .gnt1(grant_vga),
                 .gnt2(gnt2_),
                 .gnt3(gnt3_));

   

   wire vgaenable;
   

   vga640x480ice vga1 (.clk(clk),
                       .clk25mhz(clk),
                       .rst(vgaenable),
                       .sram_adr_vga(sram_adr_vga),
                       .sram_in(sram_in),

                       .data_rq_vga(data_rq_vga),
                       .grant_vga(grant_vga),
                       
                       .hsync(hsync),
                       .vsync(vsync),
                       .rgb(rgb));

   reg [9:0] reset_counter = 0;
   reg       hard_reset = 0;
   
   always @(posedge clk) if (!hard_reset) begin
      reset_counter <= reset_counter + 1;
      if (reset_counter[9]) hard_reset <= 1;
   end
   assign rst = hard_reset;
   

   wire [3:0]           LED;
   wire [3:0]           LEDr;

   outpin led0 (.clk(clk), .we(1'b1), .pin(LED1), .wd(LED[0]), .rd(LEDr[0]));
   outpin led1 (.clk(clk), .we(1'b1), .pin(LED2), .wd(LED[1]), .rd(LEDr[1]));
   outpin led2 (.clk(clk), .we(1'b1), .pin(LED3), .wd(LED[2]), .rd(LEDr[2]));
   outpin led3 (.clk(clk), .we(1'b1), .pin(LED4), .wd(LED[3]), .rd(LEDr[3]));

   ledwriter ledwr1 (.clk(clk),
                     .rst(rst),
                     
                     .LED(LED),
                     
                     .addr_b(ram_addr_in_b),
                     .data_b_in(ram_data_out_b),
                     .data_b_we(ram_we_out));

   wire [31:0]     data_bus_in_uart;
   wire            data_bus_strobe_uart;

`ifdef ENABLE_UART
   
   uartmm uart1(.clk(clk),
                .rst(rst),

                .TX(TX),
                .RX(RX),
                
                .data_b(data_bus_in_uart),
                .addr_b(ram_addr_in_b),
                .strobe_b(data_bus_strobe_uart),
                .data_b_in(ram_data_out_b),
                .data_b_we(ram_we_out)
                );
`else // !`ifdef ENABLE_UART
   assign data_bus_strobe_uart = 0;

`endif // !`ifdef ENABLE_UART

   
