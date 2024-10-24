module top
#(parameter param73 = {(((((8'ha5) != (8'h9c)) ^~ ((8'hb5) ? (8'hb0) : (8'hb1))) ? {((8'h9d) ^~ (8'hb1))} : (((8'hb8) | (8'hba)) == ((8'ha4) < (8'h9f)))) ? (^(~&{(8'hac), (8'hbb)})) : ({((8'haf) ? (8'hab) : (8'hb4)), (!(7'h42))} * (((8'hb9) ? (8'hb5) : (8'hab)) ? (~|(8'hbf)) : ((7'h44) ? (8'hbb) : (8'hbf)))))}, 
parameter param74 = {param73})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h388):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg28,
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
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire4 = $unsigned(wire2);
  assign wire5 = $unsigned($unsigned($signed((&(wire2 ? wire2 : wire2)))));
  assign wire6 = $unsigned($signed($signed(((wire5 >>> wire2) <= $signed((8'hb9))))));
  assign wire7 = (($signed($unsigned(wire0)) ?
                         (~wire1) : ((wire6 || wire1[(1'h0):(1'h0)]) ?
                             ((~&wire0) - ((8'hb8) ? wire0 : wire1)) : wire5)) ?
                     (8'h9c) : (~|((~^$unsigned(wire2)) ?
                         $signed((8'h9f)) : ((wire2 | wire3) ?
                             (8'ha7) : wire4))));
  assign wire8 = ($signed(wire1) ?
                     (wire1 ?
                         wire4[(2'h3):(1'h0)] : wire6) : (wire0[(4'h9):(1'h1)] ?
                         ((wire6 - $signed(wire1)) ?
                             (((8'ha0) ? wire7 : wire2) ?
                                 $signed(wire0) : wire1) : wire7[(4'h8):(3'h5)]) : (~$signed(wire4))));
  assign wire9 = $signed($unsigned({wire2[(3'h6):(2'h2)],
                     ({wire2} || (wire8 >= wire0))}));
  assign wire10 = {((wire6 ?
                          (wire9[(2'h3):(2'h3)] >> (wire0 ?
                              wire4 : wire7)) : wire7) >= ($signed(wire7[(3'h4):(1'h1)]) && wire6)),
                      wire4[(4'he):(3'h4)]};
  assign wire11 = (+(~&$unsigned(((wire7 + wire3) ?
                      wire2 : (wire2 ? wire8 : wire8)))));
  assign wire12 = wire4[(3'h6):(1'h1)];
  assign wire13 = $unsigned(((&wire6[(1'h1):(1'h1)]) ?
                      {$unsigned(wire7[(1'h0):(1'h0)])} : ((^wire11) || wire9[(3'h4):(2'h3)])));
  assign wire14 = ((!$unsigned($unsigned((wire4 ? wire2 : wire1)))) ?
                      {(($signed(wire8) ? ((8'ha2) && (8'h9e)) : wire1) ?
                              $signed($signed(wire1)) : $signed(wire2)),
                          $signed(wire13[(4'h8):(2'h2)])} : (7'h43));
  always
    @(posedge clk) begin
      reg15 <= wire2;
      reg16 <= wire6;
      reg17 <= $signed($unsigned(($signed((^~wire9)) != $signed((reg16 ?
          (8'ha1) : wire4)))));
      reg18 <= ((!$unsigned((wire9[(2'h3):(1'h0)] && $unsigned(wire4)))) ?
          (($signed($signed(wire3)) | $unsigned($unsigned(wire8))) >= (reg17 ?
              (8'ha3) : $signed((reg16 <= wire10)))) : ($signed($signed(wire2)) ?
              $unsigned(wire0[(3'h4):(2'h2)]) : $unsigned((wire7[(3'h4):(3'h4)] ?
                  (|wire1) : {reg17}))));
      if (reg17)
        begin
          reg19 <= (((|((wire3 * wire2) || (wire10 ?
                  wire13 : wire14))) * $signed(($unsigned(wire0) ?
                  wire10[(2'h2):(1'h0)] : (7'h42)))) ?
              $signed({reg15[(2'h2):(1'h1)]}) : $unsigned({(8'hbc),
                  $unsigned((reg18 < wire13))}));
          if ((wire13 << reg15))
            begin
              reg20 <= wire14;
              reg21 <= reg19[(4'h9):(1'h1)];
              reg22 <= $signed((|{$unsigned((wire7 < wire13)),
                  $unsigned((wire1 ? (8'hbf) : reg20))}));
            end
          else
            begin
              reg20 <= $unsigned(($signed(wire8[(4'h9):(4'h9)]) ?
                  {$signed({(8'hb7)}), wire3} : $unsigned(wire1)));
              reg21 <= $signed($unsigned($unsigned($unsigned({wire11}))));
            end
        end
      else
        begin
          reg19 <= wire10[(3'h7):(2'h3)];
          reg20 <= $unsigned(wire5);
          reg21 <= reg22[(5'h13):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      if (wire2)
        begin
          if ($signed(({wire6[(1'h1):(1'h0)]} ^~ ($signed({wire0,
              reg15}) != ($unsigned(wire7) ~^ reg21[(4'ha):(2'h3)])))))
            begin
              reg23 <= reg15;
            end
          else
            begin
              reg23 <= $unsigned((8'h9c));
            end
          reg24 <= ((~&(((~^reg19) ? (wire8 ^ (8'h9c)) : wire7) ?
                  reg16[(1'h0):(1'h0)] : (8'hb0))) ?
              (~&(8'haf)) : $unsigned((wire14[(1'h1):(1'h0)] ^~ (8'hb6))));
        end
      else
        begin
          reg23 <= ($unsigned(($signed((wire7 ?
              reg15 : wire7)) >= wire5[(1'h0):(1'h0)])) >= wire11);
          reg24 <= reg15;
        end
      if ((((({(8'hb4), (8'hac)} + $signed(reg21)) ?
              (8'haa) : (^~wire3)) - (wire0 ?
              ((reg23 << reg23) ?
                  $signed((8'ha8)) : $unsigned((7'h43))) : ((+wire12) & $signed(reg19)))) ?
          $unsigned(wire8) : ((^((|reg22) <= reg15)) <= ($unsigned({reg16}) ?
              reg21 : $unsigned(wire12[(1'h1):(1'h0)])))))
        begin
          reg25 <= $signed(($signed($unsigned((+reg24))) < $signed((!$signed(wire14)))));
          reg26 <= $unsigned((7'h40));
          reg27 <= reg21[(3'h4):(2'h3)];
        end
      else
        begin
          reg25 <= wire0;
        end
      reg28 <= wire5[(4'hf):(4'he)];
    end
  assign wire29 = $unsigned((~(8'hb7)));
  assign wire30 = wire12;
  assign wire31 = ($signed(wire1[(3'h7):(1'h1)]) & reg18[(3'h4):(3'h4)]);
  assign wire32 = wire9[(1'h1):(1'h1)];
  assign wire33 = $unsigned(wire4[(3'h6):(2'h2)]);
  assign wire34 = (~&(reg27 >= reg15));
  always
    @(posedge clk) begin
      reg35 <= wire2[(4'h8):(4'h8)];
      if ($unsigned((!{{$unsigned(reg20), {(8'hbd), reg16}}})))
        begin
          reg36 <= wire5;
          if (wire0[(4'hc):(3'h6)])
            begin
              reg37 <= (~$unsigned((($unsigned(wire11) ?
                  (~^reg27) : {wire29, wire8}) + ($unsigned(wire6) ?
                  reg36[(3'h5):(3'h5)] : wire34))));
              reg38 <= wire31;
              reg39 <= wire14;
              reg40 <= (+{{wire10[(4'hd):(2'h3)]}});
            end
          else
            begin
              reg37 <= $signed(reg37[(2'h2):(2'h2)]);
              reg38 <= (|wire4);
              reg39 <= ({reg20[(4'hc):(2'h2)]} <= ({{$unsigned(reg17),
                      (wire34 ~^ (8'hb6))},
                  wire11} ^~ {$signed({wire29, wire11})}));
              reg40 <= (~reg38[(2'h2):(1'h1)]);
              reg41 <= (reg21[(3'h6):(1'h0)] <= $unsigned(reg15));
            end
          if ((((((~^wire14) ?
                      (reg41 ? reg17 : wire9) : (reg41 ? wire2 : (8'haa))) ?
                  wire5 : (^{reg38, wire29})) ?
              $signed($signed((^~(8'hb4)))) : (+(wire32 > $signed(reg20)))) + ($unsigned($unsigned(reg36[(1'h1):(1'h0)])) ^~ $signed((wire5 - $signed(wire29))))))
            begin
              reg42 <= (8'ha6);
              reg43 <= wire30[(3'h6):(2'h2)];
            end
          else
            begin
              reg42 <= $signed((reg24 != {{reg22}}));
              reg43 <= (^~reg17[(3'h6):(1'h0)]);
              reg44 <= wire2;
            end
          if ((reg26[(5'h13):(2'h3)] ?
              $signed(($signed((+(8'ha8))) ?
                  (8'ha3) : ($unsigned(wire11) ?
                      $unsigned(wire3) : $unsigned((8'h9d))))) : reg22[(4'hb):(3'h7)]))
            begin
              reg45 <= {(!$unsigned(($unsigned(wire7) ?
                      reg24 : $signed(wire1))))};
            end
          else
            begin
              reg45 <= {wire0[(1'h0):(1'h0)]};
              reg46 <= reg20[(2'h3):(1'h0)];
            end
        end
      else
        begin
          if ((((~^$signed((reg16 ? reg25 : wire11))) ?
                  wire0 : ((&(reg22 ? wire0 : reg25)) ?
                      wire6[(3'h4):(1'h1)] : $signed($unsigned(wire9)))) ?
              wire13[(4'hb):(2'h2)] : ({$unsigned($signed(wire5)),
                      {$unsigned((8'ha4))}} ?
                  $unsigned(reg19[(2'h2):(2'h2)]) : (&(~(wire4 ?
                      wire11 : wire7))))))
            begin
              reg36 <= ($signed(reg36) + $signed($signed($signed($unsigned(wire30)))));
            end
          else
            begin
              reg36 <= $unsigned(((8'ha6) >> (~|$unsigned(reg24[(4'hb):(3'h6)]))));
              reg37 <= (reg35[(4'ha):(3'h5)] && $signed(wire2[(4'h8):(4'h8)]));
            end
          reg38 <= wire12;
          reg39 <= reg42;
          reg40 <= $signed(wire8);
        end
    end
  assign wire47 = (~^(wire6 ? wire5 : $signed(({reg28} ^ {wire29}))));
  assign wire48 = $signed($signed(wire6));
  always
    @(posedge clk) begin
      if ($signed($signed((reg19 ?
          (((8'had) ? reg39 : reg41) != $unsigned(reg43)) : {$signed(wire29),
              (reg40 ? wire47 : wire8)}))))
        begin
          reg49 <= {(^($signed((^(8'haf))) ?
                  (&$unsigned((8'hb5))) : (reg36[(2'h3):(1'h1)] ?
                      $unsigned(wire33) : $unsigned(reg18)))),
              {(|$signed((wire31 ? wire29 : reg37)))}};
          if (($signed(wire29[(1'h1):(1'h1)]) <<< $unsigned(((wire48 ?
              (reg41 & reg27) : $signed(reg23)) * wire30))))
            begin
              reg50 <= (^($unsigned(($signed(reg45) ?
                  $unsigned(reg20) : (-wire34))) < (reg15 ^ {$unsigned(wire4)})));
              reg51 <= reg15;
              reg52 <= $signed(reg36);
            end
          else
            begin
              reg50 <= (($unsigned(wire32) ?
                  wire30[(3'h4):(2'h3)] : $signed((&(reg38 <<< reg19)))) <<< $signed(({(wire11 && wire32),
                  wire33} != wire1)));
              reg51 <= (8'hbb);
            end
          reg53 <= (8'hab);
        end
      else
        begin
          if ((^((+$unsigned($signed(reg37))) ?
              wire4[(5'h10):(3'h4)] : $signed(({wire32, (8'ha2)} ?
                  $unsigned((8'hbe)) : (wire13 | reg53))))))
            begin
              reg49 <= wire4;
              reg50 <= (!reg53);
              reg51 <= (-$signed(reg40));
            end
          else
            begin
              reg49 <= reg16[(1'h0):(1'h0)];
              reg50 <= $unsigned(reg39);
              reg51 <= $unsigned($unsigned(reg49));
              reg52 <= ((wire1[(2'h2):(2'h2)] ? reg23 : wire12[(4'h8):(2'h3)]) ?
                  $unsigned({$unsigned(wire2[(2'h2):(1'h1)]),
                      $signed(wire7)}) : reg24[(4'hb):(3'h7)]);
              reg53 <= (((wire10[(4'hb):(4'ha)] <<< reg43[(2'h3):(2'h2)]) - wire1[(2'h3):(2'h2)]) ?
                  (~|(^~(^~(wire0 ? reg42 : wire13)))) : (reg45[(1'h0):(1'h0)] ?
                      (8'hab) : (|(wire6[(2'h3):(1'h0)] ?
                          wire1 : (reg21 && reg43)))));
            end
          if (({{(wire30[(1'h1):(1'h0)] == $signed(reg18)),
                  $unsigned($signed(wire13))}} >= (-$unsigned(reg41))))
            begin
              reg54 <= wire5;
            end
          else
            begin
              reg54 <= $unsigned($signed($unsigned($signed($unsigned(reg15)))));
              reg55 <= (($unsigned(reg52) > (reg18[(4'h9):(2'h3)] ?
                      $signed((wire29 ?
                          wire5 : (8'hb9))) : $unsigned(reg26[(2'h2):(1'h0)]))) ?
                  ($unsigned(((wire2 ? reg28 : wire33) ?
                      (8'hae) : wire10[(1'h0):(1'h0)])) << (wire14 ?
                      $unsigned(wire29[(4'ha):(4'h8)]) : {$unsigned(wire4)})) : $unsigned(wire33[(4'hf):(4'hb)]));
              reg56 <= $signed(wire32[(3'h7):(1'h1)]);
              reg57 <= $unsigned(reg45[(1'h0):(1'h0)]);
            end
          if (reg54[(4'ha):(3'h7)])
            begin
              reg58 <= ((reg25[(2'h3):(2'h2)] ?
                      $unsigned(reg44) : reg23[(3'h7):(3'h6)]) ?
                  $signed(reg25[(5'h11):(5'h10)]) : reg44[(4'h8):(1'h1)]);
              reg59 <= (~|((~(reg23[(1'h1):(1'h1)] == (wire0 ?
                  (8'hbc) : reg43))) >>> {({reg51} ~^ $unsigned(reg43)),
                  ((|(8'h9d)) ^~ reg41[(3'h5):(1'h1)])}));
              reg60 <= wire34[(4'hb):(2'h3)];
              reg61 <= {wire6[(1'h1):(1'h0)]};
            end
          else
            begin
              reg58 <= (~&$unsigned(($signed($unsigned(reg55)) >>> reg15[(1'h0):(1'h0)])));
              reg59 <= $unsigned((+(!reg23)));
              reg60 <= reg45[(2'h3):(1'h0)];
            end
          reg62 <= ((^$unsigned($unsigned((-wire4)))) ?
              (~&wire8[(3'h6):(3'h5)]) : (~wire2));
        end
      reg63 <= reg49[(3'h7):(1'h1)];
      if (wire1[(1'h0):(1'h0)])
        begin
          reg64 <= $unsigned(((~((reg52 ? reg20 : wire30) <<< reg58)) ?
              (reg15[(3'h6):(2'h2)] ?
                  {reg27} : (reg22[(5'h14):(5'h14)] - (~&(8'hb3)))) : $signed(reg49[(2'h3):(2'h3)])));
          reg65 <= ($signed($unsigned(((|(8'ha9)) + (reg22 ? reg56 : reg57)))) ?
              ($unsigned((~^reg18)) || (((reg21 ~^ reg61) ?
                      ((8'haf) >= wire6) : (wire12 ? reg57 : reg36)) ?
                  (8'hab) : (!reg45))) : $signed($signed((((8'hb9) ^~ reg18) + $unsigned(reg54)))));
          reg66 <= (((wire31 ^~ (^~reg26[(4'ha):(3'h5)])) + (&((reg51 > wire29) ?
                  $unsigned(wire30) : reg52[(3'h5):(1'h0)]))) ?
              $unsigned((~&{$signed((7'h44))})) : (reg43 ^ (-$signed((wire1 ?
                  reg51 : reg46)))));
          if ((wire29[(4'h9):(4'h8)] & wire47[(1'h0):(1'h0)]))
            begin
              reg67 <= reg50;
              reg68 <= ($unsigned($unsigned((reg45 ?
                  (8'ha3) : $signed(reg55)))) < wire12[(4'h9):(3'h5)]);
              reg69 <= $signed((($unsigned(reg51[(2'h3):(1'h1)]) == reg50[(5'h13):(5'h10)]) ?
                  (^~($unsigned(reg62) ?
                      (reg54 ?
                          reg55 : reg42) : wire3[(1'h0):(1'h0)])) : $unsigned(reg49)));
            end
          else
            begin
              reg67 <= reg17[(4'h8):(2'h3)];
              reg68 <= reg57[(2'h3):(1'h0)];
              reg69 <= reg37;
              reg70 <= ({(|reg57)} ~^ $unsigned((({reg53} ?
                  reg36 : (~^reg56)) ^ $unsigned((wire2 < reg18)))));
              reg71 <= $signed($unsigned($signed($unsigned((reg63 ?
                  wire5 : (7'h43))))));
            end
          reg72 <= ($signed((($signed(reg45) + (&wire12)) ?
                  $unsigned($unsigned((8'ha8))) : (&$unsigned(reg40)))) ?
              (!(reg40[(5'h10):(2'h2)] > (+$signed((8'haa))))) : reg49[(4'ha):(3'h6)]);
        end
      else
        begin
          reg64 <= (reg44[(3'h4):(1'h1)] >= reg56);
          reg65 <= (-{reg22});
          reg66 <= $signed(wire6[(3'h4):(1'h0)]);
          reg67 <= $unsigned($unsigned($unsigned(reg55)));
          reg68 <= ((!wire10[(3'h6):(2'h3)]) & $unsigned(((^{wire47,
              reg28}) && $signed(wire0[(3'h4):(1'h1)]))));
        end
    end
endmodule
