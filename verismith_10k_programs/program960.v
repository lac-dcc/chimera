module top
#(parameter param22 = ((^((-(|(8'ha3))) <<< {((8'hbc) ? (8'hb5) : (8'hb1)), ((7'h44) - (8'hbd))})) ? (((((8'had) ? (8'hb6) : (8'hae)) ? ((8'hbd) ? (8'had) : (7'h40)) : ((8'ha2) ? (8'hab) : (8'ha6))) ? {{(8'hb6)}, (8'ha7)} : (((8'ha3) ? (8'hab) : (8'ha5)) == {(8'had)})) + (((~(8'hb7)) ^~ (~^(8'ha8))) > ((|(8'hb0)) >> ((8'ha5) ? (8'ha9) : (8'hac))))) : ((~(((8'h9e) >>> (8'ha0)) ~^ ((8'haa) ? (8'hb6) : (8'hac)))) - ((8'ha5) <= (~&((8'hbb) & (8'hb1)))))), 
parameter param23 = (~|(((param22 ? ((8'ha3) && (8'h9d)) : (param22 > param22)) + (^{param22})) - param22)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire20,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = {($signed((+(wire2 ? wire0 : wire1))) ?
                         (^(~&wire1)) : $signed($signed(((8'haa) ?
                             wire1 : (8'hb3))))),
                     (~^(~&($signed(wire5) ~^ wire1[(2'h3):(2'h3)])))};
  assign wire7 = wire5;
  assign wire8 = wire2;
  assign wire9 = wire6[(3'h4):(1'h1)];
  assign wire10 = wire6;
  assign wire11 = (~&wire5);
  always
    @(posedge clk) begin
      if (wire10[(1'h1):(1'h1)])
        begin
          reg12 <= $signed($signed($unsigned((~&(wire1 ? wire2 : wire10)))));
          if (($signed(wire8) >= (wire10[(1'h0):(1'h0)] - (-wire10))))
            begin
              reg13 <= (!$signed((($unsigned(wire0) ~^ {wire9, wire0}) ?
                  wire11 : wire10)));
              reg14 <= $unsigned(({(+(!wire4)),
                  wire3[(2'h3):(1'h0)]} != wire0));
            end
          else
            begin
              reg13 <= $unsigned($unsigned((|reg12[(5'h11):(4'hc)])));
              reg14 <= $signed((~wire1[(5'h14):(4'ha)]));
              reg15 <= (!(8'ha2));
            end
          reg16 <= $unsigned(({$signed(wire7)} ?
              (-wire0[(2'h3):(1'h0)]) : $signed(wire4)));
        end
      else
        begin
          reg12 <= {$unsigned($unsigned(wire10[(2'h2):(1'h0)])), (8'hb9)};
          reg13 <= $signed((($unsigned(wire7[(1'h1):(1'h0)]) < $unsigned((wire5 ?
                  (8'hb6) : wire1))) ?
              wire9 : $unsigned((+{wire0}))));
          if ($unsigned(($unsigned(((wire0 & wire0) ?
                  (!wire6) : {reg12, reg14})) ?
              reg12[(1'h1):(1'h0)] : $unsigned(wire11))))
            begin
              reg14 <= $signed(reg16[(4'hf):(1'h1)]);
              reg15 <= {$unsigned((wire4[(4'hc):(1'h1)] ?
                      $unsigned(wire6) : wire3)),
                  $signed(wire5[(4'h9):(3'h7)])};
              reg16 <= wire9;
              reg17 <= (({{reg12[(4'ha):(2'h3)],
                      wire7}} >= (~|$unsigned($signed(wire1)))) << (reg12[(4'hf):(4'h8)] ^ {((&reg16) ?
                      (!wire2) : wire3)}));
              reg18 <= reg15[(3'h7):(3'h6)];
            end
          else
            begin
              reg14 <= (({(~&reg12)} >= {reg18,
                      $unsigned((reg13 ? wire3 : wire1))}) ?
                  {$signed(($signed(wire10) & (!wire7))),
                      wire3[(4'he):(3'h6)]} : $signed($signed((8'hb5))));
            end
        end
      reg19 <= (~|wire11);
    end
  assign wire20 = $signed($unsigned(($signed(wire0[(2'h3):(2'h3)]) - $unsigned((~|wire5)))));
  always
    @(posedge clk) begin
      reg21 <= {$unsigned((!reg14))};
    end
endmodule
