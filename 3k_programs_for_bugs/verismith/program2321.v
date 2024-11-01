module top
#(parameter param172 = {((|(((8'ha5) ~^ (8'hbc)) ? ((8'hb9) && (8'ha8)) : (8'ha8))) | {{{(8'hab), (8'haa)}, ((8'h9f) ^ (8'hb8))}, (((8'ha5) ? (8'hb2) : (8'hae)) ? ((7'h44) ? (8'hb2) : (7'h42)) : (!(8'hb8)))})})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire171;
  wire signed [(5'h13):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(2'h2):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire166;
  wire [(4'hc):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire147;
  reg [(3'h4):(1'h0)] reg168 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire167,
                 wire166,
                 wire18,
                 wire147,
                 reg168,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (8'h9f);
      reg6 <= wire4;
      if (wire4)
        begin
          reg7 <= wire4[(3'h4):(2'h3)];
          reg8 <= reg7[(1'h0):(1'h0)];
          reg9 <= {wire0};
        end
      else
        begin
          if (wire2[(1'h1):(1'h1)])
            begin
              reg7 <= $signed($signed(wire1[(3'h6):(2'h2)]));
              reg8 <= {(wire4[(2'h3):(2'h3)] ?
                      $unsigned((!reg7[(3'h5):(1'h1)])) : (((^(8'had)) ?
                          (wire1 ? wire3 : wire0) : ((8'haa) ?
                              wire0 : reg6)) | wire3))};
              reg9 <= ((8'ha5) | $signed(((~&(wire3 ^~ reg5)) ^~ (&$unsigned(reg9)))));
              reg10 <= reg7;
              reg11 <= {((($signed(wire1) ?
                          (reg9 ? wire0 : reg6) : (-reg9)) >= (reg7 ?
                          (|reg10) : $unsigned(reg5))) ?
                      (+($signed(wire2) >= {reg5})) : ((+$signed((8'hac))) <<< $unsigned($unsigned(wire1)))),
                  reg10[(1'h0):(1'h0)]};
            end
          else
            begin
              reg7 <= ($signed($signed(((~^wire1) ?
                  (wire0 ? wire0 : reg8) : (reg5 >= reg6)))) >> wire0);
            end
          if (($unsigned(reg10[(1'h0):(1'h0)]) ?
              $signed({$unsigned((reg9 >= reg10)),
                  (-wire0)}) : reg5[(3'h4):(2'h3)]))
            begin
              reg12 <= reg8;
            end
          else
            begin
              reg12 <= ($signed($signed((reg5 ?
                  (reg11 ? wire1 : wire1) : reg5))) ^~ {reg11,
                  (($unsigned((8'had)) ? (reg7 ? reg6 : reg9) : {reg5, reg5}) ?
                      $signed($signed(reg11)) : (reg12 + $signed((8'hbf))))});
              reg13 <= wire1[(3'h7):(3'h6)];
              reg14 <= (|((((~reg11) && reg12) ?
                  (wire3[(1'h0):(1'h0)] < (wire0 > (8'h9c))) : ((8'ha5) * reg12[(3'h5):(3'h4)])) >> (((+wire3) ?
                      $signed((8'h9c)) : $unsigned(reg13)) ?
                  (^reg7[(3'h6):(1'h1)]) : (wire3[(4'hb):(4'h9)] <<< $unsigned(reg10)))));
            end
          reg15 <= reg8[(1'h0):(1'h0)];
          reg16 <= $signed($unsigned($signed((|(reg6 | reg5)))));
        end
      reg17 <= {$signed((~&($unsigned(reg13) ^ wire2[(1'h0):(1'h0)]))),
          $signed($signed(wire2))};
    end
  assign wire18 = {((+$unsigned({reg13})) && ((~&reg14[(2'h3):(1'h0)]) > reg12))};
  module19 #() modinst148 (.wire21(reg13), .y(wire147), .wire24(reg8), .wire22(reg6), .clk(clk), .wire23(wire0), .wire20(reg10));
  always
    @(posedge clk) begin
      reg149 <= (~&($unsigned(((8'ha4) ? (reg7 > reg14) : (|reg9))) ?
          ($unsigned(reg9[(4'h9):(1'h1)]) ?
              ((reg12 > wire4) ? {reg11} : reg6) : ({reg5,
                  reg16} - reg7)) : ({(^~reg7)} ?
              ((reg13 ? wire4 : reg6) ?
                  (reg17 ? wire2 : reg15) : wire2) : {$signed(wire1),
                  (wire1 ? reg8 : (8'ha2))})));
      if (wire1)
        begin
          if (({reg7} ?
              $unsigned(((~reg11) ?
                  $signed($unsigned((8'ha7))) : {(wire18 >>> reg17),
                      (|reg5)})) : ((({reg5} < reg12) ^~ (8'hb6)) + (reg14 && $signed((reg5 <= reg14))))))
            begin
              reg150 <= reg16[(2'h2):(1'h1)];
              reg151 <= ((&$signed((~|$signed(wire147)))) || reg7[(2'h2):(1'h1)]);
              reg152 <= (|$unsigned((wire4 != ((reg10 << (8'hbb)) ?
                  $signed(reg149) : wire1[(3'h6):(3'h6)]))));
              reg153 <= {$signed(reg9),
                  {reg12, ($signed($unsigned(wire147)) - {$unsigned(reg10)})}};
              reg154 <= (((!reg13[(3'h7):(3'h4)]) >= (~|reg153)) ?
                  ($unsigned(reg152[(3'h4):(1'h1)]) ?
                      {reg10[(3'h6):(2'h3)]} : $unsigned({(wire147 ?
                              wire0 : (7'h42))})) : ($unsigned(reg12[(3'h4):(2'h3)]) ?
                      ((reg6[(3'h6):(3'h6)] ?
                              $signed(wire18) : $unsigned(wire4)) ?
                          $unsigned(reg11[(4'hf):(4'he)]) : (^(wire3 ?
                              (8'hb5) : (8'h9f)))) : ((~^$signed(reg10)) ?
                          reg153[(2'h3):(1'h1)] : ($signed((8'ha1)) & $signed(reg151)))));
            end
          else
            begin
              reg150 <= reg7;
              reg151 <= ((~|$unsigned(((&(8'hb0)) && (|reg14)))) ?
                  wire1 : ((($unsigned((7'h41)) ?
                      $unsigned((8'ha3)) : reg13[(2'h3):(2'h3)]) << (^(reg11 ^ reg14))) & $unsigned($signed(reg151))));
              reg152 <= (-reg7);
            end
          reg155 <= (~&($unsigned(((~^wire0) ^~ reg150[(3'h4):(1'h1)])) ?
              (wire3 ?
                  (reg154[(1'h1):(1'h0)] && wire1[(1'h1):(1'h0)]) : reg15[(4'h8):(3'h7)]) : (($unsigned(reg149) ?
                      reg8[(4'hf):(2'h3)] : $signed(wire2)) ?
                  wire0[(5'h14):(5'h14)] : $signed(reg149[(1'h1):(1'h0)]))));
          reg156 <= (|(($signed(reg149) ? $signed(wire0) : reg12) ?
              $unsigned($unsigned((wire147 ?
                  (8'hb7) : reg15))) : $signed({(reg7 >>> wire0),
                  wire18[(4'h9):(3'h5)]})));
        end
      else
        begin
          reg150 <= $unsigned(((reg13 ?
              $signed($unsigned(reg150)) : $signed(reg7[(2'h3):(2'h2)])) == $signed(wire147[(3'h5):(1'h0)])));
          if (reg11)
            begin
              reg151 <= $unsigned(reg15);
              reg152 <= $signed($unsigned($unsigned(reg8[(2'h2):(1'h0)])));
              reg153 <= ((8'hbd) ?
                  ($signed((~^$unsigned(reg10))) ?
                      ($unsigned($unsigned(reg11)) <<< $unsigned((~|reg5))) : (8'hb0)) : wire3);
              reg154 <= $unsigned($signed((8'ha3)));
              reg155 <= $signed(reg155[(2'h2):(1'h1)]);
            end
          else
            begin
              reg151 <= $unsigned((reg14[(1'h1):(1'h0)] >>> $unsigned(wire18[(4'hc):(2'h2)])));
              reg152 <= {$unsigned(reg6[(2'h2):(2'h2)]),
                  (reg10[(4'hb):(2'h3)] ?
                      {$unsigned(reg151[(3'h5):(2'h3)]),
                          $unsigned((reg13 >>> reg151))} : ($unsigned((wire0 ?
                          reg11 : reg12)) ^~ $unsigned(wire147[(4'hc):(4'hc)])))};
              reg153 <= (8'hb7);
            end
          reg156 <= reg13[(4'he):(4'h8)];
          reg157 <= (~^$unsigned($signed($signed($signed(reg5)))));
        end
      if ((8'hb4))
        begin
          reg158 <= reg150[(4'h8):(2'h3)];
          reg159 <= $unsigned(reg157[(3'h4):(1'h1)]);
          reg160 <= wire4;
          reg161 <= (+$signed((+{reg17[(5'h11):(4'h9)], (-reg12)})));
        end
      else
        begin
          if ($signed(($unsigned(wire0) ?
              {reg8,
                  $signed((wire2 * reg16))} : (wire4[(2'h3):(2'h3)] != (7'h43)))))
            begin
              reg158 <= ({(((reg6 ^~ reg17) >> wire1[(2'h3):(2'h2)]) ?
                      $signed((wire3 ?
                          reg11 : reg156)) : $signed($signed(wire147))),
                  (reg17[(2'h2):(1'h1)] <<< $signed((~|reg12)))} > reg8[(4'hd):(4'hc)]);
              reg159 <= reg17[(4'h8):(3'h4)];
              reg160 <= $unsigned((($signed((^reg153)) || $unsigned(reg9)) ~^ (-{(reg10 ?
                      reg17 : reg11),
                  (8'hb2)})));
              reg161 <= wire1;
              reg162 <= reg152[(4'h9):(3'h7)];
            end
          else
            begin
              reg158 <= wire2[(4'h9):(1'h0)];
              reg159 <= reg9;
              reg160 <= (+$signed((($signed(reg10) < (reg11 >> reg5)) ?
                  reg157[(4'hb):(4'hb)] : (((8'h9f) ? reg156 : wire1) ?
                      (wire147 ^ reg10) : wire18))));
              reg161 <= ($unsigned((reg160 << $signed(reg5))) ?
                  (~reg10) : reg11);
              reg162 <= (&reg161);
            end
          reg163 <= (((($unsigned((8'hb5)) ? reg157 : (reg14 ^ reg149)) ?
                  {(reg16 ? reg160 : (8'ha9)),
                      ((8'hb2) ?
                          reg17 : reg158)} : reg159) - {reg155[(2'h2):(1'h1)],
                  $signed($unsigned(wire0))}) ?
              (^~(^~$signed((reg161 ?
                  (8'hab) : reg13)))) : {((reg155[(1'h0):(1'h0)] <= (reg157 ?
                          reg15 : reg161)) ?
                      (~^(reg12 ? (8'hbc) : reg160)) : reg10),
                  {((wire3 >= reg162) ? reg13 : {reg154, reg7}),
                      $signed(wire1[(4'h9):(2'h3)])}});
          reg164 <= (-(8'hb9));
          reg165 <= $unsigned($signed($signed(reg14)));
        end
    end
  assign wire166 = {({(|(reg6 ^~ wire18))} != (+(reg160[(3'h7):(3'h7)] ?
                           reg157 : $signed(reg156))))};
  assign wire167 = reg17[(5'h11):(3'h6)];
  always
    @(posedge clk) begin
      reg168 <= reg153;
    end
  assign wire169 = ($signed(reg153) ?
                       reg154 : $unsigned((reg6 ?
                           $signed($signed(reg162)) : $signed($signed(reg7)))));
  assign wire170 = $signed((((~^$signed(reg8)) ^~ ((+reg168) ?
                       $unsigned(reg10) : reg11[(3'h5):(2'h2)])) << ((+$unsigned(reg8)) >>> reg9)));
  assign wire171 = wire2;
endmodule

module module19
#(parameter param146 = (((8'h9e) ^ (((8'ha2) ? {(8'hb7), (8'hb3)} : (!(8'h9f))) ? {((8'hba) ? (8'ha9) : (8'hbd)), ((7'h41) <<< (7'h43))} : (((8'hb9) ? (8'hbf) : (8'ha7)) ? {(8'hb3)} : ((8'hab) || (8'hbc))))) - (((-(&(8'ha3))) ~^ (((7'h40) ? (8'ha3) : (8'hb8)) ? ((8'hac) << (8'ha9)) : (~|(8'hab)))) ~^ (!((8'hb7) ^~ (|(8'ha1)))))))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire145;
  wire [(5'h12):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire143;
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  assign y = {wire145,
                 wire57,
                 wire26,
                 wire25,
                 wire59,
                 wire60,
                 wire93,
                 wire95,
                 wire98,
                 wire99,
                 wire103,
                 wire143,
                 reg102,
                 reg101,
                 reg100,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire25 = wire21[(3'h6):(2'h2)];
  assign wire26 = $unsigned((-(($signed(wire21) ?
                      (8'hbd) : wire24[(1'h0):(1'h0)]) != ($signed(wire25) ?
                      (wire21 ? wire25 : wire22) : $unsigned(wire23)))));
  module27 #() modinst58 (wire57, clk, wire21, wire22, wire20, wire24, wire26);
  assign wire59 = $signed($signed((wire57[(3'h6):(1'h1)] ?
                      $signed((wire57 ?
                          wire23 : wire22)) : wire23[(3'h4):(2'h3)])));
  assign wire60 = wire25[(1'h0):(1'h0)];
  module61 #() modinst94 (wire93, clk, wire25, wire23, wire21, wire57);
  assign wire95 = $signed({wire22[(3'h5):(2'h2)], (^wire57)});
  always
    @(posedge clk) begin
      reg96 <= $signed(((-$signed((~wire95))) << $signed(wire95[(3'h5):(2'h3)])));
      reg97 <= (wire20[(3'h6):(3'h4)] ?
          ({(wire95[(3'h5):(1'h1)] & wire23), {(wire24 ? wire59 : wire57)}} ?
              ($signed((reg96 ?
                  reg96 : wire25)) == $signed((wire95 - wire22))) : ((wire24[(4'h9):(3'h6)] ?
                  ((8'ha6) | reg96) : (wire60 ^~ wire20)) && (wire22[(3'h7):(3'h6)] < wire22[(4'h8):(4'h8)]))) : (~&$signed(wire24)));
    end
  assign wire98 = wire26[(4'h9):(3'h6)];
  assign wire99 = wire60[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg100 <= (-({(wire20[(3'h6):(2'h2)] ?
                  {wire25, wire20} : $unsigned(wire99))} ?
          ((&(reg97 || wire21)) ?
              ($signed(wire24) ?
                  $signed((8'hae)) : {wire60, wire59}) : ((wire24 ?
                      wire24 : wire21) ?
                  {wire24} : (8'hbb))) : $unsigned((~(wire25 + (8'haa))))));
      reg101 <= $signed((^wire21));
      reg102 <= $unsigned($unsigned(($unsigned(wire59) ?
          wire98 : {wire20, (wire23 >> wire20)})));
    end
  assign wire103 = (+{(-((~(8'ha7)) == (~wire26))), wire25});
  module104 #() modinst144 (.wire106(wire22), .y(wire143), .wire108(reg97), .wire109(wire59), .wire105(reg101), .wire107(wire20), .clk(clk));
  assign wire145 = $signed($unsigned(wire95));
endmodule

module module104
#(parameter param141 = (-(((&((8'ha0) ? (8'h9f) : (8'ha7))) >>> (~|((8'hbe) > (8'hbf)))) == (((~&(8'hae)) >>> ((8'ha8) ? (8'ha0) : (8'hb9))) <<< (|(~^(8'hb4)))))), 
parameter param142 = ((((+(param141 <= param141)) ? {(|param141)} : {param141}) ? param141 : (&((param141 ? param141 : param141) ? (param141 < param141) : (~|param141)))) != (param141 != param141)))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire109;
  input wire [(5'h12):(1'h0)] wire108;
  input wire [(5'h12):(1'h0)] wire107;
  input wire [(5'h12):(1'h0)] wire106;
  input wire [(5'h10):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(3'h6):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire116;
  wire [(4'hd):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire110;
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire136,
                 wire135,
                 wire134,
                 wire124,
                 wire123,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg138,
                 reg137,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire110 = wire105;
  assign wire111 = $signed(wire106);
  assign wire112 = ((~|(~|(~&$signed(wire108)))) ?
                       $unsigned(wire109) : {({wire106,
                               (wire108 ? (7'h41) : wire109)} <<< wire105)});
  assign wire113 = (!((($signed(wire107) ? $unsigned(wire108) : wire108) ?
                       $signed(wire111) : wire109) + ((wire107[(1'h1):(1'h0)] > (-wire106)) ?
                       ((&wire108) ?
                           $unsigned((8'hb7)) : wire107[(3'h7):(2'h3)]) : $signed({wire109}))));
  assign wire114 = $signed($unsigned(wire105));
  assign wire115 = wire106;
  assign wire116 = (~((wire110[(3'h5):(2'h2)] << wire110[(2'h2):(1'h1)]) <<< wire114[(2'h2):(1'h1)]));
  assign wire117 = ((&$signed((^wire112))) ?
                       wire110[(1'h1):(1'h0)] : wire106[(4'he):(4'ha)]);
  assign wire118 = (wire115[(2'h3):(1'h0)] - (|$signed(wire106[(4'hd):(2'h2)])));
  assign wire119 = wire106[(4'h8):(2'h2)];
  assign wire120 = {((^((~wire113) ?
                           $signed(wire114) : wire107)) - $signed((-(wire119 <<< (8'haa)))))};
  always
    @(posedge clk) begin
      reg121 <= wire107[(3'h5):(2'h3)];
      reg122 <= wire120[(2'h2):(1'h1)];
    end
  assign wire123 = wire113;
  assign wire124 = $unsigned((wire117[(2'h2):(1'h0)] ?
                       ((&{wire113}) <<< wire108[(4'hf):(4'hd)]) : $unsigned(wire117)));
  always
    @(posedge clk) begin
      if ((^~$unsigned((($unsigned(wire111) + (wire110 > wire123)) <<< wire105))))
        begin
          reg125 <= ($signed($unsigned(((-wire114) >= wire108[(3'h4):(2'h2)]))) ~^ ($unsigned({wire111[(2'h2):(2'h2)],
              (reg121 >= wire112)}) >>> $unsigned((&wire119[(2'h3):(1'h1)]))));
          reg126 <= $signed($unsigned(wire123[(4'hb):(4'hb)]));
          if ($unsigned(wire115[(4'hc):(1'h0)]))
            begin
              reg127 <= (~^wire105);
              reg128 <= ((wire112 ?
                  (!$signed(((8'had) ?
                      wire111 : wire109))) : $unsigned((wire120[(3'h5):(2'h2)] ?
                      (reg126 ~^ (8'h9c)) : wire118[(1'h0):(1'h0)]))) >> (wire112[(2'h2):(2'h2)] ?
                  {(wire114[(3'h5):(1'h1)] ^ (wire105 - wire108))} : wire112[(1'h0):(1'h0)]));
            end
          else
            begin
              reg127 <= ($signed($signed((wire105 ?
                  reg126[(2'h2):(1'h1)] : $signed(wire105)))) < wire111[(1'h0):(1'h0)]);
            end
          reg129 <= $unsigned((^~wire113));
        end
      else
        begin
          reg125 <= {$unsigned(reg128[(4'hb):(4'h9)])};
        end
      reg130 <= $signed($unsigned(({$signed(reg121), (&wire110)} ?
          wire117[(3'h4):(1'h1)] : $unsigned($unsigned(wire114)))));
      reg131 <= {(wire120 ?
              wire123 : (wire120 ?
                  $signed((~^wire117)) : (reg121[(4'he):(4'hb)] * (~|reg128))))};
      reg132 <= ((wire117 ?
              (^~wire110) : $unsigned((reg129 + ((8'hbc) ?
                  (8'hb2) : reg127)))) ?
          ($unsigned($signed($unsigned(wire119))) ?
              wire123 : $signed({(8'hbf),
                  ((8'haf) ? reg129 : wire111)})) : {reg131,
              (^~$unsigned($unsigned(wire118)))});
      reg133 <= (($signed($signed((wire111 ? wire116 : wire111))) ?
              $unsigned(wire116[(5'h11):(1'h0)]) : (wire124[(4'hb):(4'h8)] <= reg122[(3'h7):(3'h5)])) ?
          $unsigned((&(wire107[(4'hf):(4'hc)] ?
              $unsigned((7'h41)) : (~|reg125)))) : (~$unsigned((!(|wire112)))));
    end
  assign wire134 = wire120;
  assign wire135 = wire105;
  assign wire136 = $signed(((^~wire135[(4'he):(4'h9)]) && (wire123[(4'ha):(4'h8)] * wire117)));
  always
    @(posedge clk) begin
      reg137 <= reg122[(5'h12):(5'h11)];
      reg138 <= $signed((~&(8'hb8)));
    end
  assign wire139 = $signed(((&{$signed(reg121)}) ?
                       (~^(wire120[(2'h2):(1'h0)] ?
                           (reg131 ? wire109 : wire110) : (wire116 ?
                               (7'h44) : wire135))) : {(^(^~wire119))}));
  assign wire140 = reg126[(2'h3):(1'h0)];
endmodule

module module61
#(parameter param92 = {(8'ha2)})
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire65;
  input wire signed [(4'h8):(1'h0)] wire64;
  input wire signed [(4'hd):(1'h0)] wire63;
  input wire signed [(5'h10):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
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
                 (1'h0)};
  assign wire66 = ($unsigned(($unsigned((wire63 & wire65)) ?
                      ($signed(wire63) ?
                          {wire63} : $unsigned(wire65)) : $signed((wire63 ?
                          wire63 : wire65)))) * $signed($unsigned($unsigned({(8'ha4),
                      wire62}))));
  assign wire67 = ({($signed((wire62 ?
                              wire64 : wire63)) <= (!wire63[(1'h1):(1'h0)]))} ?
                      (+(|(wire63[(1'h0):(1'h0)] ?
                          (wire62 == (8'ha0)) : wire62))) : ($signed($unsigned(((8'hac) ?
                          wire62 : wire63))) * (|(!wire65[(5'h10):(4'h8)]))));
  assign wire68 = $signed(wire66[(3'h5):(3'h5)]);
  assign wire69 = $signed($unsigned($signed(wire67[(1'h0):(1'h0)])));
  assign wire70 = $unsigned($unsigned(wire68[(3'h5):(1'h1)]));
  assign wire71 = $signed({wire69, wire65});
  assign wire72 = wire64[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg73 <= (($unsigned($signed((-wire71))) ?
          ({(wire66 ? wire72 : (8'hb5)), $signed(wire63)} ?
              wire72 : $signed((wire64 ?
                  wire72 : wire62))) : wire66[(4'h9):(2'h2)]) <<< $unsigned((|((wire63 > wire67) | wire63[(1'h0):(1'h0)]))));
      reg74 <= (^(({(~^wire70), (~|(8'hb9))} ?
          {$unsigned(wire69), (wire67 ? wire66 : wire65)} : ((wire72 | wire68) ?
              wire70[(2'h3):(1'h0)] : (wire64 ?
                  wire68 : wire70))) * $unsigned(($signed(wire65) ?
          wire68[(3'h4):(1'h0)] : {wire66, wire71}))));
    end
  always
    @(posedge clk) begin
      if ($unsigned(((!$unsigned(wire67)) ?
          wire62[(1'h0):(1'h0)] : (((wire66 ? reg73 : wire66) ?
                  {wire62} : ((8'hb3) == wire64)) ?
              ((wire70 ? wire65 : reg73) != {wire69,
                  wire63}) : reg74[(4'ha):(4'h8)]))))
        begin
          reg75 <= ((~(wire66[(4'h9):(1'h0)] ? wire65 : (!wire70))) ?
              ((8'haa) ? wire65 : {$unsigned((&wire68))}) : $signed(wire63));
          reg76 <= (7'h43);
          if ({reg74[(4'hb):(3'h4)]})
            begin
              reg77 <= (^(((~|(wire65 ?
                      reg74 : (8'hba))) != $unsigned((wire64 >= wire66))) ?
                  $unsigned({{(8'ha6), wire72}, (wire72 ^~ wire65)}) : (reg73 ?
                      reg73[(4'hc):(2'h3)] : wire67[(1'h1):(1'h0)])));
              reg78 <= (wire68 ?
                  $unsigned(({wire68, {reg73}} ?
                      ((~reg75) ?
                          ((8'hb4) << reg73) : $signed(wire68)) : ($unsigned(wire65) ?
                          (wire65 ? wire70 : wire69) : (wire71 ?
                              wire71 : wire68)))) : (^{({wire65, wire67} ?
                          reg74 : $unsigned(wire64))}));
              reg79 <= wire66[(3'h5):(2'h2)];
            end
          else
            begin
              reg77 <= wire72;
              reg78 <= ($unsigned(($signed((^wire68)) ?
                  ({wire64} <= {reg73,
                      (7'h40)}) : $unsigned(wire70[(1'h0):(1'h0)]))) ^~ ($signed(($unsigned(wire71) ?
                      reg74 : wire70)) ?
                  $signed((~|$signed(wire72))) : $unsigned({(wire62 <<< (8'hbb))})));
              reg79 <= wire69;
              reg80 <= (($unsigned((^wire62)) < ($signed((!reg73)) <= ((&wire62) ?
                  (^~wire69) : $signed(reg73)))) >> ($unsigned(wire63[(4'h9):(2'h3)]) ?
                  $signed(wire66) : $unsigned($signed($unsigned(reg77)))));
            end
          if ($unsigned(((|wire65[(3'h4):(3'h4)]) ^ (|$unsigned((wire62 ?
              wire70 : (8'hbe)))))))
            begin
              reg81 <= (reg80[(3'h4):(1'h1)] ?
                  $unsigned((wire62 > $unsigned($signed(wire71)))) : wire70[(2'h2):(1'h0)]);
              reg82 <= (+$signed($unsigned(({(8'ha6)} ?
                  (~|wire72) : (wire65 & reg77)))));
              reg83 <= $unsigned(((8'hbf) ?
                  $unsigned(((8'ha9) ?
                      $unsigned(wire65) : (reg74 ? wire66 : reg75))) : wire63));
            end
          else
            begin
              reg81 <= (reg76 < {($unsigned((wire64 + wire68)) >= (+$unsigned(reg73)))});
              reg82 <= reg83[(5'h11):(1'h0)];
              reg83 <= $signed((|wire67));
              reg84 <= (wire67 ?
                  {(~&(wire66[(1'h1):(1'h1)] ? reg75 : reg79)),
                      $unsigned(wire71)} : $signed($signed(reg75[(2'h3):(2'h3)])));
              reg85 <= $signed((reg76[(4'hb):(4'h9)] <<< $signed($unsigned(wire69[(3'h6):(3'h5)]))));
            end
          reg86 <= (+($signed($signed({wire70, (8'hae)})) ?
              $signed(reg79) : $unsigned((reg85[(2'h2):(1'h1)] ?
                  $unsigned(wire64) : (wire66 ? wire67 : wire67)))));
        end
      else
        begin
          reg75 <= ((~((|((8'ha6) ^ wire70)) ?
              ((reg82 ?
                  reg74 : wire68) ^ wire69) : $unsigned($signed(reg85)))) || {$unsigned(reg81),
              (~|((wire64 ? reg79 : (8'hb9)) ?
                  $signed(wire71) : {reg74, reg76}))});
        end
    end
  assign wire87 = (|wire62);
  assign wire88 = $signed($unsigned($signed($unsigned($unsigned(reg84)))));
  assign wire89 = reg73;
  assign wire90 = (~&reg84[(3'h6):(3'h6)]);
  assign wire91 = (reg80[(2'h2):(2'h2)] >>> (reg85 ?
                      $signed($signed({reg82,
                          wire67})) : (reg77[(3'h6):(2'h3)] ?
                          reg74 : (8'hb8))));
endmodule

module module27
#(parameter param55 = ({(~|(((8'hbf) | (8'h9e)) ? (|(7'h44)) : (^~(8'h9d))))} ~^ {{(((8'hbe) ? (8'ha1) : (8'h9c)) ? ((8'hab) ? (8'ha2) : (8'hb7)) : (7'h43)), (~|(8'hab))}, (|(8'haa))}), 
parameter param56 = param55)
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire32;
  input wire signed [(3'h7):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg51,
                 reg50,
                 reg49,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= (^~$signed((^((+wire32) >= wire28))));
      if ($signed({wire32, $unsigned(({(8'h9e)} >= wire28[(3'h6):(2'h3)]))}))
        begin
          reg34 <= $unsigned(((-(^~(-wire29))) & ((~(|wire29)) ?
              $unsigned(wire28[(3'h6):(1'h0)]) : (8'hb3))));
          reg35 <= (reg34[(4'hb):(3'h6)] ?
              {$unsigned($unsigned(reg34)),
                  $signed(wire32)} : (wire32[(5'h11):(3'h7)] + wire28));
        end
      else
        begin
          reg34 <= ($signed(reg34[(3'h4):(3'h4)]) == wire31[(3'h5):(2'h3)]);
          reg35 <= (-$signed($unsigned((~&{(8'hab), wire32}))));
        end
      reg36 <= wire29;
    end
  assign wire37 = $signed(wire28[(2'h3):(1'h0)]);
  assign wire38 = (~(8'h9f));
  assign wire39 = ((^wire38[(1'h1):(1'h1)]) ^~ $unsigned($signed($signed($signed(wire29)))));
  assign wire40 = (+$signed(wire28));
  assign wire41 = (((wire29[(1'h1):(1'h0)] ?
                      reg36[(3'h6):(3'h5)] : wire32) >> ((wire31 ?
                      $signed(wire37) : $signed(wire31)) | wire37[(3'h5):(1'h0)])) ~^ (+(^wire29)));
  assign wire42 = wire40;
  assign wire43 = (^~$signed($unsigned(wire30)));
  assign wire44 = $signed($unsigned(wire30[(1'h1):(1'h0)]));
  assign wire45 = ($unsigned(($signed((wire38 >>> wire37)) ?
                          ({wire40, reg35} <<< (wire29 ?
                              wire43 : wire44)) : $signed($unsigned((7'h42))))) ?
                      wire39 : wire44[(1'h0):(1'h0)]);
  assign wire46 = reg33;
  assign wire47 = $signed((~^(-(+wire45[(1'h1):(1'h0)]))));
  assign wire48 = (~&$unsigned($unsigned($unsigned((|wire46)))));
  always
    @(posedge clk) begin
      reg49 <= (reg36 ? (8'hb7) : wire47[(1'h1):(1'h0)]);
      reg50 <= (wire42[(3'h4):(1'h1)] ?
          $signed(wire29[(4'ha):(4'ha)]) : wire44[(3'h7):(1'h0)]);
      reg51 <= wire42[(3'h5):(3'h5)];
    end
  assign wire52 = (^~wire47);
  assign wire53 = $unsigned((|wire46));
  assign wire54 = {wire31[(2'h2):(2'h2)]};
endmodule
