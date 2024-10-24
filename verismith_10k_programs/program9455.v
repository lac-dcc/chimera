module top
#(parameter param49 = ((((((8'hb1) ? (8'hb5) : (8'hb4)) + (|(8'hbe))) ^ (((8'hab) || (8'hb9)) <<< (!(8'hb1)))) || {(((8'hbd) ? (8'ha2) : (7'h44)) >>> {(8'hbb)}), ((&(8'hb9)) ? (!(8'hb3)) : ((8'h9e) ? (8'hbe) : (8'hba)))}) ? ((|(((7'h44) != (8'hb1)) >= (-(8'hab)))) ? ((|((8'h9c) ? (8'hb3) : (8'hac))) ? ({(8'h9c), (8'hab)} ? {(8'hbf)} : ((8'haa) > (8'hb6))) : (((8'hbd) ? (8'hb4) : (8'hb3)) ^~ (!(8'hb2)))) : ({((8'haa) || (8'haf)), ((8'ha7) ? (7'h42) : (8'hb9))} ? (|(8'hb6)) : ((~&(8'hb9)) * (~|(8'ha8))))) : (~{((~&(8'hbf)) ? (&(8'ha7)) : ((8'ha3) ? (8'hb9) : (8'ha5)))})), 
parameter param50 = (param49 ? (~&param49) : (~((^(^param49)) != (~{param49, param49})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = (($unsigned(($signed(wire2) ? (-wire1) : (wire2 | (8'haa)))) ?
                     $unsigned(((&wire0) == (wire1 ?
                         (8'h9d) : (8'hbf)))) : (~((wire1 ? wire1 : wire3) ?
                         (-wire3) : $signed((7'h44))))) ^ $unsigned(wire0[(4'hd):(3'h5)]));
  assign wire5 = (($signed($signed($signed((8'hac)))) ?
                         ((~^(~|wire2)) >= ((wire0 == wire2) >>> $signed(wire2))) : $signed(($signed((8'hbf)) ?
                             (wire3 > wire4) : (wire1 ? (8'ha6) : wire4)))) ?
                     $unsigned($unsigned($unsigned($unsigned(wire0)))) : wire3);
  assign wire6 = wire3[(4'hc):(4'h8)];
  assign wire7 = ($signed(wire4[(2'h2):(2'h2)]) ?
                     $unsigned(($unsigned($unsigned((8'hb9))) ?
                         (8'hbe) : $signed($unsigned(wire5)))) : wire6[(3'h4):(2'h2)]);
  assign wire8 = wire7[(4'hd):(1'h0)];
  assign wire9 = $signed((wire6[(4'hd):(4'hc)] && wire3[(4'hd):(1'h1)]));
  assign wire10 = ($unsigned(wire0) | (wire9[(2'h2):(1'h0)] << wire7));
  assign wire11 = (wire10[(1'h0):(1'h0)] ?
                      {wire0, {$signed($signed(wire4))}} : wire4);
  always
    @(posedge clk) begin
      if ($signed($signed(($unsigned((~|wire2)) << (^{wire0, wire9})))))
        begin
          reg12 <= (($unsigned($unsigned((-wire1))) ?
              $unsigned((-$signed(wire11))) : (~wire11)) >= $unsigned((|$signed($signed(wire1)))));
          reg13 <= (($unsigned(((^wire0) ?
                  (wire7 ? (8'hae) : wire0) : (wire0 * wire11))) ?
              wire8[(1'h1):(1'h1)] : {$signed(wire7),
                  (~&wire9)}) ~^ ($signed(wire8[(1'h0):(1'h0)]) ?
              wire4[(3'h6):(2'h2)] : wire7));
          reg14 <= wire8;
        end
      else
        begin
          if ({{$signed(wire6[(4'h9):(2'h2)])}})
            begin
              reg12 <= $signed(wire4[(3'h6):(1'h0)]);
              reg13 <= $unsigned($unsigned((!$signed(wire11))));
            end
          else
            begin
              reg12 <= $unsigned($signed({(wire3 - (wire10 <= wire2))}));
              reg13 <= (~|$signed((^(!$signed(wire1)))));
            end
        end
      reg15 <= wire3;
    end
  assign wire16 = {(wire5[(2'h2):(2'h2)] ?
                          {($signed(wire9) ^ (reg14 - wire7))} : reg12)};
  assign wire17 = ({(8'hba), wire7[(4'h9):(2'h2)]} >= wire5[(4'hc):(4'ha)]);
  assign wire18 = (($unsigned(wire1[(1'h0):(1'h0)]) ~^ (~{(wire0 ?
                              (8'ha8) : wire7)})) ?
                      (|(reg15[(1'h1):(1'h0)] < (&wire4))) : {wire10[(2'h2):(1'h1)],
                          (~&$unsigned(wire1))});
  assign wire19 = {wire2};
  assign wire20 = wire2;
  assign wire21 = wire17[(4'h8):(1'h0)];
  assign wire22 = $unsigned((8'hb4));
  assign wire23 = wire6;
  assign wire24 = (((8'h9f) ?
                      {$signed((wire21 ? (8'hae) : reg12))} : (((reg12 ?
                                  (7'h44) : wire9) ?
                              (wire18 >= wire5) : wire23[(4'he):(4'hc)]) ?
                          wire11[(2'h2):(2'h2)] : (|$unsigned(wire2)))) >> reg13[(4'hc):(4'hc)]);
  always
    @(posedge clk) begin
      reg25 <= wire8;
      if (wire5)
        begin
          if (wire4[(2'h3):(2'h2)])
            begin
              reg26 <= wire19[(3'h4):(1'h0)];
              reg27 <= reg15;
            end
          else
            begin
              reg26 <= (8'ha6);
            end
          reg28 <= (7'h41);
          reg29 <= {(($signed($signed(wire7)) && $signed(reg26[(2'h3):(1'h1)])) <<< ({(~^reg14)} & wire8))};
        end
      else
        begin
          if ({(wire18 ?
                  {$signed((reg12 ? (8'hb9) : wire3)),
                      {$signed(wire19), (~|(8'hba))}} : wire16[(4'hc):(4'ha)]),
              (-($signed({wire4}) & (reg29[(1'h1):(1'h1)] ?
                  $unsigned(reg29) : (wire6 ^ wire2))))})
            begin
              reg26 <= (~|(^{($unsigned(reg26) ?
                      $unsigned((7'h41)) : $unsigned(wire17))}));
              reg27 <= reg26[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= reg29;
              reg27 <= (^~$signed((~&(8'hbf))));
              reg28 <= $signed(reg13);
              reg29 <= (!$signed((^~reg28[(3'h4):(3'h4)])));
              reg30 <= wire18;
            end
          reg31 <= $unsigned(((8'hb5) ?
              {{$signed(wire18), $unsigned(wire0)},
                  wire22[(2'h2):(2'h2)]} : (((wire7 <<< wire10) ?
                  (wire8 ?
                      wire0 : wire19) : $signed(reg28)) ~^ $unsigned($signed(wire10)))));
        end
    end
  always
    @(posedge clk) begin
      reg32 <= reg25;
    end
  always
    @(posedge clk) begin
      reg33 <= (($unsigned($unsigned((wire8 == wire11))) <= $signed($signed(((8'ha7) <= reg28)))) ?
          wire18 : (wire11 ?
              reg30[(3'h4):(3'h4)] : $signed(($unsigned(reg15) && {wire20,
                  (8'had)}))));
      if ($signed(wire4[(3'h4):(1'h0)]))
        begin
          reg34 <= wire17[(4'h8):(3'h4)];
          reg35 <= reg14[(1'h0):(1'h0)];
        end
      else
        begin
          reg34 <= $unsigned(((~|(wire19 ?
                  reg26[(2'h3):(2'h3)] : $unsigned(wire9))) ?
              $signed(((wire1 - reg29) >= $unsigned(wire22))) : wire6));
          reg35 <= wire19;
        end
    end
  always
    @(posedge clk) begin
      reg36 <= ((8'h9c) < $unsigned({wire3[(2'h3):(2'h3)],
          ($unsigned(wire11) & $unsigned((7'h43)))}));
      if (($signed((~&wire7[(2'h3):(1'h1)])) ?
          {{wire1}, (~^{(-(8'h9e))})} : $signed(({{wire22, (8'h9d)},
                  (+wire18)} ?
              $signed({reg14, reg12}) : ((reg12 ?
                  wire19 : reg31) < $signed(wire22))))))
        begin
          if (($unsigned((&reg32[(1'h0):(1'h0)])) ?
              $unsigned((wire20 * wire17[(1'h0):(1'h0)])) : (reg27 ?
                  (^~$unsigned(((8'hb0) ?
                      wire2 : wire0))) : (!(wire9[(2'h2):(1'h0)] ?
                      wire4 : ((8'h9c) == wire6))))))
            begin
              reg37 <= $signed((^$unsigned(((reg12 ?
                  (8'ha2) : wire16) ^~ {reg32, wire6}))));
              reg38 <= $unsigned((reg35[(2'h2):(1'h1)] ?
                  (reg26[(1'h0):(1'h0)] ?
                      wire21 : (wire9[(1'h0):(1'h0)] ?
                          (wire17 == (7'h42)) : wire16[(3'h7):(3'h5)])) : (($unsigned(reg13) ?
                      {reg26} : (~reg27)) * ((-(8'hb1)) >>> (reg28 || wire17)))));
              reg39 <= ((8'haf) ?
                  {$unsigned((-$unsigned(reg13))),
                      wire23[(2'h2):(1'h0)]} : {(reg36 && reg33[(3'h4):(1'h0)])});
            end
          else
            begin
              reg37 <= ($unsigned((8'hbc)) ?
                  {(&(+(!wire24)))} : $signed(wire0[(3'h5):(1'h0)]));
              reg38 <= reg33[(3'h5):(3'h5)];
              reg39 <= (~&($signed(reg38[(3'h4):(1'h1)]) ? wire8 : reg38));
              reg40 <= (($signed({$unsigned((8'haa))}) != (wire2 ?
                  {$unsigned(reg32)} : (^~$unsigned(reg15)))) >> ((wire22 != wire3) & reg28));
            end
          reg41 <= $signed(reg27[(3'h4):(2'h2)]);
        end
      else
        begin
          reg37 <= (~^(wire20 ?
              $signed((&$signed(reg28))) : {wire1, (-(-(8'hb2)))}));
          reg38 <= $signed(reg15);
        end
      if (({{reg25, (wire22[(1'h0):(1'h0)] == $unsigned(reg35))},
          $signed(((&reg31) ?
              wire3[(4'hb):(4'hb)] : reg38[(3'h6):(2'h2)]))} < $unsigned(wire10)))
        begin
          if (reg33[(3'h7):(1'h1)])
            begin
              reg42 <= reg28;
              reg43 <= ({reg28} ?
                  (((wire24 << (&(7'h40))) < $signed($signed(wire9))) + $unsigned($unsigned({wire10}))) : reg39[(3'h4):(1'h1)]);
              reg44 <= reg33;
            end
          else
            begin
              reg42 <= $unsigned($signed(reg37));
              reg43 <= (8'h9f);
              reg44 <= reg35[(2'h2):(1'h0)];
              reg45 <= ({($signed($signed(reg14)) & (((8'hab) ? reg43 : wire6) ?
                          reg40[(3'h6):(1'h1)] : wire23))} ?
                  {reg32[(1'h0):(1'h0)],
                      {{wire6,
                              (|reg44)}}} : $unsigned((($unsigned(reg32) || reg33) | $unsigned((wire22 ?
                      reg35 : wire19)))));
            end
        end
      else
        begin
          if (($unsigned(reg44) >> ((reg32 <= $unsigned($unsigned(wire18))) ?
              $signed(($unsigned(reg12) & (wire5 || (8'ha6)))) : (~|(+(~&reg45))))))
            begin
              reg42 <= (wire4 - $unsigned({(|((8'hb9) != reg41)),
                  $unsigned(reg27[(1'h0):(1'h0)])}));
              reg43 <= reg42;
            end
          else
            begin
              reg42 <= (reg32 <= (~|$unsigned(reg28[(2'h2):(2'h2)])));
              reg43 <= ((8'ha3) ?
                  $unsigned((reg25 << $signed((8'hb7)))) : (wire16[(3'h4):(2'h2)] ?
                      $signed(($signed(wire5) && (reg31 ?
                          (8'hb9) : wire23))) : reg41[(1'h0):(1'h0)]));
              reg44 <= ($signed((7'h40)) == wire23);
              reg45 <= ((+(($signed(reg36) + wire18[(4'h8):(4'h8)]) == (+(-wire20)))) & reg42[(1'h0):(1'h0)]);
              reg46 <= $signed($signed((~((^reg40) <= (~|wire16)))));
            end
          reg47 <= $unsigned(((~{(^~reg13)}) ? (8'hae) : (8'ha1)));
        end
      reg48 <= ($unsigned(reg25) ?
          $unsigned($unsigned((reg39 >= (wire10 <= reg14)))) : ((-wire5[(3'h5):(1'h1)]) > ((-(~|reg15)) < reg45[(2'h3):(1'h0)])));
    end
endmodule
