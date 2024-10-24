module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire218;
  wire signed [(4'h8):(1'h0)] wire217;
  wire signed [(5'h14):(1'h0)] wire212;
  wire [(4'h8):(1'h0)] wire211;
  wire [(5'h15):(1'h0)] wire146;
  wire [(5'h11):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire209;
  reg [(5'h12):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg213 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire212,
                 wire211,
                 wire146,
                 wire150,
                 wire151,
                 wire209,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg148,
                 reg149,
                 (1'h0)};
  module5 #() modinst147 (wire146, clk, wire3, wire1, wire4, wire0);
  always
    @(posedge clk) begin
      reg148 <= (~^wire2);
      reg149 <= wire1;
    end
  assign wire150 = ($signed($unsigned(wire1)) ?
                       (|(8'ha8)) : (wire3[(4'hf):(4'hf)] ?
                           (^($signed(wire3) == (wire3 ?
                               reg149 : wire0))) : ((8'hb6) ?
                               (reg148[(4'h9):(3'h5)] <<< (wire4 ?
                                   wire4 : reg148)) : $signed(reg148))));
  assign wire151 = (|(((^~(7'h43)) ~^ $signed(wire150)) >>> ({$unsigned(wire150),
                           $unsigned(wire1)} ?
                       wire0 : $unsigned((wire0 && wire0)))));
  module152 #() modinst210 (.wire153(wire150), .clk(clk), .wire154(reg149), .wire155(wire2), .wire156(wire146), .y(wire209));
  assign wire211 = wire4[(2'h2):(1'h1)];
  assign wire212 = (|$signed(wire209));
  always
    @(posedge clk) begin
      reg213 <= {({wire150, (|(wire0 ? wire1 : wire146))} ?
              (~(^~(reg149 ? wire1 : wire4))) : ((wire209 ?
                  (wire3 ?
                      wire209 : wire150) : $signed((8'ha6))) < (|(8'hb3)))),
          $unsigned($signed((wire0[(1'h0):(1'h0)] - $unsigned((8'hba)))))};
    end
  always
    @(posedge clk) begin
      reg214 <= {$unsigned(wire146),
          $signed({$signed($signed(wire146)), (-wire151)})};
      reg215 <= ($unsigned((reg213[(4'hc):(1'h0)] ?
          $signed((^(8'hb4))) : $signed(((8'hb9) != wire3)))) & wire211[(2'h3):(2'h3)]);
      reg216 <= $signed((((~|wire0[(4'hb):(1'h0)]) ?
              ((wire0 - reg148) ?
                  ((8'hb1) || wire150) : $signed(reg214)) : ((wire151 * (7'h44)) >> $unsigned(reg214))) ?
          ($unsigned(reg149) ?
              $signed((~wire212)) : ($signed(wire0) ?
                  {wire212, reg148} : reg214[(3'h7):(1'h1)])) : wire151));
    end
  assign wire217 = wire209[(4'hd):(1'h0)];
  assign wire218 = ((wire150[(4'hc):(4'ha)] ? $signed((8'hab)) : (+(8'hbc))) ?
                       (8'hb4) : ($signed($signed($signed((8'h9c)))) ?
                           $signed({reg216[(4'hb):(4'ha)]}) : ({$unsigned(reg148)} ?
                               $unsigned($signed(reg214)) : ((wire1 ?
                                   reg149 : wire0) ~^ {wire2}))));
endmodule

module module152
#(parameter param208 = ((((((7'h41) >= (8'haf)) <<< ((8'h9d) ^~ (8'hb4))) <= ((^~(8'ha3)) ? ((8'ha6) ? (8'hab) : (7'h40)) : (~^(8'hb8)))) ? ({(~(8'hb4))} ^ (((8'h9d) ? (8'hbb) : (8'hac)) ? ((8'hbb) ? (8'hae) : (8'hbe)) : {(8'hb5)})) : ((~^((8'ha6) >> (8'hb1))) ? ((-(8'had)) == ((8'hac) | (8'hb7))) : (!((8'hb6) ? (7'h42) : (8'hb7))))) ? ((7'h42) != ((&((8'ha7) ? (8'hbf) : (8'hb3))) ? ({(8'hb7), (8'hbf)} ? ((8'haa) | (8'hb2)) : ((8'h9e) ? (8'ha2) : (8'hbf))) : {((8'haa) ? (8'hbb) : (8'ha4)), ((8'h9c) ? (7'h42) : (8'hae))})) : {((((8'ha7) | (8'h9d)) ^ (&(8'had))) ? ({(8'hb9), (8'ha8)} | ((8'hb3) ? (8'hb0) : (7'h44))) : ((-(8'hb0)) | {(8'haa), (7'h40)}))}))
(y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire156;
  input wire [(4'h9):(1'h0)] wire155;
  input wire [(4'h8):(1'h0)] wire154;
  input wire signed [(4'he):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire164;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire157;
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  assign y = {wire206,
                 wire164,
                 wire158,
                 wire157,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 (1'h0)};
  assign wire157 = {(((wire154 ?
                           wire153[(3'h7):(3'h5)] : wire154[(2'h2):(1'h1)]) ~^ $signed($signed((8'hb8)))) && (wire153 ?
                           ($signed(wire155) | wire156) : wire153[(4'hc):(1'h0)])),
                       wire155};
  assign wire158 = (wire157[(4'hc):(2'h3)] & wire156[(3'h7):(2'h2)]);
  always
    @(posedge clk) begin
      reg159 <= $unsigned((^~((~^((8'hab) && (7'h41))) >= wire156[(3'h6):(2'h3)])));
      reg160 <= $signed(wire153);
      reg161 <= (~(wire153 ?
          $unsigned($signed((wire155 != reg160))) : wire154));
      reg162 <= wire157;
      reg163 <= wire157;
    end
  assign wire164 = $unsigned((|(~&$unsigned(reg162[(2'h2):(1'h0)]))));
  module165 #() modinst207 (.wire166(wire164), .clk(clk), .wire168(wire153), .wire170(wire156), .wire167(wire155), .y(wire206), .wire169(reg163));
endmodule

module module5
#(parameter param144 = (^((({(8'h9d), (7'h43)} ? {(8'hae), (8'haf)} : ((8'hbc) ? (7'h42) : (8'ha2))) ? ({(8'hb0), (8'hbb)} || ((8'hb4) + (8'had))) : (((8'hb7) >> (8'haf)) * (&(8'hac)))) ? (((!(8'hb9)) ? {(8'had), (8'ha1)} : ((8'ha8) ? (8'hb6) : (8'ha6))) ? ({(7'h40)} ? ((8'hbc) ? (8'h9c) : (8'hbb)) : ((8'ha2) ? (8'had) : (8'hba))) : (((8'had) ? (8'hac) : (8'hae)) ? ((8'h9f) ? (8'hbe) : (8'ha6)) : {(8'hba), (8'ha9)})) : ((((8'ha3) ^ (8'haf)) <<< ((8'hb1) * (8'hbf))) ? (((8'h9f) ? (7'h41) : (8'hab)) ? ((8'ha0) ? (8'ha5) : (7'h44)) : ((7'h44) ? (8'had) : (8'hb6))) : ((~^(8'hb0)) ^ ((8'hb6) << (8'ha3)))))), 
parameter param145 = ((^~{((!param144) ? (8'h9e) : (param144 ? param144 : param144)), param144}) ? ({(8'ha6), {(param144 <= param144)}} ? ((param144 != (|param144)) | param144) : ((((8'h9e) != (8'ha8)) | (^~param144)) ? (param144 ? (8'hbc) : (param144 ? param144 : param144)) : {(param144 >= param144)})) : {(((param144 ? param144 : param144) ? (param144 ? param144 : param144) : ((8'hbb) >= (8'ha7))) & (~&(param144 >= param144)))}))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire142;
  wire signed [(2'h2):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire142,
                 wire93,
                 wire92,
                 wire90,
                 wire22,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $unsigned($unsigned($unsigned($unsigned($signed(wire8)))));
      reg11 <= ((~wire9[(4'h8):(3'h6)]) >= wire6);
      reg12 <= (reg10[(1'h0):(1'h0)] ?
          wire7[(2'h2):(1'h0)] : $unsigned({{(&wire8)},
              ({reg10} >>> wire7[(1'h1):(1'h0)])}));
    end
  assign wire13 = wire9[(3'h7):(3'h5)];
  assign wire14 = $signed(((wire6 - $signed(wire6)) ?
                      reg12[(4'h9):(1'h1)] : $signed(wire8)));
  assign wire15 = ({$unsigned(($signed(reg12) ?
                          (reg11 >= wire7) : ((8'haf) * reg11))),
                      {((~^wire14) ?
                              (~^wire13) : (~wire7))}} <<< wire9[(4'h9):(4'h9)]);
  assign wire16 = wire15[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= (wire15[(1'h1):(1'h0)] ?
          ((((reg12 >>> wire13) ?
                  (reg12 ? (8'had) : wire7) : $signed(wire8)) >> wire6) ?
              wire15[(1'h1):(1'h1)] : (($signed((7'h42)) ?
                  (wire9 <= wire9) : $signed((8'hbe))) >= $unsigned((wire9 <= wire8)))) : $unsigned({wire9[(2'h3):(1'h1)]}));
      reg18 <= wire8[(4'ha):(3'h6)];
      reg19 <= (wire16 | (reg12 ?
          reg18[(4'hc):(3'h4)] : (((-reg12) >>> (reg12 ^ wire13)) ?
              reg18 : (reg11[(1'h1):(1'h1)] << wire13[(2'h3):(2'h3)]))));
      reg20 <= $signed((~|{($unsigned(reg18) << reg11), wire15}));
      reg21 <= $unsigned((+$signed(((wire13 ~^ wire7) <<< (reg11 ?
          reg19 : wire14)))));
    end
  assign wire22 = $signed(($unsigned((~^(!wire15))) != ($unsigned((wire13 ?
                          wire6 : wire7)) ?
                      $signed(wire15[(2'h3):(1'h1)]) : (~|reg21[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire15)
        begin
          reg23 <= $unsigned(wire16[(3'h4):(3'h4)]);
          reg24 <= $signed($signed(wire16[(1'h1):(1'h1)]));
          if ((~|(reg21 || (^~$unsigned((reg24 ? reg17 : wire9))))))
            begin
              reg25 <= $unsigned($unsigned((~wire14)));
              reg26 <= reg19[(2'h3):(1'h1)];
              reg27 <= wire13[(3'h6):(3'h5)];
            end
          else
            begin
              reg25 <= (($unsigned(((wire15 ? reg26 : (8'hba)) ?
                          $signed(reg20) : wire13[(2'h2):(1'h0)])) ?
                      ({$signed(reg12)} && ((reg11 & reg25) >= (reg10 == wire22))) : ((reg24[(2'h3):(1'h1)] ?
                          reg20[(1'h1):(1'h0)] : (wire14 << wire15)) <= (+wire15))) ?
                  reg12[(2'h2):(1'h0)] : $unsigned($signed((~(reg27 ?
                      reg26 : wire9)))));
              reg26 <= wire7[(1'h0):(1'h0)];
              reg27 <= (8'hbe);
            end
        end
      else
        begin
          if (reg25[(1'h0):(1'h0)])
            begin
              reg23 <= reg24[(3'h7):(2'h2)];
              reg24 <= (~&(~|(reg12 & $unsigned(((8'hb9) ? wire9 : wire6)))));
              reg25 <= {$signed(wire7),
                  (reg11[(4'h9):(1'h1)] ?
                      ($signed((reg26 == reg11)) ?
                          $signed((|reg20)) : (&((8'ha0) * (8'hb2)))) : reg24)};
            end
          else
            begin
              reg23 <= (((($signed(wire6) ?
                          $unsigned(wire13) : ((7'h43) <= wire6)) - (!((8'hb2) != reg17))) ?
                      reg27[(3'h7):(1'h1)] : ($unsigned((wire16 ?
                          (8'hb6) : reg17)) < (reg23[(4'hb):(4'ha)] >>> (wire8 ?
                          wire15 : reg25)))) ?
                  wire14[(1'h1):(1'h0)] : (&(&(~|wire22[(3'h4):(2'h3)]))));
            end
          if (reg26)
            begin
              reg26 <= reg24[(2'h3):(1'h0)];
              reg27 <= {$unsigned($unsigned(($unsigned(wire15) ?
                      (wire22 >> reg12) : $signed((8'h9e)))))};
              reg28 <= $unsigned(((~|$unsigned((reg17 ? reg20 : wire16))) ?
                  $unsigned($signed((reg11 ?
                      wire6 : (8'ha9)))) : (($signed((7'h41)) ?
                      reg26[(1'h1):(1'h0)] : (wire7 | wire22)) >>> {reg26,
                      (wire7 >>> reg27)})));
              reg29 <= wire9;
              reg30 <= $signed(($signed(wire15[(1'h1):(1'h0)]) > $signed((~&(!wire8)))));
            end
          else
            begin
              reg26 <= ((^~$unsigned((reg30[(3'h5):(2'h2)] * reg25))) ?
                  reg27[(5'h10):(4'hb)] : $unsigned($unsigned(wire6[(1'h1):(1'h0)])));
              reg27 <= (+($unsigned($unsigned((8'hb9))) ?
                  ($unsigned($unsigned(wire16)) ?
                      $unsigned((reg21 < reg24)) : reg17[(3'h6):(2'h3)]) : {(reg27[(4'ha):(3'h7)] ?
                          {reg10, wire6} : $unsigned(wire16))}));
              reg28 <= $unsigned($unsigned({reg21[(3'h4):(2'h3)],
                  $signed((reg26 ? reg11 : reg19))}));
            end
          reg31 <= reg23;
        end
      reg32 <= reg12[(2'h3):(2'h2)];
      reg33 <= (8'ha6);
      reg34 <= (wire14 || wire9[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg35 <= $unsigned(reg20[(2'h2):(1'h0)]);
      reg36 <= (!wire7[(3'h7):(3'h5)]);
      reg37 <= {($unsigned($unsigned((reg11 << reg34))) == reg27[(3'h7):(3'h6)])};
      reg38 <= ((~^(({reg12, reg17} ?
              {wire8} : wire22[(4'h8):(1'h1)]) ^ ($signed(wire6) || (reg34 ?
              wire8 : reg27)))) ?
          {$unsigned(reg32), wire9} : $unsigned(reg20));
      if ($unsigned(($unsigned((-$signed(reg24))) ?
          $signed($unsigned(reg10[(1'h1):(1'h1)])) : (({(8'ha4)} + (reg28 ?
                  reg20 : wire9)) ?
              $signed((8'h9f)) : wire13))))
        begin
          reg39 <= $signed($signed((!$signed(((8'ha5) ? reg35 : reg24)))));
        end
      else
        begin
          if (wire22)
            begin
              reg39 <= ((reg37 ?
                      reg18 : $unsigned(((reg12 >> reg36) ?
                          {(7'h40)} : reg24[(4'h8):(3'h5)]))) ?
                  (~&($unsigned((reg39 & reg37)) ?
                      $unsigned($signed(wire6)) : $unsigned((reg34 > reg39)))) : $unsigned(reg35));
              reg40 <= $unsigned((|wire16));
            end
          else
            begin
              reg39 <= (8'hb3);
              reg40 <= (^((((~reg31) ?
                  $unsigned(reg33) : $signed(reg11)) || (&(wire7 & reg36))) != (~^((reg25 ?
                  wire6 : (8'hb2)) + (8'hb0)))));
              reg41 <= $signed(wire8);
              reg42 <= (+(reg26[(5'h10):(4'hb)] ?
                  ($signed(wire22) > (^$signed(wire9))) : ($signed({reg37,
                          reg18}) ?
                      (8'ha7) : $signed((reg20 ? reg24 : wire15)))));
            end
          if (wire7[(3'h4):(2'h3)])
            begin
              reg43 <= (8'haa);
              reg44 <= $signed((^~($unsigned(reg24[(4'h8):(2'h3)]) ?
                  (~reg17[(5'h12):(3'h5)]) : reg23[(3'h6):(3'h4)])));
              reg45 <= {reg28};
              reg46 <= {reg10,
                  ($signed($signed((reg11 ~^ reg30))) || (reg26 ?
                      $signed($signed(wire7)) : wire8[(2'h2):(1'h1)]))};
            end
          else
            begin
              reg43 <= reg11;
              reg44 <= (reg35[(4'hf):(3'h6)] && wire6[(3'h4):(3'h4)]);
              reg45 <= (|reg12[(4'ha):(3'h5)]);
            end
          reg47 <= reg36[(1'h0):(1'h0)];
          reg48 <= (^$signed((~^reg21[(3'h4):(1'h1)])));
          reg49 <= (reg18[(3'h5):(2'h2)] || reg34[(1'h1):(1'h0)]);
        end
    end
  module50 #() modinst91 (wire90, clk, reg49, reg30, reg37, reg31);
  assign wire92 = (((~&reg42[(1'h0):(1'h0)]) == reg40[(3'h7):(2'h2)]) ?
                      (((^$signed(reg21)) ?
                              (reg36[(1'h0):(1'h0)] && (wire22 != reg43)) : $signed($unsigned((8'hbf)))) ?
                          (reg21[(1'h0):(1'h0)] + reg49[(3'h5):(2'h2)]) : $unsigned(reg24[(4'ha):(1'h1)])) : $unsigned(({$unsigned(reg45)} ?
                          {{reg41},
                              {wire9, reg36}} : ($signed(reg45) << (reg28 ?
                              (8'hb3) : (8'ha2))))));
  assign wire93 = {$unsigned(reg42[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg94 <= reg17;
      reg95 <= reg11;
      if ($unsigned(((~^wire90) * ((~&reg28[(2'h2):(1'h0)]) ?
          (wire92[(3'h5):(1'h0)] >= wire6[(1'h1):(1'h0)]) : reg28))))
        begin
          if (($signed((((wire93 ? reg40 : reg10) ?
              (&reg12) : $signed(reg43)) <<< $unsigned((reg94 ?
              wire90 : (8'ha2))))) * (~reg34[(3'h7):(3'h7)])))
            begin
              reg96 <= (~&wire6);
              reg97 <= reg36[(3'h5):(3'h5)];
              reg98 <= ($unsigned(((reg36 == reg37[(4'he):(1'h1)]) ?
                  (|(wire90 ~^ reg10)) : (!(~|reg33)))) > ((|$signed(wire13)) ?
                  reg37[(5'h10):(4'he)] : ((~|{reg29}) > $signed((8'hae)))));
              reg99 <= ((wire16 & (($unsigned(wire15) >= wire15[(1'h0):(1'h0)]) | (!(reg45 * wire90)))) & ((reg97 ?
                  reg26 : (~|$signed((8'had)))) != $unsigned((8'h9e))));
            end
          else
            begin
              reg96 <= $unsigned($unsigned($unsigned((~&(8'ha6)))));
              reg97 <= $signed(($signed((~^((8'haa) ? reg33 : reg10))) ?
                  reg28 : wire93[(2'h2):(1'h1)]));
              reg98 <= $signed($unsigned((($unsigned(wire90) ?
                  ((8'hb5) ?
                      reg24 : reg19) : (&wire6)) != (&$unsigned((8'hac))))));
              reg99 <= reg94;
              reg100 <= ({(($signed(reg41) ?
                      (&wire92) : (wire92 ?
                          wire7 : reg45)) & $unsigned((^~(8'hae))))} > ($unsigned(((reg49 << reg44) ?
                      wire14[(1'h0):(1'h0)] : reg46[(3'h5):(2'h2)])) ?
                  ({(^~reg12),
                      $unsigned((8'hb1))} ^ $signed($signed((8'hb6)))) : (&(!{reg99}))));
            end
          reg101 <= reg40[(3'h5):(2'h3)];
        end
      else
        begin
          reg96 <= reg95[(2'h3):(2'h3)];
        end
    end
  module102 #() modinst143 (wire142, clk, reg47, reg35, reg27, reg28);
endmodule

module module102
#(parameter param140 = (~&((~(((8'hba) << (8'ha2)) ^ ((8'hb6) || (8'had)))) & ((((8'hb6) ? (8'hb1) : (8'hb5)) ? ((8'hb9) && (8'hb2)) : ((8'hb1) ? (7'h43) : (8'hbd))) ? (~&(+(8'ha1))) : ({(7'h43), (7'h43)} ? (8'hbb) : {(8'h9e), (8'hba)})))), 
parameter param141 = (~&((8'hb4) ? ({param140, (^param140)} ? param140 : ({param140, param140} | (param140 ? param140 : param140))) : param140)))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire106;
  input wire signed [(5'h12):(1'h0)] wire105;
  input wire [(4'hf):(1'h0)] wire104;
  input wire signed [(2'h3):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire signed [(5'h13):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire118,
                 wire117,
                 wire116,
                 reg130,
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
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg107 <= $signed({$unsigned(wire103[(2'h2):(2'h2)]),
          $unsigned((~^(wire103 << wire103)))});
      reg108 <= ((((wire105 >> (wire104 >> wire105)) ^~ $signed(((7'h42) ?
                  reg107 : wire106))) ?
              (wire104[(2'h2):(2'h2)] ?
                  wire103[(2'h3):(1'h0)] : wire104[(4'hf):(1'h1)]) : (~$unsigned((wire104 ?
                  wire103 : wire104)))) ?
          {wire105} : wire106[(1'h1):(1'h0)]);
      if (((~|($signed((reg107 ? reg107 : wire103)) ?
              wire103 : (+(wire106 ^ reg108)))) ?
          ($signed({(reg107 ^~ wire104), $unsigned(wire105)}) ?
              ({((8'hbf) ? wire104 : wire103), reg108[(4'hf):(4'he)]} ?
                  wire106[(3'h4):(3'h4)] : $signed($signed(reg107))) : $signed(wire106[(1'h0):(1'h0)])) : $unsigned(wire106)))
        begin
          reg109 <= {$signed((8'hb7))};
        end
      else
        begin
          reg109 <= $unsigned($unsigned($unsigned(reg107)));
        end
      if ((reg108[(4'hc):(3'h5)] <= reg108[(3'h5):(3'h5)]))
        begin
          reg110 <= wire105;
          reg111 <= $unsigned(((8'ha4) >>> reg109[(3'h4):(3'h4)]));
          reg112 <= (($unsigned(({wire104} ?
              $unsigned(wire105) : (reg110 << wire103))) != (wire103 ?
              reg110[(3'h6):(1'h0)] : ($unsigned(reg111) ?
                  wire103 : $signed((8'haf))))) <<< ((~&((wire103 ?
                  wire106 : wire104) < reg109)) ?
              $signed(reg110) : $unsigned(((wire105 == reg108) ?
                  wire106[(2'h2):(1'h0)] : (^~reg108)))));
        end
      else
        begin
          reg110 <= reg111[(1'h1):(1'h1)];
          if ($signed($unsigned(wire103[(2'h2):(1'h0)])))
            begin
              reg111 <= reg112[(3'h7):(3'h6)];
              reg112 <= reg110;
              reg113 <= ({wire104,
                      $unsigned(((reg110 ? wire105 : reg111) ?
                          wire106[(2'h2):(1'h1)] : ((7'h43) - wire105)))} ?
                  (((8'hac) ?
                      $unsigned((~&(8'h9f))) : $unsigned((reg111 ?
                          reg109 : (8'hba)))) << reg108) : reg108);
            end
          else
            begin
              reg111 <= $unsigned((~^(~(^~((8'ha8) ? reg109 : reg109)))));
            end
          reg114 <= ((^$unsigned(($signed((8'had)) ?
              {reg112} : (reg112 ?
                  reg113 : reg113)))) > ($signed(wire104[(4'hd):(4'hb)]) & $unsigned(((|wire104) & $unsigned((7'h40))))));
        end
      reg115 <= $unsigned(wire104[(4'h9):(1'h1)]);
    end
  assign wire116 = (+reg115[(1'h0):(1'h0)]);
  assign wire117 = $unsigned((^~(^~reg108)));
  assign wire118 = ($signed((wire117[(4'ha):(2'h2)] >= ({reg112,
                           reg110} * $unsigned(reg107)))) ?
                       (+$signed(($signed(wire117) ^ $unsigned(reg110)))) : wire104[(4'hc):(3'h5)]);
  always
    @(posedge clk) begin
      reg119 <= ($signed(((~&(reg115 | wire116)) <<< $unsigned((wire116 ?
              wire104 : reg112)))) ?
          (&$unsigned({((7'h43) != (8'hb3)),
              $unsigned(reg112)})) : $signed($unsigned(((~^wire117) >> $signed(reg110)))));
      if ({$signed($signed(reg112[(3'h5):(2'h2)])), wire103[(1'h1):(1'h0)]})
        begin
          if ($unsigned((reg114 >= (wire116 ?
              $signed(reg108) : $signed($signed(reg111))))))
            begin
              reg120 <= ($signed((|((~reg109) << (&wire106)))) > (($signed((^~reg112)) * $signed((+reg108))) ?
                  $signed($unsigned(wire105[(4'hf):(4'he)])) : ($unsigned($signed(wire103)) > (((8'hb7) + reg108) ?
                      (wire117 <= reg110) : $signed(reg107)))));
              reg121 <= $signed(($unsigned($unsigned((-wire103))) > reg119));
              reg122 <= reg108;
              reg123 <= (^~(wire106 & wire105[(5'h10):(3'h7)]));
              reg124 <= $signed((8'ha5));
            end
          else
            begin
              reg120 <= (wire103[(2'h2):(1'h1)] && (((!(^~wire103)) ?
                      (^~(~&(8'h9f))) : ((reg124 < reg109) >> $unsigned((8'ha4)))) ?
                  $unsigned(($signed(reg111) ?
                      (~^reg111) : (+reg122))) : $unsigned(({wire117} ?
                      (!reg115) : ((8'ha4) ? reg121 : reg121)))));
              reg121 <= $unsigned((reg113 ^~ $signed((|(wire103 ^ reg114)))));
              reg122 <= reg122;
              reg123 <= $unsigned($unsigned((^~((&wire116) ?
                  $unsigned(wire116) : (reg120 * wire105)))));
            end
        end
      else
        begin
          if (reg122)
            begin
              reg120 <= wire116;
              reg121 <= $signed(({reg107, $unsigned(reg122)} != (7'h42)));
              reg122 <= (~|(~|((!$signed(wire105)) ?
                  (^~reg122) : $signed((8'hbd)))));
              reg123 <= ($unsigned($unsigned(reg115[(1'h1):(1'h0)])) ?
                  (|$signed(reg114[(5'h11):(3'h5)])) : $unsigned(reg123));
              reg124 <= (~&$unsigned($unsigned($unsigned($signed(reg107)))));
            end
          else
            begin
              reg120 <= $unsigned(reg119);
            end
          reg125 <= wire117;
          reg126 <= $unsigned((~wire106[(1'h0):(1'h0)]));
        end
      reg127 <= $signed(reg119[(4'he):(1'h0)]);
      reg128 <= (reg107 <<< (((reg123[(2'h2):(1'h0)] ?
                  (8'hbc) : ((8'ha2) ? reg122 : (7'h40))) ?
              {reg120} : (reg113 ? $signed(reg114) : (&wire105))) ?
          (+($signed((7'h42)) * $signed(reg119))) : ($unsigned(reg121[(3'h7):(3'h4)]) ?
              ($signed(reg115) != (+reg108)) : {(^(8'hb9))})));
      reg129 <= $signed($unsigned(wire106));
    end
  always
    @(posedge clk) begin
      reg130 <= $unsigned(reg123[(3'h5):(3'h5)]);
    end
  assign wire131 = reg113[(2'h2):(1'h0)];
  assign wire132 = ({$signed(($signed(reg128) ?
                           wire131 : (reg130 ? reg109 : (8'ha1)))),
                       $unsigned($unsigned((~|reg109)))} >> reg108[(5'h13):(1'h1)]);
  assign wire133 = $unsigned((^~$signed((wire116[(3'h5):(3'h5)] >= $signed(wire103)))));
  assign wire134 = {(((reg111[(2'h2):(1'h0)] && wire132) + ($unsigned(reg112) ?
                           $unsigned(reg107) : (~&(8'hbe)))) >> ((&(+wire131)) <= reg122[(1'h1):(1'h0)])),
                       reg112[(2'h3):(1'h1)]};
  assign wire135 = $unsigned($unsigned(($unsigned({reg127,
                       reg124}) >> {(-reg119)})));
  assign wire136 = {$unsigned(reg125[(1'h0):(1'h0)])};
  assign wire137 = (-((^~$unsigned(reg121)) ?
                       wire132 : (($unsigned(reg122) & (8'h9d)) >>> $unsigned((reg121 > reg120)))));
  assign wire138 = ((^{$signed($signed((8'hae)))}) ?
                       reg128[(3'h7):(3'h5)] : reg115);
  assign wire139 = (&$signed(reg112[(1'h0):(1'h0)]));
endmodule

module module50
#(parameter param88 = (~{({((8'haa) ? (8'ha5) : (8'ha5)), ((8'hb8) ? (8'hb9) : (8'hbd))} == {((7'h43) >> (8'h9f))}), (!(~|((8'hbc) ? (8'hb7) : (8'hbf))))}), 
parameter param89 = (-param88))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire82,
                 wire79,
                 wire78,
                 wire77,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg84,
                 reg83,
                 reg81,
                 reg80,
                 reg76,
                 reg75,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire55 = wire51;
  assign wire56 = wire54;
  assign wire57 = wire52[(1'h1):(1'h1)];
  assign wire58 = $unsigned((!($unsigned((wire53 ? wire53 : (8'haa))) ?
                      $signed((wire55 + wire54)) : (wire54 ?
                          $unsigned(wire54) : wire56))));
  assign wire59 = ({$unsigned($signed($signed(wire56)))} ?
                      ($unsigned(wire57[(2'h2):(1'h0)]) >> wire52[(4'h8):(3'h4)]) : wire56[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg60 <= wire59[(4'hc):(3'h4)];
      reg61 <= (^~$signed((~(wire55 > $signed(wire58)))));
      if (wire52[(5'h14):(3'h5)])
        begin
          reg62 <= (^~$unsigned(((~|{reg61}) >> $unsigned((~(8'ha9))))));
        end
      else
        begin
          reg62 <= (((|($unsigned((8'h9f)) == (8'hb6))) ~^ $signed($signed((wire51 ?
              wire56 : (8'hb7))))) != {wire58[(2'h2):(2'h2)],
              ($unsigned(wire54[(1'h1):(1'h0)]) ?
                  $signed($unsigned(wire52)) : ($unsigned(wire58) ?
                      wire55 : {reg62}))});
          if ($signed($signed($signed((~((8'hab) >>> reg61))))))
            begin
              reg63 <= $signed($unsigned(($signed(((7'h44) && (8'hbf))) ?
                  reg60[(1'h0):(1'h0)] : ($unsigned(wire53) ?
                      wire59 : $unsigned(wire58)))));
              reg64 <= (~wire51);
            end
          else
            begin
              reg63 <= $unsigned(reg60[(4'he):(3'h4)]);
              reg64 <= (~^wire55);
              reg65 <= (wire57[(2'h2):(2'h2)] | (8'h9d));
            end
        end
      if ($signed($signed(reg64)))
        begin
          if (((+$signed(wire51)) || (((|$unsigned(wire52)) <= (~{wire58})) <= (((wire54 ?
                  reg64 : wire58) ?
              {wire53, wire57} : (wire55 ?
                  wire52 : reg61)) == (~^$unsigned(wire56))))))
            begin
              reg66 <= (!(&(~^((wire55 < (8'hbf)) ?
                  wire55[(1'h0):(1'h0)] : wire51))));
              reg67 <= wire59;
              reg68 <= reg67;
              reg69 <= $signed((wire55 || {$unsigned($unsigned((8'hb0)))}));
            end
          else
            begin
              reg66 <= wire51[(2'h2):(1'h0)];
              reg67 <= ((^~$signed(wire52[(4'h9):(1'h0)])) ?
                  (^(reg65 - ((8'hb2) | reg61))) : (&(-((~|reg62) ?
                      (reg65 > wire57) : $signed(wire59)))));
              reg68 <= reg66;
              reg69 <= {(8'ha8), reg68};
              reg70 <= wire56;
            end
          reg71 <= (wire51 ?
              wire52[(4'hf):(3'h7)] : ($signed((reg66[(3'h5):(1'h0)] == $unsigned(wire58))) ?
                  (!$signed($signed((7'h43)))) : (^wire55)));
          if ($signed(($signed((reg64[(5'h10):(4'h9)] ?
              wire57[(1'h0):(1'h0)] : $unsigned((7'h42)))) ~^ ($signed(((8'hb5) - reg70)) ?
              reg61[(2'h3):(1'h1)] : $signed(reg70)))))
            begin
              reg72 <= $signed((&wire51));
              reg73 <= (wire52 ?
                  (~^((8'hb2) ?
                      ($signed((7'h40)) >= $unsigned((8'hbd))) : $unsigned($unsigned(wire51)))) : $unsigned({($signed(reg65) >>> (7'h41))}));
              reg74 <= $unsigned(wire55);
            end
          else
            begin
              reg72 <= (8'hbd);
              reg73 <= (({(reg63 ?
                          $signed(wire54) : $signed(reg63))} == {reg62}) ?
                  {reg73,
                      (((wire51 ? wire54 : wire55) ?
                              (wire51 ? (8'ha2) : reg68) : ((8'ha1) ?
                                  reg64 : (8'h9d))) ?
                          $signed((reg74 ?
                              wire55 : wire56)) : $unsigned(reg71))} : reg60);
              reg74 <= $unsigned($signed({($unsigned(reg70) ?
                      (reg69 & reg71) : $signed((8'hb6))),
                  (wire57[(1'h1):(1'h1)] >= (8'hae))}));
              reg75 <= $unsigned(wire51[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          reg66 <= (8'hb2);
          reg67 <= ((!((wire57 ? $signed(reg68) : (~wire52)) ?
                  (wire52[(4'hd):(1'h1)] >= reg64) : ((wire53 ?
                      (8'haf) : wire56) != $signed(wire51)))) ?
              {(~&reg64[(4'h8):(4'h8)]),
                  $signed(({reg63} ?
                      reg72[(2'h3):(2'h2)] : $signed(wire51)))} : reg74);
          reg68 <= $unsigned((reg72[(3'h4):(2'h3)] ?
              $signed($signed((+wire57))) : wire56));
          reg69 <= reg75;
          reg70 <= ((!(reg68[(3'h4):(3'h4)] ^~ $signed(reg70))) >= ($unsigned($signed($signed(wire53))) ?
              wire57[(1'h0):(1'h0)] : wire59[(4'h8):(3'h5)]));
        end
      reg76 <= reg62[(3'h6):(2'h3)];
    end
  assign wire77 = $signed(($signed((reg65[(4'hd):(1'h0)] ?
                          $signed(wire56) : (reg70 ? wire52 : wire59))) ?
                      $unsigned((reg73[(3'h6):(3'h4)] << reg74)) : ((reg75[(4'he):(4'hc)] * reg70[(4'hd):(3'h7)]) ?
                          reg63[(2'h3):(1'h0)] : $signed(wire56))));
  assign wire78 = wire59[(5'h12):(3'h4)];
  assign wire79 = reg68;
  always
    @(posedge clk) begin
      reg80 <= ({$signed(reg73),
              {$unsigned((wire51 ^ reg72)),
                  ($unsigned(reg73) ? (^wire58) : wire54[(3'h4):(1'h0)])}} ?
          reg70 : (((~^{reg63}) ?
                  $signed(reg76) : ($unsigned(reg62) ?
                      (wire56 ? reg73 : reg75) : $signed((7'h40)))) ?
              reg72[(2'h2):(1'h1)] : wire58));
      reg81 <= (^~reg76);
    end
  assign wire82 = $signed($unsigned((~$signed(reg81))));
  always
    @(posedge clk) begin
      reg83 <= $signed(((+({reg67} ^ $signed(reg67))) ?
          $unsigned($unsigned(reg80)) : ($signed(wire55) ?
              $signed(wire51[(1'h1):(1'h1)]) : $signed($unsigned(reg74)))));
      reg84 <= reg67[(1'h0):(1'h0)];
    end
  assign wire85 = {(reg72 ?
                          ((8'hb8) ?
                              $signed({reg63,
                                  reg75}) : $unsigned(reg84)) : reg81[(2'h3):(2'h2)]),
                      (8'hb7)};
  assign wire86 = wire56;
  assign wire87 = $unsigned(wire58);
endmodule

module module165  (y, clk, wire170, wire169, wire168, wire167, wire166);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire170;
  input wire signed [(3'h5):(1'h0)] wire169;
  input wire [(4'ha):(1'h0)] wire168;
  input wire signed [(3'h5):(1'h0)] wire167;
  input wire [(3'h4):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire205;
  wire signed [(5'h10):(1'h0)] wire204;
  wire signed [(2'h2):(1'h0)] wire203;
  wire [(4'hb):(1'h0)] wire202;
  wire [(5'h12):(1'h0)] wire201;
  wire signed [(5'h10):(1'h0)] wire200;
  wire [(3'h6):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire192;
  wire signed [(3'h4):(1'h0)] wire191;
  wire signed [(3'h5):(1'h0)] wire190;
  wire [(5'h12):(1'h0)] wire189;
  wire [(2'h2):(1'h0)] wire188;
  wire signed [(3'h5):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire186;
  wire [(5'h13):(1'h0)] wire185;
  wire signed [(4'hd):(1'h0)] wire172;
  wire signed [(5'h11):(1'h0)] wire171;
  reg signed [(2'h2):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg198 = (1'h0);
  reg signed [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg195 = (1'h0);
  reg [(4'hc):(1'h0)] reg194 = (1'h0);
  reg [(4'hc):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg178 = (1'h0);
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(4'h9):(1'h0)] reg173 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire172,
                 wire171,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg184,
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
                 (1'h0)};
  assign wire171 = wire166[(1'h0):(1'h0)];
  assign wire172 = (~wire166[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg173 <= $unsigned((|wire171));
      reg174 <= ((~&{(wire169 ?
              (wire166 ? wire168 : (8'h9c)) : wire167[(2'h3):(1'h1)]),
          (wire168 ^ (wire171 ?
              (8'hb7) : wire166))}) <<< ($unsigned({((8'hbe) != (8'ha3))}) + $unsigned($unsigned($unsigned(wire172)))));
      if ((wire172 ?
          (!(!((~^wire169) ?
              $unsigned(reg173) : $signed(wire166)))) : ((&({wire170,
                  (8'hb7)} | wire167)) ?
              wire166[(1'h0):(1'h0)] : $signed((~|wire168[(4'h8):(4'h8)])))))
        begin
          if ((+wire171))
            begin
              reg175 <= (^{(((reg173 ? reg174 : wire167) ?
                      wire169[(3'h4):(2'h2)] : $unsigned(wire172)) ^ $signed((8'ha5)))});
              reg176 <= $signed($unsigned(reg173[(3'h4):(1'h1)]));
              reg177 <= (wire171[(1'h1):(1'h1)] ?
                  (8'ha8) : (!$unsigned((&wire166[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg175 <= reg177[(3'h7):(3'h4)];
              reg176 <= ($unsigned($signed($unsigned($signed(reg175)))) ?
                  (-wire167[(3'h5):(3'h5)]) : $unsigned($signed({(+reg177)})));
              reg177 <= $unsigned((^~$signed($signed((wire170 - wire167)))));
            end
        end
      else
        begin
          reg175 <= wire170;
          reg176 <= (($unsigned(wire170[(1'h1):(1'h1)]) ? reg174 : wire172) ?
              {(~|((wire172 ? wire167 : wire168) ?
                      wire172[(4'hb):(4'ha)] : reg177)),
                  {(((8'ha3) ? wire170 : reg176) ?
                          wire169 : $unsigned(reg174))}} : ((reg175[(2'h2):(2'h2)] && wire168) ?
                  $signed({$signed(reg177)}) : (wire167 <= ((-reg175) >> (wire172 > wire166)))));
          reg177 <= {$unsigned((8'ha3))};
          reg178 <= (~|reg175);
          reg179 <= wire169;
        end
      if (reg178[(3'h6):(2'h2)])
        begin
          if (($unsigned($unsigned(reg178[(4'h8):(3'h7)])) ?
              ((($unsigned(wire171) ?
                  $unsigned(reg176) : $unsigned(reg177)) << $signed((~wire171))) ^ (-{wire168[(3'h6):(3'h4)]})) : reg176[(2'h2):(2'h2)]))
            begin
              reg180 <= $unsigned($signed($signed(((~reg175) <= reg175[(1'h0):(1'h0)]))));
              reg181 <= (+{(((~|wire170) ?
                      (wire170 ? (8'hbd) : wire172) : ((8'ha9) ?
                          reg173 : (8'h9c))) < {$signed(reg176), reg180})});
              reg182 <= {(^reg173[(3'h5):(3'h4)])};
              reg183 <= $signed((^~{(^~(reg178 * reg180)),
                  (reg177[(3'h7):(3'h4)] ?
                      $unsigned(reg180) : ((8'hae) ? reg181 : wire171))}));
            end
          else
            begin
              reg180 <= $signed($signed($unsigned((~&((8'hbc) <= wire166)))));
            end
        end
      else
        begin
          reg180 <= wire170[(3'h4):(2'h2)];
        end
      reg184 <= $signed({((~&(wire172 >= (8'hba))) && $signed($unsigned(reg173)))});
    end
  assign wire185 = (~^$signed((~^$signed(wire169[(1'h0):(1'h0)]))));
  assign wire186 = wire185[(3'h4):(1'h1)];
  assign wire187 = reg175;
  assign wire188 = $unsigned(reg181[(1'h1):(1'h0)]);
  assign wire189 = (~&(~&wire169));
  assign wire190 = wire185[(3'h4):(2'h3)];
  assign wire191 = (wire185 >>> ({reg173} | (~&($unsigned(reg178) ?
                       $signed(wire189) : $unsigned(wire186)))));
  assign wire192 = $unsigned((($unsigned({reg182}) ?
                           (wire188[(2'h2):(1'h1)] ?
                               $signed((8'hb0)) : (reg183 + reg183)) : ((wire172 ?
                               reg181 : wire189) * wire185[(2'h2):(2'h2)])) ?
                       (wire190[(2'h2):(2'h2)] >= $signed({wire172})) : $unsigned((wire187 ?
                           (wire166 ?
                               reg179 : (8'hb9)) : ((8'h9c) >>> reg180)))));
  assign wire193 = (!$unsigned(wire166));
  always
    @(posedge clk) begin
      if ((+$signed(wire171)))
        begin
          reg194 <= (wire172 ?
              reg178[(4'hb):(3'h4)] : (reg183 ?
                  (^~$unsigned((wire187 ?
                      reg180 : wire190))) : $unsigned(({reg181} ?
                      (!reg184) : (reg180 ? wire168 : (8'hb3))))));
          reg195 <= reg183[(2'h3):(1'h1)];
        end
      else
        begin
          reg194 <= (wire168[(2'h3):(2'h2)] & $signed($signed($unsigned((~^reg184)))));
        end
      reg196 <= $signed(reg178[(3'h6):(2'h3)]);
      reg197 <= reg177;
      reg198 <= $unsigned((-$unsigned(reg175[(2'h3):(2'h2)])));
      reg199 <= (($unsigned(reg196) ?
          {{$signed(wire188), reg198}} : reg197[(4'hb):(1'h0)]) << wire191);
    end
  assign wire200 = ({$unsigned($unsigned($signed(reg184)))} ?
                       ($unsigned(wire188[(1'h1):(1'h1)]) ~^ (-reg178[(3'h4):(2'h2)])) : wire193);
  assign wire201 = (^$unsigned(reg174));
  assign wire202 = (((~^reg183) ?
                           reg196 : (((8'ha2) ^~ reg175) * $signed(reg175[(2'h2):(1'h1)]))) ?
                       ((~|$signed({wire186})) ?
                           (wire172[(1'h1):(1'h0)] >>> ((wire200 ^~ wire201) ?
                               $signed(wire167) : ((8'hbe) + wire171))) : $signed($unsigned({(8'ha3)}))) : ((($signed(wire200) * reg181) - reg177[(1'h1):(1'h1)]) <<< (8'hb5)));
  assign wire203 = ($signed($signed(((wire170 ? reg180 : (8'ha2)) ?
                       (&(8'hbe)) : $unsigned(reg181)))) || ($signed(wire191) ~^ $signed(((^reg197) ?
                       $signed(reg198) : reg177[(3'h7):(2'h2)]))));
  assign wire204 = (!((((reg194 != reg179) - (~reg173)) ?
                       $signed((wire172 ?
                           reg196 : wire190)) : $signed($unsigned(reg195))) ^~ wire189[(4'he):(1'h0)]));
  assign wire205 = {wire201[(3'h7):(3'h7)]};
endmodule
