module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire signed [(5'h12):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire signed [(3'h7):(1'h0)] wire145;
  wire [(5'h11):(1'h0)] wire144;
  wire [(2'h2):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire126;
  wire signed [(5'h15):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire110;
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire112,
                 wire89,
                 wire110,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
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
                 reg128,
                 reg127,
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
                 (1'h0)};
  module5 #() modinst90 (wire89, clk, wire2, wire4, wire1, wire0);
  module91 #() modinst111 (wire110, clk, wire89, wire1, wire4, wire2, wire0);
  assign wire112 = $signed(((wire110 ?
                           $unsigned($unsigned(wire3)) : ((wire4 < (8'hb5)) ?
                               $unsigned(wire89) : wire89)) ?
                       {((~|wire2) >>> wire3)} : wire0[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      if ((~|((~&($unsigned(wire89) ? (wire2 | wire110) : $signed((8'hb6)))) ?
          wire1[(1'h0):(1'h0)] : $signed($unsigned({wire3, wire2})))))
        begin
          reg113 <= $signed((-(wire2[(4'hb):(3'h7)] >> {wire4[(4'he):(4'h9)],
              (~wire89)})));
        end
      else
        begin
          if ({(~((+(wire112 > wire0)) || (wire1[(4'hb):(4'hb)] && {reg113})))})
            begin
              reg113 <= wire3[(1'h0):(1'h0)];
              reg114 <= reg113[(1'h0):(1'h0)];
              reg115 <= $signed(($signed(wire89[(2'h3):(2'h2)]) ?
                  wire110[(4'h8):(2'h2)] : wire3[(2'h2):(2'h2)]));
              reg116 <= reg113;
            end
          else
            begin
              reg113 <= reg115[(3'h5):(1'h1)];
              reg114 <= {$unsigned($unsigned((|(wire1 ? wire89 : wire110)))),
                  ($signed($signed(wire4)) ?
                      $signed($signed((reg114 <= (8'hb7)))) : {{$signed(wire112)}})};
              reg115 <= (((!$signed({reg113, wire0})) == ($unsigned(wire2) ?
                      (&reg115) : (wire4 ? $signed(wire110) : (~&(8'h9d))))) ?
                  ($signed($unsigned($unsigned(reg114))) >>> {wire2}) : $unsigned((((reg113 ?
                          wire3 : wire112) ?
                      (reg116 ^ (8'hba)) : $signed(reg115)) || wire3[(3'h5):(3'h4)])));
              reg116 <= wire89[(1'h0):(1'h0)];
            end
          reg117 <= wire1;
          reg118 <= reg115[(3'h4):(1'h1)];
        end
      reg119 <= {(8'hb2)};
      reg120 <= (~^reg113[(2'h2):(1'h1)]);
      reg121 <= (reg117[(3'h4):(2'h2)] | reg120);
      reg122 <= wire1[(4'h8):(2'h3)];
    end
  assign wire123 = $signed($signed(wire2));
  assign wire124 = (({wire2[(3'h4):(2'h3)]} * (((|reg116) ?
                       reg118[(4'he):(4'hc)] : wire3) + $signed($signed(reg119)))) ~^ ((8'h9d) | $unsigned((reg113 ?
                       (wire89 ? reg120 : (8'ha7)) : $signed(wire89)))));
  assign wire125 = reg115[(4'h8):(2'h3)];
  assign wire126 = (^~$signed($signed(wire0[(4'hd):(2'h2)])));
  always
    @(posedge clk) begin
      reg127 <= ($unsigned(($signed((&wire3)) ?
              {wire126[(4'he):(3'h6)]} : wire3)) ?
          ((reg121 ?
                  (((8'ha5) ?
                      wire125 : wire89) < (wire4 == (8'hb3))) : $signed(((7'h43) ?
                      reg114 : (8'h9d)))) ?
              $unsigned(((!reg116) ?
                  $signed(reg121) : $unsigned(reg113))) : ((~&wire1) * wire0)) : reg113);
      if ($signed($unsigned({($unsigned(wire123) > wire1[(5'h12):(4'hf)])})))
        begin
          reg128 <= $signed($unsigned(($unsigned($unsigned(reg115)) == ((reg114 ?
                  reg119 : wire4) ?
              reg118[(4'he):(3'h4)] : (~|reg116)))));
          reg129 <= $unsigned($unsigned($signed(wire124[(1'h1):(1'h1)])));
          reg130 <= (7'h43);
          reg131 <= reg121[(3'h6):(1'h0)];
          if ((^~($signed(wire112[(4'hf):(4'ha)]) - $signed(({reg127} ?
              wire89[(3'h4):(2'h2)] : (+reg131))))))
            begin
              reg132 <= {((($unsigned((8'haa)) && reg131[(3'h5):(3'h4)]) != ((|wire112) ?
                          (8'hb8) : wire125[(5'h14):(4'hf)])) ?
                      wire89[(2'h2):(1'h1)] : ($signed(reg129) ?
                          {reg113[(3'h5):(2'h3)]} : $signed({wire89})))};
              reg133 <= $unsigned((({(+reg131), ((8'ha8) ^~ reg116)} ?
                  ((reg127 != (8'ha1)) ?
                      (reg116 ?
                          reg114 : reg120) : (wire124 * wire89)) : (wire3 ?
                      wire89[(2'h3):(2'h3)] : $unsigned((8'ha6)))) | wire125));
              reg134 <= reg132[(1'h1):(1'h1)];
              reg135 <= ((^{reg121[(3'h5):(1'h1)]}) ?
                  ({wire2} ^~ reg132[(3'h5):(1'h0)]) : ((+$signed(reg133[(2'h2):(1'h0)])) & $signed($signed((^~reg119)))));
              reg136 <= reg135[(3'h7):(2'h2)];
            end
          else
            begin
              reg132 <= reg113;
              reg133 <= $unsigned($unsigned($signed($unsigned($unsigned(reg129)))));
              reg134 <= (wire125[(1'h1):(1'h0)] ?
                  (-$unsigned(reg116[(2'h2):(2'h2)])) : ((wire110 ?
                      reg113 : {$unsigned(reg131),
                          wire123}) || reg131[(4'h9):(3'h7)]));
              reg135 <= ((reg120 << wire126) & (8'hb1));
            end
        end
      else
        begin
          reg128 <= ((&(!wire126)) || (^~(+$signed(wire89))));
        end
      reg137 <= (~|(!{((~|(8'h9f)) ? reg114 : (&reg133)),
          (~$unsigned(reg133))}));
      if (($unsigned((8'hb9)) <<< reg131[(1'h0):(1'h0)]))
        begin
          reg138 <= ({reg114[(2'h2):(2'h2)]} <= reg133);
          reg139 <= ({($unsigned((reg136 ? reg119 : reg116)) ?
                  wire112 : (reg128[(1'h1):(1'h0)] ?
                      (reg131 ?
                          wire124 : wire112) : (~^reg137)))} >> $unsigned(($signed((wire1 >= reg122)) || {(reg119 ~^ wire1)})));
          reg140 <= ((~^((+reg132[(2'h3):(1'h0)]) >>> ($signed(reg121) - ((7'h43) | (8'ha2))))) ?
              wire1 : reg113[(1'h0):(1'h0)]);
          reg141 <= (((((reg132 >> reg134) == (reg130 - reg115)) & {wire3[(3'h4):(1'h1)],
              (8'haa)}) != (reg118[(5'h13):(2'h2)] >= {(~reg129),
              wire3[(3'h5):(1'h1)]})) >= (-reg131[(4'hd):(2'h3)]));
          reg142 <= (((wire126 ^ (|$signed(reg128))) ?
              wire1[(4'hb):(3'h6)] : (7'h44)) < reg135[(3'h4):(1'h1)]);
        end
      else
        begin
          reg138 <= $signed((~&{($signed(reg135) >> $unsigned(reg113))}));
          reg139 <= (7'h42);
          reg140 <= (|(~|wire3));
        end
    end
  assign wire143 = reg122[(2'h2):(2'h2)];
  assign wire144 = $unsigned((($unsigned((~&(8'h9d))) | reg121) >> {$signed((reg141 ^~ reg115)),
                       (wire126[(3'h7):(3'h7)] ^~ {reg138, wire3})}));
  assign wire145 = {wire3[(3'h5):(1'h0)],
                       $unsigned(({(reg119 * reg118), {wire123}} ?
                           ((wire1 ? reg120 : wire3) - (reg129 ?
                               wire112 : wire124)) : (~((8'h9d) * reg133))))};
  assign wire146 = wire89[(1'h0):(1'h0)];
  assign wire147 = (&$signed(((wire110[(3'h5):(1'h0)] ?
                       (~&reg132) : reg141[(4'h9):(1'h0)]) & wire110[(3'h6):(2'h3)])));
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          if ((^~reg129[(2'h2):(1'h0)]))
            begin
              reg148 <= ((({reg113} ?
                  {(^~wire110)} : (reg120[(1'h0):(1'h0)] ?
                      (wire144 ?
                          reg129 : (8'h9e)) : $unsigned(reg113))) < wire146[(4'h9):(2'h3)]) > ($signed(($unsigned(wire4) && $signed((8'hae)))) << $signed((((8'hab) <= reg137) ?
                  ((8'haa) ? reg137 : reg131) : (wire110 ?
                      reg115 : (7'h43))))));
              reg149 <= reg113[(1'h0):(1'h0)];
            end
          else
            begin
              reg148 <= {(|$unsigned(reg113))};
              reg149 <= reg140[(2'h2):(1'h0)];
              reg150 <= reg139;
              reg151 <= (($unsigned($signed((8'ha9))) ?
                      ((8'hba) ?
                          (8'ha0) : wire146[(2'h2):(1'h1)]) : (-(~|(wire124 < reg149)))) ?
                  reg142[(2'h3):(2'h3)] : ($signed((-$unsigned(reg136))) == (~^((reg150 ?
                      reg136 : reg134) & {wire143}))));
              reg152 <= (8'h9c);
            end
          reg153 <= ((-(wire124 ?
              ((8'ha8) ^ (!reg116)) : $signed(reg115))) <= (({(8'h9f),
                  (reg117 ? wire112 : (8'hb1))} ?
              reg128 : reg150) ^~ $unsigned((&(8'ha1)))));
          if ((|$signed($signed({(reg130 < wire124)}))))
            begin
              reg154 <= reg133[(4'hd):(4'h9)];
              reg155 <= (^~$signed({$signed($signed(wire145)),
                  {{wire112, reg141}, reg139[(1'h0):(1'h0)]}}));
              reg156 <= {$signed(wire147[(3'h5):(1'h1)])};
            end
          else
            begin
              reg154 <= $signed((~|((^~(8'ha1)) ?
                  $signed($signed(reg139)) : (8'ha8))));
              reg155 <= (|($unsigned({{reg115, (8'hb6)}}) ?
                  (|$signed(wire126[(4'ha):(4'h8)])) : wire143[(1'h1):(1'h1)]));
              reg156 <= $signed(wire143);
            end
        end
      else
        begin
          reg148 <= $unsigned((^((8'ha0) - {(reg155 ? reg118 : wire145),
              wire0})));
          if ((($signed(($unsigned(reg153) ?
              reg121[(1'h0):(1'h0)] : reg131)) < reg137[(4'hb):(2'h3)]) >>> (^({{reg116,
                      (8'hb5)}} ?
              ((^~reg121) * (^~(8'ha8))) : wire147[(1'h0):(1'h0)]))))
            begin
              reg149 <= wire110;
              reg150 <= $signed(((((~(8'ha2)) ?
                      (wire124 ? (8'hae) : reg154) : $unsigned(wire112)) ?
                  reg152 : $unsigned($unsigned(wire147))) ^~ reg133));
              reg151 <= reg118[(3'h7):(3'h5)];
            end
          else
            begin
              reg149 <= (((|$unsigned((reg153 ?
                      reg138 : wire3))) * (~&$signed({wire125, wire143}))) ?
                  (+wire2[(4'ha):(1'h0)]) : ({((~&reg130) * ((8'hbe) <= (8'ha5))),
                          ((reg114 ? reg151 : (8'hbb)) - (reg130 ?
                              reg132 : wire143))} ?
                      (~&$signed((^~(8'ha8)))) : (reg121[(1'h0):(1'h0)] ?
                          ((!wire123) || reg127[(2'h2):(1'h1)]) : (~^{wire144,
                              reg137}))));
              reg150 <= $signed($unsigned({(reg148 ^ $unsigned(reg148))}));
              reg151 <= (^~$unsigned($unsigned(($signed((8'hbd)) && ((8'ha3) ?
                  reg139 : (7'h44))))));
              reg152 <= ({(wire147 + (~|(+reg139)))} ^~ wire4);
            end
          reg153 <= ($unsigned(wire145[(3'h7):(3'h7)]) && (^~reg152[(1'h1):(1'h1)]));
          reg154 <= wire1[(4'h8):(2'h3)];
          reg155 <= $unsigned((|reg130[(3'h5):(3'h4)]));
        end
      reg157 <= $unsigned(reg149);
      reg158 <= (-$unsigned(({(reg153 ? (8'ha2) : (8'haf)),
          (reg156 ? wire147 : reg117)} & {(&wire89), (~&wire3)})));
    end
  assign wire159 = reg134[(4'h9):(3'h6)];
  assign wire160 = wire147[(3'h6):(3'h6)];
  assign wire161 = wire159[(5'h11):(4'hb)];
  assign wire162 = $unsigned($unsigned({{(reg156 & reg129),
                           (reg154 ? reg135 : wire112)}}));
endmodule

module module91
#(parameter param109 = ((((((8'hb7) ? (8'hb1) : (8'hb6)) + ((8'hbf) - (8'ha5))) ? (((7'h41) < (7'h44)) ? ((8'ha3) == (8'ha7)) : ((8'ha5) ? (8'ha9) : (8'hb5))) : {{(8'hbd)}}) ~^ ((-(~&(8'h9d))) + (((8'haf) * (7'h44)) ? ((7'h42) != (8'hbe)) : ((8'hb1) + (8'hb6))))) || (|(({(8'hab)} && ((8'hbd) & (8'hbf))) >> (~&((8'hbf) ? (8'had) : (8'hb0)))))))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(4'h9):(1'h0)] wire94;
  input wire signed [(3'h7):(1'h0)] wire93;
  input wire signed [(3'h6):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire97 = ($unsigned(wire95) ?
                      (($signed(wire93[(2'h3):(2'h3)]) * ((wire92 + wire95) ^~ $unsigned(wire94))) ?
                          wire92[(1'h0):(1'h0)] : (+(((8'hb5) ?
                              (8'hbf) : wire93) && (wire96 >> (8'hbd))))) : (({(wire92 ^ wire92),
                                  (^~wire96)} ?
                              wire92[(1'h0):(1'h0)] : wire93) ?
                          (~(~$signed(wire96))) : ((wire94[(4'h9):(4'h9)] ?
                              ((8'ha8) ?
                                  wire93 : wire93) : {wire95}) - ($signed(wire95) < (-wire92)))));
  assign wire98 = (+{wire93[(1'h0):(1'h0)], (^(8'ha9))});
  assign wire99 = $signed((($signed((8'haf)) == $unsigned((~^wire96))) ?
                      ((~|{wire92}) * ((wire98 << wire97) - (wire97 == wire96))) : wire98[(2'h2):(1'h0)]));
  assign wire100 = $unsigned(wire96[(1'h0):(1'h0)]);
  assign wire101 = $unsigned($signed($unsigned(($unsigned((8'ha4)) ?
                       $unsigned((8'hb6)) : (^~wire98)))));
  always
    @(posedge clk) begin
      reg102 <= $unsigned($unsigned((((+wire98) || wire93) + (~^wire97[(2'h3):(2'h2)]))));
      reg103 <= ((|(^~wire99)) ? wire93 : wire92);
      reg104 <= (!$unsigned($signed({$signed(reg102), (wire98 << wire97)})));
      if ((8'ha7))
        begin
          reg105 <= $signed(($unsigned((((8'hae) ?
              (8'h9d) : wire93) | (~|wire92))) << {wire100}));
          reg106 <= reg103;
          reg107 <= $signed(reg104);
          reg108 <= (($unsigned(((~wire97) <<< {reg103,
                  reg106})) >>> (~(~|wire94))) ?
              (reg105[(1'h0):(1'h0)] ?
                  $signed(wire98[(1'h1):(1'h0)]) : $unsigned({(-(8'hb5)),
                      ((7'h43) & reg103)})) : $signed((wire98 ?
                  $unsigned(wire98[(2'h3):(1'h1)]) : reg107)));
        end
      else
        begin
          reg105 <= wire98[(3'h4):(2'h3)];
        end
    end
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire88;
  wire [(4'hb):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire59;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire59,
                 (1'h0)};
  assign wire10 = $signed($unsigned((wire6[(4'he):(4'ha)] && (wire8[(1'h0):(1'h0)] - $unsigned((8'ha8))))));
  assign wire11 = wire9;
  assign wire12 = wire6[(4'ha):(3'h4)];
  assign wire13 = wire7[(3'h6):(2'h2)];
  assign wire14 = ((|wire7[(1'h0):(1'h0)]) > ((wire8[(2'h2):(1'h0)] ?
                          ((wire12 ?
                              wire9 : wire9) & (wire7 == wire9)) : wire11[(3'h4):(3'h4)]) ?
                      (wire10 ?
                          ({wire13, wire13} ?
                              (~^wire11) : $unsigned((8'ha2))) : (&(wire8 ^ wire11))) : wire7));
  assign wire15 = $unsigned((+(~^wire12)));
  assign wire16 = (({(~^wire9[(3'h5):(3'h5)]), (!(~wire15))} ?
                      $signed(((wire14 & wire15) ?
                          ((8'hb6) ~^ wire8) : {(8'hb9)})) : $unsigned(($signed(wire12) ?
                          {wire8} : wire13))) - (&(((wire15 ?
                      wire9 : wire6) - (!wire7)) << wire15[(2'h3):(2'h2)])));
  assign wire17 = $unsigned(($signed(($signed(wire15) ?
                      $unsigned(wire7) : $signed((8'h9c)))) == wire6));
  module18 #() modinst60 (wire59, clk, wire15, wire6, wire14, wire13, wire12);
  module61 #() modinst83 (wire82, clk, wire16, wire59, wire13, wire9);
  assign wire84 = ($unsigned((wire11 ^ {$signed(wire6),
                      $signed(wire12)})) << (-(wire17 ?
                      (wire9 < (~wire82)) : {(^~wire14)})));
  assign wire85 = {$unsigned($unsigned((&((8'hb4) ? wire11 : wire14)))),
                      (~(($signed(wire84) && {wire15,
                          wire15}) < $signed((wire9 ? wire6 : (8'hb3)))))};
  assign wire86 = $signed((wire13[(3'h7):(2'h2)] > (-(wire14 >>> (~^(8'hb1))))));
  assign wire87 = (~|wire11);
  assign wire88 = {(($signed(wire59[(1'h0):(1'h0)]) ?
                          $signed({wire12}) : {wire7,
                              (wire87 || wire85)}) >= {$signed((wire17 == (8'hba)))}),
                      $unsigned((wire9[(4'hf):(2'h2)] < wire11))};
endmodule

module module61
#(parameter param81 = (8'h9f))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire65;
  input wire signed [(3'h4):(1'h0)] wire64;
  input wire [(5'h13):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire68,
                 wire67,
                 wire66,
                 reg77,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire66 = $signed($unsigned($unsigned((|wire63))));
  assign wire67 = wire66;
  assign wire68 = wire67;
  always
    @(posedge clk) begin
      reg69 <= (|wire65[(4'h9):(3'h7)]);
      reg70 <= $signed($unsigned(wire67[(3'h4):(2'h2)]));
      if (((~^(-$signed((wire64 ?
          reg69 : reg69)))) + (!$signed(wire68[(1'h1):(1'h0)]))))
        begin
          reg71 <= $unsigned($unsigned(wire62[(3'h5):(1'h0)]));
          reg72 <= (!(wire62 >> (!$signed(wire64[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg71 <= reg72;
          reg72 <= $unsigned((+(wire68 ?
              $signed(wire68[(3'h4):(2'h3)]) : $signed((wire63 * wire64)))));
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed((~&(wire65 < reg72))))))
        begin
          reg73 <= reg72;
        end
      else
        begin
          reg73 <= (8'hae);
          reg74 <= $unsigned(($signed((^$unsigned(wire62))) != reg71[(5'h12):(4'hc)]));
          reg75 <= ((|((reg70 ?
              (^~wire64) : (reg73 ?
                  wire64 : wire63)) ^~ (reg69 ^ wire64))) ~^ reg74[(4'ha):(3'h5)]);
        end
    end
  assign wire76 = ($unsigned(((7'h44) << reg71)) ?
                      reg71 : (^~$signed($unsigned($unsigned((8'had))))));
  always
    @(posedge clk) begin
      reg77 <= reg74;
    end
  assign wire78 = $signed(wire67[(1'h1):(1'h1)]);
  assign wire79 = {$unsigned((wire67 ?
                          $unsigned((reg71 <<< wire67)) : wire66))};
  assign wire80 = {$signed(((8'hab) ?
                          $unsigned($signed(wire62)) : wire64[(1'h0):(1'h0)]))};
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 wire31,
                 wire25,
                 wire24,
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
                 reg33,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire24 = (~|($signed((+(wire21 ?
                      wire19 : wire21))) - ($unsigned((wire21 | (8'ha6))) ?
                      {wire20} : $signed((^~wire19)))));
  assign wire25 = wire22;
  always
    @(posedge clk) begin
      reg26 <= ({(wire25[(4'h8):(2'h3)] ^~ wire20),
          ((wire19 && wire19) ?
              ((~^(8'ha0)) | wire24) : wire21[(2'h2):(1'h0)])} ^ wire20[(4'h8):(2'h3)]);
      if ($signed(wire21))
        begin
          reg27 <= $unsigned((7'h42));
          reg28 <= (({$signed(reg27[(1'h0):(1'h0)])} ^~ (!wire21[(4'h8):(1'h1)])) ~^ (wire22[(4'h8):(1'h1)] ?
              wire23 : reg27));
        end
      else
        begin
          reg27 <= ({wire24[(1'h1):(1'h0)],
              wire22[(1'h0):(1'h0)]} || (((7'h42) ?
                  reg26[(3'h4):(2'h3)] : ({wire19, wire25} >= (8'hb4))) ?
              $signed(wire21[(4'h9):(4'h9)]) : {(&(7'h42)),
                  $unsigned($signed(wire21))}));
          reg28 <= reg26[(1'h0):(1'h0)];
        end
      reg29 <= ((8'hb8) ?
          {$signed(((wire22 ? wire20 : reg28) ? wire25 : $signed(reg28))),
              (($unsigned(wire21) * wire25[(1'h1):(1'h1)]) & {(reg28 ?
                      wire19 : wire24),
                  (^~wire20)})} : {((~&reg27) && ($signed(wire25) ?
                  wire19 : $unsigned((8'ha1))))});
      reg30 <= wire24[(2'h2):(1'h0)];
    end
  assign wire31 = wire21[(3'h4):(2'h3)];
  assign wire32 = wire20;
  always
    @(posedge clk) begin
      reg33 <= $signed(((-(-(wire19 ? reg28 : wire23))) ?
          (wire22[(5'h10):(4'hf)] ?
              (+(reg30 ? wire31 : (8'hb0))) : ({wire24, wire19} ?
                  (reg29 ?
                      wire20 : wire20) : $unsigned((8'ha9)))) : (reg30[(4'he):(4'h9)] << $unsigned((reg26 ?
              wire25 : reg26)))));
    end
  assign wire34 = reg29;
  assign wire35 = reg26[(4'h9):(3'h5)];
  assign wire36 = {($signed({wire35[(5'h13):(4'h9)], (~^wire21)}) ?
                          ((^(|reg29)) ?
                              ((8'ha7) - wire21[(3'h4):(1'h1)]) : (((8'had) ?
                                  wire32 : (8'hb8)) * (wire32 ?
                                  (8'ha3) : wire24))) : ($unsigned($signed((8'hab))) ?
                              (+(~^reg28)) : $unsigned(wire22))),
                      ({(wire32[(3'h6):(1'h0)] > wire22[(3'h5):(1'h0)]),
                          reg28[(2'h3):(2'h2)]} ~^ (~^wire23))};
  assign wire37 = (8'hb2);
  assign wire38 = $unsigned($unsigned($unsigned($signed({wire36, wire35}))));
  always
    @(posedge clk) begin
      if (wire19[(3'h5):(2'h2)])
        begin
          reg39 <= $signed(wire22[(4'hd):(3'h7)]);
          if ((-(wire32[(4'hd):(4'hb)] > $unsigned(($unsigned(wire35) ^ (reg29 ?
              reg26 : reg33))))))
            begin
              reg40 <= $signed($signed(((~reg29[(1'h0):(1'h0)]) < wire20)));
            end
          else
            begin
              reg40 <= ((~&{$signed($signed((8'ha0))), wire23}) || wire20);
              reg41 <= wire21;
              reg42 <= (^reg40[(1'h0):(1'h0)]);
              reg43 <= reg33;
            end
          if ($unsigned(wire31))
            begin
              reg44 <= ($signed((^$unsigned(wire22[(1'h1):(1'h0)]))) | ($signed(($unsigned(reg29) ?
                      (!wire19) : $unsigned(wire21))) ?
                  ($signed((+reg28)) ^~ reg39) : reg33[(1'h0):(1'h0)]));
              reg45 <= (((wire22[(4'hb):(3'h4)] ?
                  (~{wire37,
                      reg28}) : wire23[(1'h1):(1'h0)]) << $signed(((wire34 ?
                      (8'hbe) : reg43) ?
                  reg41 : {reg30, reg27}))) - (&wire35[(1'h1):(1'h0)]));
              reg46 <= ((((^~{reg30, wire20}) <<< (~$signed(wire20))) ?
                      ((^~$signed(reg44)) >>> ((~wire21) ?
                          {wire20} : (wire23 ?
                              reg27 : wire35))) : (wire25[(3'h6):(3'h6)] <<< $signed(wire37[(1'h0):(1'h0)]))) ?
                  reg42[(1'h1):(1'h0)] : (8'hbc));
            end
          else
            begin
              reg44 <= (8'haf);
              reg45 <= (($signed($signed($signed(wire35))) ? wire31 : (8'ha1)) ?
                  reg42 : wire37[(2'h3):(2'h3)]);
            end
          reg47 <= ($unsigned((^reg42[(2'h3):(2'h2)])) >> $unsigned(wire20));
          reg48 <= $unsigned($signed(reg44[(2'h3):(2'h2)]));
        end
      else
        begin
          if ($unsigned($unsigned($unsigned(wire21))))
            begin
              reg39 <= {((^~wire32) ?
                      {$signed($signed(wire25)), wire35} : (~^$signed(reg46)))};
              reg40 <= $signed(reg43);
              reg41 <= ($signed(wire38) ^ (+{$signed({reg46}),
                  wire23[(1'h1):(1'h0)]}));
            end
          else
            begin
              reg39 <= reg41;
              reg40 <= reg46[(2'h3):(1'h0)];
              reg41 <= (($unsigned(wire20) << ($signed({wire32}) >>> $unsigned($signed(wire35)))) ?
                  $unsigned((!($signed(wire36) >= wire22[(4'h8):(3'h7)]))) : $unsigned($signed({reg42})));
              reg42 <= $signed((^~$signed(reg33)));
              reg43 <= $signed((^~$signed((8'ha2))));
            end
        end
      if ((($unsigned(reg26) ?
          wire36 : (reg45 ?
              $signed($signed(reg43)) : {reg45,
                  {reg46, wire32}})) ^~ wire34[(4'hb):(3'h6)]))
        begin
          reg49 <= (+(8'ha2));
        end
      else
        begin
          reg49 <= reg30;
          reg50 <= ($signed($unsigned($signed($unsigned(reg40)))) || ((8'hae) ?
              ((~|(reg45 && (8'ha1))) && (wire38[(4'h9):(3'h7)] ?
                  (8'ha5) : $unsigned(wire31))) : $signed($unsigned((reg48 <= (8'haa))))));
          reg51 <= reg42[(2'h2):(2'h2)];
          reg52 <= {(reg48 ?
                  (~|(~^(+(8'hba)))) : $signed($signed($signed(wire22)))),
              ((((wire32 ? wire36 : reg28) > $unsigned(wire21)) ~^ (reg44 ?
                  (-wire32) : reg50)) < (wire36[(5'h12):(3'h4)] ?
                  {(+wire38)} : (wire20[(2'h2):(1'h0)] ?
                      (8'haa) : {(8'h9d), wire23})))};
        end
    end
  assign wire53 = {(~|({(~|(8'hb0))} ?
                          $signed($signed(reg47)) : {(reg50 ? wire19 : (8'ha9)),
                              $unsigned(wire24)})),
                      $signed($signed(reg42[(1'h1):(1'h1)]))};
  assign wire54 = (~|(!$signed(reg28)));
  assign wire55 = wire34[(3'h4):(2'h2)];
  assign wire56 = $unsigned(wire55);
  assign wire57 = (reg48 ?
                      ((~&reg28) ?
                          wire54[(1'h0):(1'h0)] : {$signed((|wire31))}) : ($unsigned((reg28[(2'h3):(2'h3)] ?
                              $signed(wire20) : reg50[(2'h2):(2'h2)])) ?
                          $unsigned($unsigned((+wire24))) : ($unsigned($unsigned(wire20)) ?
                              ((8'h9d) | wire25) : $unsigned({reg28,
                                  wire23}))));
  assign wire58 = $unsigned(reg28[(2'h3):(1'h1)]);
endmodule
