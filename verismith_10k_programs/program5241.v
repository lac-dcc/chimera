module top
#(parameter param69 = (8'ha1), 
parameter param70 = param69)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire62;
  assign y = {wire68, wire67, wire66, wire65, wire64, wire62, (1'h0)};
  module5 #() modinst63 (wire62, clk, wire1, wire3, wire4, wire2);
  assign wire64 = wire62;
  assign wire65 = $unsigned($signed($signed(wire64[(2'h3):(2'h2)])));
  assign wire66 = {$unsigned(wire3[(4'hc):(4'h9)]),
                      ((((wire1 ? wire3 : wire65) ?
                              (~^wire64) : wire62[(1'h0):(1'h0)]) >= ((wire3 ?
                              wire62 : wire64) | $signed(wire64))) ?
                          wire62 : wire64)};
  assign wire67 = ($unsigned((wire0 ?
                          ($unsigned(wire66) * wire4[(4'h9):(3'h4)]) : $unsigned((~|wire1)))) ?
                      (($signed((wire1 ? wire65 : wire4)) ?
                              ((wire62 ^~ wire4) ?
                                  (wire2 >= (8'hab)) : wire65[(4'h9):(4'h9)]) : (wire1[(3'h5):(1'h1)] || (~(8'haf)))) ?
                          ((^wire4) | ((~^wire3) ?
                              (8'ha5) : {wire1})) : wire65[(4'ha):(1'h0)]) : ($unsigned($signed((wire0 ?
                              (8'ha5) : (8'ha1)))) ?
                          {$unsigned({(8'hba), wire2})} : wire1));
  assign wire68 = (~^(~(-{wire67, {wire62}})));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  assign y = {wire61,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire10 = (^~(^~wire8[(2'h3):(2'h2)]));
  assign wire11 = ($unsigned($unsigned((8'hb8))) ~^ wire8);
  assign wire12 = wire7;
  assign wire13 = wire6;
  assign wire14 = $signed(wire10);
  assign wire15 = $unsigned((wire13[(2'h3):(1'h1)] ?
                      wire10[(3'h4):(1'h0)] : {(wire12[(4'he):(4'hb)] ?
                              wire7 : {wire11, wire6}),
                          wire14}));
  assign wire16 = (~|wire10[(1'h0):(1'h0)]);
  assign wire17 = wire7[(1'h1):(1'h1)];
  assign wire18 = (($signed(wire11[(2'h3):(1'h0)]) ?
                      wire6[(1'h1):(1'h1)] : {(^~{wire12, wire6}),
                          ({(7'h40)} ?
                              wire15[(3'h5):(2'h3)] : (wire6 ?
                                  wire6 : (8'ha0)))}) && $unsigned(wire13));
  assign wire19 = (wire17 == $unsigned(wire10[(2'h2):(1'h1)]));
  assign wire20 = $unsigned($signed(wire11[(3'h6):(2'h2)]));
  module21 #() modinst52 (wire51, clk, wire13, wire12, wire6, wire11);
  assign wire53 = wire7[(3'h5):(2'h2)];
  assign wire54 = wire10;
  assign wire55 = (((~|{wire16[(3'h4):(2'h2)], {wire20}}) ?
                      $unsigned({((8'hac) ? wire53 : wire54),
                          ((7'h42) ? wire15 : wire6)}) : (-$signed({wire7,
                          wire19}))) != (~^(({wire17} ?
                          (wire19 ? wire19 : wire15) : wire12[(4'h9):(2'h3)]) ?
                      ($unsigned((8'ha4)) ?
                          (|(8'hbf)) : wire12[(1'h1):(1'h0)]) : wire20)));
  assign wire56 = wire10[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg57 <= wire55[(4'hd):(3'h7)];
      reg58 <= wire6;
      reg59 <= wire55[(2'h3):(2'h3)];
      reg60 <= ($unsigned(($unsigned(wire17) ?
              $unsigned({wire55}) : $signed(wire8[(3'h5):(1'h1)]))) ?
          ((|wire15[(3'h6):(2'h3)]) >> ((wire7[(1'h1):(1'h1)] ^ $signed(wire56)) >>> (reg58[(4'hb):(3'h7)] << (wire56 * wire16)))) : (!{(|wire16[(2'h3):(1'h1)])}));
    end
  assign wire61 = $signed(wire17);
endmodule

module module21
#(parameter param49 = ((({((8'hae) ? (8'ha8) : (8'hbf))} ? (+((7'h40) ? (8'hbc) : (8'h9d))) : (^(~&(8'ha1)))) ? ((((8'haf) ? (8'hae) : (8'ha5)) ? ((8'ha1) >= (8'hb9)) : ((8'ha5) ? (7'h44) : (8'ha7))) ^ {((7'h44) <<< (8'hbe)), ((7'h42) ? (7'h44) : (8'hb5))}) : ((~|((8'ha3) == (8'hae))) - (&(8'hb7)))) ^~ (!(({(8'h9e)} << ((8'haf) ? (8'ha2) : (8'haa))) ? ((^~(8'ha7)) ? ((8'hb1) ? (8'h9f) : (7'h44)) : (^~(8'hba))) : (~^((7'h44) ? (8'hb0) : (7'h43)))))), 
parameter param50 = ((((~|(|param49)) - param49) - (((param49 < param49) ? ((8'hb5) ? param49 : param49) : param49) ^ {{param49, param49}, param49})) || (^(((~^param49) || param49) <= param49))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire37,
                 wire36,
                 wire35,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire26 = ($signed((~&((!(8'hb9)) <= wire24))) ?
                      (!$unsigned(wire23)) : ((wire22[(5'h10):(1'h1)] - wire24[(2'h2):(1'h0)]) ?
                          wire25[(3'h7):(3'h5)] : $signed($signed($unsigned(wire24)))));
  assign wire27 = wire25[(2'h2):(2'h2)];
  assign wire28 = (({wire25[(3'h5):(3'h5)], wire22} ?
                      $unsigned(wire25) : $signed($unsigned((~(8'hb3))))) ^ $signed(wire26[(3'h7):(3'h5)]));
  assign wire29 = wire24[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg30 <= (wire22[(3'h7):(2'h2)] ~^ {$unsigned((wire24[(2'h3):(1'h0)] ^~ $unsigned((8'hbd))))});
    end
  always
    @(posedge clk) begin
      reg31 <= $signed(wire22);
      reg32 <= (7'h41);
      reg33 <= wire24;
      reg34 <= (wire25 - (8'ha2));
    end
  assign wire35 = reg31[(3'h7):(2'h2)];
  assign wire36 = wire29;
  assign wire37 = wire24;
  always
    @(posedge clk) begin
      reg38 <= (reg34 ? (^~wire36) : $signed(wire35));
      if (wire25[(3'h6):(3'h5)])
        begin
          reg39 <= $unsigned(({$signed((&reg30))} ?
              (((wire27 > wire36) ^ (&wire24)) > {$unsigned(reg33)}) : wire24[(3'h4):(3'h4)]));
          reg40 <= (8'hbb);
        end
      else
        begin
          reg39 <= ({wire29[(1'h0):(1'h0)], wire25[(4'h8):(3'h5)]} ?
              {((wire25 << (^~(8'h9e))) >= $signed($signed(wire26)))} : {$unsigned((reg39 ?
                      wire28[(1'h1):(1'h0)] : wire37)),
                  (~^wire25[(3'h6):(1'h1)])});
          reg40 <= (~^wire29[(4'h9):(3'h4)]);
          if ($signed($unsigned(wire35)))
            begin
              reg41 <= (wire22[(3'h7):(1'h1)] > (8'h9f));
              reg42 <= ((wire35 ? reg34 : (-(~$unsigned(reg30)))) ?
                  (8'ha5) : reg34);
              reg43 <= (~&$unsigned((8'hbd)));
            end
          else
            begin
              reg41 <= (-reg34[(2'h3):(2'h3)]);
              reg42 <= wire29;
              reg43 <= reg38[(4'h8):(3'h4)];
            end
          reg44 <= (^~(wire24[(1'h0):(1'h0)] < ((|$signed(wire28)) ?
              ({reg30} ~^ (~|wire27)) : (~|(wire26 ? wire28 : (8'haa))))));
        end
      reg45 <= (~|wire27);
      reg46 <= reg32;
    end
  assign wire47 = wire37;
  assign wire48 = ({(^~reg43[(3'h4):(2'h3)])} >>> wire24[(1'h0):(1'h0)]);
endmodule
