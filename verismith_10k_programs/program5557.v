module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire330;
  wire signed [(5'h12):(1'h0)] wire329;
  wire signed [(5'h10):(1'h0)] wire327;
  wire [(5'h13):(1'h0)] wire326;
  wire signed [(5'h15):(1'h0)] wire325;
  wire [(3'h6):(1'h0)] wire324;
  wire signed [(5'h15):(1'h0)] wire323;
  wire [(4'h8):(1'h0)] wire321;
  wire [(5'h12):(1'h0)] wire320;
  wire [(5'h10):(1'h0)] wire319;
  wire signed [(5'h11):(1'h0)] wire315;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire317;
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  assign y = {wire330,
                 wire329,
                 wire327,
                 wire326,
                 wire325,
                 wire324,
                 wire323,
                 wire321,
                 wire320,
                 wire319,
                 wire315,
                 wire81,
                 wire70,
                 wire69,
                 wire67,
                 wire6,
                 wire5,
                 wire4,
                 wire317,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 (1'h0)};
  assign wire4 = {($unsigned(((wire2 ? wire3 : wire3) == {(8'haa)})) ?
                         wire3[(4'h8):(1'h1)] : wire3[(3'h7):(3'h6)])};
  assign wire5 = (~^$signed((8'hb2)));
  assign wire6 = (!$unsigned(((wire3 >>> wire0[(2'h3):(1'h0)]) + wire4[(4'he):(1'h0)])));
  module7 #() modinst68 (.wire10(wire6), .clk(clk), .y(wire67), .wire9(wire4), .wire8(wire3), .wire11(wire5));
  assign wire69 = $unsigned(wire67[(1'h0):(1'h0)]);
  assign wire70 = {$unsigned($unsigned($signed((wire69 ? wire0 : wire67))))};
  always
    @(posedge clk) begin
      reg71 <= $unsigned((8'hba));
      reg72 <= $unsigned(((^((wire67 <= (8'h9d)) ?
              ((7'h41) - reg71) : ((8'h9c) > reg71))) ?
          wire67[(1'h0):(1'h0)] : wire6));
      if ((8'hb9))
        begin
          if ($unsigned(((~&((~^wire6) ? {wire3, reg72} : {reg72})) ?
              $unsigned(wire4) : {(~$signed(wire69))})))
            begin
              reg73 <= $unsigned($signed(wire1[(5'h12):(4'he)]));
              reg74 <= wire0[(3'h6):(1'h1)];
              reg75 <= ($unsigned(wire0[(3'h4):(3'h4)]) ^ {$signed({$unsigned((8'ha8))}),
                  (wire1 ~^ $unsigned((wire67 < reg72)))});
              reg76 <= ($unsigned(($unsigned((reg75 ? wire67 : reg74)) ?
                  ((~^wire69) ?
                      (wire0 + wire4) : wire2[(2'h2):(1'h1)]) : wire67[(1'h1):(1'h0)])) * ({wire3[(3'h7):(3'h5)],
                      $signed(reg72)} ?
                  ($signed(reg74[(4'hb):(2'h2)]) & wire70[(4'hd):(4'hd)]) : $signed((^(8'haa)))));
              reg77 <= {$unsigned(reg72),
                  $unsigned(({(~reg71), $unsigned(reg76)} >>> $unsigned((reg72 ?
                      (8'hb0) : wire67))))};
            end
          else
            begin
              reg73 <= (($signed((reg76[(4'h9):(4'h8)] ? wire69 : wire3)) ?
                  reg73 : $unsigned(reg72[(3'h5):(2'h2)])) || reg72);
              reg74 <= ($signed((8'hb0)) ?
                  ((|(~^(reg74 || reg73))) != $unsigned(((wire69 ?
                      (8'hac) : wire0) ^~ $signed(reg75)))) : (($unsigned($unsigned(wire4)) ^ (wire70[(5'h12):(5'h12)] ?
                          $unsigned(reg76) : (wire5 * reg73))) ?
                      ((+wire67[(1'h0):(1'h0)]) ?
                          $unsigned(reg76) : $signed(reg71[(3'h6):(2'h2)])) : (!wire4[(5'h15):(4'he)])));
              reg75 <= $unsigned(wire0);
              reg76 <= (&$unsigned(reg72[(3'h5):(2'h3)]));
              reg77 <= {((~^{(&wire6)}) | reg71), wire6};
            end
          reg78 <= $signed($signed((reg75[(3'h7):(2'h2)] <= $unsigned(((8'h9d) ^ reg75)))));
          reg79 <= wire4;
        end
      else
        begin
          reg73 <= wire69;
          reg74 <= ((~^(wire4 < $unsigned((wire0 ?
              reg71 : wire3)))) <<< wire69);
          reg75 <= (wire2[(1'h1):(1'h1)] ?
              ({reg75} ? wire70[(5'h13):(4'ha)] : wire70) : {(8'ha7)});
        end
      reg80 <= ({$unsigned(wire69)} ?
          {{{(reg74 >= reg79)}}} : $signed($signed({$signed(wire4),
              (wire0 | wire3)})));
    end
  assign wire81 = (($signed(reg78) ?
                          reg76[(1'h0):(1'h0)] : (($signed(wire67) == $unsigned(reg71)) ?
                              (^~reg78) : ((reg71 ?
                                  reg80 : reg73) || $signed(reg71)))) ?
                      $signed(wire3) : wire1);
  module82 #() modinst316 (wire315, clk, wire6, wire3, reg73, wire4);
  module267 #() modinst318 (wire317, clk, reg76, wire5, wire70, reg73, wire81);
  assign wire319 = (~|(((~^(wire0 - wire6)) ? reg80[(2'h2):(1'h0)] : wire317) ?
                       $unsigned(wire5[(5'h10):(4'h8)]) : $signed($unsigned((wire70 >> reg72)))));
  assign wire320 = reg78[(2'h2):(1'h1)];
  module194 #() modinst322 (.wire197(wire3), .clk(clk), .wire198(wire69), .wire196(reg79), .wire195(wire315), .y(wire321), .wire199(wire70));
  assign wire323 = wire67;
  assign wire324 = $signed($signed(wire5));
  assign wire325 = ({(((~wire3) ?
                               wire315[(2'h3):(1'h1)] : (reg80 ?
                                   wire69 : wire67)) ^~ wire4[(4'h8):(3'h5)])} ?
                       ((wire81[(3'h6):(1'h0)] ~^ ((+wire70) > (reg75 >> reg76))) ?
                           reg77[(3'h5):(1'h1)] : ((^(wire6 ?
                                   (8'ha3) : wire81)) ?
                               wire324[(1'h0):(1'h0)] : reg78[(2'h2):(2'h2)])) : (wire6[(3'h5):(1'h1)] <= (($signed(reg76) != $signed(wire324)) ?
                           {wire67} : {$unsigned((8'ha1))})));
  assign wire326 = (~reg78);
  module87 #() modinst328 (.wire91(wire319), .wire88(wire317), .clk(clk), .y(wire327), .wire89(wire67), .wire90(wire0));
  assign wire329 = ({wire70[(3'h5):(2'h2)],
                       (~|((reg73 ^ reg79) - {wire317,
                           reg78}))} >>> (wire325[(5'h13):(3'h5)] ?
                       {$signed($signed(wire5)),
                           $signed($unsigned(reg72))} : (!reg73)));
  module267 #() modinst331 (.wire271(wire0), .wire268(wire2), .wire272(wire81), .clk(clk), .y(wire330), .wire270(wire320), .wire269(reg75));
endmodule

module module82
#(parameter param313 = ((&((~^((8'ha4) ? (8'ha5) : (8'haa))) ? (|((8'ha0) ? (8'hb6) : (8'ha8))) : (^(~|(8'hae))))) ? ((8'hb2) ? ((^((8'hb1) - (8'hbb))) ? (!((8'hbe) ? (8'haf) : (8'h9f))) : (((8'hb4) ? (8'hb2) : (8'hb7)) == ((7'h43) <= (8'ha2)))) : {{((8'haf) >>> (8'hbb)), ((8'ha4) ? (8'hb9) : (8'hb7))}, (~&((8'hb2) * (8'ha5)))}) : (~|{({(8'hb2), (8'ha7)} + ((7'h44) ? (8'hb5) : (8'ha1))), ((~|(8'ha4)) != ((8'haa) ? (7'h42) : (8'ha1)))})), 
parameter param314 = (({((param313 ? param313 : param313) ? (-param313) : (param313 & param313)), param313} ? ({(~|(8'hac))} >>> {(param313 <= param313), param313}) : (!(~&((8'hb6) ? (8'ha6) : param313)))) ? ((+param313) << ({((7'h43) >= param313), param313} > ((param313 == param313) ^~ (param313 >> param313)))) : param313))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h224):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire86;
  input wire signed [(4'hc):(1'h0)] wire85;
  input wire signed [(5'h15):(1'h0)] wire84;
  input wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire312;
  wire [(4'h9):(1'h0)] wire311;
  wire [(3'h6):(1'h0)] wire152;
  wire signed [(5'h13):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire260;
  wire [(3'h7):(1'h0)] wire262;
  wire [(5'h10):(1'h0)] wire263;
  wire signed [(2'h2):(1'h0)] wire264;
  wire signed [(4'h9):(1'h0)] wire265;
  wire signed [(5'h13):(1'h0)] wire266;
  wire signed [(4'ha):(1'h0)] wire309;
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(3'h5):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg174 = (1'h0);
  reg [(2'h2):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  reg [(4'hd):(1'h0)] reg178 = (1'h0);
  reg [(3'h7):(1'h0)] reg179 = (1'h0);
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg181 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg184 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg186 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg [(4'h8):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg191 = (1'h0);
  reg [(5'h12):(1'h0)] reg192 = (1'h0);
  reg [(4'hb):(1'h0)] reg193 = (1'h0);
  assign y = {wire312,
                 wire311,
                 wire152,
                 wire103,
                 wire102,
                 wire100,
                 wire154,
                 wire260,
                 wire262,
                 wire263,
                 wire264,
                 wire265,
                 wire266,
                 wire309,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 (1'h0)};
  module87 #() modinst101 (.wire90(wire84), .wire91(wire85), .y(wire100), .wire89(wire83), .clk(clk), .wire88(wire86));
  assign wire102 = ($unsigned($unsigned((^~wire83))) ?
                       (8'had) : $unsigned(((+{(8'hba)}) >= ($signed(wire83) >> wire85))));
  assign wire103 = (wire85 <= wire102[(3'h5):(2'h3)]);
  module104 #() modinst153 (.wire109(wire85), .wire107(wire103), .y(wire152), .clk(clk), .wire108(wire86), .wire106(wire102), .wire105(wire84));
  assign wire154 = ($unsigned((((wire100 & wire86) != (!wire100)) ?
                       (&$unsigned(wire84)) : wire83[(4'hb):(1'h1)])) + wire84[(4'hf):(3'h5)]);
  always
    @(posedge clk) begin
      if (wire85[(2'h2):(2'h2)])
        begin
          reg155 <= wire152;
          reg156 <= wire154[(1'h1):(1'h0)];
        end
      else
        begin
          reg155 <= {(-{((!(8'hae)) ?
                      (wire86 <= wire103) : (wire154 > wire152)),
                  ({wire103, wire100} == $unsigned((8'ha0)))}),
              $unsigned(wire83[(1'h0):(1'h0)])};
          reg156 <= $signed(({wire100, (~|reg155[(1'h1):(1'h0)])} ?
              wire103 : (~&wire154[(4'hb):(4'hb)])));
          if ({$signed((^~((8'hb0) ? ((8'hba) <<< wire86) : wire152))),
              (|$unsigned((|$signed(wire85))))})
            begin
              reg157 <= {$signed(wire86), reg155[(2'h2):(2'h2)]};
              reg158 <= $signed((~^($unsigned(wire154) ?
                  (wire154 <<< $signed(wire154)) : $unsigned($unsigned(wire102)))));
              reg159 <= reg155;
            end
          else
            begin
              reg157 <= $signed($unsigned($unsigned((!(wire102 ^ wire154)))));
              reg158 <= (-(({$unsigned(wire102), {reg159, (8'h9c)}} ?
                      $signed((~|reg157)) : (wire154 >= (reg156 ~^ reg156))) ?
                  wire102 : (8'h9c)));
              reg159 <= wire86;
              reg160 <= wire102[(4'hb):(3'h5)];
            end
          reg161 <= reg160[(2'h2):(1'h0)];
          if ((~&(~&wire86[(3'h5):(3'h4)])))
            begin
              reg162 <= (reg158[(4'he):(4'he)] ?
                  (^~$signed(reg157[(3'h4):(1'h1)])) : (~{(reg161 <= $signed(reg157)),
                      wire83[(2'h3):(1'h1)]}));
              reg163 <= wire102;
              reg164 <= wire86[(1'h0):(1'h0)];
              reg165 <= (~^$unsigned(wire84[(5'h12):(4'ha)]));
              reg166 <= $signed($unsigned(reg158));
            end
          else
            begin
              reg162 <= (($unsigned((!(wire103 > reg159))) << ((((8'hbe) - reg163) ?
                  (reg160 ? (8'ha7) : reg156) : ((8'hb6) ?
                      (8'hbf) : reg158)) - ((~&reg159) != (~|wire85)))) & ((($unsigned(reg161) <<< (reg157 ?
                      reg166 : reg161)) ?
                  reg156[(2'h3):(1'h1)] : reg158[(1'h1):(1'h1)]) == (($signed(reg164) ~^ (wire102 ^~ reg156)) ?
                  $signed((&reg165)) : (~|$signed(wire154)))));
              reg163 <= {(!wire86)};
              reg164 <= wire154;
              reg165 <= (+wire83);
            end
        end
      if ($signed($unsigned((&$unsigned(reg163)))))
        begin
          reg167 <= ((($unsigned(wire83[(3'h4):(1'h1)]) ?
                  {$signed(wire154), (reg162 < reg159)} : (^~{(8'hb0)})) ?
              wire102 : (^~(-(reg165 >= reg161)))) <= wire85);
          reg168 <= (7'h41);
          if ($unsigned((wire83 || $unsigned(reg158))))
            begin
              reg169 <= $signed(wire85);
              reg170 <= $unsigned({($unsigned($unsigned(wire85)) >= ((reg165 ?
                      reg159 : wire83) <= (~wire84))),
                  $unsigned($unsigned($signed(reg158)))});
              reg171 <= reg169[(3'h4):(2'h3)];
            end
          else
            begin
              reg169 <= wire85[(1'h0):(1'h0)];
            end
          if (($unsigned(reg161) && ($signed($unsigned($unsigned(wire86))) ?
              (~|(reg160 ?
                  {reg161,
                      reg169} : ((8'hbe) * wire85))) : $unsigned({reg155[(1'h0):(1'h0)],
                  (wire152 > (8'haa))}))))
            begin
              reg172 <= (|reg161[(4'ha):(3'h4)]);
            end
          else
            begin
              reg172 <= (($signed(reg168[(4'hb):(4'h8)]) ?
                      $unsigned((~&{reg169})) : reg163) ?
                  (wire100[(3'h4):(1'h1)] ?
                      $unsigned(($signed((8'hb5)) >= (wire86 ?
                          (8'hbe) : (8'haa)))) : reg170[(1'h0):(1'h0)]) : reg165);
            end
        end
      else
        begin
          reg167 <= {reg160};
          reg168 <= wire102[(4'h9):(3'h4)];
        end
      if ((wire83[(1'h1):(1'h0)] >>> ((({wire102,
                  reg168} ^ (reg157 && reg167)) ?
              $unsigned((reg168 << wire85)) : ((+(8'h9c)) >>> wire154)) ?
          {reg159,
              ((reg167 ? reg162 : reg164) ?
                  reg172 : $signed(reg155))} : ($signed(reg165) ?
              {wire154} : {((8'hbb) < reg165), reg159}))))
        begin
          reg173 <= (($unsigned((reg168 ^ (reg159 ? (7'h41) : reg158))) ?
                  ($signed((wire102 ? wire103 : reg168)) ?
                      (((8'h9d) << wire103) > wire154) : (reg157 ?
                          $signed((7'h43)) : (reg169 ?
                              (8'h9d) : wire83))) : $unsigned((&(reg171 ~^ reg158)))) ?
              (~(reg156 | $signed({(8'ha3)}))) : (~&wire102[(3'h5):(3'h4)]));
          reg174 <= (reg173 ?
              (+wire85) : {wire85,
                  {(&$signed(reg163)),
                      ($signed(reg162) ?
                          reg165[(1'h1):(1'h0)] : {(8'ha6), wire83})}});
        end
      else
        begin
          reg173 <= (wire102[(2'h3):(2'h2)] <= ((reg163 ?
                  (reg160 | wire100) : reg156) ?
              wire102 : (~|$signed(reg173[(2'h3):(2'h3)]))));
        end
      if ($signed(($unsigned(($signed(reg172) ?
              ((8'hb5) != (8'hbb)) : $signed(reg160))) ?
          $unsigned(((&reg167) ?
              wire84 : (wire100 ? reg174 : (8'ha9)))) : reg162)))
        begin
          reg175 <= reg164;
          reg176 <= $signed((&($signed({wire84, reg170}) ?
              {(wire83 < wire84), wire102} : (~&(reg173 ? wire102 : reg163)))));
          if (wire154[(1'h1):(1'h0)])
            begin
              reg177 <= $unsigned(reg175[(1'h1):(1'h1)]);
              reg178 <= {reg158};
            end
          else
            begin
              reg177 <= reg171[(4'ha):(4'h9)];
              reg178 <= reg165[(1'h1):(1'h1)];
            end
          reg179 <= $signed({reg165});
        end
      else
        begin
          if (((&(reg166[(3'h5):(2'h2)] >> $unsigned({wire86,
              reg162}))) >>> {(~^$unsigned($signed(reg162)))}))
            begin
              reg175 <= $unsigned({{(8'ha5), $unsigned(wire154[(2'h3):(1'h0)])},
                  ($signed({wire85, wire103}) != ((&wire102) ?
                      {reg155} : (wire83 == wire103)))});
              reg176 <= (reg161[(3'h5):(2'h2)] ?
                  ($unsigned((wire152 ? wire100 : $unsigned((8'hb4)))) ?
                      (reg172 >>> reg162) : $signed(((reg168 < (8'hb8)) > (reg174 && reg178)))) : $unsigned(reg168));
              reg177 <= $signed((($signed($signed((8'ha6))) != {$signed(reg164)}) > $unsigned(($signed((8'hba)) + reg178[(4'hc):(4'ha)]))));
            end
          else
            begin
              reg175 <= ($signed((8'ha6)) && reg171);
              reg176 <= $unsigned($signed(wire154[(3'h4):(1'h0)]));
              reg177 <= $unsigned(((^reg157[(4'h9):(3'h5)]) ?
                  ((reg162 << $unsigned((8'ha8))) < $signed(((8'ha9) | (8'ha5)))) : ((7'h41) ?
                      reg159[(2'h3):(2'h2)] : reg166[(1'h1):(1'h0)])));
            end
          if (($unsigned(((reg169[(3'h5):(3'h4)] ?
                  (!reg173) : reg169[(3'h6):(3'h4)]) | (reg155 ~^ (8'h9e)))) ?
              reg170[(4'he):(3'h7)] : (&{$signed(reg166[(1'h1):(1'h1)])})))
            begin
              reg178 <= reg178;
              reg179 <= ((reg162[(2'h2):(2'h2)] ?
                      (+((reg159 <<< reg173) ^ (+reg166))) : $unsigned({(~reg162),
                          $unsigned(reg156)})) ?
                  (reg155[(2'h3):(1'h0)] < wire84[(2'h2):(1'h0)]) : (-{(+$signed(reg163))}));
              reg180 <= $unsigned($signed(((-(&reg168)) | wire103)));
              reg181 <= reg178;
              reg182 <= $signed($unsigned((+{(^reg172)})));
            end
          else
            begin
              reg178 <= wire152[(3'h6):(1'h1)];
              reg179 <= ($signed(((reg156[(3'h5):(3'h4)] <= {reg163, reg177}) ?
                  wire154[(3'h4):(1'h0)] : (((8'hbb) ?
                      (8'hbe) : reg170) & $signed(reg168)))) || $signed((!{reg172,
                  (reg167 | reg179)})));
              reg180 <= wire152[(2'h2):(1'h0)];
            end
          if ($signed({reg175}))
            begin
              reg183 <= (-($signed(reg172[(3'h4):(1'h1)]) <<< (wire84[(3'h5):(3'h5)] << $unsigned((wire154 ?
                  reg178 : wire100)))));
              reg184 <= ($unsigned(wire86[(3'h7):(3'h4)]) ?
                  (!{(reg181[(2'h2):(2'h2)] ?
                          wire152 : {reg172,
                              reg172})}) : ((-$unsigned((|reg156))) ?
                      (($unsigned(reg171) ?
                          (-wire152) : (+reg155)) > $unsigned((reg159 ?
                          reg165 : reg155))) : reg165[(3'h6):(2'h3)]));
              reg185 <= reg173;
              reg186 <= (reg174[(3'h5):(2'h2)] >> $signed((($signed(reg156) ^ (reg183 ^ reg184)) ?
                  (8'ha6) : reg175[(2'h2):(2'h2)])));
            end
          else
            begin
              reg183 <= (reg182 >> ($unsigned($unsigned($unsigned(reg183))) ^ (^~$unsigned((reg186 - reg170)))));
            end
          reg187 <= {reg161[(2'h3):(1'h1)]};
        end
      if (({(~^((|reg157) || (reg176 ^~ reg173))),
          ($unsigned(reg157) ^~ (-(reg162 * reg161)))} <= ((reg182[(3'h4):(2'h3)] ?
              $signed((!reg166)) : $unsigned((reg168 * reg158))) ?
          reg162 : ((^~$unsigned((7'h42))) ?
              $unsigned((reg165 ? reg184 : reg179)) : reg167))))
        begin
          if (reg186[(1'h0):(1'h0)])
            begin
              reg188 <= (8'ha7);
              reg189 <= {(reg175 ?
                      ((~&(reg185 ? reg173 : reg161)) ?
                          ((~^reg171) ?
                              (wire103 ?
                                  reg159 : reg168) : {reg174}) : $signed($unsigned((7'h44)))) : $unsigned((~&wire84)))};
              reg190 <= ($unsigned($signed((~^$signed(reg172)))) ?
                  ($unsigned(reg178) ^ reg189[(3'h6):(3'h6)]) : $signed(((^(reg167 == wire103)) ?
                      {reg158[(4'h8):(3'h5)],
                          reg155} : $unsigned(wire100[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg188 <= reg182;
              reg189 <= ($signed(({reg171} > (((8'h9c) <<< reg187) >> reg167))) <= reg160[(2'h2):(2'h2)]);
            end
          reg191 <= (((+$signed(reg175[(1'h1):(1'h1)])) ?
                  ({((8'ha3) * (8'hbf))} ?
                      ((8'hba) ?
                          {(8'hab)} : (reg163 ?
                              reg181 : (8'hac))) : (8'ha7)) : (8'ha6)) ?
              $signed((!((8'hb6) * reg171[(3'h6):(3'h5)]))) : $unsigned($unsigned($signed((~(8'hb3))))));
          reg192 <= reg161[(4'hc):(4'h8)];
          reg193 <= reg174;
        end
      else
        begin
          reg188 <= $unsigned((wire85 ?
              reg193 : {$unsigned({reg184, (8'hb8)})}));
          reg189 <= reg163[(2'h2):(1'h1)];
          reg190 <= $unsigned((reg157[(2'h3):(1'h1)] ?
              $unsigned(({reg166,
                  wire102} <<< (reg177 >= wire100))) : $signed(($signed(reg163) <= (reg180 && wire102)))));
          reg191 <= reg155[(3'h4):(1'h1)];
          reg192 <= $signed($unsigned(reg171));
        end
    end
  module194 #() modinst261 (wire260, clk, reg181, reg169, reg178, reg176, reg185);
  assign wire262 = $signed(({($unsigned(reg158) * reg177[(4'h8):(1'h0)]),
                       ({reg158,
                           wire86} < reg176)} & ($unsigned((wire260 * reg173)) << {(wire86 < reg177),
                       reg185[(3'h7):(1'h1)]})));
  assign wire263 = $signed($signed(((~&(8'hb8)) << {$signed(reg183)})));
  assign wire264 = $unsigned((~|(((reg188 ~^ (8'hbc)) ?
                           wire100 : $signed(reg180)) ?
                       $signed(((8'hb6) ? reg177 : reg155)) : ({wire85,
                           (8'hae)} - (|reg160)))));
  assign wire265 = reg190[(1'h0):(1'h0)];
  assign wire266 = (reg158[(4'he):(4'hc)] >>> wire154[(3'h7):(3'h6)]);
  module267 #() modinst310 (wire309, clk, reg161, reg164, wire154, wire263, wire83);
  assign wire311 = $signed(wire85[(3'h4):(2'h3)]);
  assign wire312 = (reg168 ~^ wire260[(3'h4):(1'h0)]);
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire12;
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  assign y = {wire65, wire63, wire12, reg66, (1'h0)};
  assign wire12 = $signed(($signed(wire10) ?
                      (wire8 * {(~&wire8)}) : $unsigned(wire8[(3'h5):(1'h1)])));
  module13 #() modinst64 (.wire16(wire10), .wire17(wire9), .wire14(wire8), .clk(clk), .y(wire63), .wire15(wire12));
  assign wire65 = {($unsigned(wire12[(3'h5):(3'h4)]) ?
                          (!((|wire11) + (&wire9))) : (wire12[(1'h1):(1'h0)] ^~ ($signed(wire63) >>> {wire8,
                              wire12}))),
                      wire12};
  always
    @(posedge clk) begin
      reg66 <= wire9;
    end
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire31,
                 wire30,
                 wire29,
                 wire20,
                 wire19,
                 wire18,
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
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire18 = (~&(wire17 ^~ wire17));
  assign wire19 = wire14;
  assign wire20 = ((($unsigned((wire16 ? wire17 : wire14)) ?
                          wire17[(5'h10):(2'h3)] : $unsigned(((7'h43) ?
                              wire14 : wire19))) >> (($signed(wire14) ?
                              $signed(wire15) : ((8'hb2) ^ wire17)) ?
                          ((!(8'ha6)) && wire16) : ($signed(wire17) - $signed(wire19)))) ?
                      wire14[(1'h0):(1'h0)] : (8'hba));
  always
    @(posedge clk) begin
      reg21 <= (^~$signed($unsigned(({wire18, wire18} > $unsigned(wire18)))));
      if ((wire15[(4'hb):(3'h4)] ?
          wire20[(3'h6):(3'h5)] : $unsigned($unsigned(reg21))))
        begin
          reg22 <= (8'ha7);
        end
      else
        begin
          reg22 <= $unsigned(reg21);
          reg23 <= wire18[(4'ha):(1'h1)];
          reg24 <= (((-$signed($signed(reg22))) ?
              {(~&$signed((8'hab)))} : wire17[(4'h8):(4'h8)]) ^ ($signed($signed((8'ha7))) + wire20[(4'hc):(4'hb)]));
          reg25 <= {(8'ha3)};
        end
      reg26 <= wire19;
      reg27 <= (^~$signed($signed((!$unsigned(reg22)))));
      reg28 <= reg27;
    end
  assign wire29 = $unsigned(({(+(reg24 != reg23)),
                      (wire20 ? reg28 : (wire17 ? wire18 : wire15))} <= reg25));
  assign wire30 = $unsigned($signed((8'hb2)));
  assign wire31 = ($signed($unsigned(wire16)) ?
                      $unsigned(wire19[(2'h2):(2'h2)]) : (~|wire15[(5'h11):(3'h5)]));
  always
    @(posedge clk) begin
      reg32 <= wire18[(3'h4):(3'h4)];
      reg33 <= (((reg27[(1'h1):(1'h1)] ?
              (~&(reg22 << wire16)) : {reg32, (+wire31)}) ?
          {$unsigned({wire16, reg22}),
              (8'hab)} : $signed((&$unsigned(reg28)))) >> $unsigned($signed(reg32[(4'hd):(4'hd)])));
    end
  always
    @(posedge clk) begin
      reg34 <= $unsigned(wire16);
    end
  assign wire35 = $unsigned(reg24);
  assign wire36 = ((8'ha2) | $unsigned($unsigned((~(reg34 ?
                      reg26 : (8'hbb))))));
  assign wire37 = ($signed(($unsigned((reg26 ? reg24 : (8'haa))) ?
                          ((wire35 ? wire29 : reg23) | (wire29 ?
                              wire35 : reg24)) : (~{reg22, reg23}))) ?
                      reg23[(1'h0):(1'h0)] : reg21[(2'h2):(1'h0)]);
  assign wire38 = reg22[(5'h10):(1'h1)];
  assign wire39 = (wire15[(4'hd):(2'h2)] == (7'h42));
  assign wire40 = {$unsigned($unsigned(wire14[(2'h2):(2'h2)]))};
  assign wire41 = reg26[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg42 <= $signed($signed((&(reg26[(3'h4):(1'h1)] + (reg22 <<< wire39)))));
      if (((~$unsigned(wire14)) ?
          $signed((!(|reg25[(3'h7):(3'h7)]))) : $unsigned($signed((wire37 ?
              wire29 : $signed(wire19))))))
        begin
          if ((wire17[(4'ha):(1'h1)] && wire40))
            begin
              reg43 <= $signed(($unsigned((&$unsigned(reg32))) ?
                  ((reg33[(3'h5):(3'h5)] ? wire14 : (-reg42)) ?
                      {wire39[(5'h11):(4'h9)]} : {(~^wire15),
                          $unsigned((8'hb3))}) : $signed($unsigned($signed(wire15)))));
              reg44 <= $unsigned(reg32);
              reg45 <= ((($signed((wire18 ? reg25 : wire14)) ?
                  $signed((|(8'hb9))) : ({wire14} <= {reg43,
                      (8'hb8)})) > reg32[(3'h7):(3'h6)]) + $unsigned(wire39[(3'h7):(3'h7)]));
              reg46 <= (^{reg25[(4'ha):(1'h0)], wire19[(2'h2):(1'h1)]});
              reg47 <= (~^(reg25[(3'h5):(3'h5)] ?
                  ($signed($signed((8'hbc))) < ($unsigned((8'hba)) ?
                      (wire30 >= wire38) : wire39[(1'h0):(1'h0)])) : ($unsigned((!reg27)) ?
                      (-(wire41 == wire36)) : {(reg34 ^~ (8'hb4))})));
            end
          else
            begin
              reg43 <= wire15[(4'hd):(4'hb)];
              reg44 <= wire19[(2'h3):(1'h1)];
              reg45 <= $signed((((+{wire19}) - $signed((wire18 ?
                  reg26 : reg46))) ~^ $signed($unsigned(wire18))));
              reg46 <= wire37[(2'h2):(1'h0)];
            end
          if (wire18)
            begin
              reg48 <= {$signed((reg43[(2'h3):(2'h2)] <<< (-reg22[(5'h11):(4'he)]))),
                  wire37[(2'h3):(2'h3)]};
              reg49 <= reg47;
              reg50 <= ($unsigned((wire31 ?
                      (^~$signed(wire31)) : $unsigned((~&reg25)))) ?
                  ((!($signed(reg43) ^~ wire37[(1'h0):(1'h0)])) ?
                      (8'ha2) : $unsigned(($signed(wire41) ?
                          (reg32 ? reg48 : reg26) : (reg28 ?
                              (8'h9e) : reg48)))) : ($signed({reg43}) ?
                      $signed({((8'hac) <<< reg45)}) : reg28));
              reg51 <= reg22;
            end
          else
            begin
              reg48 <= reg49;
              reg49 <= ({($unsigned($signed(wire40)) == (&(reg23 < (8'hb4)))),
                  $signed(wire15[(4'h9):(4'h8)])} || $signed((!(wire31 ?
                  (8'ha0) : (|reg45)))));
            end
          reg52 <= reg21[(2'h2):(1'h0)];
          if (($signed(reg23) ?
              wire39 : (~^(reg26 ?
                  ($signed(wire19) >>> ((7'h42) ?
                      reg27 : wire31)) : ((wire38 || wire15) ?
                      reg52 : (+(8'ha0)))))))
            begin
              reg53 <= (&{wire18,
                  ($unsigned(wire14) ?
                      $signed($signed(reg24)) : $signed(wire38))});
              reg54 <= reg45[(2'h2):(1'h1)];
              reg55 <= (~((wire18 ? $unsigned($unsigned(reg32)) : wire41) ?
                  reg23[(3'h7):(3'h7)] : (8'hb0)));
              reg56 <= (~&(($signed((wire35 == wire36)) ?
                      (wire14 + $unsigned(wire31)) : ($unsigned(reg51) ?
                          (|wire17) : reg43)) ?
                  (({wire19, reg26} ?
                      reg49[(2'h3):(2'h2)] : {(8'hba)}) ~^ reg52) : (reg45[(2'h2):(1'h0)] <<< $signed((&(7'h41))))));
              reg57 <= {(reg54 ? wire30 : $unsigned(reg25))};
            end
          else
            begin
              reg53 <= $unsigned({wire35});
              reg54 <= (wire29[(4'he):(4'ha)] >= wire15);
              reg55 <= (~^$signed($unsigned({(~reg27)})));
            end
        end
      else
        begin
          if ($signed($unsigned(($unsigned((wire17 & reg49)) ?
              reg43[(1'h1):(1'h0)] : wire20[(3'h5):(2'h3)]))))
            begin
              reg43 <= $signed($unsigned(reg45[(2'h3):(1'h1)]));
            end
          else
            begin
              reg43 <= $unsigned($signed((8'h9c)));
              reg44 <= {$unsigned({(^(wire20 ? reg51 : reg56)),
                      $unsigned($unsigned(wire20))})};
            end
          reg45 <= ($signed(wire15[(3'h6):(3'h6)]) || $unsigned((7'h44)));
          reg46 <= (wire18[(2'h2):(2'h2)] ?
              reg33[(1'h1):(1'h1)] : (!{$unsigned(wire20[(3'h4):(2'h2)])}));
          reg47 <= (~$signed($signed((!{wire36}))));
          reg48 <= reg24;
        end
      reg58 <= reg48[(3'h6):(3'h5)];
      reg59 <= (^~((~(~^reg48[(1'h0):(1'h0)])) ?
          (-({reg55, reg58} >>> reg51[(4'h9):(2'h2)])) : reg27));
    end
  assign wire60 = $signed($unsigned($unsigned(reg44)));
  assign wire61 = reg58[(1'h0):(1'h0)];
  assign wire62 = $signed(wire16[(5'h10):(4'hc)]);
endmodule

module module267
#(parameter param307 = (-(~|((((8'hae) <<< (8'ha1)) ? (^(8'hbd)) : ((8'hbd) && (8'h9e))) < (((8'ha6) ? (7'h44) : (8'hbf)) ? ((8'hae) * (8'hb7)) : ((8'hbb) ? (8'hbd) : (7'h40)))))), 
parameter param308 = {{(~^param307)}})
(y, clk, wire272, wire271, wire270, wire269, wire268);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire272;
  input wire [(5'h14):(1'h0)] wire271;
  input wire [(4'hd):(1'h0)] wire270;
  input wire [(5'h10):(1'h0)] wire269;
  input wire signed [(4'h9):(1'h0)] wire268;
  wire [(3'h5):(1'h0)] wire287;
  wire signed [(4'hd):(1'h0)] wire286;
  wire signed [(4'hb):(1'h0)] wire285;
  wire [(3'h4):(1'h0)] wire284;
  wire signed [(4'hb):(1'h0)] wire283;
  wire signed [(5'h10):(1'h0)] wire282;
  wire signed [(4'hb):(1'h0)] wire281;
  wire signed [(3'h4):(1'h0)] wire280;
  wire signed [(4'hb):(1'h0)] wire278;
  wire signed [(3'h7):(1'h0)] wire275;
  wire [(3'h5):(1'h0)] wire274;
  wire signed [(5'h13):(1'h0)] wire273;
  reg [(5'h11):(1'h0)] reg306 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg305 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg304 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg303 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg302 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg301 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg300 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg299 = (1'h0);
  reg [(5'h11):(1'h0)] reg298 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg297 = (1'h0);
  reg [(2'h2):(1'h0)] reg296 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg295 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg294 = (1'h0);
  reg [(5'h12):(1'h0)] reg293 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg292 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg291 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg290 = (1'h0);
  reg [(5'h14):(1'h0)] reg289 = (1'h0);
  reg [(3'h6):(1'h0)] reg288 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg279 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg277 = (1'h0);
  reg [(4'hc):(1'h0)] reg276 = (1'h0);
  assign y = {wire287,
                 wire286,
                 wire285,
                 wire284,
                 wire283,
                 wire282,
                 wire281,
                 wire280,
                 wire278,
                 wire275,
                 wire274,
                 wire273,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg279,
                 reg277,
                 reg276,
                 (1'h0)};
  assign wire273 = {wire271[(1'h1):(1'h0)]};
  assign wire274 = wire269;
  assign wire275 = ((!($unsigned($signed(wire274)) ?
                       $unsigned(((7'h44) ? wire269 : wire272)) : ((wire268 ?
                           wire268 : wire273) * $signed(wire274)))) << $signed(((^~(^(8'hbd))) || ((wire270 ?
                           wire273 : wire274) ?
                       $unsigned(wire270) : (wire273 ? wire272 : wire269)))));
  always
    @(posedge clk) begin
      reg276 <= $signed(($signed(wire275[(3'h7):(3'h6)]) ?
          wire268 : $signed($signed($signed(wire273)))));
      reg277 <= (~&wire274[(3'h5):(3'h5)]);
    end
  assign wire278 = $unsigned(($unsigned((^$signed(wire270))) ?
                       wire269[(3'h5):(3'h4)] : wire269));
  always
    @(posedge clk) begin
      reg279 <= (wire268 ? $unsigned($signed(wire270)) : wire278);
    end
  assign wire280 = (reg279 ?
                       {$unsigned(((^~wire274) >= $unsigned(wire268)))} : $signed((wire273[(4'h8):(3'h6)] ^ ($signed(wire278) != wire270[(2'h2):(2'h2)]))));
  assign wire281 = ({reg277} ?
                       $signed((&wire280)) : $signed(wire270[(4'hb):(3'h4)]));
  assign wire282 = wire271[(4'hc):(4'hc)];
  assign wire283 = $signed(wire268);
  assign wire284 = ((wire268 ?
                       reg276 : ({$unsigned(wire269),
                           (reg276 ?
                               reg276 : (8'hab))} * $signed(wire282))) < ((wire280[(2'h3):(2'h2)] ?
                       $signed((wire281 >>> wire280)) : $unsigned($signed(wire272))) > wire283[(1'h0):(1'h0)]));
  assign wire285 = $signed($unsigned((wire269[(4'hf):(4'hb)] ?
                       $unsigned((wire282 < (8'haa))) : wire275)));
  assign wire286 = wire273[(2'h3):(1'h0)];
  assign wire287 = (-wire282);
  always
    @(posedge clk) begin
      reg288 <= ((wire287 || wire287[(1'h0):(1'h0)]) <= ((~|(~|wire271[(2'h2):(1'h0)])) ?
          (&$unsigned((8'hb1))) : {(((7'h40) || wire271) ?
                  wire285 : wire284[(3'h4):(3'h4)]),
              ($signed(wire274) <<< $unsigned(wire285))}));
      if (wire271[(1'h0):(1'h0)])
        begin
          reg289 <= (($unsigned($signed((-wire284))) ?
                  $unsigned(wire270[(4'hb):(3'h6)]) : ($unsigned({wire283,
                          wire275}) ?
                      {(^reg276), $unsigned(wire269)} : (+{wire271,
                          wire287}))) ?
              reg279 : $unsigned(((wire280[(3'h4):(3'h4)] <<< (reg279 ?
                  wire269 : reg276)) & wire274)));
          if ((-((8'haa) ? $unsigned($unsigned($signed((8'h9f)))) : wire282)))
            begin
              reg290 <= (8'ha5);
              reg291 <= (8'ha1);
              reg292 <= (^(({$signed(wire280), (wire282 ? (8'haa) : wire271)} ?
                  $unsigned(wire284[(1'h0):(1'h0)]) : (-wire282)) && reg288));
            end
          else
            begin
              reg290 <= $signed((wire275 ?
                  $unsigned($signed($signed(wire281))) : {wire273, wire284}));
              reg291 <= $unsigned((!$signed((wire286[(2'h2):(2'h2)] ?
                  $signed(reg279) : wire275[(1'h1):(1'h1)]))));
              reg292 <= $unsigned(($signed($signed(wire283[(4'ha):(4'h9)])) + $unsigned($signed({wire280,
                  reg292}))));
              reg293 <= {$signed((wire287[(1'h0):(1'h0)] ?
                      $signed((!wire274)) : (+$unsigned(wire278))))};
            end
          reg294 <= (!$signed({reg291}));
          if (((($signed($unsigned(reg277)) ?
                  $signed((^reg289)) : (8'hb8)) == ((~&wire269[(4'hf):(4'ha)]) ?
                  {wire281[(1'h0):(1'h0)],
                      (wire282 == (8'ha9))} : $signed((^~(8'hb8))))) ?
              (($unsigned($signed(reg290)) ?
                      wire280[(2'h2):(2'h2)] : wire280[(3'h4):(3'h4)]) ?
                  $unsigned({(reg290 != (8'hb8))}) : ((reg289 ?
                          {reg292} : $signed(reg277)) ?
                      wire285[(2'h3):(2'h2)] : $unsigned((reg292 + (8'hbe))))) : (&($unsigned((wire285 ?
                  reg294 : wire272)) & reg290))))
            begin
              reg295 <= ($unsigned((+$signed((reg291 ?
                  reg291 : (8'hbc))))) >> wire270);
              reg296 <= ((wire287[(1'h0):(1'h0)] ?
                      (wire274 == {(wire287 << wire284),
                          (reg292 ?
                              wire282 : wire286)}) : $signed((wire268[(3'h7):(3'h6)] ^~ $unsigned((8'ha5))))) ?
                  $unsigned($signed($signed($signed(reg279)))) : (8'hb3));
            end
          else
            begin
              reg295 <= ($unsigned({wire285[(3'h5):(3'h5)],
                  $signed(reg290)}) * $signed((($signed(wire286) ?
                  (|wire278) : ((8'hac) == wire272)) != $signed(wire281[(3'h6):(3'h4)]))));
              reg296 <= {(^$signed(((|(8'ha9)) ^ {reg277, (8'h9d)})))};
              reg297 <= wire280;
            end
          reg298 <= reg288;
        end
      else
        begin
          reg289 <= $unsigned(wire285[(4'h8):(3'h7)]);
          reg290 <= (wire283[(3'h4):(1'h0)] <= $unsigned({reg277,
              wire271[(5'h12):(4'ha)]}));
          reg291 <= ((((8'ha1) ~^ (&{wire272,
              reg277})) | $signed($unsigned($signed(reg294)))) << reg294);
          if (({((wire268 < wire274) | {(reg289 ? reg291 : wire283)}),
              {reg279[(1'h0):(1'h0)],
                  ((~|wire275) ^~ $signed(reg291))}} | reg293))
            begin
              reg292 <= $unsigned(wire269);
              reg293 <= $signed((-($signed(wire287) ?
                  ((-(8'ha8)) ?
                      (reg277 <<< (7'h42)) : $unsigned(wire283)) : $signed(reg279))));
              reg294 <= (8'hbe);
            end
          else
            begin
              reg292 <= wire281[(4'h9):(4'h9)];
              reg293 <= $signed((wire273[(2'h3):(1'h0)] * $unsigned(reg293)));
            end
        end
      reg299 <= reg296[(2'h2):(1'h0)];
      if (wire271)
        begin
          reg300 <= wire282;
        end
      else
        begin
          reg300 <= reg297;
          reg301 <= (~|(wire272[(3'h5):(2'h3)] + reg296[(1'h1):(1'h0)]));
          if ((8'hbf))
            begin
              reg302 <= reg276;
              reg303 <= $unsigned((&{((~^reg301) && (|wire280)),
                  ($signed(wire270) ?
                      (wire268 || wire282) : wire281[(3'h6):(3'h4)])}));
              reg304 <= $unsigned(wire272[(4'ha):(3'h5)]);
              reg305 <= ($signed((wire273[(5'h13):(3'h7)] == ((wire281 ?
                      wire274 : (8'hb7)) ?
                  reg279[(3'h5):(2'h2)] : (reg303 ?
                      wire281 : wire286)))) > ((reg300[(2'h3):(1'h0)] & wire286) ?
                  $unsigned(reg277[(2'h2):(1'h1)]) : $signed(reg301[(1'h0):(1'h0)])));
            end
          else
            begin
              reg302 <= reg301;
              reg303 <= (reg300 ? (&wire271) : reg303[(2'h3):(2'h2)]);
              reg304 <= $unsigned(reg279);
              reg305 <= $signed(({$signed(wire278[(3'h6):(1'h0)]),
                  ((wire271 <= wire271) ? (-wire269) : (&reg302))} ^ ({reg291} ?
                  reg299[(4'h9):(3'h6)] : (reg295[(1'h1):(1'h1)] ?
                      {(8'hb0), reg293} : reg296[(1'h1):(1'h1)]))));
              reg306 <= $signed((!((reg295 + $signed((8'hba))) & $signed((reg290 && wire286)))));
            end
        end
    end
endmodule

module module194  (y, clk, wire199, wire198, wire197, wire196, wire195);
  output wire [(32'h28e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire199;
  input wire signed [(3'h4):(1'h0)] wire198;
  input wire [(4'h9):(1'h0)] wire197;
  input wire [(5'h14):(1'h0)] wire196;
  input wire signed [(4'ha):(1'h0)] wire195;
  wire [(4'hc):(1'h0)] wire259;
  wire [(5'h13):(1'h0)] wire258;
  wire signed [(5'h13):(1'h0)] wire257;
  wire [(5'h12):(1'h0)] wire256;
  wire [(3'h4):(1'h0)] wire255;
  wire signed [(4'ha):(1'h0)] wire254;
  wire [(3'h7):(1'h0)] wire253;
  wire [(5'h10):(1'h0)] wire252;
  wire signed [(4'h9):(1'h0)] wire251;
  wire [(4'he):(1'h0)] wire250;
  wire [(5'h12):(1'h0)] wire239;
  wire signed [(4'hb):(1'h0)] wire238;
  wire [(4'h8):(1'h0)] wire237;
  wire signed [(2'h3):(1'h0)] wire236;
  wire [(4'he):(1'h0)] wire235;
  wire signed [(4'hb):(1'h0)] wire228;
  wire signed [(5'h15):(1'h0)] wire218;
  wire [(4'hc):(1'h0)] wire200;
  reg signed [(5'h11):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg248 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg247 = (1'h0);
  reg [(3'h4):(1'h0)] reg246 = (1'h0);
  reg [(3'h4):(1'h0)] reg245 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg244 = (1'h0);
  reg [(4'hd):(1'h0)] reg243 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg242 = (1'h0);
  reg [(5'h14):(1'h0)] reg241 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg240 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg234 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg232 = (1'h0);
  reg [(5'h11):(1'h0)] reg231 = (1'h0);
  reg [(3'h7):(1'h0)] reg230 = (1'h0);
  reg [(3'h7):(1'h0)] reg229 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg227 = (1'h0);
  reg [(4'h9):(1'h0)] reg226 = (1'h0);
  reg [(4'hf):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg224 = (1'h0);
  reg [(5'h11):(1'h0)] reg223 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg222 = (1'h0);
  reg [(5'h10):(1'h0)] reg221 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg219 = (1'h0);
  reg [(2'h2):(1'h0)] reg217 = (1'h0);
  reg [(4'hc):(1'h0)] reg216 = (1'h0);
  reg signed [(4'he):(1'h0)] reg215 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg213 = (1'h0);
  reg [(2'h2):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg211 = (1'h0);
  reg [(4'hc):(1'h0)] reg210 = (1'h0);
  reg [(3'h6):(1'h0)] reg209 = (1'h0);
  reg [(4'h9):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg207 = (1'h0);
  reg [(4'hf):(1'h0)] reg206 = (1'h0);
  reg [(2'h3):(1'h0)] reg205 = (1'h0);
  reg [(5'h15):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg202 = (1'h0);
  reg [(4'hc):(1'h0)] reg201 = (1'h0);
  assign y = {wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire228,
                 wire218,
                 wire200,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 (1'h0)};
  assign wire200 = {$unsigned(((8'ha4) ?
                           $unsigned(wire197[(1'h0):(1'h0)]) : ($unsigned(wire196) < $signed(wire197))))};
  always
    @(posedge clk) begin
      reg201 <= (wire197[(2'h2):(1'h0)] <<< $signed({(wire199 ?
              (+(8'ha7)) : $signed(wire196)),
          wire195[(1'h1):(1'h0)]}));
      reg202 <= (wire197 ?
          (~wire197[(1'h1):(1'h0)]) : (~^(^~((|reg201) ~^ wire200))));
      reg203 <= ((^wire196[(4'hd):(3'h4)]) == $unsigned(($signed({reg202,
              wire199}) ?
          wire197 : wire195[(3'h6):(3'h4)])));
      if ({wire197})
        begin
          if ($signed((-wire200)))
            begin
              reg204 <= $signed(reg201);
              reg205 <= ((~(^$signed(wire198[(2'h2):(2'h2)]))) ?
                  $signed(((~|(^~reg201)) ^~ (wire196 ?
                      $unsigned(wire197) : reg203))) : ($unsigned(((^reg203) <= (-reg203))) ?
                      (reg203[(4'hb):(4'ha)] ?
                          ($signed((8'hb5)) ?
                              wire199 : reg203) : $unsigned($signed(wire196))) : reg204[(1'h0):(1'h0)]));
              reg206 <= (((7'h40) ?
                  wire195[(3'h6):(3'h6)] : (~|wire197)) ^~ wire196);
              reg207 <= (($signed((|$signed(reg201))) << (reg203 ?
                      $signed((reg205 ?
                          reg203 : reg205)) : $signed(wire198[(2'h2):(2'h2)]))) ?
                  $unsigned(wire196) : (8'hac));
              reg208 <= (+$signed(($signed($signed(wire199)) ?
                  (&wire197) : {wire195[(1'h1):(1'h0)], (wire199 & (8'hb6))})));
            end
          else
            begin
              reg204 <= (reg201 != reg202[(1'h0):(1'h0)]);
              reg205 <= ($signed(reg205[(1'h1):(1'h1)]) ?
                  ($signed($unsigned(reg205)) ?
                      wire199 : (reg207[(2'h2):(1'h1)] - wire196)) : $signed((~&$signed($unsigned(reg205)))));
              reg206 <= (!(~&$unsigned($unsigned($signed(reg202)))));
              reg207 <= (-(!$unsigned(reg207)));
              reg208 <= (reg202[(1'h0):(1'h0)] ?
                  (reg206[(1'h0):(1'h0)] ?
                      reg204[(4'hc):(3'h4)] : $unsigned(reg206[(4'h8):(2'h2)])) : reg208[(2'h2):(2'h2)]);
            end
          reg209 <= wire195;
        end
      else
        begin
          reg204 <= ((reg205[(2'h2):(1'h1)] ?
                  reg203[(2'h3):(2'h2)] : ($signed((!(8'ha7))) <<< ((^(8'had)) ?
                      reg209 : reg202[(1'h0):(1'h0)]))) ?
              reg205[(1'h1):(1'h0)] : (~|(~&reg205[(1'h0):(1'h0)])));
          reg205 <= (^~wire200[(2'h3):(2'h2)]);
          reg206 <= $unsigned(($unsigned((^~$unsigned((8'haf)))) ?
              $unsigned($signed((reg203 ? reg201 : reg204))) : (8'hae)));
        end
      reg210 <= (^(8'hba));
    end
  always
    @(posedge clk) begin
      reg211 <= (reg202 >= (|reg206[(3'h4):(1'h1)]));
      if (wire198[(2'h3):(2'h3)])
        begin
          reg212 <= $signed((wire199[(3'h4):(2'h2)] == {wire195[(2'h3):(2'h3)]}));
          reg213 <= {$unsigned(reg208)};
        end
      else
        begin
          reg212 <= ((($signed(((7'h40) > (8'hbf))) + reg210) & ((^(-reg205)) ?
              ((reg202 ? wire197 : reg211) ^ (reg210 >= reg203)) : (^(reg205 ?
                  wire200 : reg209)))) - reg212[(1'h1):(1'h0)]);
          if (wire195[(4'h8):(3'h5)])
            begin
              reg213 <= $unsigned((((-reg202) | (|(reg202 ^~ reg202))) <= $signed((^(!(8'h9c))))));
              reg214 <= ((reg202[(2'h2):(1'h1)] >>> {$unsigned(wire199[(2'h3):(1'h0)]),
                  (+(reg201 <= reg207))}) + (+reg201));
            end
          else
            begin
              reg213 <= (~&(-$signed(reg203)));
            end
        end
      reg215 <= ((wire198[(1'h1):(1'h1)] | wire197) ?
          (reg205[(2'h3):(1'h0)] || $unsigned((|(^~reg204)))) : ($unsigned(reg212[(1'h0):(1'h0)]) <= (8'ha7)));
      reg216 <= {wire199[(1'h0):(1'h0)]};
      reg217 <= (~(-((+{wire197, reg212}) * ((^reg210) ?
          reg214[(4'h8):(3'h7)] : {reg213}))));
    end
  assign wire218 = reg211[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg219 <= reg215;
      if (wire197)
        begin
          reg220 <= (^wire199[(2'h2):(2'h2)]);
          reg221 <= {$unsigned((~^($unsigned(reg215) ? (7'h41) : reg211)))};
          reg222 <= ($signed(reg208) ?
              reg203[(3'h6):(3'h6)] : $unsigned($unsigned((reg207 ?
                  $signed(reg209) : reg220))));
          reg223 <= (($signed(({reg211, reg213} <<< reg220[(3'h7):(2'h3)])) ?
                  reg202[(1'h1):(1'h0)] : (wire197 >>> ($unsigned((8'ha3)) ?
                      (~&reg219) : (^~wire196)))) ?
              (&reg215[(4'hd):(3'h6)]) : $signed($signed({$unsigned(wire197),
                  (wire218 ? reg211 : reg213)})));
          if (reg223)
            begin
              reg224 <= $unsigned((((reg201 - $unsigned(wire197)) ?
                  ((reg219 ?
                      reg216 : reg221) & (8'hb7)) : reg219) ^~ wire199[(1'h0):(1'h0)]));
              reg225 <= (!(8'hb8));
              reg226 <= (+(~^{{$signed(reg216)}}));
              reg227 <= $unsigned((($unsigned({reg222}) ?
                      wire196 : ((reg209 > wire195) < $signed((8'ha8)))) ?
                  (wire197[(3'h7):(1'h0)] ?
                      (reg202 ?
                          (reg223 ~^ reg222) : reg202) : (~^(reg210 <<< (8'hb8)))) : $unsigned(($unsigned(reg217) ?
                      reg220 : (|reg204)))));
            end
          else
            begin
              reg224 <= $unsigned((reg206[(1'h0):(1'h0)] ?
                  (^$signed($unsigned(wire196))) : ($signed((~^(8'ha3))) <= {$signed(wire195),
                      ((8'hbe) ? wire196 : reg225)})));
              reg225 <= (~{reg220, reg219[(4'hf):(1'h1)]});
              reg226 <= $signed(reg225);
              reg227 <= reg203[(3'h6):(1'h1)];
            end
        end
      else
        begin
          if ((reg217 && $unsigned((8'h9c))))
            begin
              reg220 <= reg214;
              reg221 <= (-$unsigned($signed((reg217 <<< $unsigned(wire199)))));
              reg222 <= $signed($signed(reg203[(4'h8):(3'h5)]));
              reg223 <= {{reg221[(4'he):(3'h5)], wire195[(4'ha):(1'h1)]}};
              reg224 <= {reg213,
                  (((~reg214) < ({reg211} <<< wire197[(4'h9):(3'h7)])) ?
                      (($signed((8'ha5)) != (reg213 ?
                          reg208 : wire196)) - $signed($unsigned(wire196))) : wire195)};
            end
          else
            begin
              reg220 <= $unsigned(((!reg210[(3'h5):(2'h2)]) ?
                  reg206[(4'hd):(4'hd)] : ($signed(reg222) ^~ $signed($signed(reg215)))));
              reg221 <= $signed(reg219);
              reg222 <= (wire200[(1'h1):(1'h1)] ?
                  reg226[(3'h4):(1'h1)] : reg210);
            end
        end
    end
  assign wire228 = $signed((&(reg206 & $unsigned({reg203, reg204}))));
  always
    @(posedge clk) begin
      reg229 <= $unsigned(($unsigned($signed(reg225[(4'h8):(4'h8)])) >= {reg213}));
      reg230 <= ($unsigned((8'hb2)) ?
          (~&(&$unsigned(((8'hb7) <<< reg214)))) : $signed((~|$signed($signed(reg219)))));
      reg231 <= (~$signed(wire197));
      if ($signed($unsigned($signed(({reg217, reg224} ?
          {reg205} : (~^wire196))))))
        begin
          reg232 <= $unsigned($unsigned((~|((+wire228) ^~ $unsigned((8'ha2))))));
          reg233 <= (reg203[(1'h1):(1'h0)] - $signed({wire218[(4'hb):(4'h9)]}));
          reg234 <= $signed((|reg201));
        end
      else
        begin
          reg232 <= ((^{((wire228 ? reg230 : reg224) ?
                  (|(8'hac)) : (reg214 >= (8'ha0))),
              reg208}) > $signed(reg225[(1'h1):(1'h0)]));
        end
    end
  assign wire235 = $signed($signed((reg211 ? reg225 : reg211)));
  assign wire236 = (+$signed($signed(((~^reg214) >= (8'ha6)))));
  assign wire237 = ($unsigned(((+reg221) & (-(reg206 >= reg230)))) ?
                       reg210[(1'h0):(1'h0)] : (wire199[(2'h2):(2'h2)] ?
                           ((|(reg224 ? reg212 : reg232)) + ((wire197 ?
                               reg211 : reg206) > wire236)) : ({(reg215 ?
                                       (7'h40) : reg206)} ?
                               {((8'hb3) >>> wire200),
                                   reg217[(2'h2):(1'h1)]} : reg230[(1'h1):(1'h0)])));
  assign wire238 = reg217[(1'h1):(1'h0)];
  assign wire239 = wire228[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg240 <= (wire197[(3'h4):(2'h3)] * reg216[(4'hb):(3'h6)]);
      if ((-reg240[(4'h9):(1'h0)]))
        begin
          reg241 <= (&((((wire239 ? reg223 : wire238) >= $signed(reg232)) ?
                  $unsigned($unsigned(reg213)) : ((&wire200) ^~ (8'hb4))) ?
              reg209[(3'h5):(2'h3)] : ($unsigned(wire237) << $unsigned(reg212[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg241 <= (reg212[(1'h0):(1'h0)] ?
              ((!(-{reg216, wire228})) ?
                  (~^wire197) : $signed($signed($signed(reg211)))) : (&((reg230 * reg225[(2'h3):(1'h1)]) >>> $unsigned(reg227[(2'h3):(1'h1)]))));
          reg242 <= $signed((&(^~{(wire235 ? wire236 : wire235),
              wire200[(4'h9):(3'h6)]})));
          if (((~|(^reg222)) > {$unsigned(($signed(wire200) ?
                  reg231 : ((8'hb6) & (8'h9e))))}))
            begin
              reg243 <= reg234;
              reg244 <= (+(reg203 ? $signed(reg219[(3'h7):(3'h6)]) : reg214));
              reg245 <= {(&reg221[(5'h10):(2'h2)]),
                  $signed(((~&(reg206 ?
                      (7'h43) : reg222)) ~^ $signed((8'h9e))))};
              reg246 <= $signed({$signed($signed((reg224 ?
                      wire218 : (8'hbe))))});
              reg247 <= $unsigned(($unsigned($unsigned({reg240, reg225})) ?
                  $unsigned((~(8'hae))) : (($unsigned(wire197) ?
                          (reg211 - (8'hb1)) : reg234) ?
                      reg215[(3'h4):(1'h0)] : ($signed(wire197) ?
                          ((8'h9e) + reg233) : {reg212}))));
            end
          else
            begin
              reg243 <= {{$unsigned(((^wire237) ?
                          (reg230 ? wire195 : wire197) : $signed(reg223)))}};
            end
        end
      reg248 <= (~|$signed((8'h9e)));
      reg249 <= ($unsigned(reg227[(2'h2):(1'h0)]) || (wire236 ?
          $signed((wire235 ?
              {reg241} : reg231)) : (!$signed($signed(reg213)))));
    end
  assign wire250 = reg207;
  assign wire251 = $signed({((~(reg215 <= reg246)) ?
                           $unsigned($unsigned(reg213)) : reg205[(1'h1):(1'h1)]),
                       (-{wire235})});
  assign wire252 = ((&(reg247[(2'h2):(1'h1)] >>> $signed(reg243))) ~^ ((-(7'h40)) ^ (wire196[(3'h7):(1'h1)] ?
                       (reg229[(1'h0):(1'h0)] != (&reg222)) : wire218[(4'ha):(3'h4)])));
  assign wire253 = (~{(($signed((8'haa)) ? reg232 : reg231[(4'he):(3'h7)]) ?
                           (|(reg205 ~^ reg203)) : $signed(reg201)),
                       reg203[(5'h12):(3'h6)]});
  assign wire254 = reg201;
  assign wire255 = {((|wire251[(3'h5):(3'h5)]) ?
                           $unsigned(($unsigned(reg243) & $signed((8'hb5)))) : $unsigned({(wire238 ?
                                   reg210 : (8'hbd))})),
                       $unsigned({$signed((wire251 ? wire195 : reg205))})};
  assign wire256 = ($signed($signed((|$unsigned((8'ha8))))) >> $unsigned(((8'ha5) * wire252)));
  assign wire257 = $signed(wire254);
  assign wire258 = reg207[(1'h1):(1'h0)];
  assign wire259 = reg201;
endmodule

module module104
#(parameter param151 = (({(!((8'hba) ? (8'hb8) : (8'h9c)))} ? (!(((7'h44) != (8'hb9)) ? (8'ha0) : (~(8'hb7)))) : ((((8'hb6) > (8'hb2)) ? (~^(8'ha2)) : {(8'ha6), (8'had)}) ? {((7'h41) >>> (8'hb7)), ((8'hba) ? (8'hb8) : (8'h9c))} : ((+(8'ha9)) ~^ (!(8'ha8))))) > {((((8'hb3) ? (8'hac) : (8'ha2)) != ((8'h9e) >> (8'ha5))) == (+(~(8'h9e))))}))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire109;
  input wire signed [(4'hd):(1'h0)] wire108;
  input wire signed [(5'h13):(1'h0)] wire107;
  input wire [(5'h10):(1'h0)] wire106;
  input wire [(5'h10):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire signed [(3'h4):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  reg signed [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire124,
                 wire123,
                 wire122,
                 wire119,
                 wire112,
                 wire111,
                 wire110,
                 reg148,
                 reg147,
                 reg146,
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
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg121,
                 reg120,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire110 = (&((wire108[(3'h5):(2'h2)] * $signed($signed(wire107))) ?
                       {wire109[(4'hc):(1'h1)]} : $unsigned(wire109[(4'hb):(3'h7)])));
  assign wire111 = $unsigned((wire109 ?
                       $signed({(wire106 + wire105), (^~wire108)}) : {((8'hb4) ?
                               wire105 : (wire109 >= wire109)),
                           (wire108[(3'h5):(1'h1)] ?
                               (wire105 && wire106) : (~^wire106))}));
  assign wire112 = $signed((~$unsigned($unsigned((wire110 < (8'ha8))))));
  always
    @(posedge clk) begin
      reg113 <= $signed((wire110 ?
          $unsigned($unsigned(((8'ha6) <= wire106))) : $signed(wire110)));
      reg114 <= $signed(((wire112 ?
          (wire108[(3'h4):(1'h0)] ?
              $signed((8'ha6)) : (8'hb6)) : $unsigned((wire107 ?
              wire108 : wire108))) > (reg113 ? wire105 : $unsigned(wire106))));
      if (((8'hbb) + (-(wire108[(1'h0):(1'h0)] ?
          ((8'ha1) ?
              (wire109 ? wire107 : wire110) : (wire107 ?
                  wire107 : (8'hb5))) : $unsigned((wire112 ?
              (8'hbb) : wire106))))))
        begin
          reg115 <= wire112;
        end
      else
        begin
          reg115 <= $signed($signed((8'ha8)));
          reg116 <= (-(~|(wire107 & {$unsigned(wire110),
              (wire110 & (8'hbb))})));
        end
    end
  always
    @(posedge clk) begin
      reg117 <= $unsigned(($unsigned((+wire107[(5'h10):(4'h8)])) > wire108));
      reg118 <= wire111[(3'h5):(2'h2)];
    end
  assign wire119 = reg116;
  always
    @(posedge clk) begin
      reg120 <= $unsigned($unsigned(reg118[(3'h5):(3'h4)]));
      reg121 <= $unsigned($signed((((|wire106) ?
          $unsigned(reg117) : (-wire106)) || $signed(reg115))));
    end
  assign wire122 = (reg113 < ((~|($unsigned(reg121) ?
                           reg121[(1'h1):(1'h0)] : wire107)) ?
                       ($signed($unsigned((8'ha3))) ?
                           (^(~^reg121)) : reg114) : $unsigned((((8'ha5) ?
                               reg114 : wire107) ?
                           reg113 : wire107))));
  assign wire123 = reg120;
  assign wire124 = (~|((wire111 ?
                           (+$signed(wire122)) : $signed((reg115 || reg118))) ?
                       (~&wire110[(3'h7):(3'h7)]) : wire111[(4'h8):(3'h4)]));
  always
    @(posedge clk) begin
      if ((-$signed((((wire112 >> wire105) != reg118) ?
          ((reg115 + reg120) ? wire110 : $unsigned(reg115)) : (wire109 ?
              ((8'had) | wire110) : (wire123 == (8'ha7)))))))
        begin
          reg125 <= (((~$unsigned($unsigned(wire123))) ?
                  $unsigned(($unsigned(wire123) ?
                      ((8'hbb) > wire109) : reg115[(3'h7):(3'h5)])) : $signed({((8'ha6) ~^ wire123),
                      (wire123 ? (8'h9c) : wire119)})) ?
              $unsigned(((-(wire122 ? wire106 : (8'hb6))) ?
                  wire110 : $unsigned($unsigned(reg118)))) : wire124);
          reg126 <= ((~^$signed((!$signed((8'h9f))))) ?
              wire123 : $signed((&$unsigned((wire122 ? reg116 : (8'ha6))))));
        end
      else
        begin
          reg125 <= {(^~(~^wire109))};
          reg126 <= reg118;
        end
    end
  always
    @(posedge clk) begin
      if ((^(|$signed(((+wire122) >= $unsigned(wire124))))))
        begin
          reg127 <= $signed((8'hbb));
          if ({(reg127 >= reg116)})
            begin
              reg128 <= wire123;
              reg129 <= $unsigned($signed({($signed(wire110) ?
                      (reg120 << wire119) : $signed(wire122)),
                  $unsigned((reg116 != wire123))}));
              reg130 <= ($unsigned(wire106[(1'h0):(1'h0)]) | (~&wire122));
            end
          else
            begin
              reg128 <= (wire111[(4'h9):(3'h7)] + $unsigned({wire109}));
              reg129 <= (({$unsigned((+reg120))} ?
                  $unsigned(wire106[(1'h0):(1'h0)]) : $unsigned(((reg118 ^ wire108) ?
                      reg115[(4'hc):(2'h2)] : wire124))) < (&(((reg121 >>> wire107) ?
                  (reg129 > wire106) : $unsigned(wire110)) && wire112[(3'h4):(2'h2)])));
              reg130 <= reg116[(4'hf):(3'h5)];
            end
        end
      else
        begin
          reg127 <= reg121[(1'h1):(1'h1)];
          reg128 <= $signed(reg120[(2'h3):(2'h3)]);
          reg129 <= ($unsigned((~&$unsigned(reg118))) ?
              (^(~^$signed($signed((8'ha3))))) : $signed($unsigned(((~wire124) ?
                  reg127 : reg115))));
        end
      reg131 <= (reg127 ?
          ((^~$unsigned((^~wire105))) ?
              reg115[(4'ha):(3'h5)] : $signed((^~$signed((8'h9e))))) : $unsigned(((reg117 ?
                  $signed(reg114) : (+wire111)) ?
              {(^~reg118)} : $unsigned(wire109[(3'h6):(2'h2)]))));
      reg132 <= (~&$signed((-reg121[(2'h2):(2'h2)])));
      if ($signed($unsigned(reg120)))
        begin
          if ($signed((^~$unsigned((~|(~^reg132))))))
            begin
              reg133 <= reg117[(3'h5):(3'h5)];
            end
          else
            begin
              reg133 <= (reg127[(3'h7):(3'h4)] ?
                  wire108[(2'h2):(2'h2)] : $signed(wire106[(4'ha):(4'h9)]));
              reg134 <= (-reg115);
            end
          if (((^~(((reg120 ? (8'hbc) : (8'hab)) ?
                  wire112[(3'h4):(1'h0)] : {reg121, reg115}) ?
              $unsigned((wire108 & reg121)) : reg127[(4'hb):(4'h8)])) > $signed((wire124[(1'h0):(1'h0)] >= reg117[(3'h5):(3'h4)]))))
            begin
              reg135 <= (!{(wire112 ?
                      {(~reg117),
                          ((8'hb7) ?
                              reg125 : wire124)} : $unsigned(reg114[(3'h4):(2'h2)])),
                  reg134});
            end
          else
            begin
              reg135 <= (&(^~reg115[(3'h6):(1'h1)]));
              reg136 <= (~^($unsigned((~&wire106)) ?
                  $unsigned(reg132[(3'h4):(1'h0)]) : (~$unsigned($signed(reg121)))));
            end
          reg137 <= $signed({$signed(wire110)});
        end
      else
        begin
          if (reg130[(5'h10):(2'h3)])
            begin
              reg133 <= reg116[(3'h6):(2'h2)];
            end
          else
            begin
              reg133 <= (8'hab);
              reg134 <= $signed(reg134);
              reg135 <= reg118[(4'hb):(1'h1)];
              reg136 <= (reg115 << (-reg126[(2'h2):(1'h0)]));
            end
          if (wire119[(3'h7):(3'h6)])
            begin
              reg137 <= $signed({reg130[(3'h7):(3'h4)],
                  $unsigned({(reg116 ? wire122 : wire123),
                      (reg127 ? (8'ha2) : wire112)})});
              reg138 <= reg116[(1'h0):(1'h0)];
              reg139 <= $unsigned(reg118[(2'h2):(2'h2)]);
              reg140 <= reg128[(4'h8):(3'h6)];
            end
          else
            begin
              reg137 <= $unsigned(((~^$unsigned($signed(reg128))) ?
                  reg120 : $unsigned(reg135[(1'h0):(1'h0)])));
              reg138 <= (reg139 >= ($unsigned(reg132[(3'h4):(1'h0)]) | ((reg130[(5'h13):(3'h7)] ?
                  reg121 : wire111[(1'h0):(1'h0)]) <= $signed({reg120,
                  wire123}))));
              reg139 <= (8'ha1);
            end
          reg141 <= $unsigned(reg117);
          if (reg115[(4'h8):(3'h7)])
            begin
              reg142 <= ($signed((~&(~|(reg118 ? reg113 : reg115)))) ?
                  (({$unsigned((8'ha6)), $signed(reg139)} ?
                          $unsigned(reg114[(3'h5):(1'h1)]) : $signed($unsigned(reg132))) ?
                      (!{reg140,
                          $unsigned(wire112)}) : (reg126 + reg117)) : reg120[(2'h3):(2'h3)]);
              reg143 <= {((($signed(reg120) >> reg128[(2'h2):(1'h1)]) ?
                          $unsigned(reg129) : {$unsigned(reg139), (!(8'hb4))}) ?
                      ($signed(reg138) ?
                          (~(wire105 != wire110)) : (&wire122[(2'h2):(1'h0)])) : wire109)};
              reg144 <= $signed($unsigned($signed((~^reg131))));
              reg145 <= reg137[(4'hf):(1'h1)];
              reg146 <= $signed(({(reg127[(3'h7):(3'h7)] ?
                          (~reg137) : (^~reg137)),
                      $signed((~|reg118))} ?
                  $signed(($unsigned(wire109) ?
                      $signed((8'hbd)) : reg142)) : $unsigned($signed($unsigned((7'h44))))));
            end
          else
            begin
              reg142 <= {(~^(wire110 ? wire106 : (^~reg140[(3'h5):(2'h3)])))};
              reg143 <= $unsigned(reg146[(4'hf):(3'h5)]);
              reg144 <= (~|$signed($signed($unsigned($unsigned(reg115)))));
              reg145 <= $signed($unsigned(((-$signed(reg145)) * $unsigned((reg146 ?
                  wire110 : reg134)))));
            end
          if ({$signed(({(wire106 < wire110), (+reg139)} ?
                  (reg127[(3'h4):(2'h2)] ?
                      wire108[(4'h9):(1'h0)] : (~&reg131)) : (((8'ha5) ?
                          wire122 : wire124) ?
                      (reg137 > reg146) : reg140[(3'h4):(2'h2)])))})
            begin
              reg147 <= reg132;
              reg148 <= (8'had);
            end
          else
            begin
              reg147 <= reg128;
              reg148 <= {$signed(($unsigned(reg145) ?
                      $signed((reg143 == reg132)) : (&$unsigned(wire107))))};
            end
        end
    end
  assign wire149 = $unsigned(reg138[(3'h4):(2'h2)]);
  assign wire150 = wire110[(3'h7):(3'h7)];
endmodule

module module87  (y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  input wire signed [(4'hf):(1'h0)] wire89;
  input wire signed [(4'hd):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 (1'h0)};
  assign wire92 = (($unsigned(wire88) ?
                      (((wire88 ~^ wire88) ?
                          (wire88 < wire88) : wire88[(4'h8):(2'h3)]) ^~ $signed(wire89[(4'ha):(3'h6)])) : $signed(wire91)) > wire88[(3'h5):(1'h0)]);
  assign wire93 = ((wire89[(3'h5):(2'h3)] >> (($unsigned(wire89) < (~wire91)) ?
                      $signed({wire91}) : wire90[(3'h4):(1'h0)])) + {$signed((~$signed(wire88))),
                      (!wire91)});
  assign wire94 = (~|$signed(wire90[(2'h2):(2'h2)]));
  assign wire95 = wire93[(4'hb):(3'h7)];
  assign wire96 = ((~|wire92[(3'h6):(2'h2)]) ?
                      $signed(wire94[(4'hb):(2'h3)]) : (~|wire92[(4'hc):(4'ha)]));
  assign wire97 = wire93[(3'h7):(2'h3)];
  assign wire98 = wire95[(1'h1):(1'h1)];
  assign wire99 = wire96[(3'h6):(1'h1)];
endmodule
