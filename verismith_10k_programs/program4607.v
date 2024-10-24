module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire143;
  assign y = {wire147, wire146, wire145, wire5, wire6, wire143, (1'h0)};
  assign wire5 = ($signed(wire4[(2'h3):(2'h3)]) <<< ($unsigned(wire1) >> ((+$unsigned(wire0)) ?
                     wire3[(2'h2):(1'h1)] : $signed($signed(wire0)))));
  assign wire6 = wire3[(2'h3):(1'h1)];
  module7 #() modinst144 (.wire11(wire1), .wire12(wire3), .clk(clk), .y(wire143), .wire8(wire2), .wire9(wire6), .wire10(wire0));
  assign wire145 = (($unsigned(wire2) ?
                           $signed((wire0 << $unsigned(wire143))) : {(wire1[(2'h2):(1'h1)] ?
                                   $unsigned(wire1) : (|(8'ha8)))}) ?
                       {(~|wire6)} : ({(-$signed(wire6)),
                           {$unsigned(wire3)}} == (wire4 ?
                           $unsigned((!wire2)) : (|(wire3 >> (8'hbc))))));
  assign wire146 = ((8'hb8) > $signed(wire6));
  assign wire147 = wire146[(3'h4):(1'h1)];
endmodule

module module7
#(parameter param141 = {((((!(8'hbb)) | ((8'hac) < (8'ha5))) ? ((&(8'hbb)) * (8'hae)) : {((8'h9e) ^ (8'hb4)), (^(8'hb1))}) ? (7'h43) : (((~(8'ha3)) ? (~(8'ha7)) : (!(8'hbe))) ? {(&(8'ha7)), (^~(8'hab))} : (((8'hbd) <= (8'ha5)) == (^~(8'hbe))))), ({(((8'hab) ? (8'hb1) : (8'hb2)) ^~ ((8'ha1) ? (8'h9e) : (8'ha9))), (~|{(8'hbc), (8'hb2)})} ? (^~(|((8'had) ^~ (8'hb4)))) : ({(|(8'hb3))} ? ({(8'hb3)} ? (&(8'ha3)) : ((8'h9e) == (8'hac))) : ({(8'hbd), (8'hb5)} >= {(8'hb6)})))}, 
parameter param142 = {param141, {(7'h42)}})
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire139;
  wire signed [(3'h6):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire93;
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire97,
                 wire96,
                 wire95,
                 wire67,
                 wire14,
                 wire13,
                 wire93,
                 (1'h0)};
  assign wire13 = $signed(wire8);
  assign wire14 = $unsigned($unsigned((((^wire9) ?
                          (wire8 ? (8'hbf) : wire12) : wire12) ?
                      wire9[(2'h3):(1'h1)] : ({wire11} < (wire11 == (8'hb8))))));
  module15 #() modinst68 (wire67, clk, wire11, wire10, wire13, wire12, wire9);
  module69 #() modinst94 (.wire74(wire9), .wire72(wire8), .wire70(wire11), .clk(clk), .wire71(wire14), .y(wire93), .wire73(wire12));
  assign wire95 = wire9[(4'h9):(3'h4)];
  assign wire96 = $unsigned($unsigned((!$signed($unsigned(wire93)))));
  assign wire97 = (((~&wire96[(4'hd):(2'h3)]) ?
                      wire12 : (wire96[(2'h2):(2'h2)] ?
                          (8'had) : wire8[(2'h2):(2'h2)])) ~^ $unsigned((+(~{wire14,
                      (8'ha9)}))));
  module98 #() modinst134 (wire133, clk, wire95, wire14, wire11, wire8);
  assign wire135 = {{wire11, $unsigned((+(^(8'ha8))))}, $signed(wire10)};
  assign wire136 = $unsigned($unsigned((!$signed({wire93, wire95}))));
  assign wire137 = (-{(~wire12[(4'ha):(4'h9)])});
  assign wire138 = $unsigned($signed(wire95));
  assign wire139 = ($unsigned((wire8 < wire8)) ?
                       ({{$unsigned(wire11)}} ?
                           ((!$unsigned((8'hb9))) ?
                               $signed(wire13) : $unsigned($unsigned((8'hb1)))) : wire137) : $signed({wire95}));
  assign wire140 = (^~{$signed($signed($unsigned(wire10)))});
endmodule

module module98  (y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire102;
  input wire signed [(3'h7):(1'h0)] wire101;
  input wire signed [(4'h8):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire104,
                 wire103,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
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
  assign wire103 = wire100[(1'h0):(1'h0)];
  assign wire104 = {((-($unsigned(wire103) ?
                               wire101[(1'h1):(1'h0)] : wire102[(2'h3):(2'h2)])) ?
                           {$signed({wire101, wire102}),
                               wire101[(3'h7):(2'h2)]} : $signed((8'hbe))),
                       ((wire101 ? (~^(wire103 - wire101)) : wire100) ?
                           {{wire102[(2'h3):(2'h2)]}} : wire99[(3'h4):(1'h0)])};
  always
    @(posedge clk) begin
      if ((wire100 ?
          wire99[(3'h5):(3'h5)] : (wire99 ?
              $unsigned(((+wire102) ?
                  wire101[(3'h5):(3'h4)] : (wire99 || wire104))) : wire99[(3'h4):(1'h1)])))
        begin
          reg105 <= ((~^(~&wire101)) ?
              wire102 : $signed((~|$signed((wire101 ? wire101 : wire101)))));
          if (((^~{({wire100, wire100} ? (-reg105) : (+(8'hb6)))}) ?
              (^wire101[(1'h0):(1'h0)]) : $unsigned($unsigned(wire100))))
            begin
              reg106 <= $unsigned(($unsigned($unsigned(wire100)) == {((~|wire103) ^ $unsigned(wire100))}));
            end
          else
            begin
              reg106 <= $unsigned($unsigned(({(wire102 ?
                      (8'hbd) : reg105)} + wire100[(3'h6):(1'h0)])));
              reg107 <= ($signed(wire100[(3'h4):(2'h2)]) ?
                  (wire101 ?
                      $signed(wire101) : reg105[(4'he):(4'hd)]) : wire101[(3'h5):(1'h0)]);
              reg108 <= $signed(reg106);
              reg109 <= $signed(((($signed((8'ha5)) <= (wire102 & reg106)) ?
                      $signed((wire99 ? wire102 : reg106)) : {$unsigned(reg107),
                          (reg106 ? wire104 : reg105)}) ?
                  reg105[(4'he):(1'h0)] : reg105[(3'h4):(2'h3)]));
            end
          reg110 <= ($signed((&wire99[(1'h0):(1'h0)])) >> (wire103[(3'h7):(1'h0)] >>> $unsigned(reg105[(3'h4):(1'h0)])));
          reg111 <= {{reg110[(1'h0):(1'h0)]},
              {$unsigned((!wire101[(2'h2):(1'h0)])),
                  (($signed(reg105) ?
                          {reg109, reg108} : reg106[(3'h5):(3'h5)]) ?
                      ($unsigned(wire100) ~^ $signed((8'hbe))) : wire99[(3'h4):(3'h4)])}};
        end
      else
        begin
          reg105 <= $signed($unsigned(($unsigned(reg108[(4'ha):(1'h1)]) != $unsigned((|reg108)))));
          reg106 <= ($signed($signed($signed($signed(wire104)))) <= $unsigned((($signed(wire100) * $signed((8'hac))) ?
              {((8'hbc) ? wire104 : (8'hbe)),
                  (wire102 ? reg111 : (7'h40))} : reg105)));
          reg107 <= ({reg107} <= ((~(8'ha9)) ?
              $signed((reg111 ?
                  $unsigned(wire104) : $unsigned(reg106))) : ((~^$signed(reg105)) ?
                  (wire100[(1'h1):(1'h1)] ?
                      $unsigned((8'ha9)) : (reg111 == wire99)) : ({(7'h42)} ?
                      reg107 : reg107[(4'h8):(3'h5)]))));
          reg108 <= ((8'hb5) ?
              ($unsigned({(reg106 ?
                      wire104 : (8'hb3))}) < reg110[(4'hc):(1'h0)]) : $signed((^~(((8'ha3) << (7'h41)) >= {wire104,
                  reg105}))));
        end
      if (($unsigned(wire104[(3'h4):(3'h4)]) && wire103))
        begin
          reg112 <= $unsigned((8'hbb));
          reg113 <= (~reg110[(3'h4):(1'h0)]);
          reg114 <= (+$unsigned($signed(($signed(reg110) ?
              reg105[(4'h8):(1'h0)] : $signed((8'hbb))))));
          reg115 <= $unsigned($signed(wire102[(4'h8):(4'h8)]));
          reg116 <= (!(reg105 >>> (^~$signed({wire100}))));
        end
      else
        begin
          reg112 <= reg114;
          reg113 <= reg106[(2'h3):(1'h0)];
          reg114 <= $unsigned($signed($unsigned(wire101[(1'h0):(1'h0)])));
          if ((+wire100[(2'h2):(1'h1)]))
            begin
              reg115 <= (($unsigned($signed((+reg110))) | reg111[(4'hf):(1'h1)]) << reg111);
              reg116 <= (^(($unsigned(reg111[(1'h1):(1'h0)]) >= wire103) ?
                  (+$unsigned(reg116)) : $unsigned({(^~wire99)})));
              reg117 <= (-(reg114[(1'h0):(1'h0)] ?
                  (reg115[(3'h5):(1'h1)] ?
                      reg109 : $unsigned((^reg106))) : reg108[(3'h4):(1'h0)]));
              reg118 <= (reg109 ?
                  $signed((+$unsigned((reg108 ?
                      wire99 : (8'hb7))))) : (&reg111));
              reg119 <= reg115[(4'h9):(4'h8)];
            end
          else
            begin
              reg115 <= $unsigned({reg114,
                  {reg112[(3'h4):(1'h0)], reg109[(1'h0):(1'h0)]}});
            end
          if ((((|$unsigned((wire102 < reg113))) || ($signed($signed(reg106)) != (-$signed(reg109)))) + ($signed(($unsigned(wire102) * (reg118 ?
                  reg118 : reg114))) ?
              $unsigned($signed($unsigned(wire104))) : $signed((-$unsigned((8'hb8)))))))
            begin
              reg120 <= (^(wire101[(2'h2):(2'h2)] ?
                  ((~^$unsigned((8'hb1))) || wire104[(3'h6):(2'h2)]) : (~&$signed((~^reg106)))));
              reg121 <= wire104;
            end
          else
            begin
              reg120 <= wire103[(3'h5):(2'h2)];
            end
        end
    end
  assign wire122 = (~&(wire104 ?
                       $signed(reg116) : (^($unsigned(wire99) ?
                           (reg121 << wire104) : (reg118 <<< (8'ha1))))));
  assign wire123 = $signed(((8'haf) ?
                       ((((7'h41) ? (8'hbd) : wire122) ?
                           $unsigned((8'hac)) : (wire122 + reg115)) - reg121[(1'h1):(1'h1)]) : (reg114 != reg109)));
  assign wire124 = $signed({$unsigned((reg120[(5'h11):(2'h3)] ?
                           wire99 : (reg114 ? reg113 : reg106)))});
  assign wire125 = wire123;
  always
    @(posedge clk) begin
      if ((reg118[(2'h2):(1'h1)] ?
          (^~(^wire124[(4'h9):(4'h8)])) : $signed(($signed({reg115}) ?
              $signed((wire101 ? (7'h42) : (8'hb5))) : reg108))))
        begin
          reg126 <= wire123[(4'h8):(3'h4)];
          reg127 <= reg119;
        end
      else
        begin
          reg126 <= (~^(!(reg105 <= ((wire100 ? wire100 : reg118) ?
              $signed(reg117) : (wire100 ^~ reg127)))));
          if ((((!$unsigned($signed(reg120))) ? wire122 : $signed(reg127)) ?
              ({reg115[(1'h1):(1'h1)]} ?
                  {$signed((reg105 ?
                          wire104 : reg106))} : ((^$signed(wire104)) == ((reg106 << wire123) + reg114[(2'h2):(2'h2)]))) : ({((reg120 - reg108) ?
                      (|wire99) : ((8'hb8) ? wire125 : reg113)),
                  $signed(reg118[(1'h0):(1'h0)])} ~^ ((reg113 ?
                  (~reg127) : (^~reg112)) << (8'hb6)))))
            begin
              reg127 <= ({reg109[(3'h4):(3'h4)],
                      $unsigned({(|wire104), (reg111 ? reg116 : reg109)})} ?
                  (~reg118) : wire103);
            end
          else
            begin
              reg127 <= (wire102 ^ $signed($unsigned(wire123)));
              reg128 <= ($signed(reg107) ?
                  wire104 : $signed(reg116[(1'h0):(1'h0)]));
            end
          reg129 <= wire124;
          reg130 <= $signed((&((wire102 ? (!reg105) : (&wire124)) ?
              $signed((reg115 ? reg109 : wire103)) : (reg111[(5'h14):(4'hc)] ?
                  (^~wire123) : $signed((8'ha2))))));
        end
      reg131 <= ($unsigned(((^~(|reg121)) ?
          ((wire104 != reg118) == $unsigned(wire124)) : (~&$unsigned(reg115)))) < (~|{reg110[(4'hc):(3'h4)],
          (|$signed(wire104))}));
      reg132 <= $signed($signed(reg129));
    end
endmodule

module module69
#(parameter param91 = {(+{(((8'hac) ? (7'h42) : (7'h43)) ? ((7'h41) <<< (8'ha2)) : ((8'hae) ? (8'hb3) : (8'hb1)))}), (({(!(8'haf))} << ((~&(8'h9d)) >= (-(8'hbe)))) >= {(((8'haf) <= (8'haf)) ? (|(8'hbd)) : {(7'h43), (8'hb1)}), ((8'ha9) ? {(8'had), (8'hb3)} : ((8'hba) ? (8'hae) : (8'haf)))})}, 
parameter param92 = (((~|(|(param91 ? param91 : param91))) ? (param91 <= (param91 ? (param91 + param91) : param91)) : ({(!param91), (~param91)} << ({param91} && (param91 ~^ (8'hbc))))) || (((param91 ^~ (param91 ? (8'hb6) : param91)) ? param91 : ((param91 ? (8'ha1) : param91) | (&(8'hb7)))) & ((param91 ? {param91} : (~|param91)) <= (~^((8'hb9) ^ param91))))))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire74;
  input wire signed [(4'hd):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire75;
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  assign y = {wire90,
                 wire75,
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
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire75 = (!$unsigned($signed(($unsigned((8'hb3)) ~^ $unsigned(wire74)))));
  always
    @(posedge clk) begin
      reg76 <= $signed($unsigned(((~$unsigned(wire70)) ?
          (((8'hb6) >>> wire75) | (wire73 ?
              wire73 : wire75)) : wire70[(3'h4):(2'h2)])));
    end
  always
    @(posedge clk) begin
      if ((-(7'h41)))
        begin
          reg77 <= {wire71, wire70};
          if ((^(reg76 ?
              (({wire70, wire75} + $signed(wire75)) ?
                  reg76 : $unsigned((wire75 ? wire75 : reg77))) : reg77)))
            begin
              reg78 <= reg77;
              reg79 <= wire73;
              reg80 <= (7'h40);
            end
          else
            begin
              reg78 <= $signed(reg78);
              reg79 <= (~&$signed($signed((~^(reg79 ? wire73 : wire71)))));
              reg80 <= {$signed((-(^~reg78))),
                  ((~(!(reg79 ? wire72 : wire75))) ?
                      wire70[(1'h1):(1'h1)] : (~$signed((wire71 ?
                          wire73 : wire71))))};
            end
        end
      else
        begin
          reg77 <= $unsigned($unsigned((|{$signed(wire74)})));
          reg78 <= reg80;
          if ((-$signed(($unsigned((^reg77)) ?
              (~&{reg80}) : $unsigned((~wire75))))))
            begin
              reg79 <= ($signed({wire74}) ?
                  (^wire70[(2'h2):(1'h1)]) : $unsigned({(wire74 ?
                          wire72 : reg77)}));
              reg80 <= $unsigned((~&reg78));
              reg81 <= ((~|$signed((-((8'ha0) ? reg76 : wire73)))) ?
                  $unsigned($unsigned((reg77 ?
                      (wire75 >>> reg78) : (&reg76)))) : $signed(wire73));
              reg82 <= {(($unsigned($unsigned(wire74)) > wire74) ?
                      wire70[(3'h5):(3'h4)] : $unsigned((8'h9c))),
                  wire71[(3'h6):(3'h5)]};
              reg83 <= (-$unsigned((^{$unsigned((8'hb2)), (8'haa)})));
            end
          else
            begin
              reg79 <= {reg77[(4'h8):(1'h1)]};
              reg80 <= (|(~|$signed((&{wire74, (8'haf)}))));
              reg81 <= $unsigned(($signed($unsigned($unsigned((8'ha8)))) >> ((|((8'hb5) < reg81)) != {$unsigned(reg80)})));
              reg82 <= $signed($signed(((~^((8'hb0) >>> reg77)) == (!$signed(reg80)))));
            end
          reg84 <= wire71;
          reg85 <= $signed(wire75[(1'h1):(1'h1)]);
        end
      if (($signed((($signed(reg85) ? wire74 : $signed(reg79)) ~^ {(reg82 ?
              wire72 : wire72)})) >= reg77[(3'h5):(2'h2)]))
        begin
          reg86 <= reg85[(4'ha):(2'h2)];
          reg87 <= $unsigned(wire75[(2'h3):(2'h3)]);
        end
      else
        begin
          reg86 <= $signed(wire75);
        end
      reg88 <= (!$unsigned((^(~reg86[(4'ha):(1'h0)]))));
      reg89 <= $unsigned((~|$unsigned($signed($signed(reg80)))));
    end
  assign wire90 = wire72;
endmodule

module module15
#(parameter param66 = (((({(8'ha1)} < {(8'hbf), (8'ha9)}) && {((8'h9f) ? (8'ha5) : (8'hb6)), ((8'ha0) ? (8'hbb) : (8'hbd))}) ~^ ({((8'ha1) <= (8'ha1))} - (((8'hac) > (8'hb4)) ? ((8'hb4) <= (8'h9f)) : ((8'hb3) >>> (8'hbb))))) ? {(~|{{(8'hb7), (8'ha2)}, ((8'ha8) ? (8'ha2) : (8'h9e))}), ({(~|(8'hbc))} ? ((-(8'ha7)) || ((8'hba) || (8'hb8))) : (~|((8'ha4) ~^ (8'had))))} : {(((|(8'hbf)) >> (8'ha4)) >> ({(8'hb0)} ^ ((8'ha4) << (8'ha0))))}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h28a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire signed [(4'ha):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire22,
                 wire21,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
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
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire21 = {{wire19[(1'h0):(1'h0)],
                          ((^~wire18) ? wire16 : wire19[(2'h3):(1'h1)])}};
  assign wire22 = $signed(wire21[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg23 <= $unsigned((($signed(wire21[(1'h1):(1'h0)]) >> wire22[(1'h0):(1'h0)]) <<< $unsigned($unsigned(wire19))));
      if (((wire19 >> reg23[(4'he):(3'h5)]) ?
          $unsigned({((~&wire19) ? $signed(wire21) : wire21),
              wire20[(1'h0):(1'h0)]}) : {((&$unsigned((8'hb4))) ?
                  ($unsigned(wire18) ?
                      $unsigned(wire20) : {reg23}) : (~^(wire19 >= wire18))),
              $unsigned(wire22[(1'h1):(1'h0)])}))
        begin
          reg24 <= wire20[(2'h2):(2'h2)];
          if ($unsigned({$unsigned({$unsigned(wire21), (wire18 >= wire21)}),
              ($signed((!reg24)) ?
                  (~|reg24) : $signed((wire19 ? wire17 : reg23)))}))
            begin
              reg25 <= (((~$signed((wire17 <<< reg24))) + ((!reg23[(3'h4):(2'h3)]) && $unsigned((wire19 ?
                  wire16 : wire20)))) && wire21);
              reg26 <= ((7'h44) ^ wire20);
              reg27 <= (-reg24);
              reg28 <= wire17;
            end
          else
            begin
              reg25 <= (wire20 ?
                  $unsigned((~|$signed((reg26 <= wire20)))) : $unsigned(wire20));
              reg26 <= (~|$signed($unsigned(((reg27 ?
                  wire21 : wire21) && {(8'ha1)}))));
              reg27 <= (((wire17[(5'h14):(4'hb)] <= ((reg23 ? wire21 : reg24) ?
                          (^(7'h42)) : $signed(reg26))) ?
                      ({{wire16, reg28}} ?
                          reg23[(5'h13):(4'ha)] : (wire21[(1'h0):(1'h0)] ~^ wire19[(3'h4):(2'h2)])) : reg27) ?
                  $unsigned($signed(((|wire20) ?
                      (reg24 & wire17) : $signed(reg24)))) : wire17[(3'h6):(3'h4)]);
            end
          reg29 <= (wire18 < $unsigned({(8'haa), reg27}));
          if (wire16)
            begin
              reg30 <= (+reg27[(3'h7):(3'h6)]);
              reg31 <= $unsigned($unsigned(reg26[(4'hf):(4'hc)]));
              reg32 <= ($signed((wire18[(2'h3):(1'h0)] ?
                      ((wire16 ? reg31 : reg26) - {wire20,
                          (8'hb9)}) : $signed((~|wire19)))) ?
                  wire20 : $unsigned((8'h9e)));
            end
          else
            begin
              reg30 <= (-$unsigned(reg30[(4'h9):(4'h8)]));
            end
        end
      else
        begin
          if ($signed({reg28[(3'h7):(2'h2)],
              (((wire22 ? reg30 : reg27) > (-reg23)) - wire22[(2'h2):(1'h0)])}))
            begin
              reg24 <= {wire21[(1'h1):(1'h0)], wire21[(2'h2):(2'h2)]};
              reg25 <= $unsigned((^{$unsigned(wire16[(1'h0):(1'h0)])}));
              reg26 <= {reg23[(5'h11):(3'h7)]};
            end
          else
            begin
              reg24 <= reg29[(3'h6):(3'h4)];
              reg25 <= {$signed($signed(reg26[(3'h5):(2'h2)])),
                  ({((wire17 >>> wire18) ? (8'hba) : reg31),
                          {((8'ha9) ? reg29 : (8'hb9)), (wire17 != wire19)}} ?
                      $signed((7'h44)) : $signed(({wire20,
                          wire22} ~^ (&(8'hab)))))};
              reg26 <= reg32[(3'h4):(2'h3)];
              reg27 <= $unsigned(($unsigned(wire18[(4'ha):(3'h4)]) != (~&reg30)));
              reg28 <= ($unsigned((&reg30)) && $unsigned((reg23 || $unsigned($unsigned(wire18)))));
            end
          reg29 <= (~|$signed({{((8'hb8) << wire16), $unsigned(wire21)},
              wire20[(4'hc):(3'h5)]}));
          reg30 <= {reg27[(1'h0):(1'h0)],
              ($signed(((wire21 ? reg30 : reg32) ?
                      (reg28 ? reg26 : reg27) : (wire21 == reg23))) ?
                  $signed((~&$unsigned((8'hbb)))) : reg26)};
        end
      if ({(+$signed(reg27))})
        begin
          reg33 <= (&($signed(((~&reg30) > (reg29 + wire18))) ?
              ((-(wire17 ? wire19 : wire16)) ?
                  {(reg32 ?
                          reg26 : reg31)} : $unsigned({reg24})) : $signed(($signed(reg32) ?
                  {reg25} : (8'ha7)))));
          reg34 <= (|$unsigned({reg29,
              (reg26[(4'hc):(4'ha)] ? reg33 : (wire17 >= reg27))}));
          reg35 <= reg34;
          if ($signed(reg33))
            begin
              reg36 <= ($signed(($unsigned((!reg30)) ?
                      {reg28[(2'h2):(1'h1)]} : ($signed(reg26) ?
                          reg31[(4'hb):(1'h1)] : $signed(reg31)))) ?
                  $signed($signed(((-reg25) ?
                      $unsigned(reg28) : $signed((8'hbf))))) : {$signed((8'haa))});
              reg37 <= {{reg28[(3'h7):(1'h0)],
                      $signed(({reg36} ?
                          $unsigned(reg32) : wire16[(2'h2):(1'h0)]))}};
              reg38 <= $signed($unsigned({$signed($unsigned((8'ha5)))}));
              reg39 <= $unsigned(($signed((^reg33)) ?
                  ($signed((wire22 ?
                      (8'hbf) : reg38)) * $signed((~|wire22))) : {$unsigned((reg31 ?
                          wire20 : wire19))}));
              reg40 <= ($signed((reg32[(2'h2):(2'h2)] ?
                  {$signed(reg25)} : (-reg35[(4'hb):(4'hb)]))) >= (~^((reg37 + (-wire19)) ?
                  ((~^(8'h9e)) ?
                      (wire17 ?
                          (7'h41) : reg25) : $signed(reg37)) : $signed(reg30[(4'hf):(4'hd)]))));
            end
          else
            begin
              reg36 <= {reg34};
              reg37 <= reg36;
            end
          reg41 <= $signed({(^(-$unsigned(reg25)))});
        end
      else
        begin
          if (($unsigned((!$signed((wire22 ? reg25 : wire18)))) ?
              reg35[(4'hd):(2'h3)] : $unsigned({(8'ha9),
                  reg26[(1'h1):(1'h0)]})))
            begin
              reg33 <= (!(($signed($signed(wire21)) ?
                      wire17 : ((^~wire16) <<< {wire16})) ?
                  ($unsigned($signed(reg28)) ~^ (8'hb4)) : $unsigned((^~(reg41 != (8'hba))))));
            end
          else
            begin
              reg33 <= reg41;
              reg34 <= (reg31 >>> (~|($unsigned($signed(reg39)) - (reg27[(3'h4):(1'h0)] >> (reg25 ?
                  reg32 : wire16)))));
              reg35 <= reg31;
              reg36 <= reg40[(5'h10):(2'h2)];
              reg37 <= (({$signed($signed(reg35))} * wire22[(2'h2):(1'h0)]) ^~ (^(reg39[(3'h4):(1'h0)] ?
                  {$signed(wire20)} : (&reg41))));
            end
          reg38 <= $signed(((~^$signed(((8'ha7) ?
              (8'ha0) : wire19))) >> (~reg29[(5'h13):(4'ha)])));
          if (((($signed($signed(reg31)) * {$signed((8'hb2)),
                  $signed(reg28)}) >= (&$signed(reg23))) ?
              $unsigned($unsigned(($unsigned(wire20) ?
                  (wire16 ?
                      reg24 : reg29) : (wire21 || wire20)))) : (^~$signed(($signed((8'hb6)) ^~ (reg41 ?
                  reg32 : reg31))))))
            begin
              reg39 <= (reg35[(4'ha):(3'h4)] ?
                  (&(~{{(8'ha4), reg34}})) : (^(+$signed($signed(wire19)))));
              reg40 <= $signed(reg26[(2'h3):(2'h3)]);
            end
          else
            begin
              reg39 <= (|(wire16 >= reg37[(2'h3):(1'h0)]));
              reg40 <= (reg31[(4'ha):(3'h6)] - $unsigned($signed($unsigned(reg35[(3'h5):(3'h5)]))));
            end
          reg41 <= (($signed($signed(((8'hb8) & reg25))) ?
              ($unsigned((reg25 ?
                  (7'h43) : reg37)) << (^(reg27 + reg28))) : ((~{wire16}) ?
                  wire18 : (-reg41[(1'h0):(1'h0)]))) | ((((~&wire19) >= wire16[(3'h6):(3'h5)]) ?
              ((reg25 ? wire18 : reg27) & (wire22 ?
                  reg29 : (8'ha6))) : ((8'ha0) < wire20)) - $signed(reg38[(2'h2):(1'h0)])));
        end
      reg42 <= (~^$unsigned(((~|(+reg31)) && reg33[(3'h4):(2'h2)])));
    end
  assign wire43 = (&reg28);
  assign wire44 = $signed(wire22);
  assign wire45 = wire43;
  assign wire46 = (reg39[(3'h6):(1'h1)] ?
                      $signed((^~(((8'h9e) ? reg23 : (8'hb5)) ?
                          (~wire18) : (-reg32)))) : {wire21[(1'h1):(1'h0)]});
  always
    @(posedge clk) begin
      reg47 <= ($signed(reg33) ^~ wire21);
      reg48 <= reg41[(4'h9):(1'h0)];
      if (reg28[(4'hb):(1'h0)])
        begin
          if (reg28)
            begin
              reg49 <= {$unsigned($unsigned($unsigned($signed(reg30))))};
              reg50 <= $signed(($signed(((-wire22) < $unsigned(reg39))) ?
                  $signed($signed((8'hac))) : ((((8'hb7) * reg47) ?
                      reg29 : reg34[(1'h1):(1'h0)]) - (reg26[(5'h11):(3'h4)] ^~ (reg31 ?
                      reg47 : wire44)))));
              reg51 <= (^$signed(reg39[(2'h2):(2'h2)]));
              reg52 <= reg36[(4'hd):(1'h0)];
              reg53 <= reg30[(5'h12):(1'h1)];
            end
          else
            begin
              reg49 <= ($unsigned((reg29[(1'h1):(1'h1)] ?
                      ((wire17 ~^ reg29) && reg28) : wire22)) ?
                  (!$unsigned($unsigned((reg50 || reg35)))) : reg31[(4'ha):(1'h1)]);
              reg50 <= $unsigned(($unsigned((wire16 ?
                  $unsigned(wire46) : reg32[(3'h7):(1'h0)])) >>> reg48));
              reg51 <= wire44;
              reg52 <= $signed($unsigned($unsigned(reg31)));
            end
        end
      else
        begin
          if ($signed((^~$signed(wire20[(3'h6):(2'h2)]))))
            begin
              reg49 <= $signed((reg29 ? reg26 : reg36));
              reg50 <= ((reg27[(1'h1):(1'h0)] <= $signed($unsigned((8'ha4)))) ?
                  ((reg49[(5'h13):(4'ha)] ?
                          reg25[(2'h2):(2'h2)] : ((~^reg25) ?
                              (reg47 | reg40) : $unsigned(wire22))) ?
                      $unsigned((|$signed(wire18))) : ({(wire16 >> reg27)} ?
                          (&{(8'hbb), reg34}) : $signed(((8'ha9) ?
                              (8'h9f) : (8'hbc))))) : $signed(wire44));
              reg51 <= wire17[(1'h0):(1'h0)];
            end
          else
            begin
              reg49 <= ((reg50[(3'h5):(1'h1)] ?
                  wire44 : $unsigned(((~&wire45) ?
                      $signed((8'hb1)) : reg41))) << (|reg29[(5'h10):(4'h8)]));
            end
          reg52 <= $unsigned({(^~reg39[(2'h2):(2'h2)])});
          reg53 <= $signed($signed((~|((wire44 ? (8'haf) : wire43) ?
              $unsigned(wire20) : reg35))));
        end
    end
  assign wire54 = {({(&((7'h42) ? reg28 : wire22)),
                          wire17} == reg32[(5'h11):(2'h3)])};
  assign wire55 = $unsigned((|(($signed(wire20) & $signed(reg51)) ?
                      ((wire54 ?
                          reg26 : reg24) >>> (~reg37)) : $unsigned($signed(reg51)))));
  assign wire56 = (wire17[(5'h14):(2'h2)] ?
                      wire21[(2'h2):(1'h1)] : (((~(~&reg29)) > (8'ha0)) ?
                          $signed((reg38 ?
                              $unsigned(wire20) : ((8'ha7) & reg48))) : reg24[(3'h6):(3'h4)]));
  assign wire57 = $signed(($signed(($unsigned(reg50) == (~&(7'h41)))) ?
                      ((wire19 || (reg25 | reg34)) * (~&(reg27 || (7'h44)))) : wire17[(3'h4):(1'h0)]));
  assign wire58 = wire43[(4'h8):(2'h2)];
  assign wire59 = $signed({((!{wire46}) | $unsigned($signed(reg34))),
                      (^($signed(reg34) ?
                          (reg32 ? reg48 : (8'ha2)) : (^(7'h43))))});
  assign wire60 = wire22[(1'h0):(1'h0)];
  assign wire61 = (reg24 ~^ reg40[(3'h4):(2'h2)]);
  assign wire62 = ((((!$unsigned(reg52)) ? reg23 : reg29) ?
                      wire58[(3'h5):(1'h1)] : reg52) & reg27[(1'h0):(1'h0)]);
  assign wire63 = {(({(^reg29)} ?
                          wire56[(3'h7):(3'h6)] : wire57[(4'hd):(4'h8)]) << $unsigned({wire62,
                          (wire17 ? reg24 : (8'hb7))})),
                      (-(|((reg25 ? wire54 : wire17) ?
                          reg50[(1'h0):(1'h0)] : (reg34 ? reg36 : reg53))))};
  assign wire64 = {(8'haa)};
  assign wire65 = (~(reg25 | ($unsigned((reg38 ? wire21 : reg30)) ?
                      reg42[(3'h7):(3'h6)] : reg47)));
endmodule
