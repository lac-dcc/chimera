module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = {({wire1[(2'h3):(1'h1)],
                         {{(8'ha4)}, {(7'h44)}}} ^~ $signed((8'ha4))),
                     $unsigned(wire3)};
  assign wire5 = wire0[(3'h7):(3'h7)];
  assign wire6 = (~|wire5[(5'h13):(1'h1)]);
  assign wire7 = wire0[(3'h6):(3'h5)];
  assign wire8 = ($unsigned($signed($signed((wire5 ?
                     wire0 : wire0)))) || (8'ha9));
  assign wire9 = ($unsigned($unsigned((+((8'hb8) == wire1)))) ?
                     {wire5[(3'h4):(1'h0)]} : $unsigned($unsigned((wire5[(2'h2):(1'h0)] ?
                         $signed(wire2) : {wire2, wire0}))));
  assign wire10 = $signed(wire3);
  assign wire11 = ((|{$unsigned($signed(wire5))}) ?
                      wire7[(2'h3):(2'h3)] : $signed(wire3));
  always
    @(posedge clk) begin
      reg12 <= ($unsigned((8'hb3)) & (wire7 ^~ $signed($signed($signed(wire3)))));
      reg13 <= wire8[(1'h0):(1'h0)];
      if (wire1[(2'h2):(2'h2)])
        begin
          if (wire4)
            begin
              reg14 <= reg12[(3'h6):(2'h2)];
              reg15 <= $signed(((+wire5) + $unsigned($unsigned((wire11 ?
                  wire2 : wire5)))));
            end
          else
            begin
              reg14 <= $unsigned(wire0);
              reg15 <= (reg15 ?
                  $unsigned($unsigned({wire9[(2'h3):(1'h1)],
                      (wire5 ? wire11 : wire6)})) : (8'hbf));
              reg16 <= (^~wire5[(2'h3):(1'h0)]);
              reg17 <= wire11[(3'h7):(1'h0)];
              reg18 <= reg17[(3'h7):(2'h2)];
            end
          reg19 <= wire0[(2'h2):(1'h0)];
        end
      else
        begin
          reg14 <= $signed((((wire11 << $unsigned(wire2)) - wire9) ?
              $unsigned(((reg19 - wire11) << (wire9 ^ (8'ha0)))) : {$unsigned(wire10),
                  $signed((reg17 >>> reg18))}));
          reg15 <= (+$unsigned(wire6));
          reg16 <= $signed(((reg14 & ($signed((7'h44)) - $signed(wire10))) | $unsigned(wire9)));
        end
      reg20 <= (wire6[(2'h3):(1'h1)] >>> ($unsigned({wire10[(1'h1):(1'h0)],
          (reg19 ? reg17 : wire0)}) + ($unsigned(((8'hba) == wire1)) ?
          reg12 : ((wire8 < reg15) ? $unsigned(wire2) : wire1))));
    end
  always
    @(posedge clk) begin
      reg21 <= $signed((^~$unsigned((reg12 ^ wire5[(4'he):(4'h8)]))));
    end
  always
    @(posedge clk) begin
      reg22 <= (~^$signed(((-$unsigned(reg16)) ?
          ($signed(wire3) ? $signed(wire2) : (wire4 ? reg14 : wire6)) : ({wire1,
              wire6} || wire1))));
    end
  assign wire23 = {(!reg22)};
  assign wire24 = (8'ha9);
  assign wire25 = reg15[(4'h9):(3'h6)];
  assign wire26 = reg13;
  assign wire27 = (!$unsigned({$unsigned($signed((8'h9e)))}));
  assign wire28 = (($signed($unsigned($signed(reg13))) ?
                      reg15[(3'h4):(2'h2)] : $signed(reg16[(4'ha):(3'h6)])) < ($signed({$signed(wire7),
                          (reg21 ~^ reg19)}) ?
                      $unsigned((reg13[(3'h6):(2'h2)] ?
                          (reg16 ? reg15 : reg14) : (wire4 ?
                              reg14 : reg12))) : reg15));
  assign wire29 = $signed((^$signed((~(wire28 ? wire25 : wire23)))));
  assign wire30 = reg14;
  assign wire31 = (~&$unsigned((($unsigned(wire11) ?
                      (8'h9f) : (8'hbf)) && (!reg14))));
endmodule
