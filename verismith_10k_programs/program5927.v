module top
#(parameter param53 = (((8'ha3) ? (~|(^((8'ha2) ? (8'hb3) : (8'hb9)))) : (((~&(8'hbb)) ? ((8'ha9) ? (8'haa) : (8'hbb)) : {(8'had)}) ? ((&(8'h9f)) > ((8'ha0) & (8'hb5))) : ((~^(7'h40)) ? ((8'ha3) ~^ (7'h43)) : ((8'ha4) ? (8'ha4) : (8'hba))))) - (((^~{(8'hb9), (8'ha4)}) ? (((8'ha3) ? (7'h44) : (8'ha6)) ? (!(8'hb0)) : {(8'hae)}) : (((8'ha8) ~^ (8'ha8)) == {(7'h41), (8'h9d)})) ? ((((7'h44) >> (8'hb5)) ? {(8'hab)} : ((8'hb3) ? (8'ha6) : (8'hb2))) ? (((8'hbf) < (8'haf)) ^~ {(8'hb1)}) : (((8'hb7) ? (8'hab) : (8'hae)) ? {(8'ha5), (8'had)} : ((8'hac) ? (8'h9c) : (8'ha6)))) : (^(~^(!(8'ha4)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ((wire1[(2'h2):(2'h2)] | $unsigned((&$unsigned(wire0)))) ?
                     wire0[(1'h0):(1'h0)] : $signed(wire4));
  assign wire6 = (({wire5[(2'h3):(2'h2)], {$signed((8'hbf)), {(8'hb0)}}} ?
                     $unsigned(wire0[(3'h6):(1'h1)]) : (8'hbb)) * $unsigned(((|(-wire0)) ?
                     ((wire5 ? wire4 : wire3) ?
                         wire1[(2'h2):(1'h1)] : (wire4 ?
                             wire2 : (8'ha0))) : wire1)));
  assign wire7 = $signed((&$signed($unsigned((wire5 - wire0)))));
  assign wire8 = (^((wire2 == wire3[(3'h6):(3'h5)]) ?
                     $unsigned(wire4) : ((wire0 ?
                         (wire2 ?
                             wire7 : wire2) : $unsigned(wire6)) * (^~(wire0 ?
                         wire2 : wire5)))));
  assign wire9 = (~^((~&(wire3[(4'hf):(4'he)] | (wire0 ? wire7 : wire6))) ?
                     (8'hb7) : $signed(wire6[(3'h6):(2'h2)])));
  assign wire10 = wire9[(4'ha):(3'h6)];
  always
    @(posedge clk) begin
      reg11 <= (+((^~({wire6} && wire0[(3'h5):(3'h5)])) ?
          ({((7'h43) ? (8'h9d) : wire4)} ?
              wire2 : wire5[(1'h0):(1'h0)]) : wire3));
    end
  always
    @(posedge clk) begin
      reg12 <= $signed(({$unsigned(wire8), ((!wire7) <<< {wire0})} ?
          ((+wire0) ?
              {(wire10 ^~ (8'had))} : wire6) : $unsigned(wire0[(3'h6):(3'h5)])));
      reg13 <= ((wire7[(4'hb):(3'h7)] < {$signed((wire3 >> wire0))}) ?
          {({(wire0 ? (8'haf) : wire7)} - (~|$unsigned(wire8))),
              wire1[(3'h7):(1'h1)]} : $unsigned((({wire10, wire10} ?
              (-reg11) : ((8'ha1) ?
                  wire3 : wire7)) + $unsigned((wire2 >> (8'ha0))))));
      reg14 <= $unsigned(((reg13[(1'h0):(1'h0)] >> ($signed(wire10) ?
              $signed(wire8) : {reg11})) ?
          (-$signed(reg11)) : {$unsigned({wire7}),
              $unsigned(wire0[(1'h1):(1'h0)])}));
      if (((wire1[(2'h2):(1'h1)] ?
          (~{{wire9}, $unsigned(reg13)}) : (wire9 ?
              (!$signed(wire10)) : reg13[(1'h0):(1'h0)])) >>> $unsigned($unsigned((((8'hac) ?
          reg11 : wire9) ^~ (+wire8))))))
        begin
          reg15 <= $unsigned((reg12[(1'h0):(1'h0)] ?
              $signed(({(8'hb9)} < (|wire5))) : (~wire1[(4'ha):(2'h2)])));
          reg16 <= (wire2[(2'h2):(1'h0)] && {$signed((~{wire9}))});
        end
      else
        begin
          reg15 <= (8'ha6);
          reg16 <= ($signed(wire8[(3'h5):(1'h0)]) ?
              $signed($signed((8'ha7))) : ($signed({$signed(reg13),
                  wire10}) | $unsigned($signed(wire1[(4'hb):(1'h1)]))));
        end
    end
  always
    @(posedge clk) begin
      reg17 <= reg13;
      if ((!$unsigned((wire7 ?
          (~&{wire8}) : (((7'h40) ? (8'hb1) : reg13) - (wire3 ?
              wire3 : wire0))))))
        begin
          if (wire0[(1'h0):(1'h0)])
            begin
              reg18 <= reg11[(1'h1):(1'h1)];
              reg19 <= ((reg15[(3'h5):(2'h3)] - $unsigned(((reg13 ?
                  wire9 : reg17) == (reg15 + reg11)))) && ($signed((wire7[(3'h5):(2'h3)] ?
                  (!wire5) : ((8'hb7) ?
                      wire3 : wire3))) | (((wire8 >>> wire3) <<< (reg12 & wire5)) >> wire3[(3'h7):(3'h6)])));
            end
          else
            begin
              reg18 <= $unsigned({(^reg18),
                  (|((reg13 ? (8'h9d) : (8'hbc)) ?
                      {(8'ha1), wire0} : (!(8'hb8))))});
              reg19 <= (-reg19);
              reg20 <= $unsigned(reg16);
            end
          reg21 <= wire4[(4'hb):(4'h9)];
        end
      else
        begin
          reg18 <= (8'hb0);
          reg19 <= $signed({{$unsigned((~&reg16))}});
          reg20 <= ({(!((reg20 ? reg11 : wire6) ?
                      wire8[(1'h0):(1'h0)] : (reg12 * reg15))),
                  {(reg14[(3'h5):(3'h4)] ?
                          ((8'hbb) || wire8) : $unsigned(reg16))}} ?
              reg15 : reg15[(3'h6):(2'h3)]);
        end
      reg22 <= wire0;
      if ($unsigned(wire6[(3'h6):(3'h5)]))
        begin
          reg23 <= (^~($signed((8'hbb)) ?
              $unsigned((((8'hab) > reg12) & {reg18})) : $signed(reg21[(3'h5):(1'h0)])));
          if ((&($unsigned($unsigned((wire4 >>> reg23))) != (8'hb1))))
            begin
              reg24 <= reg19;
            end
          else
            begin
              reg24 <= (wire1[(3'h4):(2'h3)] >>> reg24[(2'h2):(2'h2)]);
              reg25 <= (-(8'hb0));
              reg26 <= ({(reg19[(4'hc):(3'h4)] ~^ wire0[(2'h2):(2'h2)])} - $signed((^~(|{reg24,
                  wire3}))));
              reg27 <= {wire3[(1'h1):(1'h1)],
                  (wire7[(3'h6):(1'h0)] >>> $signed(wire5))};
            end
        end
      else
        begin
          reg23 <= reg13[(1'h0):(1'h0)];
          reg24 <= $unsigned($signed($unsigned((-reg19[(4'h9):(3'h5)]))));
          reg25 <= reg16;
        end
    end
  always
    @(posedge clk) begin
      reg28 <= (&($unsigned({$signed(wire10),
          $signed(reg15)}) >>> $signed(((~|reg22) < $signed((7'h44))))));
    end
  always
    @(posedge clk) begin
      if ((!((~^$signed(reg14)) || $signed((+wire8)))))
        begin
          reg29 <= $signed(((8'h9d) ? wire6[(3'h6):(3'h4)] : wire4));
        end
      else
        begin
          if ((|($unsigned((&$unsigned(reg23))) ?
              $signed((8'ha1)) : ({$signed(wire4), ((7'h44) ~^ reg21)} ?
                  ((reg27 || wire7) ^ (wire2 ?
                      wire5 : reg24)) : (((8'hae) < reg18) ?
                      (wire8 >> reg13) : (reg13 ? reg11 : reg22))))))
            begin
              reg29 <= reg25;
            end
          else
            begin
              reg29 <= (~^reg14);
            end
        end
      reg30 <= (~^wire6);
      reg31 <= (~|(($signed({reg12}) ? ((^(8'had)) <= wire10) : reg16) ?
          {{(reg14 ? (8'ha9) : reg15)},
              $signed($unsigned((8'hb5)))} : $unsigned($unsigned((reg25 || (8'had))))));
      if (wire9[(2'h3):(1'h0)])
        begin
          if ({{wire6[(3'h5):(3'h4)]}, (~|(8'hb4))})
            begin
              reg32 <= wire7[(3'h6):(1'h1)];
              reg33 <= $unsigned(reg15[(4'h9):(3'h5)]);
              reg34 <= {($unsigned(reg11) || ($unsigned((~^wire7)) ?
                      (reg22 <= $unsigned(reg12)) : ((reg33 ?
                          reg17 : reg28) <= $unsigned(reg12)))),
                  wire10[(4'h9):(3'h7)]};
              reg35 <= (reg25 ?
                  $signed(reg20) : (~&(($signed(reg30) && (&reg12)) != ((|reg31) ~^ $signed((8'ha8))))));
              reg36 <= wire5;
            end
          else
            begin
              reg32 <= $signed((|($unsigned($signed(wire10)) || (~(wire9 >>> (8'hac))))));
              reg33 <= ((($unsigned((reg32 && (8'ha6))) ?
                      reg34 : $signed($signed(reg23))) <<< (($signed((8'ha9)) ?
                      (reg28 >= wire1) : ((8'ha9) ?
                          (7'h44) : reg29)) * reg30)) ?
                  ($signed((~reg23)) ?
                      (|$signed($unsigned(wire7))) : (7'h44)) : (~^reg16[(2'h3):(2'h3)]));
              reg34 <= {wire9[(2'h3):(2'h2)]};
            end
          reg37 <= (~^(8'ha0));
        end
      else
        begin
          reg32 <= (^~(8'hbe));
          reg33 <= $signed((((|(|wire4)) ?
              $signed($signed(reg23)) : (~&$unsigned(wire8))) & (wire5[(1'h0):(1'h0)] >= reg13)));
          reg34 <= reg16[(4'h8):(1'h0)];
          reg35 <= ($unsigned(wire4) ?
              $unsigned($signed((8'h9d))) : ($unsigned({(reg25 ?
                      reg21 : reg31)}) | wire8[(3'h6):(1'h0)]));
        end
      if ((&reg31[(3'h7):(3'h5)]))
        begin
          reg38 <= $signed($unsigned((!$signed((^reg19)))));
          reg39 <= (reg35 ? {reg14} : reg25[(5'h13):(2'h3)]);
          if ($unsigned((reg23 - $unsigned($unsigned($unsigned(wire9))))))
            begin
              reg40 <= {(reg36 ^~ $unsigned(wire7))};
              reg41 <= $unsigned((~&(wire9[(3'h7):(1'h1)] <= (reg38[(4'ha):(4'ha)] ?
                  (wire9 ? reg33 : (8'hb7)) : $unsigned(reg17)))));
              reg42 <= ($signed((~((!wire2) ?
                      (reg37 || reg32) : (reg33 ? (7'h40) : wire8)))) ?
                  reg17 : (~^($unsigned((reg22 & reg11)) ?
                      (reg19 ?
                          $unsigned(wire0) : $unsigned(wire4)) : $unsigned((reg40 ?
                          (8'hb0) : reg36)))));
              reg43 <= $unsigned((~&(reg11[(3'h5):(2'h3)] ?
                  (8'h9e) : wire7[(2'h2):(1'h1)])));
              reg44 <= (^~$signed(reg38[(4'hb):(3'h4)]));
            end
          else
            begin
              reg40 <= reg43[(2'h2):(1'h1)];
              reg41 <= ($signed(reg21[(3'h4):(1'h0)]) ?
                  reg25 : ((^~{reg33[(3'h5):(1'h1)],
                      $signed(reg40)}) + (($unsigned(reg27) & (^reg11)) >= reg30)));
              reg42 <= $unsigned(wire8[(3'h6):(1'h0)]);
            end
          reg45 <= ((&(~^($unsigned(reg26) && (|reg23)))) ?
              reg39[(1'h0):(1'h0)] : (&$signed((^~(-reg15)))));
        end
      else
        begin
          reg38 <= $signed(($unsigned(reg45) >= reg26[(4'ha):(3'h4)]));
        end
    end
  assign wire46 = reg44;
  assign wire47 = (wire6 == reg43);
  assign wire48 = (~|($unsigned(((+reg25) <<< (~^reg32))) || (^$unsigned($unsigned(reg17)))));
  assign wire49 = $unsigned(reg12[(1'h1):(1'h1)]);
  assign wire50 = (^((reg18[(3'h4):(2'h2)] ?
                      {(reg29 <= reg20)} : reg45) ^ (^~((~^reg39) - (wire4 ^ reg32)))));
  assign wire51 = reg39[(2'h2):(2'h2)];
  assign wire52 = ((8'ha5) ?
                      (-$signed($signed({reg37,
                          reg21}))) : reg27[(1'h1):(1'h0)]);
endmodule
