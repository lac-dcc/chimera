`include "defs.v"

// Bundling CPU and ICache together
module toycpu(
              input         clk, // clock
              input         rst, // reset

              // Memory bus
              input [31:0]  bus_data_in, // bus data in
              input         bus_data_in_ready, // bus data ready
              input         bus_data_ack, // acknowledge write op

              output        bus_data_wr, // request data write
              output        bus_data_rd, // request data read 
              output [31:0] bus_data_address, // output data address
              output [31:0] bus_data_out, // data to be written

              // CPU signals
              input         irq, // IRQ requested
              input [3:0]   irqn, // IRQ number
              output        irq_ack, // Interrupt acknowledged and processed
              output        irq_busy, // Busy doing current interrupt (maintain your fifo outside!)

              output [31:0] debug_reg_out,
              input [3:0]   debug_reg_num,

              
              input         debug,
              input         step,
              output        step_ack,
              input         stall
              );

   wire [31:0]              ic_addr;
   wire [31:0]              ic_data_out;
   wire [31:0]              ic_bus_data_address;
   wire [31:0]              ic_data_in;
   
   

   wire [31:0]              data_in;
   wire [31:0]              data_out;
   wire [31:0]              data_address;
   
 
   wire                     ic_rq;
   wire                     ic_data_out_valid;
   
   wire                     data_ack;
   wire                     data_wr;
   wire                     data_rd;

   wire                     data_in_ready;

   wire                     ic_data_in_ready;
   wire                     ic_data_rd;
 

   wire [31:0]              stack_real_addr_a;
   wire [31:0]              stack_real_addr_b;
   wire                     stack_wr_a;
   wire [31:0]              stack_datain_a;
   wire [31:0]              stack_data_a;
   wire [31:0]              stack_data_b;
   

 
   toycpu_core core1(.clk(clk),
                     .rst(rst),
                      
                     .ic_addr(ic_addr),
                     .ic_rq(ic_rq),
                     .ic_data_out(ic_data_out),
                     .ic_data_out_valid(ic_data_out_valid),
                     
                     .data_in(data_in),
                     .data_in_ready(data_in_ready),
                     .data_ack(data_ack),

                     .data_wr(data_wr),
                     .data_rd(data_rd),
                     .data_address(data_address),
                     .data_out(data_out),

                     .irq(irq),
                     .irqn(irqn),
                     .irq_ack(irq_ack),
                     .irq_busy(irq_busy),

                     .debug_reg_out(debug_reg_out),
                     .debug_reg_num(debug_reg_num),

                     .debug(debug),
                     .step(step),
                     .step_ack(step_ack),
                     .stall(stall),
  
                     .stack_real_addr_a(stack_real_addr_a),
                     .stack_real_addr_b(stack_real_addr_b),
                     .stack_data_a(stack_data_a),
                     .stack_data_b(stack_data_b), 
                     .stack_wr_a(stack_wr_a),
                     .stack_datain_a(stack_datain_a)
                     );

   toyblockram stack ( .clk(clk),
                       
                       .addr_a(stack_real_addr_a),
                       .data_a(stack_data_a),
                       .datain_a(stack_datain_a),
                       .wr_a(stack_wr_a),

                       .addr_b(stack_real_addr_b),
                       .data_b(stack_data_b)
                       );

   
   toy_icache cache1 (.clk(clk),
                      .reset(rst),
                      .ic_addr(ic_addr),
                      .ic_rq(ic_rq),
                      .ic_data_out_valid(ic_data_out_valid),
                      .ic_data_out(ic_data_out),

                      .data_in(ic_data_in),
                      .data_in_ready(ic_data_in_ready),
                      .data_rd(ic_data_rd),
                      .data_address(ic_bus_data_address));

   wire                     grant_ic;
   wire                     grant_lsu;
   reg                      ic_rq_cnt;
   reg                      lsu_rq_cnt;

   wire                     gnt2;
   wire                     gnt3;
   
   
   arbiter arb1 (.clk(clk),
                 .rst(!rst),
                 .req0(ic_rq_cnt),
                 .req1(lsu_rq_cnt),
                 .req2(0),
                 .req3(0),

                 .gnt0(grant_ic),
                 .gnt1(grant_lsu),
                 .gnt2(gnt2),
                 .gnt3(gnt3)
                 );


   always @(posedge clk)
     if(!rst) begin
        ic_rq_cnt <= 0;
        lsu_rq_cnt <= 0;
     end else begin
        if (ic_data_rd) ic_rq_cnt <= 1;
        else if (grant_ic && !bus_data_in_ready) ic_rq_cnt <= 0;
        
        if (data_rd|data_wr) lsu_rq_cnt <= 1; 
        else if (grant_lsu && !bus_data_in_ready && !bus_data_ack)
          lsu_rq_cnt <= 0;
     end


   assign ic_data_in_ready = grant_ic?bus_data_in_ready:0;
   assign data_in_ready = grant_lsu?bus_data_in_ready:0;
   assign ic_data_in = grant_ic?bus_data_in:0;
   assign data_in = grant_lsu?bus_data_in:0;

   // Memory bus combinational logic
   assign bus_data_address = grant_ic?ic_bus_data_address:data_address;
   assign bus_data_wr = grant_lsu?data_wr:0;
   assign bus_data_rd = grant_ic?ic_data_rd:grant_lsu?data_rd:0;
   assign bus_data_out = grant_lsu?data_out:0;
   assign data_ack = grant_lsu?bus_data_ack:0;

endmodule // toycpu


