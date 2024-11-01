module top
#(parameter param57 = ((^{(((8'haf) ? (8'hbb) : (8'ha4)) ? ((8'ha0) - (8'hb4)) : {(8'hb3)})}) == (+((((7'h44) - (8'ha3)) ? ((8'ha7) ? (8'hb6) : (8'ha6)) : {(8'hab)}) <<< {((8'hb4) ? (8'hb6) : (8'hb2)), (~^(8'ha0))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned({($unsigned(wire1[(3'h4):(2'h3)]) < $unsigned((wire3 ?
                         wire0 : wire2))),
                     (^~((^~wire3) ?
                         (wire3 != wire0) : (wire0 ? (8'hb7) : wire3)))});
  module5 #() modinst49 (wire48, clk, wire2, wire3, wire1, wire0);
  assign wire50 = wire3[(4'h9):(1'h0)];
  assign wire51 = $signed((wire48[(2'h2):(1'h1)] - wire0));
  assign wire52 = $unsigned(($signed(wire50[(5'h10):(3'h4)]) ?
                      wire48 : {$unsigned({(8'ha2)}), (!{wire50, wire4})}));
  assign wire53 = wire3[(1'h1):(1'h1)];
  assign wire54 = {$unsigned($signed($unsigned($signed(wire3)))),
                      ($signed($signed($signed(wire53))) * ((!(wire0 >> wire2)) >> ((wire53 & (8'ha4)) <= (wire3 ?
                          wire51 : wire1))))};
  assign wire55 = ({wire4[(4'hb):(4'h9)]} ?
                      ((~wire48) - wire1[(1'h1):(1'h0)]) : {(^~wire48[(4'h9):(1'h0)]),
                          (~^wire0[(3'h5):(3'h4)])});
  assign wire56 = wire52;
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire10 = ($signed((~|(wire6[(1'h1):(1'h1)] || (wire7 ?
                      wire7 : wire8)))) ^~ (+$signed($unsigned(wire9[(4'hc):(1'h1)]))));
  assign wire11 = ({{{wire8, $signed(wire7)}},
                          (wire9 <<< ((wire7 << wire10) ?
                              wire8[(4'h8):(1'h1)] : wire9[(4'hb):(4'h9)]))} ?
                      (^({((8'haa) | wire9)} >= wire10)) : ((!({wire9, wire9} ?
                              wire8[(3'h5):(1'h0)] : (wire7 <<< wire6))) ?
                          wire10[(2'h2):(1'h1)] : (((wire10 ? wire10 : wire10) ?
                              $unsigned(wire9) : $unsigned(wire8)) >= wire7[(1'h0):(1'h0)])));
  assign wire12 = wire9;
  assign wire13 = (+(wire9 != $unsigned($signed((wire7 < wire11)))));
  assign wire14 = (wire8 ?
                      ($signed($signed((wire6 >= wire13))) || $signed((wire10[(1'h0):(1'h0)] || ((8'hbe) * wire9)))) : ($unsigned($signed(wire12)) < (!$unsigned($unsigned(wire10)))));
  assign wire15 = {$unsigned({$unsigned(wire10)})};
  assign wire16 = $unsigned((~&((((8'hae) ?
                      (8'hb8) : wire6) != wire10[(2'h2):(1'h1)]) > (((7'h40) < wire10) && (~|wire12)))));
  assign wire17 = (|$signed(wire15[(1'h1):(1'h1)]));
  assign wire18 = (wire6 ?
                      (^~{$signed((^~wire7))}) : ((((wire7 && wire13) == (wire16 ?
                          (8'hbc) : wire13)) - (wire11 <<< $signed(wire14))) || wire14[(4'hd):(2'h3)]));
  always
    @(posedge clk) begin
      reg19 <= (wire12 >= wire17);
      reg20 <= (^~(-(((wire6 ? wire9 : wire18) ?
          ((7'h40) ? wire13 : wire15) : wire10) << wire6)));
      reg21 <= (($unsigned((((8'hb7) ? wire9 : (7'h41)) ^ $unsigned(reg19))) ?
              wire12[(2'h3):(2'h2)] : (^$signed($signed(wire13)))) ?
          ((((wire8 ? wire7 : wire8) ? (~|wire13) : $unsigned(wire7)) ?
              $signed($unsigned(reg19)) : wire6) ~^ wire8[(3'h5):(3'h5)]) : ((~|{wire17}) ?
              wire17[(4'hd):(1'h1)] : (!(wire18 ?
                  (wire11 ? (7'h43) : reg19) : $unsigned(reg20)))));
      if (wire10[(1'h0):(1'h0)])
        begin
          reg22 <= ($signed(wire8[(4'hb):(3'h5)]) ?
              $signed(wire6) : wire18[(4'h9):(3'h4)]);
          if (($signed({(wire9[(5'h13):(2'h2)] | (wire6 ^~ reg22))}) ?
              $unsigned({wire15,
                  $signed($unsigned(wire14))}) : wire16[(4'h9):(2'h3)]))
            begin
              reg23 <= wire12[(2'h2):(2'h2)];
              reg24 <= $signed($unsigned(wire16));
              reg25 <= ($unsigned(((~^wire8[(3'h4):(2'h3)]) >= (^~((8'hbf) ?
                      wire17 : reg23)))) ?
                  ($signed(((^wire9) ^ $signed(reg22))) ?
                      reg22 : $signed(wire16[(1'h0):(1'h0)])) : $signed(wire9[(5'h11):(5'h11)]));
              reg26 <= (+(wire6[(1'h1):(1'h0)] ?
                  $unsigned($unsigned((wire10 <<< wire18))) : $signed((~&{wire9}))));
            end
          else
            begin
              reg23 <= wire10[(1'h0):(1'h0)];
              reg24 <= {wire16[(2'h2):(2'h2)],
                  {((&(-wire9)) - wire13[(3'h4):(3'h4)])}};
              reg25 <= $signed(wire10[(2'h2):(2'h2)]);
            end
          if ($unsigned(wire13[(4'hb):(1'h0)]))
            begin
              reg27 <= (|$signed($signed((reg25[(3'h7):(2'h2)] == wire15[(3'h5):(2'h2)]))));
            end
          else
            begin
              reg27 <= wire7[(3'h6):(3'h6)];
              reg28 <= $unsigned((&(|(&$signed((7'h43))))));
              reg29 <= (((^~(|(wire12 ?
                  reg20 : reg21))) & {wire10[(2'h3):(2'h3)],
                  wire6}) == (((~|$signed((8'hab))) ?
                  (8'hb4) : ((&(8'hac)) - (|reg25))) ^ wire15[(2'h2):(2'h2)]));
              reg30 <= $unsigned((wire16 >> (!$unsigned(reg28[(1'h0):(1'h0)]))));
              reg31 <= (^~(~&(wire14[(5'h14):(4'h9)] >>> $signed((wire16 != wire15)))));
            end
          reg32 <= wire14[(1'h0):(1'h0)];
          if (($signed(((~^(wire14 ? reg32 : reg22)) ?
                  $signed($unsigned(reg29)) : $signed((wire8 || reg29)))) ?
              {(wire12 << (~|wire16[(2'h2):(1'h1)])),
                  ((^~(!wire13)) ?
                      wire12 : $signed(reg32[(1'h0):(1'h0)]))} : (wire9 - (&$signed((reg28 || wire15))))))
            begin
              reg33 <= $unsigned({(wire8 > wire13)});
              reg34 <= $unsigned($unsigned((((reg29 ?
                  (8'ha4) : (8'hb0)) <<< (reg29 ?
                  (8'hbc) : reg21)) >>> (+wire10))));
              reg35 <= $signed($unsigned((^(8'hba))));
            end
          else
            begin
              reg33 <= reg25[(2'h3):(2'h2)];
              reg34 <= $unsigned((|(-(((8'ha0) ? wire13 : wire18) ?
                  (7'h44) : (^~reg30)))));
              reg35 <= reg31[(3'h7):(3'h6)];
              reg36 <= $signed($unsigned($signed((~&reg34[(2'h2):(1'h0)]))));
            end
        end
      else
        begin
          reg22 <= ({$signed($signed($signed(wire17))),
              ({$unsigned(reg24),
                  (~^(8'ha5))} >= $signed($signed((8'ha0))))} ^~ reg29);
          reg23 <= {(~^$unsigned({(-reg24), $unsigned((8'hb2))})), wire18};
        end
      reg37 <= wire10[(2'h3):(2'h3)];
    end
  assign wire38 = (reg31 ?
                      (~|$unsigned((wire6 <<< (reg33 ?
                          wire11 : reg31)))) : (+(^(wire16[(4'ha):(1'h1)] >>> $signed(reg31)))));
  assign wire39 = {wire16[(4'h9):(3'h6)], wire14[(4'hc):(1'h0)]};
  assign wire40 = reg37[(1'h0):(1'h0)];
  assign wire41 = (+wire16[(4'ha):(3'h4)]);
  assign wire42 = wire11;
  always
    @(posedge clk) begin
      reg43 <= $unsigned((8'ha6));
      reg44 <= $signed($signed(reg19[(1'h1):(1'h0)]));
      reg45 <= (reg31 >>> ({reg23} & reg23[(4'ha):(4'ha)]));
      reg46 <= (wire15 >> {$unsigned((~^{reg33})), wire17});
      reg47 <= (reg33 ?
          reg28[(2'h3):(2'h2)] : ((reg21[(1'h0):(1'h0)] ?
                  $signed((+reg45)) : reg37) ?
              $unsigned($unsigned(((8'had) | (8'hac)))) : (|{$unsigned(reg32)})));
    end
endmodule
