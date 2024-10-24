module top
#(parameter param38 = ((({(7'h42)} ? (~(+(8'ha0))) : (((8'haa) ? (8'hb7) : (8'hac)) ? (~(8'h9c)) : ((8'hbf) ? (8'hb7) : (8'hb8)))) ? (~(((7'h44) << (7'h41)) ? ((8'hbd) << (8'hb3)) : (^(8'hbb)))) : (&{((8'hb2) ^ (8'ha5)), (8'hb5)})) != (~|((~&(^(7'h42))) ? (((8'haa) ? (8'hae) : (8'h9f)) && ((8'ha7) ? (8'hb7) : (8'hbb))) : (((8'hb6) | (8'hab)) - ((8'hb5) ? (8'hae) : (8'h9e)))))), 
parameter param39 = ((((param38 ? (^param38) : (~|param38)) < ((param38 ? param38 : param38) ? (param38 * param38) : (param38 - param38))) & (param38 ? param38 : {((8'ha1) >>> param38)})) ? (^~(param38 ? (8'hac) : ((8'ha0) > ((8'ha3) ~^ param38)))) : ((((param38 ? (8'hbf) : param38) ? param38 : (!(8'hb8))) + {(^param38)}) * ((!((8'ha7) ? param38 : param38)) || ((param38 ? param38 : (8'hab)) * param38)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire4,
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
  assign wire4 = $signed(((wire0 & ((wire3 ? (8'ha3) : wire2) > wire2)) ?
                     wire0 : $unsigned($unsigned($unsigned(wire0)))));
  always
    @(posedge clk) begin
      if ((+((wire2[(3'h4):(1'h0)] ?
          ((wire3 | wire2) ? wire0[(4'hc):(4'hb)] : $signed(wire3)) : ((wire1 ?
              wire1 : wire4) ^~ $unsigned(wire0))) <<< $unsigned($signed($signed(wire2))))))
        begin
          reg5 <= wire3;
          reg6 <= $unsigned(($signed(wire4) ?
              reg5 : $signed($signed((wire3 ? reg5 : wire0)))));
          if (wire3)
            begin
              reg7 <= (($unsigned(($signed(reg6) << {wire1})) ?
                      ((-$signed((8'ha6))) >= $signed(reg5[(2'h2):(1'h1)])) : $signed($signed($signed(reg5)))) ?
                  $signed({$unsigned(wire3[(2'h2):(2'h2)]),
                      reg6}) : $unsigned($signed((^((8'hb2) ? reg6 : wire4)))));
              reg8 <= ((|($unsigned(wire0) < wire2[(1'h1):(1'h1)])) ?
                  (((+(~|wire3)) ^ $signed(wire2[(1'h0):(1'h0)])) ?
                      ($signed(reg5) ?
                          (wire0[(2'h3):(1'h1)] ?
                              {(8'hb6),
                                  wire3} : reg6) : wire0[(4'ha):(3'h7)]) : (~^($signed(wire1) && {wire2}))) : $unsigned(wire3[(2'h2):(1'h0)]));
              reg9 <= reg8[(1'h1):(1'h0)];
              reg10 <= wire0[(5'h13):(4'hb)];
            end
          else
            begin
              reg7 <= (8'hb0);
              reg8 <= wire0[(5'h10):(4'ha)];
            end
        end
      else
        begin
          reg5 <= reg8[(4'h9):(3'h4)];
          reg6 <= reg10[(3'h7):(2'h3)];
          reg7 <= reg9[(3'h5):(1'h1)];
          reg8 <= wire1;
        end
      if (wire3[(2'h2):(1'h0)])
        begin
          reg11 <= reg10;
          reg12 <= $unsigned(reg7);
        end
      else
        begin
          reg11 <= $signed((reg10 ?
              (wire1 ^ ((reg8 && (8'hbf)) ?
                  ((7'h40) + wire0) : (!reg8))) : (-$unsigned(wire1[(4'he):(4'he)]))));
        end
      reg13 <= reg7;
      reg14 <= ($unsigned(($signed({wire1,
          wire4}) >>> reg7[(3'h4):(2'h2)])) || $signed(((reg12[(2'h3):(1'h1)] == ((8'ha4) <<< reg5)) ?
          ({reg11, wire4} && $unsigned(reg12)) : (|(wire2 ? reg12 : wire2)))));
      if ((|reg14[(1'h1):(1'h1)]))
        begin
          if ((($signed(((wire4 ? reg8 : wire2) ?
              (reg9 <= wire2) : (wire3 ~^ (8'hac)))) >>> (reg13 ^ {(reg14 ?
                  wire4 : (8'haa))})) <= ((~($signed((8'hb1)) ^~ (~&reg14))) == $signed((8'ha2)))))
            begin
              reg15 <= $signed(reg11[(3'h4):(2'h2)]);
              reg16 <= $signed(reg10);
              reg17 <= (7'h44);
              reg18 <= wire0;
            end
          else
            begin
              reg15 <= $signed({$signed($unsigned(reg12[(2'h3):(2'h2)])),
                  $unsigned(reg10[(4'h9):(4'h8)])});
              reg16 <= reg17;
              reg17 <= $signed((reg7[(4'hd):(3'h5)] ^ {reg13, (^~{(8'ha2)})}));
              reg18 <= ({$unsigned(reg6[(3'h5):(3'h4)]),
                      ((+(reg5 > reg9)) ?
                          $unsigned($unsigned(reg15)) : reg5[(4'hb):(3'h4)])} ?
                  (~reg13[(5'h10):(4'hc)]) : $unsigned(($signed($unsigned(reg14)) > ((reg16 ?
                          reg12 : wire4) ?
                      $signed(reg7) : $unsigned((8'hba))))));
            end
          if ((8'hbc))
            begin
              reg19 <= (~|$unsigned($signed(wire0)));
              reg20 <= $unsigned((~&(~^$unsigned($signed(reg8)))));
              reg21 <= $unsigned(wire4);
            end
          else
            begin
              reg19 <= ((~(({reg21, reg21} || $signed(wire0)) != (reg21 ?
                      wire0[(4'hd):(1'h1)] : reg13[(4'hd):(4'h8)]))) ?
                  reg15[(1'h1):(1'h1)] : ((~&(!wire4[(2'h2):(2'h2)])) ?
                      (reg15[(2'h2):(1'h0)] < ($signed(wire4) ?
                          (reg17 ? wire3 : (8'h9d)) : reg14)) : reg8));
              reg20 <= reg20[(2'h3):(1'h1)];
              reg21 <= (^~$signed(($signed({(8'ha0), (8'h9e)}) ?
                  (reg19[(3'h4):(2'h2)] ?
                      $unsigned(reg15) : $signed(wire4)) : reg5[(4'hc):(3'h4)])));
              reg22 <= (8'hbc);
            end
          if (reg9)
            begin
              reg23 <= (reg12 ^~ ((((reg15 ? reg5 : reg6) ?
                          (reg19 + reg12) : (7'h44)) ?
                      wire3[(2'h2):(1'h0)] : $signed((reg12 * reg20))) ?
                  wire2[(1'h1):(1'h1)] : $signed($signed((~^reg21)))));
              reg24 <= reg8;
              reg25 <= $unsigned(((8'had) - ($unsigned($signed(reg12)) ?
                  (reg20 ? reg5 : $unsigned(reg18)) : (|$unsigned((8'ha3))))));
              reg26 <= (8'hba);
            end
          else
            begin
              reg23 <= reg16[(5'h12):(3'h4)];
            end
          reg27 <= (~&$unsigned(wire0));
          reg28 <= (~|(+(({reg26} ?
              (reg10 ? reg18 : reg9) : $signed(reg11)) >>> reg20)));
        end
      else
        begin
          reg15 <= (reg14 ?
              {{(((8'ha8) ~^ wire4) ? reg27[(4'hc):(3'h5)] : reg13),
                      wire0[(3'h6):(2'h3)]}} : (reg18 ~^ {$signed((wire2 ?
                      reg7 : reg27)),
                  (reg27[(1'h1):(1'h0)] ? $unsigned(reg11) : (8'ha9))}));
          if ($unsigned((~|reg25)))
            begin
              reg16 <= $signed($signed((+reg13[(4'h8):(1'h1)])));
              reg17 <= reg18[(4'hb):(2'h3)];
              reg18 <= $unsigned($unsigned((~|($unsigned(reg14) ?
                  (~&reg12) : $unsigned((8'hb1))))));
            end
          else
            begin
              reg16 <= $unsigned($signed(reg21));
              reg17 <= reg28[(1'h0):(1'h0)];
            end
        end
    end
  assign wire29 = {reg10[(3'h6):(2'h2)], reg6[(3'h5):(1'h0)]};
  assign wire30 = (!(|({(reg9 ? wire4 : wire3)} ^~ reg19[(3'h5):(3'h4)])));
  assign wire31 = (^~wire0);
  assign wire32 = ($signed(reg11[(2'h3):(1'h1)]) ?
                      ((reg7 >>> (wire1[(2'h3):(1'h1)] || (reg21 ?
                          reg28 : reg22))) ^~ $signed(((reg24 + reg22) ?
                          (8'ha5) : $signed(reg14)))) : ((~^$unsigned((!wire31))) ?
                          ({reg25[(3'h6):(2'h2)], {reg7}} ?
                              ((reg25 ? wire1 : wire3) ?
                                  reg23 : (reg20 <<< reg22)) : $unsigned((wire3 + (7'h44)))) : (+((~(7'h43)) < wire30))));
  assign wire33 = (^($signed($signed($signed((8'hbf)))) > wire32[(1'h0):(1'h0)]));
  assign wire34 = $unsigned({$unsigned($signed(reg25))});
  assign wire35 = $unsigned(wire3);
  assign wire36 = (^((reg25[(3'h5):(1'h0)] ?
                          (!reg10) : ((reg11 ? reg7 : wire1) ?
                              reg27 : (|wire33))) ?
                      reg22 : reg19));
  assign wire37 = reg9;
endmodule
