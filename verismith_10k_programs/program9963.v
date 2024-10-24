module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire42,
                 wire41,
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
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned($signed(((wire0 + {wire3}) * wire0[(4'h9):(3'h6)])));
  assign wire5 = wire2;
  assign wire6 = ((({(-wire1),
                         (~wire2)} != $unsigned(wire4)) <<< $unsigned(wire0)) ?
                     (+wire4[(3'h4):(1'h0)]) : $signed((~&wire2)));
  assign wire7 = ((wire4 ^~ $signed({wire2[(4'hb):(3'h4)],
                     (wire0 && wire6)})) - (+(~$signed(wire0[(3'h7):(2'h2)]))));
  always
    @(posedge clk) begin
      reg8 <= (wire7[(2'h2):(1'h0)] << $unsigned(wire7[(4'hc):(1'h0)]));
    end
  assign wire9 = ((^~(wire7 ^~ ((wire2 ?
                     wire4 : (8'h9e)) >= {wire7}))) ~^ wire0);
  assign wire10 = wire6;
  assign wire11 = ((~^$unsigned($signed($signed(wire4)))) >> {wire2});
  assign wire12 = $unsigned(wire3);
  assign wire13 = {wire6[(4'hc):(4'h8)],
                      $signed($unsigned($unsigned($signed((8'hbe)))))};
  assign wire14 = $signed((+wire0[(3'h6):(2'h2)]));
  assign wire15 = (wire7[(3'h5):(2'h3)] ?
                      wire12 : (~|{$signed($signed(wire0)), (7'h43)}));
  assign wire16 = (($unsigned(wire2[(3'h4):(2'h2)]) >> (wire6[(4'hd):(4'hc)] ?
                      (((8'ha7) ? wire5 : wire11) ?
                          {wire3,
                              wire14} : $signed(wire6)) : {$unsigned(wire0)})) >>> ((((wire14 - wire5) <<< (reg8 ?
                              wire11 : wire3)) ?
                          (&(wire0 ? wire12 : (8'hae))) : (wire13 ?
                              (wire15 ? (8'hab) : (8'h9d)) : wire12)) ?
                      wire14[(4'hc):(2'h2)] : $signed($signed($unsigned((8'ha3))))));
  assign wire17 = $signed((^((wire11[(3'h6):(1'h0)] ?
                      $signed(reg8) : $unsigned((8'ha3))) << {(wire6 + wire0)})));
  assign wire18 = $signed(((~|$unsigned({wire0})) || (~^(&{wire7}))));
  always
    @(posedge clk) begin
      if ($signed((wire17 ? (8'hbe) : reg8[(2'h3):(2'h3)])))
        begin
          reg19 <= {$signed($signed((wire3[(5'h14):(1'h1)] | wire16[(4'he):(3'h6)]))),
              wire9};
          reg20 <= ($signed((~$unsigned((wire7 | wire9)))) ?
              ($signed((|{(8'ha4)})) ?
                  {wire6} : wire12[(2'h2):(2'h2)]) : $signed(((~^$unsigned(wire5)) ?
                  wire1 : $unsigned(wire16))));
          reg21 <= (((wire9 & wire4[(3'h7):(3'h5)]) << (((-wire9) ?
                      {wire4, reg20} : ((8'ha3) ? wire3 : wire5)) ?
                  $unsigned({wire10, wire5}) : $signed({(8'ha9), (8'hb1)}))) ?
              wire3[(4'hd):(4'hb)] : ($unsigned((~|$signed(wire7))) ?
                  wire3[(4'hf):(4'hb)] : reg8[(1'h0):(1'h0)]));
        end
      else
        begin
          reg19 <= wire14;
          if ($signed(wire7[(1'h1):(1'h1)]))
            begin
              reg20 <= ($unsigned((wire16 ?
                  ($signed(wire14) <= (wire2 <= wire15)) : ((~^wire7) ?
                      wire9[(4'hd):(4'ha)] : $unsigned(wire13)))) + (-(wire1[(3'h4):(2'h2)] ?
                  wire5 : wire2)));
              reg21 <= $unsigned(wire10[(3'h7):(2'h3)]);
              reg22 <= ((((~^wire15) ?
                      ((wire16 ? (8'had) : wire9) ?
                          (wire11 ?
                              wire9 : reg21) : (~wire1)) : $signed((8'ha6))) ?
                  wire14[(5'h11):(2'h2)] : $unsigned((~reg20[(3'h6):(3'h6)]))) >> {{$unsigned((~(8'hb3))),
                      ((wire9 ? wire0 : wire5) - $unsigned((8'hb6)))}});
              reg23 <= $unsigned($unsigned((!$signed(reg19[(4'hf):(4'hc)]))));
              reg24 <= {(^~{$signed((wire10 && (8'hb3)))})};
            end
          else
            begin
              reg20 <= ((^~(^{$signed(wire6)})) ?
                  {$unsigned({(+wire2)}),
                      $unsigned(((wire3 ? wire15 : reg23) ?
                          ((8'hb0) ~^ reg23) : (~&(8'ha9))))} : {$signed((!$unsigned(wire14)))});
              reg21 <= ((wire3[(3'h5):(3'h4)] > wire2) ?
                  $unsigned($signed($signed(wire12[(1'h1):(1'h1)]))) : (~|(wire2 ?
                      $signed(wire7[(3'h7):(1'h0)]) : wire3)));
            end
          reg25 <= $signed(((wire12 != (~reg21[(3'h4):(1'h0)])) ?
              ($unsigned((8'ha8)) ?
                  reg21 : wire9[(3'h5):(2'h2)]) : (^((wire3 + wire7) ?
                  (-wire9) : $unsigned(wire17)))));
          reg26 <= $signed((wire6 - wire3[(2'h3):(1'h1)]));
          reg27 <= wire11[(4'h8):(1'h0)];
        end
      reg28 <= ((|$signed((~^wire6[(3'h6):(3'h4)]))) ?
          (8'hb4) : (wire2[(3'h7):(3'h6)] ?
              (($signed(wire13) ? (wire15 >>> wire15) : (!wire13)) ?
                  {reg19, (^wire10)} : wire3[(3'h4):(2'h3)]) : (~(8'hb7))));
      reg29 <= ((-(^~$unsigned((wire2 ? wire16 : reg22)))) < reg20);
      if ($unsigned($unsigned((~reg29))))
        begin
          reg30 <= (($signed((wire3 <= (wire11 ?
              reg27 : reg20))) > (~|$signed(reg21[(1'h0):(1'h0)]))) << ($unsigned((wire13 ?
                  $signed(reg21) : (+reg25))) ?
              (($unsigned(reg24) ?
                  (|reg28) : {reg27}) || reg28[(3'h5):(2'h2)]) : $unsigned(reg21[(3'h5):(2'h2)])));
          reg31 <= (reg21[(3'h6):(3'h4)] < (^~(wire13 && ((wire0 ?
                  wire9 : wire2) ?
              {reg23, wire13} : wire13))));
        end
      else
        begin
          reg30 <= $unsigned(reg31[(4'h8):(2'h2)]);
          if ($signed(wire7))
            begin
              reg31 <= wire17[(4'ha):(2'h2)];
              reg32 <= wire10[(4'hd):(4'ha)];
              reg33 <= ({$signed(((wire12 + reg8) != $signed(wire7)))} - (8'hb7));
              reg34 <= reg19;
              reg35 <= $signed(($signed(($signed(reg25) ?
                  reg33[(4'hd):(4'hb)] : {reg31, reg19})) >= reg28));
            end
          else
            begin
              reg31 <= $signed($signed(reg34[(2'h3):(1'h1)]));
              reg32 <= reg35[(2'h3):(1'h0)];
              reg33 <= $unsigned(reg27[(3'h7):(3'h4)]);
              reg34 <= $signed(wire16);
            end
          reg36 <= $unsigned(reg34[(5'h11):(1'h0)]);
          reg37 <= wire18;
          reg38 <= (8'hb9);
        end
      reg39 <= $unsigned(wire17);
    end
  assign wire40 = (({$signed((+wire6)),
                      $signed((^~wire18))} | ((!(wire2 - wire12)) ?
                      {{wire2}} : (^$signed(wire18)))) >= wire3[(5'h12):(4'hf)]);
  assign wire41 = $signed({reg24, (8'ha8)});
  assign wire42 = $signed(reg34);
endmodule
