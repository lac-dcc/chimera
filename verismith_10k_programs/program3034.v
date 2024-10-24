module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire95;
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  assign y = {wire41,
                 wire27,
                 wire26,
                 wire15,
                 wire14,
                 wire5,
                 wire45,
                 wire46,
                 wire47,
                 wire95,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg43,
                 reg44,
                 (1'h0)};
  assign wire5 = $unsigned(wire1);
  always
    @(posedge clk) begin
      if ({wire0[(2'h2):(2'h2)],
          (wire4[(3'h4):(1'h1)] ?
              ((^wire5[(3'h4):(1'h1)]) <= (!(^~wire3))) : $unsigned($unsigned((^~wire2))))})
        begin
          reg6 <= (8'hb0);
          reg7 <= $signed({(wire5[(4'h8):(1'h1)] ?
                  wire1[(5'h11):(4'hc)] : (~&{wire4, wire3}))});
          reg8 <= $unsigned((wire5[(2'h3):(1'h0)] ^~ {$unsigned((~|wire0))}));
          reg9 <= $unsigned($unsigned(reg7[(2'h3):(1'h1)]));
        end
      else
        begin
          reg6 <= ($unsigned({wire3[(2'h3):(2'h3)]}) <= reg9[(4'hb):(1'h0)]);
          reg7 <= (~^$unsigned((&((reg8 || (8'haa)) & wire1[(4'hd):(4'hd)]))));
          if (wire3)
            begin
              reg8 <= ($signed({($unsigned(reg8) >> {reg7}),
                      (wire4[(2'h2):(2'h2)] ?
                          (|wire4) : reg8[(1'h1):(1'h0)])}) ?
                  (wire4[(2'h3):(1'h0)] ?
                      (~|wire3[(3'h4):(2'h2)]) : ($signed((^~reg6)) ?
                          (~^(wire0 ? (8'hbe) : (8'hab))) : {reg9})) : (8'ha9));
              reg9 <= $unsigned((($signed(wire0) ?
                  ((wire3 ?
                      wire4 : reg8) != reg8[(4'h9):(2'h3)]) : ($signed(reg8) <= (wire3 ?
                      reg7 : wire1))) ^ wire1[(4'he):(4'hd)]));
              reg10 <= $signed((((^~(wire1 ~^ reg9)) ? reg8 : reg9) ?
                  {({wire1, wire0} < wire0),
                      (wire2[(2'h2):(1'h1)] ?
                          reg6[(3'h5):(2'h2)] : wire0[(2'h3):(2'h3)])} : ((8'ha3) ?
                      $signed((wire2 ?
                          (8'h9e) : wire5)) : $unsigned((|wire3)))));
              reg11 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg8 <= ((~&(&{$unsigned(wire1), (-wire2)})) ?
                  $unsigned({(reg7[(4'h9):(4'h9)] <= (wire5 ? reg10 : reg10)),
                      (reg9[(4'ha):(1'h0)] ?
                          $signed((8'hb9)) : (~^wire5))}) : $unsigned((^~$unsigned((&reg7)))));
              reg9 <= reg11[(1'h1):(1'h1)];
            end
          reg12 <= {({$signed((reg10 >= reg10))} ?
                  (($unsigned(reg6) ? (wire0 >= (8'hb1)) : (^wire0)) ?
                      $unsigned(((7'h42) && (7'h42))) : {reg7[(3'h7):(3'h4)]}) : wire4)};
        end
      reg13 <= {wire4[(3'h5):(1'h1)]};
    end
  assign wire14 = reg10[(2'h3):(1'h0)];
  assign wire15 = wire0[(4'he):(4'hd)];
  always
    @(posedge clk) begin
      if ((8'hbe))
        begin
          if (reg13)
            begin
              reg16 <= $signed(reg6);
              reg17 <= {$unsigned({((wire15 - wire4) ?
                          wire4[(2'h2):(2'h2)] : (wire0 ? wire2 : reg12)),
                      wire14[(3'h6):(2'h3)]}),
                  ({{(wire3 ? (8'ha5) : reg6)}, reg8[(2'h2):(1'h1)]} ?
                      (+reg13[(1'h0):(1'h0)]) : $unsigned(wire3[(3'h5):(3'h5)]))};
              reg18 <= $unsigned({$signed(reg8[(1'h1):(1'h0)]),
                  (wire3 <<< wire15)});
              reg19 <= wire2;
            end
          else
            begin
              reg16 <= wire1[(3'h5):(1'h0)];
              reg17 <= $unsigned(((8'hab) << $signed({{wire5, wire5}})));
              reg18 <= reg11[(1'h0):(1'h0)];
            end
          if (((wire2 > (reg19 <= $unsigned((~&wire14)))) <= $unsigned((((^~wire0) != (|reg7)) >= ((-wire5) + reg9)))))
            begin
              reg20 <= wire4[(3'h6):(3'h5)];
              reg21 <= (!(8'hb7));
            end
          else
            begin
              reg20 <= (((reg21[(2'h2):(1'h0)] ?
                  $signed($signed((8'ha2))) : ((^reg21) ?
                      reg21[(3'h5):(2'h2)] : (&(7'h44)))) >>> {((wire3 || reg21) | reg18[(3'h5):(3'h4)])}) - wire3);
            end
          reg22 <= wire5[(3'h5):(2'h2)];
          reg23 <= $unsigned(((reg16 << (~|wire3)) != (&((&reg17) <<< $signed(reg20)))));
          reg24 <= wire1[(1'h0):(1'h0)];
        end
      else
        begin
          reg16 <= reg23[(1'h0):(1'h0)];
          reg17 <= $signed((8'hb5));
        end
      reg25 <= (~$unsigned((~&(8'ha2))));
    end
  assign wire26 = (!((wire2[(4'hc):(4'hc)] ^ reg9[(5'h12):(4'he)]) | $unsigned((wire5 ?
                      (wire4 ? reg10 : wire1) : $unsigned(wire14)))));
  assign wire27 = wire0;
  module28 #() modinst42 (wire41, clk, reg10, wire2, reg16, reg20);
  always
    @(posedge clk) begin
      reg43 <= (~^(~&($unsigned((^reg8)) ? reg11 : wire4)));
      reg44 <= {(^~($signed((reg20 ? wire14 : reg11)) ?
              $unsigned($signed(wire4)) : reg16)),
          $unsigned($unsigned(reg8[(4'h8):(3'h5)]))};
    end
  assign wire45 = ($signed(((&reg24[(4'h8):(3'h4)]) > ($unsigned(wire0) * $unsigned(reg18)))) >> $unsigned(((~$unsigned(reg12)) ?
                      {wire4[(1'h1):(1'h1)]} : reg44[(2'h2):(1'h1)])));
  assign wire46 = (~reg16);
  assign wire47 = (wire3 && (!{$unsigned((wire45 * reg23)),
                      wire14[(1'h0):(1'h0)]}));
  module48 #() modinst96 (wire95, clk, wire47, reg22, reg11, reg44);
endmodule

module module48  (y, clk, wire49, wire50, wire51, wire52);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire signed [(5'h14):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire [(5'h10):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire92;
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  assign y = {wire94,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire70,
                 wire71,
                 wire72,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire92,
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
                 (1'h0)};
  assign wire53 = {$signed(($signed((wire50 ? wire50 : wire50)) ?
                          wire49 : $signed({wire49, wire50}))),
                      wire51};
  assign wire54 = ($unsigned((^(((7'h40) ? wire49 : wire51) ?
                      (~^wire52) : (&wire51)))) - $signed($signed((wire49 <<< $unsigned((8'hbd))))));
  assign wire55 = $unsigned((wire49 > (wire53 ?
                      ((wire53 >> wire52) == $signed((8'h9d))) : (^wire54[(1'h0):(1'h0)]))));
  assign wire56 = ((7'h40) - {(((wire51 - wire53) ?
                              ((8'hb5) ?
                                  (8'ha7) : wire50) : wire49[(1'h1):(1'h0)]) ?
                          ({wire54, (8'hb7)} ?
                              {wire50} : {wire49,
                                  (8'hb7)}) : $unsigned({(8'hae)}))});
  assign wire57 = ($unsigned((wire50 ~^ ((wire53 - wire50) - wire51[(3'h4):(3'h4)]))) ?
                      $unsigned($signed(wire56)) : wire55[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg58 <= (wire53 ?
          ({(!(wire53 < wire55)),
              $signed(wire51[(1'h0):(1'h0)])} || wire50) : $unsigned({((7'h42) > (wire54 ?
                  (8'ha7) : wire53)),
              $unsigned($signed(wire52))}));
      if (wire51)
        begin
          if (wire55[(3'h7):(1'h0)])
            begin
              reg59 <= $signed((($unsigned($unsigned(wire54)) ~^ wire57[(1'h0):(1'h0)]) >= wire54));
              reg60 <= (~$unsigned((wire57[(3'h7):(1'h0)] ?
                  $unsigned(wire52[(4'hd):(3'h6)]) : $signed((wire49 ?
                      wire56 : reg59)))));
              reg61 <= (!(~|$signed($signed((wire53 ? (8'hac) : (7'h41))))));
            end
          else
            begin
              reg59 <= ((!wire57[(1'h1):(1'h0)]) ?
                  (($signed(wire50[(4'hc):(3'h7)]) <= wire56[(4'ha):(1'h0)]) ^ ($signed($signed(wire54)) >>> reg60)) : (!(-(|(wire49 >>> (8'ha5))))));
              reg60 <= ({(+wire53)} <<< ((reg59 << reg60[(2'h2):(1'h1)]) ?
                  (((wire51 ? wire53 : reg60) ?
                          (wire56 || wire51) : (wire56 && wire56)) ?
                      ((!reg61) ?
                          $unsigned(reg58) : {reg58}) : $signed($signed(wire57))) : ((wire53[(2'h3):(1'h1)] ?
                      (|reg58) : $signed(wire56)) <<< ((reg60 ?
                          wire55 : wire49) ?
                      $signed(wire54) : $unsigned(wire50)))));
              reg61 <= (~&(-(~wire57[(1'h0):(1'h0)])));
              reg62 <= $unsigned(($unsigned($signed($unsigned(wire49))) ?
                  wire50 : (|(&(~|wire53)))));
              reg63 <= (-wire54);
            end
        end
      else
        begin
          reg59 <= ($unsigned(wire55) ~^ reg63);
          if ($signed({$unsigned((~(~|wire49))), reg59}))
            begin
              reg60 <= reg63;
              reg61 <= wire54;
              reg62 <= $signed($signed($signed(reg60[(1'h1):(1'h1)])));
              reg63 <= {{(^~reg58)}};
            end
          else
            begin
              reg60 <= {wire51[(2'h2):(2'h2)]};
              reg61 <= $signed((({(reg58 ? reg62 : wire56),
                      (wire53 ? reg59 : reg61)} * (~|reg62[(4'hd):(3'h5)])) ?
                  (($signed((8'ha4)) <<< (~reg62)) ?
                      ((reg58 != reg62) ?
                          wire49 : wire55[(1'h1):(1'h1)]) : (&wire49[(3'h5):(1'h1)])) : ($signed($signed((8'hae))) ?
                      wire57 : $signed(reg59))));
            end
          reg64 <= $signed($unsigned($unsigned($signed(((8'hb7) < reg59)))));
          if (reg59[(4'hc):(2'h2)])
            begin
              reg65 <= (wire54[(1'h1):(1'h1)] << (~&(&(+(reg62 == wire54)))));
              reg66 <= $signed({$signed($signed((reg65 ? reg61 : wire51))),
                  (-wire53)});
              reg67 <= (!reg63);
            end
          else
            begin
              reg65 <= reg59[(1'h1):(1'h0)];
            end
          reg68 <= $signed(wire52[(1'h1):(1'h0)]);
        end
      reg69 <= $signed((((reg61[(4'h8):(4'h8)] ?
              $signed(reg59) : $unsigned(reg61)) >>> reg67) ?
          reg67 : reg64));
    end
  assign wire70 = (~^$signed(reg67));
  assign wire71 = (-(wire53 >> $unsigned(($signed(wire54) * $unsigned(reg59)))));
  assign wire72 = (!reg68);
  always
    @(posedge clk) begin
      reg73 <= $unsigned($unsigned((|(+{wire50}))));
    end
  assign wire74 = $signed((|(-{$unsigned(reg67)})));
  assign wire75 = ($signed(wire72[(4'hd):(4'hb)]) ?
                      ($unsigned((reg59[(5'h15):(4'hc)] ?
                              wire71 : wire72[(3'h5):(1'h1)])) ?
                          reg65[(5'h11):(2'h3)] : $unsigned($unsigned(((8'hb0) != reg63)))) : (wire57 ~^ $unsigned((reg66 < (reg59 < wire74)))));
  assign wire76 = reg58;
  assign wire77 = {$signed($unsigned((reg73 ?
                          $unsigned(reg73) : (wire74 ? reg66 : wire56))))};
  assign wire78 = reg65[(4'he):(3'h6)];
  module79 #() modinst93 (wire92, clk, reg69, wire52, wire75, reg67, wire76);
  assign wire94 = reg59;
endmodule

module module28
#(parameter param40 = (+(((((8'ha1) - (8'hb5)) > (^(7'h41))) ? {((8'hba) < (7'h41))} : (8'hbd)) ^ (!({(8'ha9), (8'hbb)} < ((7'h44) ? (8'hb7) : (8'hb1)))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire [(4'hf):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  assign y = {wire39, wire38, wire37, wire34, wire33, reg36, reg35, (1'h0)};
  assign wire33 = (~&(8'hbf));
  assign wire34 = wire29;
  always
    @(posedge clk) begin
      reg35 <= ($unsigned((wire34[(3'h4):(1'h1)] >>> $signed((wire34 ?
          wire33 : wire31)))) <= $unsigned((&$unsigned(wire34))));
      reg36 <= (^(~|$signed($signed(wire31))));
    end
  assign wire37 = (|((7'h44) || {{wire32, $unsigned(wire33)}}));
  assign wire38 = (-$unsigned((!(~&(^wire30)))));
  assign wire39 = ((!$signed(wire32)) ?
                      $signed($signed($signed((wire31 ?
                          wire34 : reg35)))) : wire29);
endmodule

module module79
#(parameter param91 = ({({(^(7'h40)), {(8'ha9), (8'hbf)}} ? (|(+(8'h9c))) : (-((7'h43) ^ (8'hb1))))} ? (((~&((8'ha0) <<< (8'ha8))) ? (((8'hba) ? (8'hb0) : (8'hb3)) || ((8'h9c) - (8'ha8))) : (((7'h44) > (8'hae)) << (8'ha2))) >> {((8'hbf) ? ((8'hb7) <= (8'hb1)) : (^~(8'hbb)))}) : ({{((8'ha4) <<< (8'hba))}} ? {(((8'hae) ? (8'hb4) : (7'h41)) > {(8'hbe), (8'h9c)})} : ((((8'hb0) ? (7'h40) : (8'hba)) >= ((8'had) ? (8'hb9) : (8'haf))) * (~^(!(8'hbe)))))))
(y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire84;
  input wire [(4'h9):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  input wire [(5'h10):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  assign y = {wire90, wire89, wire88, wire87, wire86, wire85, (1'h0)};
  assign wire85 = wire84;
  assign wire86 = wire84[(1'h0):(1'h0)];
  assign wire87 = $unsigned(wire83[(2'h3):(1'h1)]);
  assign wire88 = {(+$signed($unsigned((wire85 ? wire84 : wire84))))};
  assign wire89 = {wire85[(2'h2):(1'h0)], wire81[(3'h6):(1'h0)]};
  assign wire90 = (~|$signed(wire89[(1'h0):(1'h0)]));
endmodule
