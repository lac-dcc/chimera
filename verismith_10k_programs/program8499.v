module top
#(parameter param81 = (^~(^~(((~(8'ha4)) >>> (~(7'h41))) > (((8'hb6) ? (8'hbd) : (8'hba)) <= {(8'had)})))), 
parameter param82 = ((((!(param81 ? param81 : param81)) ? ((-param81) + (^param81)) : param81) >>> (8'haf)) ? (^~(&param81)) : (((param81 ? (~&param81) : param81) != ((param81 + param81) ? (param81 << param81) : param81)) >> param81)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire63;
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 wire65,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire63,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg67,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $unsigned(((((wire2 ?
                     wire3 : (8'h9e)) && $unsigned((8'hbc))) * ({wire3} && (-wire0))) == $unsigned(((wire2 ?
                         wire0 : wire3) ?
                     $unsigned(wire1) : $signed(wire4)))));
  assign wire6 = wire3[(3'h7):(2'h2)];
  assign wire7 = ($signed((($unsigned(wire0) | (wire4 ? wire2 : wire1)) ?
                     $signed(wire5[(2'h3):(2'h3)]) : ($unsigned((8'hb3)) ?
                         $unsigned(wire3) : wire5))) == wire3[(3'h4):(1'h1)]);
  assign wire8 = wire1;
  module9 #() modinst64 (.wire10(wire6), .wire13(wire4), .wire12(wire7), .wire14(wire8), .y(wire63), .clk(clk), .wire11(wire5));
  assign wire65 = $unsigned($unsigned(wire63));
  assign wire66 = ((+({$signed((8'hb3))} ?
                      ((wire7 ? wire0 : wire0) ?
                          $signed(wire5) : wire0[(1'h1):(1'h0)]) : wire8[(4'hc):(3'h4)])) << wire3[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      reg67 <= ($signed($unsigned(wire63[(4'hb):(3'h4)])) * ($signed(($signed(wire5) ?
              wire6 : (wire8 ? wire5 : wire8))) ?
          ($signed($signed(wire63)) <= (~&(wire5 | wire5))) : wire6));
    end
  assign wire68 = (reg67 & ($unsigned((~&(wire2 > wire66))) ?
                      ($unsigned((wire4 <<< (8'hbf))) ?
                          $signed(wire5[(3'h4):(3'h4)]) : $signed($signed(wire2))) : wire0));
  assign wire69 = wire8;
  assign wire70 = $signed(($unsigned(wire2[(4'h9):(1'h0)]) ?
                      $unsigned((wire5 ?
                          (wire8 ? (8'hb8) : wire1) : {wire0,
                              wire8})) : $signed(((+wire5) | (7'h41)))));
  assign wire71 = (wire3 ? (8'hbf) : reg67[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg72 <= $signed({$unsigned($signed((|wire66)))});
      reg73 <= ($signed(wire63) ~^ (8'haa));
      reg74 <= $unsigned(wire7[(2'h3):(1'h1)]);
      reg75 <= (8'hb3);
    end
  assign wire76 = $signed((^$unsigned(((wire70 ? wire65 : wire63) ?
                      (~wire6) : (wire68 ? wire5 : reg73)))));
  assign wire77 = wire3[(3'h4):(2'h2)];
  assign wire78 = $signed({$unsigned(((wire5 >= (7'h43)) ?
                          (|(8'ha4)) : $signed(reg74))),
                      $unsigned({$signed(wire65), {wire5}})});
  assign wire79 = wire8;
  assign wire80 = wire4[(1'h0):(1'h0)];
endmodule

module module9
#(parameter param61 = (&(({((8'hbd) + (8'ha4))} < ((-(8'ha4)) ? ((8'h9e) ? (8'ha6) : (8'hb0)) : {(8'hbf)})) ? (({(8'h9e)} >>> ((8'hba) ? (8'hb7) : (8'hb2))) ? (&((8'hae) != (8'ha8))) : (((8'hb3) ? (8'hb2) : (8'hbb)) ? {(8'ha4)} : ((8'ha8) ? (8'hbd) : (8'hbd)))) : (~&(((7'h41) || (8'ha5)) * ((8'had) & (8'ha4)))))), 
parameter param62 = (({(8'had), param61} | (8'ha0)) ? (((~&param61) ? param61 : {((8'hb7) ? param61 : param61), (param61 ? param61 : (8'ha0))}) >> ((~|(param61 != (8'hbf))) ? ((param61 ? param61 : (7'h41)) == param61) : (^~(8'ha8)))) : ({({param61} ? (|param61) : (param61 * param61))} ? (!param61) : (((param61 ? param61 : (8'hb4)) ? {param61} : param61) | ((^param61) ~^ {param61, param61})))))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire57;
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire20,
                 wire21,
                 wire57,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= wire11[(5'h12):(3'h5)];
      reg16 <= $signed((wire14[(2'h3):(1'h1)] ?
          $signed($signed((+wire13))) : $signed((~&(wire13 ?
              wire12 : wire12)))));
      reg17 <= (wire12 || $unsigned({$signed(wire14[(4'hb):(4'h8)])}));
      reg18 <= $unsigned(wire12);
      reg19 <= reg15[(5'h11):(4'hd)];
    end
  assign wire20 = (~|$unsigned($signed($signed((wire14 + reg16)))));
  assign wire21 = (7'h44);
  always
    @(posedge clk) begin
      reg22 <= wire20;
      if (wire12[(3'h5):(3'h4)])
        begin
          if (reg19[(3'h5):(1'h0)])
            begin
              reg23 <= (reg22 ?
                  (wire10[(3'h5):(1'h0)] ^~ {{{reg18, (7'h44)}}}) : reg19);
              reg24 <= $signed(reg18[(2'h3):(1'h1)]);
              reg25 <= (~^({(|(|(8'hbf)))} ?
                  $unsigned({$signed(wire11),
                      (8'ha3)}) : $unsigned(($signed(wire21) ?
                      {reg22} : (^~reg15)))));
              reg26 <= (!$signed(((~|$signed(wire14)) ?
                  $signed(reg23) : ((8'hbc) ^~ (~wire13)))));
              reg27 <= $signed({reg25,
                  ($unsigned({wire13, reg15}) ?
                      wire21 : ($signed(reg16) ?
                          (wire21 ? reg22 : wire11) : reg26[(4'h8):(4'h8)]))});
            end
          else
            begin
              reg23 <= ((^$signed({(^wire13)})) ?
                  wire13[(3'h7):(1'h1)] : ({(^(reg15 ? (8'haa) : wire11))} ?
                      {(|(reg17 ^~ reg22)),
                          ((wire12 >>> wire12) ?
                              wire11[(3'h7):(2'h2)] : wire10)} : (|(!(reg22 >= reg24)))));
            end
          reg28 <= $unsigned((|reg16[(4'hb):(4'hb)]));
          reg29 <= ((8'h9e) >= ($unsigned((^~$signed(wire13))) ?
              (reg23[(3'h7):(2'h3)] ?
                  wire20[(4'h8):(2'h2)] : (reg18 ?
                      {reg25} : reg23[(4'ha):(2'h3)])) : {{reg23,
                      ((8'hb4) ? (8'haf) : reg16)}}));
        end
      else
        begin
          if ((~&$unsigned(reg19[(2'h3):(1'h1)])))
            begin
              reg23 <= reg15;
            end
          else
            begin
              reg23 <= (!$unsigned({$unsigned($signed(reg28))}));
              reg24 <= {($unsigned(((reg24 | reg18) > wire20[(3'h7):(3'h7)])) ?
                      {($unsigned(reg25) ?
                              (wire14 ^~ reg17) : wire10)} : (-($unsigned(reg19) ?
                          (!wire14) : {(8'h9c)}))),
                  ((~|wire13) <<< $signed(reg15))};
              reg25 <= wire12[(1'h0):(1'h0)];
            end
          reg26 <= {$unsigned((|$signed($unsigned(reg28))))};
          reg27 <= {($unsigned(({reg27, (8'had)} ?
                      reg17[(1'h1):(1'h1)] : $signed(wire20))) ?
                  reg22 : reg17),
              $unsigned($signed(((wire21 ? reg27 : reg19) ?
                  reg24 : $signed(reg18))))};
          reg28 <= wire12[(3'h4):(2'h3)];
        end
      reg30 <= (wire20 ?
          reg22 : $signed((reg24[(4'ha):(1'h0)] * ($signed(wire13) != {reg18}))));
      reg31 <= ((8'hbe) ?
          (^(~|(+{reg18}))) : ((-reg18[(2'h2):(1'h0)]) - $signed($signed((reg24 < reg16)))));
      reg32 <= $signed((~&($signed(wire11[(4'he):(3'h4)]) >>> $unsigned($unsigned(reg27)))));
    end
  module33 #() modinst58 (wire57, clk, wire14, reg30, reg23, reg22);
  assign wire59 = ((($unsigned($signed(wire57)) ?
                          (|(reg29 ?
                              (8'ha2) : reg27)) : reg31[(4'hc):(3'h5)]) - $unsigned(((reg30 | reg24) ?
                          (reg17 ? reg28 : reg28) : (wire14 ?
                              reg31 : reg22)))) ?
                      $signed(wire13[(1'h0):(1'h0)]) : $signed(reg24));
  assign wire60 = $signed((|reg27));
endmodule

module module33
#(parameter param55 = ({(+(8'hbb)), (^~(~^{(8'hab)}))} ? (!((+((8'hb8) ^ (8'hb5))) & ({(8'hb7), (8'h9c)} & (~|(8'hba))))) : ({(((8'hb8) & (8'hb0)) ? (7'h42) : {(8'ha1), (8'hb7)}), (((8'hac) ? (8'h9d) : (8'h9f)) ^ ((7'h44) <= (8'hba)))} ? (8'hbc) : (8'hb7))), 
parameter param56 = (~&param55))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(5'h15):(1'h0)] wire35;
  input wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  assign y = {wire54,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire38 = wire35;
  assign wire39 = wire34[(3'h4):(1'h1)];
  assign wire40 = (((!{wire35[(2'h3):(1'h0)]}) <= $signed(($signed(wire37) ?
                          wire36[(2'h3):(1'h1)] : $unsigned(wire34)))) ?
                      $signed(wire35) : wire35);
  assign wire41 = $unsigned(((7'h40) ?
                      (8'h9f) : ((wire34 ? $signed(wire34) : $signed(wire35)) ?
                          (-(wire35 ?
                              wire40 : wire40)) : $unsigned($unsigned(wire34)))));
  assign wire42 = wire35;
  assign wire43 = $signed((^wire40));
  assign wire44 = (({(((8'hbc) ? wire38 : wire34) ^ $signed((8'ha8)))} ?
                      wire38 : ($unsigned((+wire36)) ?
                          $signed(wire42[(4'h8):(3'h7)]) : $unsigned(((8'hb1) >> wire42)))) >= ($signed(wire40[(4'ha):(3'h4)]) ?
                      (^wire43) : $signed((wire42[(3'h7):(3'h6)] ?
                          $signed(wire42) : $unsigned((8'hba))))));
  assign wire45 = wire44;
  always
    @(posedge clk) begin
      reg46 <= $unsigned($signed((wire38[(1'h1):(1'h1)] < {(wire37 && wire43)})));
      if ((~{$unsigned(wire38)}))
        begin
          reg47 <= {(({(wire42 ? wire41 : wire45), (wire43 < (8'hb6))} ?
                  (wire38 ~^ (wire43 ?
                      wire41 : wire36)) : $unsigned(wire41)) & wire43)};
          reg48 <= (8'haa);
        end
      else
        begin
          reg47 <= reg46[(4'hc):(2'h3)];
          if ((8'hae))
            begin
              reg48 <= (8'hae);
            end
          else
            begin
              reg48 <= $unsigned((reg48 | (7'h44)));
            end
          reg49 <= $unsigned((~&$unsigned(($unsigned(reg48) ?
              (-reg47) : (wire34 << wire38)))));
        end
      reg50 <= reg49[(1'h0):(1'h0)];
      reg51 <= (wire44 <<< (^~{$signed((wire36 + (8'h9e))),
          wire42[(3'h7):(3'h6)]}));
    end
  always
    @(posedge clk) begin
      reg52 <= (~|(8'haa));
      reg53 <= $unsigned((^(!reg51)));
    end
  assign wire54 = (reg49 >= wire35);
endmodule
