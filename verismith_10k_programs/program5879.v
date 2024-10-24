module top #(parameter param144 = (8'hb8)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire141;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire4;
  assign y = {wire143, wire142, wire141, wire139, wire4, (1'h0)};
  assign wire4 = $unsigned(wire3);
  module5 #() modinst140 (.wire7(wire3), .wire9(wire1), .wire8(wire2), .wire6(wire4), .y(wire139), .clk(clk));
  assign wire141 = $unsigned(((($unsigned(wire3) >> (wire139 ?
                               wire3 : wire139)) ?
                           ((~|wire4) ?
                               wire4[(1'h1):(1'h0)] : (wire4 <<< wire0)) : {wire1}) ?
                       wire3[(3'h6):(1'h1)] : ($signed(wire139) ^ $signed($unsigned(wire3)))));
  assign wire142 = ({{wire139}, {$unsigned(wire3), {wire2}}} ?
                       ((wire1 <<< ((8'hb3) ?
                           wire139[(3'h4):(2'h3)] : (^~wire2))) >> $signed(wire2)) : ((~($signed(wire0) ^~ ((8'hb5) || wire1))) < wire1[(4'hd):(3'h4)]));
  assign wire143 = $signed((&(((&(8'hb9)) ?
                           $signed(wire0) : $unsigned(wire139)) ?
                       $signed(wire2) : (wire4 <<< (^~wire1)))));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire137;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(4'ha):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire67;
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 wire10,
                 wire11,
                 wire12,
                 wire40,
                 wire67,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  assign wire10 = $unsigned(($signed(wire8[(1'h1):(1'h1)]) - $unsigned(wire8)));
  assign wire11 = wire6;
  assign wire12 = {(wire8[(1'h0):(1'h0)] ?
                          (+(wire7 < $unsigned(wire7))) : $unsigned((~^wire10[(3'h6):(1'h0)])))};
  module13 #() modinst41 (wire40, clk, wire9, wire10, wire11, wire8);
  module42 #() modinst68 (.clk(clk), .y(wire67), .wire46(wire8), .wire44(wire40), .wire47(wire12), .wire43(wire11), .wire45(wire7));
  always
    @(posedge clk) begin
      reg69 <= (-(8'had));
      reg70 <= wire8[(2'h3):(1'h0)];
      if (((reg69[(4'ha):(4'ha)] ?
          $signed($unsigned($unsigned(wire11))) : (((^~wire9) ~^ (wire67 ?
                  reg70 : wire40)) ?
              (|{wire67, wire7}) : (reg70 && wire12))) < $signed(wire7)))
        begin
          reg71 <= $unsigned(((wire40 << $unsigned($signed(wire6))) ?
              ($unsigned((wire11 ?
                  wire11 : wire67)) < (-$unsigned((8'hba)))) : (~^(|$unsigned(reg70)))));
          if (({(($signed((8'ha4)) ? wire6[(4'hd):(3'h5)] : {wire6, (8'ha5)}) ?
                      ((wire7 >> wire8) ?
                          wire8[(1'h0):(1'h0)] : (reg70 ?
                              (8'ha4) : wire8)) : (7'h42)),
                  (((+wire7) ? (|wire40) : $unsigned(reg71)) ?
                      wire8[(3'h5):(1'h0)] : $unsigned((reg69 ?
                          wire67 : wire11)))} ?
              ((8'hae) ?
                  $unsigned(wire12) : $signed(wire10[(3'h7):(3'h5)])) : wire9))
            begin
              reg72 <= wire6[(1'h0):(1'h0)];
              reg73 <= reg69[(4'h9):(1'h1)];
              reg74 <= $signed(wire8[(1'h1):(1'h1)]);
              reg75 <= ((7'h43) ?
                  (8'ha9) : ({(!(^~wire67)),
                      (+wire8)} <<< $signed((~^$signed(reg71)))));
              reg76 <= {(~&$signed(wire8[(1'h1):(1'h1)])), wire9};
            end
          else
            begin
              reg72 <= $unsigned($signed(($signed((wire40 ? reg71 : wire12)) ?
                  ($unsigned(wire67) ?
                      (reg74 >= reg76) : wire40) : wire67[(4'hb):(3'h7)])));
              reg73 <= $unsigned(((~|((reg76 ? (8'ha3) : wire11) ?
                      (~&reg73) : (wire6 & wire8))) ?
                  wire11[(4'ha):(2'h2)] : $unsigned(wire40[(3'h5):(1'h0)])));
            end
          reg77 <= (~|$signed($signed($unsigned((~&(8'hae))))));
        end
      else
        begin
          reg71 <= (&((($signed(wire6) ? (reg71 ? reg76 : wire6) : reg71) ?
                  reg71[(1'h1):(1'h1)] : $signed((wire67 ? wire11 : reg71))) ?
              (reg71[(2'h2):(1'h1)] ?
                  reg77 : ((~|wire9) + $signed(reg73))) : ($signed((wire6 ?
                  wire9 : wire11)) < $unsigned($unsigned(reg75)))));
          reg72 <= ($unsigned(wire8) ?
              reg72[(1'h0):(1'h0)] : $signed($signed(wire10[(4'hd):(1'h0)])));
          if ((($signed(wire12[(4'hf):(1'h0)]) >>> (!(wire10 >>> ((8'hb1) ?
              reg71 : wire8)))) || (($unsigned($unsigned(wire11)) ?
              wire8 : $unsigned((~|reg69))) + ($signed((wire67 ?
              (8'haa) : wire12)) >>> $signed(wire8)))))
            begin
              reg73 <= {{{wire6,
                          {(wire67 ? wire11 : (8'hb9)),
                              (wire6 ? reg74 : (8'h9e))}},
                      $signed(((reg76 << reg71) ? wire9 : (~reg69)))}};
              reg74 <= {wire9[(2'h3):(1'h1)],
                  $signed(((&(wire40 | reg76)) ?
                      {(8'hb3),
                          (wire6 ?
                              wire7 : reg75)} : $unsigned($signed(reg69))))};
              reg75 <= ((wire67 * reg69[(4'h9):(4'h9)]) ~^ {reg74,
                  (&(~wire6[(2'h3):(2'h2)]))});
            end
          else
            begin
              reg73 <= wire8;
              reg74 <= ((|(~$signed((reg75 && wire10)))) & (&$signed(wire40[(1'h1):(1'h0)])));
            end
          if (wire8[(3'h5):(1'h0)])
            begin
              reg76 <= (|$signed((8'hbe)));
              reg77 <= {$unsigned($signed(reg73[(1'h1):(1'h1)]))};
            end
          else
            begin
              reg76 <= reg74;
            end
          reg78 <= (!$signed((reg69 ? wire6 : $signed((wire11 ~^ reg77)))));
        end
    end
  module79 #() modinst124 (.wire81(reg78), .wire84(wire7), .clk(clk), .wire80(reg77), .wire82(reg76), .y(wire123), .wire83(wire67));
  assign wire125 = reg78;
  assign wire126 = reg69;
  assign wire127 = (|reg74);
  assign wire128 = wire9[(4'hc):(2'h3)];
  always
    @(posedge clk) begin
      reg129 <= wire12;
      reg130 <= reg74[(2'h2):(1'h0)];
      reg131 <= ((+reg74[(1'h1):(1'h0)]) | ((8'haf) == ((wire126[(3'h4):(1'h1)] ?
              (-reg129) : $signed(reg70)) ?
          wire67[(5'h12):(4'h8)] : (^{wire6, (8'ha5)}))));
      reg132 <= ($unsigned({$unsigned(wire7)}) <<< $signed(reg74[(1'h1):(1'h1)]));
      reg133 <= {($signed($signed((-(8'h9e)))) ?
              (~&((~^reg76) ?
                  $signed(reg129) : ((8'ha5) >= wire12))) : $unsigned(((~^(8'h9f)) ?
                  (8'ha4) : ((8'hbd) >> reg69)))),
          (+($unsigned({reg132}) != ($signed(wire127) ?
              $unsigned((8'hba)) : {(8'h9d), wire6})))};
    end
  assign wire134 = wire6[(3'h5):(2'h3)];
  assign wire135 = {{wire7}};
  assign wire136 = ((~&reg73) ?
                       ((|$signed($unsigned(wire10))) == reg71) : reg71[(1'h1):(1'h1)]);
  assign wire137 = wire136[(3'h4):(2'h2)];
  assign wire138 = ((|wire40) ~^ wire135[(4'he):(3'h5)]);
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire84;
  input wire [(3'h4):(1'h0)] wire83;
  input wire signed [(4'hd):(1'h0)] wire82;
  input wire signed [(4'hc):(1'h0)] wire81;
  input wire signed [(4'hc):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire [(3'h5):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire85;
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire110,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg86,
                 (1'h0)};
  assign wire85 = wire82;
  always
    @(posedge clk) begin
      reg86 <= $signed($signed($signed(wire83)));
    end
  assign wire87 = $signed((~|$signed((((8'hbf) ? reg86 : wire83) ?
                      (wire82 ? wire82 : wire82) : reg86))));
  assign wire88 = (($unsigned((reg86 ?
                          wire82[(4'hb):(4'hb)] : wire85)) > $unsigned(wire87)) ?
                      {$unsigned((~&(~|wire83)))} : (wire84[(2'h2):(1'h1)] ?
                          wire82 : {$signed(wire83), (^~$unsigned(reg86))}));
  assign wire89 = ((!wire81[(3'h7):(2'h2)]) ^~ ({{$unsigned(wire85),
                          ((8'hbe) ? wire83 : wire85)}} >>> (8'hba)));
  assign wire90 = (~|$unsigned($signed((!wire84))));
  always
    @(posedge clk) begin
      if ($signed({(+((-(8'ha9)) ? (wire83 & (8'hbd)) : {(8'hb8)}))}))
        begin
          reg91 <= wire83;
          reg92 <= (-wire89);
          reg93 <= $signed(wire85);
        end
      else
        begin
          reg91 <= ($unsigned(wire83[(2'h3):(1'h0)]) ?
              reg91[(4'hf):(1'h0)] : (~(wire90[(4'h8):(3'h5)] ~^ $signed((reg93 ?
                  wire85 : wire83)))));
          if ($signed($unsigned(wire82)))
            begin
              reg92 <= $signed(wire90[(3'h5):(1'h1)]);
            end
          else
            begin
              reg92 <= (wire80[(2'h3):(2'h2)] ?
                  $signed((~($signed(wire87) ?
                      (~&reg91) : (~&wire87)))) : (wire82 > $unsigned(reg91)));
              reg93 <= {(8'haa),
                  ((((wire81 >= wire89) >> (reg91 ? reg86 : reg91)) ?
                      $unsigned((wire82 - reg92)) : ((wire87 || wire89) ?
                          (wire89 - wire84) : (wire87 ?
                              reg86 : wire89))) * wire83)};
              reg94 <= $signed({$unsigned({(&wire88), $unsigned(wire80)})});
              reg95 <= ((^wire88) ? reg92 : reg93);
            end
          if (wire83[(2'h2):(1'h1)])
            begin
              reg96 <= $unsigned((reg93 > {$signed($unsigned(wire82)),
                  $unsigned(((8'ha3) ? reg94 : reg86))}));
              reg97 <= wire85;
              reg98 <= ($unsigned(reg92) ? (8'ha4) : reg97[(3'h5):(1'h1)]);
              reg99 <= $unsigned((^((((8'ha4) - reg91) ?
                  $unsigned(wire87) : (~^wire82)) & wire81[(1'h1):(1'h1)])));
            end
          else
            begin
              reg96 <= $signed((wire82[(4'h9):(4'h9)] - (((|reg95) ?
                  {reg98} : {reg93, (8'hb1)}) <<< (8'h9f))));
            end
          reg100 <= {(((~&reg99) >> reg93) <<< ((wire82[(2'h3):(2'h3)] ?
                  wire89 : $signed(wire89)) ^ ($signed(reg97) ?
                  reg96 : reg86)))};
        end
      if ($unsigned({reg96, reg97}))
        begin
          reg101 <= $signed(($unsigned((^(&reg92))) ?
              wire82 : ((^$unsigned(reg95)) < reg91)));
          if ((reg86[(3'h5):(1'h1)] ^ $unsigned(reg86)))
            begin
              reg102 <= $signed($unsigned(reg97));
              reg103 <= $signed(($signed({reg96,
                  (wire90 ? wire90 : reg98)}) && wire88[(4'hc):(3'h4)]));
              reg104 <= reg91[(4'ha):(1'h0)];
              reg105 <= $unsigned((wire90 ?
                  (wire88 <= ((reg93 ? wire89 : reg92) ^ (reg95 ?
                      wire83 : reg99))) : $signed(wire89)));
              reg106 <= (8'hbf);
            end
          else
            begin
              reg102 <= ($unsigned($signed((-(8'hbe)))) ?
                  ((reg106[(4'ha):(3'h4)] ?
                      (reg106[(4'h9):(3'h5)] ?
                          {reg95} : $signed(wire84)) : $unsigned(((8'haf) ?
                          reg105 : reg86))) | (reg105[(4'h8):(3'h7)] != (((8'haa) ?
                          reg93 : (8'ha7)) ?
                      (wire85 | reg98) : reg106[(3'h4):(3'h4)]))) : $unsigned({reg97[(2'h3):(1'h1)]}));
            end
        end
      else
        begin
          reg101 <= reg95[(2'h2):(1'h0)];
          reg102 <= ($signed({($signed(wire84) && (wire83 ?
                  wire81 : (8'h9d)))}) || (reg101[(1'h1):(1'h0)] <= wire88[(4'h9):(3'h6)]));
        end
      reg107 <= {($unsigned((~|{wire88})) ? $unsigned((^(~&reg93))) : reg101),
          ((wire87 <= $signed($unsigned((8'hab)))) ?
              {(&(&wire90)), (~^(reg101 * reg102))} : (~((reg91 ?
                      reg100 : reg96) ?
                  reg93[(4'h8):(3'h6)] : {reg98, wire83})))};
      reg108 <= {reg93, {$unsigned($signed((-reg93)))}};
      reg109 <= reg102;
    end
  assign wire110 = reg91[(4'he):(1'h0)];
  always
    @(posedge clk) begin
      reg111 <= wire87[(3'h7):(3'h7)];
      reg112 <= (~reg92[(3'h7):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($signed(($unsigned($signed(reg92)) ~^ ($signed((reg91 ?
          reg86 : wire88)) == wire89[(3'h6):(2'h3)]))))
        begin
          reg113 <= ((&{((reg94 - reg109) ^ (8'ha4)),
              reg104}) * (|{(reg104[(4'hb):(3'h5)] ?
                  wire80 : (wire83 ? reg106 : reg91))}));
          reg114 <= $unsigned($unsigned(($signed(reg96[(3'h4):(2'h3)]) ?
              $signed((reg98 && wire89)) : ($unsigned((8'hb1)) ?
                  reg109 : $signed((8'hb8))))));
          reg115 <= (+$signed($signed((^{reg86, reg100}))));
          reg116 <= $signed(reg98);
        end
      else
        begin
          reg113 <= $unsigned($unsigned(reg114[(1'h0):(1'h0)]));
          reg114 <= $unsigned(((wire87 ?
              reg112 : (+$unsigned(wire81))) ~^ (($unsigned(reg98) ?
              $unsigned(reg95) : reg91) ^ (~reg100[(1'h0):(1'h0)]))));
          reg115 <= (($signed((~^(~&reg95))) && ({$signed((8'ha2))} ?
                  reg101 : wire85)) ?
              {$unsigned($unsigned(((7'h43) ? reg91 : reg104))),
                  $signed($signed($unsigned(wire87)))} : $unsigned($signed(reg92[(2'h2):(1'h1)])));
        end
      if ((~wire87[(4'h8):(3'h4)]))
        begin
          reg117 <= $signed($signed(((~&(reg105 + (8'hab))) >>> ((~^reg112) != $unsigned(reg98)))));
        end
      else
        begin
          reg117 <= $unsigned(($signed(((~|reg107) <<< reg91)) ^ (reg113 != $unsigned({reg99}))));
          reg118 <= wire110;
        end
    end
  assign wire119 = (reg98[(4'hd):(2'h3)] ?
                       (($unsigned($unsigned(reg107)) ?
                               $signed($signed(reg92)) : reg94[(3'h7):(3'h6)]) ?
                           ($signed($signed((8'ha0))) ?
                               reg104 : $unsigned($signed(reg102))) : reg95) : (reg111[(2'h2):(1'h1)] ?
                           (~|reg92[(3'h5):(2'h3)]) : ($unsigned((reg97 > (8'haa))) ?
                               $signed(((8'ha9) ?
                                   reg106 : reg118)) : (8'hb2))));
  assign wire120 = wire87[(1'h1):(1'h1)];
  assign wire121 = {(~{reg118, (7'h44)}), $signed(reg94)};
  assign wire122 = (reg116 << reg102);
endmodule

module module42
#(parameter param65 = (~^((~^({(8'haa)} ? (~^(8'hb5)) : ((8'hb1) * (8'haf)))) ? ({(+(8'had)), ((8'ha5) & (8'h9f))} ? (((8'ha1) ? (8'h9d) : (8'haa)) ? ((7'h40) - (8'hab)) : {(8'hbc)}) : (((8'hab) ? (8'hb0) : (8'hb9)) - ((7'h42) > (7'h41)))) : (((8'ha4) ? ((7'h40) == (8'hae)) : ((8'hbf) ? (8'hbf) : (8'hbb))) ? ({(8'h9e)} ? (^(7'h44)) : {(8'hbd)}) : (((8'hb7) + (7'h42)) < (-(8'hb3)))))), 
parameter param66 = ((-param65) ? param65 : ((((param65 + param65) ? param65 : (param65 <<< param65)) ? ((param65 < (8'hbf)) && {param65}) : ((8'ha4) != param65)) ? (({param65, (8'hba)} ? ((8'hbc) ? param65 : param65) : (param65 - param65)) ~^ ((param65 ? param65 : param65) >> (~&(7'h40)))) : ((8'hbd) ? ({(8'hb7)} ? (param65 ? param65 : param65) : (param65 | param65)) : {param65}))))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(3'h5):(1'h0)] wire44;
  input wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire59,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg62,
                 reg61,
                 reg60,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire48 = {$signed($signed(($unsigned(wire43) ^ (~^wire44)))),
                      (^~{((wire46 ? wire44 : wire43) != ((8'ha1) - wire44))})};
  assign wire49 = wire44[(3'h5):(1'h0)];
  assign wire50 = $unsigned(wire43[(4'hc):(3'h6)]);
  assign wire51 = wire45[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg52 <= wire43[(3'h6):(2'h2)];
      if (wire49[(4'hd):(2'h2)])
        begin
          reg53 <= wire47[(4'ha):(1'h1)];
          reg54 <= (((8'haa) >= (-reg52)) == (wire50 - $unsigned($unsigned(wire51[(4'h9):(1'h1)]))));
          reg55 <= ((reg54 ^~ reg54) && (((&{wire47}) ?
              $signed((reg54 ?
                  wire47 : reg54)) : $signed((wire48 | wire44))) < (wire46 ?
              (8'h9c) : reg52[(2'h2):(1'h1)])));
          reg56 <= $signed($unsigned(((~^(+reg52)) >> $unsigned((reg55 & wire51)))));
          reg57 <= ((^~{(^~{wire50})}) * (reg52 & (8'ha6)));
        end
      else
        begin
          reg53 <= (8'hb2);
          reg54 <= wire43[(3'h5):(3'h5)];
        end
      reg58 <= (($unsigned($signed($signed(reg55))) ?
          reg52 : reg56) * wire45[(3'h5):(2'h3)]);
    end
  assign wire59 = $unsigned((~&$signed(reg53[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg60 <= {{reg55[(1'h1):(1'h0)],
              $unsigned((reg53 ? $unsigned((8'hbd)) : $unsigned(wire51)))}};
      reg61 <= (&(wire46 ?
          ($signed((!wire43)) ^~ ((~^wire49) ?
              wire43[(4'hd):(4'hd)] : (wire59 != wire48))) : wire47[(2'h2):(1'h0)]));
      reg62 <= wire48[(2'h2):(2'h2)];
    end
  assign wire63 = {$signed(wire43)};
  assign wire64 = $signed($signed(((+reg58) ?
                      ((8'ha4) ?
                          wire44[(2'h3):(1'h0)] : (reg52 && wire63)) : (^(wire44 ?
                          wire44 : wire44)))));
endmodule

module module13
#(parameter param38 = (+(|(^~((|(8'ha6)) || (~&(8'had)))))), 
parameter param39 = ((-(8'hb6)) & (~&(8'hb5))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire18 = $unsigned($signed(((~(wire15 ? wire14 : wire16)) ?
                      wire16 : (~&(&(7'h41))))));
  assign wire19 = $signed(wire16[(3'h4):(1'h0)]);
  assign wire20 = (wire14 + wire16);
  assign wire21 = ((^~($signed((wire14 < wire14)) <= $signed(((8'h9d) | wire19)))) ^~ {$signed(wire19)});
  assign wire22 = (wire14 | ($unsigned(wire19[(3'h7):(3'h4)]) ?
                      $unsigned(wire16[(3'h4):(2'h2)]) : wire18[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg23 <= (+wire18[(1'h1):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg24 <= wire22[(4'hb):(3'h7)];
      reg25 <= (((&wire18[(3'h7):(3'h5)]) & {wire21,
          ({wire17,
              wire19} << wire17)}) == (wire22 <<< (^wire20[(3'h6):(2'h2)])));
      reg26 <= wire22;
    end
  assign wire27 = (wire18 ~^ (~|(~wire18)));
  always
    @(posedge clk) begin
      reg28 <= {wire16};
    end
  assign wire29 = wire17;
  assign wire30 = ($signed((reg23[(3'h7):(2'h2)] >> (~(~^reg26)))) * {$unsigned(($unsigned(wire14) & (^(8'hb4))))});
  assign wire31 = {wire19, wire21};
  assign wire32 = {$unsigned(($signed((wire18 ? (8'ha0) : reg24)) ?
                          $unsigned({wire30}) : $unsigned(((8'hbd) ?
                              (7'h42) : wire17))))};
  assign wire33 = wire19;
  assign wire34 = (8'h9f);
  assign wire35 = ($signed($unsigned(reg28)) != $unsigned((wire30[(3'h7):(2'h3)] << $unsigned((reg24 ?
                      reg28 : wire14)))));
  assign wire36 = (($signed(wire35) ^~ (8'haa)) ?
                      (^((~|(wire29 ?
                          reg23 : (8'ha7))) < wire29[(3'h7):(2'h3)])) : $signed(({(wire20 ?
                                  wire30 : wire18),
                              (wire17 ? wire17 : wire20)} ?
                          $signed(reg26) : $unsigned($unsigned(reg28)))));
  assign wire37 = (&wire20);
endmodule
