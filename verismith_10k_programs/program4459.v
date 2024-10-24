module top
#(parameter param147 = (((&(^~((8'hb8) >= (8'hba)))) ? ({((7'h42) ? (8'hb2) : (8'hb6))} ? (~&((8'hba) - (8'haa))) : (~((8'hbd) & (8'h9c)))) : ((^~((8'hb9) > (8'h9c))) & (8'ha1))) ? (|((-{(8'hb7), (8'h9e)}) ? ((7'h43) ? ((8'hbf) ? (8'hbf) : (8'hab)) : ((8'ha2) ? (8'ha6) : (8'h9e))) : {((8'h9d) ? (8'ha9) : (8'ha3))})) : (+((8'h9f) < {((7'h41) ? (8'hb3) : (8'hac))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire145;
  wire [(5'h12):(1'h0)] wire144;
  wire [(3'h6):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire56;
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire80,
                 wire79,
                 wire5,
                 wire56,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire5 = (wire0 <<< (wire2 ?
                     {wire0} : ((wire4 >> (~wire4)) < wire1[(2'h2):(2'h2)])));
  module6 #() modinst57 (wire56, clk, wire5, wire4, wire2, wire1, wire0);
  always
    @(posedge clk) begin
      reg58 <= ({((8'ha9) << wire56), wire1} << wire4[(3'h4):(3'h4)]);
    end
  always
    @(posedge clk) begin
      if ($signed($signed((-($unsigned(wire56) ^~ (^~wire0))))))
        begin
          if ($signed(($signed({$unsigned(wire1),
              wire1}) != $signed({(-wire5)}))))
            begin
              reg59 <= $unsigned($signed({wire0}));
              reg60 <= reg58;
            end
          else
            begin
              reg59 <= $unsigned((wire5 ?
                  {wire0[(3'h4):(1'h1)]} : $signed(($unsigned(wire3) ?
                      wire0[(1'h0):(1'h0)] : (wire1 >= reg59)))));
              reg60 <= wire3[(3'h4):(1'h1)];
              reg61 <= ((($signed(reg60) ? wire56 : $unsigned($signed(wire0))) ?
                  reg58 : $signed(wire1)) >= (~^wire4[(4'hd):(1'h1)]));
              reg62 <= (wire3 * reg58);
              reg63 <= $unsigned($unsigned((~|$unsigned({reg62}))));
            end
          if ($signed(reg60[(1'h1):(1'h1)]))
            begin
              reg64 <= (&(reg63[(4'h8):(3'h6)] ?
                  $signed(reg60[(2'h2):(1'h0)]) : $unsigned(wire5)));
              reg65 <= $unsigned((8'ha9));
              reg66 <= $unsigned($unsigned((^(reg59 ?
                  $signed(wire2) : $unsigned((8'hbd))))));
            end
          else
            begin
              reg64 <= wire5[(5'h11):(4'hd)];
              reg65 <= ({(-(wire2[(3'h5):(2'h2)] ?
                      (reg66 ? wire5 : reg58) : $unsigned(reg62))),
                  (((~reg65) ? (wire0 ? reg60 : (8'hbc)) : ((8'ha5) | wire2)) ?
                      $signed(reg66) : $signed($unsigned((8'had))))} >= $unsigned($signed(((reg62 != (8'hb0)) ?
                  (reg65 <<< reg65) : (reg64 ? (8'haa) : wire56)))));
              reg66 <= wire56[(4'ha):(3'h5)];
              reg67 <= reg59;
            end
          if (wire5)
            begin
              reg68 <= ((((^(wire4 ? reg60 : reg66)) ?
                      $signed((wire56 >> wire4)) : reg66) ?
                  wire5 : (~(!{(8'hb2)}))) ^~ ({wire4[(1'h1):(1'h0)],
                  $unsigned(reg63[(3'h7):(3'h6)])} != reg66));
              reg69 <= reg60[(3'h5):(1'h0)];
              reg70 <= ((reg58 - (^reg66[(4'h8):(2'h3)])) ?
                  $unsigned(reg64[(1'h1):(1'h0)]) : ((&$signed($signed(reg64))) ?
                      (^reg62) : $signed({(wire1 ? (8'h9e) : reg60)})));
            end
          else
            begin
              reg68 <= (((($signed(reg67) ? reg64 : $signed(reg64)) ?
                          (&reg60[(2'h2):(1'h0)]) : reg69[(4'hd):(3'h6)]) ?
                      (8'ha6) : $unsigned((^~reg62))) ?
                  $unsigned(($unsigned((&(8'hbe))) | ($unsigned(wire3) ?
                      (reg64 <= reg61) : (reg66 > wire4)))) : reg67);
              reg69 <= ((&$signed(reg61[(1'h1):(1'h0)])) <<< ($unsigned({(8'h9f)}) >> reg63[(2'h3):(2'h3)]));
              reg70 <= reg60;
              reg71 <= reg58[(4'h8):(3'h7)];
              reg72 <= reg66;
            end
          if (wire4[(4'h9):(4'h9)])
            begin
              reg73 <= $unsigned(wire2[(5'h13):(3'h7)]);
            end
          else
            begin
              reg73 <= $unsigned({reg61[(3'h7):(3'h7)], reg59[(2'h2):(1'h1)]});
              reg74 <= (((($signed(reg72) < {reg63, reg62}) && {(&reg71)}) ?
                  (^~$unsigned(((8'hb1) <<< (8'haa)))) : (~reg70)) - $signed({wire4[(1'h0):(1'h0)]}));
              reg75 <= ($unsigned($unsigned((+$signed(reg73)))) ?
                  reg62 : (reg64[(2'h2):(1'h0)] ?
                      $unsigned(reg73[(1'h0):(1'h0)]) : (~^$signed((8'hb1)))));
              reg76 <= (~^$signed($unsigned(($unsigned(reg71) >= $unsigned(reg69)))));
            end
        end
      else
        begin
          reg59 <= $signed($unsigned(wire0));
          reg60 <= ($signed({(!$signed(wire3))}) ?
              $unsigned(reg66) : $unsigned($unsigned({((8'ha5) >> (8'ha4))})));
          reg61 <= reg72[(4'hb):(4'hb)];
          reg62 <= $unsigned(wire0);
          if (($unsigned((^($signed(reg62) ?
              (&reg64) : ((8'ha2) != wire56)))) & $unsigned($signed(reg74[(2'h2):(1'h1)]))))
            begin
              reg63 <= reg58[(2'h2):(2'h2)];
              reg64 <= $signed((reg72[(1'h1):(1'h0)] < (^~((^reg62) ?
                  $unsigned(reg65) : $signed((8'hb2))))));
              reg65 <= wire56;
              reg66 <= ($unsigned((|$signed(reg72))) - ((&($unsigned(reg63) << reg70[(4'h9):(4'h8)])) <<< reg63[(3'h4):(2'h2)]));
              reg67 <= $unsigned(({reg75[(2'h2):(1'h0)], reg71[(4'he):(4'ha)]} ?
                  (!((reg70 ? wire0 : reg68) ?
                      wire4 : {(8'hb5), reg59})) : $signed(reg67)));
            end
          else
            begin
              reg63 <= $signed((reg69 * ($unsigned((8'ha5)) ?
                  (~&((8'hae) ?
                      (8'hbb) : (8'hb3))) : ((|reg65) ^ ((7'h44) - reg62)))));
              reg64 <= {{reg59[(3'h6):(1'h1)], reg68[(4'h9):(4'h9)]}};
            end
        end
      reg77 <= $unsigned($unsigned(reg69));
      reg78 <= reg67;
    end
  assign wire79 = ($unsigned($signed(wire1[(4'hf):(4'he)])) == ((&reg72) && $signed(($signed(reg73) ?
                      (reg58 ? (8'ha9) : reg67) : {wire3, reg70}))));
  assign wire80 = ((8'ha9) != wire56[(2'h3):(1'h0)]);
  module81 #() modinst142 (.wire85(wire80), .wire83(wire4), .y(wire141), .wire84(reg69), .wire82(reg74), .clk(clk));
  assign wire143 = (~(+((wire1 ? (~^wire0) : (+reg71)) ^~ (((8'had) ?
                       reg71 : (8'ha4)) ^~ (reg69 != reg75)))));
  assign wire144 = ({(^~(^{reg64, wire141})),
                       (8'hba)} != ($unsigned(reg76) < (({wire3} ?
                           $signed((8'hac)) : {reg64, reg70}) ?
                       $signed((reg59 >= reg61)) : ((reg62 ? wire2 : wire3) ?
                           $unsigned(wire5) : (reg65 == reg65)))));
  assign wire145 = ($unsigned($signed((wire56[(1'h1):(1'h0)] ?
                           (reg58 ^ reg72) : reg74[(4'hb):(1'h0)]))) ?
                       $signed($signed(((^reg70) || ((8'hb3) ?
                           wire141 : reg65)))) : {(reg78[(1'h1):(1'h1)] * ((~&reg76) ?
                               $signed(reg76) : (~reg70)))});
  assign wire146 = $signed($unsigned((~|reg68)));
endmodule

module module81  (y, clk, wire82, wire83, wire84, wire85);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire82;
  input wire signed [(3'h7):(1'h0)] wire83;
  input wire signed [(4'ha):(1'h0)] wire84;
  input wire [(5'h10):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire138;
  wire [(2'h3):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire130;
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire86,
                 wire130,
                 reg137,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 (1'h0)};
  assign wire86 = wire82[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg87 <= wire82[(4'he):(4'h8)];
      if (((-$unsigned($unsigned((wire84 ? wire84 : wire84)))) ?
          $signed((^((wire84 >> wire86) ?
              $unsigned((8'ha5)) : (!wire82)))) : (~&((~|{wire83}) | wire85[(2'h2):(1'h1)]))))
        begin
          reg88 <= (({{wire86[(4'hd):(3'h6)]},
              (8'hb3)} <<< (wire85 ^~ (~(reg87 >>> reg87)))) < (wire84[(4'h8):(2'h2)] ?
              ($signed({wire83,
                  wire82}) >= $unsigned((~&wire83))) : wire86[(1'h0):(1'h0)]));
          reg89 <= (8'hba);
        end
      else
        begin
          reg88 <= $signed($signed(wire83));
          reg89 <= $unsigned((&wire84[(4'h9):(3'h5)]));
          if ((-$unsigned($signed($unsigned((|wire82))))))
            begin
              reg90 <= $signed(reg88);
              reg91 <= (wire84 ?
                  $signed({$unsigned(wire82)}) : $signed(((-(wire84 ?
                      wire85 : (8'ha5))) >> ((8'haa) ? {reg89} : (|(8'h9e))))));
              reg92 <= wire83[(3'h5):(3'h4)];
              reg93 <= reg88[(4'hb):(2'h2)];
              reg94 <= reg92[(4'hc):(1'h0)];
            end
          else
            begin
              reg90 <= $signed(wire84[(2'h3):(1'h1)]);
              reg91 <= wire85[(3'h4):(2'h3)];
              reg92 <= wire85;
            end
          reg95 <= ({{$signed(reg91[(3'h4):(3'h4)])},
              ($unsigned($signed(reg91)) && $unsigned(((8'haa) ?
                  reg91 : (8'hb3))))} ^~ $unsigned($unsigned(reg93)));
        end
    end
  always
    @(posedge clk) begin
      reg96 <= (~^(-reg87[(4'hd):(4'hc)]));
      reg97 <= $signed($unsigned((($unsigned(reg94) ?
          $unsigned(reg91) : {wire85, wire84}) >>> reg87[(3'h7):(3'h6)])));
      reg98 <= (^~($signed(((reg89 ?
          (8'ha6) : wire82) <= ((8'ha5) >= reg96))) <= $signed(($signed((8'hb5)) ?
          $unsigned(reg89) : $signed((8'ha4))))));
      if ((-(|((&wire85[(4'h9):(3'h7)]) ^~ {wire86, $signed((8'h9f))}))))
        begin
          reg99 <= (reg90 ^ ((~|wire86) >> reg95[(3'h5):(2'h3)]));
          reg100 <= wire83[(3'h4):(1'h0)];
          if (($unsigned({$signed((reg95 ?
                  wire86 : reg91))}) << reg95[(5'h13):(4'hf)]))
            begin
              reg101 <= (({reg99} <<< (reg95[(4'hf):(1'h0)] || reg98[(3'h6):(2'h2)])) ?
                  reg90 : $signed(wire86));
              reg102 <= (8'h9e);
              reg103 <= wire84[(3'h5):(2'h2)];
            end
          else
            begin
              reg101 <= reg87;
              reg102 <= wire84;
              reg103 <= ((reg100[(2'h3):(1'h1)] ?
                  ($signed((~reg91)) ~^ $unsigned($signed(reg99))) : ($signed($signed(reg87)) ?
                      reg91[(2'h3):(2'h3)] : $signed(reg89[(4'hc):(4'hb)]))) != reg102);
              reg104 <= $unsigned(reg91);
              reg105 <= ($unsigned((~^$unsigned((wire85 << reg93)))) ?
                  reg103 : $unsigned((~((|reg96) ? $unsigned(reg98) : reg98))));
            end
          reg106 <= $unsigned($signed($unsigned(reg99)));
        end
      else
        begin
          reg99 <= reg103;
          reg100 <= {$signed($signed((7'h40))),
              {((!$unsigned(reg105)) ?
                      $signed(reg90[(1'h0):(1'h0)]) : $unsigned(reg102[(5'h15):(5'h13)])),
                  (&reg105[(2'h2):(1'h0)])}};
          reg101 <= (~reg103[(2'h2):(2'h2)]);
          reg102 <= reg105[(4'hb):(4'h9)];
          if ($unsigned({({$signed(reg98), ((8'ha5) <= reg91)} ?
                  reg95[(4'h9):(1'h1)] : (|$unsigned(reg92))),
              (wire85[(2'h2):(2'h2)] + reg89)}))
            begin
              reg103 <= $signed($signed({reg101}));
            end
          else
            begin
              reg103 <= (((({(8'ha6), reg101} ^~ ((8'hac) - reg94)) ?
                      ($signed(reg87) ^ wire83[(3'h4):(1'h1)]) : reg89[(4'hc):(4'hb)]) ?
                  ({(~|(8'haa)), $unsigned(reg93)} ?
                      $unsigned(reg88[(4'h8):(3'h5)]) : {$unsigned(reg106)}) : reg93[(2'h3):(1'h0)]) && ($signed(wire85[(4'h8):(4'h8)]) ?
                  reg101[(4'h8):(4'h8)] : ((~reg93[(4'hb):(4'h8)]) ?
                      $unsigned(reg101) : reg94)));
              reg104 <= {(8'hac), reg104[(1'h0):(1'h0)]};
              reg105 <= reg102;
              reg106 <= {$unsigned((8'ha0)),
                  $signed({(reg104[(3'h5):(3'h4)] ?
                          $unsigned(reg88) : reg104[(1'h1):(1'h0)])})};
            end
        end
    end
  module107 #() modinst131 (.wire109(wire86), .clk(clk), .wire108(reg101), .y(wire130), .wire111(reg100), .wire110(reg90));
  assign wire132 = $signed((^~reg103[(4'h8):(4'h8)]));
  assign wire133 = (7'h42);
  assign wire134 = $signed(((!wire130[(1'h1):(1'h0)]) ?
                       $signed(reg90) : reg98[(2'h2):(1'h0)]));
  assign wire135 = reg92;
  assign wire136 = reg89[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg137 <= {wire86,
          (wire133 ^~ (reg88[(4'h8):(2'h2)] ?
              {(reg96 + reg93)} : reg91[(1'h0):(1'h0)]))};
    end
  assign wire138 = (reg94[(4'h8):(3'h6)] ?
                       $signed({$unsigned((-(8'hbb))),
                           (~|(reg99 > wire84))}) : (8'hbd));
  assign wire139 = ((($unsigned((-wire130)) ?
                           (reg92 ? reg101 : $unsigned(wire130)) : (!reg106)) ?
                       {(reg105[(3'h4):(1'h1)] && $unsigned(wire82)),
                           $signed(reg105)} : $signed($signed($signed(reg101)))) ^~ $signed(reg95[(4'hb):(3'h4)]));
  assign wire140 = (^~{(($signed(wire86) && $unsigned(wire133)) ?
                           $signed((reg101 << reg91)) : (reg102 != $signed((8'hba)))),
                       (wire136[(2'h3):(2'h3)] ?
                           $unsigned($unsigned((8'hb1))) : reg99)});
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire50;
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire12,
                 wire13,
                 wire14,
                 wire50,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire12 = (7'h42);
  assign wire13 = ($signed((wire10 ?
                          ((wire10 << wire11) ?
                              {wire12,
                                  wire12} : (wire7 <<< (8'haa))) : ((~|wire11) ?
                              {wire8, wire7} : (wire8 ? wire9 : (8'hab))))) ?
                      wire12[(2'h3):(2'h2)] : $signed(wire12));
  assign wire14 = {wire9[(4'hd):(4'hb)]};
  module15 #() modinst51 (wire50, clk, wire10, wire7, wire12, wire11, wire9);
  always
    @(posedge clk) begin
      reg52 <= wire14;
      reg53 <= wire10;
      reg54 <= ($unsigned(($signed((|wire11)) ?
          ({(8'ha8), wire9} || (~wire7)) : {$unsigned((8'hab)),
              (wire14 ^~ wire7)})) <= (-wire7));
      reg55 <= (|(($unsigned(wire50[(5'h12):(4'ha)]) ?
              wire8[(4'hd):(4'hc)] : ((wire50 ? wire13 : reg54) ?
                  (wire13 ? wire13 : wire14) : (wire8 ? wire7 : (8'haf)))) ?
          (~&$signed((wire13 ? (8'hab) : (8'hb7)))) : wire8));
    end
endmodule

module module15
#(parameter param48 = {(({((8'hae) ? (8'hae) : (8'ha4))} ? (+((8'hbb) | (8'ha8))) : {(-(7'h43)), (~(8'hbc))}) ? (+(8'haf)) : ((((8'hb6) >= (8'hbc)) ? ((8'hbc) >> (8'ha4)) : {(8'ha2)}) << (&(~&(8'hbf)))))}, 
parameter param49 = param48)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 (1'h0)};
  assign wire21 = wire16;
  assign wire22 = $unsigned((7'h42));
  assign wire23 = (wire18 ?
                      (!$unsigned(($signed(wire16) ?
                          $signed(wire17) : (wire19 | (8'hba))))) : (wire16 == (((!(8'h9e)) >>> $unsigned(wire20)) >> wire16)));
  assign wire24 = (({(~$signed((8'ha7)))} ?
                      ((^wire18[(3'h5):(3'h5)]) ?
                          $unsigned(wire23[(2'h2):(2'h2)]) : $signed((!wire23))) : wire21[(3'h6):(2'h2)]) >>> ((-{(wire22 ^~ wire18)}) < wire19));
  always
    @(posedge clk) begin
      reg25 <= $signed({{$signed((wire16 ~^ wire22))},
          (wire16 ? wire18[(1'h0):(1'h0)] : wire19[(1'h0):(1'h0)])});
      reg26 <= $signed(($signed(wire24) ?
          wire21 : (+$signed($signed((8'ha0))))));
      if (wire21[(2'h2):(2'h2)])
        begin
          reg27 <= $signed($unsigned((&wire16[(4'h8):(4'h8)])));
        end
      else
        begin
          reg27 <= wire19[(3'h5):(1'h1)];
          if (($unsigned($unsigned(wire24)) ^ $unsigned($signed({$unsigned(wire18),
              (wire24 ? wire24 : reg26)}))))
            begin
              reg28 <= $unsigned((~^(~$unsigned((|wire18)))));
            end
          else
            begin
              reg28 <= $signed(($signed({reg28[(1'h0):(1'h0)],
                  (wire24 || (8'hac))}) * ((+(reg28 ?
                  wire18 : (8'ha3))) + ((|wire18) & {wire21, reg28}))));
              reg29 <= wire23;
            end
          reg30 <= $signed(((((reg25 >= (8'h9e)) ?
              $unsigned(wire21) : wire22[(5'h11):(4'he)]) && (((8'had) ?
              wire19 : wire20) <= {wire23})) & {$signed((&wire23)),
              $signed(((8'hbc) ? wire17 : wire22))}));
          if ({(($unsigned($unsigned((7'h44))) ~^ (^(reg28 | wire17))) ?
                  ({wire17[(2'h2):(2'h2)]} ?
                      wire16[(4'he):(4'he)] : (-(~|wire17))) : wire20[(4'he):(4'h9)])})
            begin
              reg31 <= wire17[(1'h1):(1'h0)];
              reg32 <= wire24[(3'h7):(1'h1)];
              reg33 <= reg28;
            end
          else
            begin
              reg31 <= ($unsigned(wire16[(3'h5):(2'h2)]) > wire24[(4'ha):(4'h8)]);
              reg32 <= (|$signed((((reg27 + wire24) ?
                  (8'hac) : wire18) == reg30)));
            end
          if ((^~(+wire24[(4'hb):(1'h1)])))
            begin
              reg34 <= ($signed((8'ha5)) ?
                  (($unsigned($signed(reg31)) ?
                          $signed(wire19) : reg32[(1'h0):(1'h0)]) ?
                      {$signed((&reg27))} : ({(reg27 && wire22)} - ($signed(wire22) ?
                          $signed(wire20) : (~wire16)))) : (-$signed($unsigned(wire18[(4'h8):(3'h5)]))));
              reg35 <= $unsigned((&(((~^(8'ha6)) ?
                      $unsigned(wire18) : ((8'ha5) ? (7'h44) : reg26)) ?
                  ($unsigned(wire21) ?
                      (|(8'h9d)) : wire22[(3'h4):(1'h1)]) : $signed((reg31 - wire17)))));
            end
          else
            begin
              reg34 <= wire17;
              reg35 <= (-$signed((~|reg34)));
            end
        end
      if ({$unsigned((wire23[(2'h3):(2'h3)] ?
              $unsigned({reg25}) : (&$unsigned(wire23)))),
          $signed(({{wire20}, (^reg31)} ?
              (~^$signed(wire21)) : (~$signed(reg25))))})
        begin
          reg36 <= ($signed($unsigned($unsigned((~reg27)))) ^ (!(^~$unsigned(reg25[(1'h0):(1'h0)]))));
          reg37 <= ($unsigned((^((~(8'hae)) ?
                  wire24[(4'h8):(3'h7)] : (wire16 ? (8'hb1) : wire23)))) ?
              (wire19 ?
                  (8'ha0) : ($unsigned($signed(reg36)) != $signed((wire20 ?
                      reg34 : wire21)))) : (~({(wire22 ~^ (8'hbc)),
                  (reg29 & (8'hbf))} + $signed($signed(reg33)))));
          reg38 <= ((~((^(^wire17)) ?
              reg32[(3'h5):(1'h0)] : (wire23[(1'h1):(1'h0)] < (-wire19)))) >>> (reg37[(3'h7):(3'h6)] != ({(reg35 >= (8'hab)),
              {reg31}} * ({wire23} < (-wire22)))));
          reg39 <= ((|reg30) & ($unsigned((((8'ha0) ~^ (8'ha4)) ?
              reg27 : (~|reg38))) > reg36[(2'h2):(2'h2)]));
        end
      else
        begin
          if (reg30)
            begin
              reg36 <= wire21;
              reg37 <= wire16[(2'h3):(2'h2)];
              reg38 <= ($signed(reg34) ?
                  $signed(wire18) : ($signed({$unsigned(reg32)}) ?
                      {$signed((wire24 >= reg32))} : $signed(reg38[(1'h1):(1'h0)])));
              reg39 <= reg32;
              reg40 <= wire23;
            end
          else
            begin
              reg36 <= {wire22[(1'h1):(1'h0)]};
            end
          reg41 <= (~&$signed({(((8'hb6) ? (8'hae) : reg32) ?
                  $unsigned((8'h9e)) : (8'ha5))}));
          reg42 <= reg30[(3'h5):(1'h1)];
        end
      if (reg27)
        begin
          reg43 <= (^~($unsigned((reg28 ?
              (reg35 ? (7'h43) : (8'hbe)) : (wire17 ?
                  reg31 : reg40))) ~^ reg41));
          reg44 <= (|(8'hba));
          reg45 <= (7'h44);
        end
      else
        begin
          if (wire22)
            begin
              reg43 <= reg27[(3'h6):(3'h4)];
            end
          else
            begin
              reg43 <= ((({$signed(wire21),
                      reg40[(2'h2):(1'h1)]} < $signed(wire18)) & ($signed(((8'ha6) && reg45)) ?
                      (~|reg27[(4'hf):(2'h3)]) : {{reg27}})) ?
                  (reg44[(3'h7):(3'h4)] ?
                      (reg34 && {(wire18 & wire17),
                          $signed((8'ha9))}) : $unsigned(($unsigned((8'had)) ?
                          (~^reg28) : {reg38}))) : (&(((^~reg25) && $unsigned(reg28)) ?
                      $signed((reg41 < reg27)) : $signed((reg31 ?
                          (8'hb9) : (8'h9c))))));
            end
        end
    end
  assign wire46 = $unsigned(reg44);
  assign wire47 = {reg25[(2'h2):(1'h1)]};
endmodule

module module107
#(parameter param128 = {(7'h40)}, 
parameter param129 = param128)
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire111;
  input wire signed [(2'h3):(1'h0)] wire110;
  input wire signed [(5'h15):(1'h0)] wire109;
  input wire [(4'hb):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire127;
  wire [(3'h6):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(3'h6):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg112 <= $signed(wire111[(5'h14):(4'hb)]);
      reg113 <= wire108[(3'h7):(3'h5)];
      reg114 <= wire111[(1'h0):(1'h0)];
    end
  assign wire115 = (reg112[(3'h4):(3'h4)] ^~ wire110[(1'h1):(1'h1)]);
  assign wire116 = ({{{$signed(wire109), reg114}}} ?
                       (((reg113[(1'h0):(1'h0)] ?
                           {(8'hb0), wire111} : {reg112,
                               reg112}) >> wire115) && $unsigned(wire110)) : reg114[(2'h3):(1'h0)]);
  assign wire117 = (~|wire109[(4'hd):(2'h3)]);
  assign wire118 = reg113[(2'h2):(1'h0)];
  assign wire119 = wire109[(1'h0):(1'h0)];
  assign wire120 = wire109[(5'h14):(3'h6)];
  assign wire121 = $unsigned({wire118});
  assign wire122 = wire117;
  assign wire123 = (8'hbb);
  assign wire124 = ((wire110[(1'h1):(1'h1)] | $signed(((~wire123) >= wire119))) >= $unsigned((~$signed((wire108 > (8'hae))))));
  assign wire125 = (-(($unsigned(wire115) ?
                           $signed({reg114,
                               wire124}) : $signed($unsigned(reg114))) ?
                       wire117[(3'h6):(2'h3)] : (reg112 ?
                           reg112[(1'h0):(1'h0)] : $signed(wire119[(3'h4):(1'h1)]))));
  assign wire126 = $signed((wire111 ? $signed(wire116) : wire116));
  assign wire127 = (^~$unsigned($unsigned({(wire124 ? wire120 : wire116),
                       (wire109 ^ wire119)})));
endmodule
