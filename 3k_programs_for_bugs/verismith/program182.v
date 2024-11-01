module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire49;
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire51,
                 wire4,
                 wire5,
                 wire6,
                 wire13,
                 wire14,
                 wire49,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (wire2[(3'h4):(1'h0)] != $signed(((~|$unsigned((8'ha8))) ?
                     $unsigned($signed(wire2)) : (wire3[(3'h5):(3'h5)] && (^~wire0)))));
  assign wire6 = $unsigned((wire5[(1'h1):(1'h0)] ? wire5 : (~(7'h44))));
  always
    @(posedge clk) begin
      reg7 <= wire5[(1'h0):(1'h0)];
      reg8 <= ($signed($signed(($unsigned(reg7) ? $unsigned(wire5) : wire0))) ?
          ((wire3 ?
              (wire2 & (wire4 >>> wire6)) : (8'h9f)) ~^ (($unsigned((8'ha2)) ?
                  (wire1 ? wire2 : reg7) : reg7) ?
              $unsigned({(8'haf),
                  wire2}) : (((8'hab) < wire5) && wire6[(4'ha):(4'h9)]))) : {wire3[(4'he):(4'h8)]});
      reg9 <= (|$signed($signed(wire5)));
      reg10 <= $unsigned(({(8'hb3)} | ((!wire2[(1'h1):(1'h0)]) << ($unsigned(reg8) ~^ $signed(reg8)))));
      if (({$signed((~$unsigned(wire4))), wire4} ? wire5[(2'h2):(1'h0)] : reg9))
        begin
          reg11 <= (reg8[(3'h5):(1'h1)] >= wire0[(1'h1):(1'h0)]);
          reg12 <= $unsigned({(~reg7[(4'hf):(4'hb)])});
        end
      else
        begin
          reg11 <= {(7'h44)};
        end
    end
  assign wire13 = (~|{(reg10 ?
                          $signed((reg9 + (8'had))) : $signed(wire6[(5'h13):(4'ha)])),
                      wire4[(2'h2):(1'h0)]});
  assign wire14 = $signed(({(|$signed(reg8)), {(reg7 >= wire0)}} ?
                      $signed(reg8) : ((~|reg10[(4'hc):(1'h0)]) + reg7)));
  always
    @(posedge clk) begin
      reg15 <= (7'h42);
      if ((wire4[(2'h3):(1'h1)] ^~ wire4))
        begin
          reg16 <= (($unsigned((~|(8'ha4))) != (^~$unsigned(reg15[(1'h1):(1'h0)]))) ?
              (8'hbf) : (reg10 ?
                  (({wire2,
                      (8'ha3)} + wire14) >> $signed(wire1[(4'hb):(1'h1)])) : ($signed($signed(wire3)) ?
                      $signed($unsigned((8'hb1))) : reg7)));
          reg17 <= reg11;
          reg18 <= $signed(reg16);
        end
      else
        begin
          reg16 <= $unsigned($signed(wire14[(1'h1):(1'h1)]));
          reg17 <= (+(+(^~$unsigned((&reg8)))));
          reg18 <= (reg8[(3'h4):(2'h3)] >= {(((~|reg16) ?
                      $unsigned((8'haf)) : (reg12 ? wire6 : wire5)) ?
                  reg18[(4'h9):(1'h0)] : reg7[(3'h6):(2'h2)])});
          reg19 <= (&$unsigned(reg7[(1'h0):(1'h0)]));
          reg20 <= $unsigned($signed(wire1[(3'h6):(3'h6)]));
        end
      reg21 <= $signed((+wire14[(2'h2):(1'h1)]));
      reg22 <= reg18;
      reg23 <= (|reg22[(4'hd):(4'h8)]);
    end
  module24 #() modinst50 (.clk(clk), .wire27(wire3), .y(wire49), .wire25(wire1), .wire29(reg12), .wire26(wire5), .wire28(reg17));
  assign wire51 = (^(reg10 == ((wire1[(4'hc):(1'h1)] ? $signed(reg10) : wire5) ?
                      $signed((wire1 && wire1)) : wire13)));
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned((^~reg12)) ?
          ($unsigned(wire2) | (~|wire0)) : reg21[(1'h0):(1'h0)])) < ($signed({(wire6 ^ reg9),
              ((8'hb5) == wire51)}) ?
          $unsigned(((~wire13) * $unsigned(wire2))) : ({(reg8 ~^ reg11),
                  reg23} ?
              $signed((reg19 ^~ wire4)) : (~^(~&(8'ha0)))))))
        begin
          reg52 <= $unsigned(reg10[(4'ha):(3'h6)]);
          reg53 <= ($signed(((~|(reg8 >= wire49)) ^ ((8'ha1) << $signed(reg22)))) | (~|reg22[(4'h8):(1'h0)]));
          if ((($signed(reg15) ?
              reg9[(1'h1):(1'h0)] : $signed(($signed(reg52) ?
                  {reg16, reg7} : reg21[(2'h3):(2'h3)]))) ~^ wire14))
            begin
              reg54 <= $signed((^(({reg20, wire3} + (reg12 ? reg23 : wire5)) ?
                  reg11[(4'hb):(3'h7)] : wire4[(1'h0):(1'h0)])));
              reg55 <= reg21;
            end
          else
            begin
              reg54 <= ((^~(~(reg22[(4'hd):(3'h5)] > $unsigned(reg8)))) == ($signed(reg22) != $signed((~$unsigned(reg22)))));
              reg55 <= wire13[(1'h1):(1'h1)];
              reg56 <= (reg52 > ($signed(((wire49 <<< reg53) >> $unsigned(wire2))) ?
                  $signed((((8'ha8) ? reg22 : wire13) ?
                      $signed(wire49) : (+wire6))) : ((reg19 ?
                      reg8[(3'h7):(2'h3)] : (reg19 ?
                          reg12 : reg11)) ^~ ($signed(reg21) >> (wire1 ?
                      wire51 : reg9)))));
              reg57 <= reg56;
            end
        end
      else
        begin
          reg52 <= ((^{$unsigned((wire1 * reg23)),
              $unsigned((~^(8'hb8)))}) << ((reg12 ?
              $unsigned({(8'hbc), (8'hb4)}) : ((~&reg18) ?
                  (&wire0) : reg57[(4'h9):(1'h0)])) > $signed($signed({reg55,
              (8'hb4)}))));
          reg53 <= (^~$unsigned(reg18[(3'h5):(2'h2)]));
          reg54 <= (8'h9c);
          reg55 <= (8'hb1);
          reg56 <= (~&(|wire6));
        end
      if ($unsigned(wire0))
        begin
          if ((+$unsigned($unsigned(({reg56} ~^ $signed(reg15))))))
            begin
              reg58 <= {(~|({(reg8 ? wire2 : reg22)} ?
                      $signed((^wire13)) : (~^(reg9 - reg56))))};
            end
          else
            begin
              reg58 <= ({reg55,
                      ($signed(reg20[(4'hb):(1'h1)]) >> $signed($signed(reg12)))} ?
                  reg9 : (wire3 ?
                      $unsigned(($unsigned((8'hb9)) ?
                          (^wire49) : (8'hbe))) : ((|$signed(wire5)) ?
                          ((reg21 == reg22) ?
                              reg19 : ((8'ha8) ?
                                  reg55 : reg8)) : $signed($signed(wire1)))));
              reg59 <= (8'hb6);
              reg60 <= (-reg10[(3'h5):(3'h5)]);
            end
          if (wire3)
            begin
              reg61 <= {reg54, (wire13 == {reg12[(4'hf):(4'he)]})};
            end
          else
            begin
              reg61 <= $unsigned({($signed(((8'ha8) ?
                      (8'haa) : (8'ha3))) && {$signed(reg21), (~reg17)}),
                  $unsigned(reg59)});
            end
          reg62 <= $unsigned(wire13[(3'h4):(2'h3)]);
          reg63 <= {reg61};
        end
      else
        begin
          if (reg63)
            begin
              reg58 <= reg21[(1'h1):(1'h1)];
              reg59 <= reg9;
              reg60 <= (8'h9c);
            end
          else
            begin
              reg58 <= $unsigned(wire1);
              reg59 <= (((~|((wire5 ? reg16 : reg11) && (reg7 ?
                      reg19 : reg20))) ?
                  (reg55 <= ((8'hbc) ?
                      (|reg15) : $unsigned(reg61))) : ((~reg20) ?
                      (reg11[(4'ha):(2'h3)] ?
                          $signed(reg8) : reg7) : $unsigned($unsigned(wire2)))) > $signed($unsigned(wire51)));
            end
          reg61 <= (&reg23[(3'h7):(2'h3)]);
          reg62 <= (|reg59[(3'h7):(3'h6)]);
          reg63 <= (reg56[(4'hb):(1'h1)] > {reg54[(2'h2):(1'h0)],
              reg56[(3'h4):(2'h3)]});
          reg64 <= reg61[(4'hb):(4'hb)];
        end
      reg65 <= $signed(((&($unsigned(reg16) <<< reg60[(3'h5):(1'h0)])) ?
          reg54 : {reg60[(3'h7):(3'h5)]}));
      reg66 <= {$signed(((~|$unsigned(reg23)) ?
              $signed((reg52 ? reg12 : wire2)) : ((wire49 ? reg63 : (8'ha0)) ?
                  {wire6, wire51} : (reg12 ? reg60 : wire5))))};
    end
  assign wire67 = $unsigned($signed({((~wire14) ~^ $signed(reg18))}));
  assign wire68 = ({(((reg65 ? wire3 : reg15) * (wire14 != reg19)) && ((8'hb9) ?
                          reg59 : $unsigned(wire49))),
                      $unsigned($signed((reg53 ?
                          reg58 : reg15)))} < $unsigned($signed((-reg56[(3'h7):(3'h6)]))));
  assign wire69 = reg56;
  assign wire70 = $unsigned((reg10 ?
                      $signed((&(reg18 ? reg60 : reg59))) : (($unsigned(reg58) ?
                              $unsigned(reg11) : $signed(reg23)) ?
                          $signed((wire6 ^~ reg57)) : (reg66[(3'h5):(2'h3)] ?
                              $signed(reg59) : (reg65 ? reg9 : (8'hab))))));
  assign wire71 = (wire0 & $signed((^~reg11)));
endmodule

module module24
#(parameter param48 = {(((8'hbf) ^ {((8'ha3) - (8'hba)), ((8'hbc) <<< (8'ha6))}) ? ((((8'h9c) ? (8'hb0) : (8'ha5)) ? ((8'hb1) > (8'ha6)) : (~|(8'haf))) >= ({(7'h40), (8'hab)} ~^ ((8'hac) != (8'hbb)))) : ((((8'ha9) * (8'hb2)) ? {(7'h42), (8'haf)} : (~(8'ha5))) & {(8'hb7)})), (!(~&(((8'h9e) ? (8'ha3) : (8'had)) ? ((8'hb3) <= (8'hbf)) : (7'h42))))})
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire42;
  assign y = {wire47, wire46, wire45, wire44, wire42, (1'h0)};
  module30 #() modinst43 (wire42, clk, wire29, wire26, wire27, wire25, wire28);
  assign wire44 = ({$unsigned(wire42[(1'h0):(1'h0)]),
                          $signed(wire27[(4'ha):(1'h1)])} ?
                      ($signed($unsigned((~&wire28))) ?
                          ({(wire28 ?
                                  wire26 : wire29)} ^ ((^~wire28) && $unsigned(wire28))) : wire27[(3'h6):(3'h4)]) : (wire42[(5'h14):(4'h8)] ?
                          (wire29[(4'hd):(3'h5)] ?
                              $signed((wire25 ?
                                  wire26 : wire25)) : $unsigned((wire29 >= wire28))) : wire26[(4'hc):(3'h4)]));
  assign wire45 = ((wire28 != ((wire27 ?
                          (wire29 || (8'ha1)) : wire29) ~^ wire44)) ?
                      $unsigned($signed($signed((wire26 ^~ (8'ha0))))) : ((wire28[(1'h0):(1'h0)] >= ((wire25 | (8'hb4)) ?
                              $signed(wire27) : (wire28 ? wire27 : wire29))) ?
                          wire25[(2'h2):(1'h1)] : ($unsigned((~^wire26)) ~^ {(+wire44)})));
  assign wire46 = wire28;
  assign wire47 = $unsigned($unsigned($unsigned({$unsigned(wire46)})));
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire35;
  input wire [(5'h12):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire33;
  input wire [(4'hd):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  assign y = {wire41, wire40, wire39, wire38, wire37, wire36, (1'h0)};
  assign wire36 = ($signed($unsigned(wire34)) > {$unsigned($unsigned($signed(wire31)))});
  assign wire37 = (-$unsigned(wire34[(3'h7):(3'h7)]));
  assign wire38 = wire33[(3'h4):(3'h4)];
  assign wire39 = wire35[(4'he):(4'h9)];
  assign wire40 = ($unsigned($signed(wire33)) && $signed($signed((-(wire35 ?
                      wire33 : wire37)))));
  assign wire41 = $signed((~^$signed($unsigned(wire36))));
endmodule
