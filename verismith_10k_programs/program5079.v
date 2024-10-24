module top
#(parameter param43 = {({(^((8'ha9) ? (8'hbb) : (8'hb2))), ({(8'hbd), (8'hb1)} ? {(8'hb8), (8'ha8)} : (&(8'h9f)))} * (~|({(8'h9d)} * (+(8'had)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire4 = $signed((~$unsigned(((wire1 ^~ (8'ha8)) != (-wire3)))));
  assign wire5 = $unsigned({$unsigned($signed((wire2 >> wire0))),
                     $signed({wire2, $signed((8'ha0))})});
  assign wire6 = $signed((^~wire5[(3'h4):(2'h2)]));
  assign wire7 = wire5;
  assign wire8 = $unsigned(wire1[(5'h10):(3'h6)]);
  assign wire9 = $signed((&($unsigned($unsigned(wire3)) - {(wire4 ^ wire2),
                     {(8'ha4), wire2}})));
  assign wire10 = wire9;
  assign wire11 = wire3;
  assign wire12 = wire2;
  assign wire13 = wire6;
  assign wire14 = $unsigned(wire9[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ($signed(wire7))
        begin
          reg15 <= ((($unsigned(wire0[(1'h0):(1'h0)]) ?
                  $unsigned({wire7,
                      wire7}) : $unsigned(wire10[(3'h4):(2'h2)])) <<< (~|wire2)) ?
              ((+({(8'hba),
                  wire8} | {wire9})) - (wire14[(2'h2):(1'h0)] - {(wire13 ?
                      wire13 : wire8),
                  $unsigned(wire5)})) : ($unsigned(wire13[(4'h9):(3'h4)]) ?
                  $signed((~|wire1[(2'h3):(1'h1)])) : ($signed((wire2 > wire5)) ^~ ((&wire9) ?
                      wire4[(4'h8):(2'h2)] : $signed((8'ha6))))));
          reg16 <= $unsigned(wire12);
        end
      else
        begin
          reg15 <= $unsigned(wire1);
          reg16 <= $signed(wire2[(4'hc):(4'h9)]);
          reg17 <= $unsigned(({{{wire3}},
              {(reg15 ?
                      wire9 : (8'ha2))}} * ((wire7[(3'h6):(3'h5)] ^ (wire14 < reg15)) ?
              $signed($signed(wire8)) : wire10)));
        end
      reg18 <= (~&(reg17[(3'h7):(3'h6)] != reg16[(4'h9):(3'h6)]));
      reg19 <= ((($signed((wire6 ? (8'hbd) : wire4)) ?
              (wire13[(5'h15):(5'h15)] ?
                  wire3[(3'h6):(2'h2)] : (reg18 < (8'hbe))) : $unsigned(wire10[(2'h2):(1'h1)])) != wire8) ?
          {(wire3[(2'h3):(1'h1)] && wire0[(4'ha):(4'h8)])} : $signed(($unsigned({wire8}) || $unsigned((^~reg18)))));
      if (wire6[(1'h0):(1'h0)])
        begin
          reg20 <= (~$unsigned(reg19));
          reg21 <= $unsigned($signed((((reg15 ? wire12 : wire0) ?
              $signed((8'hbb)) : (reg18 ? wire9 : reg15)) + wire3)));
          reg22 <= (($signed($unsigned((reg15 <<< (8'hbd)))) + reg19) > ((8'hb9) == wire5[(1'h1):(1'h1)]));
          reg23 <= {$signed($unsigned(reg15)), (&wire10[(2'h2):(1'h0)])};
          if (wire0[(3'h5):(1'h0)])
            begin
              reg24 <= (~reg19[(1'h1):(1'h0)]);
              reg25 <= reg16[(4'ha):(2'h3)];
              reg26 <= (!$unsigned($unsigned(((wire5 ~^ wire10) ?
                  (reg24 ? reg17 : (8'hac)) : $signed(reg15)))));
            end
          else
            begin
              reg24 <= $unsigned($signed((((wire8 ? wire1 : reg15) ?
                  reg17 : (wire5 && reg22)) >= ((reg15 & reg19) ?
                  $unsigned(reg20) : wire13))));
              reg25 <= $unsigned((wire12[(2'h2):(2'h2)] <<< $signed((reg17 ?
                  reg26 : wire6[(4'h9):(4'h8)]))));
              reg26 <= $unsigned(($unsigned(wire5) == (8'hb7)));
              reg27 <= $signed(reg15[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg20 <= (^~$signed(reg22));
          reg21 <= $signed({$unsigned({((8'hab) < wire8),
                  (wire2 ? reg25 : wire6)}),
              (|(((8'hbf) ? wire3 : reg16) ?
                  wire0 : (wire11 ? wire4 : wire2)))});
          reg22 <= ($unsigned($signed((!(^~reg19)))) >>> ((~&wire10) ?
              (reg17 ?
                  wire4[(1'h0):(1'h0)] : (~((8'haa) >= reg26))) : wire5[(3'h6):(3'h5)]));
        end
    end
  always
    @(posedge clk) begin
      if (reg22)
        begin
          if ({$signed(wire6)})
            begin
              reg28 <= (8'hab);
            end
          else
            begin
              reg28 <= reg26;
              reg29 <= $unsigned((^~$signed($signed($signed(reg22)))));
              reg30 <= wire2[(3'h7):(1'h0)];
            end
          if (wire0[(4'hc):(3'h4)])
            begin
              reg31 <= $unsigned((8'ha8));
              reg32 <= $signed((reg28[(4'hc):(1'h1)] >>> (($signed(wire4) > reg16[(4'hb):(2'h2)]) >= $unsigned({wire4,
                  reg20}))));
              reg33 <= $signed(($signed(((~(7'h42)) > $unsigned(reg31))) || $unsigned($unsigned($unsigned(reg24)))));
              reg34 <= (reg29[(4'h9):(1'h1)] ?
                  $unsigned(($unsigned($signed(wire10)) ?
                      ($signed(wire5) ?
                          wire14 : (+reg33)) : (wire13 >> (~wire6)))) : ($signed(wire7[(2'h2):(2'h2)]) ?
                      wire13[(2'h2):(2'h2)] : wire0[(4'hd):(2'h2)]));
            end
          else
            begin
              reg31 <= wire0;
              reg32 <= (reg15 - ((+{$unsigned(reg21), $unsigned(wire1)}) ?
                  wire12 : $unsigned($signed((reg16 && reg27)))));
              reg33 <= $signed(reg24);
              reg34 <= ({reg28, {(wire0 >> $signed(reg27))}} ?
                  (-$unsigned(((|(7'h44)) | (reg18 ?
                      wire2 : wire8)))) : $unsigned({((-reg30) + (reg20 <= wire7)),
                      (&(wire0 ? (8'ha3) : reg19))}));
              reg35 <= $unsigned(reg19[(4'he):(4'h8)]);
            end
          reg36 <= ((~^$unsigned({wire4[(3'h6):(1'h0)]})) ?
              {(((reg33 ? (8'ha8) : reg16) ?
                      (wire4 << wire2) : wire4[(3'h5):(1'h0)]) == reg26),
                  ((~&$signed(wire7)) > (8'haf))} : $signed((($signed(reg25) ^ (!wire0)) == reg32)));
        end
      else
        begin
          if (wire11[(3'h4):(1'h0)])
            begin
              reg28 <= ($signed((^reg23)) ?
                  $unsigned(reg15[(3'h5):(2'h3)]) : $signed($signed((&reg21[(4'hd):(4'ha)]))));
              reg29 <= $signed($signed({reg33[(3'h6):(2'h3)]}));
              reg30 <= ((!wire9) ^~ (({(reg34 != reg26)} ?
                      reg34 : (wire10[(1'h0):(1'h0)] * (wire13 == reg25))) ?
                  ((wire12[(4'hd):(1'h1)] ?
                          $unsigned(wire13) : $signed(wire13)) ?
                      $unsigned($signed(reg25)) : (~(^~reg20))) : $signed({(wire14 ?
                          (8'h9f) : reg27),
                      reg19[(4'hf):(4'h9)]})));
            end
          else
            begin
              reg28 <= reg16[(2'h2):(1'h1)];
              reg29 <= {$unsigned(reg24[(2'h2):(1'h1)])};
              reg30 <= $unsigned((((reg27[(3'h4):(1'h1)] ^ reg28[(4'h9):(3'h5)]) << ((reg20 & reg15) ?
                      $unsigned(wire4) : (wire3 >> wire11))) ?
                  (~(((8'ha4) ?
                      reg31 : reg31) != $unsigned(reg15))) : reg26[(1'h1):(1'h0)]));
              reg31 <= reg31[(4'hc):(4'hb)];
              reg32 <= $unsigned((|$unsigned({(wire6 ~^ (8'hb4))})));
            end
          if ((8'had))
            begin
              reg33 <= reg30;
              reg34 <= $signed($signed(reg20));
              reg35 <= ((^~{{(~^reg34)},
                  $signed($signed(reg31))}) * wire6[(3'h4):(2'h3)]);
              reg36 <= wire13[(5'h13):(4'ha)];
              reg37 <= reg19;
            end
          else
            begin
              reg33 <= ({(((reg35 ^ wire3) ?
                          reg32[(3'h6):(1'h0)] : (reg19 >>> reg24)) - (~&reg26[(1'h1):(1'h1)]))} ?
                  $signed({($signed(reg21) && (&reg34))}) : ((((wire12 != reg28) <= $unsigned((8'hbb))) ?
                      reg22[(3'h4):(2'h3)] : (~^(wire4 ?
                          reg16 : reg20))) ^ (|reg34)));
              reg34 <= reg24[(3'h5):(1'h1)];
              reg35 <= ($signed((((wire5 ? reg19 : wire13) ?
                          $unsigned(wire12) : reg23[(2'h2):(1'h1)]) ?
                      $unsigned((8'ha8)) : $unsigned(reg19))) ?
                  ($unsigned({((8'hac) ? reg30 : reg21),
                          (wire14 ? reg30 : wire9)}) ?
                      ($unsigned(((8'hbb) ?
                          wire7 : (8'had))) && reg30[(3'h5):(3'h5)]) : (($unsigned(reg28) ?
                              (|wire0) : (reg29 != reg29)) ?
                          (((8'ha8) - wire0) && $signed(wire7)) : $unsigned($unsigned(reg37)))) : (|(7'h41)));
            end
          reg38 <= $unsigned($signed((~^(^reg36[(4'he):(2'h2)]))));
          reg39 <= reg30[(4'ha):(3'h6)];
        end
      if ((reg38 ? (wire12 > reg20[(1'h0):(1'h0)]) : reg38))
        begin
          reg40 <= ((reg26[(1'h0):(1'h0)] ^~ $signed((^~(&wire6)))) * ((8'hb9) ?
              wire11 : (7'h44)));
        end
      else
        begin
          reg40 <= $unsigned((wire11[(2'h3):(2'h2)] >> (8'hbb)));
        end
    end
  assign wire41 = reg31;
  assign wire42 = reg20[(3'h4):(2'h2)];
endmodule
