module top #(parameter param155 = (8'hac)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire154;
  wire signed [(5'h11):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire148;
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire98,
                 wire101,
                 wire148,
                 reg100,
                 (1'h0)};
  module4 #() modinst99 (wire98, clk, wire0, wire2, wire1, wire3, (8'ha5));
  always
    @(posedge clk) begin
      reg100 <= $signed((8'hb6));
    end
  assign wire101 = wire3;
  module102 #() modinst149 (wire148, clk, wire98, wire1, wire0, wire2, wire101);
  assign wire150 = ($signed($unsigned((+wire101))) + wire98);
  assign wire151 = $unsigned((~&{(^~$signed(wire3))}));
  assign wire152 = (wire150[(4'h8):(3'h4)] ?
                       wire0[(4'hf):(3'h5)] : {wire151,
                           $unsigned(($unsigned(wire148) ?
                               $signed(wire0) : $signed((8'hba))))});
  assign wire153 = ($signed(wire148[(3'h4):(2'h3)]) <= $signed(wire151));
  assign wire154 = {(wire101[(4'he):(4'ha)] || $unsigned($unsigned((wire152 >> wire151))))};
endmodule

module module102
#(parameter param146 = (~&(((~|(~^(8'hb4))) - (^{(8'h9e)})) ^ (^((~&(8'ha9)) ? {(8'had)} : (!(8'h9c)))))), 
parameter param147 = (&(8'hb3)))
(y, clk, wire103, wire104, wire105, wire106, wire107);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire103;
  input wire signed [(2'h2):(1'h0)] wire104;
  input wire [(5'h11):(1'h0)] wire105;
  input wire signed [(4'hc):(1'h0)] wire106;
  input wire [(5'h10):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire144;
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  assign y = {wire113,
                 wire114,
                 wire144,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg108 <= {(^~$unsigned((wire104[(1'h1):(1'h1)] ?
              {wire103, (8'hb4)} : (|(8'hbe)))))};
      reg109 <= {(+(|($signed(wire104) <<< wire106)))};
      if ((wire105[(4'h9):(3'h6)] == (~^((((8'hb5) >>> wire106) <<< wire105) << (wire104[(1'h1):(1'h1)] ?
          {wire104} : $unsigned(wire107))))))
        begin
          reg110 <= wire104[(1'h1):(1'h0)];
          reg111 <= wire105;
          reg112 <= reg111;
        end
      else
        begin
          reg110 <= $unsigned((~^$signed((wire103 ?
              wire104[(1'h0):(1'h0)] : (reg109 - reg111)))));
          reg111 <= (~^(^~$signed((~wire107[(1'h1):(1'h0)]))));
          reg112 <= (($unsigned($unsigned($signed(reg112))) <= $signed(wire106)) == reg111);
        end
    end
  assign wire113 = (reg109 ?
                       wire107 : $unsigned((!(reg110[(3'h7):(3'h5)] ?
                           (wire106 && wire106) : (reg110 < (8'hba))))));
  assign wire114 = wire103;
  module115 #() modinst145 (.y(wire144), .wire116(wire106), .wire119(wire103), .clk(clk), .wire118(wire107), .wire120(reg111), .wire117(reg109));
endmodule

module module4
#(parameter param96 = (&({(8'ha8)} ? (((8'hb5) * ((8'ha4) ~^ (8'hba))) ? (~|((8'ha8) ? (7'h40) : (8'had))) : (((8'h9f) == (8'hbe)) ? (^(8'h9f)) : ((8'hbc) & (8'had)))) : (((-(8'haf)) ? ((8'h9e) & (8'hbe)) : ((8'haa) != (8'h9c))) ? (~|(^(8'hbf))) : ({(7'h44)} ^~ ((8'hbf) ? (8'hb7) : (8'hba)))))), 
parameter param97 = param96)
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  assign y = {wire94,
                 wire65,
                 wire64,
                 wire62,
                 wire24,
                 wire22,
                 wire21,
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
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $signed((8'ha2));
      if (wire9)
        begin
          reg11 <= ((&$signed(wire9)) ?
              reg10[(4'hf):(3'h4)] : $signed(($signed({wire9,
                  wire7}) || $signed($unsigned(reg10)))));
          reg12 <= $unsigned($unsigned((wire5[(1'h1):(1'h0)] > ((wire8 ?
              wire8 : wire6) == $signed(wire7)))));
          reg13 <= {(wire7[(2'h2):(2'h2)] ?
                  $signed((wire8 + {reg10})) : ($signed($signed((8'haf))) ?
                      reg10[(4'h8):(2'h3)] : wire8))};
          reg14 <= (reg13[(4'he):(4'hb)] ?
              (+(wire6 ?
                  (wire5[(2'h2):(2'h2)] ~^ reg11) : (8'hb4))) : (!wire7));
          reg15 <= ($unsigned({$signed(reg11[(2'h2):(1'h1)]),
              ((reg12 ?
                  wire6 : wire7) ^~ wire9[(3'h7):(3'h4)])}) < $signed(reg11));
        end
      else
        begin
          if (((^$unsigned((!$signed(wire7)))) + $signed((reg11[(1'h1):(1'h0)] ?
              wire7 : {wire5[(1'h0):(1'h0)], reg11[(1'h1):(1'h0)]}))))
            begin
              reg11 <= (+reg13[(4'hc):(4'h8)]);
              reg12 <= ((&(+reg15)) ^ $unsigned({reg14,
                  ((wire6 * reg14) ? $unsigned(reg10) : $signed(wire9))}));
            end
          else
            begin
              reg11 <= $signed(((({wire9, reg10} < ((8'ha8) ?
                      (8'ha1) : reg14)) ?
                  wire9 : $unsigned($signed((8'had)))) == $signed(($unsigned(wire6) ?
                  reg14 : (reg15 == reg15)))));
              reg12 <= (wire5 < reg14[(3'h7):(3'h7)]);
              reg13 <= wire5;
              reg14 <= reg12;
              reg15 <= $unsigned(reg14);
            end
          reg16 <= (({(^$unsigned((8'h9f)))} | reg11[(2'h2):(1'h0)]) + $signed($unsigned((^~((8'h9c) ?
              reg10 : wire7)))));
          if (({(wire5[(2'h2):(1'h1)] > ((wire5 == wire8) ?
                      wire8 : (~&reg13)))} ?
              ($signed((wire5[(1'h0):(1'h0)] ?
                  (wire8 ?
                      reg12 : reg16) : (7'h43))) ^ (~^$signed((+(8'h9c))))) : {(~|$unsigned($signed(wire9)))}))
            begin
              reg17 <= {($signed($unsigned((reg11 << reg10))) || reg10[(1'h0):(1'h0)])};
              reg18 <= (^{(|((reg12 ? wire5 : reg12) ?
                      $unsigned(reg15) : $signed(wire6)))});
              reg19 <= $signed(reg13);
            end
          else
            begin
              reg17 <= (~^(reg16 ?
                  (($unsigned(reg14) ? {(8'ha8), reg18} : $unsigned(reg15)) ?
                      wire8[(2'h3):(2'h3)] : $signed((reg10 ^~ reg10))) : $signed($signed((wire7 ?
                      reg11 : reg17)))));
              reg18 <= wire8[(4'h8):(1'h1)];
            end
        end
      reg20 <= $unsigned((~$unsigned($signed($unsigned(wire9)))));
    end
  assign wire21 = {($unsigned(wire6[(3'h4):(1'h1)]) > $signed(reg14)), (8'hbf)};
  assign wire22 = ($unsigned($signed((reg17[(1'h1):(1'h1)] & $unsigned(reg11)))) ?
                      $signed((&(reg11 ?
                          (reg11 ~^ wire6) : (~^reg15)))) : $signed({reg18[(4'h8):(3'h4)],
                          wire5}));
  always
    @(posedge clk) begin
      reg23 <= (!$unsigned(((reg19[(3'h5):(3'h5)] ?
              (~|reg12) : (wire6 < reg13)) ?
          (8'hac) : reg13[(4'hd):(1'h0)])));
    end
  assign wire24 = (reg16[(2'h2):(1'h1)] ?
                      wire21[(3'h7):(3'h5)] : $unsigned((!reg20)));
  module25 #() modinst63 (wire62, clk, wire5, reg19, reg23, wire21);
  assign wire64 = {(wire62 ?
                          {(~^$signed(reg16)),
                              {(reg18 ?
                                      (8'hb2) : reg19)}} : $unsigned((~|(reg15 ?
                              wire7 : reg14))))};
  assign wire65 = ((!$unsigned(((^~wire8) ?
                          $unsigned(reg19) : $signed(wire62)))) ?
                      ($unsigned(reg10) ?
                          {(|wire5[(4'h8):(3'h4)]),
                              (~|(reg13 != (8'h9c)))} : {$signed($unsigned(wire62)),
                              reg18[(3'h5):(1'h0)]}) : ($unsigned($unsigned((reg15 != wire64))) ?
                          (reg10[(2'h2):(1'h1)] ?
                              wire24[(1'h1):(1'h0)] : (8'h9c)) : wire24));
  module66 #() modinst95 (.wire69(reg23), .wire70(reg15), .clk(clk), .wire68(wire22), .wire67(wire24), .y(wire94), .wire71(reg19));
endmodule

module module66
#(parameter param92 = ((((|((8'hbc) & (7'h43))) || (-((8'had) ? (8'hb2) : (8'hae)))) & (-{((8'ha3) ? (8'hbc) : (7'h40))})) ? ((({(8'haa), (8'hb9)} || ((8'hbf) ^ (8'hab))) >= (((8'hbd) * (8'had)) & ((8'hb8) < (8'hbf)))) < ((((7'h41) ? (8'hab) : (8'haa)) ? ((8'ha1) < (8'h9f)) : ((8'had) >> (8'hb4))) || ((~(8'hb8)) ? (8'ha2) : {(8'ha3), (8'ha2)}))) : ({((~|(7'h40)) ? ((8'ha3) <= (7'h40)) : ((8'hb9) ? (7'h43) : (8'hb3)))} <<< ({{(7'h42)}} ^ ({(8'ha5), (8'hb0)} - (~|(8'haa)))))), 
parameter param93 = (~&param92))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire signed [(5'h12):(1'h0)] wire70;
  input wire [(5'h15):(1'h0)] wire69;
  input wire [(2'h2):(1'h0)] wire68;
  input wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
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
                 (1'h0)};
  assign wire72 = (-(8'hb3));
  assign wire73 = $unsigned(($signed($signed($unsigned((8'hb2)))) != wire70[(5'h12):(5'h12)]));
  assign wire74 = (!$signed(wire70[(3'h5):(1'h0)]));
  assign wire75 = {(~|wire69[(4'ha):(2'h2)]),
                      $signed($signed(wire72[(1'h1):(1'h0)]))};
  assign wire76 = $signed((wire68[(1'h0):(1'h0)] < wire75));
  always
    @(posedge clk) begin
      if ($signed($unsigned((|$unsigned(wire73[(4'hd):(4'hc)])))))
        begin
          reg77 <= {$unsigned($signed($unsigned({wire70}))),
              (wire69 && ($unsigned((wire75 + wire74)) ?
                  $signed($signed(wire75)) : $unsigned((wire70 ?
                      (8'hbd) : wire68))))};
          if (((8'had) ?
              $signed((wire69 <<< ($unsigned(wire73) && $unsigned((8'h9d))))) : wire68[(2'h2):(2'h2)]))
            begin
              reg78 <= wire68[(1'h0):(1'h0)];
              reg79 <= $signed(($unsigned((~^wire70)) || wire72));
            end
          else
            begin
              reg78 <= wire68;
              reg79 <= $signed({(((-reg78) && $unsigned(wire69)) ?
                      ($signed(wire73) ?
                          $signed(reg79) : wire72[(1'h1):(1'h1)]) : (~^$signed(wire75))),
                  {(wire74[(1'h1):(1'h1)] != (!wire67))}});
            end
          reg80 <= $signed($signed({$unsigned((~^wire73))}));
          reg81 <= wire74;
        end
      else
        begin
          reg77 <= reg78;
          reg78 <= $signed(wire67[(3'h6):(1'h0)]);
        end
      reg82 <= wire76;
      if ($unsigned(((8'ha0) + (8'hb1))))
        begin
          reg83 <= $unsigned((reg81 >> (+$signed((!wire72)))));
          reg84 <= reg82;
          reg85 <= wire70;
          reg86 <= ({reg83} ^ wire76[(3'h6):(3'h5)]);
        end
      else
        begin
          reg83 <= (~&$signed((&reg85[(2'h2):(2'h2)])));
          if (wire76[(2'h2):(1'h1)])
            begin
              reg84 <= (|{{reg85[(1'h1):(1'h1)], reg81[(4'h9):(1'h0)]}});
            end
          else
            begin
              reg84 <= $unsigned(wire76[(5'h14):(3'h5)]);
            end
          if (((wire74[(2'h3):(2'h2)] ?
              ($unsigned((reg81 ? wire68 : reg79)) ?
                  $unsigned((reg77 ?
                      reg79 : (8'ha8))) : (^~wire76[(4'hf):(3'h7)])) : ($unsigned((!reg86)) ^ ($signed(reg77) ?
                  wire67 : (!wire76)))) - ((reg83 ?
                  $signed($signed(wire69)) : $signed(reg79)) ?
              $signed($signed({reg82,
                  wire75})) : $unsigned({$unsigned(wire68)}))))
            begin
              reg85 <= (($signed($signed(reg79[(1'h1):(1'h0)])) & wire69) == (reg83[(2'h2):(1'h0)] ?
                  (((reg79 < wire73) ^ (wire75 > reg79)) | wire73) : reg77));
            end
          else
            begin
              reg85 <= $unsigned((((~^reg78) >>> (wire73[(4'he):(3'h7)] ~^ reg84)) ?
                  wire73[(4'hf):(1'h1)] : {((reg85 ? wire74 : reg82) ?
                          $unsigned(wire69) : wire70)}));
              reg86 <= (8'h9d);
              reg87 <= (!(!(~^(~^(wire69 ? (8'h9d) : reg81)))));
            end
        end
      reg88 <= (wire68 ?
          $unsigned({$unsigned(wire70[(2'h3):(1'h1)])}) : {reg83[(1'h1):(1'h1)],
              (wire67[(4'h8):(2'h3)] != wire71)});
      reg89 <= $unsigned(wire76);
    end
  assign wire90 = (~&$unsigned($unsigned($unsigned(reg78))));
  assign wire91 = reg77;
endmodule

module module25
#(parameter param60 = ((({(+(8'hb1))} - (((7'h44) != (8'h9c)) > ((8'ha3) >= (8'hb1)))) ? (!(~&((8'ha1) ? (8'hbe) : (8'ha7)))) : ((((8'ha9) != (8'h9d)) ? ((7'h42) | (8'hb8)) : ((8'hbf) ? (8'ha0) : (7'h42))) + (+((8'hac) || (8'had))))) ? ((~|{{(8'ha5), (8'haa)}}) & (~(((8'h9c) != (8'hb6)) ? ((8'ha8) ? (8'hb9) : (8'ha4)) : ((8'h9e) >>> (7'h40))))) : (&(+((&(8'hb2)) ? ((8'hbc) && (8'hbf)) : ((8'hba) ? (8'ha5) : (8'hb4)))))), 
parameter param61 = param60)
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire [(4'ha):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
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
                 reg38,
                 (1'h0)};
  assign wire30 = $unsigned($signed(wire27[(3'h5):(1'h1)]));
  assign wire31 = wire26[(4'h9):(2'h2)];
  assign wire32 = $unsigned(wire31);
  assign wire33 = $unsigned(({(wire32 * (wire27 ^ wire32))} ~^ ($unsigned((wire28 ?
                          wire30 : wire27)) ?
                      (~$signed(wire32)) : $unsigned($signed(wire26)))));
  assign wire34 = $signed($unsigned((~$signed($signed(wire32)))));
  assign wire35 = $signed($unsigned((^wire33)));
  assign wire36 = ({$signed((wire35[(2'h2):(2'h2)] ?
                          (wire31 ? wire30 : wire35) : $signed(wire33))),
                      wire32} ^ (!$unsigned($unsigned({wire32, wire29}))));
  assign wire37 = (-(^~$unsigned((!(8'ha3)))));
  always
    @(posedge clk) begin
      reg38 <= ($signed((+wire34)) ?
          $unsigned(wire36[(3'h7):(2'h3)]) : (-wire37));
    end
  assign wire39 = (&(|wire26[(2'h2):(1'h1)]));
  assign wire40 = (({wire37} ?
                      ((^~(wire36 | wire26)) ?
                          $signed(wire33[(1'h0):(1'h0)]) : $signed({wire37,
                              wire28})) : (wire34 ?
                          wire33[(1'h0):(1'h0)] : $signed(wire36))) >> wire30[(1'h1):(1'h0)]);
  assign wire41 = ((~&(~&wire34[(4'ha):(4'h9)])) || wire33[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg42 <= {wire32[(2'h2):(2'h2)]};
      reg43 <= wire30[(3'h6):(3'h4)];
      if (($unsigned(wire33) ~^ wire26))
        begin
          reg44 <= $unsigned($unsigned($signed($signed($unsigned(wire33)))));
          reg45 <= ((-wire26[(3'h7):(1'h1)]) >>> $unsigned((wire29[(4'ha):(2'h2)] ^ {(wire39 * wire30),
              $signed(wire27)})));
          if (wire28)
            begin
              reg46 <= $signed((($unsigned(wire40) ^ (-{(8'ha5)})) ?
                  $signed(wire34[(1'h1):(1'h1)]) : (+({reg44,
                      wire27} < wire31[(4'h8):(3'h4)]))));
              reg47 <= ({(~^$signed(reg43))} ^~ $unsigned((($unsigned(wire39) ?
                      ((8'hbc) > reg44) : (wire33 & wire27)) ?
                  wire41 : $unsigned($unsigned(reg43)))));
              reg48 <= {$unsigned($unsigned((wire41[(1'h0):(1'h0)] ?
                      $signed(wire33) : wire33))),
                  wire36};
              reg49 <= ($unsigned(reg38[(2'h2):(1'h1)]) && reg45[(1'h0):(1'h0)]);
              reg50 <= (-reg49[(4'hb):(4'h9)]);
            end
          else
            begin
              reg46 <= (|$unsigned(wire40));
              reg47 <= ($signed((|reg49[(1'h0):(1'h0)])) ^ (!{reg49[(3'h6):(2'h2)],
                  $signed((reg42 == wire36))}));
              reg48 <= wire35;
            end
          reg51 <= $unsigned($signed(reg45[(2'h3):(1'h0)]));
          if ({wire39[(2'h2):(2'h2)],
              $signed(($unsigned(reg47[(3'h5):(2'h2)]) ?
                  $signed((+wire40)) : ({wire36} ?
                      (~^reg46) : $signed(wire32))))})
            begin
              reg52 <= $unsigned(($signed(wire40) ?
                  wire41 : $unsigned(reg45[(3'h5):(2'h2)])));
            end
          else
            begin
              reg52 <= ((^(^wire33)) + $signed(((reg49[(3'h5):(3'h4)] >= reg42) ^ wire33[(2'h2):(1'h1)])));
              reg53 <= (((+(+$signed(reg38))) <= $unsigned($signed(wire39))) ^~ {((!wire36[(1'h1):(1'h1)]) <<< ($unsigned(wire41) ?
                      (wire35 < wire28) : reg45[(3'h4):(3'h4)])),
                  reg51[(4'hd):(4'ha)]});
              reg54 <= {{((7'h43) ?
                          ({wire37} ?
                              $signed(wire41) : $signed(wire37)) : (~|(wire34 || wire31)))},
                  $unsigned($unsigned((!reg52[(4'h9):(2'h3)])))};
            end
        end
      else
        begin
          reg44 <= $signed((~(!$signed((wire39 + (8'hbf))))));
          reg45 <= ($signed(($unsigned($unsigned(reg51)) ?
              {(+wire29),
                  (wire35 ?
                      (8'hbf) : reg50)} : $unsigned(wire32[(4'h8):(1'h0)]))) ^~ $signed($signed(((reg43 > wire40) - wire28[(4'h8):(3'h7)]))));
          reg46 <= $signed(wire36);
        end
    end
  assign wire55 = wire39;
  assign wire56 = $signed({(8'ha5), wire33});
  assign wire57 = ($unsigned(($signed(reg46[(4'h9):(3'h5)]) ?
                      reg42 : ($unsigned(wire31) ?
                          reg38 : (reg38 >>> wire32)))) != (&wire29));
  assign wire58 = $unsigned(reg49);
  assign wire59 = (^wire56[(3'h6):(2'h3)]);
endmodule

module module115
#(parameter param143 = {(!{(((8'ha8) >> (8'h9c)) ? {(8'h9d)} : ((8'h9c) < (8'ha4)))}), (((8'hbc) - (((7'h42) == (7'h40)) ? (~^(8'h9f)) : ((8'hbf) != (8'hbd)))) - (8'ha6))})
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire120;
  input wire signed [(4'hb):(1'h0)] wire119;
  input wire [(5'h10):(1'h0)] wire118;
  input wire [(5'h15):(1'h0)] wire117;
  input wire [(4'ha):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire signed [(3'h6):(1'h0)] wire121;
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 reg142,
                 reg141,
                 reg140,
                 reg128,
                 (1'h0)};
  assign wire121 = wire116;
  assign wire122 = $signed(wire118[(4'hb):(4'hb)]);
  assign wire123 = (|wire120);
  assign wire124 = ((((~^(wire122 ?
                           wire121 : (8'ha3))) > (!(wire120 >>> (8'h9f)))) && $signed(wire120)) ?
                       ((&$unsigned((wire118 ?
                           wire118 : (8'hb9)))) < wire117[(3'h6):(3'h6)]) : (wire116[(2'h2):(1'h1)] ?
                           wire122 : (((wire116 ?
                               wire121 : wire117) << (-wire123)) != $unsigned($unsigned(wire123)))));
  assign wire125 = wire122;
  assign wire126 = $unsigned((wire118 ?
                       wire122[(4'hd):(2'h2)] : (|((wire117 == wire124) ?
                           (^~wire121) : ((8'ha1) <<< wire121)))));
  assign wire127 = ((^~(wire123 == {(wire118 ^~ (8'hb8))})) > wire116);
  always
    @(posedge clk) begin
      reg128 <= {(wire118 ?
              (({wire122,
                  wire127} > (wire117 | wire120)) ^ $signed(wire122)) : $unsigned($signed((wire127 >>> wire126))))};
    end
  assign wire129 = wire116;
  assign wire130 = (8'ha6);
  assign wire131 = (($unsigned(wire130[(1'h0):(1'h0)]) != $signed($unsigned(wire118[(2'h2):(1'h0)]))) ?
                       wire130[(3'h5):(3'h4)] : (^~($unsigned(wire130[(4'h8):(4'h8)]) >> $unsigned($signed(wire130)))));
  assign wire132 = (8'hb1);
  assign wire133 = (wire122[(4'hc):(2'h2)] & (~|(($unsigned(wire119) >= (wire117 ?
                           wire116 : wire120)) ?
                       $signed((wire131 || wire132)) : (8'hbd))));
  assign wire134 = ((^~(wire120[(1'h1):(1'h0)] ?
                           $signed($unsigned(wire125)) : wire116[(1'h0):(1'h0)])) ?
                       ({$unsigned($signed(wire122))} | $unsigned($unsigned((wire123 ?
                           wire133 : wire122)))) : wire123);
  assign wire135 = wire132[(2'h3):(2'h3)];
  assign wire136 = (8'hb0);
  assign wire137 = $signed((7'h44));
  assign wire138 = $unsigned(((~&((wire119 ? wire121 : wire123) ?
                       $signed(wire135) : (wire117 & wire135))) == (&(~$unsigned((8'ha9))))));
  assign wire139 = {{wire138}};
  always
    @(posedge clk) begin
      reg140 <= ((8'hbb) ? wire136 : $unsigned((~|wire132)));
      reg141 <= (+wire130[(3'h4):(2'h2)]);
      reg142 <= wire117;
    end
endmodule
