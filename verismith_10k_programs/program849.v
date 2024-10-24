module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire200;
  wire signed [(2'h2):(1'h0)] wire199;
  wire [(3'h7):(1'h0)] wire198;
  wire [(3'h4):(1'h0)] wire197;
  wire [(4'hb):(1'h0)] wire196;
  wire signed [(4'hc):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire174;
  wire [(3'h7):(1'h0)] wire172;
  wire signed [(4'hd):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(3'h6):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg187 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg [(4'hd):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg182 = (1'h0);
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire189,
                 wire188,
                 wire174,
                 wire172,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire23,
                 wire7,
                 wire6,
                 wire5,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg27,
                 (1'h0)};
  assign wire5 = (wire4[(1'h0):(1'h0)] ?
                     (wire1[(1'h0):(1'h0)] ?
                         $signed({$signed(wire2),
                             {wire4, (8'hab)}}) : $unsigned((+(wire2 ?
                             wire2 : wire0)))) : wire2);
  assign wire6 = wire2;
  assign wire7 = wire5[(3'h5):(1'h0)];
  module8 #() modinst24 (.clk(clk), .wire11(wire2), .wire10(wire5), .y(wire23), .wire9(wire7), .wire12(wire0));
  assign wire25 = ((8'hbb) ? wire3[(3'h5):(1'h1)] : wire7[(2'h2):(1'h1)]);
  assign wire26 = wire5[(5'h12):(4'h8)];
  always
    @(posedge clk) begin
      reg27 <= (+(((wire1[(1'h0):(1'h0)] ?
              wire6[(1'h1):(1'h0)] : $unsigned(wire2)) ?
          $signed(wire1[(3'h4):(2'h3)]) : {(8'hb8),
              wire5}) ^~ (wire5[(5'h10):(1'h1)] ? {(wire6 - wire0)} : wire26)));
    end
  assign wire28 = {($signed(wire0) << (((~&(8'ha8)) ?
                          $unsigned(wire4) : (wire26 < wire0)) + wire25)),
                      {(($unsigned(wire23) >>> wire3) ?
                              (|(~|(8'ha0))) : (8'h9f))}};
  assign wire29 = wire2[(1'h1):(1'h0)];
  module30 #() modinst173 (wire172, clk, wire25, wire28, wire7, wire3);
  module30 #() modinst175 (wire174, clk, wire3, wire4, wire5, wire29);
  always
    @(posedge clk) begin
      reg176 <= {((wire3 >>> {{wire7}, {wire172, wire5}}) ?
              wire0 : {($signed(wire6) >>> $signed(wire172)),
                  wire7[(3'h6):(1'h1)]})};
      reg177 <= (|{(~wire23), wire2[(3'h6):(2'h2)]});
      if (wire0)
        begin
          reg178 <= (8'hbb);
          reg179 <= wire25;
          reg180 <= ($unsigned(wire1) ?
              (wire172[(3'h6):(1'h1)] ?
                  (((reg177 ? (8'ha8) : reg178) <= reg27[(4'hb):(3'h7)]) ?
                      wire4 : (~|$unsigned(wire7))) : (&(!wire26))) : ({wire25,
                      ($signed((8'hb0)) >= ((8'h9f) ? wire7 : reg176))} ?
                  reg178 : reg178));
          reg181 <= (wire25 ^~ $unsigned((((^reg27) ?
              $unsigned(wire7) : wire1[(3'h5):(1'h1)]) * (wire5 - $signed(wire1)))));
          reg182 <= {wire26,
              ((^$unsigned((7'h41))) ? (&wire7) : wire3[(4'hd):(4'hc)])};
        end
      else
        begin
          if (reg181)
            begin
              reg178 <= ((+((wire172[(1'h1):(1'h0)] != (-reg181)) ?
                      (^wire4[(5'h12):(1'h0)]) : $unsigned($unsigned((8'hbc))))) ?
                  reg176[(3'h4):(2'h3)] : (8'hae));
              reg179 <= ((-(&(~^reg177))) ?
                  $unsigned({$unsigned(wire3[(2'h2):(1'h0)])}) : $signed(reg177));
            end
          else
            begin
              reg178 <= ($signed($unsigned((&((8'hbe) <= wire29)))) ?
                  (~^(wire6 <<< wire1)) : (^wire3[(1'h0):(1'h0)]));
              reg179 <= $signed((-(($signed(reg182) ?
                  reg27[(3'h5):(1'h1)] : reg176[(3'h4):(2'h3)]) ^ (+wire25[(3'h7):(1'h1)]))));
              reg180 <= reg179;
            end
          reg181 <= (8'hbe);
        end
      if ((reg177 ?
          $unsigned(($unsigned(wire28) ?
              $unsigned((~wire174)) : $unsigned((wire23 ?
                  wire174 : wire6)))) : $signed($signed((&wire5[(4'hc):(3'h4)])))))
        begin
          reg183 <= {(&wire26)};
          reg184 <= (8'hb0);
          reg185 <= {($unsigned({$signed(reg179)}) ?
                  wire1[(3'h5):(1'h1)] : reg179)};
        end
      else
        begin
          reg183 <= ({({(reg185 ? wire7 : reg176), (~&(8'ha2))} ?
                      (8'ha3) : reg176)} ?
              wire174 : (&{$unsigned(wire174[(2'h3):(2'h2)]),
                  (!{wire172, (8'ha4)})}));
          reg184 <= (((reg183[(2'h2):(1'h1)] <= ((wire5 ?
                  wire26 : wire2) != (&(8'h9f)))) - $signed(wire23[(3'h4):(1'h1)])) ?
              ({$signed($signed(wire4)),
                  wire172[(3'h6):(2'h3)]} ^ ($signed((&wire4)) ?
                  wire28 : $unsigned({reg182,
                      wire1}))) : $unsigned($signed($unsigned($unsigned(reg179)))));
          reg185 <= (~|(~&$unsigned($unsigned((~^wire2)))));
          reg186 <= wire172[(3'h4):(2'h3)];
        end
      reg187 <= $unsigned($signed((+(((8'ha3) ? wire28 : wire174) ?
          ((7'h42) ? wire2 : wire172) : (wire2 >>> reg178)))));
    end
  assign wire188 = (&(reg187[(4'hb):(3'h4)] << ({(8'hb1), (~reg176)} ?
                       wire4 : (!(-wire7)))));
  assign wire189 = (!wire0[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg190 <= $unsigned($unsigned($unsigned($unsigned($unsigned(wire172)))));
      reg191 <= reg178;
      reg192 <= {wire174[(1'h0):(1'h0)],
          ((~$signed($unsigned(wire23))) ?
              (wire174 ?
                  ((&(8'ha9)) ?
                      (8'hb6) : (wire3 < (8'hb8))) : (wire29 >>> (8'hab))) : {$unsigned((reg191 ?
                      wire28 : wire25)),
                  $signed($signed((8'haa)))})};
      if (((~^(~|($unsigned(wire28) ^~ reg27))) ?
          $unsigned((wire6 ?
              (~&reg187[(5'h10):(3'h6)]) : ((reg181 <= wire5) >> (wire26 << wire2)))) : ((8'ha0) ~^ (~&(^$signed(reg182))))))
        begin
          reg193 <= (reg186[(3'h5):(1'h0)] ?
              wire29[(4'h9):(1'h0)] : ((^$signed(reg185)) << $unsigned($unsigned($signed(wire25)))));
          reg194 <= reg186;
          reg195 <= {(reg27 ?
                  $signed(reg187) : $signed($signed($unsigned(wire3))))};
        end
      else
        begin
          reg193 <= ((8'hb0) ?
              ((|$unsigned((~&wire4))) == ($signed({wire29,
                  reg195}) <<< (wire26[(3'h7):(3'h5)] ~^ (-(8'hb0))))) : ($unsigned(({wire28} == (^~(8'hac)))) ?
                  (wire7 ?
                      $unsigned(reg183[(4'he):(4'ha)]) : wire26) : (((^~reg183) ?
                          (~|reg194) : (!wire7)) ?
                      $signed((reg176 ?
                          wire28 : reg177)) : $signed(wire29[(2'h2):(2'h2)]))));
          reg194 <= $signed((($unsigned($unsigned(wire174)) | reg178) < reg185[(2'h2):(1'h1)]));
        end
    end
  assign wire196 = wire23;
  assign wire197 = $signed(wire5[(1'h1):(1'h0)]);
  assign wire198 = wire189;
  assign wire199 = wire7;
  assign wire200 = $signed((|$unsigned((^$signed(reg187)))));
endmodule

module module30
#(parameter param170 = (((8'hbd) - {(((8'hbd) << (8'hb4)) ? ((7'h40) | (7'h41)) : (^~(8'had))), {((8'haf) ^~ (8'ha9))}}) ? {((+((8'hac) ? (8'hbb) : (8'hbc))) ? {(&(8'hbf))} : {{(8'hb3)}}), (~^{((8'ha6) ? (8'hae) : (8'hb4)), (+(8'hbc))})} : (((^~(!(7'h44))) ? (((8'haa) * (7'h43)) << ((7'h42) ? (7'h41) : (8'ha7))) : (((8'hbe) ? (8'hbf) : (8'hb3)) != {(7'h44), (8'ha6)})) ? (~&((8'ha1) >> ((8'ha7) > (8'hb5)))) : (+(+((7'h42) ? (8'hbe) : (8'hb6)))))), 
parameter param171 = param170)
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h284):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire [(5'h13):(1'h0)] wire33;
  input wire [(5'h11):(1'h0)] wire32;
  input wire signed [(4'hd):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(4'h9):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  reg [(4'hf):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg166 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire103,
                 wire101,
                 wire77,
                 wire76,
                 wire71,
                 wire69,
                 wire53,
                 wire52,
                 wire36,
                 wire35,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg54,
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
                 (1'h0)};
  assign wire35 = $signed((wire33[(2'h2):(1'h1)] ?
                      (&(~^$signed(wire32))) : (8'hbe)));
  assign wire36 = $unsigned($unsigned((~|((wire34 + wire31) < $unsigned(wire34)))));
  always
    @(posedge clk) begin
      reg37 <= wire34[(3'h4):(1'h0)];
      if (wire36[(1'h0):(1'h0)])
        begin
          reg38 <= ((((8'hb2) || ({wire33} ?
                      wire35[(1'h1):(1'h0)] : $signed((8'hb6)))) ?
                  wire33[(3'h4):(3'h4)] : ((^~reg37[(2'h3):(2'h3)]) == $signed((~^wire36)))) ?
              $unsigned((+(wire36[(1'h0):(1'h0)] && (wire35 ?
                  wire36 : wire36)))) : $signed($unsigned(wire33[(4'h8):(2'h3)])));
          reg39 <= reg38;
        end
      else
        begin
          reg38 <= {$signed($signed((+(wire31 <<< wire34))))};
          reg39 <= wire31[(3'h5):(1'h0)];
        end
      if (reg39)
        begin
          reg40 <= wire34;
          reg41 <= {($unsigned(({reg38} ?
                  ((8'haa) ? reg40 : reg37) : wire31)) ^~ {reg37[(4'ha):(4'ha)],
                  $unsigned(reg38)}),
              (wire33 == {(8'hb8)})};
        end
      else
        begin
          reg40 <= (^~{(~wire36[(1'h1):(1'h1)]), {wire34[(4'hb):(3'h4)]}});
          if (($signed((~&{reg40})) == (&(|(+reg38[(1'h0):(1'h0)])))))
            begin
              reg41 <= {$signed(reg39[(3'h5):(1'h0)]),
                  (!wire35[(1'h0):(1'h0)])};
            end
          else
            begin
              reg41 <= (~|{wire34[(4'h9):(3'h6)], $unsigned((|(7'h42)))});
            end
          reg42 <= reg41;
          reg43 <= $unsigned($unsigned($signed(((reg39 <<< reg39) >> (!wire34)))));
        end
      if ({reg41, $unsigned(wire31[(4'hb):(3'h7)])})
        begin
          reg44 <= (~$signed($signed($unsigned(reg39))));
        end
      else
        begin
          reg44 <= $unsigned(reg37[(3'h7):(3'h7)]);
          reg45 <= (($unsigned((((8'hb2) ? (8'had) : wire35) ?
                  ((8'hae) ? reg41 : reg40) : (^~reg42))) ?
              $signed((&$unsigned(reg44))) : ({(wire32 ?
                      (7'h40) : wire35)} ^ wire35[(3'h5):(1'h0)])) ^ reg37);
          reg46 <= ((($signed(reg43[(4'ha):(4'h9)]) > reg37) & ((&(wire31 ?
                  wire31 : (8'ha9))) ?
              (wire33 ?
                  $unsigned((8'hac)) : (-wire34)) : ($unsigned(reg42) <<< $unsigned((7'h40))))) <= (+reg43[(4'hd):(1'h0)]));
          reg47 <= (-wire34);
          reg48 <= {{$signed((+(-reg38)))},
              (~^(wire34 ~^ (&(reg38 ? (8'haa) : (8'hb3)))))};
        end
      if (((reg38 ?
          reg37[(2'h3):(2'h3)] : $unsigned($signed(reg47[(3'h4):(3'h4)]))) | ($unsigned($unsigned($signed(reg42))) < reg46[(1'h1):(1'h1)])))
        begin
          reg49 <= (!reg43[(4'h8):(2'h2)]);
        end
      else
        begin
          reg49 <= $signed((~^$unsigned(wire36)));
          if ($signed((~^{reg47, wire35})))
            begin
              reg50 <= $unsigned($signed($signed(reg41)));
              reg51 <= $signed((^~reg44));
            end
          else
            begin
              reg50 <= {wire36[(3'h4):(1'h0)],
                  $signed($unsigned(((~&reg44) ? (^~(8'hab)) : (+wire31))))};
              reg51 <= $unsigned(($signed({$signed(reg42)}) ~^ reg44));
            end
        end
    end
  assign wire52 = ({($unsigned((reg46 & reg40)) ?
                          {reg42[(1'h0):(1'h0)]} : wire31),
                      (((^reg38) ? reg43 : reg37) || (reg41 ?
                          $signed(wire34) : (^reg48)))} >> wire32[(4'h8):(1'h0)]);
  assign wire53 = {(reg41[(4'hc):(3'h5)] ?
                          ($unsigned($unsigned(reg38)) != {(reg47 ?
                                  reg46 : reg47)}) : $signed(wire32[(4'hb):(3'h6)])),
                      (8'hac)};
  always
    @(posedge clk) begin
      reg54 <= (-$unsigned(wire35[(2'h2):(1'h0)]));
    end
  module55 #() modinst70 (.wire56(wire53), .wire57(wire36), .wire58(reg41), .y(wire69), .wire59(reg54), .clk(clk));
  assign wire71 = $unsigned((~&wire35));
  always
    @(posedge clk) begin
      reg72 <= $signed($unsigned(($signed((&reg49)) ?
          reg50 : $signed({reg39, wire69}))));
      reg73 <= $unsigned((((~|{reg38}) ?
          $signed((^~(8'ha8))) : (-(wire34 == reg45))) > ((-$signed((8'hbc))) ?
          ((wire34 >> wire69) ? $signed(reg47) : $unsigned(reg48)) : ((wire53 ?
                  reg38 : wire36) ?
              wire52 : (~^reg49)))));
      reg74 <= {$signed(wire53)};
      reg75 <= (reg37 ?
          $unsigned($unsigned(wire36[(4'h8):(2'h2)])) : {wire71[(3'h7):(3'h5)]});
    end
  assign wire76 = ((!(+reg44[(1'h0):(1'h0)])) > {$unsigned(reg75),
                      $unsigned($signed((wire35 ? reg42 : reg37)))});
  assign wire77 = $signed($unsigned((((reg46 ?
                      reg74 : wire52) && $signed(reg46)) ~^ ((reg48 >= reg74) + reg37[(3'h4):(3'h4)]))));
  module78 #() modinst102 (wire101, clk, wire71, wire76, reg43, reg44);
  assign wire103 = (~|{($unsigned($unsigned(wire71)) ?
                           {(~reg40)} : ((wire31 ?
                               (8'hbf) : reg75) && $signed(wire71))),
                       ($signed((reg41 >= (8'ha2))) ?
                           $unsigned($unsigned(reg45)) : (reg49 ?
                               reg51 : wire101))});
  module104 #() modinst148 (wire147, clk, wire69, reg38, reg42, wire34);
  assign wire149 = reg54;
  assign wire150 = reg38;
  assign wire151 = (((!$unsigned($unsigned(reg39))) ?
                           ((^wire52[(3'h6):(2'h2)]) || reg46[(2'h3):(1'h0)]) : wire76[(4'hb):(3'h5)]) ?
                       reg72 : $unsigned((|((wire53 & reg41) ?
                           wire33 : {reg45}))));
  assign wire152 = reg50;
  assign wire153 = $signed(wire31[(2'h2):(1'h1)]);
  assign wire154 = (~|$signed($signed($unsigned(wire101[(2'h3):(1'h0)]))));
  assign wire155 = $signed(((wire33 << ((^~wire35) ?
                           reg44[(1'h1):(1'h1)] : (reg48 | wire150))) ?
                       (8'ha6) : reg48[(5'h11):(5'h10)]));
  assign wire156 = (wire52[(4'ha):(3'h7)] >> {$signed({wire53[(4'h9):(3'h7)],
                           (wire150 ? reg49 : (8'haa))}),
                       (+wire154[(4'h8):(1'h0)])});
  always
    @(posedge clk) begin
      reg157 <= (8'hab);
      if (reg41[(4'hb):(4'hb)])
        begin
          if ((^$unsigned(wire35)))
            begin
              reg158 <= $signed((wire154[(1'h1):(1'h1)] ?
                  reg47[(1'h1):(1'h0)] : reg49[(1'h1):(1'h0)]));
            end
          else
            begin
              reg158 <= $signed($signed((wire35 ?
                  $signed(wire35[(4'h8):(2'h2)]) : reg49)));
              reg159 <= wire147;
              reg160 <= $unsigned((wire53 ?
                  $signed(((reg49 ? reg40 : wire149) ?
                      (~&reg73) : (wire77 ?
                          wire31 : reg51))) : (+(&(reg37 ^~ wire71)))));
            end
          if ($unsigned(((reg41[(4'ha):(3'h5)] || (wire151 + ((8'h9c) ?
              wire103 : wire36))) - wire36[(3'h6):(2'h3)])))
            begin
              reg161 <= ($signed((!$signed($signed(reg54)))) << {$unsigned(reg44)});
            end
          else
            begin
              reg161 <= {(!reg160)};
              reg162 <= (|$unsigned(reg48));
            end
          if (reg51)
            begin
              reg163 <= wire154;
              reg164 <= ($signed({$signed((wire31 ? wire156 : wire52)),
                      $signed($unsigned((8'hae)))}) ?
                  ($signed($signed({reg45,
                      (7'h40)})) < (8'hbf)) : $unsigned(((wire101 == {wire154,
                      reg49}) <= ($unsigned(wire31) ~^ reg49[(4'hb):(3'h5)]))));
              reg165 <= (&reg47);
              reg166 <= ($unsigned((($signed(wire150) || (^wire147)) ?
                  reg51 : $unsigned({wire154}))) < (~&(!(8'ha5))));
            end
          else
            begin
              reg163 <= $signed(wire151[(1'h0):(1'h0)]);
              reg164 <= ($unsigned(wire151) ?
                  (~&$signed(wire52)) : (-reg161[(3'h7):(2'h2)]));
              reg165 <= (8'hb7);
            end
        end
      else
        begin
          if ((~&reg44))
            begin
              reg158 <= ($signed((wire77[(2'h2):(2'h2)] ^ $unsigned($signed(wire103)))) ?
                  wire32 : wire32);
              reg159 <= $signed((&(|{wire153[(1'h0):(1'h0)]})));
            end
          else
            begin
              reg158 <= ($signed(reg75) ?
                  reg54 : $signed((reg49[(3'h4):(2'h3)] ?
                      (!(reg42 ? wire150 : reg48)) : reg50)));
              reg159 <= wire77;
            end
          if ($unsigned(($signed(($signed(reg158) & (reg48 + wire151))) ?
              ((wire35 ? (reg39 <<< wire101) : wire36[(4'he):(4'hd)]) ?
                  $signed((wire155 ?
                      wire53 : (8'ha6))) : (+$unsigned(reg38))) : ($signed((-reg159)) - $signed((8'hbe))))))
            begin
              reg160 <= wire32;
              reg161 <= {wire71[(4'h8):(1'h0)], $unsigned(reg74)};
              reg162 <= (reg158 ?
                  reg45 : ((wire69[(4'hd):(2'h2)] < ((+wire69) ?
                      (~&wire152) : $signed(reg40))) >>> reg43[(4'he):(3'h6)]));
            end
          else
            begin
              reg160 <= reg165[(1'h1):(1'h1)];
            end
          reg163 <= wire76;
          reg164 <= (|(|$signed(reg74)));
        end
      reg167 <= ($unsigned(reg41[(4'h9):(3'h7)]) & {(((reg165 ?
                  wire71 : wire69) <= (reg45 ? wire52 : reg157)) ?
              reg157 : $signed((~^wire149)))});
      reg168 <= wire156;
      reg169 <= ((+wire69) <= wire69[(4'hd):(4'h9)]);
    end
endmodule

module module8
#(parameter param22 = ((((((8'hb1) > (8'hb9)) ? (^(8'hbd)) : ((8'ha6) ? (8'hae) : (8'ha0))) ? (+((8'hb4) ? (8'hbb) : (8'ha8))) : (~(-(7'h42)))) ? ((8'hbb) && ((7'h41) | (8'hb2))) : ((~&((8'hb9) ? (8'had) : (8'ha3))) || (!{(8'hb7)}))) ? ({(((8'h9f) | (8'hac)) ? ((8'h9d) << (8'h9d)) : ((7'h43) ? (8'h9f) : (8'hb6)))} ? ((((7'h43) ? (8'ha1) : (8'haa)) ? ((8'ha8) ? (8'had) : (8'hab)) : ((8'h9e) || (8'ha4))) ? {((8'ha4) ? (7'h44) : (8'haa)), {(8'ha1)}} : (((8'h9f) >= (8'hbc)) + (~|(8'hba)))) : ((((8'ha9) >> (8'ha2)) << (^~(8'hae))) < (((8'ha6) ? (8'h9e) : (8'h9d)) ? {(8'hbc)} : ((8'hb5) ? (8'h9c) : (8'ha9))))) : {(|(!((8'hb3) ? (8'hb2) : (8'hac)))), (({(8'hae)} ? ((8'haa) & (7'h41)) : (8'ha6)) <<< ((~&(8'hb5)) ? ((8'hbc) != (8'ha6)) : (^(8'hb2))))}))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = $unsigned((((((8'hbe) != wire10) ?
                          (+wire9) : (wire11 >= (8'h9f))) ?
                      wire9 : wire11[(3'h6):(1'h0)]) ^ $signed(wire12)));
  assign wire14 = ((wire11 ?
                      {(&(8'hb1)),
                          $signed(((8'hb6) ?
                              (7'h41) : (8'h9d)))} : ((wire9[(3'h5):(3'h5)] > (wire10 * wire13)) ?
                          wire12[(4'h8):(1'h1)] : wire13)) <<< $signed($signed((~|wire12))));
  assign wire15 = wire12;
  assign wire16 = wire14[(3'h6):(2'h3)];
  assign wire17 = (~|{$unsigned(($signed((8'hb2)) - wire16[(3'h7):(3'h7)]))});
  assign wire18 = $signed((~|wire10));
  assign wire19 = (($unsigned(($signed(wire13) & (wire13 << wire18))) ?
                          wire10 : wire16) ?
                      $unsigned(((wire15[(3'h6):(2'h2)] ?
                              $signed(wire16) : wire11) ?
                          (&$signed(wire13)) : ($signed(wire10) && wire16[(3'h4):(1'h0)]))) : $signed(wire17));
  assign wire20 = ({((wire16 - (wire14 ? wire15 : wire13)) ?
                          $unsigned($signed(wire15)) : wire10),
                      $signed(((wire9 ? wire12 : wire15) ?
                          (8'hb2) : wire11))} <<< wire10[(4'hf):(4'hf)]);
  assign wire21 = $unsigned(($signed(wire16) ?
                      wire19[(2'h2):(1'h0)] : (^(8'hbb))));
endmodule

module module104
#(parameter param145 = (~&({({(8'hb8)} >= ((8'hac) <= (8'hb7)))} ? (^~(((8'hb9) ? (8'hac) : (8'hb1)) ? (~&(8'hac)) : {(7'h41), (8'hac)})) : {({(7'h40)} ^~ ((7'h44) ? (8'ha3) : (8'hac)))})), 
parameter param146 = param145)
(y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire108;
  input wire [(2'h3):(1'h0)] wire107;
  input wire [(3'h4):(1'h0)] wire106;
  input wire signed [(3'h6):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire132;
  wire signed [(3'h4):(1'h0)] wire131;
  wire signed [(4'h9):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(4'h9):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire109 = $unsigned(wire107);
  assign wire110 = $unsigned(wire107);
  assign wire111 = {((~$signed(wire106)) ?
                           wire106[(2'h2):(1'h1)] : $unsigned(({wire110,
                                   (8'hbf)} ?
                               (wire106 | wire108) : (wire105 <<< wire105)))),
                       $signed((wire105 == {$signed(wire105), (8'hb1)}))};
  assign wire112 = $unsigned($signed({(((8'haf) || wire107) ?
                           $unsigned(wire109) : $unsigned(wire111))}));
  assign wire113 = (~$signed((((+wire108) && (wire106 ^ (8'ha3))) ?
                       $signed(wire110) : (wire108 <<< wire111))));
  assign wire114 = ((7'h40) >> wire108);
  assign wire115 = (8'hb0);
  assign wire116 = wire113;
  always
    @(posedge clk) begin
      reg117 <= (^~wire105);
      if ((({$unsigned(wire109)} - (wire114[(3'h5):(2'h2)] <<< (^wire107))) == (8'hbe)))
        begin
          reg118 <= ((wire110[(4'ha):(4'h8)] && wire113[(2'h2):(2'h2)]) - ((&wire109[(4'h9):(3'h6)]) ?
              $unsigned($unsigned($unsigned(wire110))) : wire109[(4'he):(4'ha)]));
          reg119 <= (wire111 ?
              $unsigned((~&$unsigned(wire111))) : ((((wire108 <= wire115) ?
                          $signed(wire115) : wire116) ?
                      ($signed(wire116) == {wire105}) : (reg118 ?
                          $unsigned(wire106) : $signed(wire108))) ?
                  ($signed(wire105[(1'h0):(1'h0)]) ?
                      ($signed(wire112) >> $signed(wire112)) : wire111) : ((~|(wire116 ?
                          wire114 : wire108)) ?
                      (wire110 ?
                          $unsigned((8'h9d)) : (wire114 == (8'ha3))) : (8'hb0))));
          reg120 <= (reg119 > ((~^($unsigned((7'h41)) ~^ {wire114})) ?
              ((~(reg118 <<< wire105)) | $unsigned((8'hb1))) : (+{{wire114}})));
        end
      else
        begin
          reg118 <= wire106;
          reg119 <= $unsigned(wire106);
          if ({({((wire107 && wire110) ? (~&wire108) : (+(8'hab))),
                      (wire114[(3'h6):(3'h4)] == $signed(wire111))} ?
                  ((wire113 ? $signed(wire115) : $unsigned(wire109)) ?
                      ((wire106 ? reg119 : wire116) ?
                          (-(8'hbe)) : (wire112 != wire110)) : $unsigned((+(8'ha1)))) : wire105)})
            begin
              reg120 <= ((wire105 >>> {(~((8'ha0) ? wire109 : wire106))}) ?
                  {(wire109 ^~ (|$unsigned(wire113))),
                      $unsigned(($unsigned(wire112) ?
                          wire105[(3'h4):(1'h0)] : wire107[(2'h3):(2'h2)]))} : (~&{(&wire106),
                      {$unsigned(wire108)}}));
              reg121 <= $signed($signed($unsigned($unsigned(wire111))));
              reg122 <= ($unsigned($unsigned($signed(((8'hbc) ?
                      wire114 : wire111)))) ?
                  wire108 : $signed(wire105[(3'h4):(2'h3)]));
            end
          else
            begin
              reg120 <= $signed(((-$unsigned((wire111 >= wire113))) ?
                  wire112 : reg118[(4'h9):(1'h0)]));
              reg121 <= (wire111[(2'h2):(1'h1)] >> $signed($unsigned((~&(reg118 ~^ wire107)))));
              reg122 <= $signed($signed(($signed(reg120) ?
                  wire109 : $signed($signed(reg120)))));
              reg123 <= wire114[(1'h0):(1'h0)];
            end
          reg124 <= $signed((~(~^wire106[(1'h0):(1'h0)])));
          reg125 <= {$unsigned($signed(((wire114 + (8'h9f)) ?
                  wire107 : $unsigned(wire105))))};
        end
      if ($signed(((-reg119[(4'he):(1'h0)]) * (wire112[(2'h3):(1'h0)] && $unsigned((!reg119))))))
        begin
          reg126 <= $unsigned(((~&(~$unsigned(wire115))) ?
              (^~$signed($signed(wire109))) : (wire105 || ((reg120 ?
                  wire115 : reg120) * (~&(8'haa))))));
          reg127 <= ((~(($signed(reg126) - (~reg125)) ?
              $signed(reg117[(4'hb):(4'h8)]) : (|{reg121,
                  reg126}))) ^~ (wire110[(5'h10):(1'h0)] ?
              $unsigned((7'h41)) : (({reg119, wire111} ?
                      $signed(wire116) : reg122[(2'h3):(1'h1)]) ?
                  $signed($unsigned(wire110)) : $unsigned($unsigned(wire114)))));
          reg128 <= $signed((~|reg119[(4'hd):(3'h5)]));
        end
      else
        begin
          reg126 <= $unsigned(((-{$signed(wire109),
              wire112}) >= {(+$unsigned(reg126))}));
          reg127 <= $signed(wire114[(3'h7):(3'h6)]);
          reg128 <= $unsigned(($signed({(+reg126)}) ?
              $signed({$signed(wire107)}) : $signed((((8'hb2) == reg121) ?
                  (wire108 ? wire114 : reg121) : (reg123 ?
                      wire109 : wire109)))));
          reg129 <= reg119;
        end
    end
  assign wire130 = ((reg128[(3'h5):(1'h0)] * ((wire105 ?
                       $unsigned(wire109) : $signed((8'hb6))) * reg129)) ^~ {$signed(($unsigned((8'ha6)) ?
                           $unsigned(reg124) : $unsigned(reg122)))});
  assign wire131 = ((+$unsigned({(wire107 - reg120)})) ?
                       $unsigned(((8'hb6) ?
                           (8'ha7) : $signed((|reg129)))) : $unsigned((8'ha2)));
  assign wire132 = {$signed($signed((8'hb3)))};
  assign wire133 = (($signed((-$signed(reg128))) ~^ (!((8'hb4) <= (~^(7'h40))))) ?
                       wire115[(1'h0):(1'h0)] : (((~&(reg126 ^~ wire112)) == reg126[(1'h1):(1'h0)]) ?
                           {($unsigned(reg128) || $signed(reg124)),
                               (8'haf)} : {$unsigned((wire106 ?
                                   reg128 : wire107))}));
  assign wire134 = wire115[(2'h2):(1'h1)];
  assign wire135 = wire132;
  always
    @(posedge clk) begin
      if ((!$unsigned(wire111[(5'h10):(4'he)])))
        begin
          reg136 <= $signed((^$signed((^$unsigned(wire113)))));
        end
      else
        begin
          if (((|$signed({(+wire112)})) ?
              $signed(((+(reg125 | reg119)) ?
                  $unsigned({wire108, (8'h9f)}) : {(|wire110)})) : (wire111 ?
                  reg129[(1'h1):(1'h0)] : $signed($unsigned((wire115 ~^ wire111))))))
            begin
              reg136 <= wire115[(2'h3):(2'h2)];
              reg137 <= (!($signed(($unsigned((8'hb1)) * (wire105 ?
                  reg118 : reg136))) <= $signed(((+wire116) > {reg118,
                  reg127}))));
              reg138 <= reg127;
              reg139 <= $unsigned((&({wire133,
                  (&reg118)} + $unsigned(reg121[(5'h11):(1'h0)]))));
            end
          else
            begin
              reg136 <= reg123;
              reg137 <= $unsigned($signed($signed($signed($signed(wire133)))));
            end
        end
      reg140 <= ((~(&($signed(wire108) ?
          $signed(wire131) : (wire111 ?
              reg125 : reg123)))) > $signed(wire112[(3'h4):(1'h1)]));
      reg141 <= $unsigned($signed(reg129));
    end
  assign wire142 = (!$signed(reg138[(4'hd):(2'h3)]));
  assign wire143 = wire130;
  assign wire144 = $signed($signed(($unsigned(wire108[(2'h3):(1'h0)]) ?
                       reg120[(1'h0):(1'h0)] : {$signed((8'hba)),
                           $unsigned(reg125)})));
endmodule

module module78
#(parameter param99 = (+((((~|(8'ha0)) & (^~(8'h9c))) ? (8'hb7) : ({(8'ha9)} ? {(8'hbd)} : {(8'hb4), (8'had)})) > (~|(((8'hb1) >>> (8'ha8)) ? ((8'ha6) ? (8'ha2) : (8'hbd)) : ((8'ha5) * (8'hb1)))))), 
parameter param100 = (param99 ? param99 : (param99 * param99)))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire82;
  input wire [(2'h2):(1'h0)] wire81;
  input wire signed [(3'h4):(1'h0)] wire80;
  input wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 (1'h0)};
  assign wire83 = ($signed((~&wire82)) ?
                      $signed(wire80[(2'h2):(1'h0)]) : (-$unsigned((((8'ha6) ?
                              wire79 : wire80) ?
                          $signed(wire81) : (wire82 ? wire82 : (8'h9c))))));
  assign wire84 = (7'h42);
  assign wire85 = $unsigned((wire84[(1'h1):(1'h0)] ?
                      wire84 : $signed((8'h9c))));
  assign wire86 = wire79[(2'h3):(1'h0)];
  assign wire87 = $unsigned(wire79);
  assign wire88 = $signed($unsigned(((&wire80) | (!wire83[(2'h2):(1'h0)]))));
  assign wire89 = $unsigned(wire82[(1'h0):(1'h0)]);
  assign wire90 = wire84[(1'h0):(1'h0)];
  assign wire91 = wire80[(1'h0):(1'h0)];
  assign wire92 = ($signed((!(~$unsigned(wire87)))) * $signed((~&($unsigned(wire85) ?
                      wire84[(2'h2):(1'h0)] : wire91))));
  assign wire93 = (wire85 | ((((wire89 ~^ wire81) < $signed(wire82)) ?
                      {wire92[(4'ha):(2'h2)],
                          (^~wire88)} : $unsigned(wire91)) << (~^(|(wire92 ?
                      (8'ha5) : wire88)))));
  assign wire94 = wire91[(4'h8):(3'h7)];
  assign wire95 = {({$signed(wire84)} && (wire83 ?
                          $unsigned(wire81[(2'h2):(1'h0)]) : wire90[(4'hd):(4'hc)]))};
  assign wire96 = (~&wire83);
  assign wire97 = (~|wire83);
  assign wire98 = wire94[(1'h1):(1'h0)];
endmodule

module module55
#(parameter param67 = (((({(8'ha2)} + (~|(7'h42))) ? ({(8'ha7), (8'haa)} >= {(8'hb1)}) : ((7'h40) > ((8'hab) > (8'hb5)))) ? ((+((8'haf) || (8'hb4))) - (|((8'ha9) ? (8'hb0) : (8'ha7)))) : (~&(~^((8'hb2) && (8'h9f))))) != (^~{(((8'hba) ? (8'hb4) : (8'h9c)) ? (-(8'hab)) : (!(8'hb3))), (((8'h9f) ? (8'hbf) : (8'hb3)) || ((8'ha8) & (8'haa)))})), 
parameter param68 = param67)
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire signed [(4'hf):(1'h0)] wire57;
  input wire [(4'hf):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  assign y = {wire66, wire65, wire64, wire63, wire62, wire61, wire60, (1'h0)};
  assign wire60 = {(($signed(wire59[(4'h9):(3'h7)]) ?
                              {wire59} : ({(8'ha2), wire57} ?
                                  (!(8'h9f)) : {(8'h9f)})) ?
                          wire59[(5'h10):(4'h9)] : $signed(wire57[(4'hf):(3'h7)]))};
  assign wire61 = ($unsigned((((wire59 && wire58) > $unsigned((8'ha1))) ?
                      $unsigned(((8'hac) || wire58)) : $unsigned((wire58 ?
                          wire56 : wire56)))) >= $signed($signed({(wire60 && wire58),
                      wire60[(4'ha):(3'h7)]})));
  assign wire62 = (((&(((8'h9c) >>> wire56) ? (+wire60) : (&(8'hb1)))) ?
                          $unsigned(({(8'h9c)} ?
                              (~wire59) : {wire61})) : $unsigned($signed((wire59 >> wire59)))) ?
                      $signed((((^wire58) ? wire58 : $signed(wire58)) ?
                          (&$unsigned(wire57)) : {wire58})) : $unsigned($signed(wire60[(3'h5):(3'h4)])));
  assign wire63 = wire59;
  assign wire64 = wire56;
  assign wire65 = wire59[(4'hd):(4'h9)];
  assign wire66 = $unsigned($signed((^{$unsigned(wire65),
                      wire60[(4'hc):(4'h8)]})));
endmodule
