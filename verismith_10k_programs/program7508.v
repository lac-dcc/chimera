module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire215;
  wire signed [(4'he):(1'h0)] wire211;
  wire [(5'h10):(1'h0)] wire210;
  wire [(4'he):(1'h0)] wire209;
  wire [(4'hf):(1'h0)] wire208;
  wire signed [(5'h12):(1'h0)] wire207;
  wire signed [(4'he):(1'h0)] wire206;
  wire [(5'h10):(1'h0)] wire205;
  wire [(4'hd):(1'h0)] wire201;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire203;
  wire signed [(3'h5):(1'h0)] wire213;
  assign y = {wire215,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire201,
                 wire28,
                 wire6,
                 wire5,
                 wire4,
                 wire95,
                 wire203,
                 wire213,
                 (1'h0)};
  assign wire4 = wire0[(3'h7):(1'h1)];
  assign wire5 = ((({(wire2 ? wire2 : (8'had))} ?
                         wire2 : (wire0 ?
                             wire0[(2'h3):(1'h1)] : $signed(wire2))) + ({(wire1 ?
                             (8'hb8) : wire2),
                         (+wire4)} < wire2)) ?
                     $unsigned({(8'ha3)}) : $signed(wire2));
  assign wire6 = (|($signed({wire4[(4'h9):(1'h0)]}) < ($unsigned(wire4[(4'hc):(1'h0)]) << (wire3 && (wire4 ^~ (8'hbd))))));
  module7 #() modinst29 (wire28, clk, wire0, wire3, wire1, wire6, wire2);
  module30 #() modinst96 (.wire32(wire28), .clk(clk), .y(wire95), .wire31(wire3), .wire33(wire2), .wire34(wire5), .wire35(wire4));
  module97 #() modinst202 (wire201, clk, wire6, wire4, wire3, wire1, wire5);
  module30 #() modinst204 (wire203, clk, wire201, wire3, wire5, wire4, wire95);
  assign wire205 = (!$signed(wire1));
  assign wire206 = (wire3 > $signed(($unsigned((wire0 ? wire201 : wire95)) ?
                       $signed(wire3) : wire0)));
  assign wire207 = ((^~((wire95 <<< (wire2 + wire0)) ?
                           $unsigned($unsigned(wire6)) : $signed(wire5[(3'h7):(2'h2)]))) ?
                       (wire3[(4'he):(4'h8)] > (wire203 ?
                           $signed(wire4[(1'h0):(1'h0)]) : $unsigned({wire201,
                               wire3}))) : ($unsigned(($unsigned(wire5) ?
                           (^wire95) : $signed(wire4))) == (wire95[(2'h3):(1'h0)] ?
                           (8'had) : {wire5[(4'he):(1'h1)]})));
  assign wire208 = wire203;
  assign wire209 = wire207[(1'h0):(1'h0)];
  assign wire210 = wire2;
  module181 #() modinst212 (.clk(clk), .wire186(wire2), .wire182(wire0), .wire184(wire28), .wire185(wire203), .y(wire211), .wire183(wire208));
  module30 #() modinst214 (wire213, clk, wire210, wire1, wire3, wire207, wire209);
  module41 #() modinst216 (.clk(clk), .wire45(wire3), .y(wire215), .wire43(wire0), .wire44(wire203), .wire42(wire205));
endmodule

module module97  (y, clk, wire98, wire99, wire100, wire101, wire102);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire98;
  input wire signed [(3'h7):(1'h0)] wire99;
  input wire [(3'h7):(1'h0)] wire100;
  input wire [(4'ha):(1'h0)] wire101;
  input wire [(4'hc):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire200;
  wire signed [(4'h8):(1'h0)] wire199;
  wire [(3'h4):(1'h0)] wire198;
  wire [(4'ha):(1'h0)] wire179;
  wire [(5'h12):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire196;
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire179,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire103,
                 wire104,
                 wire131,
                 wire196,
                 (1'h0)};
  assign wire103 = (wire99[(3'h4):(2'h2)] ?
                       ($signed((!$unsigned(wire101))) > $signed({wire102,
                           (wire100 ^ (8'haf))})) : {($signed($signed(wire102)) ?
                               (wire102 ?
                                   $signed(wire98) : (wire98 && (8'hb1))) : wire98[(4'h8):(3'h5)])});
  assign wire104 = (!{wire99, $signed($unsigned($unsigned(wire99)))});
  module105 #() modinst132 (wire131, clk, wire98, wire101, wire104, wire99, wire102);
  assign wire133 = (~&(($signed(((8'hb5) ? wire98 : wire98)) ?
                       wire102[(3'h6):(3'h5)] : wire98[(3'h7):(2'h2)]) << wire131));
  assign wire134 = $signed(((+wire131[(3'h5):(2'h3)]) < $signed(wire103)));
  assign wire135 = wire104[(2'h2):(2'h2)];
  assign wire136 = $signed(wire98[(2'h2):(1'h0)]);
  assign wire137 = (~^wire101[(3'h6):(3'h6)]);
  assign wire138 = $unsigned(wire134[(2'h3):(2'h3)]);
  module139 #() modinst180 (.wire143(wire135), .clk(clk), .y(wire179), .wire140(wire133), .wire142(wire137), .wire144(wire134), .wire141(wire136));
  module181 #() modinst197 (.wire186(wire104), .wire182(wire133), .wire184(wire136), .clk(clk), .y(wire196), .wire185(wire135), .wire183(wire137));
  assign wire198 = (~$signed(wire135));
  assign wire199 = wire137;
  assign wire200 = (((((&wire133) ? wire99 : $signed(wire134)) ?
                       $signed(wire104[(3'h4):(1'h1)]) : wire102) & (((wire199 ?
                           (8'ha6) : wire103) >= (+(8'ha1))) ?
                       wire136[(3'h7):(3'h4)] : {(~&wire196)})) || wire138);
endmodule

module module30
#(parameter param93 = (((&(((8'hae) ? (8'ha8) : (8'had)) ^ {(8'ha4), (8'hbf)})) ? ((&((8'ha7) ? (8'hba) : (8'hbd))) ? {((7'h41) ? (8'hbf) : (8'hb3)), ((8'h9d) - (8'hbf))} : ((8'ha5) ? {(8'ha1), (8'ha4)} : (~&(8'ha3)))) : ((^(8'ha9)) ^ (8'hbc))) ? (((((8'ha8) - (8'ha5)) <= ((7'h43) <= (8'hb8))) ? (((8'hb7) ? (8'hbf) : (8'ha5)) ? ((8'hb4) ^~ (7'h43)) : (~|(8'h9d))) : (((8'hbb) ? (8'hb6) : (7'h44)) >> (~&(8'hb2)))) | ((((8'hab) ? (8'hbb) : (8'hab)) ? ((8'hac) ~^ (8'ha9)) : ((8'ha7) ? (8'hac) : (8'ha7))) ? (-(-(8'hb3))) : (((8'hae) ? (8'h9c) : (8'h9c)) ? ((8'hbc) ? (8'hbc) : (8'hab)) : ((8'hbb) - (8'h9c))))) : (&(((+(8'haf)) <= (&(7'h44))) ? (~|(~^(7'h42))) : ((~(8'had)) || {(8'hb4)})))), 
parameter param94 = (!param93))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire36;
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire82,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire36 = $unsigned((~$unsigned(wire33[(3'h6):(1'h0)])));
  assign wire37 = wire31[(2'h2):(1'h0)];
  assign wire38 = $unsigned($unsigned($signed($unsigned((!wire36)))));
  assign wire39 = ($unsigned((wire32[(2'h2):(1'h1)] ?
                      $signed((~|wire31)) : (^~wire34[(1'h1):(1'h0)]))) >= wire38);
  assign wire40 = $unsigned({wire35[(2'h3):(2'h3)]});
  module41 #() modinst83 (.wire44(wire35), .wire42(wire40), .wire43(wire38), .y(wire82), .wire45(wire34), .clk(clk));
  always
    @(posedge clk) begin
      reg84 <= ((~(&{(^~wire31)})) ?
          wire31[(3'h6):(3'h6)] : $signed({{wire36[(4'ha):(4'ha)]},
              $signed((wire36 ? wire35 : wire34))}));
      if (($unsigned($unsigned(wire33[(3'h4):(2'h3)])) <= ($unsigned((8'ha8)) > (wire39 ^~ $unsigned(((8'had) & (8'haa)))))))
        begin
          reg85 <= wire37;
          if ({$signed((wire36[(3'h7):(3'h6)] < wire39[(1'h0):(1'h0)])),
              $unsigned(wire33[(1'h0):(1'h0)])})
            begin
              reg86 <= reg85;
            end
          else
            begin
              reg86 <= reg84[(4'hd):(4'hc)];
              reg87 <= $signed($unsigned(wire36[(4'hf):(3'h4)]));
              reg88 <= (8'had);
            end
          reg89 <= wire35;
        end
      else
        begin
          reg85 <= wire34[(5'h10):(1'h0)];
        end
    end
  assign wire90 = ((reg86[(3'h5):(2'h3)] ?
                      (!($signed(reg88) ^~ reg87)) : wire32[(4'h9):(3'h4)]) ^~ wire32);
  assign wire91 = ($unsigned(wire82[(4'hb):(3'h6)]) || (reg87[(2'h2):(2'h2)] << (+wire37[(5'h10):(3'h6)])));
  assign wire92 = wire82[(1'h1):(1'h0)];
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire14,
                 wire13,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = $signed($unsigned({(~(wire12 + wire11))}));
  assign wire14 = wire12;
  always
    @(posedge clk) begin
      reg15 <= ((($signed((+wire12)) ?
              $unsigned(wire11) : wire9[(1'h0):(1'h0)]) ?
          wire14[(3'h4):(2'h2)] : wire10) && ($signed(wire9) ~^ wire13[(4'hb):(4'h8)]));
      reg16 <= $unsigned(wire11);
      reg17 <= wire13;
    end
  assign wire18 = wire12;
  assign wire19 = ($signed(($unsigned({reg16, wire11}) ?
                      $unsigned((8'hb5)) : {(reg17 <<< wire18)})) ~^ (&(~$unsigned((reg16 || (7'h41))))));
  always
    @(posedge clk) begin
      if (($unsigned({$signed($unsigned(wire19))}) ?
          ($unsigned(($unsigned(wire12) ?
                  (wire8 == wire14) : $unsigned(wire10))) ?
              (($signed(wire12) <= wire13[(5'h15):(3'h6)]) && ((reg17 ?
                      reg17 : (8'ha6)) ?
                  {wire12} : wire8)) : (((wire8 ? reg15 : wire8) ?
                  reg15 : $unsigned(reg17)) >= reg16)) : ($signed(({wire9,
                      reg15} ?
                  $signed(wire8) : $unsigned(wire11))) ?
              (^(|(wire11 & wire12))) : (^~$unsigned(((8'h9f) ?
                  wire9 : (8'had)))))))
        begin
          reg20 <= (~^{{wire12}, $signed($unsigned((^wire8)))});
          reg21 <= ((~^((^(reg20 ? (8'hb3) : wire13)) != ($signed(reg20) ?
              (reg17 >= wire10) : (wire19 - wire14)))) ^~ (((reg17 ?
                  (reg17 ? reg17 : wire10) : (reg15 ? wire14 : wire13)) ?
              $signed((wire18 ? wire12 : wire8)) : $unsigned((reg16 ?
                  reg17 : wire14))) > wire10[(3'h7):(3'h7)]));
          if (((((~((8'hae) * reg15)) + (|$unsigned(reg16))) ?
              ((8'haf) ?
                  wire10 : (^~((8'haf) ? wire10 : wire12))) : (((~|wire11) ?
                  $unsigned(wire19) : $unsigned(wire8)) ^ (((8'ha0) ?
                  wire8 : wire13) >>> (^~(8'hb3))))) || (&{(&wire11[(4'hc):(3'h5)]),
              (8'ha8)})))
            begin
              reg22 <= (!(+$unsigned(wire12)));
              reg23 <= (wire18 != $unsigned({$unsigned((wire8 + reg20)),
                  {$unsigned(wire8), (wire8 ? reg22 : wire18)}}));
              reg24 <= (($signed({(~&wire8), {reg16}}) ?
                      wire9[(5'h15):(3'h4)] : (reg20[(1'h0):(1'h0)] ?
                          (~^((8'ha2) <<< (8'h9d))) : ({(8'ha5)} ?
                              $unsigned((8'hb5)) : reg17[(3'h7):(3'h6)]))) ?
                  $signed((~^wire10)) : (|(reg23[(3'h5):(2'h2)] ?
                      $signed(((7'h43) ?
                          (8'hbd) : reg22)) : $unsigned(wire19))));
              reg25 <= (wire19[(2'h2):(1'h0)] ?
                  (reg22 >= {(^~((8'hb9) << reg15))}) : wire10[(3'h7):(3'h7)]);
            end
          else
            begin
              reg22 <= ((reg20 >>> $unsigned(((~|(8'ha2)) ?
                  ((8'haf) <<< wire11) : $unsigned(wire18)))) ~^ $unsigned({reg24,
                  (~&reg24)}));
              reg23 <= (~&reg16[(4'h9):(3'h4)]);
              reg24 <= {(~^wire11[(4'h9):(1'h0)])};
              reg25 <= $unsigned(((reg24[(4'ha):(4'h9)] ?
                      $signed(wire18) : {{wire11}}) ?
                  (((reg16 ? wire8 : (8'haf)) == wire8) ?
                      {reg17[(3'h7):(1'h0)]} : reg17[(3'h5):(2'h2)]) : ((wire8[(3'h7):(1'h0)] ?
                      $unsigned(reg16) : $signed((8'h9c))) <<< {$unsigned(reg21)})));
              reg26 <= $signed({$unsigned(wire19[(1'h1):(1'h1)]),
                  (($signed(wire19) ?
                      (wire8 < (8'ha5)) : (reg25 ?
                          wire12 : (8'hbc))) * wire9[(1'h0):(1'h0)])});
            end
          reg27 <= $signed(({$signed(reg17)} ?
              (($signed(wire9) >> (+wire19)) <= reg23[(4'h8):(4'h8)]) : {reg21}));
        end
      else
        begin
          reg20 <= (reg20 ?
              ({($signed(reg27) ? (|wire10) : reg24),
                      ($unsigned(wire9) ? (^(8'ha8)) : (~&reg23))} ?
                  (reg27 ?
                      $unsigned((~reg15)) : ($unsigned(wire10) ?
                          {(8'ha0),
                              reg25} : (-reg23))) : (wire18 <<< (reg15 ^ (~|reg16)))) : $signed(reg24[(4'ha):(3'h5)]));
        end
    end
endmodule

module module41
#(parameter param81 = {(((((8'ha5) == (8'hbe)) ? ((8'hab) > (8'hac)) : (~^(8'hb3))) ^ ((^~(8'hba)) >>> (-(8'hb1)))) ? (({(8'hbd), (8'h9d)} ? (^(8'haf)) : ((8'hbe) ? (8'ha6) : (8'h9d))) ? ({(7'h41), (8'hbd)} | (!(8'hae))) : (^~((8'hb6) + (8'hab)))) : ({((8'hb6) ? (8'haa) : (8'hae))} <= (&((7'h41) ? (8'hb4) : (8'hb5))))), (((~|(^(7'h43))) ? {((8'hbd) * (8'ha6)), ((8'haf) ? (8'hb6) : (8'hb2))} : {((8'hb5) ? (8'hbb) : (8'haa)), (~|(8'hba))}) ? ((((8'ha2) ? (8'hb6) : (8'ha8)) >= (&(8'hb7))) >> (~|((8'ha0) > (7'h43)))) : (~^(&((8'ha1) ^~ (8'hb4)))))})
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(3'h7):(1'h0)] wire43;
  input wire [(5'h10):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg46 <= (8'h9d);
      reg47 <= (reg46[(1'h1):(1'h1)] ?
          (({(reg46 ? wire45 : wire42)} ?
              (reg46[(1'h1):(1'h0)] ?
                  wire45 : reg46) : wire42[(4'h8):(1'h1)]) ~^ (!wire45)) : $signed(wire44[(1'h0):(1'h0)]));
      reg48 <= $signed(($unsigned(wire43[(3'h4):(1'h0)]) ?
          $unsigned(wire43) : (((wire45 ? reg47 : (8'hae)) ?
              wire43[(1'h1):(1'h0)] : reg47) >>> reg46)));
      if ($signed($unsigned(($signed((reg47 ? reg46 : wire44)) ?
          (((8'ha7) ?
              reg46 : reg48) ^ ((8'h9c) + reg47)) : ($signed((8'ha4)) << $unsigned(reg48))))))
        begin
          reg49 <= reg46[(1'h1):(1'h1)];
          reg50 <= (^~{(!$signed($unsigned(wire44)))});
          if ((|reg46))
            begin
              reg51 <= (8'hac);
              reg52 <= (8'hb3);
              reg53 <= {reg49[(2'h3):(2'h2)], reg47[(1'h1):(1'h1)]};
            end
          else
            begin
              reg51 <= reg52[(4'ha):(3'h6)];
              reg52 <= $unsigned((+reg53));
              reg53 <= (8'ha5);
            end
        end
      else
        begin
          if ($unsigned({$signed($signed($unsigned(reg48))),
              (reg51[(3'h4):(1'h1)] >> {(reg53 - wire44), $signed(reg49)})}))
            begin
              reg49 <= $unsigned(wire45);
              reg50 <= wire45;
              reg51 <= $signed((^~((^~{(8'hb2)}) || wire42)));
            end
          else
            begin
              reg49 <= $signed(({reg49, reg47} + {$unsigned(reg47),
                  ((~^reg47) ~^ wire44)}));
              reg50 <= wire42;
            end
          reg52 <= ((wire42 ^ (((reg51 ? reg50 : reg52) ?
              reg50 : (|reg50)) <= (wire42[(4'ha):(1'h0)] ~^ (8'ha5)))) - wire44);
        end
    end
  always
    @(posedge clk) begin
      reg54 <= ($signed((~^$unsigned(wire45))) ?
          reg46[(1'h1):(1'h0)] : ({$signed($unsigned(wire45))} >>> wire43));
      reg55 <= $signed((((-$signed(wire44)) ?
              wire44 : (wire42[(2'h2):(1'h1)] ~^ (wire43 <= reg47))) ?
          $unsigned(wire43[(2'h2):(1'h0)]) : reg50));
      reg56 <= (8'haa);
      reg57 <= ((reg53 ?
          $unsigned((&reg48)) : {{$unsigned(reg51), {reg53, reg50}},
              wire42}) * (((~&(wire42 ?
          reg47 : reg50)) ~^ $signed((reg54 != (7'h44)))) & $unsigned((~reg48[(1'h1):(1'h0)]))));
    end
  assign wire58 = ((wire42[(2'h2):(2'h2)] ? (!reg55) : reg49) ?
                      (($unsigned({wire44}) != (~|reg56[(1'h0):(1'h0)])) | $signed((!(wire45 == wire45)))) : reg49[(4'hc):(4'ha)]);
  assign wire59 = $unsigned((~|(({reg56} ?
                          (reg54 ? reg52 : reg53) : {(8'hb4), reg56}) ?
                      $unsigned($signed(reg51)) : reg53[(4'hc):(1'h0)])));
  assign wire60 = wire44;
  assign wire61 = (~{(wire44 ?
                          {$signed((8'h9e)), (-wire42)} : ($unsigned(reg56) ?
                              $unsigned((7'h43)) : (wire42 | wire42)))});
  assign wire62 = $signed((wire60[(3'h4):(2'h2)] ?
                      reg52[(4'h9):(3'h7)] : $signed(({wire42} ^ $signed((8'hb5))))));
  assign wire63 = reg50[(3'h6):(3'h4)];
  assign wire64 = reg54[(2'h3):(2'h3)];
  assign wire65 = ($signed((&(~^{wire43}))) * $signed(reg49[(5'h12):(3'h5)]));
  always
    @(posedge clk) begin
      if ($unsigned((~|($signed((~^reg49)) ?
          ((reg53 != wire63) ?
              (~^wire58) : $unsigned(reg48)) : ($unsigned(wire42) | $signed(reg53))))))
        begin
          if ($unsigned($unsigned({(((8'had) ?
                  wire42 : wire60) >> (+wire45))})))
            begin
              reg66 <= reg53[(4'hd):(3'h6)];
            end
          else
            begin
              reg66 <= ($signed(wire60[(2'h3):(2'h2)]) < $signed(wire61));
              reg67 <= reg53;
              reg68 <= $signed(({reg51} ? wire44[(3'h5):(1'h0)] : reg50));
              reg69 <= $signed($unsigned(($unsigned((~|reg53)) ?
                  (~^(reg55 ? wire64 : reg47)) : $unsigned((wire62 ?
                      reg55 : reg56)))));
            end
          if ((-reg48[(2'h2):(2'h2)]))
            begin
              reg70 <= (wire59[(3'h5):(2'h3)] <<< (8'hb0));
              reg71 <= ((reg66[(2'h2):(2'h2)] ?
                      {$signed(reg46[(2'h2):(1'h1)])} : $unsigned($unsigned($unsigned(reg52)))) ?
                  (!$signed((~^reg66[(1'h0):(1'h0)]))) : $signed((~&wire62[(4'h8):(3'h5)])));
              reg72 <= reg55;
            end
          else
            begin
              reg70 <= $unsigned({reg67,
                  (wire58 ?
                      (reg66[(3'h5):(3'h4)] ?
                          (8'ha8) : $unsigned(wire59)) : (|(wire59 <<< reg53)))});
              reg71 <= $unsigned((8'haf));
              reg72 <= (~|reg56[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg66 <= ((~^(|(reg56[(1'h0):(1'h0)] ?
                  reg47[(2'h3):(1'h0)] : ((8'haf) - wire45)))) ?
              $signed((~$signed((reg48 ?
                  wire60 : reg54)))) : $unsigned({$signed(wire44[(4'h9):(3'h7)])}));
        end
      reg73 <= reg51[(3'h6):(2'h3)];
      reg74 <= reg56;
      reg75 <= (reg51[(4'hb):(4'h9)] || (8'hb3));
      reg76 <= (~^wire44[(4'h8):(3'h6)]);
    end
  assign wire77 = wire64[(3'h5):(1'h0)];
  assign wire78 = wire77;
  assign wire79 = wire58[(3'h4):(2'h3)];
  assign wire80 = ($signed(($unsigned((!(8'ha4))) != $unsigned($unsigned(reg50)))) ?
                      (wire65 * (-reg46[(2'h2):(1'h1)])) : wire45[(3'h4):(1'h0)]);
endmodule

module module181  (y, clk, wire186, wire185, wire184, wire183, wire182);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire186;
  input wire [(4'hd):(1'h0)] wire185;
  input wire signed [(4'h8):(1'h0)] wire184;
  input wire signed [(2'h3):(1'h0)] wire183;
  input wire [(4'hc):(1'h0)] wire182;
  wire [(2'h2):(1'h0)] wire195;
  wire signed [(4'he):(1'h0)] wire189;
  wire [(2'h3):(1'h0)] wire188;
  wire [(4'he):(1'h0)] wire187;
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg192 = (1'h0);
  reg [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  assign y = {wire195,
                 wire189,
                 wire188,
                 wire187,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 (1'h0)};
  assign wire187 = {$unsigned(wire185[(1'h1):(1'h0)])};
  assign wire188 = wire186[(1'h1):(1'h0)];
  assign wire189 = $signed(($unsigned(wire186) ?
                       wire185[(1'h1):(1'h0)] : ((!wire183) ?
                           $signed((wire185 > wire187)) : {(wire183 >> (8'ha6))})));
  always
    @(posedge clk) begin
      if (((-wire184[(4'h8):(1'h1)]) ?
          wire184 : $signed($unsigned($signed($unsigned((8'ha4)))))))
        begin
          reg190 <= (!((+wire182) + $signed(wire189[(3'h7):(3'h4)])));
          reg191 <= (~$unsigned(wire186[(1'h0):(1'h0)]));
        end
      else
        begin
          reg190 <= $signed(($signed($signed(wire185[(4'ha):(3'h6)])) <= reg191[(2'h3):(2'h2)]));
          reg191 <= wire187[(2'h3):(2'h2)];
          reg192 <= $unsigned(reg190);
        end
      reg193 <= $signed($unsigned(reg191[(3'h6):(3'h5)]));
      reg194 <= $signed((^$signed(((~|wire189) > (~^wire184)))));
    end
  assign wire195 = (-($signed(wire189[(1'h0):(1'h0)]) - (wire189 > (wire183 ?
                       $unsigned(wire188) : {wire189, wire188}))));
endmodule

module module139
#(parameter param177 = ((8'ha5) - (-((7'h42) ^~ (((8'ha2) ? (8'hb2) : (8'h9d)) <= (8'hbb))))), 
parameter param178 = {param177, (^~(~^((~|param177) ? (param177 || param177) : (8'h9f))))})
(y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire144;
  input wire signed [(5'h15):(1'h0)] wire143;
  input wire signed [(3'h5):(1'h0)] wire142;
  input wire signed [(5'h15):(1'h0)] wire141;
  input wire [(4'he):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire [(5'h14):(1'h0)] wire174;
  wire signed [(4'hc):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  wire signed [(3'h5):(1'h0)] wire169;
  wire signed [(3'h5):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire145;
  reg [(2'h3):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg [(5'h15):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(2'h2):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 wire165,
                 wire145,
                 reg173,
                 reg172,
                 reg167,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire145 = ((~({$unsigned(wire141)} + (&$unsigned(wire140)))) ?
                       $unsigned((($unsigned(wire140) ?
                               $unsigned(wire141) : (8'ha4)) ?
                           (wire140 && wire140[(1'h0):(1'h0)]) : $unsigned((wire142 != wire140)))) : (wire141 ?
                           (^~(wire144[(1'h0):(1'h0)] ?
                               wire142[(3'h4):(2'h3)] : (-wire142))) : (^(~|{wire142}))));
  always
    @(posedge clk) begin
      if (({$signed((wire142 | wire143[(4'he):(1'h0)])),
          wire140} ~^ wire144[(3'h4):(2'h3)]))
        begin
          if ((^{$signed(((+wire141) + wire141))}))
            begin
              reg146 <= (~|$signed({(8'hb7), $signed(wire145)}));
              reg147 <= {{$signed(wire143)}};
            end
          else
            begin
              reg146 <= (((wire142 && ($signed(reg146) ?
                      (&(8'ha2)) : (8'hbf))) ?
                  reg146[(5'h10):(4'ha)] : {($unsigned(wire143) || (~&wire145)),
                      ($signed(reg146) ?
                          $signed(wire144) : (wire141 > (8'hb0)))}) && wire141[(2'h3):(2'h3)]);
              reg147 <= $signed((|$signed(wire143)));
            end
          reg148 <= (wire140[(1'h1):(1'h1)] && $signed({$unsigned($unsigned((7'h40))),
              {(wire143 >>> reg146), {wire144}}}));
          reg149 <= {wire142, wire140[(4'hb):(3'h6)]};
          if (($signed(reg147) || (($unsigned({reg147,
              wire143}) + ((reg146 & wire141) ?
              (wire140 <= wire144) : $unsigned(wire142))) >>> wire144[(2'h2):(2'h2)])))
            begin
              reg150 <= (wire144 ?
                  (~$unsigned((wire145 ?
                      wire140[(3'h7):(1'h0)] : {reg147,
                          wire142}))) : (reg146 << (~$unsigned((~&wire141)))));
              reg151 <= reg147[(4'h8):(3'h5)];
              reg152 <= ((reg146[(3'h5):(1'h0)] && wire145[(1'h1):(1'h1)]) || $unsigned($signed((|$unsigned(reg150)))));
              reg153 <= $signed({reg147, wire144[(1'h1):(1'h1)]});
            end
          else
            begin
              reg150 <= {(|$unsigned(((~|(8'hb5)) ?
                      wire145[(4'hc):(4'hb)] : (^wire140))))};
              reg151 <= (~|reg147[(2'h2):(1'h0)]);
              reg152 <= (&$signed(wire145[(4'hc):(4'h8)]));
              reg153 <= (wire143[(5'h14):(5'h10)] ?
                  reg146 : ({((reg152 == reg151) ?
                          (-reg146) : (~reg146))} <<< $signed($signed((8'haa)))));
            end
          reg154 <= $unsigned(reg146[(4'ha):(1'h0)]);
        end
      else
        begin
          reg146 <= ((-reg146[(3'h5):(3'h4)]) ?
              wire142 : (-$unsigned(reg152[(1'h0):(1'h0)])));
          if (($signed({(8'ha1)}) ? wire145[(3'h5):(2'h3)] : {reg152}))
            begin
              reg147 <= reg150;
              reg148 <= reg147;
              reg149 <= $unsigned((8'hb4));
              reg150 <= ($signed($unsigned($unsigned(reg146))) * $unsigned($unsigned(reg147)));
            end
          else
            begin
              reg147 <= ((reg146[(5'h11):(2'h3)] != $signed($unsigned({wire144}))) <= wire140);
              reg148 <= {(reg152 ?
                      (wire143 ?
                          reg152[(4'hd):(4'hd)] : ($signed((8'ha1)) > $signed(wire140))) : $signed($signed(((8'ha4) || reg150))))};
            end
          if ($signed({(|({(8'hbf)} ?
                  $signed(wire143) : wire142[(2'h3):(2'h3)])),
              wire145[(3'h4):(2'h3)]}))
            begin
              reg151 <= ($signed($unsigned(reg149)) != reg150);
              reg152 <= $unsigned($unsigned(wire145));
              reg153 <= ($signed(((!reg147) ?
                  $signed($signed(reg153)) : $unsigned(reg147[(2'h2):(1'h0)]))) << reg151);
              reg154 <= (!{((8'hb5) ? (8'hb8) : wire142[(2'h2):(1'h1)])});
            end
          else
            begin
              reg151 <= (((wire141 <= {wire145}) ? reg154 : (8'h9e)) ?
                  (&{$signed($signed(reg151)),
                      $unsigned(reg152)}) : $signed(($unsigned($unsigned(reg146)) ?
                      $unsigned(reg151) : (~$signed(reg147)))));
              reg152 <= (^~$unsigned((($signed(reg149) | (~wire144)) <= (-reg151[(3'h6):(1'h1)]))));
              reg153 <= $unsigned(wire144[(1'h0):(1'h0)]);
            end
          if (((!$signed(((^~wire142) ?
              (~|reg154) : (reg150 ?
                  wire142 : wire141)))) + $signed(({wire145[(2'h2):(1'h0)]} ?
              ({reg147} >>> reg149) : $signed((8'hac))))))
            begin
              reg155 <= $signed(($unsigned(reg150) ?
                  $signed(wire144[(1'h0):(1'h0)]) : {reg150}));
              reg156 <= (-($signed($unsigned($unsigned(reg146))) < (((~|reg150) ?
                      (reg152 >= reg148) : $unsigned(wire141)) ?
                  $unsigned($unsigned(reg150)) : $signed({(8'hb9)}))));
              reg157 <= ($signed((((|wire141) ?
                          (8'hbe) : (reg151 ? wire145 : (8'hb0))) ?
                      $unsigned((reg147 ?
                          reg151 : reg148)) : $unsigned((wire141 && (7'h40))))) ?
                  $signed((~&($unsigned(reg153) ?
                      $unsigned(reg152) : wire141[(4'he):(4'hd)]))) : $unsigned($signed((^~(8'hb2)))));
            end
          else
            begin
              reg155 <= (8'hbd);
              reg156 <= reg147;
              reg157 <= reg148;
              reg158 <= reg156[(4'ha):(3'h6)];
            end
          reg159 <= reg150;
        end
      if ($signed((((wire145[(5'h13):(4'hd)] ?
          (reg155 + (8'hb8)) : wire140[(4'hb):(4'h8)]) - (^~reg151)) && $unsigned(wire143[(3'h5):(2'h2)]))))
        begin
          reg160 <= $unsigned(reg154[(3'h7):(1'h1)]);
          reg161 <= (-reg148[(1'h1):(1'h1)]);
          reg162 <= $unsigned($unsigned((reg154[(4'hd):(2'h3)] ?
              {$signed(reg149)} : $signed(reg161))));
          reg163 <= (~|((($unsigned(wire142) ?
              (~|reg148) : (wire142 ? reg149 : wire143)) | {(reg161 > (8'hb4)),
              (wire142 * reg148)}) >= $unsigned($signed($signed((8'hba))))));
          reg164 <= reg153[(4'hc):(2'h2)];
        end
      else
        begin
          reg160 <= wire140[(2'h2):(1'h0)];
        end
    end
  assign wire165 = reg152[(4'hd):(2'h3)];
  assign wire166 = $unsigned(reg146);
  always
    @(posedge clk) begin
      reg167 <= (($unsigned((((8'ha4) != reg159) < reg150[(3'h6):(1'h1)])) ?
          $signed(($signed(reg163) <<< (!reg158))) : reg147[(4'ha):(2'h3)]) >> $unsigned($signed((-reg157))));
    end
  assign wire168 = (^(^$unsigned(reg146)));
  assign wire169 = $unsigned(((reg150[(4'h8):(1'h0)] * {$unsigned((8'hbf))}) + {reg163[(1'h0):(1'h0)],
                       $signed(((8'ha5) ? wire166 : reg146))}));
  assign wire170 = ({($unsigned((+(8'ha0))) ?
                           ({wire166} ?
                               (wire141 ?
                                   reg158 : wire141) : $signed(reg156)) : reg150),
                       ((((8'hbc) | reg156) >= ((8'ha3) ? reg157 : reg157)) ?
                           wire168 : (-$signed(reg164)))} * (reg163[(2'h2):(2'h2)] <<< wire144));
  assign wire171 = (+(!(((8'hae) >>> $unsigned((8'haf))) <= reg163)));
  always
    @(posedge clk) begin
      reg172 <= wire165[(1'h1):(1'h1)];
      reg173 <= (~($unsigned(($signed(reg147) ?
              {reg164} : wire145[(3'h4):(1'h1)])) ?
          ($signed(wire168) | reg150[(1'h0):(1'h0)]) : ((^~$signed(wire171)) ?
              wire144[(1'h0):(1'h0)] : wire166[(2'h2):(1'h1)])));
    end
  assign wire174 = $unsigned(reg150);
  assign wire175 = (&wire168[(3'h5):(2'h2)]);
  assign wire176 = reg147[(4'hb):(3'h5)];
endmodule

module module105
#(parameter param130 = (((((!(7'h42)) ? ((8'hb8) >= (8'ha7)) : ((8'hb0) ? (8'h9c) : (8'hb7))) ? ((&(8'ha8)) ? ((8'hb3) ? (7'h42) : (8'hb5)) : ((8'hb4) <= (8'hb2))) : (((7'h44) > (8'hbd)) ? ((8'hba) & (8'h9f)) : {(8'hba)})) ~^ (8'had)) <<< ((((~^(8'hbf)) << {(8'ha6), (8'ha7)}) | (((8'haf) || (8'hab)) - (8'ha2))) ? (((+(8'h9e)) ^ ((8'hac) ? (8'hbb) : (8'hbb))) ? (8'ha5) : (((8'hba) >= (8'ha0)) <<< ((7'h43) >>> (8'hb1)))) : (!(~(~|(8'hb8)))))))
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire110;
  input wire signed [(4'ha):(1'h0)] wire109;
  input wire [(3'h5):(1'h0)] wire108;
  input wire [(3'h5):(1'h0)] wire107;
  input wire signed [(4'hc):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire [(3'h7):(1'h0)] wire125;
  wire [(2'h2):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire111;
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire125,
                 wire124,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg127,
                 reg126,
                 reg123,
                 (1'h0)};
  assign wire111 = {(!$unsigned((+(|(8'ha6))))), (+wire110)};
  assign wire112 = $signed((wire106 != wire110));
  assign wire113 = (wire109[(1'h0):(1'h0)] ?
                       wire107[(1'h0):(1'h0)] : (~|$unsigned({wire112[(2'h2):(2'h2)],
                           (wire109 & wire110)})));
  assign wire114 = (~&wire107[(1'h0):(1'h0)]);
  assign wire115 = $unsigned($unsigned($unsigned(wire109[(4'h9):(4'h8)])));
  assign wire116 = (wire111 <= (8'hbc));
  assign wire117 = ((~|(wire106[(4'hb):(2'h3)] >= $unsigned((wire106 ?
                       wire112 : (8'hb4))))) << (8'ha9));
  assign wire118 = {$signed($signed($unsigned((|wire115))))};
  assign wire119 = wire117;
  assign wire120 = {(8'ha3)};
  assign wire121 = {(~(+(^(wire113 ? wire114 : wire108)))), wire108};
  assign wire122 = wire109;
  always
    @(posedge clk) begin
      reg123 <= wire106[(4'h9):(3'h6)];
    end
  assign wire124 = (~^$signed({$signed(((8'hb6) - wire121)),
                       $unsigned((wire114 <<< wire114))}));
  assign wire125 = reg123[(5'h10):(2'h3)];
  always
    @(posedge clk) begin
      reg126 <= wire125[(3'h4):(1'h1)];
      reg127 <= ((8'hb6) != (((wire117[(2'h3):(2'h3)] && $signed(wire122)) ?
          $unsigned($signed(reg126)) : (&{wire115})) << (wire112 ^~ ({wire115,
              (8'haf)} ?
          wire119[(5'h12):(5'h11)] : (wire121 ? wire119 : wire118)))));
    end
  assign wire128 = $signed((wire121[(1'h0):(1'h0)] ^~ ($signed(wire122) ?
                       wire125 : ((wire116 ? wire111 : wire116) + {wire114}))));
  assign wire129 = $signed(wire109);
endmodule
