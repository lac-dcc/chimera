module top
#(parameter param76 = ((|(&(((8'hb4) ^ (8'hbb)) ? ((8'hb6) ~^ (8'hb5)) : ((7'h40) >>> (8'hb3))))) - (({(8'ha8), ((8'hbc) == (8'hb9))} >>> ({(8'hb7), (8'ha1)} ? ((8'haa) | (8'ha6)) : ((8'hb9) << (7'h40)))) < ({(~^(8'hbe)), {(8'hbd)}} * ((7'h40) >= (^~(8'ha3)))))), 
parameter param77 = (param76 << (8'h9c)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire56,
                 wire5,
                 reg70,
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
                 (1'h0)};
  assign wire5 = $signed({(wire3[(3'h5):(2'h3)] < ($unsigned(wire0) ?
                         (~&wire4) : wire1[(3'h5):(2'h2)]))});
  module6 #() modinst57 (.wire10(wire2), .y(wire56), .clk(clk), .wire8(wire0), .wire7(wire4), .wire9(wire3));
  always
    @(posedge clk) begin
      reg58 <= (~^($signed((((7'h43) ? wire1 : wire2) ?
          wire56[(3'h5):(1'h1)] : (8'hbd))) | wire5[(1'h1):(1'h1)]));
      if ($signed(wire4))
        begin
          reg59 <= $signed($unsigned($signed($signed(wire0))));
          reg60 <= (((8'h9c) ?
              $unsigned((8'hbd)) : wire56) == wire5[(3'h6):(2'h3)]);
          reg61 <= (^~$signed(reg59[(3'h6):(1'h1)]));
          reg62 <= $unsigned({reg61});
          reg63 <= {$unsigned(($unsigned({reg60}) - {((8'hba) ? reg62 : wire1),
                  reg58})),
              $signed(wire1)};
        end
      else
        begin
          if (wire0[(4'hb):(1'h0)])
            begin
              reg59 <= reg58[(3'h7):(1'h0)];
              reg60 <= wire4;
              reg61 <= ((reg58 << $signed($signed(wire0))) <<< wire4);
              reg62 <= $signed(wire5[(3'h7):(3'h5)]);
              reg63 <= (|$signed(reg62));
            end
          else
            begin
              reg59 <= $signed((wire1 ?
                  $unsigned($signed(reg59[(4'h9):(4'h9)])) : (~((reg60 * reg63) ?
                      wire3[(3'h7):(2'h3)] : ((7'h41) ? wire4 : reg58)))));
              reg60 <= (~&((-((-reg63) ? wire1 : {reg62})) ?
                  wire2[(2'h2):(1'h1)] : (~&$signed($unsigned(wire0)))));
              reg61 <= $unsigned(((wire4[(3'h5):(2'h2)] <<< ({(8'ha5)} && (~^wire0))) >>> reg61[(3'h4):(1'h0)]));
              reg62 <= {$signed((&$unsigned(reg62))),
                  $signed((reg62[(3'h6):(3'h4)] ?
                      $signed((reg62 ~^ wire0)) : reg61[(3'h7):(2'h3)]))};
            end
          reg64 <= $signed(reg59);
          reg65 <= reg58[(3'h5):(1'h1)];
          if ({(((+(-reg65)) ? $unsigned((-wire1)) : (|$signed((8'hb4)))) ?
                  wire1 : $unsigned(reg59[(4'hc):(4'hb)]))})
            begin
              reg66 <= (^~((^~$signed($signed((8'had)))) ~^ (((wire5 ?
                      reg59 : reg61) * (wire5 ? reg59 : reg63)) ?
                  $unsigned($unsigned(wire1)) : (8'hba))));
              reg67 <= ($signed(reg62) >> (^~(-$unsigned($signed(reg63)))));
              reg68 <= $unsigned($unsigned($unsigned((7'h41))));
              reg69 <= wire0[(3'h4):(1'h1)];
            end
          else
            begin
              reg66 <= (~{$signed(wire56[(4'hc):(1'h1)])});
              reg67 <= (reg69 | $signed((((reg62 ? wire1 : (8'ha7)) ?
                  (reg64 ? wire4 : reg65) : (8'hac)) <<< reg63)));
            end
          reg70 <= (((&$unsigned({reg59, wire3})) ?
              (((reg67 ? reg66 : (7'h44)) ?
                      (wire5 ? wire1 : (8'h9e)) : (&reg60)) ?
                  (-$signed(wire0)) : (-reg63)) : (~|$signed({wire0,
                  (7'h44)}))) << (reg62 ? $signed(reg67) : $unsigned(reg61)));
        end
    end
  assign wire71 = (((~|reg69) ?
                          reg69[(5'h10):(4'hb)] : (((reg69 ? reg61 : reg65) ?
                                  (reg66 != (8'h9e)) : (reg59 >>> wire0)) ?
                              (!reg61) : (~$signed((8'h9d))))) ?
                      (wire3 ?
                          reg69[(3'h7):(3'h4)] : {$unsigned(wire3[(2'h2):(1'h0)])}) : $signed(reg58[(2'h2):(2'h2)]));
  assign wire72 = $signed({(-$signed($signed(wire56))),
                      (~$signed((wire71 ? wire71 : reg69)))});
  assign wire73 = reg62;
  assign wire74 = reg68[(2'h3):(1'h0)];
  assign wire75 = (!(|reg69[(5'h12):(2'h2)]));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire49;
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire30,
                 wire12,
                 wire11,
                 wire32,
                 wire33,
                 wire49,
                 reg53,
                 reg52,
                 reg51,
                 reg34,
                 (1'h0)};
  assign wire11 = ((($signed(wire8) ?
                          $signed($unsigned(wire9)) : wire8) ~^ ((wire7 - (wire10 - (8'hb4))) ?
                          ($unsigned(wire10) <= (wire7 ?
                              wire7 : wire7)) : (wire9[(1'h0):(1'h0)] > wire7[(3'h5):(2'h3)]))) ?
                      ((wire10[(1'h1):(1'h1)] | $signed((wire7 != wire10))) <<< (^~($unsigned(wire9) + (~|wire7)))) : $signed(($unsigned(((8'hb7) != wire7)) < {wire7[(2'h2):(1'h0)],
                          wire7[(1'h0):(1'h0)]})));
  assign wire12 = $signed((wire7[(4'h9):(2'h2)] == (wire9[(1'h1):(1'h1)] >= $unsigned($unsigned((8'ha7))))));
  module13 #() modinst31 (.wire16(wire9), .wire15(wire8), .y(wire30), .wire17(wire7), .wire18(wire10), .wire14(wire11), .clk(clk));
  assign wire32 = wire9;
  assign wire33 = ($unsigned({{$signed(wire7)}, wire10}) ? wire30 : (8'ha9));
  always
    @(posedge clk) begin
      reg34 <= {$signed((&(~|wire33[(4'ha):(3'h5)]))),
          (~(({wire11} ? wire8[(1'h1):(1'h1)] : $unsigned(wire10)) ?
              wire11[(4'hf):(4'hf)] : wire33))};
    end
  module35 #() modinst50 (.wire36(wire9), .wire37(wire32), .wire39(wire7), .wire40(wire8), .wire38(wire10), .y(wire49), .clk(clk));
  always
    @(posedge clk) begin
      reg51 <= $signed($unsigned(wire49[(4'hd):(4'ha)]));
      reg52 <= (!wire33[(1'h1):(1'h1)]);
      reg53 <= reg34[(1'h1):(1'h1)];
    end
  assign wire54 = (~&$signed({(|(~wire8)), (|wire12[(4'h9):(3'h7)])}));
  assign wire55 = {$unsigned((^$unsigned((^(8'hb8))))),
                      $signed(reg52[(3'h4):(2'h3)])};
endmodule

module module35  (y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire40;
  input wire [(4'hc):(1'h0)] wire39;
  input wire signed [(4'h9):(1'h0)] wire38;
  input wire signed [(3'h7):(1'h0)] wire37;
  input wire [(4'hd):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= wire39[(4'ha):(3'h7)];
      reg42 <= wire36;
      reg43 <= ($signed((~|$unsigned((wire40 ?
          wire39 : wire37)))) && (($signed($signed(wire36)) ?
          ($unsigned(reg42) ?
              wire36[(4'h8):(4'h8)] : {reg41}) : $signed(reg42)) ^~ $signed(((~^wire37) ?
          $unsigned(wire36) : (|wire38)))));
    end
  assign wire44 = ((~|reg41[(3'h5):(2'h3)]) > {(!((reg43 ?
                          wire40 : reg42) < (+wire39)))});
  assign wire45 = (~&$unsigned(($unsigned((-reg42)) > wire36)));
  assign wire46 = {(|reg41[(3'h5):(3'h5)])};
  assign wire47 = wire40;
  assign wire48 = ((8'hb1) >>> ({wire36, reg43} ?
                      wire47 : {wire37[(3'h5):(1'h1)],
                          (((7'h41) ^~ wire39) >> (^~wire38))}));
endmodule

module module13
#(parameter param29 = ((-{(((8'hbe) <= (8'hb0)) ? ((8'ha9) >> (8'hb2)) : (^(7'h42))), (((8'ha0) ? (8'hbf) : (8'ha5)) || (8'hb2))}) ? (|(+(((8'hb1) ? (7'h43) : (7'h44)) & (8'ha6)))) : ((&(~|((8'hbb) ? (8'ha0) : (8'h9e)))) >>> (^(7'h42)))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire21,
                 wire20,
                 wire19,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = (8'ha2);
  assign wire20 = ($signed(wire15) & ($unsigned({$signed(wire14),
                          $unsigned(wire18)}) ?
                      (~&wire14[(3'h5):(3'h4)]) : wire18));
  assign wire21 = (wire20[(1'h0):(1'h0)] ?
                      wire14[(2'h2):(1'h0)] : ($signed((wire16 || $unsigned(wire20))) == {$signed((&wire18))}));
  always
    @(posedge clk) begin
      reg22 <= (8'hb6);
    end
  always
    @(posedge clk) begin
      reg23 <= (($unsigned((wire16[(1'h1):(1'h0)] ?
          (wire18 & wire19) : $signed((7'h44)))) && (($unsigned(wire16) ?
              $signed(wire17) : (reg22 & wire17)) ?
          {wire21, (reg22 ^ wire19)} : {wire14})) + wire20);
      reg24 <= wire17;
      reg25 <= (wire21[(3'h5):(3'h4)] ?
          reg22[(3'h7):(3'h7)] : $unsigned((8'hb2)));
      reg26 <= reg24[(4'hc):(4'h9)];
    end
  assign wire27 = (wire15[(1'h1):(1'h1)] ?
                      ((wire14[(5'h10):(3'h6)] >>> (8'ha1)) ?
                          wire21[(3'h4):(1'h0)] : $unsigned(($unsigned(wire20) ?
                              wire17[(3'h4):(2'h2)] : reg23[(3'h6):(3'h5)]))) : reg22[(3'h6):(2'h2)]);
  assign wire28 = ($signed((+(&((8'hbb) ? wire15 : wire17)))) ?
                      (|(^~wire19)) : (((8'hbb) >>> (wire17 << reg26[(1'h0):(1'h0)])) ?
                          $unsigned($unsigned($signed(wire18))) : ((wire17 ?
                              $signed(wire20) : wire27) >= wire16)));
endmodule
