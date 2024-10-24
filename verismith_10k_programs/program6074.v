module top
#(parameter param83 = (((^(((8'h9f) & (8'hb6)) ~^ (&(8'ha2)))) ^~ ((((8'hbb) ? (8'hb2) : (8'ha6)) ? ((8'hb6) ? (8'h9c) : (8'hb4)) : ((8'hae) - (7'h44))) ^~ ((~(8'hab)) && (~(8'h9f))))) - (!(8'hb4))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire79,
                 wire28,
                 wire17,
                 wire16,
                 wire15,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $unsigned(wire4);
  assign wire6 = wire4;
  assign wire7 = (wire4 >> wire1);
  assign wire8 = {wire5,
                     $unsigned((((wire4 <<< wire5) || wire0) ?
                         $signed(wire4[(4'h8):(4'h8)]) : $unsigned($signed(wire0))))};
  assign wire9 = wire2[(4'he):(4'h9)];
  always
    @(posedge clk) begin
      reg10 <= $signed($unsigned(wire0[(4'hb):(2'h2)]));
      if ((8'ha4))
        begin
          reg11 <= $unsigned(wire8[(2'h2):(2'h2)]);
        end
      else
        begin
          reg11 <= wire5;
          reg12 <= (wire3 ~^ $signed($unsigned(reg11[(3'h7):(3'h4)])));
          reg13 <= (8'ha6);
        end
      if (($unsigned($unsigned(((wire2 & wire6) << $signed((8'ha9))))) ~^ $unsigned((($unsigned(wire8) != $unsigned(wire3)) << $signed(wire7[(3'h4):(3'h4)])))))
        begin
          reg14 <= wire2;
        end
      else
        begin
          reg14 <= (((8'ha7) <= (^~(&(^~reg12)))) ?
              wire5 : {$signed((!((8'hab) * reg10)))});
        end
    end
  assign wire15 = $signed((~&(8'hb3)));
  assign wire16 = $signed($signed((~|reg12)));
  assign wire17 = ($unsigned(wire1[(4'ha):(1'h0)]) ~^ $unsigned(wire15[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg18 <= wire9;
      reg19 <= $unsigned(($unsigned(reg11) ?
          {(wire2 && (wire16 ?
                  wire1 : (8'h9c)))} : $signed(wire17[(5'h10):(4'hb)])));
      reg20 <= {$signed(wire4[(3'h4):(3'h4)])};
      reg21 <= ((($unsigned(reg14) ?
              $signed(reg13[(4'h9):(4'h9)]) : (((8'haa) << reg13) ?
                  (wire8 <<< reg12) : (wire8 ?
                      wire6 : reg14))) < (wire2[(3'h7):(1'h1)] & (~(^reg19)))) ?
          reg10[(2'h3):(1'h1)] : wire3[(1'h0):(1'h0)]);
      if ($signed($unsigned((wire6 ?
          $signed(reg11[(4'hc):(3'h5)]) : ({(8'hbd)} ?
              reg18[(2'h2):(1'h0)] : (reg14 - (8'hb6)))))))
        begin
          if ((8'haa))
            begin
              reg22 <= (+(({wire9[(2'h2):(1'h1)]} ?
                  $signed((wire16 != reg19)) : ((reg14 ?
                      reg21 : reg12) != wire6)) >> (reg14[(3'h6):(1'h0)] || wire17[(4'hf):(3'h7)])));
              reg23 <= $unsigned(wire6);
              reg24 <= (~|reg19[(4'hc):(4'hc)]);
              reg25 <= $unsigned((($signed((wire1 ^ wire0)) ?
                  $unsigned((|wire16)) : reg19[(4'h9):(3'h6)]) >>> wire7[(2'h2):(1'h0)]));
            end
          else
            begin
              reg22 <= (!{(|wire3[(2'h2):(1'h0)]),
                  (($unsigned(reg12) && (reg20 ? reg12 : reg21)) ?
                      ((reg13 | (8'hbf)) ?
                          (reg11 == reg18) : wire4[(4'h8):(2'h2)]) : (~(reg13 ?
                          wire0 : reg20)))});
            end
          reg26 <= {reg23[(4'hc):(4'h9)]};
          reg27 <= ((($signed(wire1) - $signed((reg26 ^ reg21))) == ($signed(wire1) | (8'ha2))) ?
              $unsigned({$signed((wire4 * (7'h42)))}) : (wire16 ?
                  wire5 : wire7));
        end
      else
        begin
          if (wire0)
            begin
              reg22 <= (&($signed({$unsigned(reg19),
                  $unsigned(reg25)}) - (((wire7 ? reg19 : reg13) ?
                  $signed(wire3) : reg27) > wire17[(2'h2):(1'h1)])));
              reg23 <= $signed((7'h41));
              reg24 <= $unsigned($signed($unsigned((~&(~(8'hac))))));
              reg25 <= $unsigned({(^reg21[(1'h0):(1'h0)]),
                  $unsigned($signed((wire8 ? wire0 : reg18)))});
            end
          else
            begin
              reg22 <= wire7[(2'h2):(1'h0)];
              reg23 <= (((7'h40) >> reg18) ?
                  wire0[(4'hf):(4'hc)] : (|(wire15 ?
                      {wire17[(4'hc):(3'h6)],
                          $unsigned(reg10)} : $signed({(8'hab)}))));
              reg24 <= reg18[(2'h3):(2'h3)];
            end
          reg26 <= $signed(((~|$signed(((8'hbb) == reg21))) ?
              wire9 : (reg11[(4'hc):(3'h6)] ?
                  $unsigned(((7'h40) ? (8'ha5) : wire3)) : $unsigned(wire7))));
          reg27 <= reg22;
        end
    end
  assign wire28 = ((wire8 ?
                          ({wire5} >= ($signed(reg18) || $unsigned(reg24))) : ((8'ha4) ?
                              ((reg13 ? wire15 : wire6) ?
                                  (8'ha8) : $unsigned(wire16)) : (wire9 ?
                                  (reg21 ?
                                      wire16 : wire7) : wire3[(4'hc):(3'h6)]))) ?
                      (($unsigned(wire15[(3'h4):(2'h2)]) ?
                          ((~|(8'hb2)) ?
                              (~wire1) : ((8'haa) ?
                                  wire8 : reg18)) : ((|reg20) ?
                              ((8'ha1) ? wire7 : (8'hb0)) : {(8'ha8),
                                  wire7})) ^ reg24) : (|(wire6[(3'h5):(1'h0)] ?
                          reg25[(1'h0):(1'h0)] : ((reg18 ? reg21 : reg25) ?
                              (wire2 ~^ wire0) : wire3[(2'h2):(1'h1)]))));
  module29 #() modinst80 (.wire33(reg13), .wire32(reg25), .y(wire79), .clk(clk), .wire31(wire4), .wire30(wire17));
  assign wire81 = $unsigned(wire5);
  assign wire82 = $signed(wire0);
endmodule

module module29
#(parameter param78 = ((((~&(-(8'hb5))) ? (~|((8'hbc) <<< (8'ha6))) : (^~(|(8'ha3)))) ^~ (8'hb7)) << (+{(~&((8'h9d) ? (8'ha4) : (8'h9f)))})))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire33;
  input wire signed [(5'h13):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire61,
                 wire60,
                 wire59,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg58,
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
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire34 = (wire32 >> ($unsigned((^(wire32 ?
                      wire32 : wire32))) >> $signed($unsigned(wire33[(4'h8):(1'h0)]))));
  assign wire35 = (wire32[(4'hc):(4'h8)] ?
                      wire33 : {wire31[(3'h5):(1'h1)],
                          $unsigned($signed((wire30 ? wire32 : wire33)))});
  assign wire36 = ($signed({wire35[(1'h1):(1'h1)]}) ?
                      ((^$signed(((8'hb4) ? wire35 : wire35))) ?
                          $unsigned((wire32 ~^ (wire35 ?
                              wire34 : wire31))) : (wire33 && wire32[(5'h12):(3'h7)])) : ((((-wire34) ?
                                  wire33 : $unsigned(wire30)) ?
                              wire35 : ($unsigned((8'hb4)) ^~ wire34)) ?
                          (8'ha6) : {((wire31 == wire33) ?
                                  wire30[(3'h6):(3'h4)] : (|wire35))}));
  assign wire37 = (+wire30);
  assign wire38 = wire32[(4'hd):(4'hb)];
  assign wire39 = ($signed(wire36[(1'h1):(1'h0)]) ?
                      wire35[(1'h0):(1'h0)] : wire34[(1'h0):(1'h0)]);
  assign wire40 = wire35[(4'ha):(1'h1)];
  assign wire41 = wire30;
  assign wire42 = $unsigned({(~&$signed((wire33 ? wire32 : (8'ha2))))});
  always
    @(posedge clk) begin
      reg43 <= $signed((&wire42[(5'h10):(1'h1)]));
      reg44 <= wire38;
      if (((wire37 >= $unsigned((~|$unsigned(wire36)))) ?
          (+$unsigned(wire39)) : (wire40 ? $signed(wire32) : (8'h9c))))
        begin
          if (wire38)
            begin
              reg45 <= (~&$signed($signed($unsigned($unsigned(wire32)))));
              reg46 <= ((^~(~&$signed(wire40))) ?
                  {((8'hb0) << wire38),
                      ((wire31 ? wire30 : (wire35 && wire38)) ?
                          {{wire32, wire41},
                              $unsigned(wire31)} : {$unsigned(wire33)})} : $unsigned($unsigned({wire42})));
              reg47 <= wire32;
              reg48 <= ($signed($unsigned((|wire39[(2'h2):(2'h2)]))) << (wire35[(4'ha):(2'h3)] >= wire37));
            end
          else
            begin
              reg45 <= reg46[(3'h6):(1'h0)];
              reg46 <= $signed({wire30,
                  $signed({(~^wire30), {wire40, reg43}})});
              reg47 <= {{((wire38 ^~ {wire42, reg43}) ?
                          (((8'hac) ? wire42 : reg48) ?
                              ((7'h43) & wire33) : ((8'ha9) ?
                                  wire32 : wire35)) : (^~$unsigned(reg48)))},
                  wire34[(4'h8):(1'h1)]};
            end
          reg49 <= ($signed($unsigned($signed((~&reg43)))) + $unsigned(wire32[(5'h10):(4'ha)]));
          reg50 <= $unsigned({wire30});
          reg51 <= (8'hbb);
        end
      else
        begin
          reg45 <= wire32[(4'hf):(4'he)];
        end
      if ((((wire32[(5'h10):(4'h8)] <= wire41) ?
          $signed(wire36[(1'h1):(1'h1)]) : {(~&(-reg44)),
              reg51[(3'h6):(1'h1)]}) & ((~|$unsigned(reg49)) >= wire42[(3'h5):(3'h5)])))
        begin
          reg52 <= $unsigned($signed(((~&(8'ha8)) ?
              ((wire39 | reg44) ?
                  (reg46 <= reg45) : {(8'ha7), (8'hbb)}) : wire39)));
          reg53 <= $signed(wire33[(4'hb):(3'h6)]);
          if ((+reg45[(1'h0):(1'h0)]))
            begin
              reg54 <= wire34[(4'he):(2'h3)];
              reg55 <= ((~|($unsigned($signed(reg43)) <= ((reg44 << wire38) != (~&reg45)))) < reg49);
              reg56 <= (~(^~wire34));
            end
          else
            begin
              reg54 <= ($signed((^~wire42)) ?
                  ($unsigned({(reg50 ? reg50 : (8'hb1)),
                          reg55[(3'h5):(3'h4)]}) ?
                      reg44 : (^~((wire42 ?
                          reg45 : wire37) + reg45[(5'h12):(2'h3)]))) : ($signed({$signed((8'ha1)),
                      (reg54 ^ (8'hb4))}) != reg46[(3'h4):(3'h4)]));
              reg55 <= ($unsigned((~|(8'hbc))) ?
                  $signed(reg47[(2'h3):(1'h0)]) : ($unsigned(reg44[(2'h3):(2'h3)]) ^~ ((+(reg45 ?
                          wire36 : wire35)) ?
                      reg55[(5'h10):(5'h10)] : {((8'hb6) ? reg56 : wire30),
                          reg52[(3'h6):(3'h4)]})));
              reg56 <= ((reg49 ? (8'h9e) : reg43) ?
                  $unsigned((-wire38[(1'h0):(1'h0)])) : wire36[(2'h2):(1'h0)]);
            end
          reg57 <= (~&$signed($signed(($signed(reg53) ?
              $unsigned((7'h43)) : $unsigned(wire30)))));
        end
      else
        begin
          reg52 <= (|wire37);
          reg53 <= wire41[(1'h1):(1'h1)];
          reg54 <= ($unsigned((&$unsigned(wire36))) ?
              reg52[(4'he):(3'h5)] : wire40);
          reg55 <= $unsigned(($unsigned(($unsigned(reg57) ?
                  (reg45 ? reg52 : reg57) : wire37[(3'h7):(3'h6)])) ?
              $signed(((wire41 ? reg48 : (8'hb2)) ?
                  wire35 : {reg46})) : (reg50[(3'h6):(3'h6)] | $unsigned((reg44 ^~ reg48)))));
        end
      reg58 <= {(reg47 ?
              $unsigned($signed((reg45 ?
                  wire31 : (8'hb4)))) : wire35[(4'he):(4'hb)]),
          ((reg45[(3'h6):(2'h2)] ?
              (wire35 ?
                  ((8'hbe) ? wire41 : wire38) : (reg47 ?
                      reg57 : (8'h9d))) : (reg49 != reg47)) * (wire31[(3'h5):(2'h2)] ?
              $unsigned({(8'ha4), reg47}) : $signed($unsigned(wire36))))};
    end
  assign wire59 = {$signed(reg55), (~^$signed(reg53[(3'h4):(2'h3)]))};
  assign wire60 = $signed(wire42);
  assign wire61 = (~&(((|wire31) ? reg55 : $unsigned(wire35)) ?
                      reg43 : {(reg50 >>> (-wire60)),
                          {(|wire35), (reg44 > reg56)}}));
  always
    @(posedge clk) begin
      if (($signed(reg48) ?
          wire37[(1'h1):(1'h1)] : ((^reg49[(4'h9):(2'h2)]) ?
              (8'h9e) : (!$unsigned(wire35[(1'h1):(1'h1)])))))
        begin
          reg62 <= {$signed(reg50)};
          reg63 <= (-wire41[(2'h2):(2'h2)]);
          reg64 <= {(|reg52[(4'hb):(3'h6)])};
        end
      else
        begin
          if ($unsigned((~&$unsigned($signed({wire60, (8'h9c)})))))
            begin
              reg62 <= ($signed(reg51[(1'h0):(1'h0)]) ?
                  (+(~|reg63)) : {wire37[(1'h0):(1'h0)]});
              reg63 <= wire39[(4'ha):(4'ha)];
              reg64 <= $unsigned(reg50);
              reg65 <= $unsigned(({$unsigned($unsigned(reg50))} >= (reg53[(4'h9):(3'h5)] + (+(wire33 >= (8'hb4))))));
            end
          else
            begin
              reg62 <= $signed(({wire37} ?
                  ((~^wire38[(1'h0):(1'h0)]) - (^~(wire30 ?
                      reg43 : reg48))) : (8'hbc)));
              reg63 <= $signed($signed(reg64[(1'h1):(1'h0)]));
              reg64 <= $signed(reg49);
              reg65 <= reg44[(4'h8):(2'h2)];
              reg66 <= $signed(($unsigned((~wire42)) ^~ wire31[(2'h3):(1'h1)]));
            end
        end
      reg67 <= {({$unsigned(reg49[(3'h6):(3'h5)])} ? reg55 : (~reg45))};
      reg68 <= reg56[(1'h0):(1'h0)];
      reg69 <= $signed((wire38 ? {wire36} : (+$signed(reg43[(3'h5):(3'h5)]))));
      if (wire60[(4'hb):(3'h7)])
        begin
          reg70 <= $unsigned($signed({(+(^reg68))}));
          if ($signed((|(~|(((8'hb4) ~^ reg58) ?
              $unsigned(wire39) : (wire42 ? wire39 : reg57))))))
            begin
              reg71 <= (7'h42);
              reg72 <= wire40;
              reg73 <= (~&$signed({(^~$signed(reg47))}));
            end
          else
            begin
              reg71 <= wire39;
              reg72 <= {reg47};
              reg73 <= reg45[(4'he):(3'h7)];
            end
        end
      else
        begin
          reg70 <= (+(8'h9f));
          if ((-({$signed(wire60)} | $unsigned({$signed(wire31),
              (wire60 ? reg56 : reg66)}))))
            begin
              reg71 <= (+{$unsigned({{reg68, reg71}, wire31})});
              reg72 <= $signed(wire59);
              reg73 <= reg50;
              reg74 <= (((~&($unsigned(reg50) ? $unsigned(reg49) : (8'hbe))) ?
                  reg51 : $signed((^~$signed(reg49)))) != (((~&reg69) ?
                  (~&(reg47 ?
                      (8'hb9) : (7'h44))) : reg65) <<< wire34[(3'h7):(2'h2)]));
              reg75 <= wire30[(1'h0):(1'h0)];
            end
          else
            begin
              reg71 <= reg56[(4'ha):(3'h6)];
              reg72 <= (~&$unsigned(reg44));
              reg73 <= $signed($signed(((8'h9e) >= ($signed(wire42) ?
                  reg73 : $unsigned(wire32)))));
            end
        end
    end
  assign wire76 = {((~|(wire59[(1'h1):(1'h0)] ?
                          reg55[(1'h1):(1'h0)] : (^~wire40))) <<< (reg43 <= $signed($signed(reg47))))};
  assign wire77 = $signed({$signed(((wire36 | reg44) ?
                          $unsigned(reg50) : reg48)),
                      ((|(reg68 >> reg68)) || $signed({wire76, wire30}))});
endmodule
