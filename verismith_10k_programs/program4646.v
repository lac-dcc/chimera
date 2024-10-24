module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire66;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire5,
                 wire6,
                 wire7,
                 wire66,
                 (1'h0)};
  assign wire5 = ($unsigned($signed($unsigned(wire0[(2'h2):(2'h2)]))) ?
                     ({(-$unsigned(wire2)),
                             {wire4[(3'h4):(1'h1)], (wire4 >> wire3)}} ?
                         $unsigned((wire4 & $unsigned(wire2))) : wire1[(3'h6):(3'h5)]) : $unsigned((+$signed(wire4[(3'h4):(1'h0)]))));
  assign wire6 = (8'ha7);
  assign wire7 = (8'hbe);
  module8 #() modinst67 (.wire11(wire2), .y(wire66), .clk(clk), .wire12(wire4), .wire13(wire7), .wire10(wire0), .wire9(wire6));
  assign wire68 = wire7;
  assign wire69 = (&$unsigned($unsigned({wire4[(1'h0):(1'h0)],
                      $unsigned(wire1)})));
  assign wire70 = {(wire69 | (({wire3} ? $unsigned(wire69) : (wire2 >= wire5)) ?
                          wire2[(3'h4):(1'h0)] : ((wire66 ?
                              wire6 : wire0) + (wire4 ^~ wire69))))};
  assign wire71 = (~|$signed(wire2));
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire41,
                 wire40,
                 wire19,
                 wire16,
                 wire15,
                 wire14,
                 reg65,
                 reg64,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire14 = (((($unsigned(wire10) ?
                          (wire12 ^~ wire9) : (~wire11)) && ($unsigned(wire12) <<< $unsigned(wire9))) ?
                      $unsigned(({wire9} <<< (^wire12))) : $unsigned((((8'h9d) << wire9) ^~ $unsigned(wire10)))) >> wire10[(5'h13):(5'h13)]);
  assign wire15 = $signed((!($signed($unsigned(wire13)) - (^(^~(8'hb6))))));
  assign wire16 = (wire13[(2'h2):(1'h0)] ?
                      $unsigned(wire11) : $unsigned((&((+(7'h42)) ?
                          (~&wire14) : wire11))));
  always
    @(posedge clk) begin
      reg17 <= {$signed(({(wire11 ? wire16 : wire16), (~|wire11)} ?
              ((wire12 ? wire12 : (8'h9c)) ?
                  (wire11 | wire9) : (+wire13)) : {$signed(wire12)}))};
      reg18 <= $signed({(~^$unsigned(wire11)),
          ({wire11} ~^ wire13[(1'h0):(1'h0)])});
    end
  assign wire19 = (~|$unsigned(($signed({wire12, wire14}) ?
                      (~|(wire14 ? wire10 : wire12)) : reg17)));
  always
    @(posedge clk) begin
      if ((&$unsigned((&wire19))))
        begin
          if ($signed(((+wire12[(1'h1):(1'h0)]) ?
              $signed($signed(wire9)) : (wire16 & ((wire14 ? wire9 : wire13) ?
                  $signed(wire13) : wire10[(2'h3):(1'h1)])))))
            begin
              reg20 <= (wire14[(3'h4):(1'h1)] ?
                  (wire14 ?
                      ($unsigned({(8'hb6)}) ?
                          wire13[(1'h1):(1'h1)] : ({wire16} ~^ ((8'haa) ?
                              wire14 : reg18))) : (($signed(wire12) && $unsigned((8'ha5))) ?
                          $unsigned(wire15) : wire14[(3'h6):(1'h1)])) : (8'hb8));
              reg21 <= (reg20[(3'h6):(1'h0)] ?
                  $unsigned($signed((&(wire19 ?
                      wire9 : wire16)))) : ($unsigned(wire11[(3'h7):(3'h6)]) - reg20[(3'h7):(3'h6)]));
              reg22 <= ((8'hb7) ?
                  wire15[(4'h9):(4'h9)] : (reg18[(3'h7):(3'h4)] ?
                      $unsigned((wire13[(2'h2):(1'h0)] ?
                          $unsigned(wire14) : $unsigned(wire9))) : $signed({(&wire13)})));
              reg23 <= {wire11[(4'he):(4'ha)]};
              reg24 <= ({wire15[(3'h5):(3'h4)],
                  reg17[(4'h8):(3'h6)]} < wire12[(1'h0):(1'h0)]);
            end
          else
            begin
              reg20 <= $unsigned($unsigned($unsigned((8'hb8))));
              reg21 <= wire13[(1'h1):(1'h0)];
              reg22 <= (~&$signed((^$signed((!wire14)))));
              reg23 <= (((~|$unsigned($signed(reg20))) ?
                  $unsigned((wire9[(5'h10):(4'hb)] < (wire9 >>> wire9))) : {wire15[(3'h7):(3'h4)]}) ~^ wire13);
              reg24 <= (wire14 == $signed((^reg17[(3'h4):(1'h0)])));
            end
          reg25 <= {(8'hae)};
          reg26 <= (-(reg24[(3'h5):(1'h1)] && $unsigned((~&(wire13 ?
              wire10 : wire15)))));
          reg27 <= reg26;
          reg28 <= reg23[(4'ha):(2'h2)];
        end
      else
        begin
          reg20 <= (^$signed(((&{wire10, reg17}) ?
              reg22[(2'h2):(1'h1)] : ($unsigned((8'hb0)) ?
                  {wire11, wire11} : (wire16 ? (8'hbd) : wire10)))));
          if (((reg27 >= ({(wire11 < (8'h9f)), wire9[(2'h2):(1'h0)]} ?
              (-(!reg28)) : reg17[(2'h3):(1'h1)])) >> ($unsigned(({(8'hb6),
                      reg28} ?
                  (wire19 * reg25) : $signed((8'hb7)))) ?
              (($signed(wire10) || wire12) >>> $signed($signed(wire15))) : wire12[(1'h0):(1'h0)])))
            begin
              reg21 <= ((reg22[(4'h8):(4'h8)] ?
                  reg18 : ((!{wire16}) ?
                      $signed((-wire19)) : $signed((reg23 ?
                          wire16 : reg25)))) || (&$signed(reg25[(4'h9):(2'h2)])));
              reg22 <= ({wire10} <<< (^$signed(((reg28 == reg25) ?
                  $signed((8'hb9)) : $unsigned(reg23)))));
              reg23 <= $signed($signed(($signed(reg26[(2'h3):(2'h3)]) - reg20)));
              reg24 <= reg17[(1'h1):(1'h1)];
              reg25 <= reg24;
            end
          else
            begin
              reg21 <= reg20;
              reg22 <= $signed((!$unsigned(reg17[(2'h3):(1'h0)])));
            end
          if ({(reg21[(1'h1):(1'h1)] >> {{((8'h9e) != wire10)}, reg21})})
            begin
              reg26 <= (~&($signed($unsigned($unsigned(reg22))) <<< (((+wire19) <<< {reg18}) + $signed($unsigned(wire16)))));
              reg27 <= (-$signed($unsigned((^~{wire16}))));
            end
          else
            begin
              reg26 <= wire13;
              reg27 <= $signed((({(reg24 ?
                      wire14 : reg24)} >> {(|(7'h44))}) < ((~|reg22[(1'h1):(1'h0)]) * $unsigned($unsigned(reg20)))));
              reg28 <= $signed(($unsigned($signed((reg22 >> reg28))) ?
                  (-wire16) : reg28[(3'h7):(3'h4)]));
            end
        end
      reg29 <= (wire15 ?
          ($signed(wire11) > (+(((8'ha9) ?
              reg21 : wire16) & wire10[(2'h2):(1'h0)]))) : (^~{wire9}));
      if (reg24[(3'h7):(3'h6)])
        begin
          reg30 <= {$unsigned(reg17),
              $unsigned({((|(8'hae)) ? (~&wire9) : $unsigned(wire10))})};
          reg31 <= reg21;
          reg32 <= ((&reg24[(1'h1):(1'h0)]) ?
              ($unsigned(wire12) ?
                  ($signed((~&reg29)) ?
                      {$unsigned(reg29)} : wire19) : $unsigned(reg18)) : ($unsigned(wire15) ^ reg22[(3'h6):(1'h0)]));
          if ((({$signed((!wire19))} ?
                  wire13 : (reg29[(5'h11):(5'h11)] ^~ {reg26})) ?
              reg24 : (^(|$unsigned((8'hb6))))))
            begin
              reg33 <= $unsigned(((reg26 > reg17) ?
                  reg29 : reg28[(2'h2):(2'h2)]));
              reg34 <= $unsigned({($unsigned({reg27}) ^~ ($signed(reg27) << (reg30 >> wire13)))});
              reg35 <= $signed($unsigned($signed($unsigned($unsigned(reg29)))));
            end
          else
            begin
              reg33 <= ({wire13[(1'h0):(1'h0)],
                      ($signed(reg27) >>> $signed((reg32 < wire11)))} ?
                  ((wire9[(1'h1):(1'h1)] ?
                          (wire16 ?
                              wire16 : $unsigned(reg33)) : $signed((reg30 <<< reg34))) ?
                      reg30 : $signed((^~$signed(reg31)))) : {(~reg27[(5'h10):(1'h0)])});
              reg34 <= ($unsigned(((((8'hbb) ? reg28 : reg27) ?
                      (wire14 ? wire9 : (8'hb2)) : (&reg20)) > (8'hba))) ?
                  $unsigned(($unsigned((&reg23)) >= $unsigned((reg29 >= (8'hb4))))) : wire16[(2'h2):(2'h2)]);
              reg35 <= ((~wire16[(4'he):(2'h2)]) ?
                  (($signed((wire19 < reg21)) - $signed({(8'hbf)})) ?
                      $signed($signed($unsigned(reg32))) : wire16[(4'hc):(4'hb)]) : (~&(8'h9d)));
              reg36 <= {($signed($unsigned($signed(reg26))) ?
                      $signed((&(&reg26))) : $signed((8'haa))),
                  (((reg33[(3'h6):(1'h0)] ^~ reg34) ?
                          ((reg29 ? reg17 : wire9) ?
                              (~(8'hbd)) : reg20) : {$signed(reg33),
                              $signed((8'hac))}) ?
                      $signed(reg31) : wire10[(4'hc):(4'hc)])};
              reg37 <= wire14;
            end
          if (wire15)
            begin
              reg38 <= (wire12[(2'h2):(1'h0)] ?
                  $unsigned(reg29) : (({$unsigned(wire19),
                      (~^reg30)} ^~ ((wire12 ? reg29 : reg23) ?
                      {reg36, reg35} : ((7'h42) ?
                          reg17 : (7'h40)))) ~^ $unsigned(((~^reg33) ?
                      (reg29 ? wire15 : reg37) : wire16[(5'h13):(1'h0)]))));
            end
          else
            begin
              reg38 <= (reg20[(4'h8):(1'h1)] ?
                  $unsigned({((wire19 > reg23) ?
                          $signed((8'hb3)) : reg21[(2'h2):(1'h1)]),
                      reg30}) : (-wire14[(4'hc):(1'h0)]));
              reg39 <= reg30;
            end
        end
      else
        begin
          if (reg22[(3'h4):(2'h2)])
            begin
              reg30 <= $unsigned(reg21);
            end
          else
            begin
              reg30 <= (^~((wire12[(1'h0):(1'h0)] ?
                  wire16 : $signed({(8'hbc), reg27})) < $unsigned(({reg32} ?
                  $signed(reg35) : $unsigned(wire19)))));
              reg31 <= ((~($signed({reg21, (7'h40)}) ?
                      $unsigned($signed(wire12)) : reg29[(4'he):(4'ha)])) ?
                  $unsigned(reg36[(3'h4):(1'h0)]) : wire10);
            end
          reg32 <= ($unsigned($signed($unsigned(reg32[(1'h0):(1'h0)]))) <<< (!((reg33 ^ (wire12 ?
              reg27 : reg27)) >> wire13)));
        end
    end
  assign wire40 = $signed((^~(8'ha2)));
  assign wire41 = wire11;
  module42 #() modinst59 (.wire46(wire14), .y(wire58), .wire45(wire41), .clk(clk), .wire44(reg33), .wire43(reg37));
  assign wire60 = reg34[(1'h1):(1'h0)];
  assign wire61 = (wire14 ?
                      $signed($signed((-{reg22}))) : (reg21[(1'h1):(1'h1)] != {((wire13 ?
                                  reg25 : wire19) ?
                              reg38[(4'h9):(3'h4)] : $signed(wire13))}));
  assign wire62 = (^wire11);
  assign wire63 = ($unsigned(($signed({reg20}) >= (^reg28))) ?
                      reg28[(1'h0):(1'h0)] : wire62);
  always
    @(posedge clk) begin
      reg64 <= {$unsigned((reg18[(3'h6):(1'h1)] ? reg27 : (8'hba)))};
      reg65 <= $unsigned(reg20[(2'h3):(2'h2)]);
    end
endmodule

module module42  (y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire [(3'h5):(1'h0)] wire44;
  input wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire49,
                 wire48,
                 wire47,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire47 = (wire45[(1'h0):(1'h0)] ?
                      (wire45 == $unsigned((|$unsigned(wire45)))) : wire44[(2'h3):(2'h3)]);
  assign wire48 = ((8'hb0) < wire47[(4'he):(4'he)]);
  assign wire49 = wire46;
  always
    @(posedge clk) begin
      if (($signed($unsigned((^~(8'hb7)))) ^~ (-(&wire45[(3'h4):(1'h0)]))))
        begin
          reg50 <= wire46;
          reg51 <= wire46;
          reg52 <= wire45;
        end
      else
        begin
          reg50 <= ($unsigned(wire45[(4'h8):(2'h2)]) << ($unsigned(wire45) ?
              $signed(wire47[(4'h9):(1'h1)]) : wire46[(3'h4):(2'h3)]));
          reg51 <= (8'ha4);
          reg52 <= (!($unsigned({(wire48 ? reg52 : wire47)}) ?
              $unsigned(wire45) : $signed(wire43)));
          reg53 <= {($signed({((8'hb5) >>> wire44)}) ?
                  $signed($unsigned(wire45[(1'h1):(1'h0)])) : ((8'hac) ?
                      reg50 : $unsigned(wire43[(2'h2):(1'h0)]))),
              $signed(reg50)};
          reg54 <= $signed(((wire49 ?
                  (|$signed(wire49)) : ({wire49} ?
                      wire48[(1'h1):(1'h1)] : $unsigned(reg52))) ?
              (((wire43 ? reg53 : (8'ha6)) ?
                      $signed(wire46) : ((8'hab) ? reg50 : wire47)) ?
                  reg50 : {wire46[(3'h4):(1'h0)]}) : ({$signed(wire49),
                      (wire47 ? reg53 : wire44)} ?
                  wire44[(1'h0):(1'h0)] : reg50[(5'h10):(2'h2)])));
        end
    end
  assign wire55 = ((wire44[(2'h2):(1'h1)] ^ $signed((^~wire44[(3'h4):(2'h3)]))) ?
                      (&(reg51 ?
                          (wire43[(1'h0):(1'h0)] <= $signed(wire48)) : {(reg52 >> reg50)})) : (!(wire43 << $unsigned(reg54))));
  assign wire56 = ($signed(wire49) ? {$signed(wire45)} : wire45);
  assign wire57 = (~|((~&$signed((wire55 >= wire43))) ^ wire48[(4'he):(3'h5)]));
endmodule
