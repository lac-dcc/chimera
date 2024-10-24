module top
#(parameter param83 = (((+(((8'hb8) >= (8'ha6)) != ((8'hb5) ? (8'hb7) : (8'hb7)))) ? {(((8'hb3) && (8'ha3)) ? ((8'hb3) ? (8'hba) : (8'ha4)) : ((8'hbf) ? (7'h43) : (8'h9d)))} : (&{(+(8'haf)), ((8'hbf) == (8'ha5))})) << (~&((^(|(8'hba))) ? ((&(8'hbc)) & (+(8'ha6))) : (~^((8'had) ~^ (7'h41)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire78;
  assign y = {wire82, wire81, wire80, wire78, (1'h0)};
  module4 #() modinst79 (.wire7(wire0), .y(wire78), .clk(clk), .wire5(wire1), .wire6(wire2), .wire8(wire3));
  assign wire80 = ($signed((-(wire3[(4'ha):(1'h0)] ^ (wire0 ?
                      wire78 : wire78)))) == wire78[(2'h3):(2'h3)]);
  assign wire81 = {(wire80 - $signed(wire0))};
  assign wire82 = (wire1 ? (~wire3) : (~|$unsigned((&wire78[(4'h9):(3'h6)]))));
endmodule

module module4
#(parameter param76 = (~&(!((+((8'hab) >>> (8'hbd))) < (((8'hbd) ? (8'ha1) : (8'ha5)) ? (&(8'hbe)) : (^(8'ha1)))))), 
parameter param77 = param76)
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire5;
  input wire signed [(4'hc):(1'h0)] wire6;
  input wire [(3'h5):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire74;
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  assign y = {wire9,
                 wire36,
                 wire37,
                 wire38,
                 wire74,
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
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire9 = wire8[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg10 <= $signed($signed({($unsigned(wire5) ^~ $unsigned(wire5)),
          (wire7[(1'h1):(1'h1)] ? (+(8'haa)) : wire8[(3'h6):(2'h2)])}));
      reg11 <= (($signed(wire7) <<< reg10[(3'h4):(1'h1)]) ?
          wire7 : wire5[(2'h2):(1'h0)]);
      reg12 <= (wire6 + $signed(reg10));
      reg13 <= $unsigned(({(~&(reg11 ? wire5 : wire5)),
              (~reg11[(3'h6):(1'h1)])} ?
          $unsigned((~|$unsigned(reg10))) : $unsigned(wire9)));
      reg14 <= ((^~(($signed((8'h9f)) ?
          ((8'hb6) ? reg12 : reg13) : (wire9 ? reg12 : reg11)) * (wire6 ?
          $signed(wire9) : $signed(reg13)))) ~^ (|(~^(wire8[(4'hc):(4'hb)] <= $unsigned(wire5)))));
    end
  always
    @(posedge clk) begin
      if (($signed((($unsigned(reg13) ^ ((8'hb2) ? wire7 : (8'ha2))) ?
              wire5[(2'h2):(2'h2)] : reg13[(2'h2):(1'h1)])) ?
          ($signed(($signed((8'hbd)) ?
              (wire7 > reg10) : ((8'hbb) || wire6))) <<< wire6) : wire5[(2'h2):(1'h1)]))
        begin
          reg15 <= wire5[(2'h3):(2'h3)];
          if ((~wire7[(2'h3):(1'h0)]))
            begin
              reg16 <= reg10[(2'h2):(2'h2)];
              reg17 <= reg13;
            end
          else
            begin
              reg16 <= (!($unsigned(reg10[(1'h1):(1'h0)]) ?
                  ($signed((8'hbc)) * wire7) : {reg13[(1'h1):(1'h1)]}));
              reg17 <= $signed($unsigned($signed($unsigned(reg15))));
              reg18 <= (~|(-(8'hb8)));
              reg19 <= $unsigned((!((^~reg18[(1'h1):(1'h0)]) ?
                  (~&reg13[(3'h5):(1'h0)]) : wire5[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          if ((+reg13[(2'h3):(1'h1)]))
            begin
              reg15 <= $signed((8'hb6));
              reg16 <= ((^(~&(~&(reg16 ? reg18 : reg17)))) ~^ wire9);
              reg17 <= $signed(reg16);
            end
          else
            begin
              reg15 <= {reg10[(2'h3):(2'h3)]};
              reg16 <= ((!reg18[(1'h1):(1'h1)]) <<< (&(!reg14)));
            end
        end
      reg20 <= (7'h42);
      reg21 <= (reg19[(4'he):(1'h1)] ?
          (^~(((wire7 >= reg17) ?
              (reg16 ?
                  reg11 : wire6) : (reg13 >> reg19)) ^~ reg17)) : reg10[(1'h0):(1'h0)]);
      if (reg12)
        begin
          reg22 <= ((8'haa) ?
              {({{(8'h9f), reg14}} && ((reg21 >> reg10) ?
                      wire9 : (reg10 < (8'hab))))} : (-$signed($unsigned($unsigned(reg17)))));
        end
      else
        begin
          reg22 <= (((~$signed((reg14 ^ reg12))) & ($unsigned((reg19 ?
              (8'ha3) : reg10)) || (^(^reg17)))) && ((reg20[(3'h4):(3'h4)] ?
                  {$signed(reg10),
                      (wire5 ? reg21 : reg15)} : reg21[(1'h1):(1'h0)]) ?
              ({(wire5 ? reg18 : reg10)} ?
                  (reg21 ? wire6 : $signed(reg16)) : ((reg19 ? reg16 : reg20) ?
                      $unsigned(wire8) : $unsigned(reg20))) : $signed($signed(reg16))));
          reg23 <= (&(wire9[(4'h8):(1'h1)] >= (~^$unsigned($signed(reg11)))));
          reg24 <= (|reg12);
          reg25 <= {(~&reg23[(3'h5):(2'h3)]), reg21};
          reg26 <= $signed(($unsigned(((wire8 < reg22) > reg16[(4'ha):(2'h3)])) ?
              $unsigned({wire7[(2'h2):(1'h0)]}) : $signed($signed((~|(8'hb7))))));
        end
      if (($unsigned((^~reg26[(4'ha):(2'h2)])) || reg24))
        begin
          reg27 <= (~(+({reg12[(5'h14):(4'h9)], (~wire8)} ?
              (^~(wire9 << (7'h41))) : $unsigned($signed((8'hb6))))));
        end
      else
        begin
          if ($signed(({$unsigned(reg22), reg25[(4'h8):(3'h6)]} >>> (((&reg16) ?
              $unsigned(reg12) : $unsigned(reg14)) < $unsigned((|wire5))))))
            begin
              reg27 <= reg25[(1'h0):(1'h0)];
              reg28 <= reg22[(3'h5):(2'h3)];
              reg29 <= ($unsigned((reg15[(3'h7):(3'h6)] ?
                  reg24[(1'h0):(1'h0)] : reg14)) * (+reg18));
              reg30 <= reg24;
              reg31 <= $signed($unsigned(reg25[(2'h2):(1'h1)]));
            end
          else
            begin
              reg27 <= reg24[(2'h3):(1'h0)];
              reg28 <= reg28;
              reg29 <= (($unsigned(reg21) < {$unsigned({(8'ha3), wire8}),
                      (~|(~|reg26))}) ?
                  reg10 : (($signed($unsigned(reg29)) ?
                          reg27[(3'h4):(1'h1)] : ({wire6} > (reg27 ?
                              reg19 : reg17))) ?
                      reg19 : ((8'hb1) > reg26[(4'ha):(4'h9)])));
            end
          reg32 <= $unsigned({$signed(reg10)});
          reg33 <= reg19;
          reg34 <= wire8;
          reg35 <= ($unsigned(reg20[(3'h6):(1'h1)]) >>> ((^~((+wire5) ?
              $signed(reg28) : (wire9 ?
                  reg24 : reg30))) || (&$signed($signed(reg33)))));
        end
    end
  assign wire36 = ((8'haa) ?
                      reg25[(3'h6):(1'h0)] : (($signed(reg17[(1'h0):(1'h0)]) ?
                          $signed(reg11) : $signed($signed(wire7))) & reg30[(1'h0):(1'h0)]));
  assign wire37 = reg14[(3'h6):(1'h0)];
  assign wire38 = wire37;
  module39 #() modinst75 (.wire41(reg30), .wire42(reg28), .y(wire74), .wire40(wire38), .clk(clk), .wire43(reg14));
endmodule

module module39
#(parameter param73 = ((((((8'ha7) <<< (8'hb3)) ? (-(8'hb2)) : ((8'hb6) == (8'hae))) ? {(&(8'ha9)), {(7'h40)}} : ({(8'haa)} + ((8'hb3) ? (8'ha8) : (7'h40)))) ? {{(^(8'hb1)), ((8'hb7) == (7'h40))}} : ((!((8'hae) ? (8'ha2) : (8'hac))) ? (8'ha3) : {(~|(8'hb6))})) <<< (({(8'hb3), ((8'hbc) ? (8'hb7) : (8'ha5))} ? {(~|(8'h9e))} : (((8'hb0) && (8'hbe)) + (7'h42))) ? (^~(((8'ha2) ? (8'haf) : (8'hb1)) ? (-(8'hb9)) : ((8'hac) ? (8'hbe) : (8'hb7)))) : (((-(8'hbf)) ? (!(8'hac)) : ((8'haf) >>> (8'ha9))) && (((8'ha3) ? (8'hac) : (8'hba)) ? (~(7'h42)) : ((8'ha8) ? (7'h41) : (8'hbb)))))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire [(4'hf):(1'h0)] wire41;
  input wire [(4'he):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire44 = (8'hb0);
  assign wire45 = $signed(((&(wire40[(1'h0):(1'h0)] ?
                      $unsigned(wire44) : wire40)) ^~ (((wire41 << (8'haa)) ?
                      $signed(wire42) : (wire42 ?
                          (8'ha4) : wire44)) <= (8'hb2))));
  assign wire46 = $signed($signed((wire44 ?
                      {{wire43, wire43}} : ($unsigned(wire44) == ((8'hbe) ?
                          wire41 : wire41)))));
  assign wire47 = wire43;
  always
    @(posedge clk) begin
      reg48 <= $signed({wire44,
          ((wire42[(5'h11):(2'h2)] ?
                  wire40[(4'h8):(2'h3)] : (wire45 ? wire42 : wire45)) ?
              {(wire43 ? wire46 : wire42)} : $signed((8'h9c)))});
      reg49 <= reg48;
      reg50 <= (wire40 ?
          reg49 : ($signed((^~wire44)) ^ {((reg49 ?
                  wire43 : wire40) ^~ (^wire43))}));
    end
  assign wire51 = wire41;
  assign wire52 = $unsigned((reg50[(2'h2):(2'h2)] ?
                      ($signed((reg50 >= wire44)) | ({wire44, (8'hae)} ?
                          (+reg49) : $unsigned(wire46))) : wire43[(3'h4):(1'h0)]));
  assign wire53 = reg48[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      if (($unsigned(reg48[(1'h1):(1'h1)]) * $signed(wire51)))
        begin
          if (wire42)
            begin
              reg54 <= (&wire40);
              reg55 <= $unsigned(wire40);
              reg56 <= ((8'ha6) ?
                  $signed(wire52[(3'h4):(3'h4)]) : ($signed(((-wire53) <<< {wire42,
                      reg55})) + wire44[(1'h0):(1'h0)]));
              reg57 <= wire41;
              reg58 <= reg48;
            end
          else
            begin
              reg54 <= reg55[(3'h6):(3'h4)];
              reg55 <= $signed($signed(((wire45[(2'h2):(1'h1)] + {wire46}) ~^ ((-reg49) ?
                  (&(8'hb3)) : (reg49 ? wire51 : reg54)))));
              reg56 <= wire51;
            end
          reg59 <= (~&$unsigned((~^{wire44[(1'h1):(1'h1)],
              (wire45 == (8'hbb))})));
        end
      else
        begin
          if (wire40)
            begin
              reg54 <= $unsigned($signed(reg58));
              reg55 <= $unsigned($unsigned($unsigned((~&(wire47 != (8'h9f))))));
              reg56 <= ($unsigned((reg56[(3'h4):(1'h0)] <<< {((8'ha4) & reg56)})) ?
                  $unsigned({wire47[(4'h9):(2'h3)],
                      (reg58 >> (wire51 ^ reg49))}) : $unsigned({$unsigned(((8'ha9) ^~ reg59)),
                      $unsigned(wire40[(4'h9):(4'h9)])}));
              reg57 <= $unsigned($unsigned({wire52[(3'h4):(1'h1)]}));
            end
          else
            begin
              reg54 <= $signed((wire53[(5'h10):(3'h4)] ? (8'hbf) : reg48));
              reg55 <= $signed(($signed((wire40 ~^ ((8'hbb) ?
                  wire42 : reg57))) | wire40));
            end
          reg58 <= wire42;
          reg59 <= reg56;
        end
      reg60 <= reg56[(3'h6):(3'h6)];
    end
  assign wire61 = (wire43[(3'h5):(1'h1)] ?
                      (^(~^reg56[(2'h2):(2'h2)])) : wire40[(1'h1):(1'h1)]);
  assign wire62 = $unsigned((wire40 != (|reg58[(2'h2):(1'h1)])));
  assign wire63 = ((reg56[(3'h4):(2'h3)] ~^ wire53[(4'hf):(1'h0)]) + reg58[(1'h0):(1'h0)]);
  assign wire64 = {($signed(wire51[(1'h0):(1'h0)]) * wire44[(1'h1):(1'h1)])};
  assign wire65 = ($signed(wire44) << reg49[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg66 <= $signed(wire65);
      reg67 <= $unsigned(wire51[(1'h0):(1'h0)]);
      reg68 <= reg57;
      reg69 <= ((+$signed((~$signed(wire44)))) ?
          $unsigned({wire44[(1'h0):(1'h0)]}) : reg68);
      reg70 <= $signed(wire53);
    end
  assign wire71 = (+(~|$unsigned((^(reg70 ? wire44 : (8'hb6))))));
  assign wire72 = $signed(((reg58[(2'h3):(1'h1)] ?
                          $signed($signed(wire52)) : $unsigned($unsigned((8'hb2)))) ?
                      $signed(wire45) : ({(reg54 - (8'ha7)),
                          $unsigned(wire64)} <<< $signed({wire61}))));
endmodule
