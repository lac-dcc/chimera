module top
#(parameter param78 = {((~(-((8'ha0) ? (8'haf) : (8'had)))) == ((((8'ha3) && (8'hba)) ? ((8'hb4) && (7'h40)) : {(8'hb2), (8'hb4)}) ~^ ((&(8'ha3)) ? ((8'ha6) ? (8'hb7) : (8'hb4)) : ((8'ha2) | (8'hb1))))), ((~&(~&((8'hba) ? (8'h9f) : (8'h9d)))) ? (&(((8'hbb) ? (8'hb5) : (8'hbc)) ? {(8'ha1)} : ((8'hb1) >= (7'h42)))) : (8'hb3))}, 
parameter param79 = (!(((~^(param78 & param78)) + {(^param78)}) ? {(param78 ? (param78 != param78) : ((7'h42) << param78)), (~&{param78})} : (param78 ? {(param78 ? param78 : param78), (|param78)} : (|((7'h40) ? param78 : (8'hb6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire2[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg5 <= $unsigned({wire3[(2'h3):(1'h1)]});
      reg6 <= {(({(8'hbb)} <= (|(+reg5))) >> ({{wire1, wire4},
              (8'hba)} * (wire0[(3'h5):(2'h2)] ? ((8'hb5) <<< wire3) : reg5))),
          (wire3 ? $signed(reg5[(3'h4):(1'h1)]) : wire1[(2'h3):(2'h3)])};
    end
  always
    @(posedge clk) begin
      reg7 <= wire2;
      reg8 <= ($signed((wire0 >> $unsigned($unsigned(reg7)))) ?
          (reg7[(1'h0):(1'h0)] && reg6) : $unsigned(wire2));
      if ((+$signed(reg5)))
        begin
          if (($signed(reg6) || $signed($unsigned($signed({wire3, wire1})))))
            begin
              reg9 <= (!(+$unsigned(reg6)));
            end
          else
            begin
              reg9 <= $signed(((reg5[(3'h4):(1'h0)] >= {$signed(wire2),
                      $unsigned(wire3)}) ?
                  $unsigned($unsigned((+(8'ha2)))) : ($unsigned({wire3,
                      wire0}) << wire2)));
              reg10 <= $unsigned({(reg6 ?
                      (!$unsigned(reg6)) : $unsigned(reg5[(3'h4):(1'h0)]))});
              reg11 <= wire2;
              reg12 <= wire4;
              reg13 <= $unsigned((&wire2[(5'h12):(4'ha)]));
            end
          reg14 <= (&(^(-$unsigned((reg8 <<< reg8)))));
          reg15 <= ($unsigned({wire3[(2'h3):(1'h0)]}) ?
              {wire4[(2'h2):(1'h0)],
                  (reg14 != {wire3[(2'h2):(2'h2)]})} : (^~$signed($signed($unsigned(reg9)))));
        end
      else
        begin
          reg9 <= $unsigned($unsigned(wire4[(4'hc):(4'hb)]));
          if (wire1)
            begin
              reg10 <= (wire2[(4'ha):(4'h8)] ?
                  $unsigned(((8'haf) <<< reg13[(4'hc):(4'hb)])) : $unsigned((~^$signed(reg8[(2'h3):(2'h2)]))));
              reg11 <= ((&((~^{reg15}) ?
                      reg5[(1'h1):(1'h0)] : $signed($signed(wire1)))) ?
                  {reg7, reg9[(3'h4):(2'h2)]} : ({reg6[(3'h7):(1'h0)],
                          wire4[(4'hb):(1'h1)]} ?
                      $signed(($unsigned(wire2) ^~ $signed((8'ha5)))) : reg14));
            end
          else
            begin
              reg10 <= reg12;
              reg11 <= {(($unsigned(wire0[(3'h7):(2'h2)]) - ((reg8 > (8'hac)) ?
                          $unsigned(wire4) : $signed((8'h9d)))) ?
                      reg6 : reg7)};
            end
          reg12 <= $unsigned($signed((8'hbb)));
        end
      reg16 <= (($unsigned((((8'hb4) && wire1) * (~|(8'hb7)))) && (reg5[(3'h5):(1'h0)] ?
              ($signed(reg13) ?
                  (reg11 ^ reg10) : ((8'h9d) ~^ reg12)) : $signed($signed(reg9)))) ?
          (reg15 ?
              ((^(reg15 & reg9)) ?
                  reg14 : reg15[(2'h3):(2'h3)]) : wire4) : reg14);
    end
  assign wire17 = (reg11 ?
                      ((~^{wire2}) ?
                          reg14[(1'h0):(1'h0)] : $unsigned((~|(~&reg15)))) : ({reg12[(1'h0):(1'h0)]} ^ (~(reg11[(3'h5):(3'h4)] ?
                          (reg10 ? reg10 : reg11) : {reg8, reg12}))));
  assign wire18 = reg16;
  assign wire19 = ($unsigned(reg11) ?
                      wire2 : (~^$signed((wire3[(1'h0):(1'h0)] ?
                          (wire18 >>> reg14) : wire18))));
  assign wire20 = {(reg10[(3'h5):(1'h1)] | $unsigned((!reg8)))};
  assign wire21 = $signed(reg7[(1'h1):(1'h0)]);
  module22 #() modinst73 (.wire23(reg15), .wire25(reg7), .wire26(reg11), .wire24(reg10), .clk(clk), .y(wire72));
  assign wire74 = ($signed($unsigned(wire20[(4'h8):(3'h4)])) ?
                      ({($signed(reg6) ? $unsigned(wire1) : (wire20 > (8'hb4))),
                          reg15[(5'h11):(2'h3)]} > reg7) : $unsigned(((((8'hb4) ?
                          (8'h9d) : reg13) << (reg11 | reg7)) < (8'hab))));
  assign wire75 = ((wire2 ?
                          $signed($unsigned((!reg16))) : (($unsigned(reg5) >= (!reg5)) ?
                              wire21[(3'h4):(2'h2)] : ((wire74 >>> wire19) | wire19))) ?
                      reg16 : ($unsigned({$unsigned(reg13)}) || (reg8[(3'h4):(3'h4)] ?
                          wire2 : wire21[(1'h0):(1'h0)])));
  assign wire76 = reg14;
  assign wire77 = (~wire76[(4'h8):(3'h7)]);
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  input wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  assign y = {wire70,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg33,
                 (1'h0)};
  assign wire27 = $unsigned(($signed(wire26[(3'h5):(3'h4)]) ?
                      wire24 : (((~^(8'hb3)) * $signed(wire26)) ?
                          (+(8'hb7)) : {(wire24 ? wire23 : (8'had))})));
  assign wire28 = wire24;
  assign wire29 = (|($signed(wire23) <= $unsigned($unsigned((wire24 ?
                      wire28 : wire25)))));
  assign wire30 = (!wire28[(1'h0):(1'h0)]);
  assign wire31 = wire26[(4'h9):(3'h4)];
  assign wire32 = (^($unsigned(($signed(wire30) ?
                          (wire27 - wire27) : wire24[(4'hc):(4'h9)])) ?
                      $unsigned(wire29) : ((&wire23) ?
                          wire31[(1'h0):(1'h0)] : $unsigned((~wire30)))));
  always
    @(posedge clk) begin
      reg33 <= ($unsigned(($signed(wire31[(3'h5):(3'h4)]) || wire24[(4'hc):(2'h2)])) >= (wire29 << wire30));
    end
  module34 #() modinst71 (wire70, clk, wire23, wire25, wire30, reg33, wire32);
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire signed [(2'h2):(1'h0)] wire38;
  input wire [(4'he):(1'h0)] wire37;
  input wire signed [(5'h11):(1'h0)] wire36;
  input wire [(4'hd):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire40 = (wire37 ?
                      $unsigned(wire35[(3'h4):(1'h1)]) : $unsigned(wire36));
  assign wire41 = ((~&($unsigned({wire36}) <<< wire40[(3'h5):(3'h4)])) ?
                      ((wire39 ^ wire36[(4'ha):(4'ha)]) ?
                          (wire38 ?
                              (8'hb5) : $unsigned({(7'h44),
                                  wire36})) : (wire40[(2'h2):(1'h1)] ?
                              {(wire40 <= wire35)} : $signed(wire35[(1'h1):(1'h0)]))) : $unsigned((((~|wire37) ?
                          (&wire38) : wire37) != $signed(wire36))));
  assign wire42 = $unsigned(wire35[(4'ha):(3'h5)]);
  assign wire43 = $unsigned((wire36 <= (&{wire37[(4'hd):(3'h6)]})));
  assign wire44 = wire36;
  assign wire45 = wire37[(4'ha):(1'h1)];
  assign wire46 = wire41[(2'h3):(2'h3)];
  assign wire47 = wire43;
  assign wire48 = $signed(($signed($unsigned((wire38 == wire35))) && (wire38[(2'h2):(1'h1)] ?
                      (-(^wire36)) : $unsigned(wire42))));
  assign wire49 = $signed(wire43);
  assign wire50 = wire49[(3'h6):(3'h4)];
  assign wire51 = wire39;
  assign wire52 = $unsigned($signed($unsigned(wire40)));
  assign wire53 = wire36;
  assign wire54 = ($signed($unsigned($signed($signed(wire47)))) >>> ($signed(wire48) ?
                      wire46[(4'he):(3'h5)] : {(wire38[(2'h2):(2'h2)] * wire36[(5'h11):(5'h11)])}));
  assign wire55 = wire45[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg56 <= (+(((-(^~wire43)) ^~ $unsigned((+wire41))) ?
          $signed(wire55[(2'h3):(2'h2)]) : wire43));
      reg57 <= reg56[(3'h5):(1'h1)];
      reg58 <= $signed((8'hbd));
    end
  always
    @(posedge clk) begin
      reg59 <= $signed({($signed($unsigned(wire47)) ?
              (reg56 + (wire45 ^~ reg58)) : ((wire48 ? (8'hbd) : reg58) ?
                  $signed(wire42) : (wire54 && wire47)))});
      reg60 <= {({(wire38 ^ wire46[(5'h12):(2'h3)])} + (~|$signed(reg56[(3'h4):(2'h2)]))),
          (|($signed((wire38 | wire47)) && ((~^wire37) >> {(7'h42)})))};
      if ({(|(7'h44))})
        begin
          reg61 <= (&reg56[(3'h6):(2'h3)]);
        end
      else
        begin
          reg61 <= (($unsigned(wire42[(1'h0):(1'h0)]) ?
              (($signed(reg60) ?
                      (wire35 <<< wire55) : (wire45 ? wire49 : (8'h9f))) ?
                  $signed($signed(wire53)) : (~^wire51[(4'h9):(2'h3)])) : $signed($unsigned((reg59 != (8'ha9))))) >>> $signed(wire54[(4'h9):(3'h7)]));
          if ({(~&$unsigned(wire36)), (!reg57[(3'h6):(1'h0)])})
            begin
              reg62 <= wire38;
              reg63 <= reg57[(4'h8):(3'h5)];
              reg64 <= (wire35[(1'h1):(1'h1)] << reg56);
            end
          else
            begin
              reg62 <= $signed(reg60[(2'h2):(1'h1)]);
              reg63 <= $signed((~&$unsigned(($unsigned(reg62) ?
                  (!wire49) : (wire48 ? wire37 : wire49)))));
              reg64 <= wire42[(2'h2):(1'h1)];
              reg65 <= $unsigned(($signed(wire49[(3'h5):(1'h0)]) && reg64[(1'h1):(1'h1)]));
            end
          reg66 <= reg63;
          reg67 <= (^(^(~|reg65)));
        end
      reg68 <= (($unsigned(reg57[(3'h6):(3'h6)]) ^~ (8'hb5)) ?
          ($signed(wire49) ?
              ($unsigned((wire40 * wire45)) ?
                  $unsigned($signed((8'hae))) : $signed((-wire39))) : $unsigned($unsigned(reg66[(1'h0):(1'h0)]))) : wire40);
      reg69 <= ($signed({$unsigned((reg61 >>> reg68)),
          ($unsigned(wire52) ? reg68 : (^wire50))}) <<< $signed(wire43));
    end
endmodule
