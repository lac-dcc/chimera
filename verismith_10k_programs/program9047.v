module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire147;
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire19,
                 wire20,
                 wire29,
                 wire34,
                 wire147,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire5 = (~^$signed((^~({wire1} <<< (wire1 >>> wire1)))));
  assign wire6 = ((wire2 ?
                     $signed(((&wire4) ?
                         (!wire5) : (~|wire1))) : $signed($unsigned($unsigned(wire1)))) ~^ $unsigned((wire1[(2'h3):(1'h0)] != wire4[(1'h1):(1'h0)])));
  assign wire7 = $signed(($signed(((wire2 - wire5) ? (~^(8'ha4)) : (&wire6))) ?
                     $unsigned($unsigned((^wire3))) : wire4[(5'h10):(3'h6)]));
  assign wire8 = wire4;
  assign wire9 = (&($unsigned(wire6[(4'hb):(4'ha)]) ?
                     wire1 : ($signed($signed(wire0)) && wire8[(3'h4):(3'h4)])));
  assign wire10 = ($unsigned((($signed(wire4) >>> (wire3 ?
                      wire2 : wire6)) <= {{wire1, wire7},
                      $unsigned(wire0)})) * wire8);
  assign wire11 = $signed((($signed((~|wire3)) != $unsigned($unsigned(wire6))) ?
                      wire1[(2'h3):(2'h3)] : ($signed($unsigned(wire10)) ?
                          $signed(wire1) : $signed({wire10}))));
  assign wire12 = wire0[(5'h12):(3'h6)];
  assign wire13 = $signed((wire12 ?
                      ((|wire8[(2'h3):(1'h1)]) + $signed((wire11 || wire9))) : wire8[(1'h0):(1'h0)]));
  assign wire14 = ($signed(wire0) ?
                      {$unsigned(wire12[(3'h6):(2'h3)])} : wire12);
  assign wire15 = $signed((^$unsigned($signed(wire11[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      if ((~&((8'hbe) ?
          ($signed((wire4 ? (8'ha4) : wire1)) ?
              ((wire12 - wire5) & ((8'had) ? wire1 : wire11)) : {{wire8,
                      wire8}}) : wire15[(4'h8):(3'h7)])))
        begin
          reg16 <= wire11[(2'h2):(1'h0)];
          reg17 <= {($signed(((wire2 <= reg16) + (~|wire8))) + $signed((~|$signed((8'hb1))))),
              $signed((+((wire14 ?
                  wire11 : wire2) <= wire14[(5'h11):(1'h1)])))};
        end
      else
        begin
          reg16 <= wire3[(1'h1):(1'h0)];
        end
      reg18 <= ((~^$signed({(wire12 ?
              wire0 : wire4)})) << $unsigned({wire15[(4'ha):(3'h4)]}));
    end
  assign wire19 = (wire5[(4'hd):(2'h2)] ? wire11 : wire13[(4'ha):(4'ha)]);
  assign wire20 = reg16;
  always
    @(posedge clk) begin
      reg21 <= $signed((~&((~&((8'hb8) <= wire10)) >>> wire13[(4'h9):(4'h9)])));
      reg22 <= (&wire11[(3'h6):(3'h5)]);
      reg23 <= wire15[(1'h1):(1'h1)];
      reg24 <= $signed(reg23[(2'h2):(1'h1)]);
      reg25 <= (~&(^~wire19));
    end
  always
    @(posedge clk) begin
      reg26 <= (!((^~((wire12 ? wire2 : wire19) - (!reg18))) ?
          (!(~&{reg18})) : (wire8 ?
              ({wire14, wire3} ? reg23 : (reg16 * wire14)) : ($signed(wire19) ?
                  (wire1 & reg25) : wire0[(3'h4):(1'h0)]))));
      reg27 <= {(wire13 ~^ (wire8 <= ($signed(reg25) | (reg24 ?
              wire20 : reg16))))};
      reg28 <= {{$signed(reg24[(2'h3):(1'h1)]), wire3}};
    end
  assign wire29 = ((8'hbc) ? $signed((!$unsigned((wire9 | reg21)))) : wire11);
  always
    @(posedge clk) begin
      reg30 <= wire5;
      reg31 <= reg17;
    end
  always
    @(posedge clk) begin
      reg32 <= $unsigned(wire10);
      reg33 <= wire4;
    end
  assign wire34 = ($unsigned((reg18[(4'ha):(3'h4)] ?
                      ($signed((8'h9c)) <= (reg30 ?
                          (8'hbe) : reg27)) : wire4[(3'h5):(1'h0)])) >= wire13[(4'hc):(4'h8)]);
  module35 #() modinst148 (.wire37(wire34), .wire39(wire7), .wire36(reg23), .wire38(wire6), .wire40(reg27), .y(wire147), .clk(clk));
endmodule

module module35
#(parameter param145 = {(~(!(((8'hb4) >> (7'h41)) ^ (8'hac))))}, 
parameter param146 = {((~|param145) ? ((8'hb2) ? (((8'ha4) + param145) + (param145 ? param145 : param145)) : param145) : param145), ((param145 ? ((^~param145) ? (+param145) : param145) : (|{param145})) ? param145 : (param145 ? {(~&param145)} : ((param145 ? param145 : param145) ? (^~param145) : (7'h42))))})
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire40;
  input wire [(4'ha):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire [(4'hf):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire139,
                 wire119,
                 wire118,
                 wire96,
                 wire95,
                 wire93,
                 wire43,
                 wire42,
                 wire41,
                 reg117,
                 reg116,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire41 = ($signed((((wire37 || wire38) + wire39) < $unsigned(wire37))) ?
                      {wire36[(3'h5):(1'h0)]} : (-(-$unsigned(wire39[(3'h4):(2'h3)]))));
  assign wire42 = (~|{$signed(wire41)});
  assign wire43 = wire42[(2'h3):(1'h1)];
  module44 #() modinst94 (wire93, clk, wire41, wire37, wire38, wire40);
  assign wire95 = (~|$signed((&((wire39 ? wire37 : (8'ha7)) && (~|wire39)))));
  assign wire96 = ((~&$unsigned({(wire95 ? wire36 : wire42),
                      {wire38}})) == ((wire37[(3'h6):(3'h5)] << (wire40[(4'ha):(3'h5)] ?
                          $signed(wire41) : $unsigned(wire43))) ?
                      wire37 : $unsigned($unsigned($unsigned(wire39)))));
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned($signed((&wire39))))))
        begin
          if (((wire93 && (~|wire93[(3'h6):(1'h1)])) ?
              $signed({(~wire42[(2'h2):(1'h1)]),
                  wire36[(1'h0):(1'h0)]}) : {wire43}))
            begin
              reg97 <= $unsigned(wire93);
            end
          else
            begin
              reg97 <= wire36;
              reg98 <= $signed($signed(wire41[(4'ha):(1'h1)]));
              reg99 <= ((&$unsigned(wire39[(2'h2):(1'h1)])) | $signed(reg97[(4'hc):(2'h2)]));
              reg100 <= (8'haf);
              reg101 <= wire95[(4'h9):(1'h0)];
            end
          reg102 <= reg100;
        end
      else
        begin
          reg97 <= wire38;
        end
      reg103 <= wire40[(4'hb):(4'h9)];
      reg104 <= {($unsigned($signed((reg98 ? wire40 : (8'h9c)))) ?
              (~|wire39) : wire37),
          (~&(8'hbb))};
      if ((wire39[(3'h5):(2'h2)] ?
          (&$unsigned($unsigned((reg97 ?
              wire39 : reg101)))) : $signed((~&$unsigned($signed(wire37))))))
        begin
          reg105 <= (({$signed($unsigned((8'hba)))} ?
                  $unsigned($signed((^~wire41))) : (((wire42 ?
                      (8'ha8) : wire43) ^ (~reg102)) + (wire37 ?
                      {(8'hbb)} : wire95[(3'h4):(1'h1)]))) ?
              wire37 : (~reg103[(5'h15):(5'h14)]));
          reg106 <= $unsigned($unsigned($signed((~|$unsigned(wire36)))));
          if (($unsigned((&$signed(reg103[(4'h8):(4'h8)]))) ?
              (-(^$unsigned((wire40 ? reg98 : wire39)))) : wire96))
            begin
              reg107 <= (wire95[(3'h7):(3'h7)] ^ $unsigned((reg100[(2'h3):(2'h2)] | (((8'haf) ?
                  reg99 : reg105) & (wire93 ? reg98 : wire95)))));
            end
          else
            begin
              reg107 <= $signed(($signed(reg106[(4'hc):(3'h7)]) && $unsigned(((+reg101) ?
                  ((8'haf) >> reg102) : {wire40}))));
              reg108 <= (+(((wire38 ?
                      (wire95 ?
                          reg106 : reg106) : (!reg102)) | $signed({reg101})) ?
                  $unsigned($signed(reg98[(1'h1):(1'h1)])) : {reg101, reg99}));
              reg109 <= {reg108[(1'h0):(1'h0)]};
            end
          reg110 <= $unsigned((reg106 ?
              reg101[(5'h12):(3'h4)] : $signed($unsigned(wire43))));
          reg111 <= $signed($signed((&(8'ha0))));
        end
      else
        begin
          reg105 <= wire38;
          if (reg111)
            begin
              reg106 <= wire43;
              reg107 <= $signed(((~wire39[(3'h7):(1'h1)]) ^ $unsigned((^wire42[(2'h2):(1'h1)]))));
              reg108 <= reg105[(3'h6):(3'h6)];
            end
          else
            begin
              reg106 <= $unsigned(($signed($unsigned((wire42 ?
                      reg104 : reg99))) ?
                  $signed($signed(wire37[(3'h4):(2'h3)])) : (((reg110 < reg100) ?
                          (reg105 - wire41) : (&reg97)) ?
                      wire38[(3'h4):(2'h3)] : (~&wire37))));
              reg107 <= $signed((~&{reg101[(4'hf):(1'h1)],
                  $unsigned($signed(wire95))}));
              reg108 <= $unsigned(wire37);
              reg109 <= $signed(($signed(((reg109 | wire38) ?
                  wire96 : {reg111, reg109})) <<< (~^{(reg105 ?
                      wire42 : wire43),
                  (~|(7'h42))})));
            end
          reg110 <= $unsigned($unsigned($signed(((reg105 - wire39) ?
              (reg97 ^~ reg99) : (wire38 ? (8'hbf) : reg111)))));
          reg111 <= reg102[(1'h0):(1'h0)];
        end
      if ((reg111[(4'hd):(3'h5)] ?
          $signed((wire93 ^ (~|reg111))) : (((|{(8'hb5)}) <= $unsigned($unsigned(wire93))) || (8'ha0))))
        begin
          reg112 <= $signed((8'hae));
          reg113 <= {{(~^$unsigned({(8'hb7)})), wire42[(1'h1):(1'h0)]}};
        end
      else
        begin
          reg112 <= reg107;
          if (($signed($unsigned(wire93)) ?
              (~|(wire42 <= wire95)) : wire43[(1'h1):(1'h0)]))
            begin
              reg113 <= wire93;
              reg114 <= wire38;
            end
          else
            begin
              reg113 <= ($signed(reg108[(3'h7):(1'h1)]) ?
                  wire36 : $unsigned(({(&reg104)} <<< ($unsigned(reg109) - (~^reg103)))));
              reg114 <= (wire95 ?
                  (($unsigned($signed(reg106)) ?
                          reg107 : wire93[(3'h6):(1'h0)]) ?
                      $unsigned($signed(wire38[(2'h3):(2'h2)])) : (^(reg102[(1'h1):(1'h1)] >>> (reg113 != (8'hbf))))) : reg111);
              reg115 <= reg107[(1'h1):(1'h1)];
              reg116 <= reg101;
            end
          reg117 <= ($signed(reg99) ?
              ({reg113} == (8'hb7)) : (reg99[(4'h8):(3'h7)] >> (wire37[(2'h3):(1'h0)] ?
                  (~{reg112, wire42}) : reg98[(4'h9):(3'h7)])));
        end
    end
  assign wire118 = ((^reg97[(1'h0):(1'h0)]) >>> reg102[(3'h4):(1'h1)]);
  assign wire119 = reg99[(1'h1):(1'h0)];
  module120 #() modinst140 (wire139, clk, reg101, reg115, reg107, reg99);
  assign wire141 = $signed(($unsigned({(~&reg99)}) ?
                       wire42 : $unsigned(($signed((8'hb1)) << reg112[(2'h3):(2'h2)]))));
  assign wire142 = $unsigned((~$signed(((wire96 | wire41) + reg116))));
  assign wire143 = $signed(reg110[(2'h3):(2'h2)]);
  assign wire144 = (wire93 ?
                       ({((reg115 <= reg99) ?
                                   (~&reg104) : (wire42 ^ wire119))} ?
                           $unsigned(((wire95 ?
                               (8'h9c) : wire38) & (wire95 - wire118))) : wire43) : wire139);
endmodule

module module120
#(parameter param137 = (((8'h9f) ^ (&{(~(8'ha8))})) && ((-((+(8'ha8)) ? ((8'had) ? (8'hbd) : (8'h9d)) : {(8'haf)})) ? ((^~{(8'hb8), (8'ha4)}) ? (((8'ha7) ? (8'h9f) : (8'ha8)) ? (-(8'ha0)) : ((8'h9e) ? (8'ha4) : (8'hbb))) : {((8'hb6) ? (7'h41) : (8'h9c))}) : (~(~&(+(8'h9d)))))), 
parameter param138 = (!(param137 ? (param137 ? (~(param137 ? param137 : param137)) : (~|(|param137))) : (~({param137} ? (-param137) : (param137 ? param137 : param137))))))
(y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire124;
  input wire signed [(5'h14):(1'h0)] wire123;
  input wire signed [(4'hc):(1'h0)] wire122;
  input wire [(4'hd):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire135;
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  assign y = {wire135,
                 reg136,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg125 <= $signed($signed(($signed({wire124, (8'ha7)}) ?
          wire121 : ((wire121 - wire121) & $signed(wire123)))));
      if (wire122[(4'ha):(3'h6)])
        begin
          if (wire122)
            begin
              reg126 <= (8'hbe);
              reg127 <= (wire121 >> (^~(~&wire122)));
              reg128 <= reg127;
              reg129 <= wire123[(5'h12):(5'h10)];
            end
          else
            begin
              reg126 <= $signed(($unsigned($unsigned(wire122[(4'ha):(4'h9)])) ?
                  reg129[(3'h7):(2'h3)] : reg129));
              reg127 <= reg127[(1'h0):(1'h0)];
            end
          reg130 <= wire122[(3'h4):(2'h2)];
        end
      else
        begin
          reg126 <= wire122;
          reg127 <= $unsigned((~|{($unsigned(wire123) ?
                  (wire122 ? wire122 : reg127) : (8'hbc)),
              (reg128 ^ reg126[(4'hc):(2'h3)])}));
          if (((^~$signed($signed({reg127, wire121}))) ?
              reg129 : (((-$signed(reg125)) ?
                  $signed((wire121 ? reg130 : wire122)) : {wire122,
                      (reg125 ? reg130 : reg130)}) * (~((~&reg126) || ((8'ha5) ?
                  reg128 : reg125))))))
            begin
              reg128 <= $signed(reg130);
            end
          else
            begin
              reg128 <= $signed(wire123[(4'hb):(3'h7)]);
            end
        end
    end
  always
    @(posedge clk) begin
      reg131 <= wire124;
      reg132 <= reg127[(4'ha):(4'ha)];
      reg133 <= reg128;
      reg134 <= wire122;
    end
  assign wire135 = $signed(({$unsigned((8'ha6)), (^reg125[(1'h0):(1'h0)])} ?
                       ($signed(reg126) ?
                           $signed($unsigned(reg134)) : reg130) : (~&$unsigned((8'hb8)))));
  always
    @(posedge clk) begin
      reg136 <= reg128[(2'h3):(1'h1)];
    end
endmodule

module module44
#(parameter param91 = {(|(~|(~|((8'ha2) << (8'hbd)))))}, 
parameter param92 = (~|(param91 ? ((8'hb9) ? ({param91, param91} ? param91 : (param91 != param91)) : param91) : (^~(param91 ? param91 : (8'haa))))))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire48;
  input wire [(4'hf):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 reg58,
                 reg57,
                 reg50,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= wire47;
      reg50 <= {$signed((8'hb6)), $signed(wire47)};
    end
  assign wire51 = (|{wire46[(4'h9):(1'h1)]});
  assign wire52 = reg49[(4'ha):(3'h4)];
  assign wire53 = wire46[(1'h0):(1'h0)];
  assign wire54 = (wire48 & ($signed(($signed(wire53) ?
                          (wire53 < wire47) : $unsigned(reg49))) ?
                      (8'h9c) : wire46));
  assign wire55 = (~^$signed(((&wire51[(3'h4):(2'h3)]) ?
                      $unsigned((-wire48)) : $unsigned({wire52}))));
  assign wire56 = {({({wire48, wire54} <<< (+reg50)),
                          wire47[(4'h9):(2'h3)]} < $signed(((wire45 ?
                              (8'hb6) : wire51) ?
                          (-(8'ha4)) : reg49))),
                      (((^(wire47 ? wire52 : wire51)) & wire47[(4'he):(3'h7)]) ?
                          ({{wire45, wire54},
                              wire52[(2'h3):(2'h2)]} * ((reg50 & wire45) == wire53)) : ($unsigned($unsigned(reg49)) ?
                              $unsigned($signed(wire52)) : (~&wire52[(3'h5):(3'h5)])))};
  always
    @(posedge clk) begin
      reg57 <= $unsigned({((+{wire45, wire46}) || $signed((wire46 ?
              (8'ha8) : wire46)))});
    end
  always
    @(posedge clk) begin
      reg58 <= wire55;
    end
  assign wire59 = wire53[(3'h4):(3'h4)];
  assign wire60 = $unsigned(wire53);
  assign wire61 = ($signed($unsigned((reg57 >> wire55))) != ({$unsigned(((8'hbe) >= wire55))} || ((wire45 > (wire52 || (7'h40))) ?
                      ((wire56 ? wire52 : wire46) ?
                          $unsigned(wire48) : {wire45, wire59}) : wire52)));
  assign wire62 = ((^wire54) <<< wire60[(4'h8):(3'h4)]);
  always
    @(posedge clk) begin
      reg63 <= ((~(|$signed(wire54[(3'h4):(1'h1)]))) * {({(8'hab),
              (reg49 ? (8'hb4) : (8'ha5))} ^ ($signed(wire47) >> (reg50 ?
              wire61 : wire47))),
          (((wire51 >> reg57) <= $signed((8'hbe))) || wire59[(4'hf):(1'h1)])});
      if (reg63)
        begin
          if (reg58)
            begin
              reg64 <= (+reg57);
              reg65 <= (wire47 ?
                  $signed((~$signed($unsigned(wire45)))) : (wire54 ?
                      {(&wire56[(4'ha):(3'h4)]),
                          $signed((reg57 ? wire61 : wire53))} : (8'hb9)));
              reg66 <= {(wire56 ?
                      wire59[(2'h3):(1'h0)] : {$signed($unsigned((8'hb1))),
                          reg63})};
            end
          else
            begin
              reg64 <= reg58;
            end
          reg67 <= (wire53[(3'h6):(3'h5)] ?
              $unsigned((reg65 ?
                  ((wire54 != reg63) ?
                      (reg58 ~^ wire62) : $signed(reg57)) : reg50)) : $signed(wire59));
        end
      else
        begin
          reg64 <= (({((~^reg49) >= reg65[(4'he):(4'hc)])} >>> reg58) ?
              (reg64 ?
                  $unsigned(($signed((8'hb5)) ?
                      reg57[(4'hb):(2'h3)] : (!wire60))) : wire48) : (wire62[(3'h5):(2'h3)] ?
                  {$signed((wire48 ?
                          wire48 : wire48))} : ($signed((wire60 == wire59)) ~^ reg58)));
          reg65 <= $signed($signed(wire45));
          reg66 <= wire52[(1'h1):(1'h1)];
          if (wire45[(1'h0):(1'h0)])
            begin
              reg67 <= $signed($unsigned((~(~&reg65))));
              reg68 <= wire60[(4'hc):(4'h8)];
              reg69 <= ({wire60,
                  ((~&wire53) ?
                      wire55[(1'h0):(1'h0)] : $signed($unsigned(wire60)))} << wire47);
            end
          else
            begin
              reg67 <= ($signed((((8'hbf) ? (~&wire61) : wire46) ?
                      wire55 : ($signed(wire59) - reg49[(3'h5):(1'h0)]))) ?
                  wire46 : $signed(wire62[(2'h2):(2'h2)]));
              reg68 <= $signed($unsigned((reg58 ?
                  reg68[(2'h3):(1'h1)] : ((wire51 ?
                      reg49 : reg63) ^ (~&reg58)))));
              reg69 <= (wire52[(3'h7):(1'h1)] & ($unsigned($unsigned((wire52 ?
                      reg63 : reg65))) ?
                  wire46 : ((reg64 ?
                          (wire59 ? wire56 : wire46) : $signed(wire51)) ?
                      (reg57[(3'h7):(1'h0)] ?
                          ((8'hba) << wire45) : {(8'hbc),
                              wire61}) : reg57[(4'h9):(2'h3)])));
              reg70 <= (^~(|{$signed(reg49[(4'hc):(4'hb)]),
                  ((+wire46) ? wire61 : wire45)}));
              reg71 <= $signed({(reg67 || (~^(wire55 + (8'hb5))))});
            end
        end
      if (wire52)
        begin
          reg72 <= $unsigned(wire45[(3'h4):(2'h2)]);
          reg73 <= wire52;
          reg74 <= (wire48[(5'h10):(4'hc)] & $signed($signed(({wire56} - $unsigned((8'ha0))))));
          if ((((({wire46, reg74} ?
                  reg74[(4'hc):(4'h8)] : (reg50 ?
                      reg69 : wire60)) << {$unsigned(reg57)}) ?
              $unsigned(((wire52 ?
                  (8'ha0) : wire56) ~^ (8'haa))) : (wire47[(2'h3):(2'h2)] ?
                  wire53 : $signed((^~reg74)))) > (reg73[(4'hf):(3'h5)] ?
              wire51[(1'h0):(1'h0)] : {$signed(wire45[(1'h1):(1'h0)]),
                  wire62[(3'h4):(1'h1)]})))
            begin
              reg75 <= (+reg65);
              reg76 <= $signed($signed(((~(wire59 ? reg66 : wire56)) ?
                  $signed(reg73) : {reg63, (wire46 ? (8'ha3) : wire61)})));
              reg77 <= (reg74 || (reg68 ?
                  (((-reg66) | $signed(wire54)) ?
                      (reg63 ?
                          (reg76 ?
                              wire52 : (7'h41)) : wire48) : wire54) : ((~|reg57[(2'h2):(1'h0)]) ?
                      $unsigned({reg75,
                          wire47}) : $signed(wire53[(4'h8):(3'h5)]))));
              reg78 <= (wire54 ?
                  (((wire45 || reg74[(4'hc):(4'hc)]) ?
                          reg57[(3'h7):(2'h3)] : wire56) ?
                      (((^~reg69) ?
                          $unsigned(reg74) : (wire51 ?
                              wire52 : (8'h9c))) >> (reg63[(4'h8):(2'h3)] ?
                          reg68 : reg68[(3'h6):(1'h0)])) : reg63) : ($unsigned($signed(reg69)) ?
                      $unsigned(reg67[(2'h3):(2'h2)]) : $unsigned((7'h42))));
              reg79 <= reg57;
            end
          else
            begin
              reg75 <= wire54[(1'h0):(1'h0)];
              reg76 <= ($signed($unsigned((|$unsigned(reg64)))) ?
                  {wire60} : $signed((wire45 ?
                      ((|wire54) ?
                          $signed(reg72) : $unsigned(reg71)) : {(reg66 ?
                              reg49 : reg50),
                          reg49[(1'h0):(1'h0)]})));
              reg77 <= ($unsigned((8'hbc)) ?
                  wire61 : $unsigned($signed(($unsigned(reg73) ^ (+(7'h43))))));
              reg78 <= ($signed($unsigned($signed((reg65 ? reg78 : reg74)))) ?
                  {(!(reg73[(5'h11):(2'h3)] ? reg77 : $unsigned(reg66))),
                      reg66} : $signed((~^(reg70[(1'h0):(1'h0)] ?
                      {reg77, reg50} : $unsigned((8'hb1))))));
              reg79 <= $signed(wire46);
            end
        end
      else
        begin
          reg72 <= (~^(8'ha2));
        end
      reg80 <= $signed(wire47);
      reg81 <= $signed($unsigned(wire60));
    end
  assign wire82 = $signed((8'ha2));
  assign wire83 = wire62[(4'h8):(2'h2)];
  assign wire84 = $unsigned((reg49 >= (~((reg78 ? (8'hbe) : reg73) ^~ {reg72,
                      wire46}))));
  assign wire85 = ($signed((-$signed(reg73))) > ({(~$unsigned(reg66))} ?
                      $signed((~&wire84[(3'h4):(2'h2)])) : (|{(wire84 ?
                              (8'haf) : wire84)})));
  assign wire86 = $signed((~^reg67));
  assign wire87 = (~|{(~&reg65), reg71[(2'h2):(1'h0)]});
  assign wire88 = $unsigned($signed((+((reg64 + reg78) | wire48[(4'hd):(1'h1)]))));
  assign wire89 = (~^({wire85[(3'h4):(1'h1)]} ?
                      {(reg50 != $unsigned(reg57))} : (^$unsigned((+reg63)))));
  assign wire90 = (reg76[(4'hf):(3'h5)] ?
                      wire62[(4'hc):(3'h6)] : (|$unsigned({(~^wire52),
                          $signed(wire61)})));
endmodule
