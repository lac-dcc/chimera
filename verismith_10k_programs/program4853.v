module top
#(parameter param10 = {(^((((8'hbf) >>> (8'hbe)) ? (~|(8'hae)) : {(8'haf)}) ? (((8'hb1) ~^ (8'hb8)) <= (+(8'ha1))) : (((8'hb7) ? (8'hb1) : (8'ha5)) ? ((8'ha3) & (7'h44)) : (-(7'h42))))), {(((~|(8'haf)) ? ((8'hb9) ^~ (8'ha1)) : (^(8'h9c))) + (((8'hb5) ? (8'ha7) : (8'hbd)) | (~(8'hb1))))}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire5, reg7, reg6, (1'h0)};
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned({wire4}));
      reg7 <= $unsigned((wire1 ?
          (~&wire5[(4'h8):(1'h0)]) : ({$unsigned(wire0), wire4} ?
              $signed(reg6[(3'h7):(3'h6)]) : wire3)));
    end
  assign wire8 = wire2;
  assign wire9 = $signed(($signed(wire8[(4'h9):(4'h9)]) ?
                     $unsigned(((wire8 != wire5) == wire2)) : ((&(|wire8)) && (&wire0))));
endmodule
