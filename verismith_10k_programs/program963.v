module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
                 wire4,
                 reg23,
                 reg22,
                 reg21,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ($unsigned(wire2) & $unsigned(wire3));
  assign wire5 = $signed(wire2);
  assign wire6 = (($signed((wire1 ^ {wire0})) ?
                     $unsigned({(wire0 ?
                             wire4 : wire2)}) : ($unsigned($signed(wire4)) ?
                         ((wire1 ?
                             wire1 : (8'h9e)) ^ $unsigned((7'h42))) : $unsigned((-wire3)))) <= $signed(($signed((wire4 ~^ (8'ha8))) ^~ $signed($unsigned(wire0)))));
  always
    @(posedge clk) begin
      if ($signed(wire0[(1'h1):(1'h1)]))
        begin
          reg7 <= wire5;
        end
      else
        begin
          if ($signed((^~$signed((-reg7)))))
            begin
              reg7 <= (^~(reg7 ?
                  $unsigned(wire0[(2'h3):(1'h1)]) : $signed({((8'h9f) ?
                          (8'h9c) : wire0),
                      {(8'had), wire0}})));
              reg8 <= ((~^{$unsigned(wire5[(3'h4):(3'h4)])}) ?
                  ((8'ha8) ?
                      (wire5 ?
                          $signed($signed(wire5)) : wire1[(4'hc):(4'h9)]) : ((wire3[(4'hc):(2'h2)] <= ((8'haa) && wire2)) << wire3[(4'ha):(3'h4)])) : $unsigned(wire6));
            end
          else
            begin
              reg7 <= $signed((!$unsigned($signed($signed(wire6)))));
              reg8 <= wire6[(3'h7):(2'h3)];
              reg9 <= {(wire4[(2'h2):(1'h0)] ^ ((~(wire1 ?
                      wire2 : wire1)) && ((~|wire5) ? wire2 : $signed(reg8)))),
                  reg8};
            end
          reg10 <= $unsigned((wire5 ?
              reg9[(4'h8):(4'h8)] : (~wire1[(4'h8):(3'h5)])));
          reg11 <= (&((|$unsigned({wire3})) ?
              ($signed({wire3}) * (-$unsigned(reg9))) : $signed($signed((reg9 >>> wire3)))));
          reg12 <= $unsigned($unsigned((|reg10[(1'h1):(1'h0)])));
          if (({((8'h9e) && $unsigned((reg10 ? wire3 : wire4)))} ?
              ($unsigned((reg9[(1'h0):(1'h0)] == $unsigned(wire5))) || $unsigned(($unsigned(reg10) <= $unsigned(wire4)))) : wire0))
            begin
              reg13 <= ((((wire0 ? reg12 : $signed(wire2)) > $signed((wire2 ?
                          wire0 : reg9))) ?
                      (|reg7) : wire1) ?
                  ((|{(&reg9)}) > ({wire0} ?
                      wire2 : $unsigned((wire1 ?
                          wire4 : reg11)))) : ((-{(wire2 ^ wire3),
                      (7'h43)}) - (reg8 <= ({wire4} ^~ $unsigned(reg10)))));
              reg14 <= {$signed($signed(reg13[(2'h2):(1'h0)]))};
              reg15 <= (|$signed(wire3));
            end
          else
            begin
              reg13 <= $signed((^~(~|($unsigned(wire0) ?
                  $signed(wire5) : wire4[(1'h1):(1'h0)]))));
            end
        end
      reg16 <= $unsigned((8'hae));
    end
  assign wire17 = $signed((|(($unsigned(wire5) - (reg8 - wire5)) ?
                      $signed(reg8) : reg8[(2'h2):(1'h1)])));
  assign wire18 = $signed(reg10[(3'h4):(1'h1)]);
  assign wire19 = ($signed({$unsigned({wire17})}) <= {reg12[(3'h7):(1'h1)]});
  assign wire20 = $unsigned(((((reg9 ? reg14 : wire1) <<< $unsigned(wire4)) ?
                      {reg9[(1'h0):(1'h0)]} : reg11[(4'ha):(1'h0)]) != wire3));
  always
    @(posedge clk) begin
      reg21 <= ($unsigned({((8'h9d) ?
                  $unsigned(wire2) : (reg7 ? reg7 : (8'hba)))}) ?
          wire0[(4'he):(2'h3)] : $signed((reg13[(3'h5):(1'h0)] - reg13[(4'ha):(1'h1)])));
      reg22 <= $unsigned(reg12);
      reg23 <= (&$unsigned(reg13));
    end
  assign wire24 = $signed($signed($signed({((8'hb6) ^ reg15),
                      (reg10 ? reg8 : reg23)})));
  assign wire25 = wire3[(4'he):(1'h0)];
  assign wire26 = $unsigned(wire0);
  assign wire27 = (~reg14);
  assign wire28 = {(~|wire18[(3'h7):(3'h4)])};
endmodule
