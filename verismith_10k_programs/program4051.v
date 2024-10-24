module top
#(parameter param32 = ((((7'h44) || (~^((8'ha0) ? (8'hac) : (8'hbf)))) && (({(7'h44)} ? (8'hbc) : ((8'ha6) ? (8'ha1) : (8'hb6))) * (~&((8'h9d) ? (8'ha5) : (8'hb8))))) >> (((((8'hba) ? (8'haa) : (8'hae)) && (&(7'h42))) ? ({(8'hba)} + ((8'ha7) < (7'h44))) : {((8'hbf) ~^ (8'h9d))}) || (^~(~&(!(8'had)))))), 
parameter param33 = {(!{((param32 ? param32 : (8'ha6)) | param32)}), (((~|(8'h9e)) ? {(param32 && param32), ((8'hb8) ? param32 : param32)} : ({param32} > (param32 ? param32 : param32))) << (8'hba))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire19;
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg4 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire19,
                 reg22,
                 reg21,
                 reg20,
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
      reg4 <= wire2[(2'h2):(1'h0)];
      reg5 <= ($signed($signed($unsigned($unsigned(wire2)))) >>> (7'h44));
      reg6 <= $signed($unsigned(((~^$signed(wire0)) <= $signed($unsigned((7'h44))))));
      if (($signed({$signed($unsigned((7'h44)))}) <= $unsigned(wire0)))
        begin
          if ((reg6 ? (-(^~{(|wire1)})) : {$unsigned((~^$unsigned(reg6)))}))
            begin
              reg7 <= reg5[(3'h6):(1'h0)];
              reg8 <= (8'hae);
              reg9 <= (~&$signed($signed((~|(wire2 ^ wire2)))));
            end
          else
            begin
              reg7 <= $unsigned({($signed(reg9) ?
                      {reg8[(4'h9):(2'h2)],
                          $signed(reg5)} : reg9[(4'hc):(4'ha)]),
                  $signed({(~&wire2)})});
              reg8 <= (8'h9e);
            end
          reg10 <= reg8;
          reg11 <= ($signed($unsigned(reg7[(3'h6):(3'h5)])) ?
              {reg9[(4'ha):(3'h6)]} : $signed({{$signed(reg7)},
                  $signed((reg8 ? reg6 : wire2))}));
          reg12 <= (reg9[(3'h6):(2'h2)] ^~ wire2);
          reg13 <= wire2;
        end
      else
        begin
          reg7 <= reg13[(3'h6):(1'h0)];
          reg8 <= ($unsigned(((reg7 ?
                  (reg7 ? (8'h9e) : wire1) : (reg8 - reg11)) ?
              ($unsigned(reg12) < $unsigned(reg4)) : $signed((8'had)))) == wire0);
          reg9 <= reg8;
          reg10 <= reg8[(5'h10):(4'hd)];
          reg11 <= reg11;
        end
      if (reg10)
        begin
          if ((~^wire3[(2'h3):(2'h2)]))
            begin
              reg14 <= $unsigned((wire3 ?
                  (reg4[(1'h0):(1'h0)] ?
                      (reg6[(4'h9):(2'h2)] + (wire2 || reg8)) : $unsigned($unsigned(reg13))) : ({(reg6 ?
                              reg4 : wire3)} ?
                      $signed($unsigned((7'h40))) : $signed($signed(reg12)))));
              reg15 <= (wire1[(3'h7):(2'h2)] ?
                  (-$unsigned($unsigned((reg14 <= wire0)))) : (reg13[(1'h0):(1'h0)] ?
                      (((+wire1) ? $unsigned((8'hbe)) : $signed(wire1)) ?
                          $unsigned((wire0 ?
                              (8'ha6) : reg5)) : (8'ha0)) : reg7));
              reg16 <= $unsigned((~&reg5));
              reg17 <= $signed($signed(reg16));
              reg18 <= reg4[(1'h0):(1'h0)];
            end
          else
            begin
              reg14 <= reg5[(4'hd):(1'h0)];
              reg15 <= reg10;
            end
        end
      else
        begin
          if (((($signed($unsigned(reg7)) | $unsigned((reg5 ?
              reg14 : wire0))) | reg14[(1'h1):(1'h1)]) > reg18))
            begin
              reg14 <= (-$unsigned((8'hb5)));
              reg15 <= $unsigned(((^reg13) ^ (~&$signed($signed((8'ha2))))));
              reg16 <= ($signed($unsigned((^$unsigned(reg16)))) | (~^$unsigned((~^wire2))));
              reg17 <= $unsigned($unsigned(reg15[(1'h1):(1'h0)]));
            end
          else
            begin
              reg14 <= {reg13};
              reg15 <= $signed(reg10[(2'h2):(2'h2)]);
              reg16 <= (~(+(~^(~^reg5[(3'h7):(1'h0)]))));
              reg17 <= ({({(reg4 ? (8'ha8) : reg6)} ? (reg6 < {wire1}) : reg5),
                      (((8'ha9) ? $signed((8'haf)) : (|reg13)) ?
                          (~|((7'h43) ? reg16 : (8'hb9))) : {$unsigned(reg18),
                              (reg7 + reg8)})} ?
                  $unsigned((^reg9)) : (^~$unsigned(((reg15 == reg5) ?
                      (~reg6) : {reg7}))));
            end
        end
    end
  assign wire19 = $unsigned(reg8);
  always
    @(posedge clk) begin
      reg20 <= $signed($unsigned((8'hb0)));
      reg21 <= {(reg7[(2'h3):(2'h2)] ?
              $unsigned({reg4, (reg6 | (8'hae))}) : reg6[(1'h1):(1'h1)]),
          (8'ha8)};
      reg22 <= ((8'ha6) <= (|(((|(8'ha8)) ? $signed(reg8) : (^~reg20)) ?
          {reg4[(2'h2):(1'h0)], reg14} : ((+reg21) ?
              (~|reg15) : $unsigned(reg21)))));
    end
  assign wire23 = reg16;
  assign wire24 = $signed(($unsigned(reg13) && wire23));
  assign wire25 = ($signed(({(reg6 ? reg8 : reg12), $signed(reg9)} ?
                      (!((8'hbf) ? reg18 : reg16)) : ($signed(reg9) ?
                          (~^wire3) : $unsigned(reg9)))) ^ ($unsigned(($unsigned(reg7) == (&reg9))) ?
                      (~^$signed(wire3)) : (~&{(reg13 + (8'h9f)),
                          (reg5 >> reg5)})));
  assign wire26 = (wire3 < (+wire24));
  assign wire27 = ((reg7 ?
                      reg12 : $signed(((wire3 * reg17) ?
                          $signed(reg12) : (reg21 <<< (8'hac))))) & (-reg20));
  assign wire28 = (&((reg21 || $signed((wire27 ^ wire25))) || (^~$signed(reg13[(4'h8):(3'h6)]))));
  assign wire29 = (^$signed(reg18[(2'h3):(2'h3)]));
  assign wire30 = $unsigned(((wire1[(1'h0):(1'h0)] ?
                      $unsigned((8'haf)) : wire19[(4'hf):(1'h1)]) - reg21));
  assign wire31 = (($signed($unsigned($unsigned(reg20))) ?
                      $unsigned((wire27 << $signed(reg12))) : (&reg12)) * reg21[(5'h11):(3'h5)]);
endmodule
