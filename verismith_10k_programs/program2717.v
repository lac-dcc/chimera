module top
#(parameter param95 = (((({(8'hb0), (8'hb4)} ? {(8'hb3)} : (|(7'h40))) ^~ (^((7'h42) ^~ (7'h42)))) - (((^(8'hb2)) ? ((8'had) | (8'hbf)) : ((8'hb0) < (8'haf))) ? ((~|(8'haf)) ~^ {(8'ha6), (8'h9d)}) : ((-(8'ha1)) == ((8'hbf) ? (8'h9d) : (8'hb8))))) << ((~^(+((8'ha6) ? (7'h42) : (8'hb7)))) > (({(8'ha9), (8'ha5)} ~^ ((8'hb3) ? (7'h44) : (8'hb7))) ? (((8'hb2) <= (8'haa)) ? {(8'hb2)} : ((8'ha6) == (7'h41))) : ({(8'hb9)} != (!(8'ha1)))))), 
parameter param96 = (((((param95 && param95) ? (-param95) : {param95, param95}) != {param95}) == ((param95 * ((8'ha5) ? (8'had) : param95)) ~^ (!{param95, param95}))) < param95))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  assign y = {wire90,
                 wire32,
                 wire31,
                 wire29,
                 wire5,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire5 = wire4[(3'h5):(2'h2)];
  module6 #() modinst30 (.wire9(wire0), .y(wire29), .clk(clk), .wire10(wire5), .wire8(wire4), .wire7(wire3));
  assign wire31 = ($unsigned(wire4[(2'h3):(2'h3)]) > (wire5 & (-(wire29 ?
                      (8'ha8) : (wire4 == wire0)))));
  assign wire32 = wire5;
  module33 #() modinst91 (.y(wire90), .clk(clk), .wire36(wire1), .wire35(wire29), .wire34(wire31), .wire37(wire4));
  always
    @(posedge clk) begin
      reg92 <= ($signed({{(wire1 ? wire5 : wire0), {wire5}}}) ?
          (|wire32) : (^~(7'h42)));
      reg93 <= (^~wire32);
      reg94 <= wire5[(4'hb):(3'h5)];
    end
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire37;
  input wire [(4'hd):(1'h0)] wire36;
  input wire [(5'h11):(1'h0)] wire35;
  input wire [(4'hd):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire51;
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire79,
                 wire77,
                 wire51,
                 reg81,
                 reg80,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire37[(3'h6):(3'h6)])
        begin
          reg38 <= {$signed($unsigned($signed((^~wire34))))};
        end
      else
        begin
          reg38 <= (|wire35[(2'h2):(1'h1)]);
          if ($signed(wire37))
            begin
              reg39 <= $signed($signed($signed($unsigned(wire34[(4'h9):(3'h7)]))));
            end
          else
            begin
              reg39 <= wire34[(4'h9):(3'h7)];
              reg40 <= ($unsigned(((7'h44) ?
                  $signed($signed((7'h42))) : (-(wire35 ?
                      wire35 : (8'hae))))) >= (+{{wire37[(4'hb):(1'h1)]},
                  (reg38 ? (~^reg38) : (wire37 && (8'had)))}));
              reg41 <= wire35;
            end
          if ((!(((wire35[(4'h9):(1'h0)] <= $signed(wire35)) ?
                  ((reg38 ? (8'haf) : reg41) ?
                      {reg40} : (wire36 ? reg38 : reg39)) : $signed(reg38)) ?
              {reg41[(5'h10):(3'h5)], wire36} : {{$signed(wire36),
                      $signed(wire34)},
                  ((^~wire37) ? (wire37 | (8'hb8)) : wire36)})))
            begin
              reg42 <= $signed($unsigned(reg39));
              reg43 <= $signed(wire37[(2'h2):(2'h2)]);
              reg44 <= reg43[(4'h9):(2'h2)];
              reg45 <= reg41[(4'ha):(3'h7)];
            end
          else
            begin
              reg42 <= {{((+$unsigned(reg39)) ?
                          $signed($unsigned(wire37)) : reg42[(3'h5):(3'h5)])}};
              reg43 <= $unsigned($unsigned(wire36));
              reg44 <= reg43;
              reg45 <= (reg45 <<< reg45);
            end
          reg46 <= (^~$unsigned((^~reg42)));
          reg47 <= wire34[(2'h2):(2'h2)];
        end
      reg48 <= wire36;
      reg49 <= (8'hb0);
      reg50 <= reg38;
    end
  assign wire51 = (-($signed({(reg43 ? reg43 : (7'h42)), $unsigned(wire35)}) ?
                      wire36[(1'h1):(1'h1)] : {(~&$unsigned(wire37)),
                          (wire35 <<< $signed(reg38))}));
  module52 #() modinst78 (wire77, clk, reg45, reg39, reg44, wire51, wire36);
  assign wire79 = (+$signed(reg48[(4'hc):(1'h1)]));
  always
    @(posedge clk) begin
      reg80 <= {(wire35[(4'hd):(4'h9)] & (reg47 | ((reg47 - reg45) ?
              $signed((8'ha3)) : $signed(reg46)))),
          reg46};
      reg81 <= ($unsigned((|reg80)) ?
          $unsigned(wire35) : (reg50 ?
              reg40 : $signed($signed(reg38[(2'h2):(1'h1)]))));
    end
  assign wire82 = reg41;
  assign wire83 = reg41[(4'hb):(3'h4)];
  assign wire84 = (wire51[(3'h7):(3'h7)] >= (7'h41));
  assign wire85 = {(^~reg46[(1'h1):(1'h0)])};
  assign wire86 = ($signed($signed((wire85[(1'h0):(1'h0)] ?
                          (~reg44) : (reg81 + wire35)))) ?
                      $unsigned((wire82[(1'h1):(1'h0)] & $unsigned((reg43 ?
                          reg80 : reg49)))) : reg38[(3'h4):(1'h1)]);
  assign wire87 = (-($signed({(reg43 < reg81)}) ?
                      (~|wire34[(2'h2):(1'h0)]) : {$signed(reg45)}));
  assign wire88 = $signed({wire86[(4'hb):(3'h4)],
                      ($signed(wire37) <<< reg43[(4'he):(4'ha)])});
  assign wire89 = (wire34 ?
                      (wire82[(3'h6):(2'h2)] <= (!$unsigned(wire35))) : wire83[(2'h2):(1'h1)]);
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  assign y = {wire27, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (wire8[(4'ha):(1'h1)] ^ {wire10[(2'h3):(1'h0)]});
  assign wire12 = wire11[(4'hd):(1'h0)];
  assign wire13 = (wire8[(5'h10):(3'h7)] | {($unsigned(((8'ha8) ^ wire10)) & wire8)});
  assign wire14 = wire13;
  assign wire15 = (~^wire11[(4'ha):(3'h5)]);
  module16 #() modinst28 (wire27, clk, wire7, wire15, wire12, wire13);
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  assign y = {wire26, wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire20;
  assign wire22 = wire21[(2'h2):(2'h2)];
  assign wire23 = $signed(wire21);
  assign wire24 = {(((^~wire21[(1'h1):(1'h1)]) ?
                              (~^(wire20 == wire17)) : wire20[(4'hc):(4'h8)]) ?
                          (wire23[(4'h8):(2'h3)] ?
                              $unsigned({wire21}) : wire22[(3'h4):(1'h1)]) : $signed(wire23[(3'h6):(1'h1)]))};
  assign wire25 = wire18[(4'ha):(4'h8)];
  assign wire26 = ($unsigned(((wire25[(3'h7):(3'h7)] ~^ wire24) ^~ (!wire21))) + ($unsigned({$signed(wire17)}) && wire25[(3'h5):(2'h3)]));
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire57;
  input wire signed [(4'ha):(1'h0)] wire56;
  input wire [(4'hf):(1'h0)] wire55;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire58;
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire61,
                 wire58,
                 reg76,
                 reg75,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire58 = {(((~|((8'h9c) ? wire57 : wire57)) ?
                          wire54[(2'h2):(1'h1)] : wire57) & {wire56[(1'h1):(1'h0)]}),
                      {($unsigned({wire57, wire55}) ?
                              $signed((wire57 * wire57)) : wire55)}};
  always
    @(posedge clk) begin
      reg59 <= ((((8'hae) & wire58[(4'ha):(3'h4)]) < (~|$unsigned((8'hbf)))) ?
          wire53 : $unsigned(((wire55 != {wire53, wire53}) ^~ {wire53})));
      reg60 <= (($signed((wire57[(3'h7):(3'h7)] > wire56)) ?
              (8'haf) : $signed($signed(((8'hbd) ~^ wire57)))) ?
          ((((wire54 >>> (8'ha6)) - {wire58}) ^ ((wire56 ?
                  wire55 : wire54) > (reg59 ? reg59 : reg59))) ?
              $unsigned(($signed(wire58) ?
                  {wire54,
                      wire55} : (wire57 != wire54))) : wire55[(4'hc):(4'h9)]) : wire56[(4'h8):(1'h0)]);
    end
  assign wire61 = {(&wire53),
                      ($unsigned($signed(wire53[(2'h3):(2'h3)])) ?
                          (~^(wire58[(2'h2):(1'h1)] + wire54[(1'h1):(1'h1)])) : wire56)};
  always
    @(posedge clk) begin
      reg62 <= wire57;
      reg63 <= ($unsigned($unsigned(wire53)) < $signed(((8'h9d) ?
          {$signed(reg62)} : ($unsigned(wire61) ?
              $signed(wire54) : $unsigned(wire56)))));
    end
  assign wire64 = wire58;
  assign wire65 = (wire54 ?
                      ((((wire61 & wire55) ?
                              (reg60 >= reg60) : $signed(wire64)) ?
                          wire61 : ((wire57 ?
                              wire57 : wire57) ~^ {reg60})) >= (^~wire55)) : ((((wire58 ?
                                  reg63 : reg60) ?
                              (&wire64) : wire58[(2'h3):(1'h1)]) * ($unsigned(wire55) & (wire58 ?
                              reg60 : wire54))) ?
                          $signed(($unsigned(reg60) ?
                              {wire53,
                                  wire53} : (!wire61))) : wire57[(4'hb):(4'hb)]));
  assign wire66 = ((wire53 ? wire64 : (8'h9e)) ?
                      $unsigned({wire61[(3'h5):(1'h0)]}) : {$unsigned($unsigned($unsigned(wire61)))});
  assign wire67 = ({($unsigned(wire56) - $unsigned(reg62[(3'h6):(3'h6)])),
                          (+$unsigned({reg59}))} ?
                      (wire64[(3'h4):(2'h3)] ^ reg60) : $signed($signed((wire66 << (~|wire54)))));
  assign wire68 = $unsigned($signed(wire65));
  assign wire69 = wire56[(4'ha):(3'h6)];
  assign wire70 = reg62;
  assign wire71 = reg59;
  assign wire72 = (!(wire66 ?
                      $signed($unsigned((~|wire66))) : ((8'h9d) << $signed((8'ha1)))));
  assign wire73 = {wire65,
                      ($unsigned((~wire64[(4'he):(4'ha)])) >>> ($signed($signed(wire69)) ?
                          $unsigned(reg62[(1'h1):(1'h1)]) : ($signed(reg59) ?
                              $signed(wire55) : wire71[(1'h0):(1'h0)])))};
  assign wire74 = wire64[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg75 <= (~&wire72);
      reg76 <= wire55;
    end
endmodule
