module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire108;
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  assign y = {wire125,
                 wire122,
                 wire112,
                 wire111,
                 wire110,
                 wire4,
                 wire5,
                 wire108,
                 reg124,
                 reg123,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = {(-{$signed(wire0),
                         (wire1[(4'h8):(1'h1)] ?
                             wire1[(2'h3):(1'h0)] : (wire1 ? wire2 : wire0))}),
                     ((({(8'ha0), wire0} ?
                             wire3 : $signed(wire0)) ~^ (wire2[(2'h2):(2'h2)] ?
                             wire3 : wire3)) ?
                         (~|wire2[(2'h2):(2'h2)]) : $signed({(wire1 <<< wire2)}))};
  assign wire5 = $signed((!wire0[(4'hd):(4'h8)]));
  always
    @(posedge clk) begin
      reg6 <= {(+$unsigned($signed((wire0 ? (8'hb7) : wire3)))),
          {(~{((8'ha2) ? wire4 : wire4)})}};
      if (((~&wire2[(2'h2):(1'h0)]) == $signed(wire3)))
        begin
          reg7 <= (wire4 ?
              $signed((&wire0[(3'h7):(2'h3)])) : ($signed(({reg6,
                  wire5} && $signed((8'ha3)))) <= {(reg6[(1'h1):(1'h0)] ^~ wire0)}));
          reg8 <= $signed(reg7[(2'h3):(2'h2)]);
          reg9 <= ((($unsigned((^reg8)) ?
                  (wire5 ?
                      (reg6 && reg7) : wire0[(5'h10):(1'h0)]) : {(reg8 | wire2)}) ?
              {reg6} : wire4) + ((~(^(wire5 >> wire3))) ^ wire0[(4'hc):(4'h8)]));
          reg10 <= (wire0[(3'h4):(1'h1)] ?
              ((^~wire4[(4'ha):(4'h8)]) ^ $signed({$unsigned(wire4)})) : ($unsigned(wire0[(3'h6):(2'h3)]) ?
                  (-$unsigned($signed(reg9))) : wire2[(2'h3):(1'h0)]));
        end
      else
        begin
          reg7 <= ($signed($unsigned(((~wire1) ? wire2 : {reg8}))) == (&reg10));
          reg8 <= (8'ha9);
        end
      reg11 <= ($unsigned($signed($unsigned(reg10[(3'h4):(1'h0)]))) <<< $signed({($unsigned((8'hae)) ?
              $signed(reg10) : (~^reg7))}));
      reg12 <= (~(reg9 && {(wire4 ? $unsigned(reg10) : $signed(reg6))}));
      reg13 <= (~^(($signed(((8'hb9) ? wire3 : reg6)) ?
              $signed((wire5 > reg11)) : $signed((^~reg11))) ?
          ((&reg9) ?
              ((-reg8) ?
                  $signed((8'h9e)) : wire3) : (^~((8'hbb) ^~ reg11))) : ((((8'ha3) ?
                  reg6 : wire0) ?
              reg9 : (~wire0)) ^~ ({reg6, reg10} ^~ (reg10 & reg10)))));
    end
  module14 #() modinst109 (wire108, clk, reg6, reg7, reg12, wire2);
  assign wire110 = wire2[(2'h2):(1'h0)];
  assign wire111 = {(wire4 - reg12)};
  assign wire112 = $unsigned(reg7[(4'he):(4'he)]);
  always
    @(posedge clk) begin
      reg113 <= ($unsigned($unsigned(($signed(reg7) <= (reg13 ?
          reg9 : wire0)))) != (-$signed($signed($signed(wire2)))));
      reg114 <= (+reg9);
      if ($signed(((&$unsigned((reg114 >>> (8'h9f)))) ~^ $unsigned((~$unsigned(reg10))))))
        begin
          reg115 <= (~reg9);
          reg116 <= $signed(reg6[(3'h5):(1'h1)]);
          if ((wire3 ?
              ((($unsigned(wire110) < $signed(wire1)) || ($unsigned(wire1) && (+wire1))) >> (&wire2[(3'h5):(3'h4)])) : (wire1[(4'hd):(3'h6)] & {reg11[(1'h0):(1'h0)]})))
            begin
              reg117 <= (wire112 >= (reg10[(4'hc):(3'h4)] << wire3));
              reg118 <= reg116;
              reg119 <= ((+(8'hb1)) * (7'h43));
              reg120 <= reg7[(4'hc):(1'h0)];
              reg121 <= reg12[(3'h5):(3'h4)];
            end
          else
            begin
              reg117 <= (~&$signed((wire4[(1'h0):(1'h0)] ?
                  $signed(reg8[(2'h2):(2'h2)]) : wire0[(4'ha):(3'h6)])));
              reg118 <= (reg6 ?
                  ((8'hbb) ?
                      (reg6 ?
                          ($unsigned(reg116) * reg118) : (&(reg12 <<< (8'hab)))) : $unsigned(reg113[(1'h0):(1'h0)])) : ($signed((~&(reg114 ?
                      reg113 : reg115))) | wire0[(5'h10):(5'h10)]));
              reg119 <= ((reg6[(1'h0):(1'h0)] < $unsigned(wire111[(2'h2):(2'h2)])) ?
                  reg117[(2'h2):(2'h2)] : wire0);
            end
        end
      else
        begin
          reg115 <= reg10;
          if ($signed({reg7[(3'h7):(3'h5)], (!reg116)}))
            begin
              reg116 <= (reg121 ?
                  ($signed(($signed(wire4) ?
                      (reg7 ?
                          wire3 : reg11) : reg6[(3'h6):(3'h6)])) & $signed(({wire108} ?
                      (+reg118) : $unsigned((8'hae))))) : (wire112[(2'h2):(1'h1)] ?
                      reg117 : (($signed(wire0) ?
                          wire0 : (~^wire110)) + {{(8'hb8), wire0}})));
              reg117 <= $signed((&{(8'hac), wire112[(2'h2):(1'h0)]}));
              reg118 <= ($signed(reg13) * (|((+(wire0 ^~ reg115)) ?
                  $signed($signed(wire1)) : $signed($signed(reg119)))));
            end
          else
            begin
              reg116 <= (-reg9);
              reg117 <= ($unsigned($unsigned({(^(8'ha4))})) >>> (~$unsigned((reg120 ^~ reg10))));
              reg118 <= $unsigned(((^~(8'haf)) ?
                  (({wire1} && wire110[(4'h9):(3'h6)]) ?
                      reg13[(3'h6):(3'h6)] : wire3) : (~&$signed({reg116,
                      (8'hb2)}))));
              reg119 <= (wire110 & reg10);
            end
        end
    end
  assign wire122 = reg11;
  always
    @(posedge clk) begin
      reg123 <= reg8;
      reg124 <= ($signed((reg118 != $signed((reg6 ?
          wire0 : reg121)))) && $unsigned(($signed($signed(reg116)) ?
          ((|reg11) ? wire2 : $unsigned(reg121)) : {(wire112 * wire1)})));
    end
  assign wire125 = reg113[(1'h0):(1'h0)];
endmodule

module module14
#(parameter param107 = {{(((^(8'h9f)) > ((8'hb2) ? (8'hb4) : (7'h40))) * (~&(~&(8'ha8)))), {(((7'h40) ^~ (8'hbe)) ? ((8'hb0) ^ (8'ha2)) : ((8'hbb) + (8'ha2)))}}})
(y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire40;
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  assign y = {wire106,
                 wire97,
                 wire51,
                 wire50,
                 wire49,
                 wire22,
                 wire23,
                 wire24,
                 wire40,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= $signed(((wire17 ?
          ((+wire16) | $unsigned(wire17)) : (wire18[(1'h1):(1'h1)] > {wire18})) > (+wire15)));
      reg20 <= wire16[(3'h4):(1'h0)];
      reg21 <= wire16[(3'h5):(3'h5)];
    end
  assign wire22 = reg21;
  assign wire23 = (($unsigned(((wire17 || wire15) < wire18[(3'h5):(2'h3)])) ?
                          {((8'hbe) ?
                                  $signed((8'haa)) : (reg19 ?
                                      reg21 : wire18))} : ($signed((!reg21)) >>> ($unsigned(reg20) != $unsigned(wire16)))) ?
                      ($signed($signed((+reg19))) ?
                          $signed(($signed(wire16) ?
                              reg21 : (~|wire18))) : $unsigned((reg19 ?
                              {(8'ha1), wire22} : (reg19 ?
                                  wire17 : reg19)))) : (($unsigned(reg19) ^~ $unsigned((reg21 ?
                          reg21 : (8'haa)))) <= $unsigned({(wire15 ^~ reg19)})));
  assign wire24 = reg19;
  module25 #() modinst41 (.wire28(wire24), .y(wire40), .wire26(wire15), .wire29(wire17), .clk(clk), .wire27(reg20));
  always
    @(posedge clk) begin
      if ((~^$unsigned(wire17[(1'h1):(1'h1)])))
        begin
          reg42 <= (^~reg21);
          reg43 <= (~^$unsigned((($signed((8'hb7)) != $unsigned(reg42)) & $signed(reg21))));
        end
      else
        begin
          reg42 <= (|wire40);
          reg43 <= ($signed($unsigned((+reg42))) > $unsigned($signed($signed({reg19}))));
        end
    end
  always
    @(posedge clk) begin
      reg44 <= reg21[(1'h1):(1'h0)];
      reg45 <= $signed($unsigned(wire15[(4'hf):(3'h5)]));
      reg46 <= wire23;
      reg47 <= wire18;
      reg48 <= reg47;
    end
  assign wire49 = $signed($signed((+(-reg45))));
  assign wire50 = ((reg47[(1'h1):(1'h1)] ~^ ((^~reg48[(3'h4):(2'h3)]) ?
                      {reg43} : $unsigned(wire24))) >> {((wire16 ?
                          ((8'hb6) | (7'h44)) : (reg48 ^~ wire22)) >> wire49),
                      (+(^reg48))});
  assign wire51 = (-(8'h9f));
  module52 #() modinst98 (.wire53(reg42), .wire56(wire49), .clk(clk), .wire55(reg43), .wire54(wire50), .y(wire97));
  always
    @(posedge clk) begin
      reg99 <= $unsigned(({wire22, (~&$signed(wire51))} <<< ({{reg21},
          $signed(reg42)} | $unsigned(reg19[(4'ha):(4'h9)]))));
      reg100 <= reg46[(2'h3):(2'h3)];
      if ((8'ha2))
        begin
          reg101 <= ($signed((7'h43)) | $unsigned(wire23[(1'h1):(1'h0)]));
          reg102 <= (~|$signed((8'ha3)));
          reg103 <= $signed(((|(-(+reg101))) ^~ reg43[(4'ha):(4'h9)]));
        end
      else
        begin
          reg101 <= ($unsigned(reg44[(4'ha):(4'h8)]) >>> (!{(8'hab)}));
          reg102 <= reg46;
          reg103 <= $unsigned((+{reg42, (^$signed(wire16))}));
          reg104 <= {(^($signed((reg47 ?
                  (8'hbc) : wire50)) < {reg102[(3'h4):(1'h0)],
                  (reg19 ? reg47 : (7'h42))}))};
          reg105 <= (reg46 ?
              (((~|(~|reg20)) ^~ reg43[(4'he):(4'hd)]) - wire16) : $signed(reg103));
        end
    end
  assign wire106 = $unsigned(wire40);
endmodule

module module52
#(parameter param95 = (((((~(8'hab)) ? (+(8'hae)) : ((8'ha9) ^~ (7'h40))) ? ((!(8'hbb)) + ((7'h41) <= (8'ha0))) : (((8'haf) ? (8'hbf) : (8'h9d)) ? {(8'hb7), (7'h42)} : (~^(8'ha1)))) != (+(~&((7'h40) ? (8'hab) : (8'hb7))))) >= {{(((8'hb7) ? (8'had) : (8'hb8)) <<< ((8'ha7) ? (8'hbd) : (8'hb6))), ((~^(8'hae)) ? (&(8'had)) : ((8'hbc) ? (8'hbc) : (8'haa)))}}), 
parameter param96 = (~^(((^~{(8'hba)}) >>> {(param95 ? param95 : param95), (param95 ^ param95)}) ? (~|param95) : param95)))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire56;
  input wire signed [(4'hd):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire signed [(3'h5):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  assign y = {wire94,
                 wire81,
                 wire80,
                 wire58,
                 wire57,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg79,
                 reg78,
                 reg77,
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
                 reg59,
                 (1'h0)};
  assign wire57 = wire53;
  assign wire58 = $signed(wire56);
  always
    @(posedge clk) begin
      if (wire57[(4'hd):(4'hb)])
        begin
          reg59 <= wire54[(1'h0):(1'h0)];
        end
      else
        begin
          reg59 <= (8'had);
          if ((|{($unsigned(reg59) ?
                  wire55 : (wire58[(4'ha):(2'h3)] - (^~wire58)))}))
            begin
              reg60 <= (reg59 ?
                  $unsigned(wire56[(1'h0):(1'h0)]) : ($signed($unsigned((wire58 + (8'hb7)))) ?
                      (wire56 >>> $unsigned($signed(wire53))) : $signed(((wire56 ?
                          wire54 : wire54) >> (wire57 ? wire53 : (8'ha9))))));
              reg61 <= $signed(reg59[(2'h2):(2'h2)]);
              reg62 <= (|((($signed(reg60) <= (wire54 ?
                  (8'hbc) : reg61)) < $signed(wire55)) ^~ {$unsigned(wire54[(1'h0):(1'h0)]),
                  $signed($unsigned(wire53))}));
              reg63 <= $signed(reg60);
              reg64 <= wire57[(5'h10):(2'h2)];
            end
          else
            begin
              reg60 <= wire54[(3'h4):(2'h2)];
              reg61 <= $signed(wire58[(4'hb):(1'h0)]);
              reg62 <= $signed(($signed(($signed(reg61) <<< (reg59 + wire55))) ?
                  ($signed($unsigned(reg61)) ?
                      ((reg63 - reg60) + (wire57 ?
                          wire57 : (7'h41))) : $signed(reg60[(3'h4):(1'h0)])) : reg63[(4'hb):(4'hb)]));
            end
          reg65 <= wire57[(2'h3):(1'h0)];
          reg66 <= reg61;
        end
      reg67 <= (reg59[(3'h7):(3'h6)] ?
          $unsigned((reg65[(4'h8):(2'h3)] ?
              ($signed(reg63) ?
                  (reg62 ?
                      reg64 : wire58) : ((8'ha2) || reg60)) : (&{wire53}))) : $unsigned((reg63 ?
              (!(wire57 ? wire55 : reg61)) : reg63[(4'hc):(2'h3)])));
      reg68 <= $signed((wire56 ?
          wire53[(2'h3):(1'h1)] : $unsigned($unsigned(reg59))));
      reg69 <= (reg64[(4'hb):(4'ha)] >>> (!(wire55 >>> $unsigned(reg67))));
    end
  always
    @(posedge clk) begin
      reg70 <= reg59[(2'h3):(1'h1)];
      if (reg70)
        begin
          if ((!$signed(($signed((~^wire57)) * $signed({wire53})))))
            begin
              reg71 <= (-($signed(($unsigned((8'h9f)) ?
                  reg70[(4'hd):(1'h0)] : wire58)) == (!wire54[(4'ha):(4'h9)])));
              reg72 <= wire57[(2'h3):(2'h3)];
            end
          else
            begin
              reg71 <= (&wire54[(3'h5):(3'h5)]);
            end
          if ((!$unsigned(reg70)))
            begin
              reg73 <= (~&(^wire56[(2'h3):(2'h3)]));
              reg74 <= {reg66[(4'ha):(3'h7)],
                  ($signed(((wire54 ? reg64 : reg69) ?
                          (reg64 <= reg62) : wire58[(3'h4):(1'h1)])) ?
                      ((!reg59[(2'h3):(1'h1)]) ?
                          reg59[(3'h7):(2'h3)] : $unsigned($unsigned((8'hb0)))) : (~&(&$signed(reg60))))};
            end
          else
            begin
              reg73 <= $unsigned((-(!$signed((~^reg73)))));
              reg74 <= (reg59 ? wire55 : wire57[(3'h7):(3'h6)]);
              reg75 <= $unsigned($unsigned($signed(wire58[(4'hc):(4'h9)])));
              reg76 <= ($unsigned(reg64[(2'h3):(2'h3)]) - reg67);
            end
          reg77 <= ((reg76 ?
              reg61 : $signed($unsigned(reg68[(1'h1):(1'h1)]))) || {(reg61 + $unsigned((~^wire53)))});
          reg78 <= ($unsigned($unsigned($signed((8'ha4)))) | (reg59 < (-$signed((reg59 ?
              reg62 : reg59)))));
          reg79 <= reg75;
        end
      else
        begin
          reg71 <= ({reg66, (-reg72)} + (&(~&(^(reg67 ? wire58 : reg72)))));
          reg72 <= $unsigned($unsigned(reg60));
        end
    end
  assign wire80 = $signed($unsigned($signed(({reg76, (8'hb0)} ?
                      reg75 : (wire58 <<< reg71)))));
  assign wire81 = (({(8'hb7)} >= reg70[(3'h5):(1'h1)]) ^ {$unsigned(reg64)});
  always
    @(posedge clk) begin
      reg82 <= reg74;
      reg83 <= (~((-$unsigned(reg61[(3'h7):(2'h2)])) ?
          $unsigned((!$signed(reg61))) : {((reg59 ^~ reg79) >= $signed(reg76))}));
      if ({reg64})
        begin
          if (({((~&{reg75}) ?
                  $signed(reg59[(2'h2):(2'h2)]) : ($signed(wire55) == ((7'h41) ?
                      reg74 : (8'hbf))))} ^~ reg73))
            begin
              reg84 <= (|(wire81 | ((wire55 && (7'h41)) ?
                  (((8'hb3) >>> reg74) >= (reg64 ?
                      reg62 : reg65)) : (~^reg59[(3'h4):(2'h2)]))));
              reg85 <= $signed((!wire81));
              reg86 <= $signed(reg67[(3'h7):(2'h3)]);
            end
          else
            begin
              reg84 <= ($unsigned($signed($signed($signed(reg62)))) ?
                  {reg77[(1'h0):(1'h0)]} : wire55);
              reg85 <= reg77;
              reg86 <= $signed($signed(wire54));
            end
          if ($unsigned($unsigned($signed((reg72[(4'h8):(4'h8)] ?
              (8'ha1) : reg78[(4'hf):(3'h7)])))))
            begin
              reg87 <= (~&(~&((reg82[(1'h1):(1'h0)] <= reg74) == $unsigned((reg85 - (8'hae))))));
              reg88 <= reg72[(4'h9):(1'h0)];
              reg89 <= ((reg62[(4'ha):(3'h4)] ?
                  ((~$unsigned(reg59)) ?
                      $signed((reg85 ? reg71 : reg85)) : ($unsigned(reg79) ?
                          wire53 : (reg74 ?
                              wire80 : reg87))) : (reg62 == reg59[(3'h4):(2'h3)])) <<< wire81[(2'h2):(2'h2)]);
            end
          else
            begin
              reg87 <= reg85[(3'h5):(2'h3)];
              reg88 <= reg71[(5'h12):(2'h2)];
              reg89 <= $signed(reg62[(3'h5):(3'h5)]);
            end
          reg90 <= (($unsigned((reg73[(3'h4):(1'h1)] ?
                  $unsigned(reg86) : {reg65})) == $unsigned(reg65)) ?
              $signed($unsigned(reg84)) : ((^$unsigned((reg78 ?
                      wire81 : reg86))) ?
                  (&{(+reg83)}) : $unsigned((!reg77[(3'h6):(3'h4)]))));
          reg91 <= $unsigned((|$unsigned(wire55)));
        end
      else
        begin
          reg84 <= (~&(|$unsigned($unsigned(reg62[(4'hc):(2'h2)]))));
          reg85 <= {($unsigned(reg82) && ((reg61 ?
                  (reg75 > reg72) : (8'haa)) > ((|reg69) * (reg90 ?
                  reg68 : reg79)))),
              $unsigned(reg78)};
          reg86 <= {$unsigned($signed((reg82 ?
                  (wire80 ? reg72 : reg68) : (reg60 ? reg85 : (7'h43)))))};
          reg87 <= (!({((reg74 >= reg59) ?
                      (reg68 ? wire58 : reg63) : (~wire58))} ?
              (8'h9d) : (~^$unsigned($unsigned(reg83)))));
          reg88 <= ($unsigned((~&reg60[(5'h11):(4'ha)])) & (-((~(reg63 <= reg85)) ?
              ($signed(reg84) ?
                  (reg89 & wire53) : $unsigned(reg76)) : (~&(|reg88)))));
        end
      reg92 <= $signed((^~(({reg85} >>> (reg64 ? wire53 : (8'hb9))) ?
          $signed(reg73[(1'h1):(1'h1)]) : $signed((reg83 >= reg61)))));
      reg93 <= (reg63[(1'h1):(1'h0)] ?
          $unsigned((~|{((8'hb6) ? reg69 : wire80),
              reg88[(2'h3):(2'h2)]})) : reg85[(1'h0):(1'h0)]);
    end
  assign wire94 = {wire81, (|(~|{$signed(reg79), wire81[(3'h7):(3'h5)]}))};
endmodule

module module25
#(parameter param39 = (({(^~{(8'ha1), (8'hab)})} << ((((8'hb8) ? (8'hb4) : (8'hb9)) ? ((8'haf) ? (8'ha3) : (8'hbc)) : ((8'ha6) ? (8'hbb) : (8'hb0))) != (&((8'hb7) ? (8'ha2) : (8'hb0))))) ^~ (((((8'ha4) ? (8'ha0) : (8'hb0)) <<< ((8'had) ? (8'ha1) : (8'hb3))) ? (((8'haf) ? (8'ha2) : (8'hbb)) ? ((8'ha7) <<< (8'ha3)) : {(8'hae), (7'h43)}) : ({(8'hbc), (8'hb6)} ? (-(8'ha2)) : {(7'h42)})) <<< (-(((8'hb5) ? (8'hab) : (8'hbc)) ? (~(8'hac)) : ((8'hb6) <= (7'h40)))))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire [(5'h15):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire30;
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire30 = {$unsigned((^~wire26[(4'hb):(1'h0)]))};
  always
    @(posedge clk) begin
      reg31 <= $signed(wire29[(1'h0):(1'h0)]);
      reg32 <= wire28;
    end
  assign wire33 = (wire29[(3'h4):(3'h4)] ?
                      (^~$signed($signed(wire28[(5'h10):(3'h4)]))) : (((wire28[(4'hd):(3'h7)] & reg31) ?
                          $unsigned(reg31) : wire27[(1'h0):(1'h0)]) + reg31[(2'h3):(2'h2)]));
  assign wire34 = {$signed($unsigned(wire27)), $signed(reg32)};
  assign wire35 = (-{($signed($unsigned(wire27)) ?
                          ($unsigned(wire29) >>> (~reg32)) : $unsigned(wire30))});
  assign wire36 = wire26[(4'he):(2'h2)];
  assign wire37 = wire33;
  assign wire38 = (8'ha2);
endmodule
