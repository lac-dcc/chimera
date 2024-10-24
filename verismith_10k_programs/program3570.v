module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire201;
  wire [(4'hf):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire196;
  wire [(5'h14):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire94;
  reg [(5'h14):(1'h0)] reg200 = (1'h0);
  assign y = {wire201,
                 wire199,
                 wire198,
                 wire196,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire61,
                 wire45,
                 wire43,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire63,
                 wire64,
                 wire65,
                 wire94,
                 reg200,
                 (1'h0)};
  assign wire4 = (wire0[(1'h1):(1'h0)] ^~ wire0);
  assign wire5 = $signed(wire0);
  assign wire6 = ({((wire5 ? (8'hb9) : $unsigned(wire0)) ?
                             ((-(8'hbc)) ?
                                 ((8'hb5) && wire2) : $signed(wire2)) : (wire5 == (wire1 != wire0))),
                         $signed((+(wire5 ? wire0 : wire3)))} ?
                     $signed($signed(wire4[(1'h1):(1'h1)])) : $signed(($signed(wire2[(4'h9):(2'h3)]) || $signed($unsigned(wire2)))));
  assign wire7 = wire0;
  assign wire8 = {(($signed((~^(8'ha1))) ?
                             $signed(wire4[(3'h4):(3'h4)]) : wire5) ?
                         (!{(wire6 ? wire4 : wire4),
                             (wire1 <= wire4)}) : wire2[(3'h4):(3'h4)])};
  module9 #() modinst44 (wire43, clk, wire6, wire3, wire5, wire4);
  assign wire45 = (wire5[(5'h11):(2'h2)] ?
                      $unsigned((wire4 <= $signed($unsigned(wire0)))) : wire4);
  module46 #() modinst62 (wire61, clk, wire1, wire45, wire5, wire4, wire3);
  assign wire63 = $unsigned({(!$signed($unsigned(wire3)))});
  assign wire64 = (!wire3);
  assign wire65 = ($signed($signed(wire3)) <<< (~(wire6[(1'h1):(1'h1)] ?
                      {wire6[(3'h6):(1'h1)]} : ($unsigned(wire3) ?
                          wire6 : $signed(wire2)))));
  module66 #() modinst95 (wire94, clk, wire45, wire0, wire7, wire64, wire43);
  assign wire96 = wire4;
  assign wire97 = $unsigned((wire94 ?
                      wire0 : {{wire61}, wire5[(3'h6):(1'h0)]}));
  assign wire98 = {$signed((($unsigned(wire5) & $unsigned(wire97)) <= wire63[(3'h7):(2'h3)]))};
  assign wire99 = $signed(wire1[(4'hb):(4'h9)]);
  assign wire100 = ($signed($unsigned($unsigned((~|wire1)))) == (($unsigned($signed(wire98)) <= (~^$unsigned(wire6))) ?
                       (($signed(wire61) ?
                               $unsigned(wire4) : wire43[(2'h3):(2'h3)]) ?
                           $signed({wire43,
                               wire5}) : {$unsigned(wire0)}) : {wire45[(4'hf):(4'h8)]}));
  module101 #() modinst197 (wire196, clk, wire94, wire6, wire2, wire0);
  assign wire198 = wire94;
  assign wire199 = $signed((((~$unsigned(wire61)) ^ $signed({wire3})) ~^ ({(+wire65)} ?
                       ({wire61} ^~ {wire63}) : wire3)));
  always
    @(posedge clk) begin
      reg200 <= $unsigned(($unsigned(($signed(wire96) * {wire61, wire64})) ?
          (($unsigned(wire5) * (wire100 ?
              wire94 : wire8)) < wire43[(2'h2):(1'h1)]) : ({wire8[(2'h3):(1'h0)],
              wire196} < (((8'hb2) && (8'hb2)) << (7'h41)))));
    end
  assign wire201 = ((+wire97) ^ wire96[(3'h6):(1'h0)]);
endmodule

module module101  (y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire105;
  input wire signed [(5'h10):(1'h0)] wire104;
  input wire [(5'h12):(1'h0)] wire103;
  input wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire194;
  wire [(4'hc):(1'h0)] wire149;
  wire [(4'hf):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire145;
  wire [(4'h9):(1'h0)] wire143;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  assign y = {wire194,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 (1'h0)};
  assign wire106 = wire102;
  assign wire107 = wire105[(3'h5):(2'h3)];
  assign wire108 = ($signed(wire106[(4'hb):(4'h9)]) ?
                       {(8'hb0)} : wire107[(4'h8):(1'h0)]);
  assign wire109 = wire105;
  always
    @(posedge clk) begin
      if (({$unsigned((8'ha6))} <<< $signed($unsigned((&(~|wire107))))))
        begin
          reg110 <= wire106;
          reg111 <= (wire109 * reg110);
          reg112 <= reg111;
          reg113 <= (reg111 ^~ wire103[(4'hf):(1'h1)]);
          reg114 <= (-wire103);
        end
      else
        begin
          reg110 <= $unsigned(wire108[(3'h4):(1'h1)]);
          reg111 <= reg112;
          reg112 <= wire106[(4'hc):(4'h9)];
          if (wire107[(3'h6):(3'h4)])
            begin
              reg113 <= $unsigned(((8'hbe) ?
                  ($unsigned((wire106 ? wire109 : wire104)) ?
                      reg114 : wire105[(3'h5):(2'h2)]) : reg113[(4'he):(4'h8)]));
              reg114 <= $signed(reg113[(3'h5):(2'h3)]);
              reg115 <= {((-((^wire109) <<< $signed((8'ha4)))) ?
                      wire102 : wire104),
                  $signed((wire102 <<< $unsigned((wire107 | reg112))))};
              reg116 <= ($unsigned(($unsigned($unsigned(wire103)) ?
                      ((~(8'ha7)) ?
                          (8'ha3) : $signed(wire108)) : $unsigned(reg113[(2'h3):(1'h1)]))) ?
                  ((^~wire108) ?
                      (wire108[(3'h7):(3'h7)] ?
                          wire106 : $unsigned((wire109 ?
                              wire106 : wire103))) : $signed(reg111)) : {wire104});
            end
          else
            begin
              reg113 <= $signed(reg110);
              reg114 <= wire104;
            end
          reg117 <= (~^{(8'hb8)});
        end
      reg118 <= reg116;
    end
  assign wire119 = {$signed(wire102), reg116[(1'h1):(1'h1)]};
  assign wire120 = $unsigned(((($signed(wire106) ?
                               reg111[(3'h5):(3'h4)] : $signed(wire109)) ?
                           ($unsigned(reg112) ?
                               $signed(wire103) : {reg115,
                                   wire108}) : wire108[(4'h9):(3'h7)]) ?
                       $unsigned(wire107[(1'h1):(1'h0)]) : $signed(reg112[(3'h4):(2'h2)])));
  assign wire121 = ((&reg115[(3'h5):(3'h4)]) ?
                       ((^~(reg114[(2'h2):(1'h1)] >>> {(8'ha5), wire120})) ?
                           $unsigned(reg117) : (reg112[(3'h5):(2'h3)] <= {(wire109 ?
                                   reg112 : wire119)})) : ((!(!(&reg114))) != (+wire103)));
  assign wire122 = (($unsigned({(reg115 ? reg116 : reg116),
                       wire121}) > $signed($signed((-reg110)))) && {(+($signed(wire108) >>> (wire106 ?
                           reg111 : reg110)))});
  module123 #() modinst144 (wire143, clk, reg112, reg118, reg117, reg113);
  assign wire145 = $unsigned($signed(wire119));
  assign wire146 = ($unsigned($unsigned(reg110[(3'h6):(3'h4)])) && $unsigned((reg117[(4'h9):(3'h7)] ?
                       ((wire107 ^~ wire103) ?
                           (reg116 ?
                               wire108 : wire108) : $signed(wire122)) : wire119[(1'h0):(1'h0)])));
  assign wire147 = (wire119[(1'h1):(1'h1)] < ($signed($signed(reg112[(3'h4):(1'h1)])) ?
                       ($unsigned($unsigned(wire122)) ?
                           $unsigned(reg117[(5'h12):(2'h3)]) : {(^~reg116),
                               reg117[(2'h3):(1'h0)]}) : (+reg115)));
  assign wire148 = $signed($unsigned($signed({(wire121 <<< reg112)})));
  assign wire149 = {$signed((-wire146)),
                       ($unsigned($unsigned(reg116)) >> reg113[(2'h3):(1'h1)])};
  module150 #() modinst195 (.wire153(reg111), .y(wire194), .wire155(wire147), .wire152(wire106), .wire154(wire143), .wire151(wire102), .clk(clk));
endmodule

module module66  (y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  input wire [(4'hb):(1'h0)] wire69;
  input wire [(4'hc):(1'h0)] wire68;
  input wire [(2'h2):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire73,
                 wire72,
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
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire72 = $unsigned(($signed(wire71[(2'h3):(1'h1)]) ?
                      ((^(&wire69)) ?
                          wire70 : (wire69 ?
                              (wire67 ?
                                  wire69 : wire67) : (wire71 <= wire71))) : (~|$unsigned((wire69 ?
                          wire70 : wire67)))));
  assign wire73 = $signed(wire70[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg74 <= {wire67[(1'h0):(1'h0)], (^$signed(wire67))};
      reg75 <= ((($signed({reg74}) < $unsigned({wire71,
              (8'hbf)})) ^ $unsigned(wire71)) ?
          wire70[(3'h4):(2'h2)] : (8'ha0));
      reg76 <= ({wire73} >> $unsigned($unsigned(wire68)));
    end
  assign wire77 = $unsigned(((|wire70) ?
                      $signed(wire72[(5'h10):(3'h4)]) : $signed($unsigned((reg76 ?
                          reg74 : wire68)))));
  assign wire78 = (~$signed((~^$unsigned(((8'hb0) < reg75)))));
  always
    @(posedge clk) begin
      if (({($unsigned((~|wire73)) ?
                  $signed((~&wire67)) : {$unsigned((8'hbc)),
                      $unsigned(wire71)})} ?
          $signed(wire71) : wire67))
        begin
          if (($signed($unsigned({(~^wire73)})) == $signed($unsigned((^((8'h9c) == reg75))))))
            begin
              reg79 <= wire78[(2'h3):(2'h3)];
              reg80 <= reg76;
            end
          else
            begin
              reg79 <= {wire71[(1'h0):(1'h0)], reg79};
            end
          reg81 <= (((!reg74[(4'hd):(1'h0)]) | ($unsigned((~&reg79)) <= ($unsigned(wire78) ?
              $signed(wire70) : (^reg76)))) || $signed({$signed((^wire72))}));
          if ((&reg80))
            begin
              reg82 <= {$unsigned($signed($unsigned((wire73 ?
                      reg75 : wire68)))),
                  reg75};
              reg83 <= $signed({(!(^{reg76})), (^~(|(^(8'ha7))))});
              reg84 <= (wire73 ?
                  $signed(reg79) : $signed({($signed(wire67) >= wire78),
                      wire67[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg82 <= wire78;
              reg83 <= (8'hbb);
              reg84 <= ((^~reg83) ?
                  (wire68[(3'h6):(1'h0)] ?
                      $signed((reg79 <<< (-(8'h9d)))) : wire72) : ((((8'hbe) ?
                      {reg81} : $signed(wire78)) == {$unsigned(reg80),
                      $signed(reg82)}) < reg83[(3'h7):(3'h7)]));
              reg85 <= ({(reg75[(1'h0):(1'h0)] ?
                      ((reg75 ? reg74 : wire69) ?
                          (^wire72) : ((8'hb1) >> wire72)) : $signed(wire70))} < wire71);
              reg86 <= {(~&(($unsigned(wire73) ~^ wire73[(2'h3):(2'h2)]) && reg85[(2'h3):(2'h3)])),
                  reg75};
            end
          reg87 <= (8'ha3);
          if (({(wire77[(3'h4):(1'h1)] & wire77[(1'h0):(1'h0)]),
                  (+$signed((wire70 ? reg87 : reg85)))} ?
              ((+((reg82 ? reg81 : (8'ha1)) ^ $signed(reg74))) ?
                  $signed((8'ha0)) : ((!(8'hb9)) ?
                      (~|(|reg76)) : (^wire78[(3'h7):(3'h4)]))) : {$unsigned((reg84[(4'h9):(2'h2)] ?
                      ((7'h44) ? wire69 : reg82) : wire71[(2'h2):(1'h0)])),
                  $signed((^{reg86}))}))
            begin
              reg88 <= (reg82[(3'h5):(3'h5)] ?
                  wire78 : {$unsigned(reg85[(2'h2):(1'h1)]),
                      {$unsigned((|reg79)), $unsigned(wire70)}});
              reg89 <= ({(+{$signed(reg74)}), reg79[(3'h7):(3'h6)]} ?
                  wire78[(3'h7):(2'h2)] : $unsigned((~reg75[(1'h1):(1'h1)])));
              reg90 <= $unsigned(wire77);
            end
          else
            begin
              reg88 <= $signed(reg82);
              reg89 <= $signed((reg74 ?
                  wire68[(4'ha):(1'h1)] : $signed(wire71)));
              reg90 <= wire70;
              reg91 <= $signed((((~&wire73) ?
                      reg81[(3'h4):(1'h1)] : $signed({wire77})) ?
                  reg74[(3'h7):(2'h2)] : $unsigned($unsigned((wire68 ?
                      wire71 : reg87)))));
              reg92 <= $signed($unsigned($unsigned((^reg87))));
            end
        end
      else
        begin
          reg79 <= $unsigned(reg79);
          if (((wire70 ?
                  {$unsigned((reg85 <= (8'hb7)))} : (({wire70} && $signed((8'hb8))) ?
                      {(reg80 != reg75),
                          $signed(reg88)} : $unsigned($signed((8'ha1))))) ?
              (^~$unsigned((reg83[(2'h2):(2'h2)] << $signed(wire71)))) : reg86))
            begin
              reg80 <= (8'h9c);
              reg81 <= {reg75};
              reg82 <= $signed(reg79);
              reg83 <= reg80[(2'h2):(1'h1)];
              reg84 <= $signed(reg76[(3'h4):(2'h3)]);
            end
          else
            begin
              reg80 <= ((+wire71[(1'h0):(1'h0)]) ?
                  (^~$unsigned((~reg92))) : reg89);
              reg81 <= ($signed($unsigned(wire73)) ~^ ($signed((~|((8'hb3) ?
                      reg74 : (8'ha5)))) ?
                  $signed(((reg84 ?
                      reg90 : reg90) ~^ $signed(reg90))) : wire67[(1'h0):(1'h0)]));
              reg82 <= (~&$signed((((reg86 < (7'h42)) ?
                      $unsigned(reg80) : $unsigned(reg79)) ?
                  {(reg91 ? reg86 : reg90),
                      wire71} : $signed((wire78 - (7'h40))))));
              reg83 <= $unsigned(reg85);
              reg84 <= (($unsigned({$signed(reg82)}) ?
                      ((wire69 ^ reg82[(3'h7):(2'h3)]) ?
                          reg84[(3'h6):(2'h3)] : wire68) : $signed(($unsigned(reg74) ?
                          (!(8'ha2)) : wire78))) ?
                  wire71[(3'h4):(3'h4)] : $unsigned((~&reg75[(1'h0):(1'h0)])));
            end
          reg85 <= reg79[(3'h7):(3'h6)];
          reg86 <= (reg91 ? (~^reg75[(2'h2):(2'h2)]) : (!wire70));
        end
      reg93 <= $unsigned(reg74[(4'h9):(4'h9)]);
    end
endmodule

module module46
#(parameter param59 = ((8'hb0) ^ (~^({{(8'ha3)}, ((8'ha5) & (8'hb2))} ? {{(8'ha3)}} : {((8'hbe) >= (8'ha8)), (!(8'hbd))}))), 
parameter param60 = param59)
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire51;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire signed [(5'h11):(1'h0)] wire49;
  input wire signed [(5'h13):(1'h0)] wire48;
  input wire signed [(3'h6):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  assign y = {wire58, wire57, wire56, wire55, wire54, wire53, wire52, (1'h0)};
  assign wire52 = $signed((wire49 >>> ($unsigned(((8'ha9) | wire50)) ?
                      wire49 : (+$signed(wire51)))));
  assign wire53 = $signed(wire52[(1'h0):(1'h0)]);
  assign wire54 = wire47[(3'h6):(3'h6)];
  assign wire55 = $signed($unsigned($signed((~^wire51[(3'h7):(3'h5)]))));
  assign wire56 = $unsigned($unsigned($signed($unsigned({(8'h9e), wire50}))));
  assign wire57 = (|wire51);
  assign wire58 = wire49;
endmodule

module module9
#(parameter param41 = ((~&(~^(((7'h42) ~^ (8'hb2)) ? ((8'hba) ? (7'h40) : (8'haf)) : (8'hb0)))) << (((|{(8'hb7)}) ? {((8'h9d) >= (8'hb6))} : (((8'ha7) != (8'hb3)) & ((8'hb1) ? (7'h43) : (8'had)))) | (8'ha1))), 
parameter param42 = {param41})
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire37;
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire37,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire14 = ((((|(wire11 & (8'ha5))) ?
                          $signed(wire10) : wire12[(2'h3):(1'h0)]) ^ $unsigned(wire10)) ?
                      $unsigned(wire11) : ((8'h9c) <= $unsigned(($signed(wire12) & (~|wire12)))));
  assign wire15 = (-$unsigned(wire13[(2'h2):(1'h1)]));
  assign wire16 = (8'ha3);
  assign wire17 = (((|(&$unsigned(wire16))) + $unsigned(($signed((8'hb9)) != (wire16 | (8'hb2))))) ?
                      {wire14[(3'h4):(3'h4)],
                          {(+((8'hac) && (7'h43))),
                              $unsigned((wire13 ?
                                  wire11 : wire13))}} : (-$signed(((!wire10) ?
                          {(8'hac), wire13} : (&wire13)))));
  always
    @(posedge clk) begin
      reg18 <= (($signed(wire14[(3'h4):(2'h3)]) | ((wire14[(3'h5):(3'h4)] ~^ wire12) != $unsigned(wire10))) < $unsigned(wire14[(2'h3):(2'h2)]));
      reg19 <= $unsigned(($unsigned((^(&wire11))) ^~ (^reg18)));
      reg20 <= {(wire10[(2'h2):(2'h2)] ^ {$signed(wire11),
              (^(wire17 >>> wire14))}),
          wire16};
    end
  module21 #() modinst38 (.wire24(reg19), .wire26(reg18), .wire25(wire15), .clk(clk), .wire23(wire17), .y(wire37), .wire22(wire16));
  assign wire39 = (!{($signed((-wire37)) ?
                          {wire17[(3'h6):(2'h2)],
                              (wire15 ? wire15 : wire16)} : ((+wire13) ?
                              (wire14 ?
                                  wire10 : wire12) : wire11[(2'h3):(2'h3)]))});
  assign wire40 = $signed($signed($signed((~&$signed(wire13)))));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire signed [(4'hf):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire27;
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire27,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire27 = (&$signed($unsigned($unsigned(wire23))));
  always
    @(posedge clk) begin
      reg28 <= wire24;
      reg29 <= (((~|wire22[(1'h1):(1'h0)]) != (8'hab)) + $unsigned((wire27[(4'hc):(1'h1)] ?
          (|reg28[(4'h9):(3'h6)]) : {(wire26 ? wire27 : wire25)})));
      reg30 <= ({(8'hb4),
              (({wire22, wire23} >= wire24[(4'h9):(3'h4)]) <<< {(&wire27),
                  wire22[(2'h2):(1'h1)]})} ?
          $unsigned(wire26[(2'h2):(1'h0)]) : wire25[(4'ha):(2'h2)]);
      reg31 <= $unsigned({$signed(wire25[(4'hf):(4'he)]),
          (~|((~&wire25) * (8'ha8)))});
      reg32 <= $signed(reg28);
    end
  assign wire33 = (reg29[(4'h8):(1'h0)] ^~ (wire27[(3'h6):(3'h5)] - (~$unsigned((!reg28)))));
  assign wire34 = $signed((($unsigned($signed(wire27)) ?
                      (wire23[(1'h0):(1'h0)] << (&wire24)) : ({reg30,
                          reg32} <<< $unsigned(reg31))) || (!($unsigned(wire22) ?
                      wire24[(4'hc):(1'h1)] : {reg28, wire26}))));
  assign wire35 = $signed(wire24);
  assign wire36 = ((({(wire22 * reg29)} ?
                              ((8'hba) ? $signed(reg29) : reg30) : wire25) ?
                          ((^$signed(wire27)) ?
                              wire22[(1'h1):(1'h0)] : $signed($unsigned(wire23))) : wire35[(3'h4):(2'h3)]) ?
                      ($unsigned((~&(reg30 ?
                          wire26 : wire23))) >> (($unsigned(wire26) ^ (7'h40)) < {reg28,
                          wire33})) : (wire27[(3'h7):(3'h7)] ?
                          (-reg30[(3'h5):(1'h0)]) : $signed($signed($unsigned((8'ha1))))));
endmodule

module module150  (y, clk, wire155, wire154, wire153, wire152, wire151);
  output wire [(32'h1b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire155;
  input wire signed [(4'h8):(1'h0)] wire154;
  input wire signed [(5'h12):(1'h0)] wire153;
  input wire [(5'h14):(1'h0)] wire152;
  input wire [(3'h7):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire193;
  wire signed [(5'h12):(1'h0)] wire192;
  wire signed [(4'hd):(1'h0)] wire191;
  wire signed [(4'hf):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire189;
  wire signed [(4'hf):(1'h0)] wire188;
  wire signed [(4'hf):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire signed [(3'h4):(1'h0)] wire185;
  wire signed [(4'h8):(1'h0)] wire184;
  wire [(4'hf):(1'h0)] wire183;
  wire [(3'h5):(1'h0)] wire182;
  wire [(4'h8):(1'h0)] wire181;
  wire signed [(5'h11):(1'h0)] wire180;
  wire [(4'hd):(1'h0)] wire179;
  wire signed [(3'h4):(1'h0)] wire178;
  wire [(4'ha):(1'h0)] wire177;
  wire signed [(3'h7):(1'h0)] wire176;
  wire signed [(5'h14):(1'h0)] wire175;
  wire [(2'h2):(1'h0)] wire174;
  wire signed [(3'h6):(1'h0)] wire156;
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(3'h6):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg168 = (1'h0);
  reg [(2'h2):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire156,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire156 = (+$unsigned(($signed($signed(wire152)) ?
                       wire153[(4'h8):(3'h5)] : {$signed(wire151)})));
  always
    @(posedge clk) begin
      reg157 <= wire151;
      reg158 <= wire151;
      if ((8'hb3))
        begin
          reg159 <= reg158;
          if ({$signed(wire155[(2'h2):(1'h1)]), wire153[(3'h6):(1'h0)]})
            begin
              reg160 <= $signed(reg158);
              reg161 <= reg158[(1'h1):(1'h1)];
              reg162 <= $signed((+$unsigned(((reg158 ? reg157 : (8'ha5)) ?
                  (~&reg160) : $signed(wire153)))));
            end
          else
            begin
              reg160 <= wire153;
              reg161 <= $signed((($signed((!wire155)) || ((wire155 ?
                  reg162 : (8'ha8)) <= $unsigned(wire153))) == $unsigned({reg162})));
              reg162 <= {{(((wire155 ^ wire153) ?
                              (wire155 <= wire153) : (8'hb4)) ?
                          reg162[(2'h2):(2'h2)] : wire153),
                      $unsigned(($unsigned(reg161) == {(8'hb8)}))},
                  ((~&($signed(reg157) ?
                      (8'hae) : reg157)) >>> ((wire156 == (~|wire154)) ^ {(+wire155),
                      (reg158 ? (8'ha7) : reg162)}))};
              reg163 <= $unsigned((reg161 == reg157[(2'h2):(2'h2)]));
              reg164 <= wire154[(3'h6):(3'h4)];
            end
          if ($unsigned(($signed(wire154[(3'h5):(1'h0)]) ?
              (|wire153) : (!((reg162 < reg159) ? (~^wire153) : (~(8'h9e)))))))
            begin
              reg165 <= $signed($unsigned((($unsigned(wire156) * (reg159 ?
                      (8'ha0) : reg158)) ?
                  ((~|wire152) >= {wire153,
                      reg162}) : ($signed(reg162) >= wire152[(4'hf):(3'h6)]))));
              reg166 <= $signed((~^$unsigned($unsigned(reg161[(4'ha):(3'h6)]))));
            end
          else
            begin
              reg165 <= $unsigned($unsigned((^~reg165)));
            end
          reg167 <= wire151[(2'h2):(1'h1)];
          reg168 <= $unsigned(reg162[(4'hb):(4'hb)]);
        end
      else
        begin
          reg159 <= $signed((-$unsigned(((reg159 & reg162) < wire152))));
          if ((|($unsigned(((^~(8'ha9)) << (wire153 ? reg166 : reg157))) ?
              $signed(reg165[(2'h2):(1'h0)]) : (!(-(8'ha2))))))
            begin
              reg160 <= (reg167 >> ($signed($signed({reg159,
                  reg162})) + (8'had)));
              reg161 <= (~&(~|reg164));
              reg162 <= (~^(!$signed({$unsigned((8'hb7))})));
            end
          else
            begin
              reg160 <= (wire153[(5'h12):(5'h10)] ?
                  wire154[(1'h0):(1'h0)] : reg157);
              reg161 <= reg166[(4'h9):(3'h7)];
              reg162 <= reg158;
              reg163 <= {(-($signed((wire152 - reg158)) << reg165)),
                  $unsigned(((((8'ha7) ? wire155 : (8'hb8)) ?
                      $unsigned(reg167) : {wire156, reg161}) < ((reg165 ?
                      reg167 : reg162) ^ $unsigned(reg165))))};
            end
          reg164 <= (~(((!wire156) ?
              reg162[(1'h1):(1'h1)] : ({reg164, wire151} <<< (reg168 ?
                  reg165 : reg168))) & (($unsigned(reg168) ?
                  $signed(reg164) : $signed(reg166)) ?
              reg168[(4'hf):(4'h8)] : $signed($signed(wire156)))));
          reg165 <= {$unsigned(reg164[(2'h3):(2'h3)]),
              ((wire151[(3'h5):(1'h1)] <<< ((-reg167) ?
                      $signed(wire153) : (~reg163))) ?
                  reg160 : (^~(reg162[(4'h8):(3'h6)] ?
                      reg168 : (wire152 || wire152))))};
        end
      if ($signed({($signed((&reg165)) && {reg167[(1'h1):(1'h1)],
              $signed(reg165)}),
          reg161}))
        begin
          if (wire151[(3'h7):(1'h0)])
            begin
              reg169 <= (reg167[(2'h2):(1'h1)] ?
                  (~^$signed(($signed(reg163) ?
                      $unsigned(reg167) : $signed(reg165)))) : reg161[(4'hd):(2'h3)]);
            end
          else
            begin
              reg169 <= $signed($unsigned(reg167));
              reg170 <= $signed(({(~&(~reg169))} || $signed(reg165)));
              reg171 <= reg157[(5'h12):(4'h9)];
              reg172 <= (~^reg162[(3'h4):(2'h3)]);
            end
        end
      else
        begin
          reg169 <= $unsigned((((7'h40) ~^ {reg167}) << (reg165 ?
              wire153[(4'h8):(4'h8)] : (8'ha6))));
          reg170 <= $signed({(^$signed((^(7'h44)))),
              $signed($signed((reg168 ? wire152 : reg159)))});
        end
      reg173 <= {(|$unsigned((reg172[(1'h0):(1'h0)] ?
              $signed((8'ha5)) : (~^(8'hb0))))),
          reg161[(5'h12):(4'hc)]};
    end
  assign wire174 = ((!wire156) < $unsigned({$signed(reg170[(2'h3):(2'h3)]),
                       $signed(wire152)}));
  assign wire175 = wire152;
  assign wire176 = ($signed($unsigned($unsigned($signed(wire153)))) ?
                       (8'had) : (reg165 ?
                           (~&$unsigned({wire156, reg170})) : (~(~|{reg165}))));
  assign wire177 = $unsigned($signed((~&reg168)));
  assign wire178 = (((reg170 ?
                       reg167 : (!reg166)) >> $signed(reg170)) + (^((reg165 ?
                       reg161[(1'h0):(1'h0)] : wire154[(4'h8):(2'h2)]) ~^ reg169[(4'hf):(1'h1)])));
  assign wire179 = $signed({wire177[(3'h7):(3'h4)]});
  assign wire180 = (reg173 ? wire177 : wire154);
  assign wire181 = ((-(wire175[(4'hd):(4'h8)] ?
                           {{reg173},
                               reg167[(1'h0):(1'h0)]} : (reg159[(2'h2):(1'h0)] ?
                               (|wire153) : reg171[(3'h5):(3'h4)]))) ?
                       wire156 : wire179[(3'h5):(1'h0)]);
  assign wire182 = reg163[(3'h5):(1'h0)];
  assign wire183 = reg171;
  assign wire184 = (reg162 ?
                       {wire152[(1'h1):(1'h0)]} : $unsigned(reg172[(3'h6):(3'h5)]));
  assign wire185 = ($signed($unsigned(($unsigned(wire183) ?
                       $unsigned(reg158) : (wire152 ?
                           reg172 : reg158)))) || $unsigned({(reg165[(1'h0):(1'h0)] ^ (reg170 >= (8'ha3)))}));
  assign wire186 = ({wire184[(3'h6):(2'h3)],
                           (~|({wire156} ?
                               (wire152 ? (8'hbe) : reg161) : ((7'h43) ?
                                   wire184 : reg166)))} ?
                       ((8'ha9) ?
                           $signed(((wire176 ? wire178 : wire181) ?
                               wire183[(4'hc):(4'h9)] : (wire176 ?
                                   reg163 : reg163))) : ($unsigned($signed(wire185)) ?
                               $unsigned(wire153[(1'h1):(1'h1)]) : reg172)) : $unsigned({(7'h40)}));
  assign wire187 = wire184;
  assign wire188 = (-$signed($signed({reg166[(3'h4):(2'h2)],
                       $unsigned(reg167)})));
  assign wire189 = ($signed($unsigned((8'hb2))) * $signed($signed($signed($signed(reg161)))));
  assign wire190 = $signed(((~&(^~(reg169 ?
                       wire179 : reg165))) >> (((reg171 * reg161) ?
                       (reg166 & wire154) : (wire187 ?
                           wire188 : reg166)) ^ $signed($unsigned(wire154)))));
  assign wire191 = reg171[(1'h1):(1'h1)];
  assign wire192 = reg162[(2'h2):(1'h1)];
  assign wire193 = $signed((~|($signed($signed((8'hba))) == $unsigned($unsigned(wire185)))));
endmodule

module module123  (y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire127;
  input wire signed [(5'h10):(1'h0)] wire126;
  input wire signed [(4'ha):(1'h0)] wire125;
  input wire [(5'h15):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire128;
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  assign y = {wire142,
                 wire133,
                 wire132,
                 wire131,
                 wire128,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire128 = (^wire126[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg129 <= wire127;
      reg130 <= wire127[(3'h4):(2'h2)];
    end
  assign wire131 = $signed({$unsigned($signed((8'hb8))),
                       wire125[(1'h0):(1'h0)]});
  assign wire132 = (wire124 ?
                       $unsigned((($signed(wire131) >>> $unsigned(wire131)) + {wire128[(1'h0):(1'h0)]})) : $unsigned((wire124 ?
                           (&(|wire127)) : ((^~(8'hb5)) << (wire124 ?
                               (8'hbe) : wire127)))));
  assign wire133 = (({$unsigned(wire128[(1'h0):(1'h0)])} != (reg129 || wire125[(4'h8):(3'h5)])) ?
                       $unsigned((($signed(wire131) ?
                           wire124 : (reg129 - wire126)) - (^~(reg129 != wire132)))) : (($signed($signed(wire126)) ?
                               (&(&wire131)) : (~&(wire125 ?
                                   wire132 : wire131))) ?
                           (8'ha5) : ($signed($unsigned((8'h9d))) ?
                               (|((8'ha7) ?
                                   wire127 : reg129)) : ((reg129 <= wire125) | $signed(wire126)))));
  always
    @(posedge clk) begin
      if ($signed($signed(wire132)))
        begin
          if (($unsigned(wire124[(4'hf):(4'ha)]) ?
              wire131[(4'ha):(2'h2)] : (({$unsigned(wire128),
                          (wire131 ? reg129 : wire132)} ?
                      {reg130, $unsigned(wire131)} : {$unsigned(wire124)}) ?
                  $signed(reg130) : wire124[(3'h7):(1'h1)])))
            begin
              reg134 <= wire127[(3'h6):(3'h4)];
              reg135 <= ($signed(wire133[(4'h8):(3'h4)]) ?
                  wire127[(4'h9):(3'h6)] : ((($signed(wire133) ?
                          (wire128 ? wire131 : reg129) : reg130) - wire125) ?
                      reg129 : $signed({(|wire128)})));
              reg136 <= $signed($signed($unsigned({(reg129 < wire128),
                  (~^(8'h9d))})));
              reg137 <= $signed($unsigned(($unsigned((wire131 << reg135)) ?
                  (-(!wire127)) : $signed($unsigned(wire133)))));
              reg138 <= $signed((7'h40));
            end
          else
            begin
              reg134 <= ((wire131 ?
                  (reg134[(1'h0):(1'h0)] ?
                      $signed($unsigned(reg129)) : wire133[(3'h5):(3'h5)]) : (wire133[(4'hd):(4'ha)] != (8'hba))) < {(wire124[(3'h7):(1'h0)] >> $signed($unsigned(reg136))),
                  (wire128 ^~ wire133)});
              reg135 <= (wire127[(4'h8):(3'h5)] | wire128[(1'h0):(1'h0)]);
              reg136 <= reg135;
              reg137 <= wire125;
              reg138 <= (~^(!({$unsigned(wire125),
                  $unsigned(wire125)} - wire131)));
            end
          if (reg136)
            begin
              reg139 <= (~|$signed((|wire133[(4'h8):(3'h5)])));
              reg140 <= ((reg130 ^ $signed((reg135 ?
                      (&reg137) : wire133[(4'hc):(1'h0)]))) ?
                  reg138 : (~(wire127 ?
                      wire126[(4'h9):(3'h6)] : (wire128 ?
                          wire124[(4'hb):(1'h0)] : (reg136 <<< wire125)))));
              reg141 <= (-reg139[(2'h3):(1'h0)]);
            end
          else
            begin
              reg139 <= (wire124[(3'h6):(1'h1)] << ($signed((~^wire133[(4'he):(1'h1)])) ?
                  $unsigned((~$signed((8'hb3)))) : wire126[(3'h4):(1'h1)]));
              reg140 <= (&(+(!wire125[(1'h0):(1'h0)])));
              reg141 <= {$unsigned((wire124[(5'h15):(4'h9)] > ({(8'had)} && $signed(reg137)))),
                  $unsigned((^$signed((reg141 ? reg129 : reg141))))};
            end
        end
      else
        begin
          reg134 <= $signed(wire133);
          if ($unsigned(reg134[(5'h15):(5'h11)]))
            begin
              reg135 <= wire127;
              reg136 <= $signed((((^{reg140}) || (reg134 ?
                  (reg136 ?
                      wire133 : reg139) : $unsigned(wire125))) >> $signed(reg138[(3'h4):(2'h2)])));
              reg137 <= (~&$unsigned((wire131[(4'h8):(3'h6)] ?
                  ((reg138 ?
                      reg129 : (8'ha0)) | $unsigned(wire124)) : $unsigned(((7'h40) ?
                      reg137 : (8'h9d))))));
            end
          else
            begin
              reg135 <= reg137[(4'ha):(1'h0)];
              reg136 <= wire126[(2'h3):(2'h3)];
              reg137 <= $signed($unsigned(({wire124[(3'h5):(2'h3)]} != (&reg137[(2'h3):(2'h2)]))));
              reg138 <= $unsigned((8'hb7));
            end
        end
    end
  assign wire142 = reg135;
endmodule
