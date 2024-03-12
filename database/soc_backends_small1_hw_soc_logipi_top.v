// Define if SDRAM controller still screws up frequent random reads
`define SDRAMBUGPRESENT 1

`ifdef ATLYS
 `define BLOCKRAM 1
`endif

`ifdef SIMULATION
 `define BLOCKRAM 1
`endif

`ifndef BLOCKRAM
 `ifdef SDRAMBUGPRESENT
  `define SDRAMBUG 1
 `endif
`endif

`ifdef BLOCKRAM
 `ifdef ATLYS
  `define SIM_RAM_SIZE  12*512
 `else
  `define SIM_RAM_SIZE  1024*512
 `endif
module temp_blockram (input         clk,
                      input         reset,
                      input [31:0]  cmd_address,
                      input         cmd_wr,
                      input         cmd_enable,
                      output reg    cmd_ready,
                      input [31:0]  cmd_data_in,
                      output [31:0] data_out,
                      output reg    data_out_ready);

   wire [31:0]                      none;

   toyblockram #(.RAM_DEPTH(`SIM_RAM_SIZE)) 
     inner
       (.clk(clk),
        .addr_a({2'b0,cmd_address[31:2]}),
        .datain_a(cmd_data_in),
        .wr_a(cmd_wr),
        .data_a(data_out),
        .data_b(none),
        .addr_b({2'b0,cmd_address[31:2]}));
   
    
   always @(posedge clk)
     if (!reset) begin
        cmd_ready <= 1;
        data_out_ready <= 0;
        
     end else
       begin
        if(cmd_ready) begin
           if (cmd_wr && cmd_enable) begin
              data_out_ready <= 0; cmd_ready <= 0;
           end else if(cmd_enable) begin
              data_out_ready <= 1; cmd_ready <= 0;
           end else if (!cmd_enable) begin data_out_ready <= 0; end
        end else cmd_ready <= 1;
       end
   
endmodule
`endif

module small1soc(
                 // External clock input
`ifndef SIMULATION
`ifdef  LOGIPI                 
                 input         OSC_FPGA,
`else
                 input sys_clk_in, // 100mhz
`endif                
`endif
`ifdef SIMULATION
                 input clk100mhz,
`endif

                 // Buttons, switches
`ifdef LOGIPI
                 input [1:0]   PB,
                 input [1:0]   SW,

		 output [7:0] PMOD1,
                 output [7:0] PMOD2,
`else
                 input sys_reset,
`endif

`ifdef ATLYS
                 input uart_rxd,
                 output uart_txd,
`endif

                 `ifndef SIMULATION
                 // SDRAM interface
                 output        SDRAM_CLK,
                 output        SDRAM_CKE,
                 //output        SDRAM_CS,
                 output        SDRAM_nRAS,
                 output        SDRAM_nCAS,
                 output        SDRAM_nWE,
                 output [1:0]  SDRAM_DQM,
                 output [12:0] SDRAM_ADDR,
                 output [1:0]  SDRAM_BA,
                 inout [15:0]  SDRAM_DQ,
                 `endif
                 
                 `ifdef SIMULATION
                 output reg    FINISH,
                 `endif
                 
                 // SPI interface
                 input         SYS_SPI_SCK,
                 input         RP_SPI_CE0N,
                 input         SYS_SPI_MOSI,
                 output        SYS_SPI_MISO,

                 // LEDs to blink
`ifdef LOGIPI
                 output [1:0]  LED
`else
                 output reg [7:0] LED
`endif
                 );

   reg [31:0]                  clk_ctr;

   wire                        cpu_reset;
`ifdef LOGIPI
   assign cpu_reset = PB[0];
`else
   assign cpu_reset = sys_reset;
`endif

   always @(posedge clk100mhz)
     if (!cpu_reset) begin
        clk_ctr <= 0;
        
     end else clk_ctr <= clk_ctr + 1;
   

   reg [31:0] FAILED_ADDR;

     
   parameter test_frequency = 100_000_000 ;
   parameter test_frequency_25mhz = 25_174_000 ;
   parameter test_frequency_mhz = test_frequency/1_000_000 ;
   parameter freq_multiplier = 16 ;
`ifdef LOGIPI
   parameter freq_divider = (freq_multiplier*50_000_000)/test_frequency ;
   parameter freq_divider25mhz = (freq_multiplier*50_000_000)/test_frequency_25mhz ;
`else
   parameter freq_divider = (freq_multiplier*100_000_000)/test_frequency ;
`endif
   
   parameter sdram_address_width= 24;
   parameter sdram_column_bits = 9;
   parameter sdram_startup_cycles = 10100; // 100us, plus a little more
   parameter cycles_per_refresh  = (64000*test_frequency_mhz)/8192-1;

   reg [4:0] spi_state;
   
   wire [sdram_address_width-1:0] cmd_address;
   wire                           cmd_wr;
   wire                           cmd_enable;
   wire                           cmd_ready;
   wire [31:0]                    cmd_data_in;
   wire [31:0]                    data_out;
   wire [31:0]                    data_out_from_sdram;
   wire                           data_out_ready;
   wire                           clkfb;
   wire                           clk100mhz;
                          
   wire                           clkb;
   wire                           clku;

   reg                            cpu_force_reset;
   reg                            mem_acc_irq; // if accessing unmapped address
   
`ifdef BLOCKRAM
   temp_blockram RAM (.clk(clk100mhz),
                      .reset(cpu_reset),
                      .cmd_address(cmd_address),
                      .cmd_wr(cmd_wr),
                      .cmd_enable(cmd_enable),
                      .cmd_ready(cmd_ready),
                      .cmd_data_in(cmd_data_in),
                      
                      .data_out(data_out),
                      .data_out_ready(data_out_ready));

`endif //  `ifdef BLOCKRAM

`ifdef ATLYS
   BUFG BUFG1 (.O(clk100mhz), .I(sys_clk_in));
`endif


`ifdef LOGIPI
   wire [12:0]			  vmem_in_addr;
   wire [7:0] 			  vmem_in_data;
   reg 				  vmem_we;
   wire                           clku25mhz;
   wire                           clk25mhz;
  
   // Using a nice Digilent PmodVGA instead of my abominable contraption
   wire                           vgamono;

   assign PMOD1[3:0] = {vgamono,vgamono,vgamono,vgamono}; // blue
   assign PMOD1[7:4] = {vgamono,vgamono,vgamono,vgamono}; // red
   assign PMOD2[3:0] = {vgamono,vgamono,vgamono,vgamono}; // green
   assign PMOD2[6] = 0;
   assign PMOD2[7] = 0;
   
   vgatop vga1(.clk(clk100mhz),
	       .rst(cpu_reset),
	       .clk25mhz(clk25mhz),

	       .hsync(PMOD2[4]),
	       .vsync(PMOD2[5]),
	       .rgb(vgamono),

	       .vmem_in_addr(vmem_in_addr),
	       .vmem_in_data(vmem_in_data),
	       .vmem_we(vmem_we));
`endif

`ifndef BLOCKRAM
   wire                           SDRAM_CS;
   

   SDRAM_Controller
     #(
       .sdram_address_width(sdram_address_width),
       .sdram_column_bits(sdram_column_bits),
       .sdram_startup_cycles(sdram_startup_cycles),
       .cycles_per_refresh(cycles_per_refresh),
       .very_low_speed(0)
       ) RAM (
               .clk(clk100mhz),
               .reset(0),
               .cmd_address(cmd_address),
               .cmd_wr(cmd_wr),
               .cmd_enable(cmd_enable),
               .cmd_ready(cmd_ready),
               .cmd_byte_enable(4'b1111),
               .cmd_data_in(cmd_data_in),
               
               .data_out(data_out),
               .data_out_ready(data_out_ready),
               .SDRAM_CLK(SDRAM_CLK),
               .SDRAM_CKE(SDRAM_CKE),
               .SDRAM_CS(SDRAM_CS),
               .SDRAM_RAS(SDRAM_nRAS),
               .SDRAM_CAS(SDRAM_nCAS),
               .SDRAM_WE(SDRAM_nWE),
               .SDRAM_DQM(SDRAM_DQM),
               .SDRAM_BA(SDRAM_BA),
               .SDRAM_ADDR(SDRAM_ADDR),
               .SDRAM_DATA(SDRAM_DQ)
               );

   // assign data_out = {data_out_from_sdram[15:0], data_out_from_sdram[31:16]};
`endif

`ifdef LOGIPI
`ifdef FPGA
   PLL_BASE #(
              .BANDWIDTH("OPTIMIZED"),        // "HIGH", "LOW" or "OPTIMIZED" 
              .CLKFBOUT_MULT(freq_multiplier), //Multiply value for all CLKOUT clock outputs (1-64)
              .CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
              .CLKIN_PERIOD(20.00),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
              // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
              .CLKOUT0_DIVIDE(freq_divider),
              .CLKOUT1_DIVIDE(freq_divider),
              .CLKOUT2_DIVIDE(1/*freq_divider25mhz*/),
              .CLKOUT3_DIVIDE(1),
              .CLKOUT4_DIVIDE(1),
              .CLKOUT5_DIVIDE(1),
              // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
              .CLKOUT0_DUTY_CYCLE(0.5),
              .CLKOUT1_DUTY_CYCLE(0.5),
              .CLKOUT2_DUTY_CYCLE(0.5),
              .CLKOUT3_DUTY_CYCLE(0.5),
              .CLKOUT4_DUTY_CYCLE(0.5),
              .CLKOUT5_DUTY_CYCLE(0.5),
              // CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
              .CLKOUT0_PHASE(0.0),
              .CLKOUT1_PHASE(0.0), // Capture clock
              .CLKOUT2_PHASE(0.0),      
              .CLKOUT3_PHASE(0.0),
              .CLKOUT4_PHASE(0.0),
              .CLKOUT5_PHASE(0.0),
              
              .CLK_FEEDBACK("CLKFBOUT"),           // Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
              .COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
              .DIVCLK_DIVIDE(1),                   // Division value for all output clocks (1-52)
              .REF_JITTER(0.1),                    // Reference Clock Jitter in UI (0.000-0.999).
              .RESET_ON_LOSS_OF_LOCK(0)        // Must be set to FALSE
              ) PLL1 (
                      .CLKFBOUT(clkfb), // 1-bit output: PLL_BASE feedback output
                      // CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
                      .CLKOUT0(clku),   //  CLKOUT1 => open,
                      .CLKOUT2(/*clku25mhz*/),   //   CLKOUT3 => open,
                      .CLKOUT4(),   //   CLKOUT5 => open,
                      .LOCKED(),  // 1-bit output: PLL_BASE lock status output
                      .CLKFBIN(clkfb), // 1-bit input: Feedback clock input
                      .CLKIN(clkb),  // 1-bit input: Clock input
                      .RST(0)    // 1-bit input: Reset input
                      );

   BUFG BUFG1 (.O(clkb), .I(OSC_FPGA));
   BUFG BUFG3 (.O(clk100mhz), .I(clku));

   reg [1:0]                      clkctr;
   assign clku25mhz = clkctr==2'b0;
   
   always @(posedge clk100mhz)
     clkctr <= clkctr + 1;
   
   
   BUFG BUFG4 (.O(clk25mhz), .I(clku25mhz));
`endif //  `ifdef FPGA
`endif


   // SPI interface
   wire [31:0]                    spi_data_in;
   wire [31:0]                    spi_data_out;
   wire                           spi_data_in_rdy;
   wire                           spi_data_in_ack;
   wire                           spi_data_out_rdy;
   wire                           spi_data_out_ack;
   wire                           spi_data_in_rq;
   

   wire                           cpu_reset_1;
   reg                            mem_bootload;

   assign cpu_reset_1 = /*cpu_force_reset*/ mem_bootload?1'b0:cpu_reset;

   reg                            led0;
   reg                            led1;
`ifdef LOGIPI
   wire                           spi_led;
   assign LED[0] = spi_led;
   assign LED[1] = led1;
`endif
   
`ifdef LOGIPI
   spi_wrapper spi1(.clk(clk100mhz),
                    .reset(cpu_reset),

                    .mosi(SYS_SPI_MOSI),
                    .miso(SYS_SPI_MISO),
                    .sck(SYS_SPI_SCK),
                    .ss(RP_SPI_CE0N),

                    .data_in(spi_data_in),
                    .data_in_rdy(spi_data_in_rdy),
                    .data_in_ack(spi_data_in_ack),
                    .data_in_rq(spi_data_in_rq),

                    .data_out(spi_data_out),
                    .data_out_rdy(spi_data_out_rdy),
                    .data_out_ack(spi_data_out_ack),

                    .spi_led(spi_led)
                    );
`endif //  `ifdef LOGIPI
`ifdef ATLYS
   
   spi_mock spi1   (.clk100mhz(clk100mhz),
                    .reset(cpu_reset),

                    .uart_rxd(uart_rxd),
                    .uart_txd(uart_txd),

                    .data_in(spi_data_in),
                    .data_in_rdy(spi_data_in_rdy),
                    .data_in_ack(spi_data_in_ack),
                    .data_in_rq(spi_data_in_rq),

                    .data_out(spi_data_out),
                    .data_out_rdy(spi_data_out_rdy),
                    .data_out_ack(spi_data_out_ack)
                    );

`endif

   // "UART" over SPI
   // uart_in fifo is filled by the SPI controller and read from mem-mapped
   //   register 0x10001 (empty status: 0x10002)
   // uart_out fifo is filled by writing to mem-mapped register 0x10004,
   //   and emptied by the SPI controller by the master polling request.
   // If no data is available it sends 0xffffffff;
   reg [31:0]                     uart_in_data_in;
   wire [31:0]                    uart_in_data_out;
   reg                            uart_in_data_in_wr;
   reg                            uart_in_data_out_en;
   wire                           uart_in_full;
   wire                           uart_in_empty;
   
   reg [31:0]                     uart_out_data_in;
   wire [31:0]                    uart_out_data_out;
   reg                            uart_out_data_in_wr;
   reg                            uart_out_data_out_en;
   wire                           uart_out_full;
   wire                           uart_out_empty;

   reg [31:0]                     spi_word_send;
   reg                            spi_send_ready;

   assign spi_data_in = spi_word_send/*(spi_send_ready&&!spi_send_done)?spi_word_send:32'hffffffff*/;
   //assign spi_data_in_rdy = (spi_send_ready&&!spi_send_done);
   assign spi_data_in_rq = (spi_send_ready&&!spi_send_done);
   

   reg                            spi_send_done;
   
   always @(posedge clk100mhz)     begin
      if (spi_send_ready && spi_data_in_ack) 
        spi_send_done <= 1; // sent
      else if (!spi_send_ready && spi_send_done) spi_send_done <= 0;
   end
   
   fifo #(.DEBUG(0)) uart_in(.clk(clk100mhz),
                .reset(cpu_reset),

                .data_in(uart_in_data_in),
                .data_in_wr(uart_in_data_in_wr),

                .data_out(uart_in_data_out),
                .data_out_en(uart_in_data_out_en),

                .full(uart_in_full),
                .empty(uart_in_empty)
                );
   

   fifo uart_out(.clk(clk100mhz),
                 .reset(cpu_reset),

                 .data_in(uart_out_data_in),
                 .data_in_wr(uart_out_data_in_wr),
                 
                 .data_out(uart_out_data_out),
                 .data_out_en(uart_out_data_out_en),
                 
                 .full(uart_out_full),
                 .empty(uart_out_empty)
                 );
   

   reg [31:0] membus_data_in;
   reg        membus_data_in_ready;
   wire [31:0] membus_data_out;
   reg         membus_data_wr_ack;
   wire        membus_data_wr;
   wire        membus_data_rd;
   wire [31:0] membus_data_address;

   reg        cpu_irq;
   reg [4:0]  cpu_irqn;
   wire       cpu_irq_ack;
   wire       cpu_irq_busy;

   wire [31:0] debug_reg_out;
   reg [3:0]   debug_reg_num;

   reg         cpu_debug;
   reg         cpu_step;
   wire        cpu_step_ack;

   reg [31:0]  top_last_read;
   reg [31:0]  top_last_addr;
   
   
   // CPU instance
   toycpu cpu1(.clk(clk100mhz),
               .rst(cpu_reset_1),

               .bus_data_in(membus_data_in),
               .bus_data_in_ready(membus_data_in_ready),
               .bus_data_ack(membus_data_wr_ack),

               .bus_data_wr(membus_data_wr),
               .bus_data_rd(membus_data_rd),

               .bus_data_address(membus_data_address),
               .bus_data_out(membus_data_out),

               .irq(cpu_irq),
               .irqn(cpu_irqn),
               .irq_ack(cpu_irq_ack),
               .irq_busy(cpu_irq_busy),

               .debug_reg_out(debug_reg_out),
               .debug_reg_num(debug_reg_num),

               .debug(cpu_debug|mem_acc_irq),
               .step(cpu_step),
               .step_ack(cpu_step_ack),
               .stall(mem_bootload)
               );

   reg                            mem_enable;

   reg [31:0]                     spi_boot_word;
   reg [31:0]                     spi_boot_addr;
   reg [31:0]                     spi_boot_count;
   
   reg                            spi_boot_write;
   reg                            spi_boot_read;
   
   
   wire                           is_mem_req;
   assign is_mem_req = membus_data_address>=32'h20000;
   
   wire [31:0]                    addr;
   assign addr = mem_bootload?spi_boot_addr:
                 (is_mem_req?
                  membus_data_address-32'h20000:0);
   
   // word address to byte-address
   assign cmd_address = {addr[29:0],2'b0};
   assign cmd_enable = mem_bootload?(spi_boot_write|spi_boot_read):
                       (is_mem_req?mem_enable&(membus_data_rd|
                                               membus_data_wr):0);
   assign cmd_wr = mem_bootload?spi_boot_write:
                   (is_mem_req?membus_data_wr:0);
   assign cmd_data_in = mem_bootload?spi_boot_word:
                        (is_mem_req?membus_data_out:0);

   parameter MEM_IDLE = 0;
   parameter MEM_READ = 1;
   parameter MEM_WRITE = 2;
   parameter MEM_WAIT_RD0 = 3;
   parameter MEM_WAIT_WR0 = 4;
   parameter MAP_READ = 5;
   parameter MAP_WRITE = 6;
   parameter MEM_READ_UART_IN = 7;
   parameter MEM_READ0 = 8;
   parameter MEM_READ1 = 9;
   parameter MEM_READ_UART_IN1 = 10;
   

   reg [5:0]                      mem_state;
   reg [4:0]                      mem_ticks;
   

   reg                            cpu_release_reset;


`ifdef LOGIPI
   assign vmem_in_data = membus_data_out[7:0];
   assign vmem_in_addr = membus_data_out[21:8];
`endif
   
   always @(posedge clk100mhz)
     begin
        if (!cpu_reset) begin
           mem_state <= MEM_IDLE;
           mem_enable <= 1'b0;
           cpu_release_reset <= 1'b0;
           membus_data_wr_ack <= 1'b0;
           uart_in_data_out_en <= 1'b0;
           uart_out_data_in <= 0;
           membus_data_in <= 0;
           membus_data_in_ready <= 0;
           top_last_read <= 0;
           top_last_addr <= 0;
           mem_ticks <= 0;
           mem_acc_irq <= 0;

	   FAILED_ADDR <= 0;

`ifdef LOGIPI
	   vmem_we <= 0;
`endif
           
`ifdef SIMULATION
           FINISH <= 0;
`endif
	         
        end else begin
           case (mem_state)
             MEM_IDLE: begin
                if (cpu_force_reset)
                  cpu_release_reset <= 1; // Disable reset state
                else if (!cpu_force_reset)
                  cpu_release_reset <= 0;

                membus_data_in <= 0;

                if (is_mem_req) begin
                   if (membus_data_rd && cmd_ready) begin
`ifdef SDRAMBUG
                      mem_state <= MEM_READ0;
`else
                      mem_state <= MEM_READ;
`endif
                      mem_ticks <= 0;
                      mem_enable <= 1;
                   end else if(membus_data_wr && cmd_ready) begin
                      mem_enable <= 1;
                      mem_state <= MEM_WRITE;
                   end else mem_enable <= 0;
                   
                end else begin
                   mem_enable <= 0;                  
                   if (membus_data_rd) begin
                      case (membus_data_address)
                        32'h10001: begin
                           if (!uart_in_empty) begin
                              uart_in_data_out_en <= 1;
                              mem_state <= MEM_READ_UART_IN;
                           end else mem_state <= MEM_IDLE; // keep trying
                        end
                        32'h10002: begin
                           membus_data_in <= {31'b0,~uart_in_empty};
                           membus_data_in_ready <= 1;
                           mem_state <= MEM_WAIT_RD0;
                        end
                        32'h10005: begin
                           membus_data_in <= {31'b0,~uart_out_full};
                           membus_data_in_ready <= 1;
                           mem_state <= MEM_WAIT_RD0;
                        end
                        default: begin
                           membus_data_in <= 0;
                           membus_data_in_ready <= 1;
                           mem_state <= MEM_WAIT_RD0;
                           mem_acc_irq <= 1;
			   FAILED_ADDR <= membus_data_address;
                        end
                      endcase // case (membus_data_address)
                   end else if(membus_data_wr) begin
                      case (membus_data_address)
                        32'h10004: begin
`ifdef DEBUG
                           $display("WRITING TO UART OUT [%c] %x",
                                    membus_data_out[7:0], uart_out_full);
`endif
                           if (!uart_out_full) begin
                              uart_out_data_in <= membus_data_out;
                              uart_out_data_in_wr <= 1;
                              membus_data_wr_ack <= 1;
                              mem_state <= MEM_WAIT_WR0; // wait for CPU to release the write signal
                           end else mem_state <= MEM_IDLE; // keep trying
                        end // case: 32'h10004
`ifdef LOGIPI
			32'h10010: begin
			   vmem_we <= 1;
                           membus_data_wr_ack <= 1;
			   mem_state <= MEM_WAIT_WR0;
			end
`endif
`ifdef SIMULATION
                        32'h10111: begin
                           FINISH <= 1;
                           membus_data_wr_ack <= 1;
                           mem_state <= MEM_WAIT_WR0;
                        end
`endif
                      endcase
                   end
                end
             end // case: MEM_IDLE
             MEM_READ_UART_IN: begin
                uart_in_data_out_en <= 0;
                mem_state <= MEM_READ_UART_IN1;
             end
             MEM_READ_UART_IN1: begin
                mem_enable <= 0;
                membus_data_in <= uart_in_data_out;
`ifdef DEBUG
                $display("UART IN CONSUMED [%x]", uart_in_data_out);
`endif
                uart_in_data_out_en <= 0;
                membus_data_in_ready <= 1;
                mem_state <= MEM_WAIT_RD0;
             end
             MEM_WRITE: begin
                mem_enable <= 0;
                if (cmd_ready) begin
                   mem_state <= MEM_WAIT_WR0;
                   membus_data_wr_ack <= 1;
                end else mem_state <= MEM_WRITE;
             end
`ifdef SDRAMBUG
             MEM_READ0: begin
                if (data_out_ready && cmd_ready) begin
                   mem_enable <= 0;
                   top_last_addr <= membus_data_address;
                   mem_state <= MEM_READ1;
                end
             end
             MEM_READ1: begin // repeat
                if (cmd_ready) begin
                   mem_enable <= 1;
                   mem_state <= MEM_READ;
                end
             end
`endif
             MEM_READ: begin
                if (data_out_ready && cmd_ready) begin
                   membus_data_in <= data_out;
                   top_last_read <= data_out;
`ifdef SDRAMBUG
                   if (data_out != top_last_read) begin
                      // TODO: log failure in debuggable registers
                      mem_state <= MEM_READ1;
                   end else begin
`endif
                      membus_data_in_ready <= 1;
                      mem_state <= MEM_WAIT_RD0;
`ifdef SDRAMBUG
                   end
`endif
                end else mem_state <= MEM_READ;
             end
             MEM_WAIT_RD0: begin
                mem_enable <= 0;
                if (!membus_data_rd && cmd_ready) begin
                   mem_state <= MEM_IDLE;
                   membus_data_in_ready <= 0;
                end
                else mem_state <= MEM_WAIT_RD0;
             end
             MEM_WAIT_WR0: begin
                mem_enable <= 0;
`ifdef LOGIPI
		vmem_we <= 0; // if writing vmem
`endif
                uart_out_data_in_wr <= 0; // release (TODO: separate always block?)
                if (!membus_data_wr) begin
                   mem_state <= MEM_IDLE;
                   membus_data_wr_ack <= 0;
                end
                else mem_state <= MEM_WAIT_WR0;
             end
           endcase
        end
     end // always @ (posedge clk100mhz)


   //// SPI controller
   //
   //   Master will send command words:
   //      0 - initiate bootload,
   //          Followed by 1 word of length and N words of data
   //          Forces a CPU reset when done filling memory
   //      1 - poll for a word from UART fifo
   //      2 - send a word to UART (followed by a word of data)
   //      3 - reset, force a CPU reset
   //

   wire [31:0] spi_word;
   wire        spi_word_new;
        
        assign spi_word = spi_data_out;
        assign spi_word_new = spi_data_out_rdy && ~spi_data_out_ack;

   parameter SPI_IDLE = 0;
   parameter SPI_BOOTLOAD_START = 1;
   parameter SPI_FIFO_POLL = 2;
   parameter SPI_FIFO_SEND = 3;
   parameter SPI_BOOTLOAD_NEXT = 4;
   parameter SPI_BOOTLOAD_WRITE = 5;
   parameter SPI_FIFO_READ = 6;
   parameter SPI_FIFO_READ0 = 7;
   parameter SPI_FIFO_READ_DUMMY = 8;
   parameter SPI_BOOTLOAD_READ = 9;
   parameter SPI_DEAD = 10;
   parameter SPI_FIFO_SENDREG = 11;
   parameter SPI_FIFO_POLLREG_WAIT = 12;
   parameter SPI_DEBUGSTEP = 13;
   parameter SPI_DEBUGWAIT = 14;
   parameter SPI_GET_MEMADDR = 15;
   parameter SPI_DEBUG_WAITREAD = 16;
   parameter SPI_DEBUG_MEMSEND = 17;
   parameter SPI_FIFO_POLLREG = 18;
   
   parameter SPI_CMD_BOOTLOAD = 16'd99;
   parameter SPI_CMD_POLL = 16'd1;
   parameter SPI_CMD_SEND = 16'd2;
   parameter SPI_CMD_RESET = 16'd3;
   parameter SPI_CMD_POLLREG = 16'd4;
   parameter SPI_CMD_DEBUGSTEP = 16'd5;

   parameter SPI_CMD_DEBUGSTART = 16'd6;
   parameter SPI_CMD_DEBUGSTOP = 16'd7;
   
   parameter SPI_CMD_DEBUGMEM = 16'd8;
   

   reg         spi_word_consumed;
   assign spi_data_out_ack = spi_word_consumed;

   reg [15:0]  spi_cmd_arg;
   
   
   always @(posedge clk100mhz)
     begin
        if (!cpu_reset) begin
           spi_state <= SPI_IDLE;
           spi_word_consumed <= 0;
           mem_bootload <= 1;   // start in a bootload state, suspend CPU
           spi_boot_write <= 0;
           spi_boot_read <= 0;
           
           uart_out_data_out_en <= 0;
           
           uart_in_data_in_wr <= 0;
           spi_boot_addr <= 0;
           spi_boot_count <= 0;
           led1 <= 0;
           led0 <= 0;
           spi_cmd_arg <= 0;

           cpu_debug <= 0;
           cpu_step <= 0;
           debug_reg_num <= 0;
           
           spi_word_send <= 32'h0;
           spi_send_ready <= 0;
        end else begin // if (!cpu_reset)
           if (~spi_data_out_rdy) begin
              spi_word_consumed <= 0;
           end
           case (spi_state)
             SPI_IDLE: begin
                uart_in_data_in_wr <= 0;
                if (spi_send_done && spi_send_ready) begin
                  spi_send_ready <= 0;
                end

                if (cpu_release_reset)
                  cpu_force_reset <= 0;
                
                if (spi_word_new) begin
`ifdef ATLYS
                   LED <= spi_word[7:0];
`endif
                   
                   // The first word contains a command (maybe with an immediate)
                   spi_cmd_arg <= spi_word[31:16];
                   case(spi_word[15:0])
                     SPI_CMD_BOOTLOAD: begin
                        spi_state <= SPI_BOOTLOAD_START;
                        cpu_debug <= spi_word[16]; // turn on debugging on bootload time
                     end
                     SPI_CMD_POLL: spi_state <= SPI_FIFO_POLL;
                     SPI_CMD_SEND: spi_state <= SPI_FIFO_SEND;
                     SPI_CMD_POLLREG: begin
                        debug_reg_num <= spi_word[19:16];
                        spi_state <= SPI_FIFO_POLLREG;
                     end
                     SPI_CMD_DEBUGSTEP: spi_state <= SPI_DEBUGSTEP;
                     SPI_CMD_DEBUGSTART: begin
                        cpu_debug <= 1;
                        spi_state <= SPI_IDLE;
                     end
                     SPI_CMD_DEBUGSTOP: begin
                        cpu_debug <= 0;
                        spi_state <= SPI_IDLE;
                     end
                     SPI_CMD_DEBUGMEM: begin
                        spi_state <= SPI_GET_MEMADDR;
                     end
                     SPI_CMD_RESET: begin
                        spi_state <= SPI_IDLE;
                        cpu_force_reset <= 1;
                     end
                     //default: spi_state <= SPI_IDLE;
                   endcase // case (spi_word[1:0])
                   spi_word_consumed <= 1;
                end
             end // case: SPI_IDLE
             SPI_GET_MEMADDR: begin
                if (spi_word_new) begin
                   spi_word_consumed <= 1;
                   spi_boot_addr <= spi_word;
                   spi_boot_read <= 1;
                   mem_bootload <= 1; // reusing bootload checking mechanics
                   spi_state <= SPI_DEBUG_WAITREAD;
                end
             end
             SPI_DEBUG_WAITREAD: begin
                if (data_out_ready) begin
                   spi_boot_read <= 0;
                   mem_bootload <= 0;
                   spi_word_send <= data_out;
                   spi_send_ready <= 1;
                   spi_state <= SPI_DEBUG_MEMSEND;
                end
             end
             SPI_DEBUG_MEMSEND: begin
                if (spi_word_new) begin
                   spi_word_consumed <= 1;
                   spi_state <= SPI_IDLE;
                end
             end
             SPI_FIFO_POLL: begin // Check if there is a word in an UART fifo
                if (!uart_out_empty) begin
                   uart_out_data_out_en <= 1;
                   spi_state <= SPI_FIFO_READ0;
                   //led1 <= ~led1;
                end else begin
                   spi_state <= SPI_FIFO_READ_DUMMY;
                end
             end
             SPI_FIFO_READ0: begin
                uart_out_data_out_en <= 0;
                spi_state <= SPI_FIFO_READ;                
             end
             SPI_FIFO_READ: begin  // TODO: ?!?
                spi_word_send <= uart_out_data_out;
                spi_send_ready <= 1;
                spi_state <= SPI_IDLE;
             end
             SPI_FIFO_POLLREG: begin
                debug_reg_num <= spi_cmd_arg[3:0];
                spi_state <= SPI_FIFO_SENDREG;
             end
             SPI_FIFO_SENDREG: begin
                spi_word_send <= debug_reg_out;
                spi_send_ready <= 1;
                spi_state <= SPI_FIFO_POLLREG_WAIT;
             end
             SPI_FIFO_POLLREG_WAIT: begin
                if (spi_word_new) begin
                   spi_state <= SPI_IDLE;
                   spi_word_consumed <= 1;
                end
             end
             SPI_DEBUGSTEP: begin
                cpu_step <= 1;
                spi_state <= SPI_DEBUGWAIT;
             end
             SPI_DEBUGWAIT: begin
                if (cpu_step_ack) begin
                   cpu_step <= 0;
                   spi_state <= SPI_IDLE;
                end else if (spi_word_new) begin // waited for too long, CPU stuck
                   spi_state <= SPI_IDLE;
                end
             end
             SPI_FIFO_READ_DUMMY: begin
                spi_word_send <= 32'hffffffff;
                spi_send_ready <= 1;
                spi_state <= SPI_IDLE;
             end
             SPI_FIFO_SEND: begin // Push incoming word into an UART fifo
                if (spi_word_new) begin
                   spi_word_consumed <= 1;
                   if (!uart_in_full) begin
                      uart_in_data_in <= spi_word;
`ifdef DEBUG
                      $display("UART IN [%x]\n", spi_word);
`endif
                      uart_in_data_in_wr <= 1;
                      spi_state <= SPI_IDLE;
                   end else begin
                      spi_state <= SPI_IDLE; // ???
                   end
                end
             end
             SPI_BOOTLOAD_START: begin
                if (spi_word_new) begin
                   // Next word is a number of words of data to be loaded
                   spi_boot_count <= spi_word;
`ifdef DEBUG
                   $display("Starting bootload, reading [%X] words", spi_word);
`endif
                   
                   spi_boot_addr <= 0;
                   mem_bootload <= 1; // Hijack memory bus, suspend CPU
                   led1 <= 1;
                   led0 <= 0;
                   spi_state <= SPI_BOOTLOAD_NEXT;
                   spi_word_consumed <= 1;
                end
             end
             SPI_BOOTLOAD_NEXT: begin
                if (spi_word_new && cmd_ready) begin
                   spi_boot_word <= spi_word;
                   spi_boot_write <= 1;
                   spi_state <= SPI_BOOTLOAD_WRITE; // TODO: fifo?
                   spi_word_consumed <= 1;
                end else if (spi_word_new && !cmd_ready) begin
                   spi_word_send <= {16'hdead,spi_boot_addr[15:0]}; spi_send_ready <= 1;
                   spi_state <= SPI_DEAD;
                   spi_word_consumed <= 1;
                end else if (spi_word_new) begin
                   spi_word_consumed <= 1;
                end
             end
             SPI_DEAD: begin
                led0 <= clk_ctr[10];led1 <= clk_ctr[9];
                spi_state <= SPI_DEAD;
             end
             SPI_BOOTLOAD_WRITE: begin
                spi_boot_write <= 0;
                
                if (cmd_ready) begin // writing done
                   spi_boot_read <= 1;
                   spi_state <= SPI_BOOTLOAD_READ;
                end
             end
             SPI_BOOTLOAD_READ: begin
                // spi_boot_read <= 0;
                
                if (data_out_ready) begin // reading done
                   spi_boot_read <= 0;
                   spi_boot_addr <= spi_boot_addr + 1;
                   spi_boot_count <= spi_boot_count - 1;
                   spi_word_send <= data_out; spi_send_ready <= 1; // Verification
                   if (spi_boot_count>1) 
                     spi_state <= SPI_BOOTLOAD_NEXT;
                   else begin
                      mem_bootload <= 0;
                      cpu_force_reset <= 1;
                      led0 <= 1;
                      led1 <= 1; // indicate that program is in
`ifdef DEBUG
                      $display("Bootload sequence done");
`endif
                      spi_state <= SPI_IDLE;
                   end
                end
             end
           endcase
        end
     end // always @ (posedge clk)


   // Interrupts. TODO: add timers
   always @(posedge clk100mhz) begin
      if (!cpu_reset) begin
         cpu_irq <= 0;
      end else begin
         if (cpu_irq_ack) begin
            cpu_irq <= 0;
         end else
         if (!uart_in_empty && !cpu_irq_busy) begin
            cpu_irq <= 1;
            cpu_irqn <= 0; // UART IRQ
         end else if (mem_acc_irq) begin
            cpu_irq <= 1;
            cpu_irqn <= 6; // mem trap IRQ
         end
      end
   end
   
   
endmodule
