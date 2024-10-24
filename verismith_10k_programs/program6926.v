module top
#(parameter param68 = {(((((8'hb1) + (8'hba)) ? ((8'hb2) != (8'hbb)) : ((8'haf) <<< (8'ha3))) | (~{(8'ha2)})) ? ((((8'hb2) <<< (8'hb6)) & (!(8'ha0))) ? (~^((8'hb4) ? (7'h41) : (8'haa))) : (((8'hba) ? (8'ha4) : (8'hbc)) ? ((7'h41) == (8'hbe)) : ((8'hbe) ? (8'ha4) : (8'hb9)))) : (((7'h44) ? ((8'hba) >= (8'ha9)) : {(8'hb7), (8'hb3)}) ? (((8'hb6) == (8'hab)) ? (^(8'hab)) : (~&(7'h40))) : ((^~(8'hae)) ~^ ((8'ha6) ? (8'ha7) : (7'h40))))), ((((^(8'hbb)) ? (~^(8'hb1)) : {(7'h42), (8'hbe)}) ? (((8'hb9) ? (7'h42) : (8'hb2)) ? (|(8'hbb)) : ((7'h41) ? (8'hb9) : (7'h44))) : (((8'ha3) ? (8'ha3) : (8'h9c)) ? ((8'ha0) && (8'ha9)) : {(8'h9d), (8'hac)})) <<< (~(((8'hb6) || (8'ha4)) ? ((8'hb5) || (7'h42)) : (~(8'hab)))))}, 
parameter param69 = (8'ha5))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire64;
  assign y = {wire67,
                 wire66,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire64,
                 (1'h0)};
  assign wire5 = (wire3 ?
                     $unsigned((~&wire1[(3'h5):(3'h5)])) : {(8'hb6),
                         ($unsigned((wire3 >> wire4)) > wire0)});
  assign wire6 = ($unsigned($signed(((wire3 >= wire2) == wire5[(1'h1):(1'h0)]))) ?
                     (!(~{(~|wire3),
                         (~wire3)})) : $unsigned(wire3[(3'h4):(1'h0)]));
  assign wire7 = ((wire3 <<< $signed(($signed(wire1) >>> $signed(wire1)))) >> ({(~$unsigned(wire0))} >= (wire1 > ((!wire4) - wire4[(4'h8):(3'h4)]))));
  assign wire8 = ($signed((wire6[(1'h1):(1'h1)] ?
                         $signed((wire5 ? wire4 : wire3)) : (-wire4))) ?
                     ((|(wire5[(3'h5):(2'h2)] - (wire5 ?
                         wire5 : wire4))) - $unsigned((~|$signed(wire1)))) : $signed((wire3[(4'hc):(3'h6)] == {{(7'h43),
                             (7'h41)}})));
  assign wire9 = $signed($signed(wire2[(4'h9):(2'h3)]));
  module10 #() modinst65 (wire64, clk, wire6, wire4, wire2, wire8, wire3);
  assign wire66 = $unsigned(wire6);
  assign wire67 = wire8[(4'hb):(2'h3)];
endmodule

module module10
#(parameter param62 = ((+({(-(8'h9d))} ? (|((8'hb9) & (8'hb7))) : (~|{(8'hbb), (8'hbc)}))) ? (+(({(8'hb7)} ? {(8'hbf)} : (~|(8'ha7))) ? (((8'hb9) >>> (8'hbc)) ? ((8'hbb) ? (7'h44) : (7'h44)) : (~(8'ha8))) : {(~|(8'hb1)), (&(8'h9f))})) : (&(-(8'ha0)))), 
parameter param63 = (&param62))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire [(4'hb):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire27,
                 wire26,
                 wire25,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 reg24,
                 reg23,
                 reg22,
                 reg18,
                 (1'h0)};
  assign wire16 = ((!$signed(($signed(wire14) ?
                      (wire15 >> wire13) : $unsigned(wire13)))) - ($unsigned(wire12[(4'h9):(1'h1)]) ?
                      ((8'ha3) ?
                          $unsigned(wire11[(3'h7):(3'h6)]) : $signed(wire14[(1'h0):(1'h0)])) : wire12[(1'h1):(1'h0)]));
  assign wire17 = (~(~&(((7'h44) ?
                      $unsigned(wire14) : (wire12 ^~ wire14)) | $signed(((8'ha1) ?
                      wire11 : wire14)))));
  always
    @(posedge clk) begin
      reg18 <= $unsigned($unsigned((wire16 ?
          $unsigned(wire15[(4'hb):(1'h0)]) : wire15[(4'h8):(3'h7)])));
    end
  assign wire19 = $signed($unsigned($signed($unsigned(wire11))));
  assign wire20 = $unsigned((((wire16 & {wire14}) ?
                          (wire19[(1'h1):(1'h1)] ?
                              (wire16 << wire13) : $unsigned(wire19)) : (wire11 || (wire12 ?
                              wire12 : wire12))) ?
                      (^{$unsigned((8'hb4)), (wire12 || wire16)}) : wire19));
  assign wire21 = (~^wire17[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg22 <= wire21[(3'h7):(3'h5)];
      reg23 <= $signed($unsigned(((8'hb4) != reg18[(3'h4):(2'h2)])));
      reg24 <= $unsigned({$signed(($signed(wire11) ?
              (^(8'haa)) : ((8'hb3) << reg22))),
          $unsigned((~&((8'h9e) ? wire16 : wire20)))});
    end
  assign wire25 = $unsigned((-(wire12 > wire11[(2'h3):(1'h1)])));
  assign wire26 = $signed(wire21);
  assign wire27 = (^~(~^(8'h9f)));
  module28 #() modinst54 (wire53, clk, wire25, wire16, wire26, wire12);
  assign wire55 = (wire12[(3'h7):(3'h4)] ?
                      $signed(({(wire15 << wire17),
                          $unsigned((8'hba))} + ($signed((8'hbf)) ?
                          wire19 : (wire26 ?
                              reg23 : (8'hae))))) : $unsigned((8'hbc)));
  assign wire56 = $signed((((!wire15) ?
                      ($unsigned(reg24) >= wire11[(2'h3):(1'h1)]) : (~&(wire15 + wire15))) & wire53[(1'h1):(1'h0)]));
  assign wire57 = (~|$unsigned(wire16[(4'hb):(3'h7)]));
  assign wire58 = (^~wire19[(4'hd):(3'h4)]);
  assign wire59 = (($unsigned((~(wire25 ? wire58 : wire25))) ?
                      $unsigned({{reg23}}) : {$unsigned((8'hbe))}) | {(reg23 ^~ (+$unsigned(wire26))),
                      wire13});
  assign wire60 = wire16;
  assign wire61 = ((8'h9c) != wire16);
endmodule

module module28
#(parameter param51 = {(((^(~&(8'hbc))) <= ((8'h9d) ? {(8'hbe)} : (~^(8'hbb)))) ? {{{(8'hae)}, ((8'haa) != (8'ha9))}, {((8'had) ? (7'h43) : (7'h41)), (~^(8'ha0))}} : (+((8'hb2) ? ((8'hbf) != (7'h40)) : ((7'h44) + (8'hb3))))), (8'hac)}, 
parameter param52 = (!param51))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire33 = ($unsigned(wire32[(1'h0):(1'h0)]) ?
                      $unsigned((({wire31, wire29} ?
                              (wire31 ^~ wire32) : wire29[(4'ha):(3'h6)]) ?
                          wire32 : (~^$signed(wire31)))) : ({wire29} ~^ (wire29 <= wire31)));
  assign wire34 = ((8'hb4) >> wire31);
  assign wire35 = (&{$signed($unsigned($unsigned(wire33))),
                      {$signed($unsigned(wire29))}});
  assign wire36 = ($unsigned((wire29 + ($signed(wire34) ?
                      wire30[(4'hf):(3'h7)] : (wire29 + wire34)))) >> wire32);
  assign wire37 = $signed({wire34, $signed($unsigned($unsigned(wire33)))});
  assign wire38 = (&($signed($signed({wire32})) ?
                      ((~^(wire29 ? (8'haa) : wire37)) ?
                          wire37[(3'h7):(3'h5)] : $signed((wire34 ?
                              wire34 : wire30))) : {(~&$unsigned(wire31))}));
  assign wire39 = {{$signed((~(wire29 ? wire37 : wire35))),
                          $signed(wire35[(1'h1):(1'h1)])}};
  assign wire40 = (8'h9e);
  assign wire41 = (wire39[(1'h1):(1'h0)] ?
                      (wire40[(4'hb):(4'h9)] != (wire40 + (wire35[(5'h14):(4'hf)] > $unsigned(wire35)))) : {$unsigned(wire32[(3'h4):(2'h3)]),
                          $signed($unsigned(wire39[(3'h6):(2'h3)]))});
  always
    @(posedge clk) begin
      reg42 <= (~(~|($unsigned(wire33) ?
          wire34[(3'h7):(3'h7)] : (((7'h44) ~^ wire33) ?
              (|wire39) : (wire36 < wire41)))));
      reg43 <= (^~$signed((|$signed($unsigned((8'hba))))));
      reg44 <= $unsigned(wire29[(4'ha):(1'h0)]);
      if ($signed($signed(wire39)))
        begin
          reg45 <= ($signed(wire33[(4'ha):(4'h9)]) ^~ wire30[(5'h10):(3'h7)]);
        end
      else
        begin
          reg45 <= (wire36[(4'h8):(2'h3)] ^ (~|($signed(wire29) ?
              $unsigned((~&wire29)) : ($unsigned(wire38) - $unsigned(reg45)))));
          reg46 <= wire32[(4'h8):(1'h1)];
        end
    end
  assign wire47 = $unsigned(($signed(wire29) < wire39[(1'h0):(1'h0)]));
  assign wire48 = wire30[(3'h6):(1'h0)];
  assign wire49 = ($unsigned(wire35[(5'h11):(2'h2)]) > (wire35 + (-$unsigned((~|wire48)))));
  assign wire50 = (wire30 ^ ((^~reg44) ?
                      wire34 : ((reg44[(1'h1):(1'h1)] < wire34) ^~ (8'h9f))));
endmodule
