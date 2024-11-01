module top
#(parameter param125 = ((({{(8'ha5), (8'hae)}, ((8'hbe) ? (8'h9f) : (8'ha0))} > (!{(8'hb5)})) ? ((((8'hbd) ? (8'hae) : (8'hb8)) <<< {(8'hab), (8'ha3)}) ? {((8'hb0) ? (8'ha9) : (8'ha9))} : (8'hae)) : (^(((8'h9f) >>> (8'hb3)) | ((8'ha1) ? (7'h41) : (8'h9e))))) >>> (8'hbb)), 
parameter param126 = (+param125))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire102;
  wire [(2'h2):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire100;
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire102,
                 wire4,
                 wire5,
                 wire6,
                 wire100,
                 reg119,
                 reg118,
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
                 (1'h0)};
  assign wire4 = (wire1 ? wire1[(1'h0):(1'h0)] : wire1[(4'hc):(1'h0)]);
  assign wire5 = wire3;
  assign wire6 = wire1[(4'h8):(2'h3)];
  module7 #() modinst101 (wire100, clk, wire5, wire6, wire1, wire0, wire2);
  assign wire102 = ($signed({{wire5[(5'h13):(5'h10)]}}) ?
                       ($unsigned($unsigned((wire4 ? (8'ha5) : wire1))) ?
                           wire6[(3'h5):(2'h3)] : wire6[(4'h8):(2'h3)]) : wire4);
  always
    @(posedge clk) begin
      if ({(((7'h43) & ($signed((8'hb9)) ^~ (!wire5))) ?
              ($signed((^wire2)) << (~^$unsigned(wire1))) : ((wire2 | wire2[(4'hc):(2'h3)]) ?
                  wire3[(4'hd):(3'h7)] : (&$signed(wire0))))})
        begin
          if ($unsigned((~^wire102)))
            begin
              reg103 <= wire0;
              reg104 <= $signed(($signed({(wire0 | (8'hb9))}) ?
                  (+(((8'hb6) ?
                      wire6 : wire6) + wire1[(4'hb):(3'h7)])) : ((!$signed(wire0)) ^ wire0[(4'h9):(3'h5)])));
              reg105 <= (wire100 <= wire102[(1'h0):(1'h0)]);
              reg106 <= ($signed($signed((~^(&wire1)))) ?
                  $signed($signed(wire4[(1'h0):(1'h0)])) : ($signed(wire2[(1'h1):(1'h1)]) <= (&wire102[(1'h1):(1'h1)])));
              reg107 <= $unsigned((reg106 ?
                  (($unsigned(wire100) ?
                      wire102[(2'h3):(2'h2)] : (wire2 <<< reg103)) <= ((^~wire3) ?
                      wire2 : {reg106})) : (reg104 ?
                      wire0[(3'h4):(1'h0)] : reg106)));
            end
          else
            begin
              reg103 <= wire1[(5'h15):(4'h8)];
              reg104 <= $unsigned(({(^~{wire5, wire5}),
                      $signed(wire100[(4'h8):(1'h1)])} ?
                  $signed((8'ha2)) : (wire5 <= $unsigned(wire100))));
              reg105 <= (7'h44);
            end
          reg108 <= ($signed($unsigned((~&(|wire4)))) != (reg103[(3'h4):(2'h2)] ?
              reg107[(3'h6):(3'h6)] : (($signed(reg106) ^ {(8'hb8), wire0}) ?
                  wire100 : reg103[(1'h0):(1'h0)])));
          if ((8'ha8))
            begin
              reg109 <= (+$unsigned($unsigned(wire3[(2'h3):(1'h1)])));
              reg110 <= wire102;
              reg111 <= wire0[(4'h8):(4'h8)];
              reg112 <= {(-reg105[(3'h7):(3'h6)])};
              reg113 <= ((~&wire4[(1'h0):(1'h0)]) > (wire100 > (!$unsigned($signed(reg108)))));
            end
          else
            begin
              reg109 <= ((~^reg110) ?
                  reg109[(3'h6):(2'h3)] : (wire0 || (~|$unsigned({wire4,
                      reg106}))));
              reg110 <= reg113[(3'h4):(2'h3)];
            end
        end
      else
        begin
          reg103 <= (-(~&(~($signed(wire2) >= (|wire2)))));
          reg104 <= {$signed(reg111[(3'h7):(2'h2)]), (&wire100[(3'h6):(2'h3)])};
          reg105 <= ($signed(((reg104 ? {reg108} : {reg111, wire3}) ?
                  (wire100[(4'h8):(4'h8)] == reg107) : {wire4})) ?
              ({((reg108 ? wire1 : (7'h42)) ?
                          $unsigned(reg106) : $signed(wire5))} ?
                  $unsigned(wire2) : (8'hb4)) : ($signed((-wire0[(4'hc):(2'h3)])) ?
                  (~&$signed((~|reg105))) : (8'hb0)));
          if ((8'hab))
            begin
              reg106 <= $unsigned(wire5[(1'h0):(1'h0)]);
            end
          else
            begin
              reg106 <= (+($signed($signed(reg112[(4'hf):(4'ha)])) ?
                  ({$signed(reg110)} ?
                      reg109[(3'h6):(3'h6)] : wire3[(4'ha):(3'h7)]) : wire5[(3'h6):(3'h6)]));
              reg107 <= (~^$unsigned(wire2[(2'h3):(2'h3)]));
              reg108 <= (!reg104);
              reg109 <= reg111;
              reg110 <= {$signed(reg109)};
            end
          if ((reg103[(4'hb):(3'h5)] ?
              $unsigned(wire0[(4'hd):(4'h9)]) : $signed(reg113[(4'hc):(1'h1)])))
            begin
              reg111 <= {(($signed($unsigned(wire100)) <<< ((reg107 - (8'ha8)) + $signed(wire6))) ?
                      $unsigned((&{reg112, reg105})) : reg110[(1'h1):(1'h1)]),
                  reg105};
            end
          else
            begin
              reg111 <= ((+($signed((+wire5)) <= $signed({reg107,
                  wire5}))) >>> reg103[(1'h1):(1'h1)]);
              reg112 <= wire0[(4'he):(4'hd)];
            end
        end
      reg114 <= ($unsigned((8'hbb)) - ((($unsigned(wire0) || wire5) ^~ {(~|(8'hab)),
              ((8'ha8) ? reg103 : wire5)}) ?
          $unsigned({(reg103 ~^ wire5)}) : $unsigned((8'ha3))));
      reg115 <= (wire102[(3'h4):(1'h1)] ^~ $signed((^$signed((wire6 ?
          reg104 : (8'haa))))));
      reg116 <= ($unsigned(((!$signed(reg112)) && (reg107 ?
          $signed(reg109) : (reg113 - (8'ha0))))) - $unsigned({(&{reg114})}));
      if (wire102[(1'h1):(1'h0)])
        begin
          reg117 <= (reg110 + wire0[(4'h8):(1'h0)]);
          reg118 <= $unsigned({(((reg107 | wire3) & (wire0 ? reg116 : wire4)) ?
                  $unsigned({reg113}) : $unsigned({reg114}))});
        end
      else
        begin
          reg117 <= reg109;
          reg118 <= ((^((^(reg103 << wire3)) <= (~|reg106[(4'he):(3'h7)]))) ?
              $unsigned(reg108[(4'he):(3'h6)]) : $unsigned(((wire2 >>> $signed(reg113)) ?
                  (^~$unsigned((8'hb8))) : {$unsigned(reg104)})));
          reg119 <= ((reg113 ? $signed($signed((reg105 ~^ wire4))) : reg117) ?
              (reg113 ?
                  ($signed((wire5 ? reg115 : reg103)) ~^ ((^~wire100) ?
                      {reg105} : (~^reg116))) : $unsigned((reg117[(4'hb):(3'h7)] ?
                      reg115 : $signed(wire102)))) : (wire0 ?
                  wire102[(1'h0):(1'h0)] : reg105[(4'h8):(3'h5)]));
        end
    end
  assign wire120 = ((-$unsigned($unsigned($signed(wire5)))) + reg112[(4'h8):(3'h6)]);
  assign wire121 = wire2[(2'h3):(2'h2)];
  assign wire122 = (~|(reg107[(3'h4):(1'h1)] ? reg108 : wire4[(1'h1):(1'h1)]));
  assign wire123 = (~^reg119[(1'h1):(1'h0)]);
  assign wire124 = (!$unsigned(((&$signed(reg117)) <<< (8'hab))));
endmodule

module module7
#(parameter param98 = (!(!(-(((8'hbe) ? (8'hb3) : (7'h44)) ^ ((8'hb7) >> (8'hb7)))))), 
parameter param99 = param98)
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire79,
                 wire40,
                 wire38,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire13 = ((~&{wire11[(4'h8):(1'h0)],
                      wire12[(3'h5):(3'h4)]}) || ((7'h41) >= ($unsigned($unsigned((8'hb2))) & ((~^wire10) ?
                      (wire8 <<< wire9) : {wire11}))));
  assign wire14 = $signed($signed((wire13[(3'h5):(2'h3)] ?
                      $signed($unsigned(wire11)) : (^((8'hb4) ?
                          wire9 : wire13)))));
  assign wire15 = $signed($signed(wire11[(3'h5):(2'h3)]));
  assign wire16 = wire11;
  assign wire17 = $signed((({(+wire15), wire9[(4'h8):(2'h2)]} ?
                          wire16 : $signed($unsigned(wire11))) ?
                      ((-(-wire13)) ?
                          $signed((wire16 && wire10)) : ({wire9} < (wire12 >>> wire10))) : wire16[(1'h0):(1'h0)]));
  module18 #() modinst39 (.y(wire38), .wire20(wire17), .wire21(wire8), .wire19(wire9), .wire22(wire10), .clk(clk));
  assign wire40 = $unsigned($signed($signed($signed({wire11}))));
  module41 #() modinst80 (wire79, clk, wire8, wire16, wire13, wire38);
  always
    @(posedge clk) begin
      if ($unsigned((wire38[(3'h6):(3'h5)] ?
          $unsigned(wire40[(2'h2):(1'h0)]) : ($signed((wire14 == wire10)) ?
              $signed(wire16[(3'h6):(3'h5)]) : $signed(((8'hb5) ?
                  wire13 : wire38))))))
        begin
          if ((((~^((wire8 ? wire16 : wire9) ^ $signed(wire40))) ?
              $signed(({wire8} ^ wire15)) : $signed(((wire40 == wire17) ?
                  {wire79, wire10} : wire10[(4'h9):(4'h8)]))) <= wire17))
            begin
              reg81 <= $unsigned((-wire14[(5'h12):(4'he)]));
              reg82 <= ((~^(+wire79[(4'he):(4'h9)])) ?
                  $unsigned(wire8[(2'h2):(1'h0)]) : (&(($unsigned(wire40) ?
                          (wire12 && wire12) : wire10) ?
                      {wire10[(4'hb):(3'h4)], wire12} : $signed((wire16 ?
                          wire17 : wire40)))));
            end
          else
            begin
              reg81 <= (wire14[(5'h12):(3'h6)] ?
                  wire79 : ($signed((!wire40[(4'hd):(2'h3)])) * ($unsigned(wire17) + $signed((8'ha6)))));
              reg82 <= (^(~&(((~|wire38) ?
                  $unsigned((8'ha2)) : wire17) && ({wire16,
                  (8'ha6)} | $signed(wire10)))));
              reg83 <= wire17;
              reg84 <= $unsigned(($unsigned((^~$signed((8'hb0)))) || ($signed(wire15[(3'h4):(2'h3)]) ?
                  wire17 : wire79)));
            end
          reg85 <= $unsigned((((~((8'hb0) ? wire13 : reg82)) ?
              $unsigned(((8'hb4) ?
                  reg83 : reg83)) : ($unsigned(wire38) ^ $unsigned(wire8))) >= $unsigned($signed((wire14 ?
              reg83 : wire79)))));
          reg86 <= (&wire79);
          if ({(7'h40),
              ({wire17,
                  $unsigned(wire17[(3'h5):(2'h3)])} != (wire16[(4'hf):(4'hc)] ?
                  wire13[(2'h2):(2'h2)] : $unsigned((wire10 ?
                      wire16 : wire16))))})
            begin
              reg87 <= ((&($signed((&wire12)) < $unsigned(wire38[(4'ha):(4'ha)]))) ?
                  wire15[(4'hc):(3'h5)] : ((!(~wire40[(4'hd):(1'h1)])) >>> (-reg83)));
              reg88 <= (~^(8'ha8));
              reg89 <= (-(&$signed((wire10[(3'h7):(3'h4)] != ((8'hac) || reg83)))));
              reg90 <= {wire8};
              reg91 <= reg87;
            end
          else
            begin
              reg87 <= wire40[(1'h0):(1'h0)];
              reg88 <= reg84[(4'hb):(4'h8)];
              reg89 <= wire12;
            end
        end
      else
        begin
          reg81 <= wire79[(4'ha):(4'ha)];
        end
      reg92 <= $signed(reg87[(4'h9):(4'h8)]);
      reg93 <= reg88[(4'h9):(4'h8)];
      reg94 <= (wire79 + {$unsigned((~(reg85 + (8'hbc)))),
          (reg83 < $signed((reg85 ~^ wire16)))});
      reg95 <= ((8'hac) ?
          $unsigned(wire17) : (wire10 ~^ {((|reg93) | $signed(reg92)),
              $signed((+wire13))}));
    end
  assign wire96 = (~|$signed({(^~(reg84 ? reg84 : wire38)),
                      ((reg83 ? wire17 : reg88) ?
                          (wire8 ? wire10 : wire15) : (wire12 ?
                              reg94 : wire14))}));
  assign wire97 = (reg94[(2'h2):(1'h0)] > $unsigned(wire9[(1'h0):(1'h0)]));
endmodule

module module41
#(parameter param77 = (((((|(8'h9f)) ? ((8'ha6) ? (8'hba) : (8'hbf)) : ((7'h42) ? (8'hb2) : (8'hb6))) ? (((8'hab) ? (8'ha3) : (8'hb1)) ? ((8'ha8) ? (7'h43) : (8'h9e)) : ((8'hbf) ? (8'hb3) : (7'h43))) : (((7'h42) != (8'hbf)) ? ((7'h44) ^~ (8'hb2)) : ((8'hae) | (8'hb9)))) * {(!(^(8'hb9))), (!((8'hbf) ? (8'ha3) : (8'ha8)))}) < (^~((~^((8'hbb) ? (8'ha1) : (8'hb1))) ^~ (((8'h9c) ? (8'ha8) : (8'ha1)) ^~ ((8'hb7) ? (8'hab) : (8'h9c)))))), 
parameter param78 = param77)
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire45;
  input wire [(5'h10):(1'h0)] wire44;
  input wire signed [(2'h3):(1'h0)] wire43;
  input wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire57,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
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
                 reg56,
                 reg55,
                 reg54,
                 reg46,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg46 <= $unsigned((((wire42[(1'h0):(1'h0)] ~^ wire44[(3'h4):(2'h3)]) ~^ $signed(wire45[(1'h1):(1'h0)])) ?
          (wire45 >>> ((wire45 - (8'hb1)) && (^(8'hbc)))) : (wire44[(3'h7):(3'h7)] && (-$signed(wire45)))));
    end
  assign wire47 = (8'hbf);
  assign wire48 = wire45[(1'h1):(1'h0)];
  assign wire49 = {((((!wire45) ?
                                  $unsigned(wire42) : (reg46 ?
                                      wire47 : wire47)) ?
                              reg46[(1'h0):(1'h0)] : reg46[(2'h2):(1'h1)]) ?
                          $unsigned($unsigned(((8'hb3) ?
                              wire42 : wire47))) : ($signed((wire43 ?
                                  reg46 : wire45)) ?
                              $unsigned($unsigned((8'hab))) : wire45))};
  assign wire50 = $signed(wire48[(3'h5):(2'h2)]);
  assign wire51 = (&(wire47[(1'h0):(1'h0)] ^~ (((+wire50) ?
                          wire49 : ((8'had) ? wire42 : wire45)) ?
                      (reg46[(2'h2):(1'h0)] >>> $signed(wire42)) : $signed(wire45[(1'h1):(1'h0)]))));
  assign wire52 = $unsigned($unsigned((-wire45)));
  assign wire53 = $unsigned(wire51[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg54 <= wire49;
      reg55 <= ((^~(&$signed({wire50}))) ? reg54 : (~wire47));
      reg56 <= wire47;
    end
  assign wire57 = (wire50 >= (wire49 && $unsigned({$unsigned(wire52),
                      $signed((7'h44))})));
  always
    @(posedge clk) begin
      reg58 <= $unsigned((&$signed($unsigned((wire53 ? wire43 : wire51)))));
      reg59 <= wire50[(3'h5):(2'h2)];
      if ($unsigned(((({wire48, wire42} ?
                  wire57[(3'h5):(1'h1)] : $unsigned(wire52)) ?
              (^wire43[(1'h0):(1'h0)]) : $signed((wire52 == reg58))) ?
          reg56 : ((8'hb6) ?
              ((~^wire47) | (wire49 + wire45)) : (^$signed(wire49))))))
        begin
          reg60 <= (wire42 <= $unsigned($unsigned(($signed(wire50) ?
              (wire50 ? (8'hb7) : (8'hb0)) : {reg56, wire45}))));
          reg61 <= reg54;
          if ((|{wire50[(4'hd):(4'hd)], $unsigned(wire49[(3'h6):(1'h0)])}))
            begin
              reg62 <= (|($unsigned(wire42) ?
                  ({(&reg54)} > wire49[(3'h5):(2'h3)]) : wire47[(4'ha):(2'h2)]));
              reg63 <= (8'haf);
              reg64 <= $signed($unsigned(reg54[(3'h5):(2'h3)]));
            end
          else
            begin
              reg62 <= ($unsigned({reg54, (~^(8'hbf))}) ?
                  wire45 : (reg61[(4'h9):(4'h8)] && ((wire44[(4'h8):(3'h5)] < (reg59 ?
                      (8'hbe) : wire52)) ^ $signed((^~reg59)))));
            end
          if (((!(|(&reg61))) ?
              (~$signed((reg62[(1'h1):(1'h1)] ^ ((8'ha5) ?
                  reg61 : (8'hb5))))) : reg55))
            begin
              reg65 <= $unsigned($signed($unsigned(($signed(wire47) ?
                  $unsigned(wire51) : $signed(reg59)))));
            end
          else
            begin
              reg65 <= reg54[(1'h1):(1'h1)];
            end
          reg66 <= $signed((~($signed($unsigned(reg58)) ?
              $unsigned($signed(reg60)) : ($signed(wire51) - (&reg60)))));
        end
      else
        begin
          reg60 <= wire52[(3'h6):(2'h3)];
          reg61 <= reg55[(3'h4):(2'h2)];
          reg62 <= wire50[(4'ha):(3'h7)];
          if ({(((~|(reg61 ? wire50 : (8'hab))) ?
                  $signed($signed(reg54)) : (+wire51[(1'h1):(1'h0)])) < wire50[(5'h10):(2'h3)]),
              (8'had)})
            begin
              reg63 <= $unsigned((&wire57));
              reg64 <= (($signed(({wire43, wire48} ?
                  wire44 : (~^reg61))) <<< (wire49[(1'h1):(1'h0)] ?
                  $signed(wire43) : reg64)) ^ (($unsigned((~^wire45)) + (~|(-(8'h9c)))) ?
                  $signed((reg61 ~^ wire49[(3'h4):(2'h2)])) : wire49));
              reg65 <= wire50;
              reg66 <= reg54[(1'h0):(1'h0)];
            end
          else
            begin
              reg63 <= reg46[(2'h2):(2'h2)];
              reg64 <= reg64[(2'h3):(2'h3)];
              reg65 <= (|wire45[(2'h2):(1'h1)]);
              reg66 <= (reg55 ?
                  {$signed(reg65),
                      $unsigned($signed((reg65 ?
                          reg61 : wire42)))} : $unsigned(wire57));
            end
          reg67 <= $unsigned($signed(($signed((~|wire50)) & (reg58 << (~|wire51)))));
        end
      reg68 <= $unsigned((-(~^(|(wire43 == reg54)))));
      reg69 <= wire42;
    end
  assign wire70 = ((!reg68[(1'h0):(1'h0)]) & $signed((|((reg54 + reg66) ?
                      $signed((8'ha0)) : $signed(reg67)))));
  assign wire71 = $signed({wire70[(1'h0):(1'h0)]});
  assign wire72 = ((^reg69[(1'h1):(1'h1)]) >= $signed($signed(reg65[(4'hc):(4'h8)])));
  assign wire73 = reg63[(1'h1):(1'h1)];
  assign wire74 = $unsigned($unsigned((wire52[(3'h5):(2'h3)] && {$signed(reg62),
                      (~&reg66)})));
  assign wire75 = $signed(((~|reg64[(3'h7):(3'h4)]) ^ (reg68[(3'h7):(1'h1)] ?
                      ($unsigned(reg55) ?
                          (~wire47) : (~|(8'hb2))) : (-(^wire74)))));
  assign wire76 = reg60;
endmodule

module module18
#(parameter param37 = (({(~((8'hb6) ? (7'h44) : (7'h43)))} <= (~&(~&((7'h43) ? (8'ha4) : (8'hb1))))) || (8'hbb)))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire23;
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire23,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = ($signed($unsigned((!wire20[(1'h1):(1'h0)]))) > (8'ha8));
  always
    @(posedge clk) begin
      reg24 <= wire20;
      reg25 <= $signed(reg24[(2'h2):(1'h0)]);
    end
  assign wire26 = wire21[(4'hc):(3'h4)];
  assign wire27 = ((((wire22 ? $signed(wire26) : (~&wire26)) ?
                          $signed($unsigned(wire20)) : (|$unsigned(wire22))) <= wire23[(1'h1):(1'h0)]) ?
                      $unsigned($signed((~&(wire19 >>> (8'h9c))))) : (^(8'hb4)));
  assign wire28 = (wire26[(2'h3):(2'h3)] || $signed(wire19[(3'h7):(2'h3)]));
  assign wire29 = $signed(((|{(reg25 ? wire27 : (8'ha7)),
                          wire21[(1'h1):(1'h1)]}) ?
                      wire27[(2'h3):(1'h1)] : $signed(wire22)));
  assign wire30 = wire28[(3'h4):(3'h4)];
  assign wire31 = $signed($unsigned((+(wire29 << ((8'hb3) ~^ wire21)))));
  assign wire32 = (8'h9d);
  assign wire33 = {$signed(($signed((wire31 ? reg24 : wire21)) ?
                          (^~(wire22 ? wire19 : (8'hb0))) : wire19))};
  assign wire34 = wire29[(2'h2):(2'h2)];
  assign wire35 = (wire28[(1'h0):(1'h0)] ~^ wire26[(3'h7):(2'h2)]);
  assign wire36 = ((wire21 ^ ((|{(8'hbf)}) ?
                      $unsigned($signed(wire31)) : (&$unsigned(wire28)))) || (8'ha0));
endmodule
