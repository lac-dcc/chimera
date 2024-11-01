module top
#(parameter param81 = ((8'hb5) ? ({{(+(8'h9c)), (+(8'hb3))}, (((8'ha0) ? (8'ha8) : (8'hb6)) && {(8'ha9)})} | ((&((8'hb5) >= (8'ha5))) & {(8'haa), ((8'hb2) ? (8'h9e) : (8'hbb))})) : {((((8'ha7) ? (8'ha0) : (8'hbc)) - ((8'h9f) * (8'hbe))) ? {(~(8'hb2)), ((8'hba) != (8'hab))} : (~|((8'hb5) & (8'hb0))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire60;
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire60,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire0[(4'hc):(4'hb)] ?
          $unsigned((^(^~wire3[(1'h1):(1'h1)]))) : {(wire3[(1'h1):(1'h1)] >= wire0[(3'h7):(3'h4)]),
              (($unsigned(wire1) ?
                  $unsigned(wire3) : (~|wire1)) ~^ $unsigned((wire0 != wire0)))}))
        begin
          reg4 <= $unsigned($signed((^~(wire1 + (wire2 * wire3)))));
          reg5 <= (~^($signed(wire2) + ((~^$unsigned(wire3)) ?
              $unsigned(wire2) : ((+wire3) ~^ $unsigned(wire2)))));
        end
      else
        begin
          reg4 <= $unsigned((8'ha3));
          if (reg4)
            begin
              reg5 <= $signed((($unsigned({wire3, wire2}) ?
                      {$unsigned(wire1),
                          (8'hb5)} : (wire0[(4'hb):(3'h4)] - $unsigned(reg5))) ?
                  wire1[(1'h0):(1'h0)] : reg4));
            end
          else
            begin
              reg5 <= $unsigned((wire0[(4'hb):(4'ha)] ^~ (((wire2 ?
                      (8'haf) : (8'had)) <= $signed((8'hb0))) ?
                  $unsigned(reg4) : ((!reg4) < (+(8'hb8))))));
            end
          reg6 <= wire3;
        end
      reg7 <= $signed(wire1[(3'h5):(1'h0)]);
      reg8 <= (reg5[(4'h9):(3'h4)] ?
          (~(8'hb7)) : (((~&$signed(wire0)) ?
                  ($signed(reg4) <= {reg5}) : (~^(~&reg6))) ?
              $unsigned($unsigned(wire1)) : wire3));
      if ((wire0 ^~ (($signed($signed(reg7)) << (!reg8)) - $signed((reg4[(2'h3):(2'h2)] < (~^reg8))))))
        begin
          if (reg7[(2'h3):(1'h0)])
            begin
              reg9 <= $signed(($signed(reg8) ?
                  ((wire1[(3'h7):(3'h5)] && ((8'haf) >> reg6)) <<< {$unsigned(reg4)}) : $unsigned($signed({reg6,
                      wire0}))));
              reg10 <= ((reg7 ?
                      $signed(reg6[(4'hd):(4'hc)]) : $signed((&(reg6 ?
                          reg8 : wire0)))) ?
                  {{reg7[(1'h1):(1'h1)]}} : wire2[(2'h2):(1'h1)]);
              reg11 <= ({reg4[(2'h3):(2'h3)],
                      $unsigned(($signed((8'hb6)) * wire2[(4'h9):(2'h3)]))} ?
                  (reg6[(2'h3):(2'h2)] ?
                      wire3 : (wire1[(2'h3):(2'h3)] * wire2)) : {(($unsigned(reg4) < $unsigned(reg7)) || reg8[(1'h0):(1'h0)])});
              reg12 <= $signed(reg8[(1'h1):(1'h0)]);
              reg13 <= reg10[(3'h5):(1'h1)];
            end
          else
            begin
              reg9 <= (8'hb0);
              reg10 <= reg8[(3'h4):(2'h2)];
              reg11 <= $unsigned(($signed($signed(reg5)) ?
                  $signed((^~wire3[(2'h2):(1'h0)])) : wire2[(4'h9):(4'h9)]));
            end
          reg14 <= reg4[(4'h8):(3'h7)];
          reg15 <= (wire1 & $signed($signed(wire3[(4'he):(4'h9)])));
          reg16 <= reg4[(2'h3):(1'h1)];
        end
      else
        begin
          reg9 <= reg11;
          reg10 <= ((reg15[(3'h6):(1'h0)] ?
              $unsigned((reg13 + ((8'hb2) << reg4))) : ($signed((^reg11)) ?
                  reg9[(4'hb):(3'h7)] : $signed({reg5}))) >> wire0);
        end
    end
  assign wire17 = reg7;
  assign wire18 = wire0[(1'h1):(1'h0)];
  assign wire19 = ($signed(wire2) ?
                      ((-wire0) | {{(wire17 ? reg6 : reg7), reg7},
                          ((wire2 & wire17) ?
                              $signed(reg12) : $signed(wire0))}) : (reg16 ?
                          (wire0 && {(reg7 ?
                                  reg13 : reg12)}) : wire3[(1'h0):(1'h0)]));
  assign wire20 = {$unsigned((^$signed({reg4}))), reg9[(2'h2):(1'h1)]};
  module21 #() modinst61 (wire60, clk, wire2, reg4, reg13, reg7, reg15);
  assign wire62 = (~^{(!reg5[(1'h1):(1'h0)]),
                      ($unsigned(wire3) ?
                          wire0[(1'h1):(1'h0)] : $signed((reg15 | reg5)))});
  assign wire63 = (wire18[(5'h14):(4'h9)] ?
                      reg6[(1'h0):(1'h0)] : reg16[(2'h3):(2'h2)]);
  assign wire64 = (((^~((reg10 >> wire2) >>> (^wire62))) > $signed($signed((wire20 * wire19)))) ?
                      {reg4, $unsigned(reg16)} : {$signed(reg13),
                          $unsigned($unsigned({(8'hb7)}))});
  assign wire65 = $signed((reg14[(2'h2):(2'h2)] ? reg6[(3'h5):(1'h1)] : wire0));
  always
    @(posedge clk) begin
      reg66 <= reg8[(3'h5):(3'h5)];
      reg67 <= {$signed(wire3), wire64[(5'h11):(2'h3)]};
      reg68 <= $unsigned({wire63[(1'h0):(1'h0)], reg5[(3'h5):(2'h2)]});
      if (((|(~wire62)) <<< {(^~(8'ha7))}))
        begin
          reg69 <= ($unsigned($signed({(wire60 * reg8), wire62})) ?
              {wire62} : wire20);
          if (($unsigned((((reg69 && reg68) ?
                  wire20 : $unsigned(wire17)) != reg67[(1'h0):(1'h0)])) ?
              wire1[(4'h8):(2'h2)] : ($signed(wire3) ?
                  reg12 : (((8'hac) && (-reg16)) ?
                      (&(reg5 - reg12)) : reg66[(4'hb):(4'ha)]))))
            begin
              reg70 <= ($signed(((8'hb1) ?
                  (wire65[(3'h7):(3'h6)] ?
                      reg16 : (~^wire64)) : $unsigned(((8'ha1) < reg9)))) ~^ (-{$signed($signed(reg67))}));
              reg71 <= (~(wire62[(2'h3):(2'h2)] ?
                  wire20[(4'h8):(2'h3)] : reg70));
              reg72 <= $unsigned((((~^(~wire3)) ?
                  $signed((wire1 ?
                      wire60 : (8'ha6))) : wire1[(3'h6):(2'h2)]) + (({wire60,
                  (8'hb3)} << wire3) > ((reg13 * reg9) && wire63))));
              reg73 <= $signed(wire64[(5'h10):(4'h9)]);
              reg74 <= (8'hab);
            end
          else
            begin
              reg70 <= ((reg72[(1'h0):(1'h0)] ?
                      $unsigned(($unsigned(wire3) ?
                          (reg74 < wire0) : $unsigned((8'h9f)))) : (((~reg67) * (reg72 ^~ wire65)) > wire20)) ?
                  (~&(reg73 ?
                      $unsigned({reg11,
                          wire64}) : $unsigned((~^reg68)))) : ((7'h44) >> wire64[(3'h7):(3'h7)]));
              reg71 <= ($unsigned(wire3) >> ((((|wire62) > reg74[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned(reg4)) : $unsigned(reg72[(1'h1):(1'h1)])) >>> ((-(reg6 || reg70)) ?
                  (wire60 ^ {reg8, reg8}) : reg12[(3'h5):(1'h0)])));
              reg72 <= $signed($unsigned((((+(8'hb8)) ?
                      wire18[(3'h7):(2'h2)] : (reg14 ? (7'h44) : reg15)) ?
                  ((reg9 || reg9) || $signed(reg11)) : reg72[(4'ha):(1'h0)])));
              reg73 <= ((+{($unsigned(reg6) ?
                          wire1[(4'h8):(2'h3)] : (wire20 ? wire1 : reg70)),
                      wire1}) ?
                  wire65 : (~|{(~{reg5}), reg14[(3'h7):(3'h5)]}));
            end
          if (reg66)
            begin
              reg75 <= (({$unsigned((!wire17)),
                  reg67} ^~ {(wire0[(4'ha):(2'h2)] & $unsigned(reg8)),
                  reg14[(3'h4):(2'h3)]}) <<< (reg67 ?
                  $unsigned(wire63) : (wire60 > $signed((reg74 - wire62)))));
              reg76 <= (&reg74[(1'h1):(1'h0)]);
              reg77 <= (~^$unsigned($signed(reg11[(4'hd):(4'hc)])));
              reg78 <= $unsigned(reg11);
            end
          else
            begin
              reg75 <= (!reg73);
            end
        end
      else
        begin
          if (reg77)
            begin
              reg69 <= ((^reg74[(1'h0):(1'h0)]) >>> (($unsigned(reg77[(4'hb):(1'h1)]) ?
                      $signed(reg7[(2'h3):(2'h3)]) : ((reg12 ?
                          reg6 : reg73) ~^ ((8'h9f) ? reg76 : reg13))) ?
                  (~&wire17[(3'h4):(3'h4)]) : ((~reg9[(4'ha):(4'h9)]) >> ((reg13 ?
                          (8'hb2) : reg76) ?
                      (~&reg69) : $signed(reg76)))));
              reg70 <= (|(^wire2[(1'h0):(1'h0)]));
              reg71 <= $signed({(reg10 >>> wire64[(4'hf):(2'h3)])});
            end
          else
            begin
              reg69 <= (~{(8'haf)});
            end
          reg72 <= $unsigned(reg11);
          reg73 <= wire2[(5'h12):(5'h10)];
          reg74 <= $signed($signed($signed(((+reg10) <<< reg69[(3'h4):(3'h4)]))));
        end
    end
  assign wire79 = reg66[(3'h6):(2'h2)];
  assign wire80 = wire79[(3'h4):(1'h0)];
endmodule

module module21
#(parameter param58 = (|{{(((8'ha3) ? (8'ha8) : (8'ha5)) ? ((8'hbe) ? (8'hba) : (8'h9f)) : ((8'hac) * (8'hbc)))}}), 
parameter param59 = {{((!param58) ? ((+param58) ? (^param58) : {(8'ha1), param58}) : ((|param58) ? (+param58) : param58))}, ((&{(param58 >>> param58)}) + param58)})
(y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire53;
  assign y = {wire57, wire56, wire55, wire53, (1'h0)};
  module27 #() modinst54 (wire53, clk, wire22, wire24, wire25, wire26, wire23);
  assign wire55 = $signed(((((wire53 ?
                          wire53 : wire53) > wire53[(5'h11):(5'h11)]) << (~^wire24)) ?
                      ($signed(wire53) && ((~wire24) ?
                          {wire22} : $signed(wire53))) : wire26[(4'h9):(3'h6)]));
  assign wire56 = $unsigned(wire53[(2'h2):(2'h2)]);
  assign wire57 = wire53;
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire33;
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  assign y = {wire52,
                 wire37,
                 wire33,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = wire32;
  always
    @(posedge clk) begin
      reg34 <= (-$signed($unsigned($signed((-wire31)))));
      reg35 <= (8'hb6);
      reg36 <= wire33;
    end
  assign wire37 = ((($signed((|wire30)) ^ ((8'hae) ?
                              ((8'ha8) < reg34) : (+wire32))) ?
                          (({wire29, wire29} ? {wire28, reg35} : wire31) ?
                              (-wire31[(5'h10):(4'h9)]) : {((8'hb1) ?
                                      reg34 : wire29),
                                  (reg34 && reg35)}) : $signed($unsigned(wire33[(1'h0):(1'h0)]))) ?
                      (($unsigned((wire32 ? wire33 : (8'ha8))) ?
                              reg35[(2'h3):(2'h3)] : (wire29[(1'h1):(1'h0)] ?
                                  $unsigned(wire29) : ((8'hb7) ?
                                      reg36 : wire28))) ?
                          reg36 : wire33) : ((((reg35 ? reg36 : wire32) ?
                          $signed(wire30) : (reg34 ?
                              wire30 : wire31)) || ($signed(wire32) ?
                          (wire30 != wire33) : wire32)) < wire33));
  always
    @(posedge clk) begin
      reg38 <= (((wire28 ?
          ((8'ha0) ? (reg34 && reg35) : reg36) : {$signed(wire32),
              ((8'ha5) * wire37)}) >>> wire33) < (reg35 ?
          $unsigned($signed($unsigned(wire29))) : $unsigned((^{wire32,
              reg36}))));
      if (wire32[(3'h6):(3'h6)])
        begin
          reg39 <= $signed(((8'hba) >>> ((~&$signed(wire37)) ?
              (wire33 >> (reg38 && wire29)) : $unsigned((!wire30)))));
          reg40 <= ((reg38[(4'hf):(3'h6)] << (~&((+reg36) <= (wire28 ?
                  reg39 : reg36)))) ?
              wire37[(1'h0):(1'h0)] : $signed(wire28));
        end
      else
        begin
          reg39 <= wire33[(2'h3):(1'h0)];
          reg40 <= ((!(((wire37 <<< (8'hb3)) || (wire28 ? wire29 : reg40)) ?
              {reg35} : (&(wire32 ?
                  wire37 : wire31)))) > $unsigned({(wire33[(3'h4):(3'h4)] ~^ $signed(reg39))}));
          reg41 <= wire37[(1'h1):(1'h0)];
        end
      if ((8'hb3))
        begin
          reg42 <= $unsigned($signed({wire31[(3'h6):(2'h3)]}));
          reg43 <= wire30[(2'h3):(1'h0)];
          reg44 <= wire31[(3'h6):(3'h6)];
          reg45 <= ($signed($signed($signed((reg40 ?
              (8'hb7) : wire37)))) ~^ wire29[(1'h1):(1'h1)]);
          if ($unsigned(((8'hb8) > $unsigned(wire33[(1'h0):(1'h0)]))))
            begin
              reg46 <= wire33[(1'h0):(1'h0)];
              reg47 <= reg40[(3'h5):(2'h2)];
              reg48 <= $unsigned($signed((&((^~reg45) ?
                  $signed((8'ha1)) : (wire31 > reg35)))));
              reg49 <= (~|$signed(reg46));
            end
          else
            begin
              reg46 <= (((~{reg48, $unsigned(wire28)}) ?
                  $unsigned((((8'hb9) >= reg48) ?
                      (wire31 ?
                          reg40 : (8'ha6)) : $signed(reg48))) : reg34) + $signed({(8'h9c)}));
              reg47 <= $unsigned(wire29[(2'h3):(1'h0)]);
              reg48 <= ($signed($signed({(-reg49)})) ?
                  wire31 : ($unsigned(reg44) ^~ $unsigned((reg49[(5'h12):(3'h6)] && wire29))));
              reg49 <= (~|(($unsigned(reg47) | $signed({wire31,
                  reg35})) == $signed(((wire33 ?
                  reg34 : reg43) || (+wire37)))));
            end
        end
      else
        begin
          reg42 <= (|(reg36[(4'hc):(4'h8)] ?
              (~^reg41) : (~^((~^reg35) ? reg48 : (reg38 ? reg36 : reg41)))));
          reg43 <= reg34;
          reg44 <= (!{(~&((reg39 ^~ reg43) == (reg41 << reg38))),
              $unsigned($unsigned(reg48[(4'he):(4'h8)]))});
          if ($unsigned((-reg34)))
            begin
              reg45 <= $signed($signed(($unsigned((wire30 ? reg48 : reg47)) ?
                  ($unsigned(wire29) - $signed(wire37)) : reg47)));
            end
          else
            begin
              reg45 <= ((&wire28[(4'h8):(3'h4)]) ?
                  (~|($unsigned(reg48[(4'hd):(3'h6)]) <<< $signed($signed(wire29)))) : {($signed((wire37 + wire28)) >>> (reg41 ?
                          $signed(reg41) : wire28[(4'h8):(2'h2)]))});
            end
        end
      reg50 <= wire30;
      reg51 <= reg43[(1'h1):(1'h1)];
    end
  assign wire52 = (8'hba);
endmodule
