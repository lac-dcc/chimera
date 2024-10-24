module top
#(parameter param106 = (({(+((8'hb6) >= (8'hb5)))} ? (({(8'ha1)} + (8'hbd)) | (((8'h9e) <= (7'h42)) >> ((8'ha9) > (8'h9f)))) : (&(((8'ha5) & (7'h44)) && ((8'hbe) ? (7'h40) : (8'ha5))))) ? ({(8'hb4)} | (^(((8'hab) ? (8'hb0) : (8'haf)) ? (~|(8'hb5)) : {(8'hbf), (7'h43)}))) : ((^(|(&(8'hbd)))) | (8'hbe))), 
parameter param107 = param106)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire104;
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  assign y = {wire68,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire70,
                 wire71,
                 wire104,
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
                 reg21,
                 reg22,
                 reg23,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire2))
        begin
          reg4 <= $unsigned(wire0);
        end
      else
        begin
          reg4 <= $signed((8'hbb));
          if (($signed((^((reg4 ^~ reg4) <<< (reg4 >= (8'hb6))))) ?
              $unsigned($signed(((reg4 | wire3) != (8'hb2)))) : ((^(+(wire2 ?
                  wire0 : wire1))) - $signed(((!wire1) ?
                  $signed(reg4) : reg4)))))
            begin
              reg5 <= wire0;
              reg6 <= wire2;
              reg7 <= (wire1 * wire0);
              reg8 <= reg5;
              reg9 <= reg6[(4'ha):(2'h3)];
            end
          else
            begin
              reg5 <= (($signed(reg9) & (~|((wire2 * wire2) ?
                  (reg8 || reg9) : (wire3 ^~ (8'hbb))))) < (-(|(8'haa))));
              reg6 <= ($signed(((reg9[(2'h2):(1'h0)] == (reg7 && wire2)) < ((!reg7) ?
                  $signed((8'ha5)) : (8'ha6)))) ^ ({$signed(reg5)} != reg9[(1'h1):(1'h0)]));
              reg7 <= ((!wire0[(1'h0):(1'h0)]) ?
                  ((reg5[(2'h2):(2'h2)] > $signed((reg8 ?
                      wire0 : reg9))) || reg5[(1'h0):(1'h0)]) : reg9);
              reg8 <= (wire2 & $signed($unsigned(reg4[(3'h6):(2'h2)])));
            end
          reg10 <= (^(reg9[(2'h2):(1'h1)] ?
              $signed(reg9[(1'h1):(1'h0)]) : $unsigned($unsigned((&(8'hb9))))));
          reg11 <= (($signed((reg6[(4'hb):(2'h3)] ^ (~|(8'hb6)))) >> reg10[(1'h1):(1'h1)]) ?
              reg9 : (wire0[(2'h2):(1'h1)] ?
                  wire1[(4'hf):(1'h0)] : wire2[(4'h9):(2'h2)]));
          if ($unsigned((^~(reg9[(1'h1):(1'h1)] & reg8))))
            begin
              reg12 <= (wire2 << (8'ha7));
              reg13 <= ($signed(({((8'hb5) ?
                      reg9 : wire3)} + $unsigned((8'haa)))) & ($signed(($unsigned(wire1) ?
                      $signed(reg8) : (reg9 ? reg4 : wire1))) ?
                  $signed({$unsigned(wire3),
                      (wire1 ? wire2 : wire1)}) : (+reg10)));
              reg14 <= reg13;
              reg15 <= (^(8'ha4));
            end
          else
            begin
              reg12 <= reg12;
              reg13 <= (^$unsigned($signed((reg4 ^~ (wire1 ? reg6 : reg4)))));
            end
        end
    end
  assign wire16 = $signed(wire3);
  assign wire17 = (~^$unsigned(((+(wire3 ? reg10 : reg12)) ?
                      $unsigned((wire1 ? reg5 : reg15)) : reg10)));
  assign wire18 = (reg7[(1'h0):(1'h0)] ?
                      $unsigned((({reg5, (8'ha1)} ?
                              $unsigned((8'ha2)) : (!(8'haa))) ?
                          (^$signed(wire1)) : $unsigned((reg7 ?
                              reg7 : reg15)))) : wire17[(1'h1):(1'h1)]);
  assign wire19 = {(($unsigned({wire17, wire3}) << (wire16 ?
                              wire18[(2'h3):(1'h1)] : (wire17 ?
                                  reg11 : (8'hb4)))) ?
                          (~^wire3) : $signed((!{reg14}))),
                      (~|{wire16[(1'h0):(1'h0)],
                          ($signed(reg10) ? (~^(8'haa)) : $unsigned(reg13))})};
  assign wire20 = ($unsigned({$unsigned((wire0 + wire0)), reg4}) ?
                      $signed((reg7[(4'ha):(3'h5)] <= reg15)) : (8'hbb));
  always
    @(posedge clk) begin
      reg21 <= reg7;
      reg22 <= ({((-(7'h41)) != $signed({(8'haa)}))} ?
          (($unsigned((wire2 ?
                  reg14 : reg12)) <<< ($unsigned(reg14) < (+wire2))) ?
              ((~&reg6) ?
                  ($unsigned(wire20) ?
                      $signed(wire16) : $signed(reg12)) : $signed($signed(reg12))) : wire16) : wire1[(2'h2):(1'h0)]);
      reg23 <= (~^wire2[(3'h5):(2'h3)]);
    end
  assign wire24 = reg13[(1'h0):(1'h0)];
  assign wire25 = reg10[(3'h7):(1'h1)];
  assign wire26 = $unsigned({$signed({((8'ha7) > wire1)})});
  always
    @(posedge clk) begin
      reg27 <= (8'hb9);
      reg28 <= $unsigned({(reg6[(4'hd):(1'h1)] <<< $unsigned((wire19 ?
              (8'hb6) : reg13)))});
      if (($signed(reg9) ? (-wire16) : reg22))
        begin
          reg29 <= (|$signed(reg12));
          reg30 <= (~&(reg28[(2'h3):(1'h1)] != (&(!(reg22 * reg23)))));
          if (({($signed(reg14) & ($unsigned(wire16) ?
                  $unsigned(reg5) : $unsigned(reg8)))} <<< wire2[(2'h2):(2'h2)]))
            begin
              reg31 <= {reg11[(2'h3):(2'h3)], $signed(reg11)};
              reg32 <= reg21[(1'h1):(1'h1)];
              reg33 <= $unsigned(wire16[(1'h0):(1'h0)]);
            end
          else
            begin
              reg31 <= (~(~|(reg33[(2'h3):(2'h2)] ?
                  wire24 : ($signed(reg29) - (reg31 ? wire1 : wire1)))));
              reg32 <= $signed($unsigned($signed(wire3)));
              reg33 <= (~|(+{$unsigned((~reg15))}));
            end
          reg34 <= (($signed($signed((wire17 ? (7'h42) : wire1))) ?
              wire24[(3'h4):(3'h4)] : (|reg28)) <= ((&({wire2} ~^ {reg13,
              wire17})) ^ $signed({wire24[(3'h5):(3'h5)], (^~wire0)})));
          reg35 <= $signed(wire18);
        end
      else
        begin
          reg29 <= ($unsigned($signed(wire16[(1'h1):(1'h1)])) ^ $unsigned($signed($unsigned($unsigned((8'had))))));
          reg30 <= reg6;
          reg31 <= (8'h9d);
          if ($signed($unsigned(((8'hbd) * {$signed(reg27), (reg35 > reg30)}))))
            begin
              reg32 <= (8'haf);
              reg33 <= (((wire17 >= ($unsigned(reg31) - (~|(8'hb9)))) | reg8) ?
                  (reg12 != ({(8'hba)} ?
                      $signed((reg29 ?
                          reg22 : reg33)) : ((-wire26) > $signed(reg35)))) : (({(+(8'ha5))} + $signed($signed((8'ha2)))) ?
                      (reg21[(1'h1):(1'h0)] ^~ $signed($unsigned(reg13))) : ((8'hac) ?
                          $unsigned(wire1[(4'hc):(3'h6)]) : (!((7'h44) ?
                              wire19 : wire26)))));
            end
          else
            begin
              reg32 <= $unsigned((~&{($unsigned(reg6) <= (&wire26)),
                  ($signed(wire20) & $unsigned(reg33))}));
              reg33 <= (reg13[(1'h1):(1'h0)] ?
                  ($unsigned((reg32 || $unsigned(wire1))) > (&reg11)) : (($signed((!reg33)) ?
                          ({wire19} ?
                              ((8'hb8) == wire3) : $unsigned(reg23)) : $signed((reg6 && wire0))) ?
                      reg22[(2'h2):(1'h1)] : reg30));
              reg34 <= reg27;
              reg35 <= $unsigned($signed(wire24));
            end
          reg36 <= $signed(($signed(wire1[(4'hd):(2'h2)]) ?
              $unsigned(reg9[(1'h1):(1'h1)]) : $signed($signed(wire20[(3'h4):(1'h1)]))));
        end
    end
  module37 #() modinst69 (.wire39(reg13), .wire40(wire2), .wire41(wire17), .wire42(reg4), .y(wire68), .clk(clk), .wire38(wire25));
  assign wire70 = {$signed($signed((^~$unsigned(reg11))))};
  assign wire71 = reg9[(1'h0):(1'h0)];
  module72 #() modinst105 (wire104, clk, reg14, reg21, wire68, reg23);
endmodule

module module72  (y, clk, wire73, wire74, wire75, wire76);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire73;
  input wire signed [(5'h14):(1'h0)] wire74;
  input wire [(3'h7):(1'h0)] wire75;
  input wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire102;
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  assign y = {wire77,
                 wire91,
                 wire102,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 (1'h0)};
  assign wire77 = $signed(($unsigned((~&wire74)) ?
                      ($signed($unsigned(wire74)) ?
                          (8'ha2) : $signed((&wire76))) : (^$signed(wire74[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      if ({$unsigned((wire75[(1'h0):(1'h0)] - wire76))})
        begin
          if ((&$unsigned(($signed($unsigned(wire76)) ?
              $signed((wire74 ? wire76 : wire76)) : wire75[(1'h1):(1'h1)]))))
            begin
              reg78 <= wire74[(5'h14):(3'h7)];
              reg79 <= ($signed($signed($unsigned($signed(wire77)))) ?
                  (~|(({wire76, wire76} ?
                      reg78[(1'h1):(1'h1)] : (~^(7'h41))) ^ wire76[(1'h0):(1'h0)])) : ($unsigned(reg78) ^~ $unsigned((|{wire76,
                      wire76}))));
            end
          else
            begin
              reg78 <= {wire76[(4'hc):(2'h2)]};
              reg79 <= {{({$signed(wire73)} ?
                          reg79 : (~&((8'ha1) ? wire77 : wire74)))}};
              reg80 <= $unsigned(reg79);
              reg81 <= (&wire74[(4'hf):(2'h2)]);
              reg82 <= $signed((!$signed($unsigned((reg79 ?
                  wire77 : wire77)))));
            end
          reg83 <= ($signed($signed(($unsigned(wire77) ?
                  $signed(wire74) : wire73[(2'h3):(1'h1)]))) ?
              ($unsigned(((|reg80) ? (|wire74) : ((8'hbc) >> wire73))) ?
                  (($signed(reg82) != $signed(reg81)) ?
                      (((8'ha8) ?
                          (8'ha7) : wire77) >= (^~(8'haa))) : $unsigned($unsigned((8'hb0)))) : reg78[(4'hd):(4'hc)]) : wire75[(2'h2):(2'h2)]);
          if ((!wire76[(4'h9):(4'h8)]))
            begin
              reg84 <= (^reg79[(1'h0):(1'h0)]);
              reg85 <= ((~&$unsigned($unsigned((^~wire76)))) ?
                  (^wire74) : (wire74[(5'h12):(1'h1)] ?
                      {$unsigned((wire73 < (8'h9e))),
                          (wire73 ?
                              reg83 : (wire75 ? reg84 : wire74))} : ((reg79 ?
                          (-wire76) : {reg84}) ^~ ((8'ha2) & (wire75 >= wire74)))));
              reg86 <= $unsigned($signed(wire77[(4'he):(4'hc)]));
              reg87 <= reg79[(1'h0):(1'h0)];
            end
          else
            begin
              reg84 <= ($signed((~|reg83)) + reg87[(4'ha):(3'h6)]);
              reg85 <= {$signed((~&$signed($unsigned(reg78)))),
                  (-(~^reg84[(4'hc):(4'ha)]))};
            end
          reg88 <= ((+reg81[(4'hc):(2'h2)]) || $unsigned($unsigned(wire73)));
        end
      else
        begin
          reg78 <= $signed((($signed({reg85}) ?
                  $signed(reg85) : $unsigned((-reg87))) ?
              ($unsigned($unsigned(wire74)) - $unsigned($signed(wire75))) : $unsigned($signed($unsigned(reg80)))));
          reg79 <= {$signed($unsigned((^(~|reg79))))};
          if ($unsigned($signed((({reg87, wire77} ? (reg82 || reg87) : reg84) ?
              (~|reg78) : (-(wire77 || reg87))))))
            begin
              reg80 <= (8'ha9);
              reg81 <= ($unsigned(reg79[(2'h2):(1'h1)]) ?
                  $signed((($unsigned(reg80) | $signed(wire73)) ?
                      (8'ha4) : $signed((reg78 ? wire75 : (8'hb7))))) : wire77);
            end
          else
            begin
              reg80 <= (8'h9e);
              reg81 <= $signed(wire74[(3'h7):(3'h7)]);
              reg82 <= ($unsigned((~&(~&reg78[(2'h3):(1'h0)]))) ?
                  (8'h9c) : $unsigned(reg78[(3'h6):(1'h0)]));
              reg83 <= {($unsigned(reg81[(3'h4):(1'h0)]) + reg83)};
            end
        end
      reg89 <= $unsigned($signed(wire74));
      reg90 <= ($unsigned(wire76) ? reg85 : wire77[(4'he):(3'h5)]);
    end
  assign wire91 = $signed((8'hbf));
  module92 #() modinst103 (.wire96(reg79), .wire94(reg82), .wire95(wire77), .clk(clk), .wire93(reg87), .y(wire102));
endmodule

module module37  (y, clk, wire38, wire39, wire40, wire41, wire42);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire38;
  input wire [(5'h14):(1'h0)] wire39;
  input wire [(4'hb):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire41;
  input wire [(4'hb):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire60;
  assign y = {wire67, wire66, wire65, wire64, wire63, wire62, wire60, (1'h0)};
  module43 #() modinst61 (wire60, clk, wire42, wire41, wire40, wire39, wire38);
  assign wire62 = ($unsigned(wire42) ?
                      wire42[(1'h0):(1'h0)] : (!((^~wire60[(1'h1):(1'h1)]) <<< (wire38 << wire42))));
  assign wire63 = ($signed(wire39) >= (~&($unsigned((-wire38)) ?
                      (!wire41[(3'h5):(2'h3)]) : ((wire39 ? wire39 : wire42) ?
                          (wire39 <= wire39) : $unsigned(wire40)))));
  assign wire64 = {{$signed((8'had)), (!$unsigned({(8'had)}))},
                      $signed(({(~wire62), {(8'haf), wire41}} ?
                          wire41 : $unsigned((~wire40))))};
  assign wire65 = $unsigned((~|$unsigned((~|wire38))));
  assign wire66 = $signed($signed($signed(wire41[(5'h10):(4'he)])));
  assign wire67 = (wire62 >> wire39[(5'h13):(5'h12)]);
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire [(5'h10):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire45;
  input wire [(3'h6):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg56,
                 (1'h0)};
  assign wire49 = ((wire48 ?
                      ((~((8'hab) * (8'hb3))) != {$unsigned(wire48),
                          (wire44 ?
                              wire45 : wire48)}) : (wire44 ^ $signed(((8'hbe) ?
                          (8'ha9) : wire46)))) << wire47);
  assign wire50 = wire45;
  assign wire51 = $unsigned(((~|(&(wire48 + wire49))) ?
                      (wire50 ?
                          wire46[(1'h0):(1'h0)] : wire47[(4'hf):(4'ha)]) : $signed(wire49[(3'h6):(2'h2)])));
  assign wire52 = (8'ha9);
  assign wire53 = (~^$unsigned($signed((8'hbf))));
  assign wire54 = {($signed(((wire45 ? wire46 : wire47) ?
                              (8'h9e) : (|wire48))) ?
                          wire51 : (((wire46 ? wire52 : (8'ha1)) ?
                              $unsigned(wire47) : (8'hb9)) == $unsigned(wire51[(4'h8):(3'h4)]))),
                      $signed({($unsigned((8'hbc)) ?
                              wire49 : (wire46 ? (7'h43) : (8'hbb)))})};
  assign wire55 = $signed($unsigned(wire52[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      reg56 <= (^wire49[(2'h3):(1'h1)]);
    end
  assign wire57 = {reg56[(4'h9):(3'h5)],
                      ($unsigned(((wire45 ?
                          wire47 : wire45) ~^ $unsigned((8'hbb)))) ^ (+$unsigned($signed(wire55))))};
  assign wire58 = (($signed($signed((wire51 ^ wire46))) || $unsigned((8'h9d))) ?
                      wire57 : wire54[(4'ha):(4'h8)]);
  assign wire59 = ((($unsigned(wire44) <<< wire48[(4'h9):(2'h3)]) > $signed(($unsigned(wire57) ?
                      $signed(wire48) : $unsigned(wire45)))) ^ $unsigned(reg56));
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire96;
  input wire [(3'h7):(1'h0)] wire95;
  input wire [(4'he):(1'h0)] wire94;
  input wire [(5'h15):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  assign y = {wire101, wire100, wire99, wire98, wire97, (1'h0)};
  assign wire97 = $signed($signed($unsigned((~{wire95}))));
  assign wire98 = (wire95[(1'h1):(1'h1)] & $unsigned((wire97[(5'h10):(4'hf)] > wire97)));
  assign wire99 = wire97;
  assign wire100 = wire97;
  assign wire101 = wire94;
endmodule
