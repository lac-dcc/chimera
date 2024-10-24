module top
#(parameter param41 = ((((((8'had) < (8'ha0)) ? (|(8'hae)) : ((8'hb5) * (8'hb1))) >= (~^((8'hb4) <= (8'hb2)))) ? (+(8'ha0)) : {(~^(8'hb9))}) ? {(~|(((8'h9c) ? (8'hac) : (8'hb4)) == {(8'ha8), (8'hb9)}))} : {((((7'h42) ? (7'h44) : (8'ha5)) ? {(8'ha1), (8'ha9)} : {(8'hb2)}) ? (~^(~|(8'hb6))) : ({(8'hbc), (8'h9d)} ? ((8'hb5) >>> (8'hb0)) : (!(8'ha4))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire39;
  assign y = {wire5, wire6, wire7, wire8, wire39, (1'h0)};
  assign wire5 = $signed(($signed($signed(wire3[(4'h9):(3'h6)])) ?
                     $unsigned(wire0[(4'ha):(3'h5)]) : {($signed(wire2) ?
                             (8'hb8) : wire4)}));
  assign wire6 = (8'h9e);
  assign wire7 = $unsigned((((~wire1) < $unsigned($signed(wire1))) ?
                     ($signed((wire2 ? wire0 : wire0)) ?
                         ($unsigned(wire4) ^ ((8'hb7) + wire3)) : $unsigned($signed(wire3))) : (((wire4 >>> wire5) ^~ $unsigned(wire5)) | (wire4 ?
                         (wire4 >>> (8'hbc)) : $signed((8'hb4))))));
  assign wire8 = (~|((wire6[(4'ha):(1'h1)] >>> $signed(wire4[(2'h2):(1'h1)])) ?
                     wire6[(2'h2):(1'h0)] : ($unsigned($signed(wire1)) ?
                         wire2[(1'h1):(1'h0)] : ((wire1 - (8'hb8)) && wire6))));
  module9 #() modinst40 (wire39, clk, wire3, wire4, wire8, wire1, wire0);
endmodule

module module9
#(parameter param38 = (^(^(&(-((8'hac) || (8'haa)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire16,
                 wire15,
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
                 (1'h0)};
  assign wire15 = (((wire12 ^ ($unsigned(wire11) - $unsigned((8'hac)))) ?
                      wire11 : (((7'h42) ?
                              (wire10 ? wire14 : wire12) : $unsigned(wire10)) ?
                          wire11 : ((!wire14) & $unsigned(wire14)))) | $unsigned($unsigned($signed(wire11))));
  assign wire16 = {(~|$signed(wire11)), (^$unsigned((~&{wire11, wire11})))};
  always
    @(posedge clk) begin
      reg17 <= wire12[(4'hb):(4'h9)];
      if (wire15)
        begin
          reg18 <= $signed($unsigned(($signed((wire12 || reg17)) << ((-wire11) << (~|wire16)))));
        end
      else
        begin
          reg18 <= (^{{{reg17, (&(8'ha7))}, (+$unsigned(wire13))}});
          reg19 <= ($unsigned(wire15) ?
              $unsigned({(~^(-wire10)),
                  $unsigned((wire13 <= (8'ha0)))}) : wire13);
          reg20 <= ($signed(wire11[(1'h1):(1'h1)]) + (($unsigned(((8'had) ^~ wire16)) ?
                  (^~$signed(reg19)) : $unsigned($unsigned(wire11))) ?
              $signed(reg17[(3'h4):(1'h1)]) : reg18[(3'h4):(2'h3)]));
        end
      if ((^~((~^wire16[(1'h0):(1'h0)]) ?
          (-(&$unsigned(wire16))) : (wire13 && reg19))))
        begin
          reg21 <= {$unsigned(wire14[(2'h3):(2'h2)])};
          if ((&reg17[(2'h2):(1'h1)]))
            begin
              reg22 <= (8'h9d);
              reg23 <= $signed({(^~wire14[(1'h1):(1'h1)])});
              reg24 <= reg17[(3'h5):(1'h0)];
              reg25 <= wire15[(3'h7):(3'h4)];
            end
          else
            begin
              reg22 <= $signed((^~(8'ha8)));
              reg23 <= ({{wire15[(5'h13):(4'h8)],
                      (~&$unsigned(reg19))}} | (wire11[(2'h2):(1'h0)] ?
                  wire15 : reg21));
              reg24 <= {((wire13[(3'h6):(3'h5)] && {(~&reg18), (!reg24)}) ?
                      ((&(8'ha5)) <<< ((wire16 | wire10) != $signed(wire10))) : wire11[(2'h2):(1'h0)])};
            end
          reg26 <= (($signed((+reg20[(2'h2):(1'h1)])) ?
                  $signed(($unsigned(reg23) ?
                      wire16 : wire13[(2'h2):(1'h0)])) : (((8'h9c) ?
                      (reg23 == reg25) : wire12[(1'h1):(1'h0)]) ^~ $unsigned($unsigned(reg22)))) ?
              ((((^reg24) ? $signed(wire12) : ((8'hbe) || (7'h44))) - reg21) ?
                  $signed({(^(7'h44)),
                      {reg17}}) : reg25) : reg20[(4'h9):(3'h4)]);
        end
      else
        begin
          reg21 <= ((((wire11[(1'h0):(1'h0)] ?
                      $unsigned(wire16) : (wire11 * wire12)) ?
                  ($signed((7'h44)) ~^ (8'hac)) : $unsigned((|reg20))) > (((wire15 < wire11) == $signed(reg23)) ?
                  (+wire13[(3'h4):(2'h3)]) : reg26)) ?
              $unsigned(((^((7'h41) + wire16)) ?
                  $signed(reg18[(3'h4):(1'h0)]) : reg22)) : (+$unsigned($signed((reg24 ?
                  wire13 : (8'hbf))))));
        end
      reg27 <= $signed((-{{(^reg25)},
          ((~|wire15) ? $signed(reg22) : reg21[(1'h0):(1'h0)])}));
    end
  assign wire28 = $unsigned(wire14);
  assign wire29 = ((reg17 <= $signed((~|((8'hb9) ?
                      wire28 : reg23)))) > $signed($unsigned({$signed(reg26),
                      reg19})));
  assign wire30 = $unsigned(reg23[(3'h4):(3'h4)]);
  assign wire31 = wire16;
  assign wire32 = $unsigned($unsigned(wire28[(4'h8):(3'h7)]));
  assign wire33 = $unsigned(reg19);
  assign wire34 = {((^~((reg24 ? wire28 : (7'h44)) ?
                              (wire12 == wire32) : (wire30 ? reg27 : reg24))) ?
                          reg22 : ($unsigned({wire31}) ?
                              wire11[(1'h1):(1'h1)] : wire13))};
  assign wire35 = {(((wire32 ?
                          (wire32 ~^ wire33) : (wire31 ^~ reg25)) < $signed((~|reg19))) >= {(8'ha5)}),
                      $signed(wire31[(5'h10):(4'hc)])};
  assign wire36 = (wire13 >>> $signed($signed((wire11 ^~ (~&reg21)))));
  assign wire37 = (^~({wire29[(5'h10):(4'h8)],
                      (-(wire32 <= wire32))} != ({reg20[(3'h4):(2'h2)]} ?
                      $unsigned(wire33[(1'h0):(1'h0)]) : ({wire11, wire29} ?
                          (8'hb8) : (wire11 ? reg22 : reg27)))));
endmodule
