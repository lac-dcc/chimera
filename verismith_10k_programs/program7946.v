module top
#(parameter param45 = {{((((8'hb5) ? (8'haf) : (7'h41)) + ((8'ha0) ? (7'h43) : (8'hb7))) ~^ (-((8'hbe) ? (8'hb9) : (8'hbb)))), (((~|(8'h9e)) << (+(8'hbc))) == {((8'ha9) >> (8'ha9))})}}, 
parameter param46 = param45)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire31,
                 wire30,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2[(4'h9):(1'h0)];
  assign wire5 = $signed((~$unsigned($signed(((8'ha7) ? (8'hb6) : wire0)))));
  always
    @(posedge clk) begin
      reg6 <= (^~(((wire2[(3'h7):(1'h0)] ? {wire3, wire4} : wire3) ?
              (8'had) : (8'h9f)) ?
          {($signed(wire2) <<< (wire0 <<< wire3)),
              $signed({wire4})} : $signed(wire4[(4'hc):(4'h9)])));
      reg7 <= ($unsigned((^wire5)) ?
          (((((8'ha5) <= wire3) == $unsigned(wire3)) ?
                  (wire1[(2'h3):(2'h2)] >> $unsigned(wire2)) : $signed((&wire0))) ?
              (wire3[(1'h0):(1'h0)] << $signed((wire0 ?
                  wire0 : wire5))) : $signed(wire5[(4'hd):(4'h8)])) : $signed(wire0[(1'h0):(1'h0)]));
    end
  assign wire8 = ((&($signed((wire0 ? wire4 : wire5)) ?
                         $signed(reg6[(2'h3):(1'h0)]) : $signed({reg7}))) ?
                     $unsigned($signed($signed((reg6 ?
                         (8'hbd) : wire2)))) : (({$signed(wire1),
                         (8'hb0)} || $signed($signed(wire1))) || $unsigned((-reg6))));
  assign wire9 = $signed($unsigned($unsigned((|(reg6 ? wire2 : wire1)))));
  always
    @(posedge clk) begin
      if (((7'h43) ? wire9[(2'h2):(1'h1)] : (~^$unsigned((~&(8'hb3))))))
        begin
          reg10 <= (((^~(-$unsigned((7'h41)))) != wire5[(3'h4):(1'h0)]) ^~ (|$signed($signed((wire0 && wire5)))));
        end
      else
        begin
          reg10 <= {wire3[(4'hc):(4'h9)],
              (^~$unsigned($unsigned(wire0[(4'h8):(2'h3)])))};
          reg11 <= (8'ha0);
          reg12 <= ((+((wire0[(3'h5):(1'h0)] > $signed((8'ha6))) ?
                  $signed($signed(reg6)) : $signed((wire2 ? reg10 : wire9)))) ?
              $unsigned(wire4) : (+wire1[(1'h0):(1'h0)]));
        end
      reg13 <= {{wire9}, (^~(^~($unsigned(wire4) >= (reg10 ^~ (8'hb5)))))};
      if ($unsigned((($signed($signed(wire8)) ?
              ((wire4 > wire3) ^ {reg10, reg13}) : $unsigned((~reg13))) ?
          {reg7} : (~&{wire5, $unsigned(reg11)}))))
        begin
          if (reg6)
            begin
              reg14 <= wire5[(3'h7):(1'h1)];
              reg15 <= reg6;
              reg16 <= (&(~$signed((8'hb8))));
              reg17 <= (!reg15);
              reg18 <= $signed(((+reg7) >> $signed(($unsigned(wire3) >>> $unsigned(reg10)))));
            end
          else
            begin
              reg14 <= (8'hb6);
              reg15 <= $unsigned($unsigned(reg17));
              reg16 <= $unsigned($signed(wire8));
              reg17 <= {($signed(((!wire9) > {wire8})) ?
                      $unsigned(wire9[(1'h1):(1'h0)]) : $signed((~^reg15[(1'h1):(1'h0)])))};
            end
          reg19 <= wire8[(1'h1):(1'h0)];
          if (reg7[(4'ha):(4'h9)])
            begin
              reg20 <= (^~(wire9[(1'h1):(1'h0)] ?
                  reg18 : {$unsigned($signed(wire8))}));
              reg21 <= $unsigned(((((wire1 ? (8'ha8) : reg16) ?
                      (8'ha7) : {reg16, reg18}) ?
                  (~|(reg16 <<< reg11)) : (reg14 ?
                      ((8'h9e) <= wire2) : (reg19 | reg6))) - $unsigned($unsigned((~^reg7)))));
              reg22 <= $unsigned($signed((reg21[(2'h2):(1'h1)] - reg12[(2'h3):(2'h3)])));
              reg23 <= $unsigned(wire8);
              reg24 <= ($signed((wire9 >> $signed({wire0}))) + reg13);
            end
          else
            begin
              reg20 <= $signed((+((reg12[(1'h0):(1'h0)] >= (wire1 ?
                  reg15 : reg21)) <<< ($unsigned((8'hb6)) ?
                  $unsigned(reg17) : (reg6 >= reg7)))));
            end
          reg25 <= $signed($signed(wire3[(4'hc):(3'h6)]));
          if ((((reg19[(3'h4):(3'h4)] ?
              ($unsigned(wire2) ?
                  (~^reg18) : (wire0 ?
                      wire1 : reg14)) : $signed(reg21)) >= wire0[(1'h0):(1'h0)]) + $unsigned((~^({reg7,
              wire0} > (reg15 << wire9))))))
            begin
              reg26 <= reg15[(3'h7):(3'h6)];
              reg27 <= (&(8'h9c));
            end
          else
            begin
              reg26 <= wire0;
            end
        end
      else
        begin
          reg14 <= ((($unsigned((reg14 >= reg24)) ~^ $unsigned(wire4)) ?
              $unsigned($unsigned((~&reg6))) : (wire0 ?
                  reg24[(5'h11):(3'h5)] : (&wire3))) >= ($signed((^~{wire3,
              reg12})) & $unsigned(reg23[(1'h1):(1'h1)])));
          reg15 <= wire8[(2'h3):(1'h1)];
          reg16 <= {reg20};
          reg17 <= $unsigned({wire9[(1'h1):(1'h0)]});
          if ({(((((8'h9f) ? reg6 : reg19) ?
                  (reg25 ?
                      wire5 : (8'hb1)) : (reg6 < reg24)) ^ {(^wire3)}) * ($signed((+reg24)) ^ reg16[(4'hc):(4'ha)])),
              (~&$unsigned({$unsigned(reg14), {reg14, reg20}}))})
            begin
              reg18 <= (wire1[(1'h1):(1'h0)] ?
                  $unsigned($signed((&(reg16 >= reg11)))) : (-reg26));
              reg19 <= $signed((wire4[(4'h9):(4'h8)] ^ {(^~(reg6 ?
                      reg12 : reg19)),
                  (|{reg6})}));
            end
          else
            begin
              reg18 <= (~&(wire0[(4'he):(4'he)] ?
                  ((~&$signed(reg18)) ?
                      {(8'hb3)} : {(wire3 ?
                              wire1 : reg26)}) : reg6[(3'h4):(2'h2)]));
              reg19 <= $signed((wire2 != reg18));
              reg20 <= (&(&{{(reg22 ? (7'h43) : wire3)}}));
              reg21 <= wire9[(1'h0):(1'h0)];
              reg22 <= ($unsigned((reg20 ?
                  ($signed(wire5) << ((7'h44) <= reg26)) : {(~|reg25),
                      $unsigned(reg18)})) == wire0[(4'hb):(3'h4)]);
            end
        end
      reg28 <= reg14;
      reg29 <= {(($unsigned((|reg23)) ~^ (reg10 | $signed(reg25))) ?
              (($unsigned(reg13) || (wire2 ? wire1 : reg21)) << {(wire3 ?
                      wire4 : reg10),
                  (-reg14)}) : {$signed($signed(reg12)), reg10[(4'h8):(2'h2)]}),
          $signed((($signed((8'hb7)) ^ wire5) ?
              $unsigned($unsigned(reg18)) : $signed($unsigned(reg6))))};
    end
  assign wire30 = reg18[(5'h10):(4'hb)];
  assign wire31 = reg27;
  always
    @(posedge clk) begin
      reg32 <= $signed({reg21});
      reg33 <= $unsigned($signed($unsigned((+reg32))));
      reg34 <= ($unsigned(reg22) ?
          reg11 : (reg18 ?
              $unsigned({$signed((8'h9d)),
                  (reg33 ? reg23 : reg11)}) : ((((8'ha1) >= wire1) ?
                  reg33[(3'h6):(2'h2)] : (~^wire2)) && wire8[(1'h0):(1'h0)])));
      reg35 <= (~|$unsigned(((~reg33) ? (~^(+reg19)) : wire4[(3'h5):(1'h1)])));
    end
  assign wire36 = $unsigned((!$unsigned($unsigned(reg26))));
  always
    @(posedge clk) begin
      reg37 <= wire5[(4'hf):(4'hc)];
      reg38 <= ((^(!reg12)) | wire36[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned((^~((reg37 ? reg38 : wire4) ?
          $unsigned((8'hab)) : (reg26 ? reg6 : reg6))))))
        begin
          if ({($unsigned((((8'hb5) * wire2) || $signed(wire3))) <= $signed(($signed(wire9) < (reg23 ?
                  reg37 : reg34)))),
              (~|(!reg24))})
            begin
              reg39 <= (wire9 ~^ $unsigned(($unsigned((&reg14)) >= $unsigned(wire9[(3'h5):(2'h2)]))));
              reg40 <= (8'had);
              reg41 <= ($signed($unsigned($signed((wire9 && reg7)))) ?
                  $unsigned((reg24 ?
                      (~&$unsigned((7'h43))) : ($unsigned(wire8) ?
                          {wire31} : $signed(reg40)))) : (reg28 ?
                      ($unsigned(reg34) ?
                          $signed((wire30 | (8'hb4))) : $signed(reg34)) : reg15[(1'h1):(1'h0)]));
              reg42 <= reg34;
              reg43 <= wire3;
            end
          else
            begin
              reg39 <= (reg20[(4'ha):(4'ha)] ?
                  {($unsigned($signed(reg19)) || $signed(reg17))} : ((((wire1 ?
                          wire9 : wire30) > ((7'h43) ?
                          wire5 : wire5)) | reg26) ?
                      $unsigned({reg20}) : (~($unsigned(reg39) ?
                          (reg43 | wire3) : $signed(reg17)))));
              reg40 <= ((^~(!(|(~|(8'hb0))))) && wire3[(4'hb):(3'h7)]);
              reg41 <= (8'ha6);
              reg42 <= ({(&(|$unsigned(reg23))),
                      $unsigned((reg7 ? (~^reg23) : reg43))} ?
                  (wire1 ?
                      ($unsigned($signed(reg6)) ?
                          $signed((reg34 ?
                              reg15 : reg33)) : wire0) : (-($signed((8'ha0)) || {reg13}))) : ((wire3 ?
                      ({reg16, reg22} ?
                          reg12[(2'h2):(1'h0)] : (~^reg14)) : reg26) >>> ((8'ha7) <<< (!reg41[(4'h8):(1'h1)]))));
              reg43 <= wire30[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg39 <= ($unsigned(($signed($unsigned((8'hbe))) ?
              $signed((reg43 ?
                  reg32 : reg15)) : reg19)) || (~^$unsigned((~|(+(8'hb4))))));
          reg40 <= reg42[(2'h2):(1'h1)];
          reg41 <= (8'hb9);
          reg42 <= (^~(($unsigned($unsigned(reg26)) ?
                  $signed((reg43 + reg17)) : ($unsigned(reg26) ?
                      (wire5 != reg25) : (reg38 ? reg16 : wire0))) ?
              $unsigned(reg35[(3'h5):(3'h5)]) : $unsigned($unsigned($signed(reg34)))));
          reg43 <= $unsigned($unsigned(($signed((7'h43)) ?
              (reg19 - $unsigned(reg34)) : ((reg10 ? reg25 : wire5) | reg18))));
        end
      reg44 <= $signed($signed($unsigned(reg28[(1'h0):(1'h0)])));
    end
endmodule
