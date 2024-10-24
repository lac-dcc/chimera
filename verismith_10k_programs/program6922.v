module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire142,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire5,
                 wire4,
                 reg31,
                 reg30,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
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
                 (1'h0)};
  assign wire4 = {wire3};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      if ((-$unsigned(($signed((^~wire3)) ?
          $signed((wire3 > (8'hba))) : ((wire2 <= wire5) < $unsigned(wire3))))))
        begin
          if (((~&wire4) ?
              $unsigned((((8'haa) | (~^wire5)) ?
                  wire4 : wire3[(3'h6):(2'h3)])) : (~&{(+wire4[(1'h0):(1'h0)])})))
            begin
              reg6 <= wire2[(4'h8):(3'h6)];
              reg7 <= $unsigned((+{(^wire1), ((8'ha1) + wire2)}));
              reg8 <= {(8'hb4)};
            end
          else
            begin
              reg6 <= $unsigned((|reg7));
              reg7 <= wire2[(4'hb):(4'h9)];
              reg8 <= (^~{$unsigned($signed((wire3 <= (8'hbc))))});
              reg9 <= ($unsigned($signed(wire0[(3'h4):(2'h3)])) ?
                  (^~$unsigned((wire4[(1'h1):(1'h1)] ?
                      wire0 : {reg6,
                          wire0}))) : $unsigned($unsigned($signed((wire5 ?
                      wire5 : wire2)))));
            end
          reg10 <= ({{(~|(|reg8)), (&$signed(wire0))}} ?
              ((wire5[(4'hc):(4'hc)] ?
                  $signed(((8'ha2) ?
                      wire1 : wire1)) : reg9[(4'h8):(3'h7)]) | $signed(wire4)) : reg8);
          reg11 <= (^({(~&wire1),
              (!wire3[(3'h5):(1'h0)])} && (+(wire0[(1'h0):(1'h0)] ?
              (~^reg7) : wire3))));
          reg12 <= (~$signed((|(reg8 ?
              $unsigned((8'hb8)) : ((8'h9c) << (8'hab))))));
          reg13 <= $unsigned((wire2 ? $signed(reg9[(4'h9):(1'h0)]) : reg11));
        end
      else
        begin
          reg6 <= (reg10 ? $signed({wire0}) : (^$unsigned($unsigned(reg12))));
          if (({$signed(reg9[(4'h9):(1'h0)]), $unsigned(wire5)} ?
              (!$signed(((^~reg8) ? reg11 : wire4[(5'h10):(4'h8)]))) : wire1))
            begin
              reg7 <= ($unsigned(wire0) ^~ (!(+$signed($signed(wire3)))));
              reg8 <= (((&wire5) ?
                  $signed($signed(reg7)) : reg11[(4'hf):(2'h3)]) || (~$signed(((wire2 || wire4) ?
                  (~(8'h9c)) : $signed((8'hbb))))));
              reg9 <= ((reg13 ?
                  (~|wire4) : $signed(($signed(reg11) ~^ $signed(reg10)))) ^~ (~^((8'ha3) ?
                  ((reg6 ? wire0 : (8'ha5)) ?
                      (reg12 ?
                          wire1 : wire0) : $signed(wire4)) : $unsigned($unsigned(reg7)))));
              reg10 <= (({reg12,
                  ((reg10 - reg11) ?
                      (|wire1) : (wire5 ?
                          reg9 : reg9))} >>> $signed((~|reg13[(4'h8):(3'h7)]))) == wire0);
            end
          else
            begin
              reg7 <= reg11[(4'h8):(2'h3)];
              reg8 <= (8'hbe);
              reg9 <= $unsigned(reg10);
            end
          reg11 <= reg13[(3'h4):(1'h0)];
          reg12 <= (reg9[(3'h5):(2'h3)] ?
              $unsigned($signed((&((7'h40) <<< reg10)))) : (~|wire3));
        end
      reg14 <= (reg6 ^ wire0[(1'h0):(1'h0)]);
      if ((({((reg14 ? (8'hb1) : wire1) != wire3),
                  ($signed(wire5) ?
                      ((7'h44) ? reg10 : wire1) : reg12[(3'h5):(2'h3)])} ?
              (wire2[(4'hc):(3'h7)] ?
                  (!reg10[(4'he):(4'h8)]) : reg7) : (~&$unsigned((-reg13)))) ?
          (^reg8[(4'hc):(1'h1)]) : ($unsigned({reg12,
              (reg13 ? wire1 : reg13)}) ^ $unsigned(reg11))))
        begin
          if (({reg7} ?
              {reg6[(1'h1):(1'h0)]} : ((wire2[(4'h8):(3'h6)] ^ $signed({reg9,
                      (7'h40)})) ?
                  {(wire1 ?
                          wire2 : reg6[(2'h2):(2'h2)])} : reg8[(4'h8):(2'h2)])))
            begin
              reg15 <= $unsigned($unsigned($unsigned(((8'hb1) ?
                  reg14 : (~&wire3)))));
              reg16 <= ((!$unsigned((reg8[(3'h7):(1'h0)] >>> $unsigned(reg11)))) ^ wire4[(4'h8):(2'h2)]);
              reg17 <= ($unsigned((~(+wire4[(4'hb):(1'h1)]))) == {{$unsigned(reg9[(4'ha):(2'h2)])}});
              reg18 <= (~^wire4);
            end
          else
            begin
              reg15 <= $unsigned({($signed($signed(wire1)) - ((^~wire0) ?
                      ((8'h9e) - reg9) : (~|reg6))),
                  reg8});
              reg16 <= (^~wire5[(4'ha):(3'h4)]);
              reg17 <= wire5[(3'h7):(3'h6)];
            end
          reg19 <= reg12;
        end
      else
        begin
          reg15 <= reg7[(3'h4):(1'h1)];
          reg16 <= ((reg11[(3'h6):(2'h2)] ?
                  (reg19 >> {$unsigned(reg16)}) : (reg19 ?
                      {(reg11 != reg11)} : ((~^reg9) ^~ reg8[(5'h13):(5'h13)]))) ?
              $unsigned(reg6) : $unsigned(reg18));
          reg17 <= reg19[(3'h7):(3'h5)];
          reg18 <= reg8[(4'hf):(3'h5)];
          if (reg6)
            begin
              reg19 <= $signed($unsigned((+$unsigned(reg18[(2'h3):(2'h3)]))));
              reg20 <= wire3[(1'h0):(1'h0)];
            end
          else
            begin
              reg19 <= (!wire2[(4'ha):(3'h7)]);
              reg20 <= $unsigned((reg20 ?
                  ((reg20 ? (reg15 ~^ reg17) : {reg9, (8'hb7)}) ?
                      {reg15,
                          $signed(wire1)} : $signed($unsigned(wire5))) : reg13[(2'h3):(2'h3)]));
            end
        end
      if ({{(~^(~^$unsigned(wire0))), (~|wire4)}})
        begin
          if ((wire0 >> wire4[(5'h10):(3'h5)]))
            begin
              reg21 <= $signed(wire0[(2'h2):(1'h0)]);
            end
          else
            begin
              reg21 <= reg21[(4'hd):(2'h3)];
            end
        end
      else
        begin
          if ({$signed(((&wire1) ?
                  ($signed(wire5) ?
                      (reg18 >= reg11) : $signed((8'hb2))) : (reg10 <<< reg19[(2'h3):(2'h3)]))),
              ((~^reg8[(1'h0):(1'h0)]) >= $unsigned((~|$unsigned(reg12))))})
            begin
              reg21 <= reg20;
              reg22 <= (&reg8[(2'h3):(1'h0)]);
              reg23 <= reg19[(3'h7):(3'h6)];
              reg24 <= $signed((|$signed((reg15 == {reg22, reg6}))));
            end
          else
            begin
              reg21 <= (reg7[(3'h7):(3'h4)] != ((8'hba) | (-$unsigned($signed((8'had))))));
              reg22 <= $unsigned((~^(8'hab)));
              reg23 <= (-(reg19[(1'h0):(1'h0)] + reg22[(1'h1):(1'h1)]));
            end
          reg25 <= (&{{{(reg23 ? reg11 : reg10)}},
              (~((~&reg6) ? reg14 : reg10[(1'h0):(1'h0)]))});
        end
    end
  assign wire26 = $unsigned(($signed(((wire2 == wire1) != (reg11 ?
                          wire3 : reg20))) ?
                      (!{reg17[(3'h6):(2'h3)],
                          (wire2 <<< reg6)}) : reg9[(3'h7):(3'h4)]));
  assign wire27 = $unsigned(reg22[(1'h1):(1'h0)]);
  assign wire28 = {$signed(($signed($signed(wire26)) ?
                          (reg10 * {(8'had), wire4}) : reg22)),
                      wire2[(1'h0):(1'h0)]};
  assign wire29 = {($unsigned($unsigned($signed(wire28))) ?
                          $signed({$unsigned(reg7),
                              reg21}) : $signed((reg21 ^ (reg20 ?
                              reg10 : wire1)))),
                      wire27[(3'h5):(2'h2)]};
  always
    @(posedge clk) begin
      reg30 <= $unsigned($signed((((8'hab) ?
          (wire3 ? wire27 : reg14) : reg22) - reg24[(1'h1):(1'h1)])));
      reg31 <= (reg17[(4'hb):(4'h8)] || $signed(reg23));
    end
  module32 #() modinst143 (.wire34(wire1), .y(wire142), .clk(clk), .wire35(reg18), .wire36(reg30), .wire33(wire26));
  assign wire144 = (($signed(reg14) ? reg16 : $unsigned((^~(^~reg30)))) ?
                       $signed((reg15[(2'h2):(1'h0)] ?
                           $signed($signed(wire142)) : (!$signed(reg23)))) : (wire5[(1'h0):(1'h0)] ~^ $signed(reg25[(3'h4):(2'h2)])));
  assign wire145 = reg25;
endmodule

module module32
#(parameter param141 = {{({{(8'ha5), (8'haf)}, ((8'ha8) - (8'hae))} | (~|((8'ha1) >>> (8'hab))))}})
(y, clk, wire33, wire34, wire35, wire36);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire33;
  input wire [(5'h15):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire69;
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  assign y = {wire140,
                 wire138,
                 wire119,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire87,
                 wire86,
                 wire85,
                 wire71,
                 wire37,
                 wire69,
                 reg90,
                 reg89,
                 reg88,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire37 = (wire35[(4'h8):(3'h6)] >> {$signed({(|wire34),
                          $unsigned(wire35)}),
                      wire34[(4'hd):(3'h6)]});
  module38 #() modinst70 (wire69, clk, wire34, wire36, wire35, wire33, wire37);
  assign wire71 = wire33[(4'hd):(4'ha)];
  always
    @(posedge clk) begin
      if ($unsigned((8'hb8)))
        begin
          reg72 <= wire69[(1'h1):(1'h1)];
          reg73 <= $signed((8'haa));
        end
      else
        begin
          reg72 <= (~&wire33[(3'h6):(3'h6)]);
          reg73 <= ($unsigned(wire37[(3'h5):(3'h5)]) ?
              ((^(~{wire34, wire34})) ?
                  (!{(wire35 <= wire35)}) : (wire33 ?
                      wire35[(3'h5):(2'h2)] : wire36)) : (reg72 | {$signed($signed(reg73))}));
          reg74 <= {$unsigned({(wire37[(4'hb):(1'h1)] ?
                      wire34[(3'h5):(2'h3)] : ((8'hbb) ? reg73 : wire69))})};
        end
      reg75 <= $unsigned(($signed($signed((!wire37))) > wire36));
      if (((|{($unsigned(wire71) ?
              wire35 : $unsigned(reg75))}) ^~ (~$unsigned($unsigned($signed(wire33))))))
        begin
          reg76 <= wire33[(3'h5):(2'h2)];
        end
      else
        begin
          reg76 <= wire35[(1'h0):(1'h0)];
          reg77 <= reg74[(2'h3):(1'h1)];
          if ((7'h40))
            begin
              reg78 <= wire71;
              reg79 <= {$signed((!(|{wire33}))),
                  $unsigned((wire37[(4'hb):(1'h1)] | ($unsigned((8'hbb)) ?
                      $unsigned(reg75) : (reg78 > wire37))))};
              reg80 <= ($unsigned(reg73) || ((reg77 ^ $signed(wire33)) ^~ (wire69 | {wire33,
                  $signed(wire34)})));
              reg81 <= ((~&$signed($signed({reg76}))) ~^ reg73[(2'h3):(1'h1)]);
              reg82 <= reg77;
            end
          else
            begin
              reg78 <= wire35[(4'he):(3'h6)];
              reg79 <= wire35[(4'hb):(4'ha)];
            end
        end
      reg83 <= $signed(((|(8'ha0)) ? reg72 : wire33[(3'h7):(3'h4)]));
      reg84 <= ((reg73[(2'h2):(1'h0)] && $signed(((reg77 - reg81) < reg77))) ?
          ((reg75 ? (&$unsigned(reg82)) : reg83) ?
              ($signed($unsigned(wire37)) < $unsigned((wire34 ?
                  wire33 : reg77))) : $signed($unsigned($signed(reg73)))) : wire69[(1'h1):(1'h1)]);
    end
  assign wire85 = $unsigned((7'h44));
  assign wire86 = (-(+$unsigned(reg77[(1'h0):(1'h0)])));
  assign wire87 = $unsigned($signed((reg77 ?
                      reg73 : $signed((reg80 >= wire71)))));
  always
    @(posedge clk) begin
      reg88 <= ($signed({($unsigned(reg77) - reg74[(2'h3):(2'h3)])}) ~^ $unsigned(wire85));
      reg89 <= ((8'ha2) ?
          reg73 : ($signed((-(wire37 - wire71))) ? (8'ha0) : $unsigned(reg76)));
      reg90 <= $unsigned((wire69[(2'h2):(1'h1)] ?
          reg78 : {(-reg74[(2'h2):(2'h2)]), ($unsigned(reg89) * (~&reg78))}));
    end
  assign wire91 = $signed($unsigned({$unsigned($signed(wire33)),
                      reg80[(1'h0):(1'h0)]}));
  assign wire92 = (({$signed(reg84)} ?
                          (wire35[(3'h7):(1'h1)] ?
                              $signed(reg89) : (wire71[(2'h2):(1'h0)] ?
                                  reg83[(3'h5):(1'h0)] : wire37[(4'hb):(2'h2)])) : (((wire35 ~^ reg80) ?
                              (reg84 | reg76) : (wire36 <= wire33)) & reg79)) ?
                      ((-{reg80[(3'h6):(1'h1)]}) >= (~|(-$signed(reg79)))) : $unsigned(((+$signed(reg77)) ?
                          reg80 : ($unsigned(reg78) ?
                              $signed(wire34) : $unsigned(wire33)))));
  assign wire93 = wire69[(2'h3):(1'h1)];
  assign wire94 = $signed((^~wire86[(3'h5):(1'h0)]));
  module95 #() modinst120 (wire119, clk, reg72, wire69, reg75, wire91, reg77);
  module121 #() modinst139 (.wire126(reg73), .clk(clk), .wire123(wire69), .wire124(wire94), .y(wire138), .wire125(reg77), .wire122(reg80));
  assign wire140 = wire85;
endmodule

module module121
#(parameter param136 = {{(|(~(|(8'haf))))}}, 
parameter param137 = (-((!{(~|param136), (param136 ? param136 : (8'hbe))}) || {({param136} ? (param136 ? (8'hb6) : param136) : (param136 ? param136 : (8'had))), ((param136 ? param136 : param136) >= (~^param136))})))
(y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire126;
  input wire [(5'h13):(1'h0)] wire125;
  input wire signed [(3'h5):(1'h0)] wire124;
  input wire signed [(3'h5):(1'h0)] wire123;
  input wire signed [(4'he):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire [(3'h5):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire127;
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 (1'h0)};
  assign wire127 = wire123[(1'h1):(1'h0)];
  assign wire128 = (&wire124);
  assign wire129 = ($unsigned(wire124[(1'h1):(1'h0)]) ?
                       $unsigned(wire124[(2'h3):(1'h1)]) : (wire123[(1'h0):(1'h0)] + (+(((8'hae) | (8'hbd)) << wire124[(3'h4):(1'h1)]))));
  assign wire130 = (^{(wire129 <= wire128)});
  assign wire131 = wire129;
  assign wire132 = ($signed(($unsigned((wire130 ? wire122 : (8'hbf))) ?
                       $unsigned(wire127[(4'h8):(3'h5)]) : wire122[(4'h9):(3'h5)])) - wire130[(4'h9):(3'h4)]);
  assign wire133 = {($signed(wire123) ? wire125[(5'h10):(3'h4)] : (~&(8'hb7)))};
  assign wire134 = (^wire132[(2'h3):(1'h1)]);
  assign wire135 = $signed({wire134[(2'h3):(1'h1)],
                       (~^{((8'haa) << (8'hb0))})});
endmodule

module module95  (y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire100;
  input wire [(4'h8):(1'h0)] wire99;
  input wire signed [(5'h13):(1'h0)] wire98;
  input wire signed [(4'hd):(1'h0)] wire97;
  input wire [(2'h3):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg101,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg101 <= $signed(wire99);
    end
  assign wire102 = (({wire97[(4'h9):(1'h0)]} << $signed((~reg101[(4'ha):(3'h5)]))) ~^ {((^~$signed(wire99)) ^ $unsigned($signed(wire97))),
                       wire98});
  assign wire103 = $signed(wire98);
  assign wire104 = (&wire98);
  assign wire105 = {wire100[(2'h3):(1'h1)], wire100[(3'h4):(1'h0)]};
  always
    @(posedge clk) begin
      reg106 <= (+wire96);
      reg107 <= $unsigned((&reg101));
      reg108 <= wire99[(2'h2):(1'h0)];
      reg109 <= {$unsigned((wire96[(1'h1):(1'h0)] && (8'ha0))),
          (~((-$signed((8'had))) >>> (wire99 ? wire96 : (8'hb2))))};
      if ((+{$signed(reg106[(2'h3):(2'h3)]), $signed(wire98[(5'h13):(1'h1)])}))
        begin
          reg110 <= (~(reg109 ?
              $signed($unsigned((wire100 >= reg107))) : reg109[(4'hd):(3'h5)]));
          reg111 <= wire99;
          if ((|(reg110[(1'h1):(1'h0)] ?
              reg108[(1'h1):(1'h1)] : $signed(((-reg111) >>> (reg107 ?
                  wire96 : reg109))))))
            begin
              reg112 <= ($unsigned($signed(reg107[(4'h8):(1'h0)])) ^~ wire103[(3'h5):(3'h4)]);
            end
          else
            begin
              reg112 <= ($signed($signed(($unsigned(reg106) ?
                      (reg106 <= wire100) : wire100))) ?
                  ($unsigned($signed($signed(reg111))) == $signed(reg101[(3'h6):(2'h2)])) : wire104);
              reg113 <= (reg107[(5'h12):(2'h3)] >= (7'h40));
            end
          reg114 <= $signed((~|(reg109 == {$signed((8'hb3))})));
          reg115 <= wire104[(4'hf):(4'h8)];
        end
      else
        begin
          reg110 <= $signed(wire105);
          reg111 <= $unsigned($signed(wire104));
        end
    end
  assign wire116 = (wire105 ?
                       $signed($signed($unsigned($unsigned(wire98)))) : reg112);
  assign wire117 = wire116;
  assign wire118 = (^($unsigned($signed((wire102 != reg106))) | {$signed($unsigned(reg112)),
                       reg106}));
endmodule

module module38
#(parameter param67 = (((^~(((7'h43) ? (8'hbc) : (8'ha5)) ? ((8'hba) ? (8'hb2) : (8'hb0)) : (&(7'h43)))) ? {(((8'hbe) ? (7'h44) : (8'hab)) ? ((8'hb3) + (8'hb0)) : ((8'ha4) > (7'h44)))} : (&(8'hbb))) ? (({{(8'hb5), (8'hb0)}} ? {((8'h9c) && (8'hba))} : {{(8'hba), (8'ha6)}, ((8'hb0) ? (8'haa) : (8'ha6))}) < ({{(8'hbb), (8'hb3)}, ((8'hbe) ? (8'h9f) : (8'hb9))} ? (~|((8'hb9) - (7'h40))) : (((8'haa) ? (8'hb4) : (8'ha1)) ? ((8'hb3) != (8'ha6)) : ((8'ha2) <<< (8'ha4))))) : (~^({((8'ha2) >>> (8'ha0))} ? (^((8'hba) ^ (8'hab))) : (((8'hb8) ? (8'ha3) : (8'hb0)) * ((8'hbf) ? (8'hae) : (8'ha0)))))), 
parameter param68 = {param67})
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire42;
  input wire signed [(3'h5):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  input wire [(4'ha):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
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
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire44 = wire39;
  assign wire45 = wire39[(4'h9):(3'h5)];
  assign wire46 = (|((~&wire42) <= ((((7'h41) ?
                          wire44 : wire39) > (wire45 || (8'had))) ?
                      wire45[(4'hb):(3'h4)] : wire40)));
  assign wire47 = ((^~$signed((~&(7'h41)))) - (wire39 ?
                      $signed(wire45) : $unsigned(wire46[(1'h1):(1'h0)])));
  assign wire48 = wire39[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if (wire39)
        begin
          if ({(wire45 + wire48),
              $unsigned(($unsigned(wire40[(2'h3):(1'h0)]) ?
                  $signed(wire40) : {{wire44, wire43}}))})
            begin
              reg49 <= {$signed(($signed((wire44 >> wire46)) == ((~|wire46) ?
                      wire39 : $unsigned(wire48)))),
                  {(wire39 ? wire42 : $signed((wire42 < wire44))), wire43}};
              reg50 <= (((|$signed((wire47 ~^ wire44))) ~^ (|((|wire46) < (reg49 ?
                  wire47 : reg49)))) > wire40);
              reg51 <= $unsigned($unsigned(((^wire48[(2'h2):(1'h1)]) & {((8'hb2) ?
                      wire47 : wire45),
                  wire41})));
              reg52 <= $signed(wire46);
              reg53 <= {$signed(wire42), wire45[(3'h5):(3'h4)]};
            end
          else
            begin
              reg49 <= ($signed(reg53) ?
                  ($unsigned($unsigned($signed(wire41))) + $unsigned(((reg52 ?
                          reg53 : wire40) ?
                      {wire41,
                          wire40} : $unsigned(wire40)))) : $unsigned({(~$unsigned(reg50)),
                      $unsigned(wire44[(2'h3):(1'h1)])}));
              reg50 <= wire39[(2'h2):(1'h0)];
              reg51 <= $unsigned(wire45);
              reg52 <= (wire47[(4'h8):(4'h8)] ?
                  ($signed($unsigned(wire43)) >> (((^~reg49) > {wire40,
                          reg51}) ?
                      {reg52[(3'h5):(3'h4)]} : (wire39 ?
                          $unsigned(reg49) : ((8'hb2) ?
                              wire43 : wire43)))) : $unsigned(wire40[(3'h6):(3'h4)]));
              reg53 <= ($signed(reg50[(2'h3):(2'h3)]) ?
                  $signed((~((!reg49) ?
                      $signed(reg53) : (^wire43)))) : $unsigned((~&(~$signed(reg52)))));
            end
          reg54 <= (~&$signed({((wire42 ? wire48 : reg52) ?
                  (wire48 ? wire46 : wire47) : $unsigned((8'hb3))),
              (8'hb7)}));
          reg55 <= $signed((((8'ha8) ?
                  $signed({(8'hab), wire44}) : {(wire46 ? (8'h9d) : wire39)}) ?
              (~|$signed(reg52)) : reg52[(4'hb):(2'h2)]));
          reg56 <= ($signed(wire48) ?
              wire46[(1'h0):(1'h0)] : (($unsigned(wire44[(3'h4):(2'h3)]) >= (&(reg55 - wire42))) | wire48));
          if ((wire45 & {$signed({(wire45 || wire41)})}))
            begin
              reg57 <= (wire42 ?
                  $signed((-$unsigned((!wire39)))) : ((-$signed((wire47 >>> (8'ha0)))) ?
                      ((8'hb4) || $signed($signed(wire40))) : wire40[(1'h1):(1'h1)]));
              reg58 <= reg50;
              reg59 <= (((({wire42} <= reg56[(1'h1):(1'h0)]) ?
                      ((reg51 ?
                          wire42 : (8'hb5)) || $unsigned(reg54)) : reg55) ?
                  (reg58[(1'h0):(1'h0)] ?
                      (reg53[(3'h4):(1'h0)] - wire47[(1'h0):(1'h0)]) : ($unsigned(wire41) ?
                          (^wire39) : (reg56 >= wire41))) : $unsigned(((8'ha8) == $unsigned(wire43)))) ^~ (reg57[(2'h3):(2'h3)] ^ (^reg49[(1'h1):(1'h1)])));
              reg60 <= ($signed($signed(wire44)) == wire43);
            end
          else
            begin
              reg57 <= (8'ha1);
              reg58 <= (+(-(^~wire48[(2'h2):(2'h2)])));
            end
        end
      else
        begin
          reg49 <= {(-(wire41 ?
                  ($signed(reg53) >>> (reg55 || (7'h44))) : (-$signed(reg57)))),
              ($signed({$signed((8'ha8)), wire48[(3'h5):(3'h5)]}) ?
                  reg59 : (8'hbc))};
          reg50 <= (wire48 ?
              $signed({{(reg49 ? (8'hba) : (8'haa)), $signed(reg57)},
                  ($unsigned(reg54) || $signed(reg60))}) : (|($unsigned(wire42) ?
                  reg51[(3'h7):(2'h2)] : $signed((reg49 ? (8'hb8) : reg50)))));
          reg51 <= reg54;
        end
      reg61 <= (($signed({$unsigned((7'h43))}) ?
              (|reg55[(3'h4):(2'h3)]) : wire46[(1'h0):(1'h0)]) ?
          ($unsigned({$unsigned(reg54),
              reg60}) == wire43[(3'h7):(1'h0)]) : wire42);
      reg62 <= wire39;
      reg63 <= (8'ha0);
    end
  assign wire64 = wire47[(2'h2):(1'h0)];
  assign wire65 = (^wire41);
  assign wire66 = reg58[(1'h0):(1'h0)];
endmodule
