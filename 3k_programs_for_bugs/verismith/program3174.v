module top
#(parameter param115 = {(^~((|(~(8'hb1))) ? (^~(|(8'hb7))) : ((^~(8'hb0)) <= (-(8'hb5)))))}, 
parameter param116 = param115)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire30;
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire114,
                 wire112,
                 wire32,
                 wire8,
                 wire9,
                 wire30,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire2[(4'h9):(4'h8)] ?
          ($unsigned(wire4) && ((~^(wire2 | wire2)) ?
              (^$signed((8'h9d))) : ((^~wire2) ?
                  $unsigned(wire2) : (wire3 < (8'haf))))) : ($signed(({wire1} <= $signed((8'h9f)))) ?
              {($signed((8'h9e)) - (8'hbe)),
                  $unsigned({wire2, wire0})} : ((+(wire1 ? wire2 : (7'h44))) ?
                  wire0 : $unsigned($unsigned(wire0)))));
      reg6 <= $unsigned($unsigned((^~wire4[(2'h3):(2'h2)])));
      reg7 <= wire3[(2'h3):(1'h1)];
    end
  assign wire8 = $signed(({((^(8'h9f)) >>> (wire4 > wire1))} & (7'h44)));
  assign wire9 = {$unsigned(({wire8, $unsigned(wire0)} ^~ $signed((reg6 ?
                         (8'h9e) : wire2)))),
                     ((!{((8'hac) ? wire3 : wire4)}) ?
                         {({reg7} >>> $unsigned(wire2))} : $unsigned(((reg5 ?
                             wire0 : (8'ha0)) < (reg7 ^ wire3))))};
  always
    @(posedge clk) begin
      reg10 <= (wire1 ? reg7 : (-wire1[(3'h5):(2'h3)]));
      if (reg7[(2'h3):(2'h2)])
        begin
          reg11 <= (!$unsigned($unsigned((+(reg6 <<< wire2)))));
          reg12 <= {((&$unsigned((~&wire8))) ?
                  (wire1 * $unsigned(wire1[(1'h1):(1'h0)])) : $unsigned((wire8[(4'h8):(2'h2)] & reg10)))};
        end
      else
        begin
          reg11 <= (((~|((^~wire0) > $signed(reg5))) + (^$unsigned($signed(reg12)))) ?
              $unsigned($signed($signed($unsigned((8'hae))))) : (+$signed(wire3)));
          reg12 <= ((wire9[(4'h9):(3'h5)] ?
                  (reg11[(1'h1):(1'h1)] > ((|reg7) && $unsigned(reg6))) : (({reg5,
                      reg5} != reg11[(2'h3):(1'h1)]) && $signed((reg12 < reg7)))) ?
              reg10[(2'h3):(1'h0)] : wire4[(5'h10):(4'h8)]);
          reg13 <= $unsigned(((wire9[(4'hb):(4'h8)] < (-reg11[(1'h1):(1'h1)])) ?
              $unsigned(reg12) : $signed(wire8)));
          reg14 <= {((7'h44) ^~ $unsigned($signed($unsigned(reg13)))), reg6};
          reg15 <= ($signed($signed((|{(7'h41)}))) ~^ (reg14[(4'h8):(1'h1)] >>> $signed($unsigned($unsigned((8'hb0))))));
        end
      reg16 <= wire2;
    end
  module17 #() modinst31 (wire30, clk, wire2, wire9, reg12, reg13, wire3);
  assign wire32 = $signed($unsigned((!wire3[(1'h0):(1'h0)])));
  module33 #() modinst113 (.wire34(wire2), .wire35(reg15), .wire36(reg11), .wire37(wire3), .clk(clk), .y(wire112));
  assign wire114 = {{$signed(($signed(reg10) ^~ wire9[(4'hd):(2'h3)])),
                           {$unsigned((reg13 ^~ wire4))}},
                       (^(&wire4))};
endmodule

module module33
#(parameter param110 = (!((((+(8'hb3)) ? {(8'had)} : ((8'ha8) > (8'hac))) ? (~((8'hb0) == (8'ha2))) : ((&(8'ha5)) | ((8'hbd) ? (8'ha2) : (8'h9d)))) ? ((8'hb4) << (((8'h9e) ^ (8'had)) >> ((8'ha6) ^ (8'hb2)))) : {(+(^~(8'ha0)))})), 
parameter param111 = ({(param110 ? (&param110) : (8'hbd)), ({(param110 == (7'h40))} <<< (param110 > ((8'hbe) ? param110 : param110)))} ? ((({param110} << (param110 ? (8'ha8) : param110)) ? param110 : (8'ha6)) > ((~^param110) ? (param110 << {param110, param110}) : param110)) : (~^(((&param110) * (8'ha5)) ? (!param110) : param110))))
(y, clk, wire34, wire35, wire36, wire37);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire34;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire36;
  input wire [(5'h14):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire91;
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire98,
                 wire93,
                 wire38,
                 wire39,
                 wire51,
                 wire91,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  assign wire38 = (+wire37[(5'h10):(1'h0)]);
  assign wire39 = wire38[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg40 <= (^~{wire34[(2'h3):(1'h1)]});
      if (wire37[(4'hb):(1'h1)])
        begin
          if ($signed($unsigned(((wire39 > $unsigned((7'h43))) ?
              wire39[(3'h6):(2'h2)] : $unsigned($unsigned(wire35))))))
            begin
              reg41 <= ((&(wire38[(3'h6):(1'h0)] & (7'h43))) ?
                  (-$unsigned((!(wire37 || (8'ha7))))) : reg40[(5'h12):(4'he)]);
              reg42 <= ($unsigned($signed({$signed(wire39), {wire36}})) ?
                  {(wire38[(4'h9):(2'h3)] != ($unsigned(wire37) ?
                          $signed(reg40) : wire37)),
                      {wire34[(1'h1):(1'h1)],
                          wire34}} : (wire39[(1'h1):(1'h0)] ?
                      wire34[(3'h5):(1'h1)] : {$signed($signed(reg41))}));
              reg43 <= reg40;
            end
          else
            begin
              reg41 <= ({reg43[(5'h11):(3'h6)],
                      (({(8'h9d), reg41} ?
                          $signed(wire34) : $unsigned(reg42)) - ($signed(wire35) ~^ $unsigned(wire38)))} ?
                  ($unsigned($signed({(7'h41)})) != (((reg40 ?
                      reg40 : reg41) < {wire38,
                      wire39}) <<< (~^wire34[(2'h2):(1'h0)]))) : {$signed(wire35[(1'h0):(1'h0)])});
              reg42 <= ({$signed((^~{wire38})),
                  ($signed(((8'ha9) && (8'hbc))) ?
                      $unsigned({reg43}) : ({(8'ha0)} * $unsigned(wire36)))} != {$signed(((wire34 >= reg42) ?
                      (reg40 ? wire36 : (7'h40)) : {(7'h40)}))});
              reg43 <= ((&wire35) ?
                  (wire35[(1'h1):(1'h0)] + wire35[(2'h2):(2'h2)]) : reg42);
              reg44 <= wire36[(4'hb):(4'hb)];
            end
          reg45 <= {(!reg43), reg43[(1'h0):(1'h0)]};
          reg46 <= ($unsigned((($signed(reg42) | $signed(reg41)) ?
              $signed(reg43) : $unsigned((wire39 ^ wire36)))) && ({{wire38[(4'h9):(3'h4)]},
              $unsigned($unsigned(wire36))} < wire36));
          reg47 <= ({$signed($signed(reg44[(1'h0):(1'h0)]))} ?
              reg44 : (~(~((wire39 ? wire34 : reg40) ?
                  $unsigned(wire38) : (8'hbf)))));
          reg48 <= wire38[(1'h0):(1'h0)];
        end
      else
        begin
          reg41 <= (|(8'ha9));
          if (((&{reg45, reg42}) ?
              {((reg43 * {wire39, reg45}) < (7'h41)),
                  ({(wire34 << reg47)} ?
                      {(wire34 ?
                              reg41 : (7'h41))} : ({wire34} << $unsigned(reg43)))} : {$signed($unsigned({reg42,
                      reg44}))}))
            begin
              reg42 <= reg46[(1'h0):(1'h0)];
              reg43 <= wire37;
              reg44 <= (-($signed(reg48[(5'h11):(4'ha)]) | {(7'h41),
                  reg41[(3'h6):(3'h6)]}));
              reg45 <= $unsigned((wire35[(1'h1):(1'h1)] || (~|$unsigned(((8'had) ~^ reg44)))));
              reg46 <= ($unsigned($signed(({wire36} << (+reg46)))) | {((reg41[(1'h0):(1'h0)] >>> $signed(wire38)) ~^ reg48[(4'h9):(3'h6)])});
            end
          else
            begin
              reg42 <= (reg43[(5'h10):(2'h2)] ?
                  wire34 : $signed($unsigned({{reg43, (8'h9c)}})));
              reg43 <= ($signed($unsigned(reg40)) != $unsigned($unsigned({{wire36}})));
              reg44 <= ($signed($unsigned({{(8'h9c)}})) ?
                  $signed(wire34[(2'h2):(2'h2)]) : ($unsigned((8'hae)) ?
                      wire35[(2'h2):(1'h1)] : $unsigned(wire37[(4'ha):(4'ha)])));
            end
          reg47 <= ($signed($signed(reg42[(4'hd):(3'h6)])) ?
              ((reg47 ?
                  ($signed(wire34) >>> reg48) : ($unsigned(reg47) ?
                      (~|(7'h40)) : (reg42 - reg44))) & (((reg42 ?
                      reg48 : wire39) & $unsigned((8'h9c))) ?
                  $unsigned({(7'h40), wire37}) : (^(reg47 ?
                      reg47 : wire35)))) : $signed((((reg40 ? reg40 : (8'hb0)) ?
                  (reg46 ?
                      reg48 : reg40) : $unsigned(wire38)) || reg48[(4'hb):(3'h7)])));
          reg48 <= (($unsigned($unsigned($unsigned(reg46))) & (8'hac)) ?
              $unsigned(($signed({wire35}) ?
                  $signed(((8'hae) ?
                      wire34 : reg40)) : reg48[(5'h11):(4'h8)])) : (-(reg41 ?
                  reg46[(3'h5):(1'h0)] : $unsigned((8'haa)))));
        end
      reg49 <= (!(($signed((wire34 * reg46)) <= {(wire35 ? reg47 : reg41),
          $signed(wire39)}) << (+$signed({wire38, reg47}))));
      reg50 <= {$signed((+{(&reg45)})),
          $signed($unsigned($unsigned((&wire38))))};
    end
  assign wire51 = (((&((reg40 ?
                          wire39 : wire34) << $signed(reg40))) > $signed(((8'had) ?
                          {reg45} : {reg47, wire39}))) ?
                      {$unsigned(wire37),
                          (~&{(reg44 ^ reg42),
                              (reg41 ?
                                  wire36 : (8'h9e))})} : ($signed($unsigned(wire34[(3'h4):(1'h0)])) ?
                          reg43[(3'h5):(2'h2)] : $signed(($unsigned(reg43) || reg47[(4'he):(4'ha)]))));
  module52 #() modinst92 (.clk(clk), .wire54(reg46), .wire55(reg45), .wire53(reg41), .wire56(wire39), .y(wire91));
  assign wire93 = $unsigned({reg41[(5'h14):(4'hb)], reg44[(4'h9):(3'h7)]});
  always
    @(posedge clk) begin
      reg94 <= (+wire93[(1'h0):(1'h0)]);
      reg95 <= $signed((reg43[(4'hf):(4'h8)] <= wire37[(4'ha):(1'h0)]));
      reg96 <= reg44[(4'hb):(3'h6)];
      reg97 <= reg46[(4'h8):(3'h4)];
    end
  assign wire98 = (wire38 ?
                      ($unsigned(wire37) > (!($unsigned(reg40) * {reg46}))) : (|(8'hb0)));
  always
    @(posedge clk) begin
      if ($unsigned(wire34[(3'h4):(2'h2)]))
        begin
          reg99 <= (((reg97[(1'h1):(1'h0)] < (8'hab)) ?
                  (&reg46[(4'hd):(2'h2)]) : (-wire36)) ?
              (reg41 ?
                  (+{reg42,
                      reg42}) : $signed($signed({(8'hb2)}))) : (~reg41[(3'h4):(1'h1)]));
          if ((^~$unsigned($unsigned(reg95[(3'h5):(1'h1)]))))
            begin
              reg100 <= (((reg48 ?
                      reg50 : reg95[(3'h5):(3'h4)]) * $signed(reg46)) ?
                  (~|((reg41[(2'h3):(1'h0)] ?
                          (reg47 ? reg47 : reg42) : wire35) ?
                      wire51 : {$unsigned(reg50)})) : (8'ha9));
            end
          else
            begin
              reg100 <= $signed(wire34[(1'h0):(1'h0)]);
              reg101 <= $unsigned((reg43[(4'hb):(4'hb)] ?
                  $unsigned($unsigned($unsigned(reg48))) : wire91[(2'h3):(2'h3)]));
              reg102 <= (+$unsigned((^~reg96[(1'h0):(1'h0)])));
              reg103 <= ($unsigned({($unsigned(reg97) ?
                          {reg100, (8'ha6)} : reg102)}) ?
                  (reg95[(4'h8):(1'h0)] >= ((reg96 ?
                      wire91[(2'h2):(2'h2)] : reg50[(3'h7):(1'h0)]) + reg40[(2'h3):(2'h3)])) : {$unsigned(((wire36 != reg50) ^ $unsigned(reg48)))});
            end
          reg104 <= (!$unsigned(reg97[(1'h1):(1'h0)]));
          reg105 <= {reg43[(5'h10):(4'hc)]};
          reg106 <= $signed((wire51 ? wire98 : $unsigned((!{reg94, wire36}))));
        end
      else
        begin
          reg99 <= (8'hb3);
          reg100 <= ((reg97[(2'h3):(1'h1)] ?
              $unsigned(wire37[(3'h4):(3'h4)]) : (~^$unsigned((-reg106)))) >>> reg42[(5'h12):(5'h11)]);
          reg101 <= $signed(({reg49, $signed($signed(reg104))} ?
              reg43[(4'he):(4'hb)] : (+wire37)));
          reg102 <= ((!wire98[(4'he):(3'h4)]) ?
              (wire36 ?
                  reg95[(4'h9):(1'h0)] : (wire34 ?
                      wire37[(4'hb):(2'h2)] : reg46)) : ((((&wire51) ?
                          reg50[(1'h1):(1'h0)] : {reg95}) ?
                      {$unsigned(reg49), (-reg105)} : wire98[(4'ha):(3'h5)]) ?
                  $unsigned(reg50[(2'h2):(1'h0)]) : (reg43 - ($signed((8'hb8)) ?
                      $signed(reg42) : {reg44, reg100}))));
          reg103 <= ($unsigned(wire93) ?
              wire36[(3'h5):(1'h0)] : reg42[(4'he):(3'h7)]);
        end
    end
  assign wire107 = ((+$signed(wire36[(3'h4):(2'h3)])) | ($unsigned((!(reg48 != wire51))) >= {reg94[(1'h0):(1'h0)]}));
  assign wire108 = wire93;
  assign wire109 = reg41;
endmodule

module module17
#(parameter param28 = ((((-((8'haa) ? (7'h41) : (8'ha2))) & {{(8'h9e)}}) ? ((^~((8'hb4) ? (8'ha9) : (8'ha5))) >>> ((|(8'hb0)) ? (8'hba) : {(8'hac)})) : ((((7'h42) > (8'h9f)) * (!(7'h43))) >= (|{(8'hb2), (8'hb9)}))) >>> (~(^(((8'hac) == (8'haa)) ? {(8'hb1)} : ((8'h9f) ~^ (8'hbb)))))), 
parameter param29 = (~(((~param28) ? (param28 || (|param28)) : (((8'had) ? param28 : param28) ^~ (param28 ? param28 : param28))) << {((^~param28) ? (~param28) : param28)})))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  assign y = {wire27, wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = ((($signed(wire18) ?
                          (((8'ha0) ? wire20 : wire22) ?
                              $unsigned(wire19) : wire22[(3'h6):(3'h4)]) : ((wire21 ?
                                  (8'ha8) : wire20) ?
                              $unsigned(wire22) : ((7'h43) ?
                                  wire21 : wire22))) ?
                      (($signed(wire22) ^ {wire18}) >= {((8'ha2) ?
                              wire21 : wire22),
                          (wire20 == wire21)}) : {((wire22 ? wire19 : wire18) ?
                              $signed(wire18) : wire19[(2'h3):(1'h0)]),
                          wire20[(1'h1):(1'h1)]}) << $signed({wire21}));
  assign wire24 = (wire23[(2'h3):(2'h2)] ?
                      $signed(wire20[(1'h0):(1'h0)]) : (((~&wire19[(1'h1):(1'h0)]) ^~ $signed($unsigned(wire22))) > ((wire23 ?
                              (wire19 ? wire19 : wire18) : $signed(wire23)) ?
                          wire19[(1'h0):(1'h0)] : $signed((wire21 ?
                              (8'ha3) : wire23)))));
  assign wire25 = wire24[(1'h0):(1'h0)];
  assign wire26 = $signed(((!$unsigned((~wire22))) ?
                      $signed(($signed(wire22) ?
                          $signed((7'h44)) : wire24)) : $signed({(wire18 ?
                              (8'h9f) : wire23),
                          (+wire20)})));
  assign wire27 = {$signed($signed($unsigned($unsigned((8'hbd))))),
                      $signed((($unsigned(wire22) ?
                              (wire19 && wire20) : (wire25 & wire24)) ?
                          (wire25 != ((8'hbd) == wire24)) : ((wire25 ?
                              wire21 : wire18) || $unsigned(wire20))))};
endmodule

module module52
#(parameter param89 = ({((((8'ha6) > (8'ha1)) >= (^~(8'hbb))) << {((8'hb6) ? (8'had) : (8'hb8)), ((7'h40) ? (8'had) : (8'hb2))}), (8'h9e)} << (~^(+(~^{(8'hb8), (7'h40)})))), 
parameter param90 = {(((~|(param89 ? param89 : param89)) ? {(param89 ? param89 : param89)} : (param89 ? (param89 ? param89 : param89) : (param89 + param89))) >> (&((+param89) ? {param89, param89} : (param89 ? param89 : param89))))})
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire signed [(5'h10):(1'h0)] wire55;
  input wire signed [(4'hf):(1'h0)] wire54;
  input wire [(5'h14):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
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
                 reg61,
                 (1'h0)};
  assign wire57 = (!(((((8'haf) && wire54) ?
                          wire55[(2'h2):(2'h2)] : $unsigned((8'hb2))) ?
                      wire54[(3'h5):(3'h4)] : wire55) ~^ $unsigned($unsigned(wire55[(4'ha):(2'h3)]))));
  assign wire58 = $signed($signed((^~((~&wire53) ?
                      (wire53 ? wire56 : wire57) : wire54[(4'hc):(4'h9)]))));
  assign wire59 = (wire55 <= ($unsigned($unsigned(wire56[(1'h0):(1'h0)])) ?
                      $unsigned($unsigned((^wire57))) : ((~&wire56[(4'hb):(3'h7)]) ?
                          $unsigned($unsigned(wire57)) : wire57)));
  assign wire60 = ((+wire53[(5'h13):(4'h8)]) ?
                      $signed(wire58[(3'h5):(1'h0)]) : $signed(($unsigned((wire58 ?
                              wire57 : wire59)) ?
                          wire59 : (wire53[(4'hd):(2'h3)] ^~ (8'hae)))));
  always
    @(posedge clk) begin
      reg61 <= $signed($unsigned(wire58[(3'h5):(2'h3)]));
    end
  assign wire62 = $unsigned(wire53);
  assign wire63 = ($unsigned(((-wire54[(4'h9):(2'h2)]) ?
                      (^((8'hb8) <<< (8'haf))) : ($unsigned(wire57) && $unsigned(wire60)))) && wire57[(1'h0):(1'h0)]);
  assign wire64 = $signed(((+wire53) <= wire60[(4'hb):(1'h1)]));
  assign wire65 = $signed(((((^wire60) ^ wire54) ^ $unsigned((~&wire62))) ?
                      (~|(wire55[(3'h5):(3'h5)] < (wire57 == wire58))) : $unsigned((wire64 <= ((8'hb1) + reg61)))));
  always
    @(posedge clk) begin
      if (wire57[(3'h4):(2'h3)])
        begin
          if ((^(wire55[(4'h8):(3'h5)] | (~wire56))))
            begin
              reg66 <= (~^wire59[(2'h3):(2'h3)]);
              reg67 <= wire60;
              reg68 <= ((~&{$unsigned({wire65})}) ?
                  (+{((wire60 >> wire53) ?
                          wire63[(2'h3):(1'h1)] : $signed(wire64)),
                      wire62[(3'h7):(3'h5)]}) : (^$unsigned(((wire54 ?
                      wire59 : wire58) & (wire60 ? reg66 : wire54)))));
              reg69 <= $unsigned((+(8'hb5)));
            end
          else
            begin
              reg66 <= (~reg61[(4'hd):(1'h1)]);
            end
          reg70 <= $unsigned(({$unsigned((reg61 - wire59))} ?
              (wire60[(2'h2):(1'h0)] ?
                  $signed((wire55 <= (8'h9e))) : wire53[(5'h10):(1'h0)]) : (8'ha9)));
          if ((&(((~wire60[(3'h5):(2'h2)]) & $unsigned((wire60 ?
              reg69 : wire64))) | (^~(reg66[(3'h5):(1'h0)] <<< (reg69 & (8'hbc)))))))
            begin
              reg71 <= ($signed((!((wire54 <= (8'hb0)) ?
                  (wire56 && reg66) : {wire53,
                      wire58}))) << (|$signed((-wire58[(4'hb):(3'h4)]))));
              reg72 <= (($signed((&wire54)) <<< (7'h41)) ?
                  (-$signed(wire63[(3'h6):(2'h2)])) : $unsigned(reg67[(2'h2):(1'h1)]));
              reg73 <= (~&$unsigned($signed((|(-reg61)))));
            end
          else
            begin
              reg71 <= wire62;
              reg72 <= $signed($unsigned((wire64 <= wire59[(2'h3):(1'h1)])));
              reg73 <= {{$unsigned($unsigned($unsigned(reg70)))}};
              reg74 <= $unsigned(wire64);
            end
          reg75 <= reg67;
          if (wire55)
            begin
              reg76 <= (8'hbb);
              reg77 <= wire55[(4'hc):(3'h4)];
            end
          else
            begin
              reg76 <= ($signed((!$signed(reg73[(4'hb):(3'h6)]))) ?
                  wire54[(4'hd):(4'h9)] : (!$signed(((reg74 ? reg70 : wire56) ?
                      {wire56} : (wire59 ? wire53 : reg73)))));
              reg77 <= $signed(((reg69 != reg72[(1'h0):(1'h0)]) ?
                  $signed(((wire60 ?
                      reg72 : reg69) ^ $signed(reg74))) : (!(wire55 >> $signed(wire57)))));
              reg78 <= reg67;
              reg79 <= reg71;
              reg80 <= {$signed($unsigned($signed($signed(reg69))))};
            end
        end
      else
        begin
          reg66 <= (~^$unsigned({reg71}));
          reg67 <= $signed($unsigned((~|(((8'hbb) ^ (8'ha6)) - wire59))));
        end
      reg81 <= ((((|{wire63, reg61}) ?
              (~^wire54[(3'h6):(3'h5)]) : (-(~|wire60))) ?
          $unsigned((8'ha4)) : reg73) * $unsigned((($signed(wire58) ^~ reg69[(4'ha):(1'h0)]) ?
          (~|(reg74 + wire55)) : (!$unsigned((8'hb1))))));
      reg82 <= ((~&wire64[(1'h1):(1'h1)]) ? wire53 : (~reg69));
      reg83 <= $unsigned($unsigned($unsigned(($unsigned(reg68) > (+reg67)))));
    end
  assign wire84 = ($signed($unsigned((reg83[(4'h8):(2'h2)] >= $signed((8'h9c))))) << {(($unsigned(wire63) ^~ {wire53,
                          reg83}) != reg83),
                      ((7'h43) ? (-reg72[(3'h4):(1'h0)]) : (-(&wire58)))});
  assign wire85 = (~|$signed((reg79 ?
                      ($signed(wire59) * (~&wire53)) : (~|(-wire58)))));
  assign wire86 = (|wire56);
  assign wire87 = $unsigned(reg81);
  assign wire88 = reg77[(3'h7):(1'h0)];
endmodule
