module top
#(parameter param67 = (((+({(8'hb2), (8'hb0)} & ((8'hbc) && (8'ha8)))) + (&(+(~&(8'h9d))))) ? (8'ha8) : ((((^(8'hbb)) ? ((8'ha1) ^ (8'hb1)) : {(8'had)}) ? (-{(8'h9f), (8'h9e)}) : ((8'hb4) ? ((8'hab) ? (8'hac) : (8'hbc)) : ((8'hbb) ? (8'hb3) : (8'haa)))) ? ((((8'hac) ^ (8'hb3)) ? {(8'hb3)} : {(8'ha8)}) ? (+((7'h41) ? (8'ha5) : (8'hb1))) : (~&(|(8'ha0)))) : {(((7'h40) + (8'hb5)) ? ((8'haf) ? (8'had) : (8'hb9)) : ((8'hb3) ? (8'hba) : (8'hbe)))})), 
parameter param68 = ((^(((param67 * param67) ? param67 : {param67}) ? param67 : (param67 ? (!param67) : ((7'h42) ? param67 : param67)))) | {param67}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire63,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire7,
                 wire6,
                 reg30,
                 reg29,
                 reg28,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(($unsigned(((~|(7'h44)) != (^wire2))) ?
          wire1[(2'h3):(2'h3)] : (wire4 ?
              ($signed((8'ha2)) ?
                  wire1[(1'h1):(1'h0)] : (^~wire4)) : $signed(wire3))));
    end
  assign wire6 = (((((|(8'h9d)) >= wire0[(4'h8):(4'h8)]) ?
                             (^~$signed(wire2)) : $signed(wire3[(3'h5):(3'h4)])) ?
                         wire1[(4'hc):(1'h1)] : (-((wire0 ?
                             reg5 : wire3) >>> wire1[(4'he):(4'hc)]))) ?
                     (((+((7'h44) << wire4)) || wire3[(1'h1):(1'h1)]) | reg5[(1'h1):(1'h1)]) : {wire1,
                         wire3});
  assign wire7 = $unsigned(($unsigned(wire6[(4'hb):(4'hb)]) ?
                     (((wire4 >>> (8'hac)) ?
                         wire1[(4'hc):(1'h1)] : $signed(wire3)) & $unsigned($unsigned(wire4))) : ({(wire0 * wire3),
                         (|wire1)} == ($signed(wire2) >= ((8'hbb) && wire2)))));
  always
    @(posedge clk) begin
      reg8 <= (~&wire6);
      reg9 <= wire6[(4'ha):(4'h8)];
      if (wire1)
        begin
          reg10 <= (~&reg8);
          reg11 <= (reg8[(4'h8):(3'h4)] ?
              reg9[(2'h3):(2'h2)] : ({($unsigned(wire0) <<< $unsigned(wire2))} || {((wire2 ?
                          wire0 : (8'hbb)) ?
                      wire1[(1'h0):(1'h0)] : (wire1 ? wire6 : (8'hbb))),
                  wire7[(4'hb):(1'h0)]}));
        end
      else
        begin
          if ((8'hb3))
            begin
              reg10 <= $unsigned($unsigned(reg9[(1'h0):(1'h0)]));
              reg11 <= reg9;
              reg12 <= ($signed(reg10[(3'h5):(3'h4)]) ?
                  reg5[(1'h0):(1'h0)] : $signed(($signed((wire2 ?
                          reg11 : wire0)) ?
                      ((wire3 > reg11) ? wire2 : $unsigned(wire4)) : wire3)));
              reg13 <= $unsigned({wire6,
                  {(reg5 ? (reg9 >= reg9) : wire1),
                      (wire7 ? (reg11 * wire6) : {reg5})}});
            end
          else
            begin
              reg10 <= ($unsigned($unsigned($signed((8'hb1)))) ?
                  (|reg13) : $unsigned($unsigned(((reg5 ? reg8 : wire3) ?
                      {wire2, reg9} : (reg5 <= reg8)))));
              reg11 <= $unsigned((reg11 <<< reg5[(1'h0):(1'h0)]));
            end
        end
      if (($signed(reg9) ?
          $signed($unsigned($unsigned(reg12[(2'h2):(2'h2)]))) : wire0))
        begin
          if (($signed((+$signed($signed(wire2)))) ?
              ((~&((wire7 ? reg5 : reg8) + (wire7 ? reg8 : wire0))) ?
                  ((reg8 ? (~|wire6) : (reg8 ? (8'ha5) : wire4)) ?
                      reg10[(3'h4):(1'h0)] : ((wire1 ?
                          wire6 : reg12) & $unsigned((8'hb5)))) : $signed((+wire2))) : (+(&(~$signed(wire0))))))
            begin
              reg14 <= $unsigned($unsigned(reg13));
              reg15 <= $signed(wire6);
              reg16 <= (~|(!({reg11[(2'h3):(2'h3)]} ?
                  $signed(((8'ha0) << reg5)) : (8'had))));
              reg17 <= $unsigned($unsigned((~($signed((7'h44)) ?
                  reg16 : {wire7}))));
              reg18 <= ((^{(+$unsigned((8'ha5))), (wire7 <= (^reg13))}) ?
                  wire1[(4'hd):(4'hd)] : $signed($unsigned((reg5 ?
                      $signed(wire1) : reg9))));
            end
          else
            begin
              reg14 <= wire0[(3'h6):(3'h5)];
              reg15 <= (wire4 ?
                  ({(^$signed(reg16)),
                      $signed(wire3[(3'h5):(2'h3)])} << wire7[(3'h6):(3'h5)]) : $unsigned((reg17 ?
                      (wire3 ~^ reg14[(4'hf):(3'h7)]) : $unsigned((~reg9)))));
              reg16 <= (8'haa);
              reg17 <= (wire7[(3'h4):(2'h2)] >= $signed(($signed($signed(reg16)) ?
                  wire4[(4'hd):(4'h8)] : $signed($unsigned(wire1)))));
              reg18 <= {(((^wire3) | (&(~(8'h9f)))) ?
                      ((reg15 < $unsigned(reg9)) != $unsigned((~wire2))) : reg16),
                  (($signed(reg17[(5'h12):(5'h12)]) >= $signed(reg8)) ^~ reg13)};
            end
          if ({wire7[(4'h9):(4'h9)], $unsigned($signed(reg14))})
            begin
              reg19 <= (~wire6);
              reg20 <= wire6[(2'h3):(1'h0)];
              reg21 <= ($signed(({$unsigned(wire7)} ?
                  $unsigned((wire0 - (8'h9d))) : $unsigned($unsigned(reg15)))) != {$signed((wire2 ?
                      (&(8'hb8)) : (reg17 ? (7'h40) : wire0))),
                  $unsigned(($signed(reg5) | wire1[(5'h10):(3'h7)]))});
            end
          else
            begin
              reg19 <= wire6;
              reg20 <= (~|(+(+$unsigned($unsigned(reg17)))));
              reg21 <= ($signed(({$signed(reg21)} | reg20[(3'h4):(1'h1)])) ?
                  $signed(reg8) : reg14[(4'he):(2'h3)]);
              reg22 <= reg18;
            end
        end
      else
        begin
          if ((~reg10[(5'h13):(4'hd)]))
            begin
              reg14 <= reg8[(2'h3):(1'h0)];
            end
          else
            begin
              reg14 <= reg17[(5'h13):(1'h0)];
              reg15 <= $signed(wire4);
            end
          reg16 <= $signed($signed((((reg11 ? reg5 : reg11) ^~ (~&reg16)) ?
              $unsigned(((7'h41) >> reg21)) : $signed($signed((8'ha2))))));
          if ((($signed($signed($unsigned((8'ha6)))) * wire2[(4'hf):(4'hb)]) && reg22))
            begin
              reg17 <= reg21[(3'h6):(3'h4)];
              reg18 <= (~&{{$signed($unsigned(reg12)),
                      ($signed(wire6) ? reg16 : (reg18 ? reg16 : wire2))}});
              reg19 <= $signed(wire7);
              reg20 <= $unsigned(((^~(reg18 ?
                  (reg8 ?
                      (8'ha6) : reg19) : wire7[(2'h3):(2'h3)])) << ((~&{reg10,
                  reg13}) <<< reg11)));
            end
          else
            begin
              reg17 <= reg21[(4'hd):(3'h6)];
              reg18 <= ($unsigned($signed(reg11)) ? $unsigned(reg18) : reg21);
              reg19 <= ($signed((((~^reg20) | reg18) < wire7)) + reg9[(1'h0):(1'h0)]);
              reg20 <= (~&reg8[(2'h2):(1'h0)]);
            end
          reg21 <= $signed(((((~^reg20) >> {reg10, reg5}) ?
                  (!(wire6 ?
                      reg16 : wire7)) : ($signed(reg18) || reg21[(1'h1):(1'h1)])) ?
              ($signed((reg19 ~^ wire1)) <= ({reg18} ?
                  wire6[(3'h7):(3'h6)] : {wire2,
                      (8'hb5)})) : $signed(reg17[(5'h11):(4'hc)])));
        end
      if (((reg20 & $signed($signed(reg20))) ?
          $signed($unsigned((8'h9f))) : $unsigned((~|$signed($signed(reg19))))))
        begin
          reg23 <= (reg17[(5'h13):(5'h10)] << (reg14[(4'ha):(2'h2)] ?
              ($signed((reg14 & wire3)) + $unsigned({reg15,
                  reg13})) : ($unsigned(wire0[(3'h4):(1'h1)]) > (((8'hab) * reg8) ?
                  reg14 : reg14[(1'h0):(1'h0)]))));
          reg24 <= reg11[(4'hf):(4'hc)];
          reg25 <= $unsigned(reg5);
          reg26 <= reg18[(4'ha):(4'h8)];
        end
      else
        begin
          reg23 <= {(reg8[(1'h0):(1'h0)] ? reg25[(2'h3):(1'h1)] : reg25),
              {(!wire6[(3'h6):(3'h4)])}};
          if ($unsigned(((!{{wire1}}) ?
              reg10[(4'h8):(3'h6)] : $unsigned(($unsigned(wire1) ?
                  reg23 : $signed(wire2))))))
            begin
              reg24 <= wire7[(4'h8):(2'h3)];
              reg25 <= (8'hac);
            end
          else
            begin
              reg24 <= ($unsigned(reg14[(5'h11):(5'h10)]) <= reg12);
              reg25 <= (((wire6[(3'h5):(1'h0)] ?
                      (!$signed(wire1)) : (reg17[(3'h7):(2'h3)] <= (wire0 ?
                          wire4 : reg19))) <= $unsigned($unsigned(reg14))) ?
                  (^~reg13[(3'h6):(3'h5)]) : (($signed(wire6[(2'h2):(1'h0)]) ?
                      $signed((+wire7)) : reg15) & ($signed({wire6,
                      wire4}) >>> ((reg8 == reg9) ~^ reg22[(4'h9):(1'h1)]))));
            end
          reg26 <= (^wire2);
          if (($signed(reg9[(1'h1):(1'h1)]) ?
              {$signed(wire3)} : ($unsigned((^~(wire3 ? (8'hb4) : wire3))) ?
                  $signed($unsigned(reg13)) : ({(8'ha1),
                      reg19[(1'h0):(1'h0)]} && $unsigned($signed((8'hae)))))))
            begin
              reg27 <= reg12;
            end
          else
            begin
              reg27 <= reg22;
              reg28 <= $unsigned(reg9);
              reg29 <= {wire6,
                  ($signed(reg8) >= $signed(($unsigned(reg24) >> (&reg20))))};
            end
          reg30 <= {$unsigned($unsigned(wire0[(3'h6):(3'h5)])),
              $unsigned($unsigned((reg21 ? reg9[(1'h0):(1'h0)] : wire7)))};
        end
    end
  assign wire31 = reg10;
  assign wire32 = $unsigned(wire2[(3'h4):(2'h3)]);
  assign wire33 = (reg29[(4'hb):(4'h9)] && $signed($unsigned(wire0)));
  assign wire34 = {$unsigned((reg29[(4'h9):(1'h0)] ?
                          {$unsigned((7'h41))} : {(^~reg18)})),
                      (8'hbc)};
  assign wire35 = $signed((((wire33[(3'h7):(1'h1)] || (~reg18)) * (^$unsigned((8'hb3)))) ?
                      $unsigned(reg19) : (reg14 ?
                          reg5 : reg19[(3'h4):(1'h1)])));
  assign wire36 = $unsigned($unsigned(wire34[(4'ha):(4'h9)]));
  module37 #() modinst64 (wire63, clk, reg24, wire31, reg28, wire3);
  assign wire65 = {(+({(reg23 ? reg26 : wire63)} <<< (-(&wire0)))),
                      (wire3 | (^~({reg17} ?
                          reg5[(2'h2):(1'h0)] : (reg29 ? (8'haa) : reg29))))};
  assign wire66 = ({reg30,
                          (($unsigned(reg30) ^ wire6[(2'h3):(1'h1)]) ^~ ((reg16 ?
                                  wire3 : reg10) ?
                              $unsigned(reg8) : $signed(wire31)))} ?
                      $signed(((|(wire0 << reg29)) > (8'hbf))) : wire3);
endmodule

module module37  (y, clk, wire38, wire39, wire40, wire41);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire60;
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  assign y = {wire42, wire60, reg62, reg43, (1'h0)};
  assign wire42 = (wire41[(4'hc):(4'hb)] ?
                      (wire41 + $signed((wire40 <<< (|wire38)))) : wire41);
  always
    @(posedge clk) begin
      reg43 <= wire41;
    end
  module44 #() modinst61 (wire60, clk, reg43, wire42, wire38, wire41);
  always
    @(posedge clk) begin
      reg62 <= (~(~&($signed((wire60 << reg43)) ? wire60 : (&(8'hb2)))));
    end
endmodule

module module44
#(parameter param58 = (((~|(8'hb2)) == ((((8'haf) >> (7'h42)) ? ((7'h41) ? (8'hac) : (8'h9f)) : (8'hbd)) ? (((8'ha0) ? (8'hb8) : (8'ha8)) ? ((8'ha9) ? (8'h9e) : (8'haf)) : ((8'hb7) ? (8'haf) : (8'ha1))) : {((8'hbd) && (8'hb0))})) >> (~((((8'hba) ? (7'h41) : (8'hb2)) ? ((7'h42) ? (8'h9e) : (8'ha0)) : (8'had)) && (((8'h9c) == (8'hb9)) ? (~|(8'h9f)) : ((8'ha3) ? (7'h40) : (8'h9f)))))), 
parameter param59 = (8'h9f))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire48;
  input wire [(3'h4):(1'h0)] wire47;
  input wire signed [(3'h4):(1'h0)] wire46;
  input wire signed [(3'h5):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg50,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= wire45;
      reg50 <= wire47[(3'h4):(2'h3)];
    end
  assign wire51 = $signed((wire47[(1'h0):(1'h0)] ?
                      (!wire45) : wire47[(1'h0):(1'h0)]));
  assign wire52 = wire46[(2'h2):(1'h0)];
  assign wire53 = $signed((|wire52));
  assign wire54 = {$unsigned($signed($unsigned(wire51[(4'h8):(2'h2)]))),
                      (~|(^(wire47 ~^ wire51[(3'h4):(2'h3)])))};
  assign wire55 = (-(^~(((~wire45) ? {wire48, wire47} : (wire52 != wire53)) ?
                      wire54[(3'h6):(1'h0)] : reg49)));
  assign wire56 = (8'h9e);
  assign wire57 = wire56;
endmodule
