module top
#(parameter param26 = (|({({(8'hb3)} >>> (&(8'h9f))), (((8'hb7) ? (7'h43) : (8'ha9)) ? {(8'hae), (8'haa)} : ((7'h43) ? (7'h42) : (8'hb4)))} != {(^((8'hac) << (8'haa))), ({(8'hb6)} ? ((8'hbf) ? (7'h43) : (8'ha0)) : {(8'ha8)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire11,
                 wire10,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (^wire1);
      reg6 <= $signed(($unsigned($signed(wire0)) && (($unsigned(wire2) ?
              (wire1 >= (8'ha6)) : (8'hb9)) ?
          $signed({wire1}) : $unsigned($unsigned(wire3)))));
      reg7 <= (~(~^(wire0[(1'h0):(1'h0)] ?
          (|wire3[(1'h0):(1'h0)]) : (&wire4[(3'h4):(1'h0)]))));
      reg8 <= $signed(($unsigned((|$unsigned((8'hb9)))) ^ $unsigned(wire0[(1'h1):(1'h1)])));
      reg9 <= (($signed((reg7[(2'h3):(1'h0)] <= (reg5 ? wire4 : reg6))) ?
          (~|$signed($signed((8'hb3)))) : (reg7[(2'h3):(1'h1)] ?
              (+$signed(wire0)) : (wire4 * $unsigned(reg5)))) || wire3);
    end
  assign wire10 = ($unsigned(($unsigned(reg9[(4'hc):(3'h7)]) ?
                          ((+wire3) ^ $signed((8'hb0))) : $signed($signed(reg9)))) ?
                      reg6[(2'h2):(2'h2)] : $unsigned((!(reg9[(4'hd):(4'h8)] ?
                          ((8'hb3) ? wire0 : wire2) : (reg5 ?
                              reg9 : (8'hb0))))));
  assign wire11 = (|wire2[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg12 <= ((&(|(~&{reg7, wire4}))) == reg7);
      reg13 <= reg6[(4'h8):(1'h1)];
      reg14 <= ((+wire4) ?
          (8'hac) : $signed((((8'hb3) ? $signed(wire10) : (wire3 != reg5)) ?
              wire11[(2'h2):(2'h2)] : $unsigned((~&(8'ha9))))));
      reg15 <= (8'hb9);
      if ({(($unsigned((^~wire0)) < $signed($signed(reg13))) - (8'hb3))})
        begin
          if (wire2[(3'h6):(1'h0)])
            begin
              reg16 <= $unsigned((!{reg8}));
              reg17 <= $unsigned((&$unsigned($unsigned((&reg6)))));
              reg18 <= (((($signed(reg14) ?
                              reg6[(3'h5):(2'h3)] : $signed(wire4)) ?
                          $signed($signed(reg6)) : ($signed(reg6) ?
                              (^~(8'haf)) : (~|wire10))) ?
                      (((-wire11) ^~ (wire4 * reg7)) ?
                          $unsigned((reg12 - (8'hb1))) : ($signed(reg14) << (reg17 - wire1))) : {reg8}) ?
                  $signed(reg13[(4'hb):(3'h5)]) : $signed(($signed((~^reg7)) == (((8'h9f) && wire11) - (reg15 ?
                      reg9 : reg5)))));
              reg19 <= ({(wire0[(2'h2):(1'h0)] ?
                          wire0 : ((+reg5) & $signed(reg12))),
                      {reg15[(2'h3):(1'h0)]}} ?
                  wire0[(2'h3):(1'h1)] : (8'hae));
              reg20 <= reg7[(2'h3):(1'h0)];
            end
          else
            begin
              reg16 <= reg19[(4'h9):(3'h6)];
              reg17 <= (reg16 ? reg16[(3'h6):(1'h0)] : reg16[(4'h8):(3'h7)]);
            end
          reg21 <= ({(($signed(reg13) && (reg19 || wire0)) ?
                      ((8'h9f) ?
                          (reg20 ~^ reg17) : (reg15 ?
                              (8'ha5) : wire10)) : wire1[(2'h2):(1'h1)]),
                  reg5} ?
              reg18 : reg15);
          reg22 <= reg19;
        end
      else
        begin
          reg16 <= reg9[(2'h3):(2'h2)];
          if (reg13[(2'h3):(1'h1)])
            begin
              reg17 <= (((reg8[(1'h0):(1'h0)] <= (~wire3[(3'h6):(2'h3)])) - (((wire11 ?
                      (8'hba) : reg12) >> ((8'ha5) && wire3)) ?
                  ((wire11 ?
                      reg22 : (8'hb8)) >>> ((8'hb1) ~^ (8'hb0))) : reg15[(1'h1):(1'h1)])) ^ (({(reg8 ?
                          reg22 : wire3)} ?
                  (wire2[(1'h0):(1'h0)] ?
                      $signed(wire11) : (&reg21)) : reg18) || reg17));
              reg18 <= ((~$signed((8'hb2))) == ((|($unsigned(reg20) ?
                  $signed(wire1) : wire10)) * (8'ha4)));
              reg19 <= $unsigned(reg9[(4'ha):(1'h0)]);
              reg20 <= (($signed(wire10) ?
                      (+$signed(reg15[(3'h4):(2'h2)])) : ($signed((reg20 + wire11)) << ($signed(reg16) ^ {reg12,
                          reg14}))) ?
                  wire10 : ((8'hac) <<< reg9));
            end
          else
            begin
              reg17 <= ($unsigned((($unsigned(reg18) << (+reg17)) >> {reg22[(3'h7):(3'h5)],
                      {reg8}})) ?
                  $unsigned(($unsigned($signed(reg22)) ?
                      $signed({reg13,
                          reg16}) : reg22[(3'h5):(3'h4)])) : $signed(reg17[(2'h3):(2'h3)]));
              reg18 <= (({((&wire3) ?
                      $unsigned(reg9) : $unsigned(wire2))} < $unsigned(reg17[(2'h2):(2'h2)])) == wire2[(3'h7):(3'h4)]);
              reg19 <= reg15;
              reg20 <= (!(^(wire10 ?
                  ((reg15 ? wire3 : reg14) ?
                      (~^(8'ha3)) : (reg7 + reg17)) : reg21[(1'h1):(1'h0)])));
              reg21 <= (~|(($unsigned((reg5 ? reg8 : reg19)) ?
                      (reg6 ?
                          $signed(reg15) : reg17[(2'h2):(2'h2)]) : $unsigned($unsigned(reg7))) ?
                  (reg9 != $unsigned($unsigned(wire11))) : reg6));
            end
        end
    end
  assign wire23 = ($unsigned(wire11[(3'h5):(3'h4)]) | $signed(reg5[(1'h1):(1'h0)]));
  assign wire24 = wire10;
  assign wire25 = wire24[(1'h0):(1'h0)];
endmodule
