module top
#(parameter param97 = (^(^(((-(8'h9c)) && ((8'ha8) ~^ (8'hb9))) ~^ {(|(8'hbd)), ((8'ha2) ? (8'hba) : (8'haf))}))), 
parameter param98 = (8'hb7))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire95;
  assign y = {wire4, wire5, wire6, wire7, wire8, wire95, (1'h0)};
  assign wire4 = wire0[(3'h6):(3'h6)];
  assign wire5 = ($unsigned(((wire2 ? (wire0 == wire3) : (wire2 || wire0)) ?
                         $unsigned((wire2 || wire1)) : ((^wire1) ?
                             $unsigned(wire2) : (&wire4)))) ?
                     $signed($unsigned((wire0 | wire0[(2'h3):(2'h2)]))) : (~&(((8'hac) ^ (wire4 ?
                             (7'h41) : wire1)) ?
                         (&wire4) : (!wire0))));
  assign wire6 = ({(wire4 & wire2),
                     wire4[(3'h7):(1'h0)]} && {$signed((^$unsigned(wire5))),
                     $signed((-(wire4 || wire3)))});
  assign wire7 = (~|(7'h40));
  assign wire8 = wire7;
  module9 #() modinst96 (wire95, clk, wire3, wire7, wire6, wire8, wire5);
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire92;
  wire [(5'h15):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  assign y = {wire94,
                 wire92,
                 wire38,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 (1'h0)};
  assign wire15 = (8'ha0);
  assign wire16 = wire10[(2'h2):(1'h0)];
  assign wire17 = ((^(wire11 || $unsigned(wire11[(3'h5):(3'h5)]))) ^~ (((8'h9d) ?
                          $signed((wire11 >> wire16)) : wire10[(3'h7):(2'h3)]) ?
                      (8'h9d) : (|(8'ha2))));
  assign wire18 = $signed(((^((wire13 ^ wire14) ?
                      {wire16, wire11} : {wire17,
                          (8'hb6)})) >= $signed(wire14)));
  assign wire19 = (~&$signed((-(((8'hbf) ? wire15 : (8'hbe)) <= wire10))));
  assign wire20 = {wire16, {wire11}};
  assign wire21 = $signed((~&(({wire18, wire11} != (~|wire11)) ?
                      wire14[(1'h1):(1'h1)] : wire16)));
  module22 #() modinst39 (wire38, clk, wire19, wire15, wire13, wire18);
  module40 #() modinst93 (wire92, clk, wire38, wire11, wire19, wire21);
  assign wire94 = $signed(($unsigned((wire12[(2'h2):(1'h1)] ?
                      (-wire11) : (&wire11))) << $unsigned($signed(wire16))));
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(4'hd):(1'h0)] wire43;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire80,
                 wire62,
                 wire61,
                 wire60,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg83,
                 reg82,
                 reg81,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire45 = $unsigned((((wire44[(2'h3):(1'h0)] ?
                      ((8'hb2) - wire44) : (wire44 == wire43)) | ((~&wire42) || ((8'hbe) ?
                      wire43 : wire43))) & wire41));
  assign wire46 = $unsigned(($signed((&(wire44 ? wire43 : wire45))) ?
                      {wire43} : $signed(((+wire45) ?
                          (wire42 > wire44) : {wire41}))));
  assign wire47 = ({$unsigned((|$signed((8'hbc)))), wire41} ?
                      (!(~$signed(wire46[(5'h11):(3'h5)]))) : wire44[(4'hb):(2'h2)]);
  assign wire48 = {{(+$unsigned($unsigned(wire42))),
                          ($unsigned($signed(wire42)) ?
                              (~&$unsigned(wire42)) : $unsigned($signed(wire41)))},
                      wire42};
  assign wire49 = $unsigned((($unsigned(wire47) >> wire48) >= ($signed($unsigned(wire47)) ^ ({(8'hab),
                          wire46} ?
                      wire45[(1'h1):(1'h1)] : $unsigned(wire44)))));
  always
    @(posedge clk) begin
      reg50 <= (($unsigned((+(wire46 ? wire41 : wire41))) || wire41) ?
          ($unsigned(wire47) ^ ((8'h9e) ?
              ((!wire48) <= (wire48 ?
                  wire45 : wire46)) : $unsigned((8'hb4)))) : {($signed(((8'hae) + wire41)) ^~ $unsigned((~|wire41)))});
    end
  always
    @(posedge clk) begin
      if ($signed(wire43))
        begin
          if ($signed(wire42[(3'h6):(2'h3)]))
            begin
              reg51 <= reg50[(3'h7):(3'h6)];
              reg52 <= (|{$unsigned(reg51), wire45});
              reg53 <= (wire49 ?
                  $signed((wire44[(3'h6):(3'h6)] ?
                      (-wire46[(4'h8):(4'h8)]) : reg51)) : $unsigned({reg50}));
              reg54 <= wire41[(3'h5):(1'h0)];
            end
          else
            begin
              reg51 <= ($unsigned(wire41) ~^ $signed(wire42[(1'h0):(1'h0)]));
              reg52 <= (^$signed((^(wire46[(5'h10):(4'hd)] * (~^wire48)))));
              reg53 <= {(!(reg51 > wire42))};
            end
          if (((~|$signed(((wire43 * wire45) ?
              (8'hb6) : (reg50 > reg52)))) && (~|{$unsigned($signed(wire48)),
              ($signed(wire41) ? (8'h9e) : (wire43 ? reg53 : (8'h9e)))})))
            begin
              reg55 <= $unsigned(wire49[(3'h5):(2'h3)]);
              reg56 <= ((wire49[(4'ha):(3'h7)] - $unsigned($unsigned({reg51,
                      wire47}))) ?
                  $unsigned($signed(reg53[(2'h2):(1'h1)])) : ((^((wire47 << reg53) ?
                          (wire43 ? reg55 : (8'hae)) : (wire46 ^~ (8'ha2)))) ?
                      $unsigned(reg55[(3'h7):(3'h5)]) : (wire49[(4'ha):(4'h8)] ?
                          (~^$signed(wire42)) : ((wire44 ? reg52 : (8'hac)) ?
                              $unsigned(wire44) : $signed((8'hb6))))));
            end
          else
            begin
              reg55 <= (~&((&((wire44 ? wire48 : wire47) < (wire46 ?
                  wire45 : wire43))) >>> $unsigned(wire42[(4'ha):(3'h5)])));
            end
        end
      else
        begin
          if ($unsigned(({$signed(reg54[(4'hd):(4'hc)])} ?
              wire43 : {$unsigned($unsigned((8'hb8)))})))
            begin
              reg51 <= wire48;
            end
          else
            begin
              reg51 <= wire48;
            end
          reg52 <= $signed((^~$signed((^~$signed(wire49)))));
          reg53 <= ((((wire41[(3'h6):(2'h2)] ?
                      $unsigned(reg53) : (wire49 <<< (8'hb6))) ?
                  reg54 : {$signed((8'ha8))}) <= wire46[(5'h14):(4'he)]) ?
              wire43[(4'h9):(4'h8)] : (8'hac));
        end
      reg57 <= ($signed(reg54[(3'h6):(1'h0)]) ?
          ((^~(reg56[(4'h8):(2'h2)] ^~ (^~reg53))) || reg53) : (^reg51[(4'hf):(4'h9)]));
      if ($unsigned(reg56))
        begin
          reg58 <= {$signed(wire47)};
          reg59 <= wire47[(3'h4):(1'h0)];
        end
      else
        begin
          reg58 <= (8'hb1);
        end
    end
  assign wire60 = (!$unsigned((reg55 | (^((8'hbd) ^ reg58)))));
  assign wire61 = $signed(wire48[(4'hc):(1'h0)]);
  assign wire62 = (^reg55);
  always
    @(posedge clk) begin
      reg63 <= wire46;
      if ($signed($unsigned(reg58)))
        begin
          if ($signed(wire44))
            begin
              reg64 <= ($unsigned($signed((~^(^(8'ha4))))) ?
                  wire46[(4'hf):(1'h1)] : (+wire61));
              reg65 <= (($unsigned($signed($signed(reg52))) ?
                      $unsigned(({reg59} ? wire45 : (~^reg57))) : (wire61 ?
                          reg56 : (&(wire43 - wire60)))) ?
                  wire62 : $signed((~$signed(((8'hb1) ^ reg59)))));
              reg66 <= {(~^$unsigned({{(8'h9f), (8'hab)}})),
                  (!$signed($signed($unsigned((8'hbb)))))};
              reg67 <= reg51[(4'h9):(3'h6)];
              reg68 <= (reg64 ?
                  $unsigned((-((wire46 ? reg50 : wire44) ?
                      ((8'ha4) ? reg64 : wire61) : (reg53 ?
                          (8'haf) : reg52)))) : wire47);
            end
          else
            begin
              reg64 <= ((wire61[(2'h3):(1'h0)] ?
                      $signed({$signed(wire46),
                          {(8'haf)}}) : (~^wire46[(4'hb):(2'h2)])) ?
                  $signed((((!reg50) ? (~&wire62) : (+reg56)) ?
                      (~^((8'haa) ? reg52 : (8'ha7))) : (~|(wire62 ?
                          wire60 : reg50)))) : $signed($unsigned((8'hbf))));
              reg65 <= $signed(((wire42 >= $unsigned((wire49 != reg50))) >= $signed(reg58)));
              reg66 <= (({reg53[(1'h0):(1'h0)]} == ((~{reg64}) ?
                  $signed($signed(wire62)) : $signed({wire49}))) | ({(reg58[(1'h1):(1'h1)] ?
                          reg55[(1'h1):(1'h0)] : ((7'h44) ? reg55 : reg50))} ?
                  (-reg58[(1'h0):(1'h0)]) : reg64[(3'h4):(2'h2)]));
            end
          reg69 <= wire41[(2'h3):(1'h1)];
          if ($unsigned($unsigned(wire62)))
            begin
              reg70 <= wire43;
              reg71 <= (~^wire60[(3'h7):(3'h5)]);
              reg72 <= reg55;
            end
          else
            begin
              reg70 <= reg70[(3'h6):(1'h1)];
              reg71 <= ((reg59 ? (!reg67) : (7'h43)) >> (^~(({reg67,
                      wire46} >>> wire43[(3'h5):(1'h0)]) ?
                  {{reg59, wire62},
                      wire61[(2'h2):(1'h1)]} : {$unsigned(wire43)})));
              reg72 <= reg63;
              reg73 <= (+(~&((~|{reg64}) ?
                  (^reg63[(2'h3):(2'h2)]) : (reg57[(3'h4):(1'h0)] >>> wire45))));
            end
        end
      else
        begin
          reg64 <= {$signed({($signed(wire43) ? (reg57 > reg52) : wire49)})};
          if (reg59[(3'h7):(3'h6)])
            begin
              reg65 <= (!{((^~(-(8'ha3))) ?
                      $unsigned(reg72) : $signed(reg70[(1'h0):(1'h0)])),
                  $unsigned({(wire44 ? reg72 : reg65)})});
              reg66 <= reg70[(4'h8):(3'h6)];
            end
          else
            begin
              reg65 <= $signed(reg50);
              reg66 <= ((reg70[(3'h4):(1'h1)] ^ wire48[(2'h2):(1'h0)]) ?
                  $signed((~&$unsigned(reg54))) : $signed($signed(wire43[(1'h1):(1'h1)])));
              reg67 <= (reg64[(3'h5):(1'h0)] ~^ (^~$signed((((8'hb7) ?
                  wire44 : reg58) << {wire62}))));
            end
          if ($unsigned(((($unsigned((8'hab)) && $signed((8'ha9))) ?
                  $signed(wire60[(4'hc):(4'hc)]) : reg66) ?
              wire41[(2'h3):(1'h0)] : {$unsigned(reg69[(4'he):(4'h8)]),
                  (~|(&wire43))})))
            begin
              reg68 <= {reg54[(4'hd):(1'h1)], (~&$signed(reg51))};
              reg69 <= reg51;
              reg70 <= (~^(-(^~$unsigned((|reg51)))));
              reg71 <= (reg67[(1'h0):(1'h0)] ?
                  ((8'ha9) & (reg64[(5'h10):(1'h1)] * (~(!reg56)))) : ($unsigned(reg58[(1'h1):(1'h0)]) == reg51[(4'hd):(4'hb)]));
            end
          else
            begin
              reg68 <= reg54[(4'ha):(3'h6)];
              reg69 <= reg51;
              reg70 <= ((((!wire49[(4'h8):(2'h3)]) == (^$signed(reg53))) ?
                  $unsigned(reg66) : {$signed((reg73 ? wire41 : reg53)),
                      reg52[(1'h0):(1'h0)]}) ~^ $unsigned(((8'hae) ?
                  ($signed(wire46) ~^ (+reg57)) : $signed((reg71 + (8'ha1))))));
              reg71 <= (-(~^$signed({{reg67}, (~wire61)})));
              reg72 <= {((~&{{wire42}}) - (reg53[(2'h2):(1'h0)] ?
                      $signed(reg64[(5'h11):(5'h10)]) : ({reg68} ?
                          (wire60 ? reg52 : reg59) : {(8'hbc), reg55}))),
                  (~(($signed(reg64) ? (~|wire42) : (~&(8'hb6))) == ({wire45,
                          (8'ha1)} ?
                      wire46 : reg68[(1'h1):(1'h0)])))};
            end
        end
      reg74 <= $signed($signed(((reg56[(4'h9):(3'h4)] ?
          (reg71 ? reg55 : wire61) : (^~wire47)) ~^ wire46[(4'hf):(2'h3)])));
      if ((-reg55))
        begin
          reg75 <= (((&$unsigned({wire42, reg67})) ?
              $unsigned(((reg72 != reg72) ?
                  ((8'hb2) ? wire41 : reg68) : {(8'ha4),
                      wire46})) : $unsigned(((reg53 >= reg66) <<< wire49[(4'h9):(3'h7)]))) ^~ (wire44 ?
              $signed($signed($unsigned(reg66))) : {$signed(((8'ha6) ?
                      wire43 : reg63)),
                  reg55[(4'h8):(3'h5)]}));
          reg76 <= {$signed(($unsigned($signed(reg59)) ^ (8'ha2)))};
          reg77 <= ($unsigned(reg66) ?
              (+{$signed((-reg66)),
                  ((wire42 ? reg51 : (7'h41)) ?
                      (-wire43) : {reg68, reg68})}) : ((reg68 ^ ({(7'h42),
                          reg76} ?
                      $unsigned(wire49) : reg69)) ?
                  (8'hb1) : (wire45[(1'h1):(1'h1)] ?
                      (~|(reg51 ? (8'hab) : wire41)) : ($signed(reg75) ?
                          (wire48 != wire46) : (reg68 <= reg58)))));
          reg78 <= (+(~^(reg51[(4'hd):(3'h7)] ?
              $signed(reg53) : reg58[(1'h0):(1'h0)])));
          reg79 <= ($unsigned($signed($signed(((8'haa) ? (8'hb4) : reg55)))) ?
              reg77[(4'h9):(3'h4)] : reg63);
        end
      else
        begin
          reg75 <= ((({{wire47}, (reg52 - reg58)} ?
                      (!((8'ha2) > wire48)) : {wire41[(3'h5):(1'h1)]}) ?
                  wire47 : (reg71[(1'h1):(1'h0)] != reg53[(2'h2):(2'h2)])) ?
              (($signed($signed(wire42)) ?
                      ({wire44, reg57} || $signed(wire45)) : (8'hbf)) ?
                  ($signed(wire62) <<< (~{(8'hb0)})) : ((-{reg59}) != $signed((wire49 && (7'h43))))) : (((~&(~|reg53)) ?
                      reg52[(2'h2):(1'h1)] : reg50) ?
                  (&wire61[(1'h1):(1'h0)]) : (^~(~^$unsigned(wire42)))));
        end
    end
  assign wire80 = ({(|reg67)} <<< $unsigned($unsigned($signed(reg66))));
  always
    @(posedge clk) begin
      reg81 <= $unsigned(wire47);
      reg82 <= $signed(($unsigned(((wire46 ? reg65 : (8'ha0)) ?
              (reg70 ? wire47 : reg81) : (wire47 ? wire44 : (8'hb1)))) ?
          $unsigned($unsigned($unsigned(reg76))) : (8'h9d)));
      reg83 <= reg81[(2'h2):(2'h2)];
    end
  assign wire84 = (reg52 ? {$signed(reg63)} : $signed(wire60[(5'h11):(3'h6)]));
  assign wire85 = ((reg72 ?
                          ((+reg66[(2'h3):(2'h3)]) ?
                              $signed((reg55 << reg58)) : ($signed((8'hbe)) ?
                                  ((8'hb4) ?
                                      reg73 : reg50) : (wire41 || (8'ha2)))) : (8'hb4)) ?
                      reg77 : ((~|((~&reg75) & (wire47 ?
                          reg78 : (8'hb2)))) + reg76[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      reg86 <= reg83;
      reg87 <= reg54;
      if ((~|($signed($unsigned(reg52[(2'h2):(1'h1)])) <= wire44)))
        begin
          reg88 <= ($unsigned({wire47}) <<< (($signed(((8'hac) ?
                  wire47 : reg52)) ~^ (+$signed(reg75))) ?
              reg71 : (~wire41[(2'h3):(2'h3)])));
          reg89 <= ($unsigned(reg67[(2'h3):(1'h1)]) ?
              reg87 : ((reg59 * $unsigned((wire47 == reg73))) ?
                  wire41[(3'h5):(3'h5)] : $unsigned(reg55[(2'h2):(1'h1)])));
          reg90 <= $signed(reg54);
        end
      else
        begin
          reg88 <= reg52[(1'h1):(1'h1)];
          reg89 <= $signed(((~&$unsigned(reg63[(2'h3):(1'h0)])) ?
              {$unsigned((8'ha5)), reg88[(2'h2):(1'h0)]} : {reg56,
                  wire84[(3'h7):(3'h4)]}));
          reg90 <= {$unsigned($unsigned(($signed(reg86) - {wire47}))),
              (wire85 >> (reg89 ?
                  (reg53[(1'h1):(1'h1)] ~^ (|reg83)) : (~(wire60 ?
                      wire44 : reg87))))};
          reg91 <= (reg55 <= ($signed((reg69[(1'h0):(1'h0)] ?
              (reg89 & (8'hb8)) : $unsigned(reg65))) > $unsigned(((~&reg86) ?
              ((8'ha8) < (8'hbe)) : $unsigned((7'h40))))));
        end
    end
endmodule

module module22
#(parameter param36 = {(((((8'hbc) * (8'hb0)) ^ ((8'hba) ? (8'hae) : (8'hae))) ? (8'h9e) : {((8'ha7) ? (8'hb5) : (8'hae))}) == (({(8'hbd)} < ((8'h9f) ? (8'h9f) : (8'hbc))) >= (^~(-(8'hac)))))}, 
parameter param37 = ({({(param36 != param36)} & ((param36 <= param36) ? ((8'hb3) <= param36) : param36)), param36} > {param36}))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 reg29,
                 (1'h0)};
  assign wire27 = (wire23 ?
                      wire24 : $unsigned($unsigned($signed((wire26 ?
                          wire26 : (8'hac))))));
  assign wire28 = (~^wire25);
  always
    @(posedge clk) begin
      reg29 <= ((^$unsigned($signed(wire27[(4'h9):(3'h6)]))) ?
          {wire26[(4'ha):(3'h7)]} : (wire24[(4'he):(4'hb)] * wire28[(3'h7):(1'h0)]));
    end
  assign wire30 = $signed($signed((&(8'hb7))));
  assign wire31 = reg29[(1'h1):(1'h1)];
  assign wire32 = $signed({wire23});
  assign wire33 = {{(~|($signed(wire24) > (wire28 != wire32)))}};
  assign wire34 = $signed((&{$unsigned($signed(wire27)),
                      wire32[(4'he):(4'h9)]}));
  assign wire35 = (8'hb0);
endmodule
