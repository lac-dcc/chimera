module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire6,
                 wire5,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = $unsigned((^~(((-wire5) - $unsigned((8'h9f))) ?
                     wire2[(3'h7):(3'h6)] : wire0)));
  always
    @(posedge clk) begin
      if (($unsigned((!(|wire0[(1'h1):(1'h1)]))) + {$unsigned((~^{wire0})),
          (~&((wire0 ? wire0 : wire6) <= wire3[(3'h6):(3'h5)]))}))
        begin
          if ((~|{(wire1 ? wire2 : (~$unsigned(wire3))),
              (-$unsigned({wire3, wire6}))}))
            begin
              reg7 <= (~&($signed({(wire3 ?
                      wire3 : wire6)}) ^ (((wire4 != wire2) ?
                      (wire0 ? (8'hb6) : wire3) : (wire4 ^~ wire0)) ?
                  wire3[(4'h8):(4'h8)] : (^wire0[(1'h1):(1'h0)]))));
              reg8 <= {wire3,
                  ($unsigned({{reg7}}) ?
                      wire3[(3'h4):(2'h3)] : wire1[(1'h0):(1'h0)])};
              reg9 <= $signed(((~&{(~&wire4)}) && (reg8 ?
                  wire0[(3'h4):(3'h4)] : wire5[(4'ha):(2'h3)])));
              reg10 <= {(~^$signed({reg9[(1'h1):(1'h1)], (|reg8)})), reg9};
            end
          else
            begin
              reg7 <= reg8[(4'h8):(3'h7)];
              reg8 <= ($unsigned(wire3[(4'h9):(2'h2)]) ?
                  $signed($unsigned(($unsigned(wire4) << (wire4 ?
                      wire2 : reg7)))) : $signed($unsigned(wire4[(2'h2):(1'h1)])));
              reg9 <= $signed($unsigned(wire1[(4'h8):(3'h5)]));
            end
          reg11 <= (~wire0[(1'h0):(1'h0)]);
          reg12 <= (reg10 * ((!{(wire3 ? wire2 : wire2),
              (wire2 >> wire3)}) > wire5[(2'h2):(1'h0)]));
          reg13 <= ((~&$unsigned(reg10)) ?
              (8'haf) : {$signed(((reg11 ? wire6 : wire5) ?
                      ((8'haf) <= reg8) : wire3)),
                  $unsigned((+((8'hbb) * (8'h9c))))});
        end
      else
        begin
          reg7 <= $unsigned({(8'hb3)});
          reg8 <= (8'had);
          reg9 <= (($signed((reg9[(3'h7):(3'h4)] ? (|reg8) : wire5)) ?
                  $signed((~&reg8)) : reg9) ?
              wire5 : reg11[(3'h7):(1'h0)]);
        end
      reg14 <= {((wire1[(3'h6):(3'h4)] && wire6) ?
              (~((7'h42) ?
                  $unsigned(reg11) : reg9)) : $signed((^~reg9[(1'h1):(1'h1)])))};
      if ($signed((reg10[(2'h3):(1'h0)] & ((&(wire3 && wire1)) ?
          (8'hb6) : $signed((|wire2))))))
        begin
          reg15 <= reg11[(3'h5):(2'h2)];
          reg16 <= {$signed(($unsigned(reg8) ?
                  wire6[(4'h9):(4'h9)] : ((reg15 ?
                      (8'hb9) : reg15) & (reg13 ^ (8'hbb)))))};
          reg17 <= wire3[(1'h0):(1'h0)];
        end
      else
        begin
          if ($signed(($signed($unsigned({reg9,
              (8'hac)})) ^ $unsigned(({reg10} >>> (!wire4))))))
            begin
              reg15 <= ({reg8} ?
                  reg10 : (($unsigned(reg13[(4'h8):(1'h0)]) ?
                      ($unsigned(wire1) ?
                          wire2[(2'h2):(1'h1)] : (8'hbd)) : ((|wire2) ?
                          (~|wire2) : {wire6})) & reg14));
              reg16 <= (($unsigned((|(reg10 || wire0))) == reg15) ?
                  reg15 : (wire2[(1'h0):(1'h0)] ?
                      $unsigned($signed(reg15)) : reg8[(4'h8):(1'h0)]));
            end
          else
            begin
              reg15 <= $unsigned($signed($unsigned($signed({wire6}))));
              reg16 <= $unsigned($signed($unsigned(wire2[(4'ha):(2'h3)])));
            end
          reg17 <= $signed(reg15);
          reg18 <= {$unsigned(((((8'hb7) ? wire6 : reg13) == (wire4 ?
                  reg9 : reg8)) + reg7)),
              $signed((+reg9))};
          reg19 <= {reg12, wire3};
          reg20 <= {reg19[(4'hc):(2'h3)], wire1};
        end
      reg21 <= (($unsigned(wire4) ?
          reg18 : ($signed((8'ha7)) ?
              $unsigned($signed(wire2)) : $unsigned($signed(reg10)))) != $signed(wire2[(3'h4):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg22 <= ((reg15 << (reg7[(5'h13):(2'h2)] ?
          ($unsigned(reg13) <<< reg17[(2'h2):(1'h0)]) : $signed(wire2))) ^~ $signed((reg10 || reg17[(2'h2):(1'h0)])));
    end
  assign wire23 = (~^(&((((8'hae) << reg16) + {reg11,
                      (8'hbc)}) || wire6[(5'h13):(3'h4)])));
  assign wire24 = (~((+$signed((^~reg17))) + ((-(reg14 & wire3)) ^ (~|{(8'ha7)}))));
  assign wire25 = $signed((~reg22));
endmodule
