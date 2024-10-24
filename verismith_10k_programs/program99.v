module top
#(parameter param207 = ({((((8'h9d) ? (8'h9f) : (8'ha2)) ? (~|(7'h44)) : ((8'h9f) ~^ (8'ha3))) ? ({(8'hbe)} ? (+(7'h44)) : (+(8'hb0))) : (+(+(8'hb8))))} && ({(((8'hb2) | (8'ha0)) ? ((8'ha2) ? (8'hae) : (8'hb2)) : ((8'hbd) >= (8'ha5))), {((7'h44) ? (8'hbc) : (8'ha9))}} || ((((8'ha1) ? (8'ha0) : (8'ha3)) << ((8'ha3) ? (8'haa) : (7'h40))) ~^ (+((8'hb7) ? (8'hba) : (8'hba)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire204;
  assign y = {wire206, wire50, wire5, wire4, wire52, wire204, (1'h0)};
  assign wire4 = (($unsigned(wire1) ?
                     (~&wire3[(2'h2):(1'h0)]) : (~((8'hae) ?
                         wire3 : wire0[(1'h1):(1'h0)]))) > {{wire3[(4'hf):(3'h5)]}});
  assign wire5 = {({wire3[(4'he):(3'h7)]} ?
                         $signed((wire1 ?
                             wire2 : $signed(wire3))) : ({wire0[(2'h3):(1'h1)],
                             (!wire2)} <= wire3))};
  module6 #() modinst51 (wire50, clk, wire1, wire3, wire5, wire2, wire0);
  assign wire52 = (^$signed(((-(wire4 ? wire50 : wire50)) ?
                      wire4[(5'h12):(4'hf)] : $unsigned({(8'ha7), wire50}))));
  module53 #() modinst205 (.wire55(wire5), .clk(clk), .wire58(wire2), .wire57(wire0), .wire56(wire3), .y(wire204), .wire54(wire1));
  assign wire206 = wire50;
endmodule

module module53
#(parameter param203 = ((~^{(((8'hb9) < (7'h42)) ^ (~^(8'ha8)))}) ~^ (~(-({(8'hb5), (8'hb2)} ? ((7'h41) ? (8'ha2) : (8'h9f)) : (~^(8'hb1)))))))
(y, clk, wire54, wire55, wire56, wire57, wire58);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire54;
  input wire signed [(5'h12):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(5'h11):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire202;
  wire [(5'h15):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire143;
  wire signed [(3'h7):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire156;
  wire signed [(5'h13):(1'h0)] wire198;
  reg signed [(5'h13):(1'h0)] reg201 = (1'h0);
  reg [(2'h3):(1'h0)] reg200 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  assign y = {wire202,
                 wire141,
                 wire59,
                 wire83,
                 wire85,
                 wire86,
                 wire110,
                 wire143,
                 wire144,
                 wire145,
                 wire146,
                 wire147,
                 wire156,
                 wire198,
                 reg201,
                 reg200,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 (1'h0)};
  assign wire59 = $signed($unsigned(wire57));
  module60 #() modinst84 (wire83, clk, wire58, wire55, wire57, wire54);
  assign wire85 = wire56[(4'ha):(4'ha)];
  assign wire86 = $signed($signed((^((wire56 ? wire83 : wire58) ?
                      (wire54 ? wire59 : wire57) : wire58[(3'h7):(1'h1)]))));
  module87 #() modinst111 (wire110, clk, wire54, wire85, wire57, wire56, wire59);
  module112 #() modinst142 (.y(wire141), .wire114(wire83), .wire113(wire55), .wire116(wire59), .clk(clk), .wire117(wire58), .wire115(wire86));
  assign wire143 = (~^({(^$signed(wire56)), wire54} << (-(wire56 ?
                       wire56 : $signed(wire58)))));
  assign wire144 = ($signed((|({wire143,
                       (8'hbd)} < (wire57 ^ wire55)))) + (({wire54[(4'hf):(3'h7)]} ~^ $unsigned($signed(wire59))) ?
                       (8'hae) : (8'ha9)));
  assign wire145 = wire59[(4'h9):(4'h8)];
  assign wire146 = $unsigned((8'h9e));
  assign wire147 = $unsigned(($signed($signed(wire110)) ?
                       ((~&{wire54, wire57}) ?
                           wire144 : (wire59[(2'h2):(1'h0)] ?
                               ((8'hb9) ?
                                   wire146 : wire144) : wire86)) : ((^wire83[(4'he):(1'h1)]) ?
                           $unsigned(wire146[(3'h4):(1'h1)]) : $unsigned($signed(wire55)))));
  always
    @(posedge clk) begin
      if ((wire55[(1'h0):(1'h0)] * (^$signed((!wire86)))))
        begin
          reg148 <= {(~&$signed($unsigned((|wire144)))),
              {wire85[(4'he):(4'h8)]}};
          if ((~&(+wire59[(5'h15):(5'h15)])))
            begin
              reg149 <= (+$signed(($unsigned(wire110[(1'h1):(1'h0)]) ?
                  wire110 : ({(8'h9c), wire86} ?
                      (wire141 ? reg148 : wire54) : $signed(reg148)))));
              reg150 <= (~|$unsigned($unsigned($unsigned((wire141 + wire57)))));
            end
          else
            begin
              reg149 <= reg148[(3'h4):(1'h1)];
              reg150 <= $signed(wire55[(3'h4):(2'h2)]);
              reg151 <= wire147[(4'ha):(4'ha)];
              reg152 <= $unsigned($unsigned($signed($unsigned({wire86}))));
            end
          reg153 <= (~^$signed(((wire58[(4'hb):(1'h0)] ~^ $unsigned(wire59)) * reg148[(1'h0):(1'h0)])));
        end
      else
        begin
          reg148 <= {{(8'h9e)}};
          reg149 <= wire58[(2'h2):(1'h1)];
          reg150 <= $unsigned(((wire56 <<< {wire147}) ?
              wire85[(3'h6):(2'h2)] : $unsigned(reg152[(3'h7):(3'h7)])));
          if (($unsigned($unsigned((reg153[(3'h5):(3'h5)] * {wire143}))) ?
              {{({wire110, wire59} ? $signed(wire86) : wire54),
                      (8'hbe)}} : $signed(reg148)))
            begin
              reg151 <= (~(^(&(^~((8'hb0) != wire85)))));
              reg152 <= ((8'hb6) ? $unsigned(reg153) : wire145[(4'he):(4'h9)]);
              reg153 <= $unsigned(reg149[(4'h8):(4'h8)]);
            end
          else
            begin
              reg151 <= wire55[(2'h2):(1'h0)];
              reg152 <= (+reg150[(1'h1):(1'h1)]);
              reg153 <= (8'ha2);
              reg154 <= $unsigned(wire141);
            end
        end
      reg155 <= (~|(7'h42));
    end
  assign wire156 = {wire141[(3'h5):(3'h5)], $signed(wire83)};
  module157 #() modinst199 (.wire159(wire145), .y(wire198), .wire158(wire141), .wire160(reg155), .clk(clk), .wire161(wire147));
  always
    @(posedge clk) begin
      reg200 <= $unsigned({(+$signed(wire58)),
          ((~&wire156[(2'h2):(2'h2)]) ?
              wire143[(3'h4):(1'h1)] : wire55[(4'h8):(3'h7)])});
      reg201 <= ((reg154 == $unsigned((-(wire85 ? wire156 : (7'h40))))) ?
          $signed(wire156) : wire141[(5'h10):(5'h10)]);
    end
  assign wire202 = (8'hb2);
endmodule

module module6
#(parameter param49 = ({(~|(^~(+(8'hbb))))} ? (((&((8'hbc) ? (8'ha0) : (8'hac))) == (((8'ha8) ? (8'ha7) : (8'ha9)) ? (&(8'ha3)) : ((8'hb8) ? (8'hb0) : (8'hb9)))) ? (!(((8'ha0) ? (8'hb7) : (8'haf)) ? ((8'hbb) ? (8'ha6) : (7'h43)) : ((8'h9f) - (8'hb1)))) : (+((-(8'ha0)) ? (&(8'hb7)) : ((7'h41) <<< (8'hb4))))) : (&({(~^(8'hb8))} - (~(~&(8'had)))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  assign y = {wire48,
                 wire33,
                 wire32,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
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
                 (1'h0)};
  assign wire12 = wire7;
  assign wire13 = (wire10[(3'h7):(2'h2)] ? wire10 : (8'hb7));
  assign wire14 = $unsigned($signed(wire11[(4'h8):(4'h8)]));
  assign wire15 = $unsigned((&(wire11[(4'he):(3'h6)] ?
                      {((8'hbf) <= wire13)} : (wire9[(1'h0):(1'h0)] ?
                          (wire11 ^~ wire11) : (wire13 ? (8'h9f) : wire11)))));
  assign wire16 = ((+$unsigned({((8'hbf) ~^ (8'hb4))})) ?
                      (&(~&(^~{wire8}))) : wire12[(4'hf):(4'hf)]);
  always
    @(posedge clk) begin
      reg17 <= $unsigned($signed($unsigned(((wire15 ? wire8 : wire13) ?
          (wire9 ? wire15 : (8'haf)) : (wire16 ? wire11 : wire13)))));
      reg18 <= {(wire9 ?
              (wire15 ?
                  (wire9 > ((8'h9e) ? wire8 : wire16)) : ((wire13 ?
                          wire12 : (7'h42)) ?
                      $signed(wire11) : (-(8'ha0)))) : (wire15 >>> (-((8'ha1) ?
                  wire9 : wire10))))};
      reg19 <= ((^{($unsigned(wire9) ? (~^wire13) : (wire13 << (8'hab)))}) ?
          wire8[(2'h3):(2'h2)] : $signed(((~(-wire14)) ^~ $signed((^wire7)))));
      if (({(^reg17)} ?
          $unsigned((-($unsigned(wire14) ~^ (wire12 >>> wire15)))) : (-(^$signed(wire15)))))
        begin
          if (($unsigned(({(8'ha4)} && (8'hba))) ^~ wire12[(3'h7):(2'h3)]))
            begin
              reg20 <= $unsigned((+wire15));
              reg21 <= reg17;
              reg22 <= {wire13[(3'h7):(2'h2)]};
              reg23 <= {reg19[(2'h2):(1'h0)], wire13};
              reg24 <= ($signed($unsigned(wire13[(3'h7):(3'h5)])) ?
                  (^({{reg22}} < wire7[(2'h3):(2'h3)])) : (wire13[(3'h6):(3'h6)] == (+{(reg22 - reg22),
                      (reg19 ? reg21 : wire9)})));
            end
          else
            begin
              reg20 <= $signed((~wire12));
              reg21 <= $unsigned(wire7[(4'h8):(3'h6)]);
              reg22 <= {reg17};
            end
          reg25 <= (wire7 * reg17[(3'h4):(2'h2)]);
          reg26 <= reg22;
          if (($signed(wire9[(2'h2):(2'h2)]) ?
              $signed((|(~|reg18[(4'hc):(3'h6)]))) : ((+({reg23} || (~wire15))) ?
                  {reg24, wire15} : ($unsigned((reg23 < wire9)) ?
                      $unsigned((wire8 <= reg18)) : $unsigned(reg26[(3'h5):(2'h3)])))))
            begin
              reg27 <= (~&(&(($signed(wire15) ? (~^wire9) : (|wire15)) ?
                  reg22 : $signed(wire16))));
            end
          else
            begin
              reg27 <= ((($signed(reg20[(3'h5):(3'h5)]) ?
                          $unsigned($signed(wire9)) : reg22[(3'h6):(2'h3)]) ?
                      ($unsigned($unsigned(wire12)) & ({reg19} | reg25[(2'h3):(2'h3)])) : {((~&(8'had)) + reg19[(4'he):(1'h1)]),
                          ($unsigned(wire10) < (reg21 < (8'hbd)))}) ?
                  $signed($unsigned(reg18)) : ((+(wire10[(1'h0):(1'h0)] | $unsigned(wire13))) - (~|(!((8'ha7) > reg27)))));
              reg28 <= ((($unsigned((reg21 ? reg18 : (8'ha0))) ?
                      $unsigned((8'ha8)) : $signed($unsigned(wire15))) ?
                  {{$unsigned(wire13),
                          (wire16 ^ reg18)}} : $signed(wire12[(5'h11):(3'h7)])) >= ((8'hbc) & (8'hbb)));
              reg29 <= (&((8'ha2) | (reg23[(2'h3):(1'h0)] < wire8[(1'h0):(1'h0)])));
              reg30 <= reg20;
              reg31 <= ({$signed({reg24})} != $unsigned(((reg26[(3'h4):(2'h3)] ~^ ((8'hb9) - reg22)) && ($unsigned(reg25) < reg25))));
            end
        end
      else
        begin
          reg20 <= ($signed((^$signed((wire13 ?
              reg18 : wire8)))) <= (|(((|reg20) ? (~&reg23) : reg22) ?
              $signed((~^wire9)) : (&((8'hb3) | wire14)))));
          if ((reg25[(3'h7):(2'h2)] ?
              ($unsigned(wire10[(3'h6):(1'h1)]) ?
                  (!reg25) : {wire11[(1'h1):(1'h1)]}) : wire13[(1'h0):(1'h0)]))
            begin
              reg21 <= (!reg23[(3'h7):(3'h6)]);
              reg22 <= (((($unsigned(reg23) | (8'hb3)) > ((reg17 - reg21) == ((8'ha9) ?
                      reg27 : wire7))) ?
                  $unsigned(wire12) : reg26) <<< (~^reg17[(4'h8):(3'h7)]));
              reg23 <= $unsigned(reg17[(3'h6):(3'h6)]);
              reg24 <= {$unsigned(wire15[(1'h1):(1'h0)]), reg20[(3'h5):(3'h4)]};
            end
          else
            begin
              reg21 <= reg17;
            end
          reg25 <= $unsigned(($unsigned(((wire7 ? wire16 : (8'hb4)) ?
              $signed((8'hac)) : $unsigned(wire7))) || $signed({$unsigned(wire14),
              $unsigned(wire12)})));
          if ($signed((+wire9)))
            begin
              reg26 <= wire11[(4'ha):(4'ha)];
              reg27 <= wire16[(4'hd):(2'h3)];
              reg28 <= $unsigned(({$signed($signed(wire9))} ~^ $unsigned($unsigned($unsigned(reg18)))));
            end
          else
            begin
              reg26 <= $signed(($signed(((reg26 ?
                  reg22 : reg18) | reg23)) * (((reg27 == wire9) ?
                      (~^wire7) : {wire7}) ?
                  reg28 : (&$unsigned(wire16)))));
            end
          reg29 <= {$signed((+($signed(reg24) <= (^~reg26))))};
        end
    end
  assign wire32 = (^(wire16 || (+((~|wire16) > reg25[(1'h0):(1'h0)]))));
  assign wire33 = ($signed($signed(reg28)) ?
                      reg18[(4'h8):(3'h4)] : ((wire15[(2'h3):(1'h1)] ?
                              reg21[(3'h5):(1'h1)] : {$unsigned(reg21),
                                  (reg30 & wire32)}) ?
                          (($unsigned(wire7) ?
                                  $signed(reg24) : $unsigned(wire32)) ?
                              wire15 : reg27) : $unsigned($signed((~&wire10)))));
  always
    @(posedge clk) begin
      reg34 <= (8'hba);
    end
  always
    @(posedge clk) begin
      reg35 <= $signed((reg26 ?
          (^$unsigned((reg27 ? wire32 : wire32))) : reg34[(3'h7):(2'h2)]));
      if (($signed((~&(reg27[(3'h4):(2'h2)] <<< (wire13 == reg26)))) | reg25[(3'h7):(1'h0)]))
        begin
          reg36 <= $unsigned(((!($signed(reg27) >> reg17[(3'h7):(1'h0)])) ?
              (!{reg17[(3'h5):(1'h1)]}) : reg26));
          reg37 <= (reg28 && (wire16[(3'h5):(1'h0)] ^ $signed({$unsigned(reg20)})));
          if ($signed($signed((^~({wire7, wire13} <<< (reg19 | (8'ha1)))))))
            begin
              reg38 <= (^~(|($signed($unsigned(reg19)) >>> (~&reg26[(2'h2):(2'h2)]))));
              reg39 <= ({$unsigned(reg29[(2'h3):(2'h2)]),
                  ($unsigned((-reg19)) ?
                      $unsigned($unsigned(wire11)) : (-$unsigned(reg38)))} ^ (($unsigned({wire11}) > ((reg31 >> reg36) << {reg22})) ?
                  reg38[(4'ha):(3'h7)] : reg27[(5'h13):(3'h7)]));
              reg40 <= (($unsigned($unsigned(reg20[(1'h0):(1'h0)])) > (~^((reg39 ?
                      reg26 : reg27) ?
                  $signed((8'hab)) : {wire14,
                      reg25}))) == (|wire11[(3'h4):(1'h0)]));
            end
          else
            begin
              reg38 <= (8'hb1);
            end
          if (reg35[(3'h7):(3'h4)])
            begin
              reg41 <= $unsigned((($signed((wire33 >= reg37)) >> (|(reg21 ?
                      reg34 : wire12))) ?
                  ($unsigned((reg24 ? wire32 : reg25)) ?
                      wire14 : reg39) : (({wire11} >> reg18[(4'hd):(4'h9)]) ?
                      $signed((wire10 & reg17)) : reg37)));
              reg42 <= (8'hb0);
              reg43 <= (-((wire32 ?
                  (reg24 >>> (-reg38)) : $unsigned((wire33 ?
                      wire15 : reg35))) + $unsigned((~|(wire33 || wire32)))));
              reg44 <= {{reg37},
                  $unsigned($signed(($unsigned(reg38) << reg22[(2'h3):(1'h1)])))};
            end
          else
            begin
              reg41 <= (+$unsigned((!$unsigned(((8'ha8) >> reg19)))));
              reg42 <= ($signed(reg44) >>> {((^(reg18 ^ reg18)) ?
                      $signed(reg24) : reg29[(4'hd):(3'h5)]),
                  $unsigned((~|{wire13}))});
            end
          reg45 <= (reg18 >> (($unsigned((wire8 && reg28)) ?
              reg26[(1'h1):(1'h0)] : (~^(reg29 > reg25))) & $signed($unsigned(reg29[(3'h6):(2'h2)]))));
        end
      else
        begin
          reg36 <= $unsigned((reg22 ?
              $unsigned($signed($unsigned(reg39))) : (($unsigned(reg39) ?
                      reg36[(1'h1):(1'h0)] : reg37[(1'h1):(1'h1)]) ?
                  reg25[(3'h5):(1'h1)] : ({reg30} != (^~reg36)))));
        end
      reg46 <= {(^~(+$unsigned((^~reg41)))),
          ($signed({(~&reg21)}) ?
              ($unsigned((reg22 <<< (8'haf))) < (8'hb1)) : (-((wire13 ?
                      wire13 : reg44) ?
                  $unsigned(wire14) : (wire7 ? reg28 : reg35))))};
      reg47 <= (wire7[(3'h4):(1'h1)] ?
          (reg20 ? (8'hbe) : {reg43}) : reg37[(3'h6):(3'h6)]);
    end
  assign wire48 = $unsigned(reg47);
endmodule

module module157
#(parameter param197 = (~|((8'h9d) ? (+(~{(8'hb6), (8'hbf)})) : (&(((8'hb2) ? (8'hb0) : (8'ha3)) ? {(8'ha3), (8'haa)} : (~|(8'haa)))))))
(y, clk, wire161, wire160, wire159, wire158);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire161;
  input wire [(5'h11):(1'h0)] wire160;
  input wire [(5'h11):(1'h0)] wire159;
  input wire [(5'h15):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire196;
  wire [(5'h14):(1'h0)] wire195;
  wire [(3'h7):(1'h0)] wire194;
  wire signed [(5'h13):(1'h0)] wire193;
  wire [(5'h11):(1'h0)] wire188;
  wire [(5'h10):(1'h0)] wire187;
  wire [(4'ha):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire163;
  wire [(4'hb):(1'h0)] wire162;
  reg [(5'h13):(1'h0)] reg192 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg [(5'h15):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg [(4'he):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg signed [(4'he):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire188,
                 wire187,
                 wire178,
                 wire177,
                 wire163,
                 wire162,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  assign wire162 = (($signed($signed({wire159, (8'hb6)})) ?
                       $unsigned(((wire158 ? wire158 : wire159) ?
                           $unsigned((8'hae)) : (wire159 ?
                               wire158 : wire158))) : {{(wire159 ?
                                   wire161 : wire161)},
                           wire160}) ^ ({($unsigned(wire161) ?
                               (~|wire160) : (8'hb8)),
                           wire161[(3'h4):(1'h0)]} ?
                       (~({wire160} ^ (wire160 ?
                           (8'hbc) : wire161))) : wire159));
  assign wire163 = ((8'ha8) <= wire159);
  always
    @(posedge clk) begin
      reg164 <= (((|{$signed(wire163), (|wire158)}) << wire158[(4'he):(1'h0)]) ?
          wire162[(3'h4):(2'h2)] : ((^~(+wire161[(2'h2):(1'h1)])) ?
              wire161[(1'h1):(1'h1)] : wire163));
      reg165 <= $unsigned(((wire162 ? (~{wire160}) : wire159) ?
          $unsigned(wire160) : (~&$unsigned((wire158 ? (8'hae) : wire163)))));
      reg166 <= $unsigned((+(|($signed(wire162) ?
          wire161[(2'h3):(2'h3)] : $unsigned((8'hae))))));
      if (((&(8'hbf)) >>> {$unsigned(wire160[(2'h3):(1'h1)]),
          ($signed($signed(wire162)) ^~ {(reg165 ? wire159 : wire162),
              $signed(wire161)})}))
        begin
          if (wire158[(1'h0):(1'h0)])
            begin
              reg167 <= reg165[(4'hf):(4'h9)];
              reg168 <= (reg166 ?
                  {$unsigned($signed(wire162[(4'h8):(1'h1)]))} : reg166);
              reg169 <= $unsigned(reg164[(2'h2):(2'h2)]);
            end
          else
            begin
              reg167 <= (~|(~&reg166[(1'h1):(1'h0)]));
              reg168 <= $signed(reg167);
              reg169 <= (((((wire161 >>> wire160) >>> (reg164 ?
                          reg167 : reg168)) | (^(8'hb6))) ?
                      ($unsigned(reg164[(1'h1):(1'h0)]) ?
                          $signed(wire162) : (wire158 <<< reg167[(2'h2):(1'h1)])) : (|$signed($unsigned(wire159)))) ?
                  reg165 : (8'h9e));
              reg170 <= ((~^reg169[(4'hc):(1'h1)]) ?
                  $signed(wire158) : $signed(reg165[(4'ha):(3'h4)]));
              reg171 <= (-($signed((8'hb7)) ?
                  {{$signed(wire161), wire158},
                      wire159} : wire159[(3'h4):(2'h3)]));
            end
          reg172 <= reg170;
          reg173 <= reg168;
          reg174 <= {reg165[(1'h1):(1'h1)]};
          reg175 <= $unsigned({(reg164 || {wire158[(4'h9):(2'h2)]}), wire160});
        end
      else
        begin
          reg167 <= wire161;
          if ({reg171[(4'hb):(4'hb)]})
            begin
              reg168 <= (~|(($signed($unsigned(wire159)) ?
                  $unsigned($unsigned(reg168)) : (7'h41)) << (|$unsigned(reg173))));
              reg169 <= reg169[(4'h8):(3'h7)];
              reg170 <= (-(&reg172));
              reg171 <= (reg166 ?
                  reg169[(4'hb):(4'h8)] : $signed(((|$signed(wire158)) != (8'hbb))));
            end
          else
            begin
              reg168 <= reg169[(1'h0):(1'h0)];
              reg169 <= (&{$signed(($unsigned(reg174) < $unsigned((7'h40)))),
                  reg174[(2'h3):(2'h2)]});
            end
          reg172 <= $unsigned({reg169, reg168[(3'h6):(3'h4)]});
        end
      reg176 <= {$signed($unsigned($signed(wire159)))};
    end
  assign wire177 = (7'h44);
  assign wire178 = (^((|wire161[(4'h8):(3'h5)]) * wire163));
  always
    @(posedge clk) begin
      reg179 <= $signed(wire159);
      if ($signed($signed(reg164)))
        begin
          reg180 <= {reg172[(1'h1):(1'h0)], wire159[(4'ha):(3'h7)]};
          reg181 <= $unsigned(((reg166[(1'h1):(1'h0)] ?
              wire177[(4'h8):(2'h3)] : ((wire162 * reg168) & (^(8'hbe)))) | reg164[(3'h4):(3'h4)]));
        end
      else
        begin
          if ($signed($signed(($unsigned($unsigned(reg171)) > $signed($unsigned(reg170))))))
            begin
              reg180 <= ((~|reg181[(2'h3):(1'h0)]) > (^~(~|(~(|wire178)))));
              reg181 <= reg170[(1'h0):(1'h0)];
              reg182 <= {reg180};
              reg183 <= wire160[(3'h6):(2'h2)];
              reg184 <= $unsigned(($signed(reg164[(2'h3):(2'h2)]) * (~(reg170 ?
                  (wire163 ? reg166 : reg166) : reg180))));
            end
          else
            begin
              reg180 <= ($signed((8'hb6)) < wire158[(4'ha):(2'h3)]);
              reg181 <= {(-((~&reg181) ?
                      ((reg166 ? reg181 : (8'hbb)) ?
                          wire178[(1'h1):(1'h1)] : wire159[(2'h3):(2'h2)]) : ($signed(wire159) ?
                          $signed(reg184) : reg179))),
                  $signed(((~&$signed(reg170)) ?
                      (~^$signed(reg179)) : wire162))};
              reg182 <= {wire163};
              reg183 <= (^reg171);
            end
          reg185 <= {(wire158[(1'h0):(1'h0)] ?
                  (reg176 ^ reg164[(2'h3):(2'h3)]) : reg166[(2'h2):(1'h0)]),
              ((~^reg172) ?
                  (wire160[(4'hb):(4'ha)] ?
                      (~&((8'hba) | reg175)) : (~&reg183)) : (!($unsigned(reg181) ^ (~reg183))))};
        end
      reg186 <= reg176;
    end
  assign wire187 = {(^~reg166[(1'h0):(1'h0)]),
                       {(reg181[(2'h3):(1'h0)] <<< $signed($signed(reg165))),
                           wire158}};
  assign wire188 = wire163;
  always
    @(posedge clk) begin
      reg189 <= (((^~($signed(reg186) ?
          $unsigned(wire187) : (wire163 & wire160))) - wire178[(3'h6):(1'h0)]) || (+reg174[(1'h0):(1'h0)]));
      reg190 <= $signed($signed(reg167));
      reg191 <= $unsigned(((reg189 ? reg190[(3'h7):(2'h3)] : reg179) ?
          {$unsigned({(8'hb2)})} : $unsigned($signed((~&(8'hab))))));
      reg192 <= reg169[(1'h0):(1'h0)];
    end
  assign wire193 = reg179[(2'h3):(1'h1)];
  assign wire194 = reg165[(4'hd):(4'hc)];
  assign wire195 = ({reg181[(2'h3):(1'h0)]} ?
                       wire187[(2'h3):(1'h0)] : {(~|$signed({reg182}))});
  assign wire196 = wire195;
endmodule

module module112  (y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire117;
  input wire signed [(4'ha):(1'h0)] wire116;
  input wire signed [(5'h15):(1'h0)] wire115;
  input wire signed [(4'he):(1'h0)] wire114;
  input wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire [(5'h13):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire signed [(4'hd):(1'h0)] wire119;
  wire signed [(3'h4):(1'h0)] wire118;
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire130,
                 wire129,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg132,
                 reg131,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire118 = $unsigned(({wire114[(2'h2):(2'h2)]} ?
                       (wire116 ?
                           wire117[(2'h3):(2'h3)] : $signed(wire115[(1'h1):(1'h1)])) : $signed(($unsigned((8'ha8)) <<< wire113[(3'h4):(2'h3)]))));
  assign wire119 = (wire116[(3'h6):(3'h4)] ?
                       $signed(wire113) : (wire114[(1'h1):(1'h1)] ?
                           wire114 : $unsigned($signed((wire118 * wire117)))));
  assign wire120 = (&$signed((^$signed((^wire114)))));
  assign wire121 = $unsigned(wire116[(3'h7):(3'h4)]);
  assign wire122 = $signed($signed((~$unsigned((wire115 ?
                       (8'hb0) : wire117)))));
  assign wire123 = $unsigned(wire113[(3'h4):(2'h2)]);
  assign wire124 = $unsigned(wire120[(1'h0):(1'h0)]);
  assign wire125 = wire119[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg126 <= ($unsigned($unsigned(wire113[(2'h3):(1'h0)])) << $signed((-$unsigned(wire121))));
      reg127 <= $unsigned($unsigned((|wire122[(3'h5):(1'h0)])));
      reg128 <= (reg126[(1'h0):(1'h0)] ?
          $unsigned(wire125) : {(8'ha2), (&$signed({(8'hbd), wire115}))});
    end
  assign wire129 = (8'h9d);
  assign wire130 = $signed($unsigned({((|wire121) ? (8'hb0) : $signed(wire114)),
                       (8'ha1)}));
  always
    @(posedge clk) begin
      reg131 <= ((wire130[(3'h6):(2'h2)] ?
          wire123 : wire116[(2'h3):(2'h3)]) <<< $unsigned(($unsigned(((8'hb1) | wire116)) <= ($unsigned(reg127) ?
          (~wire122) : (wire129 > wire123)))));
      reg132 <= (+$unsigned(wire129));
    end
  assign wire133 = $signed(wire130);
  assign wire134 = (~&reg127[(3'h5):(1'h1)]);
  assign wire135 = ($signed((($unsigned(wire134) ?
                       (wire123 | reg131) : (reg131 ?
                           reg128 : reg131)) - $signed($unsigned(reg132)))) >>> $unsigned(wire116[(2'h2):(1'h1)]));
  assign wire136 = (reg128[(4'hd):(2'h2)] ^ ((~|$unsigned({wire117})) & $signed($signed({reg126}))));
  assign wire137 = ($unsigned(wire118[(1'h0):(1'h0)]) ^ $signed($unsigned(wire118)));
  assign wire138 = {wire114[(2'h3):(2'h2)]};
  assign wire139 = $unsigned($signed(wire122[(2'h2):(1'h1)]));
  assign wire140 = $signed(reg128[(4'hd):(3'h7)]);
endmodule

module module87
#(parameter param108 = (({(&((7'h41) ^ (7'h43))), (~|((8'hb2) <= (8'hbb)))} ? {(((8'hb4) ? (7'h42) : (7'h41)) ? {(8'hab)} : ((8'ha2) ? (8'h9c) : (8'hba))), (~&{(7'h44)})} : {{(!(8'hae)), ((8'ha8) ? (8'ha2) : (8'h9f))}, ({(8'ha4)} <= ((7'h44) ? (8'hac) : (8'hae)))}) ^ (((((8'hb7) << (8'had)) ? ((8'h9c) ? (8'hac) : (8'ha0)) : ((7'h41) ? (7'h41) : (8'hae))) ? (~^((8'hb5) || (8'hbc))) : (((8'hbf) ? (8'hbd) : (8'hac)) ? (!(8'hbf)) : ((8'hb7) >> (8'haa)))) ? ({(~^(7'h44))} && (!((8'ha1) >= (8'hb8)))) : ((8'ha2) != ((|(8'hbc)) ? ((8'ha8) && (8'ha6)) : ((8'h9d) ? (8'ha9) : (8'hb3)))))), 
parameter param109 = ((8'hb5) ? (((~(param108 == param108)) ? (~^(param108 - param108)) : {(param108 ? param108 : param108), (param108 << param108)}) >>> {param108}) : (((8'ha4) - {(|param108), (~^param108)}) ? (~^(((8'h9d) ? param108 : param108) ? (+param108) : (param108 ? param108 : param108))) : param108)))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire92;
  input wire [(5'h13):(1'h0)] wire91;
  input wire [(5'h11):(1'h0)] wire90;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire signed [(5'h15):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire [(5'h10):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 (1'h0)};
  assign wire93 = (&wire91[(4'hb):(3'h4)]);
  assign wire94 = $signed(wire93);
  assign wire95 = (~(&((wire90[(3'h4):(2'h2)] ?
                      wire93[(4'h8):(3'h5)] : (^wire94)) | wire94[(3'h7):(3'h6)])));
  assign wire96 = $signed(wire90);
  assign wire97 = (~($unsigned($unsigned($unsigned((8'ha4)))) | (wire90[(3'h5):(1'h1)] ~^ $signed((|wire90)))));
  assign wire98 = $signed(wire92[(1'h0):(1'h0)]);
  assign wire99 = $unsigned($unsigned(wire90));
  assign wire100 = wire91;
  assign wire101 = $signed($signed(wire99));
  assign wire102 = ((((~(-wire96)) || ($unsigned((8'h9e)) >= (wire101 >> wire95))) ?
                           $unsigned(((wire89 ^~ wire91) ?
                               wire90[(1'h1):(1'h1)] : $signed(wire91))) : wire93) ?
                       {$unsigned($unsigned({wire99, wire99}))} : wire95);
  assign wire103 = (wire91 ^ $signed($signed($signed($signed((8'hb3))))));
  assign wire104 = wire93[(1'h1):(1'h0)];
  assign wire105 = {{$signed($signed((|wire101))),
                           $signed(wire100[(4'hd):(2'h2)])},
                       $signed(wire90[(4'hf):(4'he)])};
  assign wire106 = $unsigned({wire94[(2'h3):(1'h0)],
                       {{(8'hb0)},
                           (((8'hbd) ? wire105 : wire90) >= (wire88 ?
                               wire99 : wire94))}});
  assign wire107 = (-wire98[(4'h9):(3'h6)]);
endmodule

module module60
#(parameter param82 = (~^(({(~|(8'hb5))} ? {(+(8'ha9)), ((8'ha3) ? (8'hb2) : (8'hb5))} : (8'ha2)) && ((+((8'h9d) ? (8'had) : (8'ha8))) ? {(8'hb5)} : (|((8'hb6) ? (8'ha7) : (8'hb5)))))))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire64;
  input wire [(5'h11):(1'h0)] wire63;
  input wire signed [(3'h6):(1'h0)] wire62;
  input wire signed [(5'h14):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  assign y = {wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg80,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg65 <= wire63;
      if ((wire64[(2'h2):(2'h2)] ?
          wire63 : ($unsigned($signed($signed((8'ha6)))) ?
              $signed(wire61[(4'hc):(4'ha)]) : (!$unsigned((wire62 ?
                  reg65 : wire63))))))
        begin
          reg66 <= ({reg65, reg65} != $signed($signed(wire64[(2'h3):(2'h2)])));
          reg67 <= reg66[(3'h6):(3'h5)];
        end
      else
        begin
          reg66 <= reg66;
          if (wire64)
            begin
              reg67 <= $unsigned($unsigned($unsigned($signed((wire62 ?
                  wire64 : wire62)))));
              reg68 <= (({reg66[(1'h0):(1'h0)]} ?
                      ({(reg67 ?
                              (8'hb3) : wire61)} && $unsigned($unsigned(reg67))) : (((-(8'hbb)) > reg66) < reg65)) ?
                  $signed({reg66, $signed($signed(wire62))}) : $signed((wire61 ?
                      {$signed(wire64)} : $unsigned((reg67 ?
                          wire62 : wire61)))));
              reg69 <= wire63;
              reg70 <= $unsigned(wire64[(4'he):(2'h2)]);
              reg71 <= $unsigned(wire63[(4'hb):(3'h6)]);
            end
          else
            begin
              reg67 <= ($unsigned({(reg67[(1'h1):(1'h0)] ^~ $signed(wire64)),
                      wire62[(3'h4):(3'h4)]}) ?
                  $unsigned((reg68 - $unsigned({reg67}))) : (~reg68[(3'h5):(2'h2)]));
            end
          reg72 <= $unsigned(reg66);
          reg73 <= wire63[(4'ha):(2'h3)];
        end
    end
  assign wire74 = {$signed({$signed($signed(wire64))}), reg68[(3'h5):(2'h3)]};
  assign wire75 = $signed(reg67[(1'h0):(1'h0)]);
  assign wire76 = (wire64[(4'hc):(3'h6)] ?
                      (reg71 ?
                          reg67[(2'h2):(2'h2)] : $signed({(reg65 ?
                                  (8'ha1) : reg67)})) : wire75[(4'h8):(1'h1)]);
  assign wire77 = reg73;
  assign wire78 = {(($signed((wire61 ?
                          (8'hb4) : wire63)) | {wire76[(3'h7):(1'h0)]}) < ($unsigned((|wire64)) ^~ ($signed(wire62) - (!(8'hae))))),
                      (!(((~|reg70) ?
                          (wire62 ?
                              reg66 : wire76) : (reg67 - reg65)) == $signed($signed(reg65))))};
  assign wire79 = (~reg71);
  always
    @(posedge clk) begin
      reg80 <= $signed(wire62[(1'h0):(1'h0)]);
    end
  assign wire81 = wire77[(1'h0):(1'h0)];
endmodule
