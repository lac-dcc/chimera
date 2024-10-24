module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire70;
  assign y = {wire72, wire5, wire6, wire7, wire70, (1'h0)};
  assign wire5 = $signed($unsigned(wire0[(2'h3):(2'h2)]));
  assign wire6 = (wire2[(5'h14):(4'he)] != wire5[(3'h7):(3'h7)]);
  assign wire7 = $unsigned($signed($signed(($unsigned(wire4) ?
                     (wire1 ^ wire0) : $signed(wire5)))));
  module8 #() modinst71 (.wire10(wire5), .wire12(wire2), .wire13(wire3), .wire11(wire7), .wire9(wire1), .clk(clk), .y(wire70));
  assign wire72 = $unsigned((~|$signed($unsigned((wire6 > wire3)))));
endmodule

module module8
#(parameter param69 = (+(~&(8'hb2))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire15,
                 wire14,
                 (1'h0)};
  assign wire14 = $signed({({(7'h41), ((8'ha2) ? wire10 : wire12)} ?
                          (&wire12[(4'hf):(4'h8)]) : $unsigned(wire10[(4'h8):(3'h4)])),
                      wire9});
  assign wire15 = (&((((wire9 ? (8'ha9) : wire13) ?
                      {wire11} : {(8'hb3), wire10}) << wire13) + wire14));
  module16 #() modinst54 (wire53, clk, wire9, wire11, wire13, wire12);
  assign wire55 = (wire53[(4'h8):(3'h4)] ?
                      wire12[(2'h3):(1'h0)] : ({((wire11 ?
                                  wire11 : wire14) * (^~wire10)),
                              wire9} ?
                          (~^$unsigned((~&(8'hbf)))) : ((|wire10[(4'hb):(2'h3)]) ^ $signed((wire12 ?
                              wire9 : wire11)))));
  assign wire56 = ((wire13 + {{((8'hae) ? wire14 : wire55),
                          (wire13 ?
                              wire10 : wire53)}}) <<< $signed($signed(($unsigned((8'haa)) ?
                      (!wire14) : (wire14 - wire55)))));
  assign wire57 = wire14;
  assign wire58 = wire53[(3'h5):(1'h0)];
  assign wire59 = wire56;
  assign wire60 = $unsigned((^~$signed((~|(wire55 ? wire15 : wire59)))));
  assign wire61 = (&wire55);
  assign wire62 = wire57;
  assign wire63 = $signed(((8'h9c) << {($unsigned((8'hb6)) ~^ $signed(wire55)),
                      ({wire61, (8'ha6)} ?
                          (wire9 << wire9) : (wire55 && wire57))}));
  assign wire64 = $unsigned(wire56[(3'h7):(3'h5)]);
  assign wire65 = {$unsigned(wire53)};
  assign wire66 = wire11;
  assign wire67 = $unsigned($signed((wire61 > ($signed(wire11) - {wire12,
                      wire66}))));
  assign wire68 = $signed(wire9[(3'h7):(3'h5)]);
endmodule

module module16
#(parameter param52 = (~|((!(&{(8'ha8), (8'ha9)})) ? ((((8'ha1) < (8'ha2)) - ((7'h44) - (8'h9e))) ? ((8'hb8) ? {(8'hac), (8'ha6)} : (^(8'had))) : {((8'hbd) << (8'ha0)), (8'hb7)}) : ((((8'ha2) == (8'hbe)) > ((8'ha6) ? (7'h40) : (8'ha7))) ? (((8'h9d) << (8'hb5)) ? ((8'h9f) >= (8'hbc)) : (~(8'h9f))) : {{(8'hb7), (8'ha3)}}))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire32,
                 wire31,
                 wire30,
                 wire22,
                 wire21,
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
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire21 = $signed((({(-wire18)} || $signed($signed(wire18))) ?
                      $signed(($signed(wire20) ?
                          wire20[(2'h3):(2'h3)] : (wire19 ?
                              wire19 : wire17))) : (7'h41)));
  assign wire22 = {{(~$signed((8'hb3))),
                          (wire18 ? wire17 : $unsigned({wire19}))}};
  always
    @(posedge clk) begin
      if ({wire22})
        begin
          reg23 <= wire21;
          reg24 <= $unsigned((~^(wire21[(2'h2):(2'h2)] << wire18)));
          if (($signed((wire19 ?
              $unsigned((wire22 | wire22)) : $unsigned(wire20[(2'h3):(2'h3)]))) != $signed((wire17 ?
              (~|wire19[(2'h2):(1'h1)]) : (+{wire17})))))
            begin
              reg25 <= (8'haf);
              reg26 <= ((&$signed($signed({wire20,
                  wire17}))) ^ $unsigned((!($signed(wire22) ?
                  (~^reg25) : $unsigned(reg25)))));
              reg27 <= ($unsigned(reg23[(2'h3):(1'h1)]) ?
                  ($signed((&(reg26 ?
                      wire18 : (8'hab)))) + wire18) : ($signed((wire20 == reg24[(2'h3):(2'h3)])) ?
                      wire17 : (8'hb3)));
            end
          else
            begin
              reg25 <= {(~^(~reg26)), $unsigned(wire22)};
              reg26 <= $signed(($unsigned((((8'hb1) ^ wire20) ?
                  wire18 : (wire20 ?
                      wire22 : wire21))) - ({{wire21}} >> $unsigned((wire22 != wire20)))));
              reg27 <= ($unsigned(reg23[(1'h0):(1'h0)]) ?
                  wire17[(3'h5):(2'h2)] : reg25);
            end
          reg28 <= wire18;
        end
      else
        begin
          reg23 <= (wire18 ?
              (-{$signed($unsigned(reg24))}) : wire19[(2'h3):(1'h0)]);
        end
      reg29 <= $unsigned(wire22[(3'h7):(3'h5)]);
    end
  assign wire30 = ({reg25[(3'h4):(2'h3)],
                      reg26[(2'h2):(2'h2)]} == reg24[(1'h0):(1'h0)]);
  assign wire31 = ((($signed($unsigned(reg25)) + $unsigned((reg27 < wire18))) ?
                          $unsigned((~$signed((8'hbc)))) : {($unsigned(reg26) ?
                                  reg28 : {wire19}),
                              ((reg26 ? reg26 : reg27) > $signed(reg28))}) ?
                      reg25 : reg28);
  assign wire32 = wire17[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg33 <= ($signed($signed(reg25)) ? wire21 : (7'h40));
      reg34 <= wire31[(4'h8):(2'h3)];
      if (wire20[(1'h1):(1'h0)])
        begin
          reg35 <= ((~$signed($unsigned($unsigned(reg26)))) + {({(wire22 ?
                      (8'hbb) : wire18)} < (~^(reg24 * wire32))),
              $unsigned(reg28[(3'h5):(1'h1)])});
          reg36 <= $unsigned(reg26[(2'h3):(1'h0)]);
          if (wire30)
            begin
              reg37 <= ($unsigned(reg26[(1'h0):(1'h0)]) ?
                  reg23[(2'h3):(1'h0)] : $unsigned(reg34[(1'h1):(1'h0)]));
              reg38 <= $unsigned(reg28[(1'h1):(1'h0)]);
              reg39 <= {($unsigned((reg38 ^~ $signed((8'hb0)))) ?
                      wire17[(1'h1):(1'h0)] : reg34)};
              reg40 <= ($signed((-$signed(wire17[(3'h6):(3'h6)]))) ?
                  $signed((((wire21 >= reg24) ?
                      (reg39 == wire20) : $signed(wire20)) < reg27)) : $unsigned((-{wire31[(4'ha):(2'h2)]})));
            end
          else
            begin
              reg37 <= {reg37[(2'h2):(2'h2)], ((8'hba) >>> $signed(reg33))};
              reg38 <= (~wire21[(4'h8):(2'h3)]);
            end
        end
      else
        begin
          reg35 <= (-((+$unsigned((~&reg33))) << $signed($signed($signed(wire17)))));
          reg36 <= {(~^($signed(reg34) ?
                  (-(reg36 ? reg29 : wire30)) : (wire17[(3'h7):(3'h5)] ?
                      reg25[(3'h4):(3'h4)] : (8'ha0)))),
              ({({wire22} - reg24), $unsigned((reg34 ? reg28 : reg38))} ?
                  {reg38[(3'h4):(3'h4)],
                      wire32[(4'ha):(4'h8)]} : (((^~reg39) <<< $unsigned(reg33)) ?
                      $signed($unsigned(reg37)) : wire31[(1'h1):(1'h0)]))};
          if (((8'ha0) ?
              $signed(($unsigned($unsigned((8'hb9))) ?
                  (reg40[(3'h5):(2'h3)] * (reg34 * reg37)) : (~reg23))) : (wire18 && ($unsigned(wire22[(2'h2):(1'h0)]) > $signed(reg34)))))
            begin
              reg37 <= wire30;
              reg38 <= (reg28 ?
                  (~(wire32[(2'h2):(1'h1)] == $signed((reg24 ?
                      wire19 : reg36)))) : reg37);
            end
          else
            begin
              reg37 <= wire20;
            end
          reg39 <= ($unsigned($unsigned(reg33)) ?
              $unsigned($unsigned((((7'h40) - reg34) ?
                  {wire31,
                      wire32} : reg25[(1'h0):(1'h0)]))) : $signed($unsigned(wire22[(3'h5):(2'h2)])));
          reg40 <= ((8'hb8) ?
              $signed($unsigned($signed(((8'hb5) ^~ reg34)))) : (~^wire18));
        end
      if (reg23)
        begin
          reg41 <= {$signed(((~$unsigned(wire31)) ?
                  $unsigned($signed(wire21)) : reg39[(5'h10):(4'hb)]))};
        end
      else
        begin
          reg41 <= {($unsigned((!(reg35 ? (8'h9c) : reg36))) ?
                  (reg35 ?
                      $unsigned(reg27) : ((wire21 ?
                          wire17 : reg23) + reg38)) : ({(wire20 - wire17)} ?
                      reg33[(4'h8):(3'h6)] : wire32[(3'h4):(3'h4)])),
              ((^~reg29[(3'h7):(3'h4)]) - reg25)};
        end
      if (wire17)
        begin
          if ((^reg36))
            begin
              reg42 <= {{wire22,
                      (~^((&(8'hbe)) ? $unsigned(wire21) : $signed(reg29)))},
                  ($signed((reg33[(3'h5):(3'h4)] ?
                          (reg28 ? wire17 : reg23) : reg23[(2'h3):(1'h0)])) ?
                      reg23[(1'h1):(1'h1)] : wire20)};
              reg43 <= reg40[(4'hb):(3'h6)];
              reg44 <= $unsigned((&{($unsigned(wire19) ?
                      wire22[(3'h4):(1'h0)] : reg33),
                  (8'hb5)}));
            end
          else
            begin
              reg42 <= wire30[(5'h15):(5'h12)];
            end
          if ({$unsigned((&((~^reg34) >>> {reg44, wire30}))),
              reg26[(3'h5):(2'h3)]})
            begin
              reg45 <= $unsigned(reg37[(2'h2):(1'h0)]);
            end
          else
            begin
              reg45 <= (~reg45[(3'h4):(1'h1)]);
              reg46 <= {(8'hae)};
              reg47 <= (~^$signed(reg38[(3'h4):(1'h1)]));
            end
          reg48 <= (!(^{$signed($signed(wire19)),
              (((8'h9e) ? reg41 : reg41) ?
                  ((8'hae) << reg27) : $unsigned(wire22))}));
        end
      else
        begin
          reg42 <= (($signed((~^$unsigned(wire19))) >= $signed({$signed(wire19),
                  wire18[(4'h8):(1'h0)]})) ?
              {($signed({reg41}) == (-reg35)),
                  reg42[(1'h1):(1'h0)]} : ((({reg43, (8'hbf)} << (wire20 ?
                      reg27 : reg47)) ?
                  $signed((wire21 > reg43)) : (reg35 ?
                      ((8'h9d) ? reg25 : reg43) : (reg35 ?
                          reg36 : reg39))) ^~ $signed((!((8'hb4) >>> reg46)))));
        end
    end
  assign wire49 = reg29;
  assign wire50 = wire19;
  assign wire51 = $signed(wire18[(1'h1):(1'h0)]);
endmodule
