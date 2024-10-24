module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire33,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 wire8,
                 wire7,
                 wire5,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg6,
                 (1'h0)};
  assign wire5 = {{(wire0[(2'h3):(1'h0)] ? wire4[(3'h4):(1'h0)] : wire2)}};
  always
    @(posedge clk) begin
      reg6 <= ((^~$unsigned(((wire4 ? (8'hb2) : wire1) ?
          wire1[(1'h0):(1'h0)] : {wire5}))) + $unsigned(($unsigned(wire4[(2'h2):(1'h1)]) >= $unsigned(((8'h9e) | (8'h9d))))));
    end
  assign wire7 = $signed(($signed({(wire0 & wire0), {(8'ha8)}}) ?
                     ((~&wire0) ?
                         $signed((wire1 ?
                             wire4 : wire0)) : $signed(reg6[(3'h6):(3'h6)])) : wire0));
  assign wire8 = wire1;
  assign wire9 = (wire0[(1'h0):(1'h0)] == $unsigned({$unsigned((~&(8'hae))),
                     $unsigned($signed(reg6))}));
  assign wire10 = wire3[(4'he):(1'h0)];
  assign wire11 = $signed($unsigned($signed($unsigned((^wire10)))));
  assign wire12 = wire10[(2'h2):(2'h2)];
  assign wire13 = (!$signed(wire7[(4'hf):(3'h6)]));
  assign wire14 = {wire9[(1'h1):(1'h1)],
                      $signed(($unsigned(wire12) ?
                          $unsigned((!(8'hae))) : ((~wire3) && (wire10 ^ wire7))))};
  assign wire15 = (~^$signed(($signed((wire12 ? wire1 : wire5)) ?
                      (-$signed(wire0)) : $signed($unsigned((8'hac))))));
  assign wire16 = wire12;
  assign wire17 = $signed(wire0[(1'h1):(1'h0)]);
  assign wire18 = ((8'hb8) ?
                      ({$unsigned(wire5)} ?
                          (~&{$unsigned(wire2)}) : $unsigned(wire13[(2'h2):(2'h2)])) : ($signed($unsigned($unsigned((8'hba)))) ?
                          ({((8'hb2) ? reg6 : wire3), wire11} ?
                              (wire2[(5'h10):(3'h4)] || ((8'hb1) ?
                                  wire9 : (7'h44))) : (~&$unsigned(wire12))) : ($signed((reg6 ?
                                  reg6 : wire12)) ?
                              (^(-(8'hae))) : wire14)));
  assign wire19 = {$unsigned((^{{wire0}, ((8'hb3) <<< wire17)})),
                      (!((|$signed(wire14)) ?
                          reg6 : $signed($unsigned(wire8))))};
  assign wire20 = $signed((+(wire17[(3'h7):(3'h7)] ^~ $signed(((8'hb8) ?
                      wire4 : (8'hab))))));
  assign wire21 = $unsigned(wire16[(4'hd):(3'h4)]);
  assign wire22 = (&(8'ha3));
  assign wire23 = wire8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((|$signed((~&$signed(wire20)))))
        begin
          reg24 <= ($unsigned($unsigned(wire9[(2'h3):(2'h2)])) ?
              ($signed((wire17 <<< $signed(wire9))) ?
                  (&$signed((wire0 < wire5))) : $unsigned($signed($unsigned(wire21)))) : ((!$signed(wire12)) ?
                  (~^$unsigned((~&wire16))) : (^~wire9)));
          reg25 <= ($signed(($signed((~wire8)) < wire23[(4'hd):(3'h7)])) >> wire7[(1'h0):(1'h0)]);
        end
      else
        begin
          reg24 <= (((-({wire21, reg25} ? wire4[(3'h4):(1'h0)] : (~&wire9))) ?
                  {((wire23 ?
                          wire14 : reg25) ~^ wire5[(3'h6):(2'h3)])} : reg25) ?
              wire0[(1'h1):(1'h0)] : ((((&wire3) | (wire23 ?
                  (8'hbd) : wire12)) > $signed({wire13,
                  wire4})) & $unsigned({(^~wire11)})));
          reg25 <= wire19[(1'h1):(1'h1)];
          reg26 <= wire3;
          if (((^~$unsigned((^~(8'hbc)))) && $signed($unsigned((((8'ha3) <<< wire0) >> $signed((8'ha5)))))))
            begin
              reg27 <= wire0[(2'h2):(1'h0)];
              reg28 <= ((wire8[(2'h3):(1'h1)] ?
                      wire3 : $unsigned(wire12[(4'h9):(3'h7)])) ?
                  reg24[(4'h8):(4'h8)] : ((wire7 != $unsigned(wire2)) ^ (~|reg26)));
              reg29 <= reg28;
            end
          else
            begin
              reg27 <= $unsigned(reg24[(3'h6):(1'h1)]);
              reg28 <= ($signed((&reg24[(3'h7):(2'h2)])) + $unsigned(wire3[(1'h1):(1'h0)]));
              reg29 <= (reg28 ?
                  wire3[(1'h1):(1'h1)] : $signed(({wire12,
                      $unsigned(wire22)} || (8'hb4))));
              reg30 <= $signed(wire15);
              reg31 <= $unsigned((8'hb7));
            end
          reg32 <= $signed(reg27[(3'h5):(3'h5)]);
        end
    end
  assign wire33 = (wire8[(2'h2):(1'h0)] != $signed((8'h9c)));
endmodule
