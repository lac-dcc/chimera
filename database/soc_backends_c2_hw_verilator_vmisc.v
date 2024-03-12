module uartmm(input clk,
              input            rst,


              input [7:0]      uart_din,
	      input            uart_valid,
	      output reg [7:0] uart_dout,
	      output reg       uart_wr,

              output [31:0]    data_b,
              output           strobe_b,
              input [31:0]     addr_b,
              input [31:0]     data_b_in,
              input [31:0]     data_b_we);
   
   reg [7:0]                uart_din_r;
   reg                      uart_valid_r;
   reg                      uart_ready_r;

   reg                      uart_rd;
 
   wire                     uart_busy;
   wire                     uart_ready;
   
   assign uart_ready = ~uart_busy;
   assign uart_busy = 0;

   assign strobe_b =   (addr_b == 65537) | (addr_b == 65538) | (addr_b == 65539);
   assign data_b = (addr_b == 65537)?uart_valid_r:
                   (addr_b == 65538)?uart_ready_r:
                   (addr_b == 65539)?uart_din_r:0;

   always @(posedge clk)
     if (~rst) begin
        
     end else begin
        if (uart_wr) begin
           uart_wr <= 0;
        end
        
        if (uart_valid & ~uart_rd) begin
           uart_rd <= 1; // TODO: read into a FIFO / raise an IRQ (when we had a support for them)
        end

        uart_ready_r <= uart_ready; // delay

        if (uart_rd) begin
           uart_rd <= 0;
           uart_din_r <= uart_dout;
           uart_valid_r <= 1;
        end else if ((addr_b == 65539) & ~data_b_we & uart_valid_r) begin
           uart_valid_r <= 0;
        end else if ((addr_b == 65539) & data_b_we & uart_ready & ~uart_wr) begin
           uart_dout <= data_b[7:0];
           uart_wr <= 1;
        end
     end
   
   
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
        if (addr_b == 65540) begin
          LED <= data_b_in[7:0];
        end
     end

endmodule // ledwriter


module vgadumper (input clk,
                  input        rst,
                  
                  output reg   vga_dump,
                  
                  input [31:0] addr_b,
                  input [31:0] data_b_in,
                  input [31:0] data_b_we);

   always @(posedge clk)
     if (~rst) begin
        vga_dump <= 0;
     end else begin
        if (vga_dump) begin
           vga_dump <= 0;
        end else if (addr_b == 65599 && data_b_we) begin
           vga_dump <= 1;
        end
     end

endmodule

`ifdef RAM_REGISTERED_OUT
module socram(input clk,
              input             rst,

              output reg [31:0] data_a,
              input [31:0]      addr_a,
              
              output reg [31:0] data_b,
              output reg        strobe_b,
              input [31:0]      addr_b,
              input [31:0]      data_b_in,
              input [31:0]      data_b_we);

   parameter RAM_DEPTH = 2048;
   
   reg [31:0]                   mem [0:RAM_DEPTH-1];

   always @(posedge clk)
     begin
        if (data_b_we & (addr_b[31:16] == 0)) begin
           mem[addr_b] <= data_b_in;
        end
        data_a <= mem[addr_a];
        data_b <= mem[addr_b];
        strobe_b <= (addr_b[31:16] == 0);
     end

endmodule
`else // !`ifdef RAM_REGISTERED_OUT
module socram(input clk,
              input         rst,
              
              output [31:0] data_a,
              input [31:0]  addr_a,
              
              output [31:0] data_b,
              output        strobe_b,
              input [31:0]  addr_b,
              input [31:0]  data_b_in,
              input [31:0]  data_b_we);

   parameter RAM_DEPTH = 16384;
   
   reg [31:0]                   mem [0:RAM_DEPTH-1];
   
   assign data_a = mem[addr_a];
   assign data_b = mem[addr_b];
   assign strobe_b = (addr_b[31:16] == 0);

   always @(posedge clk)
     begin
        if (data_b_we & (addr_b[31:16] == 0)) begin
           mem[addr_b] <= data_b_in;
        end
     end

endmodule
`endif // !`ifdef RAM_REGISTERED_OUT
/*
module generic_mul ( a, b, clk, pdt);
   parameter size = 32, level = 5;
   input [size-1 : 0] a;
   input [size-1 : 0] b;
   input              clk;
   output [2*size-1 : 0] pdt;
   reg [size-1 : 0]      a_int, b_int;
   reg [2*size-1 : 0]    pdt_int [level-1 : 0];
   integer               i;
   
   assign pdt = pdt_int [level-1];
   
   always @ (posedge clk)
     begin
        a_int <= a;
        b_int <= b;
        pdt_int[0] <= a_int * b_int;
        for(i =1;i <level;i =i +1)
          pdt_int [i] <= pdt_int [i-1];
     end
endmodule

module hls_Mul(input clk,
               input reset,

               input [31:0]  p0,
               input [31:0]  p1,
               output [31:0] out);

   reg [31:0]                p0t;
   reg [31:0]                p1t;
   reg [31:0]                tmp1;
   reg [31:0]                tmp2;
   reg [31:0]                tmp3;
   reg [31:0]                tmp4;
   assign out = tmp4;

   generic_mul #(.size(32),.level(3)) mul1 (.clk(clk),
                                            .a(p0),
                                            .b(p1),
                                            .pdt(out));
endmodule
*/

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
   reg [31:0]                t3;
   assign out = t3;
   

   always @(posedge clk)
     begin
        p0r <= p0; p1r <= p1;
        t1 <= bd + {bc[15:0], 16'b0}; adr <= ad[15:0];
        t2 <= t1 + {adr[15:0], 16'b0};
        t3 <= t2;
        
     end
   
   
endmodule // hls_Mul


`include "../rtl/div2.v"

// 8-stage integher division pipeline
module hls_Div(input clk,
               input         reset,

               input [31:0]  p0,
               input [31:0]  p1,

               output [31:0] out);

   wire                      div0, ovf;
   wire [31:0]               rem;
   
   div_pipelined2 #(.WIDTH(32)) d(.clk(clk),
                                  .rst(reset),
                                  .z(p0),
                                  .d(p1),
                                  .quot(out),
                                  .rem(rem));
endmodule


// 8-stage integher division pipeline
module hls_Rem(input clk,
               input         reset,

               input [31:0]  p0,
               input [31:0]  p1,

               output [31:0] out);

   wire [31:0]               quot;
   
   div_pipelined2 #(.WIDTH(32)) d(.clk(clk),
                                  .rst(reset),
                                  .z(p0),
                                  .d(p1),
                                  .quot(quot),
                                  .rem(out));

endmodule



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

