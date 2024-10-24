module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (!wire0[(3'h5):(3'h5)]);
  assign wire5 = {wire2[(2'h2):(2'h2)],
                     $unsigned($unsigned((wire4 ~^ (wire1 ^ wire1))))};
  assign wire6 = $unsigned((wire4 ?
                     $unsigned($signed({wire1, wire2})) : (((~&wire0) ?
                         $unsigned((8'hbd)) : (wire4 ?
                             wire0 : wire4)) << $unsigned((wire2 ?
                         wire0 : wire1)))));
  assign wire7 = (wire4[(4'hd):(3'h7)] ? wire3 : $unsigned(wire0));
  always
    @(posedge clk) begin
      reg8 <= ((wire2[(3'h6):(3'h6)] ?
          (!((wire4 ^~ (8'hb2)) ?
              ((8'hb0) ? wire3 : wire1) : (wire0 != wire2))) : (wire2 ?
              {$signed(wire2), $unsigned(wire6)} : (~|(wire2 ?
                  wire7 : wire2)))) + (8'h9c));
      reg9 <= $signed((~&(8'hb0)));
      if ($signed((!wire5[(4'hb):(3'h6)])))
        begin
          if ((-((7'h42) ?
              {$unsigned(((7'h41) ? reg9 : wire7)),
                  (^reg8)} : (~|$signed((~^reg9))))))
            begin
              reg10 <= $unsigned(reg9);
              reg11 <= ((8'hba) >> $unsigned({{$signed(wire3)}}));
              reg12 <= (((((reg10 ? wire5 : wire7) ?
                      (reg8 ? (8'h9f) : wire1) : wire4) ?
                  $signed((reg8 ~^ reg11)) : ((wire2 < (8'hb3)) ?
                      wire5 : wire7)) * (7'h44)) ^ reg10[(1'h0):(1'h0)]);
              reg13 <= wire7;
              reg14 <= ($signed({(8'hb5)}) ?
                  (&$unsigned(reg9)) : wire0[(1'h0):(1'h0)]);
            end
          else
            begin
              reg10 <= ((~^wire3[(3'h7):(3'h5)]) ?
                  $unsigned(reg8) : (|(7'h40)));
              reg11 <= (reg12[(4'hb):(4'ha)] != {(($signed((7'h44)) - {wire3}) & {reg9}),
                  $unsigned($signed($signed((8'ha7))))});
              reg12 <= {($signed((8'hb3)) ?
                      (|($unsigned(reg8) == (~(8'hbc)))) : (((8'ha1) ?
                          $unsigned(wire7) : {reg13}) >>> {wire5[(3'h7):(1'h0)],
                          (~^reg13)}))};
            end
          reg15 <= ($signed({reg12, reg12}) < (+wire7));
        end
      else
        begin
          reg10 <= ($unsigned($unsigned((+wire1[(1'h0):(1'h0)]))) + ((($signed(reg15) ?
                      {wire5} : (reg9 < wire2)) ?
                  $unsigned((~(8'haa))) : ((wire1 >> wire5) * reg13[(3'h7):(1'h0)])) ?
              $signed(((wire5 ? wire0 : wire3) ?
                  $signed(reg12) : $signed(reg13))) : ((wire5 ?
                  $unsigned(wire3) : reg15) ^ ((wire6 ? wire0 : wire7) ?
                  reg12[(4'hc):(1'h1)] : ((8'haa) <<< reg13)))));
          if ($unsigned(wire3))
            begin
              reg11 <= (~&(reg14 | (~$signed(((8'haa) & (8'ha8))))));
              reg12 <= ($signed((~^wire1)) ^ {reg14[(4'h8):(3'h7)],
                  $signed(((+reg15) >> (-wire6)))});
            end
          else
            begin
              reg11 <= (^~$signed(reg15[(1'h1):(1'h1)]));
              reg12 <= $signed(reg13);
              reg13 <= $signed((^$unsigned($signed((^(8'haa))))));
              reg14 <= (wire7 ?
                  {wire1, (&{$signed(reg11), reg15})} : $unsigned(reg12));
              reg15 <= $unsigned((wire2 ? reg15 : (^~reg10)));
            end
          if ($unsigned(reg12[(4'hb):(4'h8)]))
            begin
              reg16 <= $unsigned($unsigned($unsigned($signed(reg12[(1'h0):(1'h0)]))));
              reg17 <= $signed((($signed((wire7 ? reg11 : reg11)) ?
                  (~wire1[(4'h9):(3'h5)]) : wire3) >= reg14[(3'h5):(3'h5)]));
            end
          else
            begin
              reg16 <= ($unsigned((|reg9[(2'h3):(2'h3)])) || $unsigned((^(-{(7'h41),
                  wire4}))));
              reg17 <= $signed((reg14 < ((reg13[(2'h2):(2'h2)] ?
                  wire6[(2'h2):(2'h2)] : wire0) == ((^~(8'ha6)) ~^ wire0))));
              reg18 <= wire2[(4'ha):(3'h5)];
            end
          if (reg8[(1'h1):(1'h0)])
            begin
              reg19 <= (^reg15[(1'h1):(1'h1)]);
              reg20 <= $unsigned(reg10);
              reg21 <= (wire0[(2'h3):(1'h0)] ?
                  ($signed(reg14[(4'ha):(1'h1)]) & reg11[(4'h9):(3'h7)]) : ((^~$signed((reg13 ?
                          reg9 : reg10))) ?
                      reg13[(1'h1):(1'h1)] : ((^(reg19 < wire1)) * (&reg15[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg19 <= reg21;
              reg20 <= reg21[(2'h2):(2'h2)];
            end
          reg22 <= wire4;
        end
      reg23 <= $signed(reg11[(1'h1):(1'h1)]);
    end
endmodule
