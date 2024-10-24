module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire4,
                 reg5,
                 (1'h0)};
  assign wire4 = {wire0};
  always
    @(posedge clk) begin
      reg5 <= wire0;
    end
  module6 #() modinst79 (wire78, clk, wire2, wire3, reg5, wire1, wire0);
  assign wire80 = $unsigned((~|wire4[(2'h2):(1'h0)]));
  assign wire81 = wire78[(4'ha):(4'h9)];
  assign wire82 = $unsigned(($unsigned(wire3[(5'h13):(3'h4)]) >= (~wire1[(4'hc):(1'h1)])));
  assign wire83 = wire3[(5'h12):(4'hf)];
  assign wire84 = (((!wire78[(4'hb):(3'h5)]) ?
                      {(^~reg5),
                          wire0[(4'h9):(4'h8)]} : (&((wire2 >>> wire83) ^~ (-wire82)))) ^~ (wire3 ?
                      wire83[(3'h5):(1'h1)] : {wire78, $signed(wire80)}));
  assign wire85 = wire83[(1'h0):(1'h0)];
endmodule

module module6
#(parameter param76 = ((~(((~&(8'h9d)) != ((8'h9c) ? (8'hbd) : (8'h9d))) ? (((8'ha6) - (8'hb0)) - ((7'h44) ? (8'ha1) : (8'h9f))) : ((|(8'hb3)) - ((8'ha9) ? (8'h9d) : (8'ha7))))) >>> (({(~^(7'h42))} * (&((8'h9d) ? (8'hac) : (8'h9f)))) ? ({((8'ha1) ? (8'h9d) : (8'h9e)), (8'hae)} ? {((8'hb3) >= (8'hbb))} : ({(8'hba), (8'h9e)} ? (^(8'hbd)) : ((8'ha7) ? (8'h9d) : (7'h41)))) : {(((7'h40) && (7'h44)) ? ((8'ha2) ? (8'ha5) : (8'hb5)) : (~(8'ha8))), (((8'hb4) ? (8'h9d) : (8'hbc)) ? (~|(8'haa)) : ((8'ha4) ^~ (8'ha2)))})), 
parameter param77 = ((|(~^param76)) <= (~|(((!param76) | param76) ? (~|{(7'h42), param76}) : (+(7'h41))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire12;
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire12,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire12 = wire11[(3'h4):(2'h3)];
  module13 #() modinst57 (wire56, clk, wire9, wire8, wire11, wire10);
  assign wire58 = wire11[(1'h1):(1'h1)];
  assign wire59 = $unsigned({($signed(wire9[(4'hc):(2'h3)]) ~^ ($unsigned(wire10) ?
                          (^wire58) : (wire56 != wire56)))});
  assign wire60 = (^(wire59[(4'he):(3'h5)] & (^~wire56[(4'hf):(4'hc)])));
  assign wire61 = (8'hb0);
  assign wire62 = (((((wire56 ? wire11 : wire10) ^~ {wire9}) ?
                          ((^~wire8) >= $signed(wire7)) : {(wire58 ?
                                  wire11 : (8'ha2)),
                              (~^(8'ha6))}) ^~ {(&(wire12 >= wire10))}) ?
                      wire10[(5'h12):(4'ha)] : $signed($unsigned(wire8)));
  always
    @(posedge clk) begin
      reg63 <= wire11;
      if ($unsigned($signed(wire61[(3'h6):(3'h4)])))
        begin
          reg64 <= {wire58[(3'h5):(2'h3)], $signed((~&(^~(~|wire7))))};
          reg65 <= wire60[(1'h0):(1'h0)];
          reg66 <= $signed({wire56});
          reg67 <= $signed((wire61[(3'h7):(3'h7)] ?
              wire60 : $unsigned(wire9[(5'h14):(5'h14)])));
        end
      else
        begin
          reg64 <= {wire11[(2'h3):(2'h3)]};
          reg65 <= wire61[(3'h4):(1'h1)];
          if (wire61[(3'h7):(1'h0)])
            begin
              reg66 <= ($signed(reg66) ^~ $unsigned(wire12));
              reg67 <= (+reg66);
              reg68 <= wire12;
              reg69 <= wire60[(1'h0):(1'h0)];
            end
          else
            begin
              reg66 <= $unsigned($unsigned((wire60[(1'h0):(1'h0)] ?
                  wire58 : $signed($unsigned(reg67)))));
              reg67 <= ((|$signed($signed($signed(reg64)))) ?
                  ((8'ha7) ?
                      (~^{reg63}) : {(wire12 ^ (wire12 - wire62))}) : (~|(wire61 != (reg65 ?
                      (wire58 > wire62) : (reg65 ? wire58 : (8'hab))))));
              reg68 <= (-$unsigned($unsigned($signed($signed(wire60)))));
              reg69 <= (wire8 ?
                  $signed(wire11[(3'h7):(3'h5)]) : ($unsigned({{wire11}}) & {reg64[(4'h9):(4'h8)]}));
            end
          reg70 <= $signed(wire59);
          reg71 <= reg63[(1'h1):(1'h0)];
        end
      reg72 <= $unsigned(wire8);
      reg73 <= (reg65 <<< ((reg72[(1'h0):(1'h0)] ?
          ({wire59, wire58} < wire9) : (~reg72[(5'h11):(4'hd)])) != (reg71 ?
          {(&reg71), reg72} : wire10)));
    end
  assign wire74 = wire12;
  assign wire75 = wire10[(4'hc):(1'h1)];
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg51,
                 reg45,
                 reg44,
                 reg43,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg29,
                 reg28,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= (~&wire15[(2'h3):(2'h3)]);
      if ($unsigned(wire15[(2'h3):(2'h3)]))
        begin
          reg19 <= wire16[(2'h2):(1'h0)];
          if ($signed($unsigned($signed(($unsigned(wire16) < $signed((8'haa)))))))
            begin
              reg20 <= ($unsigned($signed(((wire17 ^~ wire17) * (reg19 ?
                      wire16 : wire16)))) ?
                  wire15[(3'h4):(1'h1)] : (~wire15));
              reg21 <= ($unsigned($unsigned((wire14 ?
                  {reg18,
                      wire15} : $unsigned(reg19)))) >> wire17[(2'h2):(1'h1)]);
              reg22 <= wire14;
              reg23 <= (|$unsigned((~&((reg19 ? reg22 : wire14) ?
                  wire15[(3'h5):(3'h4)] : {wire17, reg18}))));
            end
          else
            begin
              reg20 <= {(wire17 ?
                      (^((wire16 ? reg22 : wire14) ?
                          (~&reg20) : reg20[(2'h3):(2'h3)])) : ($signed((&wire16)) ?
                          {$signed(reg18)} : $unsigned(reg19)))};
              reg21 <= reg21;
              reg22 <= wire14;
              reg23 <= $unsigned(($signed({$unsigned(wire14)}) ?
                  wire16[(3'h6):(3'h6)] : $signed(reg19)));
              reg24 <= $signed($unsigned(reg21[(2'h3):(2'h3)]));
            end
          reg25 <= reg20;
          reg26 <= $unsigned(((~|(~^(reg22 ?
              reg20 : wire17))) ~^ {(reg19[(1'h1):(1'h1)] <= {reg24}),
              ((~reg21) ^ wire15[(1'h0):(1'h0)])}));
        end
      else
        begin
          reg19 <= reg24;
        end
      reg27 <= reg26[(4'h8):(1'h0)];
      reg28 <= wire14;
      reg29 <= (((wire14[(5'h12):(2'h3)] == (reg24[(2'h3):(2'h2)] ?
                  (~&reg25) : reg25[(3'h4):(1'h1)])) ?
              reg23 : reg27[(4'h9):(1'h1)]) ?
          ($unsigned(((^~reg24) ?
              (7'h43) : reg26)) << (7'h41)) : (reg25 >>> $signed((reg22 ?
              (8'h9d) : (reg28 >>> (8'h9e))))));
    end
  assign wire30 = {{wire17}};
  assign wire31 = reg29[(3'h5):(3'h4)];
  assign wire32 = $unsigned((~^(~^(+(reg22 ? reg20 : reg21)))));
  assign wire33 = (({({reg20, reg20} ?
                              $signed((8'hac)) : {reg28})} <= (~&($unsigned(wire31) >= (reg26 ?
                          reg25 : wire16)))) ?
                      {(((wire17 << (8'ha1)) || wire32[(1'h1):(1'h0)]) || (^~$signed(wire14))),
                          {reg22}} : $unsigned((&(wire17[(4'he):(4'hb)] + wire17))));
  assign wire34 = $unsigned($signed(wire32));
  always
    @(posedge clk) begin
      reg35 <= {((!($signed(reg19) >> (8'ha2))) * reg25)};
    end
  assign wire36 = $signed((8'hbc));
  assign wire37 = wire33;
  always
    @(posedge clk) begin
      reg38 <= ((8'ha1) >>> reg18[(1'h0):(1'h0)]);
      reg39 <= wire33;
      reg40 <= wire17;
    end
  assign wire41 = (~&reg20[(1'h0):(1'h0)]);
  assign wire42 = (($signed(wire31) ? $unsigned(reg24) : wire32) ?
                      reg25[(4'hb):(3'h4)] : {wire30[(1'h1):(1'h0)]});
  always
    @(posedge clk) begin
      reg43 <= reg25[(2'h2):(2'h2)];
      reg44 <= {(~|reg19), $unsigned(wire17[(3'h5):(1'h0)])};
      reg45 <= $unsigned(wire15);
    end
  assign wire46 = (-($unsigned(($unsigned(reg28) && reg22)) ?
                      $signed($unsigned(reg18)) : reg39));
  assign wire47 = reg18[(2'h3):(2'h3)];
  assign wire48 = ((reg26[(3'h7):(3'h5)] ^ (^~$signed($unsigned((8'h9c))))) ?
                      (reg18 * wire47[(5'h12):(5'h12)]) : ($unsigned(reg40) < {reg45,
                          ({reg45, wire34} ?
                              $unsigned(reg28) : (reg23 ? reg27 : (8'h9d)))}));
  assign wire49 = $unsigned(reg38);
  assign wire50 = $unsigned({$unsigned(reg18[(2'h2):(1'h0)])});
  always
    @(posedge clk) begin
      reg51 <= (reg21[(3'h4):(1'h0)] >> ($signed(reg39) ?
          $unsigned(((reg19 || (8'h9d)) ?
              reg25 : {wire17})) : (^~(reg21[(3'h6):(2'h2)] ?
              reg19[(1'h0):(1'h0)] : wire36[(4'hc):(4'h9)]))));
    end
  assign wire52 = ($signed({$unsigned({wire50, wire31})}) ?
                      $signed($unsigned($unsigned($unsigned((8'ha6))))) : reg40[(3'h4):(1'h0)]);
  assign wire53 = (7'h42);
  assign wire54 = (wire32[(1'h1):(1'h1)] * $signed(wire52));
  assign wire55 = (((^reg40) ?
                          (|(^((8'ha8) ?
                              (8'ha2) : wire54))) : ($unsigned({reg25,
                                  (8'hb9)}) ?
                              $unsigned(reg28[(1'h1):(1'h0)]) : (reg44[(5'h11):(1'h1)] ?
                                  {(7'h42)} : ((8'hb7) ? (8'h9d) : reg39)))) ?
                      ($signed((((8'ha1) - wire46) ?
                          (|reg20) : wire42)) <<< (+reg43)) : {$signed(((wire31 ?
                              wire15 : reg40) | wire53[(4'hc):(4'ha)]))});
endmodule
