module top
#(parameter param116 = (8'haa))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire99;
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  assign y = {wire115,
                 wire102,
                 wire101,
                 wire5,
                 wire99,
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
                 (1'h0)};
  assign wire5 = $unsigned(wire2[(4'hd):(1'h1)]);
  module6 #() modinst100 (.wire11(wire5), .wire7(wire4), .wire9(wire0), .wire8(wire1), .wire10(wire2), .clk(clk), .y(wire99));
  assign wire101 = $unsigned(((-($unsigned(wire99) >= wire1[(5'h13):(5'h12)])) ?
                       (((wire1 ? wire3 : wire1) ?
                               $unsigned(wire99) : $unsigned(wire5)) ?
                           (~&wire3[(1'h0):(1'h0)]) : (wire2 ?
                               $unsigned(wire1) : $signed(wire2))) : wire99));
  assign wire102 = (((+(&(~(7'h43)))) ?
                       (wire99 < $signed((~&wire5))) : (wire2[(3'h6):(1'h1)] ?
                           ((wire99 + wire101) >> (wire1 <<< wire99)) : $unsigned($signed(wire3)))) >= ($unsigned(wire4[(3'h6):(3'h6)]) >> $signed((-(+wire99)))));
  always
    @(posedge clk) begin
      reg103 <= wire2;
      if (wire3)
        begin
          if ({wire0,
              {$unsigned($signed($signed(reg103))),
                  (|$unsigned((wire4 ? (8'ha2) : wire1)))}})
            begin
              reg104 <= wire3;
              reg105 <= wire3;
              reg106 <= (~^wire0[(5'h10):(4'h9)]);
              reg107 <= ((-$signed(wire2[(4'h8):(1'h0)])) & (~|$signed((8'ha8))));
            end
          else
            begin
              reg104 <= $signed(reg105[(4'hc):(1'h0)]);
              reg105 <= wire102;
              reg106 <= (((!$signed((8'ha0))) <<< wire0[(4'he):(2'h2)]) ?
                  ((reg105[(3'h6):(3'h5)] ?
                          wire3[(1'h0):(1'h0)] : $unsigned($unsigned((8'ha2)))) ?
                      (-(wire1 ?
                          wire2[(1'h1):(1'h1)] : reg106[(2'h3):(1'h1)])) : $unsigned(reg107[(2'h3):(2'h2)])) : (~&((reg105 || $signed(wire3)) ?
                      (!(8'ha2)) : (8'ha3))));
            end
          reg108 <= (~^$unsigned($signed($signed((reg106 ?
              reg107 : (7'h43))))));
          if ($signed(reg107[(1'h1):(1'h0)]))
            begin
              reg109 <= wire1;
              reg110 <= wire101;
              reg111 <= ((|(wire2[(3'h7):(2'h2)] ?
                  wire0[(4'he):(4'hd)] : (~|(wire101 ?
                      (8'haf) : (8'haf))))) + $signed(reg110));
              reg112 <= $unsigned((|$signed(({(8'ha4)} ^ (wire101 ?
                  wire5 : wire0)))));
              reg113 <= {($unsigned(reg112) ?
                      $signed(((^~reg107) ?
                          wire3[(3'h7):(1'h1)] : (reg110 != reg106))) : (^~(reg109[(3'h4):(1'h0)] ?
                          $unsigned(reg111) : $unsigned(wire4)))),
                  {(8'hb7),
                      (^~((wire102 ? reg105 : wire3) >= ((8'hb4) ?
                          reg110 : (8'hbb))))}};
            end
          else
            begin
              reg109 <= (^{{((reg113 ? wire4 : wire0) || $unsigned((8'hbf))),
                      reg109[(4'h8):(3'h6)]}});
              reg110 <= ((reg103 ?
                  $signed($unsigned($unsigned(reg104))) : (~wire4)) | {(-$signed((+wire1)))});
            end
          reg114 <= reg108[(1'h0):(1'h0)];
        end
      else
        begin
          reg104 <= {((reg112 - ($unsigned(wire2) >= (reg106 ?
                      reg103 : wire4))) ?
                  $signed(reg106) : (wire2 ?
                      ($unsigned(wire4) ?
                          {reg108} : (reg103 ^~ wire99)) : $signed((reg105 ?
                          wire5 : reg103))))};
          reg105 <= {{(^~($unsigned(reg106) < wire0)),
                  {$signed({(8'h9f)}), $unsigned(reg104)}},
              $signed(({(^wire3)} ? reg110[(2'h3):(1'h1)] : (!(~^wire99))))};
          if ($unsigned(((((~^wire5) * (8'ha4)) ?
              reg107 : wire2) || (^$signed(wire5)))))
            begin
              reg106 <= reg108[(1'h1):(1'h0)];
              reg107 <= wire0[(4'hd):(2'h3)];
              reg108 <= (($signed((-$signed(wire5))) ?
                      ((wire2[(4'ha):(3'h7)] ? wire5 : $unsigned(wire102)) ?
                          wire1[(4'hf):(2'h3)] : $signed((-reg111))) : reg110[(3'h4):(2'h2)]) ?
                  $unsigned((7'h42)) : wire102);
            end
          else
            begin
              reg106 <= wire1;
              reg107 <= reg106;
            end
          reg109 <= ($signed((8'h9c)) > $signed(($unsigned($unsigned(wire102)) ?
              $unsigned(reg107) : $unsigned((wire2 ? reg104 : (8'hbc))))));
        end
    end
  assign wire115 = ($signed(wire4[(1'h0):(1'h0)]) >>> reg109[(3'h7):(3'h6)]);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire81;
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire84,
                 wire83,
                 wire37,
                 wire25,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire39,
                 wire40,
                 wire81,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire12 = wire11;
  assign wire13 = $signed($signed($unsigned($unsigned(wire9))));
  assign wire14 = ((($signed((wire10 ? wire12 : wire8)) ?
                          (&(wire13 | (8'hab))) : (~|(7'h42))) > {wire7}) ?
                      wire11 : $signed($unsigned(($signed(wire7) * (wire9 < wire9)))));
  assign wire15 = $unsigned({$signed(($signed(wire7) - ((7'h42) + (8'hab))))});
  always
    @(posedge clk) begin
      if ($signed((wire9[(4'hd):(3'h6)] >> $signed($unsigned({wire9, wire7})))))
        begin
          if (wire10[(4'h9):(2'h2)])
            begin
              reg16 <= wire10;
            end
          else
            begin
              reg16 <= wire14[(4'ha):(1'h1)];
              reg17 <= $signed((8'ha4));
              reg18 <= wire8[(5'h11):(1'h0)];
              reg19 <= wire11[(3'h6):(2'h2)];
            end
          if (reg17[(3'h7):(1'h1)])
            begin
              reg20 <= wire13;
              reg21 <= wire14[(4'hc):(2'h3)];
            end
          else
            begin
              reg20 <= $unsigned(($unsigned({$signed(reg16), (+wire15)}) ?
                  ((wire11[(2'h3):(2'h3)] == wire12) ?
                      reg20[(5'h10):(3'h4)] : reg21[(1'h1):(1'h1)]) : (~^reg19[(4'hd):(3'h7)])));
              reg21 <= wire10;
              reg22 <= $signed($unsigned(($unsigned((+wire13)) || ((wire15 & reg19) ?
                  $unsigned(reg17) : (reg20 ? wire11 : wire9)))));
              reg23 <= wire14[(4'h9):(4'h9)];
            end
        end
      else
        begin
          reg16 <= reg18;
        end
      reg24 <= ({$signed({reg19[(4'h8):(3'h4)],
              (wire15 ? reg20 : wire15)})} ^~ ($signed(reg17) ?
          (wire10[(2'h2):(1'h0)] ?
              (wire7 ?
                  wire11 : reg17[(2'h3):(2'h2)]) : {reg21}) : $signed(wire11)));
    end
  assign wire25 = ((($unsigned(reg24[(3'h7):(3'h4)]) >>> $unsigned(wire14)) ?
                      {{wire8[(3'h6):(2'h3)], (reg19 ? (8'hbe) : reg19)},
                          reg20} : (wire11[(1'h0):(1'h0)] ?
                          $unsigned((reg23 ? wire9 : (7'h41))) : (~(reg16 ?
                              reg23 : wire10)))) <= ($unsigned((wire14 ?
                          (|reg22) : reg19)) ?
                      reg17[(3'h7):(1'h0)] : ($signed(wire7) << wire12[(3'h7):(2'h3)])));
  module26 #() modinst38 (.wire29(reg17), .wire28(wire8), .wire30(reg18), .clk(clk), .y(wire37), .wire27(reg19));
  assign wire39 = (|$unsigned((reg17 ?
                      ((reg24 * reg19) > (&reg21)) : (^$unsigned((8'hb3))))));
  assign wire40 = (reg17[(1'h0):(1'h0)] ^~ wire8);
  always
    @(posedge clk) begin
      reg41 <= (((~&($signed(wire8) | (wire40 >> reg19))) ?
              (~^$unsigned(wire12)) : $unsigned($unsigned($unsigned(reg19)))) ?
          $unsigned((({wire8, wire11} ?
                  reg17[(1'h0):(1'h0)] : wire11[(4'h8):(2'h2)]) ?
              reg20[(4'hd):(4'h9)] : $signed($unsigned(reg16)))) : reg19);
      if ($signed($signed((wire25[(5'h10):(3'h7)] << wire15))))
        begin
          if ($unsigned((reg16[(4'h9):(4'h8)] ? wire7 : $signed(wire15))))
            begin
              reg42 <= reg20[(4'hc):(4'hc)];
            end
          else
            begin
              reg42 <= (({(|((8'hb7) | reg22)), (!$signed(reg20))} ?
                      ($unsigned($unsigned(wire10)) && wire13) : $signed(((reg19 || reg17) ?
                          reg21 : {wire13}))) ?
                  (wire37[(2'h3):(2'h2)] ?
                      {(reg41 == (reg23 ? reg24 : reg42)),
                          wire37} : reg17[(2'h2):(1'h0)]) : reg18[(1'h0):(1'h0)]);
              reg43 <= reg23;
              reg44 <= (-(reg16 > ($signed($signed(wire14)) ^~ ((wire40 == reg22) ?
                  wire10 : wire14))));
            end
          if ((($signed(reg18) == ((reg18 <= $unsigned(wire14)) ?
              (~|(~|reg16)) : $unsigned((|wire12)))) <<< wire39[(2'h2):(1'h0)]))
            begin
              reg45 <= $signed((((|(wire13 ~^ (8'ha7))) ?
                      {$signed(reg18), reg24} : {$unsigned(wire14)}) ?
                  wire9[(4'hc):(1'h1)] : $unsigned($unsigned($unsigned((8'h9e))))));
            end
          else
            begin
              reg45 <= (((({wire15, (7'h42)} + (~^reg43)) ?
                      wire12[(1'h1):(1'h0)] : {(reg44 < wire9),
                          (~^reg22)}) - $signed(((wire37 ^~ (8'hae)) >>> $signed(reg21)))) ?
                  (wire15[(4'h8):(4'h8)] ?
                      wire15 : (reg18[(3'h5):(3'h4)] >> ($unsigned((8'hb4)) != (reg19 ?
                          wire13 : wire12)))) : (((wire39 ~^ (reg21 ?
                      reg17 : wire25)) != (~&$signed((8'hba)))) >> (|(reg16[(1'h1):(1'h1)] ?
                      (wire14 * wire13) : reg21))));
            end
        end
      else
        begin
          reg42 <= (&($signed($signed($signed((8'hb6)))) * $unsigned(((reg21 <= (8'ha8)) ?
              reg17[(2'h3):(1'h0)] : (reg22 ? wire14 : reg23)))));
          reg43 <= (&(({(reg41 ? reg21 : reg17),
                  reg18} >> (~&$unsigned(reg16))) ?
              (reg20 & wire7[(4'h8):(3'h7)]) : $signed((7'h44))));
          reg44 <= {(((~&{wire40, (8'ha3)}) ?
                  (~|$signed(wire10)) : ((&(8'hb1)) ?
                      $unsigned((8'ha4)) : (8'hb2))) ~^ (wire9 & {$unsigned(reg44),
                  (~(8'haa))})),
              $unsigned((wire40[(3'h4):(1'h0)] ?
                  (((8'hbb) ? (8'hb0) : wire25) ?
                      (8'hbc) : (8'ha9)) : $signed(wire13)))};
          reg45 <= (8'ha8);
        end
    end
  module46 #() modinst82 (.wire47(reg42), .wire51(reg21), .clk(clk), .wire48(wire39), .y(wire81), .wire50(wire11), .wire49(wire40));
  assign wire83 = (($unsigned($signed(reg17[(3'h5):(2'h3)])) <= reg44) ?
                      reg42 : ({(~(wire13 ?
                              (8'ha6) : reg24))} >= $unsigned(reg16)));
  assign wire84 = (((~$unsigned(wire39)) && ((reg21 ~^ wire11) ~^ ({wire83} ?
                          $unsigned((8'hbe)) : (+reg18)))) ?
                      $unsigned((|$signed($unsigned(wire83)))) : (reg41[(3'h4):(1'h0)] ^ reg22));
  always
    @(posedge clk) begin
      reg85 <= $signed(wire14);
      if (wire10)
        begin
          reg86 <= $unsigned(($signed($unsigned(wire84[(4'hf):(3'h7)])) || reg17));
          reg87 <= (wire10[(4'hf):(3'h4)] ?
              {(~^$signed((^reg23))), wire7} : reg85);
          reg88 <= $signed($unsigned($signed($unsigned((&(8'hb3))))));
          if ((((wire7 ?
                      {(wire81 ?
                              reg86 : (7'h42))} : $unsigned($unsigned(reg88))) ?
                  wire39[(4'hd):(1'h0)] : $signed((^~$unsigned(reg20)))) ?
              (8'haa) : (|($unsigned({reg20, wire12}) ? (&{(8'ha1)}) : wire9))))
            begin
              reg89 <= $signed((((^~wire39[(3'h4):(2'h3)]) < reg20[(3'h6):(2'h3)]) | {wire25[(5'h11):(1'h0)],
                  (wire11[(4'hc):(1'h1)] ? $signed(reg44) : reg19)}));
              reg90 <= wire39[(4'he):(3'h5)];
              reg91 <= $signed(((~|reg42) ?
                  $signed($unsigned(wire84)) : {$signed($unsigned((8'hba)))}));
              reg92 <= wire81;
              reg93 <= wire14[(3'h5):(1'h0)];
            end
          else
            begin
              reg89 <= ({{wire13[(3'h6):(2'h2)]}, wire83} ?
                  $unsigned($unsigned($unsigned((reg87 >= wire10)))) : wire7[(3'h7):(3'h7)]);
              reg90 <= reg89[(2'h3):(1'h0)];
              reg91 <= reg90;
              reg92 <= (&(8'h9d));
              reg93 <= reg88;
            end
          reg94 <= $signed((~wire12));
        end
      else
        begin
          reg86 <= reg22;
          reg87 <= (-($unsigned((8'ha0)) ?
              (((~^reg22) && wire39[(5'h13):(4'hd)]) ?
                  reg23[(3'h5):(1'h0)] : (&reg45)) : (^~$unsigned({(8'ha3)}))));
          reg88 <= wire83;
          reg89 <= ({$unsigned(((&wire11) ? wire40 : (!reg94))),
              ($signed(reg91) ?
                  reg94 : (+(reg42 ? wire13 : (8'hb7))))} ^ reg89);
          if ((+wire25))
            begin
              reg90 <= (((reg23 >= {$signed((8'ha3))}) != {($unsigned((8'hb5)) ~^ wire40)}) & (~^reg18[(4'he):(4'hb)]));
              reg91 <= $unsigned(wire14);
            end
          else
            begin
              reg90 <= (+($unsigned((reg87[(4'ha):(3'h6)] - {reg44,
                  (8'ha3)})) - (((reg17 ? wire12 : reg43) >> $signed(reg22)) ?
                  {$unsigned(wire10)} : reg44)));
              reg91 <= (($unsigned({(wire25 & reg21),
                      (wire37 & reg90)}) >>> ($signed((wire10 != (8'ha7))) ?
                      $signed({wire14, reg92}) : wire14[(4'hc):(3'h6)])) ?
                  wire9[(3'h7):(3'h7)] : $unsigned($signed((reg94[(3'h6):(2'h3)] + reg42))));
            end
        end
    end
  assign wire95 = {(|$signed($signed(wire9[(4'he):(2'h2)]))),
                      (((!wire7) | reg16) <= wire81[(4'he):(4'h8)])};
  assign wire96 = $signed($signed(reg18));
  assign wire97 = (~(~$signed($unsigned(((8'hbf) > wire13)))));
  assign wire98 = $signed($signed($unsigned((((8'haf) <= (7'h43)) <= ((7'h41) ?
                      reg20 : wire97)))));
endmodule

module module46
#(parameter param80 = ((~^((&(&(8'hb8))) ? (~&{(8'hbb), (8'ha6)}) : (((8'hbf) + (8'hb6)) ? {(8'h9f), (8'h9e)} : ((8'ha9) ? (7'h42) : (8'haf))))) ? ((({(8'hb9), (8'hae)} ? ((8'hab) ? (8'ha4) : (8'ha2)) : ((8'hab) ? (8'h9c) : (8'hb6))) ? (8'hb8) : ({(8'hb2), (8'ha1)} != {(8'haf)})) ? {((-(8'ha2)) ? (8'hb4) : (^(8'h9c)))} : {(&((8'hab) ^ (7'h40)))}) : ({{{(7'h41)}, (~|(8'ha9))}} <<< ((((8'hb3) - (8'hbc)) ? ((8'ha4) ? (7'h44) : (7'h43)) : ((8'ha0) * (7'h42))) << (~&((8'h9f) - (7'h43)))))))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire51;
  input wire signed [(3'h4):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire [(5'h15):(1'h0)] wire48;
  input wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire66,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire53,
                 wire52,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire52 = {(wire47 ?
                          (^~wire49) : (^~((wire51 ? (8'hb9) : wire47) ?
                              ((8'ha1) ?
                                  wire49 : wire48) : (wire48 == wire49)))),
                      $unsigned(wire49)};
  assign wire53 = (wire51 << wire52[(4'h8):(3'h4)]);
  always
    @(posedge clk) begin
      reg54 <= (wire52 || $signed(wire48));
      reg55 <= $signed(($unsigned(($signed(wire49) ?
          $signed(wire49) : (wire53 ? wire50 : reg54))) ~^ (&wire51)));
      reg56 <= (^~wire52);
      reg57 <= wire49;
    end
  assign wire58 = $unsigned(reg56[(2'h2):(2'h2)]);
  assign wire59 = (wire50 ? $signed(wire53) : wire58);
  assign wire60 = $signed({wire59, $signed(reg55)});
  assign wire61 = (&{(($unsigned(wire52) ?
                          wire59 : (wire53 + wire48)) <<< ({(8'h9d)} ?
                          $signed(reg56) : $unsigned(wire60)))});
  assign wire62 = (&(~|$signed($unsigned((~^(8'ha7))))));
  assign wire63 = wire53;
  always
    @(posedge clk) begin
      reg64 <= $signed(reg56[(3'h4):(1'h1)]);
      reg65 <= $unsigned($unsigned((^~$unsigned($unsigned((8'hb8))))));
    end
  assign wire66 = (wire51[(4'hd):(3'h7)] - (wire59[(1'h1):(1'h0)] >= ((^(~|wire63)) ?
                      $unsigned(reg56) : $signed((wire51 ? wire60 : wire61)))));
  always
    @(posedge clk) begin
      reg67 <= $signed((wire66 ^ $unsigned($signed($signed(wire48)))));
      reg68 <= $unsigned((~&$signed($unsigned((reg67 <<< wire58)))));
      reg69 <= $unsigned(wire53[(1'h0):(1'h0)]);
      reg70 <= reg54;
      if (($unsigned(reg69[(4'hd):(4'hb)]) ?
          $signed(wire59[(3'h4):(2'h2)]) : (wire59 < $signed((wire61[(4'hf):(4'h9)] ?
              {wire66, wire58} : $unsigned(wire62))))))
        begin
          reg71 <= $signed($unsigned((~&(wire50[(2'h3):(1'h1)] ?
              (wire59 * reg65) : wire60))));
          reg72 <= $signed($unsigned($signed(({(8'haf), reg57} + {reg69,
              reg55}))));
          reg73 <= {$unsigned(wire62)};
          reg74 <= $signed((wire60 ?
              (($signed(reg56) ?
                  wire66[(2'h2):(1'h1)] : (reg67 > wire51)) == reg72[(1'h0):(1'h0)]) : (wire61[(2'h3):(1'h1)] ?
                  (-(wire63 <<< (8'hb0))) : ((wire53 ? wire60 : wire47) ?
                      (+reg70) : reg56))));
          reg75 <= reg68[(2'h3):(2'h3)];
        end
      else
        begin
          reg71 <= ((&wire61) <<< (~|wire61));
          reg72 <= wire58;
        end
    end
  assign wire76 = ((wire66[(1'h0):(1'h0)] ?
                          $signed($unsigned((wire60 ?
                              reg69 : reg74))) : wire51) ?
                      reg73 : reg71);
  assign wire77 = $signed((reg73 * wire49));
  assign wire78 = reg74;
  assign wire79 = (7'h42);
endmodule

module module26
#(parameter param36 = {(({((8'hbd) ? (8'hb1) : (7'h42))} >> (8'hb6)) && {({(8'hbf), (8'ha7)} ^~ ((8'ha1) & (8'ha3)))}), {(^~(((7'h41) ? (8'hb1) : (8'ha3)) ? ((8'ha1) ? (8'ha1) : (8'hbf)) : ((8'ha9) < (8'hba))))}})
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  assign y = {wire35, wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = $unsigned(wire28[(4'hf):(4'he)]);
  assign wire32 = $signed({$unsigned((wire31[(2'h3):(1'h0)] ?
                          (~wire28) : wire28)),
                      ((wire30[(2'h3):(2'h2)] << (~|wire31)) != {(^~(8'hb1))})});
  assign wire33 = $signed(($unsigned(((&wire32) >>> wire31[(3'h6):(3'h5)])) ?
                      (~&((wire32 ? wire27 : wire31) ?
                          wire30[(3'h7):(3'h5)] : wire28)) : {wire28}));
  assign wire34 = wire31;
  assign wire35 = $unsigned((^~$unsigned(wire31[(4'h8):(1'h0)])));
endmodule
