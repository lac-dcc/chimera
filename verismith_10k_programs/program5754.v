module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire51;
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  assign y = {wire93,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire51,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  module5 #() modinst52 (wire51, clk, wire4, wire1, wire3, wire2);
  always
    @(posedge clk) begin
      reg53 <= wire2;
    end
  always
    @(posedge clk) begin
      reg54 <= ((^((wire3[(4'hb):(1'h1)] ?
          ((8'hb8) < wire51) : (~&wire51)) + wire51)) * $unsigned(reg53[(4'h9):(2'h3)]));
      reg55 <= (^~(^$unsigned({wire51[(4'hc):(4'h9)], (~^wire51)})));
      if ($signed((^~(~|(reg53[(2'h3):(1'h1)] ?
          $signed(wire1) : $unsigned(wire0))))))
        begin
          if (((reg55 <<< ($unsigned(reg54) ^ (wire3 ?
              (wire2 ? wire3 : wire4) : (wire0 ?
                  wire2 : wire0)))) ^~ ((((^~wire2) ?
                      wire2[(4'he):(2'h3)] : $unsigned(reg54)) ?
                  wire3[(5'h12):(5'h11)] : wire4[(2'h3):(1'h1)]) ?
              $unsigned($signed($signed(wire51))) : $unsigned($unsigned($unsigned(reg53))))))
            begin
              reg56 <= wire2[(1'h1):(1'h1)];
              reg57 <= wire3;
              reg58 <= reg53[(3'h4):(2'h3)];
              reg59 <= {(&{(^wire51)})};
              reg60 <= $unsigned(wire0);
            end
          else
            begin
              reg56 <= (~^((&$unsigned($signed(reg58))) ?
                  (((reg57 ? wire1 : wire0) || (reg55 ^~ reg60)) ?
                      $unsigned((^~wire1)) : wire1[(3'h7):(2'h3)]) : (($signed(wire1) ?
                      wire3 : (reg58 ^ reg60)) - $unsigned((|wire4)))));
              reg57 <= (((~^reg53[(1'h0):(1'h0)]) - ((reg57[(4'hc):(2'h3)] << reg59[(3'h4):(2'h3)]) ?
                      wire3[(4'hb):(2'h2)] : reg56)) ?
                  $signed((wire2 > (^~$unsigned((8'ha7))))) : (((+(~|reg60)) ?
                      (-reg56) : ((reg53 - (8'haa)) == $unsigned(wire3))) >> (((^wire1) < (wire4 - (8'ha8))) ?
                      $signed(((8'hba) <= reg57)) : reg58[(2'h3):(1'h0)])));
            end
          if (wire4[(4'h8):(3'h4)])
            begin
              reg61 <= (~|$unsigned($unsigned(((8'ha9) & $unsigned((8'h9f))))));
              reg62 <= $signed({reg61, reg61[(1'h1):(1'h0)]});
            end
          else
            begin
              reg61 <= $signed($unsigned((wire51[(4'h8):(2'h2)] ?
                  {reg57[(4'ha):(3'h6)],
                      (~&(7'h43))} : ({reg56} <<< (8'hb2)))));
              reg62 <= reg60;
              reg63 <= ($signed(wire1) < ($unsigned((^~reg58[(4'hb):(2'h3)])) ?
                  (+((reg57 || (8'h9f)) <<< $unsigned((8'hb8)))) : (~^(wire3 ^ (!wire3)))));
            end
          if (reg58)
            begin
              reg64 <= $unsigned($signed((reg54 ?
                  $signed((reg56 >= reg63)) : $unsigned($signed(wire1)))));
              reg65 <= reg61;
            end
          else
            begin
              reg64 <= reg53[(2'h2):(2'h2)];
            end
          reg66 <= reg58[(3'h6):(2'h2)];
        end
      else
        begin
          reg56 <= (~$signed($unsigned(reg62[(3'h4):(1'h1)])));
          if ($signed({{reg57[(1'h1):(1'h0)]}, wire2[(4'hd):(1'h1)]}))
            begin
              reg57 <= reg58[(1'h1):(1'h0)];
            end
          else
            begin
              reg57 <= $signed($signed(reg66[(3'h6):(2'h2)]));
              reg58 <= (8'hbb);
            end
          reg59 <= ((|($unsigned((|reg56)) & reg63[(2'h2):(1'h1)])) != ((+reg59[(1'h1):(1'h1)]) ?
              reg54 : $signed($signed((reg57 ? reg55 : reg56)))));
          reg60 <= $signed((~reg55[(4'ha):(2'h2)]));
          reg61 <= wire4;
        end
      reg67 <= reg66[(4'hb):(4'ha)];
      reg68 <= (reg61[(3'h7):(3'h7)] <<< $signed($unsigned(((&wire51) || $unsigned(reg53)))));
    end
  assign wire69 = {$unsigned(($unsigned(wire0[(4'hc):(2'h3)]) ?
                          ((reg60 != wire3) ?
                              reg63[(2'h2):(1'h0)] : (reg56 + reg56)) : $unsigned(reg62)))};
  assign wire70 = $signed($unsigned(wire2[(4'h9):(2'h2)]));
  assign wire71 = wire0;
  assign wire72 = (($signed($unsigned($unsigned(reg56))) ?
                      reg62 : wire0[(4'hd):(3'h5)]) <= (($unsigned({reg53}) ?
                          (|$signed((8'hab))) : (reg53[(3'h7):(3'h6)] ?
                              {reg65, wire3} : $unsigned(reg61))) ?
                      $signed((reg66 ?
                          wire70[(4'h9):(2'h2)] : reg54[(1'h1):(1'h1)])) : (wire0 ?
                          $signed(wire1[(1'h1):(1'h1)]) : $unsigned(reg68[(4'ha):(3'h4)]))));
  assign wire73 = ((^reg59) ?
                      (($signed((|wire70)) > $signed((reg64 ?
                          wire72 : reg63))) == (wire0[(5'h11):(4'ha)] ?
                          (reg66[(3'h6):(1'h0)] ?
                              ((8'had) - (8'hb8)) : (wire1 ?
                                  reg56 : wire71)) : ((8'hb7) ?
                              (reg65 > reg65) : $unsigned(reg61)))) : (reg62 ?
                          ((~|wire1) ?
                              wire3[(4'he):(3'h6)] : (((8'ha7) & (8'haf)) ?
                                  $signed(wire69) : (+reg62))) : reg56[(4'he):(2'h2)]));
  assign wire74 = (^(wire3 - ($unsigned((^~reg61)) >>> (reg68[(3'h7):(2'h2)] * reg53))));
  assign wire75 = ((($unsigned(wire2[(4'h8):(1'h1)]) ?
                          {(reg58 ?
                                  reg65 : wire69)} : reg67) + wire72[(3'h4):(2'h2)]) ?
                      ((((7'h42) ?
                              (reg57 ?
                                  (7'h44) : wire4) : wire0[(4'h8):(3'h4)]) || ($signed((8'h9e)) ?
                              wire2 : ((8'hb5) * wire2))) ?
                          (reg53 ?
                              (reg63[(3'h6):(1'h0)] ?
                                  $signed((8'hb1)) : (~&reg58)) : $unsigned($signed((8'h9d)))) : $unsigned(((wire71 * wire2) < (reg59 ?
                              reg64 : reg54)))) : reg62[(3'h6):(3'h6)]);
  assign wire76 = (-(|$unsigned(($unsigned(reg63) || $signed(wire72)))));
  assign wire77 = (^wire2);
  assign wire78 = (|($unsigned({(~|wire72)}) & (~reg55[(3'h4):(2'h2)])));
  assign wire79 = (~^$unsigned($unsigned($unsigned(((8'hb2) ?
                      reg54 : reg53)))));
  assign wire80 = (8'hb9);
  assign wire81 = reg64[(1'h0):(1'h0)];
  module82 #() modinst94 (wire93, clk, wire72, reg58, wire81, wire79, wire4);
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire87;
  input wire [(3'h4):(1'h0)] wire86;
  input wire [(4'hf):(1'h0)] wire85;
  input wire [(4'h9):(1'h0)] wire84;
  input wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  assign y = {wire92, wire91, wire90, wire89, wire88, (1'h0)};
  assign wire88 = (($signed(wire87) ?
                      ((((8'hac) ? wire84 : wire86) ?
                          (wire85 ?
                              wire85 : wire85) : wire85[(4'hf):(1'h0)]) || (8'hb9)) : wire84[(3'h4):(1'h1)]) - ({wire84[(2'h2):(1'h0)],
                          (~$signed(wire83))} ?
                      wire85[(3'h4):(3'h4)] : ($unsigned(wire85) ?
                          (wire87 ?
                              $unsigned(wire86) : $unsigned(wire86)) : (wire84[(3'h7):(2'h2)] == (wire84 == wire87)))));
  assign wire89 = (-$signed(($signed($unsigned(wire85)) ?
                      $signed((wire85 & (8'h9d))) : {(wire85 ?
                              wire87 : wire86)})));
  assign wire90 = wire87;
  assign wire91 = ((wire83[(2'h3):(1'h1)] != $unsigned((((8'ha6) ?
                              wire83 : wire89) ?
                          (wire84 ? wire84 : wire85) : (wire86 ?
                              wire85 : wire84)))) ?
                      wire88 : (((^~$unsigned(wire84)) ?
                          ($unsigned(wire90) * wire88) : ((wire90 ?
                              (8'hac) : wire90) | $unsigned(wire83))) << $unsigned((~|(!wire83)))));
  assign wire92 = $signed(wire86);
endmodule

module module5
#(parameter param50 = (((({(7'h41)} ? ((8'hbd) >= (8'hab)) : ((8'ha3) ? (7'h41) : (7'h43))) | {((8'had) > (8'hac)), ((8'ha4) ? (8'ha0) : (8'ha8))}) == (((-(8'ha8)) <= (&(8'hae))) * ({(8'hbe)} - ((8'ha8) ? (7'h41) : (8'h9d))))) << {{(8'hb9)}}))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire48;
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire48,
                 reg10,
                 reg11,
                 reg12,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= wire7;
      reg11 <= reg10[(2'h3):(1'h0)];
      reg12 <= $unsigned($unsigned($unsigned($unsigned((wire6 ?
          reg10 : (8'ha1))))));
    end
  assign wire13 = $unsigned({$signed(reg12), (~&$signed(reg12))});
  assign wire14 = reg11;
  assign wire15 = wire6[(4'h9):(4'h8)];
  assign wire16 = $unsigned($signed(((-$signed(reg10)) ^ $unsigned($unsigned(reg12)))));
  assign wire17 = (|{$signed($signed((reg11 || wire15)))});
  always
    @(posedge clk) begin
      reg18 <= (+{wire16[(3'h6):(2'h2)],
          ((wire7 ?
              $unsigned(reg11) : (wire15 ?
                  wire16 : (8'hb9))) ~^ {wire8[(1'h0):(1'h0)], (-reg12)})});
      reg19 <= reg18[(2'h3):(1'h1)];
      reg20 <= $signed($unsigned($unsigned(($signed((8'h9d)) ?
          $signed((8'ha3)) : (reg10 ? wire16 : reg10)))));
      if ((reg19[(2'h2):(2'h2)] & (&(^~(~|$signed(wire13))))))
        begin
          reg21 <= $signed($signed(wire9[(2'h3):(1'h0)]));
          reg22 <= wire7;
        end
      else
        begin
          reg21 <= reg18[(2'h3):(2'h3)];
          reg22 <= {{({reg21[(2'h3):(2'h3)],
                      $unsigned(wire9)} < reg18[(2'h3):(1'h1)])}};
          reg23 <= ($unsigned((!($signed(wire8) ? reg21 : {reg21}))) ?
              ($signed((wire17[(4'h8):(3'h7)] ?
                      wire16[(4'ha):(4'h9)] : (^reg10))) ?
                  (wire17[(4'ha):(3'h5)] ?
                      (-reg22[(3'h7):(2'h3)]) : (^(wire15 & reg19))) : wire17) : ((wire16[(2'h2):(1'h0)] - {$signed(wire8)}) << $signed(reg19)));
        end
      reg24 <= $unsigned({$signed({reg12[(2'h2):(1'h0)]}),
          (({reg21} ? reg22[(3'h5):(3'h4)] : $unsigned(reg19)) <= (((8'hb9) ?
              wire9 : reg11) >> (~wire9)))});
    end
  module25 #() modinst49 (wire48, clk, wire14, reg23, reg12, reg19);
endmodule

module module25
#(parameter param47 = (~^(~&(-((~&(8'h9c)) ? ((8'ha9) <<< (8'ha2)) : ((8'hb3) ? (8'hbf) : (8'hb3)))))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire40,
                 wire39,
                 wire38,
                 wire32,
                 wire31,
                 wire30,
                 reg43,
                 reg42,
                 reg41,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire30 = $signed((({(wire27 ~^ wire29)} || wire27) <<< $signed((wire29[(2'h2):(2'h2)] ?
                      (8'h9f) : wire26[(1'h0):(1'h0)]))));
  assign wire31 = (~&(|(wire28 ?
                      (wire28 + $unsigned(wire30)) : (|wire28[(3'h4):(3'h4)]))));
  assign wire32 = wire28[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg33 <= (wire27 ?
          (^~wire26[(3'h5):(1'h1)]) : (~&{(-(-wire30)), (-wire28)}));
      reg34 <= (+((&wire32) ?
          wire31[(4'h9):(3'h5)] : $unsigned((reg33 ?
              (|wire29) : (wire28 == (8'hb9))))));
      reg35 <= {($signed(reg34[(2'h2):(1'h0)]) ? {{(~&wire29)}} : wire30),
          $unsigned(((wire31[(3'h5):(2'h2)] ?
                  reg34 : (wire26 ? (8'hba) : wire26)) ?
              ((reg33 && wire31) ?
                  (wire29 ? wire27 : wire31) : ((8'ha0) ?
                      reg33 : (8'hac))) : $signed($unsigned((8'ha3)))))};
      reg36 <= ($signed(wire30) || $unsigned(wire28[(1'h1):(1'h1)]));
      reg37 <= ((-((~|(wire26 ? wire30 : (8'haa))) ?
              $signed((&(8'had))) : ((~^wire28) ? (^~wire32) : (~|reg34)))) ?
          wire26 : $unsigned(((+(!reg34)) > $unsigned($signed(reg34)))));
    end
  assign wire38 = wire26[(4'h8):(3'h5)];
  assign wire39 = (|(wire31 | reg36));
  assign wire40 = reg35;
  always
    @(posedge clk) begin
      reg41 <= $signed({(wire40[(1'h1):(1'h1)] & {{wire40}})});
      reg42 <= wire26[(3'h4):(3'h4)];
      reg43 <= {($signed(wire32) ?
              ((wire30[(1'h0):(1'h0)] && {reg35}) ?
                  reg36 : ((wire40 | (8'ha2)) <= $unsigned(reg36))) : $unsigned((((8'ha0) ^ wire30) >> $signed(wire40)))),
          reg37[(4'h9):(3'h7)]};
    end
  assign wire44 = $unsigned($signed(((wire29 ?
                      ((8'hbf) < reg42) : (wire40 ^ reg37)) ^~ ((^~reg36) ^~ wire28[(1'h0):(1'h0)]))));
  assign wire45 = (~|wire29);
  assign wire46 = (~^((wire29[(2'h3):(2'h2)] ?
                          ((^~wire30) & $signed(wire44)) : ($unsigned((8'ha1)) ?
                              (reg34 <= wire31) : {reg33})) ?
                      {(-reg41[(1'h1):(1'h0)]),
                          $signed($signed(wire44))} : reg41[(4'h8):(3'h5)]));
endmodule
