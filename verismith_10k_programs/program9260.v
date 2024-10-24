module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire199;
  wire [(4'hd):(1'h0)] wire197;
  wire [(4'h8):(1'h0)] wire196;
  wire [(5'h15):(1'h0)] wire194;
  wire [(4'h9):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire192;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(4'he):(1'h0)] wire189;
  wire signed [(4'ha):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire186;
  reg signed [(4'hc):(1'h0)] reg198 = (1'h0);
  reg [(4'hd):(1'h0)] reg191 = (1'h0);
  assign y = {wire199,
                 wire197,
                 wire196,
                 wire194,
                 wire193,
                 wire192,
                 wire190,
                 wire189,
                 wire188,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire62,
                 wire64,
                 wire186,
                 reg198,
                 reg191,
                 (1'h0)};
  assign wire5 = wire1[(2'h2):(1'h0)];
  assign wire6 = $unsigned(($signed({wire4[(4'hb):(4'h9)],
                     (~^wire4)}) - wire3));
  assign wire7 = {wire6[(3'h4):(1'h0)], wire2[(2'h2):(1'h0)]};
  assign wire8 = ({wire3[(4'hf):(4'hb)],
                     $unsigned((wire4[(4'h8):(2'h2)] >> (wire5 != wire5)))} | (wire3 & $unsigned(({wire2,
                         wire3} ?
                     $signed(wire3) : wire5))));
  assign wire9 = ($unsigned($signed($signed((wire2 ?
                     wire0 : wire4)))) || {((^$unsigned((8'hb4))) ?
                         $unsigned($unsigned(wire2)) : ($unsigned(wire1) <<< (+wire7)))});
  assign wire10 = {(wire4[(4'hc):(4'h8)] ?
                          wire8 : $unsigned(wire1[(1'h0):(1'h0)])),
                      (((&$signed(wire9)) ?
                              ((!(8'hb4)) ?
                                  $signed(wire1) : (wire9 || wire6)) : ($signed(wire4) <<< wire7[(1'h1):(1'h1)])) ?
                          (|((!wire8) || $signed(wire6))) : ((8'hbb) ?
                              wire3[(4'hb):(1'h0)] : (wire0 ?
                                  (wire3 >>> wire4) : (wire5 == wire7))))};
  assign wire11 = $signed(((-wire2[(1'h0):(1'h0)]) ?
                      ({$unsigned(wire1)} ?
                          (&{wire7}) : (8'hb7)) : $signed($signed(((8'hbe) ?
                          (8'h9f) : (8'h9d))))));
  assign wire12 = $unsigned(wire0[(3'h5):(3'h5)]);
  assign wire13 = wire5;
  module14 #() modinst63 (wire62, clk, wire3, wire5, wire10, wire12);
  assign wire64 = wire2;
  module65 #() modinst187 (.y(wire186), .wire69(wire4), .wire68(wire2), .wire67(wire3), .wire70(wire6), .clk(clk), .wire66(wire0));
  assign wire188 = (($unsigned(($signed(wire8) ?
                               (wire13 && wire62) : {wire9})) ?
                           $signed({(wire6 <<< wire64),
                               $signed(wire62)}) : (wire62 ?
                               wire9[(4'h8):(1'h0)] : (~^$unsigned(wire8)))) ?
                       $unsigned({(^~{wire10, (8'hbf)})}) : $unsigned(wire5));
  assign wire189 = (wire5 ? wire13[(3'h4):(1'h0)] : (8'hb0));
  assign wire190 = (({(8'ha1)} ?
                       $signed($signed((|wire188))) : $unsigned({wire6,
                           wire4[(2'h2):(1'h1)]})) != $unsigned($signed($unsigned(wire62[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg191 <= (wire10 << (~wire0[(1'h0):(1'h0)]));
    end
  assign wire192 = $unsigned(((~^wire7) ?
                       {wire189[(3'h7):(1'h0)]} : ($unsigned($unsigned(wire188)) != (wire11[(4'h9):(2'h2)] ?
                           {(8'hb8)} : $unsigned(wire4)))));
  assign wire193 = $unsigned($signed($unsigned(wire13)));
  module14 #() modinst195 (wire194, clk, wire189, wire7, wire64, wire190);
  assign wire196 = wire4[(3'h5):(3'h5)];
  assign wire197 = wire1[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg198 <= (-(~|wire11));
    end
  assign wire199 = ((+wire7) || $unsigned({wire13[(1'h1):(1'h0)]}));
endmodule

module module65  (y, clk, wire66, wire67, wire68, wire69, wire70);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire66;
  input wire signed [(5'h14):(1'h0)] wire67;
  input wire [(3'h5):(1'h0)] wire68;
  input wire [(2'h2):(1'h0)] wire69;
  input wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire185;
  wire signed [(2'h3):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire105;
  assign y = {wire185,
                 wire183,
                 wire109,
                 wire108,
                 wire107,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire105,
                 (1'h0)};
  assign wire71 = $signed((wire70[(4'h8):(2'h3)] >>> (|$unsigned(((8'h9f) >= wire70)))));
  assign wire72 = $signed($unsigned({({wire68} ?
                          wire66[(4'hb):(1'h0)] : {wire69, wire71}),
                      ((wire70 && wire68) ?
                          (wire66 ? wire71 : (8'ha1)) : wire67)}));
  assign wire73 = wire72[(2'h2):(2'h2)];
  assign wire74 = ({$unsigned($unsigned((wire67 ?
                          (8'hbe) : (8'ha5))))} << wire66[(4'hc):(3'h5)]);
  assign wire75 = (^~wire69);
  assign wire76 = wire73[(1'h0):(1'h0)];
  assign wire77 = (8'hbf);
  module78 #() modinst106 (wire105, clk, wire77, wire75, wire67, wire76, wire72);
  assign wire107 = (($unsigned(wire72[(4'hb):(4'h9)]) ?
                           {$unsigned((~&wire73)),
                               (wire75[(4'hf):(4'h9)] >> wire69)} : (7'h40)) ?
                       wire73 : (&(&{(wire76 ? wire77 : wire77), (+wire68)})));
  assign wire108 = ((|wire70[(3'h4):(1'h0)]) ?
                       wire105 : {(!wire67), $unsigned((~^(|wire71)))});
  assign wire109 = (-(wire107[(4'hb):(1'h0)] ?
                       (wire76 ?
                           ($unsigned(wire77) ?
                               {wire67,
                                   wire67} : $signed((8'hbf))) : (8'ha5)) : (~|{(wire68 ?
                               wire71 : wire70),
                           wire69[(2'h2):(2'h2)]})));
  module110 #() modinst184 (.clk(clk), .wire113(wire67), .wire111(wire107), .y(wire183), .wire112(wire75), .wire114(wire72));
  assign wire185 = (-(($signed((wire108 == (8'ha0))) ?
                       (|wire71[(3'h4):(2'h3)]) : $unsigned({wire74})) <<< (wire105 ~^ ((|wire107) ?
                       wire183 : (wire77 ? wire68 : wire66)))));
endmodule

module module14
#(parameter param60 = ({(({(8'h9c), (8'haa)} ? {(8'hac), (8'ha9)} : ((8'hb6) <= (8'haf))) ? (~^{(8'hbe)}) : ((+(8'haf)) ? ((8'ha2) ? (8'h9e) : (8'ha2)) : {(8'hbd), (8'ha7)})), (8'hbc)} ^ (((^~(^~(7'h41))) ? (&((8'hb3) ? (8'h9d) : (8'h9e))) : {{(8'ha8)}, (|(8'hb0))}) ? (((~&(8'hb6)) ~^ ((8'haf) ? (8'ha8) : (8'had))) ? (((8'h9d) ? (8'hb4) : (8'had)) ? ((8'had) ? (8'hab) : (8'hba)) : ((8'haa) ? (8'hab) : (8'hac))) : (((8'hb0) ? (8'had) : (8'ha5)) ? {(8'had)} : (8'ha7))) : ((~^((8'hb6) ? (7'h41) : (8'hb7))) ? (((8'hb6) ? (8'hb4) : (8'hb1)) ? (~^(8'hbb)) : {(8'hbd), (7'h42)}) : (((8'hbd) ? (8'hae) : (8'hb2)) < {(8'ha2), (8'ha7)})))), 
parameter param61 = param60)
(y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire55;
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire55,
                 (1'h0)};
  assign wire19 = wire17;
  assign wire20 = (wire16[(2'h3):(1'h0)] < (~|(((wire17 ? wire19 : wire18) ?
                          {wire18, wire18} : wire18) ?
                      wire19 : {wire16[(1'h0):(1'h0)]})));
  assign wire21 = (8'ha9);
  assign wire22 = $unsigned(({((wire21 ? (8'hb3) : wire20) < $signed(wire19)),
                      (((8'hae) ? wire16 : wire21) * (wire20 ?
                          wire17 : wire15))} ^~ wire18[(2'h2):(1'h1)]));
  module23 #() modinst56 (.wire25(wire22), .wire27(wire19), .wire28(wire20), .wire26(wire21), .clk(clk), .wire24(wire16), .y(wire55));
  assign wire57 = wire20;
  assign wire58 = wire19[(4'he):(4'h8)];
  assign wire59 = (~^wire19[(2'h2):(2'h2)]);
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire [(4'he):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire29;
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire34,
                 wire33,
                 wire29,
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
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire29 = ((wire27 ?
                      wire28 : (($signed(wire24) || wire27) ?
                          ($signed((8'hbb)) ?
                              wire28 : $unsigned((8'hb5))) : $signed($unsigned(wire28)))) <= ((~$unsigned({wire24})) ?
                      (((^~wire25) < $signed(wire27)) && wire28[(1'h0):(1'h0)]) : wire25));
  always
    @(posedge clk) begin
      reg30 <= (wire28 ? wire27 : wire25);
      reg31 <= wire28;
      reg32 <= (((wire27[(3'h5):(2'h2)] ?
              (wire26 <= (wire25 ?
                  (8'ha8) : reg30)) : wire25) + $unsigned($signed(reg30))) ?
          $signed($signed(($unsigned(wire24) < wire28))) : (wire29 << $unsigned((+$signed(wire28)))));
    end
  assign wire33 = $signed((-reg30));
  assign wire34 = $signed((7'h42));
  always
    @(posedge clk) begin
      if ((wire34 ? $unsigned((reg32 >>> (8'had))) : (+wire24)))
        begin
          if (reg31[(4'hd):(1'h1)])
            begin
              reg35 <= (~((~^$signed((~|wire25))) << wire34));
              reg36 <= reg32[(5'h12):(3'h5)];
              reg37 <= $signed($signed($signed(((^~wire29) == (wire28 ?
                  wire29 : wire28)))));
              reg38 <= $unsigned(reg31[(4'h8):(3'h4)]);
              reg39 <= wire25[(3'h7):(1'h0)];
            end
          else
            begin
              reg35 <= $unsigned($unsigned($unsigned(((reg31 ^~ wire34) ?
                  $unsigned(reg39) : (wire33 <= (8'ha9))))));
              reg36 <= {$signed($unsigned(reg38)),
                  {$unsigned(wire33[(4'hc):(3'h5)])}};
              reg37 <= wire25;
              reg38 <= wire28[(2'h2):(1'h1)];
            end
        end
      else
        begin
          if ((reg36 != wire29))
            begin
              reg35 <= $unsigned({wire29, (!(^~(!wire33)))});
            end
          else
            begin
              reg35 <= $signed((reg36[(4'he):(4'he)] ?
                  reg36[(3'h5):(3'h5)] : reg36[(3'h4):(2'h2)]));
              reg36 <= (wire29[(1'h0):(1'h0)] ^ wire27[(4'ha):(1'h0)]);
              reg37 <= (-reg30);
            end
          reg38 <= $signed(reg32);
          reg39 <= (($signed((((8'hb9) ? wire29 : wire28) ?
                  reg38 : $unsigned(wire29))) - ($unsigned((reg38 ?
                  reg36 : wire24)) ~^ ((^~(7'h42)) ?
                  $unsigned(wire24) : (wire28 ? wire25 : (8'hb3))))) ?
              (((wire24[(4'hb):(4'h8)] ?
                  $unsigned((8'ha6)) : {reg37}) >>> (!(~&reg32))) | $signed((reg32[(4'hc):(2'h3)] ?
                  (wire28 ? reg37 : wire24) : (wire29 >> reg37)))) : {{reg32,
                      $unsigned(wire33[(2'h3):(2'h3)])},
                  reg38[(2'h2):(1'h1)]});
          if ($unsigned(reg37[(3'h6):(1'h0)]))
            begin
              reg40 <= $unsigned(reg38[(2'h2):(1'h0)]);
              reg41 <= wire34;
              reg42 <= ({((~|(wire29 ? reg32 : reg36)) << ((reg32 ?
                      wire25 : (7'h43)) < (~^wire25)))} < $unsigned((((~wire27) ?
                      reg37 : {reg35}) ?
                  $unsigned((|(8'hbf))) : $unsigned($signed(reg40)))));
              reg43 <= (reg41 * (({(reg42 ? wire29 : reg31), (~&wire26)} ?
                  $signed(wire33) : $unsigned($signed((7'h43)))) ^ (~wire27[(3'h5):(2'h2)])));
            end
          else
            begin
              reg40 <= wire28;
              reg41 <= (&wire25);
            end
          if ((!$unsigned(reg37)))
            begin
              reg44 <= $unsigned($unsigned($unsigned((reg41[(1'h1):(1'h1)] ?
                  {(8'h9e), reg38} : wire34[(5'h12):(4'hf)]))));
              reg45 <= $unsigned($unsigned(($unsigned(wire25[(3'h7):(2'h2)]) + (reg32 < $unsigned(reg41)))));
              reg46 <= (reg35 ?
                  $signed(reg37[(4'h8):(2'h2)]) : ($signed({$unsigned(wire24),
                          $signed(wire28)}) ?
                      $signed((~&reg42[(3'h6):(1'h1)])) : $signed(({reg37} ?
                          $signed(reg37) : $unsigned(reg30)))));
              reg47 <= wire28[(1'h0):(1'h0)];
              reg48 <= {$unsigned({reg41, reg30[(4'h9):(1'h0)]}),
                  reg40[(4'h8):(3'h6)]};
            end
          else
            begin
              reg44 <= ((wire25 || (wire27[(2'h3):(1'h0)] ?
                      (^((8'hb2) ?
                          wire28 : reg45)) : $signed((reg42 | reg32)))) ?
                  wire27 : reg35);
              reg45 <= reg45;
              reg46 <= (&(^(|({reg47, (8'ha0)} ^~ (8'ha4)))));
              reg47 <= ($signed((|(^reg42))) ?
                  reg44[(3'h5):(1'h0)] : ((($signed(reg37) & $signed(reg36)) >> $signed({reg31})) & $signed($signed(reg35))));
              reg48 <= ((8'hbb) ?
                  wire34 : (wire34 ?
                      ($unsigned(reg38) | $signed($signed(wire26))) : reg42));
            end
        end
      reg49 <= ({{reg30[(3'h5):(1'h0)], (8'hab)},
          (~|reg30)} >= ((8'hbd) <= ((+(reg44 > reg45)) && ((wire27 ?
          (7'h42) : (8'hb9)) < $unsigned(reg39)))));
      reg50 <= reg38;
      reg51 <= {reg32, $signed($unsigned(reg38))};
    end
  assign wire52 = $unsigned((~{(reg41[(1'h1):(1'h0)] ?
                          $unsigned(reg49) : (8'ha2))}));
  assign wire53 = ((((wire33[(4'hc):(3'h4)] == $unsigned((8'hb8))) == (wire26 ?
                      wire26[(4'hd):(4'hd)] : $unsigned(reg40))) != reg38[(3'h6):(1'h0)]) && $unsigned((^~reg50)));
  assign wire54 = (~^(~&$signed($signed($unsigned(reg40)))));
endmodule

module module110
#(parameter param182 = {{({((8'hb2) ? (8'hac) : (8'ha1)), ((8'hbc) ? (8'hbb) : (8'ha7))} <<< ((~&(8'hbc)) ? ((8'hb4) ^~ (7'h42)) : ((8'ha2) >= (8'hae)))), (({(8'h9f), (8'h9f)} ? {(8'hae)} : {(8'ha0), (8'ha4)}) ? (((8'hb0) && (8'hbd)) ^~ ((8'hb3) ? (8'ha3) : (8'hb4))) : {((8'ha7) | (8'ha6)), ((8'ha8) ~^ (8'ha5))})}, ((8'hb7) ? {{(8'haa)}, (~^((7'h44) >>> (8'hbc)))} : (8'ha4))})
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h2cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire114;
  input wire [(3'h7):(1'h0)] wire113;
  input wire signed [(4'hb):(1'h0)] wire112;
  input wire [(4'hb):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire168;
  wire [(4'h8):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire153;
  wire signed [(5'h11):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  reg signed [(2'h2):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg179 = (1'h0);
  reg [(4'ha):(1'h0)] reg178 = (1'h0);
  reg [(4'hf):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(4'hd):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  assign y = {wire180,
                 wire168,
                 wire167,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg181,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire115 = (^wire113[(3'h5):(3'h5)]);
  assign wire116 = ((~wire113[(2'h2):(1'h0)]) - $unsigned(wire115[(4'h8):(1'h0)]));
  assign wire117 = ({(wire111[(2'h2):(2'h2)] ?
                           wire111[(4'hb):(4'hb)] : wire111),
                       ($signed((wire114 ? (8'h9e) : wire114)) ?
                           $signed((wire111 <= (8'hb6))) : wire111[(4'h8):(3'h7)])} >>> ({(wire112[(1'h0):(1'h0)] >> (wire114 ?
                               wire111 : wire115))} ?
                       (!((wire115 ?
                           wire116 : wire111) == {wire112})) : $unsigned(((wire113 | (8'hb4)) ?
                           $unsigned(wire113) : {(8'ha2)}))));
  assign wire118 = wire113;
  assign wire119 = wire117[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((8'hb9))
        begin
          if ((^~$signed($signed(({wire117, wire119} <= wire111)))))
            begin
              reg120 <= (($unsigned($unsigned(wire115)) ^ wire115[(2'h2):(2'h2)]) ^~ (wire115[(3'h4):(2'h3)] & (-(~wire117[(1'h1):(1'h0)]))));
              reg121 <= ((|$signed({(wire111 ^~ wire116)})) - (!(~|(^~(wire114 ?
                  wire114 : wire113)))));
              reg122 <= (($unsigned((|$signed(reg120))) ?
                      wire115 : wire111[(2'h3):(1'h1)]) ?
                  ($unsigned((8'hb0)) ?
                      wire111 : ($unsigned({wire117, wire115}) ?
                          reg120[(4'h8):(2'h2)] : ($unsigned(wire118) - {wire119}))) : $unsigned($signed(((reg121 && wire115) ?
                      {wire116, wire117} : wire118[(2'h2):(1'h1)]))));
              reg123 <= (((7'h44) >>> ($signed(reg122[(2'h2):(2'h2)]) ?
                      ((~wire117) | (wire111 ?
                          wire117 : reg122)) : ($unsigned(wire115) ?
                          (|reg121) : {wire114}))) ?
                  $unsigned((~(8'h9e))) : $unsigned(wire113[(3'h5):(2'h2)]));
              reg124 <= wire117;
            end
          else
            begin
              reg120 <= wire118;
              reg121 <= (reg120 ~^ ($signed((~wire116[(3'h6):(3'h5)])) ?
                  $signed(wire112[(3'h5):(1'h0)]) : (reg121[(1'h0):(1'h0)] && {(wire113 ?
                          wire117 : reg124),
                      $unsigned(reg122)})));
              reg122 <= (($unsigned(reg123) * wire116) + (-$unsigned($unsigned((wire113 <= wire111)))));
            end
          reg125 <= reg124;
          reg126 <= (^wire117[(1'h1):(1'h1)]);
          reg127 <= {$signed((+({reg125} ? $signed((8'ha1)) : {wire111}))),
              wire112};
          reg128 <= $signed(($signed((wire113 | (reg121 ?
              reg122 : wire113))) ^ $signed(reg123[(1'h1):(1'h1)])));
        end
      else
        begin
          reg120 <= (wire111[(3'h5):(1'h1)] <<< (((&((8'ha6) ?
                      reg121 : reg124)) ?
                  reg123[(1'h1):(1'h1)] : ({reg128,
                      reg128} != (reg125 ^ (8'h9c)))) ?
              wire116 : reg126[(2'h3):(2'h3)]));
          reg121 <= (8'hbb);
          reg122 <= {$signed(($unsigned(((8'hb3) ? wire114 : wire113)) ?
                  ((reg125 ?
                      (7'h43) : (8'hae)) <<< wire113[(1'h1):(1'h0)]) : ((wire111 < (8'h9d)) < {(8'hb9),
                      wire114}))),
              reg124[(3'h6):(3'h6)]};
          if ((wire111[(4'ha):(4'h8)] ? $signed(reg122) : wire115))
            begin
              reg123 <= $signed(wire117[(1'h1):(1'h0)]);
              reg124 <= $signed({(($unsigned(reg122) ^~ (wire113 << wire117)) ~^ reg123[(2'h2):(1'h1)])});
            end
          else
            begin
              reg123 <= reg121;
              reg124 <= $unsigned(reg121[(1'h1):(1'h1)]);
              reg125 <= reg125;
              reg126 <= $unsigned((+reg128));
            end
        end
      reg129 <= $signed(reg127[(5'h10):(4'hf)]);
      reg130 <= reg121[(2'h3):(2'h2)];
      if ((wire115 && reg128[(5'h12):(4'he)]))
        begin
          reg131 <= reg126[(4'hc):(4'hc)];
          if ($unsigned($signed($unsigned(((|(8'had)) >>> (wire111 >>> reg128))))))
            begin
              reg132 <= {$unsigned(reg123)};
            end
          else
            begin
              reg132 <= ((8'ha5) ?
                  $unsigned({(7'h44)}) : $signed($signed(($unsigned(wire117) ?
                      reg126[(3'h4):(2'h3)] : $unsigned(reg132)))));
              reg133 <= wire115;
              reg134 <= ((^~$signed(reg127[(1'h0):(1'h0)])) ?
                  $unsigned(wire113) : ({$unsigned(wire116[(4'ha):(3'h6)])} != $unsigned((((8'hb2) ?
                      wire113 : reg133) ^~ ((8'ha0) < wire113)))));
              reg135 <= wire112;
            end
        end
      else
        begin
          reg131 <= {(8'ha3)};
        end
      reg136 <= reg129[(2'h2):(2'h2)];
    end
  assign wire137 = (-(reg129 ?
                       $signed(((wire115 ?
                           reg120 : reg120) * $unsigned((8'hb5)))) : $unsigned(((reg132 ?
                           reg135 : reg130) * reg133[(1'h1):(1'h1)]))));
  assign wire138 = ($unsigned((reg131 ?
                           ((reg129 ? (8'hae) : wire137) ?
                               reg120[(3'h6):(1'h0)] : (reg129 ^ reg133)) : ((reg123 != reg135) | $signed(reg133)))) ?
                       {(wire137[(3'h7):(1'h0)] & ((reg130 <= reg128) ?
                               reg123 : (8'h9f))),
                           ($unsigned(reg120[(1'h1):(1'h0)]) >>> $unsigned((reg132 ?
                               wire119 : wire112)))} : reg136[(4'ha):(4'h9)]);
  assign wire139 = (^~reg123);
  assign wire140 = reg130;
  assign wire141 = reg130[(3'h5):(1'h0)];
  assign wire142 = $unsigned((+(~&(reg127[(5'h10):(2'h2)] ?
                       {reg130} : (~(7'h44))))));
  always
    @(posedge clk) begin
      if ({((~(reg128[(2'h3):(2'h3)] ? (8'h9e) : (~wire118))) ?
              ($unsigned($signed(wire139)) ?
                  (reg136 ?
                      ((8'ha5) ? reg136 : wire112) : (wire138 ?
                          wire119 : reg128)) : (reg133 ?
                      reg121 : $unsigned(wire137))) : (reg122 != ($signed(reg129) && ((8'hbb) ?
                  wire137 : wire113)))),
          $signed(reg121[(2'h3):(1'h0)])})
        begin
          if (($signed({{$unsigned((7'h40)), ((8'ha4) - wire141)},
                  $unsigned((~(8'h9f)))}) ?
              $signed({(~&wire139[(3'h4):(2'h3)]),
                  (+{wire113})}) : ((reg134 >>> wire112) ?
                  ($unsigned($unsigned(wire116)) ?
                      {$unsigned(wire138)} : $signed((wire140 ?
                          (8'hb5) : wire114))) : $signed({(reg131 ?
                          wire138 : wire111)}))))
            begin
              reg143 <= $signed(((wire142[(5'h11):(3'h7)] ^~ ((reg126 ?
                      reg128 : wire139) ?
                  (wire142 > (7'h44)) : (reg129 ?
                      wire113 : reg133))) << wire116[(3'h4):(1'h1)]));
              reg144 <= (reg127 ?
                  reg132[(2'h3):(1'h0)] : (reg124 ?
                      $signed(wire140) : (reg124 >>> wire117)));
              reg145 <= (+$unsigned((($unsigned(wire112) ~^ $unsigned(wire117)) ?
                  (~&wire114) : ((~|reg128) << (-wire114)))));
              reg146 <= {{(&((reg122 | wire141) >>> (reg143 >>> reg144)))}};
              reg147 <= (&({(((7'h41) ? wire140 : wire139) >>> reg143)} ?
                  (8'hbe) : ((~^wire138[(5'h11):(4'ha)]) ?
                      wire112 : $unsigned((-reg134)))));
            end
          else
            begin
              reg143 <= reg129[(2'h2):(1'h1)];
              reg144 <= $signed(wire112[(4'h9):(1'h0)]);
              reg145 <= ((reg147 ?
                  $signed(reg136) : ({(reg122 ~^ wire140)} >= ({(8'hae),
                      wire117} != $unsigned(reg122)))) ^ {wire117});
            end
          if ((8'hb3))
            begin
              reg148 <= wire111;
              reg149 <= reg145[(1'h0):(1'h0)];
            end
          else
            begin
              reg148 <= ({{((wire138 ~^ (8'ha2)) ? (+wire112) : wire140),
                      ((wire113 ?
                          reg135 : reg124) ^ reg124[(2'h2):(1'h0)])}} != ((^($signed(reg125) + (reg121 ?
                      wire111 : wire114))) ?
                  ({reg126} ?
                      reg144[(3'h5):(3'h5)] : {reg124[(3'h6):(3'h5)]}) : reg134));
              reg149 <= $unsigned((reg123 ?
                  $unsigned({wire139}) : $unsigned({(~|reg131)})));
            end
          reg150 <= (&wire116);
        end
      else
        begin
          if (wire111)
            begin
              reg143 <= (wire140 ?
                  $unsigned({(wire113 ?
                          $signed(reg133) : $signed(reg125))}) : wire142);
              reg144 <= wire119;
              reg145 <= (reg128 <= (!$signed(reg127[(3'h5):(1'h0)])));
            end
          else
            begin
              reg143 <= (((^($signed(reg128) >= {wire115})) - ((^~(^~(8'hb3))) ?
                  wire114 : reg147)) ^ $signed($unsigned({(|reg122)})));
              reg144 <= (~^(((^~(wire138 ? reg131 : (8'hbe))) ?
                      (^~(reg133 != reg121)) : (~&$unsigned(reg135))) ?
                  (&wire141[(2'h2):(2'h2)]) : ($unsigned($signed(wire116)) + $signed((reg129 ?
                      reg126 : wire112)))));
              reg145 <= $unsigned(reg146[(1'h1):(1'h1)]);
              reg146 <= ((~(((|reg123) ? $signed(wire112) : {wire138}) ?
                  $signed((~&wire117)) : reg127[(3'h6):(1'h1)])) || $signed((($signed((8'ha9)) * $unsigned(wire117)) ?
                  ($unsigned(reg124) ?
                      reg136 : (reg130 ?
                          wire141 : wire141)) : $unsigned($signed(reg125)))));
              reg147 <= (reg147[(1'h0):(1'h0)] ?
                  reg124[(1'h1):(1'h0)] : ((|$signed((reg143 < reg144))) || {((&wire141) ?
                          $signed(reg134) : ((8'ha9) ? wire140 : reg122))}));
            end
          reg148 <= $signed($unsigned((^{reg147[(1'h0):(1'h0)]})));
        end
      reg151 <= reg123[(1'h0):(1'h0)];
    end
  assign wire152 = $unsigned(reg120[(3'h5):(3'h5)]);
  assign wire153 = (($signed(({reg143, (8'hb6)} ?
                           (reg128 ? reg148 : wire140) : (reg145 ?
                               reg133 : reg129))) ?
                       $unsigned((8'hb5)) : $unsigned(((reg134 ?
                           reg122 : (8'hbf)) + (wire111 ?
                           reg149 : wire152)))) ^ (~|reg147[(3'h4):(2'h3)]));
  assign wire154 = (~(^~($signed($signed(wire137)) ~^ $signed($unsigned(reg130)))));
  assign wire155 = (|(8'h9d));
  always
    @(posedge clk) begin
      if ($unsigned((8'ha7)))
        begin
          reg156 <= $unsigned(wire142);
          reg157 <= ((-$unsigned(($unsigned(reg124) ?
                  $signed(wire137) : $unsigned(reg143)))) ?
              $unsigned(reg143[(3'h5):(3'h5)]) : (reg131[(2'h2):(2'h2)] ?
                  ($unsigned(wire118) >> (~$unsigned(reg147))) : $signed(wire142)));
        end
      else
        begin
          if ($signed((reg150 ?
              {(reg121[(1'h1):(1'h0)] > reg149[(1'h0):(1'h0)]),
                  ((reg151 ^ wire152) ^~ (reg136 <<< reg151))} : $signed((~$signed(wire153))))))
            begin
              reg156 <= (7'h43);
              reg157 <= {wire155, wire141[(4'hd):(2'h3)]};
              reg158 <= wire117[(2'h2):(2'h2)];
              reg159 <= $unsigned(wire142[(3'h7):(1'h1)]);
            end
          else
            begin
              reg156 <= wire138;
              reg157 <= reg120[(5'h10):(4'ha)];
            end
          reg160 <= (~|reg147[(1'h0):(1'h0)]);
          reg161 <= wire113;
          reg162 <= (reg135 ?
              $signed({(wire117 ?
                      (wire114 - (8'had)) : $unsigned(reg125))}) : ((wire141 ?
                      $unsigned((reg146 <= wire115)) : $signed(((8'hb9) ?
                          reg149 : wire111))) ?
                  (|{(reg132 ?
                          wire140 : (8'hbe))}) : $unsigned(reg126[(4'hd):(1'h1)])));
          if ((~|$unsigned($signed(((8'ha2) ?
              ((8'ha3) ? reg148 : reg127) : $signed(reg123))))))
            begin
              reg163 <= (^~$signed(reg122));
            end
          else
            begin
              reg163 <= $unsigned(reg151);
            end
        end
      reg164 <= (~wire119);
      reg165 <= ($signed($unsigned(reg150[(2'h3):(2'h3)])) ?
          ((~|reg146[(2'h3):(2'h2)]) ?
              ((wire113 ? $signed(reg162) : (+reg133)) ?
                  $signed(wire117) : ((^~reg124) & (|(8'ha6)))) : (~|(~^(reg150 || reg160)))) : reg149[(2'h2):(2'h2)]);
      reg166 <= $unsigned(reg165);
    end
  assign wire167 = $signed(((wire111 ?
                       $unsigned({reg148}) : ($signed((8'ha2)) ?
                           $unsigned(reg135) : wire114)) - reg130[(1'h1):(1'h0)]));
  assign wire168 = reg144;
  always
    @(posedge clk) begin
      if ($unsigned((&($unsigned(((7'h43) ? reg161 : (8'h9c))) ?
          ((!wire117) != (wire116 ~^ (8'ha7))) : ((reg121 >> (8'hae)) ~^ (reg165 <= reg127))))))
        begin
          if (wire167)
            begin
              reg169 <= $unsigned(reg163);
            end
          else
            begin
              reg169 <= reg165;
              reg170 <= ((((~reg133) ?
                      (&wire152) : $unsigned({(8'hba),
                          wire152})) != $unsigned($unsigned((wire119 ?
                      reg124 : reg136)))) ?
                  $signed((wire137[(3'h4):(3'h4)] || wire116[(4'h8):(1'h1)])) : $unsigned(wire139));
              reg171 <= reg147[(1'h0):(1'h0)];
            end
          reg172 <= (+(8'hab));
          reg173 <= (reg169[(2'h2):(1'h0)] ?
              (-(-(~$unsigned(wire111)))) : ((8'hab) ?
                  {((reg166 ? reg133 : (8'hb1)) << {wire152,
                          wire167})} : $signed({(^~(8'ha0)),
                      (wire140 >>> reg133)})));
          reg174 <= reg171[(4'he):(4'hb)];
        end
      else
        begin
          if ($unsigned(wire116))
            begin
              reg169 <= (wire139[(3'h6):(3'h4)] ?
                  (8'ha5) : $signed({(reg132 ? {reg172} : (reg130 | reg134))}));
              reg170 <= $signed((~^wire139));
            end
          else
            begin
              reg169 <= (reg164[(3'h6):(2'h2)] ?
                  $unsigned($unsigned(($unsigned(reg124) + $signed(reg147)))) : (~&({reg131[(4'hb):(4'hb)]} + ((&(8'ha9)) || {wire152}))));
              reg170 <= reg157;
              reg171 <= reg134[(4'hc):(2'h3)];
            end
          if ({{(reg149 >> wire168), reg135[(4'he):(4'he)]}})
            begin
              reg172 <= ({(~|$signed($unsigned(reg157)))} || (+(8'ha3)));
              reg173 <= wire167;
              reg174 <= $unsigned(reg131[(4'hb):(2'h2)]);
              reg175 <= ({{$signed(reg135)},
                  reg172} >= ($signed({$signed(wire139),
                  (!wire117)}) || reg170[(1'h1):(1'h1)]));
            end
          else
            begin
              reg172 <= (((!((~|reg173) ? (8'h9f) : $unsigned(reg126))) ?
                      {({wire152} >= {reg123})} : reg120[(2'h3):(1'h0)]) ?
                  $signed((8'hb2)) : (8'hb3));
              reg173 <= {$unsigned(({(&reg127), (reg145 ? reg135 : reg170)} ?
                      reg129[(2'h2):(1'h0)] : $unsigned($unsigned(reg169)))),
                  (~$signed($unsigned((reg133 == (8'hac)))))};
            end
          reg176 <= (~|$signed((((reg133 ? (8'hb8) : reg145) ?
                  $signed((7'h43)) : (wire114 ^~ reg160)) ?
              (8'hb9) : $signed(wire141[(3'h6):(3'h5)]))));
          reg177 <= reg122;
        end
      reg178 <= (+$unsigned($unsigned($signed(reg128[(5'h10):(4'h8)]))));
      reg179 <= (~&reg131[(5'h10):(2'h3)]);
    end
  assign wire180 = wire141;
  always
    @(posedge clk) begin
      reg181 <= (~{(((wire152 > reg127) ? {wire141} : (~^reg121)) ?
              $unsigned(reg165) : {(!(8'hb8))})});
    end
endmodule

module module78
#(parameter param104 = {(({((8'hab) ? (8'ha3) : (8'ha7))} ? ({(8'hb8), (7'h42)} ? ((8'hbc) ? (7'h44) : (8'haa)) : ((8'ha6) ? (8'hbc) : (8'ha1))) : (((8'haa) ? (7'h43) : (7'h40)) ? ((8'ha9) <<< (8'ha6)) : ((8'ha5) ? (8'ha9) : (8'hb6)))) ? {({(8'ha1), (7'h40)} && ((7'h40) >= (8'hbf)))} : {(((8'hb5) <= (8'hb7)) ^~ ((8'hae) ^ (7'h42))), (~^{(8'ha1)})}), ((|(~&(^(8'h9f)))) ? ((^~(~&(8'h9e))) & ((&(8'ha9)) ~^ {(7'h41)})) : ({(-(8'ha8))} << (-(^~(7'h40)))))})
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire82;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire [(5'h10):(1'h0)] wire80;
  input wire signed [(4'he):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire85,
                 wire84,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire84 = (~|(^~$unsigned(wire79[(3'h6):(3'h6)])));
  assign wire85 = wire81[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg86 <= (wire84[(2'h3):(1'h0)] + wire84[(2'h3):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg87 <= wire85;
      reg88 <= reg87;
      reg89 <= {{(~^(reg87[(2'h3):(2'h3)] + (&wire79)))}};
      reg90 <= reg89;
      if ($signed((~|wire85)))
        begin
          if (((~^reg86[(5'h10):(4'hd)]) ?
              {{($unsigned(wire82) + wire83[(4'ha):(3'h7)])},
                  wire81[(3'h7):(2'h3)]} : reg88[(2'h2):(2'h2)]))
            begin
              reg91 <= wire83[(2'h2):(1'h0)];
              reg92 <= (reg91[(5'h12):(4'hd)] || ((((8'hbf) ?
                  {(8'ha0), wire82} : {wire81}) >>> (^wire84)) - ((reg91 ?
                  $signed(wire84) : wire80[(3'h7):(2'h3)]) == (wire80 ?
                  wire80 : reg91[(4'he):(4'hc)]))));
              reg93 <= ($signed(((8'hbb) >= $signed((wire83 * wire80)))) ?
                  (($unsigned({(8'ha9),
                          (8'ha5)}) << ((^reg89) < wire80[(4'h9):(3'h6)])) ?
                      wire82 : wire83[(4'hc):(3'h5)]) : wire84[(3'h4):(1'h1)]);
              reg94 <= $signed(wire85[(3'h7):(3'h6)]);
              reg95 <= $unsigned(reg90);
            end
          else
            begin
              reg91 <= {$unsigned($signed((~&(^wire80)))),
                  $signed($unsigned($unsigned((wire81 ? (8'hb9) : reg95))))};
              reg92 <= (&wire81[(3'h4):(2'h2)]);
              reg93 <= wire84;
              reg94 <= {($unsigned({wire80}) - (!(|(wire79 ?
                      reg94 : wire79))))};
              reg95 <= $signed($unsigned(reg89[(3'h4):(1'h0)]));
            end
          reg96 <= $unsigned((+wire79));
        end
      else
        begin
          reg91 <= ($signed((^~{(reg89 ? reg95 : (8'hb3)), $signed(reg93)})) ?
              ({((wire83 << wire79) ? (^reg90) : $signed(wire79))} ?
                  wire79 : wire83[(4'hb):(4'h9)]) : (^~{reg96[(1'h1):(1'h1)]}));
          reg92 <= $unsigned($unsigned(reg89));
        end
    end
  assign wire97 = $signed($signed(((+(reg96 & (8'ha8))) ?
                      (wire83 ? $unsigned(wire82) : (-(8'ha5))) : wire85)));
  assign wire98 = ($signed(((wire79 & (+reg96)) ?
                          $unsigned(wire79) : ((reg88 >>> (8'hb5)) ?
                              $unsigned(reg89) : $unsigned(wire81)))) ?
                      $unsigned((wire84 ?
                          (8'hb3) : reg90)) : reg92[(1'h1):(1'h1)]);
  assign wire99 = ($unsigned((-$signed($unsigned(reg91)))) ?
                      ((^$unsigned((8'ha8))) ?
                          (8'ha4) : (!($unsigned(wire85) ^~ reg93[(3'h7):(2'h3)]))) : ($unsigned($signed(wire98)) ?
                          {$unsigned((8'hb0))} : $signed({$signed(wire85),
                              (reg94 ? reg91 : reg96)})));
  assign wire100 = (wire98 ?
                       {$signed($signed($unsigned(reg87))),
                           $signed(((reg86 ? wire83 : wire79) ?
                               (reg96 ?
                                   wire85 : wire99) : $signed(reg94)))} : ($unsigned(reg89) ^ ({$unsigned((8'hac))} ?
                           ((|reg92) ?
                               (wire98 ?
                                   (8'had) : reg93) : reg87[(5'h12):(4'hf)]) : reg90)));
  assign wire101 = {(~((~|{reg91}) * ((wire83 ? reg93 : reg94) && (~|reg90)))),
                       (reg89 || wire80[(4'he):(3'h5)])};
  assign wire102 = reg91[(5'h12):(3'h5)];
  assign wire103 = reg92[(3'h5):(1'h0)];
endmodule
