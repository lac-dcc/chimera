module top
#(parameter param88 = (+((((~(8'haa)) ? (~|(7'h42)) : ((8'ha7) ? (8'ha1) : (8'ha2))) ? (|((8'ha0) * (8'hb3))) : ((!(8'hab)) ? {(7'h44), (8'ha2)} : (~&(8'hbb)))) ? (8'hb2) : {(8'hb3)})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire73;
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire5,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire73,
                 reg6,
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
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($signed($unsigned((^~wire3)))));
  always
    @(posedge clk) begin
      if (((7'h42) ?
          $unsigned(((wire3 ^ {wire0}) - $unsigned($signed((8'hbe))))) : (&$unsigned(wire1))))
        begin
          reg6 <= $signed(wire2);
          reg7 <= $signed($unsigned(((~$unsigned(wire3)) ?
              wire4[(4'he):(1'h1)] : wire2)));
        end
      else
        begin
          if (wire5)
            begin
              reg6 <= (($unsigned((7'h43)) >= ((^wire5[(2'h3):(2'h2)]) ?
                      ({(8'hb7), (8'h9e)} ?
                          wire3[(3'h5):(3'h5)] : wire3) : ((-wire1) || $unsigned(reg7)))) ?
                  wire5 : $signed(wire1[(4'hb):(2'h2)]));
            end
          else
            begin
              reg6 <= $unsigned($unsigned((+$signed((reg7 && reg6)))));
              reg7 <= $signed(wire5);
              reg8 <= wire2[(2'h3):(1'h0)];
              reg9 <= wire5;
              reg10 <= reg6[(5'h12):(2'h3)];
            end
          reg11 <= {($unsigned(reg6) * (!$unsigned({wire4})))};
          if (reg9)
            begin
              reg12 <= ((+reg11) ?
                  (-wire0[(3'h5):(1'h1)]) : $signed($unsigned(reg6)));
              reg13 <= ({($unsigned((wire2 == reg8)) ?
                          reg8[(3'h4):(1'h0)] : reg7[(2'h3):(2'h2)])} ?
                  {$signed(reg10[(5'h11):(3'h7)])} : reg11);
              reg14 <= (reg7[(2'h2):(2'h2)] * (reg13 ?
                  wire0[(4'h8):(3'h6)] : ((reg9[(3'h7):(2'h2)] ?
                      reg6 : wire1[(1'h0):(1'h0)]) <= $signed((+reg11)))));
            end
          else
            begin
              reg12 <= $unsigned((~&(((~^wire2) | (reg10 << (8'ha3))) ?
                  wire4[(4'h9):(4'h9)] : wire3)));
              reg13 <= $signed($signed(reg13[(3'h4):(1'h0)]));
              reg14 <= $signed(reg9[(5'h12):(4'hd)]);
              reg15 <= wire2;
            end
          reg16 <= {reg14[(2'h2):(2'h2)]};
          reg17 <= {($unsigned(({reg8, wire5} ?
                      wire3[(2'h2):(1'h1)] : (|reg14))) ?
                  (wire3[(1'h1):(1'h1)] & $signed({wire3,
                      reg12})) : $unsigned($unsigned((reg16 ^~ reg15)))),
              ({reg8} <= (!($signed(wire0) ?
                  (wire5 ? reg6 : reg6) : (~&wire5))))};
        end
      reg18 <= (^reg7);
      reg19 <= ($signed((8'ha0)) ?
          $unsigned(({(wire3 && reg9), {reg9}} ?
              $signed(reg14[(2'h2):(1'h1)]) : {reg11,
                  $unsigned(wire3)})) : $unsigned($signed($signed((wire2 ?
              reg17 : wire4)))));
    end
  assign wire20 = $unsigned(((reg17 | (~|reg18)) ?
                      $unsigned({(-reg6)}) : $signed((8'hb4))));
  assign wire21 = (8'ha8);
  assign wire22 = (wire5 ? (8'ha7) : {(8'ha6)});
  assign wire23 = wire4[(3'h4):(1'h1)];
  assign wire24 = {((|(~$unsigned(wire3))) | reg14), reg8[(3'h4):(1'h1)]};
  assign wire25 = (|reg6[(4'h8):(1'h0)]);
  assign wire26 = (8'ha5);
  assign wire27 = {$signed(reg11[(4'h9):(2'h3)]),
                      $unsigned(reg13[(2'h3):(1'h0)])};
  assign wire28 = $unsigned(($unsigned({(~^reg8)}) ?
                      $unsigned(wire25) : wire22));
  assign wire29 = ((^~wire4) ^ wire4[(2'h3):(1'h1)]);
  assign wire30 = reg15[(4'hb):(4'h9)];
  assign wire31 = (((~^{(wire20 ? wire5 : wire0),
                      (reg9 ?
                          wire28 : reg11)}) + reg17[(4'h8):(3'h5)]) & ((+wire22) - ((wire20[(4'h9):(3'h7)] ?
                          (8'hbe) : $unsigned(wire5)) ?
                      wire0 : reg12)));
  assign wire32 = (reg14 ?
                      wire0 : ((8'h9e) >> $unsigned(((wire28 ~^ (7'h43)) ?
                          {wire24, wire21} : $unsigned(wire29)))));
  module33 #() modinst74 (.wire34(reg18), .wire38(wire4), .wire37(wire29), .y(wire73), .clk(clk), .wire35(reg10), .wire36(wire31));
  module75 #() modinst86 (.wire78(wire28), .wire80(wire22), .clk(clk), .wire76(wire1), .y(wire85), .wire79(wire29), .wire77(reg16));
  assign wire87 = reg18;
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire80;
  input wire [(5'h11):(1'h0)] wire79;
  input wire signed [(4'hd):(1'h0)] wire78;
  input wire [(3'h7):(1'h0)] wire77;
  input wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  assign y = {wire84, wire83, wire82, wire81, (1'h0)};
  assign wire81 = $unsigned(({{$unsigned(wire78), wire80[(5'h10):(3'h4)]}} ?
                      $signed(wire77[(1'h1):(1'h0)]) : (wire80 ?
                          wire79 : wire79)));
  assign wire82 = (((($signed(wire77) ? $unsigned(wire79) : wire77) ?
                              $unsigned(((8'hb4) != wire76)) : {$unsigned(wire80),
                                  wire80}) ?
                          (-$unsigned(wire80)) : ($unsigned($signed((8'haa))) ?
                              (~^(wire78 & wire79)) : wire77[(3'h7):(3'h7)])) ?
                      (((!(wire78 ? (8'h9e) : wire77)) ?
                          ($unsigned(wire80) > $signed(wire77)) : (wire78[(3'h5):(3'h4)] ?
                              {wire80} : {(8'hbf)})) <= (^wire77)) : wire77);
  assign wire83 = ($signed($unsigned(wire76[(2'h3):(1'h1)])) && ((wire77 << wire77[(1'h0):(1'h0)]) ?
                      wire81 : {(wire82[(3'h4):(3'h4)] ^ $unsigned((8'h9c)))}));
  assign wire84 = ((wire83[(2'h2):(1'h0)] > ((~&wire79) ^ wire83)) == wire78);
endmodule

module module33
#(parameter param72 = ((|{(((8'ha2) & (7'h42)) ? ((8'ha5) ? (8'hb4) : (8'hbd)) : {(8'hb7)}), ({(8'had), (8'hbd)} != (~&(8'hb6)))}) ^~ ((|(~^((8'hbd) && (7'h42)))) ? ((((8'ha4) ? (8'haa) : (8'hac)) && (+(8'hab))) + (8'ha5)) : (8'ha2))))
(y, clk, wire34, wire35, wire36, wire37, wire38);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire signed [(4'h8):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire [(4'hd):(1'h0)] wire37;
  input wire [(2'h3):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire57;
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire63,
                 wire61,
                 wire60,
                 wire59,
                 wire39,
                 wire40,
                 wire45,
                 wire57,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg62,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire39 = ((^~wire35) ^ (-$signed(wire36)));
  assign wire40 = $unsigned($unsigned((wire39[(1'h0):(1'h0)] ?
                      ((~&wire35) ?
                          $unsigned((7'h40)) : (wire36 ?
                              wire34 : wire37)) : (|wire34[(5'h12):(4'hb)]))));
  always
    @(posedge clk) begin
      reg41 <= $unsigned((8'hbd));
      reg42 <= ((|$unsigned(((^wire40) || (^wire40)))) ?
          ($signed($signed(reg41[(2'h3):(2'h2)])) ^~ $signed(wire34[(4'h9):(3'h4)])) : (~^(wire35 ?
              $signed((8'hb4)) : $unsigned($signed(reg41)))));
      reg43 <= {(+({wire34[(5'h12):(2'h2)]} < reg41[(2'h3):(1'h1)])), reg42};
      reg44 <= wire40;
    end
  assign wire45 = $signed(((((wire34 ? reg42 : reg41) <= (reg44 ?
                      (8'hb3) : wire34)) & (^~{reg44})) != ($signed($unsigned(wire36)) != (~^$signed(wire34)))));
  module46 #() modinst58 (.wire49(reg41), .wire50(wire35), .clk(clk), .wire47(wire39), .y(wire57), .wire51(wire37), .wire48(reg42));
  assign wire59 = wire35;
  assign wire60 = wire59;
  assign wire61 = (reg43[(1'h0):(1'h0)] ?
                      $signed(wire39[(3'h6):(1'h0)]) : ($unsigned(($signed(wire39) != ((8'hab) ?
                              wire40 : wire40))) ?
                          wire37 : (wire37[(4'hc):(4'h9)] ~^ ($signed(wire37) >> (|reg43)))));
  always
    @(posedge clk) begin
      reg62 <= (({wire34} & (reg42[(2'h2):(1'h0)] ?
          (~&(~wire36)) : (|wire36))) >> wire36[(4'h9):(3'h7)]);
    end
  assign wire63 = ((reg42[(3'h5):(1'h1)] ?
                      (^$signed((-wire34))) : $unsigned($signed($signed(reg42)))) < (~^reg42));
  always
    @(posedge clk) begin
      if ($unsigned(((((8'hab) <= ((8'ha0) != reg43)) >= $unsigned({(8'h9f)})) ?
          ($unsigned((reg62 ? (8'hb6) : wire37)) ?
              ((|wire59) == {wire57,
                  wire38}) : ($signed(wire63) ~^ (!reg43))) : $signed(($signed(wire38) & (!wire57))))))
        begin
          if (reg62)
            begin
              reg64 <= reg43;
              reg65 <= {(((8'hbd) << $signed((wire34 ? wire61 : wire35))) ?
                      ({wire37, wire38[(1'h0):(1'h0)]} + $unsigned((wire34 ?
                          wire34 : reg43))) : wire63[(4'h8):(3'h7)])};
              reg66 <= (wire38[(2'h3):(2'h3)] >>> ((8'ha6) <<< wire60));
              reg67 <= reg64[(2'h3):(1'h1)];
              reg68 <= $unsigned((reg41[(5'h13):(3'h6)] ?
                  (wire63 ?
                      (((8'hb1) ?
                          reg62 : wire39) || (reg43 <= wire36)) : $unsigned(reg42[(2'h2):(1'h0)])) : reg66));
            end
          else
            begin
              reg64 <= (wire36 <= wire59[(2'h2):(2'h2)]);
              reg65 <= (!$unsigned($signed(wire36[(3'h4):(1'h1)])));
              reg66 <= wire37;
              reg67 <= ($signed($signed((reg43 == reg43[(1'h0):(1'h0)]))) & (($unsigned((wire61 ?
                      reg65 : (8'hb6))) ?
                  $signed((wire60 << wire39)) : (~wire36[(5'h13):(4'hd)])) <<< wire36[(4'hd):(3'h7)]));
              reg68 <= ($signed(reg66[(2'h2):(1'h0)]) << {(!wire57[(4'ha):(1'h1)])});
            end
        end
      else
        begin
          reg64 <= ($signed((($signed(wire45) ^~ (7'h44)) ?
              reg64 : ((reg44 ?
                  reg43 : reg42) || $unsigned(reg66)))) << (reg68 < {((reg68 ?
                  reg42 : reg64) >> (|reg66))}));
        end
      reg69 <= reg41[(4'hc):(4'hb)];
    end
  assign wire70 = $unsigned({reg41});
  assign wire71 = {reg43};
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire [(5'h14):(1'h0)] wire49;
  input wire signed [(3'h7):(1'h0)] wire48;
  input wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  assign y = {wire56, wire55, wire54, wire53, wire52, (1'h0)};
  assign wire52 = (|$signed(($signed(wire48) ?
                      wire51 : $signed($unsigned(wire51)))));
  assign wire53 = {(+$signed(({(8'hb2), wire50} ?
                          {wire48} : $signed(wire51))))};
  assign wire54 = wire53;
  assign wire55 = (wire48 ?
                      $unsigned({(wire49 ? (&wire54) : (wire53 >= wire54)),
                          (8'hbc)}) : $signed($unsigned((wire52[(4'h8):(3'h6)] ?
                          $unsigned(wire50) : wire49[(4'hd):(2'h3)]))));
  assign wire56 = $unsigned($unsigned(((7'h44) ?
                      $signed($signed(wire47)) : (~^$unsigned(wire54)))));
endmodule
