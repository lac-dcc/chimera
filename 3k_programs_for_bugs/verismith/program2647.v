module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire4,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (^wire2);
  always
    @(posedge clk) begin
      reg5 <= $signed(((((8'h9e) ?
          wire3 : (wire1 <= wire0)) ^ (-(-wire3))) << $signed((wire0 ?
          {wire4, wire3} : {wire2, wire1}))));
      if (wire1[(5'h12):(5'h12)])
        begin
          reg6 <= wire3[(4'hd):(3'h7)];
          reg7 <= reg6;
          reg8 <= ($signed((^reg6)) < ({(wire3 ?
                  reg7[(3'h5):(2'h2)] : (reg6 ?
                      reg6 : reg5))} - ($unsigned($signed((8'hbf))) ?
              wire4 : ((reg7 << wire4) ^~ (wire4 ? reg6 : wire4)))));
          reg9 <= (reg6 | {wire3});
        end
      else
        begin
          reg6 <= wire2[(2'h2):(1'h1)];
          if (reg9)
            begin
              reg7 <= (wire1 ?
                  (&$unsigned($signed($unsigned(reg7)))) : (((^(8'ha0)) ?
                          {reg5, $signed(reg6)} : $unsigned($unsigned(wire4))) ?
                      (8'hac) : wire2));
              reg8 <= wire4;
              reg9 <= wire0[(4'h9):(4'h9)];
            end
          else
            begin
              reg7 <= $unsigned(reg8[(1'h0):(1'h0)]);
              reg8 <= $unsigned((reg5 ?
                  ((reg8 ?
                      wire4 : (wire4 ?
                          reg7 : wire0)) * $signed((wire4 != wire2))) : ((-(wire0 ?
                      (8'ha1) : wire1)) ^ ($unsigned(wire1) ?
                      (~^wire0) : (wire4 + wire2)))));
              reg9 <= (~&reg7);
            end
          if (wire0)
            begin
              reg10 <= $unsigned($signed(wire1));
            end
          else
            begin
              reg10 <= $unsigned($signed($signed(reg7)));
              reg11 <= (reg10[(4'hf):(4'h9)] ?
                  ($unsigned(reg5) > wire2[(1'h0):(1'h0)]) : (8'ha2));
            end
        end
      if ((7'h40))
        begin
          reg12 <= $unsigned({$signed((wire0[(2'h2):(1'h1)] >> (-wire0)))});
          reg13 <= (+$unsigned(wire1));
        end
      else
        begin
          reg12 <= $unsigned(wire0[(1'h1):(1'h0)]);
          reg13 <= (reg8[(3'h4):(1'h1)] <= (+$unsigned($unsigned((reg8 <<< wire3)))));
          if ((~$signed(wire4)))
            begin
              reg14 <= (reg5 ?
                  ($signed($signed((!wire3))) ?
                      $signed($signed(reg10[(2'h2):(1'h0)])) : reg10[(3'h6):(2'h2)]) : ({reg6} ?
                      (~({reg8} ?
                          $signed(reg10) : (reg11 ?
                              reg11 : (8'hbb)))) : $unsigned((wire3[(1'h0):(1'h0)] >= (wire1 ?
                          reg12 : wire1)))));
              reg15 <= reg6;
              reg16 <= ((7'h44) ?
                  ((8'h9c) & $unsigned($signed(reg5))) : {$signed((wire0[(2'h2):(1'h0)] ~^ (&(8'ha0)))),
                      (((wire1 && reg7) - wire0) ^ wire0[(3'h4):(3'h4)])});
              reg17 <= ((8'hba) ? $unsigned((!(8'hb5))) : reg12[(2'h2):(2'h2)]);
            end
          else
            begin
              reg14 <= reg14[(2'h3):(2'h3)];
            end
          if (reg13[(3'h6):(2'h3)])
            begin
              reg18 <= $unsigned({$signed($signed($unsigned(reg14))), (8'ha3)});
              reg19 <= (($signed($signed(reg18)) <<< ((^$signed(reg12)) >> $unsigned((+reg11)))) ?
                  {reg16[(1'h0):(1'h0)]} : {(8'hb5)});
              reg20 <= (^~reg9[(1'h0):(1'h0)]);
            end
          else
            begin
              reg18 <= (((($unsigned((7'h41)) >> $signed(reg9)) ?
                          $signed(reg10) : reg20[(4'ha):(4'h8)]) ?
                      reg15 : reg10[(5'h11):(4'h8)]) ?
                  $signed({(!((8'hb0) ? wire0 : reg6)),
                      (8'ha6)}) : (reg13[(3'h6):(3'h4)] ?
                      $signed(((reg15 >>> wire2) ?
                          (wire2 ? reg9 : reg18) : (reg13 ?
                              wire1 : reg6))) : $unsigned(((8'ha8) ?
                          reg16[(2'h2):(1'h1)] : (wire3 >= reg8)))));
              reg19 <= wire1[(5'h11):(3'h5)];
              reg20 <= wire3[(4'ha):(2'h2)];
              reg21 <= reg17[(2'h2):(1'h1)];
              reg22 <= (~^(~&(((~^reg20) || reg19) ? reg21 : (8'hba))));
            end
          reg23 <= $signed(wire2[(1'h0):(1'h0)]);
        end
      reg24 <= $signed((reg13 + {$signed(reg14[(1'h1):(1'h0)]),
          (reg16[(2'h2):(1'h0)] ? $unsigned(wire0) : $signed(reg5))}));
    end
  assign wire25 = {($signed(reg11) ?
                          reg22 : ($unsigned(((8'hb0) ?
                              reg20 : reg21)) || (~^$signed(reg17))))};
  assign wire26 = (wire4[(1'h1):(1'h1)] ?
                      {$unsigned($signed((wire0 == reg8))),
                          $signed($signed(wire3[(5'h12):(4'hf)]))} : $unsigned((~&reg16)));
  assign wire27 = $unsigned((~(((8'hb3) ~^ wire1[(2'h2):(1'h0)]) - (wire4 ^ (wire4 ?
                      reg9 : reg14)))));
  assign wire28 = ((reg5[(2'h3):(2'h3)] ?
                          $signed((~^(|reg6))) : $unsigned((!reg8[(4'he):(4'ha)]))) ?
                      $unsigned(((8'hbd) ?
                          ($signed(reg24) ?
                              (8'hbd) : {(8'ha0),
                                  wire2}) : $unsigned($signed(reg17)))) : (8'h9c));
endmodule
