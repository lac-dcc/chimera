module top
#(parameter param31 = ((((+(8'h9d)) ? (~&{(7'h42), (8'ha6)}) : ((~(8'hb9)) <<< ((8'ha0) < (8'hb0)))) ? (^~(((8'ha9) ? (8'hb9) : (8'h9c)) | ((7'h44) < (8'hbe)))) : ((((8'ha4) + (7'h44)) << ((8'hb6) <<< (8'ha9))) & {((8'h9f) ? (8'ha9) : (8'hb2))})) | ((({(8'h9c), (8'hb0)} ? (~^(8'hbe)) : (+(8'hab))) || (((8'haa) != (8'had)) < ((8'ha7) ? (8'haa) : (8'ha9)))) >= (8'hb9))), 
parameter param32 = (param31 * ({param31} ? param31 : param31)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ($signed($unsigned($signed((-wire1)))) ?
                     wire4 : (^~$signed(wire4[(3'h5):(1'h0)])));
  always
    @(posedge clk) begin
      if ($signed(($signed({wire4[(5'h12):(3'h7)]}) ^ ({(wire1 ?
                  wire5 : wire3)} ?
          wire2[(1'h0):(1'h0)] : wire1))))
        begin
          reg6 <= ($unsigned(wire5) ?
              (wire4[(4'ha):(1'h1)] - wire0) : {wire2[(3'h5):(3'h5)],
                  wire5[(1'h0):(1'h0)]});
        end
      else
        begin
          reg6 <= $signed((wire1 ?
              (wire3[(2'h2):(1'h0)] ?
                  wire4 : $unsigned(wire2)) : ($signed(wire0[(1'h1):(1'h1)]) ?
                  wire0[(3'h5):(2'h3)] : wire2)));
          reg7 <= $signed($signed($unsigned({(~|wire2)})));
        end
      reg8 <= wire5[(1'h0):(1'h0)];
      if ((reg6 >>> (wire2 < {(((8'hac) ? reg7 : wire4) ?
              $unsigned(reg7) : (wire4 ? wire4 : reg7))})))
        begin
          if ($unsigned((wire4[(4'he):(2'h2)] ~^ (^~((wire3 ?
              wire3 : wire0) == (wire3 ? reg8 : wire0))))))
            begin
              reg9 <= ($unsigned($unsigned((~&(~^(8'ha2))))) < (8'h9d));
            end
          else
            begin
              reg9 <= ((8'h9f) ?
                  $unsigned($unsigned(($signed(reg7) ?
                      wire1[(4'hf):(4'he)] : (wire3 ?
                          (8'ha0) : wire3)))) : wire3[(1'h0):(1'h0)]);
              reg10 <= wire3;
            end
          reg11 <= {wire1[(3'h5):(1'h1)]};
          reg12 <= $signed($signed((8'hbf)));
          reg13 <= reg12;
        end
      else
        begin
          if ((!((($signed((7'h41)) == $unsigned(reg12)) - (-reg12[(1'h1):(1'h0)])) <= reg7[(4'hd):(3'h4)])))
            begin
              reg9 <= (^~$signed($unsigned(reg11)));
              reg10 <= ($signed(wire5) ?
                  ($signed((-$unsigned((8'hb7)))) ?
                      {($signed(reg8) ?
                              (reg13 != wire4) : (reg6 & reg13))} : $unsigned($signed(reg11[(1'h1):(1'h0)]))) : (wire3 >> ($unsigned(wire1[(3'h4):(2'h2)]) ?
                      $unsigned({reg12, reg11}) : reg7)));
            end
          else
            begin
              reg9 <= (($signed($signed($signed(wire1))) == $signed(({wire3} ?
                  wire0[(2'h2):(1'h1)] : $signed(reg12)))) < reg10[(4'h8):(1'h0)]);
              reg10 <= {($unsigned($unsigned(reg11[(3'h6):(2'h2)])) ?
                      wire5[(2'h2):(2'h2)] : (wire3 ?
                          reg11[(4'ha):(2'h2)] : {(~|reg8), $signed(wire5)})),
                  reg10[(3'h7):(2'h3)]};
            end
          reg11 <= wire4;
          reg12 <= wire0[(1'h0):(1'h0)];
        end
      reg14 <= (+$signed(wire3[(2'h2):(2'h2)]));
      if ($signed((^~(($signed(wire5) >>> (&(8'ha2))) ?
          reg11[(2'h2):(2'h2)] : ($signed(wire3) || wire4[(5'h11):(4'hd)])))))
        begin
          reg15 <= ((8'hb1) >>> (reg11 ? wire2 : reg14));
          reg16 <= ($unsigned((+$signed(wire5[(2'h2):(2'h2)]))) ?
              $unsigned(($signed(wire1[(3'h6):(1'h1)]) ?
                  $signed(wire1) : reg8[(5'h12):(1'h0)])) : reg8);
          reg17 <= ({(7'h43),
                  ($unsigned($signed(reg7)) ?
                      {$signed(reg12)} : $unsigned(((7'h41) ?
                          reg14 : wire5)))} ?
              reg8[(2'h3):(2'h3)] : (($signed($unsigned(wire4)) & (((8'hbb) & reg8) << $unsigned(wire3))) ~^ ((|((8'h9c) ?
                      (8'hae) : reg9)) ?
                  reg7[(3'h7):(3'h4)] : $signed(((8'h9f) != reg9)))));
          reg18 <= $signed({reg16[(3'h7):(1'h0)], reg10});
        end
      else
        begin
          reg15 <= wire2[(3'h5):(1'h1)];
          reg16 <= (^~wire3);
          if ((8'ha4))
            begin
              reg17 <= $signed((^~{(|{wire2})}));
              reg18 <= wire0[(1'h1):(1'h1)];
              reg19 <= $unsigned($unsigned($unsigned((|(reg6 ?
                  reg11 : reg13)))));
              reg20 <= $signed($signed($unsigned((&$signed(reg16)))));
            end
          else
            begin
              reg17 <= $unsigned(((+$unsigned($unsigned(reg6))) ?
                  $signed((wire0 ^~ reg17)) : reg6[(1'h1):(1'h0)]));
            end
          if ($signed((reg15[(3'h5):(2'h3)] ?
              ($signed(reg17) ?
                  reg20 : wire4) : (~^$signed((reg18 != reg10))))))
            begin
              reg21 <= $unsigned(reg6);
              reg22 <= (reg15[(4'h9):(3'h6)] ?
                  $unsigned($unsigned($signed({reg8}))) : $signed($unsigned((+(&reg8)))));
              reg23 <= (($signed((^~(wire1 ? reg22 : wire1))) ?
                  $unsigned(reg11[(4'h9):(3'h6)]) : (reg12 ^ (^~reg14))) >= (&(8'hbb)));
              reg24 <= ($signed((!(((7'h42) ^ reg23) ? {reg17} : reg12))) ?
                  wire5 : $signed($signed($unsigned(wire1[(4'hc):(1'h0)]))));
            end
          else
            begin
              reg21 <= reg23[(2'h2):(1'h0)];
              reg22 <= $signed(reg15[(1'h1):(1'h1)]);
              reg23 <= (^~(8'haf));
              reg24 <= wire3[(1'h0):(1'h0)];
            end
        end
    end
  assign wire25 = (~($signed((reg21 ? (wire3 & reg15) : reg15)) ?
                      (^$unsigned({reg13,
                          reg8})) : (&($signed(wire2) <= (reg22 ?
                          reg17 : reg23)))));
  assign wire26 = ($signed(reg22) ? wire3 : wire5[(2'h3):(2'h2)]);
  assign wire27 = (8'hb5);
  assign wire28 = $signed((!wire0));
  assign wire29 = wire1;
  assign wire30 = {$signed({((reg18 ? (8'ha9) : (8'haf)) >>> $unsigned(wire25)),
                          (^~((8'hab) >= (8'h9f)))}),
                      {reg9, $signed(reg6)}};
endmodule
