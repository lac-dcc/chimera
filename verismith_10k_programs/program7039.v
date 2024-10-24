module top
#(parameter param53 = {(&((~((8'hba) ? (8'ha0) : (8'h9e))) || (~|((8'hbf) > (7'h41)))))}, 
parameter param54 = param53)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire52,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire24,
                 wire23,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire1[(5'h10):(1'h1)];
    end
  assign wire6 = ((($unsigned((wire1 ?
                     wire4 : wire2)) > wire0[(3'h7):(2'h2)]) * wire0[(1'h0):(1'h0)]) && ((wire4[(3'h7):(3'h5)] ?
                     {{reg5}} : (~&(&wire0))) >> (~|(^(wire3 ?
                     (8'hab) : wire1)))));
  assign wire7 = ({($unsigned($signed((8'hbe))) ?
                         $unsigned(((7'h44) > wire4)) : wire2),
                     reg5[(1'h0):(1'h0)]} & $signed(((^~$unsigned(wire2)) ?
                     wire4[(4'h8):(4'h8)] : {(reg5 ? wire2 : wire0)})));
  assign wire8 = (wire1 ?
                     $signed($signed(($signed((8'hac)) | (wire0 ?
                         wire0 : wire3)))) : ($unsigned((^(|wire3))) ?
                         wire3 : (wire3 - wire3)));
  assign wire9 = $unsigned((|((reg5 <= $signed(wire4)) ?
                     ($signed(wire8) ?
                         (~wire3) : (wire3 ?
                             wire4 : wire7)) : $unsigned($signed(wire1)))));
  assign wire10 = ($signed($unsigned((^~(!wire2)))) >= ($signed((~|$signed(reg5))) | $unsigned((~(wire2 ^ wire0)))));
  assign wire11 = $signed((wire2 && ((&(wire6 ^ (8'hbe))) ?
                      (^~(~|(8'ha6))) : {wire3[(2'h2):(1'h1)]})));
  always
    @(posedge clk) begin
      reg12 <= $signed(wire4[(1'h0):(1'h0)]);
      if ((|($unsigned((-(wire8 ^ wire10))) > (~|{(wire8 ? wire1 : (8'ha3))}))))
        begin
          if ({wire8, $signed((|{(wire2 ? reg12 : wire9)}))})
            begin
              reg13 <= $unsigned(wire9[(4'hd):(3'h4)]);
              reg14 <= wire1;
              reg15 <= reg13;
              reg16 <= (^~(~(wire10[(3'h7):(3'h6)] ?
                  reg12 : $signed((~^(8'hb2))))));
              reg17 <= (~^reg16);
            end
          else
            begin
              reg13 <= reg16[(3'h4):(1'h1)];
              reg14 <= ((reg14[(3'h4):(2'h2)] || reg15[(3'h4):(2'h2)]) ^~ ((^~$unsigned($unsigned(reg16))) ?
                  $signed(($unsigned(reg14) ?
                      {wire9,
                          reg17} : wire2[(3'h5):(3'h4)])) : ($unsigned($unsigned(reg13)) >= ((wire10 ^ reg14) ?
                      (wire2 | reg14) : (|(7'h41))))));
              reg15 <= $signed((~|(reg15 << wire10[(3'h5):(3'h5)])));
            end
          reg18 <= wire7[(1'h1):(1'h0)];
          reg19 <= $signed(wire10[(3'h6):(1'h0)]);
        end
      else
        begin
          reg13 <= $signed({wire9[(5'h12):(3'h6)]});
          reg14 <= (^(wire10[(3'h4):(3'h4)] ? wire9 : (+wire0)));
          reg15 <= reg16[(4'h8):(1'h1)];
        end
      reg20 <= wire4;
      reg21 <= $unsigned((($unsigned($unsigned(wire4)) ?
              $unsigned((|wire3)) : $unsigned($signed(wire0))) ?
          ((wire1 * (reg14 - (8'h9d))) >= reg18) : reg14[(2'h2):(1'h1)]));
      reg22 <= reg17[(4'he):(4'ha)];
    end
  assign wire23 = $unsigned($unsigned(((reg15[(2'h3):(1'h1)] ?
                          reg17[(3'h5):(2'h3)] : ((8'haf) ^ (8'ha2))) ?
                      ({reg21, wire6} ? $unsigned(wire9) : {(7'h42)}) : ({reg5,
                          wire7} < (~wire7)))));
  assign wire24 = (~^$unsigned(reg22));
  always
    @(posedge clk) begin
      reg25 <= reg19;
      reg26 <= reg13;
      reg27 <= reg25[(5'h11):(5'h11)];
      reg28 <= (|($signed(reg18[(2'h2):(2'h2)]) ^~ {($unsigned(reg12) ?
              {reg22} : (reg17 ? reg16 : reg26))}));
    end
  assign wire29 = (~$signed(reg5[(5'h11):(2'h3)]));
  always
    @(posedge clk) begin
      if (reg27)
        begin
          reg30 <= ((~((reg14[(4'h8):(3'h5)] >> (wire2 ?
              (8'haf) : reg14)) ^~ reg15)) - ((+reg5) ?
              (|($signed(reg28) ? (8'hb6) : (wire23 & reg16))) : (wire1 ?
                  ((^wire3) ?
                      (reg25 ? reg20 : reg21) : $unsigned(reg15)) : (8'hb8))));
          reg31 <= (~($unsigned((~|((8'hb7) ?
              (8'ha7) : (8'hbd)))) >> $signed($signed(wire2))));
        end
      else
        begin
          reg30 <= $unsigned((~^$unsigned({(~^reg28), (wire3 <= reg16)})));
        end
    end
  assign wire32 = (^~(~&$signed(wire9)));
  assign wire33 = ($signed(((|(wire10 ? reg15 : wire29)) ?
                          reg26 : (reg16 + (-reg30)))) ?
                      $unsigned(({((7'h44) ? reg16 : reg18)} ?
                          (wire3 && (reg22 ?
                              reg31 : wire6)) : (|(reg26 <= reg21)))) : wire7[(4'ha):(3'h6)]);
  assign wire34 = (($unsigned($signed($signed(reg25))) ^~ reg18[(3'h7):(3'h6)]) > ((wire10 & (reg13[(3'h5):(2'h3)] ~^ $signed((8'h9c)))) & (wire3[(3'h5):(3'h4)] ?
                      $unsigned($signed(reg5)) : (-$unsigned(wire32)))));
  assign wire35 = wire1[(4'hf):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned(wire24))
        begin
          reg36 <= ((-reg12[(1'h0):(1'h0)]) < ($signed({reg12,
              $unsigned(wire11)}) > (~&$unsigned(wire33))));
        end
      else
        begin
          if (wire4[(3'h4):(2'h2)])
            begin
              reg36 <= $signed((wire11[(3'h6):(3'h5)] >> wire7));
              reg37 <= ((|{((wire24 ? reg28 : reg19) ~^ (reg12 * wire11))}) ?
                  ($unsigned((~|(wire3 ? wire32 : wire1))) ?
                      wire1[(2'h2):(1'h0)] : (!(reg30[(4'he):(4'hb)] ?
                          $unsigned(wire23) : wire4))) : (~&$unsigned((&(wire1 ?
                      wire7 : wire34)))));
              reg38 <= $unsigned($unsigned($signed((+$unsigned(reg37)))));
            end
          else
            begin
              reg36 <= $unsigned((-($unsigned((wire34 ?
                  (8'haf) : reg12)) & reg14)));
              reg37 <= reg22[(3'h5):(2'h2)];
              reg38 <= ($signed(wire24[(3'h4):(2'h3)]) <<< (!((wire1[(1'h1):(1'h0)] ^~ (^~reg13)) <= reg28)));
            end
          reg39 <= {{$unsigned((^$signed(reg13))),
                  ((!$unsigned(reg18)) ? wire9[(2'h2):(2'h2)] : {(~&wire3)})},
              ((^~(~|(reg18 || wire32))) >= (^($signed((8'had)) ^ wire29[(2'h2):(1'h0)])))};
        end
      if ($unsigned(((wire2 ? $signed((^~reg30)) : (|$unsigned(reg16))) ?
          (^~(reg20 >= (wire2 > wire33))) : {$unsigned(reg28[(1'h0):(1'h0)]),
              (!(wire2 <<< reg5))})))
        begin
          reg40 <= (((reg21 >>> {wire4}) << reg19[(4'h9):(3'h7)]) + $signed((((wire10 ?
              wire33 : wire34) <= (8'had)) & (8'hbb))));
          reg41 <= $signed((!(8'hac)));
          reg42 <= (reg12 ? $signed((8'hb5)) : (-(~{{reg16}, reg18})));
          reg43 <= (reg28 | $signed($unsigned(({reg17, reg15} - (^(8'hac))))));
        end
      else
        begin
          if (((($unsigned(wire32) ? (^((8'ha3) ? reg5 : (8'h9d))) : reg28) ?
              (((reg17 ? reg22 : wire0) ?
                      (reg27 == (8'hae)) : ((8'ha2) ? (8'hbe) : wire7)) ?
                  wire23[(4'h8):(1'h0)] : ((wire3 << reg15) >> $unsigned((8'h9c)))) : reg27) || (reg19[(3'h7):(3'h7)] ?
              (^$signed(reg40[(2'h2):(2'h2)])) : reg22)))
            begin
              reg40 <= (reg28 ?
                  (8'h9d) : (($signed($unsigned(reg13)) ?
                          $signed((wire1 ?
                              reg18 : reg27)) : $signed((reg28 && reg26))) ?
                      reg20[(2'h2):(1'h1)] : {$signed($unsigned(reg18))}));
              reg41 <= {$unsigned((($signed(wire32) ?
                          reg19[(4'h8):(1'h0)] : (^~reg36)) ?
                      $signed((|reg18)) : $signed((reg37 ? wire10 : wire24))))};
              reg42 <= (reg15 ?
                  $unsigned($unsigned($unsigned({(8'ha0)}))) : reg16[(3'h7):(3'h6)]);
              reg43 <= {wire0[(4'ha):(2'h2)]};
            end
          else
            begin
              reg40 <= wire35;
              reg41 <= reg16[(2'h3):(1'h1)];
            end
          reg44 <= {reg15, $signed($signed((+(8'ha4))))};
          if (wire9[(5'h11):(2'h3)])
            begin
              reg45 <= $signed(wire35[(2'h2):(2'h2)]);
              reg46 <= (~$unsigned(((~&(wire35 ?
                  reg43 : wire3)) ^ $signed({reg37, reg21}))));
            end
          else
            begin
              reg45 <= wire11[(3'h7):(3'h6)];
              reg46 <= (!$signed(reg13[(3'h6):(2'h3)]));
            end
          reg47 <= reg15;
          reg48 <= reg17[(3'h6):(3'h6)];
        end
      reg49 <= $signed((^~reg19));
      reg50 <= $signed($unsigned(reg46));
      reg51 <= $signed((wire10[(4'h8):(3'h4)] ~^ ({reg47[(3'h7):(2'h3)]} > (~wire8))));
    end
  assign wire52 = $unsigned($signed((8'ha4)));
endmodule
