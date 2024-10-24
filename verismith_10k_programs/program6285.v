module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(2'h3):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  assign y = {wire128,
                 wire126,
                 wire125,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire90,
                 wire88,
                 wire5,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg127,
                 (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  module6 #() modinst89 (.wire8(wire3), .clk(clk), .wire10(wire0), .wire9(wire4), .y(wire88), .wire7(wire1));
  assign wire90 = (8'ha2);
  module91 #() modinst118 (.y(wire117), .wire95(wire0), .wire92(wire2), .clk(clk), .wire94(wire3), .wire93(wire4));
  assign wire119 = ((~(&((wire88 | wire90) <<< ((8'ha7) << wire1)))) && $unsigned(wire3));
  assign wire120 = wire117[(3'h4):(2'h3)];
  assign wire121 = wire2;
  assign wire122 = ((((wire119[(3'h7):(3'h6)] == {wire88}) ?
                               (wire2[(2'h2):(1'h0)] >> (wire4 ?
                                   wire117 : wire90)) : wire88) ?
                           $unsigned(wire88[(1'h1):(1'h1)]) : (wire3 ?
                               $signed({(8'had), wire3}) : wire0)) ?
                       $unsigned($unsigned((~$signed(wire120)))) : {$unsigned((^~wire119[(4'ha):(2'h2)]))});
  module12 #() modinst124 (.wire15(wire90), .y(wire123), .wire14(wire122), .wire13(wire2), .clk(clk), .wire16(wire0));
  assign wire125 = (8'hbf);
  assign wire126 = {(^~((^~wire4[(4'hd):(3'h6)]) ?
                           wire121[(3'h7):(2'h3)] : $signed(wire123[(4'hf):(2'h2)])))};
  always
    @(posedge clk) begin
      reg127 <= ($unsigned((8'ha9)) ?
          (((!(~&wire126)) < wire122[(5'h11):(4'h8)]) ?
              $unsigned(wire126[(2'h2):(2'h2)]) : {((+wire126) >> $unsigned(wire123)),
                  (~^(wire88 ^~ wire119))}) : (+({(wire0 ?
                  wire4 : wire120)} >>> wire4[(1'h0):(1'h0)])));
    end
  assign wire128 = $unsigned(wire5);
  always
    @(posedge clk) begin
      reg129 <= wire128[(1'h1):(1'h1)];
      if (((&{$unsigned($signed(wire88)), ((+wire119) ^ $unsigned(wire121))}) ?
          $unsigned({(~|(wire2 ? wire2 : wire119)),
              $unsigned({wire117, wire120})}) : (|wire128[(1'h0):(1'h0)])))
        begin
          if (wire120[(2'h3):(2'h2)])
            begin
              reg130 <= $unsigned($signed((-wire128)));
              reg131 <= wire121;
              reg132 <= ($unsigned(wire117[(3'h7):(3'h5)]) > (wire0[(3'h6):(2'h3)] ^~ $signed(wire3[(4'he):(1'h1)])));
              reg133 <= (~|wire123);
              reg134 <= (reg132[(1'h1):(1'h0)] ?
                  ({$signed(reg132)} ?
                      $unsigned($unsigned(wire125[(1'h1):(1'h0)])) : (wire123[(4'hc):(4'ha)] || (~$unsigned(wire2)))) : wire128);
            end
          else
            begin
              reg130 <= {(8'hbe)};
              reg131 <= $unsigned($signed(($unsigned(wire1) ?
                  $unsigned(wire119) : ((wire4 - reg134) ?
                      wire122 : (reg130 ? wire90 : (8'had))))));
              reg132 <= ((reg132 ?
                      reg129[(1'h1):(1'h1)] : {$unsigned((7'h42))}) ?
                  reg127 : $unsigned(reg133[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg130 <= wire125[(1'h0):(1'h0)];
          reg131 <= (((((~&wire4) && (~|wire0)) || wire3[(4'hd):(3'h6)]) > (^~$signed($signed(reg131)))) - (~&reg133));
          reg132 <= wire88;
        end
      reg135 <= $signed($signed((wire0 ?
          wire5[(2'h2):(1'h0)] : wire88[(2'h3):(2'h3)])));
    end
  always
    @(posedge clk) begin
      if (reg134[(2'h3):(1'h1)])
        begin
          reg136 <= ((&$unsigned((!(wire88 ? wire123 : (8'hb7))))) ?
              {{reg132[(2'h3):(2'h2)]},
                  ($unsigned(wire119) >> (wire88 ?
                      (~wire126) : (reg130 > reg129)))} : wire125);
          reg137 <= (reg135 + ($signed(({reg135, (7'h43)} ?
                  (wire0 ? (8'hae) : wire2) : {wire88, reg127})) ?
              $signed({(wire88 ? wire120 : reg132)}) : (~&wire122)));
          reg138 <= {wire4};
          if ($unsigned((wire120[(2'h2):(2'h2)] ?
              ((reg130 >> reg137[(1'h0):(1'h0)]) ?
                  (wire126 ?
                      wire117[(1'h1):(1'h0)] : (reg134 + wire0)) : wire121[(2'h2):(1'h1)]) : {(8'hb8),
                  wire3})))
            begin
              reg139 <= wire3[(5'h15):(2'h2)];
            end
          else
            begin
              reg139 <= wire2;
            end
        end
      else
        begin
          if (wire123[(4'h9):(2'h3)])
            begin
              reg136 <= $signed({reg139[(2'h2):(1'h0)]});
              reg137 <= {wire117, wire3[(5'h15):(5'h13)]};
              reg138 <= $signed(wire123);
            end
          else
            begin
              reg136 <= (8'haa);
              reg137 <= (wire123 ?
                  {(wire125[(3'h4):(2'h3)] ?
                          wire117[(4'h9):(2'h3)] : (reg134[(3'h5):(3'h4)] ^ (reg138 ?
                              reg130 : (8'hb1))))} : {((wire0 ?
                          wire125[(2'h3):(2'h2)] : ((7'h40) >= wire90)) >> (reg130 ?
                          {reg134, reg138} : (+wire117)))});
              reg138 <= $unsigned({wire120,
                  ($unsigned(reg139[(3'h7):(3'h6)]) ^ (((8'h9f) << wire0) ?
                      (wire88 ? wire123 : wire90) : $unsigned(reg129)))});
              reg139 <= ($signed((-$signed($signed(reg127)))) ?
                  (&$signed(wire2)) : (((~^(^~wire119)) ~^ $signed($signed(wire90))) >>> wire5));
            end
          if (reg129)
            begin
              reg140 <= wire128[(3'h4):(1'h0)];
            end
          else
            begin
              reg140 <= (8'hbf);
              reg141 <= $signed(reg135[(1'h1):(1'h0)]);
              reg142 <= {$signed((~|wire0[(3'h7):(3'h7)]))};
              reg143 <= {$signed(wire1)};
            end
          reg144 <= wire90;
        end
      reg145 <= ((reg131 + wire0) != (reg138 ?
          (^wire123) : wire5[(1'h0):(1'h0)]));
    end
endmodule

module module91  (y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire95;
  input wire signed [(5'h15):(1'h0)] wire94;
  input wire signed [(5'h11):(1'h0)] wire93;
  input wire signed [(5'h12):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire107;
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire107,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  module96 #() modinst108 (wire107, clk, wire94, wire95, wire92, wire93, (8'ha1));
  always
    @(posedge clk) begin
      reg109 <= wire94[(3'h6):(1'h0)];
      reg110 <= {(wire92 ~^ wire94), wire107};
      if (((reg109 ?
              (~^$signed({wire95})) : (!$signed((wire94 ? wire93 : (8'ha1))))) ?
          $unsigned($signed(wire107)) : reg110[(2'h2):(1'h0)]))
        begin
          reg111 <= (^(^wire95[(2'h3):(1'h0)]));
          reg112 <= (~|wire94[(3'h7):(3'h6)]);
          reg113 <= ({$unsigned($signed((^~reg109))),
                  $signed(wire92[(3'h7):(3'h7)])} ?
              (+$unsigned((wire94[(2'h2):(1'h1)] ?
                  wire92 : (^wire95)))) : $unsigned({($signed(wire93) ?
                      wire107 : (reg112 >= wire93)),
                  (~^$signed(wire93))}));
          reg114 <= {$signed($signed(($signed(reg109) <= reg109[(2'h3):(1'h1)])))};
        end
      else
        begin
          reg111 <= $signed(reg112[(1'h1):(1'h1)]);
        end
    end
  assign wire115 = wire92;
  assign wire116 = $signed((~wire107));
endmodule

module module6
#(parameter param87 = (((((~&(8'hb1)) ? (^~(8'h9f)) : (~(7'h43))) ~^ (~^(~(8'h9f)))) == ((((8'ha0) != (8'hb0)) << (|(8'hbd))) * {(&(8'hb2))})) || {(^(^(-(8'ha6)))), {(((8'h9f) ? (8'hb8) : (8'ha1)) ? ((8'ha2) & (8'ha4)) : (~|(8'haa)))}}))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire67;
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  assign y = {wire86,
                 wire84,
                 wire83,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire70,
                 wire11,
                 wire53,
                 wire67,
                 reg85,
                 reg82,
                 reg81,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg69,
                 (1'h0)};
  assign wire11 = (~^(8'ha9));
  module12 #() modinst54 (.wire13(wire10), .wire14(wire7), .wire15(wire11), .wire16(wire8), .clk(clk), .y(wire53));
  module55 #() modinst68 (.wire58(wire10), .wire56(wire53), .clk(clk), .y(wire67), .wire57(wire7), .wire60(wire9), .wire59(wire8));
  always
    @(posedge clk) begin
      reg69 <= ((^wire9[(1'h1):(1'h1)]) == $unsigned((!{$unsigned((7'h40))})));
    end
  assign wire70 = wire53;
  always
    @(posedge clk) begin
      if ($signed(reg69))
        begin
          reg71 <= reg69;
          reg72 <= reg71;
          reg73 <= (&((^~$unsigned(reg72)) > $signed($unsigned(reg72[(2'h3):(1'h1)]))));
          reg74 <= wire9[(4'hd):(4'hc)];
          reg75 <= wire70[(4'he):(3'h5)];
        end
      else
        begin
          reg71 <= (7'h41);
          reg72 <= wire53;
        end
      reg76 <= (!((!$unsigned(wire9[(4'h8):(3'h6)])) ?
          (8'hab) : $unsigned($unsigned($signed(reg74)))));
    end
  assign wire77 = (((~^(8'haf)) >= (((^wire53) ?
                      reg76 : $unsigned(wire11)) ^~ wire7[(4'h8):(3'h4)])) >>> $unsigned((wire7 << $unsigned(reg69))));
  assign wire78 = $signed((|wire7[(4'h8):(3'h7)]));
  assign wire79 = $unsigned($unsigned(wire78));
  assign wire80 = $unsigned(wire77[(4'ha):(1'h1)]);
  always
    @(posedge clk) begin
      reg81 <= $unsigned((wire7 ?
          (&wire53[(2'h3):(1'h1)]) : (reg74 ? wire10 : wire79)));
      reg82 <= ($unsigned((7'h41)) ? reg73 : reg74[(1'h1):(1'h0)]);
    end
  assign wire83 = {(8'hb8), (~^reg81[(1'h0):(1'h0)])};
  assign wire84 = (^(($signed($signed(wire8)) < wire53) ?
                      $unsigned(wire79) : $signed(((reg72 && reg75) - {wire70}))));
  always
    @(posedge clk) begin
      reg85 <= (~^(wire8 | wire83));
    end
  assign wire86 = ((!((~$signed(reg72)) & ((wire7 ?
                          wire79 : wire9) | ((8'hbc) >> reg72)))) ?
                      (~^{$signed($signed(reg85)),
                          wire10[(1'h0):(1'h0)]}) : ((|$signed(reg82[(4'hd):(4'h9)])) >>> {wire70,
                          reg81[(4'ha):(3'h5)]}));
endmodule

module module55
#(parameter param66 = {(((8'haf) ? (((8'hb8) < (8'ha1)) ? ((8'hb0) < (8'hbe)) : (~|(8'hb6))) : (((8'ha7) ^~ (8'ha3)) * ((8'ha2) + (8'ha1)))) || ({(^(8'hb4))} - (((8'hb1) ? (8'hb1) : (7'h42)) ? ((8'hbc) ? (8'hb9) : (8'hae)) : ((8'h9d) ? (8'hb0) : (8'hbf))))), (((((8'hb6) ? (8'hb0) : (8'hab)) ~^ ((8'hb1) ? (8'h9c) : (8'ha8))) ? ((!(8'hb9)) <= ((7'h43) ? (8'ha8) : (8'hae))) : {(|(8'h9d)), ((8'ha2) ^ (8'hb0))}) ? ({((7'h41) >>> (8'ha0)), (~^(7'h40))} > (((8'haf) ? (7'h42) : (8'had)) ? (~(8'hbe)) : (+(8'hbe)))) : ((~^(-(8'had))) ? ((~|(8'hb9)) ? ((8'hab) || (8'ha2)) : ((8'ha2) ? (7'h43) : (8'hbb))) : ((!(8'hb4)) && ((7'h43) << (8'hbb)))))})
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire60;
  input wire signed [(5'h15):(1'h0)] wire59;
  input wire [(2'h3):(1'h0)] wire58;
  input wire [(4'h9):(1'h0)] wire57;
  input wire [(4'h9):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  assign y = {wire65, wire64, wire63, wire62, wire61, (1'h0)};
  assign wire61 = (wire60[(3'h4):(1'h1)] ?
                      (wire59 ^~ $signed(wire57[(1'h1):(1'h1)])) : (+(wire59[(4'hf):(4'he)] >> {(wire59 << (8'hb5))})));
  assign wire62 = $signed((wire59 ? (^($signed(wire59) || wire60)) : wire61));
  assign wire63 = (|wire59);
  assign wire64 = (|({$signed(((8'hba) >>> wire56)),
                          $unsigned($unsigned((8'ha9)))} ?
                      (~($unsigned(wire56) ?
                          wire62 : (wire59 ?
                              wire59 : wire59))) : (((^wire58) >>> (wire62 ?
                              wire63 : wire61)) ?
                          $unsigned(wire59) : wire58)));
  assign wire65 = ({{$signed((wire57 == wire62)), wire57},
                      (($unsigned(wire63) ^~ wire59[(4'h8):(3'h5)]) <= $unsigned(((8'h9e) ?
                          (8'had) : wire58)))} * ($signed(({wire58} ?
                          (wire62 ? wire60 : wire63) : (8'ha8))) ?
                      ($unsigned(wire62[(3'h7):(3'h7)]) ?
                          $signed($signed(wire64)) : wire56) : (&wire63[(4'hc):(4'hc)])));
endmodule

module module12
#(parameter param51 = ((^(-({(8'ha5), (8'hb7)} ? ((8'hae) > (8'hb5)) : ((8'ha2) ? (8'hb4) : (8'hbd))))) > (((+(~^(8'hb7))) ? {((8'ha1) ? (8'ha8) : (7'h40)), {(8'ha8), (8'ha6)}} : {((7'h44) ^~ (8'hbd))}) ? {((7'h43) ? ((8'haa) ~^ (8'hb2)) : ((8'ha7) * (8'hab))), (((8'ha9) <<< (8'hb0)) - (^(8'hba)))} : ((8'hbc) ? (~|((8'ha4) ^ (8'ha0))) : (~|(^~(8'ha9)))))), 
parameter param52 = (param51 >>> ({(((8'h9f) ? (8'ha6) : param51) <= (param51 ? param51 : param51))} <= (~|(^~param51)))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire17;
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire17,
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
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire17 = wire14;
  always
    @(posedge clk) begin
      reg18 <= wire13;
      reg19 <= $signed(wire17[(3'h6):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg20 <= $signed(wire16[(1'h0):(1'h0)]);
      reg21 <= (($signed(wire14[(2'h2):(1'h1)]) && ((|(~wire17)) ?
          wire14[(2'h2):(1'h1)] : ($unsigned(wire13) ?
              wire13[(3'h5):(3'h5)] : {(8'haf),
                  reg18}))) - ($unsigned((&(+reg19))) + (($signed((8'hbf)) ?
              (~&reg19) : (wire13 ^~ wire16)) ?
          (reg20 ? (!wire15) : (wire17 ? wire13 : wire16)) : {wire13,
              reg20[(2'h3):(1'h0)]})));
      reg22 <= (8'h9d);
      if (wire15[(2'h2):(2'h2)])
        begin
          reg23 <= $unsigned(((8'hb7) == (reg20[(4'h9):(4'h9)] ?
              reg22 : ((8'hb8) ? $unsigned(wire13) : $signed(reg18)))));
        end
      else
        begin
          if ($signed($unsigned($signed(((~reg21) >= (wire17 | (8'hbd)))))))
            begin
              reg23 <= (!({$unsigned($unsigned(reg21)),
                  $signed((wire14 ? wire16 : wire17))} >> (+((reg20 << reg19) ?
                  $signed(reg19) : $unsigned(reg18)))));
              reg24 <= (8'hbc);
              reg25 <= $unsigned((reg18 * $unsigned(($signed(wire15) ?
                  $unsigned(reg20) : $unsigned((8'ha7))))));
              reg26 <= (reg21[(4'h8):(3'h6)] && ((((wire14 ? reg22 : (8'ha8)) ?
                  (~^reg22) : (reg22 | reg25)) ^ ({wire15, reg25} ?
                  (^~(8'ha9)) : wire17)) * ((wire17 & reg25) << wire14[(3'h4):(1'h1)])));
              reg27 <= $unsigned(wire14);
            end
          else
            begin
              reg23 <= ($unsigned(reg22) && {$signed(reg19[(2'h2):(1'h1)])});
              reg24 <= $signed({((+(reg25 * reg22)) <= $signed($unsigned(reg24)))});
            end
          reg28 <= $unsigned($signed((({reg24,
              (8'hb7)} <<< wire15[(3'h5):(3'h4)]) != ((wire13 ?
              reg22 : wire14) ~^ (|reg22)))));
          reg29 <= $unsigned(reg18[(2'h2):(1'h0)]);
        end
    end
  assign wire30 = reg28[(1'h1):(1'h1)];
  assign wire31 = $signed(wire17[(1'h0):(1'h0)]);
  assign wire32 = (8'haa);
  assign wire33 = ($signed(wire31[(3'h4):(1'h0)]) << $unsigned($unsigned((^(reg18 != wire14)))));
  assign wire34 = (-{reg20[(4'hf):(4'hc)]});
  always
    @(posedge clk) begin
      reg35 <= $unsigned(reg21);
    end
  always
    @(posedge clk) begin
      if (reg20)
        begin
          reg36 <= reg26;
        end
      else
        begin
          reg36 <= (((((wire34 ? (8'ha3) : wire17) ?
                      $signed(wire15) : ((8'had) ?
                          reg29 : wire31)) - wire34[(2'h3):(1'h1)]) ?
                  reg23 : reg21[(4'hc):(1'h1)]) ?
              {reg35,
                  (wire33[(3'h6):(3'h5)] - (8'haf))} : $signed($signed(reg19)));
          reg37 <= (|$unsigned(($signed((reg27 ? reg27 : reg21)) ?
              $unsigned(((8'hac) ? reg20 : reg19)) : (+$signed(reg19)))));
          reg38 <= (((($signed((8'hb6)) ? (~reg24) : reg18[(4'hb):(1'h0)]) ?
              (wire30 ?
                  (^~reg36) : (wire30 ?
                      wire16 : wire34)) : {(reg28 == reg20)}) | wire34[(4'h8):(4'h8)]) * (+wire15));
          if ($signed((wire13[(4'ha):(4'h9)] ?
              (+((wire14 <= reg36) ?
                  {reg27, wire31} : ((8'hab) + reg29))) : ({reg26} ?
                  ($signed(reg36) ?
                      (wire31 >>> wire16) : (reg29 >= (8'had))) : reg38))))
            begin
              reg39 <= ($unsigned(reg18[(2'h3):(2'h3)]) <<< ((&reg24[(2'h3):(2'h3)]) ?
                  $unsigned($signed((wire17 << reg19))) : (($unsigned(wire13) ?
                      (~&reg21) : (reg37 ~^ reg38)) + ($signed(reg24) < {wire13,
                      wire15}))));
              reg40 <= $signed(wire33[(2'h2):(1'h1)]);
              reg41 <= ($signed({$unsigned($unsigned(reg36)),
                  ($unsigned((8'hb1)) > (8'ha8))}) * ($signed((((7'h40) ?
                      reg37 : wire17) >>> (reg28 ? wire32 : (8'h9f)))) ?
                  ((&reg27) ?
                      ((reg27 ?
                          reg37 : reg26) ^ (reg28 > reg39)) : ((reg40 ^~ reg18) << (reg23 ?
                          wire31 : wire17))) : $unsigned(reg29)));
              reg42 <= {{wire14, reg24[(1'h1):(1'h0)]}, wire33[(2'h3):(2'h2)]};
            end
          else
            begin
              reg39 <= ($signed({(reg23 <= wire15),
                      $unsigned(reg36[(5'h10):(3'h7)])}) ?
                  ($unsigned($unsigned((~&reg27))) ?
                      reg29 : reg22) : $signed($unsigned(((reg22 ?
                      wire13 : wire30) << (~^wire13)))));
              reg40 <= ($unsigned($signed($signed(reg35))) ?
                  (~^$signed($signed($signed(reg42)))) : (-(8'haf)));
              reg41 <= $unsigned((+(|(+$signed((8'hae))))));
              reg42 <= $unsigned(reg37[(1'h1):(1'h0)]);
              reg43 <= $signed($signed($unsigned($signed(((7'h43) & wire16)))));
            end
          reg44 <= (-(~^reg37[(4'hc):(4'hb)]));
        end
      reg45 <= $signed(reg22[(2'h3):(1'h1)]);
      reg46 <= $signed(reg28[(4'hb):(4'h9)]);
      reg47 <= $signed($unsigned($signed($signed((!reg44)))));
      reg48 <= (reg20[(4'h8):(1'h0)] ? reg43 : wire32[(1'h1):(1'h0)]);
    end
  assign wire49 = (!$signed((reg37[(3'h6):(3'h6)] ?
                      reg20[(4'hc):(3'h7)] : (~&(~|(8'hb1))))));
  assign wire50 = wire14;
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire101;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire [(5'h12):(1'h0)] wire99;
  input wire signed [(2'h3):(1'h0)] wire98;
  input wire signed [(4'hf):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  assign y = {wire106, wire105, wire104, reg103, reg102, (1'h0)};
  always
    @(posedge clk) begin
      reg102 <= (8'hb6);
      reg103 <= wire97[(1'h0):(1'h0)];
    end
  assign wire104 = {wire101};
  assign wire105 = (^~({wire100} ?
                       (({reg103, (8'hbf)} + $unsigned((8'hb4))) ?
                           (7'h40) : {$unsigned((8'hb3)),
                               $signed(wire98)}) : wire98));
  assign wire106 = $signed({reg102[(4'h8):(3'h7)],
                       {{(|(8'hbf))},
                           ((^~wire99) ?
                               $signed(wire104) : (wire99 ?
                                   reg103 : wire100))}});
endmodule
