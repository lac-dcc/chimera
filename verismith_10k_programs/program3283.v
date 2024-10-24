module top
#(parameter param78 = (8'hb9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire7,
                 wire6,
                 wire5,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = (((($unsigned(wire1) && $signed(wire4)) ~^ (^~wire3)) ?
                     wire2 : ($signed(wire1[(2'h2):(1'h1)]) ?
                         ((~^wire4) * (wire2 >>> wire0)) : (^(wire4 || wire2)))) ^ {wire0[(2'h2):(1'h1)],
                     ((wire0[(1'h1):(1'h0)] ?
                         wire2[(1'h1):(1'h1)] : $signed(wire0)) != $signed($unsigned(wire3)))});
  assign wire6 = (($signed($unsigned((~^(8'ha6)))) & $signed(((&wire4) ?
                         wire1 : $unsigned(wire1)))) ?
                     wire3[(2'h2):(2'h2)] : $signed(($unsigned($signed(wire4)) ?
                         (&(~(8'ha6))) : $signed(wire1[(1'h1):(1'h0)]))));
  assign wire7 = (8'hbe);
  always
    @(posedge clk) begin
      reg8 <= ($signed(wire7[(3'h7):(1'h1)]) || (((wire5[(5'h13):(4'h9)] ^~ $signed(wire0)) < wire1) && ((|wire1) ?
          ((8'hba) ? $unsigned(wire7) : (wire5 ? wire4 : wire0)) : wire7)));
      reg9 <= (({wire0[(1'h1):(1'h0)],
              (&(wire4 ? wire5 : (8'ha5)))} || ((wire6[(1'h1):(1'h0)] ?
                  (~|wire6) : wire4[(5'h12):(3'h6)]) ?
              (wire0 >>> (^~wire3)) : wire2)) ?
          {$unsigned(((wire1 != wire7) >= wire6))} : reg8);
    end
  module10 #() modinst74 (.y(wire73), .wire12(reg8), .wire13(wire6), .wire14(wire3), .wire11(wire2), .clk(clk), .wire15(wire5));
  assign wire75 = wire1;
  assign wire76 = ((($unsigned(((8'h9d) ?
                              wire5 : (8'hae))) == $unsigned((reg9 <<< (8'had)))) ?
                          ((~&{reg9, wire5}) >> (^$unsigned(wire7))) : (reg9 ?
                              {((8'hbf) == wire0)} : $unsigned((+wire73)))) ?
                      ((($signed(wire6) ?
                              $signed(wire73) : ((8'hbd) >>> wire4)) ?
                          $signed(wire75[(4'h8):(2'h2)]) : (^$signed(reg9))) >> wire6) : (!(wire73 ^ wire1)));
  assign wire77 = $unsigned((8'hab));
endmodule

module module10
#(parameter param72 = (((~&(((8'hae) ? (8'h9c) : (8'hb9)) ? {(8'hba), (8'hb0)} : {(8'hb5), (8'hb2)})) ? ((((8'ha0) ? (8'hb2) : (8'ha8)) << {(8'h9c), (8'hb0)}) ? {((8'hb9) ? (8'h9c) : (8'haa)), (~&(8'hbb))} : ({(8'hb5), (8'hb2)} + (8'had))) : ({((8'ha0) >= (8'hb1)), (^~(8'hb5))} ^ (((8'ha3) ? (7'h44) : (8'hae)) ? ((8'hb2) == (7'h42)) : ((8'had) <<< (8'h9e))))) ? {{((+(8'h9d)) ^ (7'h41)), {(8'hb6)}}} : ((({(7'h40)} ? {(8'hb7), (8'hb9)} : (8'hb8)) ? (|(+(8'hb6))) : (|(^(8'ha1)))) > (-(((8'hbc) || (8'ha6)) < (~^(7'h43)))))))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire56;
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire16,
                 wire17,
                 wire56,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire16 = wire13[(1'h1):(1'h1)];
  assign wire17 = wire15;
  module18 #() modinst57 (wire56, clk, wire16, wire11, wire17, wire14, wire13);
  always
    @(posedge clk) begin
      reg58 <= ($signed((($signed(wire56) ? wire16 : (-(8'had))) ?
              ($signed(wire14) ?
                  (!wire11) : $signed(wire56)) : ($signed(wire17) ^~ (8'hae)))) ?
          $signed($unsigned({wire13, (wire12 >> wire17)})) : {$signed(wire14),
              wire11});
      reg59 <= wire15;
      reg60 <= reg59;
      reg61 <= ((~&reg59[(1'h1):(1'h0)]) ?
          $unsigned($signed(((wire12 ? wire15 : (8'hbb)) ?
              (wire11 << reg60) : (wire12 ? wire14 : reg60)))) : wire13);
      reg62 <= ($unsigned($signed({(wire15 ^~ reg60)})) ? wire16 : (~^reg58));
    end
  assign wire63 = (^$unsigned($signed(({reg60, wire15} != $signed(wire17)))));
  assign wire64 = (8'haf);
  always
    @(posedge clk) begin
      reg65 <= reg62[(4'hb):(1'h0)];
      reg66 <= reg61;
      reg67 <= {$signed((!$signed(wire13[(4'hc):(1'h1)])))};
      reg68 <= {$unsigned(((~|(~|wire16)) ?
              $signed({wire13, (8'ha0)}) : $signed((-wire13))))};
    end
  always
    @(posedge clk) begin
      reg69 <= (($unsigned(wire63) - wire14) < wire64[(1'h0):(1'h0)]);
      reg70 <= $signed(reg68[(3'h7):(2'h3)]);
      reg71 <= {(8'h9e),
          (reg69 >= (wire15 ? {(^~wire14)} : (^$unsigned(reg69))))};
    end
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg52,
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
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(((~&(&wire22)) <<< wire21[(4'ha):(2'h3)])))
        begin
          reg24 <= wire23[(5'h10):(4'hb)];
          reg25 <= wire21;
        end
      else
        begin
          reg24 <= wire19;
          reg25 <= wire20;
          reg26 <= wire22[(4'he):(4'h9)];
        end
      reg27 <= wire21[(5'h11):(2'h3)];
      reg28 <= (wire19 ~^ (wire21[(5'h14):(5'h13)] >>> reg25[(2'h2):(1'h1)]));
      if (reg28[(4'h8):(2'h3)])
        begin
          reg29 <= $signed(wire20[(2'h3):(2'h3)]);
          reg30 <= ($signed(($unsigned(((8'hb0) >= reg28)) << wire22[(4'hb):(3'h5)])) == wire19[(2'h3):(1'h1)]);
        end
      else
        begin
          reg29 <= wire20[(2'h2):(1'h1)];
          if ($signed((^~(+(((8'hbd) ^~ reg27) && reg28[(4'h8):(3'h7)])))))
            begin
              reg30 <= (~|((((reg30 > reg28) ?
                      $unsigned(wire20) : (wire23 >>> reg29)) ?
                  $unsigned($signed(reg30)) : {(reg27 ? reg27 : wire21),
                      wire22}) * wire20[(1'h0):(1'h0)]));
              reg31 <= wire22;
            end
          else
            begin
              reg30 <= $unsigned($signed((~|(^~$unsigned(reg30)))));
            end
        end
      if (reg27)
        begin
          if ($signed(((^~reg30) ?
              ($signed((wire23 ?
                  (8'ha4) : reg30)) & wire19) : {$unsigned(wire19),
                  $unsigned($unsigned(reg26))})))
            begin
              reg32 <= wire23;
            end
          else
            begin
              reg32 <= ($signed((reg26[(4'hc):(4'ha)] ?
                  {{wire22}} : (reg25 ?
                      (wire23 >= wire21) : reg26[(4'hc):(4'hc)]))) ^ $unsigned(wire22[(4'ha):(3'h4)]));
              reg33 <= reg31;
              reg34 <= reg24[(4'h8):(3'h4)];
              reg35 <= $signed($signed({reg33}));
            end
          reg36 <= (~^{{reg32[(2'h2):(1'h0)], reg33[(1'h0):(1'h0)]},
              reg31[(3'h6):(3'h6)]});
          reg37 <= $unsigned(wire23);
          reg38 <= $unsigned($unsigned($unsigned((((8'hb4) ?
              reg29 : reg32) <<< (reg28 ? reg33 : wire23)))));
        end
      else
        begin
          reg32 <= (^~(reg37 && $signed($signed((reg29 && reg28)))));
          reg33 <= ((reg32[(2'h2):(2'h2)] >= reg24) > {reg32,
              (&(reg25[(2'h2):(2'h2)] >> $unsigned(reg26)))});
          reg34 <= reg30[(4'h9):(2'h3)];
          reg35 <= reg38[(2'h3):(2'h3)];
          reg36 <= $unsigned(((~^reg24[(1'h0):(1'h0)]) ?
              ($signed(reg29[(5'h10):(3'h4)]) << (8'ha5)) : ($unsigned((reg38 ?
                      wire23 : reg27)) ?
                  (+(wire23 != reg27)) : {(wire22 ? reg25 : reg32)})));
        end
    end
  always
    @(posedge clk) begin
      if ((($unsigned((wire19[(4'hc):(2'h2)] || $unsigned(wire22))) ?
              reg34 : (((reg27 ? reg28 : reg38) > $unsigned(wire21)) ?
                  (wire21[(3'h6):(2'h2)] && wire22) : $signed($signed(reg32)))) ?
          reg34 : $signed($signed(((wire20 ?
              reg24 : wire21) ^~ (reg33 ^ reg26))))))
        begin
          reg39 <= $unsigned(($unsigned((~&(reg24 && reg25))) ?
              reg28[(2'h2):(2'h2)] : ({(|(8'ha4))} ?
                  (reg30[(2'h2):(2'h2)] ?
                      reg31[(3'h4):(3'h4)] : (wire23 ?
                          wire23 : (8'ha7))) : ((reg30 & reg34) ?
                      reg33[(2'h3):(2'h2)] : $signed(reg29)))));
          if ((&$unsigned($unsigned(((wire22 <= reg37) ?
              (~&reg24) : (reg28 << reg33))))))
            begin
              reg40 <= ($signed({(^~(~^reg37)),
                  $signed((reg37 ? wire21 : wire21))}) >= (wire22 ?
                  reg24 : (reg25 ?
                      $unsigned((+reg35)) : ((reg34 ? reg37 : wire21) < (reg35 ?
                          reg35 : reg31)))));
              reg41 <= reg36;
              reg42 <= $signed(((~|$unsigned(reg39[(2'h3):(1'h0)])) > $signed($signed((~&reg26)))));
            end
          else
            begin
              reg40 <= reg28[(4'hd):(4'h9)];
              reg41 <= wire23[(5'h15):(4'hc)];
              reg42 <= (($unsigned(reg24) ?
                      (reg39[(3'h6):(3'h6)] - (~{(8'ha2), reg42})) : {(reg30 ?
                              (wire20 >> wire23) : (reg42 ? reg31 : reg28))}) ?
                  (^reg37) : $signed($signed((-reg36[(3'h4):(2'h2)]))));
              reg43 <= wire23[(5'h14):(4'hf)];
            end
          reg44 <= ($unsigned((reg39[(3'h4):(2'h2)] ?
                  reg29[(2'h2):(1'h1)] : $unsigned({reg39}))) ?
              $unsigned({((~|wire21) ?
                      wire22[(5'h11):(3'h7)] : $signed((8'h9e)))}) : reg37[(4'hb):(3'h5)]);
          reg45 <= (reg27[(2'h2):(2'h2)] >> (($signed((-reg28)) ?
                  (~^$signed(wire19)) : ($unsigned(reg43) ?
                      wire23[(1'h1):(1'h0)] : $signed(reg31))) ?
              ((~&reg30[(3'h5):(1'h1)]) ?
                  ((reg35 ^ wire22) + $signed(reg32)) : $signed($unsigned((8'ha0)))) : (~&$unsigned(reg40))));
        end
      else
        begin
          reg39 <= (-{reg38[(2'h3):(2'h3)]});
          reg40 <= reg24[(2'h3):(1'h0)];
          reg41 <= ($signed(wire23) ~^ $unsigned((reg39 >>> $unsigned((~reg32)))));
          reg42 <= reg43[(4'hb):(2'h2)];
          if ((~|reg40))
            begin
              reg43 <= $signed((8'hba));
              reg44 <= wire22[(1'h0):(1'h0)];
              reg45 <= $unsigned(reg33);
            end
          else
            begin
              reg43 <= ($signed({((|reg43) ?
                      $unsigned(wire22) : (reg34 ? reg35 : wire22))}) ^ reg26);
              reg44 <= ($signed($unsigned(((reg31 ?
                  reg31 : reg37) <= $signed((7'h42))))) ^~ ({reg36} ?
                  ((8'ha0) ?
                      ($signed(wire21) | (wire23 >> reg29)) : reg26) : $unsigned($signed((~&reg34)))));
            end
        end
    end
  assign wire46 = reg38[(1'h1):(1'h0)];
  assign wire47 = (~&($signed(reg35) & {(-reg38[(1'h0):(1'h0)]),
                      $signed($signed(wire20))}));
  assign wire48 = (~^$signed((~&{$signed(wire20), $unsigned(reg30)})));
  assign wire49 = reg29;
  assign wire50 = {reg44[(4'hb):(3'h4)],
                      ((8'hb5) >>> {reg37, $unsigned(reg33[(1'h1):(1'h1)])})};
  assign wire51 = (|reg38);
  always
    @(posedge clk) begin
      reg52 <= reg44;
    end
  assign wire53 = (($signed(($signed(reg25) ?
                      $unsigned(reg37) : $signed((8'hbb)))) + ((((7'h41) ?
                      reg31 : reg40) << reg52[(1'h0):(1'h0)]) <= $unsigned(reg52[(4'h9):(2'h2)]))) - $signed(($unsigned($unsigned(reg30)) >> $signed({reg42}))));
  assign wire54 = $signed($unsigned($unsigned(wire20)));
  assign wire55 = wire19;
endmodule
