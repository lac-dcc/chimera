module top
#(parameter param29 = (&({(~^{(8'ha2)}), ((&(8'hbb)) ? ((8'hbd) == (8'ha1)) : (&(8'h9e)))} ? ((&{(8'hb1)}) || (8'ha9)) : ({(~(8'hb2))} - ((+(8'ha6)) ? {(8'ha3)} : {(8'hac), (8'had)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(($signed($signed((wire2 ?
          wire2 : wire3))) >> ($signed((^wire4)) ?
          $signed((wire1 & (8'hb4))) : ((7'h40) == (wire3 ?
              (8'haa) : wire1)))));
      reg6 <= wire3;
      reg7 <= (8'hb4);
      reg8 <= (((+$signed(wire1[(3'h5):(1'h0)])) ?
              wire0[(2'h3):(2'h2)] : $signed($signed($signed(wire2)))) ?
          $signed($unsigned($signed((reg7 ?
              reg7 : reg7)))) : reg5[(4'he):(4'hd)]);
      reg9 <= $signed($unsigned((reg5 + wire2[(1'h0):(1'h0)])));
    end
  assign wire10 = reg8;
  assign wire11 = $signed(wire10);
  assign wire12 = $unsigned(((((&(7'h44)) ?
                              (wire2 >>> reg8) : $signed(wire11)) ?
                          {$signed(reg9)} : $unsigned($signed(reg6))) ?
                      wire4 : ($unsigned(wire11[(1'h1):(1'h1)]) ?
                          wire3[(3'h5):(3'h5)] : (~|reg9[(4'hf):(1'h0)]))));
  assign wire13 = ((|$unsigned(wire0)) <= {($signed(wire2[(3'h4):(1'h1)]) ?
                          wire10[(1'h0):(1'h0)] : wire2[(4'ha):(3'h7)])});
  assign wire14 = reg7[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if ((~^$signed(reg9[(4'hb):(3'h5)])))
        begin
          if ((($unsigned(reg9) | ((^(reg7 && wire10)) ?
                  wire13[(3'h4):(2'h3)] : ($signed(wire11) ^ wire14))) ?
              {$signed((~|$signed(wire11))), reg5[(5'h14):(4'ha)]} : reg6))
            begin
              reg15 <= (^(reg5 || $signed((((8'h9d) ?
                  wire11 : reg8) == (reg9 > reg5)))));
              reg16 <= (^~($signed({$signed(wire11)}) ^ $unsigned($unsigned((reg7 ?
                  wire13 : wire10)))));
              reg17 <= {reg16,
                  ((~^wire3[(3'h5):(1'h0)]) ?
                      wire4 : $signed($signed($unsigned(reg6))))};
              reg18 <= $signed((8'ha4));
            end
          else
            begin
              reg15 <= $signed({$signed($signed((^~reg6))),
                  (+(wire3[(2'h3):(1'h1)] | $signed(wire11)))});
              reg16 <= (((($unsigned(reg18) <<< wire1[(1'h1):(1'h0)]) != ($unsigned((8'hb9)) ?
                          (reg18 ? (8'hb4) : (8'hbc)) : (~reg17))) ?
                      ($signed((wire14 ?
                          (8'hab) : wire14)) >>> $unsigned($signed(wire12))) : reg5[(1'h1):(1'h1)]) ?
                  (7'h44) : ($unsigned($signed((-reg8))) != (($signed(wire13) >= $signed(reg18)) ?
                      ($signed(reg16) ?
                          ((8'haf) ? reg17 : wire12) : reg15) : ((reg8 ?
                          reg7 : wire3) || reg18[(3'h4):(2'h2)]))));
              reg17 <= reg5;
              reg18 <= $unsigned($signed((~^$unsigned($signed(wire3)))));
              reg19 <= $signed((^(~{{reg7}})));
            end
          if ($signed((wire10[(3'h7):(2'h3)] >= reg6[(3'h4):(2'h2)])))
            begin
              reg20 <= ($signed(wire2[(1'h1):(1'h1)]) ?
                  ((&($signed((8'ha1)) ? {reg15} : {wire12})) ?
                      (wire12 ?
                          $signed(((8'had) != (8'hae))) : $unsigned($signed(wire11))) : (|$unsigned($signed(wire12)))) : wire0[(1'h1):(1'h1)]);
            end
          else
            begin
              reg20 <= ($unsigned((!$signed($signed((8'hb8))))) ?
                  (&($unsigned(reg16) - (((8'hbf) ^~ wire1) ?
                      (~^(8'ha2)) : (^~reg5)))) : ((($signed(reg7) * $unsigned(wire4)) || $unsigned($unsigned(reg5))) * $signed((|$unsigned(reg5)))));
              reg21 <= reg16[(3'h5):(1'h0)];
              reg22 <= reg20[(4'hf):(2'h3)];
            end
        end
      else
        begin
          if (((^~wire14[(3'h7):(2'h3)]) ?
              wire4[(1'h1):(1'h1)] : (-$unsigned((&(wire4 > wire2))))))
            begin
              reg15 <= $signed(reg21[(4'hc):(3'h4)]);
              reg16 <= ({($unsigned(((8'haf) >> wire2)) ?
                      reg8[(5'h14):(2'h2)] : ({reg19} ?
                          wire11[(1'h0):(1'h0)] : reg18)),
                  $unsigned(wire3[(3'h4):(2'h3)])} ~^ (~(($unsigned(wire10) == (reg8 ?
                  (8'hbc) : reg18)) + $unsigned(((7'h43) + wire2)))));
            end
          else
            begin
              reg15 <= reg21;
              reg16 <= (reg20 ?
                  (~|$signed(($signed(wire11) ?
                      {(8'hb2)} : reg18[(1'h0):(1'h0)]))) : ($signed({$unsigned(reg8)}) * $unsigned((wire2 <= (~^wire12)))));
              reg17 <= reg9[(1'h0):(1'h0)];
              reg18 <= (~{(({wire11, wire4} >>> (reg6 ?
                      wire14 : wire14)) * ((8'had) == $signed((8'had)))),
                  $unsigned(wire11[(3'h7):(2'h3)])});
            end
        end
      reg23 <= reg8;
      reg24 <= {(+$signed(reg22))};
      reg25 <= $unsigned((!((!(wire2 & reg8)) > $signed((~&reg6)))));
      reg26 <= $signed(wire2);
    end
  assign wire27 = ($unsigned($signed(wire12)) ?
                      ($signed(reg26) || $unsigned(((reg6 ?
                          reg21 : wire11) | $signed(wire10)))) : wire14);
  assign wire28 = (wire10 ?
                      $signed($unsigned(((wire14 ?
                          reg24 : wire10) & (~&reg19)))) : (~&((wire0 ?
                              (wire0 ? wire10 : reg15) : reg26) ?
                          ($signed(reg18) ? wire3 : $signed(reg16)) : {{wire11,
                                  reg19}})));
endmodule
