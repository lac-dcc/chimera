module top
#(parameter param267 = {((((|(8'hb0)) ? (~^(8'h9c)) : ((8'ha2) ? (8'ha4) : (7'h40))) | (-((8'h9e) ? (8'ha5) : (8'haf)))) > ((((8'haa) | (8'ha4)) ? ((8'haa) ? (8'hac) : (8'h9d)) : ((8'hab) & (7'h40))) ? (((7'h40) ? (8'hbc) : (8'hbf)) ? {(7'h43), (8'hb5)} : ((8'hb1) <<< (8'hbd))) : ((!(8'haf)) >= ((8'ha8) ? (8'hb6) : (8'hbd)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire261;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire263;
  wire signed [(2'h3):(1'h0)] wire264;
  wire signed [(3'h5):(1'h0)] wire265;
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire261,
                 wire28,
                 wire27,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire263,
                 wire264,
                 wire265,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire4 = {wire3[(4'he):(4'hc)], wire0};
  assign wire5 = (({({wire2} ? $unsigned(wire3) : (wire4 ? wire1 : wire1)),
                             {wire1, (wire1 ? wire2 : wire2)}} ?
                         (^wire0) : $unsigned(wire0[(1'h1):(1'h0)])) ?
                     $signed({(^~wire1), wire1[(3'h5):(2'h3)]}) : {(wire3 ?
                             $signed((wire1 ?
                                 wire1 : wire0)) : $signed(wire1[(2'h2):(2'h2)])),
                         $signed(wire3[(1'h1):(1'h0)])});
  assign wire6 = wire0;
  assign wire7 = (wire3 ?
                     $unsigned({(~|(wire5 ? wire4 : wire6)),
                         wire5[(2'h3):(1'h0)]}) : (-wire0[(3'h7):(2'h3)]));
  assign wire8 = wire7[(4'h8):(3'h5)];
  assign wire9 = ((((wire0 ^ $signed(wire0)) ?
                         ($signed(wire2) ?
                             ((8'ha2) - wire7) : (wire7 || (8'hbe))) : $signed($signed(wire5))) ?
                     (({wire2, wire8} ?
                             wire8[(4'hf):(4'hb)] : ((8'hac) ? wire8 : wire0)) ?
                         ((wire0 ?
                             wire8 : wire1) << (~wire3)) : ($signed(wire2) ~^ $signed(wire0))) : {$signed($signed(wire0))}) && (-(wire1 ?
                     (^~(|wire0)) : $signed(((7'h41) ? wire4 : wire5)))));
  assign wire10 = wire9[(4'h8):(3'h4)];
  assign wire11 = wire6;
  assign wire12 = $unsigned(({$signed($unsigned(wire2))} + wire8));
  always
    @(posedge clk) begin
      reg13 <= {wire5[(3'h7):(3'h7)]};
      reg14 <= wire12;
      if ((wire8[(4'h9):(3'h4)] && (~&wire0)))
        begin
          if ($unsigned($unsigned($signed($signed({reg14})))))
            begin
              reg15 <= $signed(($signed(((^~wire10) != (&(7'h44)))) >> ($unsigned((^wire12)) >= reg14)));
              reg16 <= $unsigned((&((-(wire8 ?
                  reg14 : wire6)) <= ($signed(reg14) > {wire0, (8'hbe)}))));
              reg17 <= ($unsigned($unsigned(wire1)) ?
                  $signed(($signed({wire4}) ?
                      (8'hba) : $unsigned((-reg13)))) : ((((wire4 ?
                                  wire0 : wire6) ?
                              wire1[(3'h7):(3'h6)] : $unsigned(wire12)) ?
                          {$signed(wire1), wire7} : ((wire2 ?
                              wire0 : wire9) * wire7)) ?
                      $signed($unsigned(wire1)) : reg16));
            end
          else
            begin
              reg15 <= (((&((wire4 && wire0) ~^ wire7)) == $signed(wire3)) > reg13[(2'h2):(1'h1)]);
              reg16 <= $unsigned((($unsigned(wire7) ?
                      wire1 : $unsigned((wire8 ? wire4 : reg13))) ?
                  $signed(wire11[(3'h6):(3'h4)]) : wire1));
              reg17 <= ((~{$signed((wire7 ? (7'h41) : wire6))}) ?
                  $signed((|$unsigned($signed(wire8)))) : wire6[(4'hd):(4'hd)]);
              reg18 <= ((8'had) & wire5);
              reg19 <= (^~$signed((~&(wire4[(3'h6):(1'h1)] & $unsigned(wire6)))));
            end
        end
      else
        begin
          if (wire3)
            begin
              reg15 <= $unsigned((!$signed((+$signed(wire4)))));
              reg16 <= wire4;
              reg17 <= reg18;
            end
          else
            begin
              reg15 <= ($signed($signed(wire2)) >>> (wire11 + wire12));
            end
          reg18 <= ($signed($signed(wire12)) || {wire5,
              (((wire2 ? reg14 : wire4) ^ $unsigned(wire11)) ?
                  ($unsigned((8'h9f)) != {reg15, reg16}) : (^(8'hbd)))});
          reg19 <= {wire12[(1'h1):(1'h0)]};
          reg20 <= wire4[(4'hf):(4'hd)];
        end
    end
  assign wire21 = wire1[(4'ha):(4'ha)];
  assign wire22 = $unsigned((^~({{wire11}, {reg17}} > $unsigned(wire7))));
  assign wire23 = (($unsigned($signed($signed(wire0))) <= (!wire21)) ^~ $unsigned(wire6[(4'hd):(4'hd)]));
  assign wire24 = (((+reg15) ?
                          $signed((~|wire0)) : ((&((8'hb1) - reg14)) >> $signed((8'hae)))) ?
                      $unsigned($unsigned($signed(wire10[(3'h5):(3'h4)]))) : ((+(~^$unsigned(reg15))) ?
                          reg19[(1'h0):(1'h0)] : reg17));
  always
    @(posedge clk) begin
      reg25 <= ((8'ha7) ?
          ($signed($unsigned($signed(wire2))) ?
              reg19 : $unsigned((wire8[(4'hd):(4'hd)] + wire1[(2'h2):(2'h2)]))) : $unsigned($unsigned(wire0[(4'hf):(4'hb)])));
      reg26 <= (((wire1[(4'h8):(3'h6)] ?
          reg20[(4'hc):(4'h8)] : ($signed(wire10) >= reg13[(1'h1):(1'h1)])) < {({(8'hb0)} << wire6[(4'hb):(3'h4)]),
          (((8'haf) ? reg13 : wire6) ?
              (reg15 < reg25) : $signed(wire6))}) + wire24);
    end
  assign wire27 = {(wire9[(4'hb):(1'h0)] <= wire0)};
  assign wire28 = wire4[(4'he):(3'h5)];
  module29 #() modinst262 (.clk(clk), .wire31(reg14), .wire32(wire11), .wire30(wire0), .wire33(reg20), .y(wire261), .wire34(wire4));
  assign wire263 = (((wire1[(1'h1):(1'h0)] | (&wire0[(5'h12):(1'h0)])) ?
                           (+$unsigned($unsigned((8'ha4)))) : (((^~reg19) * $unsigned(wire22)) ?
                               wire261 : (8'haf))) ?
                       wire23 : wire8[(4'hc):(4'hb)]);
  assign wire264 = ((|$signed($signed((wire28 ? (8'hb8) : wire6)))) ?
                       $unsigned($unsigned(reg15)) : $signed((wire24[(1'h0):(1'h0)] ~^ {(wire6 <= wire3),
                           wire9})));
  module111 #() modinst266 (.wire115(wire261), .wire113(wire0), .y(wire265), .wire112(wire10), .clk(clk), .wire114(reg15));
endmodule

module module29
#(parameter param259 = ({{{(~|(7'h40)), (~^(8'had))}}, (((^(8'h9c)) ? ((8'hbd) ? (8'had) : (8'hbc)) : (^~(8'hbf))) >> {(|(8'hbf)), {(8'hac)}})} != {((~(8'ha0)) | {(-(8'hb1))})}), 
parameter param260 = {(~|(((+param259) ? (~|param259) : param259) != (param259 ? (|param259) : ((8'hb7) <<< param259))))})
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire [(4'hf):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire258;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire175;
  wire [(3'h7):(1'h0)] wire177;
  wire [(4'hc):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire179;
  wire signed [(5'h12):(1'h0)] wire180;
  wire signed [(3'h5):(1'h0)] wire181;
  wire [(4'h8):(1'h0)] wire232;
  wire [(4'h9):(1'h0)] wire234;
  wire signed [(4'hd):(1'h0)] wire235;
  wire [(4'h9):(1'h0)] wire236;
  wire signed [(3'h7):(1'h0)] wire256;
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  assign y = {wire258,
                 wire63,
                 wire35,
                 wire65,
                 wire74,
                 wire75,
                 wire107,
                 wire109,
                 wire110,
                 wire175,
                 wire177,
                 wire178,
                 wire179,
                 wire180,
                 wire181,
                 wire232,
                 wire234,
                 wire235,
                 wire236,
                 wire256,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 (1'h0)};
  assign wire35 = ($signed($signed(((wire32 == wire32) >> wire30[(4'h8):(2'h3)]))) == $unsigned(wire31));
  module36 #() modinst64 (.wire37(wire32), .wire41(wire34), .wire38(wire31), .y(wire63), .clk(clk), .wire40(wire30), .wire39(wire35));
  assign wire65 = (wire35[(1'h0):(1'h0)] <= {(wire30[(3'h4):(2'h2)] ?
                          wire34[(5'h10):(3'h6)] : (|(wire33 ?
                              (8'ha7) : wire32))),
                      wire30});
  always
    @(posedge clk) begin
      if (wire35)
        begin
          if ({$signed({(^$signed(wire31))}),
              (+(wire34[(5'h12):(3'h6)] & ($signed(wire35) ?
                  wire63 : wire65[(1'h1):(1'h0)])))})
            begin
              reg66 <= $unsigned((wire30 ^~ $signed(wire35[(3'h4):(2'h3)])));
              reg67 <= wire33;
              reg68 <= wire31;
              reg69 <= ($unsigned(({$signed(wire31)} ?
                      $signed(wire31[(4'hf):(2'h3)]) : ((|wire31) < reg67[(4'ha):(4'h9)]))) ?
                  {$unsigned((^(~(7'h42))))} : $signed(wire33));
            end
          else
            begin
              reg66 <= (&((8'hb2) != $unsigned({reg69[(2'h2):(2'h2)],
                  {wire35, wire32}})));
              reg67 <= $signed($signed(({wire31[(3'h4):(1'h1)],
                  $signed(wire33)} <<< (~^$unsigned((8'hae))))));
              reg68 <= $unsigned(wire34);
            end
          reg70 <= {reg68[(4'he):(3'h6)]};
          reg71 <= wire32[(4'hf):(2'h2)];
        end
      else
        begin
          reg66 <= $signed($unsigned($unsigned($signed((reg71 ?
              reg70 : wire30)))));
        end
      reg72 <= ($unsigned(($signed((~wire65)) ?
          ($unsigned(wire31) != (~&reg70)) : $unsigned(reg71))) ~^ (wire35 >= $signed(reg66)));
      reg73 <= wire65;
    end
  assign wire74 = $unsigned($signed($unsigned((&(wire31 <<< wire65)))));
  assign wire75 = (~reg67);
  module76 #() modinst108 (.clk(clk), .wire80(wire34), .wire81(wire75), .wire79(wire31), .wire77(wire32), .wire78(reg69), .y(wire107));
  assign wire109 = $unsigned($unsigned(($signed((wire32 ?
                       (8'haf) : wire74)) & ((wire63 || reg67) && reg73))));
  assign wire110 = ($signed(($signed(wire31[(4'hf):(3'h4)]) ?
                           (wire63 && {reg72,
                               reg69}) : (wire35[(2'h2):(1'h1)] != $unsigned(wire35)))) ?
                       $signed(wire107) : $unsigned($unsigned($unsigned(reg73[(4'hf):(4'h8)]))));
  module111 #() modinst176 (.y(wire175), .clk(clk), .wire115(wire74), .wire112(wire33), .wire113(reg66), .wire114(reg72));
  assign wire177 = $signed(wire75);
  assign wire178 = wire110;
  assign wire179 = ((+reg68[(3'h4):(1'h1)]) >>> {$unsigned({(^reg70),
                           $signed(wire175)}),
                       wire109[(3'h5):(2'h2)]});
  assign wire180 = wire65;
  assign wire181 = (~^$unsigned(($signed(wire175[(3'h6):(2'h2)]) ?
                       $signed($signed(wire34)) : $unsigned($unsigned(wire65)))));
  module182 #() modinst233 (.wire183(wire33), .y(wire232), .wire186(wire109), .wire184(reg70), .wire185(reg71), .clk(clk));
  assign wire234 = (8'hbe);
  assign wire235 = reg69[(3'h6):(1'h1)];
  assign wire236 = (^$unsigned(((wire109 != (^~reg70)) ~^ ({wire110} - (wire180 ?
                       wire178 : wire110)))));
  module237 #() modinst257 (.y(wire256), .wire242(wire65), .wire241(reg67), .wire239(wire180), .wire240(wire109), .wire238(reg72), .clk(clk));
  assign wire258 = wire31[(1'h1):(1'h1)];
endmodule

module module237  (y, clk, wire242, wire241, wire240, wire239, wire238);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire242;
  input wire [(3'h7):(1'h0)] wire241;
  input wire signed [(4'hb):(1'h0)] wire240;
  input wire [(5'h12):(1'h0)] wire239;
  input wire [(4'h8):(1'h0)] wire238;
  wire signed [(3'h5):(1'h0)] wire255;
  wire [(3'h6):(1'h0)] wire249;
  wire signed [(5'h11):(1'h0)] wire248;
  wire [(3'h4):(1'h0)] wire243;
  reg [(3'h4):(1'h0)] reg254 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg253 = (1'h0);
  reg [(4'hb):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg251 = (1'h0);
  reg [(4'hd):(1'h0)] reg250 = (1'h0);
  reg [(4'he):(1'h0)] reg247 = (1'h0);
  reg [(4'h8):(1'h0)] reg246 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg245 = (1'h0);
  reg [(4'h9):(1'h0)] reg244 = (1'h0);
  assign y = {wire255,
                 wire249,
                 wire248,
                 wire243,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 (1'h0)};
  assign wire243 = $signed({{$signed((&wire239)), wire239}});
  always
    @(posedge clk) begin
      if (((|wire241) ?
          (wire243[(1'h0):(1'h0)] && $signed(wire239)) : wire240[(4'h9):(1'h1)]))
        begin
          if (wire241)
            begin
              reg244 <= (({wire241[(2'h2):(2'h2)], wire240[(4'h9):(2'h2)]} ?
                  $unsigned({{wire238, wire239},
                      (wire243 << wire240)}) : (($unsigned(wire243) >>> $signed(wire239)) ?
                      wire241 : wire238[(1'h1):(1'h0)])) >>> {($unsigned((wire240 ?
                      wire243 : wire243)) - (wire240 ^ $signed(wire241))),
                  wire242[(1'h0):(1'h0)]});
            end
          else
            begin
              reg244 <= $signed(({((8'hb9) && (wire243 != wire241)),
                      $unsigned($signed(wire241))} ?
                  {(^((8'hb6) ~^ wire243))} : $signed((reg244 ^ wire242))));
            end
          reg245 <= wire241[(3'h6):(3'h5)];
          reg246 <= $signed(wire239);
        end
      else
        begin
          reg244 <= (+$unsigned(($signed($unsigned(reg245)) + $signed($unsigned(reg245)))));
        end
      reg247 <= wire240;
    end
  assign wire248 = reg244;
  assign wire249 = wire241;
  always
    @(posedge clk) begin
      reg250 <= (~&(-wire241));
      reg251 <= (wire242[(4'h8):(4'h8)] >>> (~(^$unsigned((wire238 ?
          wire238 : wire239)))));
      reg252 <= $signed(wire238);
      reg253 <= $unsigned($signed((-$unsigned({wire248}))));
      reg254 <= (~&(((~^$unsigned(wire248)) >>> ((wire241 * wire241) ~^ (^~reg252))) ?
          reg245 : wire242[(3'h7):(3'h4)]));
    end
  assign wire255 = (~|reg251);
endmodule

module module182
#(parameter param231 = (~&(^~{(~((7'h43) ? (8'hab) : (8'h9e))), (((8'hab) ? (7'h40) : (8'hbe)) && ((7'h41) + (8'hb7)))})))
(y, clk, wire186, wire185, wire184, wire183);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire186;
  input wire [(4'he):(1'h0)] wire185;
  input wire signed [(3'h7):(1'h0)] wire184;
  input wire signed [(2'h2):(1'h0)] wire183;
  wire [(4'h8):(1'h0)] wire230;
  wire signed [(5'h13):(1'h0)] wire229;
  wire [(5'h11):(1'h0)] wire228;
  wire [(3'h7):(1'h0)] wire227;
  wire signed [(4'h9):(1'h0)] wire211;
  wire signed [(3'h5):(1'h0)] wire210;
  wire [(4'ha):(1'h0)] wire209;
  wire [(5'h12):(1'h0)] wire208;
  wire signed [(5'h12):(1'h0)] wire207;
  wire [(5'h12):(1'h0)] wire206;
  wire signed [(4'hf):(1'h0)] wire205;
  wire signed [(5'h13):(1'h0)] wire204;
  wire signed [(3'h7):(1'h0)] wire203;
  wire signed [(4'h9):(1'h0)] wire202;
  wire signed [(4'h9):(1'h0)] wire201;
  wire signed [(2'h2):(1'h0)] wire200;
  wire signed [(2'h2):(1'h0)] wire199;
  reg [(5'h15):(1'h0)] reg226 = (1'h0);
  reg [(5'h11):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg224 = (1'h0);
  reg [(5'h12):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg222 = (1'h0);
  reg [(4'hc):(1'h0)] reg221 = (1'h0);
  reg [(4'hf):(1'h0)] reg220 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg219 = (1'h0);
  reg [(3'h6):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg217 = (1'h0);
  reg [(3'h6):(1'h0)] reg216 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg215 = (1'h0);
  reg [(2'h2):(1'h0)] reg214 = (1'h0);
  reg [(3'h6):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg198 = (1'h0);
  reg [(4'ha):(1'h0)] reg197 = (1'h0);
  reg [(3'h7):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg195 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg194 = (1'h0);
  reg [(4'hc):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  assign y = {wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg187 <= wire186[(5'h11):(3'h5)];
      reg188 <= (^(($signed((reg187 ? wire183 : wire183)) != (^(|wire186))) ?
          reg187 : $signed({wire186})));
      reg189 <= $unsigned(wire184);
      if ((reg188[(4'h8):(2'h3)] >>> $unsigned(reg189[(2'h3):(2'h2)])))
        begin
          reg190 <= $unsigned(wire185[(3'h5):(1'h0)]);
          reg191 <= (~^($unsigned($unsigned(reg187)) ?
              reg188 : $signed((+(+reg190)))));
        end
      else
        begin
          if ((~{wire183, (reg191 >>> $signed($unsigned((8'h9c))))}))
            begin
              reg190 <= (-{$signed(reg187[(2'h2):(1'h0)])});
              reg191 <= ((wire185[(1'h1):(1'h0)] < (((^~wire183) ?
                          (-wire185) : wire185[(4'h8):(1'h0)]) ?
                      $unsigned($unsigned(wire183)) : $signed(reg191[(2'h2):(1'h1)]))) ?
                  reg187 : $signed(($signed((reg191 > wire185)) ?
                      wire183 : {{wire184, wire186}, (reg191 <= wire185)})));
              reg192 <= $unsigned((~&$unsigned((~&(wire185 ?
                  wire185 : reg189)))));
              reg193 <= $signed((~|(reg190[(1'h0):(1'h0)] <= ($signed(wire183) ?
                  (reg189 <= reg189) : (~|reg189)))));
            end
          else
            begin
              reg190 <= ({reg189, (8'hb1)} || $signed((^reg188)));
              reg191 <= ((({((8'hba) ?
                              reg189 : reg187)} && $signed(reg189[(1'h1):(1'h1)])) ?
                      (&reg189) : (reg188[(3'h7):(2'h3)] ?
                          ({reg192, reg188} ?
                              $signed((8'hb4)) : $unsigned(reg192)) : {(~|wire185),
                              reg190})) ?
                  (!{((^reg187) ? {reg187} : (^reg190)),
                      $unsigned((-reg193))}) : ($unsigned({(!reg190),
                          $unsigned(reg191)}) ?
                      $signed((reg191 ?
                          (reg192 ?
                              reg191 : wire184) : (-wire186))) : $unsigned($signed((&wire186)))));
              reg192 <= {reg188};
            end
          reg194 <= $signed((~{((wire186 == reg190) << (wire183 - reg187)),
              reg193[(4'h9):(3'h6)]}));
        end
      reg195 <= $unsigned($unsigned({((|reg192) ? reg188 : (~|reg188))}));
    end
  always
    @(posedge clk) begin
      reg196 <= $unsigned((~|($unsigned({wire185,
          (8'h9e)}) & (~|$signed(reg188)))));
      reg197 <= (wire185[(3'h7):(1'h1)] && ((!(8'hb3)) >>> $signed(reg195[(4'ha):(3'h6)])));
      reg198 <= ((~^{(wire185[(4'hb):(3'h5)] ? (reg196 >= wire186) : {wire183}),
          (|reg188[(4'h8):(1'h1)])}) <<< wire186);
    end
  assign wire199 = $signed(($signed({$signed(reg191),
                           ((7'h42) ? wire184 : reg195)}) ?
                       ((^$unsigned((8'ha7))) ?
                           reg189 : (~|(reg192 ?
                               reg189 : reg192))) : $unsigned(reg196[(2'h3):(1'h0)])));
  assign wire200 = $signed(reg188);
  assign wire201 = wire183[(2'h2):(1'h1)];
  assign wire202 = ($unsigned(reg191) * (~^$unsigned(((reg191 != wire201) || (~&reg194)))));
  assign wire203 = (8'hb6);
  assign wire204 = {(($signed(wire186) ?
                               ($signed(reg187) ?
                                   $unsigned((8'h9e)) : ((7'h43) ?
                                       reg193 : wire184)) : (!(|reg189))) ?
                           wire186[(5'h13):(2'h2)] : wire183[(1'h0):(1'h0)]),
                       reg192};
  assign wire205 = wire203;
  assign wire206 = $signed((!$unsigned($unsigned($unsigned((8'hbf))))));
  assign wire207 = reg193;
  assign wire208 = $unsigned(wire204[(3'h6):(3'h5)]);
  assign wire209 = $unsigned((!(~&{{wire202, wire204}, (~wire184)})));
  assign wire210 = (($unsigned(($signed(reg189) != $unsigned(wire209))) + $unsigned(((~^(8'h9f)) ?
                       wire184[(3'h7):(1'h0)] : reg187))) <<< (~|(8'ha5)));
  assign wire211 = reg196[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if ((+({(wire183 ^~ reg188),
          ((^wire203) ?
              reg194 : (~^reg195))} < $unsigned((~&(wire208 || reg191))))))
        begin
          reg212 <= $unsigned((^~(reg197 == $unsigned((reg187 && reg191)))));
        end
      else
        begin
          reg212 <= (8'ha6);
        end
      if ($unsigned(reg195))
        begin
          reg213 <= ({((wire183 ? (&wire208) : $signed(reg192)) ?
                      (8'ha7) : reg189)} ?
              ({{(~wire203)}} <<< reg188[(4'h9):(4'h9)]) : (!wire207));
          reg214 <= (&wire201[(4'h9):(3'h6)]);
          if (($unsigned(((!wire211) ? reg191 : wire205)) ?
              (+$signed($signed((!reg190)))) : (-(|wire203[(3'h4):(3'h4)]))))
            begin
              reg215 <= (($unsigned(($unsigned(wire206) * (~wire208))) && (^~($signed(reg187) ?
                  $signed(reg191) : reg190[(1'h1):(1'h1)]))) > $signed({reg188}));
              reg216 <= wire208;
              reg217 <= wire205;
            end
          else
            begin
              reg215 <= {$signed((wire203[(1'h0):(1'h0)] ?
                      ($signed(reg213) == $unsigned(reg212)) : reg192)),
                  (($unsigned((wire205 + reg188)) ?
                          $unsigned($unsigned(reg212)) : {reg215}) ?
                      $unsigned({$signed(wire203)}) : $unsigned({$unsigned((7'h41))}))};
              reg216 <= (&{$unsigned($signed(reg192[(2'h2):(2'h2)])),
                  (|(reg189[(1'h1):(1'h0)] ?
                      $signed(reg198) : $unsigned((8'h9d))))});
              reg217 <= reg189;
              reg218 <= wire207;
              reg219 <= $unsigned((8'ha1));
            end
        end
      else
        begin
          reg213 <= ($unsigned((reg193 | $unsigned((^(8'had))))) >>> ($signed($signed(reg193)) <<< reg196));
          reg214 <= (^~wire202);
          reg215 <= reg196;
          reg216 <= ($unsigned($signed($signed(((8'ha5) ^ reg190)))) ?
              ($signed((reg213 < (-(8'h9e)))) ?
                  $signed((reg193[(3'h6):(1'h0)] ?
                      $signed(wire202) : ((7'h44) ?
                          wire204 : wire209))) : reg193[(3'h6):(2'h3)]) : (^~reg215[(2'h3):(2'h3)]));
        end
      reg220 <= ((($signed((reg219 != wire185)) >= (!(reg218 ?
              reg198 : reg213))) - {{(!reg217)}, $signed(wire204)}) ?
          ((wire205 != {reg191[(3'h4):(2'h2)],
              (reg194 ?
                  reg198 : wire199)}) * (wire204[(1'h1):(1'h0)] * reg213)) : (reg189 ?
              {reg215[(3'h6):(3'h4)]} : $signed(({wire206, reg196} * (reg218 ?
                  reg219 : reg215)))));
      if ($signed($signed(reg196[(3'h6):(1'h1)])))
        begin
          if (($unsigned((-$signed((reg213 ?
              reg192 : reg212)))) ~^ (({(&(8'hb7)), (|wire201)} ?
              wire200 : (|(wire211 ? reg220 : (8'ha2)))) * (wire207 ?
              (reg190[(1'h0):(1'h0)] >>> reg197) : reg189))))
            begin
              reg221 <= reg217[(4'he):(4'hc)];
              reg222 <= ((~^(8'ha2)) != $signed($signed(wire208[(3'h5):(1'h0)])));
            end
          else
            begin
              reg221 <= (8'ha9);
              reg222 <= ($signed(((reg187 ?
                      (|(8'hb8)) : (wire186 ? reg221 : wire210)) ?
                  (~(reg212 ?
                      reg216 : (8'hb9))) : $signed($signed(reg192)))) ^ ($signed((!reg218)) ?
                  reg218 : (~|(wire185[(3'h5):(3'h5)] <<< $signed(reg214)))));
              reg223 <= ((|$signed(reg212)) <<< reg218);
              reg224 <= wire204[(4'hc):(4'ha)];
            end
        end
      else
        begin
          reg221 <= $signed({$signed((&$unsigned(reg213)))});
          if ((^($signed(wire204) >= $unsigned(($unsigned(wire185) == $signed(reg215))))))
            begin
              reg222 <= reg214;
              reg223 <= (+(($signed($signed(wire202)) << $signed($signed(reg194))) ~^ {wire200[(1'h1):(1'h1)],
                  (reg196[(2'h3):(2'h3)] ? $signed(reg194) : (~^reg218))}));
              reg224 <= $signed(($signed($signed($signed(reg198))) && wire185[(4'h8):(3'h5)]));
              reg225 <= $unsigned(wire206);
            end
          else
            begin
              reg222 <= ($signed((8'haf)) ?
                  {$unsigned(reg197[(3'h4):(1'h0)]),
                      (!(wire203 || reg193[(2'h3):(1'h1)]))} : (reg220[(3'h5):(2'h3)] ~^ (($signed(reg197) ?
                      reg213 : (8'hba)) <<< $unsigned((wire183 * reg195)))));
              reg223 <= (8'ha0);
              reg224 <= ($unsigned((+wire206)) ?
                  ((8'h9e) ^~ ({$signed(wire203),
                      wire202[(4'h9):(1'h1)]} >> wire208)) : (8'hb9));
              reg225 <= wire208;
            end
        end
      reg226 <= $unsigned($signed(wire209));
    end
  assign wire227 = reg217;
  assign wire228 = $signed(($signed(((reg222 ? reg195 : wire227) >>> (wire200 ?
                       (8'hbb) : reg198))) ~^ $unsigned(reg224)));
  assign wire229 = (reg220 ?
                       (wire207 == $signed(wire204)) : wire208[(3'h5):(1'h1)]);
  assign wire230 = ((|((reg223[(5'h12):(2'h3)] <<< (wire208 ?
                               wire201 : (7'h40))) ?
                           (!$signed(wire205)) : (^~reg225))) ?
                       reg196[(1'h0):(1'h0)] : (&$signed({$signed(reg198)})));
endmodule

module module111
#(parameter param174 = (~|{(7'h43)}))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire115;
  input wire [(3'h7):(1'h0)] wire114;
  input wire [(5'h11):(1'h0)] wire113;
  input wire signed [(4'he):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire170;
  wire [(3'h5):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire168;
  wire signed [(5'h15):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire165;
  wire signed [(4'h9):(1'h0)] wire164;
  wire signed [(5'h10):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire162;
  wire [(4'hd):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  reg [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  assign y = {wire173,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire138,
                 wire137,
                 wire129,
                 wire128,
                 wire127,
                 reg172,
                 reg171,
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
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({((8'ha7) <= $unsigned((8'hbd))),
          (!(~^wire112[(4'ha):(3'h5)]))} & $signed((wire113 ?
          $unsigned(wire115) : {{wire114}, (wire115 ? wire113 : wire112)}))))
        begin
          reg116 <= wire112[(4'he):(2'h3)];
          reg117 <= wire113[(3'h5):(1'h0)];
        end
      else
        begin
          reg116 <= {{wire113[(4'he):(4'h9)]}};
          reg117 <= (-$signed(reg116));
          reg118 <= (^((&(~&(~wire112))) == (~^(-wire115))));
          if ((!wire112[(4'he):(4'hd)]))
            begin
              reg119 <= $unsigned($unsigned($unsigned($signed($unsigned(wire113)))));
              reg120 <= $unsigned($signed(($unsigned({reg117, wire114}) ?
                  {$unsigned((8'hb0))} : $unsigned((-reg119)))));
              reg121 <= wire115[(4'h9):(3'h5)];
            end
          else
            begin
              reg119 <= (&(~|reg119));
              reg120 <= $unsigned(($signed(reg120) << ($signed($unsigned((8'hb2))) ?
                  wire115 : reg117[(4'h8):(3'h7)])));
              reg121 <= wire113;
              reg122 <= $unsigned(wire115[(3'h5):(1'h1)]);
            end
          reg123 <= reg122[(2'h3):(1'h0)];
        end
      reg124 <= $unsigned((8'hba));
      if ((8'hb1))
        begin
          reg125 <= (~^{(^((!reg117) < $signed(reg119)))});
          reg126 <= ((~|$signed(reg125)) - $signed(reg118));
        end
      else
        begin
          reg125 <= reg118[(1'h0):(1'h0)];
        end
    end
  assign wire127 = ((~|$signed($unsigned($unsigned((8'hb8))))) <= $signed($unsigned(((|reg121) <<< wire114[(1'h0):(1'h0)]))));
  assign wire128 = (-wire113[(4'hf):(4'hd)]);
  assign wire129 = $signed(((reg119 || ((reg118 || reg123) - reg121)) ?
                       wire128 : $unsigned(($unsigned(wire114) + $signed(reg126)))));
  always
    @(posedge clk) begin
      reg130 <= {reg125};
      if (reg122[(1'h1):(1'h0)])
        begin
          reg131 <= $unsigned(wire114);
          if ($unsigned(wire113))
            begin
              reg132 <= wire128;
              reg133 <= ((($unsigned($unsigned(reg117)) ?
                      (&((8'ha0) ?
                          reg116 : wire115)) : $unsigned((|reg123))) < ($signed((+(8'haf))) ?
                      ((reg117 < wire113) | (~^reg120)) : (^~$signed(reg116)))) ?
                  reg123[(3'h6):(3'h5)] : reg119[(4'ha):(1'h0)]);
              reg134 <= ((reg121 ^ wire129) <= reg126);
              reg135 <= $unsigned($unsigned((wire114[(3'h4):(1'h0)] * (reg123[(1'h1):(1'h1)] * wire113))));
              reg136 <= reg130;
            end
          else
            begin
              reg132 <= $unsigned($signed(($unsigned(wire127) >> ((!(8'had)) ?
                  $unsigned(wire114) : (reg131 ? reg119 : (8'haa))))));
              reg133 <= $unsigned(wire129[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg131 <= $unsigned(($signed(reg118[(3'h4):(3'h4)]) ?
              ({$signed((8'ha3))} ?
                  wire129 : $unsigned(((8'hb8) ?
                      wire129 : reg126))) : ($signed({reg121}) ?
                  $unsigned((reg120 ? reg119 : wire113)) : $unsigned(reg126))));
          if (reg136[(1'h1):(1'h0)])
            begin
              reg132 <= ({(reg131[(3'h4):(2'h2)] < $unsigned($signed(wire128)))} < ((~(~&$unsigned(reg135))) | ({$unsigned(reg133)} >> (reg136[(1'h1):(1'h0)] <<< $unsigned(reg126)))));
            end
          else
            begin
              reg132 <= {(($unsigned(reg133) * $unsigned((wire114 < reg116))) ?
                      wire114[(3'h5):(3'h5)] : ($signed({wire127}) ?
                          reg122[(1'h1):(1'h0)] : (~&reg122[(1'h1):(1'h1)]))),
                  ((^~(^((8'hb3) >= (8'ha3)))) <<< wire114[(2'h2):(2'h2)])};
              reg133 <= ((~&$signed({$signed(wire112),
                  (wire128 ? reg131 : (8'hb1))})) <<< {((+{reg135,
                      reg132}) ~^ reg120[(2'h3):(2'h3)])});
            end
        end
    end
  assign wire137 = ((~^reg134) >>> $unsigned(reg134));
  assign wire138 = (((~&(reg135[(2'h3):(1'h1)] ?
                       $signed(reg132) : {reg135})) >= (wire128[(1'h1):(1'h0)] >> $unsigned((^~reg134)))) || $unsigned(reg116));
  always
    @(posedge clk) begin
      reg139 <= (~$unsigned(({$signed(reg132), (wire129 >> wire112)} ?
          reg122[(1'h1):(1'h0)] : $unsigned(wire128))));
      if (reg122[(1'h0):(1'h0)])
        begin
          if (wire129)
            begin
              reg140 <= reg131;
              reg141 <= reg123;
              reg142 <= (+(wire128 ?
                  reg123[(3'h7):(3'h4)] : {(((8'hb6) ?
                          reg139 : reg141) && ((8'hae) ? (8'ha3) : wire112)),
                      {{reg125, reg130}}}));
            end
          else
            begin
              reg140 <= (((^(8'hbf)) ?
                  $unsigned(wire137[(4'h9):(3'h4)]) : $signed($unsigned(reg140[(1'h1):(1'h0)]))) >>> ($signed({((7'h40) ?
                          wire138 : reg132),
                      reg140[(2'h3):(2'h2)]}) ?
                  reg120[(3'h4):(2'h2)] : ((|(wire138 ?
                      reg131 : wire129)) == $signed($unsigned(reg118)))));
            end
          reg143 <= ($signed({{(reg142 ? reg139 : (8'hbc)),
                  {reg121,
                      (8'hbf)}}}) && ($unsigned((~&$unsigned(reg131))) - (~^reg116)));
          if ($signed((+reg130[(5'h15):(3'h7)])))
            begin
              reg144 <= reg133;
              reg145 <= ($signed((reg134 & $signed((reg142 ?
                      reg117 : reg144)))) ?
                  {reg139} : (({(+reg135)} ?
                      ($signed(reg125) ?
                          wire114 : (^~reg125)) : $signed((reg122 ?
                          wire127 : wire127))) > (^($signed(wire137) ?
                      (reg135 ^~ reg135) : reg125[(3'h4):(2'h2)]))));
              reg146 <= $unsigned(({{{reg132}, {wire114}}} ?
                  (8'hac) : $signed(reg142)));
            end
          else
            begin
              reg144 <= (($unsigned(($signed(reg122) >>> $unsigned(reg139))) >= ($unsigned(reg134) <<< ((wire112 ?
                  wire129 : reg142) & $signed(reg134)))) >>> {$unsigned(reg117[(1'h0):(1'h0)]),
                  $signed(reg122)});
              reg145 <= $signed((~^{$signed($unsigned(reg126))}));
              reg146 <= wire115;
              reg147 <= (^$unsigned((~^(-$unsigned(reg141)))));
              reg148 <= (^(reg145 ?
                  reg121[(3'h6):(1'h1)] : $unsigned({wire112,
                      (reg147 ? (7'h41) : reg117)})));
            end
        end
      else
        begin
          reg140 <= reg134;
          reg141 <= ((reg146 <= (7'h41)) ?
              $unsigned((wire113[(3'h7):(1'h1)] + $signed((~^(8'h9c))))) : reg130);
          reg142 <= $unsigned(reg135);
          reg143 <= (^{(8'h9c)});
          if (reg121)
            begin
              reg144 <= wire129;
              reg145 <= (^(~^reg145));
              reg146 <= wire115[(3'h6):(2'h3)];
              reg147 <= $unsigned(reg117);
            end
          else
            begin
              reg144 <= $signed($signed(((!(reg145 ?
                  (8'hab) : reg146)) | ((reg125 ?
                  reg147 : reg121) > $signed(reg132)))));
            end
        end
      reg149 <= {((|reg141) ? (&(+$unsigned(reg144))) : {wire127})};
      if ($signed($signed(reg118[(2'h3):(1'h0)])))
        begin
          reg150 <= (+$signed(wire128));
        end
      else
        begin
          if ((wire129[(1'h1):(1'h0)] ?
              reg147 : (+$unsigned($signed($signed(reg125))))))
            begin
              reg150 <= wire137;
              reg151 <= $signed($unsigned(reg132));
              reg152 <= (~|(~^(^{$unsigned(reg135)})));
              reg153 <= (8'haa);
            end
          else
            begin
              reg150 <= {reg131[(3'h7):(1'h1)], $unsigned((8'hb7))};
            end
          reg154 <= (-$signed(((^~$unsigned(reg140)) ?
              ((reg116 ? reg139 : (8'ha3)) < $signed(reg124)) : wire137)));
          reg155 <= $signed($unsigned({$signed($signed(reg145))}));
        end
    end
  always
    @(posedge clk) begin
      reg156 <= (^{reg123, (8'hb2)});
      reg157 <= ($unsigned($unsigned(((~|reg151) ?
          $unsigned(reg150) : (reg125 ?
              reg133 : (8'ha3))))) & $signed(reg132[(1'h1):(1'h0)]));
      reg158 <= $unsigned((wire138 < $unsigned(reg141)));
      if ($signed((~^$signed({reg117[(2'h3):(1'h1)], (reg134 >= reg132)}))))
        begin
          reg159 <= $signed(reg124);
        end
      else
        begin
          reg159 <= (reg151 >> ($signed($signed({reg132})) ?
              $signed((~&(reg141 ? reg140 : wire138))) : {(reg116 <= reg130),
                  ((^~reg135) ? $signed(reg124) : (^reg148))}));
        end
      reg160 <= reg148;
    end
  assign wire161 = $unsigned($unsigned(reg146));
  assign wire162 = ((((!(reg144 ? wire115 : (8'ha7))) >= ({reg133, reg120} ?
                           $signed((8'hbc)) : (^reg122))) != wire112[(4'ha):(4'ha)]) ?
                       reg156[(4'ha):(3'h6)] : $unsigned((8'hbe)));
  assign wire163 = reg142;
  assign wire164 = $unsigned(({$signed($signed((8'hb2))), (|reg146)} ?
                       $signed($unsigned($unsigned(reg149))) : reg134[(4'ha):(4'h9)]));
  assign wire165 = $signed($unsigned((8'hb0)));
  assign wire166 = reg125;
  assign wire167 = reg157[(1'h1):(1'h0)];
  assign wire168 = (($signed($unsigned(reg146)) + (&(+reg159))) ?
                       (((-reg155) || wire167[(4'hb):(1'h1)]) ?
                           reg146 : {$unsigned(reg118),
                               reg144}) : (~&reg157[(3'h6):(1'h1)]));
  assign wire169 = wire167[(4'hc):(4'hb)];
  assign wire170 = (^~($signed({$unsigned(wire163),
                           (reg130 ? (8'ha6) : reg159)}) ?
                       {wire162} : (^~((8'hb2) ?
                           (8'haa) : (reg133 ? wire163 : wire169)))));
  always
    @(posedge clk) begin
      reg171 <= ((-reg135) | $signed($unsigned((~(reg140 ?
          (7'h42) : wire129)))));
      reg172 <= ((reg117[(4'ha):(2'h2)] >> $unsigned(wire166[(4'hb):(2'h3)])) ?
          reg157 : reg139);
    end
  assign wire173 = reg136[(3'h4):(3'h4)];
endmodule

module module76
#(parameter param106 = (^(~^(!{{(8'hb8)}, ((8'hae) ? (8'ha5) : (8'ha3))}))))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire81;
  input wire signed [(5'h12):(1'h0)] wire80;
  input wire signed [(3'h4):(1'h0)] wire79;
  input wire signed [(5'h11):(1'h0)] wire78;
  input wire [(3'h7):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire86;
  wire [(4'h9):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire82 = $signed(wire79);
  assign wire83 = wire82[(1'h1):(1'h0)];
  assign wire84 = {wire81[(2'h2):(2'h2)]};
  assign wire85 = $signed((^($signed($unsigned(wire78)) ?
                      wire80[(4'h8):(2'h3)] : $signed({wire82}))));
  assign wire86 = $unsigned((($unsigned($unsigned(wire85)) ?
                      (&wire83) : wire84) - wire85));
  assign wire87 = $signed($unsigned($signed($signed($signed((8'ha3))))));
  assign wire88 = wire83[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg89 <= $signed((~|wire84[(3'h4):(3'h4)]));
      reg90 <= $unsigned(wire82);
      if ((($signed($unsigned(wire80)) ?
          (~$signed((wire78 ? wire80 : wire80))) : {((wire87 ? wire84 : reg89) ?
                  $signed(wire88) : wire78[(4'hb):(4'h8)])}) >= (($unsigned(wire82) != ($signed(wire79) ?
          {wire77, wire82} : {wire80, wire83})) >>> reg90[(4'ha):(3'h5)])))
        begin
          reg91 <= ($unsigned(wire77[(3'h7):(1'h1)]) == $signed((wire85[(3'h5):(1'h0)] > wire86[(2'h2):(2'h2)])));
          reg92 <= wire88;
        end
      else
        begin
          reg91 <= $signed(wire77[(3'h7):(2'h3)]);
          reg92 <= (8'haa);
        end
    end
  assign wire93 = reg92[(4'h9):(4'h9)];
  assign wire94 = (8'hb8);
  assign wire95 = (({(reg89 ?
                          wire79[(3'h4):(2'h3)] : $signed(wire79))} <= {(wire83[(1'h0):(1'h0)] > (wire83 ~^ reg90))}) - ($signed(((-reg89) ?
                      (7'h43) : ((8'hb9) == (8'h9d)))) ~^ wire93[(3'h5):(1'h1)]));
  assign wire96 = (((~$signed({wire94, wire84})) ?
                          ((|$unsigned(wire93)) ^~ $unsigned({wire82})) : (~wire79[(2'h2):(1'h0)])) ?
                      wire86 : ($signed(wire79[(2'h2):(1'h1)]) ?
                          (^~{wire78}) : (($unsigned(wire82) - $signed(wire93)) ?
                              $signed(wire84) : (8'h9f))));
  assign wire97 = $unsigned(wire81[(1'h0):(1'h0)]);
  assign wire98 = wire93[(3'h5):(2'h3)];
  assign wire99 = ($signed((~^reg92)) >> (|$unsigned((~^wire94))));
  assign wire100 = wire81;
  assign wire101 = $signed($unsigned($signed(((wire98 ? wire97 : wire82) ?
                       (reg91 ? reg92 : (8'h9f)) : wire86[(2'h2):(1'h0)]))));
  assign wire102 = wire94;
  assign wire103 = ((wire97[(2'h3):(1'h1)] ^~ {$unsigned($signed((8'ha6)))}) && {$unsigned((8'h9f)),
                       (8'hb8)});
  assign wire104 = wire102;
  assign wire105 = ((8'ha5) >>> ((^$unsigned((~&wire94))) ?
                       (^~$signed((wire93 >> wire104))) : ((wire94[(1'h1):(1'h0)] ?
                               (wire85 & wire96) : $unsigned(reg89)) ?
                           ((wire94 ? wire99 : (8'ha5)) ?
                               (+wire94) : (reg89 * wire88)) : $signed(wire85))));
endmodule

module module36
#(parameter param62 = (~&(({((8'ha8) && (8'h9e)), ((8'hbd) ? (8'hab) : (8'ha3))} ? ((!(8'hac)) ? (|(7'h43)) : ((8'hb9) ? (8'hba) : (8'hbd))) : (~^((8'hb7) ? (8'had) : (8'ha8)))) ? ((((8'had) ? (7'h41) : (8'hbb)) ^ {(8'hbb)}) ? (~{(8'h9f)}) : (((8'hb6) == (8'hae)) >= ((8'h9d) ? (7'h42) : (8'hb1)))) : (~&(((7'h43) > (8'hb4)) < ((8'ha6) && (8'hba)))))))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire [(4'h9):(1'h0)] wire39;
  input wire [(4'he):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire44,
                 wire43,
                 wire42,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire42 = (8'ha2);
  assign wire43 = ((($signed(((8'ha4) ? wire38 : wire37)) ?
                          wire41[(4'hd):(4'h8)] : $unsigned(wire38)) * (+(~&(wire38 == wire37)))) ?
                      ((^~({wire39, wire37} ?
                              wire37[(3'h6):(3'h5)] : (+wire37))) ?
                          {{(wire39 < wire42), {wire40, wire37}}} : {({wire41,
                                  wire41} ^~ (8'ha6))}) : wire37);
  assign wire44 = $unsigned(wire37[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      if ((^($unsigned(wire39) ? $signed(wire39) : wire37[(1'h0):(1'h0)])))
        begin
          reg45 <= wire37;
        end
      else
        begin
          reg45 <= $signed((~|$unsigned(wire37[(2'h2):(2'h2)])));
        end
      reg46 <= (~reg45[(4'hd):(2'h2)]);
      if ((|(^$unsigned(reg46))))
        begin
          reg47 <= $unsigned(wire44[(4'h8):(3'h6)]);
          if ($unsigned($unsigned($signed((^~(wire38 ? wire41 : wire44))))))
            begin
              reg48 <= $unsigned(wire38[(2'h3):(1'h0)]);
            end
          else
            begin
              reg48 <= ($unsigned((((!wire42) || $unsigned((8'ha9))) <<< (reg46 ?
                      (7'h43) : ((8'ha5) ? wire40 : wire37)))) ?
                  (~|$unsigned(wire41)) : (8'hb8));
            end
          if (wire41[(1'h0):(1'h0)])
            begin
              reg49 <= wire38;
            end
          else
            begin
              reg49 <= $unsigned((reg47 ^~ $unsigned($signed((wire38 ?
                  wire39 : reg45)))));
              reg50 <= (&$signed((wire44[(4'hc):(4'hb)] | $signed((wire44 || reg49)))));
            end
          reg51 <= reg48[(4'hb):(1'h1)];
        end
      else
        begin
          reg47 <= $unsigned($unsigned((~|$unsigned((!wire37)))));
          reg48 <= (|(~wire38[(4'hb):(4'hb)]));
        end
      reg52 <= $signed($unsigned((|((wire40 ?
          wire42 : wire43) - (reg45 & reg49)))));
    end
  assign wire53 = $signed(((wire43 && ({reg50, wire39} ?
                      reg48 : reg50[(2'h3):(2'h3)])) == wire44[(4'h8):(3'h4)]));
  assign wire54 = {$unsigned($unsigned(wire40[(4'h9):(3'h5)]))};
  assign wire55 = reg51[(1'h1):(1'h1)];
  assign wire56 = (($unsigned(wire55) ?
                          $signed($signed((reg45 && (8'h9e)))) : $signed(wire40[(3'h4):(1'h1)])) ?
                      ((|reg46[(2'h2):(1'h1)]) ^~ (8'hbc)) : (8'ha6));
  assign wire57 = reg49[(4'hf):(2'h2)];
  assign wire58 = wire38[(4'h9):(3'h7)];
  assign wire59 = (($signed(wire58[(2'h3):(2'h2)]) + {(reg46[(1'h0):(1'h0)] ?
                          reg51 : $signed(wire42))}) > $signed($signed((~|{(8'hb9)}))));
  assign wire60 = (^(8'hbf));
  assign wire61 = ((~wire40[(2'h3):(2'h2)]) ?
                      (($unsigned(((8'haa) * (7'h44))) - wire56) >> (reg48 - wire54[(1'h1):(1'h0)])) : {(^~(~((8'hb3) ?
                              (8'hbc) : wire56)))});
endmodule
