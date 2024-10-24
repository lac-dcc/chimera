module top
#(parameter param62 = ((&((|{(7'h40), (8'ha8)}) ? (8'ha9) : (~|(7'h44)))) ? ((^~(^~(~^(8'hb6)))) > ((((8'hb6) ? (8'hb9) : (8'ha5)) ? ((8'ha0) ? (8'haa) : (8'hb3)) : ((8'h9d) - (8'ha7))) <= {((8'ha4) ? (8'hb5) : (8'ha0)), ((8'hb7) * (8'hb6))})) : (((!{(8'haf)}) ? (((8'h9d) <= (8'hbf)) - ((8'h9f) ~^ (7'h44))) : (((8'ha1) ? (8'ha9) : (8'hb3)) ? ((8'ha0) <= (8'h9c)) : ((8'ha5) ? (8'ha2) : (8'ha3)))) || {(((8'hb3) ? (8'hb5) : (8'hb5)) ? ((8'hae) ? (8'hb1) : (8'hbe)) : (-(8'hac)))})), 
parameter param63 = (^~(~^(-((~param62) <<< param62)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire38;
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  assign y = {wire60,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire38,
                 reg44,
                 (1'h0)};
  assign wire5 = $signed(wire4);
  assign wire6 = $unsigned(wire0);
  assign wire7 = ($signed($unsigned($signed((wire6 ?
                     wire2 : wire5)))) <<< $unsigned({(~$signed(wire2)),
                     (^$signed(wire4))}));
  assign wire8 = (!$unsigned({wire4, wire7[(1'h1):(1'h1)]}));
  assign wire9 = $signed($signed(((wire0 ? wire7 : {wire3, wire1}) ?
                     {wire8[(1'h0):(1'h0)]} : wire1[(2'h3):(1'h0)])));
  assign wire10 = {wire4[(1'h1):(1'h0)],
                      $signed($signed((((8'hb7) <<< wire4) ?
                          (!wire4) : (wire2 ? wire9 : wire0))))};
  assign wire11 = ($unsigned(wire8) < (($signed((+wire4)) >>> wire10[(3'h4):(1'h1)]) ?
                      $signed({wire2, wire0}) : (&wire9[(1'h0):(1'h0)])));
  assign wire12 = wire11;
  module13 #() modinst39 (wire38, clk, wire2, wire11, wire9, wire8, wire6);
  assign wire40 = $unsigned(wire2);
  assign wire41 = $unsigned(((wire1[(3'h5):(1'h0)] >= ($unsigned(wire0) ?
                      $signed(wire2) : (~|wire6))) > $unsigned($unsigned($signed(wire2)))));
  assign wire42 = $unsigned((wire12[(4'h8):(3'h4)] ?
                      $unsigned(wire8[(3'h5):(1'h1)]) : wire1[(3'h7):(1'h0)]));
  assign wire43 = ((+$unsigned({(wire40 >>> wire38),
                      (wire8 ?
                          wire2 : wire3)})) + (~^$signed($unsigned($unsigned(wire11)))));
  always
    @(posedge clk) begin
      reg44 <= wire6[(4'hd):(3'h6)];
    end
  assign wire45 = (wire3[(3'h7):(2'h2)] ^ {$signed($unsigned({wire7, wire43})),
                      (8'ha8)});
  module46 #() modinst61 (wire60, clk, wire0, wire4, wire8, wire7);
endmodule

module module46
#(parameter param59 = (((^~({(7'h40), (8'hb9)} ? ((8'hab) ? (8'h9c) : (8'hb5)) : ((7'h42) & (8'hbd)))) ? {((&(8'hae)) ? ((8'ha0) ~^ (8'ha8)) : (&(8'haf))), (^~((8'h9e) >>> (7'h43)))} : ((+(+(8'hae))) ? (((8'hbc) || (8'h9d)) ? ((8'hb1) * (8'ha7)) : ((8'hbd) >>> (8'ha3))) : ({(8'hb6), (8'ha5)} ? ((8'ha6) ? (8'had) : (8'h9c)) : ((7'h40) ? (7'h42) : (8'ha3))))) > ({(~(~(8'hba))), ({(8'hb1), (8'ha3)} ? ((7'h42) + (8'h9d)) : {(8'ha9), (8'ha1)})} ? (-{{(8'hac), (8'hb9)}, ((8'hb9) | (8'ha1))}) : ({(8'hb5), ((8'hb0) << (7'h40))} ? ((^~(8'hbc)) ? {(7'h40), (8'ha9)} : (~^(8'hb6))) : (+((8'ha0) ~^ (7'h44)))))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire50;
  input wire [(4'hf):(1'h0)] wire49;
  input wire signed [(4'h9):(1'h0)] wire48;
  input wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg51 <= ($unsigned($signed(wire48)) ?
          wire47[(3'h5):(3'h5)] : $signed($unsigned($signed($unsigned(wire49)))));
      reg52 <= (^(^wire50));
      reg53 <= ($signed({(&$unsigned(reg51))}) - (wire50[(3'h5):(2'h2)] ?
          ((+wire49) & $signed($signed(reg52))) : wire48[(3'h5):(3'h4)]));
      reg54 <= (-wire49[(2'h2):(2'h2)]);
      reg55 <= reg54;
    end
  assign wire56 = reg54;
  assign wire57 = ($signed(({(wire56 >>> reg52), $signed(wire49)} ?
                      (^(8'hb5)) : (|(8'ha4)))) & reg54[(3'h7):(1'h1)]);
  assign wire58 = {(!{wire47}),
                      (^~((reg53[(1'h0):(1'h0)] <<< $signed((8'hbd))) <= $unsigned((8'ha3))))};
endmodule

module module13
#(parameter param37 = ((^{((8'ha8) * ((8'hb6) ? (8'ha0) : (8'hb2))), ((&(8'hab)) ? ((8'ha2) ? (8'hbb) : (8'hbb)) : ((8'ha6) ? (8'h9f) : (8'hae)))}) || (({((8'ha1) ? (8'hbd) : (8'ha2)), ((8'hb3) ? (8'h9c) : (8'ha3))} ? (((8'hb0) ? (8'ha5) : (8'hb7)) ? (~(7'h42)) : ((8'ha6) | (8'hb5))) : (-{(8'hb8), (7'h43)})) > (8'h9e))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire27;
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire36,
                 wire32,
                 wire27,
                 reg35,
                 reg34,
                 reg33,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned({$signed(wire16)}))))
        begin
          reg19 <= wire16;
          reg20 <= (wire18[(1'h1):(1'h1)] ?
              $unsigned($unsigned(($signed(wire17) ?
                  (!wire16) : wire14))) : (|$signed($signed($signed(wire14)))));
          reg21 <= $signed(((-wire18[(5'h11):(4'hb)]) > ($unsigned((wire15 ?
                  wire15 : wire16)) ?
              {$signed(wire14)} : ((&wire15) != ((8'hb5) ? wire18 : wire16)))));
          reg22 <= ($unsigned((-(wire18 >> ((8'hae) <= reg21)))) < reg21);
          if ((-{(^wire18)}))
            begin
              reg23 <= (reg19 ?
                  $unsigned((wire15[(4'h9):(2'h3)] ?
                      wire14 : ((&reg22) != {(8'hb2), wire14}))) : (reg21 ?
                      {wire17[(3'h6):(3'h4)]} : {(7'h40)}));
              reg24 <= ((($signed($signed(reg20)) ?
                          $unsigned(reg21) : (&(reg22 ? reg20 : wire15))) ?
                      $unsigned(reg19[(4'h8):(2'h3)]) : wire18[(3'h6):(3'h6)]) ?
                  $unsigned((-$signed($unsigned(reg23)))) : ($signed((wire16 & (8'haf))) ?
                      wire18 : wire16));
            end
          else
            begin
              reg23 <= (reg21[(2'h2):(2'h2)] ?
                  $unsigned((reg24 ?
                      wire14[(1'h1):(1'h1)] : (wire16[(4'he):(3'h6)] ~^ (8'h9f)))) : $unsigned(reg21));
              reg24 <= {(~&wire18)};
              reg25 <= ($unsigned((wire17[(2'h3):(2'h3)] ?
                      $unsigned(reg24[(2'h3):(2'h3)]) : ((reg24 ?
                          reg21 : wire18) && (wire14 ? (8'hb1) : reg20)))) ?
                  wire15[(4'he):(4'hb)] : wire18);
            end
        end
      else
        begin
          reg19 <= (((({wire18} ? (|wire18) : reg20) != $unsigned((wire18 ?
                  reg19 : wire18))) ?
              reg22 : ((~|(wire17 ? reg25 : reg20)) ?
                  ((reg22 | reg21) - reg19) : wire18)) <= ($unsigned($signed((reg19 ^ reg22))) ?
              {(reg21[(1'h1):(1'h0)] ?
                      (wire16 >>> reg20) : $unsigned(wire15))} : (~^$unsigned((reg23 ^~ reg22)))));
          reg20 <= (8'hb6);
        end
      reg26 <= (($unsigned((wire16 >= wire18[(5'h12):(4'ha)])) ?
              $signed(($signed(reg23) <<< (wire18 ?
                  (8'ha4) : (8'hb1)))) : (~{reg25[(4'hc):(4'ha)], (~&reg20)})) ?
          (~($unsigned(reg25[(3'h5):(2'h3)]) != (~^(8'ha8)))) : $signed(wire16[(1'h1):(1'h1)]));
    end
  assign wire27 = $unsigned($signed(((wire14[(4'hc):(4'h8)] ?
                          (wire14 ? wire17 : reg23) : (~reg20)) ?
                      $signed(reg23) : (wire14 & (-wire16)))));
  always
    @(posedge clk) begin
      reg28 <= reg21[(1'h0):(1'h0)];
      reg29 <= ((7'h41) ? reg28 : reg22);
      reg30 <= reg26;
      reg31 <= ($unsigned($unsigned((~(^~(8'ha7))))) ?
          reg23[(3'h6):(1'h0)] : (~(wire17[(5'h12):(4'hf)] ~^ reg24[(3'h4):(2'h2)])));
    end
  assign wire32 = $signed(reg22[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg33 <= $signed((8'hbb));
      reg34 <= $unsigned((7'h41));
      reg35 <= reg21[(1'h1):(1'h0)];
    end
  assign wire36 = $unsigned((~&$unsigned((~|(~(8'h9d))))));
endmodule
