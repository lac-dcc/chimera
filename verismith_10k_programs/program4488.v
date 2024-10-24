module top
#(parameter param94 = {(|((((8'hb6) ? (8'hb5) : (7'h44)) ? ((8'hb1) <<< (7'h44)) : ((8'hbc) | (7'h40))) <= ((~^(8'ha5)) ? ((8'h9f) >>> (8'ha5)) : (^(8'ha8))))), (~&(8'hab))}, 
parameter param95 = (param94 * ((&((param94 ? param94 : param94) && ((8'hb9) == (8'hb2)))) ? (({param94} ? (param94 ? param94 : param94) : param94) ? param94 : param94) : param94)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire91;
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire93, wire5, wire6, wire91, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire5 = ((($unsigned((wire3 && wire0)) ?
                             wire3[(1'h1):(1'h1)] : $unsigned($signed(wire1))) ?
                         $unsigned(((~&wire0) ?
                             ((8'hbd) ^ wire3) : {wire3})) : {$signed($signed(wire0))}) ?
                     (^$signed(wire0)) : ((&$signed({wire0,
                         wire2})) + {$signed($signed((7'h44))),
                         $signed(wire4[(2'h2):(2'h2)])}));
  assign wire6 = ((8'hbb) ?
                     {wire5[(1'h1):(1'h1)],
                         (wire3 <<< ({wire5, wire4} ?
                             {(8'hbf)} : (~wire0)))} : $signed($signed(((|wire2) >> $signed(wire4)))));
  always
    @(posedge clk) begin
      reg7 <= $unsigned(($signed(($signed(wire5) ?
          wire1 : wire0)) ^ $signed({$unsigned(wire1)})));
      reg8 <= $unsigned((wire3[(2'h3):(2'h2)] ~^ (wire5 + {{wire5, wire4}})));
      reg9 <= reg7[(2'h3):(2'h2)];
      reg10 <= $signed($signed(wire6));
    end
  module11 #() modinst92 (.clk(clk), .wire14(wire1), .wire15(reg8), .y(wire91), .wire12(wire0), .wire13(wire3), .wire16(reg7));
  assign wire93 = ($signed(((&{wire6, wire1}) ?
                      $signed($signed(wire1)) : ($signed(wire6) >> $signed(wire6)))) > wire3[(3'h7):(3'h7)]);
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire75;
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire82,
                 wire79,
                 wire78,
                 wire77,
                 wire24,
                 wire75,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg81,
                 reg80,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= wire15[(4'ha):(4'ha)];
      if ($unsigned($unsigned($signed($unsigned((wire13 ? wire14 : wire14))))))
        begin
          if (wire16)
            begin
              reg18 <= $signed((((+wire16) ?
                      $unsigned($unsigned(wire15)) : $signed((wire16 ?
                          wire16 : wire13))) ?
                  wire14[(3'h5):(3'h4)] : reg17[(3'h4):(3'h4)]));
              reg19 <= ($unsigned($signed($signed($unsigned(reg17)))) & $signed((wire14 >= (&$unsigned(reg17)))));
              reg20 <= ((reg18 ?
                  {wire16} : (^$signed($signed(wire13)))) >> {$signed(wire16)});
            end
          else
            begin
              reg18 <= (8'ha0);
            end
          reg21 <= reg19[(2'h3):(2'h2)];
          reg22 <= (&{{(8'hb1)}});
        end
      else
        begin
          reg18 <= $unsigned(reg17);
        end
      reg23 <= wire14[(2'h2):(2'h2)];
    end
  assign wire24 = wire14[(4'hf):(1'h0)];
  module25 #() modinst76 (wire75, clk, wire24, reg21, wire12, wire13);
  assign wire77 = reg20[(2'h2):(1'h0)];
  assign wire78 = (8'ha3);
  assign wire79 = {(8'hab), (~^$unsigned(wire75[(4'h8):(1'h0)]))};
  always
    @(posedge clk) begin
      reg80 <= ($signed(reg17) ? wire79[(2'h2):(1'h0)] : wire13[(4'hd):(3'h6)]);
      reg81 <= ($signed((({wire77,
          reg17} <<< (&reg80)) - reg22[(4'h8):(3'h4)])) == (+{(reg17 ^~ $unsigned(wire77)),
          (~^reg19[(3'h7):(2'h3)])}));
    end
  assign wire82 = {wire12[(3'h5):(3'h5)], $signed($unsigned((8'haa)))};
  always
    @(posedge clk) begin
      reg83 <= wire79;
      reg84 <= ((|(wire16 ?
          wire15[(3'h6):(3'h6)] : (reg81[(2'h3):(1'h0)] ?
              $signed(wire14) : (reg19 ?
                  wire77 : reg83)))) + $unsigned($unsigned((!(!wire14)))));
      if (reg23[(1'h0):(1'h0)])
        begin
          if (reg22)
            begin
              reg85 <= wire78[(4'ha):(2'h2)];
              reg86 <= (7'h42);
            end
          else
            begin
              reg85 <= (((wire82[(1'h0):(1'h0)] < ((reg81 ? wire75 : (8'hbe)) ?
                      (reg85 ~^ reg81) : wire79)) >> (~&($signed(reg17) >= {reg83,
                      wire14}))) ?
                  reg84 : $signed({((7'h41) ^ (^~reg19))}));
              reg86 <= ($signed($signed($unsigned($signed(reg18)))) ?
                  {{(+{wire77, reg23})}} : ($unsigned($unsigned((reg22 ?
                          reg86 : wire15))) ?
                      $unsigned(wire78) : (($unsigned(wire82) << $signed(reg83)) & ((reg80 ?
                          reg81 : reg17) ^ $unsigned(reg20)))));
            end
          if ($unsigned(($signed($signed($unsigned(reg20))) ?
              ($unsigned(reg22) ? wire12 : reg18) : (((wire12 ?
                          wire14 : (8'hbb)) ?
                      $signed(reg21) : {wire79, wire16}) ?
                  reg80[(4'hb):(4'h9)] : $unsigned($unsigned(wire79))))))
            begin
              reg87 <= (8'hbe);
              reg88 <= (~^$unsigned(((^(reg85 != reg23)) ? reg17 : reg22)));
            end
          else
            begin
              reg87 <= $signed($unsigned($signed(reg17)));
              reg88 <= ((~|(((~^reg21) ^ (~|wire12)) ^~ reg18)) >> (8'hb3));
            end
        end
      else
        begin
          if (($signed((-(&$unsigned(reg17)))) >> reg81))
            begin
              reg85 <= {reg80[(5'h14):(4'h9)]};
            end
          else
            begin
              reg85 <= $signed($signed(reg83[(5'h10):(1'h1)]));
            end
        end
      reg89 <= (!$signed(((-reg80) ^ ({reg19, reg21} >>> (reg83 ?
          (8'ha9) : reg22)))));
      reg90 <= (wire14[(2'h3):(2'h2)] ?
          ({(^(wire13 ? reg23 : wire13)), $unsigned(reg19[(2'h3):(1'h0)])} ?
              reg83 : (^{{reg83}})) : (+reg22[(2'h3):(1'h0)]));
    end
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  assign y = {wire74,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
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
                 reg43,
                 reg42,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg30 <= ((~&(+$signed($signed(wire26)))) << {wire29[(1'h1):(1'h1)]});
          reg31 <= (reg30[(3'h5):(2'h2)] ?
              $unsigned(($unsigned((|reg30)) != $unsigned((8'had)))) : (~^{(~((8'ha9) <<< wire29))}));
          reg32 <= wire29[(1'h1):(1'h1)];
          if ({(~wire26),
              (((!reg31) ? wire26 : $signed((reg32 ? reg32 : reg31))) ?
                  (reg32[(4'h8):(1'h0)] ?
                      $unsigned($unsigned(wire28)) : $unsigned($unsigned(wire26))) : reg31)})
            begin
              reg33 <= $unsigned(((^~(((8'hb0) >> wire29) >> (wire29 && wire29))) + (({reg31} & (reg31 ?
                      reg32 : reg30)) ?
                  ((wire29 < reg30) ?
                      (wire27 ^ wire28) : {reg32,
                          wire26}) : ({reg31} <= wire29[(1'h0):(1'h0)]))));
              reg34 <= wire27;
              reg35 <= (((|((wire26 ? wire29 : reg30) << $unsigned(reg33))) ?
                  $signed($unsigned((&reg33))) : wire28) + $signed(wire28[(3'h6):(3'h6)]));
            end
          else
            begin
              reg33 <= reg30[(3'h4):(1'h0)];
              reg34 <= {{(~$signed($unsigned(reg35))),
                      ({(wire29 ? reg35 : reg34),
                          $signed((8'ha7))} >>> (&reg30))},
                  (+reg33)};
            end
          reg36 <= ($signed(reg31[(4'hf):(2'h3)]) ~^ $signed((-$signed((reg30 - reg31)))));
        end
      else
        begin
          reg30 <= (reg31[(3'h6):(1'h1)] ?
              (reg33 ?
                  (~^reg35[(2'h2):(2'h2)]) : reg31[(4'he):(4'h9)]) : $signed($unsigned($unsigned((wire26 ?
                  reg33 : wire28)))));
          reg31 <= (8'ha3);
        end
    end
  assign wire37 = ((~((+(wire27 ?
                      (8'h9e) : (8'h9d))) || {$unsigned(wire29)})) <<< $unsigned(({(wire28 ?
                          wire26 : wire29)} >= (8'had))));
  assign wire38 = wire29;
  assign wire39 = $signed($unsigned($unsigned(wire38[(2'h3):(1'h0)])));
  assign wire40 = ($unsigned($unsigned(wire38[(1'h1):(1'h0)])) <= (-$signed((8'hbe))));
  assign wire41 = $signed((~wire29));
  always
    @(posedge clk) begin
      reg42 <= $unsigned((8'hb5));
      if ($unsigned($unsigned({{(wire40 ? reg30 : (8'h9c))}})))
        begin
          if ((($unsigned(((8'ha1) ?
              $unsigned(reg32) : $unsigned(wire40))) >= wire37[(4'h8):(4'h8)]) & ((reg42 && reg42[(4'hd):(3'h7)]) ?
              (($unsigned(wire38) ? $signed(wire40) : (~^reg31)) ?
                  (wire40[(3'h5):(3'h5)] ? wire38 : reg36) : (^(reg33 ?
                      wire26 : reg42))) : $unsigned($unsigned({(8'hbe)})))))
            begin
              reg43 <= $unsigned($unsigned($unsigned($unsigned($signed((8'ha3))))));
              reg44 <= reg43;
            end
          else
            begin
              reg43 <= ($unsigned($signed(((reg43 & reg35) ^ (reg43 ?
                  (8'ha7) : wire38)))) == ({{$signed(reg43), wire37},
                  (&(wire40 ? wire37 : (8'ha9)))} + $unsigned(($signed(wire41) ?
                  {wire41, reg33} : (reg44 ? reg33 : (8'hb6))))));
            end
        end
      else
        begin
          if ((~|(|(|($unsigned(wire28) ? {reg33} : $unsigned(reg44))))))
            begin
              reg43 <= wire26;
            end
          else
            begin
              reg43 <= wire37;
              reg44 <= ((({(~reg42)} && ((wire39 || reg31) ?
                  (&wire27) : wire26)) * (($signed(reg43) ?
                  (reg34 ?
                      (8'hbf) : (8'ha7)) : wire28) ~^ (reg34[(3'h4):(2'h3)] != reg31[(4'ha):(2'h2)]))) + $signed(wire38));
              reg45 <= ($unsigned(wire38[(1'h1):(1'h0)]) - wire28[(1'h0):(1'h0)]);
            end
          reg46 <= (~(~^$unsigned(reg42[(3'h4):(3'h4)])));
          if ($unsigned({$unsigned($unsigned($unsigned(reg34)))}))
            begin
              reg47 <= reg45[(3'h5):(3'h5)];
              reg48 <= (8'haf);
              reg49 <= wire39[(2'h3):(2'h2)];
              reg50 <= reg31[(2'h3):(1'h1)];
            end
          else
            begin
              reg47 <= $signed((+(({wire39} ?
                  (^~wire27) : (reg31 ? reg45 : reg35)) - (wire37 ?
                  (reg45 ? (8'hab) : wire41) : reg42[(4'he):(4'h8)]))));
              reg48 <= $unsigned($unsigned((7'h43)));
              reg49 <= reg44[(1'h0):(1'h0)];
              reg50 <= $signed((($unsigned((reg31 ? reg48 : wire40)) ?
                      (reg48[(4'h8):(1'h0)] && (wire41 * reg34)) : $signed(wire41)) ?
                  reg30[(3'h5):(3'h5)] : $signed($signed(reg47))));
            end
          reg51 <= (&reg34);
          reg52 <= (~(reg33[(2'h3):(2'h2)] * reg42[(5'h10):(2'h3)]));
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned((&$unsigned(($unsigned((8'hac)) ?
          $unsigned(reg33) : $signed(wire41))))))
        begin
          reg53 <= reg44;
          reg54 <= $unsigned((!(~|reg43)));
          reg55 <= $unsigned($unsigned(reg50[(1'h1):(1'h1)]));
          if (reg44[(2'h3):(2'h2)])
            begin
              reg56 <= (~&($signed($unsigned($signed((7'h40)))) >>> $unsigned(($signed(reg46) ~^ ((8'ha3) >= reg50)))));
            end
          else
            begin
              reg56 <= {(^$signed({(-reg30), $signed((8'ha3))})),
                  {reg50[(2'h2):(1'h1)]}};
              reg57 <= reg46[(1'h1):(1'h1)];
              reg58 <= reg35[(2'h2):(1'h1)];
              reg59 <= $signed((~^(8'hb5)));
            end
        end
      else
        begin
          if ((((wire37[(3'h6):(3'h6)] ^~ {wire27[(2'h2):(1'h0)],
              ((8'ha0) || wire40)}) ^ $signed($signed($signed(reg45)))) - wire39))
            begin
              reg53 <= reg50[(2'h2):(2'h2)];
              reg54 <= (8'h9f);
              reg55 <= ($signed(reg30[(3'h6):(3'h5)]) ?
                  $signed((-((reg52 < wire40) <= wire41))) : $signed(reg53));
              reg56 <= {(($unsigned(reg58) * (reg51[(4'hb):(3'h5)] <= $signed(reg42))) ?
                      ((reg33 >= (&(8'hb2))) ?
                          ((~(8'h9f)) - reg47[(2'h2):(1'h0)]) : $unsigned($signed(reg53))) : $signed((reg30 ?
                          (reg48 <<< wire26) : {wire28, reg50})))};
              reg57 <= wire28;
            end
          else
            begin
              reg53 <= {$unsigned($unsigned(reg46[(5'h10):(4'hc)])),
                  ((wire26[(3'h4):(1'h0)] ? reg44 : (8'hbc)) ?
                      reg35 : (wire27 ?
                          $signed($unsigned(reg48)) : $signed((!reg33))))};
              reg54 <= ({(~^$signed(reg51[(4'h9):(3'h6)]))} ?
                  reg42[(4'h9):(3'h4)] : reg53[(3'h6):(3'h5)]);
              reg55 <= ((+(&$unsigned($unsigned(reg53)))) && reg49);
            end
          if (reg56)
            begin
              reg58 <= $unsigned((((wire27[(1'h0):(1'h0)] ?
                          wire26[(1'h0):(1'h0)] : wire26[(4'hf):(4'hd)]) ?
                      reg31 : $signed({reg46})) ?
                  $unsigned(reg54[(3'h6):(1'h0)]) : ((reg44[(1'h1):(1'h0)] - {wire40,
                      reg51}) >= {$unsigned(reg36)})));
              reg59 <= reg35[(1'h1):(1'h1)];
              reg60 <= ((+({(+reg44), $signed(wire26)} ?
                  (+(-(8'h9e))) : wire40)) + $signed(reg30));
            end
          else
            begin
              reg58 <= (($unsigned((reg34[(3'h7):(3'h5)] ?
                  reg58[(2'h2):(2'h2)] : {reg47})) <= (|$signed($signed(reg58)))) >>> $unsigned($unsigned(($unsigned(reg36) ?
                  {reg50, (7'h42)} : reg47[(2'h2):(2'h2)]))));
            end
        end
      reg61 <= (~|(({wire37} ? wire37 : reg54[(1'h1):(1'h0)]) ?
          ((reg31 >= ((8'hb6) ? reg31 : wire38)) <<< (reg51 ?
              (reg44 ~^ reg49) : $unsigned(reg42))) : $signed((((8'haf) ?
              wire38 : reg52) >> (wire28 ^~ reg44)))));
      if ({reg55})
        begin
          reg62 <= {$unsigned(reg34[(4'hb):(2'h3)])};
        end
      else
        begin
          reg62 <= $signed($unsigned(reg55[(5'h10):(4'hb)]));
          reg63 <= (wire39[(3'h7):(2'h2)] ^~ (~|reg60[(4'hb):(4'ha)]));
        end
    end
  always
    @(posedge clk) begin
      reg64 <= (^~reg33[(4'hb):(3'h5)]);
      reg65 <= reg35;
      reg66 <= ($unsigned(((&wire41) ? reg33[(1'h1):(1'h1)] : reg44)) ?
          (+(reg60[(2'h3):(2'h2)] >= (~$signed(reg44)))) : ($signed(reg36[(2'h2):(2'h2)]) ~^ reg58));
      reg67 <= (~^{$unsigned(reg49)});
      reg68 <= reg45[(3'h6):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg69 <= reg31[(2'h3):(2'h3)];
      reg70 <= $unsigned(($unsigned($unsigned(wire27)) < reg56[(3'h7):(3'h4)]));
      reg71 <= (^~{reg36[(1'h1):(1'h1)]});
      reg72 <= {((~$signed(reg53)) != (reg31[(4'h9):(1'h0)] ^~ reg71[(1'h0):(1'h0)]))};
      reg73 <= ((&wire39) - ($signed({$unsigned(reg45), wire39}) ?
          (+$unsigned($signed(reg63))) : {$signed($signed(reg62)), (8'hb5)}));
    end
  assign wire74 = wire37;
endmodule
