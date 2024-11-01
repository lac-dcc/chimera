module top
#(parameter param180 = (({((~^(8'hab)) ? ((8'hb8) > (8'hbb)) : ((8'hb8) * (8'ha9)))} ? {(~&((8'hbe) & (8'ha4))), {{(8'hb9), (8'ha8)}, ((7'h41) == (8'hb7))}} : (|{{(8'ha3), (8'h9c)}, ((8'hb4) && (8'hbe))})) ? {{(((8'hb0) ? (8'ha4) : (8'hb8)) << ((8'ha5) ? (7'h41) : (8'hb6))), (((8'ha1) ~^ (7'h41)) ? ((8'hb8) ? (8'had) : (8'h9e)) : ((8'hbf) - (8'hb5)))}, ((~^{(8'hae), (7'h44)}) - {(!(8'hac))})} : {(~|(~|((8'h9e) && (8'ha5)))), (((|(8'hb4)) < {(8'hbc), (7'h42)}) ? (~((8'hb6) >>> (8'ha6))) : {((8'hbc) ? (8'hbe) : (8'ha0)), (-(8'hbd))})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire179;
  wire [(4'he):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire179, wire177, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h0)];
  assign wire5 = $unsigned(($signed((~|wire0[(4'hb):(3'h7)])) ~^ ($unsigned(((8'hab) + wire0)) ?
                     $signed({wire3, wire2}) : ((wire3 ^ (8'had)) ^ wire3))));
  assign wire6 = ((~&$unsigned($signed((wire1 ? wire0 : (8'hb5))))) - wire1);
  assign wire7 = $unsigned($signed(wire1[(3'h7):(1'h1)]));
  module8 #() modinst178 (wire177, clk, wire5, wire4, wire3, wire7);
  assign wire179 = $signed($signed(($unsigned((~wire3)) ?
                       $unsigned($signed(wire4)) : $signed((wire5 ?
                           wire6 : (8'hb1))))));
endmodule

module module8
#(parameter param176 = (^((^((~(8'ha2)) >> ((8'ha4) <<< (8'hba)))) == {(^~(~(8'hb6)))})))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire156;
  wire [(5'h14):(1'h0)] wire174;
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  assign y = {wire59,
                 wire77,
                 wire78,
                 wire79,
                 wire108,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire154,
                 wire156,
                 wire174,
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
                 reg62,
                 reg61,
                 (1'h0)};
  module13 #() modinst60 (.y(wire59), .wire14(wire9), .clk(clk), .wire17(wire10), .wire15(wire11), .wire16(wire12));
  always
    @(posedge clk) begin
      if ((+$unsigned(($unsigned(wire11) ? wire9[(4'hd):(3'h7)] : wire59))))
        begin
          reg61 <= (wire59 >> {wire10, $signed(wire10[(4'h8):(1'h0)])});
          if (reg61[(1'h0):(1'h0)])
            begin
              reg62 <= (~^{($unsigned((-(8'h9d))) <= wire11),
                  (((wire10 || wire10) ?
                      (wire11 <<< wire9) : {wire11,
                          wire12}) ~^ ((|wire12) == (^wire12)))});
              reg63 <= $unsigned((8'hbd));
              reg64 <= (-(8'hb9));
              reg65 <= wire11[(4'hc):(4'ha)];
              reg66 <= reg62[(3'h4):(1'h1)];
            end
          else
            begin
              reg62 <= (~|((^~$signed($signed((7'h42)))) & (wire10[(4'hb):(4'h9)] ?
                  $signed((reg66 | wire59)) : {$unsigned(reg65)})));
              reg63 <= {(+(reg64[(3'h4):(2'h2)] - $unsigned((^~wire12))))};
              reg64 <= reg62;
            end
          reg67 <= {$signed({wire9, reg66[(5'h10):(4'hb)]})};
          reg68 <= $unsigned((reg65 ?
              reg64[(3'h4):(1'h1)] : $unsigned((8'hae))));
        end
      else
        begin
          reg61 <= $unsigned({(8'hb0)});
        end
      reg69 <= (7'h42);
      reg70 <= $signed(({(reg67 ? wire9 : $signed(reg66)),
          $signed($unsigned(reg68))} >> $unsigned($signed((^reg67)))));
      if (((8'hbf) < ($unsigned((-$signed(wire59))) & (((reg68 <<< (8'h9e)) >> reg67[(1'h1):(1'h0)]) ?
          ($unsigned(wire11) > (+(8'ha5))) : {wire12, $unsigned((8'hbb))}))))
        begin
          reg71 <= reg66;
        end
      else
        begin
          reg71 <= reg65;
          reg72 <= (&wire10[(2'h3):(2'h2)]);
          reg73 <= (wire59 ^ (((~|(reg65 <= reg63)) ^~ $unsigned(((8'ha1) ?
              reg61 : wire9))) ~^ ($signed((|wire12)) > wire9[(4'hf):(3'h4)])));
          if ((8'h9d))
            begin
              reg74 <= $unsigned($signed($signed(reg72[(1'h1):(1'h1)])));
            end
          else
            begin
              reg74 <= $unsigned($unsigned((reg68[(1'h0):(1'h0)] & (!$signed(wire9)))));
              reg75 <= reg74[(3'h6):(1'h0)];
              reg76 <= reg70[(2'h3):(2'h3)];
            end
        end
    end
  assign wire77 = $signed((reg71 != ($signed($signed(reg68)) ?
                      wire10[(2'h3):(2'h2)] : {reg68, (|(7'h41))})));
  assign wire78 = ((8'hb0) ?
                      $signed(($unsigned(reg63) >> reg73[(5'h12):(4'ha)])) : $signed($unsigned((~&$unsigned(reg68)))));
  assign wire79 = (^~(reg65[(2'h2):(1'h0)] ?
                      ((reg61[(3'h6):(1'h1)] ?
                              wire77[(1'h1):(1'h0)] : {wire11}) ?
                          (8'ha2) : $unsigned($unsigned(reg65))) : reg61[(3'h5):(1'h0)]));
  module80 #() modinst109 (.wire81(reg68), .clk(clk), .y(wire108), .wire82(reg64), .wire83(reg63), .wire85(reg67), .wire84(reg75));
  assign wire110 = reg70[(1'h0):(1'h0)];
  assign wire111 = $signed({reg76, $signed($signed(reg72))});
  assign wire112 = (($unsigned((wire111 == wire9[(5'h13):(1'h1)])) > (8'ha7)) >>> (reg71 ?
                       $unsigned({((7'h40) ? (8'hb9) : reg69),
                           reg68[(3'h5):(2'h3)]}) : reg65));
  assign wire113 = {(((reg69[(3'h7):(3'h7)] != (reg74 ?
                           wire59 : wire111)) & reg61) && reg64),
                       reg71[(1'h1):(1'h0)]};
  assign wire114 = ({wire108} | ((~(reg62[(2'h3):(2'h3)] ?
                           {(8'ha4), reg68} : $unsigned(wire113))) ?
                       (((reg61 == wire110) ?
                           wire10 : reg65[(3'h5):(1'h0)]) || {(-wire112)}) : $signed((wire78 | reg74))));
  assign wire115 = reg62[(4'h8):(3'h5)];
  module116 #() modinst155 (wire154, clk, wire111, wire79, wire9, wire11);
  assign wire156 = ($unsigned(wire11[(5'h12):(4'hf)]) ?
                       (!$signed($unsigned(wire77))) : wire113);
  module157 #() modinst175 (.wire158(reg76), .wire159(wire59), .y(wire174), .wire160(wire115), .clk(clk), .wire161(wire111));
endmodule

module module157
#(parameter param173 = ({(|((~|(8'h9c)) ? ((8'haf) << (8'h9d)) : (~&(8'ha8)))), ((|{(8'ha2)}) < (!((8'hab) ? (8'ha4) : (8'h9f))))} ? (-(((^~(8'ha9)) != {(8'hb3)}) ? {{(7'h43)}, ((8'hb7) ? (8'ha7) : (8'haa))} : {(+(8'hbd)), (~&(8'hbb))})) : (((((7'h42) ? (8'hb3) : (7'h40)) ? {(8'h9c)} : ((8'h9e) && (8'ha4))) ? ((^(8'hba)) >>> ((8'hb6) - (8'h9c))) : (((8'ha6) ? (8'h9f) : (8'hae)) ^ ((8'hb7) + (8'ha2)))) >= (|(((8'hb8) ? (8'hbb) : (8'had)) ^~ (8'hbc))))))
(y, clk, wire161, wire160, wire159, wire158);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire161;
  input wire signed [(4'ha):(1'h0)] wire160;
  input wire signed [(4'h9):(1'h0)] wire159;
  input wire signed [(4'hb):(1'h0)] wire158;
  wire signed [(4'h8):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire166;
  wire signed [(2'h3):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire164;
  wire signed [(5'h15):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire162;
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(5'h12):(1'h0)] reg168 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire162 = (wire159[(3'h4):(3'h4)] << (^$unsigned(wire159[(3'h6):(2'h3)])));
  assign wire163 = $unsigned(((^({wire159, wire161} ?
                       (wire158 ?
                           (8'hb2) : wire160) : wire162[(3'h7):(3'h7)])) > wire159[(3'h5):(1'h1)]));
  assign wire164 = ({wire161,
                           ($signed((!wire159)) ?
                               wire159 : (wire163 ?
                                   (wire161 == wire158) : (~&wire161)))} ?
                       (({(wire158 < (7'h43)), wire160[(3'h6):(3'h4)]} ?
                           (wire163 ?
                               $unsigned(wire163) : wire162[(4'ha):(2'h2)]) : (wire160 > (wire161 < wire162))) | $signed(wire158[(2'h2):(1'h0)])) : {$signed($unsigned($signed(wire160)))});
  assign wire165 = ((wire158[(4'hb):(4'h8)] == wire162) == wire164[(3'h6):(3'h6)]);
  assign wire166 = wire165[(2'h3):(1'h1)];
  assign wire167 = wire166[(4'hb):(3'h5)];
  always
    @(posedge clk) begin
      reg168 <= wire162;
      reg169 <= $signed($signed($unsigned((8'hb1))));
      reg170 <= (8'ha8);
      reg171 <= wire161;
      reg172 <= ($signed(($unsigned(((8'hac) >>> reg171)) ?
          reg170[(2'h3):(1'h1)] : wire165[(2'h3):(2'h3)])) >= $signed((((wire158 << wire163) << wire163[(4'hc):(2'h2)]) ?
          ((wire167 ? reg170 : reg170) ?
              reg168[(4'hf):(3'h4)] : wire159) : wire167[(1'h1):(1'h1)])));
    end
endmodule

module module116  (y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire120;
  input wire signed [(3'h6):(1'h0)] wire119;
  input wire [(4'h8):(1'h0)] wire118;
  input wire [(2'h3):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire153;
  wire [(4'hf):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire signed [(3'h7):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire signed [(4'ha):(1'h0)] wire137;
  wire [(5'h12):(1'h0)] wire134;
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire134,
                 reg146,
                 reg145,
                 reg136,
                 reg135,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire119[(3'h4):(1'h0)])
        begin
          reg121 <= wire117[(2'h3):(2'h2)];
        end
      else
        begin
          reg121 <= wire117;
          reg122 <= $unsigned($signed($unsigned((+(+wire120)))));
          reg123 <= (~|$signed((((~reg121) ?
                  wire117[(2'h2):(1'h0)] : wire120[(1'h0):(1'h0)]) ?
              reg122[(1'h0):(1'h0)] : $unsigned((wire117 ?
                  reg122 : (8'hb0))))));
        end
      reg124 <= (({(wire120[(1'h0):(1'h0)] != reg122[(4'hb):(4'ha)]),
          $unsigned(wire120)} >>> reg123) ^~ $signed(wire120));
      if (wire117[(1'h0):(1'h0)])
        begin
          reg125 <= reg124;
        end
      else
        begin
          reg125 <= ({(reg124 ?
                  ($unsigned(reg125) ?
                      $unsigned(wire118) : ((8'hb0) ?
                          wire118 : wire117)) : $unsigned($signed(wire118))),
              ((reg121[(4'hc):(2'h2)] ?
                  reg123 : (wire118 ? reg123 : reg124)) == (!((8'h9f) ?
                  wire118 : reg122)))} - (wire117 != (reg124 ?
              reg124[(4'hb):(3'h4)] : (^(reg121 ? wire118 : reg125)))));
          if ((reg123 ?
              ((~(~(reg123 ? wire119 : reg123))) ?
                  $unsigned(($signed(reg123) ?
                      (reg122 > reg124) : reg123)) : (&reg123[(4'h8):(2'h3)])) : wire120))
            begin
              reg126 <= ((reg124[(2'h3):(1'h0)] ?
                  reg125 : ($unsigned(reg125[(3'h5):(2'h3)]) ?
                      reg122 : ((reg121 ^ wire118) >>> (-(7'h41))))) ^ (^~(reg122[(1'h1):(1'h0)] ?
                  wire117 : (reg121[(3'h7):(2'h2)] > reg125[(3'h5):(2'h2)]))));
              reg127 <= {(8'haf)};
              reg128 <= (~^((~^(wire118[(4'h8):(3'h5)] & (~wire119))) ~^ wire117));
              reg129 <= (8'hae);
              reg130 <= (reg128 > (reg121 ?
                  reg126[(4'h8):(1'h0)] : reg122[(4'hd):(3'h5)]));
            end
          else
            begin
              reg126 <= reg122;
              reg127 <= reg126[(4'h9):(1'h0)];
              reg128 <= (reg130[(2'h3):(1'h1)] ?
                  {$signed({{reg127, (7'h40)}, (reg121 <<< reg125)}),
                      $signed($unsigned((reg121 ?
                          (8'ha3) : reg124)))} : ($unsigned({reg123}) ^~ $signed(wire119[(3'h4):(2'h2)])));
              reg129 <= reg122[(4'hc):(4'h8)];
              reg130 <= reg121;
            end
          reg131 <= ({wire117[(1'h1):(1'h1)]} ?
              ((~$unsigned({(8'hb0), reg123})) ?
                  (!$unsigned(wire120)) : (&(-$signed(wire117)))) : {(($signed(wire119) | (7'h43)) ?
                      wire117 : $unsigned((~|reg127)))});
        end
      reg132 <= reg122;
      reg133 <= (~|($unsigned(wire119) ^~ (wire117[(2'h2):(1'h1)] ?
          (reg124[(3'h7):(3'h5)] << $signed(reg131)) : ((reg130 ?
              reg122 : wire117) > (!reg130)))));
    end
  assign wire134 = ($unsigned(reg124[(3'h7):(3'h7)]) ?
                       (((^~(8'hb4)) + (~&(reg130 ?
                           wire118 : reg129))) & $unsigned(wire118)) : $unsigned($unsigned($signed(reg129[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg135 <= reg130;
      reg136 <= (reg121[(3'h6):(2'h3)] ?
          $signed((((reg135 && wire118) ?
                  (wire134 <<< (8'hac)) : (wire117 >>> (8'hb4))) ?
              $signed((reg126 ?
                  wire119 : reg129)) : $signed((-reg125)))) : ($signed($unsigned((reg122 ?
              reg123 : reg135))) ^~ {reg133[(4'hc):(4'hb)]}));
    end
  assign wire137 = wire118[(3'h7):(1'h0)];
  assign wire138 = {(~&(wire134[(5'h12):(4'h9)] > reg121[(4'hb):(4'hb)]))};
  assign wire139 = ($signed($unsigned(wire120)) ?
                       reg129 : reg127[(4'h8):(4'h8)]);
  assign wire140 = ((+wire134[(5'h11):(4'h9)]) >>> (~|($signed((~|(8'hb5))) ?
                       reg133[(1'h1):(1'h1)] : (reg133 ~^ (|reg127)))));
  assign wire141 = $signed((^~reg124));
  assign wire142 = reg121[(4'h8):(1'h0)];
  assign wire143 = reg133[(4'ha):(2'h2)];
  assign wire144 = (|wire142);
  always
    @(posedge clk) begin
      reg145 <= ((wire118 + ($signed($unsigned(wire140)) <= ({wire144} | reg130[(1'h1):(1'h0)]))) ?
          $unsigned(($unsigned(reg132) ?
              $unsigned((8'hb0)) : reg129)) : (|wire137));
      reg146 <= reg122;
    end
  assign wire147 = reg126;
  assign wire148 = $signed((reg136 ?
                       reg129[(4'h9):(4'h9)] : ((7'h43) ?
                           ((8'ha5) & wire140[(5'h12):(4'h8)]) : (!(8'hb8)))));
  assign wire149 = $unsigned({wire117[(2'h2):(1'h1)]});
  assign wire150 = reg133[(2'h3):(2'h3)];
  assign wire151 = (~|$unsigned($unsigned($signed((reg128 <= reg126)))));
  assign wire152 = (wire142[(2'h3):(2'h2)] & (~$signed((8'ha7))));
  assign wire153 = $signed($unsigned($unsigned((reg146 + {(8'ha8), reg128}))));
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire85;
  input wire [(5'h12):(1'h0)] wire84;
  input wire [(4'hd):(1'h0)] wire83;
  input wire [(3'h6):(1'h0)] wire82;
  input wire [(4'hb):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire86;
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
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
                 (1'h0)};
  assign wire86 = (|({{wire83[(2'h2):(1'h1)]}, $unsigned((+wire85))} ?
                      (8'hb2) : wire84[(4'h9):(3'h4)]));
  assign wire87 = wire86;
  assign wire88 = wire85[(2'h3):(2'h3)];
  assign wire89 = (8'ha4);
  assign wire90 = (8'ha5);
  always
    @(posedge clk) begin
      if (wire85[(4'ha):(1'h1)])
        begin
          reg91 <= wire86;
          reg92 <= ($signed((+$unsigned({wire81}))) ?
              wire81 : $unsigned((wire86 ~^ $signed(wire89[(1'h1):(1'h1)]))));
          if (reg91)
            begin
              reg93 <= $signed($unsigned((~|wire83[(3'h5):(1'h1)])));
              reg94 <= reg93;
            end
          else
            begin
              reg93 <= $signed((reg91[(2'h3):(1'h0)] ?
                  wire90 : (wire86 ?
                      (8'had) : ((reg92 <= wire89) ~^ wire90[(1'h1):(1'h0)]))));
              reg94 <= wire87[(1'h0):(1'h0)];
              reg95 <= wire81;
              reg96 <= $unsigned((-wire83));
              reg97 <= ($signed(wire88[(2'h2):(2'h2)]) ?
                  wire88[(2'h3):(2'h2)] : $unsigned(wire84));
            end
          reg98 <= reg97;
        end
      else
        begin
          reg91 <= {wire81[(3'h6):(2'h3)], wire84};
        end
      reg99 <= (({((8'ha1) ? reg97 : {wire85, wire85})} ?
          (~^(((8'hba) ? wire87 : wire87) ?
              (wire83 ^~ wire82) : (wire84 == reg94))) : (((8'haa) ?
              (wire86 ?
                  wire83 : reg91) : wire89) | $signed((-reg92)))) > wire83[(4'h9):(3'h7)]);
      reg100 <= (($signed(wire86[(3'h6):(3'h4)]) + $signed(($signed(wire82) - (reg98 < reg96)))) <= ($unsigned(wire85) != (!{$unsigned(reg99),
          wire86})));
    end
  assign wire101 = ($signed({$unsigned($signed(wire81))}) ?
                       reg100[(4'hb):(3'h6)] : ($signed(reg97[(1'h1):(1'h1)]) | $signed($unsigned(wire85))));
  assign wire102 = (reg97 ?
                       $unsigned((!(~&((8'ha4) ?
                           wire90 : wire83)))) : $signed((reg98[(3'h7):(1'h1)] ?
                           $unsigned($signed((8'ha3))) : $unsigned((reg96 ~^ wire81)))));
  assign wire103 = wire82;
  assign wire104 = wire83[(4'hc):(2'h2)];
  assign wire105 = $unsigned(wire102[(3'h5):(3'h4)]);
  assign wire106 = $unsigned(wire101[(3'h7):(3'h7)]);
  assign wire107 = ((~|reg98[(2'h3):(2'h2)]) ^ (($unsigned(wire103) | $unsigned((wire82 <<< reg97))) ?
                       wire103[(3'h5):(1'h1)] : (((wire102 ?
                           wire84 : wire105) & $unsigned((8'had))) + $unsigned($unsigned(reg94)))));
endmodule

module module13
#(parameter param57 = {((7'h41) ? ((^~((8'ha1) ? (8'hbe) : (8'ha6))) ? ((~^(8'haa)) || ((8'h9f) ? (8'hab) : (8'ha1))) : (^((8'hb6) ? (7'h44) : (8'hab)))) : {((8'hab) ^~ (-(8'hac)))}), (+((-((8'had) - (8'hac))) & {((8'ha5) ? (8'hb8) : (8'ha1)), ((8'ha2) > (8'ha9))}))}, 
parameter param58 = (~{{param57}}))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire32,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg55,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg43,
                 reg42,
                 reg41,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
  assign wire18 = (!$signed({$signed((wire17 <= wire14)), wire14}));
  assign wire19 = wire15;
  assign wire20 = (8'h9d);
  assign wire21 = ($signed(wire15[(4'he):(3'h7)]) ?
                      (wire14 ?
                          ((~&$signed(wire16)) ?
                              ($signed(wire18) ^ wire16) : (!{wire16,
                                  wire19})) : $unsigned(($signed(wire14) ?
                              $unsigned((8'hb5)) : wire18))) : (&$unsigned(wire17[(4'h8):(4'h8)])));
  always
    @(posedge clk) begin
      reg22 <= (~^(($unsigned((+wire16)) ?
          (8'hb8) : ((wire17 ^~ (8'hac)) ?
              $signed(wire17) : $signed(wire16))) && (wire16 ?
          $unsigned($signed((8'hae))) : ((wire18 ?
              wire15 : wire20) - wire14))));
      reg23 <= $unsigned((wire16[(3'h7):(1'h1)] > $unsigned((wire15 >>> (^wire21)))));
    end
  always
    @(posedge clk) begin
      reg24 <= $signed({(wire14 << ($unsigned(wire19) > $unsigned(reg22))),
          {wire17}});
      reg25 <= $signed(wire16);
      if (wire21[(2'h3):(2'h2)])
        begin
          reg26 <= $unsigned(((~|$unsigned(((8'h9f) & wire18))) ?
              reg23 : ($unsigned($signed(wire14)) ?
                  (^wire19[(1'h1):(1'h0)]) : reg25[(4'h8):(3'h7)])));
          reg27 <= $unsigned(({$unsigned((-wire17)), reg24[(4'hc):(2'h2)]} ?
              ($unsigned($unsigned(wire18)) == ((wire14 ?
                  reg24 : wire16) || (~^wire14))) : ($unsigned($signed((8'hac))) ^~ (8'hae))));
          reg28 <= $signed($unsigned(($signed(reg27) > (!$signed(wire16)))));
          reg29 <= (reg22[(3'h4):(2'h3)] ~^ $signed({$unsigned((&wire16))}));
        end
      else
        begin
          reg26 <= (|(reg26 ?
              {(~$unsigned(reg24)), wire16[(3'h4):(2'h2)]} : (($signed(reg29) ?
                  reg26 : {reg23}) + $signed({wire15}))));
          if ($signed((|{($signed(reg23) ? wire14 : (~&reg25)),
              reg26[(1'h0):(1'h0)]})))
            begin
              reg27 <= reg26[(1'h0):(1'h0)];
              reg28 <= ($unsigned($signed(wire19[(1'h0):(1'h0)])) ?
                  $unsigned($signed((reg26[(2'h2):(2'h2)] ?
                      wire18 : wire20))) : $signed((({wire19} <<< reg26[(2'h2):(1'h1)]) + wire14[(5'h13):(4'hd)])));
              reg29 <= ($signed((~|({wire20, wire18} ?
                  $unsigned(reg26) : ((8'hb3) ?
                      reg23 : wire18)))) >= wire21[(4'hd):(1'h1)]);
            end
          else
            begin
              reg27 <= ($signed((reg23[(3'h5):(1'h0)] ?
                      $unsigned(wire21) : ((reg26 << wire21) ?
                          (reg22 ? wire14 : reg24) : (~reg26)))) ?
                  reg27[(4'hc):(1'h1)] : ($unsigned(wire21[(4'h8):(3'h6)]) <<< (reg24[(3'h4):(1'h1)] ?
                      ({(8'hba)} ? (~&(7'h44)) : reg22) : (&(reg29 ?
                          wire17 : reg26)))));
              reg28 <= $signed({($signed($signed(reg25)) ?
                      (8'hb0) : $unsigned((wire17 + reg29))),
                  (~((wire19 <<< reg29) ^~ {wire15}))});
              reg29 <= ($unsigned(wire19) >>> wire17[(3'h6):(2'h3)]);
            end
        end
      reg30 <= $unsigned(((wire16[(3'h7):(3'h5)] ?
              (wire17[(1'h0):(1'h0)] ?
                  (wire17 <= (8'haa)) : reg29[(1'h0):(1'h0)]) : (reg24 ?
                  reg24[(1'h0):(1'h0)] : reg28)) ?
          $signed(reg28[(2'h3):(2'h3)]) : (-(((8'hb5) >> reg27) ?
              wire14 : wire15))));
      reg31 <= $signed({$unsigned((wire20[(2'h2):(1'h0)] ? {reg29} : (+reg25))),
          {$signed(reg28[(1'h0):(1'h0)]), wire19}});
    end
  assign wire32 = $signed($unsigned(wire14[(5'h15):(5'h12)]));
  always
    @(posedge clk) begin
      reg33 <= ({(!reg24), (8'hb9)} ?
          $signed($signed(wire14[(4'hf):(4'hf)])) : ($signed(($unsigned(reg31) ^ reg26)) ~^ (({reg29,
              reg23} > $signed(reg29)) ~^ wire18)));
      reg34 <= $signed(wire18);
      reg35 <= ((reg23 ? wire19 : wire21) < ({reg29, reg30[(4'hc):(4'h8)]} ?
          $signed(wire19[(1'h0):(1'h0)]) : ((wire17[(1'h1):(1'h1)] ?
                  wire16[(4'h8):(3'h6)] : $unsigned(wire14)) ?
              wire17 : $unsigned((wire15 ? reg23 : (8'hbe))))));
      reg36 <= $signed((-wire14[(2'h3):(1'h0)]));
    end
  assign wire37 = {({($unsigned(wire14) ? $unsigned(reg35) : (^~wire17)),
                              (~{reg27})} ?
                          $unsigned($signed($unsigned(wire19))) : (~(reg23 ?
                              {reg25, reg33} : (^(8'hb3))))),
                      $unsigned(((reg25[(4'h9):(4'h8)] ? (~^wire32) : wire18) ?
                          $unsigned({(8'haa)}) : (~|(reg34 ?
                              wire18 : wire18))))};
  assign wire38 = $signed($unsigned({reg27[(1'h0):(1'h0)]}));
  assign wire39 = (reg23[(4'h9):(2'h2)] ^ wire19[(2'h2):(1'h1)]);
  assign wire40 = wire16;
  always
    @(posedge clk) begin
      reg41 <= $unsigned($unsigned($unsigned(((~|wire21) < (reg23 <= wire40)))));
      reg42 <= (|(!reg31[(1'h0):(1'h0)]));
      reg43 <= reg42[(4'hc):(3'h6)];
    end
  assign wire44 = $unsigned(reg24);
  always
    @(posedge clk) begin
      reg45 <= $unsigned(reg42[(4'he):(4'he)]);
      if (reg36[(1'h0):(1'h0)])
        begin
          if (reg45[(3'h4):(2'h2)])
            begin
              reg46 <= (reg33 < $unsigned(wire16[(3'h7):(3'h4)]));
              reg47 <= (-(8'ha2));
            end
          else
            begin
              reg46 <= wire16;
              reg47 <= (^~(((^~(wire19 ?
                      wire16 : reg46)) > $unsigned((reg36 & (8'hba)))) ?
                  (^reg43) : {((wire37 ? reg23 : reg42) ?
                          $signed(reg25) : (-reg47)),
                      wire38[(3'h5):(1'h0)]}));
              reg48 <= reg31[(2'h2):(2'h2)];
            end
          reg49 <= $unsigned($unsigned($signed(wire37[(2'h2):(1'h0)])));
          reg50 <= reg23;
          reg51 <= {(reg26 ?
                  ($signed(reg49[(3'h6):(3'h6)]) ?
                      ((reg26 ? reg49 : reg29) ?
                          wire18[(4'h8):(2'h3)] : (wire16 >= reg26)) : {$signed(reg24),
                          wire19[(1'h0):(1'h0)]}) : (&($signed((8'hbe)) ?
                      reg30 : {reg49}))),
              $unsigned({$signed((~|wire32))})};
        end
      else
        begin
          reg46 <= $signed((8'had));
          reg47 <= $signed($signed($signed({(wire37 >> reg29),
              ((8'ha9) ? reg24 : (8'hbf))})));
          reg48 <= ((($signed(((8'hb1) ? wire37 : reg42)) ?
                      $signed((8'hb1)) : ((8'haf) ?
                          (reg34 ? wire15 : wire18) : (reg34 ?
                              (8'hbe) : wire19))) ?
                  ((8'h9e) && reg49[(5'h13):(2'h3)]) : (wire20 ^ $signed((reg36 ?
                      wire40 : (8'hbf))))) ?
              $signed((wire18 > (-$signed(wire40)))) : $unsigned(wire18));
          reg49 <= $signed((^~(wire14 ?
              (reg43[(1'h1):(1'h0)] ?
                  wire39[(3'h6):(2'h2)] : reg36[(1'h1):(1'h1)]) : (^(reg42 & reg45)))));
          if (reg35[(4'hd):(3'h7)])
            begin
              reg50 <= reg28[(1'h0):(1'h0)];
              reg51 <= wire38[(2'h3):(1'h1)];
            end
          else
            begin
              reg50 <= (~|reg27);
            end
        end
    end
  assign wire52 = (~^(+((reg25 ?
                      $unsigned(reg26) : $unsigned(reg30)) & reg27[(4'hf):(4'h8)])));
  assign wire53 = reg31[(1'h0):(1'h0)];
  assign wire54 = $unsigned($unsigned(wire21));
  always
    @(posedge clk) begin
      reg55 <= wire44[(4'ha):(2'h3)];
    end
  assign wire56 = ((|reg55[(1'h0):(1'h0)]) ?
                      (-(8'haf)) : $signed(((reg45 ?
                              {(8'ha9)} : (reg28 > reg34)) ?
                          reg36 : wire37[(3'h6):(1'h0)])));
endmodule
