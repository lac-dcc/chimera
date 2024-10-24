module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire169;
  wire [(5'h12):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire167;
  wire signed [(3'h5):(1'h0)] wire166;
  wire signed [(5'h12):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire164;
  wire [(4'ha):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire signed [(5'h12):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire146;
  wire [(4'ha):(1'h0)] wire144;
  reg signed [(4'hf):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg179 = (1'h0);
  reg [(4'hb):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg [(4'ha):(1'h0)] reg174 = (1'h0);
  reg [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg160 = (1'h0);
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire144,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 (1'h0)};
  module5 #() modinst145 (.wire8(wire3), .y(wire144), .wire7(wire2), .clk(clk), .wire9(wire4), .wire10(wire0), .wire6(wire1));
  assign wire146 = wire1[(3'h4):(1'h1)];
  assign wire147 = wire1;
  assign wire148 = $signed((+($signed($unsigned(wire147)) ?
                       (8'ha8) : ((wire4 ? wire1 : wire2) ?
                           (~|wire146) : wire3))));
  assign wire149 = $signed(wire148);
  assign wire150 = $unsigned((^~(wire146 >>> wire0)));
  assign wire151 = wire144;
  assign wire152 = {$unsigned((($signed(wire0) | $unsigned(wire3)) ?
                           $unsigned((~&wire4)) : (((8'hb1) || wire2) < $signed((8'ha0)))))};
  assign wire153 = wire1;
  assign wire154 = (($unsigned($unsigned(wire148)) != (~^(8'ha9))) ?
                       wire147[(1'h1):(1'h1)] : ($unsigned({(wire144 != wire2),
                               wire146[(4'hb):(1'h1)]}) ?
                           $signed(wire3[(4'h9):(1'h0)]) : ((-(wire151 ?
                                   wire4 : (8'hac))) ?
                               wire149[(4'hc):(3'h4)] : {(wire0 ?
                                       (8'hab) : (8'hab))})));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg155 <= $signed(((wire149 ?
              wire144[(3'h4):(2'h2)] : (~^$signed(wire3))) || wire148));
          reg156 <= wire148;
          reg157 <= $signed(wire2[(4'h8):(3'h5)]);
        end
      else
        begin
          reg155 <= $signed((wire150[(3'h4):(2'h3)] * wire3[(5'h10):(4'ha)]));
          reg156 <= $unsigned(wire1[(4'he):(3'h4)]);
          reg157 <= wire149[(4'h9):(3'h5)];
          if ({(+(&$unsigned((|wire144))))})
            begin
              reg158 <= $signed($unsigned(reg156[(1'h0):(1'h0)]));
              reg159 <= (~&{$signed(reg157)});
              reg160 <= wire151[(1'h0):(1'h0)];
              reg161 <= wire149[(2'h3):(2'h3)];
            end
          else
            begin
              reg158 <= (wire150[(2'h3):(2'h2)] << {(wire4[(3'h4):(1'h0)] ~^ $unsigned((|wire150)))});
              reg159 <= $signed($unsigned((|(((7'h41) <= reg161) ?
                  $signed(reg157) : wire152))));
              reg160 <= {((($unsigned(reg157) ^~ wire150[(4'h9):(4'h9)]) ?
                          (!$signed(wire147)) : $signed($unsigned(wire144))) ?
                      (~wire2[(2'h3):(2'h2)]) : (~&($signed(wire144) + (~&wire0)))),
                  ($unsigned((~(wire150 >>> wire151))) ?
                      reg159 : $unsigned(wire144))};
            end
        end
      reg162 <= (~|({$signed((|(8'hb1)))} ?
          wire2[(4'h8):(2'h2)] : (^~(^wire144[(4'h9):(2'h3)]))));
      reg163 <= (wire144[(2'h2):(2'h2)] ?
          ($unsigned($unsigned($signed((8'h9d)))) ?
              ((~(reg159 || (8'ha9))) == wire4[(5'h11):(4'hb)]) : wire150) : wire154);
    end
  assign wire164 = $unsigned(((($signed(reg157) - ((8'hb7) != wire150)) ?
                           (|(wire152 ^~ reg158)) : ($signed(wire146) | (reg161 ?
                               wire148 : (7'h43)))) ?
                       (((7'h43) < ((8'hba) ? wire144 : wire144)) ?
                           $signed($unsigned((8'hbe))) : reg161) : wire154[(4'h8):(3'h4)]));
  assign wire165 = (($unsigned(wire3) ?
                           reg155 : ($signed($signed(reg161)) >> $unsigned({wire153}))) ?
                       ({$unsigned($signed(wire1)), ((~wire151) ^ (&wire150))} ?
                           wire1 : $unsigned($unsigned((!wire4)))) : {{(8'ha2),
                               wire149[(2'h3):(1'h0)]},
                           (~^(^~(|wire150)))});
  assign wire166 = ({($unsigned($unsigned(reg163)) ?
                               $signed($unsigned(wire0)) : ($signed(wire154) ?
                                   wire151 : reg157[(3'h4):(1'h1)])),
                           wire165[(2'h2):(1'h1)]} ?
                       $signed((&(^(8'h9c)))) : $signed(reg159[(4'h9):(3'h6)]));
  assign wire167 = (!($signed(wire164) >>> ({$unsigned((8'hb6))} ?
                       ($unsigned(reg163) >>> (reg161 ?
                           wire150 : wire150)) : $signed($unsigned(wire2)))));
  assign wire168 = $signed(((wire4[(4'h9):(3'h6)] ? {(|wire150)} : (8'hb6)) ?
                       wire144 : $signed(($signed((8'hb4)) ?
                           $unsigned(wire0) : (wire146 ? (8'ha2) : reg159)))));
  assign wire169 = $unsigned(($unsigned((-(~&wire146))) ?
                       ($unsigned({wire1, wire0}) ?
                           $signed({(8'ha9),
                               reg158}) : wire152[(2'h3):(1'h0)]) : ($unsigned(((8'hbf) * reg162)) ?
                           $signed((reg161 * wire0)) : ((reg160 & wire3) ?
                               $unsigned((8'ha3)) : wire3))));
  always
    @(posedge clk) begin
      if (wire4)
        begin
          if ((|$signed(((!$unsigned(wire2)) <<< $unsigned((wire168 ?
              reg156 : wire168))))))
            begin
              reg170 <= ({{$unsigned((wire1 ^~ wire164))},
                      (wire149 + ((reg159 || (8'ha2)) ? reg157 : (-wire148)))} ?
                  $unsigned((&(wire2[(3'h6):(1'h0)] ?
                      wire147 : $unsigned(reg159)))) : {((((8'ha6) >= (8'ha7)) ?
                          wire153[(4'he):(4'h8)] : ((8'hb0) ?
                              reg161 : wire166)) * reg157)});
              reg171 <= (~|wire148);
              reg172 <= $unsigned(((wire3[(1'h1):(1'h1)] ?
                  wire3 : reg160) * ({{reg156}, (~^wire2)} ?
                  $unsigned(((8'hb8) | wire4)) : wire154[(3'h4):(2'h2)])));
              reg173 <= wire168;
              reg174 <= ((^(wire1 < (wire152 ?
                      (~|wire0) : (reg159 | wire151)))) ?
                  {((wire146[(2'h3):(2'h2)] >= (-(8'hbc))) ?
                          (8'hb4) : (reg163[(1'h0):(1'h0)] ?
                              $signed(wire150) : reg171[(2'h2):(2'h2)]))} : (8'hb9));
            end
          else
            begin
              reg170 <= (wire169[(2'h3):(2'h3)] ^~ ($unsigned(($signed(wire4) > (reg156 >= (8'h9e)))) >= (~&(~^{reg157}))));
              reg171 <= wire169[(1'h0):(1'h0)];
              reg172 <= ($unsigned(reg162) * wire153);
              reg173 <= (({$signed((^wire150))} >>> {reg162,
                  $signed((wire1 ?
                      wire165 : wire2))}) != $unsigned((^~wire146)));
              reg174 <= wire168[(2'h2):(2'h2)];
            end
          if (reg171[(1'h1):(1'h1)])
            begin
              reg175 <= ($signed({((wire164 ?
                          reg162 : (7'h43)) ^~ wire0[(3'h6):(2'h2)]),
                      ((wire3 ? (8'hba) : reg161) ~^ (^~(8'hb2)))}) ?
                  reg158 : {((+wire147[(3'h5):(1'h1)]) ?
                          ({wire168} >>> $signed(wire150)) : $signed((!wire152)))});
              reg176 <= wire0[(4'ha):(1'h1)];
              reg177 <= $unsigned((^($unsigned((+wire152)) | (~(reg155 ?
                  wire1 : wire152)))));
              reg178 <= $signed((~|wire154));
            end
          else
            begin
              reg175 <= {wire1[(4'ha):(2'h3)]};
              reg176 <= reg162[(3'h5):(2'h2)];
            end
          if (wire0[(3'h5):(2'h2)])
            begin
              reg179 <= (~&reg163);
            end
          else
            begin
              reg179 <= (wire151[(1'h1):(1'h1)] ?
                  reg177 : (^$unsigned({{reg163, reg178}})));
              reg180 <= $signed(wire147[(4'ha):(3'h6)]);
            end
        end
      else
        begin
          if (reg171[(1'h0):(1'h0)])
            begin
              reg170 <= reg170;
              reg171 <= $signed($signed({$unsigned((reg170 != reg179))}));
            end
          else
            begin
              reg170 <= (-$signed({(~|{(7'h41), wire165})}));
              reg171 <= (-reg157);
              reg172 <= reg163[(4'hc):(4'h8)];
            end
        end
      reg181 <= ((8'hb7) > $unsigned($signed($signed({(8'h9e), reg175}))));
      reg182 <= (reg178 ?
          (^$unsigned($unsigned({reg161, wire2}))) : wire166[(1'h0):(1'h0)]);
      reg183 <= (+{reg174});
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire132,
                 wire131,
                 wire129,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire62,
                 wire13,
                 wire12,
                 wire11,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg79,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire11 = ((wire8[(4'h9):(3'h5)] ?
                      $unsigned(wire7[(3'h4):(2'h2)]) : (&$unsigned(wire7[(3'h4):(2'h3)]))) <<< wire8);
  assign wire12 = wire9[(4'h8):(4'h8)];
  assign wire13 = ((&{($signed(wire8) ? $signed(wire10) : $signed(wire12)),
                      (wire10 ?
                          (wire9 > (8'h9f)) : $signed(wire11))}) >> $signed((-wire7)));
  module14 #() modinst63 (wire62, clk, wire9, wire11, wire12, wire6);
  always
    @(posedge clk) begin
      reg64 <= $signed(({{$signed(wire6),
              $unsigned(wire8)}} >> ($signed($signed((8'had))) ?
          wire6[(2'h3):(2'h2)] : wire8)));
      reg65 <= wire62[(3'h5):(2'h3)];
      if ((|wire10[(1'h0):(1'h0)]))
        begin
          reg66 <= wire7[(3'h5):(1'h0)];
          reg67 <= ($unsigned({$unsigned(reg65)}) | $unsigned(wire11[(4'he):(4'hb)]));
          reg68 <= (&(+(8'h9d)));
          reg69 <= wire8;
          if (wire13[(4'h8):(1'h1)])
            begin
              reg70 <= (((wire6[(4'h9):(4'h9)] ?
                      (((8'haa) ? reg66 : (8'hb1)) ?
                          wire13 : reg67[(3'h4):(1'h1)]) : $unsigned((wire9 ?
                          (8'hbf) : reg69))) ?
                  (reg65 ?
                      $signed((^(7'h41))) : $signed(wire13)) : (((reg66 | (8'h9f)) | $unsigned(wire10)) <<< (&(wire10 ?
                      wire10 : reg64)))) ~^ (reg64 ?
                  ((^~wire12[(4'hd):(4'ha)]) <<< reg67) : ((~^(reg65 ?
                      (8'hb2) : reg66)) > $signed(wire10[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg70 <= $unsigned($unsigned(reg66));
              reg71 <= $signed((!reg69));
              reg72 <= $unsigned(reg65);
              reg73 <= ($unsigned((reg68 | {(wire62 ?
                      reg69 : wire7)})) < (wire62[(3'h5):(3'h4)] >= ($signed($signed(wire10)) * ((wire11 ?
                      reg67 : wire7) ?
                  reg64 : (!(8'hbc))))));
              reg74 <= (~^$unsigned(wire10[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          reg66 <= ($signed(($unsigned((reg68 ? reg66 : reg64)) ?
              reg69 : $signed(reg68))) ~^ (((~^(|reg70)) ?
              $unsigned((~|wire62)) : reg64[(3'h5):(1'h0)]) <= $signed($signed((^~wire9)))));
          reg67 <= wire10[(1'h1):(1'h0)];
          reg68 <= ((((8'h9e) ?
              (^~(reg64 * (8'hb0))) : (((8'ha8) ? wire9 : reg65) ?
                  (~wire11) : wire9)) > (~|$signed(((8'h9f) + reg67)))) && ($signed({wire11[(3'h5):(1'h0)]}) ?
              {reg65[(1'h0):(1'h0)]} : reg64));
        end
    end
  assign wire75 = ((reg64[(3'h4):(2'h2)] ?
                          (^~{$signed((8'ha1))}) : $unsigned((((8'had) ?
                                  reg66 : reg65) ?
                              (reg67 ? wire8 : wire7) : (wire11 << reg70)))) ?
                      $unsigned((~|$unsigned((reg69 ?
                          wire9 : wire9)))) : {($signed((reg67 * wire10)) ^ $signed((wire12 ?
                              wire13 : wire13))),
                          (~&((wire12 ^ reg65) ? reg70 : (~(8'hb9))))});
  assign wire76 = ((8'h9c) <= $signed($unsigned($signed($signed((8'hab))))));
  assign wire77 = reg68[(1'h0):(1'h0)];
  assign wire78 = ({$signed((&{reg65})),
                      ((^(wire12 ? (8'hbe) : reg66)) ?
                          (^~reg72[(3'h4):(1'h0)]) : $signed((wire6 ?
                              reg66 : reg71)))} * ($signed(reg69) ?
                      $signed($unsigned((8'h9e))) : reg72));
  always
    @(posedge clk) begin
      reg79 <= reg72[(4'h9):(2'h2)];
    end
  assign wire80 = ($signed(reg65) <<< ($unsigned(reg68[(3'h6):(3'h4)]) ?
                      ($signed($unsigned(wire75)) ?
                          ($signed(wire76) >> $unsigned(reg69)) : ($unsigned(wire9) ?
                              (+reg65) : reg70)) : (((wire8 ? wire8 : reg66) ?
                              $signed(wire76) : $unsigned(wire75)) ?
                          $unsigned({reg68, wire6}) : ((~&reg69) ?
                              wire7 : (^~wire77)))));
  assign wire81 = reg70[(3'h6):(1'h1)];
  module82 #() modinst130 (.wire85(wire8), .clk(clk), .wire83(wire62), .y(wire129), .wire86(wire12), .wire84(wire9));
  assign wire131 = $unsigned(($signed($signed($unsigned(reg66))) > $unsigned(wire77)));
  assign wire132 = (reg69 && $unsigned((wire12 - ((wire129 ?
                       wire13 : wire131) >> wire13))));
  always
    @(posedge clk) begin
      if (wire10)
        begin
          reg133 <= $signed((~&reg73));
          reg134 <= $unsigned(reg67[(4'h9):(1'h0)]);
          reg135 <= (reg69[(5'h13):(5'h12)] ?
              ($signed(wire75[(3'h5):(2'h3)]) ?
                  $unsigned($unsigned((~|reg70))) : reg133) : (8'h9c));
        end
      else
        begin
          reg133 <= $unsigned(reg69[(4'he):(3'h6)]);
          reg134 <= wire9;
          reg135 <= $unsigned(reg74[(3'h4):(2'h3)]);
          reg136 <= wire76[(2'h2):(2'h2)];
          reg137 <= (wire9 ?
              $unsigned(wire129) : (|$unsigned(((~&wire132) & {reg134,
                  wire62}))));
        end
      reg138 <= reg67;
    end
  assign wire139 = (&(!(~|wire77)));
  assign wire140 = (~|(|wire9));
  assign wire141 = $signed($unsigned($signed($unsigned(reg135[(1'h1):(1'h0)]))));
  assign wire142 = wire6;
  assign wire143 = ($unsigned((^~(wire132[(3'h5):(1'h0)] ?
                           wire76[(1'h0):(1'h0)] : $signed(wire13)))) ?
                       (((~|reg64) >> (8'ha6)) ?
                           wire80[(3'h4):(2'h2)] : wire11[(4'hc):(3'h4)]) : (~&$signed($signed((~wire78)))));
endmodule

module module82
#(parameter param127 = (((~(((8'hb0) ^ (8'hbc)) ? ((8'hba) ? (8'hb4) : (8'hbc)) : (~|(7'h44)))) ? ((8'ha2) ? (^(~(8'h9e))) : (^{(7'h43)})) : ((&((8'hbc) ? (8'hac) : (8'ha3))) ? (((8'h9e) <= (8'haf)) ^ (&(8'haa))) : (|(+(8'haf))))) ? (({((8'ha3) ? (8'hbc) : (8'hb6)), ((8'ha3) ? (8'ha6) : (8'ha8))} >>> {(~(7'h44))}) ? {{((7'h40) << (8'h9d))}} : (((+(8'haf)) == (~|(7'h41))) ? ((^~(8'hbd)) ? (~^(7'h43)) : (~|(8'ha3))) : (8'hb9))) : {((|((8'hb9) ? (8'ha9) : (8'ha2))) ? (((8'hba) < (8'ha0)) << ((8'hab) ? (8'hbe) : (8'hb3))) : ((~(8'hba)) ? {(8'hb5)} : ((8'h9e) + (7'h41)))), (^~(^~(~|(8'hbd))))}), 
parameter param128 = (((|((~&param127) ^ (~(8'had)))) ? (~({param127} ? (-param127) : param127)) : param127) ? (^~(~&((!(8'hba)) ? (param127 ? param127 : param127) : (8'hbe)))) : ((({param127, param127} ? (8'hb8) : (param127 & param127)) ? ((param127 ^ param127) ? param127 : (param127 ? param127 : (8'h9c))) : ((~&param127) ? {param127} : (param127 ? param127 : (8'hb3)))) >>> (~&((param127 ? param127 : param127) > (param127 ? param127 : param127))))))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire86;
  input wire [(2'h3):(1'h0)] wire85;
  input wire signed [(5'h13):(1'h0)] wire84;
  input wire [(4'hc):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire121;
  wire signed [(3'h6):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire87;
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire87,
                 reg112,
                 reg107,
                 reg106,
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
                 (1'h0)};
  assign wire87 = (~&((~^(-wire86)) <<< (-wire85)));
  always
    @(posedge clk) begin
      if ((~^wire87[(4'h8):(3'h5)]))
        begin
          reg88 <= ($signed(wire87[(4'hb):(3'h4)]) * $signed((8'h9f)));
          reg89 <= ((^~(^~((!(8'hb5)) ?
                  wire87[(4'hd):(2'h2)] : $signed(wire85)))) ?
              $unsigned(wire84[(2'h3):(1'h1)]) : wire84[(1'h1):(1'h1)]);
          if (($signed((~(wire84 ~^ (wire83 ? wire84 : (8'h9d))))) ?
              {{$unsigned((~^reg88)), (~|wire87[(4'ha):(4'h8)])}} : (+reg89)))
            begin
              reg90 <= $unsigned($signed((~&wire83)));
              reg91 <= wire83;
              reg92 <= $unsigned((reg91[(3'h5):(1'h1)] ?
                  (8'hb4) : $signed($signed((reg88 ? reg90 : wire86)))));
              reg93 <= (|$unsigned($signed((~wire87))));
            end
          else
            begin
              reg90 <= ((8'hbd) ?
                  ((($unsigned(wire87) ?
                      $signed(reg90) : reg91[(2'h3):(2'h2)]) ^ $unsigned($signed(wire84))) || (^~(^~$unsigned(reg92)))) : $unsigned((reg91[(3'h4):(1'h1)] && wire84[(2'h2):(1'h1)])));
              reg91 <= (!wire87);
            end
          reg94 <= wire83[(3'h5):(3'h4)];
          reg95 <= ($unsigned($signed(reg91[(1'h0):(1'h0)])) ?
              (~$signed(((&reg94) - (reg94 ?
                  reg89 : reg91)))) : ($signed($unsigned($signed(reg92))) ?
                  (~((wire85 ? reg92 : reg93) >= $signed(wire85))) : wire87));
        end
      else
        begin
          reg88 <= $unsigned((wire85[(2'h3):(1'h0)] ?
              {reg89,
                  ($signed(reg91) ?
                      (~reg90) : (reg89 ~^ reg92))} : ((8'hb9) | $unsigned($unsigned(wire83)))));
        end
      reg96 <= $signed(($signed((reg94 - (reg89 ? reg91 : reg89))) ?
          (8'h9d) : $signed($signed($signed((8'ha5))))));
      if (reg90[(3'h6):(3'h5)])
        begin
          reg97 <= reg94;
          reg98 <= $unsigned(reg96);
          reg99 <= reg93;
          reg100 <= (wire87[(1'h0):(1'h0)] ?
              $unsigned($unsigned((~(^reg92)))) : {(reg89[(1'h0):(1'h0)] & reg95),
                  $signed((^(reg97 ? (8'hbe) : reg91)))});
          reg101 <= $unsigned(reg98);
        end
      else
        begin
          reg97 <= $signed((reg94[(3'h5):(2'h2)] >> ((+wire85) >>> (8'haa))));
          if (($unsigned($unsigned($signed(reg93))) > $signed(wire83[(3'h6):(2'h2)])))
            begin
              reg98 <= (8'hae);
              reg99 <= ({reg90[(3'h5):(1'h1)],
                  ($signed(reg90[(4'hb):(3'h6)]) ?
                      (((8'hb9) ? reg97 : wire85) ?
                          reg91 : reg94) : $unsigned((7'h42)))} >> reg99);
              reg100 <= (($unsigned((!(8'hb8))) & $unsigned(reg88[(3'h6):(3'h4)])) ?
                  reg91 : wire86[(4'h8):(3'h7)]);
              reg101 <= {reg88[(3'h6):(1'h0)]};
            end
          else
            begin
              reg98 <= ($unsigned((~&{((8'hbf) ? wire85 : reg90)})) ?
                  $signed(($signed(reg96[(3'h7):(1'h0)]) ?
                      ($unsigned(reg91) ^ reg92[(1'h0):(1'h0)]) : $signed($unsigned(reg92)))) : $signed(((~|(-reg96)) ?
                      (^~reg97[(5'h14):(4'hc)]) : ($unsigned(reg96) ?
                          (~^reg101) : reg93[(1'h1):(1'h0)]))));
              reg99 <= (+reg90[(3'h7):(3'h5)]);
              reg100 <= (+$unsigned({$signed((~|wire84)),
                  $signed(((8'ha6) >= (8'h9f)))}));
              reg101 <= $unsigned(($unsigned($signed($unsigned((8'ha2)))) <<< wire85));
            end
          if ((wire84 > (reg94[(3'h4):(2'h2)] ~^ ($unsigned($signed(reg99)) <= reg97))))
            begin
              reg102 <= (($signed(($signed((7'h41)) ?
                          (wire86 ? reg94 : wire83) : reg96[(2'h2):(1'h0)])) ?
                      ((8'hbe) ?
                          $signed(wire85[(1'h1):(1'h1)]) : $signed(reg99)) : $unsigned(($signed(reg96) == wire86))) ?
                  ($signed($unsigned(reg99)) >> (-({(7'h42)} ?
                      $signed(reg94) : reg88))) : $signed($unsigned((reg90[(1'h1):(1'h0)] ?
                      (wire87 && wire83) : reg100))));
              reg103 <= $signed(reg92);
              reg104 <= reg92;
              reg105 <= ((reg97 ?
                  (|{{wire86}}) : (reg104 ?
                      $signed($signed(reg99)) : $signed((reg101 ~^ wire85)))) | ($signed(((wire87 ?
                      reg89 : reg92) == $unsigned(wire86))) ?
                  $signed(((reg100 ? reg96 : reg97) ?
                      $signed(reg101) : (reg90 > reg102))) : (8'h9d)));
              reg106 <= $signed(wire83);
            end
          else
            begin
              reg102 <= ((reg96 ? wire83[(4'hb):(4'hb)] : reg97) ?
                  (($unsigned(reg90[(3'h4):(1'h1)]) ~^ reg92) != ($signed(reg98[(3'h4):(2'h3)]) ?
                      $unsigned((reg101 != reg88)) : $unsigned(wire87))) : $signed(reg103[(1'h0):(1'h0)]));
              reg103 <= reg94;
              reg104 <= ((wire84 ?
                      (^~($unsigned(reg98) ?
                          reg104[(1'h1):(1'h0)] : $signed(reg101))) : $signed(reg99[(4'ha):(3'h5)])) ?
                  reg96 : ($signed(($unsigned(reg92) <= reg92)) | $unsigned(((!reg88) ?
                      $unsigned(reg105) : $signed(reg89)))));
              reg105 <= ($signed(reg105) ? reg89[(4'h9):(3'h5)] : reg88);
              reg106 <= wire85;
            end
          reg107 <= $unsigned({(((~|reg91) ~^ wire86[(1'h0):(1'h0)]) ?
                  $signed($unsigned(reg99)) : (reg88 && (reg96 > reg101)))});
        end
    end
  assign wire108 = reg92;
  assign wire109 = ($unsigned((~|$signed((reg94 ? reg95 : reg91)))) ?
                       reg103 : $signed(((|(reg93 ?
                           reg105 : reg91)) || (~&(reg100 ?
                           wire87 : (8'haf))))));
  assign wire110 = ((~($unsigned((wire83 >>> reg93)) ?
                       (|$unsigned(reg103)) : (reg94 && (8'hb6)))) ^ reg103);
  assign wire111 = (~|(~^(-(reg95[(4'h9):(3'h5)] ?
                       {reg93} : (reg91 > wire108)))));
  always
    @(posedge clk) begin
      reg112 <= ($signed(wire109[(3'h6):(2'h2)]) ?
          wire109 : wire86[(2'h2):(1'h0)]);
    end
  assign wire113 = wire85;
  assign wire114 = (reg88 * $unsigned($unsigned(reg94)));
  assign wire115 = $unsigned(reg99[(3'h5):(2'h2)]);
  assign wire116 = {reg92[(2'h2):(1'h1)]};
  assign wire117 = $signed(($unsigned($signed(reg92)) ?
                       ((7'h43) <<< ((^~reg89) != reg103[(4'hd):(4'h9)])) : ((wire86[(1'h0):(1'h0)] ?
                           (!reg112) : $unsigned(reg105)) & reg91[(1'h0):(1'h0)])));
  assign wire118 = $unsigned(reg89[(2'h3):(2'h2)]);
  assign wire119 = $unsigned((reg104 ?
                       (($signed(wire115) ?
                           (|reg95) : $signed((8'hbf))) | $unsigned($unsigned(reg106))) : (^(reg98[(3'h6):(1'h0)] ?
                           $signed((8'hbc)) : {wire85, reg112}))));
  assign wire120 = ((((-reg104[(4'hf):(2'h2)]) < $signed(reg91)) <<< $signed($signed((^~wire115)))) ?
                       (wire84[(4'hc):(3'h7)] + (+((!reg92) ?
                           (reg102 - wire87) : wire110))) : (&{wire111}));
  assign wire121 = $unsigned(($signed($unsigned(((8'hb9) >>> reg89))) == (wire87[(2'h2):(1'h1)] <<< reg93[(1'h1):(1'h1)])));
  assign wire122 = wire115;
  assign wire123 = (~^reg96);
  assign wire124 = (^wire87[(3'h7):(3'h5)]);
  assign wire125 = $unsigned({(+wire113)});
  assign wire126 = (((~^$signed(wire113[(2'h2):(1'h0)])) << reg107) ?
                       ($signed($unsigned({wire120, wire109})) ?
                           ($signed($signed((8'h9c))) <<< wire125[(4'hf):(2'h2)]) : reg100[(4'ha):(1'h0)]) : reg112);
endmodule

module module14
#(parameter param61 = ((~|((^~{(8'h9d)}) ? (((7'h42) - (8'ha5)) ? ((8'haa) || (8'ha6)) : (~^(7'h43))) : (((7'h42) ? (8'ha4) : (8'ha0)) ? (~&(8'hb9)) : ((8'hb3) ? (8'hae) : (7'h43))))) ? (!(~&(|((8'h9d) ? (8'hb5) : (8'ha1))))) : ((&({(8'ha9), (8'h9f)} ~^ ((7'h44) ^ (8'h9f)))) >> (8'hb7))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire60,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire34,
                 wire20,
                 wire19,
                 reg59,
                 reg55,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 (1'h0)};
  assign wire19 = wire15;
  assign wire20 = ((&$signed(wire16)) >= {wire16, $signed($unsigned(wire19))});
  always
    @(posedge clk) begin
      reg21 <= (($unsigned((wire15 ? (!(8'hb2)) : $unsigned(wire20))) ?
              (wire16[(2'h2):(1'h1)] ?
                  (((8'ha1) ^ wire18) ?
                      (8'h9e) : (wire20 ?
                          wire15 : wire17)) : $signed($signed(wire20))) : (^~((^wire20) ?
                  wire19 : (wire19 || wire17)))) ?
          ($unsigned($signed($unsigned(wire18))) ?
              ($unsigned((wire15 ? wire15 : wire20)) ?
                  wire15 : wire20[(2'h3):(1'h0)]) : wire19) : $signed($unsigned((&wire15))));
      reg22 <= (((-(+$unsigned(wire17))) < (^~(-(wire16 ?
          reg21 : (8'hbd))))) >= wire16[(1'h1):(1'h0)]);
      if (reg22)
        begin
          if (wire20[(1'h1):(1'h0)])
            begin
              reg23 <= wire19[(2'h3):(2'h3)];
              reg24 <= (wire16 > $unsigned((wire20[(2'h3):(1'h0)] ?
                  wire20 : wire20[(2'h2):(2'h2)])));
            end
          else
            begin
              reg23 <= (({$unsigned($unsigned((8'h9d)))} ?
                      $unsigned(wire18) : $unsigned(((wire19 & (7'h44)) ?
                          ((8'h9e) ?
                              wire20 : (8'hb1)) : wire19[(4'hf):(4'ha)]))) ?
                  (~^$unsigned(wire16[(1'h1):(1'h1)])) : wire18[(2'h2):(1'h0)]);
              reg24 <= (reg23[(5'h13):(4'h8)] ?
                  $signed($unsigned(wire18[(2'h2):(1'h0)])) : reg24);
              reg25 <= (^({reg22[(4'hc):(3'h7)], reg22[(1'h0):(1'h0)]} ?
                  ((~&reg21) >>> wire17) : $signed((+reg23[(3'h5):(3'h4)]))));
              reg26 <= reg21;
              reg27 <= reg21[(1'h0):(1'h0)];
            end
          reg28 <= reg24[(2'h3):(1'h1)];
          reg29 <= reg24[(2'h2):(1'h0)];
          if (($unsigned({$unsigned((7'h43)), wire19}) >= {(wire19 ?
                  $unsigned($signed(reg24)) : $signed($signed(reg24))),
              $signed($signed({reg25}))}))
            begin
              reg30 <= reg21[(3'h6):(2'h3)];
            end
          else
            begin
              reg30 <= wire19;
              reg31 <= reg25;
            end
          reg32 <= ((^{($signed(wire19) && reg26),
                  ($signed(reg30) - (reg31 ? reg24 : wire17))}) ?
              ({((wire18 ? wire16 : reg25) ^ {reg23, wire20})} ?
                  reg26[(2'h3):(1'h1)] : $signed(reg23)) : ((|$unsigned(reg31[(2'h2):(1'h0)])) ?
                  reg25[(4'h9):(4'h9)] : (($signed(reg26) >>> $signed(reg22)) | $unsigned($unsigned(wire18)))));
        end
      else
        begin
          reg23 <= wire16;
          reg24 <= $signed($signed(wire18[(1'h0):(1'h0)]));
        end
      reg33 <= (($unsigned(reg22) ?
              (8'haf) : {($signed(reg24) ?
                      ((8'h9f) ? reg21 : reg23) : reg31)}) ?
          (wire16[(2'h3):(2'h2)] > (^~reg29)) : wire17);
    end
  assign wire34 = reg32;
  always
    @(posedge clk) begin
      if (wire20[(1'h1):(1'h1)])
        begin
          reg35 <= reg23;
        end
      else
        begin
          if (((((-(reg29 ? wire15 : wire34)) ?
                  $signed({(8'h9d)}) : {(reg28 ?
                          (8'h9e) : reg30)}) ^ $signed({{wire16},
                  $unsigned(reg21)})) ?
              {(|reg22)} : reg23[(3'h7):(3'h6)]))
            begin
              reg35 <= (~|(reg25[(4'hb):(3'h7)] * ((~&(reg35 ?
                      reg23 : (8'hac))) ?
                  ($signed(wire16) ?
                      (8'haf) : wire15[(1'h0):(1'h0)]) : reg27)));
              reg36 <= ((reg23 ?
                  (^~reg21) : reg27[(4'hc):(2'h3)]) > {(reg30 | (8'hb7))});
              reg37 <= (-(-(+($unsigned(wire18) ?
                  (reg21 ? reg35 : reg31) : (reg29 ? (8'ha6) : reg31)))));
              reg38 <= (-$signed((~&(~|$signed(wire18)))));
            end
          else
            begin
              reg35 <= reg36[(4'h9):(3'h6)];
              reg36 <= ((reg37 && $signed(reg22[(5'h10):(2'h3)])) == {reg26});
            end
          reg39 <= (({$unsigned($signed(wire17)), $signed(((7'h42) | wire18))} ?
              ((~|(wire18 ?
                  reg31 : (8'hbe))) && {$signed(reg24)}) : reg23) * reg38);
          reg40 <= ((wire15[(1'h0):(1'h0)] ?
                  $unsigned(($unsigned(reg23) >> (wire19 >> reg33))) : ((~|(wire16 ?
                          reg30 : reg27)) ?
                      (wire18 ? {reg37} : reg25) : ((reg27 > reg23) ^ (reg39 ?
                          reg25 : reg23)))) ?
              wire19 : {$signed(reg23[(4'hd):(4'h9)])});
        end
    end
  assign wire41 = reg30[(2'h3):(2'h3)];
  assign wire42 = $unsigned(reg22);
  assign wire43 = $unsigned(wire34);
  assign wire44 = $signed($signed($unsigned({(!reg33), $unsigned((8'ha8))})));
  assign wire45 = wire16[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg46 <= (reg40[(1'h0):(1'h0)] ?
          ({{reg26, (-reg30)},
              $unsigned(reg28[(3'h6):(1'h0)])} <<< reg38) : (~{$unsigned((reg30 - (8'hb0)))}));
      reg47 <= wire41;
      reg48 <= ($unsigned(reg39) ?
          reg36 : $signed($unsigned(reg29[(3'h5):(2'h2)])));
      reg49 <= (~($unsigned(wire20[(1'h1):(1'h1)]) > wire20));
      reg50 <= {{(($unsigned(wire15) ? ((8'hb8) + reg46) : {reg46, wire17}) ?
                  wire45[(2'h3):(2'h2)] : ($unsigned(wire45) ?
                      $signed((8'hb5)) : (reg48 * reg27))),
              wire43},
          (reg30[(3'h5):(3'h5)] ^ (((reg25 ? wire34 : reg29) ?
                  $unsigned(wire17) : $unsigned(reg22)) ?
              reg28[(3'h4):(1'h0)] : ((reg35 ? (8'haa) : reg35) ?
                  $unsigned(reg35) : (wire19 ? reg37 : wire20))))};
    end
  assign wire51 = ($signed((8'ha0)) <= ((~&wire15[(1'h0):(1'h0)]) ?
                      (reg22[(4'hb):(4'hb)] && $unsigned((reg37 >= reg36))) : (+reg36[(1'h0):(1'h0)])));
  assign wire52 = (^~wire45);
  assign wire53 = $unsigned({(8'hb4)});
  assign wire54 = ((reg37 ?
                          {((wire43 ? wire18 : wire15) - (8'ha0)),
                              wire51[(3'h5):(3'h4)]} : $unsigned(wire15[(2'h2):(1'h1)])) ?
                      $unsigned(wire52[(3'h7):(3'h6)]) : $unsigned({(~|$unsigned(reg30))}));
  always
    @(posedge clk) begin
      reg55 <= $unsigned((-$unsigned({$unsigned(wire54), $signed(reg28)})));
    end
  assign wire56 = reg39[(4'h9):(3'h7)];
  assign wire57 = $unsigned({wire43[(2'h3):(1'h1)]});
  assign wire58 = $signed((!$unsigned(reg36)));
  always
    @(posedge clk) begin
      reg59 <= $unsigned(wire57);
    end
  assign wire60 = $signed(({$unsigned($signed((8'haf))),
                      {(reg59 ^ reg33)}} * (({wire54, wire52} ?
                          wire19 : $signed(reg29)) ?
                      ((8'hb1) ?
                          reg36[(2'h3):(1'h1)] : $signed((7'h40))) : wire43[(2'h2):(1'h1)])));
endmodule
