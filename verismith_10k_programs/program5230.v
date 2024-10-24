module top
#(parameter param32 = (~&(((!((8'hb9) ? (8'hbc) : (8'haa))) << ((~^(8'hb1)) ? ((8'hbb) ? (8'hac) : (8'hba)) : {(8'haa)})) ~^ ((((8'hb2) ? (8'hbd) : (8'hbe)) ? {(8'ha3)} : (^(7'h41))) ? ((8'hb5) <<< (^(8'ha3))) : ({(8'ha7), (8'ha6)} ? ((8'ha8) ? (8'hb7) : (8'hb8)) : {(8'ha8), (8'hae)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire27,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire4,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (($signed(wire2[(2'h2):(1'h0)]) >> (wire1 ?
                         ($signed((7'h42)) >> (&wire2)) : {{wire0, wire2}})) ?
                     wire3 : wire0[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ((8'ha4))
        begin
          reg5 <= ($unsigned(wire1[(3'h4):(2'h2)]) ?
              wire1 : (+wire3[(2'h2):(2'h2)]));
        end
      else
        begin
          if (wire1[(3'h4):(2'h2)])
            begin
              reg5 <= (&(&($unsigned($signed(wire3)) ~^ $unsigned(reg5))));
            end
          else
            begin
              reg5 <= {((&$unsigned($unsigned(wire1))) != (-(|wire2))),
                  $signed(wire1[(2'h3):(2'h2)])};
              reg6 <= wire0[(3'h6):(3'h6)];
              reg7 <= wire0[(3'h6):(3'h5)];
              reg8 <= $unsigned({{(&$signed(wire2))},
                  {{$unsigned((8'hb3))}, reg5}});
            end
          reg9 <= (((8'ha3) ?
              $signed($unsigned((|reg8))) : wire4[(4'hc):(4'ha)]) >= (reg6 ?
              (reg6 | $unsigned((reg6 ? reg5 : wire3))) : reg6));
        end
      reg10 <= {({$unsigned(wire1[(3'h4):(3'h4)]),
                  ((wire1 << reg6) ? wire2[(4'he):(1'h0)] : (^~reg7))} ?
              reg8[(4'hc):(4'ha)] : wire1[(2'h3):(2'h2)]),
          {wire1, (|$unsigned(wire3))}};
      reg11 <= {reg5};
      reg12 <= wire3;
    end
  assign wire13 = wire0[(3'h5):(3'h4)];
  assign wire14 = reg10[(4'hb):(2'h2)];
  assign wire15 = $unsigned(((+(+wire13[(3'h7):(2'h3)])) ?
                      (&(wire3[(4'h8):(1'h1)] ?
                          reg9[(4'he):(2'h3)] : (wire0 > wire14))) : reg12));
  assign wire16 = $unsigned(reg5[(4'h8):(3'h7)]);
  assign wire17 = (~&({((&reg6) ?
                          reg5 : (-reg8))} ^~ (($signed(reg11) >>> wire13[(1'h1):(1'h1)]) ?
                      wire0 : wire1[(3'h4):(2'h3)])));
  assign wire18 = {reg11[(1'h1):(1'h0)],
                      $signed((($signed(reg8) ^ reg9[(4'h9):(3'h7)]) >> $unsigned((reg12 ?
                          reg10 : reg12))))};
  always
    @(posedge clk) begin
      reg19 <= $signed((($unsigned((wire15 && wire17)) ?
              (~|(reg5 ~^ wire17)) : $unsigned($signed(wire0))) ?
          (8'hb9) : ($unsigned($unsigned((8'hac))) ?
              (~&$unsigned(reg7)) : $unsigned({wire1}))));
      reg20 <= (((reg9 ?
              $unsigned($unsigned(wire3)) : ($signed((8'h9c)) ?
                  $unsigned(reg8) : $unsigned(wire16))) + $signed($unsigned((reg10 ?
              reg8 : wire4)))) ?
          reg11[(5'h13):(5'h10)] : ({(^$unsigned(wire16)),
                  wire17[(3'h5):(3'h5)]} ?
              wire18[(4'hc):(3'h5)] : (reg19[(4'hf):(4'hb)] || $unsigned(reg10))));
      reg21 <= wire4;
      if (((({(wire2 ? reg10 : wire4)} < (((8'hb9) && wire0) ?
              reg20 : reg8[(4'hb):(3'h5)])) ?
          $unsigned($unsigned((reg9 >>> reg7))) : (~|$signed((&(8'hac))))) << reg7[(4'ha):(4'ha)]))
        begin
          reg22 <= reg21;
        end
      else
        begin
          reg22 <= {$signed(($signed((~|reg5)) >>> {reg21[(1'h1):(1'h1)]}))};
          reg23 <= reg12[(4'ha):(4'ha)];
          reg24 <= ($unsigned((^reg19[(5'h10):(4'he)])) ?
              (+$signed(wire14)) : (-({(+reg20)} <<< $signed($signed(wire16)))));
          reg25 <= (~|($unsigned(((wire4 ~^ wire1) ?
              (wire13 ?
                  reg12 : wire4) : $unsigned(wire17))) ~^ $signed($unsigned({(8'h9f),
              wire4}))));
          reg26 <= (reg21[(1'h0):(1'h0)] != $signed($signed((|(wire1 ^~ wire4)))));
        end
    end
  assign wire27 = wire3[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg28 <= wire14[(3'h7):(2'h2)];
      reg29 <= (~|$unsigned(wire15[(1'h0):(1'h0)]));
    end
  assign wire30 = (!(($signed((wire0 ? wire4 : wire27)) ?
                      ($unsigned(reg6) ?
                          $unsigned(reg10) : $signed(wire17)) : $unsigned(reg7[(1'h1):(1'h1)])) > wire4[(2'h2):(1'h0)]));
  assign wire31 = reg9[(4'ha):(1'h0)];
endmodule
