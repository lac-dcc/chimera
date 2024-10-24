module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire153;
  wire signed [(3'h5):(1'h0)] wire154;
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire57,
                 wire56,
                 wire55,
                 wire5,
                 wire6,
                 wire53,
                 wire136,
                 wire137,
                 wire138,
                 wire140,
                 wire153,
                 wire154,
                 reg157,
                 reg156,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire5 = (^~(wire1 == $unsigned((wire3[(1'h1):(1'h0)] ~^ (wire1 || wire3)))));
  assign wire6 = wire4;
  module7 #() modinst54 (.clk(clk), .wire8(wire6), .wire9(wire5), .y(wire53), .wire12(wire3), .wire11(wire2), .wire10(wire1));
  assign wire55 = wire0;
  assign wire56 = wire3[(2'h3):(1'h0)];
  assign wire57 = $unsigned(wire3);
  module58 #() modinst131 (.y(wire130), .wire59(wire53), .wire61(wire1), .wire60(wire3), .wire62(wire0), .clk(clk));
  assign wire132 = ((($unsigned($unsigned(wire0)) ?
                           (wire55[(1'h1):(1'h1)] ?
                               (wire3 ? wire1 : wire1) : {wire1,
                                   wire3}) : wire2) ?
                       $signed($unsigned(wire1)) : wire56[(3'h6):(2'h3)]) >> ((-(^(|(8'hb3)))) && (wire56 <= (~|(wire0 && (8'ha3))))));
  assign wire133 = ($unsigned(wire56) ?
                       ({(wire6[(4'hb):(2'h2)] ?
                                   {(8'ha1), wire56} : $unsigned(wire0)),
                               $signed(wire56)} ?
                           wire0[(4'h9):(2'h3)] : $signed(wire5[(4'hf):(3'h6)])) : (({(wire3 ?
                                   (8'ha7) : (8'h9f))} ?
                           (~$unsigned(wire130)) : wire132[(3'h5):(3'h4)]) <= $signed($unsigned((wire5 ?
                           wire2 : wire3)))));
  module7 #() modinst135 (wire134, clk, wire55, wire133, wire5, wire0, wire53);
  assign wire136 = wire4;
  assign wire137 = wire130;
  module58 #() modinst139 (wire138, clk, wire57, wire56, wire133, wire4);
  assign wire140 = {(8'ha7),
                       ({$signed(((8'hb1) <= wire2)),
                           (((8'hb1) << wire2) >= {wire53,
                               wire55})} >= (((wire134 & wire53) - $unsigned((8'ha4))) ?
                           ($unsigned(wire138) > wire56[(1'h1):(1'h0)]) : $signed((~^wire3))))};
  always
    @(posedge clk) begin
      reg141 <= ($unsigned(wire137[(4'h8):(3'h6)]) ?
          ($signed((wire56 >> (wire57 ? wire132 : wire5))) ?
              wire4[(4'hc):(4'h9)] : (((wire6 ?
                      (7'h40) : (8'hb8)) != $signed(wire130)) ?
                  wire134[(2'h3):(2'h2)] : ($signed(wire53) ?
                      (+wire3) : (wire133 ?
                          wire5 : wire134)))) : ($signed((8'h9c)) ^~ $unsigned({$unsigned(wire136),
              (&(7'h44))})));
      reg142 <= $unsigned((^~$unsigned($unsigned(wire57[(3'h4):(1'h0)]))));
      if (($unsigned($unsigned($unsigned((|wire2)))) ?
          (^~(wire136 ?
              ((wire57 ? wire134 : (8'h9f)) <= ((8'ha1) ?
                  wire57 : wire57)) : (~^$signed(wire134)))) : $signed($unsigned($signed(((8'ha9) ~^ (8'h9d)))))))
        begin
          reg143 <= (($unsigned({wire1, $signed(reg142)}) ?
                  reg142[(2'h2):(1'h1)] : $signed(((wire4 ? (8'hb9) : (8'h9e)) ?
                      (-wire134) : $signed(wire133)))) ?
              $signed({wire3[(5'h10):(3'h6)],
                  $signed((~(8'hab)))}) : ((reg142 - (^(wire0 ?
                  wire5 : wire136))) ~^ wire137[(5'h10):(4'hb)]));
          reg144 <= wire57;
          if ((8'hbe))
            begin
              reg145 <= wire53[(3'h7):(3'h5)];
              reg146 <= ((&wire5[(1'h0):(1'h0)]) ?
                  ($signed($unsigned(wire130[(4'h8):(2'h3)])) | {($signed(wire133) ?
                          $signed(wire137) : reg145),
                      {(wire134 ? reg145 : wire0),
                          $unsigned(wire56)}}) : ((~|($signed(wire0) ?
                      (8'hbd) : $unsigned(wire1))) >> ($unsigned((wire53 - (7'h43))) < (((8'hbb) ?
                          wire3 : (8'hbb)) ?
                      {reg142} : wire137[(3'h6):(3'h6)]))));
              reg147 <= (^wire137[(1'h1):(1'h1)]);
              reg148 <= ({$signed($unsigned($signed(wire5)))} || wire0);
            end
          else
            begin
              reg145 <= reg146[(3'h5):(3'h5)];
              reg146 <= $unsigned((^~wire5));
              reg147 <= (wire4 ~^ wire57[(1'h1):(1'h0)]);
            end
          if ((~({((8'hbf) - $signed(wire130))} & ((wire53[(4'he):(4'hc)] ^~ reg143) ?
              (8'hbb) : wire56[(2'h3):(2'h3)]))))
            begin
              reg149 <= wire133;
            end
          else
            begin
              reg149 <= (wire0 & $unsigned($signed(({reg148, reg147} ?
                  (wire6 ~^ wire5) : reg141[(5'h10):(3'h4)]))));
              reg150 <= (wire6 ?
                  $signed(wire56[(2'h3):(2'h3)]) : $signed(({$unsigned(reg141),
                      (wire130 ^~ reg149)} ^ $signed((8'haa)))));
            end
        end
      else
        begin
          reg143 <= ((|wire140) + ($unsigned(reg142) ?
              (~|$signed($signed(wire138))) : (($unsigned(reg150) << reg142[(4'h8):(2'h2)]) <= ((wire55 >>> (8'h9f)) <<< $signed(wire140)))));
          reg144 <= (~(~{((~&wire1) ? reg147[(3'h4):(2'h3)] : (~|wire57)),
              wire137[(4'hb):(3'h4)]}));
          reg145 <= $signed(((((reg149 ? wire56 : reg143) <= $signed(wire136)) ?
              ({wire134, (8'ha2)} ?
                  $signed(wire137) : $signed(reg143)) : $signed((wire5 >> wire2))) || (~($unsigned(wire55) ?
              $signed(wire55) : $signed(wire133)))));
          if ({(reg141[(1'h0):(1'h0)] ?
                  (reg150 ?
                      (^~(wire2 != wire57)) : ($signed((8'haa)) != (~|(8'ha8)))) : wire134[(4'hd):(4'hd)])})
            begin
              reg146 <= reg148[(1'h0):(1'h0)];
              reg147 <= ({(wire57 ^ (~&$unsigned(wire136))),
                  $signed((|wire134[(3'h7):(3'h6)]))} < wire136[(4'hb):(3'h7)]);
              reg148 <= (^(7'h41));
              reg149 <= ($signed($signed($signed($unsigned(wire53)))) ?
                  $unsigned(((7'h40) <= $signed((reg141 ?
                      wire130 : reg147)))) : $unsigned((|reg148[(1'h1):(1'h1)])));
            end
          else
            begin
              reg146 <= ($signed((wire5[(4'hc):(4'h8)] & {(|wire55),
                  (8'h9f)})) + (({(wire53 ? reg149 : reg144)} ?
                  $unsigned((wire3 - wire0)) : (+reg142)) ^~ $unsigned(reg149[(1'h1):(1'h1)])));
              reg147 <= $unsigned(($unsigned(reg146) || (8'ha5)));
              reg148 <= wire6[(4'hb):(2'h2)];
            end
        end
      reg151 <= $signed($signed($signed({(|wire140), $signed(reg144)})));
      reg152 <= reg143;
    end
  assign wire153 = $unsigned($unsigned({wire140[(3'h4):(1'h1)]}));
  module68 #() modinst155 (.wire71(wire4), .y(wire154), .wire73(wire57), .clk(clk), .wire69(wire1), .wire70(wire0), .wire72(wire6));
  always
    @(posedge clk) begin
      reg156 <= {(!(~((wire137 ^~ reg149) * $signed((8'h9f)))))};
      reg157 <= ($signed(reg150[(2'h3):(2'h2)]) >= wire3);
    end
endmodule

module module58  (y, clk, wire59, wire60, wire61, wire62);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire59;
  input wire signed [(4'h8):(1'h0)] wire60;
  input wire [(4'h8):(1'h0)] wire61;
  input wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  wire [(4'hb):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire98;
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire126,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire100,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire98,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 (1'h0)};
  assign wire63 = (^{wire62[(3'h7):(3'h7)]});
  assign wire64 = $signed(($signed((~|wire60[(3'h4):(3'h4)])) ^~ ((+(^~wire60)) ?
                      $signed((wire59 ~^ (8'hab))) : wire61)));
  assign wire65 = (wire63 << ($unsigned(wire60) * $unsigned((~^(wire62 ?
                      wire62 : (8'had))))));
  assign wire66 = $unsigned(wire65[(4'h8):(1'h1)]);
  assign wire67 = {(($unsigned(wire63[(4'hc):(3'h4)]) ?
                              ((!wire59) ?
                                  {wire59} : (!wire61)) : (wire65[(3'h5):(1'h1)] << ((8'ha8) ?
                                  wire60 : wire64))) ?
                          wire65 : wire61[(3'h6):(3'h6)])};
  module68 #() modinst99 (wire98, clk, wire62, wire59, wire63, wire61, wire67);
  assign wire100 = ((+(((^~wire67) ? $unsigned(wire63) : wire62) ?
                       $unsigned((wire67 ?
                           wire67 : (8'ha5))) : ((!(8'ha0)) & $signed(wire61)))) >= (wire65[(3'h6):(1'h0)] ?
                       $unsigned($signed({(8'hae)})) : $signed((wire63[(2'h2):(1'h1)] ?
                           wire63 : {(8'had)}))));
  always
    @(posedge clk) begin
      if ((-(((^~$signed(wire62)) > ($signed(wire59) ?
          $signed(wire67) : ((7'h42) != wire66))) - wire64[(1'h1):(1'h1)])))
        begin
          reg101 <= {$unsigned((~((&wire66) ? wire60 : wire62[(2'h3):(2'h3)]))),
              (-$signed((wire61[(3'h4):(2'h3)] ^~ wire60)))};
        end
      else
        begin
          reg101 <= (wire61 ? wire98 : wire64[(2'h2):(1'h0)]);
          reg102 <= $signed(($signed($unsigned($signed(wire66))) ?
              wire60 : (-$signed(((7'h44) ? (8'hb7) : wire63)))));
        end
      reg103 <= $signed({(-(wire60 > (wire63 << reg101))), wire63});
      reg104 <= wire98;
      reg105 <= ((~|wire64) ? wire59 : $signed(wire59[(3'h7):(2'h3)]));
      reg106 <= ({reg104[(4'hb):(3'h6)]} ?
          $signed((reg101[(4'h8):(2'h3)] ^~ ($unsigned(reg101) ?
              wire66[(5'h14):(2'h2)] : $signed(reg101)))) : $unsigned(wire64[(3'h7):(1'h0)]));
    end
  assign wire107 = $unsigned((wire65[(1'h1):(1'h0)] ?
                       (^$unsigned($signed(reg105))) : ((wire98 >>> reg102) ?
                           $unsigned({(7'h42)}) : (|(+wire98)))));
  assign wire108 = wire62[(4'h8):(2'h3)];
  assign wire109 = (8'hab);
  assign wire110 = ((-(8'ha8)) < ($signed(((~|(8'hbe)) ?
                       (wire108 ?
                           wire64 : reg105) : wire100[(1'h1):(1'h1)])) != (~&$unsigned(((8'hbb) ?
                       (8'hb9) : wire65)))));
  assign wire111 = (wire108[(3'h7):(2'h3)] && wire66[(4'hd):(3'h7)]);
  module112 #() modinst127 (.wire115(wire62), .wire114(wire65), .wire113(wire66), .wire116(reg106), .clk(clk), .y(wire126), .wire117(wire109));
  assign wire128 = (^wire61[(4'h8):(3'h6)]);
  assign wire129 = ($unsigned((&wire100[(4'ha):(3'h5)])) >> (((wire65 ?
                       wire59[(4'hc):(4'ha)] : {reg104}) | wire66[(5'h13):(5'h10)]) >= {(8'ha8)}));
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire37;
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire50,
                 wire41,
                 wire40,
                 wire39,
                 wire13,
                 wire37,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire13 = $unsigned($signed(($unsigned($unsigned(wire10)) ~^ (-{wire8}))));
  module14 #() modinst38 (.wire18(wire8), .wire17(wire11), .wire19(wire12), .wire15(wire9), .clk(clk), .y(wire37), .wire16(wire10));
  assign wire39 = {wire11};
  assign wire40 = wire9;
  assign wire41 = (wire11 ?
                      {({(wire39 ? wire12 : wire9)} <<< ((wire37 ?
                                  (8'hbe) : wire40) ?
                              (wire13 << wire11) : (8'hb5)))} : wire39);
  always
    @(posedge clk) begin
      reg42 <= (wire11 * wire39);
      if ((($unsigned(((|wire8) ? $signed(wire11) : $signed(wire39))) ?
          wire13[(3'h7):(3'h6)] : wire37[(3'h4):(2'h2)]) ~^ wire40[(1'h0):(1'h0)]))
        begin
          reg43 <= (|$signed($unsigned(wire40[(4'hf):(4'hb)])));
          if (($unsigned($signed($signed($unsigned((8'hb9))))) != wire12))
            begin
              reg44 <= $unsigned(($unsigned($unsigned(wire41)) ?
                  $signed((wire10 ?
                      ((7'h42) & wire41) : (wire39 ?
                          wire40 : wire39))) : {{wire39}, wire12}));
              reg45 <= $unsigned(wire40[(2'h2):(1'h1)]);
              reg46 <= $signed($unsigned($signed($unsigned((+wire39)))));
            end
          else
            begin
              reg44 <= reg43;
              reg45 <= (~(8'h9c));
            end
          reg47 <= ((($signed($unsigned(reg42)) ?
              {reg44[(3'h6):(3'h5)]} : (~|wire8)) | reg45) && wire11[(4'hf):(2'h2)]);
          reg48 <= $unsigned(wire41[(3'h4):(2'h3)]);
          reg49 <= $unsigned($signed((wire8 ?
              (~&(-reg48)) : wire9[(5'h13):(3'h7)])));
        end
      else
        begin
          reg43 <= wire10[(4'h9):(2'h2)];
          reg44 <= reg48[(4'h8):(2'h3)];
        end
    end
  assign wire50 = wire9[(4'hf):(2'h3)];
  always
    @(posedge clk) begin
      reg51 <= {$signed(($unsigned((|(8'ha9))) << ((-reg48) == {reg45})))};
      reg52 <= ({((8'hb9) | ((wire40 < wire8) ^ (reg47 >> wire12))),
          ($unsigned(reg48[(3'h6):(3'h4)]) && ({wire13, (8'hbe)} ?
              $unsigned(reg48) : (^wire9)))} * ($unsigned(reg45[(3'h6):(2'h2)]) ?
          (~reg51) : (~&$unsigned((wire41 ? (8'ha3) : wire50)))));
    end
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg34,
                 reg33,
                 reg32,
                 reg25,
                 (1'h0)};
  assign wire20 = wire18[(2'h3):(1'h0)];
  assign wire21 = wire15;
  assign wire22 = (~^(~&wire17[(3'h6):(3'h5)]));
  assign wire23 = wire22[(3'h5):(2'h3)];
  assign wire24 = wire21;
  always
    @(posedge clk) begin
      reg25 <= ($unsigned($unsigned(wire23[(4'hb):(1'h1)])) <= (wire21 ?
          {wire21[(1'h0):(1'h0)], wire17} : ((^$signed((8'ha5))) ?
              ($signed(wire15) ? (wire15 && (8'h9f)) : wire24) : {(8'hb2),
                  wire15})));
    end
  assign wire26 = (((!$unsigned((&wire23))) < (8'hbe)) << wire24[(3'h7):(2'h2)]);
  assign wire27 = {$signed(wire19)};
  assign wire28 = $unsigned(($unsigned({(wire23 ?
                          wire27 : wire16)}) + $signed($unsigned($signed((8'h9e))))));
  assign wire29 = $signed($signed($signed((7'h40))));
  assign wire30 = ((((!wire26) || $signed(wire29[(2'h2):(1'h1)])) | $unsigned($unsigned((wire15 != wire15)))) ?
                      ({$signed($signed(wire17)), ((^(8'haf)) == (8'hb7))} ?
                          wire17 : $signed(($unsigned(wire24) ?
                              (wire22 ?
                                  (8'ha7) : wire20) : $signed(wire28)))) : wire28);
  assign wire31 = $unsigned($signed($unsigned((~(wire17 ? wire27 : (8'ha6))))));
  always
    @(posedge clk) begin
      reg32 <= (($unsigned((^$unsigned(wire17))) ?
          (wire17[(3'h6):(2'h3)] ^~ reg25[(2'h3):(1'h1)]) : (((wire31 >= (8'hb1)) ?
              (!reg25) : (wire19 ? reg25 : wire29)) != ((wire23 << wire21) ?
              wire18 : wire20[(3'h6):(2'h3)]))) && $signed($signed(wire28[(5'h13):(1'h1)])));
      reg33 <= $signed($unsigned((({(8'ha7)} ~^ wire20) ?
          reg32 : ($signed(wire17) > (wire20 ? wire30 : reg25)))));
      reg34 <= ($unsigned(reg25[(1'h1):(1'h1)]) == (^{wire16}));
    end
  assign wire35 = $signed((^~wire30));
  assign wire36 = (((8'hb7) ?
                      wire31 : wire19) <= ((reg32[(4'hd):(3'h4)] - {$signed(wire27),
                          (wire27 ? wire35 : wire29)}) ?
                      (({reg25, reg25} ?
                          $signed((8'h9d)) : $unsigned(wire35)) & wire15) : (^~(~&wire31[(4'hd):(4'hc)]))));
endmodule

module module112  (y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire117;
  input wire signed [(4'h9):(1'h0)] wire116;
  input wire [(5'h11):(1'h0)] wire115;
  input wire signed [(4'h8):(1'h0)] wire114;
  input wire signed [(3'h4):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire118;
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire118,
                 reg119,
                 (1'h0)};
  assign wire118 = wire116[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg119 <= wire116;
    end
  assign wire120 = wire118[(2'h2):(1'h1)];
  assign wire121 = wire116[(4'h9):(2'h3)];
  assign wire122 = (~|$signed(wire118[(3'h4):(2'h2)]));
  assign wire123 = {wire113, wire121[(3'h4):(3'h4)]};
  assign wire124 = (~&(wire113[(3'h4):(2'h2)] ?
                       ($signed(wire116[(4'h9):(1'h0)]) ?
                           $signed($signed(wire120)) : {wire114,
                               wire114[(3'h6):(3'h6)]}) : {$unsigned($signed(wire114))}));
  assign wire125 = (8'hab);
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire [(4'h9):(1'h0)] wire72;
  input wire [(4'h8):(1'h0)] wire71;
  input wire [(4'h8):(1'h0)] wire70;
  input wire [(4'ha):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 reg91,
                 reg90,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg74 <= wire71;
      reg75 <= $signed(wire73);
      if (wire69)
        begin
          reg76 <= (((reg74[(3'h7):(1'h0)] & ((wire69 ? wire73 : wire70) ?
                  $unsigned(wire72) : $unsigned(wire69))) ~^ wire69[(4'ha):(4'ha)]) ?
              (~$signed(wire70)) : ({((reg75 <<< (8'hbf)) ?
                      wire73 : reg75)} != (^wire73[(3'h4):(2'h2)])));
          if (({(~^(^$signed(reg74))), reg75[(3'h5):(2'h3)]} + (reg76 ?
              wire69 : (~^wire71[(2'h3):(2'h3)]))))
            begin
              reg77 <= (~(reg74[(3'h5):(1'h0)] ?
                  $signed($unsigned($signed((8'h9c)))) : wire71[(1'h1):(1'h0)]));
              reg78 <= reg74[(4'hb):(4'h8)];
            end
          else
            begin
              reg77 <= (~|wire72);
              reg78 <= ($unsigned((+(+((8'h9c) >= reg78)))) ?
                  ({reg75[(1'h1):(1'h0)],
                      reg74} - wire70[(3'h7):(1'h0)]) : ($signed(($unsigned(wire72) ?
                          wire72 : {reg74, reg77})) ?
                      ({$unsigned(wire70), $unsigned(wire71)} ?
                          reg78[(4'h8):(1'h0)] : ((wire71 < (8'haa)) ?
                              reg74 : wire73[(1'h1):(1'h0)])) : (^wire72)));
              reg79 <= ($signed(wire71[(3'h7):(3'h5)]) ?
                  $signed(reg76) : {(((reg77 ? wire72 : reg74) ?
                              $signed(reg78) : {reg75}) ?
                          $signed(reg76[(2'h3):(1'h0)]) : {(reg77 ^~ wire73)})});
              reg80 <= $unsigned((reg75[(3'h4):(1'h1)] >= (~($unsigned(wire73) >> wire70))));
              reg81 <= ((~&(~^reg79[(4'hc):(3'h4)])) ?
                  reg75 : (~^(&$unsigned(reg79[(3'h5):(1'h1)]))));
            end
          reg82 <= reg78[(3'h7):(3'h6)];
          reg83 <= reg79;
        end
      else
        begin
          reg76 <= (8'h9c);
          reg77 <= reg76[(4'ha):(2'h2)];
          reg78 <= (reg82 > $signed((reg82[(4'ha):(3'h4)] > ($unsigned(reg79) >= $signed(wire71)))));
        end
      reg84 <= (reg77[(1'h1):(1'h1)] == {$unsigned(wire72[(1'h0):(1'h0)])});
      reg85 <= (7'h42);
    end
  assign wire86 = ($unsigned($signed($unsigned(reg78[(4'hb):(4'hb)]))) ?
                      reg79 : $unsigned((&reg79[(5'h10):(4'h9)])));
  assign wire87 = $signed((~^reg74));
  assign wire88 = ($unsigned((((~^wire70) ?
                          (wire87 != reg85) : wire73) ~^ ((reg83 ?
                              wire86 : wire69) ?
                          wire71 : reg74[(1'h1):(1'h1)]))) ?
                      $signed(reg76) : $unsigned((($unsigned(reg85) ?
                              $signed(wire73) : $signed(reg75)) ?
                          reg83 : $signed(reg82[(1'h0):(1'h0)]))));
  assign wire89 = reg75[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg90 <= reg74[(1'h1):(1'h0)];
      reg91 <= reg76;
    end
  assign wire92 = reg91;
  assign wire93 = $unsigned($unsigned((wire70 && (((8'hbf) != reg74) ?
                      (&wire86) : $signed(reg91)))));
  assign wire94 = (wire73 + wire87);
  assign wire95 = reg74[(3'h7):(2'h2)];
  assign wire96 = wire93[(5'h14):(1'h1)];
  assign wire97 = $unsigned(wire94);
endmodule
