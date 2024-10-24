module top
#(parameter param80 = (((!(^~(~&(8'hb3)))) == (((^(8'ha6)) == (~^(8'ha0))) ? (^~((8'hb9) ? (8'hba) : (8'ha3))) : (((8'hb7) ? (8'hbc) : (8'hb3)) ? (~^(8'had)) : ((8'hb0) & (8'hb7))))) ? ({(&{(7'h43)}), (+((8'hae) & (8'hb1)))} >> ((^~((8'hbf) ? (7'h43) : (8'ha4))) ? ((8'hbd) >> ((8'ha3) ? (8'hb9) : (7'h41))) : {(^~(8'hbb)), {(8'hbd)}})) : (((((8'haf) ? (8'hb2) : (8'hab)) ? ((8'hbc) + (8'hb2)) : ((8'hab) ^ (8'haa))) > {(-(8'h9d)), ((8'hb9) && (8'hac))}) ? ((((7'h44) ? (7'h41) : (8'hba)) ? ((8'ha3) ? (8'haa) : (8'hb5)) : ((8'ha7) ? (8'had) : (8'ha1))) << (((8'ha7) ? (8'h9d) : (8'ha1)) + ((8'ha9) ~^ (8'ha2)))) : (((~&(8'hbe)) ^~ ((8'h9e) && (8'hba))) <<< (~(~&(8'ha2)))))), 
parameter param81 = (^{((param80 ? ((8'ha1) ? param80 : param80) : param80) ? (param80 && (^param80)) : {(~|param80), (param80 >>> param80)}), {param80}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire64;
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  assign y = {wire79,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  module4 #() modinst65 (wire64, clk, wire2, wire3, wire1, wire0, (8'ha6));
  assign wire66 = $signed(((wire2 ? wire0 : wire2) ?
                      wire1[(4'hd):(2'h2)] : wire3));
  assign wire67 = ($unsigned(wire2[(4'h9):(1'h0)]) ?
                      $unsigned(wire66[(2'h2):(1'h0)]) : (^~($signed($signed(wire0)) != $signed({wire64}))));
  assign wire68 = ($signed(wire3[(3'h4):(2'h3)]) ?
                      wire66 : (wire0[(4'hb):(1'h0)] ?
                          {(-wire2)} : (-($signed(wire66) ?
                              (wire66 > wire3) : wire67))));
  assign wire69 = wire1;
  assign wire70 = $signed(wire0[(5'h11):(4'he)]);
  assign wire71 = wire1[(4'h8):(2'h3)];
  assign wire72 = wire2;
  assign wire73 = $signed($unsigned(($unsigned((wire2 <<< (8'haa))) ?
                      $signed((8'hae)) : {$unsigned(wire71), wire3})));
  assign wire74 = (wire64 >= wire2[(4'hf):(4'hb)]);
  always
    @(posedge clk) begin
      reg75 <= (~((&wire0) >= $signed(($signed(wire70) - (wire72 ^~ wire69)))));
      reg76 <= reg75[(1'h1):(1'h0)];
      reg77 <= (^{(~&$signed((8'hb6))),
          $unsigned(((-reg75) ? ((8'hbd) < reg76) : {wire69, reg75}))});
      reg78 <= wire66;
    end
  assign wire79 = {wire71[(4'ha):(3'h7)], reg77[(1'h0):(1'h0)]};
endmodule

module module4
#(parameter param63 = (((8'hb6) ? ({((8'hbc) ? (8'hb6) : (8'ha8))} ? ((~(8'hbf)) - ((8'h9d) ? (8'hb4) : (8'hbe))) : (8'ha4)) : ({(+(8'ha9)), (8'haa)} ? (|{(8'hbd), (8'haf)}) : (((8'ha4) * (8'ha0)) > (&(8'hbc))))) ? (^(({(8'haa)} ? ((8'hb6) ^ (8'hbc)) : ((8'hac) | (8'hab))) ? (((8'hb0) | (7'h42)) + (|(8'hb8))) : (((8'hb8) ? (8'hb3) : (7'h43)) ? ((8'hb1) ? (8'hbe) : (8'ha2)) : ((8'ha1) < (8'hb7))))) : (8'hac)))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire5;
  input wire signed [(5'h11):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire60;
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire62,
                 wire10,
                 wire12,
                 wire13,
                 wire15,
                 wire28,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire60,
                 reg43,
                 reg42,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg11,
                 (1'h0)};
  assign wire10 = $signed(wire7[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg11 <= (^$unsigned($signed(wire5[(3'h4):(1'h0)])));
    end
  assign wire12 = ($unsigned({wire9[(3'h6):(1'h1)]}) ?
                      (8'ha8) : reg11[(2'h2):(2'h2)]);
  assign wire13 = $signed({($unsigned((wire5 != wire12)) ?
                          ((wire6 ~^ wire10) << (wire10 & wire10)) : ($unsigned((8'had)) << wire10[(3'h5):(2'h2)])),
                      $unsigned(wire12[(4'h8):(2'h2)])});
  always
    @(posedge clk) begin
      reg14 <= wire9;
    end
  assign wire15 = $signed((~|(^wire8)));
  always
    @(posedge clk) begin
      reg16 <= (wire7[(4'h8):(4'h8)] ?
          $signed(reg14) : (|(((wire5 < wire9) <<< (~reg11)) ?
              $signed($unsigned(wire5)) : $signed({wire13, reg11}))));
    end
  always
    @(posedge clk) begin
      reg17 <= (((($signed(wire13) ? ((8'had) ? reg11 : (7'h41)) : (!wire15)) ?
              ({wire6} ?
                  (wire7 && wire9) : wire15) : $unsigned((wire8 == wire5))) | wire13) ?
          wire12 : {{wire5[(2'h3):(2'h2)], $unsigned(wire9[(4'ha):(1'h0)])},
              ($signed((^~wire13)) ?
                  $unsigned(wire12[(4'hd):(2'h3)]) : $signed($unsigned(wire8)))});
      if ((!(+reg16[(4'h9):(2'h3)])))
        begin
          reg18 <= wire7;
          if (((8'hb7) - wire15[(3'h4):(2'h3)]))
            begin
              reg19 <= reg16;
              reg20 <= reg16;
              reg21 <= reg20[(3'h7):(3'h4)];
              reg22 <= reg21[(5'h10):(1'h1)];
              reg23 <= ((~$unsigned(wire10)) >> $signed(reg20));
            end
          else
            begin
              reg19 <= (-(|(($unsigned(reg19) ? wire7 : $signed((8'ha3))) ?
                  (^reg11) : wire9)));
              reg20 <= (reg18[(4'h8):(4'h8)] == reg19[(5'h10):(3'h4)]);
              reg21 <= $signed((!$unsigned($signed((wire8 ? reg16 : reg14)))));
              reg22 <= reg21;
            end
          if (reg20)
            begin
              reg24 <= (~reg20[(2'h2):(2'h2)]);
            end
          else
            begin
              reg24 <= $unsigned(reg24);
              reg25 <= wire5;
              reg26 <= wire15[(2'h3):(2'h3)];
            end
        end
      else
        begin
          reg18 <= wire13[(1'h0):(1'h0)];
          reg19 <= ((reg23 ?
              $signed($unsigned((reg21 ?
                  wire9 : wire13))) : wire13[(3'h4):(1'h1)]) <<< reg23[(5'h13):(5'h11)]);
        end
      reg27 <= ($unsigned(wire7[(5'h10):(1'h1)]) != ((wire5 * reg26) >>> $signed(($unsigned(reg26) == {reg19}))));
    end
  assign wire28 = (8'hb5);
  always
    @(posedge clk) begin
      reg29 <= $signed({$signed($signed((-(8'had)))),
          (reg27 <<< reg16[(4'ha):(4'h8)])});
      if ($signed(wire6))
        begin
          reg30 <= (+$signed(reg27[(4'h9):(4'h9)]));
          if ((reg29 ?
              (wire9 != (($signed(reg14) ~^ (~|(8'hb1))) ?
                  ((wire10 ? reg30 : (8'ha6)) ?
                      {wire10} : (reg11 ?
                          wire7 : reg25)) : $signed($unsigned(wire28)))) : (~|$unsigned(((reg16 ?
                      wire12 : wire9) ?
                  (~|reg29) : (reg24 ~^ wire15))))))
            begin
              reg31 <= ($unsigned((((~reg23) > (8'hb6)) < (reg14 ?
                      $signed(wire15) : reg26))) ?
                  {($unsigned((-reg30)) ^~ $signed(reg14))} : (|(((|wire15) ?
                      (reg24 ? (8'hb9) : wire12) : (~reg22)) | ((8'hb7) ?
                      (wire9 ? (8'haf) : wire12) : (!wire9)))));
            end
          else
            begin
              reg31 <= ((8'ha5) ? reg16 : reg18[(4'h9):(1'h1)]);
            end
          reg32 <= wire15[(1'h0):(1'h0)];
        end
      else
        begin
          reg30 <= reg31[(3'h4):(3'h4)];
          if (wire13[(2'h3):(1'h0)])
            begin
              reg31 <= $unsigned($unsigned((((|wire9) ?
                      (reg25 * reg18) : $signed((8'hbd))) ?
                  ((reg26 << wire5) ?
                      (reg26 ^~ wire6) : (reg14 ?
                          reg32 : wire10)) : $signed((~&reg30)))));
              reg32 <= (!reg20);
              reg33 <= wire15;
            end
          else
            begin
              reg31 <= reg30;
              reg32 <= $unsigned($signed($unsigned($unsigned(reg21))));
              reg33 <= ($unsigned(((^~reg31) <<< $signed(reg33[(3'h6):(2'h3)]))) ?
                  reg17 : $unsigned(({(reg19 - wire10), reg19[(1'h1):(1'h0)]} ?
                      $signed($signed(reg18)) : ((wire7 ?
                          reg25 : (8'h9c)) >> $unsigned(reg29)))));
              reg34 <= reg31[(1'h1):(1'h0)];
              reg35 <= {($unsigned(reg22) ?
                      (~^{$signed((8'hb7)),
                          ((8'hbd) | reg17)}) : (^~reg30[(4'ha):(3'h6)])),
                  (~{($signed(reg29) >> (wire15 ? reg18 : reg19))})};
            end
          reg36 <= reg16;
        end
    end
  assign wire37 = $signed((wire8 ?
                      ((((8'hba) ? (8'hb5) : wire5) ?
                          $unsigned(reg31) : (reg30 ?
                              reg16 : wire15)) == ((wire5 ? wire12 : reg22) ?
                          reg36 : $unsigned(wire7))) : (reg24[(1'h0):(1'h0)] ?
                          ($signed(wire13) <= reg18) : ((reg17 ?
                                  (8'hba) : reg14) ?
                              (reg20 || wire6) : (!reg23)))));
  assign wire38 = reg19;
  assign wire39 = wire6[(5'h11):(3'h5)];
  assign wire40 = reg33[(2'h2):(1'h0)];
  assign wire41 = reg32[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg42 <= {$unsigned(wire6[(5'h11):(1'h1)])};
      reg43 <= ($unsigned(reg19) < $unsigned($signed(reg17[(1'h1):(1'h1)])));
    end
  assign wire44 = $unsigned({$unsigned(($signed(wire41) >>> (reg29 ?
                          reg14 : wire13))),
                      wire5});
  assign wire45 = $unsigned({$unsigned(wire15)});
  assign wire46 = $signed($unsigned($unsigned((reg22[(1'h0):(1'h0)] ?
                      (wire7 | reg23) : (~reg16)))));
  assign wire47 = reg23;
  module48 #() modinst61 (.wire51(wire15), .wire50(wire39), .clk(clk), .wire52(reg31), .wire53(reg24), .y(wire60), .wire49(wire45));
  assign wire62 = reg22[(2'h3):(1'h1)];
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire [(5'h10):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  assign y = {wire59, wire58, wire57, wire56, wire55, wire54, (1'h0)};
  assign wire54 = wire50;
  assign wire55 = {(wire54 ?
                          (((~&wire49) <= {wire53}) && ($unsigned(wire51) ?
                              (wire54 <<< wire51) : wire52[(3'h4):(1'h1)])) : wire50),
                      (~((wire51[(1'h0):(1'h0)] || $signed((8'hbb))) <= $unsigned((wire52 + wire51))))};
  assign wire56 = ((~|wire53) << {(((wire54 ? wire50 : wire52) ?
                          $signed(wire51) : $signed(wire54)) || $signed({wire50})),
                      wire54});
  assign wire57 = (wire51[(3'h5):(1'h1)] <= (((8'ha1) - ((8'hb1) * wire56)) ?
                      ($signed(wire56[(2'h2):(1'h1)]) >>> wire56) : wire55[(1'h0):(1'h0)]));
  assign wire58 = $signed($signed(wire50[(2'h3):(2'h3)]));
  assign wire59 = (((-(!(wire51 >= wire49))) != wire58[(4'ha):(3'h4)]) || {$unsigned($signed((~&wire57)))});
endmodule
