module top
#(parameter param116 = (~^((8'hb9) ? {((8'hbd) ? (~&(8'hb9)) : ((8'hbb) & (8'hb8)))} : (-(((8'hb4) ? (7'h41) : (8'h9f)) ? ((8'hac) >>> (7'h43)) : ((8'hb4) ^ (8'h9d)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire108;
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire5,
                 wire46,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire108,
                 (1'h0)};
  assign wire5 = (wire1 <<< wire1[(2'h3):(2'h3)]);
  module6 #() modinst47 (wire46, clk, wire0, wire3, wire1, wire2);
  assign wire48 = {{{wire3[(5'h11):(4'hc)]}, ((+(-wire3)) << wire46)},
                      wire46[(2'h2):(1'h1)]};
  assign wire49 = ((wire1 - wire2[(3'h5):(2'h3)]) <= wire0);
  assign wire50 = $signed((wire49 >>> {$signed($unsigned(wire2)),
                      (^(!wire46))}));
  assign wire51 = wire0;
  assign wire52 = (~^(((wire46 && (wire0 || (7'h42))) ?
                      {$unsigned(wire51)} : (8'hb7)) <= wire3));
  assign wire53 = ((wire3[(3'h7):(3'h4)] ?
                      {{{(8'h9f), wire51}},
                          wire49[(3'h4):(2'h2)]} : $signed((~|wire5[(2'h3):(2'h2)]))) && $unsigned(wire51));
  module54 #() modinst109 (.wire56(wire53), .wire59(wire1), .clk(clk), .wire58(wire49), .y(wire108), .wire55(wire50), .wire57(wire52));
  assign wire110 = wire48[(2'h2):(2'h2)];
  assign wire111 = (($signed(wire1[(4'h8):(3'h5)]) ?
                       wire0[(2'h3):(2'h3)] : $signed(wire0)) << {(~&((|(8'hbb)) + $unsigned(wire4))),
                       (wire51 || ((|(8'hbb)) >>> $unsigned(wire49)))});
  assign wire112 = ({wire5[(3'h4):(3'h4)],
                       {((8'hbc) > wire3[(2'h2):(1'h1)])}} || ((8'hb4) & ($signed({wire2}) ?
                       ($signed(wire111) ?
                           (-wire2) : {wire48,
                               wire108}) : wire52[(2'h2):(1'h1)])));
  assign wire113 = (7'h44);
  assign wire114 = ({$unsigned((wire108 ?
                           ((8'hb2) ?
                               wire4 : wire2) : {wire0}))} >> wire0[(3'h6):(3'h6)]);
  assign wire115 = wire46[(2'h3):(1'h1)];
endmodule

module module54
#(parameter param107 = ((|{(8'ha9), ({(8'hab), (8'hac)} + {(8'ha3), (8'hbc)})}) ? {((8'h9d) ? (+{(8'h9f), (7'h44)}) : (8'hb9)), ((((8'ha0) > (8'ha7)) ? ((8'ha3) << (8'hb8)) : ((8'hb5) ? (8'hb9) : (8'hb9))) >>> (((8'ha7) ~^ (7'h42)) <<< {(8'hb1)}))} : (({(-(8'hb0)), {(8'hb4), (8'hbd)}} ? (8'hbb) : (8'h9f)) ^ ((8'ha1) > ((8'hb3) > ((8'hb9) ? (8'hab) : (8'hbb)))))))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire59;
  input wire signed [(4'ha):(1'h0)] wire58;
  input wire [(4'hb):(1'h0)] wire57;
  input wire [(4'hc):(1'h0)] wire56;
  input wire [(4'ha):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire60;
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire60,
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
  assign wire60 = wire55[(2'h3):(1'h1)];
  module61 #() modinst87 (wire86, clk, wire58, wire57, wire55, wire60);
  assign wire88 = wire86;
  assign wire89 = $unsigned($signed($unsigned(wire88)));
  assign wire90 = ((8'h9c) && (+wire59));
  assign wire91 = wire56;
  assign wire92 = ({$unsigned({wire58}),
                      wire89[(3'h7):(1'h0)]} ^ (^(($signed(wire58) || (wire55 ?
                          wire90 : wire88)) ?
                      ($signed(wire90) ?
                          $signed((8'hae)) : wire90) : {$signed(wire59),
                          (wire57 && wire55)})));
  assign wire93 = (|(^~(~|$unsigned((wire60 ? wire56 : wire88)))));
  always
    @(posedge clk) begin
      if ($signed(wire88))
        begin
          reg94 <= $signed({{$signed((wire60 || wire86)), $signed((8'hba))}});
          reg95 <= $unsigned(wire55);
        end
      else
        begin
          reg94 <= wire60;
          reg95 <= ({$signed({((8'ha0) ? reg94 : reg95),
                  {(8'hb4), reg95}})} >>> $signed(($unsigned((wire58 ?
                  (8'hb9) : wire93)) ?
              ({wire86} ? {wire60} : (~^wire59)) : wire88)));
          if (wire90[(5'h13):(1'h1)])
            begin
              reg96 <= (^~($unsigned(((!wire56) ?
                      $signed(wire56) : (wire59 ? wire59 : wire57))) ?
                  $unsigned((^wire86[(2'h3):(2'h2)])) : wire93[(5'h13):(1'h0)]));
              reg97 <= (~&wire58[(3'h6):(2'h2)]);
            end
          else
            begin
              reg96 <= $unsigned($unsigned((~{(wire89 ? (8'hb4) : wire92),
                  (8'ha4)})));
              reg97 <= $unsigned($signed({wire93[(1'h1):(1'h0)]}));
              reg98 <= {{wire89[(4'h9):(1'h0)]}, $signed(wire93)};
              reg99 <= (|(((reg94[(4'he):(1'h1)] ?
                  (wire56 ?
                      wire88 : reg98) : wire57[(4'ha):(3'h4)]) * ((~&wire58) ?
                  (reg96 ? wire91 : wire57) : {wire89})) & (((wire88 ?
                          reg96 : reg98) ?
                      (&reg95) : (wire91 - wire59)) ?
                  {(8'h9f)} : reg97[(3'h5):(3'h4)])));
            end
          reg100 <= ((&(wire55 - ((^~wire93) <= (wire59 >= reg97)))) >> wire60[(4'h9):(3'h6)]);
          reg101 <= ($signed((reg100[(5'h12):(4'hc)] >= $unsigned(wire60))) | reg96[(3'h4):(2'h3)]);
        end
      reg102 <= $unsigned({wire89[(2'h2):(2'h2)],
          $signed({(reg96 * reg101), {wire86, reg94}})});
      reg103 <= reg94;
      reg104 <= (($unsigned((&{wire56})) ?
              reg101 : ({$signed(reg100), (~&(8'h9c))} ?
                  $unsigned(reg94[(4'ha):(4'ha)]) : (!(^reg101)))) ?
          {{$signed($signed(wire57)), {$unsigned(reg101)}},
              $signed(((reg102 ? (8'hac) : reg95) ?
                  (^~reg96) : $signed(wire93)))} : $signed($unsigned((wire86 >= ((8'hb7) == wire93)))));
    end
  assign wire105 = reg97[(3'h5):(3'h4)];
  assign wire106 = wire56;
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire44;
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  assign y = {wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire44,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire11 = (|{($signed((wire9 <= wire7)) ?
                          $signed($unsigned(wire10)) : (8'hab)),
                      (wire9[(2'h3):(2'h2)] != {(|wire9), wire8})});
  assign wire12 = ({(wire10[(2'h2):(2'h2)] ^ $signed({wire7, wire8})),
                      (|$signed((^~(8'h9e))))} && wire8[(2'h3):(2'h3)]);
  assign wire13 = wire7[(4'h9):(1'h1)];
  assign wire14 = wire13;
  assign wire15 = (~|$signed({$signed(wire10)}));
  always
    @(posedge clk) begin
      reg16 <= $signed({($unsigned(wire10) || (^~(wire11 && wire15)))});
      if (((~|$unsigned((+(wire15 <<< wire9)))) <= wire8[(1'h0):(1'h0)]))
        begin
          reg17 <= ((^~$signed(wire13)) != {$unsigned(((~|(7'h43)) ?
                  wire13[(1'h0):(1'h0)] : wire13[(4'h9):(1'h1)]))});
        end
      else
        begin
          reg17 <= (7'h42);
        end
    end
  module18 #() modinst45 (wire44, clk, wire10, wire11, wire8, reg16);
endmodule

module module18
#(parameter param42 = (((8'h9e) ? ({((8'h9f) ? (8'ha5) : (8'haf))} >> ((~|(8'ha3)) ? ((8'ha2) || (7'h42)) : (&(8'ha0)))) : ({((8'hba) << (8'hb4))} == (((8'ha2) != (8'ha4)) > (|(8'h9d))))) ? (((((8'haf) < (8'hb7)) ^~ (^~(8'h9f))) ^ ((-(8'ha2)) >>> (|(8'h9c)))) ? (^{{(8'hab)}, ((8'had) == (7'h41))}) : (^~((-(8'ha3)) ? ((7'h40) ? (8'haf) : (8'ha2)) : (+(7'h41))))) : (7'h42)), 
parameter param43 = ({({(param42 ? param42 : param42), (param42 != param42)} >> param42), param42} > (^~param42)))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg31,
                 (1'h0)};
  assign wire23 = wire22[(1'h1):(1'h0)];
  assign wire24 = (-$unsigned(wire21));
  assign wire25 = (~^$unsigned(((^~wire24[(2'h3):(1'h0)]) ?
                      {((8'h9c) << wire20),
                          $signed(wire20)} : (^~(wire19 <= wire19)))));
  assign wire26 = wire24;
  assign wire27 = (wire24 ?
                      wire21[(4'ha):(3'h5)] : (({$signed(wire21)} ?
                              {$unsigned(wire23)} : ((&wire25) < (wire19 ?
                                  (7'h41) : wire23))) ?
                          (~|$signed(wire23)) : wire20));
  assign wire28 = ($unsigned((8'ha8)) & wire19[(2'h3):(1'h0)]);
  assign wire29 = $signed($unsigned(wire22[(1'h1):(1'h1)]));
  assign wire30 = wire22[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg31 <= wire28;
    end
  assign wire32 = (((wire25[(4'hb):(1'h0)] ?
                      (8'h9f) : (!(wire27 - wire27))) > ((~|$signed(wire30)) ?
                      (wire26[(1'h0):(1'h0)] ?
                          $signed((7'h42)) : (wire26 ?
                              (8'h9d) : wire23)) : ($unsigned(wire29) ?
                          wire25 : $signed((8'hb6))))) || reg31);
  assign wire33 = reg31;
  assign wire34 = wire19[(3'h6):(1'h1)];
  assign wire35 = $signed({wire26[(1'h0):(1'h0)],
                      ({(wire21 ? wire30 : wire27),
                          wire29[(2'h3):(1'h1)]} << (~|(wire26 - wire33)))});
  assign wire36 = wire29;
  assign wire37 = wire24;
  assign wire38 = wire36;
  assign wire39 = (($signed((~|(!wire23))) ?
                      {(-(wire22 & reg31)),
                          $signed($signed(wire33))} : wire33) * $unsigned(((&$signed(wire20)) >>> $unsigned(wire35[(1'h0):(1'h0)]))));
  assign wire40 = (($unsigned($unsigned((wire25 ? wire26 : wire23))) ?
                      $signed($signed((wire39 ^~ wire37))) : (wire23[(3'h4):(2'h3)] ?
                          $signed($signed(wire32)) : wire27[(2'h3):(2'h2)])) * wire34);
  assign wire41 = $signed(wire36[(1'h0):(1'h0)]);
endmodule

module module61
#(parameter param85 = ({((!(+(8'ha5))) > (|(8'had))), {((~(8'hb6)) & ((8'had) & (8'haa)))}} ? (((|{(8'h9e), (8'haf)}) || (((8'h9d) ? (8'hb6) : (7'h42)) ? (~|(8'ha0)) : ((8'h9e) > (8'h9d)))) ? {(((7'h42) < (8'hbb)) ? ((7'h40) << (8'ha6)) : ((8'hbd) ? (8'ha6) : (8'h9f)))} : ((~^((8'h9c) ? (8'ha6) : (8'hba))) == {(&(8'haf))})) : ((((^~(7'h40)) ? ((7'h41) >>> (8'ha0)) : ((8'h9f) ? (8'ha9) : (8'hae))) + (|{(8'ha2), (8'hac)})) ? {((&(8'hba)) ? ((8'hb8) ? (8'hbd) : (8'hbf)) : (!(7'h41))), ({(8'hbc), (8'ha3)} & ((8'hb5) * (8'hb4)))} : ((((8'hbf) ? (8'hbd) : (8'hbb)) ^~ ((8'ha2) ^ (7'h44))) ? (&((8'hbe) ? (8'hbe) : (8'hac))) : (-(+(8'ha2)))))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire [(4'ha):(1'h0)] wire63;
  input wire signed [(4'hd):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire75,
                 wire70,
                 wire68,
                 wire67,
                 wire66,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg69,
                 (1'h0)};
  assign wire66 = (^~((^~(~^wire62)) ?
                      $signed((8'hba)) : $unsigned($unsigned({wire62,
                          wire63}))));
  assign wire67 = {({wire64[(1'h0):(1'h0)], (8'hba)} ?
                          (8'hb4) : wire66[(1'h1):(1'h0)]),
                      wire64[(3'h7):(3'h4)]};
  assign wire68 = (~|(&wire62));
  always
    @(posedge clk) begin
      reg69 <= ($signed($unsigned(wire64[(3'h6):(2'h3)])) ?
          ($signed(wire63[(2'h2):(1'h1)]) || $unsigned(wire66[(1'h1):(1'h1)])) : wire65);
    end
  assign wire70 = ($signed((wire66[(2'h2):(2'h2)] || (wire68 ?
                          {wire63, wire68} : $unsigned(wire63)))) ?
                      wire65 : ((((wire63 == (8'had)) <<< (reg69 ?
                                  wire66 : wire63)) ?
                              (wire62 >> {wire67}) : (wire68[(2'h2):(1'h1)] ?
                                  wire68[(1'h1):(1'h0)] : $unsigned((8'hb3)))) ?
                          ($signed((wire63 ? wire63 : wire68)) ?
                              $signed((wire65 > wire67)) : wire65) : {wire63,
                              ((wire63 | wire65) ?
                                  $unsigned(wire65) : $unsigned(wire66))}));
  always
    @(posedge clk) begin
      reg71 <= $signed($signed((reg69[(4'hd):(2'h3)] < $unsigned(((8'hb2) < wire64)))));
      reg72 <= (wire68[(3'h4):(1'h1)] ?
          (({$signed((8'hb2))} ?
              $signed((reg69 ? wire63 : wire68)) : (wire65 ?
                  (!reg69) : (|wire67))) * (((wire63 ?
                  (8'ha9) : wire62) <= (|reg71)) ?
              wire66[(1'h1):(1'h0)] : wire66[(2'h2):(2'h2)])) : ($signed((~(~&wire62))) ^~ (wire65[(3'h5):(1'h0)] != ({wire66,
                  (8'hb7)} ?
              (wire67 && wire70) : $unsigned(wire63)))));
      reg73 <= ($unsigned((((wire63 > reg69) < $unsigned(wire70)) | ($signed((8'h9c)) ?
              {(8'hbf), wire65} : $signed((8'ha1))))) ?
          wire64 : (~^({(~&wire62), wire65[(4'ha):(2'h2)]} ?
              reg69 : wire64[(2'h3):(2'h2)])));
      reg74 <= (~&wire65);
    end
  assign wire75 = {($signed(($signed(wire70) ?
                              $signed(wire68) : {wire63, wire65})) ?
                          ((wire62 ? (8'ha9) : (wire66 != (8'hb8))) ?
                              {(wire66 ? wire70 : wire63),
                                  reg72[(3'h4):(2'h3)]} : wire65[(4'h9):(3'h7)]) : (reg74[(2'h3):(2'h3)] ?
                              wire65 : ((!wire65) ?
                                  $unsigned(wire65) : (wire70 ?
                                      wire68 : (8'hb5)))))};
  always
    @(posedge clk) begin
      reg76 <= {$signed($unsigned($signed(reg72))), (~|(~^reg73))};
      reg77 <= {((wire65[(1'h0):(1'h0)] > $unsigned({reg69,
              reg71})) == ((!(^wire65)) ?
              (~&((8'hbf) >> (8'haa))) : ((reg71 ?
                  wire62 : wire63) ^~ $unsigned(wire64))))};
      reg78 <= reg71[(5'h12):(3'h7)];
      reg79 <= $signed(((8'h9c) ? wire63 : (8'hb0)));
    end
  assign wire80 = wire63[(3'h5):(2'h3)];
  assign wire81 = $signed(({(^~$signed(wire70)),
                      $signed($unsigned(wire64))} >> $signed(($unsigned(wire65) <<< (|wire70)))));
  assign wire82 = (~(+(((wire62 ?
                      reg74 : wire80) <<< (reg71 && reg71)) + $unsigned($signed(wire67)))));
  assign wire83 = ($signed({wire62, $signed((reg71 | reg77))}) ?
                      ((!(reg72 >>> {reg74, wire67})) ?
                          $unsigned(({wire63} ^~ {wire75,
                              wire80})) : reg72[(4'hc):(3'h6)]) : $signed((wire64[(3'h6):(3'h4)] ~^ (7'h41))));
  assign wire84 = ($unsigned(reg71) - ((^~$unsigned(reg71[(1'h1):(1'h1)])) ?
                      $unsigned($unsigned((~|reg76))) : ((wire75 <<< $signed(wire67)) ?
                          reg79 : $signed((wire62 ^ reg78)))));
endmodule
