module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire202;
  assign y = {wire4, wire5, wire130, wire132, wire202, (1'h0)};
  assign wire4 = $signed(($unsigned((wire1 ^ $unsigned(wire0))) ?
                     wire2[(3'h7):(1'h0)] : wire1));
  assign wire5 = wire1[(1'h1):(1'h0)];
  module6 #() modinst131 (wire130, clk, wire2, wire4, wire1, wire3);
  assign wire132 = $unsigned({wire130});
  module133 #() modinst203 (wire202, clk, wire132, wire4, wire130, wire1, wire3);
endmodule

module module133  (y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire138;
  input wire signed [(5'h15):(1'h0)] wire137;
  input wire [(2'h3):(1'h0)] wire136;
  input wire [(4'hb):(1'h0)] wire135;
  input wire [(3'h5):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire201;
  wire [(3'h4):(1'h0)] wire199;
  wire signed [(4'he):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire150;
  wire signed [(2'h3):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire [(4'h8):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire144;
  wire [(4'h8):(1'h0)] wire143;
  wire signed [(5'h13):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire139;
  reg signed [(4'hb):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg161 = (1'h0);
  reg [(3'h4):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  assign y = {wire201,
                 wire199,
                 wire153,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
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
                 reg156,
                 reg155,
                 reg154,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire139 = ((-$signed(wire137)) ? wire135[(3'h4):(1'h1)] : wire138);
  assign wire140 = wire139;
  assign wire141 = $unsigned({((^$signed(wire135)) ?
                           wire136[(2'h3):(1'h0)] : wire140),
                       (^~$signed((wire139 & wire139)))});
  assign wire142 = $signed(((|{wire135[(2'h2):(1'h0)],
                       ((8'hba) | wire134)}) > (8'h9f)));
  assign wire143 = (~&(7'h42));
  assign wire144 = wire136;
  assign wire145 = {(^~(7'h41)), (&wire140[(5'h13):(5'h10)])};
  assign wire146 = wire141[(3'h5):(3'h4)];
  assign wire147 = (7'h42);
  assign wire148 = $unsigned(wire145);
  assign wire149 = wire148[(3'h4):(1'h0)];
  assign wire150 = wire147[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg151 <= wire143[(3'h7):(3'h6)];
      reg152 <= wire144[(4'hb):(3'h7)];
    end
  assign wire153 = $signed(wire139);
  always
    @(posedge clk) begin
      reg154 <= (({$signed(wire139)} ? wire142 : (~&wire140)) ?
          (~^wire146) : $signed((!$signed($unsigned(wire146)))));
      if ((~|(wire145[(3'h7):(3'h7)] ?
          wire146[(2'h2):(2'h2)] : (reg152[(3'h4):(1'h0)] ?
              {(wire145 & wire141), (~^(8'hb2))} : ($unsigned(wire135) ?
                  $unsigned(wire143) : wire135)))))
        begin
          reg155 <= {wire138,
              ((wire138 ?
                  ($signed(wire136) != (wire137 ?
                      wire140 : wire141)) : ({wire143} <<< ((8'hba) ?
                      wire150 : wire147))) == wire146)};
          reg156 <= wire153[(3'h4):(1'h1)];
          reg157 <= ($signed(reg152[(4'h9):(3'h4)]) ?
              $unsigned({reg151}) : ($signed(reg152[(4'h8):(2'h3)]) == wire147));
          reg158 <= $signed((+(&wire135[(3'h6):(3'h6)])));
        end
      else
        begin
          reg155 <= (~|wire141[(2'h3):(1'h0)]);
          if (((~^(reg151[(3'h4):(2'h2)] ?
                  $signed($unsigned(wire136)) : ($signed((8'hba)) >= wire153))) ?
              {((8'h9c) <<< (^~(7'h40))),
                  (reg154 ?
                      ((wire145 <<< (8'ha0)) > $unsigned(reg158)) : wire150[(4'h8):(2'h2)])} : (8'hbe)))
            begin
              reg156 <= ((&wire148) ?
                  {($unsigned(wire148) ?
                          reg152[(2'h3):(2'h3)] : $signed((wire145 - wire141))),
                      (wire153 >= ({wire150} ?
                          $signed(wire140) : (wire139 ?
                              wire140 : wire150)))} : wire141);
              reg157 <= wire134;
              reg158 <= reg156[(2'h2):(1'h1)];
            end
          else
            begin
              reg156 <= $unsigned(($unsigned((7'h43)) >>> (wire146[(1'h0):(1'h0)] != $signed((-reg156)))));
              reg157 <= (8'hb8);
              reg158 <= wire139;
            end
          reg159 <= (!wire135);
        end
      reg160 <= {{$signed((reg154[(2'h2):(2'h2)] * (reg157 ?
                  wire137 : wire134)))},
          (~|(~&wire136[(1'h1):(1'h1)]))};
      reg161 <= ((wire135 ?
          $signed({$unsigned(wire153),
              (~&(7'h44))}) : $unsigned((^~wire147))) <<< (^$signed(($signed(wire150) | (!reg154)))));
      if ((((((~|reg155) * wire141[(3'h5):(1'h0)]) + $signed($signed(wire144))) ?
              ($signed($signed(reg151)) ?
                  reg155[(2'h3):(2'h2)] : reg156[(4'he):(1'h1)]) : wire153[(3'h6):(2'h3)]) ?
          $signed(wire149) : $signed(($signed($unsigned(wire142)) ?
              (!(&wire153)) : (+$unsigned(reg161))))))
        begin
          if ($unsigned($signed({(-wire143[(2'h2):(2'h2)])})))
            begin
              reg162 <= ($signed($unsigned($signed(reg156))) ~^ ($signed(($unsigned(reg151) >= $signed(wire142))) ?
                  wire146[(3'h4):(1'h1)] : (reg155[(3'h4):(1'h1)] >> $signed(((8'ha7) ?
                      reg155 : (7'h44))))));
              reg163 <= reg162;
              reg164 <= wire135[(4'hb):(4'ha)];
            end
          else
            begin
              reg162 <= wire150[(4'hb):(3'h6)];
              reg163 <= (($unsigned(reg151[(3'h5):(2'h2)]) ?
                  (((~|reg151) ?
                          (wire145 >> wire138) : wire138[(5'h12):(4'hd)]) ?
                      $unsigned(wire144[(1'h0):(1'h0)]) : {reg158[(4'h8):(1'h1)]}) : reg164[(3'h6):(1'h1)]) ^~ (reg157 && ((~^{wire136}) ?
                  ((reg162 >> wire141) >>> reg151) : ((reg157 != reg159) ?
                      (reg156 ? wire145 : reg164) : $unsigned(wire134)))));
              reg164 <= wire146;
            end
          reg165 <= (|reg151[(4'ha):(2'h2)]);
          reg166 <= $signed(wire141);
        end
      else
        begin
          reg162 <= $unsigned(wire148[(3'h7):(1'h0)]);
          reg163 <= (~^($unsigned(reg154) >>> ((!(|reg151)) >>> wire136)));
          reg164 <= wire143[(3'h5):(2'h3)];
        end
    end
  module167 #() modinst200 (.wire169(wire147), .wire168(reg162), .wire171(wire140), .y(wire199), .clk(clk), .wire170(reg166));
  assign wire201 = reg159;
endmodule

module module6
#(parameter param128 = ((({(7'h41), {(8'hb8)}} ? ((~&(8'hbc)) ? ((8'hb7) >= (8'hb6)) : ((8'hbb) | (8'h9e))) : {(+(8'had))}) <<< (~&(((8'hbd) ? (8'hb6) : (8'ha1)) ? {(8'hb3)} : {(8'ha5)}))) ? {(~(((8'hb6) ? (7'h42) : (8'ha2)) ? (7'h40) : ((8'h9f) ? (8'hac) : (8'ha0)))), (&({(7'h43)} ? ((8'had) ? (7'h43) : (8'haa)) : ((8'haa) ? (8'ha4) : (8'hb4))))} : ((^~({(8'hb4)} ? {(8'ha9)} : ((8'hba) >> (8'hb4)))) != (8'hb7))), 
parameter param129 = {(&(((param128 != param128) ^~ {param128}) ~^ {(param128 <<< param128), (param128 ? param128 : param128)})), (!{(~(^param128))})})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire126;
  assign y = {wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire64,
                 wire66,
                 wire81,
                 wire126,
                 (1'h0)};
  assign wire11 = (8'h9e);
  assign wire12 = $unsigned($unsigned($unsigned(wire8)));
  assign wire13 = (-($signed((wire12[(1'h0):(1'h0)] ?
                      $unsigned(wire10) : (wire12 ?
                          wire7 : wire8))) != $signed(($signed(wire12) ?
                      wire9 : (+wire10)))));
  assign wire14 = {$unsigned(wire10[(4'hc):(1'h1)])};
  assign wire15 = ($signed((wire11 ?
                      {$unsigned((8'hbf))} : {{wire12},
                          {(8'hb5), wire7}})) != wire8[(2'h3):(1'h1)]);
  module16 #() modinst65 (.y(wire64), .wire17(wire15), .wire20(wire8), .wire18(wire9), .wire19(wire7), .clk(clk));
  assign wire66 = $signed((wire14[(4'hd):(4'hd)] << ((+(wire13 < wire11)) ?
                      {$signed((7'h43))} : ((wire10 >= wire64) ?
                          (8'hb2) : $signed(wire7)))));
  module67 #() modinst82 (wire81, clk, wire15, wire13, wire14, wire11);
  module83 #() modinst127 (wire126, clk, wire12, wire10, wire9, wire8, wire13);
endmodule

module module83  (y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire88;
  input wire signed [(3'h5):(1'h0)] wire87;
  input wire [(3'h5):(1'h0)] wire86;
  input wire [(4'hf):(1'h0)] wire85;
  input wire [(4'hc):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire89;
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(5'h10):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  assign y = {wire118,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire89 = wire84;
  assign wire90 = ({(((wire88 ? (8'haa) : (8'ha6)) != wire85[(1'h0):(1'h0)]) ?
                              wire85 : wire86[(2'h3):(2'h3)]),
                          $signed(wire88[(4'h9):(3'h6)])} ?
                      (((|(wire85 ? wire87 : wire88)) != ((wire88 > wire84) ?
                          (7'h41) : (~^wire86))) || $unsigned($unsigned((wire87 ?
                          (8'haf) : wire84)))) : $unsigned($unsigned(wire84[(1'h1):(1'h0)])));
  assign wire91 = ($unsigned($unsigned((&{wire85, wire88}))) ?
                      wire89[(1'h0):(1'h0)] : wire88[(4'hd):(1'h0)]);
  assign wire92 = $unsigned((~$signed($unsigned((wire90 ? wire88 : wire90)))));
  assign wire93 = $unsigned(wire91[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire91)
        begin
          reg94 <= ($signed(($unsigned($signed(wire89)) != {wire91[(4'ha):(2'h3)]})) >>> ((wire87 ?
              (~|$signed(wire84)) : (wire87[(1'h0):(1'h0)] >>> (wire87 > wire90))) ^~ wire86[(1'h1):(1'h1)]));
          reg95 <= wire90;
          reg96 <= ((($unsigned($signed(reg95)) ?
                  $signed((!wire92)) : ({wire84, wire84} ?
                      ((7'h42) >>> (8'hbc)) : $unsigned(wire84))) - (^(reg95 ?
                  $signed(wire89) : (~&reg94)))) ?
              $unsigned((wire92 ?
                  reg94[(4'h9):(1'h0)] : {{wire89}})) : wire84[(3'h5):(2'h2)]);
        end
      else
        begin
          if ({(^~reg96)})
            begin
              reg94 <= $signed(wire90[(3'h6):(3'h6)]);
              reg95 <= wire85;
            end
          else
            begin
              reg94 <= wire91[(3'h7):(3'h7)];
              reg95 <= wire89;
              reg96 <= $unsigned((wire85 ?
                  $unsigned(((wire93 ?
                      wire88 : reg94) >> $unsigned(wire84))) : wire89[(1'h1):(1'h0)]));
              reg97 <= wire84[(3'h7):(3'h6)];
            end
          reg98 <= $signed(reg97);
        end
      reg99 <= $unsigned($signed(reg98[(3'h7):(1'h1)]));
      if (({{$unsigned((wire88 ^~ reg98))}} * {$unsigned((7'h44)),
          {reg99[(3'h5):(1'h1)], $signed($signed(wire87))}}))
        begin
          reg100 <= $signed(wire86[(3'h5):(3'h5)]);
          if (reg97[(3'h7):(1'h0)])
            begin
              reg101 <= $unsigned((^$signed($unsigned(wire88))));
              reg102 <= $signed({wire93, {wire84[(4'h9):(3'h6)]}});
              reg103 <= reg100;
              reg104 <= ($unsigned(((&reg99[(2'h3):(1'h0)]) < reg94)) && {$signed((~^reg97))});
              reg105 <= wire86;
            end
          else
            begin
              reg101 <= ($signed({(~^(8'ha7))}) - (wire87 ^~ ((reg102[(3'h6):(1'h0)] ?
                  (wire90 ?
                      (8'h9e) : reg102) : (reg103 == wire84)) && (|$signed((8'hb5))))));
              reg102 <= $unsigned((8'h9f));
              reg103 <= $unsigned($unsigned((&($unsigned(reg103) ^~ wire92))));
              reg104 <= reg94[(3'h7):(1'h1)];
            end
          if (reg99)
            begin
              reg106 <= $signed((reg103 > ({$unsigned(wire86),
                  (wire92 ~^ reg102)} && (8'h9d))));
              reg107 <= {reg106[(4'hc):(4'h8)],
                  $unsigned($signed((wire88[(3'h5):(1'h0)] ?
                      $unsigned(reg106) : wire89[(4'h8):(2'h2)])))};
              reg108 <= (^~($unsigned(wire84[(3'h4):(3'h4)]) != {$signed(reg100)}));
            end
          else
            begin
              reg106 <= (&reg107);
            end
        end
      else
        begin
          reg100 <= reg96;
          reg101 <= $signed((~|($signed((7'h40)) ^ $unsigned({(8'h9f)}))));
        end
      reg109 <= (((($unsigned(reg99) <= $signed(reg107)) ?
              reg104 : ({wire88, wire84} ?
                  wire86 : reg101[(1'h1):(1'h1)])) ~^ (~|wire93[(1'h1):(1'h1)])) ?
          $signed(((8'hbd) ?
              ((wire92 ? reg104 : reg107) ?
                  {reg106} : (|reg101)) : (reg97[(2'h3):(1'h0)] <<< ((8'ha9) < wire92)))) : ($signed($signed((reg95 & (8'h9d)))) | $unsigned((reg107[(4'hb):(4'ha)] ?
              (8'ha7) : $unsigned(reg99)))));
      if ((^$signed((reg103 - (~&(wire90 ? reg103 : wire86))))))
        begin
          reg110 <= $unsigned(reg104[(2'h2):(1'h0)]);
          reg111 <= ((reg100 < (reg99 << $signed(wire90[(2'h3):(1'h1)]))) ?
              reg97 : ($signed((~|wire87)) >>> ((!$signed(reg106)) ^~ reg106[(3'h4):(2'h2)])));
          if ((reg101[(3'h4):(3'h4)] | {(reg97[(4'hb):(2'h2)] ?
                  reg103[(3'h5):(2'h2)] : wire90),
              {((~|wire93) ? wire93 : $unsigned(reg95)),
                  $unsigned(reg99[(4'hd):(3'h7)])}}))
            begin
              reg112 <= ((~^($unsigned(reg102[(1'h0):(1'h0)]) - (!{wire92,
                  wire92}))) > wire86);
              reg113 <= (reg105 ^ reg97[(4'h9):(3'h4)]);
              reg114 <= wire89[(4'ha):(4'h8)];
              reg115 <= reg112[(3'h7):(2'h2)];
              reg116 <= (-((reg113[(1'h1):(1'h1)] ^~ (~&(&reg95))) > wire88[(4'hb):(4'h8)]));
            end
          else
            begin
              reg112 <= reg105[(4'he):(4'hb)];
              reg113 <= $unsigned((~&((((8'hbe) > wire93) >>> $unsigned(reg113)) <<< {$unsigned(wire93),
                  (|wire85)})));
              reg114 <= $unsigned((~&($signed($signed(reg105)) <= $unsigned((reg105 ?
                  reg110 : (8'hbc))))));
              reg115 <= reg109[(5'h10):(3'h6)];
            end
          reg117 <= ($unsigned(reg110) * ((reg97 + (~(+(8'hab)))) <<< reg112));
        end
      else
        begin
          reg110 <= {reg104[(2'h3):(1'h1)]};
          reg111 <= wire91[(4'ha):(3'h6)];
          reg112 <= $unsigned(($unsigned({(wire93 << (8'hbf))}) ?
              reg109[(1'h1):(1'h1)] : reg96[(3'h4):(1'h1)]));
          reg113 <= ($signed(reg105) != ((reg117 && $unsigned((wire87 == reg98))) ?
              (reg98[(4'hb):(3'h4)] && wire85[(4'hf):(3'h7)]) : reg116));
        end
    end
  assign wire118 = ((|$unsigned($unsigned({reg104}))) ?
                       (-wire84[(3'h4):(1'h1)]) : $signed(((reg99 ?
                           {(8'hbc)} : (wire91 && reg99)) == reg94[(4'h9):(2'h3)])));
  always
    @(posedge clk) begin
      if ((~|(reg97 ?
          reg100[(2'h3):(2'h3)] : ($unsigned((reg112 ?
              reg112 : wire84)) ^~ wire91))))
        begin
          reg119 <= $signed(((~&$signed($unsigned((8'hb7)))) ?
              ({reg107,
                  reg103[(3'h5):(1'h1)]} >>> {$signed(reg110)}) : (^$unsigned((wire91 << wire118)))));
          reg120 <= $signed((reg109[(4'he):(4'hb)] ?
              ($signed($signed(reg115)) ?
                  $unsigned(wire91[(2'h2):(1'h0)]) : $signed($unsigned(reg103))) : (reg103 ?
                  $signed((~^reg106)) : (reg99[(5'h10):(4'hf)] & reg98))));
          reg121 <= reg112;
          if (wire92[(3'h7):(1'h0)])
            begin
              reg122 <= ({$unsigned(wire85),
                  $unsigned($unsigned((reg96 < (8'hb6))))} <<< $unsigned({(^~(reg102 && wire86)),
                  wire88[(4'he):(3'h4)]}));
              reg123 <= $signed(wire118[(3'h5):(1'h1)]);
              reg124 <= $signed($unsigned(($unsigned(((8'hbc) + reg108)) | ((+reg114) ?
                  reg98 : $unsigned(reg103)))));
            end
          else
            begin
              reg122 <= ($signed(reg113[(5'h12):(1'h1)]) ?
                  ((|$signed($unsigned((8'hbd)))) | (~&reg95[(3'h5):(2'h2)])) : reg107);
            end
          reg125 <= (~((8'ha5) ? reg96 : reg96[(3'h7):(1'h0)]));
        end
      else
        begin
          reg119 <= (|$signed($unsigned(reg113)));
          reg120 <= $unsigned((^~$signed(((~|reg120) ?
              (reg107 || (8'ha7)) : $signed((8'hb7))))));
          if (({reg116[(3'h7):(2'h3)], $signed(reg115)} >> reg124))
            begin
              reg121 <= $unsigned(((~($signed(reg111) ?
                      $signed(reg107) : $unsigned(reg121))) ?
                  $unsigned($signed((8'hae))) : (reg115 * $signed((reg122 >= reg100)))));
              reg122 <= reg117[(4'ha):(1'h0)];
              reg123 <= (wire85 ?
                  ($unsigned(wire85[(1'h1):(1'h1)]) > $signed((8'hbb))) : {(((+reg99) ?
                              $signed((8'ha6)) : wire84[(3'h5):(1'h1)]) ?
                          {reg96, reg124} : reg116[(4'h8):(3'h6)])});
            end
          else
            begin
              reg121 <= reg123[(4'h9):(3'h7)];
              reg122 <= {reg113[(4'hb):(3'h6)]};
              reg123 <= (reg107 ? reg123 : wire90[(4'hc):(1'h0)]);
            end
          reg124 <= wire85;
          reg125 <= ((|reg103[(3'h6):(1'h1)]) + (reg123[(3'h4):(2'h2)] ?
              reg115[(3'h5):(2'h3)] : $signed(($unsigned(reg116) ?
                  {reg112} : $unsigned(reg125)))));
        end
    end
endmodule

module module67
#(parameter param80 = (+(((-(&(8'hb1))) << (~^((8'ha7) >> (8'hb1)))) ? (|({(8'ha8), (8'hab)} ? ((8'ha2) ? (7'h43) : (8'ha6)) : {(8'hbf), (8'ha0)})) : (8'hba))))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire71;
  input wire [(5'h15):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire [(5'h14):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 (1'h0)};
  assign wire72 = wire68[(3'h4):(2'h2)];
  assign wire73 = wire71[(3'h7):(1'h0)];
  assign wire74 = (8'hbf);
  assign wire75 = (^~wire68);
  assign wire76 = wire71;
  assign wire77 = $unsigned((((wire73 ?
                          $signed(wire76) : $unsigned(wire70)) >>> $unsigned((wire72 && wire75))) ?
                      ((wire76 ? wire68 : (+wire71)) ?
                          wire69[(5'h10):(3'h7)] : ($unsigned((8'h9e)) == (wire72 ~^ wire73))) : wire76));
  assign wire78 = $signed({(~|{(wire76 ? wire76 : (8'ha1)), (|wire76)}),
                      $unsigned((8'hb2))});
  assign wire79 = wire78[(2'h2):(1'h0)];
endmodule

module module16
#(parameter param63 = ((((((8'ha0) ? (8'ha8) : (8'ha0)) ? ((8'hbc) ? (8'h9c) : (8'hb5)) : ((8'ha9) ? (8'ha6) : (8'ha3))) >= {{(8'hbe), (8'ha5)}}) ? {({(8'hbb), (7'h40)} >> ((8'ha4) ~^ (8'ha5)))} : ({((8'hb3) ? (7'h43) : (7'h44)), (^~(8'ha1))} ^~ {((7'h41) ? (8'hb2) : (7'h40)), {(8'hbe), (8'ha3)}})) ? (({((8'hbd) ~^ (8'ha6))} ? (~&(~(8'hbd))) : (((8'hbe) - (7'h40)) >> ((8'h9f) ? (8'hba) : (8'hb4)))) >= ((((8'ha7) == (8'hae)) ? ((8'ha0) < (8'ha7)) : ((8'hb6) - (8'h9d))) - (((8'hb9) ^ (8'hb4)) | {(8'h9f)}))) : ((((&(7'h44)) ? (-(8'hb3)) : (-(8'hb3))) ^ (!(-(7'h44)))) ? ({{(8'ha5), (8'hb3)}} ? {(!(8'ha1))} : {((8'hbd) ? (8'hbd) : (7'h43))}) : (~^(^~(8'hac))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire21;
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire35,
                 wire21,
                 reg52,
                 reg51,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = $unsigned({($unsigned({wire19,
                          wire18}) >> ((&wire20) >>> $signed(wire17)))});
  always
    @(posedge clk) begin
      reg22 <= {wire17,
          $unsigned((-((wire19 ? wire21 : wire17) ?
              (wire18 ^ wire21) : (~^(8'h9c)))))};
      reg23 <= (+wire21[(1'h1):(1'h1)]);
      reg24 <= $signed($signed(reg22[(4'hb):(3'h4)]));
      reg25 <= {{($unsigned($signed(reg23)) ~^ $unsigned({reg23, (8'ha9)}))},
          $signed(($signed($signed(reg24)) == reg24[(3'h6):(3'h5)]))};
      if ((reg22 ? wire18 : $unsigned((8'h9f))))
        begin
          if ({wire20})
            begin
              reg26 <= $signed($signed(($unsigned(reg25) ?
                  {wire17[(3'h6):(2'h3)],
                      reg22[(4'h9):(2'h3)]} : $unsigned((reg24 ?
                      wire17 : (7'h42))))));
              reg27 <= reg26[(3'h6):(3'h5)];
              reg28 <= ((~|(wire18[(2'h2):(1'h0)] >> ($unsigned(reg24) == (8'h9c)))) ?
                  $unsigned($signed(reg26[(2'h3):(1'h0)])) : {$signed((!(reg25 ?
                          reg27 : reg26)))});
              reg29 <= ((reg27 ^ $signed((8'haf))) >>> $signed(reg26));
              reg30 <= reg25[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= wire17;
              reg27 <= ($unsigned(reg29[(1'h1):(1'h1)]) ?
                  $signed({wire20[(5'h12):(4'hd)],
                      (reg25 ? (~^reg29) : (+reg23))}) : reg24);
              reg28 <= (8'hbc);
              reg29 <= (reg24[(2'h3):(2'h3)] <= (wire20[(2'h3):(2'h3)] ?
                  $signed({$unsigned(reg28),
                      reg23[(2'h3):(2'h3)]}) : {((reg23 < reg24) ?
                          (reg24 ? reg26 : wire20) : wire21[(2'h3):(1'h0)]),
                      {reg29}}));
              reg30 <= {reg29, (reg24 >= (~&reg23))};
            end
          reg31 <= (~(reg24 <= ({(reg28 == (8'had)), reg29} ?
              $signed(reg28) : (&(reg30 ? reg27 : reg26)))));
          reg32 <= $signed(wire19);
          reg33 <= (((8'h9f) && (^~wire18[(3'h4):(2'h3)])) ?
              (8'ha9) : ($unsigned($signed($signed(reg28))) ?
                  $unsigned({$signed(wire20)}) : ($signed($unsigned(reg22)) ?
                      $signed((reg23 ? reg27 : reg25)) : $unsigned({reg26}))));
          reg34 <= ($signed((8'hbc)) ?
              reg23 : $signed((reg28[(5'h13):(1'h1)] ?
                  reg27[(2'h2):(1'h0)] : (^~$signed((8'ha6))))));
        end
      else
        begin
          reg26 <= ($signed(reg27[(3'h7):(3'h7)]) ?
              $unsigned({($unsigned(wire20) | wire19[(2'h3):(1'h1)]),
                  ((reg26 - reg22) ?
                      (wire19 * wire20) : ((8'hac) || (8'hab)))}) : wire19);
          reg27 <= reg32;
          reg28 <= (reg34 ?
              $unsigned(wire17[(5'h11):(4'he)]) : reg24[(2'h2):(1'h0)]);
          if (reg30)
            begin
              reg29 <= $signed($signed({{(reg24 * wire18)}}));
              reg30 <= $unsigned($signed(reg27[(4'h9):(4'h9)]));
              reg31 <= (~|(|(^$unsigned($unsigned(wire19)))));
            end
          else
            begin
              reg29 <= $unsigned((+$unsigned((reg24 ?
                  reg34[(2'h3):(2'h2)] : reg26[(4'ha):(3'h4)]))));
              reg30 <= (8'ha3);
            end
          reg32 <= ($signed(wire17) <= (~$unsigned(wire21[(1'h1):(1'h0)])));
        end
    end
  assign wire35 = $unsigned(reg33[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      if ((|$unsigned((reg33[(1'h1):(1'h0)] >>> ({wire20} ?
          (~wire18) : (~|(8'hae)))))))
        begin
          if (reg24[(3'h4):(3'h4)])
            begin
              reg36 <= ((reg22 ?
                      {($unsigned(wire18) ? $signed(wire19) : reg30),
                          {(-wire19), $signed(wire21)}} : ((~&(reg32 ^ reg34)) ?
                          {$signed((8'hab))} : $signed({(8'ha9)}))) ?
                  reg34 : reg25);
            end
          else
            begin
              reg36 <= reg29[(1'h1):(1'h1)];
              reg37 <= reg33;
              reg38 <= (7'h40);
              reg39 <= $signed((~(&((reg23 ? wire18 : reg26) ?
                  $signed(reg37) : $signed(reg31)))));
            end
          if ($unsigned((+($unsigned((&reg36)) ?
              $signed($unsigned(wire20)) : (|(8'h9e))))))
            begin
              reg40 <= (~^wire35[(5'h13):(4'hf)]);
            end
          else
            begin
              reg40 <= ($unsigned((($signed((8'ha3)) - (8'hb5)) < ((-wire17) ^ $unsigned(reg24)))) & reg23[(3'h5):(1'h1)]);
            end
          reg41 <= $signed($signed($unsigned((+(~&reg26)))));
        end
      else
        begin
          reg36 <= {(~&$unsigned(reg27)), reg28};
        end
      reg42 <= $signed((($unsigned({wire18, reg34}) - ($signed(reg38) ?
          ((8'hb7) ? reg34 : reg22) : $signed(wire19))) | ({(reg30 ?
                  (8'had) : reg36),
              (~&(8'h9e))} ?
          reg29 : wire21)));
      reg43 <= (+$signed(reg24[(2'h3):(1'h0)]));
    end
  assign wire44 = reg41[(3'h7):(2'h2)];
  assign wire45 = (~&$signed((reg32 ?
                      $signed(reg34) : $signed($unsigned(reg24)))));
  assign wire46 = wire21[(2'h2):(1'h0)];
  assign wire47 = ((^($unsigned((wire18 == (8'ha8))) ?
                          $unsigned($signed(reg43)) : reg23)) ?
                      (~^reg22[(1'h0):(1'h0)]) : $unsigned((reg37[(1'h1):(1'h0)] ?
                          reg41 : (^reg25[(2'h2):(1'h0)]))));
  assign wire48 = (-{(~|reg38[(2'h3):(1'h0)]), $unsigned(reg24)});
  assign wire49 = {reg31};
  assign wire50 = {(($signed(reg39) >> ({reg43, wire46} ?
                          (8'hb0) : $unsigned(reg26))) ^~ $signed((^~(|wire47))))};
  always
    @(posedge clk) begin
      reg51 <= wire45;
      reg52 <= ((($signed(reg36) ?
              ($unsigned(reg27) <<< reg22) : {(wire19 != wire48),
                  (reg23 ? (8'hb2) : wire21)}) == reg26) ?
          $unsigned(reg34) : reg32);
    end
  assign wire53 = reg28;
  assign wire54 = $signed($signed($signed((^~{reg38}))));
  assign wire55 = wire54[(4'h8):(2'h2)];
  assign wire56 = (reg30[(4'hc):(3'h4)] ?
                      (8'hb2) : (+(+{{wire35, wire54}, (-(8'hb1))})));
  assign wire57 = {reg22[(4'h9):(2'h2)], reg24[(3'h6):(1'h0)]};
  assign wire58 = $signed($signed($unsigned(reg51)));
  assign wire59 = $signed(($unsigned(($signed(wire44) - reg36[(2'h2):(2'h2)])) ~^ wire45[(4'h9):(3'h4)]));
  assign wire60 = $unsigned((($unsigned(reg27[(4'he):(1'h0)]) != {{wire58,
                              reg30},
                          wire20}) ?
                      ($unsigned(wire57) ?
                          (wire58[(3'h5):(3'h4)] < $signed(wire17)) : $unsigned($signed(wire56))) : reg51[(3'h4):(3'h4)]));
  assign wire61 = wire58[(3'h4):(2'h2)];
  assign wire62 = reg27[(1'h0):(1'h0)];
endmodule

module module167
#(parameter param198 = ((!(^((~^(8'hb8)) <<< ((8'ha6) << (7'h42))))) >>> (~^{(^((7'h43) ? (8'hb9) : (8'haf))), (~&(&(8'hb1)))})))
(y, clk, wire171, wire170, wire169, wire168);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire171;
  input wire [(3'h4):(1'h0)] wire170;
  input wire signed [(4'hb):(1'h0)] wire169;
  input wire [(4'hc):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire197;
  wire signed [(2'h3):(1'h0)] wire196;
  wire signed [(3'h7):(1'h0)] wire195;
  wire [(5'h11):(1'h0)] wire178;
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg [(2'h2):(1'h0)] reg189 = (1'h0);
  reg [(2'h3):(1'h0)] reg188 = (1'h0);
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg186 = (1'h0);
  reg [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg184 = (1'h0);
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg [(3'h5):(1'h0)] reg173 = (1'h0);
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire178,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((+($unsigned((wire171 ^ wire170)) <<< $signed((wire171 ?
              wire170 : wire168)))) ?
          $unsigned($signed(($signed((8'hac)) && (wire168 ?
              (8'hb6) : wire170)))) : (8'hab)))
        begin
          reg172 <= $unsigned(wire169[(2'h3):(1'h0)]);
        end
      else
        begin
          reg172 <= $unsigned(((wire170[(2'h2):(1'h1)] ?
              ((~|wire169) != $signed(wire168)) : wire171) > $unsigned(($unsigned(reg172) ?
              wire169 : wire168[(4'hc):(1'h0)]))));
          if (reg172)
            begin
              reg173 <= (~^$unsigned(((^~$unsigned((8'hbd))) ?
                  (7'h42) : wire169[(3'h6):(3'h6)])));
              reg174 <= $unsigned(((8'hbc) ?
                  {(&wire169[(4'hb):(3'h6)])} : (~reg172)));
              reg175 <= $unsigned(wire168);
            end
          else
            begin
              reg173 <= reg173;
              reg174 <= reg174[(3'h4):(2'h2)];
            end
        end
      reg176 <= ($unsigned((wire168[(4'hb):(4'ha)] == wire169[(1'h1):(1'h0)])) ?
          ($signed(reg172[(3'h7):(3'h4)]) ?
              (-((reg173 ^ wire170) & {(8'ha2),
                  wire171})) : reg173) : $unsigned(wire171));
      reg177 <= ((($unsigned($unsigned(wire168)) | reg176[(2'h2):(2'h2)]) != $signed(wire171[(2'h2):(1'h0)])) * wire169[(3'h5):(3'h4)]);
    end
  assign wire178 = wire168[(4'hb):(2'h3)];
  always
    @(posedge clk) begin
      reg179 <= reg175[(3'h4):(3'h4)];
      reg180 <= wire168[(3'h4):(2'h2)];
      reg181 <= {$signed(($unsigned(wire170) * $signed(wire171[(3'h4):(1'h0)]))),
          $signed((({reg180, reg180} ?
              (reg175 ?
                  reg175 : reg179) : $unsigned((8'h9d))) & $unsigned((8'hbb))))};
      if ((($unsigned($unsigned({(8'hbe), reg176})) && {((8'hb7) ?
              (reg181 <= wire171) : (reg181 || (8'hb2))),
          (8'ha5)}) ~^ (8'hb0)))
        begin
          if ({(~|$unsigned((~&(wire178 ? reg173 : reg180)))),
              (reg175 ?
                  (($unsigned(reg172) << reg179[(1'h0):(1'h0)]) >> $unsigned((reg181 <<< wire169))) : (^$signed($signed(reg174))))})
            begin
              reg182 <= $signed(wire171);
              reg183 <= $unsigned(reg174[(1'h1):(1'h0)]);
            end
          else
            begin
              reg182 <= (reg174[(3'h5):(1'h0)] ?
                  reg182[(2'h3):(1'h0)] : (($signed((&reg172)) ?
                      {$signed(wire169)} : reg172) - (~|$signed($unsigned(wire169)))));
              reg183 <= ({(reg173[(2'h2):(1'h0)] >= $signed($unsigned(wire169))),
                  wire168[(3'h4):(2'h2)]} && (($signed(reg177[(4'hf):(4'hd)]) ^~ reg172) && (~&$unsigned($signed(reg179)))));
              reg184 <= reg173[(2'h2):(1'h0)];
              reg185 <= wire171;
            end
          reg186 <= $unsigned((reg183[(3'h7):(3'h6)] ?
              (8'hb5) : $signed($unsigned((reg175 | reg182)))));
          if (reg184[(1'h0):(1'h0)])
            begin
              reg187 <= ($signed((~|reg173)) || (~((&reg174) <= (|reg182[(2'h3):(1'h0)]))));
              reg188 <= $unsigned(reg181[(3'h4):(1'h1)]);
              reg189 <= ((!(((reg180 ^~ reg172) >= {wire169,
                  (8'hae)}) != $signed($unsigned(wire178)))) + ((($signed((8'hac)) ^~ reg187[(4'hc):(3'h6)]) ?
                  $unsigned($unsigned(reg177)) : (8'ha2)) >> $signed({wire170})));
            end
          else
            begin
              reg187 <= $signed((wire169 ? wire171 : reg189[(1'h0):(1'h0)]));
            end
          reg190 <= $unsigned(reg181[(3'h6):(1'h1)]);
          reg191 <= ($signed((&reg190)) >> reg174);
        end
      else
        begin
          reg182 <= ($signed(reg187) ?
              {$signed($signed($unsigned((8'hb8))))} : $unsigned((((reg181 ?
                      reg173 : (8'hb1)) && reg186[(4'hd):(4'hb)]) ?
                  wire171[(3'h4):(2'h3)] : reg182)));
          if ($unsigned(reg176))
            begin
              reg183 <= ((-$signed(reg172[(3'h5):(2'h2)])) | (wire171[(3'h5):(1'h0)] <<< reg189[(1'h1):(1'h0)]));
            end
          else
            begin
              reg183 <= ($signed((((reg176 ?
                      reg173 : reg185) && $signed(reg181)) <= (+{reg190}))) ?
                  reg187[(4'he):(3'h7)] : (~^(-$unsigned((reg173 ?
                      reg188 : reg189)))));
              reg184 <= ($unsigned(reg186) << ({((wire168 ^~ reg181) != reg181[(2'h2):(1'h0)])} || $unsigned($unsigned($signed(reg176)))));
              reg185 <= ($signed(((reg183 >= $signed(reg190)) & reg188[(2'h3):(1'h0)])) ?
                  reg191 : $unsigned($unsigned($signed((^~wire171)))));
              reg186 <= (~^{wire171[(3'h6):(1'h0)], wire170[(1'h1):(1'h0)]});
              reg187 <= $unsigned(wire170[(3'h4):(2'h3)]);
            end
          if ($unsigned(({reg186[(5'h11):(4'h9)],
                  ((~|reg177) ? (8'hb2) : (8'hb4))} ?
              wire168[(4'hb):(1'h0)] : reg176)))
            begin
              reg188 <= $signed($signed(reg186[(1'h0):(1'h0)]));
              reg189 <= wire168;
            end
          else
            begin
              reg188 <= (8'ha5);
              reg189 <= reg174;
              reg190 <= {($unsigned(reg190) != ($signed($signed(reg172)) ?
                      ($signed(wire178) > $signed(reg184)) : wire171)),
                  (!reg189[(1'h1):(1'h1)])};
            end
          reg191 <= $signed((($signed(reg179[(2'h3):(1'h1)]) ~^ $signed((wire168 && reg182))) >>> $unsigned(reg182[(2'h2):(2'h2)])));
          reg192 <= reg179;
        end
      reg193 <= $unsigned($unsigned($unsigned($unsigned((reg180 ?
          reg182 : reg174)))));
    end
  always
    @(posedge clk) begin
      reg194 <= wire178[(1'h0):(1'h0)];
    end
  assign wire195 = (reg193[(2'h3):(1'h0)] ~^ $signed(((^{(8'hb3)}) ?
                       (wire178[(4'ha):(2'h3)] - reg181) : ($signed(reg189) >> (^~wire171)))));
  assign wire196 = (^$signed(reg176[(2'h2):(1'h0)]));
  assign wire197 = (reg175[(4'hc):(3'h4)] < $signed((+(reg188 ?
                       reg183 : $unsigned(wire171)))));
endmodule
