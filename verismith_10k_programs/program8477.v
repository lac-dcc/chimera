module top
#(parameter param36 = (!(!(-((!(8'hbf)) + ((8'hbf) ? (8'hba) : (8'hba)))))), 
parameter param37 = param36)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg31,
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
                 (1'h0)};
  assign wire4 = {((wire0 ? $unsigned(wire2) : $unsigned($signed(wire1))) ?
                         $unsigned((wire3 >> (-wire0))) : {(wire0[(4'h9):(1'h0)] ?
                                 wire2 : wire2[(3'h7):(3'h6)])}),
                     ((&(~^$signed(wire0))) ?
                         (((wire3 & wire1) ~^ (8'ha4)) ^~ ((wire1 ?
                             wire2 : wire3) <<< (wire1 ?
                             wire3 : wire3))) : wire3[(3'h4):(2'h3)])};
  assign wire5 = $unsigned(wire1[(3'h4):(3'h4)]);
  assign wire6 = ($signed((wire5 | {(wire0 || wire4)})) ?
                     $signed(wire2) : ((!((wire2 ?
                             wire3 : wire1) + $signed(wire5))) ?
                         {(&wire5[(2'h3):(1'h0)])} : $signed(wire2)));
  assign wire7 = (~|wire6);
  assign wire8 = ((wire2 ?
                         {(wire5[(3'h5):(2'h2)] ? wire0 : (wire1 - wire3)),
                             (wire4[(3'h4):(1'h0)] ?
                                 (~&wire7) : (8'ha2))} : (-$unsigned($signed(wire4)))) ?
                     (~^wire0[(3'h7):(3'h6)]) : wire4);
  always
    @(posedge clk) begin
      reg9 <= (^~(^{wire3,
          ($unsigned((8'h9f)) ? $unsigned(wire1) : $unsigned(wire2))}));
      if (wire6)
        begin
          if ((-wire0))
            begin
              reg10 <= wire6;
              reg11 <= {wire2[(4'ha):(3'h6)],
                  ((reg10[(1'h1):(1'h0)] ?
                      {(wire7 | wire6)} : wire4) < (8'hb9))};
              reg12 <= {(~wire1[(1'h0):(1'h0)])};
            end
          else
            begin
              reg10 <= ({wire5} == (((+$unsigned(reg9)) > reg11[(1'h0):(1'h0)]) > ($signed($unsigned(reg10)) < $signed($signed(wire5)))));
              reg11 <= (wire4[(1'h1):(1'h1)] ?
                  ((wire1[(3'h5):(3'h4)] ?
                      $signed($signed(wire2)) : $unsigned((wire4 ?
                          reg12 : wire2))) <= (~(~^$unsigned(wire8)))) : ((-{$unsigned(reg11),
                          {reg11}}) ?
                      (^~$signed((~|wire4))) : (~^$unsigned($signed(wire3)))));
              reg12 <= reg10[(1'h1):(1'h0)];
              reg13 <= $unsigned({reg10[(4'h9):(3'h5)],
                  ((^((8'hb8) ? wire2 : reg10)) ?
                      (~|(&reg10)) : ((wire1 <<< wire6) <<< (~^wire4)))});
            end
          reg14 <= (reg12 ?
              (&$unsigned($signed($signed(reg10)))) : wire7[(5'h13):(4'h8)]);
        end
      else
        begin
          if (wire4)
            begin
              reg10 <= (~$signed($unsigned(wire4[(1'h0):(1'h0)])));
            end
          else
            begin
              reg10 <= wire3[(3'h5):(3'h4)];
              reg11 <= reg13;
              reg12 <= ((8'ha6) >> (wire3[(1'h1):(1'h1)] & reg12));
              reg13 <= ($unsigned({(|wire2), reg13[(2'h3):(1'h0)]}) ?
                  (wire8[(4'hd):(1'h1)] ?
                      $signed($signed($unsigned(reg9))) : reg13[(3'h4):(3'h4)]) : {(+$signed({wire5}))});
              reg14 <= $unsigned($signed(((&wire1[(2'h3):(1'h0)]) && ((~|(8'hbe)) ^~ (|wire3)))));
            end
          if ((8'haf))
            begin
              reg15 <= wire0[(4'hd):(4'hc)];
              reg16 <= reg13[(1'h1):(1'h1)];
            end
          else
            begin
              reg15 <= wire4[(2'h3):(2'h3)];
              reg16 <= ((wire5 | wire0) ?
                  $unsigned(($unsigned((wire2 ?
                      wire0 : wire5)) < (8'hab))) : (({wire2,
                      (reg10 & wire0)} <= (~&(+reg10))) || ($unsigned(((8'hb9) ?
                      reg10 : reg16)) ^~ $signed((~(8'h9e))))));
            end
          reg17 <= wire7[(5'h10):(2'h3)];
          reg18 <= (wire5 == wire4);
          if ((~^((wire3[(3'h5):(3'h4)] ?
              {$unsigned((7'h44))} : (reg13[(2'h2):(2'h2)] ?
                  $signed((8'h9c)) : $unsigned((8'hae)))) << (((^~wire6) << $signed(wire0)) | wire3[(1'h1):(1'h0)]))))
            begin
              reg19 <= (8'ha5);
              reg20 <= $unsigned($signed((($unsigned(wire4) ?
                      ((8'hb4) ? wire1 : wire6) : reg15) ?
                  $signed($signed(reg11)) : (~^$unsigned(reg13)))));
              reg21 <= ($unsigned({$signed((~^(8'hb9)))}) ?
                  (reg11[(2'h2):(2'h2)] ?
                      wire7[(4'he):(3'h7)] : $signed({{wire3,
                              wire5}})) : ($signed(reg12) | $unsigned((^reg19))));
              reg22 <= (~&($signed(reg18[(4'hf):(4'ha)]) ?
                  (((wire7 | wire0) ~^ (reg9 != reg16)) | (^~(reg19 * reg21))) : $signed(($signed(reg12) > (~^wire1)))));
              reg23 <= $signed($unsigned({($signed(wire4) && wire3[(2'h2):(2'h2)]),
                  ((~&reg16) || reg9[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg19 <= (~|(wire2 << (($signed(reg17) ~^ $signed(reg19)) | reg21[(1'h0):(1'h0)])));
              reg20 <= $signed($signed((8'h9f)));
            end
        end
    end
  always
    @(posedge clk) begin
      if (((wire3[(2'h2):(1'h1)] & {reg15[(2'h2):(2'h2)]}) >>> {reg22,
          $signed(({wire7, reg10} ? wire5[(3'h6):(3'h5)] : (~|wire0)))}))
        begin
          if (reg16)
            begin
              reg24 <= reg15;
            end
          else
            begin
              reg24 <= wire2;
              reg25 <= $unsigned(reg18);
              reg26 <= {$signed(((!(reg20 ? (8'hab) : wire4)) ?
                      ((~&reg19) << ((7'h40) ?
                          (8'ha4) : reg17)) : (wire5[(3'h7):(1'h0)] >= (reg21 != reg25))))};
              reg27 <= (^(wire0[(4'he):(4'he)] ?
                  wire8[(3'h7):(2'h3)] : ((7'h43) & (~|((8'hb4) ?
                      reg13 : wire3)))));
            end
          reg28 <= $signed($signed(wire1[(3'h6):(2'h3)]));
        end
      else
        begin
          reg24 <= $unsigned((wire8[(4'hd):(3'h5)] && (reg19[(4'h8):(3'h7)] ?
              $unsigned((wire7 << wire7)) : ($signed(reg15) * ((8'hb5) ?
                  reg9 : reg20)))));
          reg25 <= ($signed($signed(((reg19 >>> reg10) ?
              $signed(wire5) : wire3))) <= $unsigned($signed(wire3[(3'h4):(3'h4)])));
          if ($signed(wire0))
            begin
              reg26 <= (^((($unsigned(reg27) ?
                  (-reg12) : $signed(reg18)) <<< (|wire7)) | $unsigned({$unsigned(reg13)})));
            end
          else
            begin
              reg26 <= ((|$signed((((8'haa) ? reg17 : wire3) << (~^reg11)))) ?
                  reg26 : reg12[(3'h5):(2'h2)]);
              reg27 <= reg18;
            end
          reg28 <= $signed((~(8'ha5)));
        end
      reg29 <= $signed((($unsigned((wire4 ? reg19 : reg9)) ?
              $unsigned((wire8 ? wire4 : wire3)) : reg12[(4'h8):(4'h8)]) ?
          ((wire7 ? $unsigned((7'h43)) : $unsigned((7'h42))) ?
              wire7[(4'hf):(3'h5)] : (wire5[(1'h1):(1'h0)] ?
                  reg11 : (~|(7'h43)))) : $unsigned(wire5[(3'h6):(1'h0)])));
      reg30 <= (|{(+reg13[(1'h0):(1'h0)]), (^~reg27)});
      reg31 <= $unsigned(reg10);
    end
  assign wire32 = $signed((~^(|{reg17})));
  assign wire33 = wire6[(1'h0):(1'h0)];
  assign wire34 = (~|(~reg13[(1'h1):(1'h0)]));
  assign wire35 = (~wire33[(1'h0):(1'h0)]);
endmodule
