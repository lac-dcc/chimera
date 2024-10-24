module top
#(parameter param53 = ((^(8'ha1)) ? (~^{{(~^(8'hac))}}) : (((((7'h44) && (7'h40)) ~^ (&(8'ha4))) != (((8'ha5) == (8'hb5)) * ((8'had) ^ (8'h9f)))) + (^~(&((8'haa) ? (8'hae) : (7'h40)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire47;
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire47,
                 (1'h0)};
  assign wire5 = wire4[(2'h3):(2'h2)];
  assign wire6 = (|$signed(wire5[(5'h12):(5'h11)]));
  assign wire7 = (~^wire3);
  assign wire8 = (^(((+wire7) <<< wire7[(2'h2):(2'h2)]) ?
                     wire5 : $signed($unsigned(wire5))));
  assign wire9 = (+wire1);
  assign wire10 = wire2[(4'hc):(4'ha)];
  assign wire11 = ((({(wire7 ^ wire2), wire5[(4'hc):(3'h4)]} ?
                      ($unsigned(wire1) & (wire2 ?
                          wire2 : wire2)) : (-wire1)) || ((wire4 | wire8[(2'h2):(1'h1)]) ?
                      {(wire0 && wire5),
                          (wire10 ^ wire7)} : $signed(wire4))) >> wire10);
  assign wire12 = ($unsigned({wire4[(4'h8):(3'h7)],
                      ((wire4 * wire7) ?
                          (wire1 ? wire1 : wire6) : {wire6,
                              wire11})}) < $signed((((wire7 ?
                          (8'ha7) : wire0) >>> {wire3, wire4}) ?
                      (+$signed(wire11)) : (wire8 && (wire5 < wire7)))));
  module13 #() modinst48 (.clk(clk), .wire17(wire4), .wire14(wire11), .wire16(wire7), .wire15(wire6), .wire18(wire12), .y(wire47));
  assign wire49 = wire3[(2'h2):(1'h1)];
  assign wire50 = wire47[(4'hc):(1'h1)];
  assign wire51 = $signed($unsigned($unsigned(wire2)));
  assign wire52 = $unsigned($unsigned((+wire9[(2'h3):(2'h2)])));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire30,
                 wire29,
                 wire20,
                 wire19,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = ((wire14 ?
                      wire18[(4'he):(4'hb)] : $signed(((+wire18) ?
                          $signed(wire15) : $unsigned(wire17)))) <<< ({$unsigned(wire18[(3'h6):(2'h3)])} ?
                      wire17[(4'hc):(3'h4)] : (+(wire16[(3'h4):(3'h4)] ?
                          (|wire18) : $unsigned(wire18)))));
  assign wire20 = ({$unsigned((8'ha9))} ? wire14[(3'h6):(1'h1)] : wire14);
  always
    @(posedge clk) begin
      reg21 <= (~^(8'ha2));
      if ((((!($unsigned(wire16) > (|wire15))) ?
          wire17[(4'hb):(1'h1)] : $unsigned((^{(8'ha3),
              (8'ha0)}))) << $signed(wire16)))
        begin
          reg22 <= reg21[(4'hb):(3'h6)];
          reg23 <= reg22;
          reg24 <= reg22[(1'h0):(1'h0)];
          if ((~|$signed(wire17[(4'hb):(3'h7)])))
            begin
              reg25 <= (^~$signed($unsigned($signed((reg22 ?
                  (8'ha5) : wire19)))));
              reg26 <= {(^(~&(wire14 ? $unsigned(reg24) : wire18))),
                  (^~(((~&wire16) < (reg21 != wire16)) ?
                      (~wire20[(1'h0):(1'h0)]) : $unsigned({reg25})))};
              reg27 <= wire17[(4'h9):(1'h1)];
            end
          else
            begin
              reg25 <= $signed((+reg24));
            end
          reg28 <= reg23;
        end
      else
        begin
          reg22 <= (reg22[(1'h1):(1'h0)] ? (8'ha2) : (~&{reg22}));
          if (reg25)
            begin
              reg23 <= (reg24 ?
                  ((((reg23 ? (8'haa) : reg23) ?
                          {reg27} : (wire19 * wire15)) ~^ reg23) ?
                      ((~^$signed(wire15)) - ($signed(reg25) >= wire14[(3'h7):(3'h7)])) : $unsigned({(wire18 ?
                              wire15 : (8'h9f)),
                          reg28})) : ((8'hbb) ?
                      reg21[(4'ha):(4'h8)] : {(^~$signed(wire15))}));
              reg24 <= wire20;
              reg25 <= ((wire16[(1'h1):(1'h0)] < (reg26[(3'h6):(2'h2)] ?
                      (~$unsigned((8'haf))) : (8'h9f))) ?
                  $signed(wire20[(5'h12):(5'h12)]) : ($unsigned(((reg21 ^~ wire16) - (^~reg28))) ?
                      $unsigned(wire15[(4'h9):(1'h0)]) : wire18));
            end
          else
            begin
              reg23 <= (~|(^wire18[(5'h12):(3'h4)]));
              reg24 <= ((wire18[(4'he):(3'h6)] * wire20[(3'h7):(2'h3)]) != reg25[(2'h3):(2'h2)]);
              reg25 <= $signed({$signed($signed($unsigned(wire19))),
                  (^~$unsigned((reg27 ^ reg21)))});
            end
          reg26 <= $signed($signed($unsigned($signed($signed(wire14)))));
          reg27 <= reg21[(4'h8):(3'h5)];
          reg28 <= ((((~^(wire14 ^~ reg21)) ?
                  reg22[(2'h2):(1'h0)] : (reg25[(4'ha):(4'h8)] ?
                      (wire15 ?
                          wire14 : reg22) : (8'hba))) <<< ($unsigned(wire15[(3'h4):(3'h4)]) ?
                  {reg27, $signed(reg25)} : {(wire20 * wire20)})) ?
              $signed(wire17) : ($signed((reg22[(1'h0):(1'h0)] ?
                  $unsigned(wire20) : (reg26 ?
                      reg26 : reg25))) >>> (^($signed(wire18) ^ wire16))));
        end
    end
  assign wire29 = $unsigned(($signed($signed({wire18})) ?
                      wire17[(3'h6):(2'h3)] : ($signed((wire16 || reg23)) ?
                          ((-reg27) + wire19) : ($signed(reg26) ?
                              $signed(wire15) : $unsigned(reg26)))));
  assign wire30 = ($unsigned($signed((wire17[(4'hb):(3'h5)] < (!wire19)))) && ((wire17[(3'h5):(2'h3)] ?
                      (~^(reg25 > wire29)) : wire14[(3'h6):(2'h2)]) - reg25[(4'ha):(3'h5)]));
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned(($unsigned(wire20) ?
          (reg25 | (8'h9e)) : reg21[(1'h1):(1'h1)])))))
        begin
          if ((~&$signed((~(~^(8'hb3))))))
            begin
              reg31 <= wire16[(3'h6):(2'h3)];
              reg32 <= wire30[(4'hc):(1'h1)];
              reg33 <= reg28;
              reg34 <= (wire16 ?
                  ((~^$unsigned(reg21[(4'h8):(3'h5)])) & reg26) : $signed(({reg26[(4'he):(2'h3)]} == (reg22 ?
                      reg26[(3'h4):(3'h4)] : $signed(reg25)))));
              reg35 <= wire19[(1'h1):(1'h1)];
            end
          else
            begin
              reg31 <= wire18[(5'h12):(5'h11)];
              reg32 <= (({$unsigned(wire20[(4'hf):(3'h6)]), reg35} == reg32) ?
                  (^~{(reg35[(4'h8):(4'h8)] ? (|reg33) : $unsigned(reg24)),
                      wire20}) : (!$signed($signed($signed(reg23)))));
              reg33 <= $unsigned((reg27 - (($unsigned(wire15) ?
                  ((8'hb9) <<< reg35) : (reg26 ? wire17 : reg23)) <= wire20)));
              reg34 <= $unsigned($unsigned(reg27[(4'ha):(3'h4)]));
            end
          if ((~^{(-$signed($unsigned(reg33))),
              ($signed((wire30 ? reg21 : reg32)) && $signed((&reg28)))}))
            begin
              reg36 <= $unsigned($signed((~^wire16)));
              reg37 <= reg28;
              reg38 <= ((^~wire15[(3'h4):(1'h0)]) ? reg21 : wire19);
              reg39 <= (~|$signed((&reg31)));
            end
          else
            begin
              reg36 <= (($unsigned($unsigned(reg38)) && ($unsigned($signed(reg27)) ?
                  (reg27 - reg23) : (+$unsigned(reg27)))) - $unsigned(({((8'ha8) >> (8'hae)),
                      $signed(reg33)} ?
                  (~^$signed(wire20)) : $unsigned(reg32[(3'h7):(3'h5)]))));
            end
        end
      else
        begin
          reg31 <= ({$unsigned((~&(^reg35))),
                  (^(reg28[(4'hb):(2'h3)] ? {(8'hb9)} : reg35))} ?
              $unsigned(reg22[(2'h3):(1'h0)]) : $signed($unsigned(wire16[(3'h5):(3'h4)])));
          if (wire15)
            begin
              reg32 <= $signed($unsigned(((+(wire18 >>> reg38)) ^ {(&reg23),
                  (~|wire14)})));
              reg33 <= wire19[(4'h8):(3'h7)];
              reg34 <= $unsigned($unsigned(reg28[(1'h0):(1'h0)]));
              reg35 <= $signed(reg36[(3'h4):(1'h0)]);
            end
          else
            begin
              reg32 <= (reg25 >> $unsigned((((reg33 * reg24) < (wire14 < wire15)) ?
                  reg33[(2'h2):(1'h0)] : $signed((reg24 ? reg37 : reg22)))));
              reg33 <= reg31;
              reg34 <= reg21[(4'hb):(2'h3)];
              reg35 <= (^wire29);
            end
          if (((($signed(reg27) ?
                  $signed($signed(reg23)) : ((8'hba) ?
                      ((8'haf) ?
                          reg24 : (8'ha9)) : $signed(reg24))) * ((8'h9e) ?
                  (~&((8'hb4) ?
                      reg38 : reg26)) : ($unsigned(wire19) + (^~reg26)))) ?
              (8'hbb) : $signed((wire17[(3'h4):(2'h3)] ?
                  reg23 : ((reg35 ?
                      reg25 : (8'hb7)) ^~ reg22[(1'h0):(1'h0)])))))
            begin
              reg36 <= reg24;
              reg37 <= ({$signed(reg23[(4'hd):(3'h7)])} ?
                  ((8'hba) | (^wire20[(4'h9):(3'h7)])) : (($signed({reg24}) ?
                          wire16 : reg31[(2'h3):(2'h2)]) ?
                      {((reg28 ? reg22 : wire19) && $signed(wire30)),
                          ($unsigned((8'ha1)) >> {reg25, wire17})} : reg37));
            end
          else
            begin
              reg36 <= (~(^$signed(((reg38 >= wire19) <<< $unsigned(wire29)))));
              reg37 <= wire18;
            end
          reg38 <= {(reg23[(4'he):(1'h0)] & $signed((reg31[(2'h3):(2'h3)] ?
                  (reg27 <= reg37) : reg26))),
              wire15[(2'h3):(2'h2)]};
          reg39 <= reg37[(3'h4):(2'h3)];
        end
      reg40 <= $signed($unsigned(($unsigned(wire18) ?
          {$unsigned((8'ha9)), ((8'hb2) ? wire30 : reg24)} : reg34)));
      reg41 <= (^~(-$unsigned(($signed(reg37) * $unsigned((8'ha1))))));
      reg42 <= (8'hbc);
      reg43 <= ((|wire14[(2'h3):(1'h1)]) ?
          $unsigned({$signed({(8'hbc)})}) : $signed($unsigned((~wire14))));
    end
  assign wire44 = (wire18 ?
                      reg36[(4'h8):(3'h6)] : $signed($unsigned(({wire29,
                              reg27} ?
                          (reg24 ^~ reg38) : reg38))));
  assign wire45 = $unsigned($signed((~^reg25)));
  assign wire46 = (reg24 ? reg21[(3'h4):(2'h3)] : wire45[(2'h3):(2'h2)]);
endmodule
