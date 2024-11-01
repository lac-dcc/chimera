module top
#(parameter param28 = (((((-(8'h9d)) ? ((8'hbb) ? (7'h40) : (7'h42)) : ((8'ha2) ? (8'h9e) : (8'had))) ? (~&((8'hb9) || (8'hb7))) : {((8'hb2) || (8'hb7))}) | ({(^(8'ha7))} << (8'ha6))) >>> ({(~|((7'h42) < (8'ha2)))} <= (((+(8'hb1)) ? (^(8'hb7)) : ((8'ha0) | (8'hb8))) ? (((8'had) ? (8'hb3) : (8'hb2)) <= (+(8'h9f))) : (((8'hb2) ? (8'ha1) : (8'hb7)) && ((7'h41) * (8'hb2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
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
                 (1'h0)};
  assign wire4 = $signed((~&wire3[(3'h5):(1'h0)]));
  assign wire5 = wire0;
  assign wire6 = (-((((|(8'hb8)) ?
                         wire1[(4'hc):(4'h8)] : $signed(wire2)) ^ $signed(wire1[(4'hb):(2'h2)])) ?
                     ((-(wire3 ?
                         wire2 : (8'ha0))) <<< $signed($signed(wire4))) : wire1));
  assign wire7 = $signed({((~&wire6[(2'h2):(1'h0)]) ?
                         $unsigned(wire3[(4'ha):(3'h5)]) : (wire2[(3'h4):(2'h3)] != (wire0 >>> wire4))),
                     ((~|wire6) << {$unsigned(wire2),
                         (wire1 ? wire6 : wire2)})});
  assign wire8 = ($signed((({wire2} ~^ wire4[(3'h5):(2'h3)]) ^ (7'h40))) ?
                     $unsigned((|wire3[(1'h1):(1'h1)])) : $signed((^wire7[(3'h6):(1'h0)])));
  assign wire9 = $signed((|$signed($signed({wire2}))));
  assign wire10 = $signed(((^~(~&(8'h9c))) < (~|(-(wire2 ? wire0 : wire5)))));
  assign wire11 = ((wire4[(2'h2):(1'h0)] ?
                      $unsigned($unsigned(wire3[(3'h6):(2'h2)])) : (((~wire7) <<< wire6[(4'hb):(2'h2)]) ?
                          $signed((+wire1)) : (|{wire7}))) >>> $unsigned($signed((&(^wire0)))));
  assign wire12 = {{$signed((~^$signed(wire0)))}};
  assign wire13 = $signed(({$signed(wire5),
                      {$signed((8'hb4)), $unsigned(wire12)}} * {(~^(^wire4))}));
  always
    @(posedge clk) begin
      reg14 <= $signed($signed((wire3 << wire4)));
      reg15 <= (~|(($unsigned(wire7) ?
          ((!wire9) >= (wire2 < wire6)) : $signed(wire9)) || wire13));
      if (wire5)
        begin
          reg16 <= (8'hb7);
          reg17 <= (($unsigned(wire8) ?
                  {(wire5 ?
                          (reg16 ?
                              wire8 : wire2) : $unsigned(wire13))} : $unsigned({wire3[(1'h1):(1'h0)],
                      $unsigned(wire2)})) ?
              $signed(($unsigned(wire3[(4'hc):(3'h5)]) < reg16[(3'h4):(2'h3)])) : (~^{(^(8'hb3))}));
          if ({($unsigned((!$unsigned(reg17))) & ((^~{wire4, wire4}) ?
                  reg16[(2'h3):(1'h0)] : $signed((wire10 ? reg17 : reg17))))})
            begin
              reg18 <= (reg17[(2'h2):(1'h0)] ?
                  wire6[(4'hf):(4'hc)] : wire6[(2'h3):(2'h3)]);
              reg19 <= reg14[(1'h1):(1'h0)];
              reg20 <= (~^($signed(((reg14 ? wire1 : wire2) >> (wire6 ?
                  (8'h9d) : reg15))) == (^reg18)));
              reg21 <= (($unsigned($unsigned(wire6[(1'h1):(1'h0)])) ?
                      (({wire4} ? ((8'hbb) ? (8'ha8) : (8'ha3)) : wire1) ?
                          $unsigned(reg16) : $signed({wire7,
                              (8'ha5)})) : $unsigned(((reg17 < wire13) | (+wire5)))) ?
                  reg17 : wire0[(4'hd):(3'h7)]);
            end
          else
            begin
              reg18 <= $signed(wire6);
              reg19 <= $unsigned(((wire7 ?
                      reg19 : ((~wire9) || {wire8, wire9})) ?
                  {$signed((wire9 + wire5))} : (~|reg15[(1'h0):(1'h0)])));
              reg20 <= wire10[(2'h2):(1'h1)];
              reg21 <= {$signed((~&((wire6 ? wire7 : wire10) < ((8'hbd) ?
                      reg18 : wire6)))),
                  reg19[(3'h4):(3'h4)]};
            end
          reg22 <= {(wire1 ?
                  ($signed(((8'hbf) ? reg19 : (7'h40))) ?
                      (wire7 ?
                          $signed(reg16) : ((8'haa) | reg21)) : reg20) : wire13[(1'h0):(1'h0)]),
              ($signed((!(!wire8))) >= $unsigned((~^wire13[(3'h5):(1'h1)])))};
          reg23 <= wire6;
        end
      else
        begin
          if (((~^reg14[(4'h8):(3'h6)]) ?
              $signed(($unsigned({wire4}) ^ wire3[(1'h1):(1'h1)])) : (-$signed($unsigned((reg14 ^ reg23))))))
            begin
              reg16 <= $unsigned($unsigned($unsigned(((wire12 ?
                  wire6 : reg19) << (reg20 || reg14)))));
              reg17 <= (&$unsigned($unsigned($unsigned(wire3))));
              reg18 <= $signed({$unsigned(wire4[(1'h1):(1'h0)]),
                  ($unsigned($unsigned(reg15)) ~^ ((wire1 + reg22) ?
                      (reg23 ? wire10 : (8'hbf)) : (reg16 ? wire1 : reg21)))});
            end
          else
            begin
              reg16 <= (~&(^~reg19));
              reg17 <= $unsigned(((wire5[(4'hc):(3'h7)] ?
                      ((8'ha0) ?
                          $unsigned((8'hbc)) : $signed(reg22)) : $unsigned((reg19 ~^ reg23))) ?
                  reg20[(2'h2):(1'h1)] : $unsigned(((8'hbd) ?
                      {wire9} : reg22[(3'h7):(3'h4)]))));
              reg18 <= reg19[(3'h6):(1'h0)];
              reg19 <= ($signed($signed((8'ha7))) ? wire4 : $unsigned(reg19));
              reg20 <= {wire3, ($unsigned(reg22) <= (&$unsigned(reg16)))};
            end
          reg21 <= (wire12 ? wire6 : wire5[(4'hb):(2'h3)]);
        end
    end
  assign wire24 = $unsigned({($unsigned(wire12) ?
                          $signed($unsigned(wire6)) : (&$unsigned(reg15))),
                      $signed(reg21)});
  assign wire25 = {((({reg19,
                          wire12} > wire9) ^ (|$signed(wire8))) <<< reg18[(4'ha):(4'h9)])};
  assign wire26 = $unsigned((7'h40));
  assign wire27 = $signed({{(~|$signed(wire8))}});
endmodule
