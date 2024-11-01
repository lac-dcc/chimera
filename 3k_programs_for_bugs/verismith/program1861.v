module top
#(parameter param190 = (^~(|((~|{(7'h44)}) >= (+(~|(8'hb4)))))), 
parameter param191 = {(-(^~(param190 != param190)))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire189;
  wire [(5'h12):(1'h0)] wire188;
  wire signed [(5'h11):(1'h0)] wire187;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire185;
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire5,
                 wire9,
                 wire10,
                 wire124,
                 wire126,
                 wire127,
                 wire185,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire5 = (wire2[(1'h1):(1'h0)] ?
                     wire3[(2'h2):(2'h2)] : ({$unsigned((wire4 == wire3))} ?
                         (wire2[(2'h2):(2'h2)] ?
                             $signed($unsigned(wire4)) : wire3[(2'h3):(1'h1)]) : ((~wire2[(1'h1):(1'h1)]) ?
                             (wire0[(4'hf):(1'h0)] | wire0) : wire4[(4'hc):(4'ha)])));
  always
    @(posedge clk) begin
      reg6 <= ($signed(wire1) ?
          ($unsigned((~&wire0)) ?
              wire1[(2'h2):(2'h2)] : {$unsigned(wire1[(1'h1):(1'h0)])}) : ({wire0[(3'h4):(1'h0)],
                  (~$unsigned(wire1))} ?
              ((^$signed(wire5)) && ((wire4 - (8'h9d)) <= {wire5,
                  wire1})) : (~^$unsigned((^~wire0)))));
      reg7 <= (|wire0);
      reg8 <= (^reg6);
    end
  assign wire9 = ((8'hbb) - (reg6 ^~ $unsigned($signed(wire4))));
  assign wire10 = wire0[(2'h2):(2'h2)];
  module11 #() modinst125 (.wire14(reg7), .wire16(wire0), .clk(clk), .wire13(wire10), .wire15(wire4), .y(wire124), .wire12(wire3));
  assign wire126 = wire3;
  assign wire127 = ($signed($unsigned((wire126 * $unsigned(wire4)))) ?
                       $signed((wire0 ?
                           $unsigned((wire124 ?
                               wire0 : wire3)) : wire124)) : ($signed(reg8) >>> ((8'hb3) ?
                           (wire9 ^~ (wire2 != wire5)) : wire1[(2'h2):(1'h0)])));
  module128 #() modinst186 (.wire129(wire124), .wire132(wire126), .y(wire185), .clk(clk), .wire131(wire10), .wire133(wire4), .wire130(wire0));
  assign wire187 = (($signed(wire185[(2'h2):(1'h0)]) ?
                       (^wire2) : $unsigned($unsigned(wire0))) * $signed(wire124));
  assign wire188 = (8'ha7);
  assign wire189 = (8'hb2);
endmodule

module module128
#(parameter param184 = (8'h9f))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire133;
  input wire [(5'h12):(1'h0)] wire132;
  input wire signed [(5'h12):(1'h0)] wire131;
  input wire signed [(5'h10):(1'h0)] wire130;
  input wire [(4'h9):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire183;
  wire signed [(4'ha):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire signed [(5'h10):(1'h0)] wire134;
  wire [(2'h3):(1'h0)] wire181;
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  assign y = {wire183,
                 wire155,
                 wire139,
                 wire138,
                 wire136,
                 wire135,
                 wire134,
                 wire181,
                 reg137,
                 (1'h0)};
  assign wire134 = $unsigned(wire131[(4'hd):(4'hc)]);
  assign wire135 = ($unsigned($unsigned((~&wire132[(3'h4):(2'h3)]))) ?
                       (^~wire131) : wire130[(3'h7):(1'h1)]);
  assign wire136 = wire130[(4'hc):(4'h8)];
  always
    @(posedge clk) begin
      reg137 <= (^~(-wire135));
    end
  assign wire138 = ({wire132[(4'h8):(1'h0)]} >>> $signed(((^~{wire130,
                           wire130}) ?
                       ((wire135 ? wire129 : wire136) ?
                           (wire135 & (8'hb2)) : (&wire129)) : (^~(wire131 >= reg137)))));
  assign wire139 = (~^(^~wire130[(4'h9):(4'h8)]));
  module140 #() modinst156 (wire155, clk, wire134, wire132, wire136, wire129, wire138);
  module157 #() modinst182 (wire181, clk, wire134, wire132, wire131, wire130, wire129);
  assign wire183 = (8'hab);
endmodule

module module11
#(parameter param122 = (^~(-({((8'ha1) - (8'h9e))} ^ (((7'h43) ? (7'h40) : (8'haf)) ? ((7'h42) - (7'h40)) : ((8'ha9) ? (8'h9e) : (7'h42)))))), 
parameter param123 = (param122 ? (((|((8'ha4) ? param122 : param122)) <= param122) ? (^~param122) : ({{(8'ha4)}} ? param122 : {(-param122), (-(8'hb5))})) : ((({param122} >> (param122 >>> param122)) ? ((param122 ? (8'hac) : param122) ? (&param122) : (param122 && param122)) : {(param122 <<< param122), (!param122)}) ? param122 : param122)))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h2a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire [(3'h5):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire102,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire18,
                 wire17,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = (~&$unsigned($unsigned((~&wire16[(2'h2):(2'h2)]))));
  assign wire18 = (!{wire14[(2'h2):(2'h2)],
                      (~(wire13 ? {(8'hb1)} : wire16[(1'h1):(1'h0)]))});
  always
    @(posedge clk) begin
      if ($unsigned((~^$signed((wire14[(1'h0):(1'h0)] ?
          {wire13} : $unsigned(wire16))))))
        begin
          reg19 <= $signed((~wire16));
          reg20 <= ($unsigned((wire13[(4'hd):(4'h8)] <= (wire14 ^ ((8'haa) ~^ wire13)))) <<< wire17);
          reg21 <= (($signed(({reg19,
              wire18} + wire18)) >> $unsigned(wire13[(2'h3):(1'h1)])) <<< $signed($unsigned(wire17[(3'h4):(2'h2)])));
          if (((wire12[(1'h1):(1'h1)] ?
              wire15 : (((reg20 ? wire16 : wire16) ?
                      (wire13 ? reg21 : (8'hb1)) : reg21[(3'h4):(3'h4)]) ?
                  wire16[(5'h10):(3'h7)] : (-(reg21 > (8'hbf))))) >= (-wire12)))
            begin
              reg22 <= $signed(($unsigned(((^reg19) ?
                  $signed(wire12) : (wire17 - wire14))) ~^ $unsigned(wire17)));
            end
          else
            begin
              reg22 <= {$signed(wire12), wire14};
              reg23 <= wire16;
              reg24 <= reg21;
              reg25 <= $signed(reg23[(3'h4):(1'h1)]);
              reg26 <= reg20[(3'h6):(1'h1)];
            end
        end
      else
        begin
          reg19 <= reg19[(1'h0):(1'h0)];
          reg20 <= (reg26 ?
              (((|(wire16 ? wire13 : reg26)) ?
                      wire17[(3'h4):(2'h2)] : (-(reg24 >> reg25))) ?
                  ((8'hae) || wire18) : $signed({reg23})) : ($signed($unsigned((wire15 ^ wire14))) ?
                  reg24 : $signed((wire17 << (~|wire18)))));
          if ($unsigned(({(((8'ha4) - wire15) ?
                      $signed(reg22) : {reg26, reg20})} ?
              (-wire12[(3'h5):(3'h5)]) : ($signed((8'hb2)) >>> $signed((reg19 > wire15))))))
            begin
              reg21 <= ((&($unsigned($signed(reg19)) ?
                      $signed({(8'ha3)}) : reg20)) ?
                  reg19 : $signed($unsigned(reg21)));
              reg22 <= (reg23 ?
                  (~(((^(8'ha3)) ? $signed(reg24) : $unsigned(wire12)) ?
                      $signed({reg25}) : ({reg25,
                          reg23} ^~ $signed((8'ha7))))) : (^(-$signed($signed(reg20)))));
              reg23 <= $unsigned(($unsigned(reg21[(3'h6):(2'h2)]) ?
                  {$unsigned((reg21 + wire13)),
                      $unsigned(reg22[(1'h1):(1'h1)])} : $unsigned((reg26[(4'h9):(2'h2)] & (wire17 ?
                      reg26 : wire15)))));
            end
          else
            begin
              reg21 <= wire17;
              reg22 <= ({$unsigned(reg23),
                  wire12[(2'h3):(1'h1)]} && (($signed($unsigned((8'haf))) ?
                  wire14[(2'h3):(1'h0)] : (reg22 ?
                      (8'h9f) : $signed((8'hb8)))) < $unsigned((~|$signed(reg23)))));
              reg23 <= $unsigned(((reg21 << $signed((reg22 ? reg20 : reg25))) ?
                  (8'h9f) : (reg21 ? (7'h40) : $signed($signed(reg20)))));
              reg24 <= reg22;
              reg25 <= $unsigned((^$signed((^~wire16))));
            end
          reg26 <= wire17[(3'h4):(2'h2)];
        end
      reg27 <= $signed(reg25[(3'h5):(2'h2)]);
      if (wire12)
        begin
          if (((^~(reg26 ? {$unsigned(wire17)} : reg19)) ?
              (((~|reg21[(3'h5):(2'h2)]) ? (-(wire14 >>> wire14)) : (8'hb1)) ?
                  ((~&reg25) & reg21[(3'h7):(3'h6)]) : ($unsigned((&wire16)) ?
                      $unsigned($signed((8'h9f))) : (reg25 ?
                          reg26[(4'ha):(4'ha)] : reg21))) : reg23[(1'h0):(1'h0)]))
            begin
              reg28 <= (!({$signed(wire15),
                  ((reg26 << wire12) <= (+(8'hbd)))} > $signed(reg23[(3'h5):(2'h3)])));
              reg29 <= $unsigned((reg23[(3'h5):(2'h2)] + (((reg19 <<< reg26) << (+wire13)) < reg23)));
              reg30 <= ({{$signed((wire15 ? wire15 : reg25)),
                          {$unsigned(reg25), $signed((8'hb0))}}} ?
                  wire16[(3'h6):(3'h6)] : wire16[(4'hc):(3'h5)]);
              reg31 <= wire15;
              reg32 <= wire12[(1'h1):(1'h0)];
            end
          else
            begin
              reg28 <= ((+(wire16[(4'hb):(2'h3)] - ($signed((7'h44)) ?
                      (+reg26) : reg20))) ?
                  (((((8'ha8) ? (8'h9c) : (7'h44)) ?
                          (reg25 ? (8'haa) : reg20) : (reg24 >> reg22)) ?
                      $unsigned((~^reg20)) : reg25[(4'ha):(3'h7)]) & {((|reg31) + $unsigned(reg24))}) : (8'hb5));
              reg29 <= (~(!wire12[(1'h1):(1'h0)]));
            end
          if (wire18)
            begin
              reg33 <= $signed($unsigned({(~&$signed(reg19))}));
              reg34 <= $signed({wire18[(3'h4):(3'h4)], wire15[(4'he):(4'ha)]});
              reg35 <= (~$unsigned($signed($unsigned($unsigned(reg32)))));
              reg36 <= $unsigned($signed((reg27[(2'h3):(2'h3)] & ({reg31,
                  reg32} >> (reg31 < reg26)))));
              reg37 <= {(^{(^(8'ha6))}), reg28};
            end
          else
            begin
              reg33 <= ((~&(~&$unsigned($signed(wire15)))) | $unsigned($signed($unsigned(wire13[(1'h0):(1'h0)]))));
              reg34 <= $signed({((reg24 ?
                      (reg28 - wire18) : $signed(reg20)) << (|$unsigned(reg29)))});
              reg35 <= (((~^$unsigned((reg24 ?
                  reg36 : reg27))) >> (+reg29)) != (((8'ha2) && $signed((reg22 >> wire14))) ^ $signed(reg26)));
            end
        end
      else
        begin
          reg28 <= $unsigned(((reg37[(3'h6):(3'h5)] ?
                  $unsigned($signed(reg34)) : (&((8'had) ? wire15 : (8'ha0)))) ?
              (($unsigned(reg36) ?
                  reg23[(1'h1):(1'h0)] : (!reg32)) << $signed($unsigned(reg25))) : wire18[(2'h3):(1'h1)]));
          reg29 <= (reg26 ? (8'h9f) : wire12);
        end
      reg38 <= $signed({{{(reg35 ? reg22 : wire15), $unsigned(reg35)},
              (~&(^reg37))}});
    end
  assign wire39 = $signed((~$signed(($unsigned(reg32) ?
                      $signed(reg24) : (-reg35)))));
  assign wire40 = reg28;
  assign wire41 = reg19[(3'h6):(3'h5)];
  assign wire42 = ($signed(reg30) ?
                      (wire16 >= (~^$signed(reg24[(5'h10):(4'h9)]))) : $signed(wire39[(1'h1):(1'h1)]));
  assign wire43 = (wire39 + reg37);
  always
    @(posedge clk) begin
      reg44 <= reg32[(2'h3):(2'h2)];
      if (({{(!reg29[(4'h8):(1'h1)]), {{reg28}, $signed(reg33)}}} ?
          $signed((|(~^(reg36 ? wire16 : reg36)))) : (~&reg28)))
        begin
          if ((+($signed({wire42, (reg23 <= (8'ha0))}) ?
              reg26 : {$unsigned($signed(reg38))})))
            begin
              reg45 <= $unsigned(($unsigned(((~|wire39) ?
                  (wire12 * reg37) : (reg23 ? reg28 : reg20))) == {reg44}));
              reg46 <= (8'ha8);
              reg47 <= reg24[(4'he):(4'hd)];
            end
          else
            begin
              reg45 <= (-($unsigned($signed((reg31 ? wire13 : wire43))) ?
                  {$unsigned((|reg23))} : wire16));
              reg46 <= reg21[(4'h8):(3'h6)];
              reg47 <= (-{(wire43[(4'hf):(4'h8)] ?
                      ((reg24 + wire13) ?
                          reg23 : $unsigned(reg25)) : (wire42 & reg44[(5'h11):(4'he)])),
                  (+{$signed(wire41)})});
            end
          reg48 <= $signed((|(($signed((8'ha4)) ?
                  reg44 : wire40[(1'h1):(1'h0)]) ?
              reg31[(4'h9):(4'h9)] : $unsigned((&reg47)))));
        end
      else
        begin
          reg45 <= $signed($signed((((^~reg48) ?
                  $signed(reg46) : (reg28 << wire43)) ?
              {(reg48 ? reg44 : (8'h9c))} : (reg20 > (wire17 < wire39)))));
          reg46 <= ((reg33[(3'h5):(3'h5)] | reg25) ?
              (^($unsigned(reg32) >>> $unsigned((wire43 ?
                  wire17 : (8'hbf))))) : (~^$signed((reg19 ?
                  $unsigned(wire40) : $unsigned(reg31)))));
          if (reg36[(2'h2):(1'h1)])
            begin
              reg47 <= wire13;
              reg48 <= (&(reg24 >> $signed((~|(reg47 + wire13)))));
            end
          else
            begin
              reg47 <= (reg24[(5'h12):(3'h7)] ?
                  $unsigned((~|(reg36[(3'h5):(2'h3)] < {reg35}))) : {(+(~reg32[(4'h9):(1'h1)])),
                      (^$unsigned($unsigned(reg22)))});
              reg48 <= {$unsigned((wire39 && (&$signed(reg48)))),
                  $unsigned($unsigned($unsigned($unsigned(wire14))))};
            end
          reg49 <= (wire14[(1'h0):(1'h0)] ?
              reg37 : (~|(^((reg44 ? wire13 : reg19) ~^ (~&reg28)))));
          reg50 <= ({$unsigned((-{reg23, reg35})), {{(-reg48)}}} ?
              {wire13[(3'h7):(3'h6)],
                  (((&reg32) >= ((8'had) ?
                      reg22 : (8'hb5))) != (wire16[(3'h4):(2'h2)] ?
                      $signed(reg27) : reg26[(4'ha):(4'h8)]))} : ((reg30[(1'h1):(1'h1)] <= {(reg45 ^~ reg24),
                      {reg37, wire43}}) ?
                  wire15[(3'h6):(2'h2)] : (($signed(reg44) ?
                      {reg27, reg38} : reg48) * $unsigned(reg28))));
        end
      reg51 <= {$signed($unsigned(({reg50} ? (~&wire14) : (wire16 ^~ wire15)))),
          (wire43[(5'h15):(4'h8)] != (((reg35 + reg20) ?
              (-(8'had)) : (8'ha7)) ^~ $unsigned($unsigned(wire41))))};
      reg52 <= {reg37};
      reg53 <= wire14[(2'h3):(1'h0)];
    end
  module54 #() modinst103 (wire102, clk, reg20, reg44, wire18, wire13);
  always
    @(posedge clk) begin
      reg104 <= reg21[(4'h9):(2'h2)];
      reg105 <= $signed(reg30[(3'h7):(3'h7)]);
      if (wire43[(3'h4):(2'h3)])
        begin
          reg106 <= wire43[(4'h9):(1'h1)];
          reg107 <= ({reg50[(4'hd):(3'h6)]} ? wire40 : (reg23 & (7'h43)));
          reg108 <= ($signed($unsigned(reg32[(2'h2):(1'h0)])) ?
              wire14 : wire16);
        end
      else
        begin
          reg106 <= $signed({{$signed(wire102[(4'h8):(4'h8)])}, reg51});
          reg107 <= (8'ha8);
          reg108 <= (~|$unsigned(reg19[(4'hd):(1'h0)]));
          reg109 <= $unsigned(reg20[(2'h2):(1'h1)]);
        end
      reg110 <= ((|reg105) + {wire17[(1'h1):(1'h0)]});
    end
  assign wire111 = reg104[(3'h5):(3'h5)];
  assign wire112 = (8'ha4);
  assign wire113 = $signed($signed($unsigned($unsigned($signed(reg38)))));
  assign wire114 = ($signed((reg47[(3'h5):(2'h2)] ?
                           ((reg32 || reg107) ?
                               $signed(wire16) : {wire12}) : wire43[(5'h13):(5'h12)])) ?
                       $unsigned((((reg37 >> reg26) || $unsigned((8'hbe))) >>> reg52)) : ((reg20[(4'he):(3'h6)] ?
                               ($unsigned(reg107) ?
                                   reg19 : (~|reg44)) : (reg28[(4'h8):(4'h8)] != (~&wire39))) ?
                           reg110 : wire41[(4'ha):(1'h0)]));
  assign wire115 = wire18;
  always
    @(posedge clk) begin
      reg116 <= $signed($unsigned($unsigned(wire102[(2'h3):(1'h1)])));
      reg117 <= reg31;
      reg118 <= $signed(((~$unsigned(reg21[(2'h2):(1'h1)])) ?
          {(~&(8'ha3))} : $signed(((-reg22) ? $unsigned(wire40) : reg46))));
      reg119 <= (&$unsigned(((reg118 ? reg36[(3'h4):(2'h2)] : wire17) ?
          $signed($signed(reg49)) : ($unsigned(reg31) ?
              (wire39 ~^ reg28) : (+reg30)))));
    end
  assign wire120 = reg51[(1'h0):(1'h0)];
  assign wire121 = $signed($unsigned((^~wire43[(4'hc):(4'ha)])));
endmodule

module module54
#(parameter param100 = {(-(7'h43)), (~&(&((&(8'hb4)) ? ((8'hbf) ? (8'ha0) : (8'hb7)) : (~|(8'haa)))))}, 
parameter param101 = {(param100 <= (param100 ? (+(param100 ? param100 : param100)) : param100))})
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire58;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire [(4'hf):(1'h0)] wire56;
  input wire signed [(5'h13):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire60,
                 wire59,
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
  assign wire59 = (wire56 ?
                      (wire57 >>> (!$signed(((8'hb7) ?
                          (8'hb9) : wire56)))) : ((((+wire57) ~^ (~&wire55)) >= (~|$unsigned(wire57))) ?
                          ((wire57[(5'h13):(3'h6)] ?
                                  wire55 : (wire55 ? wire58 : wire56)) ?
                              wire58 : wire57) : $signed($unsigned(wire56[(2'h2):(1'h0)]))));
  assign wire60 = {wire57[(4'hd):(2'h2)]};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((&(-wire58[(1'h1):(1'h1)])))))
        begin
          reg61 <= $unsigned($signed($signed((|(wire60 ^ wire60)))));
        end
      else
        begin
          reg61 <= wire60[(2'h2):(1'h1)];
          if ((((($signed((8'h9e)) ? {wire56} : ((8'hb6) ? wire56 : wire58)) ?
                  (~(~|wire58)) : $signed(((8'ha4) ?
                      reg61 : wire56))) != (^$signed(wire59[(4'h9):(3'h7)]))) ?
              $unsigned($signed((^(wire58 < wire57)))) : (^~(reg61 ?
                  reg61 : (wire58[(4'hf):(4'h9)] ?
                      wire59[(1'h0):(1'h0)] : $unsigned(wire58))))))
            begin
              reg62 <= $signed(({(-$signed(wire60)), $unsigned((-wire57))} ?
                  (^(wire56[(3'h6):(3'h5)] > (wire60 ?
                      wire57 : wire56))) : ($unsigned((wire58 * wire58)) ?
                      ((~|wire59) ?
                          (^~wire56) : $unsigned(wire56)) : $unsigned((^~reg61)))));
              reg63 <= ((($signed((wire57 || wire58)) ?
                  ($signed((8'hab)) | (^(8'hb6))) : ($unsigned(wire56) < (wire57 - wire57))) != $signed((wire55 <= wire60[(1'h0):(1'h0)]))) + ((^$signed($unsigned(reg62))) <= (((~^reg62) ?
                      (8'h9d) : wire57) ?
                  wire55[(2'h3):(2'h2)] : $signed((reg62 ? reg61 : wire60)))));
            end
          else
            begin
              reg62 <= $signed((($unsigned(wire57[(3'h6):(3'h5)]) * $unsigned((|reg63))) ?
                  {$unsigned($signed(wire60)),
                      ((wire60 | (8'hb5)) ^ reg61[(4'ha):(4'h9)])} : $unsigned(((wire59 ^ wire57) ?
                      $signed(reg61) : $signed(wire55)))));
            end
          reg64 <= $signed((~$signed(wire57)));
          reg65 <= reg64[(3'h4):(1'h0)];
        end
      reg66 <= reg63;
      if ($unsigned((reg63 ?
          (wire60[(2'h2):(1'h0)] || reg62[(4'ha):(3'h7)]) : (|{$signed(wire56)}))))
        begin
          reg67 <= wire57;
          reg68 <= {$signed(reg62[(1'h0):(1'h0)])};
        end
      else
        begin
          if ((reg64 - {reg62[(3'h6):(2'h2)], reg62[(4'ha):(4'h8)]}))
            begin
              reg67 <= (($signed(({wire60, (8'hbc)} - {wire55,
                  reg64})) >= $unsigned($unsigned($signed(reg61)))) * ($unsigned(wire56) || wire58));
              reg68 <= (~^(^$unsigned(reg63[(2'h3):(2'h2)])));
              reg69 <= $unsigned(($signed((((8'hae) ? reg65 : reg65) ?
                  {reg61} : reg63[(2'h2):(1'h1)])) >= {$signed((wire56 ?
                      reg65 : (8'h9c)))}));
              reg70 <= wire60;
              reg71 <= (|(wire58[(4'ha):(2'h2)] ?
                  ($signed($unsigned(wire57)) || reg62) : $signed((reg62[(3'h7):(2'h3)] ?
                      (reg69 ? reg70 : wire57) : (^reg61)))));
            end
          else
            begin
              reg67 <= (&({(&(-(8'hb0)))} ?
                  (({reg70, reg71} ?
                      $unsigned(reg66) : (reg67 ?
                          reg71 : reg67)) <= $signed((+(7'h44)))) : (|reg69[(3'h6):(2'h3)])));
              reg68 <= (($unsigned(($signed((8'hb3)) ?
                      reg65[(3'h6):(1'h0)] : wire55[(4'ha):(1'h1)])) && {((reg68 && reg65) <<< (wire57 ?
                          reg69 : reg63)),
                      (((7'h40) != reg69) ?
                          (8'hb3) : (reg65 ? reg61 : reg66))}) ?
                  (reg69[(2'h3):(1'h0)] || ($unsigned(wire55) ^~ ({wire58} ?
                      $unsigned(wire58) : $unsigned(reg63)))) : (!reg61[(3'h5):(1'h1)]));
              reg69 <= {reg62, (~|reg63)};
              reg70 <= {$signed(wire56[(2'h2):(1'h1)])};
              reg71 <= ({$unsigned($signed((reg63 ^~ reg67)))} ?
                  (~&($unsigned((wire56 ?
                      wire60 : (8'ha9))) ^~ (^$signed(reg63)))) : reg62);
            end
          reg72 <= ($unsigned((reg64[(3'h5):(1'h1)] <<< (reg62[(3'h6):(2'h2)] != ((8'hae) <<< wire55)))) | ({(!wire55),
              (~&(-reg61))} != reg70));
          reg73 <= $signed(((8'ha0) ^ ((&{reg62}) ?
              {(reg67 ? reg61 : wire60)} : $unsigned((reg68 > reg63)))));
          if ({$signed((reg65 - $signed((reg69 ? reg64 : reg73))))})
            begin
              reg74 <= ($signed((((reg73 >> reg63) ?
                          (8'ha3) : (reg71 ? reg66 : wire59)) ?
                      $unsigned($signed(wire59)) : reg66[(5'h15):(4'he)])) ?
                  $unsigned((^~$unsigned({(8'ha1),
                      (8'ha8)}))) : ((reg64[(4'h9):(4'h9)] ?
                      $signed(((8'hb5) ?
                          reg61 : reg63)) : {wire58}) << {reg66[(5'h13):(3'h5)],
                      (reg63 && $unsigned(reg69))}));
              reg75 <= $unsigned($unsigned((((wire60 && reg65) != (reg72 ?
                  reg69 : reg66)) * reg74[(3'h5):(1'h0)])));
              reg76 <= wire58;
              reg77 <= (wire56[(3'h5):(3'h4)] ?
                  $unsigned(reg75) : (((^(|reg75)) - ({reg71} - (reg62 ?
                      wire57 : wire57))) >>> $unsigned(((reg63 && wire58) ?
                      reg68 : $signed((8'hbc))))));
            end
          else
            begin
              reg74 <= (-$signed(((-wire57) ?
                  {(reg71 ? reg61 : reg69)} : reg69[(5'h11):(2'h3)])));
              reg75 <= $unsigned($unsigned(($signed({reg71, (8'ha8)}) ?
                  wire57[(3'h5):(3'h5)] : reg69[(3'h4):(2'h3)])));
              reg76 <= wire58;
            end
        end
      reg78 <= wire56[(4'hf):(4'h9)];
    end
  assign wire79 = $signed(reg66[(5'h15):(4'hd)]);
  assign wire80 = ($unsigned((^$unsigned((reg78 ? reg73 : reg75)))) ?
                      {$unsigned(reg76[(1'h1):(1'h0)]),
                          reg77} : wire56[(4'h8):(3'h7)]);
  assign wire81 = (8'ha7);
  assign wire82 = (wire59 < wire55[(2'h2):(2'h2)]);
  assign wire83 = (((7'h41) ?
                      (($signed(wire57) ^~ (~reg78)) <<< (~&(-wire56))) : (reg73[(4'h9):(4'h9)] >= wire60)) < (wire79[(3'h7):(2'h2)] ?
                      ($signed((reg75 ^ reg65)) ?
                          reg69 : ((^~reg65) ?
                              (~|reg75) : {(8'hb2),
                                  (8'haf)})) : ({$signed((8'hb1))} << wire60[(1'h0):(1'h0)])));
  assign wire84 = reg69[(3'h4):(2'h2)];
  assign wire85 = $signed($unsigned(($signed(reg66[(5'h12):(4'h9)]) ?
                      reg68[(4'hb):(3'h4)] : $unsigned((wire79 ?
                          wire79 : wire55)))));
  assign wire86 = ((^wire60[(2'h2):(1'h0)]) <<< reg76);
  assign wire87 = $unsigned(wire84[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg88 <= (+reg64[(3'h5):(2'h2)]);
      if (reg63[(3'h4):(3'h4)])
        begin
          if (reg66)
            begin
              reg89 <= wire80;
              reg90 <= $signed((^wire87[(4'h8):(3'h5)]));
            end
          else
            begin
              reg89 <= ((~&wire81) + {$unsigned(reg72[(3'h4):(1'h1)])});
            end
          reg91 <= {(reg72[(2'h3):(1'h1)] ?
                  ((+(~|wire80)) >>> {(~&reg64)}) : ({$unsigned(reg66),
                      reg74[(1'h0):(1'h0)]} + (~|(wire56 ? wire56 : reg73)))),
              (wire79[(4'hb):(1'h0)] ^ {wire87[(2'h2):(1'h0)]})};
          if (wire87)
            begin
              reg92 <= ($signed((!$unsigned(reg61))) | reg70[(5'h15):(2'h3)]);
              reg93 <= $unsigned($signed((^(~|(wire57 ? reg70 : reg89)))));
              reg94 <= $signed((((reg66[(5'h11):(2'h3)] * (~^wire84)) ?
                  (~|$signed(reg65)) : $unsigned((~|reg63))) ^~ wire58));
              reg95 <= $unsigned(((-((reg66 ? reg66 : reg77) - (reg76 ?
                  reg70 : reg91))) >>> wire58));
            end
          else
            begin
              reg92 <= ((($unsigned({wire81,
                  (8'hba)}) > reg78[(3'h5):(2'h2)]) << $unsigned($unsigned($signed((8'ha2))))) < {reg78});
            end
          reg96 <= wire55;
          reg97 <= $unsigned((((reg65[(4'hd):(2'h3)] ?
                      (reg93 < (8'hbb)) : (reg65 ? (8'hae) : reg96)) ?
                  $unsigned((reg71 <= reg63)) : wire82[(2'h2):(2'h2)]) ?
              (wire59 ^ ($signed((8'h9e)) ?
                  {wire83,
                      wire56} : $unsigned(reg71))) : ($signed((~^(8'hb4))) ?
                  $unsigned($signed(reg73)) : ((reg64 * reg74) <= (reg62 != reg78)))));
        end
      else
        begin
          if ($signed((^~wire58[(4'h9):(3'h4)])))
            begin
              reg89 <= wire55[(4'ha):(4'h8)];
              reg90 <= wire55[(2'h3):(1'h1)];
            end
          else
            begin
              reg89 <= reg96[(4'ha):(4'ha)];
              reg90 <= ($unsigned((reg75[(3'h6):(3'h4)] ^~ {$signed(reg78),
                      (wire79 >> wire57)})) ?
                  wire60 : ($unsigned((reg78[(3'h6):(1'h1)] && (^~(8'hbf)))) ?
                      {(wire87 ?
                              wire82[(1'h1):(1'h0)] : reg69[(4'he):(1'h0)])} : wire80));
              reg91 <= $unsigned(($signed(({wire57} || reg76[(1'h0):(1'h0)])) ?
                  reg96[(4'h8):(1'h1)] : wire79[(4'he):(4'ha)]));
            end
        end
      reg98 <= (reg96[(3'h5):(1'h0)] ?
          $unsigned(($signed((8'h9d)) | (&reg63))) : reg77);
      reg99 <= ((((reg97[(3'h6):(3'h6)] ?
              wire85[(5'h13):(3'h7)] : $signed(wire82)) ?
          ({(7'h44)} ^ {reg61}) : ($signed(reg78) ^ (reg89 * wire83))) || (~|(wire57[(5'h11):(4'hb)] ?
          {reg69, reg76} : reg74[(3'h4):(2'h2)]))) == reg70);
    end
endmodule

module module157
#(parameter param180 = (((-(~^((8'ha0) - (8'hbc)))) ? {(!(&(8'h9f)))} : ({((8'hbf) ? (8'ha6) : (8'ha5)), (~(8'ha8))} << (((8'ha3) ? (8'ha7) : (8'ha7)) ? (|(7'h41)) : {(7'h41), (8'hb3)}))) ? {((((8'hb3) ^ (8'ha0)) ? ((8'ha9) ? (8'hae) : (8'ha0)) : ((8'ha6) >>> (8'hb8))) || {((8'h9f) ? (8'h9f) : (8'hb3)), (~|(8'hb1))})} : (((~&(8'haa)) ? (((8'hb2) ^~ (8'ha4)) ? (^~(8'ha5)) : ((8'ha0) && (8'ha6))) : (((7'h42) <= (7'h44)) ? {(8'haf)} : (8'hae))) ? (7'h42) : (8'h9e))))
(y, clk, wire162, wire161, wire160, wire159, wire158);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire162;
  input wire signed [(3'h7):(1'h0)] wire161;
  input wire signed [(5'h12):(1'h0)] wire160;
  input wire signed [(4'h8):(1'h0)] wire159;
  input wire [(4'h9):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire178;
  wire [(3'h7):(1'h0)] wire177;
  wire [(4'hc):(1'h0)] wire176;
  wire [(5'h13):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire [(5'h10):(1'h0)] wire173;
  wire signed [(5'h14):(1'h0)] wire172;
  wire signed [(4'hf):(1'h0)] wire171;
  wire [(5'h13):(1'h0)] wire170;
  wire signed [(2'h3):(1'h0)] wire169;
  wire [(4'hc):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire [(4'h9):(1'h0)] wire166;
  wire signed [(2'h3):(1'h0)] wire165;
  wire signed [(4'h9):(1'h0)] wire164;
  wire signed [(4'hd):(1'h0)] wire163;
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 (1'h0)};
  assign wire163 = wire161[(1'h1):(1'h1)];
  assign wire164 = wire159[(4'h8):(1'h0)];
  assign wire165 = $signed(wire162);
  assign wire166 = (wire164 ~^ wire159[(3'h4):(1'h0)]);
  assign wire167 = (!(wire160 <<< $unsigned($unsigned(wire158))));
  assign wire168 = (((^~wire159[(4'h8):(2'h3)]) * ($signed(wire160) >>> $signed($signed(wire158)))) ?
                       wire159[(2'h2):(1'h0)] : $signed((((+wire159) >> $unsigned(wire160)) * ((wire161 <<< (8'hb5)) ?
                           {wire160, wire165} : (wire164 << wire164)))));
  assign wire169 = (-$unsigned($unsigned(((&wire159) > wire166))));
  assign wire170 = (($unsigned($unsigned((wire168 >>> wire168))) >= ({wire164} ?
                       (wire166[(1'h0):(1'h0)] && $signed(wire162)) : {(^~wire166),
                           (^~wire161)})) >> (!(^wire164)));
  assign wire171 = wire160[(4'h9):(3'h5)];
  assign wire172 = (wire162 <= ((+(wire171 || (wire170 >> wire165))) < $signed(({wire170,
                       wire168} <<< (&wire170)))));
  assign wire173 = (8'hbb);
  assign wire174 = wire168[(4'hc):(1'h0)];
  assign wire175 = $signed((~&wire159));
  assign wire176 = (($unsigned($signed($signed(wire169))) ?
                       wire158 : (+($signed(wire166) ^ $unsigned(wire160)))) <= (($unsigned((wire158 ?
                           wire167 : (8'ha3))) >= (wire165 | (8'hba))) ?
                       wire170[(3'h5):(2'h3)] : wire172));
  assign wire177 = (8'hae);
  assign wire178 = ($signed((^~(~|wire162))) ?
                       (($signed(wire159) & wire173) ?
                           ({$signed(wire174),
                               $signed(wire165)} << $unsigned(wire174[(4'h9):(1'h0)])) : $signed(wire160[(4'hc):(4'hb)])) : wire173[(4'hd):(3'h6)]);
  assign wire179 = ((wire165[(2'h3):(1'h1)] ?
                           (!((wire172 == wire178) ?
                               (wire176 ?
                                   (7'h42) : wire163) : wire176)) : wire160[(3'h6):(3'h4)]) ?
                       $unsigned(((wire177 ?
                               (wire174 ^ (8'h9d)) : (^~(8'hb3))) ?
                           ((8'hb7) >>> {wire168}) : {wire168[(4'hc):(1'h0)]})) : $signed(wire177[(3'h4):(2'h2)]));
endmodule

module module140
#(parameter param154 = ((((&(8'ha6)) ? {{(8'hac), (7'h42)}, (^(8'hae))} : (8'hab)) ? (|{(!(8'ha6))}) : (8'h9c)) ^~ {{{((8'hbc) ? (8'haf) : (8'haf)), ((8'hb9) <<< (8'h9e))}, (^~{(8'hba), (7'h43)})}}))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire145;
  input wire [(5'h12):(1'h0)] wire144;
  input wire [(3'h6):(1'h0)] wire143;
  input wire signed [(3'h4):(1'h0)] wire142;
  input wire signed [(2'h2):(1'h0)] wire141;
  wire [(4'h9):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire146;
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire146,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire146 = $unsigned(wire143);
  always
    @(posedge clk) begin
      reg147 <= {(&(^(wire146[(3'h6):(3'h6)] & wire142[(1'h1):(1'h1)])))};
      reg148 <= (~|(~($signed(wire144) ?
          $unsigned(((8'ha0) & wire141)) : (((8'hbb) * wire142) >> wire142[(3'h4):(1'h1)]))));
      reg149 <= $unsigned({$signed((-(!wire144))), wire143[(3'h4):(2'h3)]});
      reg150 <= ((|wire142) < {reg149, (^~(+reg149[(1'h1):(1'h1)]))});
    end
  assign wire151 = $unsigned($unsigned($unsigned(((~wire141) ?
                       (~&reg147) : wire142))));
  assign wire152 = {$unsigned(reg150[(1'h0):(1'h0)]),
                       (wire144[(3'h4):(1'h1)] ?
                           $unsigned(reg148[(2'h2):(2'h2)]) : (!{wire146,
                               reg148}))};
  assign wire153 = $unsigned(((!$unsigned({wire143})) ?
                       wire145[(2'h2):(2'h2)] : $signed((~$signed(wire143)))));
endmodule
