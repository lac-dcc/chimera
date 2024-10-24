module top
#(parameter param66 = (^(^(|(|(+(8'hb2)))))), 
parameter param67 = param66)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire65, wire64, wire63, wire61, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire0[(2'h2):(2'h2)];
  assign wire6 = ($signed($signed(wire5)) + {(-(8'hac)),
                     $signed($signed(wire0[(2'h3):(2'h3)]))});
  assign wire7 = $signed({$unsigned(((~^wire0) ?
                         ((8'haa) ? wire5 : wire6) : ((8'ha7) << wire5))),
                     wire6});
  module8 #() modinst62 (wire61, clk, wire7, wire0, wire3, wire6);
  assign wire63 = $unsigned(($signed(($signed(wire0) >> $signed((8'hb1)))) & wire7));
  assign wire64 = $unsigned((~&$signed(($signed(wire6) >>> ((8'hb2) ^~ wire3)))));
  assign wire65 = ($unsigned($signed((!(8'hb5)))) >>> $unsigned((|((wire3 ?
                      wire1 : wire0) ~^ $unsigned((8'h9d))))));
endmodule

module module8
#(parameter param59 = (+({(~((8'ha3) ? (7'h40) : (8'hb1))), (((8'ha1) ? (8'hb5) : (8'haf)) ~^ ((8'hbd) ? (8'haf) : (7'h42)))} ? ((((8'hab) ? (8'ha3) : (8'hae)) << (|(8'h9c))) || {(8'hb8)}) : (-{(~^(8'ha8))}))), 
parameter param60 = (~&param59))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire52,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire35,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg54,
                 reg53,
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
                 (1'h0)};
  assign wire13 = $unsigned({{(wire9[(3'h7):(2'h2)] && wire10)},
                      {$signed((!wire12))}});
  assign wire14 = $unsigned($signed((wire10[(1'h1):(1'h0)] ?
                      $signed((wire11 ?
                          wire10 : wire9)) : wire9[(1'h1):(1'h0)])));
  assign wire15 = (~^(~^wire11));
  assign wire16 = wire10;
  assign wire17 = ($signed($signed($signed($unsigned(wire14)))) ?
                      $signed(wire9[(4'ha):(2'h2)]) : $signed((8'hb0)));
  assign wire18 = $unsigned(wire13);
  assign wire19 = $signed(wire12);
  assign wire20 = (+(({wire17[(4'he):(3'h5)], ((8'hab) ? (8'hbe) : wire15)} ?
                          {$unsigned(wire9),
                              wire10} : ($signed(wire9) >>> (wire12 >> wire10))) ?
                      (^$signed((+(8'hb4)))) : wire16[(2'h2):(2'h2)]));
  assign wire21 = ($signed(($unsigned((+wire11)) ?
                      wire15[(2'h3):(1'h0)] : ((wire19 & (8'ha8)) ?
                          (-wire20) : wire17[(3'h7):(1'h1)]))) * $signed((8'ha5)));
  always
    @(posedge clk) begin
      if ($signed({((!wire9[(1'h0):(1'h0)]) || ({wire14} ^~ $unsigned(wire13))),
          wire17}))
        begin
          reg22 <= $signed(wire10[(3'h6):(3'h5)]);
          if ($unsigned(wire18[(1'h1):(1'h1)]))
            begin
              reg23 <= (+wire17);
              reg24 <= ($unsigned({((~reg22) ?
                          wire10 : (wire21 ? reg22 : (8'ha9))),
                      $signed(wire17)}) ?
                  ($signed($signed((wire11 - wire13))) >= $signed((^~$signed(wire11)))) : (((wire14 ?
                              (~|(8'ha2)) : $signed(wire21)) ?
                          (|{wire21, (7'h40)}) : wire10[(3'h4):(2'h2)]) ?
                      ({(wire18 ? wire9 : (8'ha2))} ?
                          (wire15 ?
                              wire19 : (|wire17)) : (+wire10[(3'h4):(3'h4)])) : (reg23 ?
                          wire17[(4'hc):(1'h1)] : $signed(wire12))));
              reg25 <= $unsigned((($unsigned($unsigned(wire12)) ?
                  wire18[(2'h3):(2'h3)] : ($signed((8'hba)) + (wire13 == wire16))) != ((~&((8'hab) >> wire21)) + $unsigned(wire19[(4'hb):(3'h7)]))));
              reg26 <= reg25;
              reg27 <= $unsigned($unsigned({(reg23[(3'h4):(2'h2)] ?
                      {wire21} : $signed(wire12))}));
            end
          else
            begin
              reg23 <= (wire20[(3'h6):(1'h1)] * ((~(wire18 ?
                      wire9[(1'h0):(1'h0)] : wire20[(1'h1):(1'h0)])) ?
                  $unsigned({((8'hae) ? wire10 : reg26),
                      $signed(wire15)}) : reg26));
              reg24 <= (|{($unsigned((reg27 ?
                      wire16 : (8'ha9))) + $unsigned({wire13})),
                  {wire13}});
              reg25 <= $unsigned(($signed({(wire21 > (8'hbf)),
                      ((8'ha8) ^~ wire18)}) ?
                  reg26[(4'h9):(1'h1)] : {reg24}));
              reg26 <= $unsigned((~^(8'ha2)));
              reg27 <= ((-($signed($signed(wire14)) | $unsigned($unsigned(wire14)))) ?
                  ($signed($unsigned($signed(wire14))) - wire18[(2'h3):(1'h0)]) : (reg23[(1'h0):(1'h0)] - wire16[(1'h1):(1'h0)]));
            end
          if (wire20)
            begin
              reg28 <= $signed($signed(wire11[(3'h7):(3'h6)]));
            end
          else
            begin
              reg28 <= reg26;
              reg29 <= $unsigned((^$signed(reg23[(4'h9):(3'h6)])));
              reg30 <= $unsigned((+($unsigned(wire17) ?
                  reg28[(2'h3):(1'h1)] : $signed($unsigned(wire15)))));
              reg31 <= reg23;
              reg32 <= reg30[(3'h5):(1'h1)];
            end
        end
      else
        begin
          reg22 <= (7'h44);
          reg23 <= (|$unsigned(($unsigned($unsigned((7'h42))) ?
              wire11[(3'h5):(2'h2)] : $signed({reg25, reg30}))));
          reg24 <= (8'hbc);
          reg25 <= (reg26[(1'h1):(1'h0)] ?
              (8'haa) : (wire12[(1'h1):(1'h1)] ^~ (~^$unsigned((reg22 & wire14)))));
          reg26 <= {reg26};
        end
      reg33 <= {(!$signed(({reg31} >= (reg27 ? wire15 : reg26)))),
          wire9[(3'h7):(2'h2)]};
      reg34 <= wire13;
    end
  assign wire35 = wire10[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg36 <= reg33[(1'h1):(1'h1)];
      reg37 <= wire35;
    end
  assign wire38 = (^$signed(wire17[(3'h4):(2'h2)]));
  assign wire39 = (-$signed($unsigned({$unsigned(wire21), (^reg24)})));
  assign wire40 = wire20;
  assign wire41 = $signed($unsigned((reg32 ?
                      ((reg34 != reg23) < (reg34 ?
                          (8'hb4) : wire14)) : (&reg33))));
  always
    @(posedge clk) begin
      reg42 <= (~&($unsigned(wire17[(1'h1):(1'h1)]) ? (7'h43) : reg33));
      reg43 <= ((~|reg23) ? $signed($unsigned($unsigned((8'haa)))) : (8'hb0));
      if ($signed($signed($signed(($unsigned(reg22) && (wire14 ~^ reg26))))))
        begin
          reg44 <= {(~&({(wire16 ? wire40 : wire17), $signed(reg29)} ?
                  $unsigned((reg26 ? wire35 : reg33)) : $signed((~^wire12)))),
              $signed(($signed(((8'hb3) << wire17)) ^ $unsigned({wire13,
                  wire40})))};
          reg45 <= wire10;
          if (($unsigned({(reg24[(2'h3):(1'h0)] >> (reg27 ? reg36 : (8'ha6))),
              ((-wire40) ?
                  (reg36 << reg22) : ((8'hbc) ? wire41 : wire35))}) * (8'ha6)))
            begin
              reg46 <= ($signed((^$unsigned((reg34 - (7'h41))))) ?
                  (~&$signed(wire13[(2'h2):(1'h1)])) : ((reg37[(3'h7):(3'h7)] ?
                      $signed($unsigned(reg42)) : reg42) ~^ reg42));
              reg47 <= (wire39[(4'h8):(4'h8)] == $unsigned(($signed(reg30) ?
                  reg37 : $unsigned(wire20[(1'h0):(1'h0)]))));
              reg48 <= ((((|reg43) * ($signed(reg29) ~^ $unsigned(reg25))) ?
                  $signed($unsigned((&reg34))) : $unsigned($unsigned((reg30 <<< (8'hb9))))) ~^ (({(reg34 ?
                      reg23 : reg32)} >= ($signed((7'h42)) & ((8'haa) ?
                  wire18 : wire41))) <<< reg30));
              reg49 <= reg31;
              reg50 <= $unsigned(reg30);
            end
          else
            begin
              reg46 <= (8'hb3);
              reg47 <= $signed((~&$unsigned(($unsigned(reg26) ?
                  (wire40 >= wire21) : reg32[(3'h6):(1'h1)]))));
              reg48 <= {wire19[(3'h6):(2'h3)],
                  $unsigned((wire21[(3'h5):(2'h3)] ?
                      (((8'hb3) ?
                          reg44 : reg45) * $unsigned(reg42)) : (wire20 >>> reg42)))};
              reg49 <= (!((-(^~{wire16})) == $unsigned(reg27[(3'h5):(3'h5)])));
              reg50 <= ($signed((reg34[(2'h2):(1'h0)] ?
                      wire39[(3'h5):(3'h4)] : (~&{(8'ha4)}))) ?
                  $signed(reg23[(1'h1):(1'h1)]) : {$signed((-{(8'hbd)}))});
            end
          reg51 <= ($unsigned(((~(^~wire15)) ?
                  reg37 : wire19[(5'h10):(4'h8)])) ?
              {(reg30 | $unsigned((|wire12)))} : wire20);
        end
      else
        begin
          reg44 <= reg42[(1'h0):(1'h0)];
          if (wire19)
            begin
              reg45 <= {reg36[(4'hd):(4'hd)]};
              reg46 <= ((($unsigned(reg29[(4'hc):(3'h5)]) * (reg48[(3'h5):(3'h4)] | $unsigned(reg45))) ?
                  ({(reg42 && reg34), $unsigned(wire38)} ?
                      reg48 : $unsigned((wire16 ?
                          wire16 : (7'h42)))) : (-((reg27 >>> wire13) <= reg23[(3'h4):(1'h1)]))) << ({(((8'had) <<< wire17) - (^~reg28))} && wire18[(4'hc):(2'h2)]));
            end
          else
            begin
              reg45 <= (8'hb1);
              reg46 <= ((($signed(wire20[(4'hc):(4'hc)]) <<< {(^reg51)}) * {((~^(7'h43)) && wire19[(4'hc):(1'h1)])}) ?
                  $unsigned(wire35[(4'h9):(2'h2)]) : $signed(wire10[(4'hc):(4'h8)]));
              reg47 <= (wire11 <= wire41[(4'ha):(4'ha)]);
              reg48 <= $unsigned((!(((reg27 + reg43) >>> {wire10}) ?
                  (^~$signed((8'h9c))) : ($unsigned(wire12) > reg44[(1'h1):(1'h1)]))));
            end
          reg49 <= (reg28[(2'h2):(2'h2)] ?
              (($unsigned($unsigned(wire14)) ?
                      $unsigned($signed(reg47)) : $unsigned((~wire40))) ?
                  {(~^(~^wire40))} : (((wire19 ?
                          reg36 : wire12) ~^ (reg26 | reg24)) ?
                      wire17 : (~&$signed(reg27)))) : $signed(wire11[(4'hd):(3'h4)]));
          reg50 <= reg37[(2'h3):(1'h1)];
          reg51 <= (($unsigned(((~|wire41) ?
              $unsigned(wire16) : wire38[(5'h14):(3'h7)])) & {$signed({reg32}),
              $unsigned(reg46[(4'h9):(3'h7)])}) >= (wire21 ?
              ((~^$signed(wire10)) != (~wire18[(4'hf):(1'h1)])) : (!reg22)));
        end
    end
  assign wire52 = (8'hb8);
  always
    @(posedge clk) begin
      reg53 <= ({(~(~&$unsigned(wire39))),
              $unsigned($unsigned((wire15 ? (7'h40) : wire40)))} ?
          (reg27 ^~ wire39) : (~^($unsigned(reg26) ^ ((reg48 ?
              reg24 : reg27) * (wire13 > reg26)))));
      reg54 <= (8'hb7);
    end
  assign wire55 = $unsigned((^~((wire21 ?
                      (reg53 ^~ (8'h9e)) : $signed((8'hb2))) >= ($unsigned(wire12) && reg44))));
  assign wire56 = reg44[(4'hc):(4'h8)];
  assign wire57 = (8'hb4);
  assign wire58 = ((8'hab) >>> (((~$unsigned(wire55)) ^ reg42[(3'h7):(2'h2)]) | $unsigned(reg43[(2'h3):(1'h1)])));
endmodule
