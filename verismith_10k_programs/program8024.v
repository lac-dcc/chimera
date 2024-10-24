module top
#(parameter param70 = ((-(8'hbd)) >> (((~(-(8'ha6))) ^ (&{(8'ha7)})) ? (|((~^(8'hb6)) ? ((8'ha3) ? (8'ha6) : (8'ha2)) : {(8'ha9)})) : ((8'had) ? (+((8'hb4) & (8'haf))) : (~((8'h9f) + (8'hb1)))))), 
parameter param71 = ({((param70 >= (-param70)) ? ((param70 ? param70 : (8'ha4)) * {param70, param70}) : (^~(param70 ? param70 : param70))), ((|{param70}) ? {(param70 ? param70 : param70), ((8'hb8) ? param70 : param70)} : ((param70 > (8'hab)) == (8'hbd)))} ? ((param70 || ((param70 >>> param70) ? ((8'h9d) <<< param70) : (param70 ? param70 : (7'h42)))) ^~ (8'ha8)) : (-(((param70 || param70) ~^ (param70 & (8'hb8))) || param70))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire65;
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire11,
                 wire20,
                 wire65,
                 reg8,
                 reg9,
                 reg10,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire4 = $signed(((~&(8'haf)) ?
                     wire2[(3'h7):(3'h4)] : wire2[(2'h3):(2'h2)]));
  assign wire5 = wire1[(3'h7):(1'h1)];
  assign wire6 = wire3[(3'h7):(2'h3)];
  assign wire7 = (8'hab);
  always
    @(posedge clk) begin
      reg8 <= ($signed(wire2) ?
          (-$signed($signed(wire1[(3'h5):(3'h4)]))) : (($signed(wire6[(1'h0):(1'h0)]) ^ {(wire4 ?
                  wire4 : wire6)}) != ((-(~&wire7)) == wire7[(2'h3):(2'h3)])));
      reg9 <= wire3[(2'h2):(1'h1)];
      reg10 <= wire0;
    end
  assign wire11 = $signed(((~|reg10[(4'h9):(2'h2)]) - reg9[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ($unsigned(((~&(((8'hbd) && wire7) ?
          wire5 : wire5)) == (wire6 <<< (^~{wire11})))))
        begin
          reg12 <= {$unsigned((~$unsigned(reg10[(4'hd):(2'h2)])))};
          reg13 <= wire0[(3'h4):(3'h4)];
          reg14 <= ($unsigned(({reg8, $signed(wire1)} ?
                  $unsigned($signed(reg8)) : (reg13 ?
                      wire3[(3'h4):(2'h3)] : $signed(wire6)))) ?
              reg12[(1'h0):(1'h0)] : wire11);
        end
      else
        begin
          reg12 <= $unsigned($unsigned(wire3[(3'h5):(2'h2)]));
          reg13 <= {{wire6}};
          reg14 <= (wire1 && $unsigned((!(8'hac))));
          reg15 <= ((wire0[(3'h5):(2'h3)] < ((!reg14) <= {$unsigned(wire3)})) ~^ ((~reg8[(1'h0):(1'h0)]) >> $signed((wire11 && (reg12 || wire11)))));
          reg16 <= (8'ha0);
        end
      reg17 <= {$unsigned((8'hb1))};
      reg18 <= $signed(reg15);
      reg19 <= {(reg18 ? wire1 : reg12)};
    end
  assign wire20 = wire3;
  module21 #() modinst66 (wire65, clk, reg15, reg17, wire7, reg9);
  assign wire67 = (8'hbd);
  assign wire68 = (wire1 <<< $unsigned({$signed((reg18 > wire4))}));
  assign wire69 = (8'hae);
endmodule

module module21  (y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire23;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire62;
  assign y = {wire64, wire26, wire27, wire28, wire29, wire62, (1'h0)};
  assign wire26 = (wire23 ?
                      $unsigned((((&wire22) ?
                          (8'hba) : ((8'hb5) << wire24)) << $signed((8'hb9)))) : ($unsigned($signed((wire22 ?
                              wire24 : wire23))) ?
                          (8'ha9) : $signed(($unsigned(wire23) ?
                              wire25[(3'h4):(1'h0)] : $unsigned(wire24)))));
  assign wire27 = $unsigned($signed($signed((wire23 ?
                      $unsigned((8'h9c)) : wire22))));
  assign wire28 = $signed($unsigned(wire22));
  assign wire29 = $unsigned((8'hbc));
  module30 #() modinst63 (wire62, clk, wire29, wire26, wire25, wire22, wire28);
  assign wire64 = (~^wire27[(3'h7):(3'h7)]);
endmodule

module module30
#(parameter param61 = (~|(!(~^(((8'hb2) ? (8'hb4) : (7'h40)) ? ((8'hbf) ^~ (8'hae)) : ((8'hbb) - (8'h9e)))))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire35;
  input wire [(4'he):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire [(5'h12):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire48,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg60,
                 reg59,
                 reg55,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire36 = $unsigned(((wire31 - $signed($unsigned(wire34))) <<< $signed(wire35[(3'h4):(1'h0)])));
  assign wire37 = wire36[(2'h2):(1'h0)];
  assign wire38 = (-$unsigned((wire32[(4'ha):(3'h7)] ?
                      (|(wire33 - wire37)) : wire37[(4'he):(4'he)])));
  assign wire39 = ((({(wire36 - wire31)} << (+$unsigned(wire32))) ?
                      (wire35 >> (wire38[(2'h2):(1'h1)] && $signed(wire34))) : (wire35 & (8'ha4))) || $unsigned($unsigned((~|wire36[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg40 <= $unsigned({wire31[(2'h2):(2'h2)]});
      reg41 <= $unsigned((($unsigned(wire33) ?
              (|wire39[(5'h12):(2'h3)]) : $signed(wire31)) ?
          (8'hbc) : wire31));
      if (($signed((($signed(reg41) ^~ (~|reg41)) <<< ($unsigned((8'hbb)) ?
              reg40 : (wire33 * wire39)))) ?
          wire35 : $unsigned(wire32[(4'h9):(2'h2)])))
        begin
          if ($unsigned($unsigned(wire31[(5'h12):(3'h5)])))
            begin
              reg42 <= wire39[(3'h7):(1'h0)];
              reg43 <= (reg41 ?
                  (wire37 ^ ((((8'ha2) ? wire36 : wire36) ?
                          wire38 : reg41[(3'h6):(1'h0)]) ?
                      ((^~(7'h40)) >> $unsigned(wire34)) : wire39)) : ((~&(((8'hbb) ?
                          (8'haa) : wire39) ?
                      $signed(wire33) : (wire35 + wire31))) >> (wire32[(3'h4):(3'h4)] ?
                      wire36 : ($signed(reg42) || wire37[(4'h8):(4'h8)]))));
              reg44 <= $signed($signed((-$signed(wire31[(4'hf):(3'h4)]))));
              reg45 <= (~$unsigned({{$unsigned(wire36)}}));
            end
          else
            begin
              reg42 <= wire33[(2'h2):(2'h2)];
              reg43 <= wire39;
              reg44 <= (^~(~|((+wire33[(3'h7):(1'h0)]) ?
                  ((|wire39) ^ ((8'hbf) != (8'ha7))) : reg42[(1'h1):(1'h0)])));
              reg45 <= ((~|(reg44 <<< (~$unsigned(reg44)))) ?
                  {(wire33 | $signed($signed(reg40)))} : ((|(((8'hb5) ?
                      wire35 : wire33) ^~ $signed(wire32))) > ({$signed((8'hbe)),
                      (reg44 ? wire33 : wire39)} != ((reg40 >> wire31) ?
                      reg42[(1'h1):(1'h0)] : $signed(wire37)))));
              reg46 <= wire37[(1'h0):(1'h0)];
            end
          reg47 <= reg43;
        end
      else
        begin
          reg42 <= (7'h43);
          reg43 <= reg42;
        end
    end
  assign wire48 = ((((reg45 ^~ wire32[(2'h3):(2'h3)]) ^~ ((wire38 & reg40) ?
                              wire35 : reg46)) ?
                          (|{(8'hbe)}) : $unsigned(reg42)) ?
                      (^~$unsigned({(!reg43),
                          (^reg44)})) : {(|wire34[(4'hd):(2'h2)]), wire39});
  always
    @(posedge clk) begin
      reg49 <= $signed((+(~&{{wire36}})));
      reg50 <= (+{$unsigned((|$unsigned(wire36))),
          (((wire39 - reg40) << (wire34 ?
              wire39 : reg47)) == (wire38 != $unsigned(wire32)))});
      reg51 <= ((wire37 | $unsigned(reg46)) ?
          reg40 : {($signed(reg41[(3'h4):(1'h1)]) ?
                  $unsigned((wire36 ?
                      wire32 : wire36)) : (~|(wire33 || wire35)))});
      reg52 <= (($unsigned(($signed((8'hb8)) ~^ (-wire33))) ?
              {(wire32 | (8'h9c)),
                  $unsigned((reg49 ? reg43 : reg49))} : reg43) ?
          {reg43[(5'h10):(4'hd)]} : {((^$unsigned(reg41)) ?
                  wire31 : wire37[(4'ha):(1'h0)])});
    end
  assign wire53 = (&$signed((+({(8'haa), (8'hb8)} >> wire39))));
  assign wire54 = (($unsigned((reg45 ?
                          $unsigned(wire38) : {(8'hb4)})) & {$unsigned((reg41 ^~ wire36))}) ?
                      wire37[(1'h1):(1'h0)] : wire32);
  always
    @(posedge clk) begin
      reg55 <= reg45[(1'h0):(1'h0)];
    end
  assign wire56 = wire53[(2'h2):(1'h0)];
  assign wire57 = ((((+(wire37 ? (7'h43) : wire53)) ?
                              reg43 : (wire36 ?
                                  $signed((8'ha5)) : $signed(wire37))) ?
                          $unsigned(wire37) : {wire31}) ?
                      (reg44[(3'h6):(1'h0)] < ((|(~reg49)) >>> {((7'h43) <<< wire39),
                          (~(7'h43))})) : $unsigned(($signed($signed((8'h9e))) ?
                          $signed(reg52[(2'h3):(2'h2)]) : reg44[(1'h0):(1'h0)])));
  assign wire58 = wire35;
  always
    @(posedge clk) begin
      reg59 <= reg44[(4'h9):(4'h9)];
      reg60 <= wire39;
    end
endmodule
