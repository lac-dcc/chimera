module top
#(parameter param167 = ({((|(~^(8'hb4))) ? (&((8'h9e) && (8'ha3))) : (((8'hb9) != (8'ha3)) ? (^~(8'ha6)) : (~|(7'h40))))} ? ((~&(^(-(8'ha2)))) ? ((^~((7'h41) ^ (8'hb4))) ? (((8'ha4) ? (8'hb4) : (8'hbd)) & (~(8'h9d))) : (((7'h41) >> (8'haa)) >>> ((8'hbd) >>> (8'haf)))) : ((~((8'haa) ? (8'ha1) : (7'h41))) ? (((8'haf) ? (8'ha3) : (7'h43)) >> {(7'h40), (8'ha2)}) : (~((8'hb4) ? (8'h9e) : (8'ha5))))) : ((~&(((8'ha5) >> (8'hb6)) ? ((8'h9d) ? (8'haf) : (8'hb8)) : (!(8'ha9)))) || (((~&(8'hbf)) ^ (!(8'hba))) ? {(^(8'ha7))} : {(~&(8'ha6)), ((8'ha3) <<< (8'ha6))}))), 
parameter param168 = (((8'hb0) && ((+(-param167)) & {{param167, param167}})) > (param167 & {(&(&param167)), ((param167 ? param167 : param167) ? (param167 ^~ (8'hbf)) : {(8'ha4), param167})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(4'ha):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire163,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (8'had);
  assign wire6 = ((($signed((~^wire0)) ?
                             wire1[(4'hb):(4'hb)] : wire2[(2'h2):(2'h2)]) ?
                         (wire4[(3'h4):(1'h1)] << (&(wire4 ?
                             wire2 : wire1))) : $signed($signed(((7'h40) ?
                             wire3 : wire0)))) ?
                     $unsigned((|$signed({wire0,
                         wire5}))) : wire3[(4'he):(4'hd)]);
  assign wire7 = (~|(^~(((8'hbe) >> wire1) >> wire0)));
  always
    @(posedge clk) begin
      if ((-wire0))
        begin
          reg8 <= (~$signed((wire0[(2'h2):(1'h1)] ?
              (~(wire2 == (8'h9e))) : wire7)));
          reg9 <= wire1;
          reg10 <= ((($signed(wire7[(2'h2):(1'h1)]) & (|$unsigned(wire0))) + (~$unsigned((~|wire4)))) ?
              wire5 : ($unsigned(($unsigned(reg8) < wire3[(4'h8):(3'h6)])) ?
                  {(+$unsigned((8'haf))),
                      $unsigned($unsigned(wire1))} : (((~|wire0) ?
                          $signed(reg9) : $unsigned((8'ha5))) ?
                      {(wire2 ~^ wire2),
                          $signed(wire7)} : $unsigned($unsigned((7'h40))))));
        end
      else
        begin
          reg8 <= (8'hb4);
          reg9 <= ((&(^~((+wire2) ? (wire6 + wire2) : $unsigned((7'h42))))) ?
              $unsigned(wire1[(3'h7):(3'h7)]) : (wire0[(1'h1):(1'h0)] ?
                  $signed($unsigned(reg8)) : $unsigned((7'h43))));
          if (($signed((((wire2 >= reg9) << (reg8 < reg9)) ?
                  wire2[(4'hb):(3'h5)] : (&(wire2 ? reg9 : (7'h42))))) ?
              ((+$unsigned(reg10[(2'h3):(2'h3)])) << wire0[(1'h0):(1'h0)]) : (~|$signed($unsigned($signed(wire6))))))
            begin
              reg10 <= ((reg8[(4'h9):(3'h4)] == $signed((~|$unsigned(wire0)))) ^~ ((($unsigned((8'hb2)) ?
                          (&(8'hb3)) : (wire6 + wire2)) ?
                      ($signed((8'hb3)) ^~ reg8) : ($unsigned((8'h9d)) | $signed(reg10))) ?
                  $unsigned((^~$signed(wire5))) : reg10[(1'h0):(1'h0)]));
              reg11 <= $signed((&reg10[(2'h2):(1'h0)]));
              reg12 <= $signed($unsigned($unsigned((&$unsigned(reg11)))));
            end
          else
            begin
              reg10 <= (~|$signed((wire2 ?
                  wire3 : ($signed(wire4) ?
                      reg12[(2'h3):(2'h3)] : wire2[(4'h9):(1'h0)]))));
              reg11 <= $signed({$unsigned((reg9 + {(8'ha2)})),
                  $unsigned(wire4[(1'h1):(1'h0)])});
              reg12 <= reg12;
            end
          reg13 <= (8'ha4);
        end
      reg14 <= ({$unsigned(({reg12, wire6} ?
              $signed(reg12) : wire4))} >>> reg10);
      reg15 <= {(~$signed(wire2)), reg10[(1'h1):(1'h1)]};
      reg16 <= $unsigned(($unsigned(((^~reg12) ?
              (reg11 ? reg14 : wire4) : {reg9})) ?
          (wire0[(2'h3):(1'h1)] ?
              ({reg9, wire1} ?
                  (reg9 != reg15) : $signed(wire6)) : {{reg14}}) : $signed({$signed(wire5)})));
    end
  assign wire17 = wire6[(4'ha):(3'h6)];
  assign wire18 = ((~^(reg14[(3'h6):(3'h4)] ?
                          (~&(~|wire7)) : reg15[(2'h2):(2'h2)])) ?
                      $signed(((~&$signed((7'h41))) & {$unsigned(wire5),
                          reg16[(4'hd):(1'h0)]})) : $signed($signed($signed(wire7))));
  assign wire19 = wire0;
  assign wire20 = wire4;
  assign wire21 = {$unsigned($signed($unsigned((~^wire2)))),
                      $signed((($unsigned((8'hb0)) ?
                          $unsigned((8'hbd)) : {(8'had),
                              wire20}) | $signed(wire1[(2'h2):(1'h0)])))};
  module22 #() modinst164 (wire163, clk, wire5, wire19, wire1, wire18);
  assign wire165 = ((wire1[(4'hb):(4'h8)] && (wire21[(2'h2):(2'h2)] ?
                           ($signed(wire5) >= $unsigned(reg8)) : (8'ha9))) ?
                       (wire21[(1'h0):(1'h0)] - (~(wire4 ~^ (~^reg10)))) : wire4[(4'h9):(4'h9)]);
  assign wire166 = ((reg9[(3'h6):(2'h2)] + (~$signed($unsigned(wire20)))) <= (8'h9f));
endmodule

module module22  (y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire162;
  wire [(2'h3):(1'h0)] wire161;
  wire signed [(3'h4):(1'h0)] wire160;
  wire signed [(2'h3):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire [(4'hb):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire152;
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire94,
                 wire98,
                 wire152,
                 reg97,
                 reg96,
                 (1'h0)};
  module27 #() modinst95 (.clk(clk), .y(wire94), .wire30(wire25), .wire28(wire24), .wire29(wire23), .wire31(wire26));
  always
    @(posedge clk) begin
      reg96 <= {wire24[(5'h10):(3'h6)], wire23};
    end
  always
    @(posedge clk) begin
      reg97 <= (8'ha2);
    end
  assign wire98 = $signed($unsigned((!wire23)));
  module99 #() modinst153 (wire152, clk, wire25, reg97, reg96, wire98, wire23);
  assign wire154 = wire152;
  assign wire155 = ((wire98[(4'hf):(4'hc)] ?
                           $unsigned((reg96[(3'h6):(3'h6)] ?
                               (wire98 ?
                                   wire25 : (8'h9e)) : $signed(reg96))) : ($unsigned(((8'h9f) ?
                               wire24 : wire152)) << $signed((reg96 ?
                               wire94 : (8'hbb))))) ?
                       wire98[(2'h3):(1'h1)] : {reg96,
                           $signed($signed($unsigned(wire26)))});
  assign wire156 = (~|(^$unsigned($unsigned((wire24 ^ (8'hac))))));
  assign wire157 = ($signed(reg97[(4'hd):(3'h4)]) * wire155[(3'h6):(3'h5)]);
  assign wire158 = (|({(|{wire152, wire26}), {(^wire154), (~^wire157)}} ?
                       (+wire154[(1'h1):(1'h0)]) : (($unsigned(wire157) - (wire23 ?
                           wire24 : reg97)) < wire154)));
  assign wire159 = reg97;
  assign wire160 = $unsigned((wire24 - (reg97[(4'ha):(2'h3)] + (wire155[(1'h0):(1'h0)] ?
                       $signed(wire152) : wire25))));
  assign wire161 = $unsigned(wire156);
  assign wire162 = (8'h9f);
endmodule

module module99
#(parameter param150 = {(|(~&(~&((8'ha4) ? (8'ha0) : (8'hbf)))))}, 
parameter param151 = ((~|param150) ^~ (8'hb5)))
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire104;
  input wire [(5'h10):(1'h0)] wire103;
  input wire [(3'h5):(1'h0)] wire102;
  input wire [(5'h12):(1'h0)] wire101;
  input wire [(5'h12):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire145;
  wire signed [(2'h2):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire signed [(5'h13):(1'h0)] wire141;
  wire [(5'h13):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire124,
                 wire123,
                 wire122,
                 reg140,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg105 <= ((wire103 ^ wire100) && (($unsigned((wire101 - wire102)) >>> $signed((wire102 <<< wire102))) <= ($signed({wire100}) ?
          wire102[(1'h1):(1'h0)] : (wire101[(5'h12):(4'hd)] != wire103[(3'h7):(1'h1)]))));
      reg106 <= wire100[(4'h9):(3'h4)];
      if ({wire100, (~^((&{wire102, (8'hac)}) >>> {(!(8'h9d))}))})
        begin
          reg107 <= $unsigned({($signed((~&wire104)) == ($unsigned(wire101) && (8'hb6)))});
          if (wire104[(5'h11):(3'h4)])
            begin
              reg108 <= $unsigned(reg105);
            end
          else
            begin
              reg108 <= $unsigned(wire102[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          if (reg108[(4'h8):(2'h2)])
            begin
              reg107 <= $signed((-(reg108[(4'hd):(4'h8)] != (&{(8'hb0),
                  reg106}))));
            end
          else
            begin
              reg107 <= (($signed($signed(wire100)) ?
                      reg106[(2'h3):(1'h1)] : {(~|(wire100 ?
                              wire100 : (8'hb0)))}) ?
                  (|(+(8'hbe))) : (~wire100[(4'h9):(3'h6)]));
              reg108 <= (((&((8'hb2) ? {reg106} : reg105[(3'h4):(2'h3)])) ?
                      (|$signed(reg108[(3'h4):(1'h1)])) : ((wire104 ?
                          $signed(wire103) : (-wire100)) >>> reg105)) ?
                  wire104[(3'h5):(3'h4)] : (wire104[(5'h10):(3'h5)] ?
                      reg108 : ($unsigned(reg107[(5'h10):(2'h3)]) >> reg105)));
              reg109 <= (!wire100);
              reg110 <= reg105;
              reg111 <= ({((~(reg108 ? (8'ha0) : wire104)) ?
                      (&(reg105 ? wire100 : wire103)) : $unsigned({reg110,
                          wire103}))} >>> $signed((8'ha2)));
            end
          reg112 <= ((($unsigned({wire102, wire102}) ?
                  reg108[(4'hd):(4'h8)] : $signed(reg105[(1'h1):(1'h1)])) & (((reg108 <<< reg106) - reg110[(4'h8):(2'h3)]) | reg105)) ?
              $signed(($unsigned((reg106 ~^ wire101)) || $signed((wire103 < (8'hb6))))) : $signed(reg105[(3'h4):(1'h1)]));
          reg113 <= ({$unsigned(reg108)} ? reg107 : (8'ha2));
          reg114 <= $signed($signed(($unsigned(reg109[(3'h4):(2'h2)]) >= (+(~^wire103)))));
          reg115 <= (~(&reg110[(3'h5):(3'h5)]));
        end
      if (wire101)
        begin
          reg116 <= {(reg105 ?
                  reg107[(5'h10):(2'h2)] : ({((8'hb6) ? reg114 : reg112),
                      {reg109, (7'h42)}} <= $signed($signed(reg108)))),
              $unsigned({((reg106 ? reg110 : wire103) ?
                      (reg110 < wire103) : {reg115})})};
          if ($signed(wire100))
            begin
              reg117 <= $signed(($unsigned((reg106 ?
                  (~&reg106) : wire104[(3'h6):(2'h3)])) >> $signed((^~(reg116 ?
                  reg110 : (8'hbe))))));
              reg118 <= {$unsigned($unsigned($signed($unsigned(reg106))))};
              reg119 <= $unsigned((8'hae));
              reg120 <= reg105;
            end
          else
            begin
              reg117 <= ({$unsigned(((reg109 ? reg116 : reg113) ?
                          $signed(reg110) : $signed(reg116))),
                      wire103[(3'h7):(3'h6)]} ?
                  $unsigned(reg112[(3'h6):(2'h2)]) : {reg114[(1'h0):(1'h0)]});
            end
          reg121 <= $unsigned((reg119 ?
              (((reg107 ? reg113 : reg120) && {reg107,
                  wire102}) ~^ wire102) : (&({reg120} ?
                  $unsigned(wire103) : {reg120}))));
        end
      else
        begin
          if ({$unsigned($signed(((reg116 ? reg112 : wire101) ?
                  ((8'hbe) ? (8'ha5) : reg117) : (~&wire100))))})
            begin
              reg116 <= reg117[(2'h3):(1'h0)];
              reg117 <= $unsigned(wire103[(4'hd):(3'h5)]);
              reg118 <= ({(+(~^reg118[(1'h0):(1'h0)]))} >> wire100);
              reg119 <= reg105[(1'h0):(1'h0)];
              reg120 <= $signed(reg107[(5'h11):(3'h6)]);
            end
          else
            begin
              reg116 <= $signed(reg116);
              reg117 <= $unsigned(($signed(wire102) ?
                  $unsigned(reg117) : (reg105 ?
                      reg112[(1'h1):(1'h0)] : (~|reg111[(4'h8):(3'h6)]))));
              reg118 <= $unsigned(($signed((reg117 >> $signed(wire100))) ?
                  wire100 : reg105));
              reg119 <= wire102[(2'h2):(2'h2)];
              reg120 <= $signed((reg105 & $signed($signed((wire102 | (8'hb5))))));
            end
        end
    end
  assign wire122 = $signed((-$unsigned(((&reg110) * (reg120 <<< (8'h9d))))));
  assign wire123 = wire122[(4'ha):(4'h9)];
  assign wire124 = (^~(-(reg106[(1'h0):(1'h0)] ?
                       $signed((reg108 ? wire101 : wire102)) : {((8'hab) ?
                               reg115 : wire122)})));
  always
    @(posedge clk) begin
      if ($signed((-{$unsigned($signed(reg111)), $unsigned($signed(wire122))})))
        begin
          reg125 <= (((-reg106[(3'h6):(1'h0)]) >>> (8'ha2)) ? reg115 : reg120);
          reg126 <= (~^reg105[(3'h5):(3'h4)]);
        end
      else
        begin
          reg125 <= {reg120, (~$unsigned((~&$unsigned(reg116))))};
          reg126 <= (((((wire104 <= reg111) < $unsigned(reg111)) != ((reg126 && wire122) ~^ reg126)) > {(!((8'hb5) ?
                      (8'hae) : (8'ha8)))}) ?
              $unsigned($signed(((~^wire123) ?
                  (~^wire103) : (~|(8'ha3))))) : $unsigned(reg106));
          reg127 <= ({{{$unsigned(reg107)}, reg113[(4'hb):(4'h9)]}} ?
              reg106 : $signed((wire101[(2'h3):(2'h3)] ?
                  $unsigned((reg109 ?
                      reg118 : wire123)) : wire101[(5'h10):(4'hb)])));
          reg128 <= reg109[(3'h5):(3'h4)];
        end
      reg129 <= ($signed($signed(wire123)) ?
          ((|($signed(reg128) ?
              (wire122 ?
                  wire100 : reg107) : (wire122 < reg110))) << $unsigned(($signed(reg127) ?
              ((8'hbb) ? reg106 : reg125) : reg127))) : reg110[(3'h4):(2'h3)]);
      if ((~&(reg107[(4'ha):(1'h0)] ~^ (reg107[(2'h2):(1'h0)] != {(!reg108),
          (~|reg125)}))))
        begin
          reg130 <= $unsigned(wire104);
          reg131 <= ($unsigned({{reg114, reg105},
              (((8'hba) ? wire102 : reg109) ?
                  reg107[(5'h13):(1'h1)] : (reg106 ?
                      wire102 : reg105))}) != $signed((reg116 << wire103[(3'h4):(3'h4)])));
          reg132 <= reg114;
        end
      else
        begin
          reg130 <= wire124[(4'h8):(1'h1)];
          reg131 <= (-reg129);
        end
    end
  assign wire133 = (~^$signed((8'h9c)));
  assign wire134 = ((~|$unsigned($signed(reg110))) ?
                       {{{$unsigned(reg108), (wire100 ? reg131 : reg107)},
                               $signed($unsigned(wire122))}} : wire103[(3'h5):(3'h5)]);
  assign wire135 = wire102[(3'h4):(2'h2)];
  assign wire136 = wire123;
  assign wire137 = (~&$unsigned((((!reg121) >> reg109) >>> reg126[(4'he):(3'h6)])));
  assign wire138 = (^~(reg112 ?
                       ((!((7'h44) ? reg111 : reg131)) - (reg131 ?
                           (wire135 || (8'ha6)) : reg116)) : reg126));
  assign wire139 = {((!reg116) ?
                           {{{wire133, reg130},
                                   $signed((8'ha3))}} : $unsigned(((^reg118) - reg115[(4'hb):(3'h7)]))),
                       reg105[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      reg140 <= $signed((~^($signed((&reg130)) ^~ $unsigned($signed(reg105)))));
    end
  assign wire141 = (($signed(wire137) > ((~reg116) ?
                       (+((8'h9e) ? (7'h40) : wire139)) : (~&(reg106 ?
                           wire137 : reg106)))) || wire103);
  assign wire142 = (reg105 ?
                       ({$unsigned($unsigned((8'ha8))),
                               ({(8'hb8), (8'hb0)} & reg125)} ?
                           (-$unsigned($unsigned(wire133))) : ($unsigned({reg108,
                                   wire136}) ?
                               ((~reg107) < reg129[(4'hb):(2'h2)]) : ((reg117 >> wire136) & (wire100 ?
                                   reg108 : reg115)))) : reg111[(4'h9):(3'h7)]);
  assign wire143 = ((~&(reg126 | $unsigned($signed(wire142)))) || (-$unsigned({{(8'hb3)}})));
  assign wire144 = (-(|$signed(wire122)));
  assign wire145 = (8'haa);
  assign wire146 = reg120[(3'h4):(3'h4)];
  assign wire147 = ($unsigned((~^reg107[(4'hc):(3'h5)])) || $signed(($signed($unsigned((8'h9d))) ?
                       reg132[(2'h2):(2'h2)] : ($signed(reg105) & (wire124 == (8'had))))));
  assign wire148 = ($signed((($unsigned(reg130) > wire101[(4'hb):(3'h5)]) ?
                       (!wire142[(4'hb):(4'ha)]) : reg132)) & ($unsigned($unsigned((reg120 || (8'ha1)))) ?
                       ($unsigned((reg125 ?
                           reg111 : wire141)) < reg106[(2'h2):(2'h2)]) : {wire144}));
  assign wire149 = (reg140 < $signed($unsigned((8'ha8))));
endmodule

module module27
#(parameter param93 = ((((((8'hab) ? (8'ha3) : (7'h43)) >= ((7'h41) && (8'hb6))) << ({(8'ha9), (8'hbd)} ~^ (^~(8'h9f)))) || ((~^((8'hb7) ? (8'hb4) : (8'ha8))) <= (|((8'hb3) ? (8'hba) : (8'ha9))))) ? (8'hbd) : ({{((7'h43) ? (8'hbc) : (8'ha5))}, ((|(8'hab)) < ((8'hb3) ^~ (8'hb7)))} > ((((8'ha2) | (8'h9d)) ? ((7'h40) > (8'hba)) : ((8'h9e) <= (8'had))) & (((8'hbf) - (8'ha3)) - (~&(8'ha8)))))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h308):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  input wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire32;
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire77,
                 wire69,
                 wire68,
                 wire32,
                 reg80,
                 reg79,
                 reg78,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
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
                 (1'h0)};
  assign wire32 = (wire31 <<< wire29);
  always
    @(posedge clk) begin
      reg33 <= ((^~((+(wire32 ? wire32 : wire29)) + $signed($signed(wire31)))) ?
          wire31 : wire31[(5'h11):(4'hc)]);
      if (wire32[(4'hd):(4'h8)])
        begin
          reg34 <= wire32[(1'h0):(1'h0)];
          reg35 <= (~^$unsigned((-$signed((wire30 & wire30)))));
          reg36 <= {$unsigned(reg34),
              $signed($unsigned(($unsigned((8'haa)) ?
                  ((8'ha2) ^ (8'ha2)) : $signed(wire30))))};
          reg37 <= ((($unsigned((reg34 && reg33)) ?
                  (8'ha5) : (!(&reg35))) <= wire30) ?
              (($signed((~reg34)) ?
                  $signed(wire30) : (^~$unsigned(wire29))) == (8'hb8)) : wire31);
        end
      else
        begin
          reg34 <= (^~(($unsigned((+reg36)) > (8'hac)) ?
              $signed(($signed(reg34) ?
                  (~wire32) : (~&wire30))) : wire29[(1'h1):(1'h0)]));
          if (($signed(((wire29 + {wire31}) ?
              $unsigned({wire29}) : ({wire30, wire30} >>> (reg37 ?
                  wire28 : wire31)))) < ((~|(reg33 <<< (reg34 ?
              reg37 : reg33))) - ({$unsigned(wire29)} - reg34[(1'h1):(1'h1)]))))
            begin
              reg35 <= {(8'hb9),
                  (~(((wire29 + reg36) != $signed(reg37)) ?
                      ((wire28 ?
                          wire29 : reg37) <= (-reg35)) : (wire32[(4'h8):(1'h0)] > reg37)))};
              reg36 <= (~|reg36);
              reg37 <= $unsigned($signed((^reg36[(3'h4):(2'h3)])));
            end
          else
            begin
              reg35 <= $unsigned(($unsigned($signed($unsigned(wire28))) ?
                  (8'h9c) : (((reg34 ? wire28 : reg34) < (reg35 ?
                          wire28 : reg36)) ?
                      wire32[(4'hd):(4'h9)] : ($signed(wire28) ?
                          {wire31} : (reg37 ? wire29 : reg37)))));
            end
          if ($signed(wire31[(2'h2):(1'h1)]))
            begin
              reg38 <= {(~|($unsigned((|wire30)) < $signed((^(8'hba)))))};
            end
          else
            begin
              reg38 <= reg33;
              reg39 <= wire32[(3'h5):(2'h2)];
              reg40 <= (wire31 ?
                  {($signed((wire30 ? (8'hae) : reg36)) ?
                          $unsigned({(8'hb6),
                              reg33}) : ($signed(reg39) - $signed((8'hab)))),
                      (8'hb9)} : $unsigned($unsigned({((8'ha8) ?
                          wire30 : wire29),
                      (~&reg37)})));
              reg41 <= {reg40,
                  $unsigned(($unsigned($unsigned(reg36)) & reg38))};
            end
        end
      if (reg40[(3'h6):(3'h6)])
        begin
          reg42 <= $signed(wire28);
          if ((-(&(((^~reg34) ? $unsigned(reg35) : (reg39 ? wire31 : reg39)) ?
              $unsigned(wire29) : (^(^(7'h42)))))))
            begin
              reg43 <= wire30[(1'h0):(1'h0)];
            end
          else
            begin
              reg43 <= $signed(reg43[(3'h5):(2'h3)]);
              reg44 <= (-((~|$signed({reg43})) ?
                  (((~|reg41) ? (~^reg40) : (reg40 ? (8'ha6) : reg35)) ?
                      wire29[(2'h2):(1'h1)] : ((wire30 >>> wire29) ?
                          $signed(wire32) : reg33)) : (~&{reg40})));
              reg45 <= ((~wire32) & reg40[(1'h1):(1'h1)]);
            end
          reg46 <= reg36;
        end
      else
        begin
          if (($signed(reg38) ? reg37 : $signed(wire31)))
            begin
              reg42 <= reg34[(1'h1):(1'h0)];
              reg43 <= ((&wire28) <<< reg44[(3'h6):(3'h5)]);
              reg44 <= reg38[(4'hc):(3'h6)];
              reg45 <= ((reg36 ?
                  ($unsigned(wire28) ?
                      {$signed(wire28)} : (|{wire28})) : (~&(&{wire32}))) | (reg40[(3'h4):(2'h3)] ?
                  (&(wire29[(1'h0):(1'h0)] && (reg38 ?
                      reg37 : reg36))) : reg34));
              reg46 <= reg37;
            end
          else
            begin
              reg42 <= (((~|(&(reg38 * (8'hbf)))) ? wire31 : reg38) ?
                  (reg42[(2'h2):(1'h0)] && ($signed((8'hab)) >> $unsigned((reg41 ?
                      reg42 : wire32)))) : {(((&reg34) ?
                              (~^wire32) : $unsigned(reg33)) ?
                          reg42[(5'h12):(4'hb)] : $signed((reg33 ?
                              wire31 : reg37)))});
              reg43 <= (reg39[(1'h0):(1'h0)] >= $unsigned($unsigned($unsigned((reg40 == wire31)))));
              reg44 <= $signed({($unsigned($unsigned(reg40)) >> $signed((&reg33))),
                  (($signed((7'h44)) >= wire28[(2'h3):(2'h2)]) ?
                      {(!(7'h40))} : {$unsigned(reg45)})});
            end
          if (reg37[(3'h4):(2'h3)])
            begin
              reg47 <= $unsigned((|reg45[(4'ha):(1'h0)]));
              reg48 <= reg41[(5'h10):(4'hc)];
              reg49 <= (wire30 << ($unsigned($signed((8'hae))) == $signed($signed($signed((8'ha7))))));
            end
          else
            begin
              reg47 <= $signed(reg49);
              reg48 <= reg45;
              reg49 <= reg49[(3'h6):(3'h6)];
              reg50 <= {reg47, $signed($unsigned($unsigned((reg44 >> reg34))))};
            end
        end
      reg51 <= $unsigned({(|((wire30 << reg47) >= (~(8'hb4)))),
          (|$signed(reg40[(2'h3):(2'h3)]))});
    end
  always
    @(posedge clk) begin
      reg52 <= ($unsigned(reg35) ?
          ($signed(reg48) ?
              ($unsigned({wire31}) ~^ {(reg41 > reg43),
                  (reg34 ? reg50 : reg49)}) : ({reg35} ?
                  reg45 : reg40[(1'h0):(1'h0)])) : ({(-(reg42 ?
                  (8'hbe) : (8'ha0))),
              (&((8'h9c) >= reg34))} <<< (reg42[(2'h2):(1'h0)] ?
              $signed((&wire29)) : ($signed(reg33) ?
                  $unsigned(wire28) : ((7'h44) ? reg34 : reg37)))));
      reg53 <= ((reg40 & $unsigned((wire29 ?
          reg33 : (wire30 <= reg42)))) & $signed(({reg52} & $unsigned($unsigned(reg43)))));
      if ((((~|((reg39 - reg49) ? wire30[(1'h1):(1'h1)] : reg49)) ?
              reg49 : {reg37[(3'h4):(1'h0)]}) ?
          wire32[(3'h7):(2'h2)] : (|reg40[(3'h6):(3'h6)])))
        begin
          reg54 <= reg44;
        end
      else
        begin
          if (reg52[(3'h7):(3'h6)])
            begin
              reg54 <= (~|($unsigned($signed({reg52, wire28})) ?
                  $signed($unsigned((^reg36))) : reg50));
              reg55 <= $unsigned((reg51[(3'h4):(2'h3)] ?
                  (&$unsigned((+reg49))) : $signed(reg53)));
              reg56 <= reg52[(1'h0):(1'h0)];
            end
          else
            begin
              reg54 <= wire32[(3'h6):(3'h6)];
              reg55 <= $unsigned(reg35);
              reg56 <= ($signed(reg38) ~^ (reg42 ?
                  ((~^$signed(reg50)) ?
                      {(reg36 >>> (8'hb2)),
                          (^reg55)} : {((8'hb0) ^~ reg44)}) : ({reg45[(4'ha):(1'h1)]} ?
                      (~((8'haa) < reg45)) : ((reg35 ?
                          reg48 : reg40) + (wire30 - (8'ha2))))));
              reg57 <= $unsigned(reg38[(4'h8):(4'h8)]);
            end
          if ($signed({$signed($signed({reg42, reg47})),
              wire29[(2'h2):(1'h1)]}))
            begin
              reg58 <= {reg53[(5'h10):(3'h7)]};
              reg59 <= {$unsigned(reg43[(4'hd):(3'h7)])};
              reg60 <= reg43;
              reg61 <= $unsigned(wire29);
              reg62 <= $unsigned((($unsigned(reg55[(2'h2):(2'h2)]) ?
                  (8'hb8) : (&reg41[(3'h6):(3'h5)])) > $signed($signed((+reg49)))));
            end
          else
            begin
              reg58 <= reg43;
              reg59 <= (reg36 ? reg62 : reg38);
              reg60 <= {$unsigned({reg48, {(reg43 != wire30)}})};
              reg61 <= $unsigned($signed(($unsigned($unsigned(reg38)) ?
                  ({reg59} ?
                      $unsigned(reg54) : $signed(reg34)) : (&$unsigned(reg55)))));
              reg62 <= {(^wire31[(1'h1):(1'h0)]),
                  {((~^reg36) ? $signed(reg34) : reg38[(1'h0):(1'h0)]),
                      reg43[(1'h0):(1'h0)]}};
            end
          reg63 <= (-{$signed(($signed(reg50) << (reg45 ? (8'hbe) : reg33)))});
          reg64 <= ($signed((&reg40[(3'h6):(3'h4)])) >>> $signed($unsigned((wire28 & (-reg62)))));
          reg65 <= reg54[(4'ha):(4'ha)];
        end
      reg66 <= (+($signed((reg34[(3'h6):(3'h6)] < reg46)) <<< reg43[(5'h12):(4'hc)]));
      reg67 <= wire32[(4'ha):(3'h6)];
    end
  assign wire68 = reg45[(2'h3):(1'h0)];
  assign wire69 = $unsigned(wire31[(4'h8):(1'h1)]);
  always
    @(posedge clk) begin
      reg70 <= (~^$signed(reg44[(4'hb):(1'h1)]));
      if (({reg60[(4'h8):(3'h7)]} < $signed((reg43 & (8'haf)))))
        begin
          if ($signed($signed($signed(($signed(reg56) << reg34)))))
            begin
              reg71 <= $unsigned(((!$unsigned($signed((8'hb1)))) ^ (~^$unsigned($unsigned(wire31)))));
              reg72 <= $unsigned((~&((reg38 ^ {reg49}) ?
                  reg55 : (+$unsigned(reg45)))));
              reg73 <= (~((reg70[(1'h1):(1'h1)] <= ((reg40 ? reg43 : reg38) ?
                      (wire31 - (8'hbc)) : (reg59 ? (8'hba) : reg53))) ?
                  $signed($signed(((8'had) ?
                      wire28 : reg50))) : $unsigned((|(~^reg35)))));
              reg74 <= {{($unsigned((reg39 ? reg55 : reg51)) ?
                          reg63[(4'h8):(3'h5)] : reg71),
                      (reg73[(3'h5):(3'h4)] ? $unsigned({reg48}) : reg71)}};
            end
          else
            begin
              reg71 <= ($unsigned(((~(reg42 ? (8'h9e) : reg61)) ?
                      $signed({(8'hb9), reg67}) : {(reg49 ? reg71 : reg37)})) ?
                  reg61 : reg34);
              reg72 <= $signed($signed(reg39[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg71 <= reg72;
          if ($signed((+$unsigned(reg49))))
            begin
              reg72 <= $signed(($signed(((~|reg66) ?
                  (reg38 >>> reg39) : reg49)) & reg54));
            end
          else
            begin
              reg72 <= (-(((&reg40) ?
                  reg48 : $unsigned((reg43 ? reg55 : reg72))) << ({(-wire68)} ?
                  wire28 : (~$signed(reg45)))));
              reg73 <= reg49;
            end
          reg74 <= reg73;
        end
      reg75 <= $signed(reg51);
      reg76 <= reg49[(1'h1):(1'h0)];
    end
  assign wire77 = reg57[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg78 <= $signed(reg70);
      reg79 <= ($unsigned($signed(reg42)) ?
          reg47 : {$signed(reg74[(2'h2):(1'h1)]),
              ($unsigned(reg40[(2'h3):(2'h2)]) <= $unsigned(((8'hb8) > reg44)))});
      reg80 <= $unsigned(((~^(((8'hb1) ? reg67 : reg64) ?
          $signed(reg75) : $signed(reg67))) >= reg72[(3'h6):(2'h2)]));
    end
  assign wire81 = $unsigned((({(+(8'haf)), (&reg79)} ?
                          reg34 : $signed((reg36 - reg79))) ?
                      (reg73 ? reg61 : $unsigned(reg79)) : {reg62}));
  assign wire82 = $signed(($signed(wire81[(4'h9):(1'h0)]) ?
                      {$unsigned((reg66 ?
                              reg65 : reg58))} : (((wire68 >> reg43) << ((8'hb1) <= (8'h9d))) != reg73)));
  assign wire83 = reg51[(2'h2):(2'h2)];
  assign wire84 = (8'haa);
  assign wire85 = ({({$unsigned(reg74), $signed(reg42)} ?
                          $unsigned($signed(wire83)) : $signed($unsigned(reg64)))} ~^ ($unsigned($unsigned($signed((8'ha7)))) ?
                      ($unsigned($signed(reg47)) ?
                          $signed($signed(reg43)) : $unsigned(reg48)) : reg64[(1'h0):(1'h0)]));
  assign wire86 = (~$unsigned($signed(reg38)));
  assign wire87 = (((($unsigned(reg67) ?
                          (reg43 >> (8'hab)) : reg42[(3'h4):(1'h1)]) ^ ((reg66 ?
                          reg47 : wire28) && (8'hb7))) || ((8'haa) < $unsigned(reg75[(4'h9):(3'h5)]))) ?
                      (+$unsigned((reg46 >= reg44[(5'h13):(2'h2)]))) : {wire85,
                          $unsigned((~(reg76 || reg80)))});
  assign wire88 = (reg65[(2'h3):(1'h1)] ?
                      $signed(wire81[(3'h5):(3'h5)]) : (($signed((wire82 ?
                          reg38 : reg35)) < (((8'hbe) == wire28) ?
                          (!reg55) : $signed(reg62))) | $unsigned({$signed((8'ha6)),
                          $unsigned((7'h41))})));
  assign wire89 = (reg64 + reg46[(4'hc):(3'h7)]);
  assign wire90 = $unsigned($unsigned(reg59));
  assign wire91 = reg71;
  assign wire92 = $unsigned((reg51[(1'h0):(1'h0)] ?
                      (^({reg63} <<< (reg40 ?
                          reg72 : wire88))) : {$signed($signed(reg72))}));
endmodule
