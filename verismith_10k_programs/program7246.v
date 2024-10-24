module top
#(parameter param59 = ((((|((8'hb1) * (8'ha8))) - (((8'hb0) ? (8'hb0) : (8'hb0)) ? ((8'ha8) ? (8'ha1) : (8'hb7)) : ((8'ha4) ? (8'ha3) : (8'hbc)))) < ((((8'had) ^~ (8'h9e)) + (&(8'ha8))) || (((8'hb2) ? (8'hb4) : (8'hb0)) ? (8'hbf) : (8'ha4)))) ? ((&(((8'hb7) | (8'ha8)) ^ ((8'hbd) + (8'hb5)))) ? ({(!(8'hb0))} ? (&(^~(8'ha7))) : (((7'h41) ? (7'h41) : (7'h44)) ? ((8'hb2) ? (8'ha7) : (8'ha6)) : ((8'hab) < (7'h42)))) : (^~{(-(8'h9c)), ((8'ha9) && (8'hb5))})) : (~|(8'hb6))), 
parameter param60 = (({{param59}} <<< ((param59 ? (param59 ? param59 : param59) : (param59 ~^ param59)) ? ({(8'ha6)} ? (param59 ^~ param59) : param59) : (~&(~param59)))) | (^~((param59 || ((8'hb0) ? param59 : param59)) >= ((param59 ? param59 : (8'hb4)) ? (param59 ? param59 : param59) : {param59, param59})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire57,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = ((($unsigned(wire1[(3'h5):(2'h3)]) ^ ((~&wire0) < $unsigned(wire3))) <= {$signed((wire0 ?
                             wire0 : (8'hb6))),
                         $signed((wire3 ? wire1 : wire1))}) ?
                     wire4 : (|$unsigned((wire4[(3'h5):(3'h4)] <<< {(8'hac)}))));
  assign wire6 = (wire4[(3'h6):(1'h0)] * (($unsigned((wire3 ?
                         wire1 : (8'ha0))) ?
                     $unsigned((wire2 ?
                         wire4 : wire4)) : wire0) <<< (wire0[(3'h4):(1'h0)] >= (wire1[(1'h1):(1'h1)] ?
                     wire5[(4'h8):(3'h6)] : wire0[(4'h9):(1'h1)]))));
  assign wire7 = (&wire2[(3'h7):(2'h2)]);
  assign wire8 = ($signed($signed($signed((wire0 >= wire6)))) != wire1);
  always
    @(posedge clk) begin
      reg9 <= ((+wire5) ^~ $unsigned($unsigned(wire8[(3'h4):(3'h4)])));
      reg10 <= ($unsigned((~^{$signed(wire4),
          {wire2}})) ^ (wire3[(4'h8):(4'h8)] <= reg9[(5'h13):(5'h12)]));
      if ($unsigned(wire0))
        begin
          reg11 <= (~^wire6);
          reg12 <= $unsigned(((^$signed((8'hbf))) & {reg10,
              ((wire6 >= wire0) >> (8'hbd))}));
          reg13 <= (~&reg10[(1'h0):(1'h0)]);
          if (wire2)
            begin
              reg14 <= $unsigned(({($signed((8'hbd)) ?
                      ((8'hab) ? wire1 : reg10) : $unsigned(wire2)),
                  $unsigned(reg13)} && $unsigned({$unsigned(wire4),
                  $signed(wire6)})));
              reg15 <= (reg13 || $unsigned(((~&reg9) > $unsigned(reg13))));
            end
          else
            begin
              reg14 <= ($unsigned(reg12) + $signed({{reg13[(3'h5):(3'h4)],
                      {reg10}},
                  wire4}));
              reg15 <= (reg15 ?
                  ({(((8'ha0) & reg9) ?
                          $signed(wire7) : (-(8'ha5)))} - wire3[(3'h7):(3'h6)]) : wire6);
            end
        end
      else
        begin
          reg11 <= $unsigned($signed(($unsigned((reg15 || reg13)) ?
              wire8 : {(wire8 + wire7)})));
          reg12 <= ({$signed($unsigned(reg11))} >= {(-((~wire0) < {reg15,
                  wire8}))});
          reg13 <= $signed({(&$signed(reg14[(3'h5):(1'h1)]))});
          reg14 <= wire5[(4'hb):(4'ha)];
          reg15 <= $signed($unsigned(($unsigned($signed(wire0)) ?
              ((8'hac) - {reg15}) : (&$unsigned(reg14)))));
        end
      reg16 <= {{(reg14 ? (~^$unsigned(reg14)) : ($signed(reg9) >= wire3)),
              $signed(wire8[(4'hf):(4'he)])},
          wire6};
      reg17 <= $signed($unsigned(reg12[(5'h14):(2'h3)]));
    end
  assign wire18 = reg9[(4'hf):(1'h1)];
  assign wire19 = reg14[(4'hd):(4'h8)];
  assign wire20 = $signed(wire3);
  assign wire21 = ((wire0 && $signed($unsigned($unsigned(reg12)))) >= (~^(&reg16[(4'ha):(4'h8)])));
  module22 #() modinst58 (wire57, clk, reg12, reg9, wire8, wire19);
endmodule

module module22
#(parameter param56 = ((8'hb2) ? ((|(((8'hb8) ? (8'hbb) : (8'hab)) ? (+(7'h41)) : ((8'hb1) ? (8'hb7) : (8'hbd)))) ~^ (^~(((8'hb0) ? (8'hbb) : (8'hab)) < ((8'hac) ? (8'hb2) : (8'ha6))))) : ((((~^(8'ha0)) ? ((8'h9c) ? (8'hab) : (8'ha2)) : (~&(8'hba))) ? {{(8'hbe), (8'hac)}} : {((8'ha7) ? (8'h9e) : (8'ha6))}) ? ((((8'ha8) ? (8'h9e) : (8'hbe)) ? (8'hb2) : ((8'hb2) ? (8'hb4) : (8'hbe))) || ((+(8'hb0)) || ((8'hb5) ? (8'ha5) : (8'h9d)))) : ((8'ha1) | (((8'hb8) != (8'ha5)) ? (^~(8'hbc)) : ((8'hb4) ? (8'ha5) : (8'hb7)))))))
(y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire24;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire49;
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire35,
                 wire49,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= {wire26,
          $signed((wire25 ?
              (~(wire25 ? wire26 : wire25)) : ($unsigned((8'hbe)) >> wire23)))};
      reg28 <= $unsigned(wire23);
      if (wire23)
        begin
          reg29 <= $unsigned((reg28 ~^ $unsigned($unsigned($unsigned(wire25)))));
          reg30 <= {wire24, wire23[(1'h0):(1'h0)]};
          reg31 <= ((~^$signed($unsigned((reg29 && wire25)))) != ((~|($signed(wire26) != $unsigned(wire26))) ?
              (^~(~|{wire24})) : (~|reg30[(3'h5):(1'h1)])));
          if (reg30)
            begin
              reg32 <= wire24[(3'h7):(2'h3)];
              reg33 <= (!wire24[(2'h3):(2'h3)]);
              reg34 <= $signed($unsigned(wire25[(2'h3):(1'h0)]));
            end
          else
            begin
              reg32 <= $unsigned(reg31[(2'h3):(2'h3)]);
              reg33 <= (^$signed((($signed(wire26) <= (reg27 == wire24)) * $unsigned(reg29))));
            end
        end
      else
        begin
          if ($unsigned(($unsigned($unsigned(reg31[(1'h1):(1'h1)])) ?
              reg31[(2'h3):(1'h0)] : (&{$unsigned((8'ha7)), (8'ha7)}))))
            begin
              reg29 <= (+wire24[(3'h5):(1'h1)]);
              reg30 <= ({(&$signed(reg27[(3'h6):(3'h4)]))} ^ $unsigned(reg29[(1'h0):(1'h0)]));
              reg31 <= reg33[(4'h8):(3'h6)];
              reg32 <= $signed($signed(reg32));
            end
          else
            begin
              reg29 <= reg27;
              reg30 <= reg33;
              reg31 <= ($unsigned($unsigned($unsigned(wire25))) >= (&$signed(reg28[(4'h8):(1'h0)])));
              reg32 <= (!(!$signed($unsigned($unsigned(reg29)))));
            end
        end
    end
  assign wire35 = reg32;
  module36 #() modinst50 (.wire38(reg34), .wire40(reg32), .wire37(reg29), .clk(clk), .wire41(reg31), .wire39(wire25), .y(wire49));
  assign wire51 = wire49;
  assign wire52 = ($unsigned(reg34[(3'h6):(1'h0)]) << $signed($signed((~^$signed(wire25)))));
  assign wire53 = (({reg31} != (reg34[(3'h6):(3'h4)] ?
                          wire51[(4'hd):(2'h3)] : {wire25[(2'h3):(2'h2)],
                              reg30})) ?
                      (((^$signed(reg30)) ?
                          reg31 : {reg29[(4'h9):(1'h1)],
                              wire49}) ^~ (~&(|(wire49 ^ wire23)))) : ($signed((wire24 >= $signed(wire51))) ?
                          wire35[(3'h5):(2'h2)] : $signed((^(-wire35)))));
  assign wire54 = ($unsigned(reg32) ?
                      wire52 : $unsigned($signed($unsigned((wire25 <<< reg27)))));
  assign wire55 = wire49[(4'h8):(3'h4)];
endmodule

module module36
#(parameter param47 = (8'ha3), 
parameter param48 = (!(((param47 ? (param47 ? param47 : (8'haa)) : (param47 ? param47 : param47)) > {(param47 ? param47 : (8'ha8)), param47}) ^ {(param47 == (8'h9d))})))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire signed [(2'h2):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  assign y = {wire46, wire45, wire44, wire43, wire42, (1'h0)};
  assign wire42 = wire41;
  assign wire43 = wire38;
  assign wire44 = {(~^({(~|wire37)} ?
                          ($signed(wire40) && (wire41 || (8'haf))) : wire39[(2'h3):(1'h0)])),
                      wire42};
  assign wire45 = (wire43[(2'h2):(1'h0)] != $signed(((^~wire42) ?
                      ({wire39} ?
                          ((8'haf) > wire42) : (wire37 ?
                              wire43 : (8'ha3))) : (8'haf))));
  assign wire46 = wire44;
endmodule
