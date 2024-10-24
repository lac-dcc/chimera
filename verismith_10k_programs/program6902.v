module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire209;
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  assign y = {wire4,
                 wire9,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire116,
                 wire209,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
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
                 (1'h0)};
  assign wire4 = $unsigned(wire3);
  always
    @(posedge clk) begin
      reg5 <= {(wire4 ?
              wire4[(1'h0):(1'h0)] : ((^wire4[(1'h0):(1'h0)]) + (8'hbc))),
          $signed((wire1 ^ $signed((wire3 ? (8'had) : wire1))))};
      reg6 <= wire2[(3'h5):(2'h3)];
      reg7 <= $unsigned((~$signed(((reg6 ^~ wire4) ?
          $signed(reg6) : (^(8'ha0))))));
      reg8 <= ($unsigned(wire1) <<< (reg6[(1'h0):(1'h0)] ?
          (wire1 ?
              $signed((|wire2)) : reg5[(1'h1):(1'h0)]) : (wire4[(2'h2):(2'h2)] - wire2)));
    end
  assign wire9 = (~|({{(reg8 ? wire0 : wire4)}} ?
                     {($signed(reg5) >> wire3[(2'h3):(2'h2)]),
                         ($unsigned(reg6) - wire4)} : wire4));
  always
    @(posedge clk) begin
      if ($unsigned(reg6[(4'hb):(1'h0)]))
        begin
          if ((reg8 ?
              ({$signed(wire1)} ?
                  ((-wire0) ?
                      $signed((~^wire4)) : (~reg8)) : ((|$unsigned(reg7)) ~^ {reg7,
                      reg8})) : (8'ha8)))
            begin
              reg10 <= reg6[(3'h4):(1'h0)];
              reg11 <= (+wire1[(4'ha):(3'h7)]);
              reg12 <= {$signed((((~&reg10) ? (reg6 >= reg7) : $signed(reg8)) ?
                      $signed((reg6 ?
                          reg5 : wire1)) : ($unsigned(reg5) >>> reg5)))};
              reg13 <= reg12;
            end
          else
            begin
              reg10 <= reg7[(4'h9):(1'h0)];
            end
        end
      else
        begin
          reg10 <= reg8;
          reg11 <= $unsigned({$unsigned(((wire0 ? wire3 : reg8) ?
                  $unsigned(reg7) : $unsigned(wire2)))});
          if (((reg11[(3'h4):(3'h4)] ^ wire9[(4'hd):(4'h9)]) ?
              (!wire1[(3'h5):(1'h0)]) : wire3[(4'ha):(3'h7)]))
            begin
              reg12 <= $unsigned($unsigned($signed(reg10)));
              reg13 <= (8'ha3);
              reg14 <= {wire1};
              reg15 <= reg8[(3'h5):(1'h0)];
            end
          else
            begin
              reg12 <= (8'ha5);
              reg13 <= $signed(($unsigned($signed(reg12)) << (&reg13[(1'h1):(1'h1)])));
            end
        end
      if ($unsigned(reg14[(4'hf):(2'h2)]))
        begin
          reg16 <= ($unsigned($signed((|$signed(wire9)))) ?
              reg8 : reg11[(3'h4):(1'h1)]);
          reg17 <= (-($unsigned(reg7) ?
              (+reg8) : ($unsigned($signed(reg14)) ?
                  wire2[(4'h8):(3'h6)] : reg5[(3'h5):(1'h0)])));
          reg18 <= ((!(~|wire3[(4'hf):(3'h7)])) ? wire3[(3'h7):(2'h2)] : reg15);
          reg19 <= reg13;
        end
      else
        begin
          reg16 <= (reg18 ?
              reg6[(3'h4):(2'h3)] : $signed(((|(reg19 && reg6)) ?
                  ({(7'h40)} ?
                      reg13 : reg19[(4'he):(3'h5)]) : ($unsigned(reg8) && reg15[(1'h1):(1'h1)]))));
          reg17 <= $unsigned((!$signed((~&reg17))));
          reg18 <= reg8[(2'h2):(1'h0)];
          if ($signed((|(reg5[(3'h4):(2'h3)] && $signed((^~reg17))))))
            begin
              reg19 <= ($unsigned(((|(~&reg13)) != wire1[(1'h1):(1'h0)])) ?
                  ((reg5[(1'h1):(1'h0)] ?
                      wire1 : $signed({reg12})) | reg19) : wire9[(5'h13):(5'h12)]);
              reg20 <= $signed($unsigned({((reg5 ? (8'hb3) : reg18) + reg12)}));
              reg21 <= {(!(wire9 <= $unsigned($unsigned(reg11))))};
            end
          else
            begin
              reg19 <= ($signed($unsigned(($signed(reg14) > reg10[(5'h10):(2'h2)]))) ?
                  (-{{((8'hab) ? wire4 : reg6), (!reg20)},
                      reg18}) : wire0[(3'h4):(2'h3)]);
              reg20 <= ({$unsigned((|reg6[(3'h7):(3'h6)]))} != wire9);
            end
          reg22 <= reg7;
        end
    end
  assign wire23 = {reg7};
  assign wire24 = reg6[(4'ha):(4'h8)];
  assign wire25 = (reg18[(1'h0):(1'h0)] ?
                      {wire0[(3'h5):(3'h4)],
                          wire23[(2'h2):(1'h0)]} : (|$signed(reg22)));
  assign wire26 = $signed((+reg6));
  assign wire27 = reg21;
  module28 #() modinst117 (wire116, clk, reg17, reg19, wire27, wire1);
  module118 #() modinst210 (wire209, clk, reg21, reg7, wire27, reg5);
endmodule

module module118
#(parameter param207 = (({(-((8'h9e) + (8'hb0)))} ? ((((8'hba) ? (7'h42) : (8'had)) >= (&(8'h9e))) >= (^~((8'hb9) ~^ (7'h40)))) : (((~&(8'h9c)) > (8'h9e)) * {((8'h9c) ? (8'hac) : (8'ha2))})) ? ((~(((8'had) ? (8'h9e) : (8'hb4)) ^ (~|(8'hb3)))) < {(((8'h9c) || (8'hbc)) || {(7'h44)})}) : ((((~&(8'hae)) ? ((7'h44) ? (8'hb2) : (8'ha7)) : ((7'h42) > (7'h44))) ^ (((8'haf) ? (8'ha0) : (8'ha0)) ? {(8'hb0), (8'h9d)} : ((8'hae) != (8'hae)))) - (~^(&(^~(8'hb4)))))), 
parameter param208 = ((~(param207 + ((&param207) * (param207 ? param207 : param207)))) > ((-param207) ? ((^~param207) ? param207 : (^~{param207, param207})) : (^{(&param207), (param207 >= param207)}))))
(y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h1cc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire122;
  input wire [(5'h12):(1'h0)] wire121;
  input wire signed [(5'h14):(1'h0)] wire120;
  input wire [(3'h5):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire206;
  wire [(4'h9):(1'h0)] wire205;
  wire signed [(5'h15):(1'h0)] wire204;
  wire [(4'h8):(1'h0)] wire203;
  wire signed [(4'he):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire184;
  wire signed [(3'h7):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire157;
  wire [(2'h2):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire signed [(5'h15):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg201 = (1'h0);
  reg [(4'he):(1'h0)] reg200 = (1'h0);
  reg [(5'h12):(1'h0)] reg199 = (1'h0);
  reg [(4'h9):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire186,
                 wire184,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire146,
                 wire144,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 (1'h0)};
  assign wire123 = wire122[(4'ha):(1'h0)];
  assign wire124 = (((wire122[(4'h9):(3'h7)] ^~ {(wire119 ? wire120 : wire122),
                           $unsigned(wire123)}) ~^ wire121) ?
                       (&(wire121 && wire120)) : $signed((((~|wire122) < {wire120}) ?
                           ($unsigned(wire123) ?
                               (wire119 < wire120) : (~^(8'hbc))) : ((!wire120) >= (-wire123)))));
  assign wire125 = wire120[(5'h10):(4'hd)];
  assign wire126 = ({$unsigned(wire119[(1'h1):(1'h1)])} >= ((!(|(wire121 + wire120))) == (|(~^((7'h43) <= wire123)))));
  module127 #() modinst145 (wire144, clk, wire122, wire120, wire121, wire123);
  assign wire146 = $unsigned((-(~((wire126 != wire124) > (wire126 ?
                       wire120 : wire144)))));
  always
    @(posedge clk) begin
      reg147 <= (wire144[(3'h4):(3'h4)] | $signed($unsigned($signed(((8'hb6) < wire125)))));
      reg148 <= wire125[(1'h0):(1'h0)];
      reg149 <= $signed($unsigned({(wire122[(4'he):(4'h9)] * $unsigned(wire146)),
          wire123}));
      reg150 <= ((($unsigned((|wire144)) ?
          {$unsigned(wire120),
              (wire125 ? reg147 : wire119)} : {$unsigned(wire146),
              (-reg147)}) ~^ (+$unsigned(wire126[(4'hf):(3'h7)]))) <<< $unsigned({wire120,
          $unsigned((wire146 <<< wire146))}));
    end
  always
    @(posedge clk) begin
      reg151 <= (|(&reg147[(3'h4):(1'h1)]));
    end
  assign wire152 = (-$unsigned({wire124, (+$signed(reg149))}));
  assign wire153 = {$unsigned($signed($unsigned($unsigned(reg149)))), (8'hb6)};
  assign wire154 = wire121[(4'he):(4'h9)];
  assign wire155 = $unsigned(wire123);
  assign wire156 = (~^(~^wire152));
  assign wire157 = reg151;
  assign wire158 = $signed(((((reg149 ? wire122 : wire119) ?
                           (&wire156) : (-wire155)) & $signed({reg151,
                           wire122})) ?
                       $signed((~^wire122[(5'h12):(3'h4)])) : {$signed(wire123)}));
  module159 #() modinst185 (.wire162(wire144), .wire160(wire123), .wire163(wire158), .y(wire184), .wire161(reg151), .clk(clk), .wire164(wire121));
  assign wire186 = (~^$signed(wire123[(3'h7):(2'h3)]));
  always
    @(posedge clk) begin
      reg187 <= $unsigned(wire154[(1'h0):(1'h0)]);
      reg188 <= (wire155[(4'h9):(2'h3)] ^ ($signed($signed($unsigned(reg187))) ?
          wire186 : wire125[(1'h1):(1'h1)]));
      reg189 <= reg148;
    end
  always
    @(posedge clk) begin
      reg190 <= reg150;
      reg191 <= ((wire121[(4'he):(4'hb)] >> (wire125[(1'h0):(1'h0)] & wire124[(1'h0):(1'h0)])) + reg190);
      reg192 <= ((($signed($unsigned(wire121)) <<< $unsigned((wire146 ?
              (8'hbe) : wire123))) + $unsigned($signed(((8'hb2) | wire184)))) ?
          $signed(wire123) : wire154[(1'h1):(1'h0)]);
      if ({($unsigned((~wire155)) ^~ (~^(((8'haa) && (7'h43)) & (reg147 == reg150))))})
        begin
          reg193 <= $unsigned(wire121[(2'h2):(1'h1)]);
          if ($signed({($unsigned((^wire152)) ?
                  $unsigned(((8'ha6) < wire156)) : (wire144[(4'ha):(4'h9)] ?
                      (wire157 ? reg147 : wire186) : reg150)),
              wire119}))
            begin
              reg194 <= reg147;
              reg195 <= $signed({wire158[(2'h2):(1'h1)],
                  (^~{$signed(reg148), $signed(wire184)})});
              reg196 <= reg187;
              reg197 <= (+(~&(~|$unsigned((reg192 ? wire153 : (8'ha6))))));
            end
          else
            begin
              reg194 <= reg197;
              reg195 <= wire119[(3'h4):(2'h3)];
            end
        end
      else
        begin
          if (wire152[(5'h10):(4'hd)])
            begin
              reg193 <= ((^~((^~(wire123 ?
                  wire186 : (8'hbe))) == ($unsigned(wire156) ?
                  $signed(reg148) : (wire158 + wire155)))) << $signed((~^($unsigned(wire154) || (reg148 - wire146)))));
              reg194 <= ($signed((((wire146 != wire144) ?
                  reg188 : wire158) && (!$unsigned((8'ha6))))) < (((!$signed(wire157)) < ((~reg191) <<< (+reg150))) ?
                  (($signed(reg189) ?
                      (~^reg150) : (wire184 + wire125)) <= wire157[(1'h0):(1'h0)]) : $signed({(~^wire125),
                      wire153[(4'he):(4'hb)]})));
              reg195 <= reg148;
            end
          else
            begin
              reg193 <= ((($unsigned((wire184 ? wire123 : (8'hb4))) ?
                      $signed((reg190 ^~ reg187)) : ($signed((8'hae)) > reg192)) ?
                  {wire157[(2'h3):(1'h1)],
                      (~^wire152[(5'h10):(4'he)])} : $unsigned($signed((&reg151)))) >> (wire157[(1'h1):(1'h1)] ^~ $unsigned({{reg189}})));
              reg194 <= ({(~|(~|((8'hba) ? (8'ha9) : wire154))),
                      $signed((~$signed(reg196)))} ?
                  reg196 : (-$unsigned({(-wire154), {reg192}})));
              reg195 <= reg149[(4'hc):(3'h6)];
              reg196 <= wire152;
              reg197 <= ((((~|reg196[(3'h4):(1'h0)]) ?
                      ($signed(reg192) ?
                          (wire155 ? wire186 : reg193) : (^~reg148)) : (reg188 ?
                          {wire125, (8'hac)} : {reg196, reg147})) ?
                  wire122[(5'h12):(5'h10)] : reg191[(3'h6):(3'h5)]) & $unsigned(wire153[(5'h11):(5'h10)]));
            end
          if ((wire126[(4'hd):(4'hb)] ? reg193 : $signed($signed(wire119))))
            begin
              reg198 <= reg147;
              reg199 <= {reg198};
              reg200 <= $unsigned((({(reg199 ?
                      reg151 : wire186)} && $signed(reg187)) && {(8'hb2),
                  $unsigned((8'hbe))}));
              reg201 <= ((((8'hab) >= (!$signed(wire124))) ?
                  $signed(($unsigned(wire124) ?
                      (~^wire186) : (~|reg197))) : $unsigned($unsigned((reg192 & reg190)))) != $signed((reg149[(4'h9):(2'h3)] ?
                  reg193[(2'h2):(2'h2)] : $signed((reg147 && wire156)))));
            end
          else
            begin
              reg198 <= wire153;
            end
          reg202 <= ((^wire146[(2'h3):(2'h3)]) ?
              $signed(({{(7'h41), wire153}} ?
                  (|(reg187 ^~ wire155)) : reg149)) : $signed((~^$signed($signed(reg199)))));
        end
    end
  assign wire203 = (wire153[(3'h4):(1'h0)] ?
                       wire125[(1'h1):(1'h0)] : $unsigned({wire121}));
  assign wire204 = $signed((~|$signed($signed($unsigned(reg202)))));
  assign wire205 = reg150[(3'h5):(2'h3)];
  assign wire206 = {({(((8'hb8) ? (8'ha4) : reg147) ?
                               {(8'hb3)} : wire119[(3'h4):(1'h1)])} << ($signed(wire154[(2'h2):(2'h2)]) ?
                           {(wire186 ? (7'h42) : wire153),
                               $signed(reg151)} : (((8'hbc) == wire155) ?
                               wire186 : (~&reg193))))};
endmodule

module module28
#(parameter param114 = (((+(8'ha3)) ? (~&((8'hbd) >>> ((8'ha1) >> (8'h9e)))) : (~^(((7'h40) << (8'hb2)) ^~ (8'hab)))) ? ((!(-((8'hba) | (8'hb0)))) ? ((^~((8'hbf) ? (8'hbd) : (8'hbb))) ? ((^(7'h40)) * (+(8'hb7))) : (-((8'ha8) > (8'hb7)))) : ((~&((7'h42) ? (8'hb7) : (8'hbc))) ? {((7'h44) <<< (8'hbd))} : (~((8'haa) ? (8'hab) : (7'h44))))) : ((~^(((8'ha3) ? (8'h9d) : (8'hb9)) > ((8'hb1) + (8'hb2)))) <<< (^(|((8'hae) ~^ (8'hb5)))))), 
parameter param115 = ({param114, (+((+param114) ? (!param114) : (param114 ? param114 : (8'hbd))))} ? param114 : (8'hbe)))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire112;
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  assign y = {wire77,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire112,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire33 = ((7'h44) << ($signed(($unsigned(wire31) >> $signed((8'hb9)))) ?
                      $unsigned((^~$signed((8'hb1)))) : (wire30 ?
                          $unsigned($unsigned(wire31)) : (!(wire31 & wire30)))));
  assign wire34 = (7'h40);
  assign wire35 = ($unsigned($signed((~&wire33))) & ((~|($signed(wire29) ?
                      (~^(7'h40)) : $unsigned(wire29))) != wire29));
  assign wire36 = wire33[(4'h8):(1'h1)];
  assign wire37 = ((wire29[(2'h2):(1'h0)] ?
                      {$unsigned(wire33),
                          $signed((wire34 <= wire35))} : (-{(wire29 || wire30),
                          $unsigned(wire29)})) ^~ $unsigned($unsigned((8'hb7))));
  assign wire38 = wire37;
  always
    @(posedge clk) begin
      reg39 <= $signed((^~(wire38[(4'h8):(1'h1)] > wire38)));
      reg40 <= (wire35 * wire38);
      reg41 <= ((^$signed(((&reg40) < {reg40,
          wire30}))) >>> (wire34 ~^ $signed(((wire36 << (8'h9e)) ?
          (wire30 | (8'h9f)) : wire36))));
    end
  module42 #() modinst78 (wire77, clk, wire33, wire30, reg40, wire38);
  assign wire79 = (~&wire36);
  assign wire80 = wire33;
  assign wire81 = $unsigned((|($unsigned($unsigned(wire33)) ?
                      (wire30 >= (+reg39)) : reg39)));
  assign wire82 = wire29[(1'h1):(1'h0)];
  assign wire83 = (wire38[(4'h8):(3'h7)] ?
                      {(8'hab),
                          {((^wire81) ?
                                  wire77[(2'h2):(1'h1)] : (~^(8'hb7)))}} : (((8'h9c) * wire36) - ((~((7'h41) ?
                              wire29 : (8'h9d))) ?
                          (wire29[(1'h1):(1'h1)] ?
                              $unsigned(wire30) : (wire34 ?
                                  wire82 : wire35)) : {$unsigned(wire30),
                              (~^wire38)})));
  assign wire84 = wire82[(1'h0):(1'h0)];
  module85 #() modinst113 (wire112, clk, reg40, wire31, wire29, wire37);
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire89;
  input wire signed [(5'h15):(1'h0)] wire88;
  input wire [(4'hf):(1'h0)] wire87;
  input wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg111,
                 reg110,
                 reg109,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire90 = wire89[(1'h0):(1'h0)];
  assign wire91 = $unsigned((&(|wire86[(2'h3):(1'h0)])));
  assign wire92 = ((((&$unsigned(wire90)) ?
                          ((wire86 * wire88) ?
                              (wire90 ?
                                  (8'ha5) : wire89) : $unsigned(wire87)) : $unsigned((-wire88))) ?
                      ($unsigned($signed(wire87)) ^ $signed(wire88)) : (~&(((8'h9e) ?
                          wire90 : wire89) + wire88[(3'h6):(3'h4)]))) == ((~|(~&wire90[(2'h3):(1'h0)])) != ((~&((8'hba) ?
                          wire90 : wire87)) ?
                      ($signed((8'ha5)) <<< (~^wire89)) : {(wire90 + wire88)})));
  assign wire93 = (~$signed(($signed(wire91[(2'h3):(1'h0)]) << ($signed(wire89) * {wire90,
                      wire88}))));
  assign wire94 = (^~((($unsigned(wire93) ?
                      (wire87 ?
                          wire90 : wire88) : (wire87 > wire88)) != wire86) >> wire91));
  assign wire95 = ($unsigned((7'h43)) ~^ (+($signed($unsigned(wire91)) - ($signed(wire91) ?
                      {wire86} : ((8'hbc) <= wire93)))));
  assign wire96 = ((-(($unsigned(wire94) ?
                      {wire87} : wire87[(4'hf):(4'hc)]) <= (wire90[(1'h1):(1'h0)] ?
                      $unsigned(wire89) : (+(8'ha4))))) << wire95[(2'h2):(1'h1)]);
  assign wire97 = {(((-(~(8'ha3))) == wire87) >>> $unsigned(wire94))};
  assign wire98 = $unsigned($unsigned(wire94));
  always
    @(posedge clk) begin
      reg99 <= $signed(wire93);
      reg100 <= $unsigned({{(wire93 ? {wire88, wire98} : (~|reg99)), wire92},
          wire86});
      reg101 <= wire93[(4'ha):(1'h0)];
      reg102 <= (^wire88);
      reg103 <= {(~^$unsigned((~^wire86[(3'h4):(3'h4)])))};
    end
  assign wire104 = $unsigned((8'ha6));
  assign wire105 = $unsigned(reg102[(2'h3):(2'h3)]);
  assign wire106 = wire90[(1'h0):(1'h0)];
  assign wire107 = reg100[(3'h4):(1'h1)];
  assign wire108 = $signed($unsigned(reg101[(3'h7):(1'h1)]));
  always
    @(posedge clk) begin
      reg109 <= $signed(($signed({(+reg102)}) > wire98[(1'h0):(1'h0)]));
      reg110 <= ($signed((8'hba)) ?
          wire105[(1'h1):(1'h1)] : ($unsigned((-{reg103,
              wire98})) || wire94[(3'h4):(2'h2)]));
      reg111 <= wire88[(5'h12):(3'h4)];
    end
endmodule

module module42
#(parameter param75 = {((~|{((8'hbd) <<< (8'ha4)), (7'h41)}) ? (((~^(8'hbb)) ? (~(8'ha2)) : {(8'hbb), (8'hab)}) ? (~{(8'hb0), (8'ha7)}) : ({(8'ha2)} == ((8'hbe) ? (8'h9e) : (8'hbe)))) : ((((8'hb5) ? (8'ha9) : (8'hb1)) ? ((8'ha6) ? (8'ha2) : (8'had)) : ((8'ha4) < (8'hb7))) ^ (+(^(8'ha4)))))}, 
parameter param76 = param75)
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire46;
  input wire signed [(4'ha):(1'h0)] wire45;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire [(3'h6):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire64,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg67,
                 reg66,
                 reg65,
                 reg63,
                 reg62,
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
                 (1'h0)};
  assign wire47 = wire45;
  assign wire48 = $signed(wire43);
  assign wire49 = ((wire48[(4'hf):(4'h9)] ~^ wire48[(4'he):(1'h0)]) ?
                      (-(-(((8'hac) ? wire48 : wire46) ?
                          (~|wire43) : wire44))) : (~^wire47[(4'hd):(3'h4)]));
  assign wire50 = (-$signed((~&wire45[(2'h2):(1'h0)])));
  assign wire51 = (^(wire43 ?
                      ($signed(wire49[(2'h3):(1'h1)]) ?
                          wire45 : $signed(wire44[(1'h1):(1'h0)])) : $signed((wire44[(2'h2):(2'h2)] && $unsigned(wire48)))));
  always
    @(posedge clk) begin
      reg52 <= $unsigned(wire50);
      if ((~&(8'ha2)))
        begin
          reg53 <= (wire43[(3'h4):(2'h2)] ?
              (((|{(7'h43), wire49}) ?
                      (wire47 << ((8'hbf) ?
                          (8'ha1) : wire51)) : $unsigned($unsigned(wire47))) ?
                  wire45 : {$unsigned({(8'h9d)}),
                      (^wire50[(4'h9):(3'h4)])}) : $signed(wire46[(1'h1):(1'h1)]));
        end
      else
        begin
          reg53 <= ($signed((&reg52)) * wire47[(1'h0):(1'h0)]);
          reg54 <= $unsigned(((~^wire46) <<< {$signed((^~wire51)),
              {$unsigned(wire46), (&wire48)}}));
          reg55 <= ($signed({$signed((~^(8'hb3)))}) ?
              (~&$unsigned((reg53 ?
                  $unsigned(wire45) : reg53[(3'h7):(1'h0)]))) : ($signed(wire51) * $signed(reg54[(5'h13):(2'h2)])));
          reg56 <= (|$unsigned((|({(8'hab)} ? reg53 : wire50[(2'h3):(2'h2)]))));
          reg57 <= reg53;
        end
      if ({$signed(($unsigned($signed(wire43)) ?
              wire49 : (~wire50[(4'hc):(1'h0)]))),
          reg56[(1'h0):(1'h0)]})
        begin
          if ($signed(({{$signed(wire51), reg55}} <= wire44)))
            begin
              reg58 <= $unsigned(wire46[(1'h1):(1'h0)]);
              reg59 <= ($signed((&wire49)) ? (+(8'ha5)) : reg57[(2'h3):(1'h1)]);
              reg60 <= {wire46[(1'h0):(1'h0)]};
            end
          else
            begin
              reg58 <= wire43[(1'h0):(1'h0)];
              reg59 <= $unsigned($signed(wire48[(3'h5):(3'h5)]));
              reg60 <= ($unsigned((8'ha1)) ?
                  (-((8'hb2) ?
                      $signed($signed(reg57)) : $unsigned(reg58[(2'h3):(1'h1)]))) : $signed(wire44));
              reg61 <= {wire49[(3'h5):(2'h2)],
                  $unsigned((^~$signed(wire47[(4'he):(4'hc)])))};
              reg62 <= $unsigned((wire46 < ($signed((wire45 ?
                  wire50 : wire46)) | (~(~|wire46)))));
            end
          reg63 <= reg52;
        end
      else
        begin
          reg58 <= (((reg62[(4'ha):(4'ha)] - ($signed(wire50) ?
                      $signed(reg54) : $signed(reg58))) ?
                  wire49[(3'h5):(1'h0)] : (((reg52 & wire50) - $signed((8'ha6))) != (reg60[(4'hf):(1'h1)] ?
                      (~wire47) : (wire45 ? (8'hb2) : (7'h42))))) ?
              $signed(((reg61[(2'h2):(1'h0)] ?
                  (reg55 < reg61) : (reg61 & wire49)) >= (wire45[(4'ha):(3'h6)] ~^ (8'hba)))) : reg59[(4'ha):(4'h9)]);
        end
    end
  assign wire64 = (8'h9d);
  always
    @(posedge clk) begin
      reg65 <= (~&($signed((^~reg52[(4'hb):(4'ha)])) ?
          $unsigned((8'hb5)) : (^~$unsigned($unsigned((8'ha7))))));
      reg66 <= ($unsigned((-reg53)) ^ $signed(wire64[(1'h0):(1'h0)]));
      reg67 <= ({((~(reg62 ? wire47 : reg57)) >>> $signed((wire49 ?
              reg52 : wire44))),
          $unsigned(($unsigned(wire46) ?
              wire50[(1'h1):(1'h0)] : (&reg56)))} - reg56[(2'h2):(2'h2)]);
    end
  assign wire68 = reg56[(1'h1):(1'h1)];
  assign wire69 = ((8'hb7) ?
                      ((~&reg55) != wire45) : $unsigned($signed(wire43)));
  assign wire70 = $unsigned(wire44);
  assign wire71 = (^(($unsigned((wire69 != reg63)) ?
                      {wire51,
                          (8'hac)} : $signed((reg57 | wire47))) >= $unsigned($signed(wire45[(2'h3):(1'h1)]))));
  assign wire72 = (|$signed(reg62[(4'hb):(4'h9)]));
  assign wire73 = reg61[(2'h2):(2'h2)];
  assign wire74 = (|$signed((~&{$unsigned(wire46), (~|wire51)})));
endmodule

module module159
#(parameter param182 = ({(8'h9d), ({((8'h9f) ? (8'ha9) : (8'hbb)), ((8'h9f) ? (8'hbb) : (8'hb4))} >= (|((8'h9d) ? (8'hbf) : (8'h9c))))} ? (((~|((8'ha8) ? (8'hb6) : (8'hb9))) + (((8'hb2) - (7'h41)) ? ((8'h9e) ? (8'ha2) : (8'haf)) : (!(8'ha8)))) ? ((((8'hb1) ? (8'haf) : (8'hab)) != (!(8'haa))) ? ((~|(8'hba)) ? (^(7'h43)) : ((8'hba) >> (8'hbd))) : (!((8'hb1) ? (8'hb9) : (7'h41)))) : (~&(+(-(8'ha0))))) : ((({(8'h9d)} >>> (7'h41)) ? ((&(8'hbf)) | ((8'hbb) >>> (8'hb9))) : ({(8'haf), (8'ha7)} ? ((8'hb9) <= (8'hb3)) : ((8'hb9) ? (8'ha8) : (8'had)))) ? ({{(8'hba)}} ? ((^(8'hab)) | (~^(8'hba))) : (~|{(8'h9e), (8'ha8)})) : ((((8'hbc) ? (8'hbe) : (8'hae)) << ((8'hb3) - (8'hba))) ? {((8'hab) ? (8'hbe) : (8'hb9)), ((8'h9f) << (8'ha8))} : ((&(8'h9c)) ? {(8'ha9), (8'h9c)} : (8'hac))))), 
parameter param183 = ((&param182) >>> (((^~{param182, param182}) ^ (param182 ? {param182, param182} : (param182 ? param182 : param182))) ^ (~^((param182 || param182) >>> (~|param182))))))
(y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire164;
  input wire [(3'h5):(1'h0)] wire163;
  input wire [(4'hc):(1'h0)] wire162;
  input wire [(4'h8):(1'h0)] wire161;
  input wire signed [(3'h6):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire181;
  wire [(4'hc):(1'h0)] wire180;
  wire signed [(5'h14):(1'h0)] wire179;
  wire signed [(2'h3):(1'h0)] wire168;
  wire [(3'h7):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire [(3'h5):(1'h0)] wire165;
  reg [(4'ha):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(5'h13):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire165 = (|(((wire164[(3'h4):(3'h4)] >= (wire163 ?
                               wire163 : (8'hb0))) ?
                           {$unsigned(wire162)} : (8'h9c)) ?
                       ($signed(wire160[(3'h4):(1'h1)]) | wire161) : $signed($unsigned((wire163 + wire163)))));
  assign wire166 = {{(|(-(~^wire163)))},
                       ($signed($signed({wire161})) ?
                           wire161[(4'h8):(1'h0)] : ({wire163[(3'h4):(1'h1)],
                               (wire162 ?
                                   (8'haa) : wire160)} >> (wire164 ^~ wire161)))};
  assign wire167 = $unsigned(wire161[(1'h1):(1'h1)]);
  assign wire168 = (wire166[(4'ha):(4'h9)] ^ (~^(~wire162[(4'ha):(4'h9)])));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire161[(2'h2):(1'h1)])))
        begin
          if (wire162[(4'h8):(4'h8)])
            begin
              reg169 <= ($signed((wire163[(1'h1):(1'h0)] ?
                  {wire160[(2'h2):(1'h0)]} : wire164)) * ((~wire160) ?
                  (+$signed((wire162 ?
                      wire163 : wire164))) : $signed($signed(wire168[(2'h3):(2'h3)]))));
              reg170 <= ((wire165 >= {((+wire167) ?
                          (wire164 ? wire167 : wire168) : (+wire160))}) ?
                  wire161 : $signed($signed({$unsigned(wire164),
                      $signed(wire168)})));
            end
          else
            begin
              reg169 <= wire165[(2'h2):(2'h2)];
              reg170 <= $signed({wire168});
            end
          reg171 <= (((((-wire167) ?
                      (wire168 ? (8'hab) : wire160) : wire167[(3'h7):(1'h1)]) ?
                  $unsigned($signed(reg169)) : {(reg169 <= reg169)}) ?
              (reg169[(3'h6):(1'h1)] * {$unsigned(wire160)}) : $signed(wire168)) <= (((wire165 & {wire165}) ?
              (^wire161[(3'h6):(2'h3)]) : ((reg169 ?
                  wire160 : wire164) && $signed(wire166))) ^ (~^($signed((8'hb7)) * (!wire164)))));
          reg172 <= wire160[(3'h6):(3'h6)];
        end
      else
        begin
          reg169 <= wire165[(1'h1):(1'h0)];
          reg170 <= wire165;
          reg171 <= ($signed(wire165) ? wire167 : reg172);
        end
      reg173 <= ({wire163[(1'h1):(1'h1)]} ?
          wire160 : (~|(|{reg170, $signed(wire162)})));
      reg174 <= $unsigned($unsigned((($signed(wire161) ?
              wire164 : (wire166 | wire167)) ?
          (wire162[(4'h8):(3'h5)] ?
              {(8'hba), wire165} : reg172[(3'h7):(2'h2)]) : ((|reg170) ?
              (wire168 ? reg171 : reg170) : $signed(reg170)))));
      if ($unsigned($signed((((reg172 < wire165) ?
              (wire168 >> wire168) : (-(8'hb0))) ?
          {wire168, $signed(wire167)} : {(reg174 ? wire168 : (8'hbc))}))))
        begin
          reg175 <= wire165;
        end
      else
        begin
          reg175 <= $signed((!$unsigned($unsigned((wire161 ?
              reg170 : wire163)))));
          reg176 <= (^((((reg174 <= reg174) & $unsigned(wire164)) ?
              (~|(^wire166)) : {(reg173 ? (8'ha2) : reg172),
                  $unsigned(wire160)}) ^~ $signed(((8'hb8) >>> reg172))));
          reg177 <= (((~(reg176[(3'h5):(3'h5)] ?
                  (+reg169) : $signed(wire164))) ?
              ($signed(reg169) ?
                  $signed($unsigned(wire167)) : wire166) : ({$signed(reg175),
                  $signed(wire162)} - reg171)) > (~^wire168[(1'h1):(1'h0)]));
        end
      reg178 <= ((8'ha5) ?
          ((+(~$signed(reg176))) <<< reg171) : $unsigned(($signed((8'hba)) ?
              (^{reg169}) : $signed(reg173[(4'h8):(2'h2)]))));
    end
  assign wire179 = $signed((reg174 ?
                       {$unsigned(reg178[(3'h4):(2'h2)]),
                           $unsigned(wire160)} : $unsigned($unsigned(wire165))));
  assign wire180 = {((((wire163 * (7'h44)) ?
                               (8'ha8) : reg170[(2'h3):(2'h3)]) ~^ reg178[(1'h1):(1'h0)]) ?
                           reg178 : ($signed((reg174 ?
                               reg176 : wire163)) < (~^(reg177 ?
                               reg173 : reg175)))),
                       {(!wire166[(4'ha):(4'ha)]), (~^wire168[(2'h2):(2'h2)])}};
  assign wire181 = (reg170 ?
                       ($signed(wire167[(2'h2):(1'h0)]) ?
                           $signed((8'ha8)) : {wire168}) : (({reg169,
                               ((8'hbb) ? wire180 : reg174)} - (wire164 ?
                               (reg173 ? reg170 : reg172) : (reg172 ?
                                   wire180 : wire164))) ?
                           reg171[(2'h2):(1'h0)] : ($unsigned((^(7'h40))) ?
                               wire180 : $unsigned($signed(wire167)))));
endmodule

module module127
#(parameter param142 = {((({(8'ha0)} <= ((8'hb3) ~^ (8'ha7))) ? ((-(7'h41)) ? {(8'ha4), (8'hab)} : {(8'hac), (8'h9c)}) : {(~&(8'hb6))}) ? (({(8'h9f), (8'hbd)} | (-(8'ha3))) ? (((7'h43) & (8'ha6)) ? ((7'h42) ^~ (8'hb2)) : ((8'hba) == (8'hb5))) : ((8'haf) ? (~^(7'h40)) : (~&(8'hac)))) : (~((~&(8'hb9)) == ((8'hb2) ? (8'hbe) : (7'h44))))), ((^~((^(8'ha0)) ? (-(8'hb4)) : ((8'hab) ? (8'hb1) : (8'hab)))) | ((-{(8'hac), (7'h42)}) & (((8'hb8) << (8'hab)) >>> (8'hb4))))}, 
parameter param143 = param142)
(y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire131;
  input wire signed [(2'h3):(1'h0)] wire130;
  input wire [(4'hd):(1'h0)] wire129;
  input wire [(2'h2):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire140;
  wire signed [(4'hc):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 reg137,
                 (1'h0)};
  assign wire132 = (~(-($signed((wire130 ? wire131 : wire130)) ?
                       ($signed(wire131) ?
                           wire128 : (8'hb5)) : {$unsigned((8'hbd)),
                           (wire128 + (8'hb6))})));
  assign wire133 = (~^$signed((($unsigned((8'ha0)) & wire129) ?
                       ($signed(wire132) ?
                           $unsigned(wire132) : wire131[(4'hf):(3'h4)]) : wire130[(1'h0):(1'h0)])));
  assign wire134 = wire129[(3'h7):(2'h3)];
  assign wire135 = ((&($unsigned($signed(wire131)) | wire134[(3'h5):(3'h4)])) ^~ wire128[(1'h1):(1'h1)]);
  assign wire136 = $signed(wire135[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg137 <= wire132[(1'h1):(1'h0)];
    end
  assign wire138 = ($unsigned((+wire128)) ?
                       ({wire133} | wire132[(1'h1):(1'h0)]) : reg137[(1'h0):(1'h0)]);
  assign wire139 = (wire128[(2'h2):(1'h0)] ?
                       ((wire136[(3'h7):(2'h2)] ?
                               wire128[(2'h2):(1'h1)] : ({wire133,
                                   wire130} > (!wire130))) ?
                           (wire129 ?
                               wire134 : wire133) : $signed(wire132)) : wire130);
  assign wire140 = (!$unsigned((wire134[(3'h6):(1'h1)] ?
                       $unsigned($unsigned(wire133)) : ($unsigned(wire135) ?
                           {wire129, (8'ha5)} : (|wire133)))));
  assign wire141 = ($unsigned($signed(wire138)) ?
                       (~&{$signed((wire129 ? wire128 : wire139)),
                           ((wire129 ^~ (8'hb3)) ?
                               wire133[(4'h9):(4'h8)] : $signed(wire139))}) : (($signed($signed(wire130)) >= $signed(wire134)) >> (^~{wire133,
                           (wire135 ? (8'ha3) : wire135)})));
endmodule
