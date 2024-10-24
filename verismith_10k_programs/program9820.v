module top
#(parameter param79 = ((!(((^(8'hba)) ? (^(8'hab)) : {(8'hb8), (7'h44)}) ? ((7'h42) ? ((7'h43) ? (8'hb8) : (8'h9c)) : ((8'hba) >= (8'hbc))) : ({(8'haf)} || (~|(8'hab))))) <<< (^~(~|(((8'ha6) ? (8'h9e) : (7'h43)) ? {(8'hb8), (8'hb4)} : ((8'hbc) ? (8'hbc) : (8'hb4)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire42,
                 wire14,
                 wire13,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
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
                 reg60,
                 reg59,
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
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire5 = ((~^(~^($signed(wire4) ^ (wire3 ?
                     wire1 : wire1)))) & $signed((wire2[(4'hc):(3'h5)] ^~ $signed({wire2,
                     wire3}))));
  assign wire6 = wire4;
  assign wire7 = $signed(wire0);
  always
    @(posedge clk) begin
      reg8 <= $signed(($signed(((-wire7) ?
              (wire1 ? wire1 : wire1) : (wire3 ? (8'h9d) : wire3))) ?
          wire1[(4'h8):(1'h0)] : {((wire1 ? wire2 : wire0) ?
                  (&wire4) : {wire6, wire5}),
              {(wire2 ~^ wire1), (wire7 ? wire6 : wire2)}}));
      reg9 <= $unsigned(wire7);
      reg10 <= $unsigned($unsigned((&($signed(reg8) ?
          (~|wire7) : (wire1 ? wire2 : wire5)))));
      reg11 <= (~(~&$signed($unsigned($unsigned((8'hae))))));
    end
  assign wire12 = ((($signed((~(8'hb1))) ?
                      (wire3 ?
                          wire5 : (wire0 ? reg9 : (8'hb5))) : {$unsigned(wire5),
                          $signed(reg8)}) < {wire3[(3'h6):(1'h0)],
                      {$unsigned(wire6), (8'hbc)}}) * (wire6 ?
                      (reg8[(3'h7):(3'h7)] < (!(reg10 >> reg9))) : (8'hbb)));
  assign wire13 = (^$unsigned($unsigned(((^reg10) >> (wire2 ?
                      reg11 : wire1)))));
  assign wire14 = $signed({wire5[(2'h2):(1'h1)]});
  module15 #() modinst43 (.wire18(wire2), .y(wire42), .wire20(reg11), .wire16(wire0), .wire19(wire13), .clk(clk), .wire17(wire4));
  always
    @(posedge clk) begin
      reg44 <= $signed((!wire4));
      if ((~^wire1[(4'hc):(4'ha)]))
        begin
          if ($unsigned(wire13[(4'hf):(4'he)]))
            begin
              reg45 <= wire12;
              reg46 <= wire13;
              reg47 <= ({reg44[(4'hd):(1'h0)],
                      $signed($signed({wire13, reg45}))} ?
                  reg8[(3'h7):(1'h1)] : wire13[(4'hb):(4'h9)]);
              reg48 <= reg11[(4'hd):(2'h3)];
              reg49 <= wire4[(4'hd):(1'h1)];
            end
          else
            begin
              reg45 <= $signed((reg8 != $unsigned($signed({reg44}))));
            end
        end
      else
        begin
          reg45 <= reg10;
          if ($unsigned(($signed($signed(((8'haa) ^ reg44))) ?
              (^$signed(((8'ha4) * wire3))) : reg45)))
            begin
              reg46 <= (-reg11);
              reg47 <= reg8;
            end
          else
            begin
              reg46 <= (~|((|$signed({wire3, wire14})) ?
                  wire12 : reg11[(4'hd):(3'h4)]));
              reg47 <= (wire42 ?
                  {((8'h9e) == wire6), (~(&{(8'ha2)}))} : (8'hbd));
              reg48 <= (wire42[(3'h5):(2'h3)] * (wire6 ?
                  $unsigned(reg9) : ((-wire14) ?
                      $unsigned(wire42[(3'h4):(2'h3)]) : $signed((wire3 + reg10)))));
              reg49 <= (^(8'hac));
              reg50 <= ((~&reg47) ?
                  wire4[(3'h7):(1'h1)] : $unsigned((~&($unsigned(wire6) ?
                      (wire2 == wire5) : wire6[(3'h4):(1'h1)]))));
            end
          reg51 <= $unsigned(wire12[(1'h0):(1'h0)]);
          reg52 <= (reg44[(4'h9):(1'h1)] ?
              ($signed({(~^reg45), (~|wire5)}) * ($signed((8'ha0)) ?
                  reg44 : ($signed(reg44) ?
                      wire5 : $unsigned(wire7)))) : $signed(((reg50[(1'h0):(1'h0)] ?
                  $unsigned(reg9) : (reg9 >>> wire5)) ^ ((reg44 <<< wire3) >> wire6))));
          if ($unsigned(((~(|(reg49 >>> wire5))) ?
              reg11 : $signed($signed($signed(wire3))))))
            begin
              reg53 <= ((^~wire5[(4'hb):(3'h4)]) ?
                  (^~(~($unsigned((8'ha5)) ?
                      wire14 : $unsigned(reg8)))) : wire0);
              reg54 <= ($signed((wire7 ?
                      (reg10 != {(8'h9f),
                          reg11}) : ($unsigned(reg8) != {(8'h9c), (7'h44)}))) ?
                  $unsigned(($unsigned(reg45) ?
                      $signed((+(8'ha7))) : $signed((wire0 < reg11)))) : $unsigned($signed(reg49)));
              reg55 <= $signed(((~^(~|$unsigned(wire6))) ?
                  (~|(&$unsigned(wire4))) : (~|((wire4 != wire5) - reg11))));
              reg56 <= $unsigned($signed(($unsigned(reg10[(4'h9):(4'h9)]) ?
                  (reg47 ?
                      (^wire5) : $unsigned(wire7)) : ((|(8'hac)) >> wire0))));
            end
          else
            begin
              reg53 <= (~({(8'hb6)} ?
                  $signed($signed(reg10[(2'h2):(1'h0)])) : ($signed(((8'h9f) != (8'hb1))) ?
                      $signed({reg48, wire1}) : $signed((reg45 ^ reg9)))));
              reg54 <= ($unsigned(reg55) <<< $unsigned((((!wire1) >> $unsigned(reg46)) ?
                  wire7[(1'h0):(1'h0)] : $signed((reg50 ? reg49 : wire12)))));
              reg55 <= reg44[(3'h7):(2'h3)];
              reg56 <= $unsigned(((!($unsigned((8'hb1)) == (reg51 > wire14))) ?
                  $unsigned($signed(wire3[(2'h3):(1'h1)])) : {reg8,
                      reg47[(2'h2):(1'h1)]}));
              reg57 <= (|reg56);
            end
        end
      if (reg57)
        begin
          if (((reg47 ? $signed(reg10[(3'h5):(2'h2)]) : reg10[(3'h6):(1'h1)]) ?
              {{$signed($unsigned(wire12))},
                  $unsigned((reg55[(2'h3):(1'h0)] ?
                      (wire1 * reg44) : $signed(wire1)))} : wire6))
            begin
              reg58 <= reg46;
            end
          else
            begin
              reg58 <= ({$unsigned(reg9[(3'h6):(3'h6)])} ?
                  reg53[(5'h10):(5'h10)] : $signed(((wire3[(3'h5):(3'h5)] ^ $signed((8'hae))) && $signed((wire2 ?
                      wire42 : wire13)))));
              reg59 <= reg58[(3'h4):(1'h0)];
              reg60 <= $signed($unsigned(reg9[(3'h6):(3'h6)]));
              reg61 <= wire2;
            end
          reg62 <= {$signed($signed({$unsigned(wire5)})),
              (reg44[(4'hd):(2'h2)] ?
                  (wire5 != reg58) : {{((7'h44) ? reg8 : wire3),
                          wire12[(4'h9):(3'h6)]},
                      $signed((wire3 << wire5))})};
          reg63 <= $unsigned(reg57);
          reg64 <= $signed($unsigned((wire0 & reg61)));
          reg65 <= wire0;
        end
      else
        begin
          if ((^reg54))
            begin
              reg58 <= reg48[(3'h7):(2'h3)];
            end
          else
            begin
              reg58 <= (($unsigned(((wire0 ^~ wire14) < (wire6 ?
                      (8'h9f) : reg58))) < (+($signed(reg64) ?
                      (reg58 ? reg60 : reg53) : ((8'hb2) ? (8'hb2) : wire4)))) ?
                  (^($unsigned(reg56) * reg61[(2'h2):(2'h2)])) : (((reg56 >= wire3) ?
                          {(~|reg10), reg56} : (+(~&reg44))) ?
                      ((|$unsigned(wire5)) + reg63[(1'h1):(1'h0)]) : {(8'hb2),
                          ({(8'hbb)} ~^ reg50)}));
              reg59 <= $unsigned(((-{(8'hba)}) ?
                  reg9[(1'h1):(1'h1)] : ((wire2 ?
                          (~|reg49) : ((8'hbd) ? wire5 : reg55)) ?
                      (8'ha2) : (&(~&reg45)))));
            end
          reg60 <= {$unsigned((~|{(~^(8'hac))})), reg55[(2'h3):(2'h2)]};
          reg61 <= $unsigned($signed({{$signed(reg62)},
              ((reg63 ~^ wire5) ? (reg57 ? reg62 : wire0) : {reg59})}));
          reg62 <= {{($signed(reg48) ?
                      (~&reg59) : ((!wire2) ? $unsigned(wire14) : wire14)),
                  (wire6 ?
                      ($unsigned(wire5) ?
                          $signed(wire6) : (^wire3)) : $unsigned($unsigned(reg47)))}};
        end
      reg66 <= (!({(reg11 ? ((8'hb4) >> reg62) : $signed(wire6))} ?
          ($signed(reg51) | (8'hae)) : $unsigned(wire13)));
      if ($signed(reg52[(1'h0):(1'h0)]))
        begin
          reg67 <= reg45[(1'h0):(1'h0)];
          reg68 <= (8'hb3);
          if ((~^(($signed($signed(reg61)) ?
              $signed((^~reg49)) : ((wire4 == reg56) ?
                  (^wire6) : (reg54 - reg8))) >> (({(8'ha2),
              (8'hbf)} <= reg47[(1'h0):(1'h0)]) < wire42[(3'h4):(3'h4)]))))
            begin
              reg69 <= ((-(|({(7'h41)} != reg54))) ?
                  $unsigned($signed(wire12)) : (+reg50[(4'hb):(1'h1)]));
            end
          else
            begin
              reg69 <= $unsigned(wire5[(4'ha):(3'h7)]);
              reg70 <= (|$signed((~reg49)));
              reg71 <= $signed($signed($signed(reg49[(4'hf):(1'h1)])));
              reg72 <= $signed(($unsigned({$signed((8'hb4))}) ?
                  (^((~&reg9) ?
                      reg62[(1'h1):(1'h1)] : (wire12 ?
                          wire14 : reg56))) : $unsigned(wire4)));
              reg73 <= $unsigned({reg66[(4'hd):(3'h4)]});
            end
          reg74 <= wire7[(1'h1):(1'h1)];
        end
      else
        begin
          if (($unsigned(reg10) >= wire4))
            begin
              reg67 <= wire7[(4'h9):(2'h2)];
              reg68 <= reg59;
              reg69 <= (reg60[(2'h3):(2'h2)] ~^ {$unsigned($signed({reg66})),
                  $signed(($unsigned(reg70) ?
                      reg45[(1'h1):(1'h0)] : $unsigned((8'hbf))))});
              reg70 <= {reg74[(4'h9):(1'h0)],
                  (reg51 ? wire2[(5'h10):(3'h4)] : reg54)};
            end
          else
            begin
              reg67 <= (8'hb7);
            end
          reg71 <= {$signed((~reg50[(5'h11):(1'h1)])),
              {$signed(($signed(reg47) ?
                      (wire13 ? wire6 : reg53) : $signed(reg62)))}};
        end
    end
  assign wire75 = reg61;
  assign wire76 = (reg64 & (($signed($signed(wire6)) ?
                          (^~$unsigned(reg53)) : $signed({wire75, reg9})) ?
                      (8'had) : $unsigned($unsigned({(8'hb4), reg56}))));
  assign wire77 = (~|wire75);
  assign wire78 = (^~({$signed(wire77[(3'h7):(3'h4)])} + (($signed(reg51) ?
                      $unsigned(reg56) : {reg51}) >= $signed(reg11))));
endmodule

module module15
#(parameter param41 = ((((~^((8'haa) + (8'hab))) ? (|{(8'ha9), (8'h9e)}) : (^(^~(7'h41)))) ? (^~((+(7'h41)) ? {(8'ha8)} : ((8'h9f) != (8'ha1)))) : ((((8'hab) >>> (8'ha3)) ? (~|(8'haf)) : (8'ha6)) ? (((8'ha1) ? (8'ha2) : (8'ha2)) ? ((8'hbd) ? (7'h40) : (8'hb1)) : (~^(8'haa))) : (7'h44))) ? (~&(((-(8'hae)) ? ((8'ha9) ? (8'h9f) : (8'haa)) : (8'hb3)) ? (&((8'h9d) < (8'hb6))) : (((8'hbd) || (8'hbf)) >>> (-(8'ha7))))) : ((~&(((8'h9f) ? (7'h44) : (8'hb7)) ? (&(8'hb9)) : ((8'h9c) ? (8'hbf) : (8'hb4)))) ? (((~^(8'hbe)) >= ((8'had) ? (8'hb9) : (8'hbf))) ? ((^~(8'ha0)) ? ((8'hae) && (8'ha1)) : ((8'hbb) * (7'h42))) : (8'hbf)) : (^((&(8'ha3)) >> {(8'hb2)})))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire21;
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire21,
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
                 (1'h0)};
  assign wire21 = $signed($signed(wire17[(4'h8):(2'h2)]));
  always
    @(posedge clk) begin
      reg22 <= wire16;
      if (($signed((wire16 ? $unsigned(reg22) : (^~$signed(wire20)))) ?
          wire21 : wire16))
        begin
          reg23 <= $unsigned(wire18[(1'h0):(1'h0)]);
          if ({$unsigned((~&(&{wire16}))), wire17[(1'h1):(1'h1)]})
            begin
              reg24 <= (($signed(wire20[(4'ha):(4'ha)]) >>> $signed((7'h43))) ?
                  (+$unsigned(wire16)) : $unsigned(reg22[(3'h5):(1'h0)]));
            end
          else
            begin
              reg24 <= (8'hba);
              reg25 <= (wire20[(4'hd):(4'h8)] ^~ (~&$signed({(!wire17),
                  wire19})));
              reg26 <= $unsigned({wire17, wire20});
            end
          if ((^~$signed((wire21 ?
              ($signed(wire16) == reg22[(3'h5):(2'h3)]) : (reg22 ?
                  (reg25 < (8'haa)) : reg26)))))
            begin
              reg27 <= (!({$signed((7'h44)), $unsigned((8'ha6))} ?
                  ($signed($signed(reg24)) ?
                      $unsigned($unsigned(wire21)) : ((wire17 + wire17) ?
                          $unsigned(wire19) : (wire21 > wire19))) : wire17[(4'hb):(4'h9)]));
              reg28 <= ((8'had) ^ ($unsigned(((^~reg25) == (^reg22))) << $unsigned(({wire18} <= wire20))));
              reg29 <= (($signed((~{wire21})) ?
                  $signed(reg24[(4'ha):(3'h5)]) : (+{(wire19 ?
                          reg23 : wire21)})) < (({wire20[(4'hc):(1'h1)]} ?
                  (wire18[(3'h4):(2'h3)] ?
                      (reg28 ?
                          (8'ha4) : reg22) : wire16[(4'h8):(1'h0)]) : (^$signed(reg25))) > (((wire19 - reg28) != $unsigned((8'haf))) & $unsigned($signed((8'ha1))))));
            end
          else
            begin
              reg27 <= reg25[(2'h2):(1'h0)];
              reg28 <= wire18[(3'h4):(1'h1)];
              reg29 <= wire16;
              reg30 <= $signed(wire20);
            end
          if ($unsigned($unsigned(reg29)))
            begin
              reg31 <= $signed((reg26[(4'hc):(3'h6)] ?
                  {((wire21 ?
                          reg30 : (8'ha8)) && $unsigned(wire18))} : reg29[(1'h0):(1'h0)]));
              reg32 <= reg24;
              reg33 <= reg26;
              reg34 <= (~^$unsigned(reg24[(4'he):(3'h7)]));
            end
          else
            begin
              reg31 <= (($unsigned(reg29) ?
                      {$unsigned((^reg25))} : (~(8'hab))) ?
                  (8'hb9) : $signed(reg23[(2'h3):(2'h3)]));
              reg32 <= (^reg22);
              reg33 <= wire16;
              reg34 <= $signed((reg31 >>> {$signed($unsigned(wire19)),
                  $signed({reg29, reg34})}));
              reg35 <= reg23[(3'h5):(3'h5)];
            end
          reg36 <= $signed((reg30[(1'h0):(1'h0)] != reg29));
        end
      else
        begin
          reg23 <= wire20;
        end
    end
  assign wire37 = (~(~&(~|(((8'hb5) | reg32) ? $unsigned(reg31) : (|wire20)))));
  assign wire38 = reg33;
  assign wire39 = $unsigned((&wire16[(3'h6):(2'h3)]));
  assign wire40 = (((reg34[(5'h11):(3'h7)] ?
                      ((reg30 & wire21) >>> $unsigned(wire38)) : (^$unsigned(reg25))) + (&($unsigned(wire37) < {reg33,
                      reg29}))) > $unsigned($signed(((reg26 ?
                      wire18 : wire20) * ((8'hab) ^ wire39)))));
endmodule
