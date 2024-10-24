module top
#(parameter param52 = (!{({((8'h9f) >>> (8'hbd))} ? (((8'ha9) ? (8'ha5) : (8'hbd)) - (&(8'hbd))) : (((7'h41) ? (8'hbf) : (8'hba)) || ((8'ha8) ? (7'h40) : (7'h40)))), (8'ha5)}), 
parameter param53 = (({param52, (^param52)} | {(~&{param52})}) ? ((~((param52 ^~ param52) ^~ param52)) || ((8'hbe) ? param52 : ((param52 ? (8'haf) : param52) ? param52 : (param52 ? param52 : param52)))) : (^(param52 ? (param52 ? param52 : param52) : param52))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg51,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
  always
    @(posedge clk) begin
      reg5 <= ($unsigned({(~$signed(wire1))}) ^~ $signed(wire3));
      reg6 <= wire0[(1'h0):(1'h0)];
      reg7 <= wire0;
    end
  always
    @(posedge clk) begin
      if ((^wire2[(3'h4):(1'h0)]))
        begin
          reg8 <= ((((8'hac) ? reg7[(3'h4):(3'h4)] : {(wire4 << wire2)}) ?
              wire4[(4'h8):(2'h2)] : {((!wire4) <<< $signed((8'hba))),
                  $signed((wire1 ?
                      wire2 : wire0))}) >= {$unsigned(wire0[(3'h4):(2'h2)]),
              ((reg5[(5'h11):(3'h7)] && $signed(wire1)) ?
                  $unsigned($signed(wire3)) : ($unsigned(wire1) <<< $signed(reg7)))});
          reg9 <= {$signed(((wire1[(3'h6):(1'h1)] ?
                      (wire2 ? wire2 : reg6) : (^reg6)) ?
                  wire3[(2'h2):(1'h1)] : reg5)),
              (8'h9d)};
          reg10 <= (($unsigned(((|wire3) ?
              $unsigned(wire0) : (wire3 > reg9))) ^ $signed((~(wire3 && wire4)))) >> $signed((|$unsigned(reg6))));
          reg11 <= $signed($signed((wire1 ?
              wire0 : $signed(reg10[(4'h9):(3'h6)]))));
        end
      else
        begin
          reg8 <= (((((!wire4) <= (reg5 <= reg9)) & $signed($unsigned((8'hb3)))) ?
                  wire4 : reg7[(3'h5):(1'h0)]) ?
              wire3[(2'h3):(1'h0)] : (wire4[(1'h0):(1'h0)] ?
                  reg5[(3'h6):(3'h4)] : ((^reg6) ?
                      (~(reg5 - (8'hac))) : {reg8[(1'h0):(1'h0)],
                          reg5[(4'h8):(4'h8)]})));
        end
      reg12 <= wire3[(2'h3):(2'h2)];
      reg13 <= reg6;
      reg14 <= reg10;
    end
  assign wire15 = $signed((reg11[(2'h2):(1'h0)] && (~|((~|reg7) > ((8'hba) << reg8)))));
  assign wire16 = ((wire3 <= wire0) == {(~^(-(reg11 ? reg7 : wire3))),
                      $unsigned(reg13)});
  assign wire17 = (reg9 & $unsigned($signed((^$unsigned(wire16)))));
  assign wire18 = ($unsigned($signed(reg13[(3'h4):(2'h3)])) ?
                      (reg9[(1'h1):(1'h1)] > reg14) : (&$unsigned(reg10)));
  always
    @(posedge clk) begin
      if ((!$unsigned($signed(reg11))))
        begin
          reg19 <= $signed($unsigned({wire16[(4'ha):(2'h3)], reg6}));
          if (reg7)
            begin
              reg20 <= ($unsigned($unsigned({(~&wire1), reg11})) ?
                  $signed(wire17) : reg11[(3'h4):(1'h0)]);
            end
          else
            begin
              reg20 <= reg9;
            end
          reg21 <= $signed(wire18[(1'h1):(1'h1)]);
          if (reg7[(3'h6):(1'h1)])
            begin
              reg22 <= $unsigned((7'h42));
              reg23 <= $unsigned(((~{(^reg14), reg14}) ?
                  reg20 : {wire16[(4'hf):(1'h0)],
                      (reg22[(1'h1):(1'h1)] ? (&reg6) : $signed(reg22))}));
              reg24 <= ($signed(((&reg20[(4'hb):(4'h9)]) ?
                      {(wire1 << (8'ha4))} : (!(reg13 >= reg6)))) ?
                  (~^($signed((wire4 ?
                      reg22 : (8'hbd))) * ($unsigned(reg7) ^~ reg22))) : (((!$unsigned(reg19)) < $unsigned(reg23)) | $unsigned({$unsigned(wire17)})));
              reg25 <= (reg14[(3'h6):(1'h1)] ?
                  reg9 : $unsigned($unsigned({(reg11 ? reg11 : reg12),
                      ((8'h9f) >> wire18)})));
              reg26 <= reg11[(3'h5):(2'h3)];
            end
          else
            begin
              reg22 <= (&(8'ha8));
              reg23 <= $signed((wire3 << reg7));
              reg24 <= $unsigned(reg9[(3'h4):(1'h1)]);
              reg25 <= wire3;
              reg26 <= (+{((~&((8'h9f) ^ reg9)) != (~&$signed(reg21))),
                  $signed((8'had))});
            end
        end
      else
        begin
          reg19 <= ($unsigned(reg21[(3'h7):(3'h6)]) ?
              $signed(wire1) : $signed((wire0[(4'hb):(1'h0)] - (8'ha9))));
        end
      reg27 <= wire17;
    end
  always
    @(posedge clk) begin
      if (reg24)
        begin
          reg28 <= $unsigned($unsigned($unsigned(reg10[(1'h1):(1'h1)])));
          if (((~|wire17[(1'h1):(1'h0)]) == $signed($unsigned({(~reg5),
              (&reg7)}))))
            begin
              reg29 <= ($signed((wire3 * $unsigned($unsigned(reg23)))) < (+$signed(((reg27 ^~ wire15) <= wire1[(3'h6):(3'h4)]))));
              reg30 <= $unsigned(reg9);
              reg31 <= reg10;
              reg32 <= wire18;
            end
          else
            begin
              reg29 <= reg20[(4'hd):(3'h4)];
              reg30 <= wire3[(2'h3):(2'h3)];
              reg31 <= reg6[(4'hd):(4'hb)];
              reg32 <= (8'ha7);
            end
          reg33 <= (&(reg25 <= reg21[(3'h7):(3'h5)]));
          if ($unsigned($signed((reg29[(3'h4):(1'h1)] ?
              ($unsigned(reg8) || (8'hae)) : reg5[(4'hc):(4'hc)]))))
            begin
              reg34 <= (wire3 & ({$unsigned(reg14)} <<< (~&{$unsigned(reg8)})));
              reg35 <= wire16[(3'h7):(2'h3)];
            end
          else
            begin
              reg34 <= ($signed((8'ha8)) << (wire17 - {(&(reg23 ?
                      (8'h9c) : wire1)),
                  $unsigned(reg10[(4'h8):(3'h7)])}));
              reg35 <= ({($unsigned({(8'had)}) || $signed($unsigned(reg14))),
                  (wire17[(1'h1):(1'h1)] ?
                      ((reg9 >= reg19) ?
                          $signed(reg6) : $signed((7'h42))) : (wire0 || {(8'hb4)}))} + (+{$signed((^~reg25)),
                  ($signed(wire0) ? (^~reg27) : {reg24})}));
              reg36 <= (^$unsigned((((8'ha8) ? reg5 : (!reg12)) ?
                  ((reg23 != reg22) ? {reg23} : reg31) : ($signed(wire17) ?
                      wire1[(2'h2):(1'h0)] : ((8'hb3) > reg30)))));
              reg37 <= (8'hbc);
              reg38 <= ((8'hb4) ?
                  reg19[(1'h0):(1'h0)] : $signed($unsigned((~$signed(reg35)))));
            end
          reg39 <= wire16;
        end
      else
        begin
          reg28 <= {$unsigned(reg9),
              {(!((reg25 == reg34) << (reg23 >= reg20)))}};
          reg29 <= reg34;
        end
      reg40 <= wire4;
      if ((&reg25[(1'h0):(1'h0)]))
        begin
          reg41 <= ($signed($unsigned(wire18[(2'h2):(2'h2)])) ?
              $unsigned((~$unsigned(reg23))) : reg21[(3'h7):(2'h3)]);
        end
      else
        begin
          reg41 <= reg5;
          reg42 <= (|{(($unsigned((7'h40)) != (reg19 >>> reg22)) ?
                  (reg39 ? (~|wire18) : (reg19 >> reg24)) : reg12)});
          reg43 <= $unsigned((+$signed(reg31[(3'h7):(2'h3)])));
          reg44 <= $signed(((-$unsigned((reg14 | reg20))) & {(~&$unsigned(reg21)),
              ($signed(reg38) ? reg34[(4'h8):(2'h2)] : $unsigned(reg8))}));
          reg45 <= reg33[(1'h1):(1'h0)];
        end
      reg46 <= (|$unsigned(($unsigned($unsigned(wire15)) | wire3[(3'h5):(3'h5)])));
      reg47 <= (&reg35[(4'hc):(4'h8)]);
    end
  assign wire48 = reg5[(3'h7):(3'h7)];
  assign wire49 = (~&{$signed(reg45[(3'h5):(1'h0)]),
                      {reg5[(5'h14):(4'h9)], {wire4}}});
  assign wire50 = reg47[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg51 <= (|({(8'hab)} > reg19));
    end
endmodule
