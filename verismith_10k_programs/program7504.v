module top
#(parameter param65 = (((~|(((8'ha4) ? (8'hb0) : (8'hb9)) ? ((8'h9f) ? (8'hbc) : (8'ha2)) : (~&(8'ha4)))) <<< ((^~((8'hb9) ? (8'ha2) : (8'hbb))) ^~ (((8'hbb) + (8'hb4)) != (+(8'h9e))))) ? (((!{(8'h9c), (8'hbe)}) ? (!{(8'ha2)}) : ((~^(8'haa)) ? {(8'ha7)} : (&(8'hb5)))) ? (~{((7'h44) ? (8'hb1) : (8'hbe))}) : (-(((8'ha1) * (8'hbe)) ? (&(7'h42)) : ((8'ha0) ? (8'hba) : (8'hae))))) : (+(((!(8'hbe)) ^ ((8'haf) ? (8'h9c) : (8'ha9))) ? (((8'ha2) ^~ (8'ha0)) ~^ ((8'hbb) >= (7'h43))) : (((8'ha8) > (8'ha4)) >= ((8'h9c) <<< (8'hb7)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire32;
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire34,
                 wire32,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  module5 #() modinst33 (.wire9(wire3), .wire6(wire2), .y(wire32), .wire10(wire0), .wire8(wire1), .clk(clk), .wire7(wire4));
  assign wire34 = $signed(wire2);
  always
    @(posedge clk) begin
      reg35 <= wire34;
      if (reg35[(2'h3):(2'h2)])
        begin
          reg36 <= {((&(~(wire4 ? wire2 : wire3))) >>> (8'hb2)),
              ((wire4 != (wire34 <= $signed(wire2))) ?
                  wire3 : $signed(($signed(wire3) ?
                      (reg35 | wire32) : (^~wire0))))};
          if ($signed(($unsigned($unsigned((^~reg35))) & $signed(wire1))))
            begin
              reg37 <= wire32;
            end
          else
            begin
              reg37 <= ($unsigned((wire1 ?
                      (^~wire32) : $unsigned(wire3[(3'h6):(1'h1)]))) ?
                  $signed((wire4[(3'h6):(3'h5)] - $signed(reg37))) : ($unsigned((((8'ha7) ^~ reg37) ?
                          (reg36 ? wire4 : wire4) : {reg37})) ?
                      ({$signed((8'hbe))} ?
                          wire1 : $unsigned(wire2[(4'h9):(1'h0)])) : $unsigned(wire34)));
            end
        end
      else
        begin
          reg36 <= $unsigned(wire0[(1'h0):(1'h0)]);
          if ((~$signed((reg36 ? wire0[(3'h5):(2'h2)] : wire3))))
            begin
              reg37 <= wire2[(4'hd):(4'hd)];
              reg38 <= $signed((&$signed((~|(wire1 ? reg35 : wire4)))));
              reg39 <= wire0;
              reg40 <= ($unsigned(reg39) ?
                  {wire32,
                      $signed(($signed(reg39) ^~ reg39))} : $unsigned({(-(wire1 > wire1))}));
            end
          else
            begin
              reg37 <= $signed((~|wire0[(4'ha):(3'h7)]));
              reg38 <= ($unsigned((reg38[(1'h1):(1'h1)] ?
                  (8'ha7) : wire0[(4'he):(3'h7)])) & $unsigned($unsigned((~^(wire1 << wire1)))));
            end
          if (reg35[(3'h6):(3'h4)])
            begin
              reg41 <= {$unsigned(wire2[(3'h6):(1'h0)])};
            end
          else
            begin
              reg41 <= $signed($unsigned($signed($unsigned((reg35 ?
                  (8'h9d) : wire0)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg42 <= (reg37 << wire1[(3'h4):(1'h0)]);
      if (reg40)
        begin
          reg43 <= reg40;
        end
      else
        begin
          if (reg35)
            begin
              reg43 <= (reg38 < reg38[(1'h0):(1'h0)]);
              reg44 <= reg43;
              reg45 <= (wire4 << {$signed((((8'hb7) ? reg42 : reg41) ?
                      (reg38 ~^ (8'hb1)) : (8'hbb)))});
            end
          else
            begin
              reg43 <= (wire3[(4'hd):(3'h6)] ?
                  (($unsigned({wire3}) ? {(~^wire1)} : wire2[(3'h5):(3'h5)]) ?
                      $unsigned($signed(reg36[(3'h4):(1'h1)])) : $signed($signed((wire0 ?
                          reg42 : wire0)))) : (-reg38[(2'h2):(1'h0)]));
              reg44 <= (wire34[(4'hb):(3'h6)] >>> {$unsigned(((wire2 <<< reg42) ?
                      wire4 : $signed(reg43)))});
              reg45 <= ((+(|{$signed(wire1),
                  (reg40 ? reg43 : wire32)})) != wire32[(3'h7):(1'h0)]);
            end
          reg46 <= ($signed(reg41) == reg41);
          if (reg42[(3'h5):(3'h4)])
            begin
              reg47 <= ($unsigned({reg40[(4'h8):(3'h7)]}) ?
                  $unsigned(wire0) : ((($unsigned(reg46) ?
                      (^~(8'hba)) : (+reg35)) || wire32[(3'h7):(3'h6)]) - (~|$unsigned(reg36[(2'h3):(2'h2)]))));
              reg48 <= ($unsigned($signed((|(reg43 << reg45)))) ?
                  $signed(reg45) : (reg43 - {(reg36 ?
                          $unsigned(wire34) : wire3[(2'h2):(1'h1)])}));
            end
          else
            begin
              reg47 <= (&wire32);
              reg48 <= reg45[(4'h8):(4'h8)];
            end
        end
      reg49 <= ((($signed(((8'hb5) ^~ reg43)) ?
              (!(reg38 <= wire1)) : $signed((reg42 ^~ wire3))) ?
          (wire2 ^ ((wire1 <<< reg40) | {reg46})) : reg41) >= $unsigned(wire2[(4'h9):(2'h2)]));
      reg50 <= ($signed(wire0) ?
          reg37[(5'h10):(4'hc)] : (+$unsigned((&reg43[(2'h2):(1'h1)]))));
      if (reg36[(1'h1):(1'h0)])
        begin
          reg51 <= reg50;
          reg52 <= (|$unsigned(reg36));
          if (wire4)
            begin
              reg53 <= reg52;
              reg54 <= $unsigned({(~^reg42[(2'h3):(1'h0)]),
                  reg45[(3'h4):(2'h3)]});
            end
          else
            begin
              reg53 <= (($unsigned(reg41) ?
                  (&wire2[(2'h2):(1'h1)]) : {((8'hbb) ?
                          (reg54 - (8'hbe)) : (+reg47)),
                      (&$signed(reg52))}) && $unsigned((~|$signed(reg37))));
              reg54 <= ((reg49[(4'h8):(4'h8)] & ((~|(wire4 ? (8'h9e) : reg37)) ?
                      (~&$unsigned(reg42)) : wire3[(2'h3):(1'h1)])) ?
                  ({wire4} >> (((reg54 >> wire1) ?
                          $unsigned(reg48) : reg41[(4'h9):(1'h1)]) ?
                      $unsigned({reg49, reg43}) : (~&(~reg44)))) : reg42);
              reg55 <= $signed(reg41);
              reg56 <= $signed(reg40);
              reg57 <= reg53;
            end
          reg58 <= reg49;
        end
      else
        begin
          reg51 <= ((reg36 ?
              (reg57 ? $unsigned((!reg52)) : reg38) : ($unsigned(reg48) ?
                  (((8'hbb) ? reg52 : reg53) ?
                      (reg37 ? reg57 : wire0) : (reg49 ?
                          reg40 : reg45)) : (~|wire1[(4'hb):(3'h6)]))) <<< (&{((wire4 ?
                      wire2 : reg39) ?
                  $unsigned((7'h40)) : (&reg45))}));
          if (reg58[(4'hc):(4'h9)])
            begin
              reg52 <= reg47;
              reg53 <= (reg50 ? (~reg57) : reg56);
            end
          else
            begin
              reg52 <= {reg42,
                  {({reg37[(4'he):(3'h4)]} ?
                          reg56[(1'h0):(1'h0)] : reg55[(4'h8):(4'h8)]),
                      ((reg35[(1'h1):(1'h1)] >= ((8'hb2) >>> (8'hbc))) ^~ (^reg46[(4'h8):(3'h6)]))}};
              reg53 <= $unsigned($unsigned(wire32));
              reg54 <= (-($signed(((wire4 ? wire32 : reg41) ?
                  (^~(8'hab)) : reg58)) ~^ ((reg52[(1'h0):(1'h0)] ?
                  {(7'h40)} : (!reg49)) >> (wire2[(5'h11):(3'h5)] + (reg44 - reg54)))));
              reg55 <= reg40[(1'h1):(1'h0)];
            end
          reg56 <= $unsigned(((((-(8'hb2)) ^ reg52[(1'h1):(1'h0)]) ?
              wire0[(2'h2):(1'h1)] : $unsigned({reg56})) == {($signed(reg44) ?
                  wire34[(3'h4):(1'h0)] : $unsigned(reg41)),
              ((~&reg39) ? wire32[(4'h8):(1'h0)] : (reg44 ? reg38 : wire1))}));
        end
    end
  assign wire59 = ($unsigned((^$signed((reg38 <= reg40)))) >>> $signed($unsigned($unsigned($signed((7'h43))))));
  assign wire60 = reg52[(1'h0):(1'h0)];
  assign wire61 = (^~(&wire0[(4'h8):(1'h0)]));
  assign wire62 = wire60[(1'h0):(1'h0)];
  assign wire63 = ($unsigned((($unsigned(reg45) != {wire62, wire3}) ?
                      $unsigned(reg51[(3'h4):(1'h1)]) : $unsigned($signed(reg35)))) <<< ($signed((~reg50[(2'h3):(1'h1)])) ?
                      (~^(+$signed(reg45))) : (reg45 ?
                          (reg45[(3'h7):(1'h1)] ?
                              (!(8'ha0)) : (reg55 < reg51)) : ($signed(reg55) ?
                              (reg35 ? (8'hb3) : (8'hb3)) : (wire3 ?
                                  (8'ha9) : reg53)))));
  assign wire64 = ($unsigned(({reg49, {reg55, reg45}} << (-(~wire32)))) ?
                      reg43 : reg53);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  assign y = {wire31,
                 wire13,
                 wire12,
                 wire11,
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
                 (1'h0)};
  assign wire11 = ($signed(wire9[(4'hc):(4'ha)]) | (~^$unsigned(((7'h42) ?
                      {wire7} : $signed((8'hac))))));
  assign wire12 = ({$unsigned((&wire6[(5'h10):(4'he)])),
                      $unsigned(($unsigned(wire8) >> {wire8}))} ^ (&(wire9[(4'h9):(1'h1)] & wire7[(4'h9):(3'h6)])));
  assign wire13 = (~|$unsigned(wire8));
  always
    @(posedge clk) begin
      if (wire6[(3'h5):(1'h1)])
        begin
          reg14 <= wire9[(3'h5):(1'h0)];
          reg15 <= wire8;
          reg16 <= $signed(reg14[(2'h2):(2'h2)]);
        end
      else
        begin
          reg14 <= ((^~(((wire7 ? reg16 : wire10) && wire6[(4'hc):(4'hc)]) ?
                  $signed(wire6) : {(~|wire12), (~wire9)})) ?
              (((^(wire13 || wire9)) ?
                  $unsigned(reg15[(1'h1):(1'h1)]) : reg16[(4'h8):(2'h3)]) >> (((reg16 >= wire9) >> $unsigned(wire13)) ?
                  (wire7 < {wire8}) : wire10)) : $signed(reg15));
          reg15 <= (($signed({$signed(wire13)}) ?
              wire11 : {reg16[(2'h2):(1'h1)],
                  ($signed(wire10) ?
                      (~&reg16) : (wire6 ?
                          wire11 : (8'ha2)))}) >>> wire12[(3'h5):(3'h4)]);
          reg16 <= $unsigned((~$unsigned(($unsigned(reg15) ^ (8'hb4)))));
        end
      reg17 <= $unsigned($unsigned($unsigned((^~$signed((8'hb5))))));
      reg18 <= $signed($unsigned((((|wire6) ?
          reg14 : $unsigned(wire6)) ^~ {$unsigned(wire9)})));
      reg19 <= $signed((~^(~^$unsigned($signed(reg15)))));
      if (({{wire8[(1'h0):(1'h0)]}} ?
          $unsigned((!((~|wire11) + (+(8'hac))))) : ({$unsigned(reg15[(2'h2):(2'h2)])} != reg19[(2'h2):(2'h2)])))
        begin
          reg20 <= {wire8, reg17[(3'h7):(2'h3)]};
          reg21 <= ((|wire12) ?
              reg19[(2'h2):(2'h2)] : (~$signed({$unsigned(wire8)})));
        end
      else
        begin
          reg20 <= {wire13, $unsigned(reg20[(1'h0):(1'h0)])};
          reg21 <= ((({(^reg14)} >>> wire11) ?
                  (((reg18 >>> reg19) ?
                      $unsigned(reg20) : (reg18 ?
                          (8'hb9) : (7'h44))) <<< (wire6[(4'h9):(4'h9)] < (+(8'hb3)))) : (wire9 ?
                      wire6[(4'h9):(3'h5)] : (^~(wire12 && reg20)))) ?
              reg16[(3'h4):(2'h2)] : (((!(wire13 <= reg18)) ?
                  wire7 : $signed((reg17 <= reg15))) | (+($unsigned(reg14) < (|reg21)))));
        end
    end
  always
    @(posedge clk) begin
      if (reg16)
        begin
          reg22 <= ((reg16 >>> (($unsigned(wire12) ?
                      $signed(wire13) : {(7'h43), reg15}) ?
                  ((reg14 >= wire8) ?
                      $unsigned(wire13) : $unsigned((8'hb4))) : (wire10 ^ $unsigned(reg16)))) ?
              reg15 : (~^$unsigned(reg18)));
        end
      else
        begin
          reg22 <= wire7[(4'hc):(4'ha)];
          reg23 <= wire13;
          reg24 <= $unsigned(reg21[(4'h8):(1'h0)]);
          reg25 <= reg16;
          if ($unsigned($unsigned(((|$signed(reg24)) > $unsigned($signed(wire12))))))
            begin
              reg26 <= reg17;
              reg27 <= $unsigned($unsigned($signed(({wire6} ?
                  (|(7'h44)) : $signed(wire8)))));
              reg28 <= $unsigned((((~^((8'haa) << (8'hbe))) ?
                      $unsigned(wire7) : ((-reg21) | reg17)) ?
                  $signed($unsigned($unsigned(wire11))) : {$signed(((8'hb5) ~^ wire10)),
                      reg16}));
              reg29 <= $unsigned((reg18 << {$signed((^~reg25))}));
            end
          else
            begin
              reg26 <= ($signed(reg26[(4'hc):(2'h2)]) == (|($unsigned((wire12 ?
                  reg25 : wire11)) > $unsigned(reg15))));
              reg27 <= reg28[(3'h6):(1'h1)];
              reg28 <= (wire8 ?
                  reg24 : ((((reg22 <= reg17) ?
                          $unsigned(reg24) : (wire11 ? (7'h41) : reg19)) ?
                      wire11 : (|((8'h9d) & (8'hbc)))) <<< wire13));
            end
        end
      reg30 <= $signed($signed(reg29[(4'hc):(4'hc)]));
    end
  assign wire31 = reg22[(2'h3):(2'h2)];
endmodule
