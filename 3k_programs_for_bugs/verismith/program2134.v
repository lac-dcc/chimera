module top
#(parameter param87 = {{{(+{(8'ha5)}), {((8'hb4) & (8'h9f))}}, (({(8'hb0), (8'hbd)} ? (^(7'h44)) : (|(8'h9d))) - (((8'hb3) ? (8'haf) : (8'haa)) * ((8'ha0) ? (7'h44) : (8'hbf))))}}, 
parameter param88 = (param87 ? ((~param87) ? ((param87 - (param87 ? param87 : param87)) >> ((param87 ? (8'ha4) : param87) ^~ (param87 ? param87 : (8'ha9)))) : (^~{param87})) : (param87 ? param87 : (~|(~&(param87 ? param87 : param87))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire70,
                 wire63,
                 wire61,
                 wire6,
                 wire5,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire5 = wire4[(3'h6):(3'h5)];
  assign wire6 = $unsigned(wire1);
  module7 #() modinst62 (.wire8(wire3), .clk(clk), .y(wire61), .wire9(wire1), .wire11(wire2), .wire10(wire0));
  assign wire63 = $unsigned(wire2);
  always
    @(posedge clk) begin
      if (($signed(wire6[(2'h3):(1'h0)]) ?
          wire0[(3'h4):(3'h4)] : $signed($signed(wire5))))
        begin
          reg64 <= wire0;
          if ((~(+$unsigned(reg64[(2'h2):(1'h0)]))))
            begin
              reg65 <= $signed(wire1);
              reg66 <= (~|$unsigned(((wire3[(4'h8):(2'h3)] & wire3) ~^ wire1[(4'ha):(2'h3)])));
              reg67 <= (~&((~$signed(wire5)) == $signed((~((8'hb1) ^ reg64)))));
              reg68 <= wire5;
              reg69 <= reg68;
            end
          else
            begin
              reg65 <= $signed(((($unsigned(reg64) ?
                      wire1[(1'h1):(1'h1)] : $unsigned(wire1)) ?
                  {$signed(wire5),
                      wire1} : $signed(wire1[(2'h3):(1'h1)])) ~^ wire63));
              reg66 <= $unsigned(wire3[(5'h10):(3'h5)]);
              reg67 <= wire4[(1'h0):(1'h0)];
              reg68 <= ({(((wire4 - wire5) ?
                          reg68[(1'h0):(1'h0)] : reg67) + (^~(~reg66)))} ?
                  {($signed(reg69[(4'h8):(2'h2)]) | ((reg65 > (8'ha3)) <<< $signed((7'h40))))} : (reg66 ?
                      wire63 : $signed({{wire0, wire61}})));
            end
        end
      else
        begin
          reg64 <= wire63[(2'h2):(1'h0)];
          reg65 <= $unsigned(reg66[(3'h5):(1'h0)]);
        end
    end
  assign wire70 = (wire5 >>> {reg67,
                      (({(7'h43)} >> wire2[(5'h11):(4'h9)]) ?
                          $unsigned($signed(wire3)) : reg67[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      reg71 <= wire1[(4'ha):(4'h8)];
      reg72 <= $unsigned($signed(($signed($unsigned(wire1)) < reg69[(2'h2):(1'h0)])));
      if (wire70[(2'h2):(1'h0)])
        begin
          if (((wire61 <<< $signed(((~^wire5) ?
              (reg72 ?
                  wire6 : reg71) : wire70[(3'h5):(3'h4)]))) < wire70[(2'h2):(1'h1)]))
            begin
              reg73 <= ($signed($signed((-((8'h9c) ? wire1 : wire6)))) ?
                  $signed((($unsigned(reg72) ^ $unsigned((8'hb2))) ?
                      (wire6 == (reg72 >> (8'ha0))) : {$unsigned(reg65),
                          wire2})) : ((wire2[(5'h11):(3'h7)] ^~ ($signed((8'hb8)) ?
                          {reg65} : ((8'hae) ? (8'haf) : reg64))) ?
                      wire0 : (|(wire1[(3'h5):(1'h0)] ?
                          wire61 : $signed(wire6)))));
              reg74 <= ($signed(wire5[(2'h2):(1'h1)]) ?
                  wire0[(2'h3):(1'h0)] : wire4[(2'h2):(2'h2)]);
              reg75 <= reg69;
              reg76 <= (reg74 - (8'hb0));
              reg77 <= $signed(((wire2[(4'hf):(4'h9)] == (~^(reg74 ?
                  wire4 : reg65))) == {$unsigned(reg72)}));
            end
          else
            begin
              reg73 <= wire4;
            end
          reg78 <= (wire63[(1'h1):(1'h0)] << reg77);
          if ($signed($unsigned((|$signed((reg73 ? (8'hbe) : reg71))))))
            begin
              reg79 <= wire70;
              reg80 <= (reg72 >> wire2);
              reg81 <= (~&((~(wire6 * $unsigned(reg75))) ?
                  {wire1, $signed($signed(reg72))} : wire0[(1'h1):(1'h1)]));
            end
          else
            begin
              reg79 <= ($unsigned((reg74[(1'h0):(1'h0)] - ((^~(8'hb3)) == (~(8'hb2))))) ?
                  (reg75 ?
                      $signed((reg80 ?
                          (wire6 >> reg72) : {(7'h42)})) : (~|(8'h9e))) : wire1);
              reg80 <= ($signed((~&$unsigned(wire3[(4'h9):(3'h6)]))) ?
                  (~&(reg76 != (&$unsigned(reg67)))) : ((-reg76[(2'h3):(2'h2)]) <<< (^~$unsigned((reg79 << (8'hb7))))));
              reg81 <= ((-(~^$unsigned(wire1))) < ((reg77[(2'h3):(2'h2)] ?
                  $signed((reg73 == wire3)) : ((reg80 ?
                      reg78 : reg74) - ((8'haf) != (8'h9f)))) | $unsigned((reg75 ?
                  (^reg74) : (wire4 - reg71)))));
              reg82 <= (-wire70);
            end
          reg83 <= reg82[(1'h1):(1'h0)];
          reg84 <= $signed((($unsigned((wire3 ^ wire5)) ^ (reg71 ?
                  (-wire0) : reg73)) ?
              reg81[(2'h3):(1'h0)] : (reg73[(2'h2):(2'h2)] >= wire6[(2'h2):(2'h2)])));
        end
      else
        begin
          reg73 <= $signed((^reg80));
        end
    end
  assign wire85 = (-($unsigned(reg68[(3'h4):(3'h4)]) * ($unsigned(reg82) >> {(wire70 ?
                          wire2 : reg75),
                      (reg84 ? reg80 : reg79)})));
  assign wire86 = {(^~(($signed(wire6) & (reg79 + reg84)) ?
                          $unsigned($signed(reg80)) : $unsigned($unsigned(reg78))))};
endmodule

module module7
#(parameter param60 = ({(((&(8'hab)) >> ((8'hae) ? (8'h9c) : (8'ha2))) ? (^~((8'hb5) ? (8'ha3) : (8'hae))) : {(^~(8'hb0))}), ((((8'hbf) * (8'hac)) & ((8'h9f) ? (8'hb3) : (8'hb5))) != (~^{(8'haa), (8'hb7)}))} == (~&((((8'hb9) ? (7'h43) : (8'hbe)) >> ((8'hb1) | (8'ha5))) ? ((-(8'ha4)) ? ((8'had) ? (8'hb9) : (8'h9c)) : ((8'h9f) << (8'hbd))) : (((8'ha6) >= (8'ha7)) ? ((8'hbb) ~^ (8'hb9)) : ((8'ha4) ? (8'ha5) : (8'ha7)))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire38;
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire51,
                 wire49,
                 wire38,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  module12 #() modinst39 (.wire14(wire11), .wire15(wire10), .y(wire38), .wire16(wire8), .clk(clk), .wire13(wire9));
  module40 #() modinst50 (.wire41(wire11), .clk(clk), .y(wire49), .wire43(wire9), .wire42(wire10), .wire44(wire8));
  assign wire51 = $signed(wire49);
  always
    @(posedge clk) begin
      if (wire38[(3'h6):(1'h0)])
        begin
          if ((&{wire11, $signed(wire49[(4'hc):(3'h7)])}))
            begin
              reg52 <= $signed((+((-{wire51, wire9}) ? wire49 : {(!wire10)})));
            end
          else
            begin
              reg52 <= (!wire9[(3'h6):(3'h6)]);
            end
          if (wire49)
            begin
              reg53 <= $signed((wire49 != $signed(wire10)));
              reg54 <= $unsigned(wire8);
              reg55 <= (wire49[(4'h9):(1'h0)] ?
                  ($signed(wire8[(4'h8):(3'h7)]) * {wire8[(3'h4):(1'h0)],
                      wire49[(4'hb):(3'h6)]}) : $signed((((wire9 ?
                          wire8 : wire49) || $unsigned(wire10)) ?
                      ({wire9} ? {wire38} : wire8) : (8'ha2))));
            end
          else
            begin
              reg53 <= (~&($unsigned((~wire51)) * ((^~((7'h42) ?
                      reg55 : wire11)) ?
                  $unsigned((reg54 ? reg53 : wire38)) : ((wire8 ?
                      wire38 : wire38) || (8'ha6)))));
              reg54 <= (8'ha8);
              reg55 <= $signed(((~((wire11 ? reg55 : reg53) ?
                      {reg53} : (~^wire51))) ?
                  $signed((-(wire8 ? reg52 : reg55))) : $signed({(~^wire11),
                      (^~reg52)})));
              reg56 <= ({(wire9 == $unsigned(reg52[(5'h10):(4'h8)]))} ^~ $unsigned($signed($signed($signed(reg52)))));
            end
        end
      else
        begin
          reg52 <= $signed((~&$signed((&$unsigned(reg55)))));
        end
    end
  assign wire57 = $signed($signed((8'haa)));
  assign wire58 = wire49[(5'h12):(4'h9)];
  assign wire59 = (-(wire58 > $unsigned((~|(!wire49)))));
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  input wire [(2'h2):(1'h0)] wire42;
  input wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  assign y = {wire48, wire47, wire46, wire45, (1'h0)};
  assign wire45 = $unsigned((|wire43[(1'h0):(1'h0)]));
  assign wire46 = (^~$signed((~|((wire41 ?
                      wire42 : wire41) ~^ $signed(wire42)))));
  assign wire47 = (~(wire42 ?
                      wire43[(1'h1):(1'h1)] : $signed($unsigned((~^wire43)))));
  assign wire48 = wire46[(3'h5):(2'h3)];
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire23;
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  assign y = {wire31,
                 wire23,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire16[(4'he):(3'h7)])
        begin
          reg17 <= $unsigned(wire15[(4'h8):(4'h8)]);
          if ({$unsigned((8'haf))})
            begin
              reg18 <= (wire15[(1'h0):(1'h0)] && (+$unsigned((((8'hb2) * (8'ha6)) | (|wire14)))));
              reg19 <= reg18;
              reg20 <= reg18;
              reg21 <= (7'h41);
            end
          else
            begin
              reg18 <= reg21[(2'h2):(2'h2)];
              reg19 <= $signed({$unsigned(wire16)});
              reg20 <= {$signed({($unsigned(wire16) ?
                          $unsigned(reg20) : (~|reg19)),
                      reg19[(3'h4):(1'h1)]})};
            end
          reg22 <= ((^~(~^{(|wire13)})) ?
              $signed((((~^(8'hb4)) ^~ ((8'h9c) ? reg20 : reg21)) ?
                  reg17 : $signed((reg19 ?
                      reg18 : wire15)))) : (|wire13[(4'hc):(2'h3)]));
        end
      else
        begin
          reg17 <= $signed($unsigned(($unsigned((reg18 ?
              wire16 : (8'h9c))) - reg18[(4'hd):(4'hb)])));
          reg18 <= reg17[(1'h0):(1'h0)];
        end
    end
  assign wire23 = $signed((~|wire15));
  always
    @(posedge clk) begin
      reg24 <= $unsigned($unsigned((wire15 ?
          (|reg20) : ({wire13} >> {(8'hbc), reg18}))));
      if ($unsigned(reg17[(3'h5):(1'h0)]))
        begin
          if (wire13[(3'h7):(3'h4)])
            begin
              reg25 <= (((reg24[(3'h4):(1'h1)] >= {(wire16 ? reg20 : reg20)}) ?
                      reg21[(3'h6):(1'h1)] : reg19) ?
                  ({$signed(reg19),
                      ($signed(wire15) << reg20[(4'hc):(2'h2)])} <<< ($signed({reg20}) ^~ reg19[(3'h7):(1'h0)])) : {$signed(reg17[(2'h3):(2'h2)])});
            end
          else
            begin
              reg25 <= $signed($signed((($unsigned(wire16) && {wire15,
                  (8'ha3)}) || wire23)));
              reg26 <= (!wire15[(4'h8):(3'h5)]);
              reg27 <= (wire14 & reg20[(4'hc):(1'h0)]);
              reg28 <= ((!$unsigned($signed((~|(7'h43))))) > reg27[(1'h1):(1'h0)]);
              reg29 <= $signed(reg25[(3'h7):(1'h1)]);
            end
          reg30 <= $signed({reg26, (~reg21[(1'h1):(1'h1)])});
        end
      else
        begin
          reg25 <= ($unsigned(((reg19[(2'h2):(2'h2)] ?
                      reg20[(3'h7):(2'h3)] : $signed(reg24)) ?
                  $unsigned((reg29 <= reg20)) : $unsigned((reg20 ?
                      (8'hbb) : reg19)))) ?
              $unsigned((reg27[(3'h6):(3'h4)] >>> ((&(8'haf)) ?
                  (^~reg27) : $unsigned(reg19)))) : reg22[(3'h4):(1'h0)]);
          reg26 <= wire16[(2'h3):(1'h0)];
        end
    end
  assign wire31 = ((+$signed((|reg21[(2'h3):(1'h0)]))) <= reg26[(4'hd):(4'h9)]);
  always
    @(posedge clk) begin
      reg32 <= $unsigned((reg25[(2'h2):(2'h2)] >> reg25));
    end
  always
    @(posedge clk) begin
      reg33 <= (^((~^{(reg29 ^~ reg17), (wire31 + reg25)}) ^~ (8'haa)));
      reg34 <= $unsigned(((reg30[(4'h8):(3'h7)] ?
          $signed((reg29 ? wire15 : reg33)) : ((wire15 ? reg19 : reg18) ?
              (wire14 <= reg22) : (|reg26))) <= $signed($unsigned(reg24[(3'h7):(1'h0)]))));
      reg35 <= ((reg29 >= $signed((~^$unsigned(reg22)))) ?
          wire16[(1'h1):(1'h0)] : $signed({$signed((wire14 ? reg26 : reg29))}));
      reg36 <= (~(8'ha4));
      reg37 <= $unsigned(($unsigned(((reg34 == reg28) ?
          (reg18 ? reg18 : reg18) : $signed(reg32))) >>> (reg17 ?
          $signed($unsigned(wire14)) : ($signed((8'hbb)) ~^ $signed(wire31)))));
    end
endmodule
