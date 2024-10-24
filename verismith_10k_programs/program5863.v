module top
#(parameter param54 = ((({((7'h44) >>> (8'hb7)), ((8'hbc) >> (8'hb4))} ? ({(8'ha0)} <<< (&(8'h9e))) : ({(7'h42)} ? (+(7'h44)) : (|(8'hbd)))) ? (~^((^(7'h42)) ? ((8'hb0) ? (7'h44) : (8'hb7)) : ((8'hb4) >>> (8'hb9)))) : ((((7'h44) ? (7'h44) : (7'h41)) ? ((8'hba) | (8'hae)) : ((8'ha6) == (8'hae))) ? (^{(8'h9d)}) : (^~((8'ha7) < (8'hbe))))) != (~^((~^((7'h43) ? (8'ha2) : (8'hb8))) >> (((8'ha2) ? (8'hb2) : (8'hb4)) || ((8'ha8) ? (8'ha8) : (8'ha3)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire48;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire48,
                 (1'h0)};
  assign wire5 = (~^(~|(!(~|wire2[(3'h6):(1'h1)]))));
  assign wire6 = {(wire0 == wire3[(2'h3):(1'h1)]), (+$signed(wire3))};
  assign wire7 = {(wire4 <= (^~{(~&(8'ha2)), (wire6 ? (8'hb1) : wire0)})),
                     (^$signed((^~(wire2 ? wire3 : (8'hb0)))))};
  assign wire8 = $unsigned($signed((wire6 ?
                     ((wire4 ?
                         wire5 : (8'hbe)) | (wire0 ^ wire3)) : wire6[(1'h0):(1'h0)])));
  assign wire9 = (((+{(wire7 ?
                         (8'hb4) : wire2)}) ^ $unsigned($unsigned(wire1[(4'hd):(3'h5)]))) <= $unsigned(wire5));
  module10 #() modinst49 (wire48, clk, wire5, wire8, wire6, wire2, wire4);
  assign wire50 = (wire2 && wire48);
  assign wire51 = wire7[(1'h1):(1'h0)];
  assign wire52 = ({(({wire0, wire7} ? (wire4 > wire5) : $signed(wire50)) ?
                          (&wire7) : wire48[(2'h2):(1'h1)]),
                      $unsigned((~&wire5[(4'hb):(4'hb)]))} + wire3);
  assign wire53 = ((wire9[(2'h2):(2'h2)] ?
                      wire2 : (wire9 >> $unsigned($unsigned(wire8)))) | wire48);
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(3'h4):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire18,
                 wire17,
                 wire16,
                 reg42,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire16 = {(~{wire13})};
  assign wire17 = (wire16 ?
                      $signed(($unsigned($signed(wire13)) ?
                          ((wire15 ?
                              wire16 : wire15) + $unsigned(wire12)) : wire13[(1'h0):(1'h0)])) : wire16);
  assign wire18 = $unsigned($unsigned({$unsigned($signed(wire16))}));
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire18);
      reg20 <= ($signed($unsigned(wire15)) + {$unsigned(({(7'h42)} * (reg19 + wire15)))});
      if ($signed(wire13[(2'h2):(2'h2)]))
        begin
          reg21 <= $signed(((((reg19 ? wire13 : wire18) ?
                      reg19[(4'h9):(2'h2)] : ((8'hbe) ? wire16 : (8'hb0))) ?
                  wire17[(3'h4):(1'h1)] : ($unsigned(wire18) ?
                      $signed(reg20) : wire16)) ?
              ($unsigned(wire11[(1'h0):(1'h0)]) >> $signed(wire15[(4'hc):(4'hc)])) : (&$signed($signed(wire15)))));
          if (reg21)
            begin
              reg22 <= wire17;
              reg23 <= ((|wire15) ?
                  wire13[(3'h4):(1'h1)] : (~|(~&wire18[(2'h3):(1'h0)])));
              reg24 <= wire11;
              reg25 <= wire18[(2'h2):(2'h2)];
            end
          else
            begin
              reg22 <= wire18;
              reg23 <= $unsigned((wire15[(3'h6):(1'h1)] ?
                  {($unsigned(reg23) ? wire13 : reg23[(1'h0):(1'h0)]),
                      (&(|reg25))} : $unsigned(wire17[(4'ha):(2'h3)])));
              reg24 <= (($signed((~&(&wire12))) << (+$signed((~&(8'had))))) ?
                  (wire12 == (wire14 ~^ (~$signed(wire13)))) : reg25);
            end
          reg26 <= (~^wire15[(4'ha):(3'h4)]);
        end
      else
        begin
          reg21 <= $unsigned($signed($unsigned((((8'h9f) < reg22) - (~&wire16)))));
        end
      reg27 <= {wire17};
    end
  assign wire28 = (8'hb1);
  assign wire29 = reg23;
  assign wire30 = $signed($unsigned(reg26));
  assign wire31 = (({($signed(reg26) >>> (wire12 >> wire15)),
                      reg22[(1'h1):(1'h0)]} && $unsigned((|$signed((8'hb0))))) ~^ reg25[(5'h10):(4'he)]);
  assign wire32 = (^~(~^($signed($unsigned(wire31)) != $unsigned(wire14))));
  assign wire33 = $signed((~&$unsigned(($signed(wire30) >= $unsigned((8'haa))))));
  assign wire34 = (~&(!wire15));
  assign wire35 = wire12[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg36 <= (reg20 ?
          (wire15[(4'hd):(3'h5)] ?
              wire16[(1'h0):(1'h0)] : wire35[(1'h1):(1'h0)]) : (wire18[(4'ha):(4'h9)] && wire17));
      reg37 <= wire31;
      reg38 <= reg24;
    end
  always
    @(posedge clk) begin
      reg39 <= ({(((!wire32) == wire13) <<< $unsigned(reg23)),
          (~^{(wire12 ? reg26 : wire16)})} ~^ $unsigned($signed((7'h43))));
    end
  assign wire40 = (~$unsigned(($signed((!wire33)) <<< (|$signed(wire31)))));
  assign wire41 = reg38;
  always
    @(posedge clk) begin
      reg42 <= reg37[(3'h5):(2'h3)];
    end
  assign wire43 = ((~wire33[(2'h2):(2'h2)]) ?
                      (8'h9c) : $unsigned(($signed(reg42[(2'h2):(1'h1)]) ?
                          reg22 : wire33)));
  assign wire44 = $unsigned((&wire11));
  assign wire45 = $signed(reg25[(4'hf):(4'hc)]);
  assign wire46 = {(($unsigned((!wire40)) ?
                              {$unsigned((8'ha8)),
                                  ((8'hb3) ? reg19 : wire44)} : wire35) ?
                          $signed($signed((reg21 ?
                              reg25 : wire33))) : $signed({reg38})),
                      ($unsigned($signed($unsigned(reg37))) ?
                          wire35 : $unsigned(wire33))};
  assign wire47 = (!($signed((!(wire41 ?
                      reg19 : reg27))) - (reg25[(1'h0):(1'h0)] ?
                      ($signed(wire31) ?
                          {wire31} : (wire35 - reg23)) : {$signed((8'hb3))})));
endmodule
