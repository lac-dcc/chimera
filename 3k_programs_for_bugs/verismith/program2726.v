module top
#(parameter param57 = {((~(|((8'hb1) <<< (8'ha5)))) << ({((8'ha4) ? (8'hb6) : (8'ha9))} | (8'h9f)))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire35,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = ({$unsigned({$signed(wire3)})} ?
                     ($signed((&wire2)) | wire2) : $unsigned((+{wire3[(3'h4):(1'h1)]})));
  assign wire7 = $signed({$signed((wire3[(1'h1):(1'h1)] - (~(8'h9f)))),
                     wire2[(2'h2):(1'h1)]});
  assign wire8 = $signed(wire6[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg9 <= wire3[(3'h6):(3'h6)];
    end
  assign wire10 = (wire0[(4'ha):(4'h8)] ?
                      $signed(($unsigned($unsigned((8'hab))) ?
                          wire8 : wire5)) : ($signed($signed($signed(wire0))) ?
                          (8'h9e) : {$signed($signed(reg9)),
                              $unsigned((!wire5))}));
  assign wire11 = ((+wire6[(3'h4):(1'h1)]) < wire8[(3'h7):(3'h4)]);
  assign wire12 = wire10[(2'h2):(1'h1)];
  assign wire13 = (~&(wire2[(1'h1):(1'h1)] && (-wire1[(4'ha):(3'h4)])));
  assign wire14 = wire11;
  assign wire15 = wire13[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg16 <= (&wire5[(4'h8):(2'h2)]);
      if ($signed((wire0 ? wire11[(4'h8):(1'h1)] : reg16)))
        begin
          reg17 <= wire7[(1'h0):(1'h0)];
          reg18 <= $signed($signed(wire12));
          reg19 <= (!($signed((^~(reg9 & wire3))) ?
              {wire2[(2'h2):(2'h2)]} : $signed(({wire1} ?
                  $signed((8'hbf)) : {(7'h44)}))));
          reg20 <= {((wire11 ?
                  {wire4[(1'h1):(1'h1)]} : $unsigned((+reg16))) >>> ((8'hb9) ?
                  wire4[(2'h3):(2'h2)] : (&(8'ha1)))),
              ({wire10,
                  ((wire6 ? wire1 : reg18) ?
                      $unsigned(wire1) : (wire0 > wire13))} >> (+(wire6[(1'h1):(1'h1)] * (~|wire5))))};
          if (wire0)
            begin
              reg21 <= {(({(~&wire4),
                      ((8'ha1) ?
                          (8'hbe) : wire14)} * wire6[(2'h3):(2'h3)]) - $unsigned((+wire6))),
                  $signed((|(7'h41)))};
              reg22 <= wire5;
              reg23 <= ((wire15[(2'h2):(2'h2)] ?
                      $signed(wire15[(3'h4):(2'h3)]) : (~wire8[(1'h0):(1'h0)])) ?
                  reg17[(3'h7):(2'h3)] : ($unsigned((^$signed((8'had)))) ^~ ($signed(wire5) ?
                      wire11[(3'h7):(3'h7)] : wire2)));
              reg24 <= reg9;
              reg25 <= $unsigned(wire2[(3'h4):(2'h3)]);
            end
          else
            begin
              reg21 <= reg16[(3'h6):(3'h4)];
              reg22 <= (($signed($signed((wire4 ^ (8'ha4)))) ?
                  (~&wire15[(2'h2):(1'h1)]) : (~|(reg19[(3'h5):(2'h2)] + $unsigned(wire5)))) == {$unsigned($unsigned(wire12[(1'h1):(1'h0)]))});
            end
        end
      else
        begin
          reg17 <= reg19;
          if (((8'ha6) >= (wire4 >>> wire3[(3'h6):(1'h1)])))
            begin
              reg18 <= $signed((+(wire10[(4'h8):(3'h6)] >> (~^(reg20 - reg9)))));
              reg19 <= $signed((|(((!reg19) ?
                  $signed(reg23) : $unsigned(wire7)) <= wire14)));
            end
          else
            begin
              reg18 <= reg24;
            end
          reg20 <= $unsigned(wire8);
          reg21 <= $unsigned(wire4[(2'h3):(1'h0)]);
        end
      reg26 <= {reg9, {$unsigned(($signed(reg24) ? wire15 : $signed(reg18)))}};
    end
  always
    @(posedge clk) begin
      reg27 <= ($signed((~&$signed(((8'ha7) - reg9)))) ?
          $signed(($unsigned((wire2 >> wire6)) ?
              (~|$signed(wire7)) : reg16[(1'h1):(1'h0)])) : $signed(((wire5[(2'h3):(1'h1)] ?
              (~reg17) : ((8'hab) ? reg19 : wire11)) * (-wire10))));
      if ((((({reg22, wire1} * ((8'h9c) ?
          wire1 : wire11)) ^ $signed(wire15[(3'h4):(3'h4)])) != {$unsigned(wire6)}) >> (wire2 || {(^((7'h43) ^ reg25))})))
        begin
          reg28 <= $signed(wire4);
          if (reg20[(1'h1):(1'h0)])
            begin
              reg29 <= (({({reg9} && $signed(wire2)),
                  ($unsigned(reg16) ?
                      ((7'h40) ?
                          reg28 : (8'ha8)) : (^~wire13))} - ({$signed(reg20),
                      $unsigned(wire0)} ?
                  $signed($unsigned(reg26)) : (~^$unsigned(reg25)))) >> $signed((~|((reg28 ?
                  reg24 : (7'h40)) + reg19[(3'h7):(2'h2)]))));
              reg30 <= ((^~(^((reg21 == (8'hab)) * (reg21 ?
                  wire8 : (8'hb4))))) ^ $signed(wire12));
              reg31 <= (^~(($signed(((8'hb6) & reg25)) >= {(~|wire14),
                      $signed((8'hbc))}) ?
                  (8'h9c) : $signed($unsigned(((8'hb5) ? reg29 : wire4)))));
              reg32 <= $signed((&$signed((wire3 ? reg30 : (reg16 >= wire15)))));
            end
          else
            begin
              reg29 <= reg32;
              reg30 <= reg30[(5'h11):(4'hd)];
            end
        end
      else
        begin
          reg28 <= wire3;
          if (((wire0[(2'h2):(1'h0)] ~^ (((reg16 ? reg19 : (7'h40)) ?
                  (reg31 ? wire13 : wire8) : $unsigned(wire10)) || reg9)) ?
              (^(|wire11[(1'h0):(1'h0)])) : wire8[(4'ha):(4'h8)]))
            begin
              reg29 <= ($signed($unsigned((~^$signed((8'ha1))))) >>> $signed(wire10));
              reg30 <= wire2;
              reg31 <= reg23[(4'hc):(4'ha)];
            end
          else
            begin
              reg29 <= wire7;
            end
        end
      reg33 <= $unsigned(($signed(reg23) && reg30[(4'ha):(4'h8)]));
      reg34 <= $unsigned(($unsigned((reg29 - (reg20 >> reg31))) > (8'ha6)));
    end
  assign wire35 = (($unsigned((~^$signed(wire15))) ?
                          {($signed(wire5) ? reg20 : $signed(wire4)),
                              (^$unsigned(reg18))} : reg24) ?
                      $signed((~&wire13[(3'h7):(2'h2)])) : ($unsigned($signed(reg30[(1'h1):(1'h0)])) ?
                          $unsigned(wire4) : $unsigned(((reg20 & wire13) ?
                              (~^wire8) : reg23[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg36 <= $unsigned(($signed((|((8'haf) ? (8'hbe) : reg31))) ?
          (wire0 ? reg19[(3'h6):(2'h3)] : reg30) : reg29));
      reg37 <= (~|($signed(((reg29 >= wire8) ? (~&wire5) : reg27)) ?
          (&((wire2 < (8'haa)) ?
              wire6[(3'h4):(1'h0)] : (~(8'hb9)))) : ($signed((+reg29)) ?
              ({wire3, (8'hbc)} ?
                  (wire12 <<< reg19) : wire12) : {$signed((8'hab)), wire4})));
      reg38 <= ($signed(({$unsigned(reg18), (reg9 ? reg25 : reg28)} ?
              reg17[(1'h0):(1'h0)] : (~^$signed(reg29)))) ?
          ({$signed($unsigned(reg18)), (8'hb2)} ?
              ($signed(reg20[(3'h5):(1'h1)]) ?
                  reg19 : (+$unsigned((7'h43)))) : $unsigned(wire6[(1'h0):(1'h0)])) : {$signed({$unsigned(reg28)})});
      reg39 <= ((!reg25[(3'h7):(3'h5)]) == $signed((($unsigned((8'hb0)) >>> (~^wire3)) ?
          reg19[(4'h8):(2'h3)] : {(8'ha1)})));
      if ((($unsigned({(wire35 <= reg18)}) ?
              (reg17[(4'h9):(1'h1)] >= (reg28 >>> (&reg38))) : {(^reg22[(2'h2):(2'h2)])}) ?
          (&$unsigned(((-reg19) ?
              reg37[(3'h5):(2'h3)] : (~&reg32)))) : $signed(reg22)))
        begin
          if ((($unsigned({(wire12 ? reg34 : wire35)}) ?
              reg18[(1'h0):(1'h0)] : wire10[(3'h4):(3'h4)]) <<< wire10[(2'h2):(1'h1)]))
            begin
              reg40 <= (~|({reg9[(3'h7):(3'h5)], reg38[(2'h3):(2'h2)]} ?
                  ($signed((wire1 == wire0)) ^~ (8'hbd)) : reg34));
            end
          else
            begin
              reg40 <= wire13;
              reg41 <= wire8;
              reg42 <= reg30[(5'h11):(4'ha)];
              reg43 <= $signed((^~$signed(((wire11 << reg23) ?
                  $signed(wire35) : (reg40 ? reg33 : reg36)))));
              reg44 <= ((~|(($signed(wire12) >> $signed(reg29)) ?
                      (+reg43[(2'h3):(2'h3)]) : $signed((!reg26)))) ?
                  reg26 : wire6);
            end
          if ($signed((((reg21[(2'h3):(2'h2)] ?
                      (reg38 * (8'hbc)) : $signed((8'ha2))) ?
                  wire2 : wire5) ?
              reg41 : reg9)))
            begin
              reg45 <= $unsigned(reg37);
              reg46 <= $signed(($unsigned(reg42) >>> {$unsigned({wire5})}));
            end
          else
            begin
              reg45 <= $unsigned((reg28 >> reg18));
              reg46 <= {(^~wire10[(4'h9):(3'h6)]), reg42[(4'h8):(3'h6)]};
              reg47 <= (reg43[(3'h5):(3'h4)] ?
                  ({((-(8'had)) ? (reg36 ? reg31 : reg20) : reg37)} ?
                      wire5 : ((|$unsigned(reg20)) ^~ ($unsigned(reg45) ?
                          (wire8 == (7'h42)) : reg25[(4'h9):(2'h2)]))) : reg23);
              reg48 <= (reg40[(2'h3):(1'h1)] ?
                  reg28[(2'h2):(2'h2)] : {($unsigned((wire2 ?
                              reg42 : (8'ha8))) ?
                          wire8[(4'hc):(3'h4)] : reg29),
                      ($signed({wire8}) ? reg38 : reg29[(3'h4):(3'h4)])});
              reg49 <= $signed(($signed((8'had)) ?
                  (~&($signed(reg48) << $unsigned(reg29))) : wire12[(4'hb):(2'h2)]));
            end
          reg50 <= $signed({$unsigned(reg36)});
          if ($signed(wire15[(2'h3):(1'h1)]))
            begin
              reg51 <= (reg41 ? wire10[(4'hb):(2'h2)] : reg48[(2'h3):(2'h2)]);
              reg52 <= reg39;
              reg53 <= $unsigned({wire10[(1'h0):(1'h0)],
                  (&(~$unsigned(wire12)))});
              reg54 <= reg21[(1'h1):(1'h1)];
              reg55 <= ((!reg54[(2'h2):(1'h0)]) << reg44[(3'h6):(1'h0)]);
            end
          else
            begin
              reg51 <= (~reg40[(3'h4):(1'h0)]);
              reg52 <= reg54;
            end
          reg56 <= (reg48[(3'h4):(2'h2)] * reg26[(2'h3):(1'h0)]);
        end
      else
        begin
          reg40 <= (+$signed($signed(reg27)));
        end
    end
endmodule
