module top
#(parameter param101 = (((~|({(8'hbd)} & ((8'h9f) ^ (8'hb8)))) - ({(^(8'hbc)), ((8'ha6) <= (8'haf))} < ({(8'ha8), (8'hbb)} ? ((8'h9d) ^~ (8'hbb)) : (-(8'hbd))))) * {((~^{(8'hac)}) < (8'h9f)), (!{((8'ha9) >= (8'ha7)), ((8'hb8) - (8'hbb))})}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire99;
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  assign y = {wire5,
                 wire99,
                 reg6,
                 reg7,
                 reg8,
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
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 (1'h0)};
  assign wire5 = wire1[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire4);
    end
  always
    @(posedge clk) begin
      if ((~^$unsigned($signed({$signed(wire4), wire1}))))
        begin
          reg7 <= $signed(wire5[(3'h5):(3'h4)]);
          if (wire3)
            begin
              reg8 <= ({($signed(reg6) ~^ $unsigned((wire2 ? wire0 : wire4))),
                  wire2} != wire4[(4'h9):(3'h7)]);
              reg9 <= $unsigned(wire2[(2'h2):(1'h0)]);
              reg10 <= (reg6 + wire3[(1'h0):(1'h0)]);
              reg11 <= {(reg7 == {($signed(wire1) ^ (reg6 ? reg6 : wire5)),
                      {(~|wire5)}}),
                  ({$signed((wire2 ? reg8 : wire0))} > reg9[(4'ha):(2'h2)])};
              reg12 <= ({(wire2 >>> reg10)} ? wire3[(2'h2):(2'h2)] : wire5);
            end
          else
            begin
              reg8 <= {wire5[(3'h7):(3'h5)]};
              reg9 <= ($signed({$signed((reg10 >> wire3))}) ?
                  (~^($unsigned(reg6) ?
                      ((reg12 * (8'hb3)) ?
                          $signed((8'haa)) : (wire0 & wire1)) : ($signed(wire5) ^~ reg12))) : $signed((~&wire5)));
            end
          if (reg9[(4'ha):(1'h1)])
            begin
              reg13 <= ((^~$unsigned(reg7)) ?
                  {reg6} : $unsigned((-$signed($unsigned(wire3)))));
              reg14 <= {reg6[(4'h8):(3'h5)]};
              reg15 <= $signed((8'haa));
            end
          else
            begin
              reg13 <= reg10[(5'h10):(4'he)];
            end
          if ($unsigned((8'h9f)))
            begin
              reg16 <= ((+(wire3[(1'h0):(1'h0)] ?
                      {reg11} : $unsigned({reg10}))) ?
                  ((~^$unsigned((reg12 != reg10))) ?
                      (!(wire3 > (reg10 + wire5))) : {(~^$unsigned(reg14)),
                          $signed(reg15[(3'h6):(3'h4)])}) : (!(({wire2, reg12} ?
                      wire4[(3'h7):(2'h3)] : ((8'hac) ?
                          reg15 : reg8)) != {$unsigned(wire1),
                      $unsigned(reg8)})));
            end
          else
            begin
              reg16 <= reg6[(4'h9):(3'h6)];
              reg17 <= $unsigned($signed($unsigned((^$unsigned(wire5)))));
              reg18 <= (-(($signed(((8'h9e) ? reg10 : reg10)) ?
                      $signed((-wire4)) : wire5) ?
                  (reg8 ?
                      reg9 : {{wire2},
                          (reg14 ?
                              reg7 : (8'hbb))}) : ((((8'ha1) | reg6) ^ (wire3 <= wire3)) == wire1)));
              reg19 <= {$unsigned($unsigned((reg18[(1'h1):(1'h0)] ^ $unsigned(wire1)))),
                  $signed($unsigned(((reg8 ? reg7 : reg9) ?
                      $unsigned(reg12) : (!(8'hbe)))))};
            end
        end
      else
        begin
          if ((^$unsigned((|((reg17 ? wire3 : reg8) ?
              (wire5 ? reg19 : reg15) : $signed(reg17))))))
            begin
              reg7 <= {($signed($signed($signed((8'haa)))) <<< reg11)};
              reg8 <= (!$unsigned(($signed(reg11) > $signed((|reg16)))));
              reg9 <= ($unsigned(reg15) ?
                  $unsigned((8'ha5)) : ($unsigned(((wire5 >>> reg13) ?
                          $signed(reg8) : (wire1 || reg7))) ?
                      $unsigned((wire5 ? (^~reg8) : wire0)) : (&({reg18,
                          (8'hb8)} >>> {wire1, reg13}))));
              reg10 <= (((reg9 - $unsigned(wire1)) > ($signed($signed((8'ha9))) ?
                      $unsigned(reg19) : ($signed(reg13) << $signed(reg12)))) ?
                  ($unsigned($unsigned($signed(reg13))) + (~|((reg19 < reg12) ~^ (reg19 ?
                      wire5 : wire0)))) : $unsigned($unsigned($signed((reg14 ^ reg16)))));
              reg11 <= ($signed(reg18[(3'h4):(1'h1)]) << $signed(reg8));
            end
          else
            begin
              reg7 <= (!$signed($unsigned({(reg18 ? wire3 : reg8)})));
              reg8 <= (!wire3);
              reg9 <= ((~|wire4[(3'h5):(3'h5)]) >= $signed(($signed(((8'hb3) ?
                      reg10 : wire3)) ?
                  (|$signed(reg9)) : ((~|reg7) <<< (wire2 || reg15)))));
              reg10 <= (^(~(($signed(reg13) >>> $unsigned(reg16)) ?
                  (~|$unsigned(reg8)) : (reg16 <= (~reg17)))));
            end
          if ((+(reg11[(1'h0):(1'h0)] ?
              {$unsigned($signed(reg17)),
                  $unsigned((reg11 && reg17))} : ($unsigned((8'ha4)) ?
                  $unsigned(wire0) : {(reg6 <= reg8)}))))
            begin
              reg12 <= (((($unsigned(wire3) ? (~&wire4) : wire0) ?
                          (~{wire4, wire3}) : ((|reg13) ?
                              (!reg11) : (-wire1))) ?
                      (~&(reg7[(4'ha):(3'h5)] ?
                          $unsigned(reg9) : reg18)) : (8'hbc)) ?
                  reg9 : $signed($unsigned($signed({reg12}))));
              reg13 <= (-$unsigned(($unsigned((reg13 ^~ (8'ha3))) >> wire0[(3'h6):(1'h0)])));
              reg14 <= (wire5[(3'h5):(3'h5)] <<< (+$signed({(wire3 ?
                      reg10 : (8'h9e)),
                  $unsigned(reg9)})));
              reg15 <= (reg17 ?
                  ((|reg8) >> $unsigned(wire3[(2'h2):(2'h2)])) : (^~{(~(~&reg11)),
                      ($unsigned(reg6) ^~ {wire2, reg8})}));
              reg16 <= (reg11[(3'h4):(2'h3)] ?
                  $signed(((~$signed(reg19)) <= $unsigned($unsigned((8'ha2))))) : ({($unsigned((8'hbc)) ?
                          ((8'hbb) ? reg15 : reg16) : reg18[(3'h5):(1'h0)]),
                      ($unsigned((8'ha6)) ~^ $unsigned(reg13))} != (7'h41)));
            end
          else
            begin
              reg12 <= $unsigned((~|($signed($unsigned(reg18)) ?
                  $signed((reg10 ? reg6 : reg7)) : {reg7,
                      ((8'ha4) || reg16)})));
              reg13 <= (reg14[(3'h5):(1'h1)] ?
                  ({{(wire3 >> (8'ha4))},
                      $signed(reg17)} > $unsigned($signed($unsigned(wire1)))) : reg9[(2'h3):(1'h0)]);
              reg14 <= wire2;
              reg15 <= (&(~^wire2));
            end
          reg17 <= (reg8[(3'h6):(2'h2)] ?
              (~&$unsigned((&$signed((8'hb1))))) : $unsigned({reg15[(2'h3):(1'h1)]}));
        end
      reg20 <= $unsigned(($signed({(reg15 || reg16),
          {reg17, (7'h40)}}) >= (reg16 >>> {(reg6 >> wire1), wire0})));
      if (reg7)
        begin
          reg21 <= (8'hb9);
          reg22 <= $unsigned(((~$signed((~reg20))) ?
              $signed(wire5[(1'h1):(1'h1)]) : ($signed(reg6) ?
                  (^(reg19 ? reg17 : reg17)) : (&$signed(reg13)))));
        end
      else
        begin
          reg21 <= ({$signed($unsigned($signed(reg7))),
              {((wire2 ? reg19 : wire4) >= reg22)}} <= (8'hae));
          reg22 <= wire5;
          reg23 <= (&reg6[(1'h0):(1'h0)]);
          reg24 <= reg16;
          reg25 <= (^~{(reg13[(4'hf):(4'hd)] ?
                  {{wire2, reg15}} : reg8[(4'h9):(4'h9)]),
              {$signed(reg10[(5'h14):(5'h14)])}});
        end
      reg26 <= ({((!$unsigned((8'h9f))) == (-wire5[(2'h2):(2'h2)])), (8'h9e)} ?
          reg13 : reg11);
      if (reg26)
        begin
          reg27 <= (((^~{(-reg15)}) ?
                  $unsigned((reg11[(1'h0):(1'h0)] ?
                      $unsigned((8'hb0)) : reg13)) : reg12) ?
              $unsigned($unsigned(reg9[(1'h0):(1'h0)])) : (-{$signed(reg10[(4'h9):(2'h3)]),
                  $unsigned(reg15[(4'h8):(4'h8)])}));
          reg28 <= {(reg12[(4'hf):(3'h6)] ?
                  ($unsigned($signed((8'hb2))) << reg17[(5'h15):(5'h10)]) : $signed((~^(reg14 - (7'h40))))),
              $signed(reg7)};
          reg29 <= (^~reg11[(3'h6):(2'h2)]);
        end
      else
        begin
          reg27 <= $unsigned(((reg27[(5'h11):(4'h8)] ?
                  {wire5[(3'h5):(1'h0)]} : ({reg26, (7'h43)} ?
                      $unsigned(reg24) : reg13)) ?
              (^~$signed({reg21,
                  reg22})) : ($unsigned($signed(wire0)) > reg18)));
          if (reg7[(1'h1):(1'h0)])
            begin
              reg28 <= (({{{reg12, reg7}, (8'ha0)},
                  ((~&(8'haa)) ?
                      $signed(reg11) : (wire0 | reg16))} >= $signed((reg6 && reg10))) && $signed(wire5[(3'h7):(3'h6)]));
            end
          else
            begin
              reg28 <= (-reg22[(4'hf):(1'h0)]);
              reg29 <= reg10;
              reg30 <= reg12;
              reg31 <= reg28;
              reg32 <= (~^$unsigned((~|(8'h9d))));
            end
          if ((reg10 ^~ $unsigned($unsigned($unsigned($signed(reg26))))))
            begin
              reg33 <= {(reg24 - $signed(reg27))};
              reg34 <= reg21[(1'h0):(1'h0)];
              reg35 <= {((reg11[(3'h6):(2'h2)] ?
                          $signed(((8'ha1) - wire4)) : reg27[(3'h5):(3'h4)]) ?
                      $signed(($signed(reg14) ?
                          (^~wire3) : reg32[(5'h10):(4'h9)])) : wire1[(3'h7):(2'h3)])};
            end
          else
            begin
              reg33 <= reg17[(2'h3):(2'h3)];
              reg34 <= ((8'hae) & (reg19 ?
                  ((|$unsigned(reg25)) - {$signed(reg20)}) : (reg19 ?
                      (~$unsigned(wire5)) : {(~^reg34), $signed(wire2)})));
              reg35 <= (((&((reg19 ? wire1 : reg34) ?
                      reg17[(4'hf):(3'h5)] : ((8'hb8) ^~ reg30))) | reg11) ?
                  (wire3 != (!wire0)) : (~^(($signed(reg34) ^~ reg30[(3'h6):(2'h3)]) <= wire0)));
              reg36 <= ({(!$unsigned(reg35[(1'h0):(1'h0)]))} ?
                  reg24 : (~&reg29));
            end
          reg37 <= $unsigned((&(+$unsigned((reg33 >> wire4)))));
          reg38 <= $unsigned(reg26);
        end
    end
  module39 #() modinst100 (wire99, clk, reg20, reg28, wire4, reg11);
endmodule

module module39
#(parameter param97 = (((^~{((8'hb5) ? (8'hab) : (8'hba))}) ? (((~|(8'hae)) > (8'haf)) ? ((8'ha7) ? ((8'hac) ? (8'ha7) : (8'ha4)) : ((8'h9c) ? (8'hb8) : (8'ha5))) : ((~^(8'ha8)) <<< ((8'ha7) ? (8'ha6) : (8'hb7)))) : (&{(8'hb8), (~&(8'had))})) <<< (^~{{(8'ha9)}})), 
parameter param98 = {(~&(param97 <= (8'hbe)))})
(y, clk, wire40, wire41, wire42, wire43);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire40;
  input wire [(5'h12):(1'h0)] wire41;
  input wire signed [(3'h5):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire94;
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  assign y = {wire96,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire94,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg44 <= $unsigned((~&$signed((wire43 - (wire40 > wire42)))));
      reg45 <= wire41[(4'he):(2'h3)];
      if ((&(wire43 ? reg44 : (7'h44))))
        begin
          reg46 <= (~^$signed($signed(wire40)));
          reg47 <= (-wire43);
          reg48 <= (~&reg46);
          reg49 <= $signed((!(-({wire41} >> ((8'hbf) && wire40)))));
          reg50 <= $signed($signed({$unsigned((reg45 < reg46))}));
        end
      else
        begin
          reg46 <= {wire40};
          reg47 <= wire42;
          reg48 <= (reg47 ?
              (reg50 * {$signed(((8'hb2) ? reg44 : reg48)),
                  {$unsigned(reg47)}}) : $signed((($unsigned(reg46) ~^ (&reg47)) >>> (!reg50))));
          reg49 <= ($unsigned((~$unsigned((reg47 & reg49)))) ?
              reg45[(3'h5):(2'h3)] : ((((|wire41) & reg50[(2'h2):(2'h2)]) ?
                  ((reg49 == wire41) | reg47) : ($unsigned(reg48) << (+(8'ha0)))) != $unsigned(($signed(reg44) - (wire41 ?
                  wire41 : wire43)))));
        end
      reg51 <= (+wire42[(2'h3):(2'h3)]);
    end
  assign wire52 = (~reg46);
  assign wire53 = ($signed(wire52[(3'h5):(3'h4)]) ?
                      $signed($signed((&$signed(reg49)))) : (^wire43));
  assign wire54 = $signed($signed(reg49));
  assign wire55 = ($signed(($signed((^(8'hb5))) ?
                      $signed(reg51) : reg46[(3'h6):(3'h5)])) < (-reg47));
  assign wire56 = ($signed((~&(^reg48))) == (~&$unsigned($unsigned((reg49 ?
                      reg48 : reg48)))));
  assign wire57 = (({{$unsigned(wire43)}, reg48[(1'h0):(1'h0)]} ?
                      (~^wire53[(4'hc):(2'h3)]) : ($signed($unsigned(wire52)) ?
                          $signed(reg49[(4'hd):(4'hd)]) : reg50[(2'h2):(1'h1)])) && reg49[(4'hc):(4'hc)]);
  assign wire58 = $signed($unsigned(($unsigned($signed(reg50)) ?
                      (!{(8'ha5)}) : ((wire53 >> wire53) ?
                          (wire52 >> wire55) : (wire52 ? wire52 : (7'h41))))));
  always
    @(posedge clk) begin
      if (wire52[(4'hd):(4'h9)])
        begin
          reg59 <= reg50[(3'h4):(3'h4)];
        end
      else
        begin
          reg59 <= reg46[(3'h5):(3'h5)];
          if (reg59)
            begin
              reg60 <= (($signed({$signed(wire52)}) > wire56) ? reg44 : wire57);
              reg61 <= ($signed({reg60[(4'ha):(4'h9)], reg47[(3'h5):(1'h1)]}) ?
                  ($signed(reg51) <<< $unsigned(wire54)) : {reg46[(3'h6):(3'h5)]});
              reg62 <= reg61;
              reg63 <= (^~(8'hbf));
              reg64 <= $unsigned(reg51[(3'h6):(3'h5)]);
            end
          else
            begin
              reg60 <= (wire43[(3'h7):(1'h1)] ? reg50 : wire58);
              reg61 <= $signed({$unsigned(wire40[(2'h2):(1'h1)]),
                  $unsigned({$signed(wire42)})});
              reg62 <= $unsigned({{{wire41},
                      (reg45[(4'h9):(3'h5)] >= (wire52 ? wire40 : reg45))}});
              reg63 <= wire57[(2'h3):(2'h2)];
            end
          reg65 <= reg63[(5'h12):(2'h3)];
        end
      reg66 <= (8'had);
      reg67 <= $signed((&wire40[(1'h0):(1'h0)]));
    end
  assign wire68 = ((reg50[(1'h0):(1'h0)] ~^ $signed($unsigned($signed(wire54)))) >> (^~$signed(($signed(wire53) ?
                      {wire56} : (wire54 << wire54)))));
  assign wire69 = wire41[(4'h9):(4'h9)];
  assign wire70 = ((^($signed($signed(reg44)) << ((8'hb2) ?
                      (|wire57) : {reg45,
                          reg65}))) >>> $unsigned(((8'hb3) && (+{reg62,
                      reg45}))));
  assign wire71 = ($unsigned((~^reg60[(2'h2):(1'h1)])) ?
                      $signed(($unsigned($unsigned(reg67)) * (^~wire52))) : $signed($signed({(8'h9f),
                          reg48[(4'hf):(4'hc)]})));
  module72 #() modinst95 (.wire75(reg51), .wire73(wire54), .wire74(reg45), .y(wire94), .wire76(reg48), .clk(clk));
  assign wire96 = ((((-(wire58 ? wire40 : reg60)) ?
                      $unsigned($unsigned(reg50)) : reg48) - {$unsigned($unsigned(wire54)),
                      wire55[(4'h9):(3'h6)]}) != wire58);
endmodule

module module72
#(parameter param92 = ({({{(8'hb6), (8'hbf)}} ? (-{(8'haa)}) : {((8'hb5) ? (8'ha5) : (8'hb0))})} ? ((~&((~(8'hb5)) + ((8'hae) ? (8'hb9) : (8'hab)))) ? {((^~(8'ha3)) & ((8'hb3) <<< (7'h43)))} : ((((8'hb1) ? (8'ha9) : (8'h9d)) >> ((8'ha8) ? (8'had) : (8'hb0))) >>> (~&(~^(7'h42))))) : (((!((8'h9e) ? (8'hb6) : (8'hb3))) ? (~|((8'hae) ^~ (8'h9d))) : (((8'hba) == (7'h43)) ? (!(8'hbe)) : (&(8'h9c)))) ? (~&((~^(7'h40)) << ((8'hbc) ? (8'hb3) : (8'h9f)))) : (({(7'h41)} ? ((8'hbf) | (8'hbc)) : (~|(8'ha3))) != ((-(8'h9d)) ? (8'ha9) : (~|(8'hab)))))), 
parameter param93 = (~|({param92, {((8'hae) ^ param92)}} ? {(!(~|param92))} : ((~&((8'ha9) || param92)) != (!(~|param92))))))
(y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire76;
  input wire signed [(4'he):(1'h0)] wire75;
  input wire signed [(4'hf):(1'h0)] wire74;
  input wire [(4'ha):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg85,
                 (1'h0)};
  assign wire77 = (($signed((wire74 ? $signed(wire74) : {wire75, wire74})) ?
                      wire73 : (8'hbf)) << $unsigned({(&(wire76 > wire74)),
                      $signed((wire74 ? wire76 : wire76))}));
  assign wire78 = $signed(wire75[(3'h4):(2'h3)]);
  assign wire79 = wire77[(4'h8):(2'h2)];
  assign wire80 = $signed(wire74[(4'hc):(4'hb)]);
  assign wire81 = wire76;
  assign wire82 = wire75[(1'h1):(1'h0)];
  assign wire83 = $unsigned($signed($signed($signed(wire73))));
  assign wire84 = $signed((wire79 ?
                      (($unsigned(wire77) > (wire73 != (8'ha4))) ?
                          wire82[(1'h1):(1'h0)] : wire80) : $signed(((wire76 + wire79) ?
                          wire82 : (8'hb0)))));
  always
    @(posedge clk) begin
      reg85 <= wire84;
    end
  assign wire86 = $unsigned(wire73);
  assign wire87 = {((((^~(8'hae)) > $signed(wire86)) == ($signed(wire73) ?
                          (7'h44) : $signed(wire82))) != wire73[(1'h1):(1'h1)]),
                      $signed((&($unsigned(wire83) ?
                          $signed(wire75) : wire78[(1'h1):(1'h0)])))};
  assign wire88 = wire86[(3'h5):(1'h0)];
  assign wire89 = wire74;
  assign wire90 = wire78[(3'h4):(2'h3)];
  assign wire91 = ($unsigned($unsigned({(!wire82), $unsigned(wire81)})) ?
                      wire80 : ($signed((-wire79)) > $unsigned((8'ha3))));
endmodule
