module top
#(parameter param181 = (((((^~(8'hbf)) ^ ((8'ha9) ? (8'hb8) : (8'ha6))) << ({(8'hac)} << ((8'ha8) <<< (8'hb4)))) ? (~^{(~(8'hbd)), (~(8'haa))}) : (+{(7'h40), ((7'h41) ? (8'hab) : (8'hb3))})) ? ((~|(&((8'ha7) ? (7'h44) : (8'haf)))) ? ({((8'hab) ? (8'ha0) : (8'ha7))} ? ({(7'h43)} ^~ ((7'h43) ? (8'hb6) : (7'h44))) : (+((8'hb5) | (8'ha2)))) : (~|(((8'h9d) ? (8'h9e) : (8'hb7)) << ((8'ha7) < (7'h44))))) : (^((8'hbc) <<< {((8'hb9) < (7'h41)), ((7'h42) ? (7'h40) : (8'had))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire180;
  wire [(5'h12):(1'h0)] wire176;
  wire signed [(4'he):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire155;
  wire [(4'hd):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire165;
  wire [(5'h11):(1'h0)] wire166;
  wire [(5'h14):(1'h0)] wire167;
  wire [(5'h13):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire173;
  wire signed [(2'h2):(1'h0)] wire178;
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  assign y = {wire180,
                 wire176,
                 wire73,
                 wire75,
                 wire155,
                 wire162,
                 wire163,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 wire173,
                 wire178,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg175,
                 (1'h0)};
  module5 #() modinst74 (.wire9(wire1), .wire10(wire3), .clk(clk), .y(wire73), .wire7(wire2), .wire8(wire4), .wire6(wire0));
  assign wire75 = (8'hb3);
  module76 #() modinst156 (wire155, clk, wire0, wire4, wire73, wire3);
  always
    @(posedge clk) begin
      reg157 <= wire2[(4'hd):(4'ha)];
      reg158 <= {($signed(($signed(wire155) ^ $signed(wire4))) ?
              wire155 : (((wire73 ? wire1 : reg157) ?
                      wire4 : ((7'h40) << wire75)) ?
                  wire1[(1'h0):(1'h0)] : (~$signed(wire4))))};
      reg159 <= wire1[(3'h5):(2'h2)];
      reg160 <= wire73[(4'hd):(4'hb)];
      reg161 <= $signed((~&$signed({wire3[(4'ha):(3'h7)]})));
    end
  assign wire162 = $signed((~|(8'hbd)));
  assign wire163 = (8'hb1);
  assign wire164 = reg158;
  assign wire165 = (~$unsigned({$signed($signed((8'hae))),
                       ($unsigned(wire4) - wire2)}));
  assign wire166 = ($unsigned(wire0[(4'h9):(3'h7)]) ?
                       reg158[(3'h5):(2'h3)] : $signed((-$unsigned({wire163,
                           wire2}))));
  assign wire167 = $unsigned(((($unsigned(reg160) > $unsigned(wire162)) < ({reg161} ~^ $signed(reg159))) ?
                       {$unsigned((wire166 || wire2)),
                           {(|wire0)}} : ($signed(reg160[(4'hc):(2'h2)]) ^ wire2)));
  assign wire168 = $signed(wire167[(4'hf):(4'he)]);
  always
    @(posedge clk) begin
      reg169 <= $signed($signed({$unsigned(((8'hbf) | reg159)),
          (wire2 ^~ (wire155 ? reg160 : wire168))}));
      reg170 <= (!((|($unsigned(wire2) * wire162[(2'h3):(2'h3)])) ?
          (((wire0 >> (8'hb6)) ? {reg169, wire155} : (~(8'hb3))) ?
              wire168 : wire2[(3'h6):(3'h4)]) : (^(~(wire163 ?
              reg160 : wire166)))));
      if ((+$unsigned(reg170[(3'h6):(1'h1)])))
        begin
          reg171 <= (({((wire0 && reg159) || $signed(wire2))} ?
              wire73 : (^~wire0[(4'hc):(1'h0)])) == $signed($signed(((wire0 ?
                  wire164 : reg169) ?
              {wire164, wire167} : wire2[(4'he):(4'hc)]))));
          reg172 <= (-(wire1[(4'hd):(4'h9)] ?
              (&(reg160 ?
                  $signed(wire166) : wire164[(4'hc):(4'ha)])) : wire167[(4'hc):(4'ha)]));
        end
      else
        begin
          reg171 <= reg159[(1'h1):(1'h0)];
        end
    end
  module87 #() modinst174 (wire173, clk, wire163, reg172, wire4, wire1);
  always
    @(posedge clk) begin
      reg175 <= {wire1[(3'h4):(2'h2)]};
    end
  module47 #() modinst177 (wire176, clk, wire165, reg157, wire73, wire2);
  module12 #() modinst179 (.wire17(wire166), .wire14(reg159), .clk(clk), .wire13(wire164), .y(wire178), .wire16(reg172), .wire15(wire3));
  assign wire180 = reg159[(1'h0):(1'h0)];
endmodule

module module76
#(parameter param153 = ((8'hac) >>> {((((8'hb8) - (8'ha4)) ? ((7'h43) ? (8'had) : (8'hab)) : ((8'ha2) > (8'hbe))) - (&((8'haf) ? (8'hb1) : (8'hab))))}), 
parameter param154 = ({(+((param153 ? (8'ha3) : param153) + (^param153)))} > param153))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire80;
  input wire [(5'h11):(1'h0)] wire79;
  input wire signed [(4'he):(1'h0)] wire78;
  input wire [(5'h14):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire150;
  wire signed [(3'h4):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire147;
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire128,
                 wire86,
                 wire85,
                 wire83,
                 wire82,
                 wire81,
                 wire147,
                 reg84,
                 (1'h0)};
  assign wire81 = (wire80[(4'ha):(2'h3)] >>> $unsigned(wire79[(3'h6):(3'h4)]));
  assign wire82 = $signed(wire79[(4'hb):(3'h5)]);
  assign wire83 = ((^~({(~^wire82)} == wire78)) ?
                      (8'h9f) : (({{(8'hb4)},
                              (wire78 ~^ wire79)} << ($unsigned(wire77) ?
                              wire79 : wire82[(5'h11):(4'hd)])) ?
                          $unsigned(($unsigned(wire82) ?
                              wire78 : wire77[(1'h0):(1'h0)])) : wire80[(4'he):(4'h8)]));
  always
    @(posedge clk) begin
      reg84 <= wire79[(2'h2):(2'h2)];
    end
  assign wire85 = $unsigned((8'ha6));
  assign wire86 = (wire80[(4'hc):(2'h3)] >= wire81[(3'h5):(1'h0)]);
  module87 #() modinst129 (.y(wire128), .wire91(wire83), .wire89(wire86), .wire90(wire79), .wire88(reg84), .clk(clk));
  module130 #() modinst148 (wire147, clk, wire81, wire85, wire77, wire78, wire86);
  assign wire149 = $signed(((8'ha2) ? (~(8'ha3)) : wire78));
  assign wire150 = $unsigned($signed(reg84[(4'h9):(3'h6)]));
  assign wire151 = (8'ha9);
  assign wire152 = $unsigned((+$signed(wire81)));
endmodule

module module5
#(parameter param72 = ((8'ha6) <<< ((7'h42) >= (((8'hac) ? ((8'had) ? (8'ha6) : (8'ha6)) : ((8'had) == (8'hb1))) ? (((8'hb1) ? (8'haf) : (8'hbb)) ? ((8'hbc) ? (8'hac) : (8'ha2)) : (~^(8'ha0))) : ((~|(8'hb4)) + {(8'ha0)})))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire44;
  assign y = {wire71, wire69, wire46, wire11, wire44, (1'h0)};
  assign wire11 = {(~^{($signed(wire6) || {(7'h42)})})};
  module12 #() modinst45 (wire44, clk, wire7, wire10, wire11, wire9, wire6);
  assign wire46 = $unsigned(($unsigned(($signed(wire11) ?
                      (7'h43) : (~&wire9))) == {({wire9} <<< (wire11 > wire7)),
                      $signed(wire8[(3'h7):(2'h2)])}));
  module47 #() modinst70 (wire69, clk, wire46, wire6, wire11, wire9);
  assign wire71 = wire46[(5'h10):(5'h10)];
endmodule

module module47  (y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire signed [(4'hd):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire49;
  input wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire52 = $signed($signed(wire50[(2'h2):(2'h2)]));
  assign wire53 = (!(wire51 - $unsigned(((wire48 - (8'hb3)) ?
                      wire52 : (^~wire51)))));
  assign wire54 = (wire52[(4'he):(4'hb)] >> ((-$unsigned(((8'ha8) - wire52))) + (&({wire50} ?
                      {wire52} : $signed(wire50)))));
  assign wire55 = (($signed((~^$signed((8'hac)))) ?
                          wire52[(3'h4):(2'h3)] : wire49[(4'h8):(3'h4)]) ?
                      (8'ha5) : {wire50});
  assign wire56 = wire49[(3'h4):(1'h0)];
  assign wire57 = wire53;
  always
    @(posedge clk) begin
      if (($signed(wire50) ?
          (|(8'hb7)) : ($signed(($signed((8'ha2)) | wire51)) ?
              wire50 : ((^(wire56 != wire48)) ?
                  {$unsigned(wire48), (&wire57)} : wire54[(1'h1):(1'h1)]))))
        begin
          reg58 <= (+wire52);
        end
      else
        begin
          reg58 <= (^wire53[(2'h3):(2'h2)]);
        end
      if ($signed(wire50[(4'hc):(4'h9)]))
        begin
          reg59 <= wire55[(4'hd):(1'h0)];
          if (wire53[(1'h1):(1'h0)])
            begin
              reg60 <= $signed(wire50[(3'h5):(1'h0)]);
            end
          else
            begin
              reg60 <= {(8'hb1), wire48[(4'hc):(4'hb)]};
              reg61 <= (7'h40);
              reg62 <= wire50[(4'h8):(2'h2)];
            end
          reg63 <= ((^(~&{(wire51 ? wire50 : (8'ha9))})) ?
              wire48 : {(reg61[(1'h1):(1'h1)] + (wire53 ?
                      (~^wire48) : ((8'h9e) | wire52))),
                  $signed($signed($signed(wire49)))});
          reg64 <= (($unsigned((~&$signed((8'hb6)))) ^~ reg58[(1'h0):(1'h0)]) ?
              {reg61,
                  ((^~(wire53 & reg61)) ^ $unsigned($signed(wire55)))} : wire52[(4'hd):(3'h7)]);
          reg65 <= ((reg61 >>> (reg59[(2'h2):(1'h1)] > {$signed(wire54),
                  ((8'hb3) >> reg62)})) ?
              (({(reg64 <<< wire51),
                  (reg63 != reg58)} || wire56[(2'h3):(1'h0)]) != {(^wire50)}) : reg60[(1'h1):(1'h1)]);
        end
      else
        begin
          reg59 <= (~^(wire51 ?
              (-$signed(wire57)) : $signed($signed(((8'hab) ?
                  wire56 : reg61)))));
        end
      reg66 <= $unsigned(wire51);
      reg67 <= (wire54 ?
          reg63[(3'h4):(2'h2)] : (wire52 ?
              $unsigned((^~{wire56})) : ($unsigned((wire57 < reg64)) ?
                  wire54 : (~|reg62[(3'h7):(3'h4)]))));
      reg68 <= $unsigned((!$unsigned(((wire48 ? wire48 : wire51) ?
          $unsigned(reg66) : $signed((8'ha3))))));
    end
endmodule

module module12
#(parameter param42 = (^~(8'ha5)), 
parameter param43 = param42)
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire18;
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 reg31,
                 reg30,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg19,
                 (1'h0)};
  assign wire18 = ((($signed(wire15[(3'h6):(1'h0)]) <<< ((wire17 - wire17) ?
                          (wire16 < wire17) : (wire16 ? wire14 : wire14))) ?
                      (({wire16} * $unsigned((8'haf))) ?
                          $signed((wire17 * (8'hb1))) : $unsigned($unsigned(wire16))) : wire14) + wire13[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg19 <= wire18;
    end
  assign wire20 = (~|wire15);
  assign wire21 = ((wire20 <<< $unsigned(wire20)) ?
                      (($unsigned($unsigned((7'h42))) >>> $signed(wire15)) ?
                          (!$signed($unsigned(wire15))) : ((wire17 ?
                              (^~(8'ha5)) : (~&wire16)) >= (wire20 ?
                              wire18[(4'ha):(1'h0)] : (8'hb8)))) : wire17);
  assign wire22 = $signed($unsigned((|(-wire16[(1'h0):(1'h0)]))));
  assign wire23 = ((^$signed((8'hb0))) || wire15[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg24 <= $unsigned((wire13 ^~ wire13));
      reg25 <= $signed(reg24);
      reg26 <= $signed($unsigned($unsigned(reg25)));
      reg27 <= $unsigned(wire15);
    end
  assign wire28 = ($signed(wire16[(2'h3):(1'h1)]) ?
                      wire20[(5'h11):(2'h3)] : ((-(wire22[(3'h4):(2'h3)] && wire16)) < reg27));
  assign wire29 = $unsigned((~(8'haa)));
  always
    @(posedge clk) begin
      reg30 <= {((8'hb3) ? wire15 : $signed((wire16 <= ((8'hb4) && (8'h9d)))))};
      reg31 <= (~^reg27[(1'h0):(1'h0)]);
    end
  assign wire32 = wire13;
  assign wire33 = ($unsigned(wire15[(1'h1):(1'h0)]) << {$unsigned((|(wire16 ?
                          wire28 : wire32))),
                      {(~&{wire21}), (^(wire15 ? reg27 : (8'h9c)))}});
  assign wire34 = (~wire16);
  assign wire35 = ((!$unsigned(wire16[(3'h4):(2'h2)])) ?
                      wire21[(1'h0):(1'h0)] : (-$unsigned(($unsigned((8'ha3)) - {reg24}))));
  assign wire36 = wire15;
  assign wire37 = $signed(((+$unsigned({wire32,
                      wire20})) + $signed(($unsigned(wire23) ?
                      wire17 : $unsigned(wire34)))));
  assign wire38 = (&(wire34[(1'h0):(1'h0)] ?
                      $signed((wire37 - wire29)) : {$signed(wire14)}));
  assign wire39 = wire15;
  assign wire40 = $signed(wire37[(1'h0):(1'h0)]);
  assign wire41 = wire28;
endmodule

module module130
#(parameter param145 = ((&((&((8'ha7) ^~ (8'hac))) ? (-{(8'h9d)}) : (((8'hbc) ? (7'h42) : (8'hb2)) ? ((8'h9f) || (8'ha0)) : {(8'hb1), (8'ha4)}))) ? ((((8'hb8) ? (^~(8'ha6)) : {(8'hac)}) ^~ (~|((8'h9f) >> (8'ha7)))) ? ({(7'h42)} ~^ (~&((8'hac) <<< (8'hb9)))) : (7'h40)) : {((^((8'hbf) | (8'hbf))) ^ (~(~|(8'ha2))))}), 
parameter param146 = (param145 < (((^~(param145 && param145)) <= (~&((8'h9c) ? param145 : param145))) ? {(param145 + (+param145)), (^~(~&param145))} : {((param145 ? param145 : param145) ? (param145 == param145) : (param145 ? param145 : (8'hb7)))})))
(y, clk, wire135, wire134, wire133, wire132, wire131);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire135;
  input wire [(4'he):(1'h0)] wire134;
  input wire [(3'h7):(1'h0)] wire133;
  input wire signed [(4'he):(1'h0)] wire132;
  input wire [(3'h4):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire143;
  wire signed [(3'h4):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 (1'h0)};
  assign wire136 = ($signed(({$signed(wire132),
                           ((8'h9e) ?
                               wire131 : wire131)} < (~&$signed(wire132)))) ?
                       wire132 : wire134[(4'h9):(3'h5)]);
  assign wire137 = wire136;
  assign wire138 = wire131[(1'h0):(1'h0)];
  assign wire139 = (~^((+$signed($unsigned(wire136))) > wire138));
  assign wire140 = ((8'haf) ?
                       $signed($signed(($signed(wire139) ^~ $signed(wire134)))) : wire135[(5'h10):(4'ha)]);
  assign wire141 = {{wire133[(3'h6):(2'h3)]}};
  assign wire142 = {($unsigned($unsigned((~&wire133))) ^~ $unsigned($unsigned((~wire140)))),
                       $signed(wire134[(4'hb):(3'h7)])};
  assign wire143 = ($unsigned($unsigned(wire136[(4'hc):(4'h8)])) ?
                       (^~($signed($unsigned(wire133)) ?
                           $unsigned($signed((7'h41))) : (!wire136[(4'ha):(3'h7)]))) : (wire139[(4'h9):(3'h5)] ?
                           $unsigned(wire142) : (&(~|(&wire133)))));
  assign wire144 = $unsigned((((8'ha0) ? wire142 : wire136[(4'h9):(1'h0)]) ?
                       wire143 : (+($signed(wire142) >>> (wire143 ?
                           wire133 : wire138)))));
endmodule

module module87
#(parameter param127 = (&(~&((((8'ha4) - (8'ha2)) || ((8'h9e) <= (8'had))) ? (((8'ha4) + (8'hba)) == ((8'ha9) ? (8'h9e) : (8'h9e))) : {((8'ha1) != (8'haa))}))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire91;
  input wire signed [(4'he):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  input wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire116,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+wire90))
        begin
          if (((^{((wire88 * wire91) ? (wire91 ? wire89 : wire91) : (|wire91)),
              ($signed(wire88) ?
                  ((8'h9c) || wire90) : $signed(wire88))}) ^~ {wire90[(4'hd):(3'h4)],
              wire90}))
            begin
              reg92 <= $unsigned(wire88);
              reg93 <= {(-wire90),
                  {$unsigned({(reg92 ? reg92 : wire90), (wire90 & (8'hb2))}),
                      (^wire89)}};
              reg94 <= wire90[(4'h9):(3'h5)];
              reg95 <= reg94;
            end
          else
            begin
              reg92 <= ({($unsigned((wire90 & wire91)) >= (~wire88))} ?
                  wire90[(4'he):(4'h9)] : (reg95 ?
                      {$unsigned((reg94 ? reg92 : wire89))} : reg94));
            end
          reg96 <= (~^{{$signed((reg93 >= (8'hb4))), wire89}});
          reg97 <= ((~^(-wire91[(4'he):(3'h6)])) && $signed(wire88));
        end
      else
        begin
          reg92 <= (reg96 || ((~^reg92) << $signed(reg92[(2'h3):(1'h0)])));
          reg93 <= $unsigned({($unsigned((reg92 ^ wire89)) == $signed(((8'hbd) > reg96))),
              reg96[(3'h4):(3'h4)]});
        end
      reg98 <= wire89;
      reg99 <= $signed(reg95[(3'h5):(2'h3)]);
      reg100 <= $signed($signed(($unsigned($signed(reg92)) <= ((~&reg93) ?
          (~|reg96) : (8'ha7)))));
    end
  assign wire101 = {((({(8'hbd)} != $signed(reg100)) == ((~^reg96) == (8'ha8))) & reg92[(4'hb):(1'h0)])};
  assign wire102 = $unsigned(reg94[(2'h3):(2'h3)]);
  assign wire103 = (^~$unsigned(((8'ha3) >>> wire89)));
  assign wire104 = {((~($unsigned(reg94) ^ $signed(wire103))) ~^ (($signed(reg96) ?
                               (~wire90) : {reg96, (8'ha6)}) ?
                           ({reg92} < (~|reg97)) : wire102[(2'h3):(2'h3)])),
                       reg93[(2'h2):(1'h1)]};
  always
    @(posedge clk) begin
      if ({{(8'had), (+$signed(reg95[(2'h2):(1'h1)]))},
          (reg97[(1'h0):(1'h0)] ?
              (~|($signed(reg100) & wire104)) : $unsigned(wire88))})
        begin
          reg105 <= (reg98[(3'h5):(2'h2)] ?
              reg100 : ({$signed({wire91})} ?
                  ((+(reg96 * reg98)) <<< ((!reg98) ?
                      $signed(reg92) : $signed(reg99))) : (reg94[(1'h0):(1'h0)] - wire102)));
          reg106 <= ((~^reg100[(3'h5):(2'h3)]) != wire102);
        end
      else
        begin
          reg105 <= (|$signed({reg96, (^(~wire90))}));
        end
      reg107 <= $unsigned(reg106);
      if ((reg95 ? (^~reg100) : $unsigned((~&wire88[(2'h2):(1'h1)]))))
        begin
          reg108 <= reg105;
          reg109 <= $unsigned(reg99[(2'h2):(1'h1)]);
          reg110 <= (({(8'hae), $unsigned((reg100 ? wire91 : (8'h9c)))} ?
              (((reg95 ? reg98 : (8'hbc)) ?
                      wire89[(4'ha):(3'h6)] : (~(8'h9e))) ?
                  wire104 : reg94[(1'h1):(1'h0)]) : ($unsigned($unsigned(reg100)) ?
                  reg109[(4'h8):(4'h8)] : ($unsigned(reg108) ?
                      $unsigned(reg100) : (!reg106)))) <= $unsigned(reg93));
          reg111 <= (reg95[(2'h3):(2'h3)] >>> ($signed(reg92[(2'h3):(2'h3)]) ?
              reg110 : reg92[(5'h12):(2'h2)]));
          if (reg95)
            begin
              reg112 <= $unsigned((&reg94));
              reg113 <= (&(($signed($signed(reg109)) == ((reg95 ?
                          wire104 : wire103) ?
                      {wire90, wire103} : $signed(wire103))) ?
                  (reg106[(3'h5):(2'h2)] * $unsigned(((7'h43) ?
                      reg106 : wire90))) : ((+(reg100 < reg106)) ^~ wire101[(2'h3):(2'h3)])));
              reg114 <= reg109;
            end
          else
            begin
              reg112 <= $unsigned({$signed($unsigned($unsigned(reg105)))});
            end
        end
      else
        begin
          if ($signed($unsigned(reg94[(2'h3):(1'h0)])))
            begin
              reg108 <= (&((!((wire91 ? wire103 : wire88) ?
                  $signed(wire88) : (+reg97))) ^ ($signed($unsigned(wire88)) ?
                  $signed((~|reg108)) : ((reg94 == wire88) ?
                      wire101 : wire103))));
              reg109 <= reg109[(3'h6):(3'h6)];
              reg110 <= (8'ha9);
              reg111 <= ($unsigned(reg109) ? (8'hbe) : reg106);
              reg112 <= (reg100 ?
                  (($unsigned((-reg105)) ?
                          $unsigned($signed(reg107)) : reg107[(2'h3):(2'h3)]) ?
                      $unsigned(reg99) : reg108) : ($signed((((8'h9c) >> (8'hbc)) << (wire102 << wire103))) << ((8'ha2) >= (((8'ha0) ?
                      wire102 : reg93) + (8'h9d)))));
            end
          else
            begin
              reg108 <= $signed($signed((((wire103 ? reg93 : reg111) ?
                      reg109 : $signed(reg108)) ?
                  (~&{wire104}) : reg111[(4'h9):(4'h9)])));
              reg109 <= ($unsigned((!(wire102 ?
                  $unsigned(wire104) : $signed(wire90)))) >> reg113);
              reg110 <= {reg97,
                  $signed({$signed(reg106), $signed({wire89, wire103})})};
              reg111 <= reg95[(1'h1):(1'h1)];
              reg112 <= reg97;
            end
          reg113 <= ({$signed(reg100)} ?
              reg111 : ($unsigned(reg100) ^~ reg113));
          reg114 <= $signed(($signed(((^~reg106) << $unsigned((7'h43)))) << $signed((reg95 ?
              (reg105 ? reg94 : wire89) : $unsigned(reg93)))));
          reg115 <= reg105[(1'h1):(1'h0)];
        end
    end
  assign wire116 = (-reg100[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      reg117 <= wire91;
      if ({($unsigned($unsigned((8'hbb))) ?
              (((!reg111) ? reg97 : $unsigned(wire103)) ^~ (((7'h42) ?
                  reg114 : (8'ha1)) + $signed(reg105))) : reg108)})
        begin
          reg118 <= wire89;
          if ($unsigned((8'hb4)))
            begin
              reg119 <= ((reg113[(1'h1):(1'h1)] ^~ (!reg98)) ?
                  $signed(wire89) : $unsigned($unsigned((8'hb7))));
              reg120 <= reg111;
              reg121 <= reg96;
            end
          else
            begin
              reg119 <= $unsigned(reg95[(3'h5):(3'h5)]);
              reg120 <= (($unsigned($unsigned($unsigned(reg121))) ?
                      {$signed(wire89[(4'hc):(1'h0)]),
                          $signed((wire116 ? reg92 : wire88))} : reg100) ?
                  (($unsigned((|reg114)) ?
                          $unsigned((~^(8'h9c))) : $unsigned({wire90})) ?
                      wire89[(4'he):(4'he)] : (!($unsigned(reg106) ^~ {reg120,
                          wire101}))) : reg119);
              reg121 <= $unsigned((8'h9d));
              reg122 <= $signed(wire89[(3'h6):(1'h0)]);
              reg123 <= {(|reg107[(3'h4):(1'h1)])};
            end
        end
      else
        begin
          reg118 <= $unsigned(((&((~^reg92) ?
                  (reg121 ? (8'ha6) : wire116) : $signed(reg106))) ?
              $unsigned(reg106) : ((~^$unsigned(wire91)) <<< ((~&wire89) >> (^wire91)))));
          reg119 <= $signed((|reg95));
        end
      reg124 <= wire101;
    end
  assign wire125 = reg119[(3'h5):(3'h4)];
  assign wire126 = $signed((~|(((8'haf) ? (wire88 <<< reg106) : (8'hba)) ?
                       $unsigned($signed(reg123)) : $unsigned((^reg117)))));
endmodule
