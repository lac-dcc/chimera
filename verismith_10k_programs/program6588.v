module top
#(parameter param14 = {{(~|((!(8'hac)) ^ (~|(8'hb7))))}, (((((8'hb1) ? (7'h42) : (7'h40)) ? (8'h9c) : ((8'haf) ? (8'hbc) : (8'hb3))) <= {((8'haf) < (8'hac)), ((8'ha1) ? (8'h9f) : (8'hbb))}) ? ((!((8'ha7) ? (7'h40) : (8'hbf))) ? (8'ha2) : (((8'hbf) ? (8'hbe) : (7'h41)) ^ ((8'hb3) * (8'hac)))) : ((((8'hb9) <= (8'hac)) ^ (8'hb0)) ~^ (((8'hb9) & (8'hb2)) ? (~(7'h42)) : (^~(7'h43)))))}, 
parameter param15 = (((8'hbb) ? param14 : (((8'hab) ? (8'hb1) : (!(8'hac))) * (|(param14 ? param14 : param14)))) ? param14 : (~&((param14 ? param14 : (~|(7'h41))) >> (^(-param14))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $unsigned(((-wire3) ?
                     (~$unsigned({wire0, wire3})) : $unsigned(wire2)));
  assign wire5 = {$signed($signed((wire2 ? wire2 : wire2[(3'h7):(1'h1)])))};
  assign wire6 = wire5[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg7 <= {(($signed($signed(wire1)) ?
                  $unsigned(wire0) : wire5[(3'h6):(3'h4)]) ?
              wire0 : $unsigned(wire6[(4'ha):(4'ha)])),
          $unsigned(wire3)};
      reg8 <= wire5;
    end
  assign wire9 = (~^wire5);
  assign wire10 = reg7;
  assign wire11 = $unsigned($unsigned(({(&reg7), (8'haa)} ?
                      wire10 : $unsigned((wire5 <= reg8)))));
  assign wire12 = wire2;
  assign wire13 = wire10[(4'h8):(3'h7)];
endmodule
