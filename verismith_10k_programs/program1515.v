module top
#(parameter param146 = ((((-((8'hb4) ~^ (8'haf))) | (!{(8'had), (8'hac)})) ^~ ((((8'h9d) & (8'hb1)) ? ((8'hb0) ? (8'ha3) : (8'hb2)) : ((8'ha0) ? (8'hbc) : (8'ha6))) ? (7'h42) : ((-(8'hb2)) ? (&(7'h42)) : {(8'ha0)}))) ^~ ((((8'h9d) ? ((7'h40) ? (8'h9f) : (7'h40)) : ((8'hac) ^~ (8'hb5))) ? (((8'h9f) || (8'hb5)) * ((7'h42) != (8'hb1))) : (((8'hb1) ? (7'h41) : (8'hbb)) * (7'h41))) <= ({((7'h41) > (8'h9c))} ? {((8'hb3) ? (8'ha9) : (8'hb9))} : (((8'hb9) * (8'ha9)) - ((8'ha3) ? (8'ha9) : (8'haa)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(5'h15):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire126;
  wire signed [(4'hf):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire120,
                 wire119,
                 wire117,
                 wire5,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire5 = (~|wire0);
  module6 #() modinst118 (wire117, clk, wire3, wire4, wire0, wire5);
  assign wire119 = wire2;
  assign wire120 = (wire4 ?
                       $unsigned(($signed((-wire117)) ?
                           $signed((wire1 ^~ wire1)) : ($unsigned(wire5) ?
                               (wire0 ? wire5 : wire117) : {wire2,
                                   wire1}))) : (wire0 ?
                           $unsigned($unsigned((wire0 ?
                               wire0 : wire119))) : $unsigned(((wire119 ?
                                   wire1 : wire5) ?
                               wire4[(1'h0):(1'h0)] : {wire0}))));
  always
    @(posedge clk) begin
      reg121 <= $unsigned((~|((~|wire120[(4'hb):(4'ha)]) ?
          ($signed(wire5) != (wire119 | wire117)) : (&wire5))));
      reg122 <= $unsigned(wire117);
      reg123 <= wire117;
      reg124 <= wire0;
      reg125 <= (~($unsigned($unsigned(wire120)) & $unsigned((|$unsigned((8'hb1))))));
    end
  assign wire126 = $signed({wire117});
  assign wire127 = (~^{(wire3 <= $signed($unsigned(reg123)))});
  assign wire128 = (reg124[(4'hf):(3'h6)] ^~ $unsigned({((+wire0) ?
                           wire0[(2'h2):(1'h0)] : {reg123, wire4}),
                       $unsigned($unsigned(wire2))}));
  assign wire129 = $unsigned($unsigned(($unsigned((+reg122)) | wire126)));
  assign wire130 = (-reg125);
  always
    @(posedge clk) begin
      reg131 <= (7'h44);
      if ({(~reg131[(4'hd):(3'h7)]),
          (((-$unsigned((8'h9c))) >>> ((7'h43) + $unsigned(wire1))) ?
              (~^($signed(wire4) || $signed((8'hb2)))) : ($signed($unsigned(reg123)) || ($signed((8'haf)) < (+wire130))))})
        begin
          reg132 <= $unsigned((7'h42));
          reg133 <= reg131[(4'ha):(2'h2)];
          reg134 <= reg125[(1'h0):(1'h0)];
          reg135 <= (-(~&(+(reg132 ? {(8'h9f)} : reg131[(1'h1):(1'h1)]))));
          reg136 <= (!reg122[(5'h11):(1'h1)]);
        end
      else
        begin
          reg132 <= wire1;
          if ((wire128[(3'h6):(1'h0)] || {(^~(wire3[(4'h8):(2'h2)] ?
                  (~^reg124) : {wire1})),
              {($unsigned((8'hb9)) ?
                      (reg134 ? (8'hac) : reg121) : (~(8'hb8)))}}))
            begin
              reg133 <= (((^~$signed($signed(reg132))) != $signed((wire1[(1'h1):(1'h1)] ~^ (reg125 != (8'hb6))))) ?
                  ($unsigned(($unsigned(wire127) ?
                      wire128 : (&(8'ha8)))) < $unsigned({(^~reg133),
                      (^wire128)})) : reg134[(1'h0):(1'h0)]);
              reg134 <= $signed($signed($unsigned($unsigned((reg122 ?
                  wire1 : (8'hba))))));
              reg135 <= (($signed({(reg125 ? reg132 : (8'haa))}) + wire4) ?
                  reg136 : {reg136[(4'hd):(4'hc)]});
            end
          else
            begin
              reg133 <= reg134[(2'h2):(2'h2)];
              reg134 <= $signed(({$unsigned((+reg133))} < wire126));
              reg135 <= reg131;
              reg136 <= $unsigned(((&(^~reg134)) >= (reg136[(4'h8):(3'h6)] < (wire119 ?
                  (~^reg133) : (wire4 >> wire2)))));
            end
        end
      if ((~&reg134))
        begin
          reg137 <= wire127[(4'h8):(1'h0)];
        end
      else
        begin
          reg137 <= wire5[(4'hb):(1'h1)];
          if ($signed($signed(wire129[(3'h4):(1'h1)])))
            begin
              reg138 <= $unsigned(((~^(8'hb8)) ?
                  $unsigned((|$unsigned(wire126))) : (((wire1 ?
                      wire128 : (8'ha3)) && (wire2 ?
                      reg122 : reg122)) < wire5)));
              reg139 <= wire126[(4'ha):(1'h1)];
            end
          else
            begin
              reg138 <= (wire1 ?
                  wire5 : ($signed((^(+(8'h9d)))) ?
                      ($signed(reg125[(1'h1):(1'h1)]) <= ($signed(reg124) ~^ {reg132,
                          reg124})) : $signed($signed(reg133))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg140 <= ((wire129[(3'h4):(1'h1)] <= (wire4[(2'h2):(1'h1)] << (reg137[(4'he):(4'h9)] >> wire3[(3'h7):(1'h1)]))) >> ({wire129[(2'h3):(2'h3)]} * (~^$signed((reg135 ?
          wire3 : reg132)))));
      reg141 <= (+$signed($signed({(~|wire5), $signed(wire128)})));
      reg142 <= $unsigned(reg136);
      reg143 <= $unsigned(($signed((!(8'ha8))) ?
          reg137 : wire4[(3'h6):(2'h3)]));
    end
  assign wire144 = ($unsigned((reg134[(1'h1):(1'h1)] && (-(wire2 ?
                       reg125 : (7'h41))))) - ({$signed((wire2 ?
                               reg121 : reg123))} ?
                       reg136 : ({$signed(wire127)} ?
                           (8'ha3) : reg131[(4'h8):(4'h8)])));
  assign wire145 = reg133[(1'h1):(1'h1)];
endmodule

module module6
#(parameter param115 = (~^((~^(((8'ha7) ? (8'haa) : (8'hb9)) ? {(8'hb9), (8'h9d)} : ((8'hb8) ? (7'h44) : (8'hb2)))) ? {(~^((8'hb0) ? (8'ha8) : (8'had)))} : (8'ha9))), 
parameter param116 = {(((!(param115 <= param115)) ^ ((|param115) * (^param115))) ? (&(|(param115 >= param115))) : (((8'h9d) ? (param115 ? param115 : param115) : (param115 ? param115 : param115)) ? ((&(8'h9c)) ? (param115 ^~ param115) : param115) : (~&param115))), (~&(param115 ? ({(8'hb4), (8'hb9)} ? param115 : {param115, param115}) : (|(param115 || param115))))})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h266):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(5'h14):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire11;
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire84,
                 wire83,
                 wire81,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire11,
                 reg105,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = $unsigned((-$signed(wire8[(3'h5):(3'h5)])));
  always
    @(posedge clk) begin
      if (($unsigned(wire11[(3'h6):(1'h0)]) ?
          ($unsigned(wire11[(3'h5):(3'h4)]) > (~|{(~^wire7)})) : wire7[(3'h4):(3'h4)]))
        begin
          if (($signed(wire8) ?
              (|$signed($signed((wire11 ? (8'hb2) : wire9)))) : (wire9 ?
                  (8'hbc) : $unsigned({wire7[(3'h5):(3'h5)]}))))
            begin
              reg12 <= $signed($unsigned((($signed(wire8) | (wire10 && wire11)) || {$signed((8'hbd)),
                  wire10})));
              reg13 <= $unsigned(wire8);
              reg14 <= {$signed((8'ha1))};
              reg15 <= {wire9,
                  ((!$signed((^~wire7))) ?
                      (((wire8 ?
                          reg12 : reg13) & (^wire9)) ^~ ($unsigned(reg14) > $unsigned(wire8))) : ({reg12[(4'hd):(1'h0)],
                              $unsigned(wire7)} ?
                          {$unsigned(reg13),
                              $signed(wire8)} : $unsigned(wire10[(2'h2):(1'h1)])))};
              reg16 <= (($unsigned(reg15[(3'h6):(1'h1)]) ?
                      $signed(reg13[(3'h5):(1'h1)]) : wire8) ?
                  $signed(($signed($signed((8'ha8))) ^~ $signed(wire7))) : (((((8'hb9) ?
                          reg13 : wire11) ?
                      $signed(reg14) : wire7[(3'h5):(1'h0)]) >>> ($unsigned(wire7) ?
                      reg13 : (|(8'h9e)))) && $signed(reg14[(4'h8):(1'h1)])));
            end
          else
            begin
              reg12 <= $unsigned($signed((^~wire7[(1'h0):(1'h0)])));
              reg13 <= $signed((~$signed(($signed((8'hb3)) && reg13))));
              reg14 <= $signed(((~wire10[(2'h2):(2'h2)]) >> wire9[(3'h7):(2'h2)]));
            end
          reg17 <= ((^~((~$unsigned(wire10)) & (reg16[(4'hd):(2'h2)] >= wire9[(3'h7):(2'h2)]))) - $unsigned($signed({{reg13,
                  reg13},
              ((7'h43) == wire8)})));
        end
      else
        begin
          reg12 <= {reg17[(4'he):(3'h6)], reg14};
        end
      reg18 <= $signed((reg13 ?
          ((|$signed(wire8)) ^~ {$signed((8'hb1)), (+reg16)}) : (((wire8 ?
                  wire11 : reg13) ?
              (!(8'hb6)) : wire9) >> $signed(reg14[(4'he):(2'h3)]))));
      reg19 <= $signed($unsigned($signed(({wire11} ?
          $unsigned(reg12) : reg15[(1'h0):(1'h0)]))));
      reg20 <= (reg18[(2'h3):(2'h3)] ?
          reg19[(2'h3):(2'h3)] : {reg16[(4'he):(3'h5)],
              ($signed((~&wire11)) ?
                  wire11[(3'h5):(2'h3)] : reg15[(4'hb):(4'ha)])});
    end
  always
    @(posedge clk) begin
      reg21 <= $unsigned(reg15[(2'h2):(1'h1)]);
      reg22 <= reg14[(4'h8):(4'h8)];
    end
  assign wire23 = (reg22[(3'h6):(3'h6)] ? (&{reg13}) : (^~reg15));
  assign wire24 = ($unsigned($unsigned(($signed(wire9) ?
                      reg16 : reg13))) >= $unsigned($signed({$unsigned(wire9),
                      reg19[(1'h1):(1'h0)]})));
  assign wire25 = wire9;
  assign wire26 = $unsigned(($unsigned({$signed(reg17),
                          wire10[(3'h6):(3'h6)]}) ?
                      $unsigned(wire11) : (~$unsigned(reg17[(2'h3):(1'h1)]))));
  module27 #() modinst82 (wire81, clk, reg19, reg12, reg15, reg20);
  assign wire83 = (8'ha6);
  assign wire84 = wire23;
  always
    @(posedge clk) begin
      if ($signed((reg22 <= $signed(reg13))))
        begin
          reg85 <= $signed($signed($signed($signed((wire84 ?
              reg13 : (8'hbb))))));
          reg86 <= {(~|(^{wire26[(2'h3):(1'h0)], (&wire23)})),
              reg15[(4'hd):(4'h9)]};
        end
      else
        begin
          reg85 <= {(wire81[(2'h2):(1'h0)] || {($unsigned(wire10) ?
                      {reg17, wire9} : {reg19, reg21}),
                  ((reg13 ? wire9 : reg20) ? {reg18} : $unsigned(reg16))}),
              ({$signed((wire7 ? reg21 : wire84))} || reg22)};
          reg86 <= (8'ha0);
        end
      if ((|{((reg19 ? (~^wire9) : (|(8'hb1))) & $signed(reg16)),
          $unsigned(wire24[(3'h6):(1'h1)])}))
        begin
          if (wire23)
            begin
              reg87 <= $unsigned((~$signed($unsigned({wire24}))));
            end
          else
            begin
              reg87 <= wire81[(3'h7):(1'h0)];
              reg88 <= $unsigned(($signed(wire26[(2'h2):(1'h1)]) ~^ (|reg18[(1'h0):(1'h0)])));
              reg89 <= {$signed(($unsigned(wire7) ?
                      $signed((wire7 ^ (8'hb0))) : wire9)),
                  wire26[(1'h1):(1'h0)]};
              reg90 <= $signed(wire25[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg87 <= reg20[(4'he):(4'h9)];
          if ((($unsigned((reg14 | reg14[(4'hc):(3'h7)])) <= wire84) ?
              (~&($signed({reg12, wire23}) ?
                  $signed({wire24, wire8}) : (((8'ha2) >> wire81) ?
                      wire23[(3'h6):(3'h6)] : {wire11}))) : (wire10[(2'h2):(1'h1)] ?
                  reg12[(5'h10):(4'ha)] : $unsigned($unsigned((reg17 ?
                      wire7 : reg14))))))
            begin
              reg88 <= $unsigned(($signed($signed(((8'ha8) ~^ reg16))) ?
                  wire25[(1'h0):(1'h0)] : reg18));
              reg89 <= {$unsigned($unsigned((reg90[(2'h2):(1'h0)] && (wire23 && wire81)))),
                  $unsigned($signed($signed($signed(reg13))))};
              reg90 <= $unsigned(reg21);
              reg91 <= $signed(reg20);
            end
          else
            begin
              reg88 <= $unsigned((!$signed((|wire10[(1'h0):(1'h0)]))));
              reg89 <= {reg90[(1'h0):(1'h0)]};
            end
        end
      if ((reg22[(3'h7):(2'h3)] ~^ $signed((wire23 - $signed(wire23[(3'h4):(1'h1)])))))
        begin
          if (($signed(wire84) ?
              wire9[(2'h2):(1'h1)] : $signed((!reg15[(4'ha):(1'h1)]))))
            begin
              reg92 <= (reg22 ?
                  wire10[(3'h4):(2'h3)] : ($signed((8'hae)) ?
                      wire23 : (~(reg86[(3'h6):(2'h2)] ?
                          $unsigned(reg86) : (&(8'had))))));
              reg93 <= (~^$signed({(&reg14[(5'h13):(1'h0)])}));
              reg94 <= wire8[(4'hc):(4'h8)];
              reg95 <= $unsigned(wire26);
              reg96 <= reg17[(5'h10):(1'h0)];
            end
          else
            begin
              reg92 <= $signed(($unsigned($unsigned((+wire24))) << (wire8[(2'h2):(1'h1)] >> $unsigned($unsigned(reg12)))));
            end
          reg97 <= $signed(($signed(($signed(reg14) ?
              (wire25 ? (7'h41) : reg88) : {reg18})) && (reg18[(1'h1):(1'h0)] ?
              $signed((|reg17)) : {(&(8'ha0)), {reg89}})));
          if (reg87)
            begin
              reg98 <= $signed({({$unsigned(wire7)} ?
                      reg13 : $unsigned($signed(reg14))),
                  (reg89 ? reg17 : $signed($signed(reg97)))});
              reg99 <= (((|wire9[(3'h6):(1'h1)]) ?
                  $signed($signed($signed(wire81))) : ((reg93[(2'h3):(2'h3)] ?
                          $signed(reg13) : $signed(reg12)) ?
                      reg13[(3'h4):(1'h0)] : $unsigned({(8'ha3)}))) ^~ {(~|wire24)});
            end
          else
            begin
              reg98 <= (-reg92);
              reg99 <= (+{(8'ha2)});
              reg100 <= ((($unsigned($unsigned(reg88)) && wire23) || (-(~&reg16))) ?
                  (&$signed((^~$signed(wire23)))) : ($signed(reg97[(2'h2):(1'h1)]) ?
                      (reg92 <<< $unsigned((wire26 - reg93))) : (($unsigned(reg14) ?
                              {(8'h9e)} : (reg15 ? wire23 : reg13)) ?
                          (8'hb3) : $signed($unsigned(reg22)))));
              reg101 <= reg17[(2'h2):(2'h2)];
              reg102 <= ((reg13[(1'h1):(1'h1)] ?
                  reg87 : (~($unsigned(reg93) ?
                      reg89[(2'h2):(1'h1)] : reg13))) ^~ $unsigned($unsigned(($unsigned(reg93) ?
                  (~&(8'h9d)) : (reg93 ? reg13 : reg91)))));
            end
          reg103 <= ($unsigned(($signed(((8'hab) ?
                  wire9 : (8'hbe))) || wire24[(1'h0):(1'h0)])) ?
              reg86 : (+(!$signed($unsigned(reg102)))));
        end
      else
        begin
          reg92 <= $signed($unsigned($signed($signed(reg95))));
          if ($unsigned(reg98))
            begin
              reg93 <= reg17;
            end
          else
            begin
              reg93 <= reg103;
              reg94 <= (((((reg22 ? (8'hb1) : (8'ha4)) ?
                      reg103[(2'h2):(2'h2)] : (reg93 ?
                          reg94 : reg99)) && reg97[(1'h0):(1'h0)]) ?
                  (8'had) : (~^$signed((reg98 != reg13)))) >> $signed(reg86));
            end
          reg95 <= reg103;
          if ($signed(((reg21[(4'ha):(3'h4)] ?
                  reg85[(3'h7):(1'h1)] : reg85[(3'h6):(3'h5)]) ?
              $signed($unsigned($signed(reg92))) : $unsigned({reg17[(4'hf):(4'ha)],
                  (wire25 ? wire8 : reg97)}))))
            begin
              reg96 <= ($unsigned(($unsigned({wire83, reg92}) ?
                      $signed((!reg87)) : $signed($unsigned(reg20)))) ?
                  (~&((8'ha0) ?
                      ((reg17 ? reg95 : reg18) ?
                          reg19[(3'h7):(2'h3)] : $unsigned(reg94)) : reg16)) : (8'hb6));
              reg97 <= $unsigned($signed({reg94,
                  {(reg88 && reg89), reg97[(1'h0):(1'h0)]}}));
              reg98 <= ($unsigned(reg101) ?
                  ($signed($unsigned($signed(reg99))) ?
                      $signed($unsigned($signed(reg96))) : reg97[(2'h2):(1'h0)]) : (reg18[(3'h4):(3'h4)] >= {$unsigned(reg98),
                      reg15}));
            end
          else
            begin
              reg96 <= (~(reg92[(3'h4):(2'h2)] ?
                  reg88[(2'h2):(1'h1)] : (reg90[(1'h0):(1'h0)] && (8'hb8))));
              reg97 <= wire9;
              reg98 <= ((wire23 ?
                      {((reg14 ? wire83 : (8'hbf)) + (reg13 ? reg12 : reg17)),
                          (|$unsigned(reg98))} : $signed($unsigned((reg102 ?
                          (8'hb0) : reg12)))) ?
                  reg97[(1'h1):(1'h1)] : (-wire11));
              reg99 <= $signed((($signed($signed((8'ha8))) ?
                      reg95[(4'hd):(3'h6)] : reg85[(2'h3):(1'h0)]) ?
                  $signed(reg102[(3'h7):(3'h5)]) : wire10));
              reg100 <= ((~^wire81) ? reg99[(1'h1):(1'h0)] : wire84);
            end
        end
      reg104 <= wire8;
      reg105 <= {$unsigned($unsigned($unsigned($unsigned(wire10))))};
    end
  assign wire106 = wire11;
  assign wire107 = $unsigned({(^~(reg22 >= (reg96 | wire11))), reg87});
  assign wire108 = (7'h40);
  assign wire109 = ((~^$signed(((reg90 != reg92) <<< (~&(8'hbf))))) << (wire81[(3'h6):(2'h2)] ?
                       ((+$signed(reg97)) ~^ ((!reg94) ?
                           (~|(8'ha5)) : (reg18 > reg90))) : ((+(reg20 >= wire24)) ^~ (reg21[(5'h10):(4'ha)] ?
                           (~reg98) : reg101[(2'h3):(1'h1)]))));
  assign wire110 = ($signed((reg97[(1'h0):(1'h0)] ?
                           reg21[(5'h12):(3'h4)] : ({wire107} ?
                               $signed(wire108) : wire7[(2'h2):(1'h0)]))) ?
                       $signed($signed($signed((wire84 != wire83)))) : $signed($unsigned((|{wire24}))));
  assign wire111 = wire107[(3'h4):(2'h3)];
  assign wire112 = ((^(wire11 || reg85)) ?
                       reg99[(4'h8):(1'h0)] : $unsigned({reg85[(4'h8):(2'h2)],
                           $unsigned(wire81)}));
  assign wire113 = reg97[(1'h1):(1'h1)];
  assign wire114 = ($signed((~&$signed(wire81))) ?
                       $signed({$signed((reg17 ?
                               wire10 : reg98))}) : wire26[(2'h3):(2'h3)]);
endmodule

module module27
#(parameter param80 = ((({{(8'ha1), (8'h9e)}, ((8'hbd) ? (8'ha7) : (8'hb5))} ? (((8'ha2) < (7'h44)) >>> {(8'hbc)}) : (((8'hb3) & (8'hbb)) ? ((8'h9c) << (7'h43)) : ((8'hb3) ? (7'h42) : (8'hb7)))) * ((((8'ha5) >>> (8'h9e)) ? ((7'h41) == (8'hbd)) : (~|(8'hbf))) && {((8'hab) ^~ (7'h43)), (^~(8'hb8))})) ? ({((|(8'hb5)) ? ((8'hb2) >>> (8'ha4)) : ((8'hb2) + (8'ha0))), (^~(-(8'hb8)))} ? ({((8'hbd) * (8'ha4)), ((8'ha3) >>> (7'h40))} ? (&((8'ha5) ? (8'ha8) : (8'h9d))) : (-(7'h43))) : ((((8'hbb) <= (8'ha8)) ? ((8'ha9) ~^ (8'haa)) : (^(8'haf))) <= (((8'hbd) && (8'hb4)) ? ((7'h40) ? (8'ha5) : (8'h9e)) : ((8'hb5) < (7'h43))))) : (((8'ha2) >= ((~^(7'h41)) ? {(8'h9f)} : ((8'hb9) >= (7'h41)))) ? ((8'hbe) <<< ({(8'ha4), (8'haf)} ? {(8'hb9), (8'hb6)} : (~(8'ha0)))) : ((((8'hab) ? (8'hbb) : (8'hb6)) ~^ ((8'ha5) | (8'haf))) != (((7'h42) | (8'hbc)) ^~ {(8'hae)})))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h278):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire signed [(3'h7):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire33,
                 wire32,
                 reg72,
                 reg71,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire32 = $signed((({wire31[(4'h8):(3'h7)]} ?
                      $signed((wire28 ?
                          wire29 : wire28)) : {wire31[(2'h2):(2'h2)],
                          wire28}) <<< wire30[(3'h7):(3'h4)]));
  assign wire33 = wire30;
  always
    @(posedge clk) begin
      reg34 <= wire33;
      reg35 <= {wire33[(3'h6):(3'h6)],
          {(((wire31 ? wire32 : (8'hb7)) + (+wire29)) == wire29[(1'h0):(1'h0)]),
              wire33[(3'h7):(2'h3)]}};
      if ($unsigned($unsigned($signed($unsigned($unsigned((8'hb8)))))))
        begin
          if ((({(|$unsigned(wire30))} < wire31) ?
              $unsigned(wire32[(4'hd):(4'h9)]) : reg35))
            begin
              reg36 <= $signed(((wire29[(3'h5):(1'h0)] ?
                      reg34[(3'h4):(2'h3)] : $signed(reg34[(4'hf):(4'hd)])) ?
                  wire33[(4'h8):(3'h7)] : ($signed($unsigned(reg34)) + $unsigned((wire30 < wire28)))));
              reg37 <= (~^wire33);
              reg38 <= (($signed($signed($signed(wire33))) && wire30) ^ $signed((~|(~|reg37[(4'hb):(3'h5)]))));
              reg39 <= wire33[(2'h3):(2'h2)];
            end
          else
            begin
              reg36 <= ({(~^(~&(+reg37)))} ?
                  ((8'h9c) <<< $unsigned($signed({reg39,
                      reg36}))) : reg35[(3'h4):(1'h1)]);
              reg37 <= wire30;
              reg38 <= $unsigned(reg35[(2'h2):(1'h0)]);
            end
          reg40 <= {(((wire32[(4'hd):(2'h3)] ?
                      wire31[(3'h5):(3'h4)] : (wire29 + (8'hba))) <= (~wire33)) ?
                  (8'had) : reg37),
              ($signed(reg34) == (wire28 - {(!reg39)}))};
        end
      else
        begin
          if ({wire32})
            begin
              reg36 <= reg38;
              reg37 <= reg40;
            end
          else
            begin
              reg36 <= (~reg35);
              reg37 <= $unsigned($signed((~&(-$signed((8'ha8))))));
              reg38 <= $unsigned((^~(((wire31 ?
                  wire33 : (8'hba)) < (8'hb2)) == (~$signed(wire31)))));
              reg39 <= (wire30 && wire29[(3'h5):(1'h1)]);
            end
          reg40 <= (-{reg36[(3'h6):(3'h4)]});
          reg41 <= $signed($signed(reg36));
          if (((($signed($signed(reg39)) ~^ ($signed(wire32) ?
                      (~^wire31) : (~wire31))) ?
                  reg41 : ((8'had) == wire29)) ?
              reg34 : reg39[(1'h0):(1'h0)]))
            begin
              reg42 <= (^(&$unsigned(((wire33 ? wire30 : wire28) ?
                  reg39[(4'h8):(3'h4)] : (^~reg37)))));
              reg43 <= $signed((reg37 ?
                  (^~$signed((~|wire31))) : (reg40[(2'h2):(1'h0)] >= (~&((8'hb5) ?
                      reg42 : reg37)))));
              reg44 <= {({((-(8'haa)) ?
                              {reg34, (8'hb4)} : reg39[(3'h6):(3'h6)]),
                          reg35} ?
                      $unsigned(reg43) : (!reg36))};
              reg45 <= reg37;
              reg46 <= (|reg38[(1'h1):(1'h1)]);
            end
          else
            begin
              reg42 <= reg35;
              reg43 <= (8'hb4);
              reg44 <= {reg37[(3'h6):(2'h2)]};
            end
        end
      if ($signed((^~{($signed(wire31) + (reg36 ? (8'ha1) : wire32)),
          {{(8'ha8), reg40}, (reg39 <<< reg40)}})))
        begin
          reg47 <= ((^(~($signed(reg35) ? wire31[(3'h4):(1'h1)] : (&reg39)))) ?
              (+reg44) : $unsigned((^$unsigned(wire30))));
          reg48 <= (reg43[(1'h0):(1'h0)] >= {reg42[(1'h1):(1'h1)]});
        end
      else
        begin
          if ((((wire32[(4'hd):(4'h8)] << $signed($signed(wire28))) << reg35) >> reg43))
            begin
              reg47 <= (reg45[(1'h0):(1'h0)] << (~|reg37));
              reg48 <= $unsigned(reg37[(2'h3):(2'h2)]);
            end
          else
            begin
              reg47 <= $unsigned(wire28[(3'h7):(1'h1)]);
              reg48 <= (~&(wire32[(2'h2):(1'h1)] ?
                  reg37[(3'h7):(2'h2)] : reg40));
              reg49 <= (7'h41);
            end
          reg50 <= $unsigned(($signed($signed($signed((8'h9c)))) ?
              (&wire28) : {reg40, {wire31[(4'h9):(3'h5)]}}));
          reg51 <= reg39[(2'h2):(1'h0)];
          if (($signed(reg49) ?
              $unsigned(($unsigned($signed(reg44)) - ((-wire28) < (reg45 < reg40)))) : $signed($signed((~(8'hb8))))))
            begin
              reg52 <= (-reg38[(1'h0):(1'h0)]);
            end
          else
            begin
              reg52 <= $signed($signed((-$unsigned($unsigned(reg52)))));
              reg53 <= (|$unsigned((~|{reg46[(4'hb):(3'h7)]})));
              reg54 <= (reg46 ?
                  {($unsigned((-reg36)) ?
                          ({wire31, (8'ha9)} ?
                              $unsigned(wire32) : ((8'ha3) ?
                                  reg44 : reg48)) : (+(~&(8'hac))))} : reg46);
            end
        end
    end
  assign wire55 = $unsigned((-{$unsigned(reg46), reg44[(5'h10):(4'h8)]}));
  assign wire56 = ($signed((+$unsigned((~&(8'hbc))))) ? reg54 : $signed(reg51));
  assign wire57 = reg35;
  assign wire58 = (!(reg41 ?
                      $unsigned(($unsigned((8'hb8)) ?
                          (wire32 == reg43) : reg50[(5'h11):(3'h6)])) : {((8'h9e) ?
                              reg34[(2'h3):(2'h2)] : (reg49 ? reg48 : (8'ha5))),
                          reg40}));
  assign wire59 = $unsigned(((|(8'hba)) ?
                      $unsigned($signed(wire56[(3'h6):(1'h1)])) : {reg51[(5'h11):(3'h7)],
                          $signed($signed(reg37))}));
  always
    @(posedge clk) begin
      reg60 <= (~^{$signed(reg38)});
      if ({$signed((8'hb9)), wire32})
        begin
          reg61 <= (((&{(reg41 ? reg60 : reg44), reg39}) ?
                  (!$signed((|wire59))) : (^~(-reg35[(3'h4):(1'h1)]))) ?
              (wire33[(3'h6):(3'h5)] ?
                  (~&$unsigned(reg60[(3'h4):(1'h1)])) : $unsigned(wire58)) : $unsigned(wire33[(1'h0):(1'h0)]));
        end
      else
        begin
          reg61 <= {(reg40[(4'h9):(1'h1)] ?
                  {reg45[(1'h0):(1'h0)]} : (+{(reg34 ? wire58 : wire55)})),
              (reg40[(2'h2):(1'h1)] ?
                  reg42[(3'h4):(1'h1)] : (^$unsigned((reg51 ?
                      wire29 : reg61))))};
          reg62 <= reg51[(1'h1):(1'h1)];
          reg63 <= ((^(~^(reg38 << $signed(wire32)))) && $signed(((wire28 ?
                  {reg52} : (~wire32)) ?
              $signed((reg53 ?
                  reg36 : (8'h9c))) : (reg43[(2'h2):(1'h1)] ~^ $unsigned(reg52)))));
          reg64 <= wire58[(5'h10):(4'hc)];
          reg65 <= reg39[(1'h0):(1'h0)];
        end
      reg66 <= reg43;
    end
  assign wire67 = (reg48 && reg48);
  assign wire68 = $signed($signed($signed(((reg66 >> (8'h9f)) ^ $signed(reg34)))));
  assign wire69 = {((((~&(8'hba)) & (wire59 & reg60)) ?
                          $unsigned(reg48[(2'h2):(1'h1)]) : (-(reg45 ?
                              reg42 : reg65))) > $unsigned(($unsigned(reg42) ^ (^reg60)))),
                      ({reg36, (&{(8'ha1), wire57})} ^~ ($unsigned((8'hb0)) ?
                          $signed((wire67 ? wire56 : wire57)) : ((wire67 ?
                                  wire28 : (8'hb0)) ?
                              ((8'hb5) * reg47) : $unsigned(wire30))))};
  assign wire70 = wire58[(4'ha):(4'h8)];
  always
    @(posedge clk) begin
      reg71 <= $signed(((~wire29) << (&((wire56 != reg51) ?
          (wire68 ? wire57 : reg42) : (~wire28)))));
      reg72 <= ((8'hb9) ? (&$signed($signed(reg46))) : reg65[(4'he):(2'h3)]);
    end
  assign wire73 = (reg66[(3'h6):(2'h2)] ?
                      ((+{(reg51 ? wire33 : wire67)}) ?
                          $unsigned(wire59[(1'h0):(1'h0)]) : reg42) : {(wire70 >> ((reg48 ^~ wire69) >= {wire55})),
                          ({((8'hb8) ? reg46 : wire67),
                              reg72} < ($signed(reg53) << $signed((8'hbb))))});
  assign wire74 = reg41;
  assign wire75 = $signed((((~^reg35[(1'h1):(1'h1)]) ?
                      ((wire55 ? wire28 : reg45) - ((8'had) ?
                          wire56 : wire30)) : $signed($unsigned(reg63))) - {(~|$signed(reg71)),
                      $unsigned($unsigned(wire55))}));
  assign wire76 = reg35;
  assign wire77 = $signed($signed((-{(~^reg45)})));
  assign wire78 = ($signed((reg38 ~^ (~&(reg34 & reg43)))) ?
                      ((($unsigned(reg47) ?
                                  (reg43 >>> (7'h43)) : wire76[(4'ha):(3'h7)]) ?
                              reg36[(2'h3):(2'h2)] : reg47[(2'h3):(2'h3)]) ?
                          (|reg62) : $signed((((8'ha1) ?
                              reg62 : reg44) > reg66))) : $signed({$unsigned(reg60)}));
  assign wire79 = $unsigned(reg54[(3'h7):(1'h1)]);
endmodule
