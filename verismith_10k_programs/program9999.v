module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire12,
                 wire11,
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
      reg4 <= $unsigned(($unsigned(wire3) ?
          wire1 : $unsigned(wire2[(3'h7):(3'h7)])));
      if ($signed(((((wire3 ? wire3 : wire2) ?
              wire0[(4'ha):(1'h0)] : (^~wire0)) ?
          ({wire0, wire0} * (reg4 ?
              wire1 : wire2)) : (wire2[(4'hb):(4'ha)] - wire0)) >= wire1[(4'hd):(4'ha)])))
        begin
          reg5 <= $unsigned($unsigned((~{(wire2 == wire1), {wire0}})));
          if (wire1)
            begin
              reg6 <= reg5;
              reg7 <= $unsigned(wire0);
              reg8 <= $unsigned({$unsigned($unsigned($unsigned(reg7)))});
              reg9 <= (-wire3);
              reg10 <= $unsigned(((8'hac) + (($signed(wire1) >>> (wire2 ?
                  (8'hb5) : reg7)) >= {(wire1 ? reg6 : (8'hbf)), wire0})));
            end
          else
            begin
              reg6 <= $unsigned($signed(($signed((reg8 | wire0)) ?
                  (reg5 ?
                      (reg8 | reg5) : $unsigned(wire1)) : $signed($unsigned(reg4)))));
              reg7 <= (-reg7);
              reg8 <= $signed((wire0 == (^reg8[(3'h6):(3'h4)])));
              reg9 <= {$unsigned(reg5[(5'h12):(2'h2)]), reg7};
            end
        end
      else
        begin
          reg5 <= ((~&$unsigned($unsigned((reg9 != wire2)))) || $signed(($signed((wire1 && reg4)) != wire3)));
          reg6 <= $unsigned(reg9);
          reg7 <= $unsigned($signed((reg6[(3'h5):(1'h0)] ~^ wire1[(1'h1):(1'h1)])));
        end
    end
  assign wire11 = (reg9[(5'h10):(1'h0)] ? reg4 : (~wire2));
  assign wire12 = reg8;
  always
    @(posedge clk) begin
      reg13 <= (~&$signed($unsigned({(~wire0), $unsigned(reg6)})));
      if ((~^(&((^~(wire1 <= reg5)) ?
          (|reg13[(2'h2):(1'h0)]) : {(~|wire3), $signed(reg13)}))))
        begin
          reg14 <= reg4[(4'ha):(3'h7)];
          if (($signed((($signed(reg13) ? $signed(reg4) : (!reg6)) ?
              $signed((wire3 && reg9)) : ($signed(wire2) == wire0))) && $unsigned(((~^(reg10 ^~ reg5)) ?
              $signed(wire1[(1'h0):(1'h0)]) : (~&wire11[(4'he):(4'he)])))))
            begin
              reg15 <= (((wire1 ?
                      (~(^~(8'haf))) : {wire3,
                          (~reg4)}) != $unsigned((~^(wire11 ?
                      (8'haf) : (8'h9d))))) ?
                  {wire11} : wire11[(1'h0):(1'h0)]);
              reg16 <= (+reg8);
              reg17 <= (reg13 ? reg13 : wire1[(4'hb):(1'h0)]);
              reg18 <= ((|(reg5 << $unsigned(wire3))) - $signed($unsigned((-reg7[(4'hc):(2'h3)]))));
              reg19 <= ((reg14 ?
                      reg17 : ($unsigned($signed(wire3)) ?
                          ({reg9, (8'hb8)} >> $signed(reg8)) : reg15)) ?
                  wire12 : (^$unsigned($signed($unsigned(reg17)))));
            end
          else
            begin
              reg15 <= $signed(wire12[(2'h3):(2'h3)]);
              reg16 <= reg13[(1'h0):(1'h0)];
              reg17 <= reg8[(2'h2):(1'h0)];
              reg18 <= ((&$unsigned(({reg18, reg10} ?
                      (wire3 ? wire0 : (8'ha0)) : (wire1 ? wire1 : reg4)))) ?
                  ($signed($unsigned(wire0[(2'h3):(1'h0)])) * ((wire1[(4'he):(1'h1)] ?
                      $unsigned(reg9) : $signed(wire12)) << reg6[(1'h0):(1'h0)])) : {$signed({(reg6 ?
                              (8'ha2) : wire12),
                          (reg14 ^~ reg8)})});
              reg19 <= $unsigned(($unsigned($signed((~|wire2))) || (reg17 ^ (reg13 > reg13))));
            end
          reg20 <= reg10[(4'he):(2'h2)];
          reg21 <= ({wire2[(3'h4):(3'h4)]} & (!(($unsigned(reg16) ?
              (wire1 ? reg5 : (8'hbb)) : (~reg16)) ^~ reg9)));
        end
      else
        begin
          if ((-reg15))
            begin
              reg14 <= ($signed({$unsigned(reg9[(5'h13):(4'h9)]),
                  reg18[(1'h1):(1'h1)]}) & (reg6 ?
                  reg20 : $signed(($unsigned(reg4) ~^ ((7'h43) >>> reg17)))));
              reg15 <= {$signed((~^($signed(reg13) <= ((8'haf) * reg14))))};
            end
          else
            begin
              reg14 <= {(^~(reg9 | reg6[(4'ha):(1'h0)]))};
              reg15 <= $signed($signed((+$signed(reg6))));
              reg16 <= {$unsigned($signed($unsigned(reg17)))};
              reg17 <= $signed(wire1[(5'h10):(2'h2)]);
            end
          reg18 <= $signed((~&($unsigned($unsigned(wire2)) ^~ ((reg20 ?
                  (8'hab) : (8'hb0)) ?
              $signed(reg18) : (reg15 ^ wire0)))));
        end
      reg22 <= (($unsigned($unsigned(wire1)) ?
          {reg21, reg10[(4'hf):(1'h1)]} : reg4) ^ reg16);
    end
  assign wire23 = (~|$unsigned(reg21));
  assign wire24 = $unsigned(($unsigned($signed(reg16)) || (wire1[(5'h11):(5'h10)] ?
                      reg13[(1'h1):(1'h0)] : ($signed(reg6) ?
                          (~&reg7) : wire3))));
  always
    @(posedge clk) begin
      if ((~|reg6))
        begin
          if (wire2[(4'hb):(3'h6)])
            begin
              reg25 <= (-wire24);
              reg26 <= $signed({reg5, ((|$unsigned(wire1)) != reg6)});
            end
          else
            begin
              reg25 <= $unsigned((^~{({reg21} <<< (~|wire23))}));
              reg26 <= $signed(reg20);
            end
          if ((8'ha8))
            begin
              reg27 <= ($signed(reg4) ?
                  (reg15[(1'h0):(1'h0)] * $signed({(~&reg22)})) : reg25[(2'h2):(1'h0)]);
              reg28 <= (!((~&(~$signed(reg18))) <<< reg15[(1'h0):(1'h0)]));
            end
          else
            begin
              reg27 <= (reg21[(3'h7):(3'h5)] != ($unsigned((-((8'hb1) ?
                  (8'ha8) : reg27))) == reg9));
              reg28 <= ($signed((^~(+$unsigned(reg5)))) >>> reg5);
              reg29 <= $signed($signed((-$signed((~^reg4)))));
            end
        end
      else
        begin
          reg25 <= {(wire12 << $signed((+(8'hb3)))),
              (+$signed(($unsigned((8'hb0)) * (wire2 ? reg18 : reg5))))};
          if (wire12[(1'h1):(1'h0)])
            begin
              reg26 <= $unsigned((&(reg20 ~^ wire23[(1'h0):(1'h0)])));
              reg27 <= reg7;
            end
          else
            begin
              reg26 <= $signed($signed($signed((8'h9e))));
              reg27 <= wire3;
              reg28 <= $unsigned($signed({$unsigned({reg26})}));
              reg29 <= $unsigned((8'ha5));
              reg30 <= $unsigned(reg10);
            end
          reg31 <= wire0[(4'h9):(2'h2)];
          reg32 <= (8'ha9);
          reg33 <= (reg29 && (reg30 != $signed({$signed(reg26),
              ((8'ha6) < reg29)})));
        end
      reg34 <= {(reg17[(3'h4):(2'h2)] >>> (((^~wire0) ?
                  (wire24 ? reg10 : wire12) : (8'ha2)) ?
              (reg31[(1'h0):(1'h0)] ? reg32 : wire2[(3'h7):(3'h7)]) : ((reg9 ?
                      reg28 : wire11) ?
                  reg21 : {wire2, wire1})))};
    end
endmodule
