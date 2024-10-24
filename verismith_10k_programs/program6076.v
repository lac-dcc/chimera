module top
#(parameter param115 = ((~|((((8'hb2) <<< (8'hb1)) ? ((8'hbc) ? (8'haa) : (8'hbe)) : ((8'hb0) ? (8'ha7) : (8'hb0))) | (^~((8'hb7) ? (8'ha6) : (8'hb0))))) ? {(^(^~(~^(8'ha1)))), (8'ha9)} : (|((((8'h9c) << (8'ha8)) && (^(8'hb0))) ? (-(~^(7'h41))) : {((8'hbc) ? (8'hb3) : (7'h41))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire110;
  assign y = {wire114, wire113, wire112, wire5, wire6, wire110, (1'h0)};
  assign wire5 = wire2;
  assign wire6 = (($unsigned($signed((wire0 ? wire1 : wire2))) ?
                         (wire2[(3'h5):(3'h5)] ?
                             wire5[(4'hb):(3'h6)] : ((~wire3) ?
                                 {wire2,
                                     (8'hb9)} : $signed((8'h9e)))) : (($signed((8'ha9)) ?
                             (wire1 ?
                                 (8'haa) : wire4) : $signed(wire4)) | ({wire3} ^ {wire3}))) ?
                     $signed(wire3) : {$unsigned($signed($signed(wire3))),
                         {(~|((8'h9c) ? wire5 : wire0))}});
  module7 #() modinst111 (.clk(clk), .wire8(wire3), .wire10(wire5), .wire12(wire0), .y(wire110), .wire11(wire6), .wire9(wire4));
  assign wire112 = (wire110[(2'h2):(2'h2)] ?
                       $signed((^~($signed(wire110) ?
                           wire110[(2'h2):(1'h1)] : (wire1 ?
                               wire4 : wire110)))) : $signed(wire110[(4'h8):(3'h7)]));
  assign wire113 = wire4[(1'h1):(1'h0)];
  assign wire114 = $signed($unsigned((($signed(wire0) ?
                           (wire112 < wire5) : wire5) ?
                       (~&(wire4 ~^ wire3)) : $unsigned((^~(7'h40))))));
endmodule

module module7
#(parameter param109 = (((~^(^~((8'hbe) << (8'h9c)))) && (^~({(7'h41)} | ((8'hbe) || (8'ha2))))) ? ({(((8'hb1) <<< (8'hbe)) ? {(8'hb1), (7'h40)} : ((8'hba) ? (8'hab) : (8'hb7))), ((&(8'ha7)) <= ((8'h9d) * (8'had)))} ? ((((8'h9d) ? (8'hb7) : (8'hb6)) ? ((8'hba) ? (8'hb6) : (8'haa)) : (~|(8'ha5))) < (((8'hac) ? (8'h9c) : (8'h9f)) ? ((8'hab) >>> (8'hae)) : (8'hbd))) : (((+(8'ha8)) >>> {(8'ha0), (8'hb8)}) ? ((|(8'hb0)) >> ((7'h40) ? (8'had) : (8'hae))) : (&((8'hbc) ? (8'h9e) : (8'ha2))))) : {((~&((8'hba) >= (8'hac))) ~^ {(8'haf)})}))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire40;
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire95,
                 wire94,
                 wire93,
                 wire84,
                 wire52,
                 wire49,
                 wire48,
                 wire47,
                 wire42,
                 wire40,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg51,
                 reg50,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  module13 #() modinst41 (.y(wire40), .wire14(wire10), .wire16(wire8), .wire17(wire12), .clk(clk), .wire15(wire11));
  assign wire42 = $signed(((((!wire11) > (~^(8'ha8))) ?
                          $unsigned((wire8 ? wire12 : wire9)) : wire8) ?
                      ((~&(wire11 ? wire10 : wire8)) ?
                          ((~wire12) ^~ {(8'hb5)}) : $unsigned(wire12)) : wire10[(4'h8):(3'h4)]));
  always
    @(posedge clk) begin
      reg43 <= (^$signed(((-$unsigned(wire8)) >= {$signed(wire10)})));
      reg44 <= wire12;
      reg45 <= $unsigned(wire40);
      reg46 <= {(($signed(reg44[(3'h6):(1'h0)]) ?
                  wire8[(3'h6):(3'h5)] : (~&$unsigned(reg44))) ?
              (((wire11 ? wire40 : wire8) == reg43) ?
                  ((~^wire42) ?
                      $signed(wire10) : (wire8 & wire8)) : (reg45[(1'h0):(1'h0)] ?
                      wire10[(1'h1):(1'h1)] : $unsigned((8'had)))) : {$signed((~&wire12))})};
    end
  assign wire47 = (({(8'hb2), reg45} ?
                      (7'h41) : (8'hb1)) + wire40[(1'h1):(1'h0)]);
  assign wire48 = ((&(wire11[(1'h0):(1'h0)] ?
                          reg44[(4'h8):(4'h8)] : $signed((~^wire12)))) ?
                      ($signed((~^{wire42})) ?
                          wire8 : ((~&(reg44 | (8'ha2))) <<< (wire12 & (|wire42)))) : $signed($unsigned($signed(wire47))));
  assign wire49 = $signed($unsigned((8'had)));
  always
    @(posedge clk) begin
      reg50 <= $unsigned(reg46[(3'h4):(3'h4)]);
      reg51 <= wire40;
    end
  assign wire52 = $unsigned((8'hb2));
  module53 #() modinst85 (.wire55(wire10), .wire54(wire52), .wire56(wire12), .wire57(wire47), .y(wire84), .clk(clk));
  always
    @(posedge clk) begin
      reg86 <= $unsigned($unsigned(wire8));
      if ($unsigned((wire9 && (|(!$unsigned(wire49))))))
        begin
          reg87 <= (^($unsigned((^wire49)) ~^ reg43[(1'h0):(1'h0)]));
          if (reg87[(1'h1):(1'h0)])
            begin
              reg88 <= $signed(reg46);
              reg89 <= wire8[(4'he):(4'hd)];
            end
          else
            begin
              reg88 <= (~|(+reg43[(4'ha):(4'h8)]));
            end
          reg90 <= ((wire42 < $signed($signed((~^wire84)))) || $unsigned(((~&$unsigned((8'h9d))) ^ reg46[(2'h3):(1'h0)])));
        end
      else
        begin
          reg87 <= (|(+((+reg50) ?
              (8'ha9) : ((~|(8'hb2)) & (wire49 || wire10)))));
          reg88 <= {reg46[(2'h3):(1'h0)],
              $signed((($signed(wire8) ^~ wire48) ?
                  {(reg44 ~^ wire11)} : ((wire8 ?
                      reg89 : wire48) ~^ (8'hbe))))};
          reg89 <= {wire42[(1'h1):(1'h1)]};
        end
      reg91 <= $unsigned(wire48);
      reg92 <= reg45;
    end
  assign wire93 = reg43[(5'h12):(4'hc)];
  assign wire94 = $unsigned(wire84[(4'hf):(2'h3)]);
  assign wire95 = $signed((8'hae));
  always
    @(posedge clk) begin
      if ((!$signed(({((7'h41) ? reg45 : reg92)} ^~ ({wire93,
          reg51} << $unsigned(reg51))))))
        begin
          reg96 <= $signed(((($signed(wire9) == wire52[(4'h8):(3'h5)]) <<< reg92) + (($signed(reg86) && $unsigned(reg45)) ?
              (^~(&reg88)) : ((7'h44) ? (^~(8'ha0)) : reg89[(1'h0):(1'h0)]))));
          reg97 <= ({(+($signed(wire49) + (wire10 != reg51)))} <= ($signed($unsigned((reg96 & (8'ha9)))) * ($signed(((8'haf) ?
              reg87 : reg43)) < ((wire10 ^ reg92) ?
              wire94[(5'h11):(3'h5)] : reg51[(4'hd):(4'ha)]))));
          reg98 <= reg46[(1'h0):(1'h0)];
          reg99 <= (~|$signed((wire52[(3'h6):(1'h0)] ?
              ((wire42 * wire84) ?
                  reg44 : $unsigned((8'hae))) : $signed(wire9))));
          if (wire49[(4'hd):(3'h4)])
            begin
              reg100 <= $signed((^(8'hab)));
              reg101 <= reg46[(2'h3):(1'h1)];
              reg102 <= wire11;
              reg103 <= {((wire42[(5'h13):(2'h2)] ?
                      wire12[(4'hd):(4'hc)] : wire9[(3'h5):(3'h4)]) + $unsigned({(|wire52),
                      (!wire12)}))};
              reg104 <= ({($signed($unsigned(reg86)) | ((+reg102) ^ (wire12 ?
                          reg43 : wire93))),
                      (reg103[(4'h8):(3'h5)] ?
                          $unsigned(wire48) : $signed(wire95[(3'h6):(3'h6)]))} ?
                  $signed((~|$unsigned($unsigned(reg101)))) : ({((8'hb1) ?
                              (^~reg98) : $signed(wire95))} ?
                      reg44[(3'h5):(1'h1)] : (reg101 ?
                          ((reg98 ? reg86 : wire12) ?
                              reg92[(2'h3):(2'h3)] : (&reg92)) : $signed((reg89 != wire10)))));
            end
          else
            begin
              reg100 <= (($signed(wire48[(2'h3):(2'h3)]) != $signed(($unsigned(reg103) << (reg90 ?
                  (8'ha7) : (8'had))))) ~^ (^wire40[(2'h2):(2'h2)]));
              reg101 <= $unsigned($unsigned($unsigned(wire48[(2'h2):(2'h2)])));
              reg102 <= (wire42 ?
                  (^(wire11[(4'hc):(3'h7)] > (~$signed(wire40)))) : $signed(reg102));
            end
        end
      else
        begin
          reg96 <= $signed($signed(wire49[(4'ha):(1'h1)]));
          if (reg90)
            begin
              reg97 <= ($unsigned({reg45[(2'h2):(1'h1)],
                  $signed((reg100 ? wire52 : wire42))}) != ((^{{reg44,
                          wire93}}) ?
                  (|wire42) : {(~(&wire12)), reg87[(1'h1):(1'h1)]}));
              reg98 <= $signed(($signed((wire8[(1'h1):(1'h1)] ?
                  (wire40 ? wire12 : reg43) : reg98)) || $unsigned(reg51)));
              reg99 <= (8'hba);
              reg100 <= ((((reg101 ? $signed((8'ha7)) : $unsigned(reg96)) ?
                          reg50[(3'h5):(1'h0)] : $signed((!reg88))) ?
                      wire94[(4'hc):(4'ha)] : reg44) ?
                  wire10[(3'h5):(3'h4)] : (^~$unsigned($unsigned(reg50[(2'h3):(2'h2)]))));
              reg101 <= ($unsigned($signed(((&reg50) ~^ (+reg43)))) ?
                  ((~(&wire49)) ^~ reg50) : $signed((reg104[(3'h7):(1'h0)] != reg92[(1'h1):(1'h0)])));
            end
          else
            begin
              reg97 <= ($unsigned((((wire94 >> reg86) > (reg98 ?
                  reg91 : reg90)) == $unsigned((reg89 >> wire49)))) ~^ (!wire52));
            end
        end
      reg105 <= (reg104 | reg46);
    end
  assign wire106 = $unsigned((($unsigned($signed(wire8)) > ((!wire52) >> (-reg99))) ^~ {($signed(wire95) ?
                           {wire47, reg96} : reg104[(3'h6):(2'h3)]),
                       (8'h9c)}));
  assign wire107 = $signed($unsigned(wire95));
  assign wire108 = ({(wire42[(5'h10):(3'h4)] ?
                               $signed(reg97) : ((reg92 ? reg92 : reg89) ?
                                   $unsigned(reg46) : (~^reg102))),
                           reg97[(3'h6):(2'h3)]} ?
                       $unsigned((&reg51)) : ({($unsigned(wire94) <= reg98[(3'h6):(3'h6)]),
                               $unsigned((-reg43))} ?
                           ($signed($signed((8'ha9))) ?
                               wire52 : ($unsigned(wire10) ?
                                   (|reg91) : (reg97 ?
                                       (8'ha3) : reg44))) : wire52));
endmodule

module module53
#(parameter param83 = (((!((&(8'had)) || {(8'hac)})) ? (8'ha8) : ((&((7'h40) << (8'hb7))) ? (((8'ha7) == (8'h9d)) ^ ((8'ha7) * (8'h9f))) : ((8'hae) ? ((8'h9c) ? (8'ha5) : (8'hb0)) : (~&(8'h9d))))) ^~ ((|(((8'hac) ^ (8'hb3)) ? ((7'h43) || (8'ha0)) : (+(7'h44)))) > {(((8'ha6) - (8'ha9)) | (^~(8'hb1)))})))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire57;
  input wire [(3'h4):(1'h0)] wire56;
  input wire signed [(5'h11):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  assign y = {wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg81,
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
                 (1'h0)};
  assign wire58 = wire57;
  assign wire59 = (wire56[(1'h0):(1'h0)] ?
                      wire56[(1'h0):(1'h0)] : ((wire58[(4'hc):(1'h0)] ?
                          ($signed(wire57) ?
                              (~wire58) : ((8'haa) ?
                                  wire56 : (8'hb8))) : $signed($unsigned(wire54))) > (7'h41)));
  assign wire60 = ($unsigned(wire55) ^~ wire54);
  assign wire61 = wire55;
  assign wire62 = $unsigned((^((|$signed(wire60)) ?
                      $signed((~&wire59)) : (wire57[(2'h3):(1'h0)] ?
                          $unsigned((8'hb6)) : $signed((8'ha1))))));
  assign wire63 = ($unsigned($unsigned(wire58[(1'h1):(1'h0)])) * ((~(~$unsigned(wire61))) ?
                      (wire55 >= $signed((wire60 <<< wire55))) : wire58[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg64 <= (~(^wire54[(4'ha):(1'h0)]));
      reg65 <= $unsigned({({$unsigned((8'hb6)), wire63} ?
              wire55[(4'hb):(2'h2)] : {wire57[(3'h4):(2'h2)]}),
          wire56});
      if (((+{wire63[(2'h2):(2'h2)], $signed((wire63 ? wire59 : reg64))}) ?
          (^wire57[(3'h4):(2'h3)]) : wire56))
        begin
          reg66 <= {({{(reg64 ? (7'h40) : wire57), $unsigned(wire55)},
                  wire58[(3'h6):(3'h4)]} - (^(wire62[(1'h0):(1'h0)] ?
                  wire59[(4'h9):(4'h9)] : $unsigned(wire56))))};
          if ($unsigned(wire63))
            begin
              reg67 <= $signed(wire57[(3'h7):(1'h1)]);
              reg68 <= ($unsigned(({{wire62}, {(8'hbf), wire56}} & ((~reg67) ?
                      reg64[(4'hb):(1'h0)] : (reg65 >>> wire56)))) ?
                  wire57[(3'h6):(3'h6)] : wire57[(1'h1):(1'h1)]);
              reg69 <= (reg68[(2'h3):(2'h3)] * $signed($signed(($signed((8'hae)) ?
                  wire60[(4'hc):(4'ha)] : $signed(reg67)))));
              reg70 <= reg65;
            end
          else
            begin
              reg67 <= ((-reg64) | $signed({$unsigned(reg69)}));
              reg68 <= wire63[(2'h2):(1'h0)];
              reg69 <= (wire59[(1'h0):(1'h0)] < $signed((~&$unsigned((8'h9f)))));
            end
          reg71 <= (8'hb5);
          reg72 <= {{($signed(wire54) ?
                      (^~(+(8'haa))) : $unsigned(((8'hbb) ? wire63 : reg64))),
                  (~reg67)}};
          reg73 <= reg66;
        end
      else
        begin
          if (reg70[(2'h3):(1'h1)])
            begin
              reg66 <= wire60;
            end
          else
            begin
              reg66 <= ($signed($signed(((8'hb4) ?
                  $signed(reg67) : $unsigned(reg69)))) == (reg67[(1'h0):(1'h0)] ?
                  (reg66[(4'h8):(2'h2)] < ((reg67 ?
                      reg70 : reg69) * (!wire58))) : $signed($signed(((8'hae) * wire59)))));
              reg67 <= (^$unsigned(reg68[(3'h6):(3'h4)]));
              reg68 <= wire60;
              reg69 <= {$unsigned($unsigned($unsigned($unsigned(wire63)))),
                  $signed($signed(({wire55, reg72} ?
                      (~^reg66) : ((8'haa) ? wire61 : wire61))))};
            end
          reg70 <= $unsigned((~^reg73[(1'h1):(1'h0)]));
          reg71 <= ((~|{{(wire63 ^~ reg71)},
                  $unsigned(wire58[(2'h3):(2'h3)])}) ?
              $unsigned($unsigned((^~wire59[(4'hb):(4'h8)]))) : ((8'had) ?
                  reg71[(2'h2):(1'h1)] : (reg66 ?
                      wire57[(2'h2):(2'h2)] : $signed($unsigned(wire57)))));
          reg72 <= wire59[(2'h2):(1'h0)];
        end
      reg74 <= ($signed($signed(($unsigned(reg70) ^~ (reg71 ^ reg67)))) + $unsigned((-{(wire57 & wire57),
          (^wire60)})));
      reg75 <= $unsigned(reg72);
    end
  assign wire76 = {(wire63 - $signed($signed((+reg72))))};
  assign wire77 = (($unsigned({(7'h43), {reg73}}) ?
                      $unsigned($signed((wire62 ?
                          reg75 : wire76))) : (($unsigned((8'hb3)) + {wire56}) ?
                          (~^((8'ha0) > reg68)) : (((8'ha7) <<< reg64) ?
                              reg73 : wire56[(2'h2):(1'h0)]))) <<< {(((~&wire57) ?
                              ((7'h42) * (8'hb3)) : $signed((8'hb0))) ?
                          {reg68} : (+(&reg66)))});
  assign wire78 = reg64;
  assign wire79 = reg75;
  assign wire80 = (($signed(((~|wire55) != reg71[(1'h1):(1'h0)])) > ($signed(reg70[(5'h11):(4'he)]) ?
                          {((8'hbc) << (8'hba)),
                              $signed(reg70)} : (^wire59[(4'h8):(3'h7)]))) ?
                      ($signed(reg75[(1'h1):(1'h0)]) + (wire56 ?
                          $signed((+(8'hbf))) : $signed($signed(wire61)))) : ((wire59[(3'h7):(3'h6)] & ($signed(wire79) != wire59)) ?
                          wire79 : {$signed((reg67 ? reg71 : wire78))}));
  always
    @(posedge clk) begin
      reg81 <= $signed(($unsigned(reg65[(4'he):(3'h6)]) ?
          (^~(reg69[(1'h1):(1'h1)] ?
              ((8'ha3) ?
                  reg65 : wire63) : wire80)) : ((8'hbe) <<< (^~(reg75 < wire78)))));
    end
  assign wire82 = wire63[(1'h1):(1'h0)];
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire18;
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
                 wire18,
                 reg35,
                 reg27,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = wire17;
  always
    @(posedge clk) begin
      reg19 <= wire18[(1'h0):(1'h0)];
      reg20 <= reg19[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg21 <= ($signed((($unsigned(wire18) ?
                  (reg19 ? reg20 : wire18) : reg20[(5'h12):(4'he)]) ?
              (+wire16[(1'h1):(1'h0)]) : (-$unsigned(reg19)))) ?
          (8'hab) : (8'h9d));
      reg22 <= {wire18,
          ((((^wire14) ? {wire14, wire18} : (7'h40)) > {(reg19 <<< wire17),
                  (wire18 & wire14)}) ?
              ({(wire14 >>> wire16)} >>> $unsigned((wire16 && reg19))) : {$signed({wire16,
                      wire18})})};
      reg23 <= wire14[(4'h9):(3'h6)];
    end
  assign wire24 = (wire17[(4'h9):(2'h2)] && reg23);
  assign wire25 = ($unsigned($signed((+(&wire24)))) ?
                      (reg22[(1'h1):(1'h1)] == (|(!(wire16 ?
                          reg22 : wire16)))) : $signed($signed($unsigned(reg23))));
  assign wire26 = (reg19 ? wire14 : $signed((|reg19)));
  always
    @(posedge clk) begin
      reg27 <= $unsigned(reg23[(1'h1):(1'h0)]);
    end
  assign wire28 = (~|(((&(|reg19)) << $unsigned($unsigned(reg22))) * reg23));
  assign wire29 = ((($signed(wire15[(4'hc):(3'h4)]) ?
                      $unsigned($signed(wire18)) : ((-(8'ha5)) ^ wire16)) & ((reg21 ?
                          $unsigned(reg19) : $unsigned(wire17)) ?
                      {$signed(reg22)} : (^((8'h9c) ?
                          (8'hb1) : reg22)))) >= $unsigned((($signed(wire18) + (-wire28)) ?
                      (-wire15) : {reg27, wire25})));
  assign wire30 = $signed({($unsigned($unsigned(wire26)) && ((-wire29) * reg23[(1'h0):(1'h0)])),
                      (((wire24 <= wire18) ?
                              (wire28 ^ wire26) : $signed((8'ha8))) ?
                          wire18[(2'h2):(1'h1)] : $signed(reg19))});
  assign wire31 = (($signed(((wire28 ? reg21 : wire16) ?
                      (wire18 ^~ wire15) : wire26[(1'h1):(1'h1)])) >>> $unsigned($signed(wire29[(1'h1):(1'h1)]))) << $unsigned(wire18[(2'h3):(1'h0)]));
  assign wire32 = (!(~&$unsigned($unsigned(wire17[(4'hf):(3'h6)]))));
  assign wire33 = (-(^~wire28[(3'h4):(2'h3)]));
  assign wire34 = reg27;
  always
    @(posedge clk) begin
      reg35 <= wire25;
    end
  assign wire36 = wire26;
  assign wire37 = {((~^({reg21} ?
                          (wire15 ? wire18 : reg23) : wire28)) >= (8'hb9)),
                      $unsigned(wire25[(3'h5):(2'h3)])};
  assign wire38 = ((wire18 != (wire15 ?
                      ($unsigned(wire15) ?
                          (wire33 ?
                              reg21 : wire32) : $unsigned(wire16)) : wire26[(2'h2):(1'h1)])) && $signed((reg22[(4'ha):(3'h4)] <= wire28[(3'h6):(2'h2)])));
  assign wire39 = (({$signed(wire38[(4'hb):(2'h2)])} - wire33) << $unsigned(({(wire24 >= reg19),
                      $signed(wire34)} > $signed($unsigned(wire32)))));
endmodule
