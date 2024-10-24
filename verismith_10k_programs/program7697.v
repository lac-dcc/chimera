module top
#(parameter param117 = (&{({((8'ha6) ? (8'hb0) : (8'hba)), (~|(8'ha5))} ? (&((8'hb3) ? (8'hb5) : (7'h44))) : ((~&(8'hbb)) + (|(8'ha5))))}), 
parameter param118 = ((|(((param117 ? param117 : (8'hbe)) ^~ (8'ha4)) ? (^~(param117 ^~ param117)) : ((param117 ? param117 : param117) ? (~&(8'hb8)) : (param117 ? param117 : (8'hac))))) == (8'ha3)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  assign y = {wire115,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= wire3[(3'h5):(3'h4)];
      if (($signed((wire3 ? $signed(wire2[(3'h7):(3'h6)]) : wire3)) ?
          reg5 : (wire1[(3'h6):(3'h6)] ?
              ((8'ha5) == reg6[(4'ha):(3'h5)]) : (reg5[(4'h8):(1'h1)] != {wire3[(3'h4):(2'h3)]}))))
        begin
          reg7 <= reg5;
        end
      else
        begin
          reg7 <= ($unsigned((7'h40)) ?
              ((wire2 ? $unsigned(wire3) : wire4[(1'h0):(1'h0)]) ?
                  {(((8'ha3) && wire0) ? wire0 : reg6),
                      (wire2 <= (|reg5))} : $signed($unsigned({reg5,
                      (8'h9f)}))) : reg6[(2'h2):(1'h0)]);
          reg8 <= (($unsigned(((reg5 & reg5) != wire1)) == $signed(($unsigned(wire0) ?
              wire1[(1'h1):(1'h1)] : (reg5 != wire1)))) | wire4[(1'h1):(1'h0)]);
        end
    end
  assign wire9 = $unsigned($signed((((+wire4) < (~^wire0)) >>> ((^reg8) - (+reg8)))));
  assign wire10 = wire0;
  assign wire11 = $unsigned(reg7);
  assign wire12 = ($signed((wire1[(3'h4):(2'h2)] || (~|wire10))) ?
                      wire4 : (~&(^~(8'h9e))));
  assign wire13 = (wire11[(2'h3):(2'h3)] ?
                      (^~$signed(wire3)) : $signed((wire9 ?
                          (~$signed(reg7)) : $signed(reg7[(4'ha):(4'h9)]))));
  assign wire14 = ($signed($unsigned(((reg5 < (8'h9d)) ?
                          (wire12 || wire10) : {reg7, wire12}))) ?
                      (wire1 < $signed(($signed(reg8) >= ((8'hb2) << reg8)))) : $unsigned(({(+wire13),
                          $unsigned((8'ha4))} << ((~^wire9) ?
                          (wire11 ? reg8 : wire2) : (8'hb1)))));
  assign wire15 = wire13;
  assign wire16 = wire12[(4'ha):(3'h7)];
  assign wire17 = {($unsigned(wire9) >> $signed((!(~|wire14))))};
  assign wire18 = (wire16 | ($signed((wire12[(1'h0):(1'h0)] ?
                          wire16 : ((8'hb9) == wire0))) ?
                      wire12[(3'h7):(3'h7)] : (-$unsigned($unsigned((7'h40))))));
  assign wire19 = wire3;
  assign wire20 = (reg8 ? (reg5 || wire12[(4'h9):(4'h9)]) : wire18);
  assign wire21 = ($signed((+{wire19[(3'h6):(3'h5)],
                      $signed(wire18)})) >= (&(((&wire20) ?
                          $unsigned(wire9) : (^~wire10)) ?
                      ((~|wire19) <<< (7'h40)) : ((wire3 ?
                          wire20 : wire0) * (!wire20)))));
  assign wire22 = (~|(8'h9d));
  always
    @(posedge clk) begin
      reg23 <= ($signed($unsigned(wire16)) > wire18[(3'h5):(2'h2)]);
      if ((wire3 << wire1[(4'hb):(4'ha)]))
        begin
          if ((8'haf))
            begin
              reg24 <= $signed((~|reg6));
              reg25 <= $signed(wire17[(4'hb):(3'h7)]);
              reg26 <= ((~&$unsigned($unsigned((wire14 ?
                  wire1 : wire10)))) < reg8[(5'h13):(3'h7)]);
              reg27 <= reg26[(3'h5):(2'h3)];
              reg28 <= ($signed($signed(reg6)) - $signed(($unsigned(wire16) ?
                  $signed($unsigned(reg23)) : ((8'h9e) ?
                      $signed(wire1) : wire19[(4'h8):(2'h3)]))));
            end
          else
            begin
              reg24 <= {wire1};
            end
        end
      else
        begin
          reg24 <= (reg28[(4'hd):(1'h0)] ^~ reg23);
        end
      if (({$unsigned({(^~(8'ha0)), $unsigned(reg28)})} <<< $signed((~((^reg8) ?
          (wire15 ? wire14 : (8'h9e)) : reg5)))))
        begin
          reg29 <= wire16[(2'h2):(1'h0)];
          if (wire18[(3'h6):(1'h0)])
            begin
              reg30 <= $signed($signed({(wire1[(4'h9):(1'h0)] || $signed(wire9)),
                  wire18}));
              reg31 <= (|wire4[(4'h8):(3'h7)]);
              reg32 <= (8'haa);
              reg33 <= $signed(reg8[(3'h7):(1'h1)]);
              reg34 <= ($unsigned(reg27[(1'h1):(1'h1)]) <= ((($signed(wire3) ?
                  (wire14 ?
                      wire0 : reg23) : wire4[(4'h9):(3'h5)]) != (((8'hbe) != reg26) * (wire13 ^ reg33))) < reg5));
            end
          else
            begin
              reg30 <= (^~$unsigned($unsigned((^{wire4, reg8}))));
              reg31 <= (reg32 ?
                  (wire16[(2'h2):(2'h2)] <<< $unsigned($unsigned($signed(wire12)))) : $signed(wire3));
              reg32 <= (((7'h44) != wire12[(3'h7):(1'h0)]) ^~ ((~(~|wire14)) || reg5[(4'ha):(3'h7)]));
              reg33 <= (({$signed(reg23[(2'h3):(1'h0)]),
                      (wire18 * $unsigned(wire19))} ?
                  $unsigned(($signed((8'hb6)) >> reg8)) : (|((-wire13) != $unsigned((8'ha1))))) ^~ $unsigned($unsigned(($unsigned(wire14) ?
                  $signed(wire19) : {wire17}))));
            end
        end
      else
        begin
          reg29 <= ({wire16,
              (^{((8'hb9) ^ wire16),
                  wire19[(3'h5):(2'h2)]})} <<< (+$signed($signed((reg23 ~^ reg8)))));
          reg30 <= $signed($unsigned((-$unsigned($signed(reg27)))));
          reg31 <= (reg30[(2'h2):(1'h1)] <<< (^~$unsigned({(8'ha3)})));
        end
      reg35 <= {{$signed((&(wire4 ? wire3 : (8'h9d)))),
              {$signed($signed(reg28))}},
          ((wire17[(4'hb):(3'h7)] >= ((&wire1) || $unsigned((8'hbb)))) >= (^wire9[(5'h12):(2'h3)]))};
    end
  assign wire36 = $unsigned($unsigned(($unsigned(reg5) ?
                      ((8'hb5) + (wire1 ^~ (8'hba))) : (^$unsigned(wire1)))));
  assign wire37 = $signed({wire4});
  assign wire38 = $signed((8'ha2));
  assign wire39 = ((+$unsigned($signed((wire19 ? wire4 : wire11)))) * ((((reg8 ?
                      wire9 : (8'hb6)) == (wire15 & (8'ha1))) | (wire10[(3'h7):(3'h7)] << $unsigned(reg28))) != wire13[(4'h9):(4'h9)]));
  assign wire40 = (^$unsigned($signed(reg8)));
  assign wire41 = $unsigned($unsigned($signed(wire4)));
  module42 #() modinst116 (wire115, clk, wire38, reg32, wire10, wire22, wire13);
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire47;
  input wire [(3'h6):(1'h0)] wire46;
  input wire signed [(2'h3):(1'h0)] wire45;
  input wire signed [(4'hc):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire67;
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  assign y = {wire114,
                 wire106,
                 wire67,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
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
                 reg65,
                 reg66,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= wire44;
      if ((wire44[(1'h0):(1'h0)] < wire47))
        begin
          reg49 <= ((({(-(7'h44)), $signed(wire45)} ?
                  $signed($signed(wire45)) : $unsigned((^wire46))) > $unsigned(((wire43 >> wire45) ?
                  (~^wire47) : (wire45 ^~ wire47)))) ?
              {(($unsigned(reg48) * $signed(wire45)) < (8'hb1)),
                  ($unsigned(reg48[(4'h9):(3'h4)]) ?
                      {(8'hb4),
                          $signed(wire46)} : (^(&wire45)))} : (+($unsigned(((8'h9d) >>> wire44)) ^ ((wire47 ?
                      reg48 : wire46) ?
                  (wire43 ? (7'h40) : wire43) : (!wire44)))));
          reg50 <= ($unsigned((8'haa)) ?
              $signed((({(8'hb5)} ? $unsigned(wire44) : {(8'ha5)}) ?
                  $signed($signed((8'ha1))) : $signed((reg48 ?
                      wire46 : (8'h9f))))) : $unsigned(((~(wire43 ?
                      wire45 : wire43)) ?
                  ((wire47 & reg48) && reg49) : wire47[(5'h10):(4'hd)])));
          if ({(((8'ha0) > ((reg50 ? (8'ha7) : wire43) ?
                  wire45 : (reg49 <= (8'hb9)))) - (^$signed(wire47[(4'h9):(2'h2)])))})
            begin
              reg51 <= (+wire45);
              reg52 <= {wire47};
              reg53 <= $unsigned((-$signed(wire43)));
              reg54 <= ($unsigned({{(wire45 ? reg53 : reg52),
                      (wire43 ? reg48 : wire46)},
                  ((reg52 ? reg53 : (8'h9f)) ?
                      (wire44 ? wire44 : (8'hb2)) : $signed(reg48))}) + wire43);
              reg55 <= (($unsigned(($signed(wire46) ?
                      (wire44 && wire46) : (wire45 ^~ reg48))) ?
                  $unsigned($unsigned((wire46 ?
                      (7'h43) : reg53))) : ((reg50[(2'h3):(2'h2)] ?
                          (reg48 > reg54) : (reg51 << wire46)) ?
                      $signed($unsigned(wire45)) : ((reg49 + reg54) * wire46[(1'h1):(1'h1)]))) << $unsigned(($signed({wire44}) ?
                  (~$signed(wire44)) : $signed((wire46 - reg54)))));
            end
          else
            begin
              reg51 <= wire43;
              reg52 <= $unsigned((^((^wire43) ?
                  ($signed(reg48) ?
                      reg55 : (wire43 ? reg53 : reg55)) : $signed((reg52 ?
                      reg48 : (8'hbb))))));
              reg53 <= (~&(^(!reg53)));
              reg54 <= (reg53[(1'h1):(1'h1)] ?
                  (+$unsigned({reg53})) : ($unsigned(wire44[(4'hc):(3'h5)]) ?
                      $unsigned((~reg51[(4'hb):(2'h2)])) : wire46[(3'h4):(2'h3)]));
            end
          if ((~((~&(((8'hab) | wire45) ? wire46 : (8'hb1))) ?
              reg55 : (|$unsigned(reg53)))))
            begin
              reg56 <= ((&($signed({reg51, (8'h9f)}) ?
                  {$unsigned(wire45)} : (reg54 || $unsigned(reg48)))) != (~^wire47));
              reg57 <= reg55[(1'h0):(1'h0)];
              reg58 <= (((reg55[(2'h2):(1'h1)] >> ((reg52 != reg56) | $signed(reg52))) != (reg57[(5'h12):(1'h0)] < (reg54 << {wire45,
                      wire47}))) ?
                  $signed(((+$unsigned(reg57)) ?
                      (~$unsigned((8'haa))) : (+(wire45 ?
                          wire45 : wire45)))) : (reg52[(5'h12):(4'hd)] ?
                      {reg56, $unsigned((|(8'hae)))} : $unsigned((wire47 ?
                          {reg54} : $unsigned(wire45)))));
            end
          else
            begin
              reg56 <= (reg56[(2'h3):(2'h2)] <<< (~(reg55[(1'h1):(1'h1)] ?
                  {(~|wire47)} : reg56)));
              reg57 <= (&{(reg57[(5'h12):(4'he)] ?
                      $unsigned((wire47 ? reg53 : reg58)) : reg57),
                  (-$signed({reg58}))});
              reg58 <= (($signed(reg57) ?
                  (~^{$unsigned(reg56),
                      reg58[(1'h0):(1'h0)]}) : ({$unsigned((8'hac))} ?
                      {(reg55 ?
                              reg58 : reg49)} : (^~$signed(reg53)))) ^ {(~^{reg50})});
              reg59 <= ($signed((reg55 ?
                      (reg58 ?
                          (reg52 || reg55) : (~&reg50)) : $unsigned($signed(reg52)))) ?
                  $unsigned((((~wire46) ^ reg48) ?
                      ($unsigned((8'hbf)) ?
                          (reg48 ?
                              (8'haf) : wire46) : (|reg49)) : reg51[(4'he):(3'h7)])) : $signed(reg54[(3'h4):(1'h0)]));
            end
          reg60 <= $unsigned(reg56);
        end
      else
        begin
          if (reg58)
            begin
              reg49 <= (&(reg56 ? $signed($signed($signed(reg56))) : reg57));
              reg50 <= (reg57[(3'h6):(2'h2)] ?
                  (~^$unsigned((&$signed(wire46)))) : (((~^wire43) && ($unsigned((8'hac)) ?
                          (reg60 > wire44) : $signed(wire44))) ?
                      wire45[(2'h2):(1'h0)] : (&(~reg53[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg49 <= (reg48 | ((wire47 ~^ reg51[(5'h13):(3'h7)]) < (reg53[(2'h2):(1'h0)] ?
                  $signed((reg56 ? wire47 : reg56)) : (~^{reg58}))));
              reg50 <= wire45[(1'h1):(1'h1)];
              reg51 <= ((^$unsigned(($signed(reg56) ?
                      $unsigned(wire44) : $unsigned(reg52)))) ?
                  {(((8'ha1) ? ((8'hbc) | reg53) : reg52) & $signed((wire44 ?
                          reg54 : reg58))),
                      {(+(wire43 ?
                              reg51 : wire43))}} : ((wire43[(2'h2):(1'h1)] ?
                      (-(reg55 >= reg55)) : $unsigned(reg53)) | ({(~^wire47)} ?
                      reg60 : wire45)));
              reg52 <= $unsigned(wire44);
              reg53 <= (($signed((^~(reg54 & reg60))) ?
                      reg50 : ($signed((~(8'hb4))) ?
                          $unsigned(reg48) : (reg48 ?
                              $signed(wire44) : (reg55 > reg53)))) ?
                  wire43[(2'h2):(2'h2)] : (($unsigned(reg50) < (8'ha5)) + reg60[(4'hd):(3'h7)]));
            end
          reg54 <= (~(~|($unsigned(wire43[(1'h1):(1'h1)]) ?
              wire45 : ((reg50 + reg56) ?
                  {reg51, reg50} : wire47[(3'h6):(2'h3)]))));
          reg55 <= $signed({reg55[(4'hc):(1'h0)],
              ({((8'hbb) - reg55), $signed(reg53)} ?
                  reg60 : (-(reg57 ^ wire45)))});
          reg56 <= ($unsigned((&(^$signed((8'hbb))))) ?
              (reg54[(2'h2):(2'h2)] ?
                  (~^reg51) : $unsigned((8'hae))) : $signed((^{(wire44 ~^ reg50),
                  (reg60 & reg49)})));
          reg57 <= (~|wire43[(1'h1):(1'h0)]);
        end
      if (wire45[(1'h1):(1'h1)])
        begin
          reg61 <= wire44[(4'h8):(2'h2)];
          if ((~&reg61))
            begin
              reg62 <= $unsigned($signed((wire44[(1'h1):(1'h1)] ?
                  $unsigned($unsigned(reg61)) : (^~$unsigned((8'hb9))))));
            end
          else
            begin
              reg62 <= (reg49 ?
                  $signed(reg57[(4'h9):(1'h0)]) : $unsigned(reg54[(4'hb):(4'ha)]));
            end
          reg63 <= $signed(({$unsigned(((8'hb1) ? reg56 : (8'hbd)))} ?
              reg55 : (!$signed($unsigned(reg52)))));
          reg64 <= $signed(($signed((reg58 == $signed(reg49))) ?
              (8'hac) : (+$signed($signed(reg51)))));
          reg65 <= (^(reg61 >>> ({reg60} ? wire44 : (-(!reg62)))));
        end
      else
        begin
          reg61 <= ($unsigned(wire47[(5'h12):(3'h7)]) ?
              $unsigned($unsigned(($unsigned(reg57) ?
                  wire44 : ((8'ha2) ? (8'hbe) : reg48)))) : reg62);
          reg62 <= reg53;
          reg63 <= wire46;
          reg64 <= reg57;
          reg65 <= reg62;
        end
      reg66 <= (~^$unsigned(wire43[(2'h2):(2'h2)]));
    end
  assign wire67 = $unsigned((($unsigned((^~reg54)) ?
                          ($unsigned(reg51) ?
                              (~|reg65) : (~reg54)) : reg55[(4'ha):(3'h7)]) ?
                      {(&(^~wire47))} : $signed(reg50)));
  module68 #() modinst107 (wire106, clk, reg49, reg59, reg64, reg61, reg56);
  always
    @(posedge clk) begin
      reg108 <= (&({reg65[(2'h2):(1'h1)], reg48} > (^~wire44)));
      reg109 <= $unsigned(wire47);
      if ((wire67 ^~ $signed((|(!wire46)))))
        begin
          reg110 <= $signed((((((8'hae) ~^ reg51) ~^ (~|reg61)) >> $unsigned((wire43 != (7'h40)))) << wire45));
        end
      else
        begin
          reg110 <= {wire106, reg59};
          reg111 <= reg65;
          reg112 <= (~$unsigned($unsigned(($signed(reg55) ?
              $signed(wire46) : (reg109 ~^ wire44)))));
        end
      reg113 <= (8'ha3);
    end
  assign wire114 = $unsigned((+((8'hae) || ($signed(reg56) < $signed(reg64)))));
endmodule

module module68
#(parameter param104 = ((~|((^((8'hbd) * (8'haa))) ? (~((7'h42) ? (8'hb4) : (8'ha7))) : {(^~(7'h43)), ((8'ha2) ? (8'ha2) : (8'haa))})) | ((({(8'ha1)} ? (^(8'ha1)) : ((8'haa) < (8'hb6))) ? (+((8'ha2) + (8'hb5))) : (!((8'hbd) != (8'hae)))) > ((^((8'h9f) ? (8'ha3) : (8'hb8))) < (((8'ha6) ^ (8'hbb)) ^ (^~(8'hb9)))))), 
parameter param105 = (((8'ha3) | {param104, ((param104 << param104) & {param104})}) ? (param104 ? ((&param104) && (|{param104, param104})) : {((param104 + param104) > (7'h40)), {param104}}) : ((param104 - ((8'ha2) >> (&param104))) >= (8'ha3))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire signed [(5'h13):(1'h0)] wire72;
  input wire signed [(3'h5):(1'h0)] wire71;
  input wire signed [(4'he):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire90,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire74,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg76,
                 (1'h0)};
  assign wire74 = {{($signed((wire72 ^~ wire73)) ?
                              ({(7'h42), wire71} ?
                                  $signed((7'h40)) : {wire69,
                                      wire72}) : ((^wire70) != (^(7'h40))))}};
  assign wire75 = wire69[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg76 <= $unsigned(((wire69[(4'ha):(3'h6)] + {(|wire73)}) ?
          (~|$unsigned((wire69 ? (8'hbc) : wire75))) : (&$unsigned((8'hb5)))));
    end
  assign wire77 = (8'hab);
  assign wire78 = (~{($signed($signed(wire69)) ?
                          wire77[(4'h9):(3'h7)] : $signed((~|wire75))),
                      wire74});
  assign wire79 = (+(($unsigned(wire70) ?
                      ($unsigned(wire71) ~^ $signed(wire70)) : (wire74[(5'h11):(4'ha)] ?
                          (reg76 ? wire69 : wire72) : (-wire75))) && reg76));
  assign wire80 = $unsigned((wire77[(4'hc):(3'h6)] || wire73));
  assign wire81 = (^~wire72[(4'h9):(3'h5)]);
  assign wire82 = wire73;
  assign wire83 = $unsigned({{{wire75, $signed(wire82)},
                          $unsigned($signed(wire72))}});
  assign wire84 = ($signed(wire73[(2'h2):(2'h2)]) && $signed((wire80[(4'h9):(4'h9)] ?
                      ((&wire72) ?
                          $unsigned(wire83) : (wire71 == wire83)) : (~^(7'h42)))));
  always
    @(posedge clk) begin
      reg85 <= wire81;
      reg86 <= (8'hb4);
      reg87 <= wire78[(4'hf):(4'hd)];
      reg88 <= $signed((wire72[(4'h9):(3'h6)] ?
          (((reg87 & wire73) ? $signed(reg86) : (wire82 >>> wire82)) ?
              wire79[(2'h3):(1'h1)] : (reg76[(2'h2):(2'h2)] && wire70[(4'he):(4'hc)])) : {wire72}));
      reg89 <= ($signed({reg85, $unsigned($unsigned((8'ha1)))}) ?
          $signed($signed($signed({(8'hbb), wire70}))) : (^{((wire74 ?
                  (8'ha9) : wire82) <= (~^reg88))}));
    end
  assign wire90 = reg88[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      if (wire77)
        begin
          reg91 <= ($unsigned(wire82) >> ($signed($signed((+wire75))) ?
              (wire83 * ({wire77, wire71} ?
                  (+wire70) : reg88[(3'h7):(2'h2)])) : wire79[(2'h2):(2'h2)]));
          if (reg85[(4'h9):(3'h6)])
            begin
              reg92 <= $signed(($unsigned($signed((^~reg86))) ?
                  wire78[(5'h10):(4'hb)] : (&$unsigned({(8'haf), (8'h9d)}))));
            end
          else
            begin
              reg92 <= (wire79 ?
                  {(wire81[(4'h9):(3'h7)] ?
                          (~|$unsigned(reg91)) : $signed((^~wire70)))} : (-$signed($unsigned($signed(wire71)))));
            end
          reg93 <= wire90;
          if (wire78[(4'ha):(3'h6)])
            begin
              reg94 <= ((($unsigned($signed(wire77)) ?
                      ($unsigned(wire69) || $unsigned(wire73)) : $signed(wire73[(2'h2):(1'h1)])) ?
                  $unsigned($unsigned($unsigned(wire69))) : $unsigned((-wire69[(2'h3):(1'h1)]))) >> (wire80 + $unsigned(wire80)));
              reg95 <= reg91;
              reg96 <= $signed((((reg94[(1'h1):(1'h0)] + $unsigned(wire84)) ~^ (wire74 ?
                  reg88[(4'hb):(2'h3)] : (reg87 ^~ reg94))) * $unsigned((-(wire77 ?
                  wire80 : wire90)))));
            end
          else
            begin
              reg94 <= ($unsigned(wire78) ?
                  ((wire70 ?
                          $unsigned($unsigned(wire70)) : $signed((wire80 | (8'h9e)))) ?
                      wire75[(4'he):(4'ha)] : (reg76 - $unsigned({reg95}))) : $unsigned({reg85[(4'hd):(1'h0)]}));
              reg95 <= ((wire69[(4'h9):(3'h4)] ?
                      {((reg87 << (8'ha4)) ?
                              (wire77 || (8'ha0)) : $signed((8'ha9)))} : (^~$signed($unsigned(wire79)))) ?
                  $signed((wire69 ?
                      reg86[(5'h12):(2'h3)] : wire84)) : $signed(reg93));
              reg96 <= (($unsigned((8'h9f)) == reg95) ?
                  $signed((($unsigned((8'ha4)) ^ (~wire82)) ^~ $signed(((8'haa) != reg91)))) : wire90);
              reg97 <= $unsigned($signed(((wire73[(3'h4):(2'h3)] ?
                  ((8'h9e) ? reg86 : wire71) : reg95) < ({reg85,
                  reg87} >= (~&wire80)))));
            end
          reg98 <= reg97;
        end
      else
        begin
          reg91 <= (8'ha7);
          reg92 <= {reg85, $unsigned($signed(wire83))};
          reg93 <= $signed((reg92 ?
              wire83[(2'h3):(1'h1)] : (({wire82, reg89} ?
                      (reg97 ? wire70 : reg93) : reg86) ?
                  (!$unsigned(wire73)) : (wire77 ? $signed(wire83) : reg91))));
          reg94 <= ({$unsigned({reg89[(4'h8):(4'h8)], wire81[(4'h9):(1'h0)]})} ?
              ($unsigned(reg94) || $signed((8'h9e))) : $signed(wire79));
          reg95 <= $signed($signed($unsigned((reg87[(3'h6):(3'h6)] < $unsigned(reg86)))));
        end
      reg99 <= {$signed(reg98)};
      reg100 <= $unsigned(reg76[(2'h2):(1'h0)]);
    end
  assign wire101 = $signed(reg93[(1'h1):(1'h1)]);
  assign wire102 = (~{reg95,
                       $unsigned({(wire73 <<< (8'ha3)), $unsigned((8'hbf))})});
  assign wire103 = reg76[(2'h2):(1'h1)];
endmodule
