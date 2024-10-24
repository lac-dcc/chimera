module top
#(parameter param33 = (({(~^{(7'h42)})} > (!((^~(7'h41)) ? ((8'hab) ? (8'haf) : (7'h40)) : ((8'ha6) < (8'ha8))))) <<< ({(((8'haf) ? (8'ha4) : (8'hb8)) ? ((7'h44) ? (7'h42) : (8'haa)) : ((8'ha6) && (8'hb8))), ((8'ha0) >> {(8'hb3)})} <= ((+(~^(8'hac))) ? {((7'h43) ? (8'hac) : (8'h9e)), ((8'hb6) ? (8'hb8) : (8'hb9))} : ((~^(8'hb0)) ? {(8'h9c)} : (&(8'h9c)))))), 
parameter param34 = (((({param33} ? (-param33) : param33) * (^((8'hb5) ? (8'ha9) : param33))) + param33) ? param33 : (8'h9f)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire32,
                 wire30,
                 wire29,
                 wire28,
                 reg31,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(3'h7):(1'h0)];
      if ($signed(wire0))
        begin
          reg5 <= (8'ha9);
          reg6 <= wire0[(2'h2):(2'h2)];
          reg7 <= $signed($signed($unsigned({reg4[(4'hc):(2'h3)]})));
          if ({{reg4[(4'hf):(4'hb)], (&$unsigned(((8'ha4) ? wire3 : reg5)))},
              wire0})
            begin
              reg8 <= {reg4, reg7};
              reg9 <= (~($signed({$signed(wire2)}) ?
                  $unsigned({(reg8 ?
                          wire0 : (8'ha0))}) : $unsigned({(8'hbb)})));
              reg10 <= wire2;
              reg11 <= wire1;
              reg12 <= $unsigned((^~$unsigned($unsigned((reg5 ?
                  reg4 : reg9)))));
            end
          else
            begin
              reg8 <= $signed($signed((!$unsigned(((8'h9c) ~^ reg6)))));
              reg9 <= reg4[(4'hf):(2'h2)];
              reg10 <= (|wire1[(1'h0):(1'h0)]);
              reg11 <= reg9[(2'h3):(2'h2)];
              reg12 <= ($unsigned($signed($unsigned({reg7}))) != ((|reg12) ?
                  (|wire0) : $signed(((wire0 + wire1) ?
                      $unsigned(wire3) : reg7[(1'h0):(1'h0)]))));
            end
        end
      else
        begin
          reg5 <= wire3;
          if ((($signed(reg6) ? (^~(~^reg9)) : reg8) ?
              ($signed((|(reg5 ? wire3 : reg12))) ?
                  $signed($signed(reg10[(3'h4):(1'h0)])) : ($signed(((8'hb9) ?
                      (8'hbf) : (8'h9d))) <<< (~&(~|(8'hbf))))) : $unsigned((reg8 ?
                  $unsigned((&reg11)) : (reg6[(4'hf):(3'h6)] ?
                      {wire3, wire0} : (reg5 || (8'hac)))))))
            begin
              reg6 <= $unsigned(($unsigned(wire0[(1'h0):(1'h0)]) ?
                  reg6[(4'hb):(4'ha)] : ($unsigned(reg6) ?
                      wire2[(1'h1):(1'h0)] : wire1[(3'h5):(2'h2)])));
              reg7 <= {reg12};
            end
          else
            begin
              reg6 <= reg7[(2'h2):(2'h2)];
              reg7 <= $signed(({reg11[(1'h1):(1'h0)]} ?
                  {reg6} : $unsigned(reg5[(2'h3):(1'h1)])));
              reg8 <= $signed(wire2);
              reg9 <= (~&wire3[(3'h4):(2'h2)]);
            end
          if ($signed((wire3[(1'h1):(1'h0)] ?
              $signed(reg11) : (wire3 ? wire2 : reg6[(4'he):(4'hc)]))))
            begin
              reg10 <= reg5[(1'h1):(1'h0)];
            end
          else
            begin
              reg10 <= (~(8'haa));
              reg11 <= $unsigned(wire3[(3'h4):(1'h0)]);
              reg12 <= $unsigned(reg5[(4'he):(4'h8)]);
              reg13 <= (reg4 ? $unsigned((8'hb0)) : wire0[(2'h3):(2'h3)]);
              reg14 <= ($signed((($unsigned(reg12) ?
                          (reg13 ? reg5 : reg4) : (reg13 & reg4)) ?
                      $signed(reg8) : $signed((reg9 & wire3)))) ?
                  (({(wire2 ? reg13 : reg5), wire0[(1'h1):(1'h1)]} ?
                          ($signed(reg13) >= (~reg4)) : ((wire1 < wire3) < $signed(wire3))) ?
                      reg8[(1'h0):(1'h0)] : (8'ha9)) : ({$unsigned({reg5})} ?
                      $unsigned($signed($signed(reg5))) : (reg6[(4'he):(4'hb)] ?
                          ($unsigned(wire0) == (!reg4)) : ((wire2 ?
                              reg5 : reg13) ~^ $signed(wire3)))));
            end
          if (wire2)
            begin
              reg15 <= reg7[(2'h2):(2'h2)];
              reg16 <= ($unsigned(reg5[(3'h7):(3'h5)]) ?
                  {wire1,
                      $signed(((reg12 == wire1) <= ((8'h9d) * reg12)))} : $unsigned(($signed($unsigned(reg9)) ^~ (((8'hb1) ?
                      reg5 : (8'ha5)) + (reg14 ? (8'hbd) : reg6)))));
              reg17 <= $unsigned((($signed(reg5) ?
                      (~|$unsigned(wire0)) : ((reg14 ? reg9 : wire0) ?
                          $signed((8'ha2)) : (8'ha5))) ?
                  $unsigned(wire3) : $unsigned($unsigned(((8'ha8) >>> reg15)))));
            end
          else
            begin
              reg15 <= ($signed((~|(reg11 ?
                      (reg10 ^~ wire1) : (reg5 || (8'hb2))))) ?
                  ((((8'hb9) ? {reg8, reg10} : wire3) ?
                          reg12[(3'h5):(1'h0)] : {$unsigned((8'hb7))}) ?
                      (reg10 ?
                          (((8'hbf) ^~ reg13) == $signed(reg16)) : reg4[(4'hf):(2'h2)]) : $unsigned(((reg16 != reg10) << $signed(reg8)))) : {$signed((reg4 >> $unsigned(reg7))),
                      wire2[(2'h3):(2'h2)]});
              reg16 <= ((^~$signed({(&reg17), $signed(wire1)})) ?
                  ($signed((+(reg8 ? reg12 : reg14))) ?
                      $signed(($unsigned(wire3) ?
                          (reg16 > reg11) : (reg11 + reg6))) : {$unsigned((reg14 < reg7)),
                          reg11[(2'h3):(1'h1)]}) : reg15[(4'ha):(4'h8)]);
              reg17 <= $unsigned((^$unsigned(((reg7 ?
                  reg7 : reg8) ^~ (reg8 <<< wire0)))));
            end
        end
      if (((((^wire2) ?
          $unsigned(reg8[(4'h9):(1'h1)]) : $signed((reg17 ?
              wire3 : reg12))) <= (+$unsigned($unsigned(reg10)))) ~^ ((+(~&(^reg10))) ^~ (&reg10))))
        begin
          if (reg6)
            begin
              reg18 <= reg9[(2'h3):(1'h1)];
              reg19 <= ({($signed(reg15) * (reg18 >> (reg10 ?
                      reg10 : reg17)))} >> $unsigned(reg18));
              reg20 <= reg19[(4'hb):(3'h5)];
            end
          else
            begin
              reg18 <= {(8'h9c)};
              reg19 <= reg5;
              reg20 <= (~{$signed(reg4[(4'hf):(4'hc)])});
              reg21 <= (^~$signed(reg16[(3'h4):(1'h0)]));
              reg22 <= wire2;
            end
          reg23 <= $unsigned($unsigned((~|($signed(reg6) ?
              {(8'ha8), reg8} : (-wire1)))));
        end
      else
        begin
          reg18 <= $unsigned($signed((($unsigned(wire2) ?
              $unsigned(reg6) : (reg9 ? reg21 : reg16)) + (!reg8))));
          reg19 <= {(~&reg11[(1'h0):(1'h0)])};
        end
      if ((~(&reg7[(2'h2):(1'h1)])))
        begin
          reg24 <= {({{{reg22}}} ~^ {(reg6[(5'h10):(4'h8)] ^ reg22),
                  $unsigned((reg23 ? reg22 : (8'hba)))}),
              (~|({$signed(reg15), $unsigned(reg15)} < (~$signed((8'hbf)))))};
          reg25 <= {(8'hab),
              ($signed(reg16[(4'ha):(1'h1)]) ?
                  reg15[(4'ha):(3'h5)] : $signed({$unsigned(reg5)}))};
          reg26 <= (|{reg4[(3'h7):(1'h1)], wire3});
          reg27 <= $signed($signed({{(~^reg7)}, reg6[(1'h0):(1'h0)]}));
        end
      else
        begin
          reg24 <= (reg18[(1'h1):(1'h0)] ?
              reg7 : $unsigned($signed($unsigned(reg17))));
        end
    end
  assign wire28 = $unsigned((~^(((~^reg17) ? (8'ha0) : reg21) ?
                      $unsigned(reg4) : (~^((8'ha1) < reg23)))));
  assign wire29 = (|reg23[(5'h11):(4'hc)]);
  assign wire30 = reg27;
  always
    @(posedge clk) begin
      reg31 <= (reg25[(2'h2):(1'h0)] ?
          (-(reg7[(1'h1):(1'h0)] ?
              (-(~reg19)) : (reg6 > reg7[(2'h2):(1'h1)]))) : ($signed((+$signed((8'ha7)))) ?
              (^(|$unsigned(reg25))) : wire28));
    end
  assign wire32 = (&reg26[(2'h2):(2'h2)]);
endmodule
