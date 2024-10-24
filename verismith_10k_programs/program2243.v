module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire185;
  wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire153;
  wire [(5'h10):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire157;
  wire [(2'h3):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire165;
  wire [(4'ha):(1'h0)] wire166;
  wire [(4'hd):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire169;
  wire signed [(5'h14):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire183;
  reg signed [(3'h4):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg179 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  reg [(3'h6):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(3'h6):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  assign y = {wire185,
                 wire5,
                 wire153,
                 wire155,
                 wire157,
                 wire159,
                 wire160,
                 wire161,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 wire169,
                 wire171,
                 wire183,
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
                 reg156,
                 reg162,
                 reg163,
                 reg164,
                 (1'h0)};
  assign wire5 = (({wire0[(4'h9):(3'h5)]} ? wire2 : wire3[(4'ha):(2'h2)]) ?
                     $signed($unsigned(wire3)) : $signed($unsigned(wire0)));
  module6 #() modinst154 (wire153, clk, wire0, wire2, wire1, wire3);
  assign wire155 = (($unsigned($unsigned($unsigned(wire5))) ?
                           (^(wire153 - (wire153 ?
                               (8'hb5) : wire2))) : $signed({$unsigned(wire2),
                               $signed(wire153)})) ?
                       ((7'h43) ?
                           (8'hb5) : ($unsigned((+wire4)) ^~ (((8'haf) ?
                               wire1 : (8'hb6)) <<< (+(8'hb1))))) : ($unsigned(wire153) - ($unsigned($signed(wire3)) ?
                           $unsigned($signed(wire1)) : $unsigned((wire1 ?
                               wire1 : wire153)))));
  always
    @(posedge clk) begin
      reg156 <= wire1[(2'h2):(1'h0)];
    end
  module14 #() modinst158 (wire157, clk, wire4, wire5, wire0, wire155);
  assign wire159 = (($signed((wire1[(1'h1):(1'h1)] ?
                           wire155 : (!reg156))) - ($unsigned((reg156 <<< wire4)) ?
                           wire153[(2'h3):(2'h3)] : wire4)) ?
                       {(^$signed((wire2 ? (8'hb0) : wire0))),
                           $unsigned((((8'hab) ?
                               wire157 : wire1) > $signed(wire2)))} : wire1);
  assign wire160 = wire5[(2'h2):(1'h0)];
  assign wire161 = wire3[(5'h12):(4'hb)];
  always
    @(posedge clk) begin
      reg162 <= {wire3[(3'h6):(1'h0)],
          (wire159 ? wire160[(2'h2):(1'h1)] : $signed((^~$signed(wire0))))};
      reg163 <= wire160[(1'h0):(1'h0)];
      reg164 <= (~&(~|(($signed((7'h42)) ? (^reg163) : (^~(8'hb9))) ?
          (!$unsigned(wire1)) : ((&wire155) ~^ wire5))));
    end
  assign wire165 = $unsigned({$unsigned((~&{wire0, (8'ha5)})), (~^wire161)});
  assign wire166 = {wire160[(1'h0):(1'h0)],
                       $signed((~&((~&(8'hb0)) | reg156)))};
  assign wire167 = (^wire161[(3'h6):(3'h6)]);
  assign wire168 = wire161[(4'hf):(2'h3)];
  module105 #() modinst170 (wire169, clk, wire3, wire168, reg156, wire161, wire166);
  assign wire171 = $unsigned(wire159);
  always
    @(posedge clk) begin
      if ($signed(({{wire0[(5'h12):(1'h1)]}} ?
          wire0[(3'h5):(3'h4)] : (wire168 ?
              {wire4} : (wire166 >>> $signed(wire160))))))
        begin
          reg172 <= (reg156 & (($unsigned(((8'hbb) ? wire155 : wire2)) ?
                  $signed((wire155 ?
                      wire166 : wire5)) : ((|wire157) != (wire160 && wire171))) ?
              (!(~&$signed((7'h40)))) : reg156[(3'h4):(2'h3)]));
          reg173 <= (~^(wire160 ^ {reg162[(2'h2):(1'h0)]}));
          if ((~|($unsigned((wire167 ? wire171 : wire5[(3'h5):(2'h2)])) ?
              reg172[(2'h2):(1'h1)] : $unsigned(reg164))))
            begin
              reg174 <= (8'hbd);
            end
          else
            begin
              reg174 <= ((|$unsigned($unsigned((wire160 ?
                      (8'hab) : (8'ha7))))) ?
                  reg162[(4'h8):(3'h5)] : (wire160[(1'h1):(1'h1)] && $unsigned($signed((-(7'h43))))));
              reg175 <= ({$unsigned(wire159[(1'h0):(1'h0)]),
                  ((&wire0) + (^wire159[(2'h3):(2'h3)]))} >> wire155);
              reg176 <= (^~($unsigned((7'h43)) ?
                  {wire153[(3'h5):(2'h3)]} : wire5[(2'h2):(2'h2)]));
              reg177 <= reg175;
              reg178 <= wire159[(2'h2):(1'h1)];
            end
          reg179 <= ((wire166[(1'h0):(1'h0)] ?
              (+$signed($signed(reg173))) : ($signed($signed(wire3)) != reg173)) | (wire159 ?
              {(((8'ha1) ? reg162 : (7'h43)) ?
                      (wire3 & (8'ha2)) : $unsigned(wire169)),
                  (&wire165)} : $unsigned($signed($signed(reg156)))));
        end
      else
        begin
          reg172 <= $signed(reg176[(3'h7):(2'h2)]);
        end
      reg180 <= ($signed($unsigned(reg174)) ?
          (&(!$unsigned(reg163))) : $signed($signed(wire5[(2'h3):(1'h1)])));
      if (({$unsigned(($signed(wire3) << (&(8'ha2)))),
          $signed($signed(reg173[(2'h3):(2'h2)]))} ^~ $unsigned($signed((~^(~|reg156))))))
        begin
          reg181 <= (($signed($unsigned((reg173 ? (8'ha0) : wire0))) ?
                  (8'hbc) : ({wire167[(1'h1):(1'h1)]} > ({reg162} ^~ (~&reg180)))) ?
              $unsigned(wire0[(4'h8):(3'h7)]) : ($unsigned($unsigned((reg175 ?
                      wire5 : (8'ha2)))) ?
                  $unsigned($unsigned($signed(reg164))) : {(~((8'had) ^~ wire159))}));
        end
      else
        begin
          reg181 <= reg177[(1'h0):(1'h0)];
        end
      reg182 <= ($signed(reg177[(3'h4):(2'h2)]) ?
          $unsigned(reg179[(2'h2):(2'h2)]) : wire2[(3'h4):(1'h1)]);
    end
  module86 #() modinst184 (.clk(clk), .wire91(reg180), .wire89(wire0), .y(wire183), .wire87(wire165), .wire88(reg176), .wire90(wire1));
  assign wire185 = $signed($unsigned($signed($unsigned($signed((7'h44))))));
endmodule

module module6
#(parameter param152 = ((((((8'hbf) != (8'ha8)) > ((8'hb5) ? (8'hb6) : (8'hbf))) || ((!(8'h9e)) < ((8'hb7) > (8'hb6)))) ? {(((8'hac) >> (8'hbe)) ? ((7'h42) ? (8'hbc) : (8'hb2)) : (&(8'ha4))), ({(7'h41)} ? {(7'h41), (8'had)} : (8'hb4))} : (({(8'hbc)} ^~ (&(7'h42))) ? (((7'h43) ? (7'h41) : (8'hb5)) | ((8'hbe) << (8'ha3))) : (((8'hae) ? (8'ha8) : (8'hbe)) ? ((8'haf) ? (8'ha3) : (8'hb5)) : ((8'hba) ? (7'h43) : (8'h9e))))) ~^ (({((7'h44) ? (8'hbb) : (7'h40))} * (-((8'hae) ? (8'haf) : (8'hb7)))) + {(((8'hb9) && (8'hb1)) ? ((8'hac) == (8'h9d)) : {(8'hb1), (8'ha7)}), (((8'hbc) ? (8'ha8) : (8'ha9)) ? ((8'had) || (8'ha1)) : ((8'ha7) >= (8'h9e)))})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire151;
  wire [(4'hb):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire130;
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire97,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire49,
                 wire11,
                 wire51,
                 wire52,
                 wire53,
                 wire80,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire130,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
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
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire11 = $unsigned($unsigned($signed(((wire7 != (8'ha6)) ?
                      $unsigned(wire10) : (wire8 ? (8'h9c) : wire8)))));
  always
    @(posedge clk) begin
      reg12 <= $unsigned({(+wire11)});
      reg13 <= wire7[(1'h1):(1'h0)];
    end
  module14 #() modinst50 (.wire15(reg12), .wire16(wire8), .wire17(wire9), .wire18(wire10), .clk(clk), .y(wire49));
  assign wire51 = reg13;
  assign wire52 = {$unsigned(wire10), wire9[(3'h7):(1'h1)]};
  assign wire53 = (reg13[(4'ha):(1'h0)] ?
                      ((reg12[(4'h8):(1'h1)] - (+(wire9 ?
                          wire10 : wire10))) ~^ wire10) : (7'h41));
  module54 #() modinst81 (.wire57(wire10), .wire55(wire9), .wire58(wire7), .wire59(wire8), .wire56(wire51), .y(wire80), .clk(clk));
  assign wire82 = (-wire11[(3'h6):(2'h3)]);
  assign wire83 = ((({$unsigned(wire8), $unsigned(wire7)} ?
                          (~&$unsigned(reg13)) : (wire53[(3'h4):(3'h4)] + {wire11,
                              (8'ha6)})) ?
                      wire10 : (~&({wire80} ?
                          (wire53 >> wire49) : wire53[(1'h0):(1'h0)]))) * $unsigned($unsigned(wire53)));
  assign wire84 = ($signed({(8'ha9)}) ?
                      (wire82[(3'h5):(1'h0)] >= wire10[(4'ha):(4'ha)]) : (wire9 ?
                          (8'ha6) : reg12));
  assign wire85 = $signed({wire49, $unsigned(wire51[(4'hd):(3'h6)])});
  module86 #() modinst98 (.clk(clk), .wire91(wire85), .wire90(wire10), .wire88(wire83), .wire89(wire52), .wire87(wire82), .y(wire97));
  assign wire99 = (wire52 >>> (-(8'hb2)));
  assign wire100 = (wire83[(1'h0):(1'h0)] ~^ wire82[(3'h6):(1'h0)]);
  assign wire101 = wire83[(3'h5):(3'h5)];
  assign wire102 = {(~&{$signed((wire7 && (8'hbe)))}),
                       (~wire53[(4'h8):(3'h6)])};
  assign wire103 = wire99;
  assign wire104 = (~|wire7);
  module105 #() modinst131 (wire130, clk, wire49, wire80, wire103, wire8, wire101);
  always
    @(posedge clk) begin
      reg132 <= wire101;
      if ($unsigned({$unsigned(wire10[(3'h7):(1'h0)]),
          $unsigned($signed($signed(wire99)))}))
        begin
          if (($signed($unsigned($signed($unsigned(wire102)))) ?
              $unsigned((~(^$signed(wire103)))) : $unsigned($signed((~^(reg13 ?
                  (8'ha8) : wire97))))))
            begin
              reg133 <= wire84;
              reg134 <= $unsigned(wire7);
              reg135 <= wire101;
              reg136 <= $unsigned($unsigned((((~&reg135) + $unsigned(wire97)) > $unsigned($signed(wire8)))));
              reg137 <= {wire85[(5'h13):(4'h8)],
                  ((|(-wire85[(3'h7):(3'h4)])) * (($unsigned(wire53) << wire53) <= wire9[(3'h4):(3'h4)]))};
            end
          else
            begin
              reg133 <= ($signed((($unsigned((8'ha5)) + $signed(wire99)) ?
                  (wire100[(5'h13):(3'h5)] ?
                      reg13[(4'hc):(3'h4)] : wire10[(5'h12):(4'hb)]) : (|(7'h44)))) ^ (($unsigned(wire83) ?
                      wire53 : $unsigned((wire97 ? wire51 : reg132))) ?
                  wire104[(4'ha):(1'h1)] : wire10));
              reg134 <= wire85;
              reg135 <= (((reg135[(4'ha):(3'h7)] < wire7[(4'h8):(3'h5)]) ?
                  $signed($signed({wire130,
                      (7'h42)})) : (&$unsigned(wire8))) >>> $signed($signed($signed((wire99 ~^ wire51)))));
              reg136 <= $signed(({$unsigned((8'ha8))} <<< $unsigned((~^reg136))));
              reg137 <= ($signed(wire84[(4'h9):(4'h8)]) ?
                  wire9 : $unsigned($unsigned((wire101 ?
                      {wire7, wire80} : $signed(wire49)))));
            end
          reg138 <= {((~^(&(wire80 <<< wire52))) ?
                  $signed(($signed(wire52) ?
                      (!(7'h41)) : reg134)) : $unsigned(((wire8 ?
                          reg133 : reg13) ?
                      (+wire83) : $signed(wire49))))};
          reg139 <= ($signed({(reg133[(4'hf):(3'h5)] ?
                      (wire84 && wire101) : (wire84 || (8'haf)))}) ?
              reg132 : {(~&reg135[(4'ha):(4'h9)]), wire9});
          reg140 <= (^~$signed($unsigned({wire102[(3'h4):(3'h4)]})));
        end
      else
        begin
          reg133 <= (wire85[(3'h4):(1'h1)] ? wire51[(4'hb):(3'h6)] : wire51);
          reg134 <= wire82[(3'h5):(3'h4)];
        end
      if ((!{$signed($unsigned((wire130 ? (8'hbf) : wire101)))}))
        begin
          reg141 <= $signed($unsigned({$signed($signed(wire8)),
              wire80[(3'h4):(3'h4)]}));
          reg142 <= $unsigned((8'ha0));
          reg143 <= wire11;
          if ((((reg136 == ($unsigned(reg140) ?
                  $signed((8'h9e)) : (reg133 ~^ wire101))) <<< (((reg136 ~^ wire99) & $signed((8'ha8))) ?
                  {$unsigned(wire7),
                      wire10[(4'hb):(2'h3)]} : $signed(wire100[(3'h4):(2'h3)]))) ?
              (reg139 >= {$unsigned($signed(reg136))}) : (wire102[(2'h3):(2'h2)] ?
                  (wire10[(4'hf):(4'hd)] == $unsigned(wire97[(3'h7):(2'h3)])) : (~^(!(wire11 && wire11))))))
            begin
              reg144 <= (wire99 < ($unsigned({((8'hba) ^ wire130)}) ?
                  (8'ha7) : reg12[(4'he):(4'hc)]));
              reg145 <= (((7'h42) < (~^($unsigned(wire80) && ((7'h43) != wire11)))) ?
                  ($signed($signed((wire9 ?
                      wire83 : wire11))) ^ $unsigned($unsigned(wire104))) : ((reg135 ~^ wire80[(4'h8):(2'h2)]) ?
                      wire80[(2'h2):(2'h2)] : wire82[(1'h1):(1'h1)]));
            end
          else
            begin
              reg144 <= {(~$signed((~|(!(8'hb0)))))};
              reg145 <= reg137[(3'h4):(1'h0)];
              reg146 <= $unsigned($unsigned($unsigned($unsigned(reg142))));
              reg147 <= (wire49[(3'h4):(2'h3)] == ((({wire83,
                  wire10} << (^~wire82)) ^ (reg142 && (^~reg145))) | (($unsigned((8'haf)) ?
                  (8'hbd) : wire97[(4'h8):(3'h7)]) > $unsigned(wire80[(1'h1):(1'h1)]))));
            end
        end
      else
        begin
          if ($unsigned(reg139[(1'h1):(1'h0)]))
            begin
              reg141 <= (reg138[(4'hd):(3'h4)] - (((+reg144[(1'h0):(1'h0)]) ?
                  (reg145[(4'ha):(1'h0)] ^~ $unsigned(wire100)) : wire104[(2'h3):(2'h2)]) && $signed((|$unsigned(reg135)))));
            end
          else
            begin
              reg141 <= (^~wire52);
            end
          reg142 <= ({((reg134[(1'h0):(1'h0)] ?
                          $unsigned((8'hae)) : (reg139 ? (8'ha3) : reg145)) ?
                      ((wire53 ?
                          reg141 : wire99) == wire104) : ($signed(wire84) ?
                          (-wire83) : reg136)),
                  (~^((&reg132) >= (reg12 ? reg146 : wire53)))} ?
              {$unsigned((^wire49))} : {((-reg143) ? (8'hbd) : (&(!wire97)))});
          reg143 <= reg133[(4'he):(4'h8)];
          reg144 <= (|$signed(wire104[(3'h4):(1'h0)]));
        end
      reg148 <= ((~&$unsigned($signed($unsigned(reg145)))) - wire103[(3'h4):(1'h1)]);
      reg149 <= ($signed($unsigned({(wire85 ? wire53 : reg13),
          (~wire53)})) - (((~|(^reg143)) ?
              ((reg146 ? reg147 : reg137) ?
                  $unsigned((8'hbb)) : $unsigned(reg136)) : reg138[(2'h2):(1'h1)]) ?
          ((wire85 ? {wire8} : $signed(reg144)) * {((8'hb1) ? reg138 : reg132),
              (wire99 ?
                  reg144 : reg143)}) : ((reg146[(1'h0):(1'h0)] <<< reg137) ?
              wire49[(3'h7):(3'h5)] : (reg141[(4'h9):(4'h9)] ?
                  (reg140 ? wire130 : wire102) : {wire11, (7'h43)}))));
    end
  assign wire150 = $unsigned($unsigned($unsigned(($unsigned(wire97) ?
                       $signed(wire102) : reg136))));
  assign wire151 = (!((reg144[(1'h0):(1'h0)] ~^ wire8[(3'h4):(2'h3)]) ?
                       (((~&(8'ha2)) ?
                           $unsigned(reg144) : (wire7 <= (8'ha1))) ^ (wire99 + (wire85 ?
                           reg138 : wire8))) : ($signed(wire53) ?
                           (-$signed(wire150)) : wire83[(3'h4):(2'h3)])));
endmodule

module module105
#(parameter param128 = ((8'had) ? ({(((8'ha2) ? (8'hb4) : (8'hbf)) ? (^(8'hba)) : ((8'hb0) ? (8'ha5) : (8'h9f)))} ? (~(((8'hb9) ? (8'h9d) : (8'hb2)) ? ((8'hbf) ~^ (8'hbb)) : (-(8'ha8)))) : (|(|(^~(8'ha0))))) : (({(~|(8'ha5))} < (&((7'h41) ? (8'ha6) : (8'ha1)))) || ((((8'hb6) ? (8'hbc) : (8'hb3)) ? (~(7'h44)) : (^~(8'ha8))) ? (|((8'had) + (8'ha8))) : (~&((8'h9e) ^ (8'h9e)))))), 
parameter param129 = ((~|((|(|param128)) ? param128 : ((param128 && (8'hb4)) ? (~^param128) : (-(8'h9e))))) ? ((&param128) ? ((8'ha6) - (param128 ? {(7'h42), (8'ha0)} : param128)) : ((~&(~^(8'h9e))) ? (8'h9f) : (-(-param128)))) : ((^~({param128, param128} & (-param128))) ? (~|({param128} ? (~&param128) : param128)) : (~((param128 ? param128 : param128) <= (param128 ? param128 : param128))))))
(y, clk, wire110, wire109, wire108, wire107, wire106);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire110;
  input wire signed [(3'h4):(1'h0)] wire109;
  input wire signed [(3'h5):(1'h0)] wire108;
  input wire [(2'h2):(1'h0)] wire107;
  input wire [(4'ha):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire127;
  wire [(3'h4):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire111;
  assign y = {wire127,
                 wire126,
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
                 wire112,
                 wire111,
                 (1'h0)};
  assign wire111 = {$unsigned(((((7'h40) ?
                           wire110 : wire107) == wire109[(3'h4):(3'h4)]) >= wire110[(4'h9):(4'h9)])),
                       wire108};
  assign wire112 = $signed($signed($signed((wire111[(2'h2):(1'h0)] ?
                       $unsigned((7'h40)) : wire107[(1'h0):(1'h0)]))));
  assign wire113 = wire111[(5'h12):(5'h10)];
  assign wire114 = wire108;
  assign wire115 = ($unsigned($unsigned($unsigned($signed((8'hab))))) > ((wire112[(3'h6):(2'h3)] ?
                           $signed((wire109 > wire114)) : $signed($signed(wire110))) ?
                       ((+((8'ha3) ? wire108 : wire114)) ?
                           wire114 : (^(8'ha8))) : wire113));
  assign wire116 = ({$signed(wire115[(3'h4):(1'h0)]),
                       ((^$unsigned(wire115)) ?
                           ((wire112 <= wire115) ^~ wire108[(1'h0):(1'h0)]) : wire114)} ^~ (($signed(wire107[(1'h1):(1'h0)]) <= {$signed(wire113)}) ?
                       (!wire109[(2'h3):(1'h0)]) : wire106));
  assign wire117 = wire114[(3'h6):(3'h6)];
  assign wire118 = wire117;
  assign wire119 = wire116[(4'hf):(4'hb)];
  assign wire120 = (&wire108);
  assign wire121 = $signed(($unsigned((^(wire115 ? wire113 : wire106))) ?
                       (~&{$unsigned(wire116), (|wire119)}) : (~wire114)));
  assign wire122 = (($unsigned(wire116[(2'h2):(1'h0)]) >>> $signed($signed({wire118}))) ?
                       (-wire110[(4'h8):(3'h5)]) : $unsigned((wire113 ?
                           (wire112[(2'h2):(2'h2)] ?
                               (wire121 <<< wire107) : $signed(wire115)) : $unsigned($signed((8'hab))))));
  assign wire123 = $signed((-$unsigned((~|$unsigned(wire115)))));
  assign wire124 = ((8'hb2) ?
                       wire113[(3'h4):(1'h0)] : $unsigned((~^$signed($signed(wire123)))));
  assign wire125 = $unsigned(wire124[(3'h6):(1'h0)]);
  assign wire126 = $signed((wire110 ? wire115 : $signed(wire117)));
  assign wire127 = $unsigned($signed(wire119[(2'h2):(1'h1)]));
endmodule

module module86  (y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire91;
  input wire [(5'h15):(1'h0)] wire90;
  input wire signed [(4'he):(1'h0)] wire89;
  input wire signed [(3'h6):(1'h0)] wire88;
  input wire signed [(3'h6):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  assign y = {wire96, wire95, wire94, wire93, wire92, (1'h0)};
  assign wire92 = $signed(((wire87 ?
                      ((wire91 << wire90) ?
                          (wire89 >>> (8'hab)) : {(8'hb3),
                              wire90}) : wire87) << $signed((~^$unsigned(wire88)))));
  assign wire93 = $unsigned($unsigned(((wire91 >= (wire89 * wire91)) ?
                      $unsigned(wire88[(3'h5):(3'h5)]) : (~|wire89))));
  assign wire94 = {$signed((wire90 ?
                          ((wire87 ? wire93 : wire88) ?
                              (wire87 ?
                                  (8'hb8) : wire91) : $unsigned(wire90)) : $unsigned(wire91[(5'h10):(4'h9)])))};
  assign wire95 = $signed((8'hb9));
  assign wire96 = (~$signed((((8'hb0) ?
                      wire88 : $unsigned(wire87)) * ((^wire93) ?
                      wire88 : (wire94 >> wire87)))));
endmodule

module module54
#(parameter param78 = ({(~(((8'haa) * (7'h41)) ~^ {(8'ha2), (7'h43)}))} ? (((&((8'hab) ? (8'ha5) : (8'hba))) ? (|((8'ha5) ? (8'ha4) : (8'ha1))) : ((^(8'hb8)) <<< ((8'hbe) ? (8'hbf) : (8'ha2)))) ~^ ((((8'hae) && (7'h41)) ? ((8'hbd) << (8'ha9)) : ((8'ha2) | (8'haa))) <= (((8'hb8) && (7'h40)) ? {(8'hbe)} : (|(8'hab))))) : ((8'ha9) ^ {(((8'h9c) ? (7'h43) : (8'h9f)) - ((8'hb0) ? (8'h9e) : (8'ha3))), (((7'h41) ? (8'hbf) : (8'hbb)) ? {(8'hab), (7'h41)} : (&(8'hab)))})), 
parameter param79 = (param78 ? param78 : param78))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire59;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire57;
  input wire signed [(5'h14):(1'h0)] wire56;
  input wire [(3'h7):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire62,
                 wire61,
                 wire60,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire60 = $signed(wire56);
  assign wire61 = wire60[(3'h4):(2'h2)];
  assign wire62 = ((wire61 ^~ wire58[(4'ha):(3'h6)]) >= (wire60[(1'h0):(1'h0)] - $signed((|(wire56 ?
                      wire61 : wire60)))));
  always
    @(posedge clk) begin
      reg63 <= wire57[(4'hd):(3'h7)];
    end
  always
    @(posedge clk) begin
      reg64 <= reg63;
      reg65 <= (&$unsigned($signed((8'haf))));
    end
  assign wire66 = ($signed(wire57[(4'ha):(4'h8)]) ^~ $signed(wire60));
  assign wire67 = wire59[(3'h7):(3'h6)];
  assign wire68 = $signed(wire59[(3'h6):(1'h0)]);
  assign wire69 = $unsigned((~|wire56[(3'h5):(2'h3)]));
  assign wire70 = (($unsigned((+((8'h9c) <<< (8'hbf)))) ?
                          (wire69[(3'h7):(3'h4)] | reg63) : ((8'ha9) <= $unsigned(wire55))) ?
                      ((($signed(wire60) < $unsigned(reg64)) ?
                              (&wire61) : $unsigned(wire68[(3'h4):(1'h0)])) ?
                          (wire67[(3'h4):(1'h0)] != wire69) : wire68) : (((|$unsigned(reg65)) ?
                              {(wire67 ? (8'hb4) : reg65)} : {(wire66 ?
                                      wire62 : (8'ha0)),
                                  (|wire60)}) ?
                          (~^wire57[(4'he):(1'h1)]) : $unsigned(($unsigned(wire59) < reg65[(1'h1):(1'h0)]))));
  assign wire71 = wire66;
  assign wire72 = (~^wire55[(1'h1):(1'h1)]);
  assign wire73 = wire66;
  assign wire74 = (wire61 > $unsigned($unsigned((^{wire60, wire71}))));
  assign wire75 = $signed(wire59[(3'h5):(3'h4)]);
  assign wire76 = wire72;
  assign wire77 = (((reg64[(5'h10):(4'hd)] <= (8'ha6)) ?
                      (^~wire59[(3'h6):(1'h1)]) : (8'haf)) | $unsigned($unsigned($signed((reg65 ?
                      wire62 : wire69)))));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire19 = wire16;
  assign wire20 = $signed((($unsigned($unsigned(wire15)) & wire17) != wire15[(1'h1):(1'h1)]));
  assign wire21 = $unsigned((^$signed($unsigned((wire20 >= (8'hb1))))));
  assign wire22 = wire16;
  assign wire23 = $signed((((+(wire17 ?
                          wire19 : wire22)) + wire22[(4'hc):(1'h0)]) ?
                      wire15[(2'h2):(2'h2)] : (wire20[(1'h1):(1'h1)] && (!(wire20 ?
                          wire16 : wire18)))));
  assign wire24 = $signed(((8'h9c) ?
                      wire18[(2'h2):(2'h2)] : $unsigned(wire20[(1'h0):(1'h0)])));
  assign wire25 = wire20;
  assign wire26 = wire17[(3'h5):(2'h2)];
  assign wire27 = wire26;
  always
    @(posedge clk) begin
      reg28 <= wire23[(4'h9):(4'h8)];
      reg29 <= wire25[(1'h0):(1'h0)];
      reg30 <= $signed($unsigned($signed($signed(((8'hac) ? reg29 : wire26)))));
    end
  assign wire31 = ((^{(&$signed((8'ha3)))}) ?
                      $signed(reg29) : $signed(wire15[(1'h1):(1'h1)]));
  assign wire32 = (8'hb4);
  assign wire33 = wire27;
  always
    @(posedge clk) begin
      reg34 <= (wire19[(3'h4):(1'h0)] ?
          {{$unsigned((+wire15)), $signed((!reg30))},
              wire32} : $signed(((^~(~(8'hb8))) >= ({wire27} && (wire22 ?
              wire25 : (8'haa))))));
      reg35 <= wire27;
      if (wire20[(1'h0):(1'h0)])
        begin
          reg36 <= reg34;
        end
      else
        begin
          reg36 <= $signed(reg30[(3'h4):(2'h2)]);
          reg37 <= reg28;
          if (reg37)
            begin
              reg38 <= wire18[(3'h7):(2'h3)];
            end
          else
            begin
              reg38 <= $unsigned(((8'ha9) ~^ $unsigned(($signed(wire27) & wire32[(1'h0):(1'h0)]))));
              reg39 <= reg34;
              reg40 <= {reg38[(4'hb):(4'hb)], (~&wire20)};
              reg41 <= reg35[(1'h0):(1'h0)];
              reg42 <= {(({$unsigned(reg39),
                      reg36[(4'h9):(1'h0)]} + $unsigned((!(8'ha9)))) && $unsigned(($unsigned((8'ha8)) != $unsigned(reg35))))};
            end
          if ($signed($signed({reg42})))
            begin
              reg43 <= wire32;
              reg44 <= ($signed(wire25) * (~&$signed({(~|wire22),
                  ((8'hb3) + wire22)})));
              reg45 <= (reg29[(4'ha):(2'h2)] ^ $unsigned((($unsigned(reg38) ?
                  $signed(wire19) : $unsigned(wire15)) || (wire16[(2'h3):(2'h2)] ?
                  reg43 : (~wire15)))));
              reg46 <= ($unsigned($signed($unsigned((wire24 <= wire24)))) ?
                  $unsigned(($signed($signed(reg41)) ?
                      $signed((reg39 ? reg37 : reg35)) : $unsigned((wire32 ?
                          reg28 : wire25)))) : $unsigned((^~$signed((reg44 <= reg28)))));
            end
          else
            begin
              reg43 <= $signed(((~(-(reg44 ? wire16 : wire33))) == wire26));
            end
        end
      reg47 <= reg43[(3'h7):(3'h5)];
      reg48 <= (($signed(($signed(reg34) ? {wire20} : wire31[(3'h6):(3'h5)])) ?
          (|(reg38[(2'h3):(2'h3)] ?
              $signed(reg29) : reg46[(4'hd):(4'ha)])) : $signed(reg43[(1'h0):(1'h0)])) >= $unsigned(wire17[(1'h1):(1'h1)]));
    end
endmodule
