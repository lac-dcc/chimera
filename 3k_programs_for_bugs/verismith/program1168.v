module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire80;
  assign y = {wire85, wire84, wire83, wire82, wire5, wire80, (1'h0)};
  assign wire5 = wire4[(3'h4):(3'h4)];
  module6 #() modinst81 (.clk(clk), .wire8(wire2), .y(wire80), .wire10(wire4), .wire9(wire0), .wire7(wire3), .wire11(wire5));
  assign wire82 = {wire0[(4'hb):(1'h1)]};
  assign wire83 = ((&(((wire4 ? wire1 : wire80) ~^ {wire80,
                      wire3}) >> wire82[(4'hd):(1'h1)])) * ((^~$unsigned($unsigned(wire4))) >>> $signed(($unsigned(wire3) ?
                      $signed((8'hb3)) : wire2[(3'h5):(2'h3)]))));
  assign wire84 = {$signed($signed((!wire0))), $unsigned((8'ha9))};
  assign wire85 = $signed(wire2);
endmodule

module module6
#(parameter param79 = ((+(8'ha3)) ? ((8'hb6) ? ((((8'h9f) >>> (7'h44)) < {(8'hbe), (8'ha7)}) >> (8'ha6)) : ((((8'hae) ? (8'hab) : (8'ha1)) ? ((8'ha0) ? (8'hac) : (8'hab)) : {(8'ha8), (7'h40)}) >>> (((8'hbc) ? (8'hb6) : (8'haa)) <<< (~|(7'h44))))) : (^((|((8'hb1) ? (8'hb3) : (8'hb2))) && (!((8'h9f) | (8'hbd)))))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire44;
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire71,
                 wire70,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire12,
                 wire13,
                 wire21,
                 wire44,
                 reg73,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire12 = (7'h41);
  assign wire13 = wire8;
  always
    @(posedge clk) begin
      if (wire7[(1'h0):(1'h0)])
        begin
          if ((~((wire11 ? wire9[(3'h4):(1'h0)] : $signed(wire9)) < (wire7 ?
              wire13 : (8'hbe)))))
            begin
              reg14 <= (&$unsigned((wire9 ?
                  wire13[(2'h2):(1'h1)] : $unsigned($unsigned(wire7)))));
              reg15 <= (wire13[(3'h4):(1'h0)] ?
                  (|reg14[(1'h0):(1'h0)]) : $unsigned((~&reg14[(1'h1):(1'h0)])));
              reg16 <= (&reg15[(4'hc):(4'hb)]);
              reg17 <= {((8'hab) ? wire8[(1'h0):(1'h0)] : (!wire12)), reg16};
            end
          else
            begin
              reg14 <= (&$signed((8'ha3)));
              reg15 <= wire12[(2'h3):(1'h1)];
              reg16 <= (&{(|{wire8}), wire9[(3'h4):(2'h3)]});
              reg17 <= $unsigned($signed((($signed(wire10) ?
                      (|(8'h9e)) : {(8'h9f), wire11}) ?
                  wire10[(1'h0):(1'h0)] : $unsigned(wire13[(3'h4):(1'h1)]))));
              reg18 <= reg17[(3'h4):(1'h0)];
            end
          reg19 <= ((~^$signed(wire11[(2'h3):(2'h2)])) == reg16[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg14)
            begin
              reg14 <= $signed(reg18);
              reg15 <= reg17;
            end
          else
            begin
              reg14 <= $unsigned(wire8[(1'h1):(1'h0)]);
              reg15 <= wire11[(3'h6):(2'h2)];
              reg16 <= wire13[(3'h5):(1'h0)];
            end
          reg17 <= ($unsigned((&reg19)) ?
              {{wire8}} : $unsigned($unsigned((~|(wire13 ?
                  wire12 : (8'haf))))));
        end
      reg20 <= reg17[(2'h2):(2'h2)];
    end
  assign wire21 = $signed((~^((wire10 ? reg15 : (~reg15)) ?
                      $signed($signed(wire7)) : $unsigned((!wire12)))));
  module22 #() modinst45 (.clk(clk), .wire24(wire8), .wire26(wire12), .wire25(reg16), .y(wire44), .wire23(wire9));
  assign wire46 = {$signed(wire11), $unsigned($signed(wire13[(4'hb):(3'h7)]))};
  assign wire47 = $signed((^~reg14[(2'h2):(2'h2)]));
  assign wire48 = ($unsigned(wire46[(1'h0):(1'h0)]) << $unsigned(wire10));
  assign wire49 = {$unsigned((~^$unsigned(wire47[(2'h3):(1'h1)]))),
                      (($signed({wire8, (8'hb2)}) >> (~&$unsigned(wire46))) ?
                          $signed(wire46) : ($signed((7'h40)) ?
                              $signed((reg19 ^ wire21)) : ((wire47 ?
                                  wire46 : reg19) < wire12[(1'h1):(1'h1)])))};
  always
    @(posedge clk) begin
      reg50 <= reg14;
      if (reg20[(3'h6):(1'h1)])
        begin
          if (wire10)
            begin
              reg51 <= ($signed((!$signed(reg17))) >> ((~^(8'hbd)) ^ ($signed({(8'hb0),
                      reg16}) ?
                  wire7[(1'h0):(1'h0)] : {{wire47, (8'hac)}})));
              reg52 <= (({$signed($unsigned(reg18))} ?
                  $unsigned((|{reg50,
                      wire7})) : $unsigned((!wire11[(1'h1):(1'h0)]))) >> wire47[(2'h3):(2'h2)]);
            end
          else
            begin
              reg51 <= $signed((wire10[(4'h8):(4'h8)] + ((8'hbd) * $signed(((8'ha8) ?
                  reg19 : wire10)))));
            end
          reg53 <= ($unsigned(($unsigned((~&reg50)) <= ((wire11 ?
                      reg19 : reg19) ?
                  wire48[(2'h2):(2'h2)] : (!(8'ha2))))) ?
              reg50 : ({wire8[(1'h1):(1'h0)], ((&(8'ha5)) || {reg18})} ?
                  $signed(($unsigned((8'h9c)) ?
                      (wire46 ? reg20 : reg15) : (wire21 ?
                          wire21 : (8'hbb)))) : $signed($signed(wire49))));
          if (({$signed($signed($unsigned(reg18)))} ?
              (~|$signed((~{(8'haa)}))) : reg14))
            begin
              reg54 <= reg50[(1'h1):(1'h1)];
              reg55 <= (&($unsigned($signed($signed(reg52))) ?
                  (reg51[(1'h0):(1'h0)] << $unsigned((reg17 ~^ (7'h41)))) : reg19));
              reg56 <= $unsigned(wire47[(1'h0):(1'h0)]);
              reg57 <= $unsigned({$signed((|$signed(reg20)))});
              reg58 <= reg19;
            end
          else
            begin
              reg54 <= {reg58};
              reg55 <= (({{$unsigned(reg18),
                          reg19[(3'h5):(3'h5)]}} >> reg54[(4'hb):(3'h5)]) ?
                  (((reg55[(3'h4):(2'h2)] ? reg16 : {reg15}) >> ((~&reg15) ?
                          (reg20 >> reg53) : (reg17 ? (8'ha8) : reg20))) ?
                      wire49[(4'h9):(3'h5)] : $signed($unsigned(reg15[(4'h9):(3'h5)]))) : $signed($unsigned((7'h42))));
              reg56 <= {$unsigned((&$unsigned(reg55[(1'h0):(1'h0)]))),
                  (reg18[(4'hf):(3'h5)] >> reg50[(1'h1):(1'h0)])};
              reg57 <= reg51[(5'h10):(4'hd)];
              reg58 <= $signed(((-((&reg54) ^~ (wire13 ? wire44 : wire11))) ?
                  (8'hb7) : (!((reg20 && wire11) ?
                      wire12[(2'h2):(1'h0)] : (7'h44)))));
            end
          reg59 <= reg58;
          reg60 <= ($unsigned((-(reg53 ~^ wire48[(1'h0):(1'h0)]))) ?
              reg57 : ($unsigned((^$unsigned(wire8))) >= $signed((8'haa))));
        end
      else
        begin
          reg51 <= $unsigned((^$signed(($signed(reg53) ?
              {wire11} : $signed(reg53)))));
          reg52 <= (reg18[(3'h6):(3'h6)] ?
              $signed($unsigned((8'hb1))) : (wire44[(3'h5):(2'h3)] ?
                  ({(reg54 >= (8'hb0))} >> (!$unsigned(reg53))) : reg17));
        end
    end
  always
    @(posedge clk) begin
      reg61 <= (-reg50[(2'h3):(2'h3)]);
      reg62 <= ((wire9[(3'h7):(3'h4)] >> reg61[(4'ha):(4'ha)]) ?
          (($signed($unsigned(reg18)) ?
                  $signed((~|reg18)) : ((reg59 ? wire7 : reg18) ?
                      {wire49, reg20} : $signed(wire49))) ?
              $unsigned($unsigned((8'ha3))) : $signed(wire8[(3'h4):(1'h0)])) : (wire49 ?
              $signed((~(wire8 >> reg50))) : ({(8'haf)} + $signed($unsigned(wire48)))));
      reg63 <= {((wire47[(4'he):(4'ha)] ?
                  $unsigned($unsigned((8'hbf))) : $signed($signed((8'h9c)))) ?
              (~&((^~reg50) != reg57[(2'h3):(2'h3)])) : ($signed($signed(wire9)) > (8'ha5))),
          $unsigned($signed($unsigned($signed(reg14))))};
      if (wire47[(3'h4):(1'h1)])
        begin
          reg64 <= {{reg19[(1'h0):(1'h0)]}};
          reg65 <= (reg51 - $unsigned((!$unsigned($unsigned((7'h43))))));
          reg66 <= ($unsigned($unsigned($signed(reg18))) ~^ $unsigned($unsigned(wire48)));
        end
      else
        begin
          reg64 <= ($unsigned((&reg63[(4'hb):(3'h4)])) > reg17[(1'h0):(1'h0)]);
          reg65 <= $unsigned(reg66);
          reg66 <= ((reg20[(4'ha):(4'h9)] ? reg57 : wire13) << reg54);
          reg67 <= (&$signed((&reg19[(1'h1):(1'h1)])));
          reg68 <= $unsigned(((((~|wire12) != (reg20 <= reg54)) - $signed(wire48[(2'h2):(2'h2)])) + ((reg16 > $signed(wire12)) ?
              {(&reg60), (8'hbd)} : ($signed((8'hb2)) * (wire8 <= reg16)))));
        end
      reg69 <= $unsigned((($signed(wire46[(4'hb):(3'h4)]) | (reg68[(3'h6):(3'h4)] ?
              $unsigned(reg17) : $unsigned(reg19))) ?
          $unsigned(wire13[(3'h7):(2'h2)]) : reg51));
    end
  assign wire70 = {$signed($signed(wire48[(4'h8):(3'h4)])),
                      $unsigned(({$unsigned((8'hae))} ?
                          {(reg65 & reg52)} : (wire44 && (~^reg69))))};
  assign wire71 = (reg63 ?
                      $signed((reg16[(4'ha):(3'h6)] ?
                          wire47 : $signed((wire70 ^ reg20)))) : (-(8'ha2)));
  assign wire72 = reg52;
  always
    @(posedge clk) begin
      reg73 <= $unsigned(reg54);
    end
  assign wire74 = $signed($unsigned($signed($unsigned(((8'ha5) ?
                      wire48 : (8'h9d))))));
  assign wire75 = reg18;
  assign wire76 = reg14[(1'h1):(1'h0)];
  assign wire77 = $unsigned($signed($signed(reg66)));
  assign wire78 = wire46;
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= (((^(((8'ha1) == (7'h41)) ^~ $signed(wire26))) ?
          $unsigned(($signed(wire25) || $unsigned(wire26))) : (^(((8'had) ?
                  wire23 : wire25) ?
              $signed(wire23) : (^~wire25)))) ^~ wire25);
      if (reg27[(1'h1):(1'h1)])
        begin
          reg28 <= wire26[(2'h2):(1'h0)];
        end
      else
        begin
          reg28 <= $signed({wire25[(1'h0):(1'h0)],
              ((+(wire26 - wire23)) ?
                  wire24[(4'ha):(3'h7)] : ({reg28, wire23} <= (reg27 ?
                      wire24 : wire24)))});
        end
      if (reg28[(1'h0):(1'h0)])
        begin
          reg29 <= reg27[(3'h5):(3'h4)];
        end
      else
        begin
          if ((~|(-reg27[(2'h2):(1'h0)])))
            begin
              reg29 <= wire24[(1'h1):(1'h1)];
              reg30 <= (~^wire23);
            end
          else
            begin
              reg29 <= $unsigned(wire23);
              reg30 <= ((!$signed(wire25)) ?
                  $signed(($unsigned($signed(reg29)) ^~ $signed({reg28}))) : $unsigned($signed(($signed(wire24) != (reg27 ?
                      wire26 : wire24)))));
            end
          reg31 <= (~(($signed(((8'hbf) >= (8'hba))) ?
                  $signed((reg30 ? wire23 : wire25)) : (!(~|wire26))) ?
              reg28[(3'h7):(2'h3)] : reg30));
          reg32 <= $signed({reg31[(1'h0):(1'h0)],
              (reg28 ? reg28 : (~$signed(reg31)))});
          reg33 <= $signed((~|(-$unsigned((|reg28)))));
          reg34 <= $unsigned($unsigned($unsigned($unsigned({reg33, reg29}))));
        end
    end
  always
    @(posedge clk) begin
      reg35 <= {(|wire26[(4'hf):(4'h9)])};
      if (($unsigned(wire25[(2'h3):(2'h2)]) + {{(~$signed((7'h42)))}}))
        begin
          reg36 <= $unsigned((!{$unsigned($signed(reg30)), (&wire24)}));
        end
      else
        begin
          reg36 <= (+{(((reg27 ?
                  reg32 : reg28) != (reg28 << (8'hbc))) + $unsigned((^wire23)))});
        end
    end
  assign wire37 = wire25[(2'h3):(2'h2)];
  assign wire38 = reg36[(1'h0):(1'h0)];
  assign wire39 = $signed({(7'h42)});
  assign wire40 = $unsigned($unsigned(reg33));
  assign wire41 = (reg33 <= $unsigned($signed($signed(reg30[(1'h1):(1'h1)]))));
  assign wire42 = $signed((^~$unsigned(((!wire25) ?
                      (wire24 < wire38) : (wire23 - (8'hb6))))));
  assign wire43 = (~&reg28);
endmodule
