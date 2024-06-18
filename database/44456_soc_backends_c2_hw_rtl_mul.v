// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

module mul32x32_fsm(input clk,
                    input             rst,
                    input             req,
               
                    input [31:0]      p0,
                    input [31:0]      p1,
                    output reg        ack,
                    output reg [31:0] out);

   wire [31:0]               m_o;
   
   reg [15:0]                m_a;
   reg [15:0]                m_b;
   reg [31:0]                acc;
   reg [2:0]                 stage;
   

   wire [15:0]               a = p0[31:16];
   wire [15:0]               b = p0[15:0];
   wire [15:0]               c = p1[31:16];
   wire [15:0]               d = p1[15:0];

   mul16x16 m (.a(m_a),
               .b(m_b),
               .o(m_o));

   wire [31:0]               next_acc;

   assign next_acc = acc + {m_o[15:0], 16'b0};
   always @(posedge clk) begin
      if (req) begin
         stage <= 1;
         m_a <= b; m_b <= d;
         acc <= 0;
         out <= 0;
         ack <= 0;
      end else begin
         case(stage)
           0: begin
              ack <= 0;
           end
           1:  begin
              acc <= m_o;
              m_a <= b; m_b <= c;
              stage <= 2;
           end
           2: begin
              acc <= next_acc;
              m_a <= a; m_b <= d;
              stage <= 3;
           end
           3: begin
              ack <= 1;
              out <= next_acc;
              stage <= 0;
           end
         endcase // case (stage)
      end // else: !if(req)
   end
endmodule // mul32x32_fsm


