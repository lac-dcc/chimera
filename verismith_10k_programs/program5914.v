module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
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
                 (1'h0)};
  assign wire4 = (8'h9f);
  assign wire5 = ((+wire3) | ($signed($unsigned((wire3 ?
                     wire1 : wire2))) << wire3[(5'h11):(4'hf)]));
  assign wire6 = {$unsigned(wire0[(4'ha):(3'h6)])};
  assign wire7 = $unsigned(({(-$signed(wire1))} ?
                     (8'haf) : (wire2[(3'h6):(2'h2)] ?
                         $signed($unsigned(wire5)) : $signed($unsigned(wire3)))));
  always
    @(posedge clk) begin
      if ((~^wire0))
        begin
          reg8 <= ((~^$unsigned(wire3)) & ($signed($unsigned({wire1})) ?
              wire2[(4'h9):(3'h7)] : wire2));
        end
      else
        begin
          if ($unsigned(((wire3 < ((&wire3) | $unsigned(wire5))) ?
              reg8 : ((+wire3[(1'h0):(1'h0)]) ?
                  ((wire6 - wire3) ^~ $unsigned(wire5)) : ((^~wire0) >>> (wire4 ^ wire6))))))
            begin
              reg8 <= ((|wire1) << $unsigned(($unsigned((wire6 * (8'ha8))) ?
                  (!(wire1 <= wire1)) : $unsigned((wire6 ? wire4 : wire7)))));
              reg9 <= ((~&(($unsigned(wire2) ?
                  wire3[(4'hf):(3'h7)] : (~(8'ha7))) << ((^wire5) && (!wire6)))) << {($signed(wire0[(5'h13):(5'h11)]) >> $unsigned((^~wire5))),
                  (^~(~(~wire2)))});
              reg10 <= {(^~((reg9 == $unsigned(wire7)) ~^ (wire5 ?
                      wire6[(1'h0):(1'h0)] : $signed(reg8)))),
                  reg8[(4'h8):(4'h8)]};
              reg11 <= wire5;
              reg12 <= $unsigned({((8'hb2) ?
                      ($signed(wire6) | wire1) : {(8'had), $unsigned(wire1)}),
                  (|wire3)});
            end
          else
            begin
              reg8 <= (-wire7[(3'h5):(1'h1)]);
            end
        end
      if ($signed($unsigned($unsigned($unsigned($signed(wire6))))))
        begin
          reg13 <= $signed($unsigned((wire3 ?
              reg12[(4'hd):(3'h7)] : $unsigned((wire1 >>> wire4)))));
          reg14 <= reg11[(3'h6):(2'h3)];
        end
      else
        begin
          reg13 <= reg10;
          reg14 <= $unsigned((8'hb3));
        end
    end
  always
    @(posedge clk) begin
      reg15 <= wire6[(2'h2):(1'h1)];
      if (({$signed(($signed(reg11) > (wire4 <= reg15)))} - (wire4[(1'h0):(1'h0)] ?
          $unsigned((|(wire1 ? reg9 : reg12))) : wire3[(4'hd):(4'ha)])))
        begin
          reg16 <= wire2;
          reg17 <= (-((reg9[(1'h0):(1'h0)] != $signed(((7'h41) ?
                  (8'ha5) : wire0))) ?
              wire3[(2'h3):(1'h1)] : ({wire2[(2'h3):(2'h3)],
                  (8'hbd)} != {(-reg9), (~^wire7)})));
          reg18 <= (^~(+wire0[(3'h5):(2'h3)]));
        end
      else
        begin
          reg16 <= ($unsigned($unsigned((~^reg10[(4'hb):(3'h5)]))) >>> reg10);
        end
      reg19 <= (reg15[(2'h2):(1'h1)] | reg14);
    end
endmodule
