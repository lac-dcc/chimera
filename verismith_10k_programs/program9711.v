module top
#(parameter param75 = {{(((~&(7'h42)) & ((8'hae) ? (8'ha7) : (8'haf))) ? (!(~^(8'hb1))) : (((8'hbd) && (8'hbc)) == (-(8'ha3)))), ((^{(8'hb6), (8'ha9)}) <<< (((8'hb2) ? (8'ha1) : (8'ha3)) <<< (~&(8'ha4))))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire70;
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  assign y = {wire74, wire5, wire70, reg73, reg72, (1'h0)};
  assign wire5 = wire4[(1'h0):(1'h0)];
  module6 #() modinst71 (.y(wire70), .wire10(wire3), .wire9(wire5), .wire8(wire0), .wire7(wire2), .clk(clk), .wire11(wire4));
  always
    @(posedge clk) begin
      reg72 <= (wire4 > $signed((-$signed((wire3 ? wire0 : wire5)))));
      reg73 <= ({($unsigned(wire2[(3'h4):(1'h1)]) | $signed((wire0 ?
              wire0 : reg72))),
          wire70[(2'h2):(1'h0)]} > {wire1, (+$signed($signed(wire5)))});
    end
  assign wire74 = wire5[(1'h1):(1'h0)];
endmodule

module module6
#(parameter param68 = ({((~(~&(8'h9c))) + (((8'hba) ? (8'hb8) : (8'hba)) ? ((8'ha6) ? (8'ha3) : (8'hb7)) : ((8'h9e) >> (8'ha6)))), (|(-{(8'hbe), (8'hb7)}))} ? {({((8'hba) | (8'hb2))} ? ({(8'ha7)} || (^~(8'hb6))) : ((!(7'h42)) && ((8'hb2) ? (8'ha9) : (8'hb3)))), (8'hae)} : (((((8'had) ? (7'h43) : (7'h44)) <= (-(8'ha6))) << (^~(|(8'hae)))) > ((-((8'hbf) ? (8'h9e) : (8'ha2))) >= ((~&(8'hb9)) ? (!(8'h9f)) : (|(8'ha1)))))), 
parameter param69 = param68)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire40,
                 wire39,
                 wire37,
                 wire35,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg38,
                 (1'h0)};
  assign wire12 = wire9;
  assign wire13 = $unsigned((8'ha3));
  assign wire14 = wire10;
  assign wire15 = (wire14 ? wire10 : wire7);
  module16 #() modinst36 (wire35, clk, wire14, wire9, wire13, wire15);
  assign wire37 = wire7[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire35)
        begin
          reg38 <= $unsigned(((wire13 ? wire8 : $signed((~&(8'hb0)))) ?
              $signed((+{wire12})) : wire9[(1'h1):(1'h0)]));
        end
      else
        begin
          reg38 <= $signed(((wire37 <= ((wire14 ^ wire37) | wire10[(2'h2):(1'h1)])) ?
              (wire9 + $signed((reg38 ?
                  wire7 : (8'haa)))) : wire8[(2'h3):(2'h3)]));
        end
    end
  assign wire39 = wire8;
  assign wire40 = {(wire9[(4'hc):(4'hc)] ?
                          wire10 : $signed({(wire9 ? wire39 : wire35),
                              $signed(wire7)}))};
  always
    @(posedge clk) begin
      if (wire40[(1'h1):(1'h0)])
        begin
          reg41 <= (wire35[(4'h8):(3'h7)] >>> wire11);
          reg42 <= $unsigned($unsigned((|$unsigned(reg41))));
          reg43 <= wire14;
          reg44 <= (8'ha8);
        end
      else
        begin
          if ((+$signed(wire8)))
            begin
              reg41 <= reg41;
            end
          else
            begin
              reg41 <= ($unsigned(reg43) == (8'hbe));
              reg42 <= (($unsigned(((|wire37) ^ {(8'hab),
                  wire13})) ^~ reg38) <= {$unsigned(reg43), wire15});
              reg43 <= {$signed($unsigned({$signed((8'hb4)),
                      (reg38 ? (8'hae) : wire11)}))};
            end
          reg44 <= (+(!wire13[(4'hf):(3'h4)]));
          reg45 <= (wire40[(1'h0):(1'h0)] >= (wire37 <= $signed(reg41)));
        end
      reg46 <= $signed({(~^reg41)});
      if ({($signed((7'h40)) >= ($unsigned($signed(wire15)) || wire39[(3'h5):(1'h1)])),
          reg38[(3'h7):(2'h3)]})
        begin
          reg47 <= (({$signed(wire37[(3'h4):(1'h1)]), wire14} | (8'h9e)) ?
              wire13[(1'h1):(1'h0)] : (&(!$unsigned({wire12}))));
          reg48 <= ($unsigned((wire13[(3'h7):(2'h3)] != ($unsigned(wire10) ?
                  (wire35 ? wire35 : reg43) : (wire40 + (8'hb7))))) ?
              (wire15[(1'h0):(1'h0)] || wire8[(1'h0):(1'h0)]) : reg41[(1'h0):(1'h0)]);
        end
      else
        begin
          reg47 <= wire11;
        end
    end
  always
    @(posedge clk) begin
      reg49 <= ($signed(((-(reg47 << wire14)) ^ ($unsigned(reg43) ?
              reg43 : wire8))) ?
          wire10[(4'h9):(2'h2)] : (~^$unsigned($unsigned((wire7 ?
              wire13 : reg43)))));
      reg50 <= {$unsigned((((!(8'hbe)) ?
              $signed(reg42) : wire35[(3'h4):(1'h1)]) || ((reg46 && wire8) >>> wire7[(3'h7):(3'h6)]))),
          (~&$unsigned($signed((7'h42))))};
      if ((((reg48 ^~ reg49[(2'h2):(1'h1)]) ?
          ($unsigned((&wire12)) ?
              reg48 : $unsigned($unsigned(wire35))) : wire8) <= ({{(8'hb9),
              (wire35 >= reg41)}} <<< ((wire13[(3'h6):(2'h2)] & $signed((8'hbe))) ?
          $unsigned($unsigned(reg46)) : ((reg43 <= wire8) && {reg44,
              wire40})))))
        begin
          reg51 <= (reg38 ~^ $signed($unsigned(($unsigned(reg38) <= reg41))));
        end
      else
        begin
          reg51 <= wire40[(1'h0):(1'h0)];
          if (((!$unsigned(($unsigned(wire39) ?
              reg47 : (reg38 > (8'ha5))))) <= $signed($unsigned($unsigned(reg46[(2'h2):(2'h2)])))))
            begin
              reg52 <= wire35;
              reg53 <= $signed((({$signed(wire13)} * (reg51[(4'hd):(1'h0)] ?
                  (wire7 != wire12) : wire13)) || reg51[(1'h0):(1'h0)]));
              reg54 <= reg50[(2'h2):(1'h1)];
              reg55 <= reg54[(4'he):(3'h4)];
            end
          else
            begin
              reg52 <= reg54;
              reg53 <= $signed($signed(((^$unsigned(reg43)) >>> reg42[(3'h4):(3'h4)])));
              reg54 <= ($unsigned($signed(reg43)) ?
                  wire40[(1'h0):(1'h0)] : wire14[(4'he):(3'h7)]);
              reg55 <= wire39[(3'h5):(3'h4)];
            end
          reg56 <= $unsigned($signed(((reg46 >>> (reg47 ? wire9 : reg38)) ?
              $signed({wire35}) : (reg48 ? $unsigned(reg50) : reg38))));
          if (wire12[(5'h14):(3'h5)])
            begin
              reg57 <= wire39;
              reg58 <= ($unsigned(reg56) * ((~$unsigned({wire11})) <<< (^wire35[(5'h10):(3'h6)])));
              reg59 <= (-(((wire40 + ((8'h9e) < reg46)) || $signed((wire35 ?
                      (8'hb6) : wire10))) ?
                  reg57 : (($signed(reg50) ? {wire10} : (wire37 && reg42)) ?
                      ((reg52 ? wire7 : wire8) ?
                          (reg38 ? (8'ha3) : (8'haa)) : ((8'ha4) ?
                              (8'hac) : wire8)) : $unsigned((reg54 ?
                          (8'hb4) : reg41)))));
              reg60 <= {wire39[(1'h0):(1'h0)]};
            end
          else
            begin
              reg57 <= {{((&(wire35 ~^ reg50)) << $signed($unsigned(wire14)))}};
              reg58 <= reg45;
            end
          reg61 <= $unsigned($signed($signed(((reg59 ?
              reg49 : reg44) << $unsigned((8'hb4))))));
        end
      reg62 <= (((~^$unsigned($signed(wire40))) ?
              ((((8'hb0) | reg49) >> $signed(reg45)) ?
                  wire37[(2'h3):(1'h1)] : wire10[(3'h6):(1'h0)]) : wire39[(1'h1):(1'h0)]) ?
          $unsigned((8'hbf)) : ($unsigned((^(wire7 ? (8'ha6) : wire8))) ?
              reg61[(3'h4):(3'h4)] : {$signed((reg41 * reg48)),
                  $signed((reg58 | reg49))}));
    end
  assign wire63 = (|wire9);
  assign wire64 = reg52[(2'h2):(1'h0)];
  assign wire65 = {reg46, (!reg60[(1'h1):(1'h0)])};
  assign wire66 = wire35;
  assign wire67 = wire40[(2'h2):(1'h0)];
endmodule

module module16
#(parameter param34 = {(((~|((8'hb4) ? (8'hac) : (8'haf))) ? ((8'hbd) < ((8'h9c) != (8'hbd))) : (((8'hbd) - (8'hbb)) + ((8'ha7) < (8'hbc)))) || {{(^~(8'h9e))}}), ((|({(8'haa)} ? {(8'hbe)} : ((8'hbb) ? (8'hb9) : (8'h9f)))) ? (((8'hae) == ((8'hb3) > (8'hb7))) ? (((8'ha3) ? (8'ha7) : (8'hba)) != (8'ha5)) : (^((8'ha1) ? (8'hbc) : (8'hb8)))) : {((+(8'hb5)) != ((8'hb7) ? (8'hb8) : (8'ha0)))})})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire21 = (wire18 || (wire18 ?
                      $unsigned((wire20[(1'h0):(1'h0)] ?
                          (|wire19) : {wire19})) : wire20[(2'h3):(2'h3)]));
  assign wire22 = (-({(wire19 != $signed(wire19)),
                      wire17} ^~ ((wire18[(4'hc):(3'h6)] ?
                      wire17[(3'h5):(3'h5)] : $unsigned(wire19)) == $unsigned($unsigned(wire20)))));
  assign wire23 = (wire22[(2'h3):(2'h3)] ?
                      {((~wire19[(4'hc):(1'h0)]) * $unsigned(wire21[(2'h3):(1'h0)]))} : ($signed({$signed(wire22),
                              wire21[(1'h1):(1'h0)]}) ?
                          wire18[(5'h11):(1'h0)] : $unsigned($signed($signed(wire20)))));
  assign wire24 = $signed(($signed($unsigned(wire23[(2'h2):(1'h0)])) ?
                      wire21 : $signed(((~&wire18) & $unsigned(wire23)))));
  assign wire25 = ((^~(!$unsigned((wire23 ? wire23 : (8'hb6))))) ?
                      {$signed((-wire22))} : (8'ha0));
  assign wire26 = (^~$signed((8'ha6)));
  always
    @(posedge clk) begin
      reg27 <= (~^$unsigned(wire19));
      reg28 <= wire22[(4'h9):(4'h9)];
      if (wire22)
        begin
          reg29 <= {$unsigned(wire21[(3'h4):(2'h3)]), wire17};
          reg30 <= ($signed(($signed(reg29) ?
                  (~wire24[(1'h1):(1'h1)]) : wire25[(4'hb):(4'h9)])) ?
              (~|wire26) : ($signed(wire24[(1'h0):(1'h0)]) ?
                  ((8'ha4) ?
                      $unsigned($unsigned(wire24)) : reg28) : $unsigned(((wire25 ?
                          wire26 : wire22) ?
                      $unsigned(reg28) : $unsigned(wire25)))));
        end
      else
        begin
          reg29 <= $unsigned(reg30);
        end
    end
  assign wire31 = wire24[(1'h1):(1'h0)];
  assign wire32 = {wire21, (&wire20)};
  assign wire33 = $signed((~&($signed({wire32, wire22}) ?
                      (^~wire32[(4'he):(4'h9)]) : (&$signed(reg30)))));
endmodule
