module top
#(parameter param76 = ((((((8'ha6) || (8'hae)) <<< ((8'ha8) << (8'hb2))) ? (8'hbe) : {((8'h9d) < (8'ha7))}) ? {(((7'h42) ? (8'ha1) : (8'h9d)) << (-(8'hbc)))} : {((8'hb2) ^ (^~(8'hbf))), ({(8'h9c)} ? ((8'h9f) < (8'ha4)) : (+(8'hb9)))}) <= (~&((((8'ha6) - (8'h9d)) ? ((8'hbd) >>> (8'h9e)) : ((8'haf) ^~ (8'ha9))) > ((^(8'hb0)) ? (~^(8'ha0)) : (&(8'hb2)))))), 
parameter param77 = (+((({param76} || {param76}) >> param76) ? param76 : param76)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire74;
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire17,
                 wire18,
                 wire74,
                 reg4,
                 reg5,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2;
      if (wire3[(4'ha):(3'h5)])
        begin
          reg5 <= (~&$signed(wire0[(5'h13):(3'h4)]));
          if ((8'h9c))
            begin
              reg6 <= $signed(reg5);
              reg7 <= (+wire3[(3'h6):(2'h3)]);
              reg8 <= $signed({$unsigned(reg4[(4'hc):(3'h6)])});
              reg9 <= (($unsigned(((8'hb4) ~^ $signed(reg5))) >> $unsigned((-wire1[(3'h6):(2'h3)]))) ?
                  $signed(reg5) : (^(!reg8)));
            end
          else
            begin
              reg6 <= reg9[(1'h1):(1'h0)];
              reg7 <= $signed((((((7'h40) ? wire1 : wire0) ?
                          (!reg6) : $unsigned(wire0)) ?
                      ($unsigned(reg8) ?
                          $unsigned(reg4) : ((8'haf) * reg8)) : reg8) ?
                  (reg8[(4'hb):(3'h6)] ?
                      $unsigned(reg4[(4'hb):(4'ha)]) : $unsigned(wire2[(3'h5):(3'h5)])) : $signed((reg8[(3'h7):(1'h0)] ?
                      wire2[(3'h7):(3'h7)] : $unsigned(reg6)))));
            end
          reg10 <= $unsigned((~&$unsigned($signed((wire3 <<< reg8)))));
          if (($signed(((-reg5[(2'h2):(1'h1)]) != (|(&reg8)))) ?
              (wire2 ?
                  (($unsigned(wire2) ?
                      {(8'ha2)} : ((8'hb5) ?
                          wire3 : reg9)) - {{reg10}}) : $unsigned(reg10)) : $unsigned((!$unsigned($signed(wire3))))))
            begin
              reg11 <= (($unsigned((|wire2)) >> (wire1[(4'ha):(3'h7)] ^ reg10)) >> $signed((&$signed((8'hbd)))));
              reg12 <= ((((8'ha1) ?
                      ((-(8'h9f)) ?
                          reg7[(3'h6):(2'h3)] : {reg4}) : (~^$unsigned((8'ha4)))) <= $signed((&$signed(reg11)))) ?
                  (wire0[(1'h0):(1'h0)] << (-$unsigned((wire2 ?
                      reg10 : reg4)))) : $signed(($signed(reg7[(3'h7):(1'h1)]) ?
                      reg7[(2'h2):(1'h1)] : ({reg8} > (-reg6)))));
              reg13 <= reg7;
            end
          else
            begin
              reg11 <= $signed($unsigned((+reg7)));
            end
          reg14 <= $signed($unsigned((!$signed((^wire1)))));
        end
      else
        begin
          if ((+$unsigned(reg4)))
            begin
              reg5 <= reg13[(1'h1):(1'h0)];
              reg6 <= (wire3 > {$signed($signed(wire1[(3'h6):(2'h2)]))});
              reg7 <= $unsigned((&reg8[(2'h2):(1'h0)]));
              reg8 <= ((~&($signed({reg4,
                  reg8}) != $signed(reg11))) <<< wire1[(1'h0):(1'h0)]);
              reg9 <= ((~&$unsigned((reg13[(2'h3):(2'h3)] ?
                  {reg7,
                      (7'h40)} : (wire0 < reg10)))) - (reg7[(3'h6):(3'h4)] >= reg14[(3'h7):(1'h0)]));
            end
          else
            begin
              reg5 <= (8'h9f);
              reg6 <= $unsigned($unsigned(reg9[(2'h2):(2'h2)]));
            end
        end
      reg15 <= ({(^(reg4 >>> reg10[(1'h0):(1'h0)])), wire2[(3'h4):(3'h4)]} ?
          $signed((^~((reg13 * wire2) ?
              $unsigned((8'ha4)) : {(8'hb4), reg4}))) : (^reg7));
      reg16 <= (wire0[(4'hc):(3'h7)] ?
          (+(reg10 + {$signed((7'h42)),
              (wire1 ? reg5 : reg4)})) : ({$unsigned($signed(wire3))} ?
              {reg5[(1'h0):(1'h0)], reg6} : reg4));
    end
  assign wire17 = (($signed((~&((8'hbd) ~^ (8'ha3)))) <<< ((^~{(8'hb5),
                              wire1}) ?
                          $unsigned(((8'hb0) & wire1)) : reg10[(1'h0):(1'h0)])) ?
                      {$signed($unsigned((8'hb1)))} : ((($signed(reg5) >= (~|reg5)) ?
                          reg7 : ($unsigned(reg10) ?
                              reg9[(1'h0):(1'h0)] : $signed(reg14))) ^~ $signed($unsigned($unsigned(reg13)))));
  assign wire18 = ({reg7[(3'h7):(3'h6)], $unsigned(reg16[(2'h2):(2'h2)])} ?
                      ({{$signed(wire2), ((8'had) <<< reg8)},
                              ($unsigned(reg4) ?
                                  (wire2 <<< reg8) : wire0[(5'h14):(2'h2)])} ?
                          $signed($unsigned($signed(wire17))) : ((^(reg7 >= wire0)) ^~ wire3)) : $signed(($signed((reg7 ?
                          reg8 : wire2)) < $unsigned({reg13}))));
  module19 #() modinst75 (wire74, clk, wire0, reg12, reg11, reg14);
endmodule

module module19
#(parameter param72 = (((+(((7'h42) ? (8'hb8) : (8'hab)) ? (8'hbf) : ((8'hbc) ? (8'hb3) : (8'ha0)))) >> ((^~(&(8'hbf))) < (((7'h43) ~^ (8'haa)) ? {(8'ha4), (8'h9d)} : ((8'hbf) >> (7'h42))))) > (({{(8'hab)}, (8'hb8)} ? (((7'h41) ^~ (8'haa)) ? (^~(8'hbb)) : ((8'ha8) + (8'hb9))) : {((7'h40) <<< (8'hb5))}) ? ({(!(8'haf))} ? ((^~(8'hb5)) >>> ((8'hb4) >>> (8'h9d))) : (-((8'hbc) ^ (8'haa)))) : {(((8'h9c) << (8'hac)) ? (!(8'hae)) : (^(8'hb5)))})), 
parameter param73 = (-param72))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire71,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire52,
                 wire25,
                 wire24,
                 reg70,
                 reg69,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 (1'h0)};
  assign wire24 = $unsigned({$unsigned($unsigned($unsigned(wire20)))});
  assign wire25 = ((8'had) == ($signed(wire20[(2'h3):(2'h2)]) ?
                      (~$unsigned($unsigned(wire22))) : (((^wire22) ?
                          (wire22 + wire24) : wire20[(3'h6):(1'h1)]) < $unsigned((wire20 ?
                          (8'ha9) : wire20)))));
  always
    @(posedge clk) begin
      reg26 <= {wire22};
      if ($unsigned($signed(wire20)))
        begin
          reg27 <= $signed((((wire24 ?
                      $unsigned((8'haf)) : (wire22 ? wire25 : wire21)) ?
                  {(wire23 & (8'hb7)),
                      $signed(wire22)} : ((~wire25) <= {wire22})) ?
              {(~|(+wire24)),
                  (wire24 << wire24[(1'h1):(1'h1)])} : reg26[(4'ha):(3'h7)]));
          reg28 <= (wire25[(4'ha):(4'ha)] && $unsigned($unsigned((~^(wire22 & wire24)))));
        end
      else
        begin
          reg27 <= (wire24 ?
              (~&(($signed(wire21) ? $unsigned(reg26) : $signed(reg27)) ?
                  $signed(wire20) : (~$signed(wire22)))) : (wire25[(3'h7):(3'h5)] <= reg28));
          reg28 <= reg26;
          reg29 <= $unsigned($signed($unsigned(((wire20 << reg26) ^~ (~reg27)))));
          reg30 <= (|{$unsigned((~|{reg27}))});
        end
      reg31 <= ((~|(-($unsigned(reg28) ?
          reg29[(3'h6):(3'h5)] : $signed(wire20)))) ^~ ($signed($signed((^~reg30))) ?
          $signed($unsigned(reg26[(3'h7):(1'h1)])) : reg29[(3'h5):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg32 <= {(8'had), reg30[(2'h3):(2'h3)]};
      reg33 <= $unsigned((^~reg27[(4'hb):(2'h3)]));
      reg34 <= $signed($signed(reg29[(3'h6):(3'h6)]));
      reg35 <= reg30;
      reg36 <= (8'h9d);
    end
  always
    @(posedge clk) begin
      if ((((wire21[(1'h0):(1'h0)] ?
                  ((|wire25) ?
                      (reg35 ?
                          wire23 : reg26) : reg29[(3'h5):(1'h0)]) : ($unsigned(reg35) ?
                      $signed(wire25) : $signed(reg36))) ?
              $unsigned($unsigned((~|reg35))) : reg31[(4'hc):(3'h4)]) ?
          $signed({reg27[(5'h15):(4'hd)]}) : $unsigned($unsigned(wire20))))
        begin
          if (wire20)
            begin
              reg37 <= (($unsigned(reg27) << $unsigned(reg29)) + reg34);
            end
          else
            begin
              reg37 <= (wire22 & reg31[(2'h3):(2'h3)]);
            end
          if ($signed($unsigned({{wire23[(3'h5):(1'h0)]}})))
            begin
              reg38 <= (~^$signed(reg28));
              reg39 <= reg32[(1'h1):(1'h1)];
              reg40 <= ($signed($signed(reg27)) == ((~|reg33[(3'h5):(2'h3)]) <<< $unsigned(((wire21 ?
                      wire21 : wire21) ?
                  wire23[(2'h2):(1'h0)] : (~reg33)))));
            end
          else
            begin
              reg38 <= reg27[(4'hb):(4'ha)];
            end
          reg41 <= (+$signed(wire20));
          reg42 <= {(^(-$unsigned($signed(wire21)))),
              (reg35[(1'h0):(1'h0)] <= reg39[(4'hd):(4'ha)])};
          reg43 <= reg34[(1'h1):(1'h0)];
        end
      else
        begin
          reg37 <= reg31;
          reg38 <= reg26[(3'h6):(3'h6)];
        end
      reg44 <= $unsigned($unsigned(((((8'hbe) && reg40) ?
              (reg31 ? wire25 : reg27) : (reg42 + wire22)) ?
          (~|(reg33 || (8'ha6))) : $unsigned($signed(reg27)))));
      reg45 <= $unsigned($unsigned($signed(reg32)));
      reg46 <= reg29[(3'h5):(1'h1)];
      if (reg26[(3'h4):(1'h0)])
        begin
          if ($unsigned({$signed(reg26[(2'h3):(2'h2)]), $signed(wire23)}))
            begin
              reg47 <= (~&{$unsigned(((^reg36) ?
                      reg46[(2'h2):(1'h0)] : (reg38 ? reg42 : reg28))),
                  reg29});
              reg48 <= $unsigned((~|(8'hb5)));
              reg49 <= (reg28[(3'h6):(3'h5)] ?
                  $unsigned((+$unsigned((~&reg37)))) : ((~reg37) ?
                      (((+reg30) > $signed(reg43)) > (~^$unsigned((7'h40)))) : $signed((wire21 * (!reg27)))));
            end
          else
            begin
              reg47 <= $unsigned(($signed($signed((8'hb7))) <<< (reg45[(3'h6):(3'h6)] > $unsigned((~|wire20)))));
              reg48 <= reg44;
              reg49 <= $unsigned(wire20[(2'h2):(1'h1)]);
              reg50 <= reg33[(4'h9):(2'h2)];
            end
          reg51 <= reg39;
        end
      else
        begin
          reg47 <= ((($unsigned(reg40[(2'h2):(1'h0)]) >= $unsigned((!reg39))) ?
              reg33[(3'h4):(3'h4)] : ((((8'ha2) != reg34) * $unsigned(reg47)) == reg49[(2'h2):(1'h0)])) > ((~|reg50[(1'h0):(1'h0)]) ^ ($signed($signed(reg42)) ?
              $unsigned($signed(reg33)) : reg36)));
          reg48 <= reg28;
        end
    end
  assign wire52 = $signed($signed({reg37, (|reg30)}));
  always
    @(posedge clk) begin
      reg53 <= $unsigned(($signed(((reg31 != wire23) ?
          reg35[(1'h1):(1'h0)] : (~&reg51))) >>> ((reg30 - reg28[(3'h6):(3'h4)]) > $unsigned($unsigned(reg48)))));
      if (reg44[(5'h12):(1'h1)])
        begin
          reg54 <= (^$signed($unsigned({$unsigned(reg35)})));
          reg55 <= (wire25[(3'h5):(1'h1)] ? $signed((|(!(~^reg54)))) : wire25);
          reg56 <= $signed($signed((($unsigned(reg39) && (|reg40)) <<< (~&reg33[(3'h4):(2'h2)]))));
          reg57 <= ($unsigned($signed($signed((reg53 >>> (8'haf))))) || reg30[(4'h9):(3'h7)]);
          reg58 <= (($unsigned((^~reg40[(2'h2):(1'h1)])) ?
              {({reg45, reg31} ? ((8'hbf) << reg29) : $signed(wire23)),
                  ((~wire23) ?
                      (~|reg46) : $signed(reg47))} : (~^((reg55 != (7'h41)) ?
                  reg32 : reg50[(2'h3):(1'h1)]))) <= (+(~&($unsigned(reg44) - (wire52 ?
              reg40 : reg36)))));
        end
      else
        begin
          if ((!((~reg55) ? $unsigned($unsigned((^~reg29))) : (8'hb7))))
            begin
              reg54 <= reg31;
              reg55 <= $unsigned($signed($signed($signed((|reg49)))));
              reg56 <= wire52[(5'h10):(1'h1)];
            end
          else
            begin
              reg54 <= $unsigned(((~|$signed((~^reg40))) > $unsigned($unsigned((wire52 <<< reg55)))));
              reg55 <= ($signed({$signed($signed(reg47))}) ^ {(reg47 ?
                      $signed(reg35[(1'h1):(1'h0)]) : wire22)});
              reg56 <= reg31[(4'ha):(2'h3)];
              reg57 <= $signed((+($signed(reg40) + (reg38 <= {reg45}))));
            end
          reg58 <= (reg50 > $signed($signed((&reg53))));
        end
      reg59 <= reg35[(2'h3):(2'h2)];
      reg60 <= {$signed($unsigned($signed((8'ha8)))),
          (((reg38[(2'h3):(1'h0)] < (reg58 <<< reg35)) ?
                  wire22 : {((8'hb1) << reg39)}) ?
              (^~($signed(reg30) || (^~reg45))) : reg33[(4'h8):(3'h4)])};
    end
  assign wire61 = reg29;
  assign wire62 = ($unsigned(reg36[(1'h0):(1'h0)]) ?
                      reg50[(3'h4):(3'h4)] : $unsigned((({reg31, reg56} ?
                              (~^reg27) : (wire25 ? wire22 : reg51)) ?
                          $signed(wire25) : wire20[(2'h2):(2'h2)])));
  assign wire63 = $signed(wire62);
  assign wire64 = {$signed((((reg41 ? reg37 : reg45) ?
                              (reg53 ? wire62 : wire52) : {reg50, reg33}) ?
                          {$unsigned(reg56), (~^reg34)} : $signed(reg46))),
                      wire61};
  assign wire65 = {$signed((~^($signed(reg50) <<< (~reg56))))};
  assign wire66 = (8'haf);
  assign wire67 = $signed((8'hb1));
  assign wire68 = $signed((reg26 ?
                      (+({wire20} && $signed((8'hb6)))) : $signed((reg53 ?
                          $signed(reg58) : reg35[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg69 <= reg39[(4'hb):(1'h1)];
      reg70 <= $unsigned(reg36[(2'h2):(2'h2)]);
    end
  assign wire71 = ($unsigned(wire67[(1'h0):(1'h0)]) == ((wire25 < reg27[(3'h7):(3'h6)]) >= reg53[(2'h3):(2'h3)]));
endmodule
