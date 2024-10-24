module top
#(parameter param32 = ((~|(({(8'h9e)} ? {(8'hba)} : ((8'hb6) ? (8'hbe) : (8'hbe))) ? (((8'hbc) ? (8'h9c) : (8'hac)) ? ((8'hb8) ? (8'ha2) : (8'h9e)) : (&(8'haa))) : (((8'ha2) ? (8'ha7) : (8'ha4)) <<< ((8'hb1) ? (8'ha5) : (8'hba))))) ^~ (((8'ha9) == (((8'hb3) && (8'hae)) ? ((8'hbb) ? (8'ha7) : (8'h9e)) : ((8'hab) ? (7'h41) : (8'hb9)))) | ((((7'h41) + (8'hb3)) * ((8'ha1) >= (8'had))) > (~|((8'ha9) && (8'hae)))))), 
parameter param33 = (&param32))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 wire4,
                 reg27,
                 reg26,
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
                 reg7,
                 (1'h0)};
  assign wire4 = wire3[(4'h8):(4'h8)];
  assign wire5 = ($signed(wire4[(4'hf):(2'h2)]) ?
                     (-($unsigned(wire1) ?
                         $signed($signed(wire3)) : $signed($signed(wire1)))) : (wire2 ?
                         $unsigned(wire2) : ((-$signed(wire1)) ?
                             (^$signed(wire0)) : $signed({wire3}))));
  assign wire6 = $signed($signed($signed(wire0[(5'h12):(4'hb)])));
  always
    @(posedge clk) begin
      reg7 <= wire6[(2'h3):(1'h0)];
    end
  assign wire8 = (^~wire1);
  assign wire9 = (wire6 ?
                     ((((reg7 ? wire5 : wire3) ~^ reg7) - ($unsigned(wire4) ?
                         $signed(wire4) : wire6)) ^ wire8[(4'hd):(1'h1)]) : reg7);
  assign wire10 = (~|$unsigned(wire3[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg11 <= (~&wire3);
      reg12 <= wire2[(4'hf):(2'h2)];
      reg13 <= ($unsigned((~^(wire9[(1'h1):(1'h1)] ?
          wire0[(5'h13):(1'h1)] : $unsigned(wire10)))) > (!(-{wire8[(4'hc):(4'h8)]})));
      if (((((((8'hb5) ? reg13 : reg11) ?
                  (wire9 || reg12) : reg11[(2'h3):(1'h0)]) || (~(wire3 ?
                  wire0 : wire10))) ?
              (((reg12 == (7'h44)) - {wire6}) <= wire4) : $signed(wire9[(4'ha):(1'h0)])) ?
          {$signed((wire3 ?
                  ((8'ha1) <= wire9) : (~|wire9)))} : ((&wire0) >= reg7[(3'h6):(2'h2)])))
        begin
          reg14 <= wire8[(4'hf):(3'h5)];
          if (wire0[(5'h14):(4'ha)])
            begin
              reg15 <= ($signed($signed((~^wire3[(3'h7):(1'h1)]))) ?
                  wire5 : $unsigned((+wire6)));
              reg16 <= $signed(((|wire0[(5'h10):(1'h0)]) > (($unsigned(reg12) ?
                  reg12 : $signed(wire2)) * reg12)));
              reg17 <= (^~wire9[(4'hc):(4'hc)]);
              reg18 <= ((((wire0[(5'h11):(2'h3)] ? $signed(reg11) : (~wire10)) ?
                          $signed(reg7[(4'h8):(2'h2)]) : reg15) ?
                      (^(+reg14[(1'h1):(1'h0)])) : wire6) ?
                  ($signed({$unsigned(wire2), $unsigned(reg11)}) ?
                      (reg17 + (wire6 ?
                          reg11 : $unsigned(wire6))) : reg12) : (reg13[(3'h6):(3'h4)] || {(reg12 ?
                          (8'hbc) : reg7)}));
            end
          else
            begin
              reg15 <= reg7[(4'hd):(3'h7)];
              reg16 <= wire1[(1'h1):(1'h0)];
              reg17 <= reg18;
            end
          reg19 <= reg12;
          reg20 <= $unsigned(((~&wire0) ?
              (^~$unsigned((reg14 * wire9))) : ((^$signed(wire9)) ?
                  reg19[(1'h0):(1'h0)] : $signed((reg16 ? wire6 : reg18)))));
          reg21 <= ((^~$signed((reg16 ?
                  $signed((8'haa)) : (reg20 ? wire10 : reg16)))) ?
              $signed($unsigned($signed(((8'ha1) && wire9)))) : (wire8 - $unsigned((wire6[(3'h4):(1'h0)] ?
                  reg12[(3'h4):(1'h0)] : wire2[(3'h5):(1'h1)]))));
        end
      else
        begin
          reg14 <= wire8[(3'h5):(1'h1)];
          if ($signed($signed({reg12[(4'hb):(4'h9)]})))
            begin
              reg15 <= ($signed($signed(reg17)) ?
                  $signed((+wire6[(3'h5):(3'h4)])) : reg17[(2'h2):(1'h1)]);
              reg16 <= ((|(-((reg11 ^~ reg19) ?
                  $unsigned(reg12) : (reg11 ?
                      reg7 : wire9)))) < wire1[(3'h7):(1'h0)]);
            end
          else
            begin
              reg15 <= reg14;
            end
          reg17 <= reg17;
        end
    end
  assign wire22 = wire5;
  assign wire23 = ($unsigned(($unsigned((~|reg19)) ?
                          ((wire4 ?
                              reg17 : reg16) < wire22[(4'hb):(3'h7)]) : (^~(reg13 ?
                              wire8 : reg13)))) ?
                      wire1 : (((^(!wire6)) ^~ ($signed(reg16) ?
                          (^reg14) : (~|wire1))) << (!reg16)));
  assign wire24 = wire6;
  assign wire25 = $signed(($unsigned($unsigned((reg15 >> reg20))) ?
                      $signed((8'haf)) : (($unsigned(wire22) <= $unsigned(reg15)) ^ $unsigned((-wire6)))));
  always
    @(posedge clk) begin
      reg26 <= $signed((+$signed((&{reg11, wire9}))));
      reg27 <= (wire5 ? reg13 : $unsigned($unsigned($unsigned((~^reg17)))));
    end
  assign wire28 = reg12;
  assign wire29 = {((8'hb8) ?
                          (~(reg21 || (wire28 ?
                              reg15 : reg19))) : $signed(wire2[(4'h8):(1'h1)]))};
  assign wire30 = reg17[(3'h6):(3'h6)];
  assign wire31 = (wire0 || {(((8'ha0) ^ wire5[(4'ha):(2'h3)]) ?
                          (wire0 ?
                              (wire4 <<< (8'ha9)) : (reg14 + reg26)) : {(reg7 || (8'hb0))})});
endmodule
