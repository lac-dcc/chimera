module top
#(parameter param43 = ((((((8'ha8) ? (8'hbf) : (8'hb3)) < (~^(8'ha4))) ? (~((8'ha8) ? (8'ha2) : (8'ha3))) : ((8'hbb) ? (&(8'hbe)) : (8'ha2))) ? {(~^(7'h40)), ((+(8'h9d)) ? ((8'h9f) ? (8'hb4) : (8'hbb)) : (~^(8'hab)))} : {(^~((8'ha1) - (8'hab)))}) ? {((^((8'h9f) || (8'ha2))) >= (^~((8'hbc) >>> (8'ha0)))), (((^(7'h43)) ? (-(8'hbc)) : ((8'h9f) > (7'h42))) ? (((8'hbb) >= (8'hba)) ? ((8'hae) ? (7'h43) : (8'ha5)) : {(8'ha2), (8'ha2)}) : ({(8'h9d), (7'h44)} ? (8'hbc) : ((8'ha0) ? (8'ha3) : (8'ha5))))} : ((+(((8'ha6) && (8'hac)) ? {(8'hbc)} : ((8'ha5) ? (8'hae) : (8'hb0)))) && (((&(8'ha8)) ? ((8'ha4) || (8'hb8)) : {(8'hb0), (8'hb1)}) | ((|(8'hbd)) ? (&(7'h40)) : ((8'haf) ? (8'ha4) : (8'haf)))))), 
parameter param44 = param43)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire23,
                 wire22,
                 wire21,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {wire1[(1'h1):(1'h0)],
                     $unsigned((((wire3 ? wire3 : (8'hac)) ?
                         wire0 : wire4) <= {(wire3 ? wire2 : wire1)}))};
  assign wire6 = ($signed($unsigned((&(+wire1)))) <= $signed((~|wire0[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg7 <= ($signed(wire3[(2'h2):(2'h2)]) & $unsigned(wire3[(4'ha):(1'h0)]));
      reg8 <= wire0[(2'h2):(1'h1)];
      if (wire4)
        begin
          reg9 <= $unsigned((8'h9f));
          if (($signed((~|wire2)) ? wire3[(3'h4):(2'h3)] : reg8))
            begin
              reg10 <= ({{reg7, ($unsigned((8'hb5)) != wire6[(4'hc):(4'hb)])}} ?
                  {($unsigned((~|wire2)) ?
                          (wire2[(2'h2):(1'h1)] ^ (~wire4)) : ($unsigned(wire1) <<< reg8[(3'h6):(3'h5)]))} : wire2);
            end
          else
            begin
              reg10 <= ($signed($unsigned(wire5)) * ($signed(((wire6 && reg8) ^ wire0)) || (($signed(wire1) ?
                  wire3 : $unsigned((8'hb1))) ^ (&(wire3 <<< (8'had))))));
              reg11 <= (+($signed(reg10[(2'h3):(2'h3)]) >>> (($signed(wire6) ~^ (~^wire5)) ^~ (~&(wire1 ?
                  reg10 : reg7)))));
              reg12 <= ($unsigned(({(-wire4), (~&reg9)} ?
                  wire3[(1'h0):(1'h0)] : ({reg8, reg9} ?
                      wire6[(4'hb):(2'h3)] : (wire2 >= reg11)))) >>> $signed((~($signed(wire2) < reg8[(4'hb):(4'h9)]))));
              reg13 <= wire3;
              reg14 <= ({($unsigned((~^wire1)) ?
                          reg7[(2'h3):(2'h3)] : ((!wire4) || (reg11 != reg10)))} ?
                  $signed((($unsigned(reg7) ?
                      $signed(reg11) : wire2[(3'h7):(3'h5)]) << $signed($signed(reg11)))) : ($signed({wire6[(4'h9):(2'h2)]}) ?
                      ($signed($signed(reg7)) & $unsigned({(8'h9d)})) : $signed(reg13)));
            end
          if (((!reg8[(3'h4):(3'h4)]) ?
              ($signed((~|wire0)) ?
                  $signed(($unsigned(wire2) == reg8)) : {(wire0 - $signed(reg13)),
                      ($signed(wire0) ?
                          $unsigned(reg8) : $unsigned(wire0))}) : ($unsigned($unsigned((+wire1))) + (wire4[(4'h9):(4'h9)] ?
                  $unsigned(wire1) : $signed((+wire5))))))
            begin
              reg15 <= $signed({$unsigned((+reg13)), wire5});
              reg16 <= wire2;
              reg17 <= $unsigned($signed(reg9[(2'h2):(2'h2)]));
              reg18 <= ($signed($unsigned((~&(+(8'ha7))))) ?
                  (~wire2[(4'hc):(4'h8)]) : ((|{(^~reg10),
                      (&(7'h44))}) >>> {reg12, reg13}));
              reg19 <= (((^~$unsigned($unsigned(reg10))) ?
                  $unsigned($signed(reg8[(2'h2):(1'h1)])) : (((reg17 ?
                      reg8 : wire5) && (wire6 ?
                      reg17 : wire5)) == $signed((!reg7)))) || (|(~|wire5[(1'h1):(1'h0)])));
            end
          else
            begin
              reg15 <= ((reg7[(5'h14):(5'h14)] ^~ $signed(((&wire2) ?
                  (^~reg12) : $signed(reg10)))) != (~$signed($signed($signed(wire4)))));
              reg16 <= reg10;
              reg17 <= $unsigned((8'ha1));
            end
        end
      else
        begin
          reg9 <= (wire0 ?
              wire3[(4'h9):(3'h7)] : ((((reg17 ? wire0 : reg12) ?
                      reg18[(4'ha):(1'h0)] : $signed(wire4)) || reg9[(3'h4):(2'h2)]) ?
                  reg16[(2'h2):(1'h0)] : $signed(((reg11 ? reg12 : wire6) ?
                      wire4[(3'h7):(1'h0)] : $signed(reg10)))));
          reg10 <= ((~^(((wire4 ? wire0 : (8'hba)) ?
              (reg18 ?
                  reg9 : reg8) : (reg16 == wire2)) > ($signed(wire6) != (&wire3)))) & ($signed($unsigned({wire2,
                  (8'haa)})) ?
              (reg13[(4'hc):(2'h3)] & (((7'h40) >> reg15) > wire2)) : wire2));
          reg11 <= (-reg19);
          reg12 <= reg15[(3'h6):(2'h2)];
          if ($signed($signed(reg18[(2'h3):(1'h0)])))
            begin
              reg13 <= ($signed(reg15[(3'h5):(2'h3)]) >> wire1[(3'h4):(2'h2)]);
              reg14 <= {(((~(~|wire1)) | ($unsigned(wire1) * (+wire6))) ?
                      ((reg15[(3'h4):(1'h1)] | $unsigned(reg7)) & $unsigned((&reg16))) : (^~(8'hbe))),
                  wire3[(2'h3):(1'h0)]};
              reg15 <= ($signed((~|(~&(wire1 == wire0)))) >= (reg12[(2'h3):(2'h3)] ^~ (^~$signed((8'hbf)))));
              reg16 <= (8'hbe);
              reg17 <= $unsigned((&(&reg14[(2'h3):(2'h2)])));
            end
          else
            begin
              reg13 <= $signed($signed(reg17));
            end
        end
      reg20 <= $unsigned($signed((-wire5)));
    end
  assign wire21 = $signed(reg18[(4'h8):(3'h6)]);
  assign wire22 = $unsigned((~&(~&($unsigned(reg12) << (reg13 | reg12)))));
  assign wire23 = $signed(((8'hbd) ?
                      $signed((+(reg19 ?
                          reg19 : (8'h9c)))) : reg15[(3'h7):(3'h7)]));
  always
    @(posedge clk) begin
      if (reg14)
        begin
          reg24 <= (~reg13[(4'hd):(3'h7)]);
          reg25 <= ((8'hb1) >= $unsigned({$signed((reg12 ? reg10 : reg11))}));
          if ((wire23[(1'h0):(1'h0)] ?
              $unsigned($unsigned(((~|wire21) | (reg14 ^~ reg20)))) : (!reg17[(3'h6):(1'h1)])))
            begin
              reg26 <= (reg20[(5'h12):(2'h2)] ?
                  reg16 : ({$signed((reg9 || reg18)),
                      $signed($unsigned(wire21))} >>> ((wire21[(3'h4):(2'h3)] ?
                          $signed((8'ha7)) : $signed(wire3)) ?
                      ($signed(reg15) ^ (wire5 ? reg14 : reg17)) : (-(reg14 ?
                          reg10 : wire0)))));
            end
          else
            begin
              reg26 <= ($signed($unsigned($signed(wire0))) < $signed(wire1[(5'h12):(3'h5)]));
              reg27 <= $unsigned(reg8);
            end
          reg28 <= $unsigned(((8'hba) & $unsigned(wire3)));
        end
      else
        begin
          reg24 <= ($signed(((reg18 >>> reg28) ?
              $unsigned(reg9[(4'h9):(4'h8)]) : (reg27[(3'h4):(2'h3)] > (8'hab)))) ^~ ((!((wire6 ?
                  wire2 : wire21) ?
              (8'ha8) : (+(7'h42)))) >= (^($unsigned(reg26) && (8'ha8)))));
        end
      reg29 <= (reg17 ?
          (reg27[(1'h1):(1'h1)] != {(-(|(8'hb6)))}) : $unsigned(((wire4[(1'h1):(1'h1)] >> $signed(reg9)) + reg14)));
    end
  always
    @(posedge clk) begin
      reg30 <= (~&$unsigned((((wire23 ?
              reg15 : (8'hba)) ^~ wire3[(3'h6):(2'h3)]) ?
          reg12[(4'ha):(4'ha)] : (reg14 && reg18[(4'h9):(4'h9)]))));
      reg31 <= (^((^(~&(reg10 ? reg25 : reg28))) ?
          (reg26[(5'h13):(4'hf)] ?
              $unsigned({reg16, wire3}) : ((8'hb0) ?
                  {wire2} : (reg14 ?
                      wire6 : wire1))) : (|$signed(reg14[(4'ha):(4'h9)]))));
      if ((wire3 + $unsigned(wire22[(2'h2):(1'h1)])))
        begin
          reg32 <= wire23[(1'h0):(1'h0)];
          reg33 <= {(^~(reg9[(3'h4):(1'h1)] || {wire21[(4'ha):(4'h9)]}))};
        end
      else
        begin
          reg32 <= (({$signed((~^reg10))} ?
              (reg25[(3'h7):(1'h0)] <= $unsigned({reg18})) : $signed((8'hab))) >> (~|reg8));
          reg33 <= ((~&$signed(wire3[(3'h7):(1'h0)])) ?
              wire4 : $signed(((~&reg29[(1'h0):(1'h0)]) >> ((reg10 ?
                  wire21 : reg18) & wire2))));
          reg34 <= ($unsigned($signed((^wire4[(3'h7):(2'h2)]))) & $signed(wire4));
          reg35 <= ($unsigned((({reg17} ?
                      (wire5 ? reg7 : reg29) : $unsigned(wire21)) ?
                  wire2[(3'h5):(3'h5)] : $signed($signed(reg17)))) ?
              (reg11[(1'h1):(1'h1)] >= (~{$signed(wire6),
                  reg7[(3'h4):(1'h1)]})) : $unsigned((~|reg34[(4'ha):(4'ha)])));
        end
      reg36 <= reg25;
      reg37 <= $unsigned($signed(wire6));
    end
  assign wire38 = reg15;
  assign wire39 = reg20;
  assign wire40 = reg10[(1'h0):(1'h0)];
  assign wire41 = $signed((+reg17));
  assign wire42 = ($signed(($unsigned(((8'ha5) ? reg19 : (8'hbf))) ?
                          (8'hb8) : {(reg16 ? wire5 : reg8),
                              ((7'h43) ? wire3 : reg17)})) ?
                      (8'hb7) : reg25);
endmodule
