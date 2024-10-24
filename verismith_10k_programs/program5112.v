module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire157;
  wire [(4'h8):(1'h0)] wire156;
  wire [(4'hb):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire signed [(5'h12):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire147;
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 (1'h0)};
  module4 #() modinst148 (.wire6(wire0), .wire8(wire1), .wire7(wire2), .y(wire147), .clk(clk), .wire5(wire3), .wire9((8'hbd)));
  assign wire149 = wire3;
  assign wire150 = $unsigned(((((~&wire3) * wire1[(4'h8):(3'h7)]) >> wire2[(4'ha):(4'h8)]) >> $unsigned($unsigned($unsigned(wire3)))));
  assign wire151 = $signed((~^{$signed((-wire147))}));
  assign wire152 = (~|$unsigned((((wire0 ~^ wire2) ?
                       (wire2 ?
                           wire150 : wire147) : (wire1 <<< wire151)) <= ($unsigned(wire3) ?
                       (wire3 >>> wire147) : wire0))));
  assign wire153 = $signed(wire150[(4'hb):(4'h8)]);
  assign wire154 = $unsigned(wire153);
  assign wire155 = {wire0[(5'h14):(4'h8)]};
  assign wire156 = $unsigned(wire153[(4'hf):(2'h2)]);
  assign wire157 = ((|$unsigned($unsigned(wire2[(3'h5):(1'h0)]))) - $signed($unsigned($unsigned({(8'ha1)}))));
endmodule

module module4
#(parameter param145 = (~|({((+(8'h9d)) * (^~(8'h9f))), {((8'ha6) >= (8'ha1))}} ? (({(8'ha4)} ? {(8'ha8)} : ((8'hb5) ? (8'haa) : (8'ha3))) >>> (-(~^(8'h9c)))) : ((8'ha3) ? (|((8'hb4) | (8'hb1))) : {((8'hb5) & (8'ha3)), ((8'ha8) >>> (8'h9f))}))), 
parameter param146 = (8'hb9))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h314):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire5;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire107;
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  assign y = {wire143,
                 wire129,
                 wire128,
                 wire123,
                 wire122,
                 wire109,
                 wire24,
                 wire64,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire89,
                 wire90,
                 wire107,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire7 ?
          (wire5[(2'h2):(1'h0)] & (~^((|wire7) ?
              $signed(wire8) : $unsigned((8'hac))))) : wire5))
        begin
          reg10 <= ($unsigned((^wire9[(4'he):(1'h0)])) <<< wire8);
          reg11 <= {wire9[(3'h7):(2'h2)],
              (wire7[(1'h1):(1'h1)] ?
                  $signed($signed(((8'hb8) ?
                      (8'haa) : wire9))) : (|($unsigned(wire5) > reg10)))};
          reg12 <= $signed($unsigned(wire7[(2'h2):(1'h0)]));
        end
      else
        begin
          reg10 <= ($signed((((reg12 ?
              (8'ha5) : (8'hb8)) | $signed((8'hba))) ^ (~^(!wire6)))) >>> {{wire8[(4'h9):(4'h9)]}});
          if ((!((((reg12 ?
                  reg11 : wire9) | ((8'ha0) || (8'hab))) & $unsigned($signed(reg12))) ?
              $signed({(wire8 ? reg10 : (7'h42)),
                  (wire8 * wire9)}) : $unsigned(((wire6 ? reg10 : (8'ha2)) ?
                  reg11[(1'h1):(1'h1)] : wire6[(1'h0):(1'h0)])))))
            begin
              reg11 <= (wire6 - $signed(((reg11 != (reg12 < wire9)) ?
                  $signed($signed(wire5)) : {{wire9},
                      (wire7 ? wire9 : wire8)})));
              reg12 <= $signed(($signed(reg11) ?
                  (($signed(wire8) * ((8'hb0) >= wire9)) ?
                      reg10[(4'h9):(3'h5)] : $unsigned(wire9)) : ($signed((8'h9d)) ?
                      $unsigned({wire9, wire7}) : $signed((&reg11)))));
              reg13 <= wire7[(1'h1):(1'h0)];
              reg14 <= {(reg10[(3'h5):(2'h2)] ?
                      (~(reg10 ?
                          reg12 : (reg12 ?
                              wire9 : reg10))) : wire7[(3'h6):(3'h5)]),
                  $signed(reg10)};
            end
          else
            begin
              reg11 <= (&$signed(wire6));
            end
          if (wire5[(3'h7):(3'h7)])
            begin
              reg15 <= $signed(reg14);
              reg16 <= ({((~(wire5 && wire7)) ?
                          $unsigned((reg12 != wire9)) : $unsigned((reg10 ^~ reg11))),
                      ($unsigned((8'ha7)) ?
                          (+(reg10 ? (8'hae) : reg10)) : (~&$signed(reg14)))} ?
                  ((reg13[(3'h6):(3'h5)] ?
                      {(^reg12),
                          (reg10 ?
                              reg14 : wire6)} : wire8[(2'h2):(2'h2)]) != (&(reg10 ~^ (reg15 ?
                      (7'h42) : wire8)))) : ($unsigned({reg11[(3'h5):(2'h2)],
                          reg15[(2'h2):(2'h2)]}) ?
                      (!($signed(reg10) ?
                          wire8[(3'h7):(3'h5)] : $unsigned((8'ha8)))) : ($signed($unsigned(wire7)) >= reg13[(3'h4):(1'h1)])));
              reg17 <= (8'hab);
            end
          else
            begin
              reg15 <= (reg15 - (~&$signed($signed($unsigned(reg13)))));
              reg16 <= wire9;
              reg17 <= ($unsigned(reg14[(2'h3):(2'h3)]) >> $unsigned((^$signed((reg11 <= wire5)))));
              reg18 <= $signed($signed(wire8));
              reg19 <= ($signed($signed((~$unsigned((8'haf))))) ?
                  wire8 : reg14);
            end
          reg20 <= (~$signed(reg17));
        end
      reg21 <= (+((((&reg17) ?
          (reg11 * wire6) : wire5[(3'h5):(3'h5)]) - {(wire5 && reg18),
          reg19}) != (((reg15 ? wire5 : wire6) != reg18) ?
          ((reg15 ? reg19 : reg14) < $unsigned(reg13)) : (reg18 ?
              wire8[(2'h3):(2'h2)] : $signed(wire8)))));
      reg22 <= (~^$unsigned($signed($signed((wire6 == reg12)))));
      reg23 <= ({$unsigned(((8'hb7) ?
              reg16[(1'h0):(1'h0)] : wire9[(5'h10):(4'hf)])),
          wire7} <<< reg20[(2'h3):(1'h0)]);
    end
  assign wire24 = (&reg19);
  module25 #() modinst65 (wire64, clk, reg21, reg12, reg23, reg16);
  assign wire66 = (+$unsigned($unsigned($signed((wire7 >>> wire24)))));
  assign wire67 = $signed($unsigned($unsigned((~$signed(reg21)))));
  assign wire68 = wire64;
  assign wire69 = reg13[(3'h6):(1'h0)];
  assign wire70 = ({(|$unsigned($signed(wire24)))} ?
                      (reg16[(2'h2):(2'h2)] || $signed($unsigned((reg11 ~^ reg19)))) : (((reg21[(1'h0):(1'h0)] || $unsigned(wire9)) ?
                          $signed($signed(wire9)) : ((reg16 * wire8) != $signed(wire24))) ^ (($signed(reg12) || (reg13 ?
                          reg15 : reg19)) + wire67[(1'h1):(1'h0)])));
  assign wire71 = (($signed(reg14[(4'h8):(4'h8)]) ?
                          $unsigned((reg16[(3'h5):(1'h0)] == (~reg20))) : $signed($unsigned((-(8'ha0))))) ?
                      $unsigned(wire66[(3'h6):(1'h1)]) : (({$unsigned((8'hbf)),
                              {wire69}} + $signed($signed(wire6))) ?
                          $signed($signed((+reg13))) : $signed({$unsigned((8'ha1)),
                              $signed(wire6)})));
  always
    @(posedge clk) begin
      if (((((&(wire70 ? wire7 : reg21)) ?
              ((wire66 >>> wire7) ?
                  reg12 : $signed(reg12)) : $unsigned(reg14)) + (|$signed(reg16))) ?
          ($signed(reg12[(3'h5):(3'h5)]) - reg16[(4'hb):(2'h3)]) : ((reg13[(1'h1):(1'h1)] ?
              $unsigned({reg12}) : (~^((8'hb7) > reg13))) | (reg19[(3'h7):(1'h1)] ?
              (~(+wire7)) : {$unsigned((8'hac))}))))
        begin
          if (($unsigned($signed(wire68[(1'h0):(1'h0)])) <= ($unsigned((8'hae)) + $signed(wire9[(5'h13):(3'h6)]))))
            begin
              reg72 <= $unsigned($unsigned($signed({((7'h41) - reg17)})));
              reg73 <= $signed({$signed((wire70[(2'h3):(1'h1)] ?
                      (~^wire68) : (&reg21)))});
              reg74 <= {(!$signed($unsigned($signed(wire9))))};
            end
          else
            begin
              reg72 <= {(reg72[(3'h5):(1'h0)] ?
                      (wire9[(5'h12):(4'hb)] ?
                          $signed((wire9 ?
                              reg14 : reg19)) : $unsigned(wire8)) : ($signed((~|(7'h41))) ?
                          ($signed((8'hb3)) + {wire67,
                              reg73}) : $signed(reg23[(4'hc):(3'h5)])))};
              reg73 <= ($unsigned((!(^~$unsigned(reg16)))) ?
                  reg15[(4'hc):(3'h5)] : ($signed((reg12 ?
                          (wire7 || (8'had)) : {reg14})) ?
                      reg74[(1'h0):(1'h0)] : {reg74[(3'h4):(2'h2)],
                          (-wire24[(3'h6):(2'h2)])}));
            end
          reg75 <= ((wire64 - reg23[(4'hc):(3'h6)]) ~^ wire7[(3'h6):(1'h1)]);
          reg76 <= {((~&reg10) <= reg22[(1'h1):(1'h1)])};
          reg77 <= (wire9 ?
              (wire9[(3'h5):(1'h1)] || (wire9 ?
                  {wire6} : $unsigned(reg73[(2'h3):(1'h0)]))) : wire68);
          reg78 <= ($signed((^{(wire8 ? (8'hae) : reg12)})) ?
              reg23[(4'hc):(4'ha)] : (~(wire66[(3'h5):(3'h4)] >>> reg72[(3'h5):(1'h0)])));
        end
      else
        begin
          if (wire64)
            begin
              reg72 <= $signed((~(wire71[(5'h11):(4'h8)] ?
                  (&$unsigned(reg77)) : (wire9[(4'ha):(2'h2)] + $unsigned(reg77)))));
              reg73 <= $unsigned($signed(wire7[(1'h0):(1'h0)]));
              reg74 <= {($unsigned($unsigned(reg17[(1'h0):(1'h0)])) ?
                      ($signed($unsigned(wire71)) ?
                          reg17[(3'h6):(2'h3)] : (reg75[(2'h3):(1'h1)] <<< (wire68 ?
                              reg73 : reg76))) : (^(reg73 & ((8'hae) && reg77)))),
                  reg75};
              reg75 <= wire71[(4'hc):(3'h5)];
              reg76 <= {((~^$unsigned({wire5})) >>> $signed($unsigned($unsigned((8'h9f))))),
                  $unsigned($signed(wire70[(3'h4):(2'h3)]))};
            end
          else
            begin
              reg72 <= (((reg16[(1'h1):(1'h0)] ?
                          $unsigned(wire8[(2'h3):(1'h1)]) : ((8'h9f) ?
                              $signed(reg13) : wire70)) ?
                      (!reg72[(3'h4):(1'h0)]) : wire70) ?
                  (8'ha6) : $unsigned(reg17[(3'h4):(1'h0)]));
            end
          if (($signed(reg17[(1'h1):(1'h0)]) ?
              reg16 : ({reg75,
                  (&wire67)} ^~ ((!(!wire9)) < reg77[(1'h1):(1'h1)]))))
            begin
              reg77 <= $signed((-(^(reg72[(2'h3):(1'h0)] ?
                  (~&reg77) : wire8))));
              reg78 <= $unsigned({({reg73[(4'h9):(4'h8)]} != $signed({(8'hbe),
                      reg11})),
                  $unsigned($signed(wire67[(1'h1):(1'h0)]))});
              reg79 <= (wire66[(1'h0):(1'h0)] >> wire9[(4'h9):(4'h8)]);
              reg80 <= ($unsigned(wire9) ?
                  $signed({($signed(reg78) < $unsigned(wire68))}) : $unsigned({{(~&reg19),
                          reg15},
                      wire70}));
              reg81 <= $unsigned({(($signed(reg75) ?
                          reg23[(2'h2):(1'h1)] : (wire64 ? (8'hb5) : reg10)) ?
                      ((~wire66) && (8'hbf)) : (8'ha3)),
                  (^~wire70[(4'ha):(2'h2)])});
            end
          else
            begin
              reg77 <= (8'h9e);
              reg78 <= {$unsigned({$unsigned({reg22, wire66}),
                      wire6[(2'h2):(1'h0)]}),
                  wire70[(4'hd):(3'h6)]};
              reg79 <= reg23[(3'h7):(1'h0)];
            end
        end
      reg82 <= $signed(($unsigned($unsigned((&reg21))) ?
          ($signed((reg14 != reg81)) ?
              $signed(wire69) : reg75[(3'h4):(1'h1)]) : reg19));
      if ((8'hb4))
        begin
          reg83 <= (wire6 * ($unsigned($signed($unsigned(wire6))) ?
              $signed($signed($signed((8'ha8)))) : ((~(reg72 ? reg14 : reg75)) ?
                  reg16 : reg17)));
          reg84 <= $unsigned(($unsigned($unsigned($unsigned(wire5))) * $unsigned($signed((8'ha3)))));
        end
      else
        begin
          if ($signed(((wire70[(4'ha):(4'h8)] ?
              $signed($signed(reg17)) : $unsigned(reg84[(4'hb):(4'h8)])) && $unsigned($signed((wire7 ?
              reg21 : wire9))))))
            begin
              reg83 <= wire68[(1'h1):(1'h0)];
            end
          else
            begin
              reg83 <= ($signed($unsigned($signed(((8'hb2) ?
                      wire8 : (8'ha9))))) ?
                  ((|(8'hb7)) >> reg72[(2'h2):(1'h1)]) : reg22);
              reg84 <= $unsigned(wire67[(2'h3):(2'h2)]);
              reg85 <= $signed(wire9);
              reg86 <= reg16;
            end
          reg87 <= (8'h9f);
        end
      reg88 <= (!{($unsigned($unsigned(reg81)) ?
              (((8'hb7) & wire66) ?
                  (!reg77) : (wire6 <<< reg21)) : ((reg17 != reg87) > (wire8 ?
                  reg74 : (8'hac)))),
          $signed((~|(wire71 + reg78)))});
    end
  assign wire89 = reg23[(3'h7):(3'h6)];
  assign wire90 = (8'haa);
  module91 #() modinst108 (.wire92(wire6), .wire94(wire90), .clk(clk), .wire95(reg22), .wire96(reg12), .wire93(wire68), .y(wire107));
  assign wire109 = $unsigned((8'ha0));
  always
    @(posedge clk) begin
      reg110 <= {(~|wire69[(2'h2):(1'h1)])};
      if ($unsigned(reg87[(1'h1):(1'h0)]))
        begin
          reg111 <= (8'hac);
          reg112 <= wire89[(3'h6):(3'h5)];
        end
      else
        begin
          reg111 <= {$signed(((((8'hae) >= wire71) > (reg86 ?
                      wire90 : wire67)) ?
                  ((reg84 ? reg83 : reg84) ?
                      wire71[(3'h4):(3'h4)] : $unsigned(reg16)) : (reg10[(2'h3):(1'h0)] ?
                      (|wire7) : reg21))),
              (+{({reg74, reg10} ? $signed(reg15) : $signed((8'hb0)))})};
        end
      if ($unsigned(wire68[(3'h5):(1'h0)]))
        begin
          reg113 <= ((reg80 >> ((wire66 ?
                  $signed(reg10) : (wire68 << (7'h44))) ?
              reg111[(1'h0):(1'h0)] : wire8[(4'h9):(2'h3)])) + reg79[(4'hc):(4'hc)]);
          reg114 <= reg14;
          if ({reg23})
            begin
              reg115 <= $unsigned(((reg73[(5'h10):(4'ha)] ?
                      {reg78[(1'h1):(1'h1)]} : reg19) ?
                  reg17[(3'h6):(3'h4)] : (|$unsigned($unsigned(wire90)))));
              reg116 <= ($signed((~|(reg82[(3'h7):(1'h0)] || wire107[(2'h2):(1'h1)]))) ?
                  (^~$unsigned({$unsigned(wire8)})) : (reg10 ?
                      ($unsigned(reg13) ?
                          (8'hbf) : {(reg113 ?
                                  wire9 : reg114)}) : ({$signed(reg23),
                              $unsigned(reg74)} ?
                          reg81 : (~&{(8'hb9)}))));
              reg117 <= reg78[(4'hc):(1'h1)];
              reg118 <= $unsigned($signed(wire66[(4'h8):(3'h5)]));
              reg119 <= ((reg110 ?
                      $signed(((reg84 ?
                          reg114 : reg73) >>> (^~wire64))) : reg85) ?
                  (((8'haa) >> wire64) ^ $unsigned(({reg76, (8'hb7)} ?
                      reg81 : (~|reg79)))) : wire89[(1'h1):(1'h1)]);
            end
          else
            begin
              reg115 <= reg10[(3'h6):(2'h3)];
              reg116 <= (&reg118[(3'h5):(1'h0)]);
            end
        end
      else
        begin
          reg113 <= (&$unsigned((+$signed($unsigned(reg21)))));
          if (reg86)
            begin
              reg114 <= ((!$signed((~((8'hba) ^~ reg114)))) < $signed($unsigned($unsigned(reg75[(4'h8):(1'h1)]))));
              reg115 <= (wire64[(2'h2):(2'h2)] ?
                  $unsigned((7'h44)) : (($signed($unsigned(reg85)) ?
                          reg112[(3'h7):(1'h1)] : (reg84[(3'h4):(2'h2)] ?
                              (~reg82) : reg77)) ?
                      ((!(reg79 ? reg16 : (8'h9d))) ?
                          wire68 : reg116[(3'h5):(3'h4)]) : (wire71 ?
                          $signed((reg86 ^~ reg119)) : ($signed(wire9) ?
                              wire6 : $signed(reg10)))));
              reg116 <= reg86[(1'h1):(1'h1)];
            end
          else
            begin
              reg114 <= reg12[(1'h1):(1'h0)];
              reg115 <= reg76[(4'hd):(4'h9)];
              reg116 <= (~&(&$unsigned($unsigned((~reg23)))));
              reg117 <= (^~(((8'hbe) ^ reg117[(4'hc):(4'hc)]) != (~^{$unsigned(wire8)})));
              reg118 <= (reg112 ?
                  ($unsigned(reg17) >>> (wire66 >>> reg13)) : $signed({reg111[(3'h5):(3'h5)],
                      (^$unsigned(wire7))}));
            end
          reg119 <= ($signed({$signed((^wire24))}) > $unsigned((+(~reg110))));
        end
      reg120 <= reg10[(2'h2):(1'h0)];
      reg121 <= $signed({reg15[(4'he):(3'h4)]});
    end
  assign wire122 = wire69[(1'h0):(1'h0)];
  assign wire123 = $signed(reg114[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg124 <= (~reg22);
      reg125 <= $unsigned(reg112[(4'h8):(3'h7)]);
      reg126 <= ((8'hb7) ?
          {(8'h9f)} : (wire69[(3'h4):(1'h0)] & (($signed(wire5) ?
                  (wire7 ? reg118 : wire5) : (8'ha5)) ?
              {$unsigned(reg18)} : (7'h41))));
      reg127 <= $signed(reg87);
    end
  assign wire128 = (wire107 ? reg11[(3'h6):(3'h5)] : reg125[(2'h3):(1'h0)]);
  assign wire129 = $signed($signed($unsigned((reg22[(4'he):(2'h3)] ?
                       $signed(wire67) : $unsigned(reg121)))));
  module130 #() modinst144 (wire143, clk, reg127, reg74, reg116, reg120, reg126);
endmodule

module module130  (y, clk, wire135, wire134, wire133, wire132, wire131);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire135;
  input wire signed [(2'h3):(1'h0)] wire134;
  input wire signed [(3'h6):(1'h0)] wire133;
  input wire signed [(4'ha):(1'h0)] wire132;
  input wire [(3'h6):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  wire signed [(4'hd):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 (1'h0)};
  assign wire136 = (7'h42);
  assign wire137 = (((|(wire135[(1'h0):(1'h0)] == wire133)) ?
                       {($unsigned(wire134) ?
                               {wire132} : wire133[(3'h5):(3'h5)])} : (wire133[(1'h0):(1'h0)] ?
                           (8'hbb) : wire135)) ^~ wire136[(3'h4):(2'h3)]);
  assign wire138 = (((wire135 | (~$signed(wire131))) ? wire133 : (8'hae)) ?
                       (|$unsigned($unsigned($unsigned(wire136)))) : $unsigned($unsigned((|{wire132,
                           wire131}))));
  assign wire139 = wire133[(1'h0):(1'h0)];
  assign wire140 = {$signed(($signed((8'hb9)) == $signed($unsigned(wire131)))),
                       $signed(wire134)};
  assign wire141 = $unsigned((&$signed($signed(wire132))));
  assign wire142 = $unsigned(($unsigned((wire138 < ((8'haf) < wire138))) ?
                       (wire133[(1'h0):(1'h0)] << wire139) : {$signed(wire134[(2'h2):(1'h0)])}));
endmodule

module module91  (y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire96;
  input wire [(4'he):(1'h0)] wire95;
  input wire signed [(4'hd):(1'h0)] wire94;
  input wire [(4'hf):(1'h0)] wire93;
  input wire signed [(4'he):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire100;
  wire [(3'h4):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  assign y = {wire106,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire97 = $signed({($unsigned((wire96 ? wire92 : wire93)) ?
                          $unsigned($unsigned(wire93)) : ((wire93 ?
                              wire96 : wire94) >>> $signed(wire93))),
                      $signed({wire95, $unsigned(wire96)})});
  assign wire98 = wire97[(3'h5):(3'h4)];
  assign wire99 = wire92[(4'h9):(3'h4)];
  assign wire100 = ($signed((^((wire93 ? wire96 : wire95) ?
                           $unsigned(wire99) : (wire92 >> wire92)))) ?
                       (-{(wire97 ? {wire94} : $unsigned(wire93)),
                           ($signed((8'haf)) && $signed(wire95))}) : wire92[(4'ha):(1'h1)]);
  assign wire101 = $signed($unsigned(((wire100 >>> (wire94 ?
                           wire100 : wire97)) ?
                       $signed(wire93[(2'h3):(2'h3)]) : wire99[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      reg102 <= $signed(((~&($unsigned((8'hac)) ?
          (wire99 ^~ wire96) : wire100[(1'h1):(1'h0)])) & (~|((wire94 == wire97) ?
          {wire99} : (!wire96)))));
      if (((8'hb2) << $signed(wire94)))
        begin
          reg103 <= $unsigned(($signed((wire96 >> $signed((8'ha3)))) ?
              $unsigned(wire95) : $unsigned(((wire97 ? (8'ha6) : wire99) ?
                  (8'ha5) : $signed(wire99)))));
        end
      else
        begin
          reg103 <= (wire99[(2'h2):(1'h1)] || ((wire93[(4'hc):(3'h6)] ?
              (&$signed(wire93)) : (8'hb1)) || wire92[(4'ha):(4'h8)]));
          reg104 <= $signed({$signed({(wire93 & (8'hb7))}),
              (~&(wire92 ? (~^reg103) : $unsigned(reg103)))});
          reg105 <= {wire99, $signed(wire95[(4'hd):(1'h0)])};
        end
    end
  assign wire106 = ($unsigned($unsigned($unsigned(wire94[(3'h5):(3'h5)]))) != $unsigned((wire98[(3'h4):(1'h1)] || ((8'hae) ?
                       (&(8'hbe)) : reg104[(5'h13):(3'h6)]))));
endmodule

module module25
#(parameter param63 = (&({(((7'h42) ? (8'ha8) : (8'hb7)) ? (8'hbe) : ((8'hb3) ? (8'hb7) : (8'ha8)))} && ((((8'ha6) || (8'hb2)) != (8'ha3)) ~^ (~|(^(8'hae)))))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire29;
  input wire signed [(3'h6):(1'h0)] wire28;
  input wire [(4'hc):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg62,
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
                 (1'h0)};
  assign wire30 = (7'h40);
  assign wire31 = wire26;
  assign wire32 = (wire29 - ($unsigned((wire26[(1'h1):(1'h0)] << (~|wire27))) ?
                      wire31 : (wire31 << (~|(~|wire26)))));
  assign wire33 = (~wire26);
  assign wire34 = wire28;
  assign wire35 = ($unsigned(((wire26 ?
                              {(8'h9e), wire26} : wire26[(3'h6):(3'h5)]) ?
                          $unsigned((|wire28)) : (wire28[(3'h6):(3'h5)] << wire29[(2'h2):(1'h0)]))) ?
                      $signed($signed((~|$unsigned(wire26)))) : ($signed(wire26[(4'h8):(3'h4)]) ?
                          ($unsigned(wire29) << (^~(wire30 ?
                              wire31 : wire29))) : $signed(((wire34 ?
                              wire34 : wire33) < $signed(wire27)))));
  assign wire36 = ($unsigned((wire26 && wire35)) ?
                      {{wire32[(1'h0):(1'h0)]},
                          wire33} : $signed((wire35[(1'h0):(1'h0)] ?
                          ((wire33 ? wire34 : wire34) ?
                              $signed(wire28) : (^wire30)) : wire32[(1'h1):(1'h0)])));
  assign wire37 = $signed(wire26);
  assign wire38 = {$unsigned($signed(wire37))};
  assign wire39 = ((((^~wire26[(3'h6):(3'h5)]) >> wire34) ?
                      $signed(wire37) : $signed($unsigned((wire35 ?
                          (8'hbe) : wire29)))) ~^ $unsigned((8'hab)));
  assign wire40 = $signed(($unsigned($signed({(8'hbf), (8'hab)})) ?
                      {$unsigned($unsigned(wire26)),
                          $signed(wire29[(1'h1):(1'h0)])} : wire36));
  assign wire41 = wire26;
  assign wire42 = (+(~^$unsigned((^(wire41 ? wire28 : wire31)))));
  assign wire43 = $unsigned((wire36[(1'h0):(1'h0)] ?
                      $unsigned($signed(wire27)) : (~($signed(wire36) + ((8'hba) ?
                          wire36 : wire34)))));
  assign wire44 = $signed($unsigned(($unsigned({wire29}) ?
                      wire28[(1'h0):(1'h0)] : $signed(wire41[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg45 <= wire37;
      if ((wire35 + (8'h9f)))
        begin
          reg46 <= wire36;
          if ($signed((+((wire29[(1'h0):(1'h0)] * $signed(wire30)) >> $signed((wire41 ?
              wire29 : wire40))))))
            begin
              reg47 <= (^$unsigned($signed(($unsigned(wire27) ?
                  (wire38 ? reg46 : reg46) : wire32[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg47 <= (!$signed(((wire32 - (-wire32)) ?
                  (+wire37[(3'h5):(2'h3)]) : $signed((reg47 ?
                      wire27 : wire27)))));
              reg48 <= $unsigned(({wire43[(4'hb):(4'h9)]} == (reg46[(3'h6):(2'h2)] ~^ $unsigned(wire42[(4'h9):(2'h3)]))));
              reg49 <= (((~^$signed((~^(8'hb2)))) >> wire30) <<< $signed((-($signed(wire28) & $signed(wire32)))));
            end
          if (((wire36 ?
              {(reg48 ? $unsigned(wire38) : $unsigned(wire33)),
                  $signed($signed(wire29))} : $signed(((reg47 ?
                  wire42 : wire34) ^~ (wire32 ? wire38 : wire41)))) + (reg47 ?
              wire28[(3'h6):(2'h3)] : (+$unsigned({wire38})))))
            begin
              reg50 <= wire28[(3'h4):(1'h0)];
              reg51 <= ({{$signed((reg47 ? wire28 : reg45))},
                      ($unsigned($unsigned((8'hb7))) != wire44)} ?
                  reg45[(5'h11):(4'h8)] : wire40);
              reg52 <= $unsigned($signed($unsigned($signed(wire43))));
            end
          else
            begin
              reg50 <= (8'h9e);
              reg51 <= $unsigned((wire27 - wire44[(3'h6):(2'h2)]));
              reg52 <= wire39[(3'h5):(1'h0)];
              reg53 <= wire39[(3'h4):(2'h2)];
            end
        end
      else
        begin
          reg46 <= $signed((wire27 ^ wire43[(3'h7):(1'h1)]));
          reg47 <= (~^$unsigned(((wire44[(3'h6):(1'h1)] && $unsigned(wire38)) ?
              (~&reg52[(5'h14):(3'h6)]) : $signed((wire36 <<< wire38)))));
          reg48 <= $unsigned(({wire42} ?
              wire27 : (wire36[(2'h2):(1'h0)] ?
                  $signed(wire32[(2'h2):(1'h0)]) : (wire34[(2'h3):(1'h0)] ?
                      (|(8'ha8)) : (wire42 ? (8'ha6) : wire36)))));
        end
      reg54 <= ((((-$signed(wire40)) < {(+(8'ha4))}) ?
          $unsigned(wire38) : $signed($signed(reg45))) >= reg52[(3'h4):(2'h3)]);
      if (reg53)
        begin
          reg55 <= {(|wire43),
              (~|((wire29[(1'h1):(1'h1)] ?
                      reg50[(1'h0):(1'h0)] : ((8'h9f) ? wire35 : reg47)) ?
                  {(~reg48),
                      $signed((8'ha3))} : $unsigned(reg52[(5'h15):(4'ha)])))};
          reg56 <= wire36;
          reg57 <= wire31[(1'h1):(1'h0)];
          reg58 <= $signed(({((|wire44) < $unsigned(reg55)),
              (~&(wire33 ^~ reg55))} >>> (^~wire40[(1'h0):(1'h0)])));
          reg59 <= ((^(~&(^$unsigned(wire38)))) << $unsigned({(!$signed(wire26)),
              $signed(reg45[(4'hb):(4'h9)])}));
        end
      else
        begin
          reg55 <= (&(reg56[(3'h6):(2'h3)] ?
              $unsigned(($unsigned(reg50) != reg59)) : (reg58[(3'h7):(3'h7)] + reg59)));
          reg56 <= reg58[(3'h7):(1'h1)];
          reg57 <= $signed(wire39[(4'h8):(1'h1)]);
          reg58 <= $unsigned($signed(wire36[(3'h4):(2'h3)]));
        end
    end
  assign wire60 = {($signed((wire26 >> (|(7'h43)))) > (wire40 < $signed((8'hb3))))};
  assign wire61 = ($unsigned((wire36 & ((wire33 ^ reg47) ?
                      $unsigned(reg56) : {wire26}))) << (reg52 ?
                      (((wire41 ? reg49 : wire44) ?
                          wire27 : (&wire43)) == $signed((~^wire30))) : {(wire31[(3'h6):(3'h6)] + $signed(reg51))}));
  always
    @(posedge clk) begin
      reg62 <= wire30[(1'h0):(1'h0)];
    end
endmodule
