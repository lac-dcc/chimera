module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire38;
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire5,
                 wire6,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire20,
                 wire38,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire5 = wire4[(4'hb):(4'h9)];
  assign wire6 = $signed(wire3);
  always
    @(posedge clk) begin
      reg7 <= (wire3 | wire0[(3'h4):(1'h0)]);
      reg8 <= (wire2 ?
          (wire5[(4'hb):(3'h5)] >>> reg7[(3'h6):(3'h6)]) : $signed(wire4));
      reg9 <= (wire2 ?
          reg7[(2'h2):(1'h0)] : $signed($unsigned(wire3[(3'h6):(2'h3)])));
      reg10 <= {(^($unsigned($unsigned(reg9)) ?
              (wire5[(4'he):(4'h9)] <<< reg8[(3'h4):(1'h1)]) : (((8'ha3) ?
                      reg8 : wire0) ?
                  reg8 : reg7[(3'h5):(2'h3)]))),
          wire6};
      reg11 <= wire6;
    end
  assign wire12 = (((~&(~((8'h9c) ? wire2 : wire5))) <<< (8'had)) ?
                      $signed(reg10[(4'ha):(2'h2)]) : (((&(reg8 ?
                              wire4 : (7'h42))) ^ {$signed(wire3),
                              wire0[(1'h1):(1'h1)]}) ?
                          {$signed((reg11 + wire6))} : wire3));
  assign wire13 = (8'ha4);
  assign wire14 = ((|$unsigned(reg7)) ^ (8'hb6));
  assign wire15 = {(8'hb9), wire5[(4'hc):(3'h4)]};
  assign wire16 = $signed(((((8'hb8) ? $signed((8'ha8)) : (~&wire2)) ?
                          (8'hb2) : (wire15[(3'h5):(2'h2)] ?
                              (wire12 || wire12) : reg7)) ?
                      $unsigned(wire0[(1'h1):(1'h0)]) : $unsigned(wire5)));
  always
    @(posedge clk) begin
      reg17 <= (reg10 >>> {(~wire1[(3'h5):(3'h4)]),
          ((|$unsigned((8'hbe))) >= $signed((reg8 ? reg10 : (8'hb6))))});
      reg18 <= wire2[(4'h8):(1'h0)];
      reg19 <= $signed(((~{{reg7, reg7},
          wire0[(2'h2):(1'h0)]}) ^~ reg17[(4'h9):(1'h0)]));
    end
  assign wire20 = wire2[(5'h11):(2'h2)];
  module21 #() modinst39 (wire38, clk, reg10, reg19, reg9, wire1);
  assign wire40 = $unsigned(wire4[(4'hf):(4'h9)]);
  assign wire41 = (!wire6[(1'h0):(1'h0)]);
  assign wire42 = ((wire2 ?
                      $unsigned($unsigned(((8'hb0) ?
                          wire3 : (8'hae)))) : ((-wire41) >= $unsigned(reg10[(4'hc):(2'h2)]))) * $signed(($signed((reg17 ?
                          (8'hb7) : wire0)) ?
                      wire40 : reg17)));
endmodule

module module21
#(parameter param36 = {(8'ha8)}, 
parameter param37 = (|param36))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire26;
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire26,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire26 = wire23[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg27 <= $unsigned((wire24 << $unsigned($unsigned({wire26}))));
      reg28 <= {($unsigned(wire23[(3'h4):(2'h3)]) ? (^~wire23) : wire23)};
      reg29 <= (({$unsigned($signed(reg28)),
              ((|reg27) ?
                  $unsigned(reg27) : (reg28 ? wire26 : wire23))} << wire25) ?
          (^({$unsigned((8'hab)), $unsigned(reg28)} ?
              {(~wire22),
                  wire23} : (+wire23[(4'h9):(4'h9)]))) : $signed(($unsigned(((8'ha2) && wire25)) ?
              wire23 : wire24[(3'h7):(3'h7)])));
      reg30 <= ($unsigned(wire23) ?
          wire23 : ($unsigned((~&reg29[(2'h2):(2'h2)])) ^ (~((reg29 || reg27) ?
              $unsigned(reg29) : $signed(wire23)))));
      reg31 <= $unsigned((wire25[(1'h1):(1'h1)] ?
          wire22[(4'h9):(3'h7)] : wire26[(3'h5):(3'h5)]));
    end
  assign wire32 = ($unsigned(wire22[(3'h5):(2'h2)]) != (((&wire23) <<< (~^((8'h9f) & wire24))) ?
                      (^~$unsigned((reg31 - wire25))) : ((-(~wire23)) - $unsigned({reg30}))));
  assign wire33 = (wire22 ?
                      ((wire23[(2'h2):(1'h0)] ?
                              {{wire32, wire22},
                                  (reg28 ?
                                      (8'ha9) : (7'h40))} : (^$signed(wire24))) ?
                          (7'h41) : {reg29}) : wire32);
  assign wire34 = $signed($signed($unsigned($signed({reg27, (8'ha1)}))));
  assign wire35 = reg31[(2'h3):(2'h3)];
endmodule
