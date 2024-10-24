module top
#(parameter param34 = ((^~(8'ha0)) ~^ (((((8'ha6) <<< (8'h9f)) ? (!(8'hbe)) : ((8'h9f) + (8'hb0))) ? (((8'haf) & (8'ha3)) ? (8'h9e) : ((8'haa) ? (7'h40) : (8'hb1))) : ({(8'ha9)} ^~ (8'hb3))) ? (((8'haf) * {(8'hb6), (8'hbd)}) >> (((8'ha0) ? (8'h9e) : (7'h43)) ^ (~|(8'h9c)))) : (((^(7'h44)) >>> ((7'h41) ? (8'hbd) : (8'ha1))) - {(!(8'hab)), ((8'ha8) ? (8'ha2) : (8'hba))}))), 
parameter param35 = param34)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire6,
                 wire5,
                 reg27,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed(({$unsigned({wire1})} <= ((~&wire2[(2'h3):(2'h2)]) ?
                     wire3 : (+$signed(wire3)))));
  assign wire6 = $unsigned($unsigned((-(((8'had) != wire2) ?
                     (wire2 ? wire1 : wire5) : wire4))));
  always
    @(posedge clk) begin
      reg7 <= (($unsigned({(wire2 ? wire0 : wire4),
              $signed(wire5)}) ^ $signed(((~&wire6) ?
              $unsigned(wire1) : wire5[(2'h2):(1'h1)]))) ?
          wire2 : wire5);
    end
  always
    @(posedge clk) begin
      reg8 <= (wire0[(1'h1):(1'h0)] != (!(~|wire1)));
      reg9 <= $unsigned($signed(wire6));
      if (((~^wire1) ~^ wire0[(2'h2):(1'h1)]))
        begin
          reg10 <= wire0;
          reg11 <= ((^~reg10) ? reg7[(2'h2):(1'h0)] : reg7[(3'h6):(2'h3)]);
          if ((((~&(8'h9f)) << (wire1[(3'h4):(1'h0)] ?
              $signed((+wire1)) : (^~(wire6 ^~ wire2)))) & $unsigned((~|($signed(wire6) == wire3[(5'h12):(3'h5)])))))
            begin
              reg12 <= (&((&{(&reg10)}) || ((~&$unsigned(wire0)) ?
                  wire5[(3'h5):(1'h1)] : $unsigned($unsigned(wire0)))));
              reg13 <= ((reg12 ? (&wire6) : wire2) ?
                  $unsigned($signed($signed((~|wire6)))) : ({reg12} ?
                      ($unsigned($unsigned(reg12)) ?
                          $unsigned((8'hbf)) : $unsigned($signed((8'hb5)))) : reg12));
              reg14 <= (((&reg11[(1'h1):(1'h0)]) - (|$unsigned($signed(wire5)))) ?
                  reg13[(3'h7):(3'h7)] : (|(~&((reg7 ?
                      wire0 : wire3) << (reg8 | reg10)))));
              reg15 <= $signed(wire4);
              reg16 <= reg10;
            end
          else
            begin
              reg12 <= $signed($unsigned((wire4[(3'h6):(1'h1)] || $signed((|reg7)))));
            end
          if (wire2[(3'h5):(1'h0)])
            begin
              reg17 <= (((~|reg16) ^~ (~^wire2)) >= reg14);
            end
          else
            begin
              reg17 <= ($signed(wire6[(3'h7):(3'h4)]) <= ($signed((reg7[(4'h9):(2'h2)] ?
                  (wire3 + reg7) : (!wire6))) > ((~^(reg15 & reg12)) ?
                  (reg15[(4'hb):(1'h0)] ?
                      {reg17} : $unsigned(reg10)) : wire1[(5'h11):(1'h1)])));
              reg18 <= ($signed(reg10[(1'h0):(1'h0)]) ?
                  $unsigned(reg14[(5'h13):(4'hb)]) : wire3[(5'h11):(2'h3)]);
              reg19 <= (~(&reg18));
              reg20 <= (8'h9c);
            end
          reg21 <= wire0[(1'h0):(1'h0)];
        end
      else
        begin
          reg10 <= (reg19 ?
              (&$unsigned($signed((reg20 ?
                  wire0 : reg12)))) : $unsigned($unsigned($signed($signed((8'ha2))))));
          if ((^~$unsigned((reg15[(4'ha):(2'h2)] >>> $unsigned($signed(reg8))))))
            begin
              reg11 <= $signed((reg20[(2'h3):(2'h3)] == ((((8'hbd) ?
                      wire1 : (8'ha2)) ?
                  $unsigned((8'hbb)) : $unsigned(reg21)) ^ (~^$signed(reg16)))));
            end
          else
            begin
              reg11 <= $signed(reg18[(2'h2):(1'h0)]);
              reg12 <= reg8;
              reg13 <= wire0[(1'h0):(1'h0)];
              reg14 <= reg17[(2'h2):(1'h0)];
              reg15 <= $unsigned(reg9);
            end
        end
      if ($signed(($signed((wire4[(1'h1):(1'h0)] || (reg21 == wire5))) ?
          (reg11 <= reg17) : ($signed({wire6}) ?
              ((reg16 <<< wire2) ?
                  {reg13, wire2} : reg15) : $unsigned((~|(7'h40)))))))
        begin
          reg22 <= $unsigned($signed((^reg11[(2'h2):(1'h1)])));
        end
      else
        begin
          reg22 <= $unsigned($signed(reg17));
          if (((((8'ha4) ?
                  (&$unsigned(wire0)) : reg12[(5'h11):(4'hd)]) >>> $unsigned($signed(wire6))) ?
              $signed((!reg22[(2'h3):(1'h1)])) : $signed($unsigned((reg8 ?
                  (~|wire2) : (|reg18))))))
            begin
              reg23 <= $signed((wire3 ?
                  {$signed((wire3 ?
                          reg7 : wire2))} : $signed((wire3[(4'ha):(1'h1)] ?
                      ((8'ha6) ? reg16 : reg13) : (reg19 & reg12)))));
              reg24 <= reg16[(4'hc):(4'h9)];
              reg25 <= ({(reg23[(4'ha):(3'h6)] || wire5)} ?
                  reg7[(3'h7):(3'h5)] : (^$signed((-reg19))));
              reg26 <= ({(8'hba),
                  ((&(reg22 & reg21)) ?
                      $signed($unsigned((8'hac))) : wire3[(4'ha):(3'h4)])} << (($unsigned((~|wire1)) ?
                  (+reg19) : (((8'ha9) ?
                      reg8 : reg22) != (|(7'h41)))) ^~ $unsigned(((~|wire6) ?
                  $unsigned(reg21) : reg10[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg23 <= (reg7 != {$signed((reg10[(4'ha):(2'h2)] | $signed(reg18)))});
              reg24 <= ($signed((reg14[(2'h2):(1'h0)] ?
                  $signed((wire5 ^~ reg26)) : (reg15 ?
                      (reg18 ? reg23 : wire0) : wire3))) ~^ reg24);
            end
        end
      reg27 <= (reg9[(2'h3):(1'h0)] ?
          $signed(($signed($unsigned(reg13)) >>> $signed($unsigned((8'hae))))) : (8'ha4));
    end
  assign wire28 = ((reg20 ?
                      reg12[(4'hf):(4'hd)] : (reg10[(2'h2):(1'h0)] >>> (-{reg18,
                          reg8}))) ^ {(~reg25[(4'h9):(3'h7)]),
                      $signed((-(wire5 ? wire6 : reg9)))});
  assign wire29 = $signed({{((wire1 ? wire28 : (8'haf)) == $signed(wire28)),
                          wire2},
                      $unsigned(($signed((7'h43)) ?
                          (wire1 & (8'hb3)) : $unsigned(reg12)))});
  assign wire30 = $unsigned({reg14[(5'h13):(4'hb)], $unsigned(reg17)});
  assign wire31 = $unsigned($signed(wire1));
  assign wire32 = (~$signed($signed((^~$signed(reg7)))));
  assign wire33 = $signed((~|reg16[(1'h0):(1'h0)]));
endmodule
