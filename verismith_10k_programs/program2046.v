module top
#(parameter param142 = (+{((((8'ha6) ? (8'hb3) : (7'h44)) ? {(8'haa), (8'ha1)} : ((8'ha6) ? (8'hb3) : (8'hb9))) ? {{(8'hb0), (8'ha9)}, (^(8'ha5))} : (((8'hac) ? (8'hb4) : (8'hac)) << ((8'hbf) && (8'hbf))))}), 
parameter param143 = (param142 ^~ ({param142, (^~(param142 ? param142 : param142))} ? (&(~|(|param142))) : {(7'h40)})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire140;
  wire signed [(4'ha):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire137;
  wire signed [(5'h11):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire133;
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire91,
                 wire4,
                 wire133,
                 (1'h0)};
  assign wire4 = wire1[(1'h0):(1'h0)];
  module5 #() modinst92 (wire91, clk, wire4, wire2, wire1, wire3, wire0);
  module93 #() modinst134 (.clk(clk), .wire94(wire4), .wire98(wire0), .wire96(wire1), .wire95(wire91), .y(wire133), .wire97(wire3));
  assign wire135 = ((~|(+wire3[(3'h6):(3'h6)])) ?
                       $signed(wire91) : $unsigned($signed($unsigned($signed(wire1)))));
  assign wire136 = wire91[(1'h0):(1'h0)];
  assign wire137 = wire0[(4'hb):(3'h7)];
  assign wire138 = wire91[(3'h7):(3'h6)];
  assign wire139 = wire91[(4'hf):(2'h3)];
  assign wire140 = ($signed((~|{wire135[(2'h2):(1'h1)],
                       (!wire0)})) & {($unsigned({wire135}) ?
                           $signed((|wire133)) : (wire3 ?
                               ((7'h44) >= wire2) : wire133[(1'h1):(1'h0)]))});
  assign wire141 = wire136[(3'h6):(2'h3)];
endmodule

module module93
#(parameter param132 = {({(-{(8'hb2), (8'ha5)}), (((8'hab) >> (8'hae)) == ((8'ha8) >> (8'hb5)))} ? (!(~^((8'h9e) ? (8'hbf) : (8'ha6)))) : ({{(8'hbf)}, ((8'hb1) ? (8'h9f) : (8'ha5))} * ((+(8'ha9)) < {(8'ha8), (8'hb5)}))), (({((8'hb2) <= (8'hbc))} - (^{(8'hbc), (8'haa)})) == (8'h9f))})
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire98;
  input wire signed [(2'h2):(1'h0)] wire97;
  input wire [(3'h7):(1'h0)] wire96;
  input wire [(4'hf):(1'h0)] wire95;
  input wire [(4'he):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire signed [(3'h7):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire99;
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  assign y = {wire131,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire99,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire99 = wire94;
  always
    @(posedge clk) begin
      reg100 <= $unsigned(wire95[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg101 <= (((~|(^(wire99 ? wire96 : wire95))) ?
          $signed(($signed(wire98) >>> wire96[(3'h7):(3'h7)])) : (wire99 >> wire99)) >>> (($unsigned($unsigned(wire95)) ?
              wire96 : $unsigned({wire94})) ?
          $signed((reg100 < wire94[(1'h1):(1'h0)])) : (^~wire94[(1'h0):(1'h0)])));
      reg102 <= (reg100[(5'h12):(3'h7)] >> (reg101 ^ {$unsigned({wire98,
              wire97})}));
      reg103 <= reg100[(4'ha):(4'ha)];
      reg104 <= $unsigned(wire98[(4'hd):(4'hc)]);
    end
  assign wire105 = wire95[(2'h2):(1'h0)];
  assign wire106 = {($unsigned(wire97) >>> $signed(wire95))};
  assign wire107 = {(((reg104 ? $unsigned(wire97) : $unsigned(wire106)) ?
                               $signed((~wire96)) : {$unsigned(wire99)}) ?
                           ($signed({reg103, wire106}) || ((reg103 - reg103) ?
                               (!wire106) : wire95[(4'hb):(4'h9)])) : (~|reg104)),
                       $unsigned((reg101[(3'h4):(2'h2)] <<< $signed($unsigned(wire94))))};
  assign wire108 = $unsigned((wire98[(3'h5):(1'h1)] ?
                       (((wire97 ? wire106 : wire95) ~^ $signed(reg104)) ?
                           $unsigned(wire107) : $unsigned(reg102[(4'he):(1'h0)])) : ({$unsigned((8'haf))} ?
                           $unsigned((reg100 ?
                               (8'hbf) : wire106)) : (-(wire98 * wire95)))));
  assign wire109 = (~^$unsigned(reg100));
  assign wire110 = ((8'hbb) >= $signed($signed((wire97 == $unsigned(wire98)))));
  assign wire111 = {$unsigned(reg102[(4'hd):(4'hd)])};
  assign wire112 = wire94;
  assign wire113 = reg104;
  always
    @(posedge clk) begin
      reg114 <= ($signed(wire113) || ((($signed((8'hb6)) ?
          wire97[(1'h0):(1'h0)] : wire110[(1'h0):(1'h0)]) && (-wire105)) <= ($unsigned($signed(wire113)) ?
          {(reg104 ^ wire108), (^wire107)} : ((wire98 >= reg100) ?
              wire95[(4'hc):(4'hb)] : (wire105 - wire112)))));
      reg115 <= wire110;
      if ($unsigned(wire96))
        begin
          if (((-($unsigned((wire109 <= (8'ha9))) & wire112[(3'h6):(2'h2)])) < (~|(7'h44))))
            begin
              reg116 <= $unsigned(wire97);
              reg117 <= ((wire113[(1'h0):(1'h0)] >= ((wire108[(5'h10):(4'he)] < (+wire94)) | $unsigned((wire107 || (8'hae))))) ?
                  (reg114 >> $signed((8'ha4))) : wire110[(2'h3):(1'h1)]);
            end
          else
            begin
              reg116 <= wire112[(3'h6):(1'h0)];
              reg117 <= (wire112 - ($signed(wire106[(2'h3):(1'h1)]) ~^ $signed((&(wire109 <= reg104)))));
              reg118 <= (8'hb8);
            end
        end
      else
        begin
          if (((|wire95[(4'hd):(3'h7)]) ?
              wire113[(3'h7):(3'h6)] : (~$signed($signed($signed(wire107))))))
            begin
              reg116 <= (wire98 + (wire112[(3'h4):(1'h1)] ?
                  (7'h44) : reg118[(4'h8):(1'h1)]));
              reg117 <= {$unsigned($signed(((~&reg115) ?
                      wire105 : {wire107})))};
            end
          else
            begin
              reg116 <= $unsigned(($signed((reg101 <= $signed(wire107))) == ($unsigned((wire110 ?
                  reg116 : reg115)) > reg118)));
              reg117 <= $signed(((((~^reg116) || (reg117 > reg117)) ?
                      $signed((~&reg114)) : $unsigned(reg115)) ?
                  $signed((~|wire112)) : wire107));
            end
          reg118 <= wire95[(4'ha):(1'h0)];
          reg119 <= (^~({$signed(wire97), wire111} ?
              wire108[(5'h15):(4'he)] : reg116));
        end
      reg120 <= ((wire107 ? wire107 : reg104) ?
          reg116[(2'h2):(1'h1)] : $unsigned(wire96));
    end
  assign wire121 = reg102[(1'h1):(1'h0)];
  assign wire122 = {((8'h9c) ?
                           (wire109 ?
                               (^~(reg119 ?
                                   (8'haa) : wire106)) : $unsigned({wire110,
                                   wire108})) : wire98)};
  assign wire123 = wire111[(3'h7):(1'h0)];
  assign wire124 = $signed((^~(~({wire109, reg119} >> $unsigned(wire122)))));
  assign wire125 = $unsigned((reg100[(4'h9):(4'h9)] ?
                       $signed($unsigned((reg117 ?
                           reg116 : (8'hac)))) : (~&reg120)));
  assign wire126 = reg114;
  always
    @(posedge clk) begin
      reg127 <= ((((wire113[(3'h5):(1'h0)] ?
              (wire112 * (8'hb1)) : $unsigned(reg101)) < {reg115,
              reg114[(2'h3):(2'h2)]}) + (|(|$signed(wire111)))) ?
          (^wire109[(3'h4):(3'h4)]) : {((~(wire98 <= wire126)) ?
                  $signed($signed((8'h9e))) : (reg102[(3'h4):(1'h0)] >= (&wire126))),
              (^$signed(wire105))});
      reg128 <= (({(-(wire99 ? reg119 : wire109)),
              ($signed(reg102) | (~^wire124))} & (($unsigned(reg127) >>> (reg116 & (8'ha2))) && (reg117[(5'h13):(4'hc)] ?
              {wire124} : (7'h40)))) ?
          reg104[(1'h0):(1'h0)] : $signed($signed(wire123[(3'h7):(2'h3)])));
      reg129 <= (~|reg116[(3'h6):(3'h6)]);
      reg130 <= (~|(!$unsigned((-{wire112}))));
    end
  assign wire131 = wire98[(2'h2):(2'h2)];
endmodule

module module5
#(parameter param89 = (&({(~&(~^(8'hb3))), ({(8'ha6)} || (^(8'hb5)))} || (&(~|(|(8'hb0)))))), 
parameter param90 = ((((!(&param89)) ^ ((-param89) | (param89 + param89))) ? (&(~|param89)) : param89) ? (param89 - (((param89 - param89) ? (param89 ? param89 : param89) : {param89, param89}) ? param89 : param89)) : param89))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h23b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire43,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 (1'h0)};
  assign wire11 = $signed(((^{wire7[(3'h4):(1'h1)]}) || {$signed($signed(wire8))}));
  assign wire12 = $unsigned(wire11);
  assign wire13 = wire9[(2'h2):(1'h0)];
  assign wire14 = (+$unsigned($unsigned((wire8[(1'h1):(1'h0)] || wire10[(3'h6):(3'h4)]))));
  assign wire15 = (-wire6[(4'hf):(4'hf)]);
  assign wire16 = wire13;
  assign wire17 = $unsigned(((wire9 ?
                      {(8'hac)} : $unsigned((wire7 ?
                          wire6 : wire8))) ~^ {wire9[(2'h2):(1'h0)], wire12}));
  assign wire18 = $signed($signed($signed(wire10)));
  always
    @(posedge clk) begin
      if ((+$unsigned((wire8[(2'h3):(1'h0)] ?
          $signed(wire10) : wire15[(1'h1):(1'h1)]))))
        begin
          if (wire6[(3'h6):(1'h0)])
            begin
              reg19 <= (wire15 << $signed((&((~wire18) || $signed(wire10)))));
              reg20 <= ((^~$unsigned($unsigned((wire18 ? (8'ha9) : wire9)))) ?
                  $unsigned((~|$unsigned($unsigned(wire12)))) : $signed(($signed((wire7 || (8'hbf))) > {$unsigned((8'ha5))})));
              reg21 <= (&(!(+(8'ha7))));
              reg22 <= $unsigned($unsigned(wire9));
              reg23 <= ((~|wire14[(5'h10):(4'he)]) | ($signed(wire14[(4'he):(2'h3)]) ^~ $unsigned(($unsigned(wire16) > $signed((8'haf))))));
            end
          else
            begin
              reg19 <= $signed(wire18[(1'h1):(1'h1)]);
              reg20 <= reg21;
            end
          reg24 <= (~|$signed(wire11));
          if ((~wire10[(3'h7):(2'h2)]))
            begin
              reg25 <= ((8'ha2) ?
                  {$unsigned((7'h44))} : $signed($signed((((8'hae) ?
                          wire16 : reg19) ?
                      $signed(wire15) : $unsigned(wire17)))));
              reg26 <= $unsigned({($signed({wire9,
                      wire10}) || $unsigned(reg24)),
                  $signed(wire9)});
              reg27 <= (+($unsigned({wire18[(2'h3):(2'h2)]}) ?
                  ($signed((+wire11)) ?
                      reg23 : wire14[(2'h3):(1'h1)]) : wire11));
              reg28 <= wire10;
              reg29 <= reg19;
            end
          else
            begin
              reg25 <= wire10[(5'h10):(4'hd)];
            end
          reg30 <= $unsigned(reg28[(3'h5):(3'h4)]);
          if (wire10)
            begin
              reg31 <= (|$unsigned($unsigned(($signed(wire8) + (^~wire11)))));
              reg32 <= wire8[(3'h4):(1'h1)];
              reg33 <= (8'h9e);
              reg34 <= $unsigned(reg31[(2'h3):(2'h2)]);
              reg35 <= reg26[(3'h7):(2'h3)];
            end
          else
            begin
              reg31 <= $signed((~(!((~&reg25) + reg29[(1'h1):(1'h1)]))));
              reg32 <= (!$unsigned((8'had)));
              reg33 <= $signed(reg27[(1'h0):(1'h0)]);
              reg34 <= $unsigned(reg34[(2'h2):(2'h2)]);
              reg35 <= $signed($unsigned((reg33 >> (+(reg26 >= wire18)))));
            end
        end
      else
        begin
          reg19 <= $unsigned((((reg22[(3'h7):(3'h5)] <= (wire14 ?
              wire14 : wire18)) << wire15[(4'hc):(2'h2)]) < wire7[(3'h4):(1'h0)]));
        end
      reg36 <= ((-(^~$signed(reg22[(4'hf):(4'ha)]))) + $unsigned(wire15));
      reg37 <= wire15[(3'h4):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg38 <= {wire16,
          (~($unsigned((wire12 ?
              reg27 : wire18)) >>> ((reg34 <= wire8) != (reg22 <<< wire16))))};
      reg39 <= reg28[(4'h8):(3'h7)];
      reg40 <= ((!{{$unsigned(wire9), wire17}, $signed($signed(reg23))}) ?
          $signed($unsigned(({reg33} > $signed(wire7)))) : (&{(^~(wire16 - reg36))}));
      reg41 <= wire15[(1'h1):(1'h0)];
      reg42 <= (&(!(^~reg27[(1'h1):(1'h1)])));
    end
  assign wire43 = (!$signed((~^$unsigned(reg19))));
  module44 #() modinst79 (wire78, clk, wire13, reg26, reg30, reg40, wire43);
  assign wire80 = $unsigned(wire17[(3'h6):(1'h1)]);
  assign wire81 = $unsigned(reg31);
  assign wire82 = $unsigned(reg38);
  assign wire83 = reg32;
  assign wire84 = $unsigned({($signed(wire81[(3'h5):(2'h2)]) > $unsigned($unsigned(reg23)))});
  assign wire85 = ((wire16 > $unsigned(($unsigned(reg28) ^ $signed(reg38)))) <<< $signed($signed(wire9[(2'h2):(2'h2)])));
  assign wire86 = ((reg32[(4'he):(3'h6)] ?
                      wire12 : ((^wire8) >> $unsigned($unsigned(reg36)))) < $signed((reg26 - $unsigned((wire7 ~^ wire8)))));
  assign wire87 = (~|(8'ha2));
  assign wire88 = $unsigned(reg40[(3'h6):(1'h1)]);
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire49;
  input wire [(5'h15):(1'h0)] wire48;
  input wire [(4'hb):(1'h0)] wire47;
  input wire [(4'hd):(1'h0)] wire46;
  input wire [(4'hd):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire58,
                 wire57,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= ((wire45[(1'h0):(1'h0)] ? (|wire48[(4'ha):(1'h1)]) : wire47) ?
          wire45 : $unsigned({(^$signed(wire48))}));
      reg51 <= (!(8'hb8));
      if ((^(wire46 && (8'h9f))))
        begin
          reg52 <= (8'hac);
          if (wire49[(1'h1):(1'h1)])
            begin
              reg53 <= ({$signed({((8'hbc) && wire48), wire48}),
                      ($unsigned($unsigned(reg50)) ?
                          $signed($unsigned(wire46)) : (wire49[(3'h6):(2'h2)] >> (wire45 ?
                              wire49 : (7'h41))))} ?
                  (($unsigned($unsigned(reg52)) ?
                      reg50 : reg52) ^~ ({(~|wire47), wire45[(3'h5):(3'h5)]} ?
                      (((8'hbc) ? (7'h40) : (8'hb4)) ?
                          (wire49 ? reg52 : wire45) : wire49) : {reg51,
                          (wire45 ?
                              wire48 : reg50)})) : (^~$unsigned(((!(8'hb1)) || (wire48 & wire48)))));
              reg54 <= $unsigned(($unsigned($signed(wire46[(4'ha):(4'h9)])) ^~ $unsigned($unsigned($signed(wire48)))));
            end
          else
            begin
              reg53 <= (reg52[(1'h1):(1'h0)] <<< ($signed((wire45 ?
                      reg51 : $signed((8'ha0)))) ?
                  reg50 : $unsigned($signed((8'haa)))));
            end
          reg55 <= wire46;
          reg56 <= ((8'hb7) ? (^~reg50) : wire45);
        end
      else
        begin
          reg52 <= $unsigned($signed($signed($unsigned(((8'hb9) ?
              reg52 : reg50)))));
          reg53 <= (&$unsigned(wire46[(4'hc):(4'hc)]));
        end
    end
  assign wire57 = ($unsigned((($unsigned(reg56) && reg55) && ((~^wire45) ?
                          $unsigned((8'hbb)) : (wire45 ? (8'hb7) : reg50)))) ?
                      (reg55 ?
                          $signed($signed({reg56})) : $signed(($signed((8'hb8)) <<< wire49))) : wire49[(3'h5):(2'h3)]);
  assign wire58 = wire57;
  always
    @(posedge clk) begin
      if (((~reg56[(1'h1):(1'h0)]) && (wire47 ?
          (8'haa) : (~|((wire58 ? reg51 : wire49) ? wire57 : (!wire48))))))
        begin
          if ((|$unsigned((((reg55 ? (8'hb3) : wire47) ?
              $unsigned(reg53) : (-reg55)) - $unsigned((&wire47))))))
            begin
              reg59 <= (&((~|wire48[(3'h4):(2'h2)]) ?
                  $signed(($unsigned(wire45) <<< {(8'hbf),
                      wire48})) : ($unsigned(((7'h43) == wire58)) ?
                      $unsigned((wire46 ? wire46 : reg53)) : (|wire57))));
              reg60 <= $signed((reg55 | $signed($unsigned((reg56 ?
                  wire46 : wire46)))));
            end
          else
            begin
              reg59 <= wire58[(3'h4):(2'h3)];
              reg60 <= ((reg56[(5'h12):(4'hf)] ?
                  ({{wire57}} ?
                      $signed($unsigned(wire46)) : reg53[(1'h1):(1'h0)]) : (reg55 ?
                      wire48[(4'hf):(3'h7)] : reg60[(3'h4):(3'h4)])) <= $signed($unsigned({(!wire57)})));
              reg61 <= (8'hbd);
              reg62 <= (&$unsigned(((!(wire47 ? (8'h9e) : wire48)) ?
                  (reg61[(4'h8):(1'h1)] - reg56[(4'hd):(3'h5)]) : ((|reg51) * (wire46 ?
                      reg51 : wire57)))));
              reg63 <= {$signed((^~$unsigned(reg53))),
                  $unsigned(wire47[(4'ha):(4'h8)])};
            end
          reg64 <= reg53;
          reg65 <= ($signed(((wire48 ^ reg61) <<< $unsigned($signed(reg51)))) ?
              (~|reg59) : $signed(((8'hb0) + {(wire46 & (8'hbc))})));
        end
      else
        begin
          reg59 <= wire49;
        end
      reg66 <= {reg65[(3'h4):(1'h1)], ((|(~$signed((8'hab)))) == {{reg53}})};
      reg67 <= reg52[(3'h7):(3'h6)];
      reg68 <= {wire58[(1'h1):(1'h0)], (wire57 ^~ reg64)};
      reg69 <= (reg65 ? (~$signed((8'had))) : wire46);
    end
  assign wire70 = reg53[(1'h0):(1'h0)];
  assign wire71 = {($signed($unsigned((+reg63))) ?
                          reg51[(1'h0):(1'h0)] : $signed(((^reg53) << (reg59 < reg60)))),
                      ($signed((^{reg63})) ^ (($unsigned(reg64) ?
                          (!reg68) : reg56) >> ($unsigned(reg50) <<< (^~reg61))))};
  assign wire72 = (^wire71[(4'h8):(1'h1)]);
  assign wire73 = (+$signed($signed(wire58[(4'hd):(2'h3)])));
  assign wire74 = {$signed({(wire71[(1'h0):(1'h0)] ?
                              (&(8'ha3)) : (reg60 * (8'hab)))})};
  assign wire75 = ((+(wire57[(4'ha):(4'h9)] ?
                      wire46[(2'h3):(2'h2)] : {(reg62 ? (7'h40) : wire57),
                          $unsigned(reg51)})) ~^ $signed((reg68[(4'hb):(3'h5)] ?
                      wire71 : (8'hbf))));
  assign wire76 = $signed(reg55[(4'hd):(4'h8)]);
  assign wire77 = $signed((({(+wire58),
                          (wire70 ? reg53 : reg66)} != {$signed((8'hb1))}) ?
                      ({{reg50}, reg61} < ((|reg60) ^ (wire57 ?
                          reg50 : wire76))) : (reg68 == (&(wire71 << reg65)))));
endmodule
