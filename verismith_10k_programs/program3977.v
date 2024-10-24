module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h35e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire41,
                 wire34,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (8'hb4);
  always
    @(posedge clk) begin
      if ((-wire2))
        begin
          if (($signed(($unsigned($unsigned(wire1)) << ((wire5 == wire3) ?
                  $signed(wire3) : (wire1 ? wire4 : wire5)))) ?
              wire5[(1'h0):(1'h0)] : (~{((wire1 ? wire5 : wire1) << wire0)})))
            begin
              reg6 <= ((-((wire0[(3'h5):(3'h5)] <= (wire3 ? wire5 : (8'hbd))) ?
                  ($unsigned(wire2) | (wire2 & (8'hbf))) : $signed({wire5,
                      wire3}))) * $unsigned($signed((~(wire3 << wire5)))));
            end
          else
            begin
              reg6 <= reg6[(3'h5):(2'h3)];
            end
          reg7 <= wire5;
          reg8 <= wire1;
          reg9 <= (((8'ha9) << wire1[(3'h4):(1'h1)]) || {$signed(wire3)});
          if ($signed(wire1[(4'h9):(1'h1)]))
            begin
              reg10 <= (^$signed(({$unsigned(wire5)} ?
                  (^(wire0 > wire5)) : ((wire5 ? wire0 : (8'hac)) ?
                      (8'hbb) : reg6[(4'hd):(4'h8)]))));
            end
          else
            begin
              reg10 <= (wire5 <<< wire4[(2'h3):(1'h1)]);
              reg11 <= ((~(~(~^(&wire2)))) + (8'hb5));
              reg12 <= {reg8[(2'h3):(2'h2)]};
              reg13 <= reg8[(3'h7):(3'h5)];
              reg14 <= {($signed($unsigned((wire3 ? reg7 : reg7))) ?
                      $signed((8'hbe)) : reg12)};
            end
        end
      else
        begin
          if (wire5[(4'h8):(3'h5)])
            begin
              reg6 <= reg14[(1'h0):(1'h0)];
              reg7 <= ((reg10[(2'h2):(2'h2)] || $signed({(~wire5)})) ?
                  reg13 : $unsigned(($unsigned((!reg12)) - ((8'ha9) + (wire2 << wire2)))));
            end
          else
            begin
              reg6 <= $signed(({{(wire5 * wire1),
                      reg8}} & reg10[(2'h2):(1'h0)]));
              reg7 <= reg9[(3'h4):(2'h3)];
              reg8 <= $signed(reg7);
              reg9 <= (wire5 ?
                  (wire3[(1'h1):(1'h0)] >>> reg9[(3'h5):(3'h4)]) : (wire1[(3'h5):(3'h5)] & (^reg11)));
              reg10 <= $unsigned($signed((-$signed((reg12 > wire3)))));
            end
          reg11 <= ($unsigned(reg6[(4'hd):(4'hc)]) ^ wire5);
        end
      reg15 <= reg9[(3'h5):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg16 <= $unsigned((($unsigned((reg10 ?
              reg9 : reg10)) <<< ((wire0 <<< reg12) ?
              (wire1 == reg15) : (wire4 ? wire0 : reg10))) ?
          (&((wire5 ?
              wire4 : wire2) << (wire3 >>> reg12))) : ($signed($signed(reg13)) <<< reg7)));
      reg17 <= ((wire5 ?
              $unsigned(reg16[(4'hf):(4'h9)]) : ($signed((reg16 ?
                      reg12 : reg6)) ?
                  wire1[(4'ha):(3'h6)] : (reg9[(3'h4):(2'h2)] >>> $signed(reg15)))) ?
          ((({wire2, wire1} ^~ wire3) ?
                  ({reg16, reg6} * reg14) : {$unsigned(reg9), reg16}) ?
              (wire5 < (|$unsigned(reg13))) : reg12) : $unsigned((8'ha5)));
      if ($signed((+wire2[(1'h1):(1'h0)])))
        begin
          reg18 <= (+(~&$signed(reg8)));
          reg19 <= $signed(reg16[(4'hc):(4'h9)]);
          reg20 <= $signed((|(~|$signed((-reg14)))));
        end
      else
        begin
          reg18 <= reg11;
          reg19 <= (wire0[(4'ha):(3'h6)] * (+reg16[(3'h7):(1'h0)]));
        end
    end
  assign wire21 = $signed(((&reg15[(3'h4):(1'h1)]) << {wire0[(3'h5):(1'h1)],
                      reg7}));
  assign wire22 = $signed({(reg11 > reg20)});
  assign wire23 = ($unsigned($signed(wire0)) ?
                      ((~&(reg13[(4'h8):(3'h7)] ?
                              reg8 : ((7'h42) ? reg19 : reg11))) ?
                          (^reg14[(4'hc):(4'hc)]) : wire5[(2'h3):(1'h1)]) : reg14);
  assign wire24 = ((reg7 ?
                          wire23[(4'hb):(4'ha)] : (reg20[(2'h2):(1'h1)] >> $unsigned($unsigned(reg13)))) ?
                      $unsigned((reg8 ?
                          reg15 : ((reg14 <= reg12) == (!reg12)))) : $signed((((wire23 ?
                              (8'hbb) : reg9) ?
                          reg16 : $signed((8'hb0))) <= {(~reg11),
                          (reg15 ? reg10 : (8'ha3))})));
  assign wire25 = $unsigned((-(!reg8[(4'ha):(3'h6)])));
  always
    @(posedge clk) begin
      if (wire5[(1'h1):(1'h1)])
        begin
          reg26 <= reg17;
        end
      else
        begin
          reg26 <= $unsigned({$unsigned(({wire5} >>> $signed(reg15)))});
          reg27 <= (wire0 ?
              reg14[(4'hf):(4'hd)] : ($unsigned((-{wire0,
                  reg9})) <<< $signed((~&(~&wire22)))));
          reg28 <= ((reg14[(3'h5):(3'h4)] < reg11[(4'ha):(3'h5)]) ?
              wire22[(2'h2):(2'h2)] : ($signed($unsigned((reg15 ^ wire22))) ?
                  (((~reg11) ? (reg11 << reg13) : wire5[(3'h4):(1'h0)]) ?
                      reg7 : reg12) : (^wire4[(3'h5):(3'h5)])));
          reg29 <= wire5[(4'h9):(2'h2)];
        end
      reg30 <= (((&reg11) ?
              {$unsigned((reg13 != reg12)),
                  wire22[(3'h7):(2'h3)]} : $signed(reg18)) ?
          {(reg12[(1'h1):(1'h0)] >>> (^~$signed(reg9))),
              ({(^~reg13),
                  (reg19 << wire5)} && $signed((reg7 | (7'h44))))} : (-(8'haa)));
      reg31 <= ((8'hb4) | wire24);
      reg32 <= reg6[(2'h3):(1'h1)];
      reg33 <= $unsigned($unsigned($unsigned(($unsigned((8'haf)) ?
          reg18 : {reg17, reg6}))));
    end
  assign wire34 = $unsigned((~&((reg17 ?
                      $unsigned(wire22) : $unsigned(reg30)) < (+(reg11 != reg27)))));
  always
    @(posedge clk) begin
      reg35 <= (({(~wire2), (^wire5[(3'h5):(1'h0)])} ?
              $signed({(wire34 ? (8'hb7) : reg15), $signed(reg27)}) : (reg15 ?
                  wire4[(3'h7):(3'h7)] : ((reg14 - wire22) ?
                      (~^reg11) : (wire1 ~^ wire21)))) ?
          ({{(8'hbf),
                  reg16}} <<< ((&wire34) < reg26)) : ({(wire4[(4'h9):(3'h7)] ?
                  wire22[(3'h7):(3'h4)] : wire2),
              wire21[(2'h2):(1'h0)]} <<< $unsigned((&wire3))));
      reg36 <= ($signed(reg16) | ($signed({wire2}) < (~((8'ha9) ?
          (wire2 ? wire34 : (8'h9f)) : $unsigned(wire5)))));
    end
  always
    @(posedge clk) begin
      reg37 <= ($unsigned(reg29) ?
          $signed(reg32[(5'h10):(2'h2)]) : $signed($unsigned(wire1[(4'hb):(2'h3)])));
      reg38 <= ($unsigned((reg31 ?
          {reg29} : (((8'hac) | wire34) >>> reg35))) == (|(reg9[(3'h4):(2'h3)] <= reg19[(4'h9):(3'h5)])));
      reg39 <= (reg16 <= reg29[(2'h2):(2'h2)]);
      reg40 <= $signed($signed(reg20));
    end
  assign wire41 = ($unsigned(((+(&reg39)) ? wire0 : reg36)) ?
                      (|((~(8'hba)) ?
                          ($signed(reg11) ?
                              {reg36,
                                  wire5} : (!(8'hbd))) : (|(reg7 * reg30)))) : ((~&$signed((wire22 & (8'ha9)))) ^ $unsigned((|(8'hb4)))));
  always
    @(posedge clk) begin
      reg42 <= wire25[(3'h5):(1'h1)];
      reg43 <= (+(~wire3[(1'h1):(1'h0)]));
      reg44 <= ($signed(((~&{reg18}) ~^ (reg15[(1'h1):(1'h0)] ?
              (reg6 ? reg40 : (8'hb7)) : reg37))) ?
          $unsigned({(8'hab)}) : (wire2 || $signed($unsigned(wire25))));
      reg45 <= (((-(~{reg28,
              wire4})) && $unsigned(($signed(reg37) >>> reg14))) ?
          reg10[(2'h2):(1'h0)] : {((-wire22) && reg29)});
    end
  always
    @(posedge clk) begin
      reg46 <= reg43[(4'h8):(3'h5)];
      if ($signed((reg38 ?
          reg18[(3'h4):(1'h1)] : (({reg6} < ((7'h43) <<< reg46)) ?
              $unsigned((reg43 | reg9)) : (reg32 ?
                  wire3[(2'h2):(2'h2)] : (7'h41))))))
        begin
          reg47 <= $signed({$unsigned($unsigned(((8'hb5) ? reg39 : reg7)))});
          if ($signed(reg18))
            begin
              reg48 <= $signed((reg17[(4'he):(4'h9)] ?
                  ($unsigned(reg27[(1'h0):(1'h0)]) ?
                      $unsigned(reg43) : $unsigned({wire2, (8'h9f)})) : reg44));
              reg49 <= wire25;
              reg50 <= ({reg36} > {reg43[(3'h5):(3'h4)]});
            end
          else
            begin
              reg48 <= $unsigned((~&$signed($signed($signed(reg26)))));
            end
          reg51 <= (reg48[(1'h1):(1'h0)] < (8'hb2));
        end
      else
        begin
          if (($signed(((8'haa) ? wire3 : $unsigned(wire34))) ?
              reg11[(1'h1):(1'h1)] : reg36[(4'he):(1'h0)]))
            begin
              reg47 <= {$unsigned((((reg14 ?
                          reg12 : wire5) << reg32[(4'hd):(2'h2)]) ?
                      (!$unsigned(wire25)) : $signed(reg13))),
                  ((~^reg48[(2'h2):(1'h1)]) ?
                      (8'ha2) : $signed((-reg12[(3'h4):(3'h4)])))};
              reg48 <= reg50;
              reg49 <= (((reg49 - $signed({reg18})) ?
                  (reg8 ?
                      $signed((wire5 >> reg35)) : $signed(((8'h9d) ~^ (8'ha6)))) : $signed(reg39[(3'h4):(1'h1)])) < (-$unsigned(((~^(8'h9c)) ?
                  {reg43} : reg13[(3'h5):(3'h4)]))));
              reg50 <= wire21;
              reg51 <= ($signed(reg36[(4'h8):(1'h1)]) >= $signed({(wire1[(4'h8):(2'h3)] ?
                      {wire3, reg50} : (reg31 ? (8'ha0) : reg30))}));
            end
          else
            begin
              reg47 <= reg13[(4'hf):(3'h7)];
              reg48 <= $signed($unsigned($signed(((7'h41) ?
                  (reg39 ? reg32 : (7'h42)) : {reg31, reg16}))));
              reg49 <= (($unsigned($signed(((8'haf) ?
                      reg43 : reg14))) && (($signed(reg30) != reg38[(1'h1):(1'h1)]) | (~(!reg47)))) ?
                  $signed($signed($signed({reg17,
                      (8'hbc)}))) : $signed($signed($signed($unsigned(reg43)))));
              reg50 <= $unsigned($unsigned(reg50));
              reg51 <= (reg50 != reg17);
            end
        end
      reg52 <= $signed((~{{(reg31 ? reg29 : reg11)}}));
      if (reg44)
        begin
          reg53 <= reg15;
          reg54 <= ((8'hb3) ?
              (~^$unsigned($signed((reg40 >> wire24)))) : ($signed((~{reg33,
                      (8'hb2)})) ?
                  ((-(reg36 != reg35)) != $signed((^~reg46))) : (~wire22)));
          reg55 <= ({((~|reg35[(2'h2):(2'h2)]) ?
                      reg11 : ($unsigned(reg18) + {reg48, reg51}))} ?
              wire25[(4'ha):(3'h7)] : reg6);
          reg56 <= wire22[(3'h5):(3'h4)];
          reg57 <= wire23[(3'h4):(1'h1)];
        end
      else
        begin
          reg53 <= reg18;
          if ({reg9, $signed($signed(wire34))})
            begin
              reg54 <= {$signed($signed((~reg54[(1'h1):(1'h1)])))};
              reg55 <= (^($unsigned($signed((+wire21))) << reg57));
              reg56 <= reg13[(2'h3):(1'h0)];
              reg57 <= ((((8'ha4) ^ (-(&wire21))) >>> $unsigned($unsigned((&reg38)))) ?
                  $signed(reg17[(3'h6):(1'h1)]) : $signed(((reg27[(2'h3):(2'h2)] ~^ (wire21 <<< (8'ha9))) ?
                      reg42 : {reg13})));
            end
          else
            begin
              reg54 <= $unsigned((&(~(~&(reg12 != reg28)))));
              reg55 <= (($signed(wire21[(3'h4):(3'h4)]) != reg35[(4'h8):(1'h0)]) ?
                  reg44[(2'h3):(2'h3)] : $unsigned({reg10}));
              reg56 <= reg43[(4'h8):(3'h7)];
            end
        end
      if ($unsigned({reg49[(2'h2):(1'h1)]}))
        begin
          if (((7'h41) ? (~reg13) : reg54))
            begin
              reg58 <= (~^(~^($signed(wire0[(1'h0):(1'h0)]) - $unsigned((reg27 ?
                  (8'had) : reg49)))));
              reg59 <= {$unsigned($unsigned(((wire4 == wire41) ?
                      $signed((8'ha5)) : ((8'h9c) ~^ reg10))))};
              reg60 <= reg49[(3'h6):(3'h5)];
            end
          else
            begin
              reg58 <= ((-$signed($signed(reg12[(2'h2):(1'h0)]))) ?
                  ((reg13[(2'h3):(2'h3)] != (^~(~&reg38))) || {($signed(reg51) - (reg27 - reg43))}) : wire3);
              reg59 <= wire5;
              reg60 <= wire25;
              reg61 <= reg18;
            end
          reg62 <= (~$unsigned(reg55[(1'h1):(1'h1)]));
        end
      else
        begin
          reg58 <= ($unsigned(({$signed(wire22), $signed(reg58)} ~^ (~&(reg29 ?
              reg58 : reg6)))) >> {$signed($signed((8'hb5)))});
        end
    end
  always
    @(posedge clk) begin
      if (((^$unsigned(wire24)) >>> reg10))
        begin
          if ($unsigned(wire5[(4'h9):(3'h5)]))
            begin
              reg63 <= (8'ha5);
              reg64 <= ($signed($unsigned(reg19[(2'h2):(1'h0)])) ?
                  (|((reg19 ^~ reg58) ?
                      {(reg46 ^~ reg14), reg58} : (~^((8'haf) ?
                          (7'h40) : reg47)))) : {$unsigned(((~^reg40) || reg52[(3'h5):(2'h2)]))});
              reg65 <= reg60[(1'h1):(1'h1)];
            end
          else
            begin
              reg63 <= $unsigned((reg43 >= {(^~(8'hae)),
                  {((8'hb7) && reg8), reg51}}));
              reg64 <= $unsigned(((8'hbb) ? wire34 : reg39[(2'h3):(1'h1)]));
              reg65 <= (+reg53[(1'h1):(1'h1)]);
              reg66 <= reg57[(4'hb):(4'hb)];
            end
          if ({(&($signed(reg38[(2'h3):(2'h2)]) ?
                  ($unsigned(reg14) >= wire25) : (~^(~reg11))))})
            begin
              reg67 <= wire0;
              reg68 <= wire1;
              reg69 <= $unsigned(reg9[(4'h9):(2'h3)]);
            end
          else
            begin
              reg67 <= ({{reg51}, $signed((+{reg50, wire5}))} ?
                  reg49[(1'h0):(1'h0)] : reg10[(2'h2):(1'h1)]);
              reg68 <= $signed(($unsigned($unsigned((reg54 ?
                  wire24 : reg43))) ~^ reg63[(3'h4):(1'h1)]));
              reg69 <= (({(&{wire4,
                      reg50})} == reg30) >> (wire22[(1'h0):(1'h0)] ?
                  ($signed((wire24 ? reg32 : (8'hae))) == ((~^reg31) ?
                      reg20[(1'h1):(1'h0)] : $unsigned((8'hbe)))) : $unsigned((((8'h9c) ?
                          (8'ha4) : reg9) ?
                      $signed(wire4) : (+reg8)))));
              reg70 <= $signed(reg50);
            end
          reg71 <= ((((reg48[(1'h0):(1'h0)] <= wire23) & (^wire21)) & $signed((~&{reg68}))) ?
              (^~(~&wire3)) : $unsigned(reg48));
        end
      else
        begin
          reg63 <= wire1;
        end
      reg72 <= $signed((~^$signed(reg12)));
      reg73 <= reg42;
    end
  assign wire74 = (reg7 < reg37[(1'h1):(1'h1)]);
  assign wire75 = (^$unsigned((wire74[(3'h6):(3'h4)] ?
                      ($unsigned((8'ha4)) + (reg64 - (8'h9c))) : $signed((reg40 ?
                          reg13 : (8'hb8))))));
  always
    @(posedge clk) begin
      reg76 <= ($signed((|reg8[(2'h2):(1'h0)])) ?
          wire23 : ((~|$unsigned(wire41[(4'hf):(3'h4)])) ?
              $signed(reg72[(4'hd):(1'h1)]) : (8'ha3)));
      reg77 <= ($unsigned(wire41[(3'h6):(2'h2)]) ?
          ($unsigned(reg67) * reg14[(4'hc):(4'hb)]) : $unsigned(((7'h44) <<< (7'h42))));
      reg78 <= ((+$signed((reg42[(3'h7):(3'h4)] ?
          {(8'ha4)} : (reg19 << reg26)))) ~^ (reg31[(2'h2):(1'h1)] ^~ $unsigned(((~|wire24) >= reg65))));
      reg79 <= reg15;
      reg80 <= (&($signed($signed((8'hb9))) >= {reg28[(2'h2):(2'h2)],
          ($signed(reg13) ~^ (~^reg43))}));
    end
endmodule
