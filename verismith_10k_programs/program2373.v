module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire68,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = ({$unsigned($signed((wire2 ? wire2 : wire2)))} ?
                     $unsigned((8'ha7)) : wire1[(4'h9):(4'h9)]);
  assign wire5 = (wire2[(3'h4):(1'h1)] * wire1[(4'hc):(4'h8)]);
  assign wire6 = ({((7'h42) ? wire0 : $signed({wire3, wire0}))} + (((-{wire1,
                         wire5}) ?
                     wire3[(3'h6):(3'h5)] : wire3[(1'h1):(1'h1)]) <<< {wire4[(2'h2):(1'h1)]}));
  assign wire7 = (&$unsigned((~|wire2)));
  assign wire8 = ((&$signed({(wire0 ? wire0 : wire6)})) ?
                     $signed((wire7[(3'h6):(3'h4)] > ((~^wire2) ?
                         $signed((8'hab)) : wire1))) : $signed(wire5));
  assign wire9 = ($unsigned(wire2) > {(~wire5), wire0[(4'h9):(1'h0)]});
  assign wire10 = (+$signed((8'hbd)));
  assign wire11 = $unsigned($signed((8'h9e)));
  assign wire12 = $signed((~^((-(|(8'hbe))) ?
                      wire8 : ((wire1 ? wire9 : wire8) ?
                          $unsigned(wire9) : $unsigned(wire8)))));
  assign wire13 = (wire2 ?
                      (wire5 ?
                          (8'ha2) : ($unsigned((+wire2)) <= wire2)) : (|(^~(wire12[(1'h1):(1'h0)] ?
                          (~wire0) : (~^(8'hac))))));
  assign wire14 = $signed(wire4);
  assign wire15 = (-(wire2[(4'h8):(4'h8)] ?
                      (^~wire1) : (!$signed($unsigned((8'had))))));
  assign wire16 = (~|$signed(((((8'hb0) * wire9) ?
                          wire2[(1'h0):(1'h0)] : wire4[(1'h1):(1'h1)]) ?
                      ({wire8, wire0} >> wire10) : $signed($unsigned(wire7)))));
  module17 #() modinst69 (.clk(clk), .wire19(wire1), .wire21(wire11), .y(wire68), .wire20(wire8), .wire18(wire6));
  always
    @(posedge clk) begin
      reg70 <= ((8'ha5) != (~wire4));
      if ((({$unsigned(reg70[(4'hc):(4'h8)]), wire9} > (-$unsigned(wire68))) ?
          $unsigned(((~$signed(wire0)) >>> {$unsigned(reg70)})) : $unsigned((^~($signed(wire16) <<< $unsigned(wire9))))))
        begin
          reg71 <= (+($signed({$signed(wire16), (wire7 >= wire5)}) ?
              (7'h44) : $unsigned(({wire11} && $unsigned(wire5)))));
          reg72 <= $unsigned({wire5});
          if ($signed((~&$unsigned((((8'hac) >> reg72) >= wire16[(2'h3):(2'h2)])))))
            begin
              reg73 <= wire14;
              reg74 <= wire4[(1'h1):(1'h1)];
              reg75 <= ($unsigned(wire3) ?
                  $signed($signed($signed($signed(wire9)))) : reg73[(4'hb):(1'h0)]);
              reg76 <= ($unsigned($unsigned($unsigned($unsigned(reg74)))) + {(&wire6),
                  {$unsigned($unsigned(wire7))}});
            end
          else
            begin
              reg73 <= (~^(wire14 < ((wire5[(3'h4):(1'h0)] ?
                      {(8'hb8)} : wire7[(3'h6):(2'h3)]) ?
                  ((reg72 ? (8'ha6) : reg71) > (wire0 ?
                      wire2 : wire4)) : ((|wire0) ?
                      (wire11 != wire0) : $unsigned(wire16)))));
            end
        end
      else
        begin
          reg71 <= reg73[(3'h6):(3'h6)];
          reg72 <= ((reg74 ?
              wire13 : $unsigned((~(reg74 ?
                  reg71 : (8'hbe))))) ~^ wire4[(2'h3):(1'h0)]);
        end
      reg77 <= {(~|$unsigned(reg75))};
    end
  always
    @(posedge clk) begin
      reg78 <= $unsigned(wire7[(1'h0):(1'h0)]);
      reg79 <= (~$unsigned((reg74 && {((8'ha5) ? wire9 : reg73)})));
      reg80 <= (~|((~^$signed(wire6[(4'he):(2'h3)])) < (~|$unsigned({reg76,
          reg70}))));
    end
  assign wire81 = reg70[(4'ha):(4'h9)];
  assign wire82 = $signed(wire14[(3'h6):(2'h3)]);
  assign wire83 = $unsigned(reg74);
  assign wire84 = $unsigned((wire3[(1'h1):(1'h0)] <<< ((wire15 ?
                          (reg74 ? reg74 : (8'hae)) : (wire83 ^~ reg79)) ?
                      (~&(8'hb8)) : wire12[(4'hf):(4'h9)])));
  always
    @(posedge clk) begin
      if ((((8'h9c) == reg75[(2'h3):(2'h2)]) << {(&(reg72 ^ (8'hb6)))}))
        begin
          if ($unsigned((~|$signed(($unsigned(reg76) & $unsigned((8'hae)))))))
            begin
              reg85 <= ((((8'hb2) <= $signed(wire83)) ?
                  reg71 : $unsigned(wire2[(2'h2):(1'h1)])) ^ $signed({((8'hb0) ?
                      (reg78 ? wire68 : (8'ha4)) : $unsigned(wire84))}));
              reg86 <= ($unsigned((^((~wire14) ?
                      (^~(8'h9c)) : wire82[(4'hd):(4'hd)]))) ?
                  reg76 : {((wire4[(3'h6):(1'h0)] ? $unsigned(wire83) : reg71) ?
                          $unsigned((~&reg85)) : wire6[(5'h11):(4'h9)])});
              reg87 <= ((-(wire4 >= $signed((8'hb5)))) > $signed((+((wire10 <= wire2) ?
                  wire0 : $signed(wire84)))));
            end
          else
            begin
              reg85 <= (8'hba);
            end
          reg88 <= {$signed($unsigned(reg72[(2'h2):(1'h1)])),
              $signed($unsigned({$signed(wire2)}))};
          reg89 <= $unsigned($signed(({(+wire4), reg85[(4'h8):(3'h6)]} ?
              {reg78, reg75[(2'h2):(1'h1)]} : (reg86 ?
                  (wire2 ~^ wire13) : wire3[(3'h6):(2'h2)]))));
          reg90 <= (+$unsigned(($unsigned($signed((8'hb5))) > $signed(wire11[(4'hb):(4'h9)]))));
          reg91 <= ((~^(wire16 ?
              (((8'ha8) >> wire14) ?
                  {wire10,
                      reg72} : (reg75 >= reg74)) : ($unsigned(reg73) || (reg74 ?
                  reg72 : wire13)))) ^ $unsigned((|$unsigned($signed(wire5)))));
        end
      else
        begin
          if ($signed(({((wire16 >>> wire2) >> $unsigned(wire3)),
              ((reg87 ?
                  wire11 : wire1) * $unsigned(reg87))} & wire2[(3'h5):(3'h5)])))
            begin
              reg85 <= wire8;
              reg86 <= $unsigned((~|$signed($unsigned((~&(8'ha8))))));
              reg87 <= reg71;
              reg88 <= reg78[(2'h2):(1'h0)];
            end
          else
            begin
              reg85 <= $unsigned($signed({wire11}));
            end
          if (reg80[(3'h7):(3'h5)])
            begin
              reg89 <= $unsigned((~wire16));
            end
          else
            begin
              reg89 <= ($unsigned($signed(($signed((7'h43)) ?
                      wire12[(3'h4):(1'h1)] : wire81))) ?
                  $signed((((^reg74) ? reg74 : wire12) >>> ($unsigned((8'h9f)) ?
                      $signed(wire68) : (wire13 ? wire16 : reg86)))) : wire81);
              reg90 <= {{$unsigned((~&(~&reg88)))}, reg87};
              reg91 <= (((~|$signed((wire14 < reg70))) ?
                      reg87 : (-$signed(reg77[(3'h6):(1'h1)]))) ?
                  $signed($unsigned(((~&reg90) ?
                      wire84[(3'h4):(2'h2)] : wire13[(1'h0):(1'h0)]))) : reg90[(2'h3):(1'h1)]);
            end
          reg92 <= (~^(-(!(~|(+wire16)))));
          if (reg90)
            begin
              reg93 <= ((8'haa) <<< {(~^($unsigned(wire68) | (7'h43)))});
              reg94 <= (~&$signed((|$unsigned((^~reg93)))));
              reg95 <= (|($signed((wire7 ?
                  (wire12 ^ reg75) : wire8[(1'h0):(1'h0)])) && $unsigned({wire68,
                  $unsigned(reg76)})));
              reg96 <= (^~reg93[(2'h3):(2'h2)]);
              reg97 <= wire83[(2'h2):(2'h2)];
            end
          else
            begin
              reg93 <= wire0;
              reg94 <= {$unsigned(reg96[(1'h1):(1'h0)])};
              reg95 <= $signed(reg91[(1'h0):(1'h0)]);
              reg96 <= $signed((+$signed(reg87[(3'h7):(3'h5)])));
              reg97 <= (|{wire84});
            end
        end
      reg98 <= reg90;
      reg99 <= (|($signed((wire12 ?
          reg88 : (wire5 <<< reg80))) << {(~(reg92 - wire7)),
          ($unsigned((8'hb8)) ? reg97 : (wire10 ? wire4 : wire11))}));
      if (($signed((!$unsigned({wire8}))) == wire4))
        begin
          if ($signed((($unsigned((wire83 ? wire6 : (8'ha1))) ?
                  $signed($signed(reg79)) : {((8'hbd) << wire14),
                      wire10[(4'h8):(3'h5)]}) ?
              {wire4[(2'h3):(1'h1)],
                  ((wire8 ~^ reg71) <<< wire12)} : (((reg79 && reg75) ?
                      $signed(reg75) : $signed(reg87)) ?
                  $unsigned({reg72, reg72}) : $signed(((8'hbd) + reg74))))))
            begin
              reg100 <= reg73;
              reg101 <= (^~$signed(reg92[(4'h9):(2'h3)]));
            end
          else
            begin
              reg100 <= wire9[(4'h8):(2'h2)];
              reg101 <= $unsigned(reg78[(2'h3):(1'h0)]);
              reg102 <= $unsigned(reg70[(3'h5):(2'h3)]);
              reg103 <= reg99;
            end
          reg104 <= reg89[(1'h1):(1'h1)];
          reg105 <= (7'h44);
        end
      else
        begin
          if ($unsigned((($unsigned($unsigned(reg79)) ?
                  $unsigned((reg77 << reg78)) : $unsigned((!reg72))) ?
              ((+wire84) < {(~^reg89)}) : reg101[(3'h4):(1'h0)])))
            begin
              reg100 <= $signed((reg74 ?
                  (wire4[(2'h3):(1'h1)] ?
                      $unsigned(reg89[(1'h1):(1'h0)]) : {(~|reg94)}) : (wire12[(5'h11):(4'h9)] ?
                      $unsigned(reg95[(3'h4):(2'h3)]) : $signed(reg94))));
              reg101 <= ((wire82 & $unsigned((reg74 ~^ reg76[(3'h6):(1'h1)]))) ?
                  $unsigned($unsigned($signed(wire6[(5'h10):(4'he)]))) : (~^(~reg86)));
              reg102 <= ($unsigned((^$unsigned($signed(wire83)))) ?
                  $unsigned($signed((reg87 != (+wire14)))) : (({(wire81 - reg95),
                          wire5} ?
                      (~|wire16[(3'h5):(1'h0)]) : $unsigned(wire7[(1'h0):(1'h0)])) >> reg90[(1'h1):(1'h0)]));
              reg103 <= (^~reg76);
            end
          else
            begin
              reg100 <= reg103;
              reg101 <= (~&$signed((((reg86 ~^ (8'hbc)) ?
                  reg98 : $signed(wire15)) | {(^~reg72)})));
            end
          reg104 <= $signed(reg73[(3'h7):(2'h2)]);
        end
      reg106 <= ((8'hb0) ?
          (-$signed($unsigned({reg92, reg104}))) : (wire84[(1'h1):(1'h0)] ?
              $signed($signed(((8'hb4) ? reg96 : wire0))) : $unsigned(wire83)));
    end
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire66;
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  assign y = {wire41,
                 wire22,
                 wire43,
                 wire44,
                 wire53,
                 wire66,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire22 = {($signed($signed((~wire20))) ?
                          (-wire20[(1'h1):(1'h0)]) : (+((~wire18) ?
                              wire19[(2'h3):(1'h1)] : (|wire20)))),
                      ($signed((^~$signed(wire21))) <<< ((~&(wire19 <= wire19)) ?
                          wire21[(2'h3):(1'h0)] : wire19[(2'h2):(1'h0)]))};
  module23 #() modinst42 (.wire27(wire20), .wire24(wire22), .wire26(wire18), .wire25(wire19), .y(wire41), .clk(clk), .wire28(wire21));
  assign wire43 = wire19[(3'h6):(2'h2)];
  assign wire44 = $unsigned((+wire22[(4'hf):(2'h3)]));
  always
    @(posedge clk) begin
      reg45 <= {$signed((wire19[(1'h1):(1'h1)] ?
              (+$unsigned(wire20)) : wire20))};
      if ((wire41 | (^~wire41)))
        begin
          reg46 <= $signed((($signed($signed(wire21)) ?
              wire41 : (wire18[(5'h14):(5'h12)] ^~ $unsigned(reg45))) ^~ (^(&$unsigned(wire18)))));
          if ($unsigned(wire21))
            begin
              reg47 <= (~^$signed(wire22));
              reg48 <= wire41;
              reg49 <= ((!{((wire22 || (8'had)) + (~^wire22))}) && $signed($signed(((reg48 >= wire19) ?
                  (wire44 > (8'hbc)) : {(8'hb3)}))));
              reg50 <= (((~|$signed($signed(wire22))) && (~|{$unsigned(wire20),
                      (wire20 ? reg49 : reg46)})) ?
                  (reg45[(3'h4):(1'h0)] >> (((reg47 || reg47) * $unsigned(wire22)) >> (~|(~&wire21)))) : (^((~^(^~wire41)) < reg49[(4'ha):(4'h9)])));
            end
          else
            begin
              reg47 <= wire44[(2'h2):(2'h2)];
              reg48 <= {$unsigned($signed((reg48 ?
                      $unsigned(wire19) : reg48)))};
            end
          if ($unsigned({$signed(wire19[(4'hb):(1'h1)]),
              (reg47 ? (!(reg45 >= reg49)) : (|(wire18 ? reg46 : wire41)))}))
            begin
              reg51 <= reg47;
            end
          else
            begin
              reg51 <= $signed((reg50 << $unsigned((~^$signed(wire19)))));
              reg52 <= (-($unsigned((~|(reg51 ?
                  wire41 : wire20))) >= {(wire44[(1'h1):(1'h0)] ?
                      $signed(reg48) : $signed(wire20))}));
            end
        end
      else
        begin
          reg46 <= ((~^($unsigned($signed((8'h9d))) > (+{wire41}))) != (((reg45[(3'h7):(2'h3)] ^~ wire19[(2'h3):(2'h3)]) ?
                  ($signed(reg45) ?
                      ((8'hba) & wire19) : (^reg48)) : wire41[(4'h8):(4'h8)]) ?
              wire20 : $signed($signed($signed(wire41)))));
          reg47 <= ((&(8'hb2)) < {(((~&reg45) ?
                      ((8'haf) - reg45) : $unsigned((8'hbf))) ?
                  reg48 : reg48[(4'ha):(3'h7)])});
          reg48 <= (+$unsigned(reg49[(4'h9):(1'h0)]));
          if (reg46)
            begin
              reg49 <= wire20[(4'h9):(4'h9)];
              reg50 <= reg52;
              reg51 <= $unsigned(($signed($signed($unsigned(wire43))) != $unsigned((-(reg52 ^~ (8'hb3))))));
            end
          else
            begin
              reg49 <= (&(reg50[(4'hf):(3'h7)] * $signed((8'hb6))));
              reg50 <= (wire41 | $unsigned($unsigned(wire18[(2'h2):(2'h2)])));
            end
        end
    end
  assign wire53 = $signed((reg45[(1'h1):(1'h0)] >> reg46[(1'h0):(1'h0)]));
  module54 #() modinst67 (.wire57(reg45), .y(wire66), .clk(clk), .wire58(wire44), .wire56(wire19), .wire59(reg49), .wire55(wire22));
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire59;
  input wire signed [(2'h3):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire [(4'he):(1'h0)] wire56;
  input wire [(4'ha):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire60;
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  assign y = {wire65, wire64, wire60, reg63, reg62, reg61, (1'h0)};
  assign wire60 = $unsigned(wire57);
  always
    @(posedge clk) begin
      reg61 <= wire55[(3'h6):(2'h3)];
      reg62 <= wire59;
      reg63 <= ((($signed((wire55 ? wire58 : reg61)) - $signed((wire57 ?
          wire58 : wire56))) <<< (!(&(wire55 != reg62)))) ^~ $signed(((wire56 >= (-(8'hb0))) ?
          $signed((wire60 & reg62)) : (~&(reg61 - wire57)))));
    end
  assign wire64 = $unsigned($unsigned({((wire60 >= (8'ha6)) <= $unsigned((8'h9f))),
                      ((&wire57) ? (wire60 ? reg62 : wire56) : {(8'hae)})}));
  assign wire65 = wire64[(3'h7):(3'h5)];
endmodule

module module23
#(parameter param40 = ((^~{(((8'hb9) ^~ (8'hac)) ? (~&(8'ha5)) : ((8'haf) ? (8'h9c) : (7'h41))), {(^(8'hae))}}) >= (&(+(((8'h9e) ? (7'h41) : (8'ha0)) ? ((8'hb1) + (8'had)) : (8'h9c))))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
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
                 wire29,
                 (1'h0)};
  assign wire29 = wire25[(4'hc):(3'h4)];
  assign wire30 = wire26[(3'h4):(1'h0)];
  assign wire31 = $unsigned({(-wire29)});
  assign wire32 = ({$unsigned($unsigned({wire30, wire29})),
                      {$signed(((8'haf) ?
                              (8'ha4) : wire25))}} | (-((8'hb9) != $unsigned((-(8'ha4))))));
  assign wire33 = wire27;
  assign wire34 = ((+(wire27[(2'h3):(2'h2)] << ((!(8'ha8)) > (^wire32)))) < (((wire33 ?
                          $signed(wire33) : $unsigned(wire27)) ^~ (((8'hac) ?
                              wire27 : wire33) ?
                          wire25 : $signed(wire25))) ?
                      $unsigned((-{wire32, wire32})) : wire24[(5'h12):(4'ha)]));
  assign wire35 = ($unsigned((8'hab)) != ({($unsigned(wire32) && wire26)} | wire29));
  assign wire36 = wire29;
  assign wire37 = (wire35 ?
                      (~{$signed((wire24 ? (8'hb4) : wire25)),
                          wire28}) : $unsigned($signed($unsigned((&wire31)))));
  assign wire38 = wire27[(1'h1):(1'h0)];
  assign wire39 = (^~wire32);
endmodule
