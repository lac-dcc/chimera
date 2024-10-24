module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire177;
  wire signed [(3'h4):(1'h0)] wire179;
  wire signed [(3'h6):(1'h0)] wire181;
  wire [(4'hb):(1'h0)] wire182;
  wire signed [(3'h7):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire184;
  wire [(5'h13):(1'h0)] wire185;
  wire signed [(3'h4):(1'h0)] wire200;
  wire [(2'h2):(1'h0)] wire201;
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg189 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg [(2'h2):(1'h0)] reg191 = (1'h0);
  reg [(3'h7):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg193 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg196 = (1'h0);
  reg [(3'h5):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(3'h5):(1'h0)] reg199 = (1'h0);
  assign y = {wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire147,
                 wire177,
                 wire179,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 wire200,
                 wire201,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 reg180,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire3[(2'h2):(2'h2)]) ?
          ($signed($unsigned((wire3 ~^ wire2))) <= ({(wire3 ? wire2 : wire0)} ?
              $unsigned(wire0) : ((wire0 > wire3) ~^ {(8'hbf)}))) : wire2[(1'h0):(1'h0)]))
        begin
          reg4 <= $signed((~wire0));
          reg5 <= (~(8'h9f));
          reg6 <= $signed((~^$signed($signed($signed((8'ha9))))));
          if (reg5[(1'h0):(1'h0)])
            begin
              reg7 <= {(&wire0)};
              reg8 <= ((+reg4[(1'h0):(1'h0)]) ?
                  reg5 : ((|wire1[(1'h1):(1'h1)]) ^ reg5));
              reg9 <= (((+{{wire2, reg7}}) ?
                  (^(!(reg5 ?
                      reg4 : reg5))) : {$signed($signed(wire3))}) == $unsigned($signed($unsigned(reg6))));
            end
          else
            begin
              reg7 <= $unsigned((($unsigned(reg9) ?
                  wire2[(1'h0):(1'h0)] : (|(~(8'hae)))) - $signed($unsigned(wire1[(3'h5):(1'h0)]))));
              reg8 <= $signed($unsigned(wire0[(4'hf):(4'hd)]));
              reg9 <= {$signed($signed($signed(wire1[(4'h8):(3'h5)])))};
              reg10 <= {(wire1 ? {(~&(^~reg4)), reg4} : reg7[(3'h4):(2'h2)]),
                  wire0};
            end
        end
      else
        begin
          reg4 <= (-wire0);
          reg5 <= (($unsigned((~|(reg5 >>> reg5))) ?
                  $signed($unsigned(reg10)) : (&reg6[(2'h3):(2'h3)])) ?
              (!$unsigned($signed((+reg4)))) : (!$unsigned($unsigned($signed(reg7)))));
          reg6 <= reg6[(2'h2):(1'h0)];
          reg7 <= $signed(reg10[(2'h3):(2'h3)]);
        end
      reg11 <= reg10[(3'h6):(2'h3)];
      reg12 <= (&(wire1[(2'h3):(2'h3)] ^~ reg7));
    end
  assign wire13 = $unsigned(reg12[(3'h6):(3'h5)]);
  assign wire14 = $signed(reg6[(1'h1):(1'h0)]);
  assign wire15 = ((~|$unsigned(($signed(reg8) ?
                          (reg6 << (7'h43)) : (wire13 ? reg4 : reg7)))) ?
                      ($unsigned(reg6) ?
                          $unsigned(($signed(reg7) ?
                              reg7 : (^~reg11))) : (reg5 ?
                              reg11 : wire14)) : reg7);
  assign wire16 = $unsigned(wire3);
  assign wire17 = (^~(wire1 <= $signed(($unsigned(reg11) || $signed(wire14)))));
  assign wire18 = (~|(~&(!wire17)));
  assign wire19 = {(reg12 - (((wire13 ? reg9 : wire2) ?
                              (~wire2) : $unsigned(wire18)) ?
                          wire16 : $unsigned((wire16 & reg12))))};
  assign wire20 = ($signed((~$unsigned(reg5[(1'h1):(1'h1)]))) ?
                      $signed($unsigned(wire19)) : {wire19,
                          ($signed($unsigned((8'haa))) > {(-wire3),
                              (reg6 ? reg11 : wire13)})});
  assign wire21 = ({$signed($signed((&(8'hb7)))),
                          ((^(wire13 ? wire2 : wire17)) ~^ (8'hae))} ?
                      reg4[(2'h2):(2'h2)] : reg7);
  module22 #() modinst148 (.wire26(wire17), .wire23(reg9), .wire27(wire20), .wire25(wire3), .y(wire147), .wire24(wire2), .clk(clk));
  module149 #() modinst178 (wire177, clk, wire0, wire2, wire17, wire20);
  assign wire179 = reg7;
  always
    @(posedge clk) begin
      reg180 <= ((($unsigned($signed(reg11)) ? reg5[(1'h0):(1'h0)] : {{reg4}}) ?
              (wire20[(4'hc):(4'hb)] ?
                  (reg6 ? (8'hba) : $unsigned(reg12)) : (wire1[(2'h2):(1'h1)] ?
                      wire16 : (reg4 - wire21))) : wire13[(1'h0):(1'h0)]) ?
          $unsigned($signed(((wire18 ? wire21 : reg10) << ((8'h9c) ?
              wire17 : reg12)))) : $signed((&wire2[(5'h15):(5'h10)])));
    end
  assign wire181 = wire14[(2'h2):(1'h1)];
  assign wire182 = wire1;
  assign wire183 = {$unsigned({((reg11 ~^ reg8) >= reg12)}), wire14};
  assign wire184 = (^~(^{(reg180[(4'hf):(3'h7)] ?
                           {wire2, wire18} : wire179[(3'h4):(1'h0)])}));
  assign wire185 = (($unsigned({wire1,
                       $unsigned(wire17)}) & $signed(wire184[(2'h2):(1'h0)])) >> ({((reg8 ~^ reg10) ?
                           (wire2 ?
                               reg10 : wire20) : $unsigned(wire183))} >= (8'ha0)));
  always
    @(posedge clk) begin
      reg186 <= $signed((((|(7'h41)) ?
              wire13[(3'h6):(3'h5)] : $unsigned(reg7)) ?
          wire21 : $signed($unsigned(wire183))));
      if (($unsigned(reg12[(3'h5):(3'h5)]) ?
          ($unsigned((~&(~&wire185))) ?
              {{wire147[(3'h5):(2'h2)],
                      $signed(wire20)}} : wire20) : $unsigned((wire184[(4'hd):(2'h3)] ?
              ((reg6 + wire177) ?
                  (wire17 ? wire18 : wire13) : (reg4 ?
                      reg180 : (8'ha9))) : $signed((reg7 ?
                  wire21 : wire185))))))
        begin
          if ((reg10[(1'h1):(1'h0)] ? wire15[(3'h5):(3'h5)] : $signed(wire1)))
            begin
              reg187 <= reg5[(2'h2):(1'h1)];
            end
          else
            begin
              reg187 <= (-$unsigned((reg7[(2'h3):(1'h0)] * $unsigned(((8'hb2) ?
                  wire183 : (8'h9f))))));
              reg188 <= $signed((~&wire185[(4'h8):(3'h4)]));
              reg189 <= (wire177[(2'h2):(1'h0)] ?
                  $signed({(|{reg4}),
                      $signed($signed(reg8))}) : {{$signed((!(8'hb0)))},
                      wire183[(2'h2):(2'h2)]});
              reg190 <= wire16[(5'h11):(4'h8)];
              reg191 <= reg12;
            end
          reg192 <= (^$unsigned(reg191[(2'h2):(1'h1)]));
          reg193 <= ($unsigned((reg186[(4'hc):(4'h9)] ?
              reg11 : reg190[(3'h4):(1'h0)])) == $unsigned($signed($unsigned($signed(wire16)))));
          reg194 <= reg9[(2'h2):(1'h0)];
        end
      else
        begin
          reg187 <= wire14[(1'h0):(1'h0)];
          reg188 <= ($unsigned((~^$unsigned((&reg10)))) >>> $signed(((~((7'h44) ^ reg11)) ?
              reg9 : $signed((wire182 ? wire2 : reg180)))));
          reg189 <= {$signed($signed($signed(wire13)))};
          reg190 <= $signed(((8'hb1) ?
              reg194[(4'h9):(1'h1)] : ($signed({reg190,
                  (8'hb8)}) >> $signed($signed(wire20)))));
          reg191 <= {(^reg191),
              (({reg9[(3'h4):(2'h3)]} >> $signed((wire18 ?
                  reg8 : reg189))) << (+wire21))};
        end
    end
  always
    @(posedge clk) begin
      reg195 <= (-($unsigned(($signed(wire184) ^~ (!reg12))) ?
          (8'hb7) : {((wire19 != wire16) ^ (wire0 ? wire1 : wire21))}));
      reg196 <= reg191[(1'h1):(1'h0)];
      reg197 <= ($signed($signed((8'hbb))) ?
          $unsigned($signed(reg12[(2'h3):(1'h0)])) : (8'h9e));
      if (reg196[(2'h2):(2'h2)])
        begin
          reg198 <= ((wire1[(1'h1):(1'h0)] >= $unsigned(reg193[(4'hf):(3'h5)])) >> wire179);
          reg199 <= (&$signed((~|wire184)));
        end
      else
        begin
          reg198 <= wire18[(2'h3):(1'h1)];
          reg199 <= {$signed(($signed((wire183 | reg198)) << reg191[(1'h1):(1'h1)])),
              ((reg193[(4'h8):(4'h8)] || reg196) ^ $signed((+(!reg186))))};
        end
    end
  assign wire200 = {(8'ha9)};
  module156 #() modinst202 (.wire160(reg10), .y(wire201), .wire157(wire20), .wire158(wire184), .wire159(wire0), .clk(clk));
endmodule

module module149  (y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire153;
  input wire signed [(5'h15):(1'h0)] wire152;
  input wire [(5'h11):(1'h0)] wire151;
  input wire [(4'h9):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire175;
  wire [(4'hd):(1'h0)] wire173;
  wire [(5'h12):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire154;
  assign y = {wire176, wire175, wire173, wire155, wire154, (1'h0)};
  assign wire154 = wire153;
  assign wire155 = (^{(wire151[(4'h8):(1'h0)] ?
                           ($signed(wire150) ?
                               (wire152 < wire153) : (&wire153)) : wire151)});
  module156 #() modinst174 (wire173, clk, wire155, wire153, wire152, wire151);
  assign wire175 = $signed($unsigned(((wire152[(2'h3):(1'h1)] ?
                           {wire173} : wire173) ?
                       $signed((wire154 | wire152)) : $signed((wire173 < (8'hb4))))));
  assign wire176 = (~&{{$unsigned(((8'hb3) | wire151)),
                           wire173[(1'h0):(1'h0)]}});
endmodule

module module22
#(parameter param145 = (({(((8'hba) ? (8'hbc) : (8'hb3)) + ((8'ha5) - (8'hb0)))} | (~|(^((8'ha6) ? (7'h40) : (8'hbb))))) && (8'hbb)), 
parameter param146 = {(&(^(^(param145 ? param145 : param145))))})
(y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire80;
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  assign y = {wire143,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire82,
                 wire42,
                 wire43,
                 wire80,
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
                 reg84,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= $signed(wire23[(1'h1):(1'h0)]);
      if (wire24[(4'hf):(4'h8)])
        begin
          reg29 <= wire26;
          if ((reg28[(1'h1):(1'h1)] ?
              {(^wire24)} : (~|{$unsigned({reg29, wire27})})))
            begin
              reg30 <= $signed((({(wire27 >>> wire27)} - $unsigned(wire25)) ?
                  {wire23} : wire27));
            end
          else
            begin
              reg30 <= wire23;
              reg31 <= $unsigned(wire27);
              reg32 <= (reg31[(3'h7):(3'h6)] <= (reg28[(2'h3):(2'h3)] ?
                  (7'h43) : $unsigned($unsigned((wire24 ? (8'hb0) : wire25)))));
              reg33 <= reg31[(5'h13):(4'hb)];
              reg34 <= (wire25 ? {$signed((^~wire23))} : reg31[(4'hf):(4'hb)]);
            end
          reg35 <= $signed(wire25);
          if ((({{(reg34 ? reg28 : reg28), $unsigned(reg29)}, reg28} ?
                  $unsigned(wire25) : $signed(((reg29 + (8'hb1)) ?
                      wire23 : ((8'ha9) ? wire26 : reg35)))) ?
              reg35[(2'h3):(2'h2)] : {$unsigned($unsigned({wire25})),
                  reg33[(4'ha):(4'h8)]}))
            begin
              reg36 <= $signed(($unsigned(reg28) ?
                  {(((8'ha8) | (8'hb2)) * $signed(reg30))} : $signed(((reg32 ?
                          reg30 : reg28) ?
                      (reg31 ? reg35 : (8'hac)) : (reg34 <= wire27)))));
              reg37 <= ((~|reg32[(4'h8):(1'h0)]) << reg28[(1'h1):(1'h1)]);
              reg38 <= wire24[(4'ha):(3'h7)];
              reg39 <= $signed($signed(reg30));
            end
          else
            begin
              reg36 <= {reg31};
              reg37 <= wire27;
              reg38 <= wire23;
              reg39 <= $signed($unsigned($signed((~|wire25))));
            end
          if (reg29)
            begin
              reg40 <= (($signed((~&$signed(wire27))) ?
                  (^~((^~wire26) ?
                      wire23[(3'h5):(3'h5)] : $unsigned(wire26))) : ((wire25 ^~ wire26[(3'h6):(1'h0)]) >> (-(~&reg31)))) ^ ((((reg38 <= reg35) ^~ (wire27 ?
                          (8'hbb) : reg30)) ?
                      reg39[(5'h13):(2'h2)] : {{reg29, (8'hb9)},
                          (reg37 ? reg33 : reg34)}) ?
                  reg33[(2'h2):(1'h0)] : (+reg32[(1'h1):(1'h0)])));
            end
          else
            begin
              reg40 <= $unsigned((wire24[(1'h1):(1'h0)] ?
                  (reg28[(1'h1):(1'h1)] ?
                      $unsigned((reg33 ? reg33 : reg29)) : (~^((8'ha5) ?
                          reg36 : reg29))) : ((~^wire26) ?
                      {$unsigned(reg33),
                          $unsigned((8'hae))} : $unsigned(reg28))));
            end
        end
      else
        begin
          reg29 <= reg38;
          reg30 <= (reg38[(3'h5):(3'h4)] ?
              (&reg28) : ((reg34[(1'h1):(1'h0)] ?
                      $unsigned($signed(reg38)) : reg38) ?
                  $unsigned(((wire26 ?
                      reg29 : reg39) > $signed(reg29))) : ($unsigned((reg31 << wire23)) ?
                      ((!wire24) ?
                          wire27 : reg31[(5'h10):(3'h5)]) : $unsigned(reg39))));
          if (((^~reg29[(3'h7):(3'h4)]) - {($signed({reg31, reg37}) ?
                  reg32[(3'h5):(1'h0)] : $unsigned(wire26[(5'h10):(3'h6)]))}))
            begin
              reg31 <= (reg35 ? $signed((^reg34)) : wire24[(5'h10):(4'hc)]);
              reg32 <= ((reg28[(1'h1):(1'h1)] >> (~&((reg30 && wire24) ?
                  reg38[(3'h4):(2'h2)] : wire25))) > reg31[(2'h2):(1'h1)]);
              reg33 <= $signed(((&wire26[(4'hf):(4'hf)]) && ((|$signed(wire26)) ?
                  reg30 : ((wire24 ? reg37 : reg36) ?
                      (reg29 >>> reg37) : wire24))));
              reg34 <= reg30[(1'h1):(1'h1)];
            end
          else
            begin
              reg31 <= $unsigned(reg38[(2'h3):(1'h0)]);
              reg32 <= $signed(reg31[(4'hd):(3'h4)]);
              reg33 <= $unsigned($signed($signed((reg33[(4'h8):(2'h3)] ?
                  (!reg32) : (7'h40)))));
              reg34 <= reg40[(4'h8):(3'h7)];
              reg35 <= reg40[(3'h7):(3'h5)];
            end
        end
      reg41 <= (((((&reg36) ? reg30 : reg34) ?
              ((reg30 | wire27) <= $signed(reg34)) : wire24[(3'h4):(2'h2)]) ?
          ((!$signed(wire23)) && {(wire27 >>> reg33)}) : (!(((8'hb1) <= reg39) ?
              $unsigned(reg40) : (&wire23)))) <<< $unsigned($signed((!reg33[(3'h6):(2'h3)]))));
    end
  assign wire42 = reg28;
  assign wire43 = $unsigned(wire27);
  module44 #() modinst81 (.wire47(reg28), .clk(clk), .wire48(reg35), .wire45(wire42), .y(wire80), .wire46(reg30));
  assign wire82 = (reg31 ?
                      wire42 : ({(wire25 || $unsigned(reg31)),
                              ({(8'had), reg36} ? reg30 : ((8'ha3) ^~ reg39))} ?
                          (~reg33) : reg29[(4'hb):(2'h2)]));
  assign wire83 = $signed(reg38);
  always
    @(posedge clk) begin
      reg84 <= wire26[(3'h5):(3'h5)];
    end
  assign wire85 = ($signed(wire27[(1'h0):(1'h0)]) ?
                      reg30[(3'h7):(1'h0)] : {(^~(8'had)),
                          $signed($signed(((8'hb8) ^ reg28)))});
  assign wire86 = reg35[(4'hd):(1'h0)];
  assign wire87 = $unsigned(wire82[(2'h2):(1'h1)]);
  assign wire88 = $unsigned({($unsigned(reg30) ?
                          ((8'ha7) ?
                              wire24 : reg35) : ($unsigned(reg36) >>> reg40[(3'h4):(1'h0)])),
                      ((+{wire43}) >> reg32[(3'h7):(3'h5)])});
  module89 #() modinst144 (.wire91(reg39), .y(wire143), .wire92(wire25), .clk(clk), .wire90(reg40), .wire94(wire83), .wire93(reg41));
endmodule

module module89
#(parameter param142 = {(((((8'hb6) * (8'hb1)) ? ((8'haf) == (8'hbb)) : (~|(7'h43))) >>> (-((8'hab) <<< (7'h42)))) < (({(8'hac), (8'hb6)} <<< ((7'h40) << (8'hb1))) ? (((8'ha0) & (8'hbe)) || ((8'hb8) ? (8'hb3) : (8'haa))) : (~^{(8'hb6), (8'hbb)}))), {(((~^(8'hb2)) < {(8'hba)}) ? (^(-(7'h40))) : (((8'hb1) ~^ (8'hbc)) ? ((8'ha5) || (8'hba)) : (~&(7'h42))))}})
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire94;
  input wire signed [(4'hc):(1'h0)] wire93;
  input wire signed [(5'h13):(1'h0)] wire92;
  input wire [(3'h5):(1'h0)] wire91;
  input wire signed [(2'h3):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  reg [(4'hb):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire95 = ((+{$signed({wire93})}) == ((~&((~^wire94) ^~ ((8'ha6) ?
                          wire93 : wire91))) ?
                      $signed(wire93[(3'h6):(1'h0)]) : (+(wire90 ?
                          (~wire94) : (~|wire92)))));
  assign wire96 = wire91;
  assign wire97 = ($signed($signed(({(8'haf), wire94} ?
                      {wire92, wire95} : (wire93 ?
                          wire92 : (8'h9c))))) >= $signed($unsigned((^$unsigned(wire96)))));
  assign wire98 = $unsigned(wire97);
  assign wire99 = (~wire95[(4'h8):(2'h3)]);
  assign wire100 = wire95;
  assign wire101 = wire94;
  assign wire102 = ({(-(~$signed(wire95)))} && wire93);
  assign wire103 = wire100[(2'h3):(1'h1)];
  assign wire104 = ($unsigned((wire96 * $signed((|wire92)))) <= $unsigned(((wire98[(4'hc):(4'hb)] ?
                       (~wire102) : $unsigned(wire94)) == wire93[(4'ha):(3'h5)])));
  assign wire105 = wire91[(1'h0):(1'h0)];
  assign wire106 = (wire93 ~^ ((^(~&{wire105})) ?
                       ({(wire94 <= wire97),
                           (wire97 ?
                               (8'hb4) : wire93)} ^~ (wire103[(3'h5):(3'h5)] ^ ((8'hb2) << wire99))) : wire100[(1'h0):(1'h0)]));
  assign wire107 = {(~wire98),
                       ({wire102[(3'h5):(1'h1)]} ?
                           (wire101[(3'h7):(2'h2)] - $signed((wire93 * wire105))) : wire94[(3'h5):(3'h5)])};
  assign wire108 = $signed(wire93[(4'h8):(3'h6)]);
  assign wire109 = wire94;
  assign wire110 = $unsigned(wire102[(3'h7):(3'h5)]);
  assign wire111 = (($unsigned(((wire90 <<< wire104) - wire104)) ?
                       (((wire108 ?
                           wire109 : wire90) & (~wire95)) == (wire95[(4'h9):(3'h4)] ?
                           (8'hbd) : $signed(wire95))) : wire105[(4'h8):(3'h7)]) - ({((wire97 ?
                               wire103 : wire106) << (^~wire96))} ?
                       wire98 : (|$signed((wire97 ? wire108 : wire92)))));
  always
    @(posedge clk) begin
      reg112 <= wire110;
      if (((^$unsigned($unsigned($signed(wire92)))) ?
          (-(wire104[(4'hd):(4'h9)] >= wire105[(4'h9):(3'h6)])) : $unsigned((&(|(wire105 <= (8'ha3)))))))
        begin
          reg113 <= (($signed(($signed(wire111) * (!wire96))) < (wire109[(3'h4):(2'h2)] ?
              wire101[(4'h8):(1'h1)] : ($signed(wire93) ?
                  wire100[(2'h3):(2'h2)] : {wire92}))) < ($unsigned(($unsigned(wire104) ?
                  {wire109} : wire96)) ?
              wire92 : wire90[(1'h1):(1'h1)]));
          if ((($signed(($unsigned(wire93) == $signed((8'h9e)))) ?
                  (((~^wire99) ? (8'ha4) : {wire100, reg112}) ?
                      wire95 : wire95[(3'h5):(3'h4)]) : $unsigned(wire101)) ?
              $signed((((wire98 ?
                  wire101 : wire109) > wire100[(2'h3):(1'h0)]) >>> wire103[(2'h2):(2'h2)])) : ($signed(($unsigned(wire94) ?
                  wire110[(3'h6):(2'h2)] : (reg113 ?
                      wire98 : (8'ha6)))) <<< (8'h9c))))
            begin
              reg114 <= $signed(((($signed(wire94) ?
                      (wire97 <<< wire105) : (wire108 ?
                          (8'hb9) : wire95)) > wire91) ?
                  wire107 : wire98));
              reg115 <= $signed(($unsigned((wire94 ? wire96 : (8'h9c))) ?
                  (wire96[(4'h9):(4'h8)] & wire107[(2'h3):(2'h2)]) : (((^reg114) ^~ (^~(8'ha9))) ?
                      wire93 : (wire90 ?
                          $signed(wire93) : $unsigned((8'ha0))))));
              reg116 <= $signed($unsigned($signed($unsigned((wire102 ?
                  wire97 : wire109)))));
              reg117 <= wire103[(1'h1):(1'h1)];
            end
          else
            begin
              reg114 <= (($signed((-(8'hb0))) ?
                      ((~(^wire91)) ?
                          wire91 : $signed((wire109 ?
                              reg112 : (8'hbf)))) : wire110) ?
                  (~|wire97) : {wire101[(3'h5):(2'h2)],
                      $unsigned((reg115[(5'h10):(3'h7)] ?
                          (~wire104) : (wire104 == wire99)))});
              reg115 <= $signed((wire94 | $signed({(reg112 ^~ (8'ha4)),
                  (reg117 + (8'hba))})));
              reg116 <= {(~(reg113 ?
                      ((~^wire104) >> (wire110 ?
                          wire90 : wire105)) : (~&(reg113 != wire111)))),
                  wire99};
              reg117 <= wire92;
              reg118 <= reg112[(3'h7):(2'h2)];
            end
          if (wire97)
            begin
              reg119 <= wire98;
              reg120 <= wire107[(3'h4):(1'h0)];
              reg121 <= wire104[(4'hc):(2'h2)];
              reg122 <= (wire111[(2'h2):(1'h0)] ^~ $unsigned($unsigned((~&$unsigned(wire106)))));
            end
          else
            begin
              reg119 <= ($signed($signed(wire109)) ?
                  reg117[(1'h1):(1'h1)] : {(((+wire99) ?
                              (-wire95) : $signed(wire104)) ?
                          ($signed(wire110) ?
                              (~|wire96) : $unsigned(wire109)) : {(&wire103)}),
                      (((+wire92) == {wire98}) >>> $unsigned((wire110 != wire103)))});
              reg120 <= (^{wire105, $signed(wire95)});
              reg121 <= {$unsigned((&$unsigned(wire108))),
                  wire95[(3'h5):(1'h0)]};
              reg122 <= $signed($signed(wire111));
            end
          if (($signed(wire98[(2'h3):(1'h1)]) != reg121))
            begin
              reg123 <= {{$signed($signed(wire101[(2'h2):(1'h1)]))},
                  (reg117 ? wire106[(2'h2):(2'h2)] : $signed(wire100))};
              reg124 <= {wire94[(1'h0):(1'h0)]};
            end
          else
            begin
              reg123 <= (8'hb6);
              reg124 <= ($signed(($unsigned((wire96 >= wire91)) ?
                  {(wire90 <= wire98)} : (~&(reg118 ?
                      reg123 : wire110)))) || (wire101[(3'h5):(1'h0)] ?
                  $unsigned(((8'ha3) < $signed(wire109))) : $unsigned((8'hbb))));
            end
        end
      else
        begin
          if (wire93)
            begin
              reg113 <= ($signed($signed((~$signed((8'hb6))))) || $signed(wire108));
            end
          else
            begin
              reg113 <= $unsigned((~|$unsigned($unsigned((8'hbd)))));
              reg114 <= wire96;
              reg115 <= $signed({wire94});
              reg116 <= ((~&$signed(wire100)) >= {$unsigned(wire99[(4'h8):(4'h8)]),
                  ($signed((+wire98)) - $signed((wire105 ?
                      wire95 : wire104)))});
              reg117 <= ((~|(~^wire95)) <= $unsigned($signed(reg124)));
            end
        end
      if (reg120[(3'h7):(1'h1)])
        begin
          reg125 <= {$unsigned(((~^$unsigned(reg112)) >>> {$unsigned((8'hab))})),
              {((~&$signed(wire99)) >>> ({reg123, wire108} >> (^(8'ha1)))),
                  $signed(((~|wire97) ~^ (|wire104)))}};
          if (reg115[(1'h0):(1'h0)])
            begin
              reg126 <= wire110[(2'h2):(1'h1)];
              reg127 <= reg114[(1'h1):(1'h0)];
              reg128 <= $signed($unsigned($signed((&(|wire98)))));
              reg129 <= $signed((~((^$unsigned((8'hbb))) ?
                  $signed((wire111 ? wire93 : reg118)) : {(~wire110)})));
            end
          else
            begin
              reg126 <= wire99;
              reg127 <= (wire90[(2'h3):(1'h1)] ?
                  wire93 : $unsigned(wire110[(3'h6):(2'h3)]));
              reg128 <= $unsigned(((reg122 ?
                      reg114[(1'h0):(1'h0)] : $unsigned((reg120 ?
                          wire93 : (8'hb2)))) ?
                  ($signed($signed(reg116)) >> (!wire111[(4'h9):(3'h4)])) : (($signed(wire92) ?
                      $unsigned(wire96) : $unsigned(reg125)) >> {$signed(reg120),
                      $signed(wire109)})));
            end
          reg130 <= wire95;
        end
      else
        begin
          reg125 <= $unsigned((+(wire106 < ((8'ha2) ?
              $unsigned(reg130) : reg120[(1'h0):(1'h0)]))));
          reg126 <= reg114[(2'h3):(2'h2)];
          reg127 <= wire102;
          if (wire90[(1'h0):(1'h0)])
            begin
              reg128 <= wire94[(3'h4):(1'h1)];
            end
          else
            begin
              reg128 <= {reg128[(3'h7):(3'h6)]};
              reg129 <= reg127[(1'h0):(1'h0)];
              reg130 <= $unsigned($unsigned((reg121 ?
                  ({wire102, reg129} ?
                      wire101[(3'h4):(3'h4)] : (wire94 ?
                          reg115 : wire100)) : (+(reg113 << wire107)))));
              reg131 <= $unsigned((reg124 ?
                  reg120[(2'h2):(1'h0)] : (($unsigned(reg116) ~^ (~(7'h43))) ?
                      (~^(-reg126)) : wire99[(3'h7):(2'h3)])));
              reg132 <= $signed(wire94);
            end
          if (($signed({wire100,
              ((!wire101) ?
                  $unsigned(wire105) : (!(8'hb8)))}) ^ (~&$signed($signed((&reg121))))))
            begin
              reg133 <= (wire109 ? reg117 : (reg112 >= reg113));
              reg134 <= $unsigned(($unsigned((+{wire96, wire99})) > reg115));
              reg135 <= reg113[(1'h0):(1'h0)];
              reg136 <= {(((reg118[(1'h0):(1'h0)] && wire103[(1'h1):(1'h1)]) ?
                      reg134 : {(~reg117),
                          {wire104, wire97}}) + (^wire107[(1'h1):(1'h1)]))};
              reg137 <= (reg133[(2'h2):(1'h1)] ?
                  $unsigned($signed(reg114[(2'h2):(1'h1)])) : ((wire103[(1'h0):(1'h0)] <= $signed($unsigned(wire108))) ^ $unsigned($unsigned(reg120))));
            end
          else
            begin
              reg133 <= $signed($signed((^reg135[(1'h1):(1'h0)])));
              reg134 <= $unsigned((reg128 == ($signed((reg126 ?
                      wire109 : wire92)) ?
                  (reg124[(2'h3):(2'h2)] <<< $signed(reg120)) : $signed((~&wire92)))));
              reg135 <= ({(~|{wire94[(3'h7):(2'h2)]})} ?
                  $unsigned(reg133[(2'h3):(1'h0)]) : {wire103[(3'h4):(3'h4)]});
              reg136 <= {(&{wire90[(1'h1):(1'h1)]}), {wire110}};
              reg137 <= $unsigned(((((wire90 ? (8'hba) : reg130) | (wire97 ?
                      wire103 : wire96)) ?
                  $signed(wire101[(2'h3):(2'h3)]) : reg121[(2'h2):(1'h1)]) - wire91));
            end
        end
      reg138 <= reg119;
    end
  assign wire139 = wire94;
  assign wire140 = reg127[(1'h1):(1'h1)];
  assign wire141 = $signed($unsigned(reg117));
endmodule

module module44
#(parameter param78 = {(~&(!((~&(8'haa)) ? {(8'ha0), (8'h9e)} : {(8'hb2)})))}, 
parameter param79 = param78)
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire48;
  input wire [(2'h2):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire signed [(4'ha):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  assign y = {wire77,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
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
                 reg53,
                 (1'h0)};
  assign wire49 = (~^$signed(wire46));
  assign wire50 = ((^$unsigned(wire48)) >>> wire45[(3'h5):(3'h4)]);
  assign wire51 = (~^wire46[(2'h3):(2'h2)]);
  assign wire52 = (8'h9d);
  always
    @(posedge clk) begin
      reg53 <= $unsigned(((8'had) ?
          (~&((wire52 ^ wire47) ^~ (wire50 | wire45))) : $unsigned((wire47 ?
              (wire47 >= wire49) : $signed(wire51)))));
    end
  assign wire54 = wire50[(4'h9):(3'h7)];
  assign wire55 = $signed(($signed($unsigned((wire48 == wire54))) ?
                      $signed((+$signed(wire54))) : wire45));
  assign wire56 = ((wire55[(3'h4):(1'h0)] >= reg53) < $unsigned(((~(wire46 == wire55)) != wire46)));
  assign wire57 = wire54[(2'h2):(2'h2)];
  assign wire58 = (&$signed($signed(wire54)));
  assign wire59 = $unsigned(wire50[(3'h6):(2'h2)]);
  assign wire60 = $unsigned(((($unsigned(wire54) < (wire56 ? wire54 : wire51)) ?
                          $unsigned((wire58 ~^ (7'h44))) : ((wire49 ?
                              wire51 : reg53) != $signed(wire47))) ?
                      $unsigned(wire56[(4'hb):(3'h7)]) : (($signed(wire52) ?
                          (wire54 != wire57) : $signed(wire58)) == wire52[(3'h4):(2'h2)])));
  assign wire61 = $signed(wire60[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg62 <= (wire50 << (^~(wire46[(4'ha):(2'h2)] << $signed(wire52[(2'h2):(1'h0)]))));
      if ((($signed($signed(wire46[(4'he):(4'h9)])) ?
              ({(wire48 ? wire50 : reg53)} ?
                  $signed(wire48[(4'hd):(1'h1)]) : (^~(wire61 ?
                      wire59 : wire54))) : {$signed((wire58 ^ reg62)),
                  (8'hb0)}) ?
          $unsigned((&wire59[(1'h0):(1'h0)])) : $signed((8'hae))))
        begin
          reg63 <= $signed($unsigned($signed(((wire57 ?
              wire46 : wire47) & wire45[(3'h6):(3'h5)]))));
          if ((~^(-$signed(wire56[(4'h9):(4'h9)]))))
            begin
              reg64 <= (8'hb1);
              reg65 <= (!$unsigned($unsigned(($unsigned(wire54) ^ {wire54}))));
            end
          else
            begin
              reg64 <= ($signed((!$signed($signed(wire59)))) ?
                  wire51 : (reg62[(1'h1):(1'h0)] < wire55));
              reg65 <= $signed(wire54);
              reg66 <= wire50;
            end
          reg67 <= (({(~^(reg53 ? wire51 : (8'hb0)))} == (~^((reg63 ?
                  wire59 : wire48) ~^ ((8'ha5) >> reg53)))) ?
              $signed(((~^$signed((8'ha1))) >>> $signed((wire45 ?
                  wire50 : wire50)))) : $signed(reg63[(3'h5):(3'h5)]));
          if ((wire58[(3'h6):(2'h2)] ?
              ((~(+wire59)) > wire60) : (!$unsigned(($unsigned((8'ha1)) < wire60)))))
            begin
              reg68 <= (!$unsigned($signed(reg64)));
              reg69 <= wire45[(3'h4):(2'h2)];
            end
          else
            begin
              reg68 <= $unsigned(($unsigned(reg69[(4'hc):(4'hb)]) || $unsigned($signed($signed(wire49)))));
            end
        end
      else
        begin
          reg63 <= reg53[(1'h0):(1'h0)];
          reg64 <= $signed(((&(-(!reg67))) ?
              $signed((reg53[(1'h1):(1'h1)] + reg65)) : (wire58 ?
                  (|$unsigned((8'h9e))) : $signed(wire54))));
          reg65 <= wire54[(3'h6):(3'h5)];
        end
      reg70 <= (((8'had) ?
          $unsigned(wire48[(5'h11):(4'hf)]) : wire48) != (~&$unsigned((wire59 == (~&wire61)))));
      if ($signed(wire55[(3'h4):(3'h4)]))
        begin
          if ($unsigned(wire61[(4'h9):(3'h7)]))
            begin
              reg71 <= (+$unsigned((^~(-wire52))));
              reg72 <= $signed($unsigned($unsigned($unsigned({wire57,
                  reg67}))));
              reg73 <= wire55[(3'h4):(1'h0)];
              reg74 <= (reg65 ?
                  (~&($signed(reg71) >= ((wire56 - wire56) ^ reg65))) : reg69);
              reg75 <= (reg67[(5'h11):(3'h7)] ?
                  ($signed((reg63 ?
                      {wire50,
                          reg68} : (~^wire54))) || (|$signed($unsigned(wire50)))) : ({$signed(reg72)} * $unsigned(wire60[(1'h1):(1'h0)])));
            end
          else
            begin
              reg71 <= (({({reg68} << (wire51 <<< wire60))} && (~&$signed((^~(8'ha6))))) ?
                  wire48[(3'h5):(3'h5)] : wire49[(3'h7):(3'h4)]);
              reg72 <= (({({reg64, reg73} ? $signed(reg68) : (reg71 ^ (8'ha6))),
                          (~((8'ha8) ? (8'h9c) : reg71))} ?
                      $signed($signed($signed(wire51))) : (reg70 ?
                          wire57[(4'hf):(4'hc)] : (~^(reg70 | (7'h43))))) ?
                  (~&$signed((wire47 << {wire48,
                      wire49}))) : {$signed(wire49[(3'h5):(2'h2)])});
              reg73 <= $signed($signed(wire58[(4'ha):(3'h5)]));
            end
        end
      else
        begin
          reg71 <= (~$signed((wire49 <<< $unsigned({(8'hab), wire45}))));
          reg72 <= (!((wire45 ?
              (reg72 ?
                  wire46[(4'hd):(1'h0)] : $unsigned((8'hae))) : (^~$signed(reg65))) <<< reg72));
        end
      reg76 <= wire58[(4'ha):(3'h5)];
    end
  assign wire77 = $unsigned({{reg76}, $unsigned($signed($unsigned(reg62)))});
endmodule

module module156
#(parameter param171 = {{{({(8'hb5)} - (~|(8'hbc))), {(+(7'h41)), (~&(8'hbe))}}, ((!((7'h43) ? (8'hb6) : (8'hbf))) >> (((8'ha9) ? (8'hae) : (8'ha8)) << ((8'ha0) ? (8'hb4) : (8'hb2))))}, (((+((8'hb4) <<< (8'hbf))) ? ((^~(8'hb3)) ? (-(8'hac)) : ((8'hba) ? (8'ha9) : (8'ha5))) : (~((8'h9e) >>> (8'hac)))) ^ ({(~&(8'hbf)), {(8'hb8), (8'hba)}} * ((!(8'hb4)) <<< ((7'h40) || (8'hbc)))))}, 
parameter param172 = (&({(!{(8'hbe), (8'h9e)}), ((8'ha9) ? param171 : (~|param171))} ? ({((8'ha4) ? param171 : param171), (-param171)} - ((!param171) ? (param171 || param171) : (param171 ? (8'hab) : param171))) : (((~^param171) - (param171 <<< param171)) > (param171 ? (param171 < param171) : ((8'hae) == param171))))))
(y, clk, wire160, wire159, wire158, wire157);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire160;
  input wire signed [(4'hc):(1'h0)] wire159;
  input wire signed [(4'hf):(1'h0)] wire158;
  input wire signed [(5'h11):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire170;
  wire signed [(5'h10):(1'h0)] wire169;
  wire [(2'h2):(1'h0)] wire168;
  wire [(2'h3):(1'h0)] wire167;
  wire signed [(5'h10):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire165;
  wire signed [(4'hd):(1'h0)] wire164;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(3'h7):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire161;
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 (1'h0)};
  assign wire161 = $signed($signed($signed((&(wire157 <<< wire159)))));
  assign wire162 = wire157;
  assign wire163 = wire158;
  assign wire164 = wire163[(1'h0):(1'h0)];
  assign wire165 = ((((!$signed(wire162)) ? wire158[(4'hb):(3'h6)] : wire164) ?
                           wire163[(1'h1):(1'h0)] : $unsigned($unsigned($signed(wire159)))) ?
                       (~&wire163) : {$unsigned((wire163[(1'h0):(1'h0)] ?
                               $signed((7'h40)) : (wire160 == wire163))),
                           wire164[(4'hc):(3'h7)]});
  assign wire166 = {(!$unsigned(((wire163 ? wire160 : (8'hb4)) ?
                           (wire158 ?
                               wire162 : wire161) : (wire159 ^~ wire158))))};
  assign wire167 = $unsigned((^~($unsigned((wire166 ?
                       (8'hb1) : wire164)) >>> ($unsigned(wire160) ?
                       wire157 : (wire165 ? (8'hbb) : wire161)))));
  assign wire168 = wire164[(4'ha):(3'h4)];
  assign wire169 = $signed(($unsigned((|$signed((8'ha2)))) ?
                       wire157[(3'h5):(2'h3)] : $unsigned($unsigned(wire157[(4'ha):(1'h1)]))));
  assign wire170 = wire169;
endmodule
