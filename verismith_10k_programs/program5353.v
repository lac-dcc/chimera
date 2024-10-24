module top
#(parameter param34 = ({(&(((8'ha2) >= (8'ha1)) ? (~|(8'hb9)) : {(8'h9d)}))} ~^ ((({(8'hb1)} ? {(8'ha5), (7'h42)} : ((7'h43) > (8'ha5))) - (~^(8'hb5))) ? ((((8'ha5) ? (8'ha8) : (8'ha9)) && {(8'h9d), (8'hbb)}) ^ (((8'ha8) != (8'hb3)) ? (~^(8'hbd)) : ((8'ha0) | (8'hb9)))) : {((&(8'ha2)) ? ((8'ha5) ? (8'hac) : (8'ha7)) : (7'h41)), (((8'ha8) || (8'h9f)) << ((8'hbb) < (8'ha7)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire32;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire10, wire32, (1'h0)};
  assign wire5 = $unsigned($signed(wire0));
  assign wire6 = $unsigned(wire4[(3'h7):(2'h2)]);
  assign wire7 = ($signed(wire6[(3'h4):(2'h2)]) ?
                     $signed(((^~(8'ha8)) ?
                         ((8'h9f) >> wire4[(3'h6):(3'h6)]) : wire3[(3'h6):(1'h0)])) : {(~^$signed((-wire0)))});
  assign wire8 = $unsigned({{(^(wire4 ~^ wire5)), wire5[(1'h1):(1'h0)]},
                     (($signed(wire2) ?
                         wire4[(3'h7):(2'h3)] : wire4) << ((wire6 ?
                         wire6 : wire1) & (wire6 >>> (8'ha8))))});
  assign wire9 = (^~({$signed((~|wire6))} & ((^$signed(wire2)) <<< wire3)));
  assign wire10 = $signed($unsigned((((wire4 ? wire3 : wire6) ?
                          wire7[(3'h7):(1'h0)] : (wire3 + wire8)) ?
                      (|wire1) : wire2[(4'ha):(2'h2)])));
  module11 #() modinst33 (wire32, clk, wire6, wire7, wire5, wire3, wire10);
endmodule

module module11
#(parameter param31 = {({((8'haf) && ((8'ha9) <= (8'h9d))), {((7'h40) ? (8'hb0) : (8'had))}} ? ((~((8'h9f) ? (8'haf) : (8'hb7))) ? (((8'hb3) ? (8'ha0) : (8'hb8)) < ((8'hb3) ? (8'h9d) : (8'ha5))) : (((8'hae) ? (8'hbb) : (8'ha7)) ^~ ((8'hac) ^ (8'hbb)))) : {{(~&(8'hb5))}, ({(8'hab), (8'had)} ? ((8'ha4) >>> (8'had)) : ((8'hbc) << (7'h44)))})})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire18,
                 wire17,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = ((~|$signed((((8'ha6) > wire14) >>> wire16[(1'h1):(1'h0)]))) ?
                      $unsigned((wire12[(3'h5):(1'h0)] | wire13)) : wire16[(2'h2):(2'h2)]);
  assign wire18 = (8'hba);
  always
    @(posedge clk) begin
      if ((wire17 ?
          $unsigned(wire17) : ($unsigned($signed({wire12,
              wire13})) <= ($unsigned($signed(wire18)) || (&$unsigned((8'hab)))))))
        begin
          reg19 <= wire16;
          reg20 <= wire12[(4'ha):(3'h4)];
          reg21 <= $unsigned(({$signed((wire18 & wire13)),
                  ($unsigned(wire15) || (reg19 | wire16))} ?
              (~|(~&(wire14 ^~ (8'h9d)))) : wire18[(2'h2):(1'h0)]));
          reg22 <= {((+(~^wire17)) ^ ((^{reg19, wire15}) ?
                  ($signed(wire18) ?
                      $unsigned(wire16) : $signed((8'hb7))) : (reg20[(2'h3):(2'h3)] ?
                      ((8'hbd) ~^ wire13) : reg20))),
              wire13[(1'h1):(1'h1)]};
          reg23 <= $signed($unsigned((wire16[(2'h3):(2'h3)] ?
              wire12[(2'h2):(1'h1)] : (reg20[(3'h6):(2'h2)] ?
                  (wire16 ? reg22 : wire18) : {wire17}))));
        end
      else
        begin
          reg19 <= ((($unsigned((!reg20)) ?
                  {(!reg22), (!(8'h9f))} : (8'hb7)) << wire12[(3'h4):(2'h2)]) ?
              (~^wire18[(2'h2):(1'h0)]) : ($unsigned($unsigned(reg23[(3'h6):(2'h3)])) ?
                  (reg20 ?
                      ({reg21, (8'hb6)} ?
                          $unsigned(reg19) : $signed(reg19)) : ((wire14 ?
                          wire16 : wire14) > $unsigned((8'hbf)))) : wire15));
          reg20 <= $unsigned($unsigned(wire14));
          reg21 <= $signed(($unsigned((wire18 ?
                  reg22[(2'h3):(2'h3)] : wire18)) ?
              ($unsigned(reg20[(2'h3):(1'h0)]) ?
                  wire13[(4'h9):(3'h5)] : $unsigned($unsigned(reg22))) : ($unsigned($signed(wire17)) >>> wire17[(3'h4):(2'h3)])));
        end
      reg24 <= $signed((^~(~^$signed((&wire13)))));
      reg25 <= reg23;
      reg26 <= {$unsigned($signed((~^((8'ha3) ? (8'ha2) : wire15)))),
          ($unsigned(($signed(reg22) == (reg21 ? reg25 : reg23))) ?
              ((|wire15[(2'h3):(2'h2)]) || $unsigned($signed(wire17))) : ($signed(((8'hac) >>> (8'hb7))) ?
                  $unsigned(wire12) : wire12[(3'h6):(3'h5)]))};
    end
  assign wire27 = ((^~reg19) ? reg25[(4'h8):(4'h8)] : wire12[(2'h3):(2'h3)]);
  assign wire28 = reg19[(3'h4):(1'h0)];
  assign wire29 = $unsigned($signed(wire15));
  assign wire30 = ($signed($unsigned(wire14[(1'h1):(1'h0)])) ^ (wire16[(3'h7):(3'h4)] ?
                      (((wire27 ? (8'ha2) : (8'ha1)) ?
                          (+wire14) : $signed(reg19)) < $unsigned($unsigned(wire17))) : wire29[(2'h2):(2'h2)]));
endmodule
