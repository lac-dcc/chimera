module top
#(parameter param41 = (|((((!(8'h9c)) ? {(8'hb4)} : ((8'had) == (8'ha8))) ? ({(8'ha6)} <<< ((8'hae) ? (8'hae) : (8'hab))) : ((^~(8'haa)) ? (|(8'hb4)) : ((8'hbb) > (8'hab)))) ^ (((8'hbf) >>> {(8'hbd), (8'ha7)}) <= (((8'h9f) - (8'hbf)) <<< ((8'ha8) - (8'h9f)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire7,
                 wire6,
                 wire5,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ($unsigned(($unsigned(wire4) && wire3)) ?
                     wire2[(2'h2):(2'h2)] : ($unsigned(((wire3 ?
                             wire1 : wire1) <<< wire2)) ?
                         $unsigned((~$unsigned(wire0))) : (($unsigned(wire2) ?
                             (8'h9d) : wire1) & (^(wire3 && wire4)))));
  assign wire6 = ($unsigned(($unsigned($signed(wire5)) >>> $unsigned({wire3}))) ?
                     ($unsigned(((-wire5) & (|wire2))) ?
                         wire4[(2'h3):(2'h3)] : wire2) : wire5[(2'h2):(2'h2)]);
  assign wire7 = wire1;
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire6);
      reg9 <= wire7[(4'h8):(2'h2)];
      if ($unsigned({(~|$signed(reg8))}))
        begin
          reg10 <= (-$signed(wire1));
          reg11 <= $unsigned(wire6[(5'h11):(3'h4)]);
          if ((({wire0,
                  (((8'hb7) ? wire5 : reg9) & (wire0 ?
                      reg11 : reg10))} || $unsigned({$unsigned((8'hac))})) ?
              (($unsigned($signed((8'hb6))) >= $unsigned($unsigned(wire0))) ?
                  (~wire6[(3'h5):(1'h0)]) : {$signed($signed(wire6)),
                      (^~$signed(reg9))}) : ((8'hbe) & ($signed($unsigned(wire7)) ?
                  (+$signed((8'hb9))) : (|((8'hbf) ? reg8 : reg10))))))
            begin
              reg12 <= $unsigned({$signed(((~|wire0) || (wire1 ?
                      wire5 : wire3)))});
              reg13 <= wire6;
              reg14 <= (+$signed((wire7[(3'h4):(1'h0)] == (^~(|(8'ha6))))));
            end
          else
            begin
              reg12 <= (($signed(wire2[(1'h1):(1'h1)]) ?
                  (7'h40) : ((!reg10) ?
                      ((wire6 | reg8) >>> $unsigned(reg14)) : {((8'hbb) ?
                              reg12 : reg10)})) || ($signed((!((8'hb0) ^~ wire1))) ?
                  (^{{reg10}, (8'hbd)}) : reg10));
            end
          reg15 <= (!$unsigned($unsigned({$unsigned((8'h9d)),
              $signed((7'h43))})));
          reg16 <= (wire6 ?
              {(+(wire1 * reg13[(4'h8):(3'h4)])),
                  $unsigned(reg12)} : wire0[(2'h2):(2'h2)]);
        end
      else
        begin
          reg10 <= (^~({$signed($unsigned(reg15)),
                  ($unsigned(wire5) ^~ (reg8 ? wire7 : reg14))} ?
              (~$signed((8'ha7))) : (($signed(reg16) ^~ wire1) * $signed((reg15 ^~ reg9)))));
          reg11 <= $signed((|($unsigned((wire7 ? wire6 : wire6)) ?
              (wire5[(2'h3):(2'h2)] ? reg10 : (+(8'hb2))) : $signed((wire3 ?
                  wire2 : wire4)))));
          if (($signed({(8'hbf)}) ? wire6 : ((8'h9c) != {(7'h41)})))
            begin
              reg12 <= reg12[(3'h4):(1'h1)];
              reg13 <= reg13[(3'h4):(1'h0)];
              reg14 <= (^~(+$signed($unsigned({wire3, reg9}))));
              reg15 <= ({$signed(wire6[(1'h1):(1'h0)]),
                      ($unsigned((wire0 - wire1)) >= $signed((8'hb2)))} ?
                  wire5[(3'h5):(3'h4)] : reg10[(3'h6):(2'h3)]);
            end
          else
            begin
              reg12 <= wire5;
            end
        end
    end
  assign wire17 = (reg10 >= reg8);
  assign wire18 = reg15[(2'h3):(1'h0)];
  assign wire19 = (({($signed(reg8) >= (|reg16)),
                      wire18} ^~ $unsigned($signed((~|wire0)))) ^ (($signed((wire18 == wire6)) ?
                          (reg13[(3'h5):(1'h0)] ^~ (^~reg9)) : {wire6[(2'h2):(1'h1)]}) ?
                      $unsigned($unsigned((reg11 | reg15))) : $unsigned((^reg13))));
  assign wire20 = $signed({wire1[(1'h0):(1'h0)], {{$signed(wire19)}}});
  always
    @(posedge clk) begin
      if (reg11[(4'h8):(3'h6)])
        begin
          reg21 <= wire20[(2'h3):(1'h1)];
          if (({{$unsigned($signed(reg15)), reg10[(1'h1):(1'h0)]},
              (reg10 >= wire7)} && ($unsigned((wire3[(4'ha):(3'h6)] ?
                  (wire5 ? (8'hac) : reg14) : reg15)) ?
              wire2[(1'h1):(1'h0)] : ((wire17[(2'h2):(1'h1)] ?
                      $signed(wire20) : ((8'ha4) | wire4)) ?
                  ((^reg12) ?
                      (wire3 ?
                          wire2 : wire1) : ((8'h9e) ~^ reg8)) : ((^wire18) * reg11[(4'ha):(4'ha)])))))
            begin
              reg22 <= (wire19[(4'hf):(1'h0)] ? $unsigned(reg10) : reg21);
              reg23 <= (-$unsigned((reg8 ? {(~^wire7)} : (+$signed(wire3)))));
              reg24 <= (wire17[(1'h0):(1'h0)] ?
                  (wire3 >> {(~^(wire6 + wire7)),
                      reg15[(3'h6):(3'h5)]}) : wire18);
            end
          else
            begin
              reg22 <= $signed({(~^$unsigned(reg15[(1'h1):(1'h1)]))});
              reg23 <= ((8'ha7) ^ reg11[(2'h3):(2'h2)]);
              reg24 <= reg12[(3'h4):(1'h1)];
              reg25 <= wire1[(3'h4):(3'h4)];
              reg26 <= reg12[(3'h4):(1'h1)];
            end
        end
      else
        begin
          reg21 <= (^~((~^reg21) == (8'hb1)));
          reg22 <= $signed((^~(~^$signed(wire5))));
          reg23 <= (reg10 ?
              ((~($signed((8'hbd)) != $signed((8'haf)))) << (~&($unsigned(wire19) ?
                  (reg10 ?
                      reg21 : reg25) : reg21[(4'hf):(4'hf)]))) : wire19[(3'h6):(3'h4)]);
          reg24 <= (^~(~&(-(~&(~^wire1)))));
        end
      if ($unsigned(wire6[(4'hb):(4'h8)]))
        begin
          reg27 <= $signed(wire5);
        end
      else
        begin
          if (wire7)
            begin
              reg27 <= wire0;
              reg28 <= $unsigned(wire3[(5'h11):(4'hb)]);
              reg29 <= reg24;
            end
          else
            begin
              reg27 <= (&(7'h41));
            end
          reg30 <= (~(+({{wire1}, reg25[(1'h0):(1'h0)]} < (reg25 << reg29))));
          reg31 <= (((~wire3[(3'h5):(3'h4)]) != $signed(({reg15} - {reg24,
              (8'hae)}))) || (((reg29 ~^ (+wire20)) ?
              wire18[(5'h10):(4'ha)] : $signed((reg9 ?
                  wire7 : wire20))) + {$signed((~^reg24)), (8'had)}));
          reg32 <= reg27;
        end
      reg33 <= (!$signed(((~^((8'ha3) ?
          reg31 : wire18)) << (~^$signed((8'ha2))))));
      reg34 <= reg8[(1'h0):(1'h0)];
      reg35 <= $unsigned(((|(8'ha0)) <= (|wire6)));
    end
  always
    @(posedge clk) begin
      reg36 <= reg33;
      reg37 <= $signed((~&{(reg9[(3'h4):(1'h1)] ?
              wire18[(1'h1):(1'h0)] : (wire17 ? wire4 : reg29))}));
      reg38 <= $signed(((^~($signed(reg11) ?
          reg34 : reg11[(4'ha):(1'h0)])) | reg21));
    end
  assign wire39 = (8'hb3);
  assign wire40 = ({$unsigned(reg32[(3'h6):(2'h2)])} <<< {$signed(wire2[(2'h3):(1'h0)]),
                      reg13});
endmodule
