module top
#(parameter param166 = ({((((8'h9c) >= (8'ha5)) ? {(8'hba), (8'haf)} : ((8'ha6) ? (8'haa) : (7'h42))) ? {((8'ha1) ? (8'hbf) : (7'h42)), ((8'ha5) >> (8'h9f))} : (((8'haa) ^ (8'ha2)) ? ((8'ha8) ? (8'hac) : (8'ha8)) : (&(8'hb6))))} >>> (8'hb9)), 
parameter param167 = ((((param166 ? (param166 ? param166 : param166) : ((8'hbb) << param166)) * {param166}) ? ((~|param166) >> param166) : (param166 & {(~&param166)})) ? {(~|(^~(param166 ^~ param166))), (((~|(8'hb2)) > param166) ? (param166 ? ((8'ha8) <<< param166) : (param166 >>> (8'ha2))) : {(param166 ? param166 : param166), (param166 ? param166 : param166)})} : ((~|{{param166, param166}}) ? {param166, param166} : param166)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire165;
  wire signed [(5'h10):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire163;
  wire [(5'h12):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire154;
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire160,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire154,
                 reg162,
                 reg161,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 (1'h0)};
  assign wire5 = (~(|(wire3[(4'h8):(3'h5)] ?
                     wire2[(2'h2):(1'h0)] : $signed(wire3[(1'h1):(1'h0)]))));
  assign wire6 = (wire4 ~^ wire3);
  assign wire7 = $unsigned($unsigned((~^wire4)));
  assign wire8 = ($signed((~^wire0[(4'he):(4'hb)])) == ($unsigned(wire6[(2'h3):(1'h1)]) == $unsigned($unsigned($signed(wire0)))));
  assign wire9 = $unsigned(($unsigned($signed(wire4)) | $unsigned({wire3[(3'h5):(1'h0)],
                     $unsigned(wire6)})));
  module10 #() modinst155 (wire154, clk, wire0, wire2, wire4, wire9, wire8);
  always
    @(posedge clk) begin
      reg156 <= $unsigned(wire2[(4'h8):(2'h2)]);
      reg157 <= $signed($signed((^~wire9)));
      reg158 <= wire4[(4'he):(4'h9)];
      reg159 <= (!$signed((^$signed($signed(wire7)))));
    end
  assign wire160 = $signed(reg159[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg161 <= $signed(((wire9[(3'h5):(3'h4)] ?
              (!wire3[(1'h0):(1'h0)]) : {(reg158 <<< wire1),
                  $unsigned(wire3)}) ?
          $signed(reg157[(4'hd):(1'h1)]) : (^~$signed((wire6 | wire160)))));
      reg162 <= reg158;
    end
  assign wire163 = $unsigned($unsigned((wire3 <<< ((reg162 ? wire4 : reg159) ?
                       (^reg156) : (~|wire154)))));
  assign wire164 = wire163[(3'h5):(1'h0)];
  assign wire165 = wire164;
endmodule

module module10
#(parameter param152 = (8'hbb), 
parameter param153 = (&(((^{(8'ha5), param152}) <= ((!param152) ? (8'ha0) : (param152 ? param152 : param152))) ? (~|param152) : (param152 >= {{(8'hac), param152}}))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire142;
  wire signed [(3'h5):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  wire [(5'h12):(1'h0)] wire139;
  wire [(4'hb):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire125;
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire127,
                 wire109,
                 wire50,
                 wire48,
                 wire24,
                 wire19,
                 wire18,
                 wire125,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
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
                 reg128,
                 reg16,
                 reg17,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire15[(2'h3):(2'h3)]);
      reg17 <= $unsigned($signed((wire12[(1'h1):(1'h1)] ?
          ($unsigned(wire12) ?
              (&wire11) : $unsigned(wire13)) : wire11[(1'h0):(1'h0)])));
    end
  assign wire18 = ((8'hab) ? wire12[(2'h3):(1'h0)] : (-wire15));
  assign wire19 = wire13;
  always
    @(posedge clk) begin
      reg20 <= {(8'hbe)};
      reg21 <= {wire13[(4'hf):(4'hf)], wire13};
      reg22 <= (^~($signed($signed(((8'hbd) ? reg16 : wire12))) ?
          ((^~$signed(wire15)) * ((wire13 | reg21) || (wire12 || wire14))) : (wire12[(2'h2):(2'h2)] ?
              wire19[(4'he):(4'h9)] : wire19)));
      reg23 <= (!reg17);
    end
  assign wire24 = (~|((^~$unsigned({wire19})) || ({$signed(wire19), (~|reg17)} ?
                      (8'haa) : ((~&reg17) >= $unsigned(wire15)))));
  always
    @(posedge clk) begin
      reg25 <= ($signed($signed(($unsigned((7'h42)) ?
              $unsigned(wire24) : (wire14 != wire14)))) ?
          wire13[(4'hd):(3'h4)] : $signed(wire13));
      reg26 <= (wire14[(1'h0):(1'h0)] ?
          {reg20[(3'h5):(1'h0)]} : reg20[(1'h1):(1'h0)]);
    end
  module27 #() modinst49 (wire48, clk, wire14, reg16, reg21, wire15, reg22);
  assign wire50 = ((wire13[(5'h11):(3'h4)] ?
                          $signed($signed($unsigned(wire48))) : wire18[(1'h1):(1'h0)]) ?
                      (-((8'ha9) ?
                          reg26[(3'h4):(2'h3)] : (-(8'ha8)))) : ((-wire19[(4'hc):(4'h8)]) & $unsigned($unsigned(reg26))));
  module51 #() modinst110 (wire109, clk, wire15, wire12, wire14, reg22, reg20);
  module111 #() modinst126 (wire125, clk, wire12, wire15, reg16, reg26, wire18);
  assign wire127 = (reg17[(2'h3):(2'h2)] ? wire19[(3'h7):(2'h3)] : wire12);
  always
    @(posedge clk) begin
      if (reg17)
        begin
          reg128 <= reg25;
        end
      else
        begin
          reg128 <= ((wire12 ?
              $unsigned({$unsigned(reg22)}) : ((^~reg16) ?
                  (~&(8'ha9)) : (wire13[(4'hd):(4'h8)] ?
                      (8'h9d) : reg21[(3'h5):(3'h5)]))) <<< {$signed(wire15[(3'h4):(2'h2)]),
              wire125});
          reg129 <= ((!(|$unsigned(reg17[(2'h3):(1'h0)]))) ?
              $unsigned((wire14[(3'h6):(3'h5)] ?
                  (reg26 << reg26) : (|(wire109 ?
                      (8'hb0) : wire48)))) : wire109[(2'h2):(1'h1)]);
          reg130 <= reg22[(4'hc):(1'h1)];
          reg131 <= (~|(^(wire18[(2'h2):(1'h1)] ?
              reg22 : ($unsigned(wire48) | $unsigned(wire24)))));
          reg132 <= ($unsigned($unsigned((+((8'h9d) ? (8'hba) : wire12)))) ?
              ((-$signed(wire24)) ?
                  ((~&$unsigned(wire48)) >= wire24) : $signed((+(reg20 ?
                      reg21 : reg128)))) : $signed(((^wire48[(3'h4):(1'h1)]) * wire15)));
        end
      if ($signed((8'ha2)))
        begin
          reg133 <= (8'hba);
          reg134 <= $signed(reg21);
        end
      else
        begin
          reg133 <= $signed(wire15[(4'ha):(3'h7)]);
          reg134 <= (~|wire50);
          reg135 <= wire12[(3'h4):(1'h1)];
          reg136 <= {$signed($unsigned(($signed(reg21) - $signed(wire18))))};
          reg137 <= reg133;
        end
      reg138 <= wire19;
    end
  assign wire139 = reg138;
  assign wire140 = (reg135[(3'h5):(3'h5)] ^ wire11);
  assign wire141 = $unsigned({(wire109[(3'h6):(1'h1)] >= (+(wire48 ^ (8'haa))))});
  assign wire142 = $signed((8'ha2));
  always
    @(posedge clk) begin
      reg143 <= (reg21 ?
          reg16[(1'h0):(1'h0)] : ((((^wire109) != (^(8'ha7))) ^~ wire142) ?
              $signed(wire12[(1'h0):(1'h0)]) : (7'h44)));
      if ($signed($unsigned(wire15)))
        begin
          reg144 <= (&$unsigned(({wire19} ?
              wire140[(2'h3):(1'h0)] : $unsigned(reg135[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg144 <= (wire142[(1'h1):(1'h1)] || $unsigned(wire127));
          reg145 <= (~&reg25);
        end
      if ($unsigned(((&{(reg21 ? (8'ha6) : reg130), reg20[(4'h8):(1'h0)]}) ?
          $unsigned($unsigned((reg145 & reg20))) : ($signed(wire13[(4'he):(4'h8)]) > {((8'hb8) < reg134)}))))
        begin
          reg146 <= $unsigned((|(($unsigned(reg137) || (reg144 ?
              wire109 : reg131)) | wire13)));
          reg147 <= ((({(^wire140), (reg25 || reg143)} ?
                  ((wire127 ? reg21 : wire142) ?
                      (reg133 ? (8'hb8) : wire125) : (&(8'h9e))) : (&reg22)) ?
              wire13[(3'h5):(3'h5)] : {$unsigned(reg132)}) ^~ {reg137[(1'h0):(1'h0)]});
          reg148 <= (+$signed((~($unsigned(wire13) && $signed(reg22)))));
          reg149 <= $signed((8'hab));
          reg150 <= {(~$unsigned({$signed(reg16), $signed(reg147)})), wire13};
        end
      else
        begin
          reg146 <= {(-reg150)};
        end
      reg151 <= (-reg129);
    end
endmodule

module module111
#(parameter param124 = {((~|(((8'ha9) <<< (8'ha7)) ^ (8'hb3))) ? ((((8'hac) ? (7'h44) : (8'hab)) ? (~&(7'h41)) : ((8'hb2) ? (7'h40) : (8'ha5))) << ((~|(8'ha5)) < (+(8'hbf)))) : (((^~(8'ha6)) ? ((8'h9d) ? (8'h9f) : (8'h9e)) : (~&(8'h9c))) ? (((8'h9e) ? (8'haa) : (8'hb0)) ~^ ((8'hb4) ? (8'h9d) : (8'ha4))) : (!((8'hb8) ? (8'hb2) : (8'hbc))))), (-(((!(7'h43)) ? ((8'hb0) ? (8'ha3) : (8'hbc)) : ((8'hbe) < (8'hae))) ? (((8'hb8) && (8'hb0)) ? ((8'h9c) ? (8'ha2) : (8'haf)) : {(8'hbe), (8'h9d)}) : ({(8'haf)} ? ((8'ha6) != (8'ha2)) : (+(8'hbd)))))})
(y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire116;
  input wire signed [(4'hb):(1'h0)] wire115;
  input wire signed [(3'h5):(1'h0)] wire114;
  input wire signed [(4'h8):(1'h0)] wire113;
  input wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire117;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 (1'h0)};
  assign wire117 = ($unsigned(wire114) << wire112[(1'h1):(1'h0)]);
  assign wire118 = $unsigned(wire112[(3'h6):(1'h0)]);
  assign wire119 = (wire117 ?
                       (wire113 ?
                           wire113 : ($signed($signed(wire115)) & wire114[(2'h3):(2'h3)])) : (wire112[(3'h4):(2'h3)] == $unsigned((+$signed(wire113)))));
  assign wire120 = wire116;
  assign wire121 = (~|wire114);
  assign wire122 = ({{(-$unsigned((8'hbc))), wire118[(4'hf):(4'ha)]}} ?
                       $unsigned({($unsigned((8'hb2)) == (wire118 ?
                               wire120 : wire113)),
                           $signed({wire114,
                               (8'hb9)})}) : $signed((wire121 + (((8'h9f) ?
                               wire112 : wire119) ?
                           (wire117 ~^ wire116) : (wire120 << wire114)))));
  assign wire123 = $signed(wire115);
endmodule

module module51
#(parameter param108 = (((((~&(8'hb8)) > ((8'ha1) ? (8'ha3) : (8'ha7))) ? ({(8'hb6), (8'h9c)} ^ {(8'ha4), (8'h9f)}) : (-(8'ha7))) | ((((8'had) ? (8'haa) : (8'ha1)) + {(8'ha8), (8'ha8)}) != (-((8'ha7) ? (8'ha8) : (8'haf))))) ? (^~(((~&(8'ha3)) ? (-(8'hbb)) : ((8'hb0) ? (8'had) : (8'hb4))) ? {(8'hb9)} : (|((8'h9e) * (7'h42))))) : (&((~|(!(8'hb2))) <= (!{(8'hb1), (8'h9c)})))))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h25b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  input wire [(3'h5):(1'h0)] wire54;
  input wire [(2'h3):(1'h0)] wire53;
  input wire signed [(4'hd):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire57;
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire65,
                 wire64,
                 wire57,
                 reg107,
                 reg106,
                 reg101,
                 reg100,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire57 = wire53[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((({(~&$unsigned(wire57)), $unsigned((wire52 ? (8'hb9) : wire54))} ?
          wire53 : $unsigned($signed((^wire52)))) >>> ($signed(wire54[(1'h1):(1'h1)]) ?
          $unsigned((wire55[(2'h2):(2'h2)] | (wire54 & wire57))) : (($unsigned((8'hb2)) ?
              wire57 : (wire53 <<< wire52)) | (~{wire54, wire52})))))
        begin
          reg58 <= wire52[(4'hb):(3'h7)];
        end
      else
        begin
          reg58 <= (($unsigned(wire52[(4'hc):(1'h0)]) < ((reg58[(4'hd):(1'h1)] ?
                  $signed(reg58) : $unsigned(wire57)) + ($signed(wire56) ?
                  {(8'hb2), wire52} : reg58[(1'h1):(1'h0)]))) ?
              wire53 : $unsigned($unsigned($signed(wire53[(2'h2):(2'h2)]))));
          reg59 <= wire52;
          reg60 <= $signed($signed((reg59[(4'hd):(1'h1)] ?
              reg58[(4'h8):(3'h7)] : $unsigned(reg59))));
          reg61 <= wire53;
        end
      reg62 <= $signed($signed($signed($signed(wire56[(1'h1):(1'h1)]))));
      reg63 <= (~|(reg59 && ($signed($signed(wire54)) << wire56)));
    end
  assign wire64 = (~&((wire52[(4'ha):(3'h6)] ?
                          ($unsigned(wire57) ?
                              {wire53,
                                  reg59} : $unsigned(wire56)) : (^(reg63 ~^ wire53))) ?
                      reg63[(1'h1):(1'h1)] : reg59[(3'h5):(3'h4)]));
  assign wire65 = ((~&(!$signed((reg62 ? wire54 : wire54)))) ?
                      ((8'ha9) ~^ wire54) : wire64);
  always
    @(posedge clk) begin
      if (wire55)
        begin
          reg66 <= wire54[(2'h3):(1'h0)];
          reg67 <= $signed($signed($unsigned(wire55)));
          reg68 <= $unsigned((~&wire53[(1'h1):(1'h1)]));
          reg69 <= reg60;
        end
      else
        begin
          reg66 <= wire52;
          reg67 <= $unsigned((8'hae));
        end
      reg70 <= {reg63,
          ($unsigned(wire55) ?
              {$signed(wire56)} : (wire65 ?
                  (^(reg59 ~^ wire57)) : (wire53 ?
                      (wire65 <<< reg59) : wire55[(1'h1):(1'h0)])))};
      if ($unsigned($signed(reg67)))
        begin
          reg71 <= $signed(wire65);
          reg72 <= $unsigned(((reg70[(3'h5):(3'h5)] - ((reg67 <<< reg58) ?
                  wire55[(3'h4):(1'h1)] : {wire65, reg71})) ?
              (&reg66) : reg61));
        end
      else
        begin
          if ((($signed((reg60[(1'h0):(1'h0)] || wire65[(2'h2):(1'h1)])) ?
                  wire57 : (({wire64, reg70} ^ {reg59}) | (|(|reg70)))) ?
              reg63 : ($unsigned($unsigned($unsigned(wire56))) ?
                  {$unsigned((&reg68)),
                      (((8'had) > (8'hbe)) ?
                          (~|wire65) : $unsigned(reg63))} : wire64[(4'hd):(4'hd)])))
            begin
              reg71 <= (~&({{(+wire55),
                      $unsigned(wire55)}} & ($unsigned({reg58}) ?
                  $signed($unsigned(reg66)) : {wire52})));
              reg72 <= (!reg61);
              reg73 <= $signed((&(reg66 <= (&(wire54 ? reg71 : wire57)))));
              reg74 <= {(~^reg61[(2'h2):(2'h2)])};
            end
          else
            begin
              reg71 <= ({reg66[(3'h4):(3'h4)]} ?
                  (reg59[(1'h0):(1'h0)] ?
                      $unsigned((^$unsigned(wire65))) : ((!$signed(reg67)) > wire56[(3'h6):(2'h2)])) : wire55);
              reg72 <= (((^wire54[(2'h3):(1'h0)]) | wire53) >= (!reg73[(3'h5):(3'h5)]));
              reg73 <= (reg63 || {reg72[(4'h8):(3'h4)]});
              reg74 <= (wire55[(1'h1):(1'h1)] ? reg60 : (8'h9e));
            end
          reg75 <= $unsigned((reg66[(2'h2):(1'h0)] ? reg59 : (8'haf)));
          if ($unsigned((!$signed(reg72[(4'hf):(4'h8)]))))
            begin
              reg76 <= (reg73 ? wire56[(4'h9):(3'h5)] : (+{(+(~&reg67))}));
              reg77 <= wire52;
            end
          else
            begin
              reg76 <= reg77[(4'h9):(2'h2)];
              reg77 <= ($unsigned(reg73) ?
                  (reg75 ?
                      reg62[(1'h0):(1'h0)] : $signed((-(reg74 > reg68)))) : (-(&reg70[(1'h0):(1'h0)])));
              reg78 <= ((~&$unsigned((+(~^reg75)))) != reg72);
              reg79 <= (($unsigned($signed(reg58)) ?
                  wire55[(1'h1):(1'h1)] : (((reg72 ^ reg78) ?
                      (!wire54) : (reg77 > wire52)) & $unsigned(reg66))) <<< ($unsigned($unsigned((^~(7'h44)))) == ({$unsigned(reg76)} * ((reg59 ?
                  reg63 : reg62) <= {reg66, wire64}))));
              reg80 <= ((reg78[(4'h9):(3'h4)] ?
                      reg73[(2'h3):(1'h1)] : $signed(((reg61 + reg77) ?
                          (!reg63) : $signed(wire52)))) ?
                  (^{{(wire52 ? (8'hb3) : reg71),
                          (wire65 ~^ reg59)}}) : {(reg72 - $unsigned((reg76 << wire53)))});
            end
          reg81 <= $signed(($signed((~&(&(8'had)))) ?
              (reg75 ?
                  reg58 : $unsigned((reg73 ? (8'ha1) : reg79))) : ((8'ha0) ?
                  wire55 : {wire57})));
          reg82 <= {$unsigned(reg78[(3'h6):(2'h3)]), reg68};
        end
      reg83 <= $signed({{{wire53}}});
    end
  always
    @(posedge clk) begin
      reg84 <= ((($unsigned(reg70[(3'h4):(3'h4)]) ?
              (~^(reg66 && reg60)) : (~^(~&reg59))) == reg70) ?
          reg77 : (&($signed({reg75,
              (8'h9e)}) >= $unsigned(((8'hab) - (8'hbc))))));
      reg85 <= wire55[(1'h0):(1'h0)];
      if (($signed($signed(((reg79 <<< reg66) && reg77))) ?
          reg77[(4'h9):(4'h8)] : ({reg81[(4'he):(3'h5)]} ?
              reg60[(4'he):(3'h4)] : (~|{$signed(wire57), $unsigned(wire65)}))))
        begin
          reg86 <= ((+((~|wire56[(3'h6):(1'h0)]) ?
                  $signed($signed(reg84)) : wire57)) ?
              ($signed((&$unsigned(reg82))) ?
                  {(^~reg70[(1'h1):(1'h0)])} : reg72[(3'h7):(3'h7)]) : ({(~|{(8'hbb)}),
                  reg81[(3'h6):(2'h3)]} >>> reg59));
        end
      else
        begin
          reg86 <= $unsigned(reg69);
          reg87 <= $unsigned((!$unsigned((|$unsigned(reg66)))));
          reg88 <= $unsigned((&reg78[(1'h1):(1'h1)]));
        end
    end
  always
    @(posedge clk) begin
      reg89 <= ($unsigned(($signed(reg68) ? {reg60} : wire65[(3'h7):(1'h0)])) ?
          $signed((~&($unsigned((8'had)) != (~^reg82)))) : $unsigned((~^{reg80})));
      reg90 <= (8'ha1);
    end
  always
    @(posedge clk) begin
      reg91 <= (reg87[(4'hf):(2'h2)] ^ (reg90[(3'h6):(3'h4)] ?
          $signed(wire56) : reg90));
      reg92 <= (8'hbc);
      reg93 <= reg71[(1'h1):(1'h0)];
      reg94 <= (8'hb8);
      reg95 <= $signed({reg62[(1'h1):(1'h1)]});
    end
  assign wire96 = ((($signed(wire54[(2'h3):(2'h3)]) ?
                              ($signed(wire54) ?
                                  $unsigned(reg73) : reg81) : reg60) ?
                          ($unsigned((+reg73)) != reg80) : reg72) ?
                      $signed({$unsigned((wire56 ?
                              reg75 : reg62))}) : (({(reg70 << (8'ha8))} == wire52) && $signed((wire52[(4'ha):(3'h7)] ~^ $signed(reg77)))));
  assign wire97 = (reg93 ?
                      reg86[(4'hc):(4'hb)] : $signed(($signed($signed(reg74)) ?
                          {$unsigned(reg91),
                              ((8'h9c) ?
                                  wire64 : reg59)} : (~wire64[(1'h0):(1'h0)]))));
  assign wire98 = $unsigned($signed($unsigned($unsigned({(8'hb8)}))));
  assign wire99 = (reg95 <<< $signed($signed(reg58)));
  always
    @(posedge clk) begin
      reg100 <= (-((reg60[(4'hb):(3'h6)] ?
          (((8'h9e) >= reg69) ?
              $unsigned((8'ha9)) : $signed(reg88)) : (~|reg62[(2'h2):(2'h2)])) >>> $unsigned(reg86[(5'h13):(4'he)])));
      reg101 <= $signed($unsigned((wire97[(2'h2):(1'h0)] ?
          ((~wire54) ^~ (reg87 ? (8'hac) : (8'hb7))) : $signed({reg61,
              (8'h9e)}))));
    end
  assign wire102 = (wire57[(4'hb):(4'h9)] ^~ ((((wire97 << wire64) ?
                       $signed(reg74) : (reg73 ?
                           (8'hb6) : reg61)) >>> reg62) ^~ $signed((wire65[(3'h4):(2'h2)] < (+reg95)))));
  assign wire103 = (&$unsigned($unsigned((reg88[(1'h0):(1'h0)] <<< reg81[(4'h9):(3'h5)]))));
  assign wire104 = ({(&$signed($unsigned(reg69)))} || ($unsigned($unsigned($unsigned((8'hbb)))) + (~&(|reg80))));
  assign wire105 = (($signed(wire52) ?
                       (((wire65 ? reg91 : reg84) <= $unsigned(reg100)) ?
                           $unsigned({reg74, reg92}) : reg79) : (((reg73 ?
                               reg83 : reg90) << $signed(reg71)) ?
                           reg100[(3'h6):(1'h0)] : reg90[(3'h4):(1'h0)])) >> (!(+wire57)));
  always
    @(posedge clk) begin
      reg106 <= $signed($unsigned($unsigned((reg90 ?
          $signed(reg91) : (|wire55)))));
      reg107 <= $signed((($signed({reg106,
              wire102}) == wire103[(2'h2):(2'h2)]) ?
          wire52[(4'h8):(3'h6)] : wire104));
    end
endmodule

module module27
#(parameter param47 = {((((-(8'hb0)) | ((8'hb7) ? (7'h42) : (8'hb6))) >> ((8'hab) ? (|(8'hbe)) : ((8'haf) << (8'hb1)))) ? ((^((8'hb1) << (7'h43))) ? {(^~(7'h41)), {(8'hbb), (8'h9e)}} : (8'ha5)) : {(((7'h40) > (8'hbd)) ? ((8'hbf) > (8'hb9)) : ((8'hb8) + (8'h9c))), ({(8'hb6), (8'ha8)} ? (-(8'hb8)) : ((8'hbb) ? (8'hbf) : (8'hb2)))})})
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire [(3'h6):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire33;
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire33,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = wire30;
  always
    @(posedge clk) begin
      reg34 <= (-($unsigned((8'hb5)) - (!$signed($signed((7'h41))))));
      reg35 <= wire33[(3'h4):(1'h0)];
      reg36 <= $unsigned((~&wire31));
      reg37 <= {wire33};
    end
  assign wire38 = $signed($unsigned(reg36));
  assign wire39 = ((wire33[(1'h1):(1'h0)] && wire32) | (^(wire29[(1'h1):(1'h0)] ?
                      {$signed((7'h41))} : (wire33 ^~ (wire29 ?
                          reg37 : reg37)))));
  assign wire40 = wire31;
  assign wire41 = (~&wire40);
  assign wire42 = {wire30[(4'hc):(3'h5)],
                      (wire29 ?
                          {$signed((reg34 & wire40))} : ({(wire30 > wire32)} >>> ($signed(wire29) && (wire28 >> wire39))))};
  assign wire43 = reg35[(4'h8):(1'h1)];
  assign wire44 = wire41[(3'h4):(1'h0)];
  assign wire45 = (^(~&reg36));
  assign wire46 = $signed((^~$unsigned(($signed(wire43) ?
                      $unsigned(wire31) : (~|(7'h42))))));
endmodule
