
// Trying to simulate how an automatic naive (non-pipelined) translation
//     of _IDIVMOD could work.
module idivmodhw(input clk,
                 input         reset,

                 input         rq,
                 
                 input [31:0]  dividend,
                 input [31:0]  divisor,

                 output [31:0] div_out,
                 output [31:0] div_mod,
                 output        ack);
   
   reg [31:0]                  div_mod;
   reg [31:0]                  div_out;
   reg                         ack;


   reg signed [31:0]           ndividend;
   reg signed [31:0]           ndivisor;
   reg signed [31:0]           nq;
   
   reg signed [31:0]           nbit;
   reg signed [15:0]           np;

   reg [3:0]                   state;
   
   parameter S_IDLE = 0;
   parameter S_LOOP0 = 1;
   parameter S_POSTLOOP0 = 2;
   parameter S_LOOP1 = 3;
   parameter S_POSTLOOP1 = 4;
   
   always @(posedge clk)
     if(!reset) begin
        ack <= 0;
        div_out <= 0;
        div_mod <= 0;
        ndividend <= 0;
        ndivisor <= 0;
        nbit <= 0;
        state <= S_IDLE;
        nq <= 0;
        np <= 0;
     end else begin // if (!reset)
        case(state)
          S_IDLE: if (rq) begin
             nq <= 0;
             np <= 32'hffffffff;
             ndividend <= dividend;
             ndivisor <= divisor;
             nbit <= 1;
             state <= S_LOOP0;
             ack <= 0;
          end
          S_LOOP0: if (ndivisor < ndividend) begin
             ndivisor <= ndivisor << 1;
             np <= np + 1;
             nbit <= nbit << 1;
          end else state <= S_POSTLOOP0;
          S_POSTLOOP0: begin
             nbit <= nbit >> 1;
             ndivisor <= ndivisor >> 1;
             state <= S_LOOP1;
          end
          S_LOOP1: if (np >= 0) begin
             if (ndividend >= ndivisor) begin
                nq <= nq + nbit;
                ndividend <= ndividend - ndivisor;
             end
             ndivisor <= ndivisor >> 1;
             np <= np - 1;
             nbit <= nbit >> 1;
          end else state <= S_POSTLOOP1;
          S_POSTLOOP1: begin
             if (dividend == divisor) begin
                div_out <= nq + 1;
                div_mod <= 0;
             end else begin
                div_out <= nq;
                div_mod <= ndividend;
             end
             ack <= 1;
             state <= S_IDLE;
          end
        endcase
     end

   

endmodule
