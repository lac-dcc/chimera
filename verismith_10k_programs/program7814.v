module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire8;
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  assign y = {wire138,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire8,
                 reg139,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg5,
                 reg6,
                 reg7,
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
                 reg20,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2[(1'h1):(1'h0)];
      reg6 <= $signed($unsigned((($signed(wire4) ?
              wire0[(2'h2):(1'h1)] : (wire4 ? (8'hb2) : wire3)) ?
          wire1 : wire0)));
      reg7 <= $unsigned($signed(wire3[(4'hb):(3'h4)]));
    end
  assign wire8 = wire1[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg9 <= (!wire8[(4'hd):(4'hb)]);
      reg10 <= $signed($signed(((-reg7[(4'h9):(3'h7)]) ?
          {$unsigned(wire2)} : $signed({reg7}))));
      reg11 <= (|{($signed({(8'hbc), wire8}) - reg10),
          {reg7[(3'h7):(1'h1)], (^$unsigned(reg9))}});
      reg12 <= {$signed({{(wire0 ~^ wire4)}}), reg9};
      if ((!(~^reg7[(1'h1):(1'h1)])))
        begin
          reg13 <= {(&($signed((~&(8'hb4))) != {((8'hb0) ? reg9 : wire1)}))};
          if (reg12[(1'h0):(1'h0)])
            begin
              reg14 <= (&$signed($signed(wire3[(4'he):(2'h3)])));
              reg15 <= $unsigned($signed($unsigned(reg9)));
            end
          else
            begin
              reg14 <= (~^reg5);
            end
          reg16 <= reg11;
          if (wire2)
            begin
              reg17 <= (reg12[(4'h9):(3'h7)] ?
                  $signed({(-$signed(reg12)), $signed({wire0})}) : wire0);
              reg18 <= (!reg10);
              reg19 <= wire3[(4'he):(1'h0)];
              reg20 <= reg9[(3'h6):(1'h1)];
            end
          else
            begin
              reg17 <= $signed($signed(((~&(reg17 ? wire0 : reg9)) ?
                  wire0[(3'h6):(1'h0)] : reg18)));
              reg18 <= wire8;
              reg19 <= (~^{reg7});
              reg20 <= $signed((reg7 ?
                  $unsigned(wire3[(4'hb):(4'ha)]) : (wire0 ?
                      ((!wire8) ? (-(8'ha2)) : wire3) : wire8)));
              reg21 <= (wire0[(3'h4):(2'h3)] != ($signed(reg17) ?
                  $unsigned((-reg15[(4'h8):(1'h1)])) : reg14));
            end
        end
      else
        begin
          reg13 <= ($signed((^({reg5} != (wire1 - reg19)))) ?
              wire1 : ((^~$signed(reg10)) ?
                  reg19 : $unsigned({$unsigned(wire0)})));
          reg14 <= (reg17 ?
              ($unsigned($unsigned($unsigned((8'ha8)))) ~^ wire8[(3'h4):(3'h4)]) : wire1);
          reg15 <= ((~&reg12) ?
              wire3[(3'h5):(1'h1)] : (reg6[(1'h1):(1'h1)] <<< reg9[(3'h4):(1'h0)]));
          reg16 <= (-(reg16 > reg14));
        end
    end
  module22 #() modinst121 (wire120, clk, reg15, reg9, reg12, wire3, wire8);
  assign wire122 = (reg9 ?
                       ($signed(reg14) >= reg19) : ((({reg9, (8'had)} ?
                               (-wire8) : {reg17}) ?
                           ((wire120 >> reg15) & wire3[(4'hf):(3'h7)]) : (+(~|(8'ha4)))) < ($signed(reg7[(4'h9):(2'h3)]) > (-wire120))));
  assign wire123 = (^~(!(&wire122[(3'h4):(3'h4)])));
  assign wire124 = {wire1[(2'h2):(1'h1)]};
  assign wire125 = (!reg7);
  assign wire126 = ((((|wire125) || $signed((reg19 ^ reg10))) * {(~&{reg15,
                               (8'hab)})}) ?
                       (reg20[(3'h7):(2'h3)] | reg5[(4'hd):(1'h1)]) : ((reg21[(1'h0):(1'h0)] >= ($signed(wire8) ?
                           wire3[(3'h7):(3'h6)] : (reg15 ^~ (8'hbc)))) ~^ (~^($unsigned(reg16) ?
                           $unsigned(wire1) : {(8'hbb), reg18}))));
  always
    @(posedge clk) begin
      reg127 <= (!$signed(reg17));
      if ($unsigned((wire124 * ($signed((wire8 + (8'hbc))) ?
          $signed(wire3) : (8'ha4)))))
        begin
          reg128 <= (~|(^(!$unsigned({wire122}))));
          reg129 <= $unsigned($unsigned($unsigned($unsigned((~&reg20)))));
          reg130 <= wire125;
          reg131 <= reg17[(2'h3):(2'h2)];
          reg132 <= ((~|(reg18[(2'h2):(2'h2)] < {((8'ha6) <= reg5),
              {wire1, reg21}})) <= ((((reg20 * wire8) ?
                  (&reg5) : reg12[(4'he):(4'hb)]) ?
              (reg11 ?
                  $unsigned(reg6) : (~reg127)) : reg12) - reg15[(3'h4):(1'h1)]));
        end
      else
        begin
          reg128 <= reg5;
          if ((reg18 == (((~^(7'h43)) != reg13[(3'h5):(1'h1)]) ?
              $unsigned((!(~&reg14))) : (!reg9[(5'h13):(4'h8)]))))
            begin
              reg129 <= (($unsigned($signed($signed(reg129))) << $unsigned(reg13)) ?
                  reg127 : $unsigned(reg129));
            end
          else
            begin
              reg129 <= $unsigned($signed(($unsigned($signed(wire120)) <= (8'ha9))));
              reg130 <= reg6;
              reg131 <= $signed(reg6[(3'h5):(3'h5)]);
            end
          reg132 <= {(~reg18),
              (((((8'hbd) ? wire120 : wire124) * (reg12 | wire126)) ?
                  wire8 : $signed(wire8)) <<< reg12[(5'h15):(5'h13)])};
          reg133 <= $signed((reg15[(4'ha):(2'h2)] ?
              (!wire120[(3'h5):(1'h1)]) : reg130[(3'h7):(3'h4)]));
          reg134 <= (wire8 < $signed(reg130));
        end
      reg135 <= (reg16[(2'h2):(1'h1)] <= (reg18 ?
          $signed(reg16) : {(-(reg9 * wire120)), $signed((wire4 * reg15))}));
      reg136 <= ($signed(wire120[(1'h1):(1'h0)]) ?
          $unsigned({$signed((8'hbf))}) : (~|$signed(reg132)));
      reg137 <= ($unsigned(reg127) && $unsigned((reg127 ?
          ($signed(reg127) ? reg6 : $unsigned(reg128)) : $signed(reg21))));
    end
  assign wire138 = (reg132 ?
                       {$signed($signed(wire2[(3'h4):(2'h2)])),
                           ($signed((&reg130)) == (reg131[(2'h3):(2'h3)] ?
                               (reg135 ?
                                   reg17 : reg21) : (~|wire1)))} : (!($unsigned((wire1 ~^ reg127)) ?
                           ((reg9 ? reg13 : reg13) ?
                               $unsigned(wire120) : (wire3 > (8'haa))) : $signed(reg133[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg139 <= $signed(reg12[(5'h10):(3'h4)]);
    end
endmodule

module module22  (y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire117;
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  assign y = {wire119,
                 wire50,
                 wire52,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire63,
                 wire82,
                 wire117,
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
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg53,
                 (1'h0)};
  module28 #() modinst51 (.wire30(wire27), .clk(clk), .wire31(wire24), .wire29(wire25), .y(wire50), .wire32(wire26));
  assign wire52 = ($unsigned($signed(($unsigned(wire23) ?
                          wire23 : $signed(wire25)))) ?
                      ((((wire25 ^~ wire23) ?
                              {(8'ha6)} : (^~wire25)) ^~ ((wire26 < wire23) <<< wire23[(2'h2):(1'h1)])) ?
                          wire26 : (8'hbc)) : (+$unsigned($signed(((8'hb5) ^~ wire50)))));
  always
    @(posedge clk) begin
      reg53 <= $unsigned(($unsigned($signed((wire24 <= wire27))) && ($unsigned($unsigned((8'hb6))) + wire25)));
    end
  assign wire54 = reg53[(4'h8):(3'h4)];
  assign wire55 = wire27[(3'h6):(3'h4)];
  assign wire56 = $unsigned($unsigned($unsigned((8'hb5))));
  assign wire57 = wire26;
  always
    @(posedge clk) begin
      reg58 <= ((^wire52) || (^~$unsigned(wire50[(5'h12):(3'h6)])));
      if ((|$unsigned((wire24 ? $signed(reg58) : (&wire54[(4'ha):(4'h9)])))))
        begin
          reg59 <= $unsigned(($signed(((wire56 ?
              (8'hb0) : wire57) * wire27[(3'h4):(3'h4)])) ^~ (((reg53 <<< wire25) ?
                  $signed(wire56) : wire50) ?
              ((wire54 == reg58) ?
                  ((8'ha2) ~^ wire56) : $unsigned(wire50)) : ({wire56,
                  wire24} && (wire25 ? wire52 : (8'hb8))))));
          reg60 <= $signed($signed(((-reg58) ?
              $unsigned((wire56 ? wire24 : wire52)) : (~|$signed(wire27)))));
        end
      else
        begin
          reg59 <= $unsigned(reg53);
          reg60 <= $unsigned(wire24[(3'h5):(3'h4)]);
          reg61 <= (~|reg59);
          reg62 <= $unsigned((-(~wire50[(3'h4):(1'h1)])));
        end
    end
  assign wire63 = (~&$signed($signed(wire24[(5'h10):(3'h7)])));
  always
    @(posedge clk) begin
      if ((^wire52))
        begin
          reg64 <= (wire52 ? reg61 : (8'hb7));
          reg65 <= (-$signed($unsigned(({(8'ha5)} ?
              ((8'hb5) | wire23) : reg61))));
          reg66 <= wire57;
          reg67 <= wire23[(3'h5):(1'h1)];
          if (wire56)
            begin
              reg68 <= $signed(wire52[(2'h2):(1'h1)]);
              reg69 <= reg58[(1'h0):(1'h0)];
            end
          else
            begin
              reg68 <= (~^($unsigned({(reg69 ? reg67 : reg60)}) || (((~^reg61) ?
                      (~&wire25) : (^~wire52)) ?
                  $signed((wire63 + wire25)) : $signed($signed((8'ha6))))));
              reg69 <= reg66;
              reg70 <= ((&reg62[(2'h2):(1'h1)]) ?
                  ($unsigned(($unsigned(reg66) ?
                          reg60[(4'hf):(3'h5)] : (reg60 & wire50))) ?
                      (wire50[(5'h10):(2'h3)] ?
                          $signed((reg53 >> reg58)) : ((reg67 ?
                                  wire57 : wire52) ?
                              (reg59 <<< (7'h41)) : $unsigned(reg69))) : (8'hbb)) : $signed($unsigned($unsigned(wire50[(1'h0):(1'h0)]))));
              reg71 <= $signed($unsigned(wire27));
              reg72 <= wire50;
            end
        end
      else
        begin
          reg64 <= $signed(($unsigned(wire26) < (($unsigned(reg61) | (reg71 >= reg58)) < {{wire54}})));
        end
      reg73 <= wire25;
      reg74 <= reg65;
      if (reg66[(4'h9):(3'h4)])
        begin
          reg75 <= {$unsigned(reg71), wire23[(3'h5):(2'h3)]};
          reg76 <= reg71[(4'h8):(2'h3)];
          reg77 <= wire24[(5'h10):(4'hf)];
        end
      else
        begin
          reg75 <= ((~|reg74[(3'h6):(2'h2)]) ?
              $signed({(reg70[(4'ha):(4'ha)] << wire54)}) : ((!$signed($unsigned(reg53))) ?
                  ({wire26} ?
                      (|((7'h44) ?
                          wire57 : reg73)) : (+(reg76 >>> reg62))) : $signed((^~$signed(wire63)))));
          reg76 <= $unsigned(wire57[(2'h2):(1'h1)]);
          if ({(reg74 ?
                  ($unsigned(((8'ha2) ? wire52 : reg69)) <= (reg76 ?
                      wire55[(2'h2):(2'h2)] : (~|reg64))) : (-{(^wire56)}))})
            begin
              reg77 <= wire24[(5'h12):(3'h6)];
              reg78 <= (|(8'hb9));
              reg79 <= ($signed($unsigned($unsigned(reg76))) + ({$unsigned(wire54),
                      ($unsigned((8'hae)) || $signed(reg60))} ?
                  (($unsigned((8'hbb)) ?
                      $unsigned(reg60) : reg73[(5'h11):(1'h0)]) | $unsigned($unsigned(reg77))) : (wire26[(4'h9):(4'h9)] ?
                      reg67 : wire55[(1'h1):(1'h1)])));
              reg80 <= $unsigned(({{wire56[(4'hf):(4'h9)],
                      $signed((8'hb0))}} >= reg66));
            end
          else
            begin
              reg77 <= (((((reg74 ? (7'h41) : wire57) - (!reg77)) ?
                      (reg74[(1'h1):(1'h1)] + $signed((8'h9f))) : ((reg58 ?
                          reg76 : reg72) >>> wire27[(4'h8):(3'h5)])) == wire55[(2'h3):(1'h1)]) ?
                  wire57[(2'h2):(2'h2)] : reg66);
              reg78 <= wire52[(3'h6):(3'h5)];
            end
        end
      reg81 <= $signed((~&wire23[(2'h2):(1'h0)]));
    end
  assign wire82 = reg71[(4'hd):(4'h8)];
  module83 #() modinst118 (.wire85(wire27), .wire84(reg75), .y(wire117), .wire86(wire24), .wire87(reg60), .wire88(wire23), .clk(clk));
  assign wire119 = reg59;
endmodule

module module83
#(parameter param115 = (+((8'ha5) ^~ ({((8'had) - (8'ha8)), (~^(7'h44))} < ((~(8'ha8)) ? ((8'h9d) ? (8'ha8) : (8'h9f)) : ((8'hb9) ? (8'haa) : (8'hb1)))))), 
parameter param116 = (^(({(8'hbc), {param115}} >> ((~param115) ? (param115 || param115) : (8'hb4))) <= ((~^param115) ^~ ((param115 ? (7'h40) : (8'hb9)) ^ ((8'hb3) ? param115 : param115))))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire [(5'h15):(1'h0)] wire87;
  input wire signed [(5'h12):(1'h0)] wire86;
  input wire signed [(4'hf):(1'h0)] wire85;
  input wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire90,
                 wire89,
                 reg112,
                 reg111,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire89 = $unsigned(($signed(wire85[(3'h6):(1'h1)]) ?
                      {{(+wire85)}} : ((&((8'hb5) ? (8'haa) : wire84)) ?
                          wire88 : $unsigned((wire88 + wire84)))));
  assign wire90 = $signed((7'h44));
  always
    @(posedge clk) begin
      reg91 <= (wire89[(1'h1):(1'h0)] >> (|$signed((&{wire88}))));
      if (($unsigned(($unsigned((^wire84)) << {(wire86 ? wire84 : wire90),
              $unsigned(wire89)})) ?
          $signed((^~(reg91[(5'h10):(4'hf)] + $unsigned(wire90)))) : (~$unsigned(($signed(reg91) ?
              {(8'hbd)} : $unsigned(wire87))))))
        begin
          if (wire87)
            begin
              reg92 <= {(($unsigned($signed(wire90)) | ($signed(wire89) ?
                      ((8'haf) ?
                          wire87 : (7'h42)) : wire85[(3'h7):(3'h7)])) <<< $unsigned(wire85))};
              reg93 <= $unsigned(((((~^wire88) ?
                          (wire88 && wire87) : {wire86}) ?
                      wire84 : ($signed(wire88) ?
                          $unsigned(reg92) : (+wire84))) ?
                  {((+wire90) & wire87),
                      (~|((8'hac) ?
                          wire85 : (8'hb1)))} : (reg91 <<< $unsigned($signed((8'ha7))))));
            end
          else
            begin
              reg92 <= {(wire88[(1'h0):(1'h0)] ?
                      $signed(($unsigned(wire84) ?
                          $signed(reg91) : (~&reg92))) : (((wire90 ?
                                  reg92 : wire85) ?
                              (~wire84) : wire86) ?
                          wire90[(3'h6):(3'h4)] : {(wire87 ?
                                  wire84 : wire87)})),
                  {(wire87 >= {$unsigned(reg91), ((8'hbe) ~^ wire89)})}};
              reg93 <= $signed(wire90[(2'h2):(2'h2)]);
              reg94 <= $unsigned($unsigned(wire88[(3'h6):(3'h5)]));
              reg95 <= (reg94[(1'h0):(1'h0)] ?
                  (-({reg92[(3'h4):(3'h4)]} ?
                      ($signed(wire86) | (8'hbd)) : $unsigned($unsigned(wire85)))) : (|wire85[(4'h8):(2'h2)]));
              reg96 <= ((~&({(wire90 ? reg95 : wire87), reg95[(2'h2):(2'h2)]} ?
                  {$unsigned(wire88),
                      (~&reg93)} : $unsigned($signed((8'hb3))))) << (^reg93));
            end
        end
      else
        begin
          if ((-(+(^~({wire85, reg92} > (^reg91))))))
            begin
              reg92 <= $unsigned($signed(reg96[(2'h2):(1'h1)]));
            end
          else
            begin
              reg92 <= (&($unsigned($unsigned($unsigned(wire86))) * {reg91[(4'he):(3'h7)],
                  {wire84[(1'h0):(1'h0)], {wire84, reg92}}}));
              reg93 <= {($unsigned((reg95 >> (wire86 ? reg93 : (8'hbb)))) ?
                      $signed({$unsigned(reg93),
                          $unsigned(reg94)}) : wire88[(3'h6):(1'h1)])};
              reg94 <= reg93;
            end
        end
      reg97 <= $signed({{((wire89 & reg93) ?
                  (~&wire86) : (reg92 != (8'h9f)))}});
      if (reg92[(4'hb):(2'h2)])
        begin
          reg98 <= (^reg92);
          reg99 <= $signed($unsigned(reg97[(3'h7):(1'h0)]));
          reg100 <= wire85;
        end
      else
        begin
          reg98 <= {(~^wire90[(4'h8):(4'h8)]), reg95[(1'h1):(1'h0)]};
          reg99 <= ((8'hb1) >> (wire85 ?
              ((reg100 ? wire84[(4'he):(2'h3)] : reg93[(2'h2):(1'h0)]) ?
                  ($unsigned(wire86) | (&wire86)) : reg97[(3'h5):(1'h0)]) : (((reg94 ?
                      reg98 : reg91) ?
                  $unsigned((8'hbb)) : reg96) + ($unsigned(wire85) || wire90))));
          reg100 <= reg93[(2'h3):(2'h3)];
          reg101 <= (-(|(reg95 >= $signed((~wire89)))));
          reg102 <= $signed((&reg91));
        end
      reg103 <= reg91;
    end
  assign wire104 = $signed($unsigned($signed((reg101[(2'h2):(1'h0)] == (wire85 ?
                       (8'hb4) : (8'hb0))))));
  assign wire105 = {wire85[(2'h2):(1'h1)]};
  assign wire106 = (8'hbe);
  assign wire107 = ((8'haf) ?
                       (reg99 > reg91[(3'h6):(2'h2)]) : (-{($signed(reg93) == $signed(reg101)),
                           (^$unsigned(wire89))}));
  assign wire108 = (&(-($unsigned($unsigned(wire86)) ?
                       {$signed(wire90),
                           (wire105 + wire105)} : $unsigned((!wire87)))));
  assign wire109 = {({((wire87 >= (8'ha8)) ? {reg92} : wire86),
                           ((!wire85) * wire107)} || (-(reg95 >= wire90[(4'hb):(1'h0)])))};
  assign wire110 = $signed({$signed($signed($unsigned(reg103))),
                       wire89[(2'h3):(1'h1)]});
  always
    @(posedge clk) begin
      reg111 <= wire106;
      reg112 <= wire108[(3'h4):(2'h2)];
    end
  assign wire113 = (8'ha3);
  assign wire114 = ($signed(($unsigned($signed((8'hb1))) == wire113)) != {(-{((8'ha0) ^~ reg97),
                           wire108})});
endmodule

module module28
#(parameter param49 = (7'h43))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = (wire31[(2'h2):(1'h1)] ?
                      wire29 : $unsigned(($signed($signed(wire32)) << {{wire32,
                              (8'hb1)}})));
  assign wire34 = wire29;
  assign wire35 = $unsigned(wire33[(1'h0):(1'h0)]);
  assign wire36 = wire31;
  assign wire37 = $unsigned(wire33);
  assign wire38 = (((-(|(wire34 ? wire35 : wire35))) ~^ wire37) ?
                      $signed((wire31 <= $unsigned((~^wire34)))) : ($signed(wire36) - ((wire35[(3'h4):(1'h1)] > $unsigned(wire33)) ?
                          $unsigned((+wire30)) : $signed(wire29))));
  assign wire39 = $signed((~^wire32[(3'h4):(2'h2)]));
  assign wire40 = (wire33 != (wire36 ?
                      wire38 : $signed($signed($signed(wire36)))));
  assign wire41 = $unsigned((((wire40[(3'h5):(2'h3)] ?
                          wire34[(3'h4):(1'h0)] : $unsigned(wire33)) ?
                      wire40 : (wire38[(2'h3):(1'h1)] ?
                          $unsigned(wire39) : $signed(wire39))) <= wire29));
  assign wire42 = ((~wire37[(5'h12):(5'h10)]) ?
                      wire35 : ((|wire40) - (^{$unsigned(wire39)})));
  assign wire43 = $signed(wire30[(4'h8):(1'h1)]);
  assign wire44 = wire29;
  assign wire45 = $unsigned(((^~((8'haa) ?
                      (~|wire34) : (wire37 - wire43))) >= (~&(~|(~^wire35)))));
  assign wire46 = ($signed(wire42[(1'h0):(1'h0)]) ?
                      (~|$signed((~^((8'ha7) * wire33)))) : (^($signed((wire32 <<< wire45)) | {wire29,
                          $signed((8'hb6))})));
  assign wire47 = {$unsigned($signed((wire32[(2'h3):(1'h0)] ?
                          wire33 : (~|wire40)))),
                      wire32[(3'h4):(2'h2)]};
  assign wire48 = (((wire40 < (wire30[(4'h8):(3'h4)] ?
                      wire32[(2'h2):(2'h2)] : $unsigned(wire40))) <= (^$signed((!wire35)))) ^ wire43[(5'h11):(2'h3)]);
endmodule
