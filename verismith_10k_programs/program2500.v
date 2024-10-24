module top
#(parameter param94 = ({((8'h9f) << {((8'ha5) ? (8'h9f) : (8'ha4)), {(7'h44), (8'hbe)}}), {(8'ha6)}} && (((~{(8'ha3)}) * (((8'hb0) ? (8'haf) : (8'hb6)) ? ((8'hbf) ? (7'h40) : (8'h9e)) : (|(8'haa)))) >= {(((8'hb8) || (8'hb0)) ? ((8'ha1) << (8'ha1)) : ((7'h44) << (8'ha1)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire42;
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire60,
                 wire58,
                 wire44,
                 wire5,
                 wire6,
                 wire42,
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
                 (1'h0)};
  assign wire5 = (!$unsigned($unsigned(wire4[(3'h6):(2'h3)])));
  assign wire6 = {((~^wire3[(4'h8):(4'h8)]) - wire5)};
  module7 #() modinst43 (.wire8(wire3), .wire9(wire4), .clk(clk), .wire10(wire5), .y(wire42), .wire12(wire2), .wire11(wire0));
  assign wire44 = $signed(((~^wire6[(3'h6):(3'h5)]) ? wire1 : wire0));
  module45 #() modinst59 (.wire46(wire3), .y(wire58), .clk(clk), .wire47(wire1), .wire48(wire42), .wire49(wire2));
  assign wire60 = $unsigned(((|$unsigned(((8'hbf) ? wire58 : wire42))) ?
                      (((~&wire42) == $unsigned(wire5)) ?
                          wire0 : (wire2[(2'h2):(2'h2)] ?
                              (wire5 ^ wire4) : $unsigned((8'ha2)))) : wire5));
  always
    @(posedge clk) begin
      reg61 <= (wire0 ?
          {(&((wire2 ? wire2 : wire6) ?
                  $unsigned(wire44) : $unsigned(wire60)))} : ((~^(+(~^(8'hb9)))) >= wire44[(2'h2):(1'h1)]));
      reg62 <= reg61;
      if ({(~^wire4)})
        begin
          reg63 <= $unsigned(($signed((wire1 ~^ $unsigned(wire3))) ?
              (^~(|(~|wire4))) : (+{(8'h9d), wire3})));
          if (wire6)
            begin
              reg64 <= ((~&(&$unsigned($signed(reg61)))) ?
                  wire0[(1'h0):(1'h0)] : (8'hac));
              reg65 <= {(8'ha8), (8'ha9)};
              reg66 <= (&($signed(wire5[(4'hd):(4'h9)]) <= reg61[(2'h2):(2'h2)]));
              reg67 <= (~&($signed(((wire3 ? wire0 : wire2) ?
                      {wire2} : {(8'ha0)})) ?
                  (|{(8'hbe), $signed(wire60)}) : ((~&((8'hb0) ?
                      wire0 : reg63)) ^ ((wire3 ? wire4 : reg64) || (wire2 ?
                      wire1 : wire58)))));
            end
          else
            begin
              reg64 <= wire42[(3'h4):(3'h4)];
              reg65 <= wire58;
              reg66 <= $unsigned({(&wire4[(4'ha):(3'h5)])});
              reg67 <= wire60;
            end
          if (wire58)
            begin
              reg68 <= ((((8'hb7) ?
                  ($unsigned(wire6) ?
                      $unsigned(wire60) : wire60[(2'h3):(2'h3)]) : $signed({(8'hb5),
                      wire44})) * $signed({(reg63 | (8'ha8))})) * wire1);
              reg69 <= {$signed(wire3[(5'h13):(4'hd)]),
                  ($unsigned(reg68[(2'h3):(1'h1)]) - (((reg68 ^~ wire0) ?
                      wire5 : (~wire0)) != {wire42[(1'h1):(1'h0)], {reg68}}))};
              reg70 <= $unsigned($signed(wire44[(3'h5):(2'h2)]));
            end
          else
            begin
              reg68 <= wire0[(3'h7):(3'h4)];
              reg69 <= ((|$signed((((8'ha8) ? (8'hb9) : (8'hab)) ?
                  $unsigned(reg66) : $unsigned(reg68)))) || ({((wire42 ?
                          reg68 : reg67) ?
                      $signed(reg70) : wire44)} >> ({reg70[(4'he):(3'h7)]} ?
                  (reg63 >>> (!reg70)) : $unsigned($signed((7'h42))))));
            end
        end
      else
        begin
          reg63 <= wire4;
          reg64 <= (|(~|$unsigned(wire6)));
        end
      reg71 <= reg61[(1'h0):(1'h0)];
      if ($signed(wire60))
        begin
          reg72 <= reg70;
          reg73 <= reg65;
          if ((~((~^(^~(8'hb9))) != {$unsigned((reg65 ? wire44 : wire42)),
              (7'h44)})))
            begin
              reg74 <= $unsigned($unsigned(($unsigned({wire6,
                  reg72}) >> wire44)));
              reg75 <= {reg67, $signed({$signed($signed(reg61))})};
              reg76 <= $signed(reg73);
            end
          else
            begin
              reg74 <= {$unsigned(reg66[(3'h7):(2'h2)]),
                  $unsigned((+(wire2[(5'h11):(4'hc)] >> wire4)))};
            end
          reg77 <= $unsigned((^~reg76[(4'hd):(3'h7)]));
          reg78 <= ($signed((+wire5[(3'h4):(1'h1)])) ?
              reg74[(1'h0):(1'h0)] : ((reg66 >> (~^reg66[(3'h5):(1'h1)])) + $signed(wire6)));
        end
      else
        begin
          reg72 <= reg72[(5'h15):(4'he)];
          reg73 <= (|$unsigned(((~&reg66[(2'h2):(2'h2)]) ?
              ($unsigned((8'hb2)) ?
                  (+wire4) : reg62[(3'h4):(1'h1)]) : $signed($signed(wire3)))));
        end
    end
  always
    @(posedge clk) begin
      reg79 <= reg72;
      reg80 <= ((($unsigned({reg76}) ^ {reg69[(2'h3):(2'h2)],
              reg68[(2'h2):(2'h2)]}) ?
          wire3[(3'h6):(1'h0)] : $unsigned((^~(reg79 ?
              (7'h41) : reg70)))) + wire3);
    end
  assign wire81 = wire60;
  assign wire82 = $unsigned(((wire6[(2'h3):(2'h3)] << ($unsigned(reg78) ?
                          $signed(reg70) : (reg80 ~^ reg77))) ?
                      reg76[(4'hc):(3'h6)] : $signed((+wire1))));
  assign wire83 = ($unsigned(wire60[(4'ha):(4'h8)]) ?
                      (wire2 ^~ {reg78,
                          $unsigned($unsigned((8'ha0)))}) : (~$signed((|$signed((8'h9e))))));
  assign wire84 = $unsigned((~|(^~({reg62} - (-reg66)))));
  assign wire85 = ({reg72} ?
                      reg63 : {(wire0[(3'h6):(3'h6)] ?
                              wire58 : $unsigned((^~reg69))),
                          ((wire2[(4'h9):(3'h7)] > (wire60 * wire58)) ?
                              (~wire81) : (8'ha2))});
  assign wire86 = ((!((-(reg73 & reg64)) >> (wire83[(1'h1):(1'h1)] ?
                      (!reg69) : (reg62 != reg63)))) < reg76[(4'hc):(3'h5)]);
  assign wire87 = (|$unsigned({$signed((-(8'hbf))), reg73[(4'hc):(2'h2)]}));
  assign wire88 = ({($signed({wire0, wire44}) <<< (|{reg64, reg78})),
                          $signed((reg63 ?
                              {reg68} : (reg61 ? reg72 : reg64)))} ?
                      $unsigned((wire1[(4'ha):(2'h2)] < (reg66 & (7'h43)))) : {($unsigned(reg65[(3'h4):(2'h2)]) << reg70)});
  assign wire89 = reg74;
  assign wire90 = $signed((reg76[(4'he):(4'h8)] - $unsigned($signed($signed(reg79)))));
  assign wire91 = $signed($unsigned({wire4[(4'hc):(4'ha)]}));
  assign wire92 = {(wire2[(3'h4):(3'h4)] ?
                          (reg80[(4'he):(4'h9)] ?
                              (+$signed(wire3)) : $unsigned(((8'ha0) != wire2))) : (^~((reg63 ?
                              reg62 : reg64) | reg73[(5'h10):(5'h10)]))),
                      $unsigned($unsigned($signed({wire0})))};
  assign wire93 = $unsigned((8'hb2));
endmodule

module module45
#(parameter param57 = {(((8'hb8) ? (((7'h41) ^~ (8'ha0)) ? ((8'hb1) - (8'hb1)) : ((8'hae) <= (8'ha2))) : {((8'hba) - (8'hbb)), ((8'ha3) | (8'hbf))}) ^~ (~(((8'ha3) ? (8'ha5) : (8'hbb)) ? ((7'h42) ? (8'hb0) : (8'hb1)) : ((8'ha6) ^ (8'hbf)))))})
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire49;
  input wire signed [(3'h7):(1'h0)] wire48;
  input wire signed [(4'he):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  assign y = {wire56, wire55, wire54, wire53, wire52, wire51, reg50, (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= wire49[(4'ha):(1'h0)];
    end
  assign wire51 = $unsigned(($unsigned((wire49 ? $unsigned((8'ha0)) : wire48)) ?
                      (+(-{reg50, wire49})) : wire49));
  assign wire52 = wire49;
  assign wire53 = ({$unsigned(wire48),
                      $unsigned((!wire51))} > wire49[(5'h12):(4'ha)]);
  assign wire54 = (&wire52);
  assign wire55 = {{$signed(((wire54 < wire47) ~^ {wire51})), wire46}};
  assign wire56 = {wire48[(1'h0):(1'h0)]};
endmodule

module module7
#(parameter param41 = (((!(((8'h9c) ? (8'ha4) : (8'ha9)) ? ((8'hb9) <= (7'h41)) : ((8'hac) ? (8'hb3) : (8'hac)))) ? (~|((+(8'hb8)) >> (~|(8'hb6)))) : {(+(+(8'ha0))), (8'hbc)}) ? ((~&{((8'hae) ? (8'hbb) : (8'hbb))}) ^~ {(((8'had) != (8'h9e)) + ((8'hb5) || (8'hbd))), (((8'hab) <= (8'hbc)) ? (8'hb5) : {(7'h40)})}) : ((~|((~|(7'h40)) ? ((8'hb1) >>> (8'hbb)) : ((7'h41) + (7'h44)))) << ({((8'had) | (7'h41)), {(8'hb4), (8'hbf)}} ? (^~((8'haa) & (8'hbf))) : (8'hb1)))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire39,
                 wire24,
                 wire23,
                 wire17,
                 wire16,
                 wire14,
                 wire13,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg15,
                 (1'h0)};
  assign wire13 = (~|$signed((~&wire12)));
  assign wire14 = ($unsigned($signed(wire8)) & wire11[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg15 <= $unsigned($signed(wire10[(3'h6):(3'h6)]));
    end
  assign wire16 = (^~($unsigned(reg15[(1'h0):(1'h0)]) << ($unsigned(wire13[(4'h9):(4'h9)]) ?
                      (~&(wire8 + wire11)) : (wire10 ?
                          $signed(wire9) : wire13[(3'h7):(3'h7)]))));
  assign wire17 = wire11[(4'ha):(3'h6)];
  always
    @(posedge clk) begin
      reg18 <= wire11;
      reg19 <= ({$signed((!$unsigned(wire12))),
          wire11} ^~ (reg15 | $unsigned(reg15[(5'h12):(2'h2)])));
      reg20 <= ($unsigned($signed(wire8[(1'h0):(1'h0)])) && wire16[(3'h5):(2'h2)]);
      reg21 <= $signed($unsigned($signed($unsigned(((8'hb1) ?
          reg15 : wire14)))));
      reg22 <= $unsigned((&{$signed((wire12 >= wire10))}));
    end
  assign wire23 = $signed((!($signed($signed(reg15)) - wire17[(1'h1):(1'h1)])));
  assign wire24 = (^(+wire10[(1'h0):(1'h0)]));
  module25 #() modinst40 (.clk(clk), .wire27(wire13), .y(wire39), .wire28(wire23), .wire29(wire8), .wire26(wire14));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 (1'h0)};
  assign wire30 = {{(~|(~&$signed(wire28))), $unsigned((+(~&(8'haf))))},
                      (({$signed(wire27),
                              (wire28 << wire29)} ^ $unsigned($signed(wire28))) ?
                          (|$signed(wire28)) : wire26)};
  assign wire31 = wire26;
  assign wire32 = ($unsigned(($signed(((8'ha2) << (8'hbb))) <<< $signed((wire30 != wire31)))) || $unsigned($unsigned($signed((wire28 ?
                      wire30 : wire27)))));
  assign wire33 = wire29[(4'h9):(3'h4)];
  assign wire34 = ((wire26 >= $unsigned(wire33[(2'h3):(1'h1)])) >>> wire28);
  assign wire35 = (^(wire32[(1'h0):(1'h0)] == wire30));
  assign wire36 = {wire29};
  assign wire37 = $unsigned(((-$signed($unsigned(wire32))) && ({$unsigned(wire34)} - ($unsigned(wire35) ?
                      ((8'haf) ? (8'ha8) : wire35) : (wire30 > (8'h9c))))));
  assign wire38 = (wire27[(3'h6):(3'h6)] ?
                      ((-(|(wire26 <<< wire29))) ?
                          $signed($signed($signed(wire28))) : $signed(wire27)) : $signed($signed(wire29)));
endmodule
