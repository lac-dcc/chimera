module top
#(parameter param94 = ((~^((((8'hae) << (8'h9d)) <= (~(7'h41))) ? (((8'hb9) ? (8'h9f) : (8'hba)) == ((8'hab) && (8'hb4))) : ({(8'hbe)} * ((8'ha9) ? (8'hb2) : (8'hbc))))) ? ({(((7'h41) ^~ (8'hba)) && ((8'hb3) ? (8'h9c) : (8'hb7)))} >= ((^{(8'ha7), (7'h42)}) >>> {(~|(8'hae))})) : {{(|((8'had) ? (8'hb3) : (8'hbf))), ((+(8'h9c)) ? ((8'h9d) ? (8'ha6) : (7'h40)) : (7'h40))}}), 
parameter param95 = (~^(!{((param94 ? param94 : param94) + ((7'h40) ? param94 : param94))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h231):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire46;
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire63,
                 wire62,
                 wire4,
                 wire46,
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
                 reg65,
                 reg64,
                 reg61,
                 reg60,
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
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  module5 #() modinst47 (wire46, clk, wire1, wire4, wire2, wire3, wire0);
  always
    @(posedge clk) begin
      reg48 <= $signed($signed({$unsigned((wire0 > wire1)), $signed(wire4)}));
      if (wire46)
        begin
          if ((-(~wire4[(5'h10):(2'h2)])))
            begin
              reg49 <= ((({$unsigned((7'h41)),
                          (~&wire46)} ^ $unsigned($signed(wire2))) ?
                      (~wire46[(4'he):(4'h9)]) : (^~($unsigned((7'h44)) ?
                          $unsigned(wire1) : (reg48 ? (7'h41) : reg48)))) ?
                  ((wire2[(4'hd):(3'h4)] || $signed((~reg48))) ?
                      ($signed(wire46[(2'h2):(1'h1)]) == wire4[(4'hf):(2'h2)]) : $unsigned((~^wire1))) : $unsigned($unsigned({wire46})));
              reg50 <= $signed($unsigned(wire3[(3'h6):(2'h2)]));
              reg51 <= wire2;
              reg52 <= (^({{(~&reg49)},
                  (~{wire2})} & (reg48 != (!$signed((8'hb4))))));
            end
          else
            begin
              reg49 <= (~^$signed(reg50[(2'h3):(1'h1)]));
              reg50 <= wire2;
              reg51 <= ($unsigned((-wire1)) ? reg51 : reg49[(5'h11):(5'h10)]);
              reg52 <= reg48;
            end
        end
      else
        begin
          reg49 <= (~wire0[(4'hb):(1'h0)]);
          reg50 <= (wire1 ?
              (!((7'h42) ? (&(~|wire1)) : wire4)) : wire4[(3'h4):(3'h4)]);
        end
      reg53 <= (&(reg50 ? (~^$unsigned($signed(wire0))) : (~&(|(^~reg52)))));
      if ($signed(((~^reg50[(1'h1):(1'h1)]) + $unsigned((+(wire4 >= reg52))))))
        begin
          reg54 <= ((($signed($unsigned(wire2)) ?
              wire46[(4'hb):(2'h2)] : wire2[(3'h7):(1'h1)]) >> wire46) <<< (^(reg52[(1'h1):(1'h1)] >>> $signed((reg51 + reg51)))));
          if (wire4)
            begin
              reg55 <= (((wire2[(2'h3):(2'h3)] ?
                          (|wire2) : $signed((wire46 ? (8'hb3) : wire1))) ?
                      (~|reg52[(4'h8):(2'h2)]) : (-(8'ha9))) ?
                  $signed(wire46[(1'h0):(1'h0)]) : ($signed(reg53[(1'h0):(1'h0)]) ?
                      $unsigned($signed((reg52 ? wire3 : wire0))) : reg51));
              reg56 <= ({(!$signed(reg50[(1'h1):(1'h1)]))} * reg53);
              reg57 <= (reg52 ^ ($signed($unsigned($signed(wire0))) ?
                  reg52[(3'h4):(1'h0)] : {reg50[(3'h6):(2'h3)]}));
              reg58 <= wire2;
              reg59 <= ($unsigned($signed({{reg56},
                  {reg52}})) * wire2[(4'hd):(4'hd)]);
            end
          else
            begin
              reg55 <= reg51;
              reg56 <= ((~(~&($unsigned((8'hab)) ?
                  $signed(wire2) : ((8'ha9) ?
                      wire46 : reg54)))) <= ($signed($unsigned(wire1[(3'h7):(2'h2)])) ?
                  ($signed($signed(wire46)) ?
                      ((reg50 ? reg49 : reg56) | (reg51 ?
                          reg54 : reg52)) : (~|{wire2, reg49})) : reg56));
              reg57 <= reg51[(4'ha):(3'h4)];
              reg58 <= ($signed(reg59) ^~ $signed((!(8'haa))));
            end
          reg60 <= (wire0 >= (!(reg49[(2'h3):(2'h3)] ?
              $signed((^reg53)) : reg52[(4'ha):(1'h0)])));
          reg61 <= $signed($signed(reg59[(5'h11):(4'hd)]));
        end
      else
        begin
          if ((!$unsigned(reg56)))
            begin
              reg54 <= {wire0, (reg53 ? wire2[(4'h9):(3'h6)] : wire0)};
              reg55 <= ($unsigned($unsigned((~^((8'hb2) ?
                  (8'hb5) : reg49)))) * $signed($unsigned((~^$unsigned(reg49)))));
              reg56 <= reg54[(2'h2):(1'h0)];
              reg57 <= ((reg52 ^~ ($signed(reg60[(2'h3):(1'h1)]) ~^ (^~(8'hb9)))) ?
                  (wire1 ^ ($unsigned((^~reg56)) ?
                      $unsigned(reg54[(1'h0):(1'h0)]) : $signed({reg53,
                          wire3}))) : wire0[(4'he):(3'h5)]);
            end
          else
            begin
              reg54 <= $unsigned((~&wire2));
              reg55 <= $signed((wire46 ? reg61[(2'h2):(1'h1)] : {reg50}));
              reg56 <= reg59;
            end
          reg58 <= $signed($signed(reg57));
        end
    end
  assign wire62 = $signed((((reg54[(2'h2):(2'h2)] <<< (8'hbb)) ?
                      $unsigned((reg51 ? reg52 : reg51)) : (((8'ha7) ?
                          reg58 : (8'ha3)) >= (reg56 < reg60))) ~^ $unsigned(reg55[(4'hd):(1'h1)])));
  assign wire63 = $signed({(~$signed((wire3 ? reg61 : reg51))),
                      $signed($signed((&(8'ha3))))});
  always
    @(posedge clk) begin
      reg64 <= $unsigned(((~^(wire0[(2'h2):(2'h2)] >>> wire2[(4'h8):(4'h8)])) >= $unsigned($unsigned({reg50}))));
      reg65 <= $unsigned(reg56);
    end
  assign wire66 = reg51[(2'h3):(2'h2)];
  assign wire67 = $unsigned(($signed(reg50) && (8'h9d)));
  assign wire68 = $signed($signed($signed(({reg64} ?
                      ((8'hb7) - reg65) : (reg53 - wire2)))));
  assign wire69 = ((($unsigned(reg58[(1'h1):(1'h0)]) <<< (reg51 * ((8'hbe) * reg50))) << ($signed((!reg49)) <= ($signed((8'hb7)) ^ (~|reg55)))) < ({$unsigned((~^wire67)),
                      ((reg55 ? reg51 : wire3) ?
                          ((8'ha2) & wire67) : (reg48 <<< wire1))} + $signed(((~wire62) ?
                      $unsigned(wire3) : (~|reg48)))));
  always
    @(posedge clk) begin
      if ((-reg49))
        begin
          if (wire63)
            begin
              reg70 <= $unsigned((reg58 || wire69));
              reg71 <= (wire2[(2'h3):(2'h2)] ?
                  ((&reg61) ?
                      (~&$signed(reg57)) : (($unsigned(reg64) ?
                          reg61[(3'h4):(2'h2)] : (reg56 ~^ wire46)) && $signed((wire46 >= wire66)))) : ({reg57,
                          (wire0[(1'h1):(1'h1)] << (8'ha7))} ?
                      (wire2[(4'ha):(2'h2)] << {reg70, reg57}) : (((!(8'hbc)) ?
                          $signed(wire63) : $unsigned(reg57)) || (|wire62))));
            end
          else
            begin
              reg70 <= $signed((|$signed(reg59)));
              reg71 <= wire2[(2'h2):(1'h1)];
              reg72 <= ({reg48[(4'hd):(4'ha)],
                  wire69} & (reg57[(3'h5):(1'h0)] | reg59[(5'h13):(4'ha)]));
              reg73 <= $unsigned(($unsigned(((^reg65) >> wire46)) >> (&$unsigned((~reg64)))));
            end
          if (($signed(wire2) ?
              (~^(reg57 ~^ (-reg52))) : $unsigned($signed(((reg49 ?
                  reg65 : (7'h43)) - (+reg70))))))
            begin
              reg74 <= $signed((+((!{wire3,
                  (8'hab)}) * ((~&reg59) << $unsigned(reg71)))));
              reg75 <= reg55[(4'hb):(4'h8)];
            end
          else
            begin
              reg74 <= $unsigned(($unsigned(reg48[(5'h13):(5'h10)]) == (8'hbb)));
              reg75 <= reg70;
              reg76 <= (^$unsigned($signed((-{reg73, reg58}))));
              reg77 <= ((((8'hbf) || reg74[(2'h2):(1'h0)]) << $unsigned(((wire4 ?
                      wire66 : reg73) ?
                  reg65[(4'he):(3'h6)] : $signed((8'ha3))))) >= {($unsigned((wire0 ^ (8'hac))) ?
                      $signed($unsigned(reg51)) : (wire0 ?
                          (reg56 ? reg57 : reg58) : (reg53 ?
                              wire62 : reg71)))});
            end
          if (reg74)
            begin
              reg78 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg78 <= (&(reg64[(1'h0):(1'h0)] ?
                  reg59[(4'hc):(4'h9)] : {reg56[(5'h11):(4'hd)],
                      wire67[(3'h6):(2'h2)]}));
              reg79 <= reg78;
              reg80 <= ((~(~^((8'hb3) ^~ $signed(wire69)))) ?
                  (reg71[(4'h8):(3'h5)] ?
                      ((reg61 <= (^wire69)) > ((~wire66) >> (reg51 ?
                          reg49 : reg72))) : reg70[(3'h4):(1'h1)]) : reg64[(2'h3):(1'h1)]);
              reg81 <= ($unsigned((~&reg54)) ?
                  reg50[(3'h6):(3'h5)] : wire46[(1'h1):(1'h1)]);
            end
          if ((($unsigned({(+reg77), {wire63, wire69}}) < wire4) ?
              reg76 : ($unsigned((|(reg49 ? reg76 : reg77))) ?
                  (reg72[(3'h5):(2'h3)] ^ reg55[(4'he):(4'hb)]) : wire2)))
            begin
              reg82 <= reg72[(3'h5):(1'h1)];
              reg83 <= $unsigned(reg59);
              reg84 <= (-$signed(reg53[(1'h1):(1'h1)]));
              reg85 <= ((+$signed(reg78)) ?
                  $unsigned(reg84[(1'h0):(1'h0)]) : $unsigned((!reg48[(2'h3):(2'h2)])));
              reg86 <= (!reg77[(4'ha):(3'h6)]);
            end
          else
            begin
              reg82 <= reg54;
              reg83 <= reg80[(3'h6):(3'h5)];
            end
        end
      else
        begin
          reg70 <= {(~&(reg52[(2'h2):(1'h1)] << wire63[(4'h9):(1'h0)]))};
          reg71 <= reg48[(4'he):(1'h1)];
          reg72 <= wire62;
          reg73 <= $signed((($unsigned(reg84) ?
              (reg81 ^~ wire67) : ($unsigned(reg64) | $unsigned((8'hbb)))) ~^ ($unsigned((reg52 ?
                  reg84 : reg54)) ?
              $signed(reg82[(3'h7):(3'h6)]) : reg59[(4'hf):(3'h5)])));
        end
      reg87 <= $unsigned(($unsigned((|wire63[(4'h9):(4'h8)])) >>> ((8'hb7) ?
          ((!reg82) != wire1[(2'h2):(1'h0)]) : wire4[(3'h7):(3'h6)])));
      if (((|(~{(^wire3), (reg53 ? reg51 : reg84)})) ?
          wire2[(4'hd):(4'hc)] : $unsigned($unsigned({$unsigned(reg73)}))))
        begin
          reg88 <= $unsigned(((((~wire63) * reg84) != reg87) < (~^(~^(^~wire69)))));
        end
      else
        begin
          reg88 <= (8'hbf);
          reg89 <= ($signed($signed((&reg88[(1'h1):(1'h0)]))) ?
              $signed((-$signed($unsigned(reg59)))) : reg57);
        end
    end
  assign wire90 = $unsigned(((reg82 ?
                      reg70[(4'hb):(3'h5)] : (8'haa)) | ((&reg73[(4'hb):(1'h1)]) >> $signed((&reg87)))));
  assign wire91 = reg82[(1'h0):(1'h0)];
  assign wire92 = reg60[(2'h3):(1'h0)];
  assign wire93 = wire2;
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 (1'h0)};
  assign wire11 = (~^(wire8 + (({wire9, (8'hbf)} || wire10) ? wire9 : wire9)));
  assign wire12 = {$signed(((((8'hb9) ?
                          wire10 : wire8) >= $signed(wire10)) + (wire9[(4'ha):(2'h3)] ?
                          (wire9 ? wire7 : (8'haf)) : (wire9 ?
                              wire8 : wire8))))};
  assign wire13 = ((~(((~|wire11) | wire7) * (((8'h9e) ?
                      wire9 : wire9) ^~ $unsigned(wire6)))) ~^ $unsigned(wire11));
  assign wire14 = (^(!(~&(~|(~|(8'hab))))));
  assign wire15 = wire13;
  assign wire16 = wire15[(5'h13):(4'hc)];
  always
    @(posedge clk) begin
      reg17 <= wire13;
      if (wire16)
        begin
          reg18 <= $unsigned($unsigned(((~wire11) && ($signed(wire13) ^ wire12))));
          if ((^~wire7[(1'h0):(1'h0)]))
            begin
              reg19 <= ($signed($signed({wire16[(4'ha):(4'ha)],
                  ((7'h43) ? wire13 : wire11)})) || (^$unsigned((reg18 ?
                  {wire16, reg17} : wire11))));
            end
          else
            begin
              reg19 <= (wire10[(3'h5):(3'h5)] ?
                  wire13[(1'h0):(1'h0)] : $unsigned($unsigned(wire8[(4'hb):(1'h1)])));
              reg20 <= (((wire15 & ($unsigned(wire15) << (wire13 ?
                      (8'hba) : wire15))) ?
                  ((&$signed(wire15)) && wire12) : {((wire15 ? reg17 : wire12) ?
                          {wire8} : reg18[(3'h5):(1'h0)])}) >> wire6[(2'h3):(1'h0)]);
            end
          reg21 <= (^~reg19[(1'h0):(1'h0)]);
          reg22 <= reg20;
        end
      else
        begin
          reg18 <= ((wire7[(3'h4):(3'h4)] <<< (wire12 ?
                  ((|wire16) ?
                      (reg18 <<< (8'hbb)) : $unsigned(reg18)) : wire15[(5'h13):(4'ha)])) ?
              (^~($unsigned((reg20 ? wire7 : wire12)) ?
                  $unsigned((wire7 ^ reg17)) : ({wire14} ?
                      (reg17 > reg22) : (&reg22)))) : ($unsigned($unsigned((8'hb2))) ?
                  $unsigned($signed(wire15[(5'h12):(1'h0)])) : ($signed((wire16 ?
                      wire14 : reg19)) >> (+$unsigned((8'hb8))))));
          if ($unsigned($unsigned(reg20[(3'h5):(3'h4)])))
            begin
              reg19 <= reg17[(3'h7):(3'h7)];
              reg20 <= wire13[(3'h5):(1'h0)];
              reg21 <= $unsigned(wire12);
              reg22 <= $signed(((8'hab) ?
                  (($signed((8'hbc)) ?
                      (wire13 * (8'hbe)) : $signed(reg19)) <<< wire12) : wire12[(1'h1):(1'h0)]));
            end
          else
            begin
              reg19 <= wire7;
              reg20 <= wire13;
              reg21 <= {($unsigned((&$signed(wire7))) ?
                      (($signed((8'ha6)) ?
                          wire15 : $signed(wire15)) ^~ ($unsigned(reg19) ?
                          reg21 : reg21[(3'h5):(2'h2)])) : $unsigned($unsigned(wire16)))};
            end
          reg23 <= (($unsigned((reg22 ? (8'ha3) : $unsigned((8'hb6)))) ?
                  (8'haa) : ($signed(reg20) + {reg21[(3'h5):(2'h3)], wire11})) ?
              (reg22 <= {$signed($unsigned(reg22))}) : $unsigned($signed($signed((wire8 ?
                  wire14 : reg19)))));
          reg24 <= ($unsigned(({(-reg21)} ?
                  {$signed(wire13), (^reg18)} : (wire15 ? wire11 : wire13))) ?
              {reg17,
                  $signed(({reg21,
                      wire6} - reg17[(4'he):(4'ha)]))} : $signed($signed(reg21)));
          reg25 <= ($unsigned($unsigned((~^(reg20 ^~ reg22)))) > $signed((^(7'h43))));
        end
      if ((wire11 ? wire8 : (+wire16)))
        begin
          if ($signed($unsigned({($signed(reg24) * $signed(reg19)),
              (~$unsigned(reg25))})))
            begin
              reg26 <= (((^($unsigned(wire15) ? (~^wire9) : {(7'h42)})) ?
                  (!((!wire14) ?
                      (wire13 << reg20) : wire7)) : reg20[(3'h7):(3'h7)]) >> reg23[(3'h7):(3'h5)]);
              reg27 <= (~wire10[(3'h4):(1'h1)]);
              reg28 <= (~&$signed((~&$unsigned((wire13 ? wire6 : (7'h42))))));
            end
          else
            begin
              reg26 <= {reg20[(3'h4):(1'h0)]};
              reg27 <= $signed((~&wire12));
            end
          if (wire7)
            begin
              reg29 <= {{reg26}};
              reg30 <= $signed({$unsigned($signed($unsigned(wire8)))});
            end
          else
            begin
              reg29 <= (8'hb0);
              reg30 <= $signed((~&((wire13[(5'h10):(3'h5)] || $signed(wire7)) ?
                  $signed((~&wire6)) : $signed((!wire11)))));
            end
          if ((wire13 == reg17))
            begin
              reg31 <= (^~$unsigned(reg24[(4'hb):(4'h9)]));
              reg32 <= (reg30 ?
                  wire14[(2'h2):(1'h1)] : (~|$unsigned(($unsigned((8'had)) ?
                      (^~(8'hbf)) : $signed(wire8)))));
            end
          else
            begin
              reg31 <= (~&$unsigned(wire7[(2'h2):(2'h2)]));
              reg32 <= $unsigned($signed((|wire12[(3'h5):(1'h0)])));
            end
          reg33 <= (8'hb6);
        end
      else
        begin
          reg26 <= {wire8[(4'hd):(1'h1)]};
        end
      if (($signed($unsigned({(wire15 << wire8), (~^wire14)})) ?
          (~&wire15) : ((!$unsigned($signed(reg26))) << wire13)))
        begin
          reg34 <= (8'ha2);
          if ((((~^$signed($signed(reg32))) ?
                  $unsigned((-(reg22 ? reg22 : wire16))) : reg32) ?
              $unsigned(((((8'ha8) ? reg28 : reg26) ?
                      (|wire16) : $signed((8'h9e))) ?
                  ({(8'hb7)} ?
                      (reg27 && reg17) : (^~reg24)) : {{reg22}})) : (reg18 + {$unsigned({reg21}),
                  (8'hb5)})))
            begin
              reg35 <= $signed(reg19);
              reg36 <= (($signed(wire11[(2'h2):(1'h0)]) & wire7) ?
                  wire13 : (8'hb4));
            end
          else
            begin
              reg35 <= reg28;
            end
          reg37 <= {reg21,
              $signed(($signed((wire9 ?
                  (8'ha8) : reg25)) << ({(8'ha2)} <= wire11[(1'h1):(1'h1)])))};
        end
      else
        begin
          if (($unsigned({((wire9 ? reg20 : wire16) ?
                      (reg22 ? reg33 : (8'ha4)) : {reg35})}) ?
              (8'had) : $unsigned($unsigned({(~^reg26), $signed(reg22)}))))
            begin
              reg34 <= reg17[(4'hc):(1'h1)];
              reg35 <= (~($unsigned(reg37[(3'h6):(1'h0)]) ?
                  (~|reg20) : (($signed(reg29) <= (^~(8'h9d))) ?
                      wire10 : (^(~reg17)))));
            end
          else
            begin
              reg34 <= {reg19, {reg24[(2'h2):(2'h2)], reg23[(2'h3):(1'h1)]}};
              reg35 <= $unsigned($unsigned((((+reg22) ?
                      (~|(8'ha9)) : $signed(wire6)) ?
                  (8'hb6) : $unsigned({reg17}))));
              reg36 <= $unsigned((^~(($unsigned((8'ha6)) || (reg37 ?
                      wire9 : reg36)) ?
                  $signed($signed(reg34)) : (~^(reg24 <<< (8'haa))))));
              reg37 <= $unsigned(reg36);
              reg38 <= $unsigned(($unsigned(((^~reg26) ?
                  reg35[(4'hb):(4'h8)] : {(8'hb6)})) || wire10[(3'h5):(2'h2)]));
            end
          reg39 <= (~((~|$unsigned((reg32 | reg34))) ?
              (~&$signed($signed(reg29))) : $signed((reg27 == (~wire9)))));
          if ({{$signed(((reg21 ? wire7 : (8'hb2)) >>> ((8'hb4) ?
                      reg28 : wire7))),
                  wire16}})
            begin
              reg40 <= wire10[(4'h8):(3'h5)];
              reg41 <= (($signed({(reg30 <= reg21)}) ?
                      (((reg29 ~^ wire9) << $unsigned((8'hae))) < (~(reg21 ?
                          (8'hab) : wire8))) : ((7'h42) ?
                          ((reg22 >>> (8'ha0)) < $unsigned(reg39)) : (~^(wire11 ?
                              reg39 : wire7)))) ?
                  (|$unsigned((wire7[(1'h1):(1'h0)] >>> wire16))) : reg33[(4'ha):(2'h2)]);
            end
          else
            begin
              reg40 <= $unsigned((reg19[(1'h1):(1'h1)] ?
                  ($signed($signed((8'ha1))) ?
                      (8'ha5) : {wire12}) : $signed(((reg37 ?
                      wire6 : reg20) | (reg37 ? reg23 : reg38)))));
              reg41 <= $unsigned((((reg26[(2'h3):(2'h2)] ?
                      $signed(reg19) : {wire12}) ~^ $signed((reg29 >= reg41))) ?
                  {$unsigned({reg36, reg33})} : (~|(~^{reg38}))));
              reg42 <= reg18[(4'h8):(4'h8)];
              reg43 <= reg22;
            end
        end
    end
  assign wire44 = ((~reg27) <<< $signed($unsigned((reg34[(1'h1):(1'h0)] ?
                      (-reg35) : {wire7}))));
  assign wire45 = {(reg32[(3'h4):(2'h2)] + $signed({$signed((8'hac)),
                          (reg32 || reg26)}))};
endmodule
