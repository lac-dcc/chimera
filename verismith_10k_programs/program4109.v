module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire183;
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  assign y = {wire128,
                 wire85,
                 wire84,
                 wire83,
                 wire72,
                 wire68,
                 wire67,
                 wire66,
                 wire55,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire183,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg71,
                 reg70,
                 reg69,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  module4 #() modinst56 (wire55, clk, wire0, wire1, wire2, wire3, (8'h9c));
  always
    @(posedge clk) begin
      reg57 <= $unsigned($unsigned(wire1[(5'h13):(4'hd)]));
      if ({$signed((&wire3[(1'h0):(1'h0)]))})
        begin
          reg58 <= ({(wire55 <= $unsigned(wire1))} ?
              reg57 : (($signed($signed(wire0)) & {(~^wire2)}) || {(^reg57[(1'h0):(1'h0)]),
                  $unsigned(wire2[(4'hf):(3'h4)])}));
        end
      else
        begin
          if ($unsigned(reg57[(4'hc):(2'h2)]))
            begin
              reg58 <= wire3;
              reg59 <= $signed(wire55[(3'h7):(2'h2)]);
              reg60 <= (8'hbe);
              reg61 <= $unsigned({($unsigned({reg58, wire2}) >> {(!wire1)})});
            end
          else
            begin
              reg58 <= reg61;
              reg59 <= ((+wire3[(4'ha):(4'ha)]) ^~ (!((8'ha6) ?
                  $signed({(8'hb2), reg60}) : (~&reg57))));
            end
          reg62 <= (^(^(reg58[(1'h0):(1'h0)] ?
              (((8'ha6) << (8'hbc)) * (wire3 <= wire0)) : (-(^~wire1)))));
          if ($unsigned(((^$signed((reg59 == (8'hab)))) != reg61[(4'hc):(2'h2)])))
            begin
              reg63 <= {wire55};
              reg64 <= $signed((($unsigned((8'hbc)) < reg58[(3'h5):(2'h2)]) ?
                  (+$unsigned($unsigned(wire1))) : $signed(wire0)));
              reg65 <= reg57;
            end
          else
            begin
              reg63 <= wire3[(4'he):(4'hd)];
            end
        end
    end
  assign wire66 = (^wire2[(4'he):(4'ha)]);
  assign wire67 = reg61;
  assign wire68 = (+wire3[(4'he):(4'hc)]);
  always
    @(posedge clk) begin
      reg69 <= (($unsigned(wire55) <<< reg62) ?
          (reg60 << $signed((&(reg58 ?
              reg58 : (8'hb7))))) : reg57[(1'h1):(1'h1)]);
      reg70 <= reg58;
      reg71 <= reg58[(1'h1):(1'h1)];
    end
  assign wire72 = reg61[(4'hb):(3'h4)];
  always
    @(posedge clk) begin
      reg73 <= $signed(((((wire2 >= reg69) && $signed(reg63)) ?
          reg65[(1'h1):(1'h1)] : wire3[(4'hc):(3'h5)]) | $signed($unsigned({reg62}))));
      reg74 <= $unsigned(($unsigned($signed($signed(reg65))) >> $signed(((&wire67) ?
          $unsigned(wire55) : reg62))));
      if (reg61)
        begin
          if (reg57)
            begin
              reg75 <= (wire67 ?
                  (+{$signed((~^wire55)),
                      $unsigned((^(8'hba)))}) : (($signed(reg65) * $unsigned((wire68 ?
                      wire0 : reg57))) ^~ ((+((8'ha8) * reg69)) ?
                      reg70 : ((reg59 ? wire55 : reg73) ? (~^wire1) : wire0))));
              reg76 <= (reg75[(1'h0):(1'h0)] ?
                  ({(8'hab)} ?
                      (8'h9c) : reg75[(1'h1):(1'h1)]) : $signed(reg62[(1'h1):(1'h1)]));
              reg77 <= $unsigned($signed($unsigned(wire1[(3'h6):(1'h1)])));
              reg78 <= (&(^~(^($unsigned(reg74) >= $signed(wire3)))));
            end
          else
            begin
              reg75 <= $unsigned(((wire68[(1'h0):(1'h0)] <<< ($unsigned(reg73) >> (~wire68))) != $unsigned((^~(|reg57)))));
              reg76 <= (|$signed(reg59));
              reg77 <= $unsigned(wire1);
              reg78 <= (8'hb3);
            end
          reg79 <= ({($unsigned((reg65 * wire72)) * $unsigned((^(8'hbe)))),
              (((~^wire3) ?
                  (reg64 != wire67) : wire66) | (|reg64))} | $signed({$unsigned($unsigned(reg77))}));
          reg80 <= $signed((-$signed((7'h42))));
        end
      else
        begin
          reg75 <= $unsigned({(reg74[(2'h2):(1'h1)] >> $signed($signed(reg75)))});
          reg76 <= reg71[(3'h4):(1'h0)];
        end
      reg81 <= ((~|((+$signed(reg64)) ~^ (wire66 < (wire72 >= wire2)))) ?
          ($signed(reg75[(1'h1):(1'h1)]) ?
              (((reg80 ? reg75 : reg59) ? {reg70, (8'hbf)} : wire0) ?
                  ((reg59 >= wire67) > (reg77 ? reg77 : reg78)) : {(reg62 ?
                          reg71 : wire67)}) : {$signed($unsigned(reg76))}) : (~&(reg74[(1'h0):(1'h0)] ?
              reg59 : (&(reg74 >>> (8'h9e))))));
      reg82 <= $signed({$unsigned((~|(wire2 >>> reg71)))});
    end
  assign wire83 = (($unsigned($unsigned(reg80[(4'ha):(4'h8)])) >>> {$signed($unsigned(reg62))}) << {$unsigned($unsigned(wire55[(2'h2):(2'h2)]))});
  assign wire84 = ((^$unsigned({(reg63 ? reg61 : (8'ha8))})) ?
                      (^~$unsigned(($signed(wire68) ?
                          (~reg59) : ((8'hab) ?
                              wire55 : (8'ha7))))) : $unsigned($unsigned((wire2 ?
                          (^reg60) : $unsigned(wire83)))));
  assign wire85 = $unsigned(wire0[(5'h11):(3'h7)]);
  module86 #() modinst129 (.wire89(reg81), .clk(clk), .wire88(reg63), .y(wire128), .wire90(wire2), .wire87(reg60));
  assign wire130 = ($unsigned({$unsigned((wire83 || reg71)),
                       $unsigned($unsigned(reg61))}) < reg61[(3'h6):(2'h3)]);
  assign wire131 = wire128[(3'h6):(3'h5)];
  assign wire132 = (($signed(((wire85 ? reg78 : reg78) >>> (+reg60))) ?
                           (+{(~&(8'haa))}) : $unsigned(($unsigned(reg57) * $signed(reg80)))) ?
                       wire85 : wire2);
  assign wire133 = (($unsigned(wire68) ?
                           $unsigned($unsigned((~&reg57))) : $signed(($unsigned(reg82) ?
                               (7'h44) : wire84))) ?
                       $signed((wire130[(3'h5):(2'h3)] ?
                           $unsigned($unsigned((8'hbf))) : $signed((reg81 >>> reg59)))) : (wire130 ~^ $signed(((reg75 >>> wire3) >> {(8'hb8)}))));
  assign wire134 = {$unsigned({(+reg70)}),
                       {((8'hab) >> $unsigned(wire83[(4'h8):(3'h4)])),
                           wire68[(2'h2):(1'h1)]}};
  assign wire135 = wire132[(2'h3):(2'h2)];
  module136 #() modinst184 (.wire138(reg70), .wire140(wire131), .wire137(wire135), .wire139(wire132), .clk(clk), .y(wire183));
endmodule

module module136  (y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire140;
  input wire [(4'ha):(1'h0)] wire139;
  input wire signed [(4'hd):(1'h0)] wire138;
  input wire signed [(5'h15):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire182;
  wire signed [(4'ha):(1'h0)] wire180;
  wire signed [(4'hd):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire154;
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  assign y = {wire182,
                 wire180,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg141 <= (~^(8'ha4));
      if ($unsigned((^~wire137[(2'h3):(2'h3)])))
        begin
          reg142 <= $signed(((wire139[(3'h5):(3'h5)] ?
                  wire140[(1'h0):(1'h0)] : (reg141 * (wire140 ^ wire137))) ?
              (~&(reg141[(3'h5):(3'h5)] ?
                  (7'h44) : $unsigned(wire137))) : ({$signed(wire140),
                  (|reg141)} >>> $unsigned((~wire140)))));
          reg143 <= ($unsigned((-$signed($signed(reg142)))) >> wire138[(1'h1):(1'h0)]);
        end
      else
        begin
          if (($signed($signed(({reg141, reg143} ?
                  wire138[(1'h0):(1'h0)] : (reg143 ? (8'hac) : reg143)))) ?
              wire137[(1'h1):(1'h0)] : reg142))
            begin
              reg142 <= (reg143 - reg141);
              reg143 <= (^~wire140[(1'h0):(1'h0)]);
              reg144 <= reg142;
            end
          else
            begin
              reg142 <= (reg141[(3'h6):(1'h0)] ~^ reg142);
              reg143 <= (reg144 ?
                  {reg141} : ($signed((wire137 && wire140[(1'h0):(1'h0)])) | wire138[(3'h5):(1'h0)]));
              reg144 <= wire140[(1'h0):(1'h0)];
              reg145 <= (((((8'haf) ?
                      (reg142 ?
                          wire140 : reg143) : (wire137 <<< (8'hbf))) << (wire139[(4'ha):(1'h0)] + $unsigned(reg144))) <= reg141) ?
                  (((wire139 ?
                          $unsigned(wire137) : (~|reg141)) ^~ $unsigned((~&(8'hb2)))) ?
                      ($unsigned({reg143}) > reg142[(3'h7):(1'h0)]) : (^wire139)) : (^(!(8'ha7))));
              reg146 <= (^reg141);
            end
          if (reg141[(1'h0):(1'h0)])
            begin
              reg147 <= $unsigned({$unsigned(reg142)});
              reg148 <= wire138[(3'h7):(2'h3)];
              reg149 <= $signed(((^~reg148) < reg148[(1'h1):(1'h0)]));
            end
          else
            begin
              reg147 <= $unsigned(reg145);
            end
          reg150 <= $signed($unsigned($signed({(wire138 ?
                  wire138 : wire140)})));
        end
      if ($signed(wire137[(1'h0):(1'h0)]))
        begin
          reg151 <= ($signed(($unsigned({reg143}) ?
              $signed((reg146 <= wire138)) : wire138[(4'h8):(1'h1)])) && $unsigned(($signed(wire138[(3'h7):(1'h1)]) ^~ $unsigned($signed((8'hbe))))));
        end
      else
        begin
          reg151 <= $signed($signed(reg142[(3'h7):(1'h0)]));
          reg152 <= reg143;
          reg153 <= reg142;
        end
    end
  assign wire154 = $signed(reg152);
  assign wire155 = $signed($unsigned(reg148[(3'h4):(3'h4)]));
  assign wire156 = (^$unsigned((8'haa)));
  assign wire157 = ($unsigned($unsigned($signed((&reg151)))) < ((~^{wire137}) >> (8'hbb)));
  assign wire158 = wire155;
  assign wire159 = (7'h42);
  module160 #() modinst181 (wire180, clk, wire159, wire137, wire158, reg152, wire155);
  assign wire182 = ($unsigned($unsigned($unsigned({reg144}))) ?
                       (&(wire158[(1'h1):(1'h0)] >> $unsigned($unsigned(reg144)))) : $unsigned((^~$unsigned((reg152 ?
                           wire140 : reg142)))));
endmodule

module module86
#(parameter param127 = {(((((8'hb4) ^~ (8'hb3)) ? ((8'h9c) ? (8'haf) : (8'hbb)) : {(7'h44)}) ? ({(8'hb4), (8'h9f)} || {(8'hb4)}) : (~((8'haa) ? (8'h9c) : (8'ha1)))) < ((~&((8'ha6) ? (8'h9e) : (8'h9e))) ? (((8'haa) ^ (8'hb3)) ? ((8'haa) ? (8'haf) : (7'h41)) : ((8'ha6) ^~ (8'ha1))) : ((~^(7'h43)) <= {(8'ha0)}))), ((&(((8'haa) * (8'hbd)) ? ((8'hb6) ? (8'ha6) : (8'ha6)) : ((8'ha8) ? (8'hac) : (7'h40)))) ? ((((8'ha7) ? (8'ha7) : (7'h41)) ? (&(8'hb6)) : ((8'hba) ? (8'hb5) : (8'h9c))) < {{(8'ha4)}, (8'hbd)}) : ((~^(~^(8'hb2))) + (&((8'hbc) ? (8'h9d) : (8'hb8)))))})
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire90;
  input wire [(3'h4):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  input wire [(4'hf):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire103,
                 wire92,
                 wire91,
                 reg122,
                 reg121,
                 reg120,
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
                 (1'h0)};
  assign wire91 = {(~^wire87[(4'h8):(3'h4)])};
  assign wire92 = wire91;
  always
    @(posedge clk) begin
      if (((($signed((wire92 ?
              wire87 : (7'h43))) & {$unsigned((8'ha7))}) & $signed((wire87 >= (~&(8'hb5))))) ?
          (~&(~((wire90 ? wire89 : wire90) ?
              (wire91 != wire89) : $unsigned(wire89)))) : $unsigned((&$unsigned($unsigned(wire90))))))
        begin
          if ({(8'hb8)})
            begin
              reg93 <= (~wire91[(2'h2):(1'h0)]);
              reg94 <= $signed(((wire91[(1'h0):(1'h0)] ?
                      wire88 : $unsigned($unsigned(wire90))) ?
                  $unsigned($signed((8'hb6))) : wire89));
              reg95 <= $unsigned($unsigned($unsigned({(wire89 != wire90),
                  $signed(wire90)})));
            end
          else
            begin
              reg93 <= $signed(((wire88[(4'h8):(3'h4)] || reg94) ?
                  (wire91[(1'h0):(1'h0)] ?
                      {reg93, (^~reg95)} : ((wire88 ?
                          wire87 : wire91) < (-reg95))) : $signed($unsigned((wire91 ?
                      wire88 : reg94)))));
              reg94 <= {wire87[(3'h5):(3'h4)]};
              reg95 <= $signed(wire92[(1'h1):(1'h0)]);
              reg96 <= $signed($unsigned((((wire91 ? reg95 : (8'ha3)) ?
                  (wire91 ^ wire92) : $unsigned(wire91)) | $unsigned($unsigned(wire92)))));
              reg97 <= (8'ha8);
            end
        end
      else
        begin
          reg93 <= ($unsigned($unsigned((((8'ha5) ?
              reg96 : wire87) & $signed(wire92)))) >> (wire90 - $unsigned(wire90)));
          reg94 <= $signed((~^$unsigned($unsigned({wire91}))));
          if ($signed($unsigned(((((8'hbb) - reg93) >>> (8'ha9)) & (reg95[(1'h0):(1'h0)] <<< $signed(wire92))))))
            begin
              reg95 <= (-($unsigned(wire88) & wire92));
              reg96 <= wire90[(1'h1):(1'h1)];
              reg97 <= (wire92[(3'h4):(1'h0)] <= $unsigned({{((8'ha0) <<< reg94)}}));
              reg98 <= (8'hbd);
              reg99 <= $signed({{$signed((wire88 < (8'hb7))),
                      reg93[(3'h5):(2'h3)]}});
            end
          else
            begin
              reg95 <= $unsigned(((reg95[(3'h7):(1'h1)] >= ((~&wire89) ?
                  (^~wire89) : (reg96 >= reg93))) <<< (((reg93 ?
                      wire89 : wire89) ?
                  reg99[(2'h3):(1'h0)] : $signed(wire89)) ~^ wire92)));
              reg96 <= $signed(wire92[(1'h1):(1'h1)]);
              reg97 <= $unsigned(reg99[(2'h2):(2'h2)]);
              reg98 <= $unsigned($unsigned((~|($signed(wire88) ?
                  (reg93 ? (8'hb4) : reg95) : {(8'hbf)}))));
              reg99 <= $signed((!(~|(!(8'hae)))));
            end
          reg100 <= $signed((($unsigned(wire87[(4'h8):(2'h3)]) ?
                  wire87[(3'h7):(2'h3)] : (reg99[(3'h4):(2'h2)] * $signed(reg95))) ?
              ((~|(8'hb6)) ? {(~^reg96), (^~reg95)} : reg93) : ({{reg93,
                          reg97}} ?
                  (wire89[(1'h0):(1'h0)] ? reg97 : (+wire87)) : reg99)));
        end
      reg101 <= reg97;
      reg102 <= ((wire88 && $unsigned(reg100[(3'h5):(3'h4)])) << wire92[(3'h7):(2'h2)]);
    end
  assign wire103 = ($signed((~^(~{wire90,
                       (8'hb3)}))) >>> $unsigned($unsigned(($unsigned(reg101) >> (^reg97)))));
  always
    @(posedge clk) begin
      if (($unsigned((8'hbb)) - $unsigned({wire87[(4'h8):(1'h0)], wire88})))
        begin
          reg104 <= wire103[(2'h2):(1'h1)];
          reg105 <= wire90;
          if (wire90)
            begin
              reg106 <= {{(~(~(^~wire89))), (-(^~$unsigned(reg99)))},
                  wire89[(1'h0):(1'h0)]};
              reg107 <= reg93[(5'h12):(3'h7)];
            end
          else
            begin
              reg106 <= ({((~wire91) ?
                      $signed((!reg98)) : reg93[(1'h1):(1'h1)]),
                  (reg94 ^ (wire103[(2'h2):(2'h2)] ?
                      {(8'h9d)} : wire89))} < {wire91});
              reg107 <= reg97[(1'h0):(1'h0)];
            end
          reg108 <= ({(((wire91 < reg99) ?
                      (^~reg94) : $signed(reg107)) > ($signed(reg94) < (reg95 ?
                      wire91 : wire91)))} ?
              wire91 : wire89[(3'h4):(2'h2)]);
        end
      else
        begin
          if ($unsigned(((+wire90[(1'h1):(1'h1)]) ?
              (($unsigned((8'hb4)) ^ reg93[(4'ha):(1'h1)]) ?
                  $signed((reg100 ? reg107 : (8'ha2))) : ((reg105 <<< reg104) ?
                      (reg101 > wire91) : (reg94 ?
                          wire103 : wire87))) : ((^~{reg97, wire92}) ?
                  $signed($unsigned((7'h42))) : wire89[(2'h3):(1'h0)]))))
            begin
              reg104 <= (^~$unsigned($unsigned(reg97[(3'h4):(1'h1)])));
              reg105 <= {({(wire87 ? (8'ha0) : (reg98 ? wire88 : (8'ha2))),
                          ((~^wire92) ? (wire92 <= wire92) : $signed(reg94))} ?
                      $unsigned($signed((8'hbe))) : $signed(wire88[(3'h7):(1'h1)])),
                  (-$unsigned($unsigned($unsigned(wire90))))};
              reg106 <= reg105;
              reg107 <= (~$signed(wire89));
            end
          else
            begin
              reg104 <= ($unsigned(($unsigned(((8'ha5) <<< (8'hb9))) ?
                      ($unsigned(reg105) < (reg107 ?
                          reg95 : wire89)) : $unsigned($signed(reg106)))) ?
                  $unsigned((|reg106)) : reg104);
              reg105 <= $signed(((((wire88 == reg106) ?
                          reg107[(1'h0):(1'h0)] : ((7'h42) <= reg99)) ?
                      ($unsigned(wire103) ?
                          $unsigned(reg108) : (reg106 | reg99)) : ($unsigned(reg107) << ((8'hb5) ?
                          wire92 : reg96))) ?
                  (($unsigned(reg97) ?
                      reg99 : reg107) & wire103) : $unsigned($unsigned(reg102[(5'h12):(4'hc)]))));
              reg106 <= (reg106[(1'h1):(1'h1)] ?
                  (~(8'ha0)) : (^$unsigned({reg104})));
            end
          if (reg107)
            begin
              reg108 <= ((^({wire91} * $unsigned(reg95[(2'h3):(2'h2)]))) ?
                  $unsigned(((~&(reg102 > (8'hb2))) + ((7'h42) ?
                      wire87 : (+reg96)))) : (reg104 == $unsigned((reg106 ?
                      (reg107 ? reg99 : reg94) : reg106))));
              reg109 <= reg107;
            end
          else
            begin
              reg108 <= {$unsigned(reg98[(3'h6):(2'h3)]),
                  (!$signed($unsigned($unsigned(reg93))))};
              reg109 <= $unsigned($unsigned(reg102));
              reg110 <= reg98;
            end
        end
      if (({reg105, (8'hae)} ?
          (^~(~|(reg98 ? $signed((7'h40)) : reg107))) : reg106[(1'h0):(1'h0)]))
        begin
          if ((8'h9f))
            begin
              reg111 <= $signed((reg95[(5'h11):(5'h11)] ?
                  {(~$signed(reg105))} : reg96));
              reg112 <= (8'hbb);
              reg113 <= reg102;
              reg114 <= (((wire92 < $unsigned((reg100 && wire89))) ~^ (reg94[(3'h6):(2'h3)] & $signed((-reg105)))) ?
                  $unsigned({reg105[(4'h9):(2'h3)]}) : $unsigned($unsigned($unsigned((reg99 ?
                      reg109 : reg108)))));
              reg115 <= reg107[(1'h0):(1'h0)];
            end
          else
            begin
              reg111 <= (reg100 ?
                  reg104[(2'h3):(1'h0)] : ((&$signed(reg111[(2'h2):(1'h1)])) ?
                      (&($signed(reg112) | (reg93 < (8'hbe)))) : wire88[(5'h13):(5'h12)]));
            end
          if (wire88)
            begin
              reg116 <= (^~{(reg97[(3'h4):(2'h3)] <= reg94)});
            end
          else
            begin
              reg116 <= (|(8'hac));
            end
          reg117 <= ((^reg104[(2'h3):(2'h2)]) ?
              $signed(reg110[(2'h2):(1'h0)]) : wire87);
          if ({($unsigned(reg113[(2'h2):(2'h2)]) ?
                  (($unsigned(reg108) + reg116[(3'h5):(3'h5)]) ?
                      {$unsigned(reg98), (reg102 & wire91)} : $unsigned({reg115,
                          reg93})) : reg97[(2'h2):(1'h0)]),
              $unsigned((wire103 * ($signed((8'hb9)) - (!reg95))))})
            begin
              reg118 <= reg98[(4'ha):(3'h5)];
              reg119 <= $signed(((($signed(reg113) ^ $unsigned((8'ha6))) ?
                      $signed($signed(wire91)) : (+wire88)) ?
                  $unsigned(($unsigned((8'ha9)) ?
                      reg112 : (reg110 ?
                          reg105 : wire103))) : $signed(reg118)));
              reg120 <= reg114[(3'h5):(1'h0)];
              reg121 <= $signed($unsigned($unsigned($unsigned(reg102[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg118 <= reg97;
            end
        end
      else
        begin
          if (((reg97 << {$unsigned($signed(reg111))}) == reg95[(4'hf):(4'ha)]))
            begin
              reg111 <= reg101[(3'h5):(2'h2)];
              reg112 <= $unsigned($unsigned(reg101));
            end
          else
            begin
              reg111 <= (-$unsigned($signed($signed($signed(reg97)))));
              reg112 <= reg96;
              reg113 <= $signed(reg104[(1'h0):(1'h0)]);
              reg114 <= ((8'h9c) >= (((reg113[(3'h6):(2'h2)] ?
                          ((8'hbe) >= reg102) : $signed((8'ha8))) ?
                      ({reg107} < (reg110 - (8'hbf))) : (~^(reg112 ?
                          reg118 : reg101))) ?
                  wire90[(1'h1):(1'h1)] : reg98));
            end
          reg115 <= ($unsigned($signed(reg110[(1'h0):(1'h0)])) ?
              reg119[(3'h4):(1'h0)] : ($unsigned(($signed(reg118) <<< (reg107 ?
                  reg102 : wire90))) ^~ $unsigned($unsigned((~&(8'had))))));
        end
      reg122 <= reg114[(4'h9):(3'h6)];
    end
  assign wire123 = reg116[(2'h2):(1'h0)];
  assign wire124 = (-reg97);
  assign wire125 = (~^(reg117[(4'hd):(3'h6)] ?
                       (((^~reg104) >= (reg102 << reg107)) ?
                           reg104 : wire91[(2'h3):(1'h0)]) : ($unsigned(wire89) >> {(wire124 < reg122),
                           reg97})));
  assign wire126 = wire123[(3'h6):(3'h5)];
endmodule

module module4
#(parameter param53 = ((7'h40) != ({(+((8'hbe) == (8'hbd)))} ? (+(((8'h9d) ? (8'ha2) : (8'hb8)) ? ((8'hb2) ^~ (8'hbc)) : {(7'h42), (8'hbf)})) : {(((8'hbd) | (8'hb6)) ^~ ((8'h9d) | (7'h42))), ((&(8'hbd)) ? ((8'ha0) | (8'hbc)) : ((8'ha5) ? (8'haf) : (8'had)))})), 
parameter param54 = ((~^param53) ? ({{param53, (param53 << param53)}, param53} ? ((~|(^param53)) - param53) : param53) : {(8'hac), {({param53, param53} < param53), {(param53 > param53), (&param53)}}}))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire5;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire51;
  assign y = {wire10, wire11, wire12, wire51, (1'h0)};
  assign wire10 = wire6;
  assign wire11 = wire8[(3'h7):(2'h3)];
  assign wire12 = wire9[(1'h0):(1'h0)];
  module13 #() modinst52 (.y(wire51), .wire14(wire12), .wire17(wire8), .clk(clk), .wire18(wire10), .wire16(wire6), .wire15(wire7));
endmodule

module module13
#(parameter param49 = ((8'hb3) <= ((&(((8'ha1) >= (8'ha0)) ? (~(8'hbb)) : ((8'hb2) ^ (7'h43)))) << (^~(((8'hb1) < (7'h40)) & (~&(8'ha1)))))), 
parameter param50 = (~&{{(~^(param49 ? param49 : (8'h9d))), (param49 ? {(8'haf), param49} : {(8'h9c)})}, (param49 && (((8'h9f) ? param49 : param49) + {(8'hb9)}))}))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg46,
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
                 (1'h0)};
  assign wire19 = ({($signed((~&(8'h9c))) ?
                          wire16[(2'h2):(1'h0)] : $unsigned(((8'hac) ?
                              wire16 : (8'hbe)))),
                      ($unsigned(wire18[(2'h2):(2'h2)]) <= $unsigned((wire15 ?
                          (8'ha4) : wire18)))} - (~|({$signed(wire15),
                          (~wire16)} ?
                      wire18[(2'h2):(1'h1)] : (~^(-wire14)))));
  assign wire20 = wire15[(5'h10):(4'ha)];
  assign wire21 = (^((({wire17, wire17} | wire18[(3'h4):(2'h2)]) ?
                      wire20[(3'h5):(2'h3)] : ($signed(wire18) | $unsigned(wire16))) >> (wire20[(3'h6):(1'h0)] * (wire18 ?
                      $unsigned(wire18) : $signed(wire16)))));
  assign wire22 = wire21;
  assign wire23 = wire17[(3'h6):(3'h4)];
  assign wire24 = (wire23[(2'h3):(1'h0)] ?
                      ({wire23[(2'h3):(1'h1)], wire23} ?
                          {(~wire22)} : wire16[(1'h1):(1'h0)]) : $unsigned(wire17));
  assign wire25 = (^~(wire23 ?
                      (wire19 != wire22[(4'h8):(1'h0)]) : $unsigned(wire22[(3'h5):(1'h0)])));
  assign wire26 = ((8'hb0) ~^ wire19);
  assign wire27 = {(wire19 ?
                          $signed($signed({(8'ha7),
                              (8'hbf)})) : {{$signed((8'ha1))}, wire14})};
  assign wire28 = $signed($unsigned(wire16));
  assign wire29 = $unsigned(wire14);
  assign wire30 = (&(wire25[(1'h0):(1'h0)] ?
                      (((wire15 == (8'hb5)) ?
                          (wire15 ^ (8'ha1)) : wire28) ^~ $signed((7'h42))) : (~wire27[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg31 <= (&{wire18});
      reg32 <= $signed({wire16[(2'h2):(1'h0)]});
      if (wire24[(1'h1):(1'h0)])
        begin
          reg33 <= wire18;
          reg34 <= $signed(wire25[(3'h7):(3'h6)]);
          reg35 <= (~$unsigned({wire26[(4'ha):(3'h7)], wire25}));
          reg36 <= $unsigned($signed($signed((wire25 ^~ $unsigned(reg35)))));
        end
      else
        begin
          reg33 <= {($signed($unsigned($unsigned(reg31))) ^ {reg31,
                  $unsigned((reg34 ? wire21 : reg33))}),
              (8'ha9)};
          reg34 <= (^~$unsigned(($signed({reg34}) ?
              (!{wire29, wire27}) : reg35)));
        end
      reg37 <= (^~$signed((7'h41)));
      if (wire17[(2'h2):(1'h1)])
        begin
          reg38 <= $unsigned({reg32[(2'h3):(1'h0)],
              $unsigned($signed($signed(wire20)))});
          reg39 <= $signed($signed(wire14[(3'h5):(2'h2)]));
          if (((reg33 ? (~|wire30) : $unsigned($unsigned(wire20))) & ((((reg33 ?
                          (8'hb7) : wire18) ?
                      reg34[(2'h2):(1'h1)] : $unsigned(wire26)) ?
                  $unsigned(wire15[(4'ha):(3'h5)]) : ($unsigned(wire18) - ((8'h9d) + reg35))) ?
              $signed($unsigned(wire14[(1'h1):(1'h0)])) : $unsigned(reg33[(1'h1):(1'h1)]))))
            begin
              reg40 <= reg36;
              reg41 <= $signed(wire28);
              reg42 <= $unsigned($unsigned(reg39[(4'hf):(3'h7)]));
              reg43 <= reg34;
              reg44 <= (-$unsigned(reg37));
            end
          else
            begin
              reg40 <= wire25;
              reg41 <= ((reg43 ?
                  reg31[(3'h6):(3'h6)] : ({(+reg34)} ?
                      reg41 : wire15[(3'h6):(3'h5)])) + wire14[(2'h3):(2'h3)]);
              reg42 <= {((8'ha1) ?
                      $signed($unsigned({wire27})) : {$signed((~(8'hac)))})};
              reg43 <= ((^(wire17[(3'h7):(3'h4)] > reg37[(2'h2):(2'h2)])) >= reg36[(4'h8):(3'h7)]);
            end
          reg45 <= $signed($signed($unsigned((!(wire14 ? wire15 : wire27)))));
          reg46 <= (reg31[(2'h3):(1'h1)] > wire21);
        end
      else
        begin
          reg38 <= reg41[(3'h4):(2'h3)];
        end
    end
  assign wire47 = $signed({($unsigned($signed(reg34)) ?
                          ((reg40 ?
                              wire24 : wire22) > $unsigned(wire20)) : $unsigned($unsigned(wire15))),
                      ($unsigned((~|reg33)) ?
                          reg34[(2'h2):(2'h2)] : (&(7'h40)))});
  assign wire48 = reg32;
endmodule

module module160  (y, clk, wire165, wire164, wire163, wire162, wire161);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire165;
  input wire signed [(5'h15):(1'h0)] wire164;
  input wire [(5'h13):(1'h0)] wire163;
  input wire [(4'ha):(1'h0)] wire162;
  input wire signed [(2'h2):(1'h0)] wire161;
  wire [(4'he):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire166;
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire166,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire166 = $unsigned((($unsigned((&wire164)) ?
                           wire161[(1'h1):(1'h0)] : (8'hb6)) ?
                       (!wire165) : wire164[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ($signed($unsigned($signed((^~(8'had))))))
        begin
          reg167 <= (|(~^$signed(wire161[(2'h2):(1'h0)])));
          reg168 <= (~&$signed((~wire164[(4'hd):(3'h7)])));
          reg169 <= wire162[(3'h6):(1'h0)];
        end
      else
        begin
          reg167 <= ((&$signed(((reg169 + (8'h9d)) ?
              (~|reg168) : (reg168 ?
                  wire164 : reg168)))) != wire165[(2'h3):(2'h3)]);
          if ((^{$unsigned(($signed(wire165) ?
                  (wire161 ^ (8'ha5)) : reg168[(4'h8):(2'h2)]))}))
            begin
              reg168 <= $unsigned(($unsigned(((wire165 ? wire166 : wire161) ?
                      (wire164 ? (8'had) : wire165) : $signed(reg167))) ?
                  wire165[(4'hb):(2'h2)] : (reg167[(5'h11):(2'h2)] == ((^reg167) ?
                      wire161[(1'h0):(1'h0)] : (wire163 || wire165)))));
              reg169 <= ({$unsigned(({wire162, wire163} > {wire162,
                      (7'h40)}))} << $signed(wire166[(3'h6):(3'h5)]));
            end
          else
            begin
              reg168 <= wire165;
              reg169 <= {$signed(($unsigned(reg169[(4'h9):(3'h6)]) ?
                      {{wire161}} : wire164)),
                  ({((wire162 >= reg167) ?
                              $signed(wire162) : $unsigned(reg169)),
                          reg167[(5'h12):(2'h3)]} ?
                      {{$unsigned(wire164)}} : reg169)};
              reg170 <= (&{(wire162 & $unsigned((+wire161))), reg167});
              reg171 <= (^~wire164);
              reg172 <= $unsigned(wire164);
            end
          if (reg169[(2'h2):(1'h1)])
            begin
              reg173 <= ((reg171 ?
                      $unsigned((reg168 ?
                          $signed(reg167) : reg167[(4'h9):(2'h3)])) : (~wire162)) ?
                  ($signed($signed(reg169)) ?
                      reg170 : ((reg168 ?
                          $signed((8'had)) : reg168) >> wire165[(4'hb):(4'h8)])) : $unsigned($unsigned($signed((reg172 ?
                      wire161 : wire161)))));
              reg174 <= wire164[(5'h10):(1'h0)];
              reg175 <= $unsigned((~|reg173));
              reg176 <= $signed((({$signed(wire166)} ?
                  wire164 : $signed($unsigned(wire163))) != ((reg170[(4'hb):(4'ha)] ?
                  {reg168} : (&wire163)) > (((8'hb6) ? reg168 : reg174) ?
                  (wire166 | reg170) : $unsigned(wire164)))));
            end
          else
            begin
              reg173 <= {$signed((wire163 && ($unsigned(reg170) << wire162)))};
              reg174 <= wire161;
              reg175 <= $signed((&($signed((reg171 > reg167)) ?
                  $unsigned($signed(wire163)) : (reg176[(3'h4):(1'h1)] <= reg172[(3'h7):(1'h0)]))));
              reg176 <= reg168[(3'h7):(3'h6)];
            end
        end
    end
  assign wire177 = $unsigned(($signed(wire165[(4'ha):(3'h4)]) ?
                       (~|reg176) : ($unsigned(reg176) ?
                           (wire166[(1'h1):(1'h1)] ?
                               (reg169 ?
                                   reg169 : reg167) : $unsigned(wire165)) : reg173[(3'h4):(2'h3)])));
  assign wire178 = (~&(reg169 ^ (reg170 && (7'h43))));
  assign wire179 = (+(wire165[(4'h8):(1'h0)] ?
                       reg176[(2'h3):(2'h3)] : $unsigned(reg170[(1'h1):(1'h0)])));
endmodule
