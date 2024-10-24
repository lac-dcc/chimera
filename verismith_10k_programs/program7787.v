module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire4,
                 reg45,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ((|($unsigned((wire3 ? (8'ha6) : wire1)) ?
                         wire0 : wire2[(5'h10):(3'h4)])) ?
                     $unsigned($unsigned(((wire3 ^ wire2) && $unsigned(wire1)))) : $signed((^~(~^{wire2,
                         wire2}))));
  always
    @(posedge clk) begin
      reg5 <= (wire1[(4'hb):(1'h0)] ? $signed(wire1) : wire1);
      if (wire2)
        begin
          reg6 <= ((wire2[(2'h2):(1'h0)] != (((wire1 == reg5) ?
                      (wire0 > wire0) : (wire2 & (8'hb5))) ?
                  $signed(reg5) : (((8'ha8) ?
                      wire0 : wire0) * $signed(wire2)))) ?
              (($unsigned(wire4) > wire0) ?
                  wire2 : $signed(wire3[(1'h1):(1'h0)])) : (&(wire3 ^~ {$signed(reg5)})));
          if (reg6[(3'h7):(2'h3)])
            begin
              reg7 <= {wire3[(2'h3):(2'h3)],
                  $signed((wire3 ?
                      (^~(!wire3)) : $unsigned(((7'h44) ? wire2 : wire4))))};
            end
          else
            begin
              reg7 <= wire3;
              reg8 <= $signed($unsigned($unsigned(((!reg5) ?
                  $unsigned(wire2) : reg7))));
              reg9 <= (7'h41);
              reg10 <= ((wire0 <<< reg8) ?
                  {wire2[(4'hb):(2'h2)]} : $unsigned((~$unsigned(wire0))));
              reg11 <= wire3[(1'h1):(1'h0)];
            end
          reg12 <= wire3;
          if (wire3[(2'h2):(2'h2)])
            begin
              reg13 <= {({((!reg6) ? (reg5 ~^ reg5) : (reg8 | wire1))} ?
                      reg10 : (~^($signed(reg5) > reg8)))};
              reg14 <= $signed(wire4[(4'hc):(3'h4)]);
              reg15 <= ((reg13[(3'h7):(3'h5)] > $unsigned($unsigned($signed(reg11)))) ?
                  (&((8'had) ?
                      reg6[(4'ha):(3'h7)] : ((-wire0) > (reg8 ?
                          reg12 : reg7)))) : $unsigned($unsigned(reg10[(3'h7):(2'h3)])));
              reg16 <= (reg6 >>> (($signed((reg14 ? reg11 : wire4)) ?
                      (reg7[(1'h1):(1'h1)] * (reg10 ?
                          reg14 : wire3)) : $signed($unsigned(reg7))) ?
                  $unsigned(reg15) : reg14));
              reg17 <= (($unsigned(({reg15} || $unsigned(wire2))) ^ $signed(reg7[(4'h9):(3'h5)])) ?
                  wire3[(1'h1):(1'h0)] : $unsigned((reg16[(1'h1):(1'h1)] - ((-reg15) ?
                      (~wire1) : $signed(reg15)))));
            end
          else
            begin
              reg13 <= reg13;
              reg14 <= ($unsigned((wire2 ~^ ($unsigned((8'hb7)) & {reg14}))) ?
                  (~&wire4) : ({reg11[(2'h2):(1'h0)]} && $signed(($unsigned(wire0) || $signed(reg11)))));
              reg15 <= {reg16,
                  ($unsigned(((!(8'hb6)) ~^ wire1)) & wire2[(4'ha):(4'ha)])};
            end
        end
      else
        begin
          reg6 <= $signed((^~((-$unsigned(reg5)) ?
              ((^~reg5) ? (reg10 ? (8'haa) : reg13) : reg13) : $unsigned((reg7 ?
                  wire4 : reg6)))));
        end
      if ((+reg7[(3'h4):(2'h2)]))
        begin
          reg18 <= reg5[(1'h1):(1'h0)];
          reg19 <= wire3[(1'h1):(1'h0)];
          reg20 <= (~|wire4);
          reg21 <= reg19;
          reg22 <= (8'ha4);
        end
      else
        begin
          reg18 <= (-($unsigned($unsigned((reg11 ~^ reg9))) & reg10));
          reg19 <= ((|$unsigned($signed((wire0 * wire0)))) ?
              (!($unsigned((8'haa)) * (^~((8'hb5) ?
                  reg5 : (8'ha7))))) : (|(($unsigned(reg13) ?
                  {reg17} : reg11[(3'h4):(3'h4)]) || (~|{reg6}))));
          reg20 <= (($unsigned(((reg16 ? wire0 : reg8) ?
              ((8'ha3) ?
                  reg7 : reg20) : reg19)) > reg14[(2'h2):(1'h1)]) && (reg22 * (~&$signed($signed(reg17)))));
          reg21 <= (~|(8'had));
          reg22 <= ((^~$signed((reg7 ?
              (~^(8'haa)) : $unsigned((8'hbc))))) ~^ ($unsigned($unsigned((-reg12))) ?
              wire4[(3'h7):(3'h4)] : (~^reg6)));
        end
      if ($signed((8'hb3)))
        begin
          reg23 <= ({(~&$unsigned((reg11 ? reg21 : reg17))),
              wire0[(2'h2):(2'h2)]} | (wire2[(3'h5):(1'h0)] ?
              wire0[(1'h0):(1'h0)] : $unsigned({$unsigned(reg18)})));
        end
      else
        begin
          reg23 <= reg8[(1'h1):(1'h0)];
          if (reg19)
            begin
              reg24 <= ($signed($signed((&$signed(reg14)))) == ((^(+$signed((8'hbb)))) && {{reg22},
                  {reg8[(1'h1):(1'h0)], (|reg20)}}));
            end
          else
            begin
              reg24 <= $signed((reg18 + $unsigned((reg16[(2'h3):(2'h3)] >= (reg22 <= wire0)))));
              reg25 <= (wire0[(2'h3):(2'h3)] ?
                  (($signed((reg6 ?
                      reg20 : (8'hb2))) ^~ $unsigned({reg20})) < reg5) : (|((+{reg9}) < reg13[(1'h1):(1'h0)])));
              reg26 <= reg10;
              reg27 <= reg25;
              reg28 <= reg15[(4'he):(1'h1)];
            end
          if ((|wire0[(1'h0):(1'h0)]))
            begin
              reg29 <= (reg27[(1'h0):(1'h0)] || ($signed(({reg5,
                  reg5} != ((8'ha9) ? reg19 : reg6))) * $unsigned(((reg19 ?
                  wire2 : wire3) * $signed(reg26)))));
              reg30 <= $signed($signed({((!(8'hb7)) >= reg17)}));
              reg31 <= (reg11[(1'h1):(1'h1)] <= (|$signed((~^reg29[(2'h3):(2'h2)]))));
              reg32 <= $signed($unsigned(wire0));
            end
          else
            begin
              reg29 <= (^$unsigned(reg26));
              reg30 <= $unsigned($unsigned(($unsigned($unsigned(reg29)) ?
                  (8'hbd) : {(reg31 ? wire4 : reg13), $signed(reg28)})));
              reg31 <= (~&reg27[(2'h2):(1'h1)]);
              reg32 <= ($signed((wire3[(2'h2):(1'h1)] ^ ((reg23 != wire1) ^ $unsigned((8'hbf))))) ?
                  reg12 : (~&reg29[(3'h4):(2'h3)]));
              reg33 <= ({reg32[(4'he):(4'hc)]} ?
                  (^($signed(reg20) ?
                      ($unsigned(reg10) ?
                          (8'hb3) : $signed((8'haf))) : $unsigned((reg5 > wire3)))) : (^~$unsigned($signed(reg15))));
            end
          if (($signed(((~^wire2[(3'h5):(3'h5)]) ?
              (|$unsigned(reg30)) : (^~$unsigned(reg12)))) < $signed(($signed(reg9[(5'h12):(4'hf)]) ?
              ($unsigned(reg33) == reg13) : (&$unsigned((8'ha6)))))))
            begin
              reg34 <= (~^(^~(-(~^$unsigned(reg22)))));
              reg35 <= (reg18 ?
                  reg8[(2'h2):(1'h0)] : {($signed(reg34[(3'h6):(3'h4)]) ?
                          (8'h9d) : reg30),
                      (reg6[(4'ha):(4'ha)] << $signed($signed((8'hb1))))});
              reg36 <= {$unsigned(reg12[(1'h0):(1'h0)])};
              reg37 <= ($unsigned(reg17[(4'h9):(1'h1)]) <<< (reg34[(2'h3):(2'h3)] ?
                  ({reg32[(3'h5):(3'h4)],
                      $signed(reg10)} ^~ reg28) : $signed(reg17)));
              reg38 <= ($unsigned(reg10) * ({reg20[(2'h3):(2'h2)]} ?
                  (~^(^~reg19)) : {((reg15 ? reg18 : reg34) ?
                          (reg18 ? (8'hac) : wire2) : reg33[(2'h3):(1'h1)])}));
            end
          else
            begin
              reg34 <= (({$signed(((8'hb3) >>> (7'h40)))} ?
                  reg28 : reg21) == $signed({$signed((wire0 ?
                      wire0 : reg34))}));
              reg35 <= $unsigned(wire2);
              reg36 <= $signed(reg9[(5'h10):(3'h4)]);
              reg37 <= $unsigned($signed(reg7));
              reg38 <= (~|reg37[(3'h7):(3'h5)]);
            end
          reg39 <= {reg7[(4'h9):(1'h1)]};
        end
      if ((reg18 ? reg30[(4'he):(4'hb)] : $unsigned((~|(^~(reg37 <<< reg31))))))
        begin
          reg40 <= reg32[(4'hc):(2'h3)];
        end
      else
        begin
          reg40 <= reg6[(2'h2):(1'h0)];
          reg41 <= $unsigned((~&reg7));
        end
    end
  assign wire42 = (+wire2[(4'hd):(3'h7)]);
  assign wire43 = $signed((reg40[(1'h0):(1'h0)] ?
                      wire0 : (~|$signed(reg16[(4'h9):(4'h8)]))));
  assign wire44 = $signed(reg34);
  always
    @(posedge clk) begin
      reg45 <= $unsigned((+$signed($signed($unsigned(reg38)))));
    end
  assign wire46 = (((reg10[(4'ha):(3'h7)] <<< {reg31,
                          (reg15 * reg26)}) && wire1) ?
                      {(~&reg29)} : (+$signed((wire44[(3'h6):(3'h5)] >> (reg31 ?
                          (7'h42) : reg21)))));
  assign wire47 = (!wire4);
endmodule
