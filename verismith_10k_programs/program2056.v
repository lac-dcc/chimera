module top
#(parameter param22 = ((8'ha1) ? (((((8'hb7) ? (8'hb9) : (8'ha4)) - ((8'ha4) ? (8'h9e) : (8'h9d))) - {(~&(8'h9f)), (!(7'h41))}) ? ((((8'hae) ? (8'ha5) : (8'ha2)) ^~ ((7'h43) & (8'hbd))) >= ((-(8'ha8)) == (^(8'haa)))) : (~^((^(8'h9d)) ? ((8'hb7) ? (8'hbe) : (8'hb6)) : ((8'hbc) <<< (8'ha1))))) : (((((8'hb3) < (8'hbe)) ? (^~(8'ha9)) : ((7'h40) ^~ (8'haf))) ? {((7'h41) ? (8'ha4) : (8'hb3)), (+(8'hb2))} : ({(8'hb9), (8'ha9)} <<< (~&(8'h9e)))) ? (|(((7'h40) << (8'hb5)) & (|(8'haf)))) : (((8'hbf) ? ((8'hac) && (8'ha1)) : ((8'hbd) <<< (8'ha6))) || (((8'haa) ? (8'haa) : (8'hb2)) ? ((8'hac) | (8'hb2)) : ((8'ha6) ? (8'ha4) : (8'hbb)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
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
  always
    @(posedge clk) begin
      reg5 <= (|(!(&(^~(^~wire1)))));
      reg6 <= ((8'hb5) + ($signed(($signed((8'hb1)) | $signed(reg5))) ?
          {wire3} : reg5[(3'h7):(2'h3)]));
    end
  always
    @(posedge clk) begin
      reg7 <= $signed($unsigned(reg5));
      reg8 <= {reg5, $unsigned(reg7[(3'h4):(3'h4)])};
    end
  always
    @(posedge clk) begin
      reg9 <= wire2[(4'hc):(4'hc)];
      reg10 <= ($signed($signed($signed($signed(wire3)))) ?
          (8'hb3) : $unsigned((reg9[(4'hc):(2'h3)] ?
              $unsigned((reg9 ? (8'h9d) : reg7)) : $signed((reg5 ?
                  reg9 : (8'ha2))))));
      reg11 <= $signed(wire1[(3'h7):(3'h4)]);
      reg12 <= reg5;
    end
  always
    @(posedge clk) begin
      reg13 <= ({(reg11 && reg12[(2'h2):(1'h0)]),
          (($signed(reg9) ? wire0 : reg10) && ($unsigned(reg9) ?
              (wire1 ?
                  reg5 : reg10) : wire0[(3'h7):(3'h7)]))} <<< $unsigned(reg12));
      if ($unsigned($unsigned(wire0)))
        begin
          reg14 <= wire0;
          reg15 <= ((($unsigned({reg5, reg8}) ^~ (~&reg9[(4'hd):(3'h6)])) ?
              {((reg11 ? reg9 : reg7) || (8'hbf)),
                  ((reg13 ? wire4 : reg11) | (reg6 ?
                      reg8 : wire1))} : reg6) < (^~reg7[(2'h2):(1'h1)]));
          reg16 <= $signed(wire1);
          reg17 <= ((wire2 == wire1) ?
              (wire4[(4'hb):(4'ha)] ?
                  $signed(({(8'haf)} && ((8'hbf) <<< reg16))) : (8'hb8)) : (({$unsigned(reg10),
                  $unsigned(reg6)} >= (wire3 * (wire2 ?
                  wire0 : reg15))) < {(reg7 ^~ reg9), $signed(reg16)}));
          reg18 <= ($unsigned((^~$signed(wire0[(3'h7):(3'h6)]))) ^ {wire1[(1'h1):(1'h0)],
              ((reg16 ? (&reg13) : (~^reg12)) * reg16[(3'h4):(3'h4)])});
        end
      else
        begin
          if ((+(wire0[(1'h1):(1'h0)] ?
              reg12[(1'h0):(1'h0)] : ({(+wire2)} << (reg17 < {reg17, reg18})))))
            begin
              reg14 <= $unsigned($signed($unsigned(({wire1} ?
                  $signed(reg7) : reg11[(3'h7):(3'h5)]))));
              reg15 <= {reg11[(1'h1):(1'h1)], wire0};
              reg16 <= $unsigned(wire2[(2'h2):(2'h2)]);
              reg17 <= ((8'h9c) ?
                  (~$signed((reg18[(2'h2):(2'h2)] ?
                      (+reg7) : (reg13 ? reg7 : (8'haf))))) : (-(!{(-reg8),
                      (reg11 ? wire0 : reg9)})));
            end
          else
            begin
              reg14 <= reg16;
            end
        end
    end
  assign wire19 = ((reg6[(5'h15):(5'h11)] ?
                      $unsigned((~&$signed(wire1))) : (((reg10 < reg8) ?
                              reg15[(1'h0):(1'h0)] : (+reg6)) ?
                          {(~|wire2),
                              reg17} : $signed((reg5 ^ wire3)))) - ($unsigned(($signed(reg11) + ((7'h43) ?
                          wire0 : (8'ha8)))) ?
                      (reg7[(1'h1):(1'h1)] ?
                          ($signed(reg6) ~^ ((8'haa) ?
                              reg9 : (8'ha0))) : (((8'ha4) ~^ reg15) ?
                              (|(8'ha6)) : (8'hbd))) : $unsigned((^(reg16 | (8'ha6))))));
  assign wire20 = ((wire19 & $signed($unsigned($unsigned((8'ha2))))) ?
                      $unsigned(((+(~reg17)) - reg5[(4'ha):(4'h8)])) : (((~&(reg5 + reg17)) ?
                          (-wire2[(4'hd):(3'h5)]) : (8'hbf)) ~^ ((reg17[(3'h4):(1'h1)] ?
                          (~^reg13) : (reg5 << reg18)) & ((reg6 == reg11) ?
                          $unsigned((8'haa)) : (wire0 ? reg13 : wire19)))));
  assign wire21 = {reg12[(1'h0):(1'h0)], reg15[(1'h1):(1'h1)]};
endmodule
