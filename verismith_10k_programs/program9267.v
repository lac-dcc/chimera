module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  assign y = {wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire22,
                 wire20,
                 wire5,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(wire4[(2'h2):(2'h2)]));
  module6 #() modinst21 (wire20, clk, wire3, wire5, wire4, wire1);
  assign wire22 = $unsigned($unsigned(($signed($unsigned(wire2)) ?
                      (~|$signed(wire20)) : ((wire3 ?
                          wire3 : wire0) != $unsigned(wire20)))));
  always
    @(posedge clk) begin
      reg23 <= wire1;
      if (wire4[(1'h0):(1'h0)])
        begin
          reg24 <= reg23;
          reg25 <= $unsigned($signed((~|($unsigned((8'h9d)) ?
              (wire0 + wire20) : reg23[(2'h2):(1'h1)]))));
        end
      else
        begin
          if ($signed(reg25))
            begin
              reg24 <= ($unsigned((&(|$signed(wire2)))) ?
                  $unsigned($signed($unsigned($signed(wire20)))) : $signed((reg23[(2'h2):(2'h2)] + (8'h9c))));
              reg25 <= reg23[(1'h1):(1'h1)];
              reg26 <= {(wire1 ~^ ($signed((-wire22)) & $signed($signed(wire3)))),
                  wire4};
              reg27 <= $unsigned($unsigned((|wire3)));
            end
          else
            begin
              reg24 <= {wire5};
              reg25 <= (8'hb8);
              reg26 <= wire5[(4'hd):(4'hd)];
              reg27 <= $signed((|wire2[(4'h8):(1'h0)]));
            end
          reg28 <= ({reg27} ?
              reg27[(4'h9):(3'h5)] : $unsigned(((^~(wire2 & wire5)) ?
                  (wire20 & (wire1 ? reg26 : reg24)) : wire1[(4'h8):(3'h7)])));
          reg29 <= ($unsigned($unsigned(wire1[(4'hc):(4'h9)])) >>> (($unsigned((8'hb4)) | $unsigned(reg26[(2'h3):(1'h1)])) ?
              wire22[(2'h2):(1'h1)] : ($signed((reg28 ? wire20 : reg26)) ?
                  ($signed((8'hae)) >>> reg26) : $unsigned(((8'hbe) ?
                      wire22 : wire3)))));
          if (reg24)
            begin
              reg30 <= $signed((&(-((-reg29) == (^~(8'hba))))));
              reg31 <= $unsigned({wire5[(3'h4):(1'h1)]});
            end
          else
            begin
              reg30 <= reg23[(1'h1):(1'h0)];
              reg31 <= (((~|reg26) != $unsigned(reg24)) ?
                  $unsigned(($signed($signed((8'hb8))) ?
                      ({wire20} ?
                          wire22[(2'h2):(1'h0)] : $signed(wire20)) : (wire2 ?
                          (^wire3) : (reg30 * wire3)))) : wire4[(4'h9):(1'h0)]);
              reg32 <= (+(~&(~|wire4[(2'h2):(2'h2)])));
              reg33 <= ((~(($unsigned(reg31) ?
                  reg24 : ((7'h42) ?
                      wire22 : reg32)) || reg23[(1'h0):(1'h0)])) >= $signed($signed((reg30 ?
                  reg29 : wire20))));
            end
        end
    end
  assign wire34 = (-$signed($signed(($unsigned(wire0) ?
                      (wire2 ? reg30 : wire5) : reg32))));
  assign wire35 = reg24;
  assign wire36 = reg27;
  always
    @(posedge clk) begin
      reg37 <= (!reg28);
      reg38 <= (~&(wire35[(4'h9):(3'h7)] ?
          $signed((!{wire0, reg23})) : (&wire3)));
      if ((($unsigned(reg37[(2'h3):(1'h0)]) <= $unsigned($signed($signed(wire0)))) > (|wire22[(3'h4):(2'h2)])))
        begin
          reg39 <= (((+((wire3 >= wire34) ~^ $signed(wire36))) == wire2) ?
              reg27[(3'h7):(3'h7)] : (wire0 ^~ $unsigned(reg37)));
        end
      else
        begin
          reg39 <= ((+(($signed(wire36) ?
                  {wire3, wire1} : (8'haf)) <= wire22)) ?
              ($signed(($unsigned(reg29) >> $signed(reg39))) <<< (wire36 ?
                  wire4 : reg37[(2'h2):(1'h0)])) : $signed(reg39[(4'h8):(1'h0)]));
          reg40 <= $signed(reg32);
        end
    end
  assign wire41 = (wire2[(1'h0):(1'h0)] == ((wire3[(4'hd):(4'h8)] >= $signed((reg37 ?
                      reg31 : reg26))) || (!((8'ha0) ?
                      $signed((8'hb9)) : $unsigned(reg29)))));
endmodule

module module6
#(parameter param19 = (!(&((((8'hbd) ? (7'h42) : (8'had)) ~^ ((8'hb0) ? (8'hb9) : (7'h40))) >> (+(~(8'ha4)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire12,
                 wire11,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = $signed({$unsigned($signed($signed(wire9)))});
  assign wire12 = (+(wire9 ?
                      ((+$signed((8'ha2))) ?
                          $unsigned(wire11) : $unsigned({wire10,
                              wire7})) : $signed(wire8)));
  always
    @(posedge clk) begin
      reg13 <= wire8;
      reg14 <= {(wire8[(3'h7):(2'h3)] ? wire10[(3'h7):(3'h4)] : $signed(wire9)),
          {(~$unsigned($unsigned(wire7))),
              $signed(($signed(wire10) <<< wire11))}};
    end
  assign wire15 = ($unsigned(wire10) ~^ {$unsigned(wire12)});
  assign wire16 = wire10;
  assign wire17 = (wire16 | ($unsigned(wire12[(4'hc):(4'hc)]) ~^ $signed(reg13[(2'h3):(2'h2)])));
  assign wire18 = (~|(~&(wire17 | {$signed(reg14), wire11})));
endmodule
