module top
#(parameter param126 = ((({(|(8'hb5))} ? ({(8'ha4), (8'hbf)} ? ((8'ha2) ^~ (8'hbe)) : ((8'hbc) < (7'h44))) : ({(8'hb8)} ? ((8'hb9) ? (8'hb8) : (8'hba)) : ((8'hb5) ? (8'hb8) : (8'hbe)))) <= ((^~{(8'h9d)}) - (+((8'h9d) ? (8'haa) : (8'hbf))))) ? {((((8'hb5) > (8'h9e)) ? ((8'hae) <= (7'h42)) : {(8'ha4)}) - (+((8'haf) << (8'hb6)))), (~{{(8'hb3), (8'hb2)}, ((7'h42) ~^ (8'hbd))})} : (({(^(8'hbf))} ~^ (((8'ha0) ~^ (8'hab)) ? {(8'hbb), (8'hb4)} : (~|(8'hb6)))) >= (~^(((8'ha4) & (8'hba)) + ((8'ha3) ? (8'hb6) : (7'h44)))))), 
parameter param127 = {(&((~&(^~param126)) ? (+(&param126)) : ((param126 ? param126 : param126) ? (param126 << (8'ha2)) : (param126 >> param126))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire101;
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire120,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire103,
                 wire5,
                 wire6,
                 wire101,
                 reg122,
                 reg121,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire5[(3'h7):(1'h0)];
  module7 #() modinst102 (.wire8(wire3), .wire12(wire1), .wire9(wire2), .wire10(wire4), .wire11(wire0), .y(wire101), .clk(clk));
  assign wire103 = ((((wire6[(1'h0):(1'h0)] | {wire1}) ?
                       $signed((wire1 ?
                           (8'ha3) : (8'hb2))) : (wire3 == ((8'ha9) ?
                           (8'hbd) : wire6))) + $unsigned(({wire3} + (wire101 ?
                       wire5 : wire101)))) + (&$signed(wire2[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg104 <= $signed($signed({(~^((8'hba) ? wire3 : wire3))}));
      reg105 <= (wire5 ? $unsigned(wire1) : (^$unsigned((&((8'haf) + wire0)))));
      if ((wire3[(3'h5):(1'h1)] ^~ ($signed(wire2[(2'h2):(2'h2)]) ~^ wire4)))
        begin
          reg106 <= $signed(((((!wire5) ~^ (^(8'ha4))) - ((reg105 > wire103) != $signed(reg104))) && (&reg104[(3'h6):(3'h6)])));
          reg107 <= wire2[(2'h3):(1'h1)];
          reg108 <= {((~(&(^~wire101))) ?
                  (|$signed((^(8'hb2)))) : ((reg106[(2'h3):(2'h2)] ?
                          {wire4, reg105} : (~^reg105)) ?
                      wire2[(4'hc):(3'h7)] : $unsigned((reg104 > wire0)))),
              (~^reg106)};
          reg109 <= (+wire0[(1'h0):(1'h0)]);
        end
      else
        begin
          reg106 <= ($signed({({reg105, wire2} * reg108[(3'h5):(2'h2)])}) ?
              $unsigned((~((reg107 ? reg105 : wire6) ?
                  wire6 : (^~reg106)))) : $signed((((~&reg107) ?
                  $signed(reg105) : reg107[(3'h6):(1'h0)]) >= (8'hb8))));
          if ((($signed({wire101,
                  (reg109 ?
                      wire2 : reg106)}) & ($signed(wire4) + ($signed(wire3) ?
                  wire0[(1'h0):(1'h0)] : (reg106 ? reg106 : wire101)))) ?
              reg104 : (8'ha4)))
            begin
              reg107 <= {(~|(reg108[(3'h5):(2'h2)] && ($signed(wire101) ?
                      $unsigned(reg106) : $unsigned(reg109))))};
              reg108 <= ($unsigned((wire103 <= (|$unsigned(wire4)))) ?
                  $signed(reg104) : {(-reg109[(4'h9):(4'h8)]),
                      $signed($unsigned($signed(wire4)))});
            end
          else
            begin
              reg107 <= (&wire1[(4'h9):(2'h2)]);
              reg108 <= $signed(((~(8'ha4)) >= $signed(reg106[(1'h1):(1'h1)])));
              reg109 <= (reg105[(4'he):(1'h0)] >= wire0);
            end
        end
    end
  assign wire110 = $signed(($unsigned($unsigned((8'ha2))) ?
                       ($unsigned($signed(wire103)) ?
                           $signed($signed(wire1)) : {reg106,
                               $signed((8'hb5))}) : reg107[(2'h2):(1'h0)]));
  assign wire111 = wire4;
  assign wire112 = ((8'h9d) ?
                       ((+($signed((8'hb1)) < {(8'hbd)})) ?
                           $unsigned($signed({reg104,
                               reg105})) : (~&wire111)) : ($signed($unsigned($signed(wire101))) ?
                           wire3[(2'h3):(2'h2)] : (reg109 ?
                               (|(-wire1)) : $unsigned($signed(reg108)))));
  assign wire113 = ((7'h41) <= $unsigned((~|$unsigned($unsigned(wire2)))));
  assign wire114 = reg107;
  always
    @(posedge clk) begin
      if ($signed(((wire5[(4'hf):(4'h8)] >> wire5[(4'hb):(2'h3)]) ?
          wire111 : (((~^wire112) ? {reg107} : $unsigned(wire110)) ?
              wire1[(2'h3):(1'h1)] : (wire4[(4'h8):(3'h6)] ?
                  $signed((8'had)) : {wire5})))))
        begin
          reg115 <= wire113[(4'hc):(1'h0)];
          reg116 <= $signed(wire114[(2'h2):(1'h1)]);
          reg117 <= reg105;
        end
      else
        begin
          reg115 <= (~|wire110);
          reg116 <= reg105;
          reg117 <= (reg106 ?
              (~(wire6[(1'h1):(1'h1)] ?
                  reg104 : reg117[(1'h1):(1'h1)])) : (($signed($signed((8'hb7))) ?
                      $unsigned((wire6 ? reg109 : wire3)) : $unsigned(wire6)) ?
                  (wire111[(5'h10):(4'hf)] ?
                      wire103[(3'h7):(3'h7)] : {(^wire110)}) : {$unsigned($signed(wire1)),
                      $unsigned(wire6)}));
          reg118 <= (^(($unsigned($signed(wire4)) ^~ {$unsigned(wire4),
                  ((8'hb0) && wire3)}) ?
              ({{(8'h9c), wire1}, (8'haf)} ?
                  $signed({(8'haa)}) : (wire111 <<< wire2[(3'h5):(2'h2)])) : $unsigned((!(^wire6)))));
          reg119 <= $signed(reg107[(2'h3):(1'h1)]);
        end
    end
  assign wire120 = $signed($signed((^~(-(reg119 ? wire6 : (8'hb0))))));
  always
    @(posedge clk) begin
      reg121 <= (~&{$signed((reg104[(1'h1):(1'h1)] + ((8'hab) > wire103)))});
      reg122 <= reg109;
    end
  assign wire123 = $signed((~&$unsigned((~^$unsigned((7'h40))))));
  assign wire124 = wire123;
  assign wire125 = $signed((($unsigned((wire110 >> wire114)) ?
                           reg122[(4'hf):(1'h0)] : (8'hae)) ?
                       (8'hbc) : (!reg117[(4'hd):(4'ha)])));
endmodule

module module7
#(parameter param100 = (^(~^((((8'ha4) ? (7'h44) : (8'had)) ~^ ((8'haf) == (7'h42))) ? (~|((8'hb2) ? (7'h41) : (8'hb6))) : (~^((8'hb1) > (8'ha3)))))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h31d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire [(2'h2):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire32,
                 wire31,
                 wire30,
                 wire15,
                 wire14,
                 wire13,
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
                 reg33,
                 reg34,
                 reg35,
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
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 (1'h0)};
  assign wire13 = $signed(($unsigned(((^~wire12) >= $signed(wire8))) - $unsigned(((8'hb3) ?
                      ((8'ha1) ? wire10 : wire12) : $signed(wire8)))));
  assign wire14 = (wire12 ?
                      (wire13 ~^ (-$signed((^~wire13)))) : ((!wire10) ?
                          (wire9 >>> wire11[(2'h2):(2'h2)]) : ((^~$unsigned(wire8)) & (!wire13))));
  assign wire15 = $unsigned(($unsigned(wire10) ?
                      (wire13[(4'hb):(4'hb)] ?
                          (+wire12) : wire13[(3'h7):(2'h3)]) : ($signed($signed(wire9)) > wire8[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      if (($unsigned(($signed(wire9[(3'h5):(2'h3)]) ?
          (+((8'hb2) & wire15)) : {$unsigned(wire11),
              wire13[(3'h4):(1'h0)]})) && wire10))
        begin
          reg16 <= ((wire11 ?
              (~^wire14[(2'h3):(2'h3)]) : (~^($signed(wire10) ?
                  (wire14 ?
                      wire12 : wire13) : wire11))) >>> wire12[(3'h6):(1'h1)]);
          reg17 <= ($signed($signed(wire13)) >>> ($unsigned(($unsigned(wire15) & (8'h9d))) != {wire15[(3'h6):(3'h5)],
              (~$unsigned(wire10))}));
          reg18 <= {$signed($signed((8'hb5)))};
          reg19 <= (wire14[(1'h0):(1'h0)] << ((reg18 ?
                  (wire9 ?
                      (wire13 * (8'hbe)) : $signed((8'hb0))) : ({wire15} < wire12[(3'h5):(2'h3)])) ?
              wire8[(1'h1):(1'h1)] : $signed({$unsigned((8'ha6)), wire10})));
          reg20 <= $unsigned($signed({($signed(wire10) ?
                  $signed(wire14) : (reg19 ? wire14 : wire10)),
              ($unsigned((8'hbf)) & reg16)}));
        end
      else
        begin
          if ($unsigned((((8'h9f) ?
                  $unsigned((reg20 * reg20)) : $signed((wire13 + wire12))) ?
              wire11[(2'h2):(1'h1)] : reg19)))
            begin
              reg16 <= $signed((-reg18[(1'h1):(1'h0)]));
              reg17 <= (^((8'had) >> $signed((wire10[(2'h2):(2'h2)] ?
                  reg19[(4'h9):(2'h3)] : $unsigned(wire15)))));
              reg18 <= $signed((((8'hbe) < (|$unsigned(reg20))) ^~ {$signed($signed(wire12))}));
              reg19 <= (^(reg17 + $signed($signed({wire8}))));
              reg20 <= reg16;
            end
          else
            begin
              reg16 <= $unsigned(((&{(reg18 ? wire12 : (8'ha6))}) ?
                  (|wire10[(1'h0):(1'h0)]) : (((reg20 != reg20) ?
                          (!wire12) : $signed(wire10)) ?
                      {(^wire9), wire10[(2'h2):(2'h2)]} : $signed((~|reg17)))));
              reg17 <= $signed(wire11);
              reg18 <= wire13[(3'h5):(3'h4)];
              reg19 <= {($unsigned(($signed(wire15) >>> wire8[(1'h1):(1'h0)])) ?
                      $unsigned(wire8[(1'h0):(1'h0)]) : (((!wire11) ?
                          $signed(reg17) : reg19) <<< reg19[(2'h3):(1'h0)])),
                  $signed((wire12[(3'h5):(3'h4)] | $unsigned({reg18})))};
              reg20 <= wire14[(2'h3):(1'h1)];
            end
          reg21 <= $signed(({$unsigned((reg16 ~^ (8'h9e)))} ?
              $unsigned($unsigned($unsigned(wire13))) : (&reg20)));
          if ((~&((~&{$unsigned(reg21),
              (wire13 + wire14)}) >> $unsigned(reg19))))
            begin
              reg22 <= reg21[(3'h7):(3'h6)];
              reg23 <= $signed((reg22 ?
                  reg17[(1'h1):(1'h0)] : {(wire8[(1'h1):(1'h0)] << wire14),
                      $signed(reg20[(3'h5):(3'h5)])}));
              reg24 <= wire9;
              reg25 <= reg18;
              reg26 <= ($signed($unsigned($signed($unsigned(wire11)))) ?
                  $unsigned((wire13[(2'h3):(1'h0)] ?
                      (8'hb4) : $signed(wire10[(1'h1):(1'h1)]))) : ($unsigned(reg17[(4'ha):(3'h5)]) ?
                      wire13[(4'he):(3'h6)] : wire10));
            end
          else
            begin
              reg22 <= (wire9 ? $unsigned((-wire15)) : reg17);
              reg23 <= (!$unsigned($signed(reg25[(4'hf):(3'h7)])));
            end
        end
      reg27 <= $signed(((((&reg26) ?
          wire11[(1'h1):(1'h1)] : wire15) || ((~&reg22) != {reg18})) && reg23[(1'h0):(1'h0)]));
      reg28 <= {(~^($unsigned((wire15 | wire15)) ~^ (+reg16[(3'h7):(1'h0)]))),
          (reg26 ?
              (^~((reg17 ? wire14 : reg26) ?
                  $signed(wire15) : (-reg22))) : wire8[(2'h3):(1'h1)])};
      reg29 <= (~^(wire13 && reg27));
    end
  assign wire30 = ((8'hb3) ^ ((wire14[(2'h3):(2'h3)] | ($unsigned(reg27) ?
                          (wire12 ? reg26 : reg17) : $signed(wire8))) ?
                      (~&($signed(wire9) != reg23[(2'h3):(2'h2)])) : (|reg21[(1'h1):(1'h0)])));
  assign wire31 = ((((reg24[(3'h4):(1'h0)] < reg20) * ((reg28 ~^ wire8) == ((8'ha6) ?
                              reg27 : wire11))) ?
                          {$signed((+reg21)),
                              $unsigned(wire10[(1'h1):(1'h0)])} : ({$signed(wire30)} <<< $signed(reg24))) ?
                      wire9 : ((wire9[(1'h1):(1'h0)] == $signed(((8'h9c) >>> wire15))) == $signed((~(~(7'h40))))));
  assign wire32 = reg23;
  always
    @(posedge clk) begin
      reg33 <= (^$signed((~|(~|reg28))));
    end
  always
    @(posedge clk) begin
      if (((reg25[(5'h11):(3'h5)] ?
          $unsigned(wire10) : {$unsigned(reg19[(3'h6):(3'h4)])}) >>> $signed($signed(($signed((8'hab)) ?
          $signed(wire30) : (wire11 == reg26))))))
        begin
          reg34 <= wire10;
          if ($unsigned(((($unsigned(wire11) * (reg17 ?
                  reg26 : (7'h42))) <<< $signed((8'had))) ?
              wire8 : (($unsigned(reg26) >>> $unsigned(wire12)) ?
                  reg16[(2'h2):(1'h1)] : (wire12 < ((8'hb1) <= reg24))))))
            begin
              reg35 <= (~reg21[(4'h8):(3'h4)]);
            end
          else
            begin
              reg35 <= $signed((!{{(^reg20), wire13[(3'h7):(3'h7)]}}));
              reg36 <= (|wire12[(3'h7):(3'h6)]);
              reg37 <= $signed($signed($unsigned($signed(wire31))));
              reg38 <= {(^$signed({$unsigned(reg29), (reg23 ~^ (8'had))}))};
            end
          if (reg35)
            begin
              reg39 <= wire13[(4'hf):(4'hb)];
              reg40 <= reg20;
              reg41 <= (^$signed(reg34));
              reg42 <= $signed(({reg29,
                  $unsigned(reg37)} << wire11[(1'h0):(1'h0)]));
            end
          else
            begin
              reg39 <= ({({(|reg20)} <= ((+reg36) ?
                      (wire11 ? reg17 : reg16) : $signed((8'h9f))))} <= reg24);
              reg40 <= (~^{reg33[(5'h10):(1'h0)]});
              reg41 <= {$unsigned({reg24[(2'h2):(1'h0)]})};
              reg42 <= reg33;
            end
          reg43 <= wire10[(2'h2):(1'h1)];
        end
      else
        begin
          reg34 <= (&reg34);
          if ({(8'hb1)})
            begin
              reg35 <= $signed((reg42[(1'h0):(1'h0)] ~^ (-((wire15 ^~ (8'hba)) ?
                  reg36[(4'h8):(3'h4)] : $signed(wire13)))));
            end
          else
            begin
              reg35 <= $signed((~(((|(8'hb5)) ? reg41 : $signed(reg21)) ?
                  $unsigned(reg17) : {$signed(reg21),
                      (reg19 ? reg27 : reg35)})));
              reg36 <= $signed(($unsigned(((wire15 | reg27) ?
                  reg26[(1'h1):(1'h0)] : reg24)) ^ $unsigned($unsigned((reg20 + reg24)))));
              reg37 <= reg39;
              reg38 <= (-((!{reg27,
                  reg17[(4'ha):(3'h7)]}) == $signed($signed(reg43[(5'h13):(3'h5)]))));
            end
        end
      reg44 <= (($unsigned((reg36[(5'h13):(4'hb)] < reg34)) | $unsigned((&(reg25 ^ reg43)))) ?
          (8'hb9) : (reg18[(4'hd):(2'h3)] * ({((8'h9c) ? wire14 : reg27),
              (~|reg42)} - (~{wire8}))));
      if (({wire14, $unsigned(reg37)} && wire15))
        begin
          if ((~^$unsigned($unsigned((~&wire13[(4'hc):(3'h7)])))))
            begin
              reg45 <= reg34[(4'h8):(1'h1)];
              reg46 <= reg36[(4'h8):(3'h7)];
              reg47 <= $signed({{wire32,
                      {((8'hbe) ^ wire31), $unsigned(reg43)}},
                  $signed(reg38[(4'h9):(4'h8)])});
            end
          else
            begin
              reg45 <= reg28;
              reg46 <= $unsigned({reg44[(3'h6):(1'h1)], wire9});
            end
          reg48 <= $signed(($unsigned($signed($unsigned((8'haf)))) ?
              (8'hbe) : (($unsigned(wire12) << $unsigned((8'hb2))) ?
                  reg41 : $signed((reg19 != reg29)))));
          reg49 <= (({($unsigned(wire11) == $unsigned(reg19)),
              {$signed((7'h40)),
                  $signed(reg44)}} <= ($unsigned((reg21 ~^ reg42)) ?
              reg18 : $signed($signed(reg27)))) << ((8'ha0) ?
              ((~^(~^reg36)) ?
                  (8'hba) : reg41[(1'h1):(1'h1)]) : ($unsigned((reg20 > (8'hb7))) >>> $unsigned($signed(reg37)))));
          reg50 <= reg43[(4'hd):(1'h0)];
          reg51 <= (+((~|(8'hac)) << wire31[(3'h5):(3'h4)]));
        end
      else
        begin
          reg45 <= ($signed(({$unsigned(reg28)} ^~ $unsigned(reg38[(4'hb):(4'h8)]))) ?
              (^(((reg43 ? reg45 : reg20) || wire14) ?
                  reg49 : $unsigned({reg40,
                      (7'h40)}))) : (^$signed((reg22[(5'h14):(5'h10)] >= wire12[(3'h6):(1'h1)]))));
          reg46 <= (wire11 ? reg25[(4'he):(3'h5)] : reg49[(2'h2):(1'h1)]);
          reg47 <= (-($unsigned(reg48[(2'h3):(2'h3)]) ?
              ((reg18[(4'ha):(4'h8)] != reg18[(1'h1):(1'h0)]) ?
                  reg35 : (^$unsigned(wire12))) : (($signed(reg33) ~^ (~&reg21)) || (^((7'h44) ?
                  reg38 : reg24)))));
          reg48 <= (reg19 ?
              (^((!(reg23 ?
                  reg45 : reg17)) & (reg51 <<< reg43[(4'he):(4'hc)]))) : (^({(|reg25),
                      (^reg38)} ?
                  reg16[(4'ha):(2'h3)] : $signed((reg46 || reg45)))));
          reg49 <= ($signed(reg41) <= $unsigned($unsigned(reg44[(3'h5):(2'h3)])));
        end
      if ((!reg28))
        begin
          reg52 <= $signed(($unsigned((~^$unsigned((8'hb4)))) ?
              (($signed(reg38) & reg48[(1'h0):(1'h0)]) || reg44[(1'h0):(1'h0)]) : wire14[(2'h3):(2'h3)]));
          reg53 <= (~&$unsigned(reg45));
          reg54 <= reg23[(3'h4):(3'h4)];
          if (reg33)
            begin
              reg55 <= $unsigned((((((8'hb1) ^ reg46) >> (wire31 * reg34)) || $signed($signed(reg39))) ?
                  ((wire31 ? (reg38 ? wire31 : reg38) : (~|(8'hb0))) < {reg38,
                      {reg51}}) : (reg42 | ($unsigned(reg23) ?
                      (^~reg38) : (~^wire32)))));
              reg56 <= (($unsigned(wire11[(1'h0):(1'h0)]) >> (reg42[(1'h1):(1'h1)] ?
                      reg26[(3'h5):(3'h4)] : $unsigned(((8'ha3) + reg47)))) ?
                  (8'hb6) : reg26[(3'h6):(2'h2)]);
              reg57 <= (reg38 && wire9[(3'h7):(3'h6)]);
            end
          else
            begin
              reg55 <= (~^(-($unsigned((reg52 ? (7'h44) : reg16)) ?
                  (((8'h9d) <<< wire9) ?
                      (reg50 ?
                          reg28 : reg40) : (wire30 >> reg20)) : ((^(8'ha7)) ?
                      wire8 : {reg39}))));
              reg56 <= reg18[(4'hd):(3'h4)];
              reg57 <= ($signed($unsigned((|(reg50 & reg24)))) <<< $signed(((wire14 ?
                  (^wire32) : (^~reg29)) << reg17)));
            end
          if (reg25)
            begin
              reg58 <= reg57[(2'h2):(1'h0)];
              reg59 <= $unsigned({$unsigned($signed((~(7'h43))))});
              reg60 <= ($unsigned($signed(reg20)) + (wire8[(1'h1):(1'h1)] & $unsigned((^~{reg51,
                  wire31}))));
              reg61 <= reg52[(2'h3):(2'h2)];
            end
          else
            begin
              reg58 <= ($unsigned($signed(reg18)) * reg45);
              reg59 <= (7'h43);
              reg60 <= ((-(((!(8'hb8)) ?
                  $unsigned(wire12) : reg38[(5'h14):(5'h10)]) + (!(!(8'ha8))))) | ((~&(~&(reg40 ?
                      reg33 : (8'ha9)))) ?
                  $signed($unsigned((wire8 ?
                      reg49 : wire31))) : ((^~(~wire15)) ?
                      reg48 : reg53[(1'h1):(1'h1)])));
              reg61 <= $unsigned(((reg28 <= $signed((+reg39))) <= ($signed(reg28) >= reg41)));
              reg62 <= $unsigned($unsigned((($unsigned(reg36) >> $signed(reg46)) ?
                  $signed((reg60 > wire13)) : reg57[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          if (reg48)
            begin
              reg52 <= (reg41[(3'h4):(3'h4)] ?
                  {(8'ha8), $signed(reg62)} : wire13[(1'h1):(1'h1)]);
              reg53 <= reg23;
              reg54 <= $unsigned((^~$signed({$unsigned(reg49)})));
              reg55 <= $unsigned(reg26);
              reg56 <= reg41[(3'h5):(3'h5)];
            end
          else
            begin
              reg52 <= (&reg36[(4'hd):(1'h0)]);
              reg53 <= {((^((reg56 >> (8'h9c)) < $signed(reg42))) | reg28)};
              reg54 <= (~^$signed((&$signed(reg47[(4'h8):(3'h6)]))));
              reg55 <= reg29[(3'h6):(2'h2)];
            end
          reg57 <= (reg16[(2'h3):(2'h2)] & reg47[(5'h14):(4'h9)]);
          reg58 <= ((~&(~|reg25[(3'h6):(1'h0)])) ?
              ($unsigned($unsigned($unsigned(reg42))) ?
                  $signed($unsigned($unsigned(wire15))) : ((reg61 ?
                      $unsigned(reg34) : (~|reg41)) & ($unsigned((8'haf)) || $unsigned(reg52)))) : (|wire31[(1'h1):(1'h0)]));
          reg59 <= reg35[(5'h10):(4'hf)];
        end
      if (($signed(reg44[(2'h3):(1'h0)]) ?
          $unsigned((8'ha8)) : (~&reg20[(1'h0):(1'h0)])))
        begin
          reg63 <= {$signed(reg45), (|(&(&reg39)))};
          reg64 <= (reg60 ? reg44[(1'h1):(1'h1)] : {$signed(reg19), reg60});
        end
      else
        begin
          reg63 <= (8'hb6);
        end
    end
  assign wire65 = reg40;
  assign wire66 = (reg47 ?
                      (~$unsigned($unsigned($signed(reg36)))) : $unsigned(reg45[(3'h4):(2'h3)]));
  assign wire67 = (8'ha0);
  assign wire68 = {((($unsigned(wire13) <= $unsigned((8'ha6))) ?
                              reg28[(2'h3):(1'h1)] : (8'haa)) ?
                          {$unsigned(((8'hbb) ? reg26 : wire10)),
                              (reg25 ^ $signed(wire8))} : wire9)};
  assign wire69 = reg62[(3'h4):(1'h0)];
  module70 #() modinst96 (.wire72(reg23), .clk(clk), .y(wire95), .wire71(reg60), .wire75(reg24), .wire73(reg26), .wire74(reg46));
  assign wire97 = $signed({(((wire66 < wire66) || (reg61 > reg46)) ?
                          reg19[(4'h9):(3'h5)] : reg21[(3'h4):(1'h0)])});
  assign wire98 = {$signed(reg23[(1'h0):(1'h0)]),
                      (((wire97[(2'h3):(2'h2)] ?
                              ((8'hbd) * reg63) : reg57[(2'h3):(2'h2)]) ?
                          $signed(wire10[(1'h0):(1'h0)]) : (~^(reg38 >> reg39))) | ((reg23[(5'h12):(4'he)] ?
                          {reg34,
                              reg56} : (^wire32)) + $unsigned(reg55[(3'h6):(1'h1)])))};
  assign wire99 = (reg35 ?
                      reg22[(3'h7):(3'h7)] : ({wire68} ?
                          $signed((wire67 ?
                              (reg20 | reg57) : $signed(reg29))) : $signed(reg35)));
endmodule

module module70
#(parameter param94 = ((((~|((8'ha4) || (8'hb1))) ? ((&(8'haf)) == ((8'hb2) >= (7'h44))) : (-(|(8'hb9)))) <<< (~(((7'h40) ? (8'hbd) : (8'hb4)) ? (~|(7'h41)) : ((8'hb3) ? (8'hac) : (8'ha0))))) - (((~{(8'ha1)}) ? (((8'hb8) ? (8'ha6) : (8'hae)) ? {(7'h43)} : ((8'hb1) <<< (8'hb1))) : ((~^(8'hb8)) && ((8'h9d) + (7'h40)))) ? (+((-(8'ha6)) || ((8'h9d) ? (8'ha5) : (8'hb0)))) : (|((~|(8'hb9)) ? (|(8'hb4)) : (8'hb9))))))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire75;
  input wire signed [(5'h15):(1'h0)] wire74;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire signed [(5'h15):(1'h0)] wire72;
  input wire [(4'hf):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg76 <= wire73[(1'h0):(1'h0)];
      reg77 <= reg76[(1'h1):(1'h1)];
      reg78 <= wire72[(4'hd):(4'hb)];
      if (wire73[(1'h1):(1'h1)])
        begin
          reg79 <= ((~&($signed($signed(wire74)) ?
              $signed((~|wire74)) : reg78[(4'ha):(3'h6)])) - $signed(({$unsigned(wire71)} == (8'ha9))));
          reg80 <= (({(wire71[(3'h5):(2'h2)] & $unsigned((8'hbe))),
                      $signed(wire75[(1'h0):(1'h0)])} ?
                  {reg76[(1'h1):(1'h1)]} : ({wire73,
                      (wire73 ?
                          reg76 : wire71)} <<< ((reg79 >> (8'haa)) >> reg78))) ?
              $signed((&$signed($unsigned(wire74)))) : $signed(((reg79 ?
                      reg78[(1'h1):(1'h0)] : (+reg77)) ?
                  wire73[(2'h3):(1'h0)] : (((8'hbc) * reg79) == (wire74 ?
                      wire73 : wire73)))));
          reg81 <= $signed(reg77[(4'hf):(1'h1)]);
          reg82 <= ({(7'h41), (-wire71)} != wire72[(4'hb):(2'h3)]);
        end
      else
        begin
          reg79 <= wire74;
          reg80 <= $signed((|(~^(~|$unsigned(wire73)))));
          reg81 <= reg77[(1'h0):(1'h0)];
          reg82 <= {(|(((reg81 < wire73) == reg82[(2'h3):(2'h3)]) ?
                  reg80[(4'h9):(1'h0)] : {reg78[(1'h0):(1'h0)]}))};
          reg83 <= (wire75[(2'h2):(1'h1)] ^~ (((&(|wire72)) != $signed({reg78})) ?
              reg77[(4'hb):(2'h2)] : wire71[(3'h4):(2'h2)]));
        end
    end
  assign wire84 = (!(^~({(wire71 >= reg77),
                      (wire73 ? reg83 : (8'hb5))} >>> reg79)));
  assign wire85 = $unsigned($signed($unsigned($unsigned($unsigned(reg79)))));
  assign wire86 = (!wire74);
  assign wire87 = (reg80[(4'h9):(3'h4)] <= $unsigned({reg81[(4'hb):(3'h5)],
                      (^~(wire84 ? wire74 : (8'hae)))}));
  assign wire88 = ($unsigned(reg77[(5'h12):(5'h12)]) ?
                      $unsigned(reg79[(1'h1):(1'h1)]) : wire87);
  assign wire89 = $unsigned({({reg83[(2'h2):(1'h1)]} ~^ $signed($signed((8'hbc)))),
                      wire73});
  assign wire90 = {((|reg77) + $unsigned(((reg78 ?
                          (7'h41) : (8'hac)) ~^ wire87)))};
  assign wire91 = ($unsigned($unsigned(wire89[(3'h5):(3'h4)])) ?
                      wire71 : wire73[(1'h0):(1'h0)]);
  assign wire92 = ($unsigned($signed((|(+reg82)))) * wire84[(3'h6):(3'h5)]);
  assign wire93 = reg81[(3'h5):(1'h0)];
endmodule
