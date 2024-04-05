`include "delay.v"
`include "arbiter.v"

module uartmm(input clk,
              input         rst,

              input         RX,
              output        TX,
              
              output [31:0] data_b,
              output reg    strobe_b,
              input [31:0]  addr_b,
              input [31:0]  data_b_in,
              input [31:0]  data_b_we);

   wire                 uart_RXD;
   inpin _rcxd(.clk(clk), .pin(RX), .rd(uart_RXD));


   reg                  qin_we, qin_re, qout_we, qout_re;
   wire                 qout_oready, qin_oready;
   
   wire [7:0]           qin_idata;
   reg [7:0]            qout_idata;
   wire [7:0]           qin_wdata;
   wire [7:0]           qout_wdata;
   wire                 uart_valid, uart_busy;

   // Insert the byte incoming from mm port 65539 into the uart output queue, if
   //  queue is not full.
   always @(posedge clk)
     if (!rst) begin
        qout_we <= 0;
        qout_idata <= 0;
     end else
     if (qout_we) begin
        qout_we <= 0;
     end else if ((addr_b == 65539) & data_b_we &
                  !qin_full) begin
        qout_idata <= data_b[7:0];
        qout_we <= 1;
     end

   // If uart is ready to transmit and the output queue is not empty, send one byte
   always @(posedge clk)
     if (!rst) qout_re <= 0;
     else if (qout_re) begin
        qout_re <= 0;
     end
     else if (qout_oready & !uart_busy) begin
        qout_re <= 1;
     end

   // If uart has a valid output, push it into the input queue
   always @(posedge clk)
     if (!rst) begin
        qin_we <= 0;
     end else if (qin_we) begin
        qin_we <= 0;
     end else if (uart_valid & !qin_full) begin
        qin_we <= 1;
     end

   reg cmd;
   wire addr_b_cmd =
        (addr_b == 65539);

   reg  out_tmp;
   assign data_b = cmd?{24'b0,qin_wdata}:{30'b0,out_tmp};
   
   // Manage the output
   always @(posedge clk)
     if (!rst) begin
        cmd <= 0;
        qin_re <= 0;
        out_tmp <= 0;
        strobe_b <= 0;
     end else begin
        cmd <= addr_b_cmd;
        if (qin_re) qin_re <= 0;
        else  if ((addr_b == 65539) & qin_oready) begin // UART DATA IN
           qin_re <= 1;
           strobe_b <= 1;
        end else if (addr_b == 65537) begin // UART IN READY
           out_tmp <= qin_oready;
           strobe_b <= 1;
        end else if (addr_b == 65538) begin // UART OUT READY
           out_tmp <= !qout_full;
           strobe_b <= 1;
        end else strobe_b <= 0;
     end

   // Modules
   delayqueue _qin (.clk(clk),
                    .rst(rst),

                    .we(qin_we),
                    .idata(qin_idata),

                    .re(qin_re),
                    .wdata(qin_wdata),
                    .oready(qin_oready),
                    .full(qin_full));

   delayqueue _qout (.clk(clk),
                    .rst(rst),

                    .we(qout_we),
                    .idata(qout_idata),

                    .re(qout_re),
                    .wdata(qout_wdata),
                    .oready(qout_oready),
                    .full(qout_full));
   
   buart _uart (
                .clk(clk),
                .resetq(rst),
                .rx(uart_RXD),
                .tx(TX),
                .rd(qin_we),
                .wr(qout_re),
                .valid(uart_valid),
                .busy(uart_busy),
                .tx_data(qout_wdata),
                .rx_data(qin_idata));

endmodule
 
module ledwriter (input clk,
                  input rst,

                  output reg [7:0] LED,
                  
                  input [31:0]     addr_b,
                  input [31:0]     data_b_in,
                  input [31:0]     data_b_we);

   always @(posedge clk)
     if (~rst) begin
        LED <= 0;
     end else begin
        if (addr_b == 65540)
          LED <= data_b_in[7:0];
     end

endmodule


// TODO:
// implement a 2-port RAM by using a double clock frequency + a single port
`define STR(a) `"a`"
`ifndef C2_RAM_DEPTH
 `define C2_RAM_DEPTH 1024
`endif

module socram(input clk,
              input             rst,

              output reg [31:0] data_a,
              input [31:0]      addr_a,
              
              output reg [31:0] data_b,
              output reg        strobe_b,
              input [31:0]      addr_b,
              input [31:0]      data_b_in,
              input [31:0]      data_b_we);

   parameter RAM_DEPTH = `C2_RAM_DEPTH;
   parameter INIT_FILE = `STR(`INIT_FILE_PATH);
   
   reg [31:0]                   mem [0:RAM_DEPTH-1];
   
   initial begin
      if (INIT_FILE != "")
         $readmemh(INIT_FILE, mem);
   end
   
   always @(posedge clk)
     begin
        if (data_b_we & (addr_b[31:16] == 0)) begin
           mem[addr_b] <= data_b_in;
        end
        data_a <= mem[addr_a];
        data_b <= mem[addr_b];
        strobe_b <= (addr_b[31:16] == 0);
     end
   
endmodule // socram


module mul16x16 (input [15:0]      a,
                 input [15:0]      b,
                 output [31:0] o);

   assign o = a * b;
   
endmodule // mul16x16


module hls_Mul(input clk,
               input reset,

               input [31:0]  p0,
               input [31:0]  p1,
               output [31:0] out);

   wire [15:0]               a = p0r[31:16];
   wire [15:0]               b = p0r[15:0];
   wire [15:0]               c = p1r[31:16];
   wire [15:0]               d = p1r[15:0];

   wire [15:0]               ad = a * d;
   wire [15:0]               bc = b * c;
   wire [31:0]               bd = b * d;

   reg [15:0]                adr;
   
   reg [31:0]                p0r;
   reg [31:0]                p1r;
   reg [31:0]                t1;
   reg [31:0]                t2;
   assign out = t2;
   

   always @(posedge clk)
     begin
        p0r <= p0; p1r <= p1;
        t1 <= bd + {bc[15:0], 16'b0}; adr <= ad[15:0];
        t2 <= t1 + {adr[15:0], 16'b0};
     end
   
   
endmodule // hls_Mul



`include "../rtl/mul.v"


module hls_MulFSM(input clk,
                  input         reset,
                  input         req,
                  output        ack,
                  
                  input [31:0]  p0,
                  input [31:0]  p1,
                  output [31:0] out);

    mul32x32_fsm S(.clk(clk),
                   .rst(reset),
                   .req(req),
                   .ack(ack),
                   .p0(p0),
                   .p1(p1),
                   .out(out));

endmodule // hls_MulFSM

`include "vgafifo.v"
`include "vga640x480ice.v"
`ifdef ENABLE_SOUND
 `include "soundctl.v"
`endif

