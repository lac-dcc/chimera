module top
#(parameter param116 = ((~^((((7'h41) > (8'ha6)) ? (~(8'hba)) : (~|(8'hbd))) | (!((8'ha9) | (8'hbd))))) ? (((!((8'hb4) * (8'ha1))) ? {((8'hb3) ? (8'ha0) : (8'hbd)), {(8'haf)}} : ((!(7'h43)) & (8'h9d))) ? ((((8'hb0) ? (8'ha5) : (8'ha8)) - ((7'h41) * (8'hbc))) > (~^(+(8'hb5)))) : ((((8'ha0) + (8'hb0)) > ((8'ha6) ? (7'h43) : (8'ha2))) && (~&((8'hb3) ? (8'ha0) : (8'hb6))))) : (~|{{((8'hb0) ? (8'hba) : (8'hb9))}})), 
parameter param117 = {((^param116) ? (~|((param116 << param116) >= (param116 <= param116))) : param116), (param116 ? (^~(((8'hbc) <= param116) ? param116 : (+param116))) : (~|(^(&(8'hb7)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire80;
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire80,
                 reg115,
                 reg114,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
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
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  module4 #() modinst81 (wire80, clk, wire1, wire3, wire2, wire0, (8'ha6));
  always
    @(posedge clk) begin
      if ((((^~(~^(wire3 ? wire2 : wire2))) * (({wire2} <<< ((8'ha8) ?
              (8'ha0) : wire80)) ?
          {$signed(wire1),
              $unsigned(wire0)} : wire1[(4'hf):(1'h0)])) * $signed({((wire2 >= wire3) >>> $unsigned(wire2))})))
        begin
          if ($unsigned((8'ha3)))
            begin
              reg82 <= $unsigned(((+(8'had)) ?
                  (~(8'hbf)) : wire2[(3'h5):(2'h2)]));
              reg83 <= (((wire2 == reg82) >= (reg82[(4'hb):(4'hb)] ?
                  wire1[(2'h3):(1'h0)] : ((wire1 || wire3) <= (8'hbd)))) ~^ $signed(wire0[(3'h4):(2'h3)]));
              reg84 <= (($signed($signed(((8'hbd) ?
                  reg83 : (8'ha4)))) && $signed($unsigned((+wire1)))) >= (8'h9f));
            end
          else
            begin
              reg82 <= $signed((~&({{reg83, wire80},
                  reg84} == reg83[(1'h0):(1'h0)])));
            end
          reg85 <= wire80[(1'h0):(1'h0)];
        end
      else
        begin
          reg82 <= reg83[(2'h3):(2'h3)];
          reg83 <= (wire0[(5'h12):(5'h10)] ?
              reg82 : (|$signed({(reg83 ? wire80 : (7'h44))})));
        end
      if (wire2)
        begin
          reg86 <= (^~((($signed(reg83) < (reg84 ? reg83 : reg83)) || ({wire3,
                      reg82} ?
                  wire0[(4'hf):(3'h5)] : reg85)) ?
              reg84 : (-(~$unsigned(wire1)))));
          if (((~(($signed(wire0) - reg84) <= $signed((reg85 && (8'ha7))))) ?
              wire1 : reg83))
            begin
              reg87 <= wire3[(5'h13):(4'he)];
              reg88 <= ($unsigned(($signed(reg84) ?
                  {reg86, $unsigned(wire2)} : $unsigned((-(8'h9c))))) + wire0);
              reg89 <= reg83;
            end
          else
            begin
              reg87 <= $unsigned(reg85[(4'h8):(1'h1)]);
              reg88 <= $unsigned((~^$signed(reg88[(3'h6):(1'h0)])));
              reg89 <= (reg87 ?
                  ($unsigned((+(+(8'had)))) ?
                      (reg89 ~^ reg86[(2'h2):(1'h0)]) : reg82[(1'h0):(1'h0)]) : wire80);
              reg90 <= $unsigned(((((wire2 ? (8'ha6) : reg82) ?
                      reg88 : reg89[(2'h2):(1'h0)]) ?
                  reg84[(3'h4):(3'h4)] : ((reg87 > wire1) ?
                      (reg87 ?
                          reg88 : reg84) : (~reg84))) || reg86[(4'h9):(2'h2)]));
            end
        end
      else
        begin
          reg86 <= $unsigned($unsigned($unsigned($signed(reg87[(1'h0):(1'h0)]))));
          if (($signed($unsigned(reg90[(4'ha):(4'h9)])) ?
              reg87[(4'he):(4'he)] : $signed(wire3[(4'h9):(2'h3)])))
            begin
              reg87 <= ({reg83[(1'h0):(1'h0)]} ^~ wire0[(4'hd):(4'hd)]);
              reg88 <= reg89[(2'h2):(1'h0)];
            end
          else
            begin
              reg87 <= $signed(($signed((((8'hb4) ? reg83 : wire0) ?
                      reg90[(3'h6):(1'h0)] : $signed(reg90))) ?
                  $unsigned($unsigned($signed(reg83))) : $signed((wire3 ?
                      (|reg82) : wire80))));
              reg88 <= reg90[(4'hb):(4'h9)];
              reg89 <= ({{(!wire3), {reg87[(4'hf):(3'h7)], {reg89, reg89}}}} ?
                  (reg87 == $unsigned(($unsigned(reg82) ?
                      reg83[(1'h1):(1'h0)] : reg88))) : $signed(wire3));
              reg90 <= $unsigned(($signed(((wire3 ?
                  reg83 : wire2) - (~&reg85))) && (^~wire80[(3'h4):(1'h0)])));
              reg91 <= (reg90 ?
                  reg82[(4'h8):(4'h8)] : $unsigned($signed(reg84)));
            end
          if ((((((^~reg84) ? (!(8'h9e)) : reg83) >>> reg82) >>> ((^~(reg84 ?
              reg84 : wire80)) & (+wire0))) >> (!(wire80[(3'h4):(3'h4)] ?
              $unsigned(reg91[(4'hc):(1'h1)]) : wire3))))
            begin
              reg92 <= wire80;
              reg93 <= (8'ha3);
              reg94 <= {(|($signed((reg83 ^~ reg91)) >= (~(wire0 ?
                      wire1 : reg91))))};
            end
          else
            begin
              reg92 <= reg86[(2'h2):(1'h0)];
              reg93 <= $signed(reg90);
              reg94 <= ($signed((((~&(8'hb4)) <<< reg84) ?
                  reg93[(2'h2):(1'h0)] : (+reg92[(2'h3):(1'h0)]))) == $signed(reg90));
              reg95 <= {$signed(reg93), (8'hb6)};
              reg96 <= (&wire1[(1'h1):(1'h1)]);
            end
        end
      if (reg95[(3'h6):(3'h6)])
        begin
          if (($signed($signed($unsigned(((7'h40) < reg86)))) ?
              ($signed((((7'h43) | wire80) | (wire2 ? reg82 : reg87))) ?
                  reg92 : {reg88[(3'h4):(1'h1)]}) : (($signed($signed(wire0)) ^ wire3) ~^ reg95)))
            begin
              reg97 <= (|reg91[(3'h6):(3'h5)]);
            end
          else
            begin
              reg97 <= wire2;
              reg98 <= ($signed($signed({(8'ha9), ((8'hb1) ? reg96 : reg95)})) ?
                  (reg89 ?
                      {(wire3 ? $unsigned(reg88) : $unsigned(reg92)),
                          reg96} : reg84[(1'h0):(1'h0)]) : reg96);
            end
          reg99 <= ((reg95 ^ {(!reg94)}) || (~&{$unsigned((~&reg90)),
              reg91[(4'he):(3'h4)]}));
          reg100 <= (^reg88[(2'h2):(1'h0)]);
        end
      else
        begin
          if ((~|{{$unsigned({wire1}),
                  ((reg96 ? reg97 : (8'hb3)) ?
                      reg82[(4'hd):(1'h1)] : reg86[(4'h9):(1'h1)])}}))
            begin
              reg97 <= reg88[(3'h4):(3'h4)];
              reg98 <= reg95;
              reg99 <= $signed((((&(reg88 ? (8'h9e) : wire1)) ?
                      $signed((reg100 + reg88)) : (((8'h9e) ? reg97 : wire1) ?
                          (!reg83) : wire0)) ?
                  $unsigned(((-wire80) ?
                      reg83[(2'h2):(1'h1)] : $unsigned(reg84))) : ($signed({reg91,
                          reg86}) ?
                      wire3 : (reg85[(3'h7):(2'h3)] ?
                          (reg86 >>> reg98) : (reg96 && reg98)))));
              reg100 <= reg84[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= reg86[(2'h2):(1'h1)];
            end
          if (reg83)
            begin
              reg101 <= reg85;
              reg102 <= $signed({$signed((~^(+reg89)))});
              reg103 <= reg98;
              reg104 <= $unsigned($signed(reg87));
              reg105 <= ((!($signed((8'hae)) >> $unsigned((8'hb3)))) ?
                  (8'hab) : ($signed(reg88) >>> $unsigned((-(reg97 >> reg100)))));
            end
          else
            begin
              reg101 <= $signed((~^reg93));
              reg102 <= $unsigned(((reg96 ?
                  reg90 : ((^~reg96) ?
                      wire2[(4'h8):(3'h6)] : $unsigned(wire2))) + (~&(|$signed(reg92)))));
              reg103 <= $signed({(~{(reg97 ? reg97 : reg82)}), reg87});
              reg104 <= reg97;
            end
          reg106 <= ($unsigned($unsigned(reg102)) * (reg83[(1'h1):(1'h0)] >> ($signed(reg89[(4'h8):(3'h4)]) ?
              $signed($unsigned(reg87)) : $signed((reg93 >= reg102)))));
          reg107 <= (reg103[(1'h0):(1'h0)] ?
              (-$signed($signed((+(8'hbf))))) : (reg100 >>> $signed(reg99[(2'h2):(1'h0)])));
        end
      reg108 <= reg82;
      reg109 <= ($unsigned((^$signed((!reg98)))) || $unsigned(reg104));
    end
  assign wire110 = (~^reg97[(2'h2):(1'h1)]);
  assign wire111 = (reg90 ?
                       ($signed(reg106) <= ($unsigned((reg108 && reg105)) ?
                           (reg105[(1'h0):(1'h0)] ?
                               ((8'h9c) ?
                                   reg87 : reg93) : $signed(reg99)) : ((~|reg88) ?
                               $signed(reg83) : (reg108 + reg86)))) : $unsigned(reg107[(4'h8):(1'h0)]));
  assign wire112 = {reg101,
                       $unsigned($unsigned(($unsigned((8'ha1)) || (reg96 ?
                           reg98 : reg104))))};
  assign wire113 = reg89[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg114 <= ({(^(reg90 - $signed(wire0))),
          $signed(reg83)} >> (reg93[(2'h3):(2'h2)] ?
          reg107 : ((~|reg107[(5'h14):(4'hd)]) ?
              $signed(((8'hb5) ? wire111 : wire2)) : $unsigned(reg85))));
      reg115 <= reg96[(4'ha):(4'h8)];
    end
endmodule

module module4
#(parameter param79 = ((((8'ha8) ? ({(8'hb3)} <= {(8'h9e)}) : (((8'ha3) <= (7'h42)) < (~&(8'hb8)))) ? ((8'ha3) | (~&((8'hb5) >> (8'hab)))) : (^~(((8'hbd) >>> (8'h9c)) ? ((7'h41) ? (8'ha4) : (8'hb3)) : (|(8'hb5))))) ? (|({(~|(7'h42)), ((7'h41) ? (8'ha8) : (8'had))} ? (!((8'hb0) ? (8'hbc) : (8'ha5))) : ((~|(8'hba)) ^ ((8'h9d) <= (8'hb9))))) : (+(~^(((7'h40) ? (8'hb3) : (7'h41)) >> ((8'hb7) ? (8'haa) : (8'h9d)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire5;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire75;
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire41,
                 wire75,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire10 = (($unsigned({((8'hbe) >>> wire6), (&wire6)}) ?
                          ($unsigned(wire9[(2'h2):(1'h0)]) || $signed((|wire9))) : {$unsigned($unsigned((8'hbd))),
                              $signed(wire7)}) ?
                      ($unsigned($signed(((8'ha3) ?
                          wire6 : wire8))) && (-wire7)) : $signed($signed({$signed((8'hae))})));
  assign wire11 = wire7[(3'h5):(2'h2)];
  assign wire12 = (~|wire6);
  assign wire13 = $unsigned($signed(($signed($unsigned(wire6)) ?
                      $unsigned((7'h42)) : wire9)));
  assign wire14 = {$signed((~$unsigned($unsigned(wire13))))};
  always
    @(posedge clk) begin
      reg15 <= (((!(^~{(8'had),
          wire5})) - wire14[(1'h0):(1'h0)]) + $unsigned((8'ha3)));
      reg16 <= ($signed({(-((8'h9f) ? wire10 : wire13)), wire5}) ?
          ($unsigned(wire14) ?
              (wire8 ~^ (!$signed(wire7))) : (($unsigned(wire6) & wire12[(1'h1):(1'h1)]) ?
                  ((8'hb8) ?
                      (~&wire7) : $unsigned(reg15)) : wire9)) : ($unsigned($unsigned($signed((8'hb1)))) ?
              wire14[(1'h0):(1'h0)] : ((|{wire8, wire14}) ?
                  wire5[(4'hf):(4'hb)] : ($unsigned(wire6) ?
                      (+wire7) : $unsigned(wire11)))));
      reg17 <= $signed($unsigned(wire13[(4'h9):(2'h3)]));
      reg18 <= ($signed((^wire7[(3'h5):(2'h2)])) > wire13[(4'h9):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg19 <= wire7[(3'h4):(2'h3)];
    end
  module20 #() modinst42 (.wire21(wire10), .y(wire41), .clk(clk), .wire24(wire7), .wire23(wire12), .wire22(wire8));
  module43 #() modinst76 (.wire46(wire13), .y(wire75), .wire47(wire9), .clk(clk), .wire48(wire14), .wire44(wire6), .wire45(wire8));
  assign wire77 = (~^{((&(~|wire7)) <= (wire41 ?
                          (wire8 & reg15) : $signed(wire8))),
                      ((&(wire14 < wire75)) * (|reg15))});
  assign wire78 = $unsigned(($signed((-reg16)) == (~$unsigned($unsigned(reg15)))));
endmodule

module module43
#(parameter param74 = ((^((((8'hb0) ? (8'ha2) : (8'ha8)) ? ((8'ha6) ? (8'hb7) : (8'hb0)) : (^~(8'ha9))) <<< (((8'ha8) << (8'hb3)) << (+(7'h41))))) ? ({(|((8'h9d) << (8'hbc)))} ? {(((8'ha7) >>> (8'ha7)) ^~ {(8'ha4)}), {(!(8'hb9))}} : ((((8'hb0) ? (8'hac) : (8'hb3)) < ((8'hb3) <= (8'hbb))) ? (&(!(8'hbe))) : (((8'hbf) ? (8'hbf) : (8'hb4)) ^~ (8'hb6)))) : ((((~(8'h9c)) ? (8'hb0) : {(8'hb1), (8'h9f)}) ? (((8'hb7) == (8'ha0)) ? (|(8'hac)) : (~&(8'hb3))) : (((8'h9d) ^~ (8'hb3)) ? (8'hae) : (~|(8'had)))) <<< (^(&(-(8'h9c)))))))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire [(5'h15):(1'h0)] wire45;
  input wire signed [(2'h3):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire49;
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire49,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire49 = ($unsigned(wire47) ?
                      (~&$unsigned((~^$signed(wire47)))) : (($signed($signed(wire47)) ~^ $signed($unsigned(wire45))) && (8'hbb)));
  always
    @(posedge clk) begin
      reg50 <= ($signed(($signed($signed(wire48)) ?
          wire44 : $signed(((8'hb9) ?
              wire46 : (8'ha4))))) | $unsigned($unsigned(({(8'ha8), wire49} ?
          $signed(wire44) : (wire46 ? wire45 : wire45)))));
      reg51 <= $signed(wire48);
      reg52 <= wire49[(4'hf):(4'hf)];
      reg53 <= reg50[(2'h2):(2'h2)];
    end
  assign wire54 = (-$signed((^($signed(wire46) * (wire46 ? reg51 : wire48)))));
  assign wire55 = $unsigned(((reg50 ?
                      wire47 : reg52[(4'h9):(3'h6)]) ~^ $unsigned({{wire45},
                      wire45[(4'he):(3'h7)]})));
  assign wire56 = ($signed(wire44[(1'h0):(1'h0)]) ?
                      $unsigned({$signed({reg51})}) : wire45[(4'he):(1'h1)]);
  assign wire57 = wire46;
  assign wire58 = $unsigned(($unsigned(wire57[(1'h1):(1'h1)]) < (8'hb9)));
  assign wire59 = $signed($signed($signed(reg52[(3'h4):(3'h4)])));
  assign wire60 = $signed(reg51);
  assign wire61 = ($signed((wire59[(5'h10):(3'h7)] ?
                          $signed((wire60 ~^ (8'hb1))) : $unsigned((wire45 & wire58)))) ?
                      $unsigned(($unsigned(wire44[(1'h1):(1'h0)]) <<< ((wire59 ?
                              wire58 : wire60) ?
                          $signed(wire60) : wire54))) : {$unsigned((!(reg50 | reg50)))});
  assign wire62 = wire44;
  assign wire63 = wire55[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg64 <= (!wire61);
      reg65 <= (wire47 ?
          (!wire58[(1'h0):(1'h0)]) : $signed($signed(((~^(8'haa)) ?
              wire54 : wire45))));
      reg66 <= {($signed($unsigned(wire54)) ?
              ($unsigned($unsigned(wire48)) ?
                  (wire57 ?
                      (wire48 * (8'hbd)) : (reg52 ?
                          wire54 : wire49)) : (~^$unsigned(wire45))) : {(wire62[(4'h8):(3'h7)] | wire48)}),
          ({$signed(wire55[(2'h2):(1'h0)])} ?
              ($signed((!reg64)) ?
                  reg52[(5'h14):(1'h1)] : wire56[(4'h9):(3'h4)]) : wire55[(3'h4):(1'h1)])};
      reg67 <= $unsigned(wire55);
      if ((wire54[(3'h6):(1'h0)] && wire56[(4'h9):(3'h5)]))
        begin
          reg68 <= $unsigned(wire46);
          reg69 <= $unsigned((wire59[(1'h0):(1'h0)] ?
              ((~&((8'ha7) >>> (8'ha2))) ?
                  wire60[(1'h1):(1'h0)] : reg66[(4'h8):(2'h3)]) : reg66));
        end
      else
        begin
          reg68 <= $signed((^wire59));
        end
    end
  assign wire70 = wire61;
  assign wire71 = reg67[(2'h2):(1'h1)];
  assign wire72 = (reg52[(4'hf):(4'h8)] ?
                      (wire49[(2'h3):(1'h0)] ?
                          wire71[(2'h2):(1'h1)] : ((|{wire45}) * (reg68[(4'ha):(4'h8)] ?
                              ((7'h40) != (8'hae)) : reg65[(2'h2):(2'h2)]))) : {(~^reg66),
                          $signed(reg69[(3'h7):(1'h1)])});
  assign wire73 = wire48;
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire25 = wire23[(4'h8):(2'h3)];
  assign wire26 = {wire22, (!wire23[(1'h1):(1'h1)])};
  assign wire27 = wire24[(4'hb):(4'h8)];
  assign wire28 = wire22;
  assign wire29 = wire21[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg30 <= $signed((~|((~&(wire21 * wire27)) <<< {$unsigned(wire23),
          wire25[(4'h8):(1'h1)]})));
      reg31 <= $unsigned($signed(wire21));
    end
  always
    @(posedge clk) begin
      reg32 <= (~^wire22);
    end
  assign wire33 = $signed($signed($signed($unsigned((wire26 ?
                      wire25 : (8'ha8))))));
  assign wire34 = $signed($signed($signed({(|(8'hb3))})));
  assign wire35 = {$signed((~^(+(^~wire29))))};
  assign wire36 = $unsigned((((-((7'h44) ? wire26 : reg32)) ?
                          (7'h40) : wire27) ?
                      $unsigned((7'h42)) : (-wire22[(3'h6):(2'h3)])));
  assign wire37 = $signed(wire22[(1'h0):(1'h0)]);
  assign wire38 = ({((8'hba) == (8'hb2)),
                          ($unsigned($signed(wire23)) ?
                              reg30[(2'h2):(2'h2)] : (wire28[(3'h4):(3'h4)] & $signed(wire23)))} ?
                      $signed(wire35[(1'h1):(1'h0)]) : ({{(wire28 ?
                                  wire25 : reg31)},
                          ((wire27 ? wire25 : wire33) | (wire27 ?
                              wire22 : wire24))} ^~ wire23));
  assign wire39 = wire35[(2'h2):(1'h1)];
  assign wire40 = $unsigned($signed((~^$unsigned(reg31))));
endmodule
