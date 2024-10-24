module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = (^~((~&{wire3}) * (!($unsigned(wire3) <= (^wire2)))));
  assign wire5 = (((wire3[(2'h2):(1'h1)] ?
                     (wire1[(3'h4):(1'h0)] ?
                         (wire3 ?
                             wire2 : wire3) : wire4[(1'h0):(1'h0)]) : (+$unsigned(wire4))) + $signed(wire4)) ^~ ((^$signed($signed(wire1))) > ($signed(wire3) ?
                     wire0[(1'h1):(1'h0)] : wire2)));
  assign wire6 = (!(((!wire1[(3'h7):(1'h0)]) == wire2) ?
                     (((wire5 + wire3) ? wire4 : $signed((8'ha2))) ?
                         wire3 : $unsigned((wire1 <= wire3))) : ({((8'hb3) ?
                             wire2 : wire0)} <<< {$unsigned(wire1), wire5})));
  always
    @(posedge clk) begin
      if ($unsigned(($signed((wire4 ? (^~wire3) : wire5)) ?
          $signed((~&(wire1 || (8'ha3)))) : {(|(wire3 <= wire1))})))
        begin
          reg7 <= ({$signed(wire3[(1'h0):(1'h0)])} ~^ $signed(wire2[(1'h1):(1'h1)]));
          reg8 <= ($unsigned($signed({wire0})) ?
              wire1[(1'h0):(1'h0)] : (($signed($signed(wire4)) ?
                  ($unsigned(wire5) << (8'h9e)) : ((wire6 ?
                      wire3 : (8'hab)) | wire2[(2'h3):(2'h2)])) <<< (((&wire6) ?
                      (wire5 ? (8'hbb) : wire5) : {wire5}) ?
                  $signed((wire4 ~^ (8'hb1))) : ((~|(8'ha8)) != (!(8'hb3))))));
        end
      else
        begin
          if ((!(wire1 ? reg8 : $unsigned($unsigned({wire2})))))
            begin
              reg7 <= reg8[(3'h5):(3'h5)];
              reg8 <= ({wire5[(4'ha):(4'h8)]} || $unsigned(wire6[(1'h1):(1'h1)]));
              reg9 <= (~|$signed(((&$signed(wire6)) ?
                  $signed((~^wire3)) : wire4[(2'h3):(1'h1)])));
              reg10 <= (wire6[(4'h9):(3'h7)] ~^ $signed((~|({reg8} ?
                  (wire6 ^~ reg8) : (wire3 ? wire0 : wire5)))));
            end
          else
            begin
              reg7 <= (8'haf);
              reg8 <= (~^(&((!(wire6 == wire3)) >>> wire2)));
            end
          reg11 <= wire1[(4'hb):(1'h1)];
          if (wire5)
            begin
              reg12 <= (-(8'ha4));
              reg13 <= $signed($unsigned(((reg7 ?
                      (wire1 ? reg12 : wire5) : {reg9, reg12}) ?
                  (-$signed(wire5)) : $unsigned($unsigned((8'h9f))))));
              reg14 <= $unsigned($unsigned({(8'hac)}));
              reg15 <= wire0;
            end
          else
            begin
              reg12 <= wire0[(2'h3):(2'h3)];
              reg13 <= $signed(reg13[(2'h3):(1'h0)]);
            end
          if ((!$signed(reg15[(5'h11):(4'hf)])))
            begin
              reg16 <= (^~$signed($signed(reg11[(4'hf):(4'hb)])));
              reg17 <= ($signed($unsigned((!wire4))) ?
                  (~&$signed((^reg11[(2'h3):(1'h1)]))) : reg14[(2'h2):(1'h0)]);
              reg18 <= $signed($signed(wire0[(2'h2):(1'h1)]));
            end
          else
            begin
              reg16 <= (|reg12[(3'h4):(2'h3)]);
              reg17 <= $unsigned(($unsigned((|{reg9,
                  wire0})) + $signed(($unsigned(wire6) | (reg11 < wire4)))));
              reg18 <= {(~reg16)};
            end
          reg19 <= $unsigned($unsigned(reg8[(1'h1):(1'h1)]));
        end
    end
  assign wire20 = $unsigned(wire2[(1'h0):(1'h0)]);
  assign wire21 = {reg14, reg16[(3'h7):(1'h1)]};
  assign wire22 = (($unsigned((+$unsigned(wire21))) ?
                      (^reg19[(3'h7):(2'h3)]) : {reg18}) >>> (wire1[(2'h2):(2'h2)] ^ $signed(($signed(reg15) ?
                      reg8[(3'h6):(1'h1)] : {wire6}))));
endmodule
