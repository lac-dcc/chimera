module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire48;
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire4,
                 wire5,
                 wire7,
                 wire8,
                 wire48,
                 reg55,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h1)];
  assign wire5 = (wire0 ?
                     (!($signed((&(8'haf))) | {wire3[(4'h9):(1'h0)]})) : wire4);
  always
    @(posedge clk) begin
      reg6 <= wire1[(2'h2):(1'h1)];
    end
  assign wire7 = ((&wire4[(3'h5):(3'h4)]) < (^~(((wire4 ?
                         wire3 : wire2) <<< wire3[(5'h15):(2'h2)]) ?
                     wire1 : (reg6 ? (reg6 > wire1) : (wire2 && (8'hbc))))));
  assign wire8 = reg6[(4'hd):(2'h2)];
  module9 #() modinst49 (wire48, clk, wire5, wire2, wire0, wire3, wire8);
  assign wire50 = (-wire4);
  assign wire51 = wire3;
  assign wire52 = {(|{$signed((-wire0)),
                          (reg6[(3'h4):(1'h1)] <<< $unsigned(wire51))}),
                      ((wire51[(4'h9):(1'h1)] * wire5[(5'h13):(5'h10)]) ?
                          $signed(wire4) : $unsigned({$signed((8'haf)),
                              ((8'hbe) ? (7'h44) : wire7)}))};
  assign wire53 = (($unsigned(wire48) ?
                      wire52[(1'h1):(1'h1)] : {wire8[(3'h5):(3'h4)],
                          (&{(7'h43)})}) >= ((-wire4[(3'h6):(1'h1)]) ?
                      $signed($signed($signed(wire2))) : $signed((+(~&wire48)))));
  assign wire54 = (($signed({$unsigned(wire1)}) & $unsigned((wire1[(1'h0):(1'h0)] ?
                      $unsigned(wire5) : wire3[(2'h2):(1'h0)]))) << reg6[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      reg55 <= $signed(((8'hb6) * (~|$signed(wire8))));
    end
  assign wire56 = ({$unsigned((~&(wire5 - wire1)))} >= wire3[(4'h9):(3'h6)]);
endmodule

module module9
#(parameter param47 = ((8'hbe) | (((((8'ha1) ^~ (8'hb7)) ? ((8'hbc) >>> (8'hbf)) : ((8'ha8) >> (8'hb5))) || ((8'ha0) != ((8'haf) ? (8'h9c) : (7'h42)))) | (!(!((8'hbf) & (8'hb1)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire15;
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  assign y = {wire43, wire42, wire40, wire15, reg46, reg45, reg44, (1'h0)};
  assign wire15 = $unsigned({$signed(($signed(wire14) & ((8'h9c) >>> wire11)))});
  module16 #() modinst41 (wire40, clk, wire10, wire15, wire11, wire13);
  assign wire42 = ((~|(!wire13)) ? wire40[(4'he):(4'hc)] : (8'hb9));
  assign wire43 = $unsigned((($signed($unsigned((8'h9c))) || $signed(((8'hba) ?
                          (7'h43) : wire40))) ?
                      wire10[(1'h1):(1'h0)] : (($unsigned(wire40) >>> wire11[(3'h4):(2'h3)]) > $signed({wire12,
                          wire42}))));
  always
    @(posedge clk) begin
      reg44 <= {(|$unsigned(wire42))};
      reg45 <= (wire10[(2'h3):(1'h1)] >>> $unsigned(wire14[(4'h8):(2'h2)]));
      reg46 <= $signed({(|(&wire12)), $unsigned((8'hbd))});
    end
endmodule

module module16
#(parameter param39 = {(((8'hb3) ? (8'ha0) : (((8'h9d) && (7'h43)) < (~(8'h9f)))) ? (|(((7'h43) >= (8'h9f)) - ((8'hb6) ~^ (8'hb5)))) : {(((7'h42) <<< (8'ha5)) ? ((7'h41) ? (8'hbc) : (8'h9f)) : {(8'hb6), (8'h9d)}), {((8'h9f) + (8'ha2))}}), (+{(((8'hb5) != (8'hae)) || ((8'hb2) <= (8'hb3)))})})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire38,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire21 = {wire19};
  assign wire22 = wire20;
  assign wire23 = wire21[(1'h1):(1'h1)];
  assign wire24 = $unsigned(((($signed(wire21) != wire23) ?
                      wire23[(4'h9):(4'h9)] : wire17[(4'he):(1'h0)]) <= $signed($signed($unsigned((8'had))))));
  assign wire25 = $unsigned({(($unsigned(wire23) ~^ $unsigned(wire20)) ?
                          wire24[(5'h12):(4'hd)] : ((wire24 <= wire24) ?
                              wire19[(2'h2):(1'h0)] : wire20[(1'h0):(1'h0)])),
                      ((8'ha6) - ((8'h9c) && {wire20}))});
  assign wire26 = {wire17};
  assign wire27 = wire17;
  assign wire28 = (wire18 << (&wire24));
  assign wire29 = (8'hba);
  always
    @(posedge clk) begin
      reg30 <= $signed((~|wire27[(5'h11):(1'h1)]));
      reg31 <= wire27;
      if ({wire17})
        begin
          reg32 <= {((wire22 ? (!{wire20}) : $unsigned((!wire21))) || ({wire23,
                  (wire29 ? wire23 : (8'hba))} <<< (!(~^wire17)))),
              ($signed(($signed(wire17) ?
                  {wire29, (8'hb0)} : $signed((8'hb0)))) && wire25)};
          reg33 <= wire19[(2'h2):(1'h0)];
        end
      else
        begin
          reg32 <= ((wire24 ?
                  $unsigned(({wire28,
                      (8'ha3)} - (+wire28))) : ($unsigned((wire23 ?
                      wire18 : wire29)) <= (!wire28[(2'h2):(2'h2)]))) ?
              $signed(wire27) : ((|(wire19[(2'h3):(2'h2)] << (reg33 <= reg32))) < reg32[(5'h12):(4'he)]));
          reg33 <= wire27;
        end
      reg34 <= (($unsigned({{wire26, (8'h9f)}}) ?
          $unsigned((~|(~^reg31))) : {((7'h43) ? (&wire17) : $signed(wire28)),
              reg31}) ~^ (wire22 < (((^wire29) < wire24) ?
          (!((8'hab) != (8'hb3))) : ($signed(wire27) ?
              wire25[(1'h1):(1'h0)] : (+wire21)))));
      if (wire25)
        begin
          reg35 <= ((reg31 >>> wire22) < wire24[(2'h2):(1'h0)]);
        end
      else
        begin
          if (wire22[(1'h1):(1'h0)])
            begin
              reg35 <= wire25;
            end
          else
            begin
              reg35 <= ($signed((((wire26 ? wire24 : wire25) ?
                          $signed((7'h43)) : (reg32 ^ wire19)) ?
                      (^~(wire25 ?
                          reg31 : wire18)) : $signed(wire28[(1'h0):(1'h0)]))) ?
                  $signed(((((7'h40) ~^ wire29) - $unsigned(wire24)) > $signed(wire20))) : reg31[(3'h5):(1'h0)]);
              reg36 <= (&wire28[(3'h5):(2'h3)]);
              reg37 <= $unsigned((&{reg35[(3'h4):(1'h0)], wire23}));
            end
        end
    end
  assign wire38 = $signed($signed(reg36[(2'h2):(1'h1)]));
endmodule
