module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
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
  assign wire4 = ((+$signed(((wire2 + wire3) ?
                     (wire3 ?
                         (8'ha7) : wire0) : wire2[(2'h2):(1'h0)]))) >> wire0[(2'h2):(1'h1)]);
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = {(~|wire5)};
  always
    @(posedge clk) begin
      if ($signed((~|(8'h9e))))
        begin
          if (wire6[(4'hd):(4'h9)])
            begin
              reg7 <= (~&((((wire6 >>> wire4) ?
                      $unsigned((8'hb0)) : {(8'hb7)}) ?
                  wire3[(3'h7):(3'h7)] : ((wire2 > wire1) ~^ {(8'hbe),
                      wire4})) * ((8'ha4) <<< wire6[(4'hf):(4'hd)])));
              reg8 <= (reg7[(2'h3):(1'h0)] < {(8'hb3)});
            end
          else
            begin
              reg7 <= $signed(wire6);
              reg8 <= $unsigned($signed({$unsigned(reg7[(3'h6):(3'h5)])}));
            end
          reg9 <= ($unsigned(wire3[(3'h7):(1'h0)]) | {$unsigned($unsigned((8'h9c))),
              (reg8 ?
                  ($signed(wire2) >= $unsigned(reg7)) : reg8[(3'h6):(3'h6)])});
          reg10 <= (($unsigned((wire5[(3'h6):(1'h0)] & wire5[(3'h7):(3'h4)])) < (|$signed(wire4))) ?
              $signed($signed((-$signed(wire5)))) : $unsigned((((7'h41) >> (wire2 ?
                      reg7 : wire5)) ?
                  (&reg9) : (~$signed(reg9)))));
          if ({{$signed(wire4)}})
            begin
              reg11 <= (+(wire0 ?
                  $signed($unsigned(wire6)) : {$unsigned($signed(wire5)),
                      (~|(~wire1))}));
              reg12 <= ((8'ha6) ^ ({((~&reg10) && ((8'hae) >= wire1)),
                  $signed($signed(wire0))} + (reg9[(3'h6):(3'h5)] - (|(~&wire2)))));
              reg13 <= reg8[(1'h0):(1'h0)];
              reg14 <= $unsigned(reg11[(3'h7):(1'h1)]);
              reg15 <= wire1;
            end
          else
            begin
              reg11 <= ({wire6} || ((8'hba) ?
                  (-$unsigned((reg14 <= wire5))) : ($signed($unsigned(reg7)) == wire4[(1'h1):(1'h0)])));
            end
        end
      else
        begin
          if ($unsigned($unsigned(wire0[(1'h0):(1'h0)])))
            begin
              reg7 <= wire4;
              reg8 <= (reg15[(2'h2):(1'h1)] + ((-$signed((-wire0))) == {($signed((8'hb5)) & (wire4 > wire5))}));
              reg9 <= (reg7 <= (^~(wire4[(2'h2):(2'h2)] - {(8'had)})));
              reg10 <= ($signed(((reg11[(1'h0):(1'h0)] >> reg7) ?
                  $unsigned($unsigned(reg9)) : {(-reg7),
                      ((8'hb6) ?
                          reg15 : wire2)})) < $signed($unsigned(((|wire5) & (!wire5)))));
              reg11 <= $signed(reg8);
            end
          else
            begin
              reg7 <= $signed((wire4[(2'h3):(2'h2)] >= $signed(($unsigned(wire1) ?
                  (^reg14) : reg13[(2'h2):(2'h2)]))));
              reg8 <= ((~reg8) != reg7[(3'h4):(1'h0)]);
              reg9 <= (!(~&(~|(!$signed(reg13)))));
              reg10 <= $unsigned((wire5 < ((reg8[(1'h1):(1'h1)] >>> reg12[(3'h6):(1'h0)]) ~^ {(reg9 + reg9)})));
            end
        end
      reg16 <= (((&(+wire4)) > wire6[(1'h0):(1'h0)]) * (^(reg13[(5'h11):(3'h5)] ?
          wire1[(5'h10):(3'h4)] : $signed($unsigned(reg15)))));
      reg17 <= ((^(wire6[(4'hf):(4'ha)] | ((8'haf) * wire4))) ^~ (7'h42));
    end
endmodule
