module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire111;
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  assign y = {wire120,
                 wire113,
                 wire60,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire111,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 (1'h0)};
  module5 #() modinst61 (wire60, clk, wire1, wire3, wire0, wire4, wire2);
  assign wire62 = {wire2[(5'h13):(3'h5)]};
  assign wire63 = $unsigned(wire62[(2'h3):(1'h0)]);
  assign wire64 = ($signed({((wire2 ? wire0 : wire3) ?
                          {wire2} : $signed(wire3)),
                      wire63}) >> (!$unsigned(wire3[(4'h9):(3'h6)])));
  assign wire65 = $signed(wire3);
  always
    @(posedge clk) begin
      reg66 <= $unsigned((wire3 ?
          ((8'ha6) ? wire2 : $signed((~wire63))) : wire1));
      reg67 <= $unsigned($signed((-(8'ha7))));
      reg68 <= wire63[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      if (wire60[(3'h7):(2'h2)])
        begin
          reg69 <= reg66[(1'h1):(1'h0)];
          reg70 <= ($signed($unsigned($unsigned({reg68,
              reg66}))) <= (+(^((8'hbd) ~^ $signed(wire63)))));
          reg71 <= $unsigned($unsigned(wire63));
        end
      else
        begin
          if (wire60[(5'h14):(4'hf)])
            begin
              reg69 <= $signed(wire64);
              reg70 <= wire0[(1'h0):(1'h0)];
              reg71 <= wire4[(3'h4):(1'h0)];
              reg72 <= reg68;
            end
          else
            begin
              reg69 <= ((~^wire4) ?
                  (|{$signed(((7'h41) ?
                          wire64 : reg67))}) : $unsigned($unsigned(({reg71} ?
                      (!reg66) : $unsigned(wire63)))));
              reg70 <= $signed({{$unsigned((wire1 == (8'ha8)))}});
              reg71 <= (~^wire0);
              reg72 <= reg66[(2'h2):(1'h0)];
              reg73 <= (8'hac);
            end
          reg74 <= $unsigned((8'haf));
          if (reg74[(3'h7):(3'h5)])
            begin
              reg75 <= $signed($signed($signed(($unsigned(reg67) >= wire0[(1'h0):(1'h0)]))));
              reg76 <= $unsigned((((8'hae) - $signed((reg68 ?
                  reg72 : wire3))) > (((^wire60) > (reg67 ? wire1 : (8'hbb))) ?
                  ($unsigned(reg73) | (&wire2)) : (reg69[(4'hd):(4'hd)] | (|wire0)))));
            end
          else
            begin
              reg75 <= reg73[(4'ha):(4'h9)];
              reg76 <= {wire3,
                  ($unsigned({(|reg74)}) ?
                      (&((wire1 & wire3) - (&reg74))) : {($signed(wire1) ?
                              (&wire62) : $signed(wire63)),
                          $unsigned(wire60[(3'h4):(2'h2)])})};
              reg77 <= (((((reg67 ? (8'ha2) : reg68) <= (+wire65)) <= reg69) ?
                      $signed(wire4) : (~(reg69[(4'hd):(2'h3)] ?
                          $unsigned(wire3) : ((7'h44) ? wire65 : wire63)))) ?
                  reg76[(1'h1):(1'h1)] : $signed((^reg74)));
            end
          reg78 <= $unsigned({reg71[(3'h7):(3'h4)]});
        end
      reg79 <= ((^($signed(wire64) <<< ($unsigned(wire64) ?
          $unsigned(reg71) : ((8'hb6) + wire1)))) < (((-reg78[(1'h1):(1'h1)]) ?
          (~^$signed(reg68)) : $signed((^(8'ha3)))) ^~ $signed(({reg69} ?
          (8'hbf) : reg69[(3'h7):(2'h2)]))));
    end
  module80 #() modinst112 (.y(wire111), .wire85(reg66), .wire81(reg76), .clk(clk), .wire82(reg68), .wire84(wire2), .wire83(reg67));
  assign wire113 = (~&reg78[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (reg78[(2'h2):(2'h2)])
        begin
          reg114 <= (~|($signed((8'hab)) | ($signed((reg78 ?
                  (8'hba) : wire62)) ?
              (reg68 ~^ (-(8'hba))) : $signed((|(8'hbc))))));
          reg115 <= (^~(($signed(((8'ha0) ?
              (8'hbc) : wire2)) | reg77[(4'hd):(3'h4)]) ^~ reg77));
          reg116 <= (+(&(8'h9e)));
          reg117 <= $signed(wire60);
        end
      else
        begin
          reg114 <= (8'hb4);
          if ((8'ha3))
            begin
              reg115 <= $unsigned(((((&wire113) ?
                  $signed(wire111) : (-(8'hb4))) ^~ reg73) >= $unsigned(wire60[(4'he):(3'h5)])));
            end
          else
            begin
              reg115 <= {(|$signed(wire64[(4'ha):(3'h5)]))};
              reg116 <= reg77[(3'h4):(3'h4)];
              reg117 <= $unsigned($unsigned(reg66[(3'h5):(1'h1)]));
            end
        end
      reg118 <= $unsigned(wire0);
      reg119 <= ({$signed(($unsigned(wire111) > (wire3 ? (8'hbd) : (8'h9f))))} ?
          (8'ha6) : {(reg66[(2'h3):(2'h2)] >>> (+reg78))});
    end
  assign wire120 = reg68;
endmodule

module module80  (y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire85;
  input wire signed [(4'hd):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire [(4'hb):(1'h0)] wire82;
  input wire signed [(5'h11):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire103,
                 wire98,
                 wire97,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg96,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg86 <= {$signed((~&wire81))};
      if (($unsigned(wire82) ?
          (8'ha2) : $signed(((~^(|wire85)) ?
              (^$unsigned(reg86)) : {{wire83, wire84}, (~(8'ha5))}))))
        begin
          reg87 <= ((wire81[(4'h9):(1'h1)] >>> (-((^~wire82) ?
                  $unsigned(wire82) : {(8'ha4)}))) ?
              $signed(((&(wire82 <<< wire81)) ?
                  (&(~^wire82)) : (wire83[(5'h12):(2'h2)] ?
                      wire82[(3'h4):(2'h3)] : $signed(wire84)))) : (~wire85[(4'h9):(3'h7)]));
          reg88 <= {(+$unsigned(wire82)), $signed(reg86)};
          if (((~^{{(~|wire81)},
              ((wire83 << reg86) ^ $unsigned(wire81))}) << {$unsigned($unsigned({wire84,
                  (7'h42)}))}))
            begin
              reg89 <= $unsigned(wire84);
              reg90 <= (reg86[(5'h11):(3'h7)] + (^~reg87));
              reg91 <= $signed((~(+reg89)));
              reg92 <= $unsigned(($unsigned((reg91 != (~&reg90))) ?
                  (wire84[(3'h6):(2'h3)] | reg88[(2'h2):(1'h0)]) : reg89[(3'h5):(1'h0)]));
              reg93 <= wire82;
            end
          else
            begin
              reg89 <= (|$unsigned($unsigned((((8'hb0) ?
                  wire83 : reg89) ^ (reg86 >>> wire85)))));
              reg90 <= wire81[(4'ha):(1'h0)];
              reg91 <= reg88;
              reg92 <= ($unsigned(((!(wire84 ?
                      reg92 : (8'ha1))) != (^$unsigned(reg88)))) ?
                  reg86[(5'h12):(5'h12)] : {$signed(reg91), reg91});
            end
        end
      else
        begin
          reg87 <= ({wire82} ?
              (|$unsigned($signed((!reg87)))) : wire85[(3'h7):(3'h6)]);
          reg88 <= $unsigned($unsigned(reg89));
        end
      reg94 <= (^{(|(~|(^~wire82)))});
      reg95 <= ($unsigned(reg89) * reg86);
      reg96 <= $signed(({$signed($signed(reg90)),
              (reg93[(4'hc):(4'h9)] ? (^reg89) : $signed(reg94))} ?
          $signed(reg95) : wire83[(4'ha):(2'h3)]));
    end
  assign wire97 = reg95;
  assign wire98 = {wire82[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg99 <= $signed((8'hb7));
      reg100 <= ((wire98 <<< wire82) ^ (((8'hb5) >>> $signed(((8'hba) << reg94))) == $unsigned(((~wire85) ?
          {reg99, wire82} : $signed(reg86)))));
      reg101 <= reg96;
      reg102 <= ((^~$unsigned($signed((|reg93)))) || reg95);
    end
  assign wire103 = reg86[(4'hd):(1'h0)];
  always
    @(posedge clk) begin
      reg104 <= ((|(-(^wire81[(2'h3):(1'h1)]))) | (~^({$unsigned(reg101),
              $signed(reg91)} ?
          {((8'hb8) ? wire85 : reg100)} : $signed($unsigned(reg87)))));
      reg105 <= {(reg93[(3'h4):(2'h3)] < (-($unsigned(wire83) ?
              $unsigned((8'hbc)) : (7'h44))))};
      reg106 <= ($signed({($signed(reg102) <<< wire97[(2'h2):(2'h2)])}) ~^ ($unsigned((-reg93)) ?
          (((reg86 << wire83) < reg105[(5'h13):(5'h13)]) ?
              wire82[(4'h8):(3'h7)] : ((reg102 ?
                  reg105 : wire97) >>> reg93[(2'h2):(1'h0)])) : $unsigned(reg100)));
    end
  always
    @(posedge clk) begin
      if (($signed((~|reg88[(1'h1):(1'h1)])) & (&$unsigned((&(reg89 ?
          reg106 : wire98))))))
        begin
          reg107 <= (-(!$unsigned(wire103[(2'h3):(1'h1)])));
          reg108 <= reg99;
        end
      else
        begin
          reg107 <= ($unsigned({(~^{reg104})}) ?
              reg102[(4'he):(4'hc)] : {$signed(($signed(reg102) * reg105)),
                  ($unsigned($unsigned(reg99)) ?
                      $unsigned((wire84 < reg106)) : $unsigned({wire85,
                          reg94}))});
        end
    end
  assign wire109 = {{((|(reg90 * wire85)) ?
                               {((8'hae) >> wire98),
                                   (reg94 ? reg104 : reg100)} : reg96),
                           reg99},
                       ((wire81[(3'h4):(3'h4)] ?
                               reg92[(3'h7):(3'h4)] : {{wire81}}) ?
                           (reg96 ?
                               ({reg102, reg102} <= (reg95 ?
                                   reg100 : reg87)) : (((8'hb5) ?
                                   reg104 : wire82) < reg90)) : $unsigned((~reg101)))};
  assign wire110 = $signed($unsigned((reg104 != (!{reg108, wire83}))));
endmodule

module module5
#(parameter param58 = ((({{(8'ha8)}, ((8'ha3) || (7'h43))} ? (+(^(7'h42))) : ((~^(8'ha9)) == ((8'hba) <= (8'ha6)))) ? (^(((8'ha8) ^ (7'h40)) ? ((8'hb4) ? (8'hbf) : (8'hac)) : ((8'hab) || (8'ha2)))) : ({((8'hae) ? (8'ha7) : (8'hb3)), ((8'hae) ? (8'ha3) : (8'hba))} ~^ (((8'hab) ^ (8'ha1)) ? ((8'ha9) ? (8'hb7) : (8'ha4)) : ((8'ha6) ? (8'hb7) : (8'ha5))))) < ((!(((8'hb7) ? (8'hb4) : (8'hb6)) <= ((8'hb3) <<< (8'ha2)))) <<< (({(8'hb0)} ? (&(8'h9e)) : ((8'hae) * (8'hbf))) - ({(8'h9d), (7'h44)} ? {(8'hbf)} : ((8'hbb) | (8'h9c)))))), 
parameter param59 = (((^{(param58 >= param58), param58}) ? param58 : (param58 | (~|{(8'ha0)}))) - (param58 ^ (((param58 << param58) <= (^~param58)) ? (&{param58}) : ((param58 ? param58 : (8'hba)) ? (~^(8'ha3)) : (param58 | param58))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h233):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire11 = (8'hac);
  assign wire12 = ($unsigned(wire11[(4'he):(4'h8)]) + wire9);
  assign wire13 = ((8'h9d) >> ((((wire10 | (8'ha0)) != (wire7 ~^ wire9)) * $signed(wire11[(2'h3):(1'h1)])) <= $signed(wire11[(3'h6):(3'h4)])));
  assign wire14 = ($unsigned(wire11[(5'h10):(4'hb)]) ?
                      wire10 : (~&$unsigned(wire11[(3'h7):(3'h6)])));
  always
    @(posedge clk) begin
      if ((wire6 ? wire14[(2'h2):(1'h1)] : (8'ha5)))
        begin
          if ($signed(((!(!$unsigned(wire11))) > wire8)))
            begin
              reg15 <= wire10;
              reg16 <= ((-wire7) ?
                  ((8'had) ?
                      ((+(~|wire12)) ?
                          (|{wire6}) : (~^$signed(wire14))) : $signed({(wire11 <= wire14)})) : $signed((~&$unsigned(wire14))));
              reg17 <= {$signed((wire11 ?
                      (7'h42) : ($signed(wire10) ?
                          (~^wire8) : (reg15 <<< wire8)))),
                  ({{(wire13 <= wire14)}} ?
                      $unsigned({(~&(8'ha5))}) : ((~&$signed(wire7)) ^~ $signed($signed(wire9))))};
            end
          else
            begin
              reg15 <= (+{$unsigned(({wire6} & (wire7 ? wire14 : wire11)))});
              reg16 <= $signed(($signed($unsigned(wire7[(5'h11):(4'ha)])) >= (({reg15,
                          wire11} ?
                      $signed(wire12) : wire10[(4'h9):(1'h1)]) ?
                  $unsigned((wire6 ^ wire7)) : $unsigned($unsigned(wire7)))));
              reg17 <= $unsigned(wire6[(3'h5):(2'h3)]);
              reg18 <= $signed({$unsigned($unsigned((wire10 > wire6)))});
            end
          if ((!reg17[(2'h2):(2'h2)]))
            begin
              reg19 <= reg16;
              reg20 <= (^reg15);
              reg21 <= ((~|(+$signed(reg19))) <<< ((&($signed(reg19) ?
                      (^~wire10) : $unsigned((8'ha4)))) ?
                  (~^$signed((reg16 >> wire11))) : wire11));
              reg22 <= {(($unsigned(reg19[(1'h0):(1'h0)]) ?
                          {(wire9 ? reg15 : (7'h41)),
                              $signed(wire13)} : reg17[(3'h7):(2'h2)]) ?
                      (((^wire6) ?
                          $unsigned(wire14) : reg20[(4'ha):(1'h1)]) | wire11[(3'h7):(2'h3)]) : reg21)};
            end
          else
            begin
              reg19 <= ((reg21[(4'hd):(4'hc)] ?
                  {reg17} : {((wire12 ? (8'h9f) : wire12) ?
                          $unsigned(wire13) : (wire9 ?
                              reg17 : reg20))}) | ({$signed({wire9,
                      wire7})} ^~ {{(reg15 & (8'hac))}}));
              reg20 <= (($signed(wire14[(3'h6):(2'h2)]) ?
                      $unsigned((8'hb4)) : wire9[(2'h3):(2'h3)]) ?
                  reg17[(4'h9):(4'h8)] : (&{((^wire6) && (-wire13)),
                      $unsigned(reg21[(4'h8):(3'h6)])}));
            end
          if ({{((+$signed(wire10)) ?
                      $unsigned({(7'h40)}) : ($unsigned(reg21) ?
                          wire12[(3'h7):(3'h7)] : reg22[(4'hd):(3'h6)])),
                  (((wire10 ? (8'ha2) : reg19) ? (reg18 + wire8) : wire10) ?
                      $signed((reg15 ? wire10 : reg18)) : {$signed(wire8),
                          (wire9 ? reg20 : reg18)})}})
            begin
              reg23 <= (8'ha6);
            end
          else
            begin
              reg23 <= $signed(($unsigned(wire9) <<< (~{$unsigned(reg15)})));
              reg24 <= (~&(^~(~$signed((reg16 ~^ reg22)))));
              reg25 <= wire7[(5'h11):(4'h8)];
              reg26 <= (~&reg19[(3'h6):(2'h2)]);
              reg27 <= $unsigned(((reg19 >= $unsigned(reg17)) ?
                  $signed($signed(reg15)) : (~|reg18)));
            end
          if ({($unsigned(($unsigned(reg22) ?
                  $signed(reg16) : $unsigned((8'h9e)))) <<< {(7'h44),
                  {(wire6 ? wire10 : (8'ha0)), (~^wire11)}})})
            begin
              reg28 <= $signed(wire11[(3'h7):(3'h4)]);
              reg29 <= $signed(reg23);
              reg30 <= $signed((-(^wire7[(2'h3):(2'h2)])));
              reg31 <= reg24;
              reg32 <= (~$unsigned((((|reg27) == wire13[(4'hb):(4'ha)]) - $unsigned($signed((8'hbf))))));
            end
          else
            begin
              reg28 <= $signed((((reg15[(4'h8):(1'h1)] && $unsigned(wire12)) + ($signed(reg15) ?
                  reg26 : reg23[(4'ha):(3'h5)])) ~^ $unsigned(reg21)));
              reg29 <= ($unsigned((+reg32[(3'h5):(2'h3)])) ?
                  (~^$unsigned((-(wire8 <= (8'hbc))))) : ($unsigned(reg15) == wire14));
            end
        end
      else
        begin
          reg15 <= (wire14[(1'h1):(1'h0)] && $unsigned({reg22}));
          reg16 <= $unsigned((^~((~&$signed((8'hb5))) > reg20[(4'hd):(3'h4)])));
          reg17 <= {(($unsigned(reg21) ?
                      ((reg20 ? reg32 : (8'ha7)) ?
                          (~|reg21) : $unsigned(wire8)) : ((~^reg18) ?
                          reg24 : $signed(wire14))) ?
                  $unsigned($unsigned(((8'hbb) - reg17))) : wire10[(3'h5):(1'h0)]),
              $signed((((reg28 ?
                  (8'haf) : wire9) && $unsigned(reg21)) >= ((reg20 ?
                      reg15 : reg18) ?
                  (wire8 || reg27) : (|reg18))))};
          reg18 <= $unsigned((({$unsigned(reg25), (reg29 != reg27)} ?
              $unsigned((reg18 | reg30)) : reg32[(3'h6):(2'h2)]) * {wire14[(3'h6):(3'h4)],
              ($signed(reg21) ?
                  $unsigned(reg27) : ((8'h9c) ? reg15 : reg31))}));
        end
      reg33 <= $signed(reg18[(1'h0):(1'h0)]);
    end
  assign wire34 = (8'hbf);
  assign wire35 = ((8'ha6) ? reg16 : wire34);
  assign wire36 = {$unsigned((reg15 ?
                          (wire14[(3'h7):(3'h7)] >>> (reg26 != wire11)) : wire11)),
                      ({($signed(wire10) & (+reg18))} & (+(^wire35[(1'h0):(1'h0)])))};
  assign wire37 = ($signed(reg27[(1'h1):(1'h0)]) << reg18[(2'h2):(2'h2)]);
  assign wire38 = ($unsigned((reg24 ^~ (wire35 ?
                      (~(7'h41)) : $unsigned(reg25)))) >>> (!(^~(&reg18))));
  assign wire39 = {(~&wire36)};
  assign wire40 = (^$signed($unsigned(wire8)));
  always
    @(posedge clk) begin
      if ({$signed((~&$signed((-(7'h44))))), $unsigned(reg30)})
        begin
          if ($unsigned((~|(^~wire37))))
            begin
              reg41 <= $unsigned((reg16[(3'h5):(3'h5)] >>> reg23[(4'he):(4'ha)]));
              reg42 <= ($signed($unsigned($unsigned((|wire11)))) & $signed(wire14));
            end
          else
            begin
              reg41 <= $unsigned((&($unsigned((wire8 ?
                  reg28 : reg23)) != (|reg41[(2'h2):(1'h0)]))));
              reg42 <= wire10;
            end
          reg43 <= $signed((+reg41[(1'h0):(1'h0)]));
        end
      else
        begin
          reg41 <= (^~(~&reg43[(1'h1):(1'h1)]));
        end
      if ((~|reg41))
        begin
          if ((^~($unsigned($signed((reg24 <= reg29))) >= $signed($signed($signed(wire12))))))
            begin
              reg44 <= ($unsigned({(((8'ha5) ?
                      (8'hab) : wire7) & $signed(reg21))}) && $signed((!(7'h41))));
              reg45 <= $unsigned(((wire40 ?
                      (reg30[(2'h2):(2'h2)] << $signed(wire8)) : {(wire10 <= reg28)}) ?
                  (reg41 >> reg24) : (wire11[(4'he):(3'h6)] ?
                      (~^(~|wire34)) : $signed((^~(8'haf))))));
              reg46 <= wire13;
            end
          else
            begin
              reg44 <= ($unsigned(reg15) | ({(^{reg42}),
                  wire9[(4'ha):(3'h6)]} * $unsigned(reg26)));
              reg45 <= (($signed({((7'h42) << (8'hba))}) | $unsigned((((8'had) >> reg32) ?
                  (reg30 & wire40) : (wire14 > reg24)))) >> wire36);
              reg46 <= ((reg31[(3'h6):(2'h2)] ?
                  ($unsigned(reg45[(2'h2):(1'h0)]) ?
                      ((reg29 < reg20) ?
                          (reg29 ? reg33 : (8'hae)) : (-wire8)) : {(wire7 ?
                              (7'h43) : (8'ha9))}) : $signed((-$signed(reg41)))) ^~ {$unsigned(($signed((8'ha8)) ~^ (wire12 & reg21)))});
              reg47 <= $signed({(({reg31, reg17} ?
                      reg17[(4'ha):(1'h0)] : (~^wire10)) ~^ reg28),
                  wire7[(4'h9):(3'h5)]});
            end
        end
      else
        begin
          reg44 <= (&wire6[(4'he):(4'h9)]);
          reg45 <= {($signed(reg23) ?
                  (((wire7 <<< (8'h9d)) ? (reg30 ? reg21 : wire10) : (&wire9)) ?
                      $signed(wire12[(1'h0):(1'h0)]) : wire14[(4'ha):(3'h7)]) : wire9),
              reg25[(4'h8):(3'h7)]};
        end
      reg48 <= ((!($unsigned((wire7 ? wire7 : reg31)) ?
              $signed((~&(7'h44))) : (~reg45[(1'h0):(1'h0)]))) ?
          ($signed(reg25) ?
              ((8'hb0) ?
                  wire6 : $unsigned($unsigned(reg42))) : $unsigned($signed((reg30 ?
                  wire37 : (8'hb4))))) : (^~reg18));
      reg49 <= (wire10[(1'h0):(1'h0)] < (~^reg31));
      reg50 <= reg15[(2'h3):(1'h0)];
    end
  assign wire51 = $signed($signed(reg19[(2'h2):(1'h1)]));
  assign wire52 = ((-(~&(wire6 ?
                      $signed(reg15) : wire38[(4'h9):(2'h3)]))) < (^{$unsigned($signed(wire13))}));
  always
    @(posedge clk) begin
      reg53 <= (($signed($signed($unsigned(reg46))) ?
              $signed({(reg49 <<< reg25),
                  $unsigned(reg26)}) : reg24[(3'h7):(3'h7)]) ?
          reg42 : (reg25[(4'h8):(1'h0)] ?
              (reg50 ?
                  ($unsigned(reg46) ~^ reg29[(1'h0):(1'h0)]) : $signed($unsigned(reg31))) : $signed((-reg22))));
      reg54 <= reg47;
      reg55 <= ((+$signed($signed($signed(wire14)))) ?
          reg42[(2'h2):(1'h0)] : (-($signed($unsigned(wire8)) ^ (reg16 <<< (reg24 ^~ reg32)))));
      reg56 <= $unsigned($unsigned($unsigned(({reg46, wire51} ?
          wire9 : wire8))));
      reg57 <= reg41;
    end
endmodule
