module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $signed((&(~$signed($unsigned((8'hb5))))));
  assign wire6 = (^wire5);
  always
    @(posedge clk) begin
      reg7 <= (wire2[(1'h0):(1'h0)] ?
          $signed({$signed($signed((8'hb5))),
              wire5}) : $signed(($unsigned((wire4 ?
              wire3 : wire5)) != $unsigned((wire6 <= wire3)))));
      reg8 <= ((({reg7[(2'h2):(1'h1)], wire1} ?
              wire4 : (!(wire6 != reg7))) >> (+{reg7[(1'h0):(1'h0)],
              (wire0 ? wire0 : wire5)})) ?
          $unsigned(((+{wire3, reg7}) ^~ wire2)) : ((~&(8'hb8)) == wire6));
      reg9 <= $unsigned(reg7[(2'h2):(2'h2)]);
      reg10 <= wire1;
    end
  assign wire11 = ($unsigned(reg7) ?
                      $signed((reg8[(4'ha):(3'h6)] ^~ $signed({wire6}))) : reg9);
  assign wire12 = wire4;
  assign wire13 = (~^(wire2 ?
                      (wire1 ?
                          reg10 : ($unsigned(wire3) ?
                              ((7'h42) ~^ reg7) : wire6)) : $unsigned($unsigned(wire6))));
  assign wire14 = $signed($signed(({wire2} != (((8'hb2) || wire12) ?
                      (|wire13) : (!wire6)))));
  assign wire15 = (wire6[(4'ha):(1'h1)] & $signed($unsigned(reg9)));
  always
    @(posedge clk) begin
      if ({wire12[(4'h9):(3'h5)]})
        begin
          reg16 <= {$signed($unsigned(((wire12 ? wire5 : wire12) ?
                  (reg8 - reg9) : wire6[(2'h3):(2'h2)]))),
              wire12};
          if ($signed({{$unsigned($signed((7'h42))), wire13[(3'h5):(1'h1)]}}))
            begin
              reg17 <= $unsigned(wire5[(1'h0):(1'h0)]);
            end
          else
            begin
              reg17 <= $unsigned(reg17[(2'h2):(2'h2)]);
              reg18 <= reg10[(3'h5):(1'h1)];
              reg19 <= $signed(((-$unsigned((wire11 >>> wire3))) || $unsigned((wire6[(4'h8):(2'h3)] ?
                  $signed(wire14) : (reg7 ? reg9 : reg16)))));
            end
        end
      else
        begin
          reg16 <= (!(&(($unsigned(wire5) ?
                  reg16 : ((8'ha4) ? wire14 : (8'hbd))) ?
              ({reg16, (8'hab)} <<< {reg17, wire15}) : $signed(wire1))));
          reg17 <= ((wire3[(3'h5):(2'h2)] != $unsigned(wire14)) - reg17);
          reg18 <= $unsigned($signed(($signed(wire12) >= {wire11[(4'ha):(3'h5)],
              (wire6 <= (8'hb0))})));
        end
    end
  assign wire20 = ((~reg7[(1'h1):(1'h0)]) >> (+wire0));
  assign wire21 = (|reg9);
  assign wire22 = $unsigned($signed((8'hb2)));
  assign wire23 = wire13[(4'h9):(3'h5)];
  assign wire24 = $signed((~&$unsigned(reg9)));
  assign wire25 = (((8'hbd) ?
                          $unsigned($signed(wire22[(2'h2):(1'h0)])) : {$signed((wire6 ?
                                  wire6 : (8'hb0)))}) ?
                      $signed($signed((((8'hb1) > reg19) < (wire0 ?
                          wire14 : reg17)))) : $signed(wire14[(4'hc):(1'h0)]));
  assign wire26 = ($unsigned((({wire14, reg19} > wire22) ?
                      $signed((~&wire5)) : wire3[(3'h6):(1'h1)])) >= reg9[(1'h1):(1'h0)]);
  assign wire27 = (~|wire23);
  assign wire28 = ($unsigned(reg7[(2'h2):(2'h2)]) ?
                      reg10[(1'h1):(1'h1)] : wire15);
endmodule
