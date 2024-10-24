module top
#(parameter param120 = ({((+((7'h42) ? (7'h42) : (8'hb2))) ? {(+(8'ha3))} : (&(^(7'h40))))} ? ((!(((8'ha2) ? (8'h9f) : (8'hab)) ? ((8'ha7) > (8'ha8)) : ((8'hae) ? (8'hb0) : (8'hb1)))) - ((+(^(8'h9c))) || ((~|(8'hae)) ? {(8'h9c), (7'h41)} : (~|(8'hb6))))) : {(+(((7'h44) & (8'had)) && (!(8'hb8)))), (~{(8'h9f), ((8'haa) && (8'hb2))})}), 
parameter param121 = (-param120))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire119;
  wire signed [(4'hf):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire14,
                 wire13,
                 wire12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+wire1[(4'h9):(3'h6)]))
        begin
          reg4 <= wire2[(1'h0):(1'h0)];
          reg5 <= {(~&(~&$signed(wire3[(3'h4):(1'h1)]))), wire1[(3'h6):(1'h1)]};
          reg6 <= $signed({reg4[(1'h1):(1'h0)],
              $unsigned(($unsigned(wire2) ^ (wire0 ? wire1 : (8'haa))))});
          reg7 <= {wire3};
        end
      else
        begin
          reg4 <= wire3;
        end
      reg8 <= (8'ha6);
      reg9 <= {(!{(~|$unsigned(reg7))})};
      reg10 <= (&(wire2[(3'h4):(2'h3)] - $unsigned(wire3[(5'h15):(5'h11)])));
      reg11 <= $signed((^~wire3[(2'h2):(1'h1)]));
    end
  assign wire12 = reg9[(1'h1):(1'h1)];
  assign wire13 = $unsigned($signed($signed(wire1)));
  assign wire14 = (&$unsigned($signed($signed(((8'haf) < reg9)))));
  module15 #() modinst111 (.wire16(reg10), .y(wire110), .wire18(wire12), .wire17(reg11), .clk(clk), .wire19(wire14));
  assign wire112 = reg5;
  assign wire113 = reg6;
  assign wire114 = $signed({(wire112[(1'h0):(1'h0)] ? reg10 : wire0),
                       (($signed(reg4) - (^reg8)) << ($signed(reg10) >>> reg7[(4'hd):(3'h5)]))});
  assign wire115 = $unsigned($signed($unsigned({(reg9 * reg8)})));
  assign wire116 = $unsigned((~^(~^wire112)));
  assign wire117 = $unsigned({(((reg8 ? wire116 : wire12) ?
                           reg6[(4'hf):(4'hf)] : (wire113 ?
                               wire3 : reg10)) | {$unsigned(wire1),
                           (reg5 ? wire13 : reg9)}),
                       ($signed((!wire3)) ? wire2 : (~wire13))});
  assign wire118 = {$signed((-wire13[(4'hc):(3'h5)])), reg7};
  assign wire119 = reg4[(2'h2):(1'h1)];
endmodule

module module15
#(parameter param109 = {{({((8'hab) ? (8'ha7) : (8'had)), ((8'hbe) == (8'hbe))} ? ({(8'ha8), (8'hbd)} ? ((7'h42) && (8'hb9)) : ((7'h40) ? (8'ha5) : (8'ha2))) : {(!(8'hba))})}})
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire81;
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire85,
                 wire84,
                 wire83,
                 wire41,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire49,
                 wire81,
                 reg104,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= wire16[(1'h0):(1'h0)];
    end
  assign wire21 = $signed({($signed(wire16[(3'h6):(3'h6)]) <= wire17)});
  assign wire22 = (($unsigned((~&wire16)) >>> $unsigned(wire17[(1'h1):(1'h0)])) ?
                      ((wire21[(1'h0):(1'h0)] == {(&reg20)}) - ($signed((wire16 <= wire21)) * wire21)) : {$signed(wire21[(3'h4):(3'h4)]),
                          wire21[(1'h1):(1'h0)]});
  assign wire23 = ({(^~(7'h41))} >>> (&{$unsigned($unsigned(wire22)),
                      (+{wire21, wire17})}));
  assign wire24 = $unsigned(($signed({(7'h40)}) >= (wire19 ^~ ($signed(wire17) ?
                      wire18[(1'h1):(1'h0)] : (wire17 || (8'hbf))))));
  module25 #() modinst42 (wire41, clk, wire24, reg20, wire18, wire22);
  always
    @(posedge clk) begin
      if ((wire19 ?
          wire22[(4'h8):(1'h1)] : (wire41 ^~ $signed(($unsigned(wire16) ?
              wire41[(1'h0):(1'h0)] : wire21)))))
        begin
          reg43 <= wire18;
        end
      else
        begin
          reg43 <= ({wire21} ?
              (wire18[(5'h14):(4'hc)] ?
                  (^~$signed($signed(reg20))) : $unsigned(((8'ha7) ?
                      $signed(wire24) : (!wire19)))) : $unsigned(wire17));
          reg44 <= {wire22};
          reg45 <= (reg43 ? wire17[(2'h3):(1'h0)] : (~|wire41));
          reg46 <= $signed(reg43[(3'h6):(1'h1)]);
          reg47 <= $unsigned($signed(((wire16[(4'hc):(4'h8)] ?
              (reg43 ? wire16 : wire16) : (+reg44)) * (8'ha5))));
        end
      reg48 <= $unsigned(wire23[(5'h10):(4'he)]);
    end
  assign wire49 = (7'h41);
  module50 #() modinst82 (wire81, clk, wire49, reg20, wire16, reg44, wire24);
  assign wire83 = {(-wire22[(4'hd):(4'hc)]), $signed(wire41[(3'h5):(3'h4)])};
  assign wire84 = $unsigned(reg47);
  assign wire85 = (&{$signed($signed((wire19 ? wire81 : wire22)))});
  always
    @(posedge clk) begin
      if (reg47[(2'h2):(2'h2)])
        begin
          reg86 <= (((+(~^reg45)) | ($signed((wire81 ~^ (8'haf))) ?
              (wire18 <= {reg47,
                  (8'ha9)}) : $signed({wire41}))) << $signed($signed($unsigned($signed(wire24)))));
          reg87 <= wire85[(3'h6):(2'h2)];
          reg88 <= ($signed((^$signed((+reg20)))) ?
              $unsigned(($unsigned({wire49,
                  reg43}) >> (~$unsigned(reg47)))) : wire22[(4'hc):(1'h0)]);
          reg89 <= wire41;
          reg90 <= (reg86[(4'ha):(1'h0)] ?
              $signed($unsigned(((&wire85) ?
                  (reg48 * reg20) : (wire83 ?
                      wire17 : reg44)))) : (wire81[(3'h6):(2'h2)] ?
                  (^~$unsigned((!wire85))) : wire24));
        end
      else
        begin
          reg86 <= $signed(reg90);
        end
      if ($unsigned((~|(^((^~wire18) ?
          reg44[(4'h8):(1'h0)] : reg48[(1'h1):(1'h0)])))))
        begin
          if (((~^{$unsigned($unsigned(reg89)), (~&reg86)}) ?
              (((((8'hb8) ~^ wire18) ?
                          reg43[(3'h4):(2'h2)] : (wire84 ? wire24 : reg88)) ?
                      reg88[(3'h7):(3'h5)] : (wire84[(1'h1):(1'h1)] * (^~(8'hb1)))) ?
                  reg44[(2'h3):(2'h3)] : (((reg87 ? reg46 : wire41) ?
                          reg89 : $signed(wire23)) ?
                      ((wire84 ^ (8'ha3)) ?
                          $signed(wire22) : $unsigned(reg45)) : reg45)) : wire83))
            begin
              reg91 <= (|reg48[(2'h2):(2'h2)]);
              reg92 <= wire18[(4'hb):(4'ha)];
            end
          else
            begin
              reg91 <= reg91;
              reg92 <= wire49[(2'h3):(1'h1)];
              reg93 <= wire16;
            end
          reg94 <= $signed((($signed({(8'hb3)}) < (!(~|(8'ha1)))) > $unsigned($unsigned((!wire81)))));
          reg95 <= wire18[(3'h4):(1'h0)];
          if ((!$unsigned(({wire49[(3'h6):(1'h1)]} ?
              {((8'hb3) ? wire81 : reg90)} : $signed((reg87 ?
                  wire49 : (8'ha6)))))))
            begin
              reg96 <= (~^(+($unsigned($unsigned(reg46)) ^~ (wire85 + reg91))));
            end
          else
            begin
              reg96 <= (8'hbd);
              reg97 <= ($unsigned({$signed(wire83),
                  $signed($unsigned(wire19))}) >= $signed(wire21[(3'h4):(3'h4)]));
              reg98 <= $signed((&($signed(reg90) ?
                  $unsigned(wire81) : $signed({reg45}))));
              reg99 <= reg90[(2'h3):(2'h2)];
              reg100 <= {(~&wire84), (reg45 ~^ wire85)};
            end
          reg101 <= {(reg98[(3'h7):(3'h7)] > (+{wire24}))};
        end
      else
        begin
          reg91 <= reg96;
          if ((reg101 ? {(&reg101)} : {(+(reg95[(3'h6):(3'h4)] != reg99))}))
            begin
              reg92 <= $unsigned($signed($unsigned(((wire41 ?
                  reg94 : reg97) + ((8'ha3) ? reg96 : reg48)))));
              reg93 <= (8'ha3);
              reg94 <= $signed(wire17);
              reg95 <= $signed((wire22 * ($signed((reg20 == reg87)) ?
                  $unsigned(((8'ha9) ? reg87 : (8'had))) : ((+reg93) ?
                      $signed((8'hb6)) : (-reg93)))));
              reg96 <= $unsigned((+$signed($signed((wire18 - reg46)))));
            end
          else
            begin
              reg92 <= reg98[(1'h1):(1'h0)];
            end
          if (reg101)
            begin
              reg97 <= $signed(reg100[(4'hd):(3'h6)]);
              reg98 <= reg93[(3'h7):(2'h2)];
            end
          else
            begin
              reg97 <= $unsigned($signed($unsigned((8'hab))));
              reg98 <= ($unsigned((|(reg98[(3'h5):(3'h5)] < (wire19 ?
                      wire23 : wire22)))) ?
                  ($unsigned($unsigned((reg98 || reg45))) ?
                      $signed($unsigned((wire49 & (8'ha4)))) : (^$signed((^~reg92)))) : wire21[(2'h3):(2'h3)]);
              reg99 <= (reg94 + (~|($signed($signed(wire21)) ?
                  (reg46 == (8'hab)) : $unsigned({reg47}))));
              reg100 <= reg47[(2'h2):(2'h2)];
              reg101 <= reg89[(2'h2):(1'h0)];
            end
          reg102 <= ({(reg90[(3'h4):(2'h2)] ?
                      reg20[(5'h13):(4'hb)] : $signed($unsigned(reg20)))} ?
              wire84[(4'hb):(3'h6)] : reg91[(3'h6):(3'h6)]);
          reg103 <= (reg46[(2'h2):(1'h1)] ?
              (wire16[(3'h5):(2'h3)] * $signed($signed(reg44))) : ($unsigned(reg46[(2'h3):(2'h2)]) ~^ $unsigned({wire17[(3'h4):(3'h4)],
                  $signed(wire24)})));
        end
      reg104 <= ($unsigned(reg99[(4'he):(4'hc)]) * $signed((wire84 ?
          {(&(8'hb0))} : wire24)));
    end
  assign wire105 = (8'ha7);
  assign wire106 = $signed((|($signed($unsigned(reg86)) << ((reg95 ?
                           wire23 : (8'hbb)) ?
                       (7'h42) : (reg90 != (7'h44))))));
  assign wire107 = (|$unsigned($unsigned(reg93)));
  assign wire108 = reg97[(5'h11):(4'h9)];
endmodule

module module50
#(parameter param79 = ((&((((8'hbb) ? (8'hb9) : (7'h44)) ? {(8'h9d)} : ((8'ha7) != (8'haf))) != (((8'ha3) ? (8'ha0) : (8'hb4)) - (~&(8'ha9))))) - {(~|({(8'haf)} ? ((8'h9c) <= (7'h40)) : ((8'h9d) ? (8'h9c) : (8'ha6))))}), 
parameter param80 = ((^param79) ? {((param79 ? (~^param79) : ((7'h43) ^ (8'hb8))) || ((param79 - param79) ? {param79, param79} : (!param79)))} : (~|(((param79 - param79) ^ param79) ? (8'haf) : param79))))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire55;
  input wire [(5'h11):(1'h0)] wire54;
  input wire [(4'hb):(1'h0)] wire53;
  input wire [(4'h8):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire56;
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg57,
                 (1'h0)};
  assign wire56 = wire53;
  always
    @(posedge clk) begin
      reg57 <= $unsigned($unsigned((|wire56)));
    end
  assign wire58 = ((+reg57[(2'h3):(2'h3)]) ?
                      ((wire53 * (-$unsigned(wire56))) ?
                          ($unsigned((~wire52)) ?
                              ((wire54 >= (7'h40)) ?
                                  $unsigned(wire52) : (wire51 ?
                                      wire53 : wire56)) : ((&wire55) * (~|wire54))) : (^~wire54[(4'hf):(4'h8)])) : {($signed($signed(wire53)) ?
                              (&wire55) : $signed(wire53[(4'h8):(3'h6)])),
                          (~$unsigned((^wire53)))});
  assign wire59 = $signed(($signed(reg57[(1'h1):(1'h0)]) ?
                      $unsigned((8'hb8)) : reg57[(3'h6):(3'h5)]));
  assign wire60 = ((-(((^wire51) >= wire55) <<< ((wire54 <= wire54) ?
                          (wire54 << (8'h9d)) : (wire52 ? (8'hbc) : wire59)))) ?
                      $unsigned($signed((&wire55))) : $unsigned((&((wire53 ?
                          wire58 : wire58) ^ wire59))));
  assign wire61 = $signed(($signed(($unsigned(wire51) << (8'ha2))) || ($unsigned((|wire60)) ?
                      reg57[(3'h5):(1'h0)] : (wire58[(4'hb):(2'h2)] ?
                          {wire59, (8'ha1)} : ((8'hae) ? wire60 : wire53)))));
  assign wire62 = {wire61};
  assign wire63 = $signed($signed(wire56));
  assign wire64 = $unsigned($unsigned($unsigned(((-wire58) ?
                      (+wire58) : wire52))));
  assign wire65 = wire51[(2'h2):(1'h1)];
  assign wire66 = (~&(-wire65));
  assign wire67 = wire58;
  assign wire68 = ($signed({$unsigned($signed(wire60)), (~$unsigned(wire63))}) ?
                      (!(|(~&$signed(wire58)))) : wire53[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg69 <= (8'hbb);
      if ($signed($unsigned((wire65 >= ((^wire59) && (-wire51))))))
        begin
          reg70 <= wire60;
        end
      else
        begin
          reg70 <= wire67;
        end
    end
  always
    @(posedge clk) begin
      reg71 <= wire53[(2'h3):(1'h0)];
      reg72 <= $signed(($unsigned((8'hba)) <<< {$signed({wire61, wire67}),
          $signed($unsigned(wire53))}));
      reg73 <= $signed(reg57[(2'h2):(2'h2)]);
      reg74 <= $unsigned(({((wire64 ? reg70 : wire56) * (reg57 | wire67)),
              wire55[(2'h3):(2'h3)]} ?
          reg70[(2'h2):(1'h1)] : $signed($unsigned($unsigned(wire56)))));
    end
  assign wire75 = wire52[(1'h1):(1'h1)];
  assign wire76 = $unsigned({{$unsigned((~^(8'ha6)))},
                      $unsigned(($signed(wire66) ?
                          (^wire52) : reg72[(3'h4):(2'h3)]))});
  assign wire77 = (8'h9e);
  assign wire78 = (8'ha6);
endmodule

module module25
#(parameter param40 = (({{((8'hb0) ? (8'hb6) : (8'hb4))}} ? (~|{{(8'hba)}}) : (7'h43)) && ({((-(8'hbf)) >= (^~(8'hba))), (-((8'hac) ? (8'ha1) : (8'hbb)))} ? ({((8'hbe) ? (8'hb5) : (7'h41)), ((8'hab) ? (8'ha0) : (7'h41))} << (!(~&(8'hb1)))) : (((~&(8'haa)) || ((8'hb8) ? (8'ha2) : (8'haf))) ? {((7'h43) >>> (8'hb1)), ((8'hb1) > (8'hac))} : {((8'ha5) >>> (8'ha5)), {(8'ha2), (8'hbb)}}))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 (1'h0)};
  assign wire30 = $signed($unsigned((($unsigned(wire26) ^~ (|wire28)) ?
                      $unsigned(wire28[(4'ha):(2'h3)]) : {$signed(wire26),
                          (-wire27)})));
  assign wire31 = $unsigned((wire27[(2'h3):(1'h0)] ?
                      (($unsigned(wire28) ?
                          (wire29 && wire28) : wire30) < ({wire29, wire30} ?
                          $unsigned(wire28) : $unsigned((8'h9c)))) : wire26[(4'hc):(4'hb)]));
  assign wire32 = ((($unsigned(wire27[(3'h5):(1'h0)]) ?
                              (wire31 & wire29[(4'ha):(1'h1)]) : $unsigned((wire26 ?
                                  wire26 : wire27))) ?
                          {$signed(wire27[(1'h1):(1'h0)]),
                              (((8'ha8) && (8'hb9)) ?
                                  {wire28, wire28} : wire28)} : (wire30 ?
                              wire26 : wire31[(1'h0):(1'h0)])) ?
                      wire27[(1'h0):(1'h0)] : $unsigned(wire30));
  assign wire33 = (|wire31);
  assign wire34 = (wire30[(3'h4):(1'h1)] || $signed((wire31 ?
                      {(~&wire27), {wire33}} : wire27)));
  assign wire35 = (wire28[(4'ha):(3'h4)] | $unsigned({wire31[(3'h7):(3'h6)],
                      ((8'hbf) ? $unsigned(wire32) : $unsigned((8'hb1)))}));
  assign wire36 = wire32[(2'h3):(1'h1)];
  assign wire37 = $signed((|(wire32[(2'h2):(2'h2)] ?
                      ($signed(wire33) ?
                          (wire32 * wire28) : (~^(8'hb7))) : wire31)));
  assign wire38 = (-wire36);
  assign wire39 = ((8'hb8) ?
                      $signed(wire31) : $unsigned(wire37[(1'h1):(1'h1)]));
endmodule
