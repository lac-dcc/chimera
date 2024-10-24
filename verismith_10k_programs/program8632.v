module top
#(parameter param38 = ({(~&(|((8'h9d) ? (8'ha0) : (8'ha8)))), ((~((8'haa) ? (8'hac) : (8'h9f))) ? (~^((8'hb3) ? (8'hba) : (8'hbb))) : ((+(8'hbc)) | (~&(7'h42))))} >> ((-((|(8'h9d)) & (&(7'h40)))) ^ ((((8'hb3) | (8'ha2)) && (+(8'had))) != ({(8'h9e)} ? (~^(7'h42)) : (+(8'hb5)))))), 
parameter param39 = {(~(({param38} ? ((8'hb3) == (8'haf)) : ((8'h9e) ? param38 : param38)) <= param38))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire37,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire6,
                 wire5,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire4[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg7 <= $signed({{$unsigned(wire2)}});
      if ($unsigned($unsigned(wire4)))
        begin
          reg8 <= (~|$signed($unsigned({((8'h9f) ? wire4 : wire4),
              (wire6 ? wire2 : wire0)})));
          if (wire4[(4'hd):(4'h9)])
            begin
              reg9 <= ({((7'h40) ? $signed((wire3 <<< wire4)) : {reg8}),
                  (((wire4 != wire1) ? wire6[(2'h2):(1'h1)] : $signed(reg8)) ?
                      $unsigned($signed(wire5)) : (^~(-(8'hac))))} ^ (wire0[(4'he):(3'h6)] ^ wire5[(2'h2):(2'h2)]));
            end
          else
            begin
              reg9 <= $unsigned(wire1[(1'h0):(1'h0)]);
              reg10 <= $signed($unsigned({(~^(reg8 ? wire0 : wire6)),
                  (+wire0[(3'h6):(1'h0)])}));
              reg11 <= {((wire2 ?
                      (8'hbd) : $unsigned(wire5[(1'h1):(1'h1)])) ^ (((reg10 ^~ reg7) && $unsigned(wire1)) ?
                      (!(-wire3)) : $unsigned(reg8))),
                  (!$signed((^~(reg8 >= wire0))))};
              reg12 <= $signed(wire6);
            end
          reg13 <= (+$signed($signed((wire5[(1'h0):(1'h0)] ?
              reg9 : $signed(wire0)))));
        end
      else
        begin
          reg8 <= $signed((^~$signed((reg13 ?
              (wire5 ? (8'hbf) : (7'h41)) : (wire2 ? reg9 : reg9)))));
        end
      reg14 <= ((8'hb7) <<< reg7);
      reg15 <= $signed($signed((+wire2)));
    end
  assign wire16 = (((^~$signed({reg13})) ?
                      wire0 : (~|$signed((reg15 >> reg11)))) == {reg10[(3'h4):(1'h0)]});
  assign wire17 = $unsigned(reg7);
  assign wire18 = {(($unsigned($signed(wire0)) ^ {wire0[(4'ha):(3'h7)]}) ?
                          wire1 : ({$signed(wire1)} ?
                              (|$unsigned(reg9)) : (reg9 ? (&wire1) : wire6))),
                      (-(!$signed({wire3})))};
  assign wire19 = (wire1 ? wire18[(1'h0):(1'h0)] : wire3);
  assign wire20 = (!$unsigned(reg15));
  always
    @(posedge clk) begin
      if ((7'h43))
        begin
          if ($signed({$unsigned($signed(wire17))}))
            begin
              reg21 <= (+($signed($unsigned((~&wire19))) < (&$unsigned(wire4[(3'h4):(1'h1)]))));
              reg22 <= (^~(((-(wire18 >>> (8'ha2))) + $signed($unsigned(reg13))) ?
                  {wire1, ($unsigned(reg11) != (8'ha6))} : reg21));
              reg23 <= (wire18 ?
                  wire5 : (~|$signed(({reg12} ?
                      $unsigned((8'ha1)) : (-wire0)))));
              reg24 <= ($signed($signed(wire16)) ?
                  (7'h42) : ($signed((~&{reg23})) ?
                      (~^$unsigned((8'ha8))) : reg8));
            end
          else
            begin
              reg21 <= wire6;
              reg22 <= {($unsigned((^~(reg22 - reg11))) && wire17)};
              reg23 <= $unsigned($signed(($signed($signed(reg12)) - (!(8'h9d)))));
              reg24 <= wire18[(4'hc):(4'h9)];
            end
          reg25 <= (~reg9[(1'h0):(1'h0)]);
        end
      else
        begin
          reg21 <= (8'ha8);
          reg22 <= {wire3[(1'h1):(1'h1)]};
        end
      reg26 <= wire2[(4'hb):(3'h6)];
      reg27 <= (~&{(~&reg13)});
      reg28 <= $unsigned($unsigned({$unsigned((wire20 > wire19)), wire19}));
      if ((wire20 & reg28[(1'h1):(1'h1)]))
        begin
          reg29 <= (~reg12[(3'h6):(1'h0)]);
          if (reg10[(4'ha):(4'ha)])
            begin
              reg30 <= $unsigned($signed((wire20 ?
                  (((8'hb0) == reg24) ?
                      $signed((8'ha2)) : (reg26 ?
                          reg24 : wire17)) : {(8'h9c)})));
              reg31 <= (~$unsigned((($signed(reg11) ?
                  $unsigned(reg24) : wire19[(3'h6):(1'h0)]) ~^ {$unsigned(reg12),
                  (wire18 << (8'hb2))})));
            end
          else
            begin
              reg30 <= $signed(wire3[(1'h0):(1'h0)]);
            end
          if (reg25)
            begin
              reg32 <= wire16[(2'h3):(2'h2)];
              reg33 <= (~|wire16[(4'h8):(3'h5)]);
              reg34 <= reg31;
            end
          else
            begin
              reg32 <= reg22;
              reg33 <= reg8;
              reg34 <= ($signed($unsigned(reg28)) ~^ (+(wire19[(3'h4):(2'h3)] > $signed((8'hbe)))));
              reg35 <= $unsigned((|(^reg14[(4'h9):(2'h3)])));
              reg36 <= $unsigned({reg9, $unsigned($signed((~^wire2)))});
            end
        end
      else
        begin
          reg29 <= (-(($unsigned((reg11 | (8'hb1))) ?
                  ((wire4 ? reg12 : reg24) ?
                      wire4[(4'he):(2'h2)] : $unsigned(reg26)) : reg30[(1'h1):(1'h0)]) ?
              $signed($unsigned($unsigned(wire0))) : ((~^(reg36 ?
                  reg28 : reg15)) <<< wire0)));
          reg30 <= (~|{$unsigned((wire18[(2'h3):(2'h2)] || (reg12 ?
                  wire4 : reg15))),
              {$signed($signed(reg13)), ($unsigned(reg29) ? wire2 : reg35)}});
        end
    end
  assign wire37 = reg9;
endmodule
