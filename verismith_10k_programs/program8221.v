module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire61,
                 wire42,
                 wire40,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0[(1'h1):(1'h0)];
      reg6 <= (|$signed(({{reg5}} ?
          $unsigned(reg5) : $signed($unsigned((8'hac))))));
      reg7 <= {reg5};
      reg8 <= {$signed((~|{(reg6 | wire4), (+(8'h9f))})),
          $unsigned($signed($unsigned(((8'hb6) ? (7'h42) : (8'ha6)))))};
    end
  assign wire9 = (|$unsigned($unsigned((^~reg7[(4'hc):(1'h0)]))));
  assign wire10 = ((wire2[(4'h9):(1'h0)] + (&(8'h9f))) ?
                      {wire9[(2'h3):(2'h2)],
                          (8'ha2)} : ($signed(($unsigned(wire1) - (reg6 ?
                          (8'hae) : wire1))) << wire0[(1'h1):(1'h0)]));
  assign wire11 = (wire1 ?
                      ($signed(((8'hba) <= $signed((8'had)))) ?
                          (((wire9 << wire10) ?
                                  wire3[(4'hc):(4'hb)] : $unsigned(wire9)) ?
                              ((reg5 ? wire4 : reg8) ?
                                  (wire4 != (8'h9d)) : (8'ha3)) : $unsigned(wire1[(4'h8):(4'h8)])) : {$signed(wire9[(2'h3):(1'h1)])}) : ($signed($unsigned((-reg8))) ?
                          wire1 : wire2));
  assign wire12 = wire4[(1'h0):(1'h0)];
  assign wire13 = (^~{$unsigned(wire4[(1'h1):(1'h0)]), wire12[(1'h0):(1'h0)]});
  assign wire14 = wire0[(1'h1):(1'h1)];
  assign wire15 = (8'had);
  assign wire16 = $unsigned((wire0 << (8'h9e)));
  assign wire17 = reg8[(2'h3):(2'h3)];
  assign wire18 = $signed((($unsigned({reg7, wire12}) ?
                          $unsigned((wire15 > wire15)) : wire14[(1'h1):(1'h0)]) ?
                      $unsigned((~&wire12[(1'h0):(1'h0)])) : {wire0,
                          {$unsigned(wire1), $unsigned((8'hbb))}}));
  module19 #() modinst41 (.wire24(wire14), .wire20(reg8), .clk(clk), .wire22(wire3), .y(wire40), .wire21(wire15), .wire23(wire1));
  assign wire42 = $unsigned(({(wire40[(1'h1):(1'h1)] > (wire15 - wire0))} >= wire18[(1'h0):(1'h0)]));
  module43 #() modinst62 (wire61, clk, wire42, wire4, wire0, wire11);
endmodule

module module43
#(parameter param59 = (~(-{(&{(7'h44), (8'ha2)}), (((8'hba) <= (7'h40)) * ((8'haa) || (8'ha5)))})), 
parameter param60 = ((8'hbd) ? param59 : (((^~param59) ~^ ((param59 ? param59 : param59) >> (param59 <= param59))) ? param59 : ((+param59) ? (param59 != {param59, param59}) : (param59 + param59)))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire47;
  input wire signed [(4'hf):(1'h0)] wire46;
  input wire [(5'h12):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire48 = $unsigned($unsigned($signed((^~wire44))));
  assign wire49 = wire45[(3'h7):(2'h3)];
  assign wire50 = wire44;
  assign wire51 = $unsigned(wire48);
  always
    @(posedge clk) begin
      reg52 <= {(7'h42), {wire49}};
      reg53 <= $signed(wire49);
      reg54 <= wire46[(4'h8):(4'h8)];
    end
  assign wire55 = (~|(($unsigned((+wire49)) | (^(8'hbc))) ?
                      wire51 : $unsigned(((wire45 ?
                          reg52 : (8'hb8)) >>> wire44))));
  assign wire56 = {wire49[(3'h6):(3'h5)],
                      $signed(({(&(8'hac)), wire47[(2'h3):(2'h2)]} ?
                          $unsigned((-wire47)) : (~|wire51)))};
  assign wire57 = ($unsigned(wire55[(3'h5):(3'h4)]) ?
                      $unsigned(wire56[(2'h2):(1'h0)]) : (wire55[(4'hc):(4'hc)] ?
                          (wire48 ?
                              (~reg52) : reg52) : $signed($unsigned((&wire50)))));
  assign wire58 = wire47[(1'h1):(1'h1)];
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(2'h3):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire25;
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire25,
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
                 (1'h0)};
  assign wire25 = ($unsigned($unsigned($signed((wire21 ^~ wire20)))) ^~ ({((8'hb1) <<< (wire21 ?
                          (7'h43) : wire22)),
                      (^{wire21, wire23})} >= $signed($unsigned((-wire20)))));
  always
    @(posedge clk) begin
      reg26 <= (($unsigned((~|$unsigned((8'hba)))) ?
          ((wire22[(2'h3):(2'h2)] & {wire20, wire25}) ~^ $signed({wire23,
              wire22})) : $signed(wire25[(3'h5):(1'h0)])) & (!wire20));
      if ($unsigned({(reg26[(4'hf):(1'h0)] >= ((wire23 <<< wire22) | (reg26 ?
              wire23 : (8'ha8)))),
          $signed(($unsigned(wire24) ~^ (~^(8'hb7))))}))
        begin
          reg27 <= {(((8'ha2) ?
                      ((~&wire22) ?
                          $signed(wire23) : (reg26 ^ wire25)) : wire23[(3'h4):(3'h4)]) ?
                  (8'had) : $unsigned(wire23))};
          reg28 <= reg26[(4'hc):(4'h9)];
          reg29 <= (({((^wire21) ? wire20 : reg28),
                  (wire21[(1'h0):(1'h0)] >= ((8'h9f) ? wire25 : wire22))} ?
              $unsigned($unsigned((reg27 << reg28))) : ($unsigned(wire22) ?
                  $unsigned($unsigned(reg27)) : $signed(wire25))) > $signed(wire21[(2'h2):(2'h2)]));
          if ((reg26 ? wire23[(1'h0):(1'h0)] : reg28))
            begin
              reg30 <= {({($signed(wire20) ?
                              (reg27 ? reg26 : wire23) : {reg27}),
                          (&(wire21 ? reg29 : reg26))} ?
                      reg29[(2'h2):(2'h2)] : reg26)};
            end
          else
            begin
              reg30 <= wire20[(4'h8):(3'h5)];
              reg31 <= $signed(reg28[(3'h7):(3'h4)]);
              reg32 <= {$unsigned({{reg28[(3'h5):(2'h3)]}}),
                  (wire25[(4'h9):(3'h7)] <<< (|$unsigned((wire22 ?
                      reg29 : reg29))))};
              reg33 <= {($signed((wire25 << wire22)) + wire22[(4'h9):(4'h9)]),
                  reg30[(3'h5):(2'h2)]};
            end
          reg34 <= wire20[(4'he):(4'hd)];
        end
      else
        begin
          reg27 <= (reg30[(4'hf):(4'ha)] <= reg34[(2'h2):(1'h0)]);
        end
      reg35 <= wire24[(3'h6):(2'h3)];
      reg36 <= (((|{(~wire21), {reg34, reg35}}) < $unsigned(($signed(reg31) ?
              reg30 : (reg26 != wire24)))) ?
          $unsigned(((reg33 + {(8'ha3)}) ^~ (~$signed(reg34)))) : reg29);
      if (($unsigned($unsigned((reg35 >= (8'had)))) != $signed($signed(((reg31 ?
              wire25 : reg29) ?
          $unsigned(wire20) : (reg27 & (8'h9e)))))))
        begin
          reg37 <= (($signed((~^reg34)) ?
              reg36[(2'h3):(2'h3)] : $unsigned(reg34[(1'h1):(1'h0)])) - (7'h41));
        end
      else
        begin
          reg37 <= $unsigned((^~wire24));
        end
    end
  assign wire38 = {reg32[(3'h4):(1'h1)], reg29[(3'h7):(3'h6)]};
  assign wire39 = $signed($signed((&(+(reg31 ? reg33 : reg27)))));
endmodule
