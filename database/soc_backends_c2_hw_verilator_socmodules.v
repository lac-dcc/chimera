/* Memory mapped modules */

   assign clk = sys_clk_in;
   assign rst = sys_reset;


   wire [7:0]           LED;

   ledwriter ledwr1 (.clk(clk),
                     .rst(rst),
                     
                     .LED(LED),
                     
                     .addr_b(ram_addr_in_b),
                     .data_b_in(ram_data_out_b),
                     .data_b_we(ram_we_out));

   vgadumper vgadump1 (.clk(clk),
                       .rst(rst),
                     
                       .vga_dump(vga_dump),
                       
                       .addr_b(ram_addr_in_b),
                       .data_b_in(ram_data_out_b),
                       .data_b_we(ram_we_out));


   wire [31:0]     data_bus_in_uart;
   wire            data_bus_strobe_uart;

   uartmm uart1(.clk(clk),
                .rst(rst),
                
                .uart_din(uart_din),
                .uart_valid(uart_valid),
                .uart_dout(uart_out),
                .uart_wr(uart_wr),
                
                .data_b(data_bus_in_uart),
                .addr_b(ram_addr_in_b),
                .strobe_b(data_bus_strobe_uart),
                .data_b_in(ram_data_out_b),
                .data_b_we(ram_we_out)
                );


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


   vgatopgfxsim vga1(.clk(clk),
                     .rst(rst),
                     .clsrq(vga_clsrq),
                     .clsack(vga_clsack),
                     .vmem_in_addr(vmem_in_addr),
                     .vmem_in_data(vmem_in_data),
                     .vmem_we(vmem_we),
                     .vmem_re(vmem_re),
                     .vmem_p1_out_data(vmem_p1_out_data),
                     
                     .vmem_out_addr(vmem_out_addr),
                     .vmem_out_data(vmem_out_data));

                
