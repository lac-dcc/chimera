module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg30,
                 reg29,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $unsigned(wire3[(4'ha):(4'h8)]);
  assign wire6 = (!wire5);
  assign wire7 = (8'hbb);
  assign wire8 = wire2;
  assign wire9 = wire3;
  always
    @(posedge clk) begin
      reg10 <= $signed({(wire8 || $unsigned(((8'haa) && wire2))),
          (((+wire4) ? $signed(wire6) : (wire9 ? wire6 : wire8)) < wire2)});
      if ((~((~&{(wire5 ? (8'ha4) : wire0)}) ?
          {$unsigned(wire3[(3'h7):(3'h4)]),
              $unsigned((8'hb3))} : (~|(wire2[(3'h6):(2'h2)] ?
              $signed(wire8) : wire8[(2'h2):(2'h2)])))))
        begin
          if ($signed($unsigned($unsigned(((wire6 > wire3) ?
              reg10[(2'h2):(1'h0)] : $unsigned(wire5))))))
            begin
              reg11 <= (wire1[(3'h7):(1'h0)] ?
                  (8'hb0) : $unsigned((-$unsigned(wire8))));
              reg12 <= (~|((&{$unsigned(wire8),
                  (wire3 ? wire4 : wire6)}) == (-$unsigned($unsigned(reg11)))));
            end
          else
            begin
              reg11 <= (+$signed($unsigned(((wire1 ?
                  wire9 : wire8) || ((8'hb4) ? (8'h9f) : wire5)))));
              reg12 <= (reg10 ?
                  $unsigned(($signed(wire6[(3'h4):(1'h1)]) >= reg10)) : $signed({{{reg10},
                          (wire7 ? reg12 : reg11)},
                      wire8[(2'h3):(2'h2)]}));
              reg13 <= $signed((($unsigned({(8'hbb)}) | (wire1[(4'hb):(3'h5)] ?
                  wire9 : wire6)) == (-$signed((wire1 | wire5)))));
              reg14 <= ((8'ha6) ?
                  ((~|($signed(wire4) << (wire0 ? wire7 : reg13))) ?
                      ($signed(reg13[(1'h0):(1'h0)]) == wire7[(2'h2):(1'h1)]) : $unsigned((~&(wire1 ?
                          reg13 : wire3)))) : wire8);
              reg15 <= reg10[(1'h0):(1'h0)];
            end
          reg16 <= ((wire0 + reg15[(4'h8):(1'h1)]) ^ $signed($signed((~&wire8))));
          reg17 <= {$unsigned(wire6)};
          if ((wire1 >>> (~(8'h9c))))
            begin
              reg18 <= (($signed($signed(wire8)) ?
                  {wire3[(4'he):(4'he)]} : {(|$unsigned(wire0)),
                      ((wire6 + wire3) ^ reg16)}) ~^ (&$unsigned(reg17)));
              reg19 <= $unsigned(wire8);
            end
          else
            begin
              reg18 <= reg12[(2'h2):(1'h1)];
              reg19 <= (reg15[(3'h4):(1'h1)] >> (~(wire0[(1'h1):(1'h1)] < $signed($signed(wire9)))));
              reg20 <= reg14[(3'h4):(1'h1)];
              reg21 <= $unsigned((8'had));
              reg22 <= ((~&(7'h44)) - wire8);
            end
          reg23 <= reg16;
        end
      else
        begin
          reg11 <= $signed(wire8);
          reg12 <= ($unsigned($unsigned($signed(reg18[(1'h1):(1'h0)]))) * reg14);
          if (reg13)
            begin
              reg13 <= ((($unsigned((~^wire6)) >> wire3) - reg20) + $unsigned(((reg19[(1'h0):(1'h0)] ?
                      $signed(wire3) : {reg19, (8'hbd)}) ?
                  $unsigned((wire8 ^~ reg17)) : reg12[(4'h9):(3'h7)])));
              reg14 <= (wire0 ?
                  reg14[(1'h1):(1'h0)] : $signed((wire2[(2'h3):(1'h0)] + $signed((reg17 + wire5)))));
              reg15 <= {(~|$unsigned($signed(wire8[(1'h0):(1'h0)])))};
              reg16 <= reg22[(1'h0):(1'h0)];
            end
          else
            begin
              reg13 <= $signed(({$unsigned({(8'ha5),
                      (7'h44)})} ^~ ($unsigned($unsigned(reg18)) ?
                  ((~|wire1) & (^~(7'h41))) : $signed($unsigned(reg15)))));
              reg14 <= $signed(($unsigned(($signed((8'hb7)) ?
                  (reg20 ? reg20 : reg16) : {reg18})) == wire7[(3'h5):(1'h0)]));
              reg15 <= $unsigned(($unsigned((^~reg20)) ?
                  $unsigned(wire5) : reg21));
              reg16 <= $signed({(reg19[(4'h9):(3'h7)] == (reg13[(1'h1):(1'h0)] ?
                      {(8'ha8)} : (reg18 ? wire8 : reg23))),
                  (((|reg22) ?
                      (~reg13) : $signed((8'had))) >>> $unsigned($unsigned(reg11)))});
              reg17 <= wire9;
            end
          reg18 <= $signed(reg21[(2'h3):(1'h0)]);
        end
      reg24 <= ($signed((~^(^~(wire2 ^~ wire0)))) ?
          (8'hba) : (($signed((reg10 ?
              wire7 : wire3)) == ($unsigned(reg15) != (~&reg11))) | reg12[(1'h1):(1'h1)]));
    end
  assign wire25 = ($unsigned((~|reg15)) ^ $signed($signed((reg13[(2'h2):(1'h1)] ?
                      {reg18, wire5} : $signed(wire8)))));
  assign wire26 = reg22;
  assign wire27 = $signed($signed(reg16[(2'h3):(2'h2)]));
  assign wire28 = {$unsigned($unsigned(((reg13 != wire27) && wire5[(2'h2):(1'h1)]))),
                      (^~(wire25 <<< reg12))};
  always
    @(posedge clk) begin
      reg29 <= $signed((wire1 ^~ $unsigned((~|wire26))));
      reg30 <= $signed((~|reg19[(3'h7):(1'h1)]));
    end
  assign wire31 = ((reg30 & {reg29,
                          ($unsigned(reg17) ~^ (wire27 ? reg15 : reg11))}) ?
                      $signed($unsigned($signed($signed((8'ha6))))) : reg22[(4'ha):(4'h8)]);
  assign wire32 = wire9;
  assign wire33 = (reg29 ?
                      reg18 : (&$unsigned($signed((wire8 ?
                          (8'hbd) : (7'h41))))));
  assign wire34 = $unsigned(wire26);
  assign wire35 = (((-{(&reg23)}) >> (|((^wire25) ^ $signed(reg22)))) >= (reg11 ?
                      (~&$unsigned((reg11 || reg20))) : (+reg21)));
  assign wire36 = (~&$unsigned((8'h9e)));
  assign wire37 = $signed({wire8});
endmodule
