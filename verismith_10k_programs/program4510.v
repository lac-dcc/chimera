module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire160;
  wire signed [(4'hb):(1'h0)] wire159;
  wire signed [(4'h9):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire148;
  wire signed [(3'h6):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire153,
                 wire148,
                 wire147,
                 wire146,
                 wire144,
                 wire4,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg156,
                 reg155,
                 reg154,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire4 = wire3[(4'h8):(3'h5)];
  module5 #() modinst145 (.wire8(wire4), .wire6(wire3), .wire7(wire1), .y(wire144), .wire9(wire2), .clk(clk));
  assign wire146 = {$signed($unsigned((wire1 ?
                           (wire0 ? wire2 : wire0) : (wire3 >>> wire2))))};
  assign wire147 = wire3[(5'h11):(2'h3)];
  assign wire148 = $unsigned(wire144);
  always
    @(posedge clk) begin
      if (wire148[(1'h1):(1'h1)])
        begin
          reg149 <= wire144[(4'hf):(2'h2)];
          reg150 <= ($signed(($unsigned({wire0}) << (8'hbc))) && wire3);
          reg151 <= reg150;
        end
      else
        begin
          reg149 <= ($signed($signed((~reg149))) | $signed($signed({$signed((8'hb4)),
              (wire3 & wire148)})));
          reg150 <= {{($signed(reg150) | (|wire4[(3'h5):(1'h0)]))}, wire148};
        end
      reg152 <= $unsigned({wire1[(3'h6):(3'h6)], wire144[(3'h6):(2'h3)]});
    end
  assign wire153 = (wire147[(2'h3):(1'h1)] ?
                       (-(wire2[(1'h1):(1'h1)] && (!$unsigned(wire0)))) : $signed(wire146[(3'h7):(2'h3)]));
  always
    @(posedge clk) begin
      reg154 <= (~({($unsigned(reg152) ?
              (wire4 ? wire0 : wire146) : $unsigned(wire146)),
          $unsigned(wire148[(2'h2):(2'h2)])} > (wire0[(2'h3):(1'h0)] > wire153)));
      reg155 <= (8'hb3);
      reg156 <= ((^~(8'ha0)) < $signed($unsigned((!$unsigned(wire3)))));
    end
  assign wire157 = $unsigned((-$unsigned($unsigned(wire1))));
  assign wire158 = $signed((reg154[(3'h4):(2'h3)] == $unsigned(($signed(wire157) ?
                       (8'h9c) : $signed(wire157)))));
  assign wire159 = (^$signed((reg150[(2'h2):(1'h0)] ?
                       $signed((!(7'h41))) : wire144)));
  assign wire160 = reg151[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg161 <= (8'hb9);
      if ($unsigned((|wire0)))
        begin
          reg162 <= (|reg156[(2'h2):(1'h1)]);
          reg163 <= $signed((~|(reg151 ?
              (-$signed(wire159)) : wire160[(3'h6):(2'h2)])));
          reg164 <= reg149;
        end
      else
        begin
          reg162 <= reg150[(4'hc):(4'hc)];
          reg163 <= (wire2 ?
              $unsigned((reg150 ?
                  reg149[(1'h0):(1'h0)] : $unsigned($unsigned(reg163)))) : wire3[(5'h11):(4'h9)]);
        end
    end
endmodule

module module5
#(parameter param142 = (((~^(((8'ha5) ? (8'ha4) : (8'had)) ? ((8'hac) > (8'h9c)) : ((7'h41) ? (8'hab) : (8'h9f)))) != (&((~(8'hb3)) ? ((8'hbf) & (8'ha3)) : ((7'h42) * (8'ha1))))) ^~ (8'hae)), 
parameter param143 = (8'haa))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  wire [(5'h12):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  assign y = {wire141,
                 wire140,
                 wire138,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = $unsigned(wire8[(2'h2):(1'h1)]);
  assign wire11 = (&wire8);
  module12 #() modinst43 (wire42, clk, wire8, wire9, wire10, wire11);
  assign wire44 = $unsigned((wire7 ?
                      $signed({(~&wire7),
                          {wire6, (8'hbb)}}) : $unsigned($signed(wire9))));
  assign wire45 = wire11;
  assign wire46 = ($signed(wire7) <= wire6);
  assign wire47 = wire7[(2'h3):(2'h2)];
  assign wire48 = wire8;
  assign wire49 = ((wire45 ?
                      (8'haf) : wire42[(3'h7):(3'h7)]) ^ (wire10[(4'ha):(1'h0)] > wire42[(4'hd):(3'h4)]));
  module50 #() modinst139 (wire138, clk, wire48, wire45, wire11, wire6);
  assign wire140 = (^wire49[(3'h6):(3'h6)]);
  assign wire141 = (~(wire8 < {{(wire45 >>> wire9), wire10},
                       $signed((~^wire48))}));
endmodule

module module50
#(parameter param137 = ((+((8'hb1) ? (((8'had) ? (8'hbd) : (8'ha3)) && (8'h9c)) : (((8'hab) & (8'ha5)) ? (^~(8'ha7)) : ((8'hab) ? (8'hb5) : (8'haa))))) | (((((8'hb6) ? (8'h9d) : (8'ha5)) - (&(8'hb3))) ? ((~(8'hae)) <<< (^~(8'hb6))) : (^((8'hbb) || (7'h43)))) ? (^(((8'hac) >= (8'h9d)) ^~ ((8'hb6) - (8'ha7)))) : (((^(8'ha1)) | ((8'hbc) ~^ (8'ha1))) ? (((8'ha5) ? (8'hbe) : (8'hb0)) ? (~&(8'ha4)) : ((8'h9c) != (8'ha4))) : ((~^(7'h42)) ^~ ((8'hba) ? (8'h9e) : (8'ha0)))))))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h38c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire54;
  input wire [(4'he):(1'h0)] wire53;
  input wire [(4'ha):(1'h0)] wire52;
  input wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(5'h10):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire58;
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  assign y = {wire136,
                 wire119,
                 wire118,
                 wire101,
                 wire100,
                 wire99,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire58,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg117,
                 reg116,
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
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg98,
                 reg97,
                 reg96,
                 reg87,
                 reg86,
                 reg85,
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
                 reg71,
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
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg55 <= {wire51[(4'hc):(3'h7)]};
      reg56 <= wire51[(4'h8):(3'h7)];
      reg57 <= $unsigned(($signed(wire54[(5'h11):(5'h10)]) ?
          ((reg55[(4'hc):(4'hc)] ?
              wire54[(4'h9):(3'h4)] : {(8'h9e)}) <= $unsigned(wire52[(3'h4):(1'h0)])) : wire53));
    end
  assign wire58 = ($signed(($signed($signed((8'ha1))) && wire53[(4'ha):(3'h7)])) ?
                      {((&$signed(reg57)) >>> $unsigned(wire51)),
                          $signed($unsigned($unsigned((8'h9f))))} : $unsigned($signed(wire52)));
  always
    @(posedge clk) begin
      if ($signed($signed(reg55)))
        begin
          if (({($signed((wire52 || reg55)) | (wire51[(2'h2):(2'h2)] | (wire58 >>> reg55)))} ?
              (&(8'haa)) : {((-(8'hb6)) ^~ ($signed((7'h44)) > (wire58 ?
                      wire52 : (8'hae))))}))
            begin
              reg59 <= (^$unsigned((wire54 == (((8'h9f) ?
                  (8'hb1) : reg55) - (reg57 + reg55)))));
              reg60 <= {$signed(((reg56[(5'h10):(4'ha)] ?
                      wire52[(1'h1):(1'h1)] : (^~reg56)) <= wire52[(2'h3):(2'h2)])),
                  $signed({reg57})};
            end
          else
            begin
              reg59 <= wire58;
              reg60 <= $unsigned({(reg57[(3'h7):(1'h0)] == wire54), reg60});
              reg61 <= wire54[(4'hc):(4'hc)];
            end
          if ((wire52 ~^ (reg56[(3'h5):(3'h5)] < reg55[(4'hf):(4'h9)])))
            begin
              reg62 <= {reg56[(3'h7):(3'h4)]};
              reg63 <= {(7'h44)};
            end
          else
            begin
              reg62 <= (-{({(^~(7'h44)), $signed(reg55)} - reg55)});
              reg63 <= reg60[(1'h0):(1'h0)];
              reg64 <= {($signed((~&(reg63 + wire58))) ?
                      reg61[(1'h0):(1'h0)] : wire51[(4'ha):(1'h1)]),
                  (reg63[(1'h1):(1'h1)] ^ reg63)};
              reg65 <= $unsigned((reg64[(2'h3):(2'h3)] ?
                  $unsigned((!(!wire51))) : ((^(8'h9e)) ?
                      ((~^wire58) >> ((8'h9d) ?
                          wire53 : wire52)) : reg57[(3'h5):(2'h2)])));
            end
          if (reg61[(2'h3):(2'h2)])
            begin
              reg66 <= $unsigned($unsigned((~&reg63)));
              reg67 <= ((8'ha1) ? $signed($signed({reg55})) : reg62);
              reg68 <= ($signed((|reg64)) ?
                  ((reg62[(3'h6):(3'h6)] ?
                      {wire58[(1'h1):(1'h1)],
                          {wire51, reg64}} : (reg59[(2'h2):(2'h2)] ?
                          reg67[(3'h6):(3'h4)] : reg65[(5'h15):(4'h8)])) * $signed($unsigned((reg65 ?
                      reg65 : reg56)))) : {reg61[(2'h2):(1'h0)]});
              reg69 <= {$unsigned($unsigned($signed((reg64 >> reg65))))};
            end
          else
            begin
              reg66 <= $unsigned(wire54);
              reg67 <= reg65;
              reg68 <= ((^$signed((~|reg62[(1'h1):(1'h1)]))) * (wire53 >>> $unsigned(((+reg61) == $unsigned((8'h9d))))));
              reg69 <= $signed(wire54);
              reg70 <= (~^$unsigned({{(~reg59)},
                  $signed(((8'hac) ? (8'hba) : (8'h9d)))}));
            end
          reg71 <= $signed((8'hb6));
          reg72 <= {reg68[(5'h12):(4'hd)]};
        end
      else
        begin
          if ($signed(((^$signed(reg56[(4'ha):(2'h2)])) ?
              (^((^~reg70) ?
                  wire51[(4'h9):(3'h4)] : $signed(reg59))) : $unsigned((~&$signed(reg62))))))
            begin
              reg59 <= (reg69 ?
                  ($signed((wire53[(1'h0):(1'h0)] | $unsigned(reg63))) ?
                      (!wire53) : ($unsigned((reg70 ? reg64 : reg65)) ?
                          ((wire58 * reg70) ~^ $unsigned(reg64)) : reg68[(4'hb):(3'h4)])) : (~(~^reg60)));
              reg60 <= $signed(reg61);
              reg61 <= reg71;
            end
          else
            begin
              reg59 <= reg69[(4'h8):(3'h6)];
              reg60 <= reg72[(2'h3):(1'h0)];
              reg61 <= reg63;
              reg62 <= reg59[(4'hb):(3'h5)];
              reg63 <= $unsigned($unsigned($unsigned(reg72)));
            end
          reg64 <= (wire54 ?
              reg62[(3'h5):(3'h5)] : (wire52 ?
                  (~&($unsigned(wire51) ?
                      {reg62,
                          reg68} : wire58[(3'h6):(1'h1)])) : ($unsigned($signed(reg69)) ?
                      reg69[(3'h5):(3'h5)] : ($signed(reg68) ?
                          (^reg60) : (reg65 & reg57)))));
          reg65 <= $unsigned((!(-$unsigned(((7'h43) + wire58)))));
        end
      reg73 <= $signed({(((+reg56) & wire58[(1'h1):(1'h0)]) ?
              $unsigned(reg67) : (|((7'h41) ? reg60 : reg64))),
          reg68});
      if (reg66[(2'h2):(1'h1)])
        begin
          if (reg62[(1'h0):(1'h0)])
            begin
              reg74 <= (&reg61[(2'h3):(2'h2)]);
              reg75 <= $unsigned(reg68);
              reg76 <= reg69;
              reg77 <= wire52[(3'h4):(1'h1)];
              reg78 <= $unsigned((~|{reg75,
                  ($signed(reg61) ? (reg62 < reg71) : (~|reg60))}));
            end
          else
            begin
              reg74 <= $signed(((~$unsigned(reg61[(2'h2):(1'h0)])) ?
                  reg73[(5'h10):(3'h7)] : reg65));
              reg75 <= reg74[(4'ha):(1'h0)];
            end
        end
      else
        begin
          reg74 <= reg63;
        end
      if (reg71[(2'h3):(1'h0)])
        begin
          if (reg74[(4'h9):(1'h1)])
            begin
              reg79 <= ($signed(reg65) && {reg55[(3'h5):(1'h0)],
                  (~^wire54[(4'hf):(4'he)])});
            end
          else
            begin
              reg79 <= $signed((+$unsigned($signed({(8'h9c)}))));
              reg80 <= $unsigned(reg63[(1'h1):(1'h0)]);
              reg81 <= reg77[(3'h5):(2'h3)];
              reg82 <= reg65[(3'h7):(3'h5)];
            end
          reg83 <= reg56[(4'hb):(3'h5)];
          reg84 <= (!(~|(((&reg56) ? reg73[(4'h9):(3'h7)] : (wire58 & reg73)) ?
              $unsigned((reg79 ^ reg55)) : (^~$unsigned(reg65)))));
          if ($signed(({$signed($unsigned(reg72))} != $signed($signed($unsigned(wire52))))))
            begin
              reg85 <= {(&$unsigned($unsigned($signed(reg68)))),
                  reg62[(3'h5):(2'h2)]};
              reg86 <= reg85;
              reg87 <= reg62;
            end
          else
            begin
              reg85 <= $unsigned(wire53[(4'hc):(1'h0)]);
              reg86 <= (((|((reg86 ?
                  (7'h43) : reg86) != (&(8'ha9)))) << ({(~&reg61)} ?
                  $signed($unsigned(reg61)) : ($signed(reg82) ?
                      wire51[(3'h7):(2'h2)] : reg70[(3'h4):(2'h3)]))) ~^ (&(((^reg62) - (reg73 * (8'hba))) ?
                  ((reg71 ?
                      reg72 : reg66) == (~|wire58)) : $signed((~^reg60)))));
            end
        end
      else
        begin
          reg79 <= ($unsigned($unsigned(reg78)) ?
              {(($unsigned(reg69) && {reg62, (8'hb8)}) <= reg77[(3'h5):(2'h2)]),
                  $unsigned((!(~&reg87)))} : $unsigned($signed({wire52[(3'h7):(1'h1)]})));
          if ($unsigned($signed(($signed((reg56 <<< reg71)) >>> reg66[(1'h1):(1'h0)]))))
            begin
              reg80 <= (~^wire53);
            end
          else
            begin
              reg80 <= {$unsigned($signed((+(~^reg63))))};
              reg81 <= $unsigned({reg57[(2'h2):(1'h0)]});
              reg82 <= ((reg63 ?
                      (reg59 ^ (&$signed(reg57))) : (((reg61 >= wire53) >> reg62) >> ((reg78 | reg87) ?
                          reg74 : (!(8'haf))))) ?
                  (~($unsigned((~|reg59)) ? (8'hb9) : (7'h41))) : {reg79});
              reg83 <= ({$signed($signed($unsigned((8'h9d))))} ?
                  reg78[(4'hc):(4'h9)] : {wire52[(4'ha):(3'h6)]});
            end
          reg84 <= ($signed(reg77[(3'h6):(1'h1)]) ?
              reg77[(3'h4):(3'h4)] : reg72[(2'h3):(1'h0)]);
        end
    end
  assign wire88 = (reg87 ?
                      ($signed(((reg60 & reg62) ? $signed(reg59) : (^~reg72))) ?
                          reg60 : (reg74 ^~ reg87[(3'h6):(3'h6)])) : $signed((reg73[(2'h3):(1'h1)] ?
                          ({reg64, reg63} ?
                              reg80 : (reg60 ? reg66 : reg55)) : ((reg56 ?
                              reg56 : reg68) << (reg55 | wire54)))));
  assign wire89 = ((reg55[(5'h10):(4'ha)] & $signed((&(~^reg79)))) ?
                      {{$signed((reg84 - reg77))}} : ($unsigned($signed(reg63)) ?
                          ((reg74 > (reg56 + reg81)) ^ reg66) : wire53[(1'h1):(1'h0)]));
  assign wire90 = (^($unsigned(((reg56 * reg86) == (reg83 ?
                      reg73 : (8'hb0)))) ~^ $unsigned(wire51[(4'hb):(1'h1)])));
  assign wire91 = (8'ha6);
  assign wire92 = reg78;
  assign wire93 = ((~&(7'h40)) & reg81[(4'hc):(4'hc)]);
  assign wire94 = reg61[(1'h0):(1'h0)];
  assign wire95 = ($signed(wire51) | (8'hba));
  always
    @(posedge clk) begin
      reg96 <= {$unsigned({$unsigned(reg64)}), wire92};
      reg97 <= wire90;
      reg98 <= (&$unsigned($unsigned($unsigned($unsigned(reg83)))));
    end
  assign wire99 = $signed($signed(($signed((8'ha8)) ?
                      ($unsigned(reg62) != (wire54 < wire95)) : $signed(reg74[(4'h9):(4'h8)]))));
  assign wire100 = $signed({$signed($unsigned($unsigned(reg69)))});
  assign wire101 = $unsigned(($signed(reg66) ?
                       wire52 : $unsigned((reg65 & (|reg68)))));
  always
    @(posedge clk) begin
      if ($signed((((8'hbf) << (reg63 & (reg67 ? reg63 : (8'h9c)))) - reg85)))
        begin
          if ((&{$signed({((8'hbd) ? reg86 : reg77)})}))
            begin
              reg102 <= reg82;
              reg103 <= (reg85[(1'h0):(1'h0)] ?
                  reg77[(2'h3):(2'h2)] : (({wire99[(1'h1):(1'h1)]} == $unsigned((-reg60))) || ((^(&reg86)) ?
                      $signed($unsigned(reg102)) : ($unsigned(reg63) > (8'ha2)))));
              reg104 <= reg83;
              reg105 <= reg67[(1'h1):(1'h0)];
            end
          else
            begin
              reg102 <= ((($unsigned((reg104 >>> reg83)) ^ reg103[(1'h0):(1'h0)]) << $signed(reg60[(4'hf):(4'hc)])) << reg57[(3'h7):(1'h1)]);
              reg103 <= (^$unsigned((|((&wire94) << $unsigned((8'hb7))))));
              reg104 <= reg63;
            end
          if ({reg57[(1'h1):(1'h0)]})
            begin
              reg106 <= reg57[(3'h6):(1'h1)];
              reg107 <= (reg97 >>> $signed(((reg62[(3'h6):(3'h5)] >>> (reg73 || reg80)) ?
                  {(~&wire54)} : reg96[(2'h3):(1'h1)])));
              reg108 <= (wire100[(3'h5):(1'h1)] ?
                  (reg55 <<< (^($unsigned(wire99) ^ (reg64 ?
                      reg86 : (8'hb0))))) : ($signed((&{reg102,
                      reg81})) <= wire51));
              reg109 <= {((~|(~&(+wire58))) || reg98[(1'h0):(1'h0)]),
                  $signed($signed(reg65))};
            end
          else
            begin
              reg106 <= reg66[(2'h2):(1'h1)];
              reg107 <= $unsigned(reg60);
              reg108 <= ((~|$unsigned((!reg107))) >= $signed($unsigned({$unsigned(wire100),
                  (^~wire100)})));
              reg109 <= $unsigned(reg59[(4'h9):(1'h0)]);
              reg110 <= reg65[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg102 <= (^{$signed(($unsigned(reg70) != (wire89 ?
                  (8'ha7) : reg59)))});
        end
      reg111 <= (~|reg97);
      reg112 <= ((+$unsigned(((wire58 && reg75) ?
              (reg65 ? reg61 : wire95) : reg61[(1'h0):(1'h0)]))) ?
          $signed((((8'h9c) ? (8'hb0) : reg67) ?
              $unsigned({reg62}) : $unsigned({reg96,
                  (8'hb3)}))) : wire92[(3'h5):(1'h0)]);
      if (($unsigned(reg107) | $signed(({(reg78 >> reg83), (reg77 >= reg79)} ?
          $signed((reg74 != reg81)) : wire53[(4'hd):(1'h1)]))))
        begin
          if (reg65)
            begin
              reg113 <= ((reg68[(2'h2):(1'h0)] ?
                  reg82[(4'h8):(3'h6)] : reg68[(3'h4):(1'h0)]) < $unsigned(reg72));
            end
          else
            begin
              reg113 <= $signed(reg56);
              reg114 <= (8'h9e);
              reg115 <= (reg70[(5'h12):(5'h11)] ?
                  reg107[(4'ha):(3'h4)] : reg113[(3'h4):(1'h0)]);
              reg116 <= $unsigned(((~|wire89) ? reg55[(4'h8):(4'h8)] : reg73));
            end
          reg117 <= (($unsigned($unsigned({reg116, reg108})) ?
              (8'hb6) : reg55) ^~ {(^~$unsigned(((8'haa) ? reg108 : wire94)))});
        end
      else
        begin
          reg113 <= reg81[(4'hc):(3'h4)];
        end
    end
  assign wire118 = $unsigned(wire93);
  assign wire119 = (7'h43);
  always
    @(posedge clk) begin
      reg120 <= $unsigned(($unsigned($signed($unsigned(reg57))) ?
          $signed($unsigned({reg59})) : $unsigned(({wire51} ?
              (reg116 + reg72) : (|(8'ha5))))));
      if (($signed((($signed(wire101) ?
              (reg120 << reg106) : (reg57 >>> (8'hb3))) ?
          (^~(wire52 >= reg82)) : $signed(reg114))) >> $unsigned((($signed(reg64) - reg60) >= (reg114[(2'h3):(1'h1)] <= reg86)))))
        begin
          reg121 <= (-{$unsigned(reg107)});
          reg122 <= reg65[(3'h5):(3'h5)];
          reg123 <= wire100;
        end
      else
        begin
          reg121 <= ($unsigned($unsigned((|reg103[(4'h8):(1'h1)]))) ?
              wire94[(3'h5):(3'h4)] : (!($unsigned($signed(reg106)) ^ ((~^wire53) ?
                  ((7'h43) ? reg109 : reg71) : (wire54 ^~ wire119)))));
        end
      if ((-reg115))
        begin
          reg124 <= (^wire58);
          if ($unsigned($signed((^~(reg120 <<< $unsigned(reg124))))))
            begin
              reg125 <= $signed(reg97[(3'h4):(2'h3)]);
            end
          else
            begin
              reg125 <= $unsigned(reg55);
              reg126 <= $unsigned(reg106);
            end
        end
      else
        begin
          if ((7'h40))
            begin
              reg124 <= $signed(reg105[(3'h5):(1'h1)]);
            end
          else
            begin
              reg124 <= $unsigned(wire119[(4'hc):(3'h5)]);
              reg125 <= ($signed(($signed($signed(wire101)) && $signed($unsigned(reg104)))) >= $signed((reg96 <<< ({wire95} ?
                  reg122 : $signed((8'ha3))))));
              reg126 <= reg106;
            end
          reg127 <= reg81;
          reg128 <= ({(reg98[(2'h2):(1'h0)] <<< {(reg102 ? reg106 : wire95),
                  (|reg112)})} >= (($unsigned($unsigned(wire95)) ?
              (reg59[(4'hb):(3'h4)] ?
                  reg110 : $unsigned(reg109)) : $unsigned(reg71)) >>> $unsigned($signed(reg113))));
          if ($signed({$signed(((8'hbd) != reg115[(4'h8):(1'h1)]))}))
            begin
              reg129 <= {(~&$unsigned(reg65[(4'he):(3'h6)])),
                  $unsigned($signed(reg74))};
              reg130 <= $unsigned($unsigned($signed(reg85)));
              reg131 <= $unsigned($unsigned($signed((^wire100))));
            end
          else
            begin
              reg129 <= $signed((~^reg74[(3'h4):(1'h1)]));
              reg130 <= (((8'hbb) > reg108[(1'h0):(1'h0)]) * $unsigned((($unsigned(reg130) ?
                      (reg129 ? reg82 : reg55) : reg108) ?
                  (reg106[(3'h4):(3'h4)] ?
                      $signed(wire92) : (reg114 > reg113)) : (!(8'hb0)))));
              reg131 <= ((^(reg56[(4'ha):(3'h7)] - reg80[(2'h2):(1'h1)])) || ($unsigned(wire90) ^ {($unsigned(reg126) & reg104[(1'h1):(1'h0)]),
                  (+(reg57 ? reg74 : reg113))}));
              reg132 <= $unsigned((8'hb5));
            end
          reg133 <= $unsigned((8'hbe));
        end
      reg134 <= $signed($signed(({(-reg112),
          (8'had)} > $signed((reg82 < reg106)))));
      reg135 <= $unsigned(wire53);
    end
  assign wire136 = $unsigned($signed(reg128));
endmodule

module module12
#(parameter param40 = ({((-{(8'hbb), (8'ha8)}) ^~ (-((8'ha9) ? (8'hb5) : (8'ha7))))} ? (!(+{{(8'haf)}, ((8'ha9) != (7'h40))})) : ((^~(~&(8'h9d))) ? ({((7'h44) ? (8'hbb) : (8'hbf)), ((8'hb2) <<< (8'ha6))} ? (((8'h9e) >> (8'hb5)) ? ((8'hb1) ? (8'hb3) : (8'hb1)) : (8'hb9)) : (~&{(8'hb5), (8'hbe)})) : ((-((8'hbc) * (7'h41))) ? (-((7'h42) ? (8'hbf) : (8'hb9))) : {{(8'hb3), (8'ha8)}, ((8'hac) ~^ (8'ha1))}))), 
parameter param41 = (((((param40 ? param40 : param40) << {param40}) - param40) >> ({(param40 ? param40 : param40), (&param40)} ? (param40 ^~ ((8'h9e) ? param40 : (8'hbf))) : (~^((8'ha9) ? param40 : (8'had))))) ? (-param40) : ((({param40} < {param40, param40}) ? {(param40 ~^ param40), (~&param40)} : param40) > (~&((^~param40) ? {param40, param40} : param40)))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire31,
                 wire30,
                 wire29,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire17 = $unsigned((($signed($unsigned(wire14)) ?
                          (wire16[(1'h0):(1'h0)] ?
                              wire13[(2'h3):(2'h3)] : $unsigned(wire15)) : ($unsigned(wire14) ?
                              $unsigned(wire15) : {wire14, wire13})) ?
                      (-wire16) : $signed((^~(wire13 + wire14)))));
  assign wire18 = (8'haf);
  assign wire19 = wire15;
  assign wire20 = ($signed(($signed(wire14[(1'h1):(1'h0)]) ?
                          wire15 : (|wire13))) ?
                      wire15 : ((($signed(wire19) == (wire13 ?
                          wire17 : wire18)) << (wire17[(3'h4):(2'h2)] ^~ {wire16,
                          wire13})) | $signed(((wire17 ?
                          (8'ha4) : wire14) - (wire13 >>> wire14)))));
  assign wire21 = $signed(wire18[(4'ha):(3'h5)]);
  assign wire22 = (8'ha8);
  assign wire23 = $unsigned((wire16[(1'h1):(1'h0)] ?
                      ((~&(wire17 + wire14)) << wire21[(5'h10):(4'hc)]) : (((wire20 - wire18) ?
                          (wire22 >= wire15) : (wire22 >= wire21)) * $signed(wire20[(4'hd):(4'h9)]))));
  assign wire24 = (&$unsigned((-wire16[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      if ({(wire16 ?
              $unsigned($signed(((8'hae) ? wire22 : (8'hbe)))) : (+wire13))})
        begin
          reg25 <= (~^$signed($signed({$signed((7'h42)), {(8'ha5), wire17}})));
          reg26 <= wire19;
        end
      else
        begin
          reg25 <= (wire21[(3'h4):(3'h4)] ?
              wire20 : ((|(~&$signed(wire15))) < $signed((wire13[(5'h12):(5'h10)] ?
                  $signed(wire17) : $unsigned(wire21)))));
        end
      reg27 <= wire17[(3'h7):(3'h7)];
      reg28 <= (~&{(({wire17,
              reg27} || $signed(reg26)) < (wire22[(1'h0):(1'h0)] || $signed((8'hbc))))});
    end
  assign wire29 = $unsigned((&($signed(wire13[(3'h4):(1'h0)]) ?
                      $signed(wire16) : (~|{wire24, wire17}))));
  assign wire30 = $signed(wire29);
  assign wire31 = wire22[(5'h10):(4'he)];
  always
    @(posedge clk) begin
      reg32 <= wire31;
      reg33 <= {reg28, $unsigned($unsigned($unsigned($signed(wire18))))};
      reg34 <= (~^(^~reg32[(4'h8):(2'h2)]));
      reg35 <= (wire21 ^~ reg34[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg36 <= (wire29 ?
          wire31[(4'h8):(2'h3)] : $signed(wire24[(3'h4):(1'h0)]));
    end
  assign wire37 = wire16[(2'h2):(2'h2)];
  assign wire38 = wire30[(4'hf):(3'h4)];
  assign wire39 = $signed(wire30[(4'hf):(4'ha)]);
endmodule
