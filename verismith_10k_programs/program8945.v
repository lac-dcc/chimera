module top
#(parameter param95 = ((^~(({(8'haa)} ? (^~(8'ha3)) : ((8'had) ? (8'ha9) : (8'hbc))) ? (-(-(7'h43))) : (((8'hbc) * (8'hb9)) - (&(8'hb4))))) ? {((((8'hb1) << (8'hbd)) ? {(8'had)} : (7'h44)) + (-(|(8'hb9)))), ((^~((8'hae) != (8'h9e))) && {((8'hbe) ~^ (8'ha7))})} : {{(+((8'hb5) - (8'ha3)))}}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire73;
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire5,
                 wire6,
                 wire7,
                 wire26,
                 wire73,
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
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire5 = ($unsigned($signed(wire3)) >= {(wire1 ?
                         $unsigned($signed(wire1)) : (~|(^wire1)))});
  assign wire6 = {(wire0 & (wire5[(4'h9):(3'h4)] ?
                         ($signed(wire3) ^~ $unsigned(wire4)) : (|(wire5 ?
                             wire3 : wire4)))),
                     wire2[(4'hc):(3'h5)]};
  assign wire7 = ($unsigned(($unsigned({wire5, wire4}) ?
                         wire5[(4'hd):(2'h2)] : ($unsigned((8'ha7)) | (!wire2)))) ?
                     wire3 : (&(wire2[(4'hc):(4'hb)] ^~ wire0[(3'h7):(1'h0)])));
  always
    @(posedge clk) begin
      if ((-$unsigned(wire6)))
        begin
          reg8 <= (((8'hb6) ?
              $unsigned((+wire3[(4'he):(4'hd)])) : $unsigned(($signed(wire3) & wire7))) + $unsigned($unsigned(wire1)));
          reg9 <= wire2;
          reg10 <= reg9;
          reg11 <= (((($signed(wire5) ^~ (~wire5)) ?
              (wire5 + $unsigned((8'ha6))) : $unsigned(reg8)) - $unsigned({(+wire5)})) > ((8'hb7) ?
              {($signed(wire1) ? wire5 : wire7),
                  ({wire5} <<< (wire6 ?
                      reg9 : (8'hb7)))} : $unsigned(wire0[(4'hd):(1'h1)])));
        end
      else
        begin
          reg8 <= wire1;
          reg9 <= (^~(reg11[(1'h0):(1'h0)] > ({$signed(reg11)} < $signed($signed(wire6)))));
          if (reg11)
            begin
              reg10 <= $unsigned(wire0[(4'he):(4'hd)]);
              reg11 <= (|(wire4 ? wire3[(2'h2):(1'h0)] : wire4));
            end
          else
            begin
              reg10 <= (+((^~((wire0 ? reg11 : reg8) || (reg9 ?
                  wire5 : wire5))) & $signed(((wire5 | wire0) ?
                  (wire7 ? wire5 : (8'hb0)) : {reg8, wire6}))));
              reg11 <= (-(^~wire4));
            end
          if ($unsigned(wire6[(4'h9):(3'h5)]))
            begin
              reg12 <= (((8'hb2) | (((reg8 & (8'ha9)) <<< $signed((8'hb6))) && (8'hb0))) ?
                  wire7 : wire6);
              reg13 <= ({(-$signed((reg9 ? wire0 : reg9)))} ?
                  reg12 : $signed(((wire0[(4'hd):(2'h2)] ?
                      {reg10} : (~|(8'ha7))) & $unsigned((-wire4)))));
            end
          else
            begin
              reg12 <= $unsigned(($signed($signed((wire3 ? wire3 : wire0))) ?
                  (($signed(reg9) < (&(8'ha2))) != $unsigned((wire3 ?
                      wire3 : wire0))) : ((reg10 ~^ (reg10 ? reg12 : reg13)) ?
                      wire3[(3'h5):(2'h2)] : $signed(reg9))));
              reg13 <= $signed(wire6);
              reg14 <= reg12;
              reg15 <= (((^~wire3[(5'h11):(4'hd)]) ?
                  (^~$unsigned($unsigned(wire0))) : (($unsigned(reg10) ^ $signed(reg13)) + {(8'hba),
                      $unsigned(reg9)})) - {((~|(reg8 ?
                      wire6 : wire5)) + $signed(wire0[(3'h4):(2'h3)]))});
              reg16 <= (($signed(reg13) ?
                  reg14 : $signed(((wire6 ? (8'ha1) : reg12) * (wire2 ?
                      (8'haa) : wire7)))) <= (&(($unsigned(reg8) ?
                      reg8[(3'h4):(2'h3)] : (wire0 ? wire3 : wire1)) ?
                  (~^(reg14 ? reg11 : (8'ha2))) : reg8)));
            end
        end
    end
  module17 #() modinst27 (.wire18(wire2), .wire20(reg14), .wire19(reg15), .y(wire26), .clk(clk), .wire21(wire0));
  module28 #() modinst74 (.clk(clk), .wire32(wire26), .y(wire73), .wire29(reg9), .wire31(wire6), .wire30(wire5));
  assign wire75 = wire1[(3'h7):(3'h4)];
  assign wire76 = (~&(reg8[(4'h9):(4'h8)] * $unsigned(wire2)));
  assign wire77 = reg9[(2'h2):(2'h2)];
  assign wire78 = $unsigned($unsigned((($unsigned(wire76) <= wire6[(3'h6):(1'h1)]) ?
                      ((wire0 ? wire5 : reg8) ^ (wire1 || reg11)) : {{reg16,
                              wire73},
                          wire2})));
  assign wire79 = {(-(^$unsigned($signed(reg14))))};
  assign wire80 = {wire77, reg8[(4'hb):(1'h0)]};
  always
    @(posedge clk) begin
      reg81 <= {$signed({(((8'hbe) ? wire26 : wire6) ?
                  $unsigned(wire5) : {reg16, (8'ha3)})})};
      reg82 <= ((!$signed(((8'hbc) < (~(8'hb7))))) ?
          {{$signed($signed(wire73))}} : {(|(wire26 ?
                  $signed(wire77) : (reg13 - wire5))),
              (^wire0)});
      reg83 <= $signed(((|(7'h44)) ? reg15 : reg81[(4'h9):(2'h2)]));
      if ($signed((reg12 <= wire26[(2'h3):(1'h0)])))
        begin
          if ($signed(((reg16[(4'hc):(4'ha)] ?
                  wire2 : {(^wire0), $signed(wire6)}) ?
              {wire4[(1'h1):(1'h0)]} : reg8)))
            begin
              reg84 <= (|reg16[(3'h4):(2'h3)]);
              reg85 <= ((|wire2) ?
                  (&wire3[(3'h7):(1'h1)]) : $unsigned((|$unsigned($signed(reg14)))));
            end
          else
            begin
              reg84 <= (8'had);
            end
        end
      else
        begin
          reg84 <= ((~(!reg10)) ?
              {$signed($unsigned((wire7 ? reg13 : wire2))),
                  $unsigned(wire1[(4'h9):(3'h7)])} : {(8'h9c)});
          reg85 <= (wire75 ?
              ($signed($unsigned((reg11 ? reg13 : reg85))) ?
                  $signed(reg10) : $unsigned((~&$signed(wire78)))) : ((^~(~{wire77,
                      reg9})) ?
                  $unsigned($signed(wire1)) : $unsigned((~&$unsigned((8'hbf))))));
        end
      if ((~wire1))
        begin
          reg86 <= ((|wire80) ?
              (^~$unsigned(($signed(reg16) ? {wire76} : reg12))) : wire73);
          reg87 <= {$signed($signed((~|{(8'hbf), reg13})))};
          reg88 <= ((8'hbe) ?
              ({reg15[(3'h5):(2'h3)], ((|wire1) || (reg13 && reg82))} ?
                  (&$unsigned(wire75[(4'ha):(4'ha)])) : {(&wire2[(4'h9):(3'h7)])}) : (~(reg81[(4'h8):(1'h1)] ?
                  ($unsigned((7'h40)) ?
                      wire76 : $unsigned(wire1)) : $unsigned((8'h9d)))));
          reg89 <= (+$unsigned(wire80));
          reg90 <= (((reg86 < reg81) ?
                  (~(wire0[(4'hc):(2'h2)] <= (wire0 <<< reg15))) : $signed((&$signed(wire79)))) ?
              $unsigned($signed($signed((wire0 ^ (8'ha1))))) : $unsigned({(|(wire73 && reg81)),
                  $unsigned({wire80})}));
        end
      else
        begin
          reg86 <= $unsigned(reg12[(2'h3):(1'h0)]);
        end
    end
  assign wire91 = $signed($unsigned($unsigned($unsigned((~^reg9)))));
  assign wire92 = (reg13[(4'hd):(4'h8)] ~^ $unsigned((((wire78 & reg81) >>> wire6[(3'h7):(1'h0)]) < reg8)));
  assign wire93 = $unsigned(wire6[(4'hf):(1'h1)]);
  assign wire94 = reg10[(4'hf):(4'hd)];
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(2'h3):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire33;
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  assign y = {wire71,
                 wire52,
                 wire51,
                 wire50,
                 wire35,
                 wire33,
                 reg34,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
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
                 reg53,
                 (1'h0)};
  assign wire33 = (7'h40);
  always
    @(posedge clk) begin
      reg34 <= (~^wire29[(1'h0):(1'h0)]);
    end
  assign wire35 = ($signed((wire29 <= $unsigned($unsigned(wire32)))) ?
                      $unsigned($signed((wire30[(3'h4):(1'h0)] ~^ $signed(wire30)))) : (wire31 == $unsigned((((8'ha7) ?
                              (8'ha1) : wire32) ?
                          $signed(reg34) : $signed(wire29)))));
  always
    @(posedge clk) begin
      reg36 <= wire33;
      reg37 <= (((wire29[(1'h0):(1'h0)] < $signed((~&reg36))) ?
          {(7'h42),
              wire35[(1'h0):(1'h0)]} : reg36[(1'h1):(1'h1)]) & $signed(($unsigned(wire29) >> $unsigned((wire32 == wire33)))));
      if ({$unsigned((8'hb3)), $signed($signed($signed($unsigned((8'hb2)))))})
        begin
          if ((wire31[(2'h2):(1'h1)] ?
              (|$unsigned(reg37)) : (~|(-$unsigned(wire31[(4'h8):(3'h4)])))))
            begin
              reg38 <= wire29[(1'h0):(1'h0)];
              reg39 <= ($signed({($unsigned(wire30) ?
                      wire32 : $unsigned(reg38)),
                  $unsigned(reg38[(3'h4):(3'h4)])}) >> wire30);
              reg40 <= {(!{reg39}), (-$signed($signed(wire31)))};
            end
          else
            begin
              reg38 <= wire35[(1'h0):(1'h0)];
              reg39 <= wire35[(2'h2):(1'h0)];
              reg40 <= wire29[(1'h0):(1'h0)];
              reg41 <= (|wire35);
              reg42 <= wire31[(3'h7):(3'h4)];
            end
          reg43 <= ((-{$unsigned(((8'hac) ^ reg39))}) == $signed($signed(wire33)));
          if ((8'ha4))
            begin
              reg44 <= (wire33 ^~ $signed({($unsigned(wire33) ?
                      wire31 : {wire29})}));
            end
          else
            begin
              reg44 <= $unsigned((reg39[(3'h7):(1'h0)] + reg42));
              reg45 <= ($signed(reg40[(4'hc):(3'h6)]) > (-wire33));
              reg46 <= $signed(((($signed((8'hbf)) ?
                      (reg37 ? reg42 : wire29) : reg42) ?
                  $unsigned(reg38) : reg43[(3'h4):(3'h4)]) >> $unsigned(((reg43 >> reg38) && $signed(reg44)))));
              reg47 <= (~|$signed((^~(-(wire32 ? wire29 : reg44)))));
              reg48 <= {(-(|$unsigned($unsigned(reg38))))};
            end
          reg49 <= $unsigned(reg38[(4'hd):(4'hc)]);
        end
      else
        begin
          reg38 <= {reg39[(3'h4):(2'h2)]};
          reg39 <= (^reg37[(4'hc):(4'h8)]);
        end
    end
  assign wire50 = (($unsigned($signed(reg44[(1'h1):(1'h0)])) >= (~(|$unsigned(reg44)))) || (wire33[(3'h6):(3'h6)] + (($signed(wire35) ?
                      $unsigned(reg34) : reg46[(3'h7):(2'h2)]) << $unsigned({wire31,
                      reg40}))));
  assign wire51 = wire32[(2'h3):(1'h0)];
  assign wire52 = (|wire31[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg53 <= $signed(({$signed($signed(reg40))} ?
          (^~reg37) : (reg34 - wire51)));
    end
  module54 #() modinst72 (wire71, clk, reg42, reg39, reg53, wire30, wire35);
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  assign y = {wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = (8'h9f);
  assign wire23 = $signed($signed($signed($signed((~^wire21)))));
  assign wire24 = wire23;
  assign wire25 = wire21[(3'h6):(3'h4)];
endmodule

module module54
#(parameter param69 = (((8'hbc) ? {(((8'ha9) <= (8'hbe)) ? ((8'hb8) << (8'h9e)) : ((8'ha6) > (8'hb2)))} : (({(8'hb6)} ? ((8'hb1) ^~ (8'h9f)) : {(8'ha7), (8'ha6)}) ? (+((8'h9c) ? (8'hb0) : (8'hbb))) : (((7'h42) ? (8'hb7) : (8'ha1)) && {(8'hba), (7'h41)}))) || (-(^~(((8'hae) ? (8'hb9) : (8'ha2)) ? (8'hb5) : ((7'h43) != (7'h40)))))), 
parameter param70 = (({param69, (param69 ? (param69 >>> (8'ha8)) : param69)} ? (~^((param69 ? param69 : param69) ? (8'h9e) : param69)) : param69) ? param69 : param69))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire [(4'hd):(1'h0)] wire58;
  input wire signed [(5'h11):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(4'hb):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire60 = $unsigned({$signed((+{(8'hbe)}))});
  assign wire61 = (~|$unsigned(({(~^wire58)} ?
                      (&$signed(wire57)) : $unsigned((wire55 | wire57)))));
  assign wire62 = wire57[(2'h2):(2'h2)];
  assign wire63 = $unsigned(((+(|$signed(wire58))) ?
                      $signed(wire56[(4'hc):(4'h8)]) : $unsigned((wire59[(1'h1):(1'h1)] ?
                          $unsigned(wire55) : $signed(wire55)))));
  assign wire64 = (&wire63);
  assign wire65 = wire61[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg66 <= ($unsigned((-$unsigned(wire64[(4'h9):(3'h4)]))) && (+($unsigned($unsigned((8'h9e))) <<< wire62)));
      if (($unsigned(wire58) >> (^~(wire65[(1'h0):(1'h0)] | (wire64[(4'hb):(3'h7)] ^ $unsigned(wire57))))))
        begin
          reg67 <= wire62[(3'h4):(3'h4)];
          reg68 <= (((&{(wire60 ? (7'h43) : wire59),
                  (reg67 ? wire61 : reg67)}) >= (+$signed((-(8'ha3))))) ?
              (wire61[(1'h1):(1'h0)] ?
                  $unsigned((!$unsigned(reg66))) : wire58) : wire62);
        end
      else
        begin
          reg67 <= $signed($signed(wire58[(4'ha):(1'h1)]));
        end
    end
endmodule
