module top
#(parameter param145 = ((~^((((7'h40) & (8'hb7)) ? ((8'ha0) <= (8'ha6)) : (^(8'ha1))) < (((8'hab) >= (7'h43)) >>> (~&(8'hb7))))) * ((&((~^(7'h40)) ~^ ((8'ha7) ? (8'h9d) : (8'hb2)))) ^ (({(7'h41), (8'ha6)} - ((8'hbe) ? (8'h9d) : (7'h41))) != (((8'hb2) ? (8'ha5) : (7'h44)) ^ (+(7'h43)))))), 
parameter param146 = ((({(8'haa), (~param145)} * {{param145}}) ? (~&(param145 >>> ((8'hb4) ? param145 : param145))) : ((+(!param145)) != param145)) << (8'hbf)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire142;
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  assign y = {wire144,
                 wire129,
                 wire21,
                 wire19,
                 wire131,
                 wire142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  module4 #() modinst20 (.wire8(wire1), .wire6(wire3), .wire7(wire2), .y(wire19), .wire5(wire0), .clk(clk));
  assign wire21 = wire2[(3'h7):(3'h4)];
  module22 #() modinst130 (.wire24(wire19), .wire25(wire0), .wire23(wire21), .wire26(wire1), .clk(clk), .y(wire129), .wire27(wire3));
  module4 #() modinst132 (wire131, clk, wire129, wire19, wire3, wire21);
  always
    @(posedge clk) begin
      if (wire2)
        begin
          if (wire2[(4'h9):(1'h1)])
            begin
              reg133 <= ($unsigned((wire0 ?
                      wire131 : ((~&wire2) | $unsigned((8'ha5))))) ?
                  (!wire19[(3'h6):(3'h6)]) : wire0);
              reg134 <= ($unsigned(wire0) ?
                  (wire21[(4'h9):(2'h2)] ?
                      $unsigned($signed((wire131 << wire0))) : $unsigned($signed($signed(wire3)))) : wire131[(3'h4):(3'h4)]);
            end
          else
            begin
              reg133 <= ({(({(8'ha3)} ?
                          {wire129, wire1} : (reg134 ? wire131 : wire131)) ?
                      (((8'hb4) * reg134) && wire21[(4'hb):(3'h4)]) : wire1),
                  ($unsigned($unsigned((8'h9f))) ?
                      ((~^(8'hbd)) ?
                          {wire2, reg133} : (reg134 ?
                              wire0 : wire19)) : (wire1 ?
                          ((8'hbb) ?
                              reg133 : wire1) : (wire129 >>> wire3)))} | (&(reg134[(4'h8):(3'h4)] && ((&reg133) ?
                  wire129 : (8'hbb)))));
              reg134 <= $signed(wire0);
            end
          reg135 <= wire19[(5'h10):(4'hb)];
          reg136 <= wire2[(3'h7):(2'h3)];
        end
      else
        begin
          reg133 <= ((&wire131[(1'h0):(1'h0)]) << $unsigned(((-(wire131 < (8'hb9))) ^ (^~$unsigned(reg136)))));
          reg134 <= wire129;
          if ($unsigned(reg135))
            begin
              reg135 <= (($signed(((wire19 ? wire19 : (8'hb6)) ?
                          $signed(wire1) : (^~wire3))) ?
                      $signed(reg136) : $signed(((reg136 ?
                          wire19 : wire21) >> $unsigned(reg134)))) ?
                  (($unsigned($signed(wire3)) && reg136) * {wire19,
                      {(wire1 ? wire3 : wire131),
                          reg135}}) : (~&(((wire21 & wire19) ?
                          {reg135} : (wire1 ? wire2 : wire0)) ?
                      ({wire19} ~^ (reg133 ? wire129 : wire131)) : wire1)));
              reg136 <= wire131[(2'h2):(1'h1)];
            end
          else
            begin
              reg135 <= (^~reg136[(3'h5):(3'h4)]);
              reg136 <= wire129;
              reg137 <= ((((~&$unsigned((8'hbe))) > $unsigned(wire129)) || (({(8'hbe)} ?
                      $unsigned(wire21) : wire129) | (|{reg134}))) ?
                  (($signed($unsigned(reg135)) ?
                          (wire131[(3'h4):(1'h1)] ?
                              $signed(wire131) : $signed(reg133)) : wire131[(2'h2):(1'h0)]) ?
                      wire2[(2'h2):(1'h1)] : wire2) : (wire19[(4'h9):(4'h8)] ?
                      wire0[(4'hb):(4'h9)] : $signed(reg135[(2'h2):(1'h1)])));
              reg138 <= (~|wire19);
              reg139 <= wire129[(3'h4):(1'h1)];
            end
        end
      reg140 <= $unsigned($signed((~^((reg135 == wire19) ?
          $unsigned(reg139) : ((8'ha2) ? reg134 : reg136)))));
      reg141 <= ((reg135 < (8'hbb)) ^~ $signed((reg133[(3'h4):(1'h0)] * $signed((wire131 >> reg138)))));
    end
  module57 #() modinst143 (wire142, clk, reg139, reg136, wire21, reg135, reg141);
  assign wire144 = reg134;
endmodule

module module22
#(parameter param127 = ((((|(&(8'hb9))) ? (~&{(8'ha6)}) : (|((8'hb8) ? (8'hb5) : (8'ha6)))) | ((8'hb7) ? (8'ha5) : {{(7'h40)}, ((8'hb2) ? (8'hb1) : (8'hbb))})) ? (8'hb9) : (({{(8'hb8), (8'hba)}} + (^~{(8'ha8), (8'hb1)})) ? ((((8'hbb) ? (8'ha3) : (8'ha6)) < ((8'hba) >>> (8'hbd))) ? ((&(8'ha7)) >= ((8'ha5) & (8'hac))) : ({(8'ha4), (8'h9d)} ? ((8'hac) ? (8'ha3) : (8'hba)) : ((8'hb3) ? (8'ha2) : (7'h42)))) : {{((7'h42) ^ (8'hb9)), (!(8'h9d))}, (((8'hac) * (8'hab)) == (&(8'h9f)))})), 
parameter param128 = (-(&(param127 ~^ param127))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire123;
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  assign y = {wire126,
                 wire81,
                 wire56,
                 wire54,
                 wire123,
                 reg125,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  module28 #() modinst55 (.clk(clk), .wire29(wire27), .wire31(wire23), .y(wire54), .wire32(wire24), .wire30(wire26));
  assign wire56 = (wire23[(1'h1):(1'h1)] | (^wire27));
  module57 #() modinst82 (wire81, clk, wire25, wire26, wire54, wire24, wire56);
  always
    @(posedge clk) begin
      reg83 <= ({wire23, wire56[(4'ha):(4'ha)]} ?
          wire24 : (!$signed((|{wire56}))));
      reg84 <= ({wire23} ?
          $signed({wire26[(4'he):(1'h0)],
              wire27}) : {$signed((^~((8'ha8) <= wire27)))});
      reg85 <= (8'hb9);
      reg86 <= wire23[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg87 <= (reg83 ?
          $signed(($signed($signed(wire27)) > (8'hb0))) : $unsigned($unsigned($signed($unsigned(wire26)))));
      reg88 <= (reg83[(1'h0):(1'h0)] || wire24[(2'h2):(1'h1)]);
      reg89 <= reg87;
      reg90 <= (-$unsigned(($unsigned((reg89 ?
          (8'hb9) : wire23)) >= (~|(wire81 >> (8'h9c))))));
      if (($signed($unsigned(wire27[(3'h5):(3'h4)])) ?
          ($signed(((wire24 & wire56) - (+wire25))) ?
              wire25 : (&reg89)) : (wire24[(2'h2):(1'h1)] <= $signed((wire81[(4'h8):(1'h1)] > $signed(reg83))))))
        begin
          reg91 <= wire56[(4'hb):(4'ha)];
          reg92 <= $unsigned(wire25);
          reg93 <= wire24;
          reg94 <= $signed((-($signed($signed(wire23)) ?
              (~|(reg93 ? wire23 : reg93)) : ((wire27 > reg83) ?
                  wire54[(2'h3):(1'h1)] : $unsigned(reg91)))));
          reg95 <= ($signed($signed(reg83[(4'hc):(1'h1)])) ?
              $signed($signed(((reg87 + reg86) ?
                  wire26 : reg83[(4'ha):(3'h5)]))) : $signed(($signed($signed(wire26)) ?
                  ($signed(wire26) ?
                      (wire27 ?
                          reg85 : wire54) : $unsigned((8'haf))) : $signed($unsigned(reg90)))));
        end
      else
        begin
          reg91 <= reg95[(2'h2):(1'h0)];
          if ($signed((8'hb2)))
            begin
              reg92 <= (($unsigned($signed(reg88)) > $signed((+(7'h41)))) ?
                  ({(^~wire23[(1'h1):(1'h0)])} ?
                      (7'h40) : wire25[(4'he):(4'hd)]) : wire56);
              reg93 <= ({wire54, (&(8'ha2))} ?
                  ($unsigned(((~&reg84) + (reg85 > reg94))) - reg90) : $unsigned(reg89));
              reg94 <= ((~|reg90[(3'h6):(1'h0)]) | {wire23});
              reg95 <= ((reg84 == {wire24[(3'h4):(2'h3)]}) ^~ reg88);
              reg96 <= wire23[(3'h4):(2'h2)];
            end
          else
            begin
              reg92 <= $unsigned($unsigned((((reg87 ? reg85 : reg89) ?
                      wire27 : $signed(reg84)) ?
                  (-reg95[(1'h0):(1'h0)]) : ({(8'h9f), (8'ha7)} ?
                      wire23 : (~&(8'hb5))))));
            end
          if ((!{(reg88 ?
                  wire24[(3'h4):(2'h3)] : ((^reg90) ?
                      (~|reg91) : $unsigned(reg96)))}))
            begin
              reg97 <= (($unsigned(reg95[(2'h2):(1'h0)]) ?
                      $signed((reg92 ?
                          $unsigned(wire27) : {reg93,
                              wire23})) : ($unsigned(wire23) ?
                          (((8'haf) + (8'ha0)) != $unsigned(reg89)) : reg90)) ?
                  ((7'h41) ?
                      (-($unsigned(reg85) ?
                          {reg86, reg84} : ((8'hb4) ?
                              wire25 : wire26))) : $unsigned({reg86})) : (8'hba));
              reg98 <= wire27[(3'h5):(1'h1)];
              reg99 <= (((!{$signed(reg90), reg91}) << wire26[(4'h9):(1'h0)]) ?
                  wire26 : $unsigned(({((8'ha0) ?
                          wire27 : wire56)} > $unsigned(reg96[(3'h6):(2'h3)]))));
              reg100 <= $unsigned($signed($signed($unsigned((reg84 <= wire27)))));
            end
          else
            begin
              reg97 <= ((wire25[(5'h15):(5'h13)] ?
                  reg83[(3'h4):(2'h2)] : wire56[(5'h13):(4'hf)]) <= (~^$signed(wire81)));
              reg98 <= (reg97 ? $signed(reg92[(1'h0):(1'h0)]) : (8'hb1));
            end
          if (reg90[(5'h12):(1'h0)])
            begin
              reg101 <= (($signed($unsigned({reg95})) >= {$unsigned((+wire56))}) ?
                  $unsigned(reg93[(3'h4):(2'h2)]) : $unsigned($signed($unsigned($signed(reg85)))));
              reg102 <= (^~$signed(reg98));
            end
          else
            begin
              reg101 <= reg86[(4'h8):(3'h5)];
              reg102 <= reg83[(4'h9):(3'h4)];
            end
          reg103 <= reg89;
        end
    end
  module104 #() modinst124 (wire123, clk, wire81, wire25, reg99, reg103, wire54);
  always
    @(posedge clk) begin
      reg125 <= (^~((($signed(reg94) ? $signed(wire24) : $signed(reg83)) ?
          ($unsigned((8'ha9)) > (reg95 ?
              (8'had) : reg89)) : (-reg84)) * $unsigned(reg96)));
    end
  assign wire126 = $signed(($signed(($unsigned(wire27) ?
                           $signed(reg84) : {reg96})) ?
                       wire56[(5'h10):(4'hd)] : {$signed(reg103[(1'h0):(1'h0)])}));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = (~|((+(&{wire7, (8'ha4)})) ?
                     $signed($signed((wire7 <= wire8))) : wire5[(4'he):(1'h1)]));
  assign wire10 = ((~&((^(&wire8)) ?
                          ((wire7 ? wire5 : wire8) ?
                              (!wire5) : $unsigned((8'ha3))) : ((8'h9d) ?
                              (wire5 & wire7) : wire5[(3'h6):(1'h0)]))) ?
                      wire7 : ($unsigned($signed((8'hb6))) ?
                          $signed((((7'h41) >= wire6) + wire8)) : wire5[(4'hd):(4'ha)]));
  assign wire11 = (wire7[(1'h0):(1'h0)] >= wire9[(4'h9):(3'h6)]);
  assign wire12 = $unsigned(wire9[(2'h3):(2'h2)]);
  assign wire13 = (wire7 ?
                      wire6 : ($signed(((wire8 >= wire5) + $signed(wire6))) ?
                          wire6 : ($unsigned($unsigned((7'h44))) < wire10)));
  assign wire14 = wire9;
  assign wire15 = ($signed(wire10[(3'h7):(3'h5)]) ^ {$signed($unsigned(((8'hbb) ^ wire10))),
                      {(~|(wire7 ? wire8 : wire10))}});
  assign wire16 = (wire10 ?
                      $unsigned($signed((wire12[(3'h4):(1'h1)] >> $signed(wire11)))) : $signed($signed($signed((&(8'hac))))));
  assign wire17 = ((((-{wire5}) ? (^{wire13}) : $signed(wire15)) ?
                          ((((8'hb5) + (8'hb0)) << (wire11 ?
                                  wire16 : (8'ha8))) ?
                              (-(wire8 <= wire11)) : ({wire16,
                                  wire10} && (^wire9))) : ((!(&wire14)) > (wire13 <<< $unsigned((8'h9f))))) ?
                      ((-wire11[(1'h1):(1'h1)]) <= (wire13 >>> (wire9[(1'h1):(1'h1)] ?
                          wire14[(4'he):(4'ha)] : wire15[(1'h1):(1'h0)]))) : $signed($unsigned(($signed((8'ha3)) ?
                          $unsigned(wire15) : wire12))));
  assign wire18 = wire14[(1'h1):(1'h0)];
endmodule

module module104
#(parameter param122 = ((|(^~((~|(8'hb1)) ? ((7'h41) ? (8'h9f) : (8'hb1)) : {(8'hb0), (8'hae)}))) ? {(((+(8'hac)) * ((8'hbd) <<< (8'hb7))) ^~ (((8'ha2) < (7'h43)) | (7'h44)))} : (-(^({(8'ha4)} != ((8'hb7) ? (8'hbe) : (8'hbd)))))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire109;
  input wire signed [(2'h2):(1'h0)] wire108;
  input wire [(3'h6):(1'h0)] wire107;
  input wire [(5'h10):(1'h0)] wire106;
  input wire [(5'h10):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  assign y = {wire121,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg110,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg110 <= (~|$signed((^(-$signed(wire105)))));
    end
  assign wire111 = ($unsigned((7'h43)) > $unsigned(wire106[(1'h1):(1'h0)]));
  assign wire112 = reg110[(2'h2):(1'h1)];
  assign wire113 = wire108[(1'h1):(1'h0)];
  assign wire114 = ($unsigned($unsigned((!(wire105 <= wire105)))) ?
                       wire112 : wire109[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire108[(2'h2):(1'h0)])
        begin
          reg115 <= $signed($signed(wire108[(1'h0):(1'h0)]));
          if ((|reg110[(3'h4):(2'h3)]))
            begin
              reg116 <= (|(^~$signed((reg115 | (wire109 + wire112)))));
              reg117 <= $signed((((wire112[(3'h7):(2'h3)] ?
                      (reg116 > (8'ha7)) : wire114) ?
                  (reg115 >> {wire109, wire108}) : (^((8'hbf) ?
                      wire113 : wire111))) && (wire108[(2'h2):(1'h0)] ?
                  (^~$unsigned(wire111)) : {wire106[(4'he):(3'h6)], reg110})));
              reg118 <= (({wire107} > $signed((wire113[(2'h2):(2'h2)] >= reg116))) ?
                  wire106 : {$unsigned(wire107)});
              reg119 <= ((reg117 << (^~reg118)) ?
                  reg118[(3'h6):(3'h4)] : $unsigned(wire114[(1'h1):(1'h1)]));
              reg120 <= (wire112 ? wire106 : wire107[(3'h5):(2'h2)]);
            end
          else
            begin
              reg116 <= $unsigned(reg117[(2'h3):(2'h3)]);
              reg117 <= ($unsigned(($unsigned($signed(wire111)) - wire109)) ?
                  wire106 : (reg110[(2'h3):(2'h3)] ?
                      (~^(^wire113[(2'h3):(2'h2)])) : reg120[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg115 <= (-$unsigned((^wire107[(2'h2):(1'h0)])));
          reg116 <= wire109[(1'h1):(1'h0)];
          reg117 <= $signed(wire105);
          reg118 <= $unsigned(wire107);
          reg119 <= wire105[(4'ha):(3'h7)];
        end
    end
  assign wire121 = (((reg119[(1'h0):(1'h0)] ?
                           (8'hb1) : {(~^(8'hb3)),
                               ((8'ha7) ~^ reg117)}) >= {wire108[(1'h0):(1'h0)]}) ?
                       wire108[(1'h1):(1'h0)] : reg118[(5'h11):(3'h5)]);
endmodule

module module57
#(parameter param80 = ((!(!(|((8'hbe) << (8'hb7))))) ? (({((8'hba) ? (8'ha2) : (8'ha9))} ? {((8'hbe) < (8'hbd))} : (+((8'hbb) ? (8'hba) : (8'hb0)))) ? (~&{(&(8'haa))}) : {(((8'ha0) ? (7'h40) : (8'ha1)) ? {(8'hb1), (8'haa)} : (+(8'hb0))), (^((8'hae) != (8'haa)))}) : {(~|(-((8'hbf) ? (8'hb6) : (7'h41)))), ({((8'hb1) ? (8'hb2) : (8'ha8))} ^~ (((8'hb2) || (8'hbf)) ^ ((8'hb3) ? (7'h44) : (7'h40))))}))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire62;
  input wire [(4'hd):(1'h0)] wire61;
  input wire signed [(3'h4):(1'h0)] wire60;
  input wire signed [(2'h2):(1'h0)] wire59;
  input wire signed [(5'h14):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
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
  always
    @(posedge clk) begin
      reg63 <= {((~(8'ha7)) ?
              ((~^wire62[(3'h6):(3'h5)]) ?
                  wire61[(2'h2):(1'h0)] : (&$signed(wire61))) : (~&wire58)),
          $unsigned({(wire60 > (wire60 <<< wire59)), $unsigned(wire58)})};
      if (wire61[(2'h2):(1'h1)])
        begin
          reg64 <= $unsigned(wire62);
          reg65 <= (|((!$unsigned(wire61)) << $signed(wire60)));
          reg66 <= wire58[(2'h2):(1'h0)];
          if (wire60[(2'h3):(1'h1)])
            begin
              reg67 <= reg64;
              reg68 <= $unsigned(($signed(wire62) ?
                  reg64[(3'h6):(2'h2)] : ((8'hb3) <<< {wire62, (|wire58)})));
            end
          else
            begin
              reg67 <= (~&((wire62 >> $unsigned((~|(8'hac)))) ?
                  ((-wire58[(2'h2):(1'h1)]) ?
                      {$signed(reg66), wire59} : $unsigned((reg68 ?
                          wire58 : wire59))) : {((&reg63) ^~ reg65[(4'hb):(3'h6)])}));
            end
        end
      else
        begin
          reg64 <= reg64[(1'h0):(1'h0)];
          if ((wire59 ?
              $signed(((reg68[(1'h0):(1'h0)] != (reg65 + reg63)) > $signed($unsigned(wire59)))) : $unsigned($signed((+wire59[(2'h2):(1'h0)])))))
            begin
              reg65 <= reg67[(2'h2):(2'h2)];
              reg66 <= $unsigned((reg64[(2'h3):(1'h1)] ?
                  $unsigned(reg67) : ($signed({reg66}) ?
                      ((8'hb5) ?
                          reg68 : (wire62 ?
                              (8'hb2) : wire61)) : {(reg67 >>> wire61)})));
              reg67 <= ($signed((8'hbb)) ?
                  $unsigned(reg67[(3'h5):(1'h0)]) : ((^~((wire62 & reg67) < (wire62 ?
                      reg66 : wire60))) && $signed((&reg65[(4'h8):(3'h7)]))));
            end
          else
            begin
              reg65 <= reg64;
              reg66 <= (-$unsigned((^$signed($signed(reg68)))));
              reg67 <= reg66[(3'h7):(2'h3)];
            end
          reg68 <= wire62;
        end
    end
  always
    @(posedge clk) begin
      reg69 <= ((wire62 ?
          (~^$unsigned((wire62 ?
              (8'ha1) : reg64))) : reg64[(1'h0):(1'h0)]) >>> (&$signed(wire62)));
      reg70 <= reg68;
      reg71 <= wire60[(2'h3):(2'h2)];
    end
  assign wire72 = reg69[(4'hb):(2'h3)];
  assign wire73 = {((~reg69) ?
                          (((&(8'had)) <<< (8'ha3)) - $signed((-reg63))) : ((^~((8'ha9) != reg63)) ~^ reg66)),
                      $signed($unsigned((~|wire62)))};
  assign wire74 = (8'hbf);
  assign wire75 = wire74[(3'h4):(1'h1)];
  assign wire76 = (-{{(reg64 == (reg64 ? wire72 : reg69))}});
  assign wire77 = ($signed(wire59) ?
                      ((reg69[(4'h9):(4'h9)] < {$signed(reg71),
                          (wire58 - wire76)}) <= ((reg71[(1'h0):(1'h0)] ?
                              (wire60 ? wire76 : reg63) : reg65) ?
                          (wire73[(4'hc):(1'h0)] ~^ $unsigned(wire75)) : (8'had))) : ((((wire73 && reg69) || (reg67 ?
                                  (8'ha9) : reg68)) ?
                              reg70[(1'h0):(1'h0)] : (8'hba)) ?
                          (reg68[(4'h8):(4'h8)] <= wire74[(4'hc):(3'h5)]) : reg63));
  assign wire78 = reg68;
  assign wire79 = $signed((8'hbc));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire33 = $unsigned(wire31[(1'h0):(1'h0)]);
  assign wire34 = $signed((^{$unsigned(wire32[(1'h1):(1'h0)]),
                      $unsigned(wire31[(2'h2):(2'h2)])}));
  assign wire35 = $signed({wire30});
  assign wire36 = wire35;
  assign wire37 = ($signed(wire31) ?
                      wire36 : ((({(8'hb7), wire31} ?
                          wire32[(1'h1):(1'h1)] : wire30[(3'h6):(1'h0)]) ^~ (wire34[(4'hb):(2'h3)] | (8'h9d))) <= $signed(wire34[(4'h8):(3'h7)])));
  assign wire38 = wire36;
  assign wire39 = $signed((~&(^~$unsigned((wire36 ? wire35 : wire35)))));
  assign wire40 = $unsigned($signed((((wire34 ? wire39 : wire30) ?
                          $unsigned(wire37) : wire31) ?
                      ((7'h43) ?
                          ((8'h9e) <<< wire31) : (~&(8'h9d))) : (((7'h42) | wire36) < wire30[(4'h8):(3'h5)]))));
  assign wire41 = (wire34[(4'h9):(2'h3)] < (!({wire38[(4'h8):(4'h8)],
                      (wire35 ? wire29 : wire29)} >= ((|wire35) ?
                      wire37 : wire38))));
  always
    @(posedge clk) begin
      reg42 <= wire41;
      reg43 <= wire40;
      reg44 <= reg42[(2'h2):(2'h2)];
      reg45 <= $signed(wire32);
      reg46 <= wire37;
    end
  assign wire47 = reg46[(5'h11):(1'h0)];
  assign wire48 = wire40;
  assign wire49 = wire38[(3'h6):(1'h0)];
  assign wire50 = $signed(((wire37 ^~ (^~(wire40 | reg42))) ?
                      $signed($unsigned(((8'ha4) && wire31))) : (8'ha3)));
  assign wire51 = wire48;
  assign wire52 = ({$unsigned(($signed(wire51) == {(8'hb4), wire41}))} ?
                      ((wire47 < ($signed(wire39) << ((8'hb4) <= wire48))) * (!(^~wire29))) : $signed(((reg44 >>> $unsigned(wire41)) || (((8'hbd) ?
                          wire30 : wire40) + (wire30 <= (7'h42))))));
  assign wire53 = $signed(((wire29 || wire37) ?
                      $signed({(~^wire30)}) : (~|$unsigned((wire39 ?
                          wire38 : reg45)))));
endmodule
