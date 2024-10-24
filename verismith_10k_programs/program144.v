module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  assign y = {wire89,
                 wire87,
                 wire16,
                 wire5,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire5 = $unsigned((wire3[(3'h4):(2'h2)] + wire1[(3'h5):(3'h4)]));
  module6 #() modinst17 (.clk(clk), .wire9(wire2), .y(wire16), .wire10(wire4), .wire7(wire3), .wire8(wire0));
  module18 #() modinst88 (.wire19(wire0), .wire20(wire16), .wire21(wire1), .clk(clk), .y(wire87), .wire22(wire2));
  assign wire89 = (^~wire3);
  always
    @(posedge clk) begin
      reg90 <= $unsigned($unsigned(($signed(wire16[(4'he):(3'h6)]) ?
          ($unsigned(wire89) ^~ (-(8'hb6))) : $unsigned({wire0}))));
      if ($signed((^(|wire4))))
        begin
          reg91 <= $signed($unsigned(wire16[(5'h12):(4'ha)]));
          reg92 <= reg91;
        end
      else
        begin
          reg91 <= ($signed(reg92[(4'h8):(4'h8)]) ?
              (wire89[(2'h2):(1'h0)] ?
                  wire1 : (8'hb8)) : ($signed((|(-wire2))) || ($signed((~wire0)) ?
                  wire3 : $unsigned((reg90 ? wire89 : wire2)))));
          reg92 <= {(~^$unsigned(reg92))};
        end
      reg93 <= ($signed(($unsigned((wire89 - wire5)) == $unsigned((^~reg92)))) & $signed(wire3));
      reg94 <= $signed(reg93[(5'h13):(5'h12)]);
    end
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire34,
                 wire32,
                 wire24,
                 wire23,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg33,
                 (1'h0)};
  assign wire23 = {wire19[(3'h4):(2'h3)]};
  assign wire24 = ($signed($signed(wire21)) & wire22);
  always
    @(posedge clk) begin
      reg25 <= $unsigned($unsigned((~(|(+wire21)))));
      if (wire20[(5'h10):(1'h0)])
        begin
          reg26 <= $signed((-(-$unsigned((!wire24)))));
          reg27 <= ($unsigned(wire20) ?
              wire20[(2'h2):(1'h0)] : $unsigned((wire22 ?
                  $signed((wire23 ? wire24 : wire21)) : (~|$signed((8'hae))))));
          reg28 <= {wire22[(3'h5):(3'h5)]};
        end
      else
        begin
          reg26 <= (&({{wire20}, wire22[(2'h3):(1'h1)]} ?
              reg27[(3'h4):(2'h3)] : (&$unsigned(reg27))));
          reg27 <= {((($unsigned((7'h40)) && wire20[(2'h2):(2'h2)]) ?
                      wire24[(4'he):(3'h7)] : ((8'hbd) != wire19[(1'h0):(1'h0)])) ?
                  $signed(reg26[(2'h3):(2'h2)]) : {$unsigned(((8'ha8) ?
                          (8'haf) : reg28))})};
          reg28 <= $signed(wire20);
          reg29 <= {reg25};
          reg30 <= $unsigned((+(^~$unsigned(wire24[(3'h5):(1'h1)]))));
        end
      reg31 <= reg28[(2'h3):(2'h2)];
    end
  assign wire32 = $signed(($unsigned($signed($signed(reg31))) ?
                      $signed(reg31) : $signed(reg27[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg33 <= $unsigned($unsigned($signed((8'h9d))));
    end
  assign wire34 = (!$unsigned(((reg31[(3'h6):(3'h4)] << (reg28 <= reg28)) ?
                      (((8'hbe) ? reg30 : reg26) >> (~|reg25)) : ({wire20,
                          reg33} + $signed(reg31)))));
  module35 #() modinst76 (wire75, clk, reg25, wire19, wire23, reg30, reg33);
  assign wire77 = $unsigned((($unsigned(wire23[(4'hf):(3'h6)]) && {(wire34 ?
                              reg30 : (8'ha8)),
                          $signed(reg29)}) ?
                      reg31[(5'h12):(3'h4)] : reg26));
  assign wire78 = $signed($unsigned($signed($unsigned({(7'h43), reg27}))));
  assign wire79 = $unsigned($signed($signed(reg29)));
  assign wire80 = (reg30[(5'h14):(5'h10)] ^ reg29);
  assign wire81 = (wire20[(4'h9):(4'h8)] + ((8'hb6) >>> {wire79,
                      wire20[(3'h7):(2'h2)]}));
  assign wire82 = $unsigned({((8'haa) ?
                          (wire22 ?
                              ((8'hb0) ?
                                  reg31 : wire32) : wire32[(3'h6):(3'h6)]) : $unsigned($signed(reg28))),
                      reg27[(1'h1):(1'h0)]});
  assign wire83 = (wire21[(4'hb):(3'h4)] - {($unsigned((reg27 ~^ reg27)) - ((-(8'h9d)) ?
                          wire32[(1'h1):(1'h1)] : (reg25 ? (8'haf) : reg29)))});
  assign wire84 = (($unsigned((-(wire83 > reg33))) ?
                      $signed((!$unsigned(wire78))) : wire32) >= (|$unsigned((~wire20))));
  assign wire85 = {($unsigned($unsigned((wire32 << (7'h43)))) ?
                          ($signed(wire75) >> wire75[(3'h4):(1'h1)]) : $unsigned($unsigned((&wire32))))};
  assign wire86 = (~&(&wire32[(3'h6):(2'h2)]));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  assign y = {wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = wire9;
  assign wire12 = (~^wire8);
  assign wire13 = wire9;
  assign wire14 = $signed(($signed($unsigned((wire9 ?
                      wire12 : wire8))) << wire9));
  assign wire15 = (wire8[(1'h1):(1'h1)] || $unsigned($unsigned(wire7[(3'h4):(2'h3)])));
endmodule

module module35
#(parameter param73 = ((~^((((7'h43) + (8'hba)) ? (!(8'hbc)) : (~^(8'ha5))) ? (((8'ha2) ? (8'ha5) : (7'h41)) ? ((7'h41) ? (8'ha7) : (8'haf)) : ((8'hae) ? (8'h9c) : (8'hae))) : {((8'ha9) ? (8'hb0) : (8'hbf)), {(8'hb3)}})) ? (!(|(-(~&(8'had))))) : ({((^~(8'ha9)) ? ((8'ha0) ? (8'h9d) : (7'h43)) : ((8'hb5) < (8'hb2)))} ? (&{((8'haf) ? (8'ha7) : (8'ha9))}) : ((&((8'hab) ? (8'ha2) : (8'hbd))) ? (^(~^(8'hbd))) : (^(^~(8'hbd)))))), 
parameter param74 = ((+param73) ? (~&(8'hb8)) : ({(param73 && param73)} ? param73 : (((^param73) > (param73 << param73)) ? ((param73 ? param73 : (8'h9f)) << (~|param73)) : param73))))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire38;
  input wire signed [(4'hc):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  assign y = {wire72,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg55,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= {({((wire40 || wire37) * (wire39 >= wire36))} ?
              (((wire37 | wire36) ? ((7'h41) ? wire36 : (8'hb6)) : wire38) ?
                  ((wire39 && wire37) < {wire38}) : wire40) : (~|((wire38 ?
                      wire38 : wire38) ?
                  $unsigned(wire40) : $unsigned(wire38)))),
          (^wire37[(3'h5):(1'h1)])};
      if ((~reg41[(2'h2):(2'h2)]))
        begin
          reg42 <= ($signed((|($unsigned(wire36) >> $unsigned(wire39)))) ?
              $signed(({(8'hb9)} >>> (&$signed((8'hbd))))) : (8'ha1));
          reg43 <= $unsigned({$signed(((~^(8'hb8)) <<< (wire39 ?
                  wire38 : wire40)))});
        end
      else
        begin
          reg42 <= $signed(wire39[(2'h2):(2'h2)]);
          if ($unsigned((8'ha7)))
            begin
              reg43 <= (8'h9c);
              reg44 <= ((wire37 ?
                  ((wire36[(3'h5):(3'h4)] ^ (^(8'h9d))) ^ (&(reg41 || reg43))) : reg42) >> reg43);
              reg45 <= reg41;
              reg46 <= ($signed($signed({$signed(wire39)})) >> reg44[(1'h0):(1'h0)]);
            end
          else
            begin
              reg43 <= (reg46[(4'h8):(3'h4)] - ((^$unsigned(reg42[(4'hc):(4'h9)])) ?
                  $signed($signed(wire38)) : (wire37 ? (!reg42) : reg41)));
            end
        end
    end
  always
    @(posedge clk) begin
      reg47 <= reg45;
      reg48 <= wire39;
      reg49 <= {{(wire39[(4'h8):(1'h1)] >> ((reg43 ?
                  reg46 : (7'h42)) ^ $unsigned(reg47)))},
          {reg48[(1'h1):(1'h1)],
              ((reg42 + (wire38 ? reg44 : reg44)) ?
                  ((7'h44) - $unsigned(reg47)) : ($signed(reg43) ^ reg44[(3'h5):(3'h4)]))}};
      if ($unsigned((8'hb5)))
        begin
          reg50 <= ({(((reg45 ? reg41 : reg44) ?
                      $unsigned(wire36) : (wire39 ? (8'hbe) : (8'h9e))) ?
                  (8'hba) : wire38)} - (($unsigned((reg45 + reg48)) ?
                  reg46[(3'h7):(2'h3)] : (!{(8'hb6), wire37})) ?
              $unsigned(($signed(reg42) == $signed(reg41))) : $signed(reg42[(5'h12):(2'h3)])));
          reg51 <= $signed($signed($signed(reg47[(1'h1):(1'h1)])));
        end
      else
        begin
          reg50 <= (&(!reg50[(3'h5):(2'h2)]));
        end
      reg52 <= wire39;
    end
  assign wire53 = reg45[(4'he):(4'ha)];
  assign wire54 = (8'hae);
  always
    @(posedge clk) begin
      reg55 <= $signed(reg42[(4'hf):(3'h6)]);
    end
  assign wire56 = ($signed((+$unsigned({wire53,
                      wire38}))) & (!((&reg42) > ((wire39 > wire54) ?
                      (&reg48) : wire38))));
  assign wire57 = $unsigned($signed((8'hb8)));
  assign wire58 = ((((7'h43) >= wire56[(4'hb):(1'h0)]) ~^ ({reg41,
                              (reg44 ? reg44 : wire37)} ?
                          $signed($unsigned(reg50)) : $unsigned($signed(reg43)))) ?
                      (reg50 < {($unsigned(reg42) > {wire57})}) : $signed((reg51 ?
                          ($signed((8'ha6)) ?
                              (~|reg52) : $signed(wire37)) : (^~wire37[(1'h1):(1'h1)]))));
  assign wire59 = $unsigned(((|wire54[(1'h0):(1'h0)]) | $signed((&reg51[(3'h5):(3'h4)]))));
  assign wire60 = $signed(reg51[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg61 <= (8'hb4);
      reg62 <= ((^wire37) ? reg51[(1'h0):(1'h0)] : wire56);
      reg63 <= $unsigned((($signed(wire58[(3'h5):(2'h3)]) != wire57) == ($signed((reg46 >>> (8'ha9))) <<< (((8'h9f) ^~ reg45) == reg42))));
      if (($unsigned((!(+$signed(reg45)))) ?
          $unsigned($signed(reg41)) : wire60))
        begin
          if ({$signed(reg45), $unsigned((~^wire37[(3'h6):(1'h1)]))})
            begin
              reg64 <= (((^reg47[(1'h1):(1'h1)]) + (8'ha7)) ~^ ({((~^wire40) ?
                          reg51 : reg49),
                      $signed(reg51[(3'h6):(3'h6)])} ?
                  reg43 : (wire59[(2'h2):(1'h0)] & (~^(reg44 && wire57)))));
              reg65 <= (wire56[(4'h8):(3'h7)] ?
                  (+$unsigned(((8'ha9) < $signed(reg64)))) : ((^wire40[(1'h1):(1'h1)]) < reg63));
              reg66 <= ((!(~(&((8'hb7) ?
                  wire56 : reg51)))) == wire59[(4'hd):(4'ha)]);
            end
          else
            begin
              reg64 <= $signed((~|(({wire37, reg62} < wire38) ^~ (^~reg50))));
              reg65 <= (8'ha0);
              reg66 <= (wire37 && {$unsigned($unsigned(reg46[(4'h8):(4'h8)])),
                  wire36});
              reg67 <= reg45[(1'h0):(1'h0)];
            end
          reg68 <= $unsigned(reg46);
        end
      else
        begin
          reg64 <= $signed(reg55);
          reg65 <= $unsigned({(|{(reg62 ? wire53 : reg41)}),
              (((reg68 + reg67) ? (&reg63) : wire38) ?
                  {$unsigned(reg50),
                      $unsigned(reg66)} : $signed(wire56[(1'h0):(1'h0)]))});
          if ((reg46 || ($signed($signed((reg45 ?
              wire37 : (8'hb9)))) >>> reg68)))
            begin
              reg66 <= ($unsigned($signed($unsigned(reg52[(2'h2):(1'h1)]))) ?
                  (((~reg47) - reg68[(4'h9):(4'h8)]) - (reg50 ?
                      wire60 : $unsigned($signed(wire58)))) : $signed($signed({(reg42 ?
                          reg51 : wire40),
                      (reg64 & wire39)})));
              reg67 <= reg68[(4'hc):(3'h5)];
              reg68 <= $unsigned(reg63);
              reg69 <= (wire54[(1'h0):(1'h0)] ?
                  $unsigned((~|$signed($signed(reg46)))) : $unsigned(reg44));
              reg70 <= ((reg65[(4'h8):(3'h7)] ?
                  $unsigned(wire39) : ($unsigned($unsigned(reg47)) * ((reg68 ?
                      reg52 : reg49) >= (~^reg55)))) >>> (reg41 ~^ wire40));
            end
          else
            begin
              reg66 <= $signed(((((~^reg47) ?
                          wire40[(3'h6):(2'h2)] : (reg42 ? reg65 : reg41)) ?
                      (7'h42) : ((wire58 > reg47) & reg69[(2'h3):(1'h1)])) ?
                  reg41 : $signed(((~^reg63) ?
                      (wire56 == reg46) : wire60[(5'h11):(3'h4)]))));
              reg67 <= $signed($signed((reg48 ?
                  (~&(wire38 ?
                      reg69 : (7'h40))) : $signed(reg66[(2'h2):(2'h2)]))));
              reg68 <= $unsigned($unsigned((&$signed(reg62))));
            end
          reg71 <= {({reg66, $unsigned((reg51 ~^ wire60))} <<< (wire40 ?
                  (^~(wire56 | reg48)) : {(wire59 && (8'hb4))}))};
        end
    end
  assign wire72 = $signed(((+$unsigned(reg45[(3'h5):(3'h4)])) <<< {(8'hbf)}));
endmodule
