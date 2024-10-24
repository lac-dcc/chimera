module top
#(parameter param29 = (8'hb8))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire17,
                 wire16,
                 wire5,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
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
                 (1'h0)};
  assign wire5 = ($unsigned((wire1[(4'hc):(3'h6)] >>> ((~|(7'h41)) ?
                     $unsigned(wire2) : wire2[(1'h0):(1'h0)]))) || (~($unsigned(((8'hb7) ?
                     wire3 : wire3)) | ($signed((8'ha8)) & $signed((8'h9f))))));
  always
    @(posedge clk) begin
      if ({wire2})
        begin
          reg6 <= {wire3[(4'hb):(4'ha)], wire2[(3'h6):(2'h3)]};
          if ((+(wire5 ~^ $unsigned((8'ha9)))))
            begin
              reg7 <= ($unsigned((wire1 <<< wire5[(2'h3):(2'h3)])) ?
                  wire4 : $signed((|{wire3})));
              reg8 <= wire0;
            end
          else
            begin
              reg7 <= (reg6[(4'hf):(3'h5)] >= reg8);
            end
        end
      else
        begin
          reg6 <= $signed($unsigned((wire3[(4'ha):(1'h0)] ~^ wire3[(3'h4):(2'h2)])));
          if (wire1[(4'ha):(2'h3)])
            begin
              reg7 <= (reg6 * wire0);
              reg8 <= reg6;
              reg9 <= wire0;
              reg10 <= ((8'hb3) ~^ {reg7});
              reg11 <= ($unsigned(wire2) ? reg7 : wire2);
            end
          else
            begin
              reg7 <= $signed(reg7[(3'h5):(1'h1)]);
              reg8 <= ($signed((^wire4)) ?
                  $signed(reg9) : (reg8[(1'h0):(1'h0)] << reg7[(2'h3):(1'h1)]));
              reg9 <= ((+$unsigned($signed((-wire1)))) + (8'hb6));
            end
          reg12 <= $unsigned({$signed((((8'hb0) < reg7) ^ (wire1 > wire2))),
              $signed($unsigned({wire3, reg11}))});
          reg13 <= $unsigned($signed(reg11[(3'h4):(2'h3)]));
        end
      reg14 <= wire2;
      reg15 <= $unsigned((($unsigned($unsigned(wire5)) ?
              $unsigned((reg10 ?
                  wire3 : reg13)) : $unsigned(reg8[(1'h0):(1'h0)])) ?
          (8'hbd) : (reg12[(2'h3):(1'h0)] ?
              $signed((reg7 >>> wire1)) : $signed((-wire3)))));
    end
  assign wire16 = {$signed(($unsigned({reg12}) ?
                          (8'hb6) : reg6[(1'h0):(1'h0)])),
                      reg7};
  assign wire17 = (|wire4[(4'h9):(3'h5)]);
  always
    @(posedge clk) begin
      reg18 <= ({reg8} ^~ $unsigned(wire0[(4'h8):(3'h6)]));
      reg19 <= (~&wire0);
      reg20 <= $signed($signed(($signed($unsigned(wire4)) - ($unsigned(reg7) >> (reg9 ?
          wire4 : reg8)))));
      reg21 <= $signed($signed(({reg8, (^~reg13)} ?
          $unsigned((^reg10)) : $signed($signed(wire4)))));
      if (((~|reg13) ?
          ($unsigned(reg18) ?
              ((|{reg13,
                  reg10}) <<< wire0) : (^~($signed(wire4) <= (reg13 ^~ reg7)))) : (((((8'ha1) ?
                          wire17 : wire1) ?
                      wire4 : (~|reg19)) ?
                  (8'hb6) : ((+wire0) * $signed(wire3))) ?
              $unsigned({(8'hab)}) : (8'h9d))))
        begin
          reg22 <= $unsigned($signed(wire4));
          reg23 <= $unsigned(reg6[(4'h8):(2'h3)]);
          if ((7'h41))
            begin
              reg24 <= (|(~&{{$unsigned(reg18)}, (^~(+reg9))}));
            end
          else
            begin
              reg24 <= reg14;
              reg25 <= (^(+((|$unsigned(reg20)) >> ((wire0 || wire0) * $unsigned(wire2)))));
            end
        end
      else
        begin
          reg22 <= (8'h9f);
        end
    end
  assign wire26 = (((^((~|reg6) < reg15)) || (^~wire1)) ?
                      (8'hbe) : $signed((~((^~wire2) == wire4))));
  assign wire27 = reg24[(2'h2):(2'h2)];
  assign wire28 = wire5[(1'h1):(1'h1)];
endmodule
