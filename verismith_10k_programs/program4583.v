module top
#(parameter param116 = (((((!(8'hab)) ? ((8'hae) >= (8'ha9)) : (+(8'hbe))) ~^ (((8'h9c) ? (8'hab) : (8'ha9)) ? (~&(8'h9e)) : ((8'hb1) ? (8'ha3) : (8'haa)))) * (!(((8'ha6) ? (8'hb9) : (8'hab)) >>> ((8'hba) <<< (8'hb0))))) | (({{(8'hbf)}} ^ (+((8'haf) ? (8'had) : (8'h9f)))) ? (|((+(8'hb6)) > ((8'hb3) - (7'h44)))) : (^~(~&((8'ha4) >> (8'hbd)))))), 
parameter param117 = (8'hab))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire9;
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  assign y = {wire115,
                 wire113,
                 wire98,
                 wire92,
                 wire91,
                 wire80,
                 wire79,
                 wire75,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire9,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg78,
                 reg77,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= $unsigned((8'hb0));
      reg7 <= $signed(wire2[(4'hc):(4'h9)]);
      reg8 <= wire4;
    end
  assign wire9 = $unsigned((reg5 ?
                     (reg8[(2'h2):(1'h0)] ?
                         (&(reg5 && reg6)) : (~|(wire3 != wire3))) : reg8[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg10 <= $unsigned($signed(($signed((-wire4)) >> ((reg7 ?
          (8'hb4) : reg8) << {reg8}))));
      if ((8'h9f))
        begin
          reg11 <= (8'h9f);
          if ({reg10,
              (wire0 ~^ ($signed((wire1 ? (7'h44) : wire4)) ?
                  $signed({wire0, reg6}) : wire0))})
            begin
              reg12 <= (~|reg6);
              reg13 <= wire3;
              reg14 <= (^($signed($unsigned((reg8 + wire1))) ?
                  $unsigned($unsigned(wire0[(3'h5):(3'h5)])) : reg13[(1'h0):(1'h0)]));
              reg15 <= wire9[(4'hf):(2'h2)];
            end
          else
            begin
              reg12 <= (~$signed(wire4[(3'h6):(2'h2)]));
              reg13 <= ($signed($unsigned((((8'hbc) ?
                      (7'h42) : reg11) <= (wire9 ? wire4 : wire9)))) ?
                  $unsigned($signed(wire3)) : $signed((reg7 ?
                      (reg15 & {reg14}) : (~^(wire2 - wire2)))));
              reg14 <= reg7[(4'he):(4'hb)];
              reg15 <= {$unsigned(reg14), wire9};
              reg16 <= $signed($unsigned((($signed(wire3) ?
                  (wire3 > wire9) : $unsigned(reg15)) > wire9[(4'h8):(3'h5)])));
            end
          reg17 <= $unsigned(reg5);
          if (reg11[(3'h5):(3'h5)])
            begin
              reg18 <= {$signed(wire3[(2'h3):(1'h0)]), reg12};
            end
          else
            begin
              reg18 <= wire9;
              reg19 <= ($unsigned($signed((reg18 ?
                  reg5[(4'h9):(3'h7)] : reg18))) << reg11[(1'h0):(1'h0)]);
            end
          reg20 <= reg13[(4'hb):(4'h8)];
        end
      else
        begin
          if ((-($unsigned(wire4) <<< $signed(wire9))))
            begin
              reg11 <= (+(^(^~reg16[(5'h13):(4'ha)])));
              reg12 <= wire4[(3'h4):(3'h4)];
            end
          else
            begin
              reg11 <= $signed((+reg7));
              reg12 <= reg8;
              reg13 <= ((~&wire4) ?
                  $unsigned({(7'h43)}) : $unsigned($unsigned(reg17)));
              reg14 <= $signed(reg5[(1'h0):(1'h0)]);
            end
          reg15 <= $signed($signed($signed((wire2[(4'h8):(1'h1)] <= $unsigned(reg16)))));
        end
    end
  assign wire21 = ((8'hb2) ?
                      {($unsigned((reg13 ? (8'haf) : reg20)) ?
                              $signed((reg11 < wire1)) : $signed($unsigned(reg16))),
                          wire3[(1'h1):(1'h1)]} : {$signed($unsigned((wire1 >= (8'hbe)))),
                          ($unsigned($signed(reg17)) ?
                              {reg5} : reg13[(3'h6):(1'h0)])});
  assign wire22 = (($signed($signed((wire21 ?
                          wire21 : reg5))) && $unsigned($unsigned(reg20[(1'h0):(1'h0)]))) ?
                      reg17 : (wire2[(4'ha):(3'h7)] ?
                          $unsigned((wire0[(4'h8):(2'h2)] >>> (reg8 ?
                              (8'hbe) : wire4))) : wire1));
  assign wire23 = $signed({(|($unsigned(wire22) ?
                          (reg19 >= wire22) : $unsigned(wire1))),
                      (^reg12[(4'h8):(3'h6)])});
  assign wire24 = (+wire21[(3'h5):(2'h2)]);
  assign wire25 = (reg14[(2'h3):(1'h0)] ^ $unsigned($signed({$unsigned(reg17)})));
  assign wire26 = $signed((($unsigned((~|wire0)) ?
                      reg20[(3'h5):(1'h0)] : $unsigned(reg5[(4'h9):(1'h1)])) << $unsigned($signed((wire0 ?
                      reg14 : wire4)))));
  assign wire27 = (+$signed($unsigned(wire25)));
  module28 #() modinst76 (wire75, clk, reg14, wire2, reg12, wire0, reg13);
  always
    @(posedge clk) begin
      reg77 <= {$unsigned(($unsigned($signed(wire4)) ?
              reg17[(2'h2):(1'h1)] : reg11))};
      reg78 <= {(((~|$signed(reg13)) ? reg18 : wire23[(4'ha):(4'h9)]) ?
              reg20 : (reg8 ?
                  $unsigned(wire1[(1'h1):(1'h1)]) : $signed(reg11))),
          wire27[(3'h7):(2'h3)]};
    end
  assign wire79 = wire25[(5'h10):(4'hc)];
  assign wire80 = (|wire0);
  always
    @(posedge clk) begin
      reg81 <= $unsigned(reg6[(1'h0):(1'h0)]);
      reg82 <= $signed((^$unsigned($signed((wire1 ? reg17 : wire21)))));
      if ((~(wire9[(4'he):(3'h5)] || (wire4[(4'h8):(3'h6)] == (&wire25[(5'h14):(4'hc)])))))
        begin
          reg83 <= reg77;
          reg84 <= ((-$signed((-wire80))) >>> (~^(^~(wire9 ?
              {reg77, reg5} : (reg10 ? reg8 : reg8)))));
          if (({(8'ha1)} ?
              $unsigned(((7'h42) ?
                  {$signed(wire1),
                      (7'h40)} : (~^reg12[(3'h5):(2'h3)]))) : wire24))
            begin
              reg85 <= wire0;
            end
          else
            begin
              reg85 <= $signed(reg14);
              reg86 <= ((~&($signed((|wire27)) <<< $signed((reg85 ?
                      wire75 : reg12)))) ?
                  (!{wire22[(1'h1):(1'h0)]}) : reg11);
              reg87 <= ((wire79 ~^ $unsigned(((+wire25) ^~ $signed(reg12)))) ?
                  reg19[(1'h1):(1'h0)] : $signed(wire23[(4'he):(4'h9)]));
              reg88 <= $signed(reg85);
            end
          reg89 <= (($unsigned(reg6[(4'h9):(1'h1)]) ?
              wire0 : (wire0[(4'hf):(4'ha)] <<< (!(reg5 ?
                  (7'h42) : reg5)))) || $unsigned((reg84 ?
              ($signed(reg14) ?
                  ((8'h9e) >>> wire22) : ((8'hab) ^~ (7'h40))) : (^~wire75[(4'h9):(3'h7)]))));
          reg90 <= $unsigned((~(reg5[(4'hb):(4'h9)] ?
              ($signed(wire0) ^ $unsigned(reg88)) : {$signed(wire27),
                  $signed((8'hb3))})));
        end
      else
        begin
          reg83 <= (wire2 ?
              wire21[(3'h6):(2'h2)] : ($signed(({wire0, reg87} ^ (!(8'hb2)))) ?
                  $signed(($signed((7'h40)) >> reg89)) : ((reg88[(2'h3):(2'h3)] ?
                      {reg20, reg16} : {reg17, wire25}) & ($signed(reg15) ?
                      $unsigned(wire21) : wire26[(1'h0):(1'h0)]))));
          reg84 <= reg7;
        end
    end
  assign wire91 = (wire26[(2'h2):(2'h2)] + (reg5[(2'h3):(1'h0)] ?
                      reg85[(3'h4):(2'h2)] : $unsigned($unsigned($unsigned(reg5)))));
  assign wire92 = wire75;
  always
    @(posedge clk) begin
      reg93 <= $signed(reg13[(4'he):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg94 <= $signed((($signed(wire0) ?
          (~&(7'h42)) : {(wire91 ?
                  (8'haf) : (8'hb3))}) * $signed($unsigned({wire9}))));
      reg95 <= ((+(&($signed((8'hb3)) ?
          $signed((8'hb8)) : $signed(reg7)))) + $signed($unsigned(($unsigned(wire26) ?
          reg77 : reg6))));
      reg96 <= $unsigned((&(reg94[(4'ha):(2'h3)] << ($signed(reg16) << (~&reg6)))));
      reg97 <= (($signed(reg14) ?
          (wire91[(4'h8):(4'h8)] | $unsigned((|reg89))) : (~^$signed($signed(reg17)))) == wire2[(4'h8):(3'h7)]);
    end
  assign wire98 = (8'hab);
  module99 #() modinst114 (wire113, clk, wire26, reg7, reg15, wire22);
  assign wire115 = ($signed($signed((wire24[(4'h9):(4'h8)] < $unsigned(reg83)))) != reg95);
endmodule

module module99
#(parameter param111 = ((~({(8'ha3)} ? {((8'hb0) ^ (8'hbb)), (&(8'hbb))} : (((8'h9f) ? (8'hb4) : (8'ha9)) ? (8'ha3) : (^(8'h9e))))) <<< (((((8'ha5) != (8'hb5)) >= {(8'hb1)}) || (((8'hb4) ? (8'hb3) : (7'h44)) && (+(8'ha4)))) || {(-(-(8'h9f)))})), 
parameter param112 = param111)
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire103;
  input wire [(4'h9):(1'h0)] wire102;
  input wire [(3'h5):(1'h0)] wire101;
  input wire [(4'hd):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 (1'h0)};
  assign wire104 = wire102[(3'h4):(3'h4)];
  assign wire105 = wire104;
  assign wire106 = $signed(($signed(($signed((8'hb4)) ^~ wire100)) * wire104[(1'h1):(1'h1)]));
  assign wire107 = {(!(-$unsigned((wire103 <<< wire106)))),
                       $signed(($signed(wire100) >= (&wire100)))};
  assign wire108 = {wire106, wire101[(2'h3):(1'h0)]};
  assign wire109 = wire108;
  assign wire110 = $unsigned((^(8'hbf)));
endmodule

module module28
#(parameter param74 = ((((((8'hbb) - (8'haa)) ? {(8'hae)} : ((8'ha0) ? (7'h40) : (8'hbc))) ? ({(7'h44)} | (&(8'hbf))) : ((^(7'h44)) ? (~(8'hb0)) : ((7'h43) ? (7'h43) : (8'hb5)))) > (({(8'hb2)} ? (&(8'ha1)) : {(8'hbc), (8'hb6)}) == (!((8'hb3) <<< (8'h9f))))) ? (^(~^(8'hb0))) : (+({{(8'hb5)}, (^(8'hbc))} > (((7'h40) ? (8'hb4) : (8'hb8)) + ((7'h43) ~^ (8'hb1)))))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  assign y = {wire73, wire71, wire36, wire35, wire34, (1'h0)};
  assign wire34 = ($unsigned(wire32[(4'hd):(3'h7)]) ?
                      {wire29[(2'h2):(1'h0)]} : wire29[(4'h8):(3'h5)]);
  assign wire35 = (7'h44);
  assign wire36 = $unsigned($signed(((|$signed(wire34)) ?
                      $signed((wire33 - (8'ha3))) : wire35)));
  module37 #() modinst72 (.wire41(wire29), .y(wire71), .wire40(wire36), .clk(clk), .wire39(wire32), .wire38(wire33));
  assign wire73 = wire36;
endmodule

module module37
#(parameter param70 = ((~^((((8'ha4) ? (8'hb1) : (8'hab)) ? (&(8'hb4)) : (&(8'hb2))) ? (((8'ha1) - (7'h43)) ? ((7'h41) ? (8'ha0) : (8'hb9)) : ((8'hbf) ~^ (8'hb4))) : (~&((8'hae) ? (8'ha2) : (8'hb8))))) << (-(8'hba))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire41;
  input wire signed [(3'h6):(1'h0)] wire40;
  input wire signed [(4'ha):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire44,
                 wire43,
                 wire42,
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
                 reg45,
                 (1'h0)};
  assign wire42 = $signed($signed((((^~wire38) ?
                          (wire40 ? wire39 : wire41) : wire41) ?
                      (|((8'hab) ? (8'hb2) : wire38)) : ($unsigned(wire38) ?
                          $unsigned(wire40) : (&wire40)))));
  assign wire43 = (+wire39[(2'h2):(1'h1)]);
  assign wire44 = ((-wire42) != $unsigned((wire43 ?
                      wire40 : wire38[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg45 <= ({(wire42 + {(wire39 ? wire42 : wire44), $signed(wire39)}),
              $unsigned(wire43)} ?
          wire39[(3'h7):(2'h2)] : ($unsigned({$signed((8'hbf)),
                  (wire39 ? wire39 : wire40)}) ?
              $unsigned($unsigned(wire40)) : (8'hb3)));
    end
  always
    @(posedge clk) begin
      reg46 <= (reg45 <<< (^~wire39[(2'h2):(1'h0)]));
      reg47 <= $signed((~wire43[(2'h3):(1'h0)]));
      reg48 <= (8'ha4);
      if ($signed((^($unsigned($signed((8'h9d))) < $unsigned({reg45})))))
        begin
          reg49 <= wire42[(3'h5):(1'h0)];
          reg50 <= wire44[(2'h3):(2'h3)];
          if ((reg50[(1'h0):(1'h0)] > reg50))
            begin
              reg51 <= (&wire41[(3'h7):(1'h0)]);
              reg52 <= wire40[(2'h2):(1'h1)];
              reg53 <= (^wire41);
            end
          else
            begin
              reg51 <= reg47[(2'h3):(1'h1)];
              reg52 <= $unsigned(reg46[(3'h5):(3'h5)]);
            end
          reg54 <= $unsigned(wire41);
        end
      else
        begin
          if ((~&(!wire43[(1'h1):(1'h0)])))
            begin
              reg49 <= {$unsigned(reg45[(3'h6):(3'h4)])};
              reg50 <= (wire38 ? wire39 : $unsigned(reg46));
            end
          else
            begin
              reg49 <= (^~$unsigned(reg54));
            end
        end
      reg55 <= (-$unsigned(wire39));
    end
  always
    @(posedge clk) begin
      reg56 <= reg45[(1'h1):(1'h1)];
      reg57 <= reg48[(3'h7):(2'h2)];
    end
  assign wire58 = {((~^($unsigned(reg52) ? {wire44} : reg57)) >> ((&(reg47 ?
                              reg50 : (8'hb0))) ?
                          (reg52 ~^ ((8'ha0) ?
                              reg54 : reg45)) : $unsigned({(7'h41), reg51}))),
                      (reg52 > $signed(wire41))};
  assign wire59 = ($unsigned(wire42[(3'h7):(3'h7)]) == ({({reg46,
                          wire44} > (wire44 >>> wire58)),
                      reg54[(3'h4):(2'h2)]} + {((reg54 ?
                          reg48 : reg53) != $unsigned(wire39))}));
  assign wire60 = (($unsigned($signed(wire39[(1'h1):(1'h0)])) ?
                      (reg45[(4'h9):(1'h0)] ~^ reg56) : reg51[(1'h1):(1'h1)]) << {$signed($signed($signed(wire41))),
                      (^~wire39)});
  assign wire61 = ($unsigned((~|$unsigned(wire39))) ?
                      (|($signed($signed(wire60)) ?
                          $unsigned(wire60[(2'h2):(2'h2)]) : wire40)) : wire43[(1'h0):(1'h0)]);
  assign wire62 = ({{((+(8'hbe)) ? (^~(8'hae)) : (wire39 ? (8'ha7) : reg48))}} ?
                      {(^~$signed($unsigned(wire58)))} : reg51[(3'h5):(2'h3)]);
  assign wire63 = ((^~(~&$signed($unsigned(reg47)))) ?
                      $signed((^{{reg51, reg53}})) : (wire43 ?
                          (reg46[(1'h1):(1'h1)] & (reg54 ^ reg51[(2'h2):(1'h1)])) : reg45[(2'h3):(2'h3)]));
  assign wire64 = ((^($signed($unsigned(reg54)) >> $unsigned(reg54[(1'h0):(1'h0)]))) * reg50);
  assign wire65 = $signed(({(^~(reg55 ? wire39 : wire43)),
                          $unsigned((!wire43))} ?
                      $unsigned($signed({(8'hbe),
                          wire61})) : $signed({reg49})));
  assign wire66 = wire62[(1'h1):(1'h1)];
  assign wire67 = $signed($signed(wire65));
  assign wire68 = $signed($unsigned({wire58[(3'h4):(2'h2)]}));
  assign wire69 = ($signed((wire40 ? (+{wire60}) : (8'haa))) ?
                      (^reg52[(3'h6):(3'h5)]) : $signed({$unsigned((wire61 >> wire65))}));
endmodule
