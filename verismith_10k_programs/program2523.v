module top
#(parameter param40 = {(~&{((8'hb4) ? ((8'ha8) ~^ (8'hbb)) : (&(8'hb5)))})}, 
parameter param41 = (param40 >= (+(8'hb1))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire36;
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire36,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~^wire3);
      reg5 <= {$signed({$unsigned(wire2[(5'h10):(3'h4)]), $signed((+wire2))}),
          $signed((reg4 ?
              $unsigned($signed(wire0)) : ($unsigned(wire3) ?
                  wire2 : (wire1 ^ (8'hb1)))))};
      reg6 <= ((-$signed((wire1[(1'h0):(1'h0)] >> wire1))) | wire2);
      reg7 <= $signed(reg4[(5'h11):(4'he)]);
      reg8 <= ((^$unsigned(wire1[(3'h5):(2'h2)])) << ({{$unsigned(reg5)}} ?
          (^~$unsigned($unsigned(reg6))) : $unsigned(reg6[(3'h6):(2'h3)])));
    end
  assign wire9 = reg7;
  assign wire10 = ($signed(reg7) ?
                      $signed(reg7) : $unsigned($unsigned(((reg7 && reg5) | ((8'haa) ~^ wire0)))));
  assign wire11 = ($unsigned(reg5[(3'h5):(3'h5)]) ?
                      (-({$signed((8'hb6)), wire3} | ((wire10 ?
                          reg6 : wire3) ^~ (+wire10)))) : ((8'ha0) ?
                          $signed((+(!wire1))) : {(&wire1),
                              $signed($unsigned(wire0))}));
  assign wire12 = (wire3 ?
                      $signed((~|reg4[(3'h5):(2'h2)])) : (&reg7[(1'h0):(1'h0)]));
  module13 #() modinst37 (wire36, clk, reg4, reg6, reg5, wire12, reg8);
  assign wire38 = reg8[(4'h8):(3'h6)];
  assign wire39 = (reg7 ?
                      ($signed(reg4) * $signed(($signed((8'hbb)) ?
                          (^wire12) : (wire9 ?
                              reg4 : reg8)))) : $signed(($signed(wire10[(1'h0):(1'h0)]) ?
                          ($signed(wire0) >>> $signed(wire38)) : (&wire9))));
endmodule

module module13
#(parameter param34 = {(8'hb7), {(8'ha7)}}, 
parameter param35 = (param34 <= ({((param34 <= param34) ^ param34), ((+param34) ? (param34 + param34) : (param34 ? (8'h9d) : param34))} != {(&(~&param34))})))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire20,
                 wire19,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = {wire16[(3'h4):(1'h0)]};
  assign wire20 = $signed((!$signed({((8'hbb) < wire17)})));
  always
    @(posedge clk) begin
      if (wire19)
        begin
          reg21 <= wire19;
          reg22 <= wire19;
          if (($unsigned($unsigned(((8'hb7) ?
                  (wire14 ? wire18 : reg22) : (reg21 ? wire19 : wire16)))) ?
              {$signed((!(^reg22)))} : wire20))
            begin
              reg23 <= $signed(($signed({{wire18}}) ?
                  wire16 : {(reg21 ? {wire15, wire20} : (~|wire14))}));
              reg24 <= (!(~^$signed((~|((8'haf) ? reg21 : wire15)))));
              reg25 <= wire19;
              reg26 <= wire15[(5'h14):(4'h8)];
              reg27 <= (|wire18[(5'h13):(4'he)]);
            end
          else
            begin
              reg23 <= (8'ha7);
            end
        end
      else
        begin
          reg21 <= {reg27[(2'h3):(2'h2)],
              (({(reg23 > reg24)} ?
                      (^~(reg27 ? wire16 : reg25)) : (reg22[(2'h2):(2'h2)] ?
                          (reg25 && reg27) : $unsigned(wire16))) ?
                  ({{wire15}, wire17[(5'h10):(4'hb)]} ?
                      $signed((reg23 << (8'haa))) : reg24[(1'h1):(1'h0)]) : $signed(((wire15 ?
                      (8'hbc) : wire18) > (reg25 ? wire17 : reg24))))};
          reg22 <= $signed({$unsigned(reg24)});
          reg23 <= (($unsigned((wire18 ? $unsigned(wire20) : reg23)) ?
              {$unsigned(reg22[(3'h4):(2'h2)]),
                  $unsigned($signed(wire19))} : ((~&(reg24 ? wire18 : wire20)) ?
                  wire19[(3'h6):(3'h6)] : ($unsigned(wire15) ^~ wire14))) != $signed((~^$unsigned((8'hbf)))));
          reg24 <= $signed($unsigned(reg24));
          if (({wire15} < $signed($unsigned((wire17[(4'h8):(1'h0)] ^~ {reg23})))))
            begin
              reg25 <= reg26[(2'h2):(1'h1)];
              reg26 <= $unsigned(wire19);
              reg27 <= ((|$unsigned((-$unsigned((8'h9c))))) ?
                  ((wire16[(3'h4):(2'h2)] < {((8'h9f) ^ wire20)}) ?
                      (7'h42) : $unsigned((wire19[(1'h0):(1'h0)] ^ $unsigned(reg27)))) : (+$signed(reg24)));
            end
          else
            begin
              reg25 <= $unsigned($unsigned((&reg25[(4'hd):(4'hc)])));
              reg26 <= (8'ha3);
            end
        end
    end
  assign wire28 = wire19[(3'h5):(3'h4)];
  assign wire29 = (((($unsigned(wire16) > $unsigned(reg21)) << ($signed(wire14) ?
                              $signed(reg21) : (reg24 <= (8'ha2)))) ?
                          $signed($unsigned(wire20[(1'h1):(1'h1)])) : reg24[(2'h3):(1'h0)]) ?
                      (reg27[(2'h3):(2'h3)] << ($signed((-wire16)) == (~((8'ha0) & (8'ha2))))) : (wire18[(4'he):(4'he)] ?
                          $unsigned(($unsigned((7'h44)) >> (wire28 >> wire14))) : (((^(8'h9d)) ^ wire28[(4'ha):(3'h7)]) << wire18[(5'h10):(2'h2)])));
  assign wire30 = ($signed((-$unsigned({wire20}))) ?
                      $unsigned((&$signed($unsigned(reg27)))) : $signed({reg27}));
  assign wire31 = wire20[(1'h0):(1'h0)];
  assign wire32 = $signed((($signed((~&wire20)) ?
                          ($signed(wire30) >> $signed(wire15)) : wire20) ?
                      reg23[(2'h2):(1'h1)] : $unsigned({wire18[(4'ha):(3'h6)],
                          (8'hb3)})));
  assign wire33 = (~^$unsigned(($unsigned((~wire32)) <<< (wire29[(3'h6):(3'h6)] ?
                      $signed(wire30) : (reg24 ? wire29 : (8'ha2))))));
endmodule
