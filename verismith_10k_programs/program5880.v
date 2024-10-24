module top
#(parameter param28 = {{{(^((7'h40) ? (7'h40) : (7'h42))), (~^((8'h9d) >= (7'h43)))}}, (((((7'h41) || (8'ha2)) ? (~|(8'hb4)) : {(7'h40)}) ? (((8'ha5) <= (8'hab)) ? {(7'h43), (8'haa)} : ((8'hb9) ? (8'hb8) : (8'hb6))) : (~^((8'hbb) ? (8'haa) : (8'haf)))) ? {({(8'hbd)} ? (-(8'hb3)) : {(8'hb2), (8'hb1)})} : ((((8'hac) ~^ (8'ha2)) ? {(8'hba)} : (~&(7'h41))) | (((7'h43) ? (7'h43) : (8'hba)) ? (8'ha3) : ((8'hb7) > (8'ha6)))))}, 
parameter param29 = (((param28 ~^ {param28, ((8'ha4) ? (8'hb5) : param28)}) != (~(~param28))) != param28))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $unsigned(((~&(&{wire3})) ~^ $unsigned(wire1[(5'h11):(1'h1)])));
  assign wire6 = $signed($signed(($unsigned((~|wire2)) > (8'hb0))));
  assign wire7 = wire1;
  assign wire8 = $unsigned((|{($unsigned(wire5) ?
                         wire2[(1'h1):(1'h1)] : wire6[(3'h4):(3'h4)]),
                     $signed((wire2 ? wire0 : wire3))}));
  assign wire9 = wire1[(4'hf):(1'h1)];
  assign wire10 = $unsigned(wire9[(3'h6):(1'h0)]);
  assign wire11 = ($signed((wire7 ?
                      {wire5,
                          {wire10}} : ($unsigned(wire1) | (+wire5)))) | wire10[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      if ((+wire7[(4'hd):(1'h0)]))
        begin
          reg12 <= {$signed($signed(wire0[(5'h12):(4'he)])),
              {wire5[(2'h2):(1'h1)], $signed({$signed(wire5)})}};
        end
      else
        begin
          reg12 <= ($signed(wire7) * wire7);
          if ({{(wire0[(4'hd):(4'h9)] == ($signed(wire4) ?
                      ((8'hb7) ~^ wire11) : $unsigned(wire6))),
                  wire1[(3'h4):(1'h0)]},
              $unsigned($unsigned((reg12[(3'h6):(3'h5)] != (8'h9f))))})
            begin
              reg13 <= wire6[(3'h7):(3'h5)];
              reg14 <= ($unsigned($unsigned((((8'hb3) ?
                      (8'ha7) : wire1) && wire2))) ?
                  $signed(wire9[(3'h5):(2'h3)]) : wire10[(3'h6):(2'h2)]);
              reg15 <= wire1[(1'h0):(1'h0)];
              reg16 <= (7'h42);
            end
          else
            begin
              reg13 <= ((^(~(reg14 + wire8[(1'h0):(1'h0)]))) ?
                  {({$signed(wire7),
                          {(8'haa)}} * wire2[(2'h2):(1'h0)])} : (reg13 ?
                      (((-wire9) ? (-(8'h9f)) : (|wire8)) ~^ ((|wire9) ?
                          wire5[(4'ha):(2'h2)] : $signed(wire10))) : $unsigned($signed(reg15))));
              reg14 <= (wire7 ?
                  ($unsigned(wire1) ^ ($signed((~|(8'hbd))) ?
                      (~&{wire2, reg13}) : (~&(wire1 ?
                          wire7 : wire10)))) : ($signed($unsigned((~&reg16))) & reg14));
              reg15 <= (~($signed($signed($unsigned(reg15))) >= $unsigned($unsigned((wire9 << wire4)))));
              reg16 <= (+($signed(wire1[(3'h5):(2'h2)]) - (reg15[(2'h2):(1'h1)] ?
                  {(-reg12), {(8'ha3)}} : $unsigned({reg14, wire9}))));
              reg17 <= wire7[(2'h2):(1'h0)];
            end
          if ((($signed($signed($signed(reg17))) ?
              ($unsigned((^~reg14)) ~^ wire7[(4'hc):(3'h7)]) : ($unsigned((~^wire3)) ?
                  $unsigned(reg13) : (^~(~&(8'ha6))))) ~^ $signed(((^(wire11 == (8'hae))) ?
              {(reg16 << reg14)} : $unsigned(wire11[(3'h5):(1'h1)])))))
            begin
              reg18 <= ((+wire9) ^~ reg15);
            end
          else
            begin
              reg18 <= wire11;
              reg19 <= $unsigned((&($signed((~^wire4)) ?
                  wire9[(2'h3):(2'h3)] : $unsigned($unsigned(wire5)))));
              reg20 <= (8'hb1);
            end
          reg21 <= (~^($signed(wire9) ?
              $unsigned({(8'hbd)}) : ($signed((~wire9)) >> {{reg12}})));
        end
      reg22 <= (^(~^(($signed(reg13) >> (reg19 ? wire0 : wire11)) != ((~wire3) ?
          (wire8 > wire8) : (wire3 < wire0)))));
      reg23 <= (|{$unsigned($signed((wire11 ? wire11 : wire2)))});
      reg24 <= $unsigned($unsigned((~{(wire2 ? wire3 : wire7)})));
      reg25 <= (-reg15);
    end
  assign wire26 = $unsigned(wire3);
  assign wire27 = (~|$signed(reg13));
endmodule
