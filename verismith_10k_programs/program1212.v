module top
#(parameter param35 = (|(((((8'haf) ? (8'ha0) : (8'ha5)) ? (~|(8'had)) : {(8'h9d), (8'ha3)}) ? (((8'haf) ? (8'hb8) : (8'h9c)) >= ((8'had) ? (8'hb7) : (7'h41))) : ({(8'hb0)} | (~&(7'h42)))) ? (8'ha0) : (~&(&(7'h42))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire15,
                 wire14,
                 wire13,
                 reg34,
                 reg33,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire1 <= wire4);
      if (wire4)
        begin
          reg6 <= ({wire1,
                  ($signed(wire3[(2'h2):(1'h0)]) * $signed((wire4 >> wire1)))} ?
              $unsigned(wire2[(3'h4):(3'h4)]) : wire0[(4'ha):(4'h9)]);
          reg7 <= $unsigned($signed((-($unsigned(reg6) ?
              $unsigned(reg6) : (reg5 ? wire4 : wire0)))));
        end
      else
        begin
          reg6 <= $unsigned(wire3);
          if ((wire4 < (reg6 ?
              wire4[(4'h8):(2'h2)] : ((~&$signed(reg5)) - $signed(((8'hb8) ?
                  reg6 : wire2))))))
            begin
              reg7 <= (|$signed(wire4));
              reg8 <= (~^$signed($signed((~^(reg6 ? reg7 : wire2)))));
              reg9 <= (!$signed((+reg8)));
              reg10 <= ({$unsigned((+wire0[(3'h5):(1'h1)])),
                  (~reg6)} ^ $signed(($unsigned((wire1 ? wire3 : wire2)) ?
                  ({wire0, wire4} && $signed(wire0)) : reg9[(4'h9):(4'h8)])));
              reg11 <= $unsigned(reg8[(2'h2):(1'h1)]);
            end
          else
            begin
              reg7 <= $signed(reg5[(4'hb):(3'h6)]);
              reg8 <= $unsigned((~$signed((reg9 | wire4[(3'h4):(1'h0)]))));
              reg9 <= {$unsigned(wire3), $signed($signed($signed({reg10})))};
            end
          reg12 <= $unsigned(reg8);
        end
    end
  assign wire13 = reg8;
  assign wire14 = reg6;
  assign wire15 = $unsigned($unsigned(reg6[(4'h8):(2'h2)]));
  always
    @(posedge clk) begin
      reg16 <= wire13;
      if (wire4[(4'ha):(4'h8)])
        begin
          if ($unsigned($signed(reg5)))
            begin
              reg17 <= wire0;
              reg18 <= ({((~$unsigned(reg12)) ^ $signed((reg17 ?
                          (8'hba) : wire14))),
                      (+((wire1 ? (8'hbb) : wire13) == (-wire15)))} ?
                  (^~reg7) : $signed($signed((~^wire1))));
            end
          else
            begin
              reg17 <= wire4;
            end
          reg19 <= $signed($signed($unsigned((wire1[(4'hd):(4'hc)] - wire15))));
          reg20 <= $signed(reg11);
        end
      else
        begin
          if ($unsigned(reg10))
            begin
              reg17 <= $signed((8'ha4));
              reg18 <= reg8[(2'h3):(1'h0)];
              reg19 <= $unsigned({$unsigned((!(8'hac))),
                  (($signed(wire4) ? (~^wire3) : (&reg19)) ?
                      $signed($signed(reg9)) : reg10)});
              reg20 <= {((reg5[(2'h3):(2'h2)] ?
                      wire14[(4'hb):(4'ha)] : (reg10[(1'h1):(1'h1)] & wire4)) + (reg6[(1'h0):(1'h0)] ?
                      wire2[(3'h4):(1'h1)] : reg10)),
                  $unsigned(((~^reg8) ?
                      ($signed((8'ha1)) ?
                          (+wire13) : reg5[(1'h0):(1'h0)]) : (wire15 && {reg18})))};
            end
          else
            begin
              reg17 <= ($unsigned($unsigned(($unsigned(wire15) ~^ (~^wire0)))) ?
                  ({reg20[(5'h12):(4'hb)]} ?
                      $unsigned((+$signed(wire4))) : (($signed(reg9) ?
                              $signed(wire3) : wire4[(1'h0):(1'h0)]) ?
                          {{wire15, reg18}} : {(wire15 >= reg7),
                              (~reg20)})) : wire13[(1'h1):(1'h0)]);
            end
        end
    end
  assign wire21 = wire13;
  assign wire22 = reg16;
  assign wire23 = $signed((($signed((wire3 || reg17)) ^~ $signed($unsigned((8'hb9)))) ?
                      $unsigned(reg9) : reg7));
  assign wire24 = {$signed($unsigned($unsigned((~(8'ha5))))), reg9};
  assign wire25 = $signed($unsigned(reg7));
  assign wire26 = {reg7[(4'ha):(4'h9)], (^~reg12[(5'h10):(4'ha)])};
  assign wire27 = $signed((wire24[(4'hc):(4'hc)] ?
                      (wire1 && $unsigned(reg6)) : $unsigned(reg6)));
  assign wire28 = (^$unsigned(wire2));
  assign wire29 = (+$signed($signed({(reg9 + wire24), $unsigned(reg19)})));
  assign wire30 = $signed(wire26);
  assign wire31 = wire26;
  assign wire32 = wire28;
  always
    @(posedge clk) begin
      reg33 <= (|{(reg10 ?
              {(reg8 < wire4), (reg5 ? reg8 : reg18)} : $unsigned(((8'ha8) ?
                  (8'haf) : reg11)))});
      reg34 <= ((!wire28[(3'h5):(1'h1)]) ?
          (($signed($unsigned((8'hab))) ?
              (~$unsigned(reg16)) : reg6[(4'h8):(2'h2)]) >> (wire4[(2'h2):(2'h2)] <= $unsigned(wire21))) : (+$signed(reg11)));
    end
endmodule
