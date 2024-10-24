module top
#(parameter param147 = (^(~&(~^((!(8'ha6)) | ((8'haf) ^ (8'hb3)))))), 
parameter param148 = (param147 ? ((&((param147 ? (8'hb2) : (8'hae)) ? (param147 && param147) : (param147 & param147))) <= ((~(param147 ^ (8'hb1))) ? ((param147 ~^ param147) ? (param147 ? param147 : param147) : {param147}) : param147)) : (!((&(param147 ? param147 : (8'hb1))) == param147))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire141;
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire141,
                 reg146,
                 reg145,
                 reg4,
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      reg5 <= (8'hb0);
      reg6 <= wire0;
    end
  module7 #() modinst142 (.wire9(reg4), .wire11(reg5), .clk(clk), .wire10(wire0), .y(wire141), .wire8(reg6));
  assign wire143 = reg6;
  assign wire144 = {wire141[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      reg145 <= (reg5[(4'hc):(1'h0)] ?
          wire144 : ({reg6, wire3} >= {wire3, $signed(reg5[(2'h3):(2'h3)])}));
      reg146 <= (wire2 ?
          $signed(((-{wire2}) ?
              $unsigned($unsigned((8'hb8))) : {(~&wire1),
                  (reg4 != (8'h9e))})) : (&wire141));
    end
endmodule

module module7
#(parameter param140 = ((((((8'h9d) ? (8'hb5) : (7'h42)) ? (~|(7'h43)) : ((8'ha5) ? (8'ha9) : (7'h41))) ? (~&((8'hb8) ? (8'hb6) : (8'ha9))) : (8'ha1)) - ((~&(^(8'h9f))) ? {(^(8'ha0))} : (((8'h9e) ? (7'h43) : (8'ha7)) > ((8'hb8) * (8'ha7))))) ? (~^(^~(8'ha0))) : ((8'hbb) && ((((8'ha7) - (8'ha6)) <<< (!(8'hb8))) ? ((+(8'hbe)) && ((8'hb8) ~^ (8'ha1))) : ((+(8'ha4)) <<< (|(8'ha4)))))))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire138;
  wire [(2'h3):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire80;
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire118,
                 wire117,
                 wire116,
                 wire114,
                 wire12,
                 wire13,
                 wire47,
                 wire49,
                 wire80,
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
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg84,
                 reg83,
                 reg82,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire12 = (($signed(wire11[(1'h1):(1'h1)]) ?
                          {(wire9[(3'h6):(3'h6)] == wire9[(4'ha):(4'ha)]),
                              $unsigned(wire8)} : wire11[(1'h0):(1'h0)]) ?
                      wire8[(2'h2):(1'h0)] : $signed((&(&(wire9 <= wire10)))));
  assign wire13 = wire10[(4'hc):(4'h9)];
  always
    @(posedge clk) begin
      reg14 <= wire9[(1'h0):(1'h0)];
      reg15 <= (8'hbb);
      reg16 <= {reg14[(1'h1):(1'h0)]};
    end
  module17 #() modinst48 (wire47, clk, wire12, wire9, wire11, reg14, wire13);
  assign wire49 = ((&$unsigned({(8'hb7)})) > (wire13 ?
                      wire11[(3'h4):(1'h1)] : wire10[(3'h7):(3'h5)]));
  module50 #() modinst81 (.wire52(reg15), .wire55(wire49), .wire51(wire13), .wire54(reg14), .wire53(wire11), .clk(clk), .y(wire80));
  always
    @(posedge clk) begin
      reg82 <= {wire13};
      reg83 <= wire11;
      reg84 <= (-(wire13[(2'h2):(2'h2)] ?
          {($signed(wire13) ? (reg82 << (7'h43)) : {(8'hab)}),
              wire49} : (({wire47} ^ (wire9 != (8'ha0))) <= wire8)));
    end
  module85 #() modinst115 (.wire89(wire9), .wire88(wire10), .wire87(reg14), .y(wire114), .wire86(reg83), .clk(clk));
  assign wire116 = (!$signed((!$unsigned(wire13[(4'h8):(1'h0)]))));
  assign wire117 = $signed(wire11);
  assign wire118 = (^(($signed(wire11) ?
                           $signed((|wire13)) : ($signed(wire8) ?
                               wire10[(3'h4):(3'h4)] : wire11)) ?
                       $signed(wire11[(4'ha):(3'h6)]) : ($signed(((7'h40) < reg83)) - {$unsigned((7'h43))})));
  always
    @(posedge clk) begin
      reg119 <= wire117;
      reg120 <= $unsigned(((((+reg14) ? (wire11 ^~ reg82) : wire9) >= wire13) ?
          (|wire11[(2'h2):(2'h2)]) : wire116[(4'hb):(2'h3)]));
      if ((((-$signed(wire9)) <= $signed(((~^wire12) ?
          reg14 : reg14[(3'h4):(2'h2)]))) >= ((($unsigned(wire118) ?
              $signed(reg120) : wire80) | ((~reg82) >>> $signed((8'hba)))) ?
          ({reg82[(4'hf):(4'hd)], $unsigned((8'ha8))} ?
              reg84[(4'hd):(2'h3)] : reg119) : ((~^(reg119 >>> wire10)) ^~ ($signed(reg83) * wire12[(4'hc):(4'h9)])))))
        begin
          if ((((|$unsigned($unsigned(wire47))) != wire8[(1'h0):(1'h0)]) | (($unsigned(wire116[(4'h8):(1'h1)]) ?
                  $unsigned(reg15[(4'ha):(2'h2)]) : ($unsigned(reg16) ?
                      ((7'h41) && wire118) : (~&wire80))) ?
              (wire116[(4'hd):(3'h5)] ?
                  (wire117[(3'h6):(3'h6)] > reg119) : (^~(^(8'hb2)))) : wire13[(3'h7):(3'h6)])))
            begin
              reg121 <= wire47[(1'h1):(1'h1)];
              reg122 <= (!reg119[(3'h4):(2'h2)]);
            end
          else
            begin
              reg121 <= $unsigned((&(^~(~&(wire80 ^ wire114)))));
              reg122 <= $unsigned((&$signed(((8'hbd) != (wire9 ?
                  reg82 : wire47)))));
              reg123 <= $unsigned(wire118[(2'h3):(2'h3)]);
              reg124 <= reg122[(2'h3):(2'h3)];
              reg125 <= $signed(wire8[(2'h2):(1'h1)]);
            end
          reg126 <= {$unsigned((|reg119)),
              {$signed(wire49[(1'h1):(1'h0)]),
                  $signed({wire11[(4'hb):(3'h5)]})}};
          if (reg126)
            begin
              reg127 <= reg83;
              reg128 <= $signed(reg14[(4'hb):(1'h0)]);
              reg129 <= {wire9[(3'h5):(1'h0)]};
            end
          else
            begin
              reg127 <= wire118[(3'h5):(3'h5)];
              reg128 <= ($unsigned((^{reg124[(4'h8):(2'h3)],
                      {wire13, reg15}})) ?
                  (!(8'ha6)) : wire117[(1'h1):(1'h0)]);
              reg129 <= $signed((~|$unsigned($signed($signed(reg83)))));
              reg130 <= reg84;
              reg131 <= wire10;
            end
          reg132 <= reg84;
          reg133 <= (((wire12 ?
                      reg83 : ($unsigned((8'ha2)) && $signed(reg129))) ?
                  {((reg15 ? wire80 : wire13) ?
                          $signed(wire13) : (reg127 <= reg129)),
                      $signed($unsigned(reg83))} : $unsigned(wire8[(2'h2):(1'h1)])) ?
              (!(!reg84)) : (((^~(reg129 ? reg82 : wire10)) ?
                      (^$unsigned(reg131)) : $unsigned($unsigned((8'ha5)))) ?
                  reg129 : $signed(reg121)));
        end
      else
        begin
          reg121 <= $signed(reg120);
          reg122 <= {{$signed((~&(!wire10))),
                  $unsigned($unsigned($unsigned(wire117)))},
              wire9[(2'h3):(1'h0)]};
        end
      reg134 <= $unsigned($signed($signed(reg15[(5'h10):(4'ha)])));
    end
  assign wire135 = (reg83 || {reg123[(2'h2):(1'h0)]});
  assign wire136 = (reg131[(4'h8):(3'h4)] | $signed(($signed(reg14) ?
                       (&(wire47 ? reg125 : reg131)) : ((reg120 ?
                           reg131 : reg124) <= (!(7'h40))))));
  assign wire137 = (reg82[(4'hd):(3'h4)] ?
                       (!$unsigned($unsigned($signed(reg15)))) : reg131[(2'h2):(2'h2)]);
  assign wire138 = (-$unsigned((((wire11 >= reg124) ?
                           $unsigned(reg84) : {wire49}) ?
                       reg127[(2'h2):(1'h1)] : $signed($unsigned(wire80)))));
  assign wire139 = ($unsigned($signed({reg134, (reg130 && wire80)})) ?
                       $signed((~|((reg129 ^~ reg16) ?
                           (~|(8'hb2)) : (^~wire47)))) : reg130);
endmodule

module module85
#(parameter param113 = ((!((((8'hae) ? (7'h41) : (8'h9c)) ? ((8'ha0) + (8'ha9)) : ((7'h40) ? (8'ha0) : (8'ha0))) ? (^((8'ha7) <<< (8'haa))) : (((8'h9e) * (7'h42)) ? ((8'h9e) ? (8'hbe) : (8'hbb)) : ((8'hbd) != (8'hbe))))) >> (8'ha3)))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire89;
  input wire [(5'h15):(1'h0)] wire88;
  input wire [(3'h5):(1'h0)] wire87;
  input wire [(4'hb):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire90;
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire90,
                 reg109,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire90 = wire87;
  always
    @(posedge clk) begin
      reg91 <= ((8'hb8) ?
          (((~$unsigned(wire87)) || {wire88}) != (!$signed((wire90 && wire89)))) : (|(^wire86)));
      reg92 <= $signed((wire87[(1'h1):(1'h1)] >>> (8'hac)));
    end
  assign wire93 = wire88;
  assign wire94 = $signed(wire90[(4'hc):(4'h8)]);
  assign wire95 = $signed($signed(wire87));
  assign wire96 = wire87;
  assign wire97 = $signed($signed(wire88));
  assign wire98 = ($unsigned($signed($signed((wire88 + wire94)))) ^~ (~&(wire95 > (-(!wire90)))));
  assign wire99 = (-wire88);
  assign wire100 = (((&wire95) ^~ $signed(reg92[(2'h3):(2'h3)])) & wire97);
  always
    @(posedge clk) begin
      if (wire98[(2'h3):(2'h3)])
        begin
          reg101 <= $signed($signed((((wire88 ?
                  wire97 : wire93) ^~ wire89[(4'h9):(2'h3)]) ?
              (reg91[(3'h7):(3'h5)] ?
                  $signed(wire95) : (reg92 ? wire93 : wire93)) : ((!wire97) ?
                  (wire98 ? wire93 : wire100) : $signed(wire97)))));
          reg102 <= wire89[(2'h2):(1'h0)];
          reg103 <= $unsigned(wire90[(4'h8):(4'h8)]);
        end
      else
        begin
          reg101 <= wire97;
          reg102 <= $unsigned(($signed((reg102[(4'h8):(4'h8)] ^ (wire97 || reg103))) <<< wire100));
          if (wire99)
            begin
              reg103 <= (8'hb7);
            end
          else
            begin
              reg103 <= {{wire88[(5'h14):(3'h7)]}, (8'ha3)};
              reg104 <= wire95;
              reg105 <= reg101[(3'h6):(1'h1)];
              reg106 <= wire100;
              reg107 <= $signed({{wire89[(4'ha):(3'h4)], wire94}});
            end
        end
    end
  assign wire108 = (8'hac);
  always
    @(posedge clk) begin
      reg109 <= $unsigned(wire95[(1'h1):(1'h0)]);
    end
  assign wire110 = (wire89 ?
                       ($signed({{wire89, wire94}}) | (((8'hb9) + {reg92,
                           (7'h42)}) >> ({wire89, wire108} ?
                           $signed(wire108) : $unsigned(wire90)))) : ($unsigned($signed(reg91)) ?
                           wire93[(5'h11):(2'h2)] : reg104));
  assign wire111 = $signed(wire97[(1'h1):(1'h0)]);
  assign wire112 = $unsigned(((~^wire96) >>> reg105));
endmodule

module module50
#(parameter param78 = ((8'h9c) && (-(!(^((8'hbf) ? (8'hb6) : (8'hb5)))))), 
parameter param79 = {(~^((param78 < param78) ? ((param78 ? (8'hb3) : param78) ? (param78 ^~ param78) : param78) : param78))})
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire55;
  input wire signed [(5'h10):(1'h0)] wire54;
  input wire [(5'h14):(1'h0)] wire53;
  input wire signed [(3'h4):(1'h0)] wire52;
  input wire signed [(4'hb):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire64,
                 wire63,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+wire54))
        begin
          reg56 <= (-wire52);
          if ((8'hac))
            begin
              reg57 <= reg56;
              reg58 <= $unsigned((reg56 > ((~^(^(8'hb2))) ?
                  (((8'haf) >= wire54) ?
                      (wire55 ~^ reg57) : (reg56 < reg56)) : wire53)));
            end
          else
            begin
              reg57 <= {(8'ha4)};
              reg58 <= ($signed($signed($signed(wire52))) ?
                  {(wire53 | reg56[(3'h5):(3'h5)]),
                      ({$signed(wire55), wire51[(1'h0):(1'h0)]} ?
                          $unsigned((wire53 ?
                              reg58 : reg56)) : (|(!wire51)))} : (~^(~|($signed(wire51) ^ reg57))));
              reg59 <= wire55;
            end
          reg60 <= {$signed($signed(($unsigned(reg56) ?
                  {wire55} : {wire54, (8'ha9)}))),
              reg58};
          reg61 <= $unsigned($unsigned((^~wire52)));
        end
      else
        begin
          reg56 <= wire51[(4'h9):(1'h1)];
          reg57 <= (|(-(&$signed(reg56[(4'hb):(4'h8)]))));
          if ((|$unsigned(wire53[(5'h10):(1'h1)])))
            begin
              reg58 <= $signed(({{$signed(wire53)}} >>> $unsigned(reg61)));
              reg59 <= $signed(wire53[(4'he):(4'hd)]);
              reg60 <= $signed($signed((7'h44)));
              reg61 <= reg57;
              reg62 <= reg58[(3'h6):(1'h0)];
            end
          else
            begin
              reg58 <= (~^(((8'ha1) - $unsigned(wire51)) ?
                  $unsigned($signed($unsigned(reg60))) : ((wire55[(3'h4):(1'h1)] ~^ ((8'hb9) && reg62)) ?
                      $unsigned(reg58[(4'h8):(3'h5)]) : $signed($signed(reg57)))));
              reg59 <= wire52[(3'h4):(2'h3)];
              reg60 <= (~|$signed(reg62[(3'h4):(2'h3)]));
            end
        end
    end
  assign wire63 = (reg59[(3'h4):(3'h4)] ?
                      reg59[(4'he):(3'h4)] : reg57[(2'h2):(1'h1)]);
  assign wire64 = $signed($unsigned($unsigned((&(wire55 && wire51)))));
  always
    @(posedge clk) begin
      reg65 <= (!reg57[(1'h1):(1'h0)]);
      reg66 <= (((((-wire53) > (reg61 ?
                  (8'ha2) : (8'ha4))) || (^reg60[(4'hb):(3'h4)])) ?
              (($unsigned(wire64) >= wire64) ?
                  wire51[(2'h3):(1'h1)] : wire64[(4'ha):(4'h8)]) : wire63[(4'ha):(1'h1)]) ?
          ($signed($unsigned(((8'hb5) ? wire51 : (8'haa)))) ?
              wire53 : {(&$signed((8'hb3)))}) : {(!(^reg62))});
      reg67 <= $unsigned((^~(-reg59[(2'h3):(2'h2)])));
      reg68 <= reg61;
      if (((8'ha3) ?
          ($signed($signed(wire63[(4'hd):(4'h9)])) ?
              ({(8'hb2),
                  (reg60 ?
                      reg59 : wire53)} && reg68[(4'ha):(4'h8)]) : ($signed(reg56) ?
                  $unsigned($unsigned(wire55)) : (~|$unsigned(wire54)))) : $signed($signed((~|(&(8'hb2)))))))
        begin
          reg69 <= wire51[(4'h9):(3'h6)];
          reg70 <= {(($signed(reg61) ?
                      (!(reg62 ? reg60 : reg68)) : ((reg56 ?
                          (8'hab) : wire52) >= (reg60 ? reg62 : wire54))) ?
                  $unsigned(($signed(reg60) | wire63[(3'h5):(1'h0)])) : {reg69,
                      {{reg58}}})};
        end
      else
        begin
          reg69 <= (|({reg66, $signed(reg56)} * $unsigned(((reg67 ?
              wire54 : reg58) << (~&(8'ha2))))));
        end
    end
  always
    @(posedge clk) begin
      reg71 <= $unsigned(($unsigned((8'hb5)) <= {((reg70 ? reg58 : reg66) ?
              (-wire51) : (reg57 ^ wire64)),
          (~(reg58 ? (8'hae) : reg57))}));
      reg72 <= reg69[(4'hc):(2'h2)];
      reg73 <= $signed(reg61[(4'hc):(4'hc)]);
      reg74 <= reg65;
      reg75 <= $signed(wire63);
    end
  assign wire76 = $unsigned({((&((8'ha3) || wire51)) ~^ $signed(wire52))});
  assign wire77 = wire53[(4'he):(4'hc)];
endmodule

module module17
#(parameter param45 = (&(&({((8'hbf) ? (8'ha4) : (8'hbd))} ? (|{(8'ha5)}) : ((^(8'hb7)) ? ((8'ha2) == (8'ha0)) : {(8'hbe), (8'had)})))), 
parameter param46 = ((|((param45 <<< (param45 - param45)) && {(|param45), param45})) ? (({param45, ((7'h44) == param45)} ? (~|param45) : ((param45 ? param45 : (8'ha6)) <<< (param45 <<< param45))) << (^~(param45 ? (8'ha4) : ((8'ha7) * param45)))) : (&param45)))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire25,
                 wire24,
                 wire23,
                 reg44,
                 reg43,
                 reg42,
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
                 (1'h0)};
  assign wire23 = $unsigned(((^(^(wire18 ? wire18 : wire19))) ?
                      (wire22[(3'h7):(2'h2)] < (wire18[(3'h5):(3'h5)] ?
                          wire22 : {wire21,
                              wire21})) : $signed($unsigned((wire21 >= wire19)))));
  assign wire24 = wire18;
  assign wire25 = {wire22};
  always
    @(posedge clk) begin
      reg26 <= (~&((~|({wire20} ? wire23[(1'h1):(1'h1)] : {wire21})) ?
          (+wire19[(5'h10):(4'h8)]) : $signed((~^$signed((8'haa))))));
      if ((~^(8'hae)))
        begin
          if ($unsigned($signed(wire24[(1'h0):(1'h0)])))
            begin
              reg27 <= (!{$signed(((^~wire22) <<< $signed(wire19)))});
              reg28 <= $unsigned($unsigned(wire24));
              reg29 <= {wire20,
                  ({(+(7'h44)),
                      $unsigned(reg28)} && ($unsigned(reg27[(3'h4):(1'h0)]) ?
                      {{wire18}, wire23} : (-(~^reg26))))};
              reg30 <= reg28;
              reg31 <= (reg27[(2'h2):(1'h1)] && (^wire22[(3'h6):(3'h5)]));
            end
          else
            begin
              reg27 <= $unsigned((|(&$unsigned($signed(wire24)))));
              reg28 <= ((^reg31[(1'h0):(1'h0)]) && $signed($signed(((wire22 & wire23) == wire18[(3'h5):(2'h2)]))));
              reg29 <= $signed(wire20);
              reg30 <= wire19[(1'h1):(1'h0)];
              reg31 <= $unsigned($signed((+(wire20 ?
                  (|reg26) : $unsigned(reg27)))));
            end
          reg32 <= {((!(8'hbe)) == $unsigned(reg29[(1'h0):(1'h0)]))};
          reg33 <= (wire23[(4'ha):(3'h7)] >>> wire18);
          if (reg30[(1'h1):(1'h1)])
            begin
              reg34 <= ((wire21[(2'h2):(1'h1)] > (^((reg32 - reg26) || (^reg31)))) ~^ (+$unsigned((^(reg30 * reg29)))));
              reg35 <= $unsigned(reg30);
              reg36 <= reg30[(1'h0):(1'h0)];
            end
          else
            begin
              reg34 <= $unsigned((wire24 <<< ($signed(wire21[(1'h1):(1'h0)]) * (reg26 ?
                  (reg34 < reg30) : reg32))));
              reg35 <= (((^~(~&$signed(reg30))) || ((|(8'hbd)) & {((8'hac) || reg36)})) ?
                  wire24 : (reg29 ?
                      $unsigned(wire19[(4'h8):(3'h5)]) : $unsigned(((wire20 << (8'ha7)) ~^ $signed(reg30)))));
              reg36 <= {$signed(($signed((&wire18)) ?
                      reg33[(3'h4):(2'h2)] : ((!reg27) > $unsigned(reg30))))};
              reg37 <= $signed(wire21);
              reg38 <= reg36[(3'h6):(1'h0)];
            end
        end
      else
        begin
          reg27 <= {wire19[(2'h2):(1'h1)],
              ({{(!wire19)}, $signed($signed((8'haa)))} ?
                  $signed($unsigned(reg32[(2'h2):(1'h1)])) : wire25)};
          reg28 <= $unsigned((wire25[(4'h9):(2'h2)] != wire21));
          reg29 <= (((~|wire24) ?
                  (~|(wire25[(3'h7):(3'h5)] ?
                      (wire19 ?
                          wire20 : wire22) : reg36)) : (-reg35[(2'h3):(2'h2)])) ?
              reg32[(3'h6):(3'h4)] : (~wire25));
          reg30 <= $unsigned($unsigned((~&(~|(reg26 ? (8'ha2) : reg34)))));
        end
      reg39 <= (reg38 - (reg28[(3'h4):(3'h4)] <= $signed(($signed((8'hbc)) ?
          reg34 : {wire24}))));
    end
  assign wire40 = (8'ha8);
  assign wire41 = $unsigned(wire21);
  always
    @(posedge clk) begin
      reg42 <= wire19[(4'hc):(1'h0)];
      reg43 <= ((wire25 ?
              $unsigned({(wire20 && wire24)}) : $signed($unsigned($unsigned(wire21)))) ?
          {(reg39 & reg34[(3'h6):(1'h0)])} : {(8'ha0)});
      reg44 <= wire23;
    end
endmodule
