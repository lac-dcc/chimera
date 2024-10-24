module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire56;
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire5,
                 wire6,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire56,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = wire3[(3'h4):(2'h3)];
  assign wire6 = (8'hbe);
  always
    @(posedge clk) begin
      reg7 <= (wire0[(1'h0):(1'h0)] ?
          ($unsigned($signed($signed(wire5))) ?
              (8'hbc) : ($signed($unsigned(wire6)) + $signed((~wire4)))) : $signed(wire6));
      if (($signed($unsigned($unsigned((reg7 ?
          wire3 : reg7)))) * $signed(wire3[(2'h2):(1'h0)])))
        begin
          reg8 <= $signed($unsigned((|(wire2[(4'he):(3'h7)] * {wire5,
              wire0}))));
        end
      else
        begin
          if ((-reg7[(4'h8):(2'h2)]))
            begin
              reg8 <= $unsigned((wire5 ?
                  (8'hb7) : (wire0 ?
                      wire4[(3'h5):(3'h4)] : ($unsigned((8'hb9)) >= $signed(wire1)))));
              reg9 <= wire1;
            end
          else
            begin
              reg8 <= wire5;
              reg9 <= wire5[(3'h7):(2'h3)];
              reg10 <= ((wire6[(3'h6):(2'h2)] ?
                      {wire2[(4'hd):(3'h7)]} : $unsigned($signed(wire5[(1'h1):(1'h1)]))) ?
                  $signed((~|{{reg8, (8'hbd)},
                      $signed((8'hbd))})) : (reg8 == wire6[(4'hd):(4'ha)]));
              reg11 <= $signed({(reg10[(3'h4):(3'h4)] ?
                      ((^~(8'h9f)) ?
                          (!wire6) : reg9[(4'hd):(2'h2)]) : reg10[(3'h5):(2'h3)]),
                  ((^(reg7 ? (8'ha1) : wire4)) ? (&$unsigned(wire3)) : wire3)});
            end
          if ((~$signed($unsigned($unsigned({(8'hb8), reg7})))))
            begin
              reg12 <= $signed($unsigned((reg8[(3'h5):(1'h1)] ?
                  reg7[(2'h2):(1'h0)] : ($signed(reg10) >= (^~wire0)))));
              reg13 <= reg8;
              reg14 <= $unsigned($signed(wire1[(3'h6):(3'h5)]));
              reg15 <= (&((~&wire3) ^ (wire5[(3'h7):(3'h5)] ?
                  ((reg13 ? reg8 : reg7) ? reg7 : reg8) : reg10)));
            end
          else
            begin
              reg12 <= wire4;
              reg13 <= (wire4 ?
                  {(($signed(reg15) ?
                              (wire2 ~^ wire6) : (wire6 ? wire4 : reg8)) ?
                          $signed($unsigned(reg10)) : reg8[(2'h2):(1'h0)]),
                      reg9[(3'h7):(2'h3)]} : $unsigned(($signed(reg9[(1'h0):(1'h0)]) ?
                      ($unsigned(reg12) ~^ $signed((8'had))) : ((wire4 <<< reg12) - (reg10 <= reg15)))));
              reg14 <= (&reg15);
            end
          reg16 <= (wire0[(2'h3):(1'h1)] >= wire0[(4'ha):(3'h5)]);
          reg17 <= ((wire3[(3'h6):(3'h6)] ?
                  $signed(reg13) : $signed((+{reg7}))) ?
              $unsigned($signed(reg11)) : (8'hab));
        end
    end
  assign wire18 = $unsigned(({{$signed(wire2),
                          (wire5 ? reg14 : reg8)}} < $signed((~{reg12}))));
  assign wire19 = {((wire5 <<< $signed((reg13 >= wire2))) == (|$unsigned({wire3}))),
                      reg13[(1'h1):(1'h1)]};
  assign wire20 = $signed($signed($unsigned($unsigned({wire1}))));
  assign wire21 = ($unsigned(({{(7'h44)}} && reg15[(1'h0):(1'h0)])) ?
                      $signed({{(^(8'hbc))}, (~^(wire0 * wire20))}) : (8'hb6));
  module22 #() modinst57 (wire56, clk, wire21, reg17, wire5, wire4);
  assign wire58 = ((8'had) ?
                      ($signed($signed($unsigned(wire21))) ^~ reg13[(2'h2):(1'h0)]) : (8'hac));
  assign wire59 = ((|$unsigned(wire58[(1'h1):(1'h0)])) << ($unsigned(reg17) ?
                      $signed(((wire20 ? (8'hb9) : wire3) ?
                          reg9[(4'ha):(1'h1)] : (8'hb7))) : wire6[(4'ha):(3'h7)]));
  assign wire60 = ((reg7[(2'h2):(1'h1)] ?
                      ((wire59 ? (reg17 & reg9) : (~^(8'haf))) ?
                          wire6[(4'h8):(3'h7)] : ({wire1, wire59} ?
                              $unsigned(wire58) : (reg9 < wire18))) : (~^($unsigned(wire21) ?
                          $signed(reg11) : (reg9 ?
                              wire59 : wire56)))) >> $signed((+$signed({reg12,
                      wire21}))));
  assign wire61 = ($unsigned(((-(+reg12)) <= ((8'hbc) != (wire0 ?
                          (8'h9f) : wire18)))) ?
                      (+{((wire56 ^~ wire3) ^~ wire0)}) : {$unsigned($unsigned($unsigned(reg7)))});
  assign wire62 = reg11;
  assign wire63 = (~|reg16[(5'h12):(4'hd)]);
  always
    @(posedge clk) begin
      reg64 <= wire60[(1'h0):(1'h0)];
      reg65 <= (&reg9);
      if (wire60[(3'h5):(2'h2)])
        begin
          reg66 <= $signed($signed(($unsigned((reg15 ?
              reg65 : wire56)) >= $unsigned((reg13 ? (8'hb7) : wire60)))));
        end
      else
        begin
          reg66 <= {(reg66 || ({{wire56, wire4},
                  wire6[(3'h5):(1'h0)]} >> wire6[(4'hd):(4'h9)])),
              reg66[(4'hc):(3'h7)]};
        end
      if ((|(+$signed({$signed(wire19), reg64}))))
        begin
          reg67 <= wire3[(2'h3):(1'h0)];
        end
      else
        begin
          reg67 <= ($signed(((~&reg66[(4'h9):(1'h0)]) ?
                  {wire5} : reg7[(1'h0):(1'h0)])) ?
              $signed($signed(((wire3 < reg10) ?
                  $signed((8'had)) : (wire19 ? wire1 : (8'hb2))))) : wire5);
          reg68 <= (^~$unsigned($signed((((8'hab) ? wire2 : (7'h40)) ?
              wire0[(2'h2):(1'h0)] : (+reg15)))));
          if ($signed($unsigned(reg64[(3'h7):(2'h2)])))
            begin
              reg69 <= (reg16 ?
                  ((~^reg10[(3'h5):(1'h1)]) ?
                      wire18 : (~|$signed($signed(reg8)))) : (!($signed((wire58 ~^ (8'ha8))) ?
                      $unsigned(reg8) : (^~$signed(reg15)))));
              reg70 <= $unsigned(reg68);
              reg71 <= (-$signed((reg68[(3'h6):(3'h4)] ?
                  wire3[(2'h2):(2'h2)] : ((~^reg68) ?
                      reg13[(2'h2):(1'h1)] : $signed(reg66)))));
              reg72 <= $signed($signed(((~&wire5[(4'he):(1'h1)]) * ((!reg70) ?
                  ((8'hbb) | reg68) : $signed(reg13)))));
            end
          else
            begin
              reg69 <= $signed(($signed($signed($signed(reg17))) ?
                  $signed((reg15 ? $signed(reg70) : (~^wire0))) : (((reg65 ?
                          wire21 : reg17) ^~ {(8'h9e)}) ?
                      $unsigned((reg12 - wire18)) : {$unsigned(reg7),
                          (reg64 ? reg8 : wire1)})));
              reg70 <= (reg65 + (wire20 & wire0[(4'ha):(1'h1)]));
              reg71 <= reg9[(4'he):(3'h7)];
              reg72 <= (reg71 - (&wire0[(2'h3):(1'h0)]));
            end
          if (({$signed((!((7'h44) ? wire59 : wire59))),
              $signed(wire58[(1'h1):(1'h0)])} ^ {(~|(~&(wire59 ~^ reg13)))}))
            begin
              reg73 <= (!reg70);
              reg74 <= ((-(reg72 ?
                  wire5 : {$unsigned(wire61),
                      reg11[(2'h2):(1'h1)]})) ^ reg64[(4'ha):(3'h5)]);
            end
          else
            begin
              reg73 <= wire5[(2'h2):(1'h0)];
              reg74 <= ($signed(wire2) ?
                  $signed($unsigned($signed(((8'h9d) || wire21)))) : (^~wire61[(4'ha):(3'h5)]));
              reg75 <= (!reg7[(1'h0):(1'h0)]);
              reg76 <= $unsigned(wire60);
              reg77 <= reg9[(4'hd):(3'h4)];
            end
        end
    end
endmodule

module module22
#(parameter param55 = (^~(!(((-(7'h42)) ? ((8'ha3) ? (8'ha1) : (8'hbe)) : {(8'hb0), (8'hb7)}) ? ((~(8'hbf)) >> ((8'hae) ? (8'hb2) : (8'ha1))) : (~&(8'ha4))))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(4'ha):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  assign y = {wire53, wire29, wire28, reg27, (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= $signed(wire23);
    end
  assign wire28 = $signed($signed((!(^(+reg27)))));
  assign wire29 = $unsigned(wire24);
  module30 #() modinst54 (wire53, clk, wire23, wire26, wire24, wire29);
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  input wire [(2'h2):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire35 = {$signed(wire31)};
  assign wire36 = $signed(((wire34[(4'hb):(4'h8)] >> wire31[(1'h0):(1'h0)]) ?
                      (|wire31[(1'h1):(1'h0)]) : wire35));
  assign wire37 = $signed((~({$signed(wire31), (wire31 >= wire35)} == (wire32 ?
                      $signed(wire33) : (wire36 ? wire34 : wire32)))));
  always
    @(posedge clk) begin
      reg38 <= (~^wire33);
    end
  always
    @(posedge clk) begin
      reg39 <= $unsigned(($signed((wire34[(2'h3):(1'h0)] ?
          $signed(wire33) : $signed(wire35))) || ((&$unsigned((8'h9c))) <<< (|(^wire31)))));
    end
  assign wire40 = {$unsigned((~^((wire35 && wire36) >= (reg39 <<< wire33))))};
  assign wire41 = $signed(((~|wire33[(4'he):(2'h2)]) ~^ ($signed((wire35 & wire37)) + (|(wire36 ?
                      wire40 : reg39)))));
  assign wire42 = wire31;
  assign wire43 = $signed(((((wire40 | wire37) << {reg39, wire34}) ?
                          (wire35[(2'h3):(1'h0)] ?
                              wire40[(4'hc):(4'ha)] : (8'hbf)) : (wire37[(1'h1):(1'h1)] <= (8'ha3))) ?
                      {wire33[(4'hd):(3'h6)]} : ({((8'hab) ? wire33 : wire42)} ?
                          (~|(wire35 ?
                              wire31 : reg38)) : wire37[(1'h0):(1'h0)])));
  assign wire44 = (8'hb1);
  assign wire45 = wire43[(1'h1):(1'h0)];
  assign wire46 = $unsigned($signed($unsigned(wire32[(3'h6):(1'h1)])));
  assign wire47 = $signed((!(~|(wire34 != (-wire41)))));
  assign wire48 = $signed($signed($signed(wire37)));
  assign wire49 = wire40;
  assign wire50 = {(!$unsigned((!(wire43 * wire46))))};
  assign wire51 = $unsigned(((!((8'h9c) <= (wire50 && wire45))) == wire42[(1'h1):(1'h0)]));
  assign wire52 = $signed((8'ha1));
endmodule
