// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

/*
 
 Default memory map:
 
 0 - INITIAL PC
 
 0 - 65535 : SRAM  (an actual RAM may be lower)
 65536 - 131071 : DEVICES (UART, debug, comm channels, DRAM, user-defined, etc.)
     65536: debug print (Verilator only)
 
     65537: UART IN READY (READ)
     65538: UART OUT READY (READ)
     65539: UART IN (READ) / UART OUT (WRITE)
 
     65540: LEDs (WRITE)
     65541: HALT (WRITE)
     65542: CLOCK COUNTER (READ)
 
     65553: 7-segment display (WRITE)
 
 */
`include "defines.v"


module c2soc(input sys_clk_in,
             

             /*****************************/
             `include "socsignals.v"
             /*****************************/

             `ifdef SIMULATION
             output FINISH,
             `endif
             
             input  sys_reset);

   wire             clk;
   wire             rst;
   // socmodule.v must define how clk is derived from sys_clk_in
   //   and how rst depends on sys_reset;

   wire [31:0]     ram_data_in_a;
   wire [31:0]     ram_addr_in_a;
   wire [31:0]     ram_data_in_b;
   wire [31:0]     ram_addr_in_b;
   wire [31:0]     ram_data_out_b;
   wire            ram_we_out;

 `include "socmodules.v"

   cpu cpu1(.clk(clk),
            .rst(rst),

            .ram_data_in_a(ram_data_in_a),
            .ram_addr_in_a(ram_addr_in_a),

            .ram_data_in_b(ram_data_in_b),
            .ram_addr_in_b(ram_addr_in_b),

            .ram_data_out_b(ram_data_out_b),
            .ram_we_out(ram_we_out),
            /****************************/
            `include "soccpusignalsin.v"
            /****************************/
            .stall_cpu(0)
            );

   // Memory-mapped devices:
   //   Each device is responsible for checking if the address is within its range,
   //   and asserting the strobe if it owns the output / consumed the input
   //
   //   A single WE signal is passed to all devices, they must only process it if the address is
   //   within their own range.
   //
   //   Note that port A is connected directly - we do not want to fetch instructions from anything but RAM

   wire [31:0]     data_bus_in_ram;
   wire            data_bus_strobe_ram;
   
   socram ram1(.clk(clk),
               .rst(rst),

               .data_a(ram_data_in_a),
               .addr_a(ram_addr_in_a),

               .data_b(data_bus_in_ram),
               .addr_b(ram_addr_in_b),
               .strobe_b(data_bus_strobe_ram),
               .data_b_in(ram_data_out_b),
               .data_b_we(ram_we_out)
               );
   
`ifdef SIMULATION
   debugprinter dbg1 (.clk(clk),
                      .addr_b(ram_addr_in_b),
                      .data_b_in(ram_data_out_b),
                      .data_b_we(ram_we_out));

   halt halt11 (.clk(clk),
                .rst(rst),
                .addr_b(ram_addr_in_b),
                .data_b_in(ram_data_out_b),
                .data_b_we(ram_we_out),
                .FINISH(FINISH));

   wire [31:0]     data_bus_in_cntr;
   wire            data_bus_strobe_cntr;
`endif
   
   clockcounter cnt1
     (.clk(clk),
      .rst(rst),
      
      .data_a(ram_data_in_a),
      .addr_a(ram_addr_in_a),
      
      .data_b(data_bus_in_cntr),
      .addr_b(ram_addr_in_b),
      .strobe_b(data_bus_strobe_cntr),
      .data_b_in(ram_data_out_b),
      .data_b_we(ram_we_out)
      );
   
   

   // ... and so on - ROMs, VGA, ethernet, whatever - including the hoisted user-defined modules

   assign ram_data_in_b =
                         data_bus_strobe_ram?data_bus_in_ram:
                         data_bus_strobe_cntr?data_bus_in_cntr:
                         
                         `include "socdata.v"
                         0;
   
endmodule


`ifdef SIMULATION
module debugprinter (input clk,
                     input [31:0] addr_b,
                     input [31:0] data_b_in,
                     input [31:0] data_b_we);

   always @(posedge clk)
     begin
        if (addr_b == 65536)
          $write("%c", data_b_in[7:0]);
     end

endmodule // debugprinter

module halt (input clk,
             input rst,
             input [31:0] addr_b,
             input [31:0] data_b_in,
             input [31:0] data_b_we,
             output reg   FINISH);

   always @(posedge clk)
     if(~rst) FINISH <= 0;
     else
        begin
           if (addr_b == 65541)
             FINISH <= 1;
        end
        
endmodule // halt
`endif


 `ifdef RAM_REGISTERED_OUT
module clockcounter(input clk,
                    input            rst,
              
                    input [31:0]    data_a,
                    input [31:0]     addr_a,
              
                    output reg [31:0] data_b,
                    output reg       strobe_b,
                    input [31:0]     addr_b,
                    input [31:0]     data_b_in,
                    input [31:0]     data_b_we);
   
   reg [31:0]                        counter;

   always @(posedge clk)
     if (~rst) begin
        counter <= 0;
        strobe_b <= 0;
        data_b <= 0;
     end else begin
        counter <= counter + 1;
        if (data_b_we & (addr_b == 65542))
          $display(">> Clock cycles: %d", counter);

        if (addr_b == 65542) begin
           strobe_b <= 1;
           data_b <= counter;
        end else strobe_b <= 0;
     end
endmodule // clockcounter
 `else
module clockcounter(input clk,
                    input         rst,
              
                    output [31:0] data_a,
                    input [31:0]  addr_a,
              
                    output [31:0] data_b,
                    output        strobe_b,
                    input [31:0]  addr_b,
                    input [31:0]  data_b_in,
                    input [31:0]  data_b_we);
   
   reg [31:0]                        counter;

   assign strobe_b =   (addr_b == 65542);
   assign data_b = counter;
   

   always @(posedge clk)
     if (~rst) begin
        counter <= 0;
     end else begin
        counter <= counter + 1;
        if (data_b_we & (addr_b == 65542))
          $display(">> Clock cycles: %d", counter);
     end
endmodule // clockcounter
 `endif


