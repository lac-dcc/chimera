module top
#(parameter param42 = (!{({((8'hb7) ? (8'hbd) : (8'ha1))} ? {(^~(8'hb9)), (~(8'hbe))} : (((8'ha5) <= (8'hab)) << ((8'hb9) ? (8'hbc) : (8'hbf))))}), 
parameter param43 = param42)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire41,
                 wire39,
                 wire4,
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
  assign wire4 = (wire3 <= $unsigned($unsigned(wire2[(3'h7):(2'h3)])));
  always
    @(posedge clk) begin
      if (((^wire0) ^ ($signed(wire3) && $signed(wire2[(3'h4):(1'h0)]))))
        begin
          reg5 <= ($signed($signed(wire2[(3'h6):(1'h0)])) < (wire0[(3'h6):(3'h6)] * {($signed(wire4) >>> wire1[(2'h2):(1'h0)]),
              (+(wire1 ? wire4 : wire3))}));
          if ($signed(((~^$signed({wire3})) ?
              $signed(wire4[(3'h5):(2'h3)]) : wire3)))
            begin
              reg6 <= (wire2[(2'h2):(1'h1)] ?
                  ($signed((~|$signed((8'hb6)))) || $signed($signed(reg5[(4'ha):(2'h3)]))) : ($signed(wire3[(4'hb):(1'h0)]) <= reg5));
              reg7 <= (~|$signed(wire0));
              reg8 <= $signed(reg6);
              reg9 <= $signed((^$unsigned((8'h9c))));
            end
          else
            begin
              reg6 <= (((~&$unsigned((reg5 != wire3))) ?
                      $unsigned(wire1) : (reg7[(1'h1):(1'h1)] | ((&wire2) | (wire3 ^~ wire1)))) ?
                  $signed($unsigned(((wire4 <= wire2) ?
                      (8'hbe) : reg9))) : $signed($unsigned((((8'hbf) && reg8) && $unsigned(wire3)))));
            end
          if ((|(reg9 ?
              (-(((8'ha6) ^ reg7) ?
                  wire1[(1'h0):(1'h0)] : wire1)) : (wire1[(1'h0):(1'h0)] ^ $signed(reg5)))))
            begin
              reg10 <= ((+($signed(reg5) ?
                  reg5[(5'h12):(3'h4)] : reg6)) + (|reg5));
              reg11 <= wire0;
              reg12 <= wire1;
            end
          else
            begin
              reg10 <= (reg8[(2'h3):(1'h1)] ^ ((~^{reg9}) >>> (!$unsigned($unsigned(wire3)))));
              reg11 <= reg10[(1'h0):(1'h0)];
              reg12 <= {((reg9 ?
                          reg10 : {$signed(reg7), (reg8 ? (8'ha2) : reg12)}) ?
                      $unsigned($signed(reg5[(5'h15):(5'h10)])) : wire3[(3'h4):(1'h0)]),
                  reg12[(4'ha):(4'h8)]};
              reg13 <= (({reg7[(4'hb):(2'h3)]} != $signed(($signed(wire1) & wire2))) ?
                  $unsigned($unsigned(((~reg11) & {wire2, reg8}))) : (8'h9f));
              reg14 <= wire0;
            end
        end
      else
        begin
          reg5 <= reg9;
          reg6 <= ($signed($signed(reg14[(1'h1):(1'h0)])) ?
              $signed(wire3[(4'ha):(4'h9)]) : $signed($signed(((^reg5) != (reg8 > reg13)))));
          reg7 <= $signed(reg5[(4'h9):(1'h1)]);
          reg8 <= ((8'hb9) * reg7[(1'h1):(1'h1)]);
          if ((((((reg6 < (8'ha3)) ^~ $unsigned(wire2)) << $unsigned((reg14 <= reg5))) - wire3) ?
              ($unsigned($unsigned(reg10[(4'hb):(3'h7)])) ?
                  ((~^$signed(wire0)) <= $unsigned($signed((8'h9c)))) : $unsigned((8'h9e))) : (~|(|wire0[(3'h7):(1'h0)]))))
            begin
              reg9 <= (|($unsigned((((8'h9d) ? reg14 : reg14) ?
                      (&(8'h9c)) : wire2[(3'h7):(3'h4)])) ?
                  (reg11[(1'h1):(1'h0)] ^~ {(^~reg5)}) : ($unsigned(wire3[(4'h8):(2'h2)]) ?
                      ((wire2 ?
                          reg5 : wire1) << reg6[(3'h7):(2'h2)]) : ((reg14 ?
                          reg8 : wire1) << (reg12 == reg12)))));
              reg10 <= $unsigned(reg6[(3'h6):(2'h2)]);
              reg11 <= wire3;
            end
          else
            begin
              reg9 <= ((-((~^reg5) ?
                      $unsigned($signed(wire1)) : (^~(-wire2)))) ?
                  (8'h9f) : $signed((~&((wire2 >>> reg14) != (^~reg12)))));
              reg10 <= {$unsigned($signed((~|(reg8 != wire1))))};
              reg11 <= (!reg12);
            end
        end
      reg15 <= (wire4[(2'h3):(2'h3)] ^ (reg11 ?
          ($unsigned({reg12}) <= wire3[(2'h2):(2'h2)]) : reg11[(1'h0):(1'h0)]));
      if (((~^$signed($unsigned(reg5[(4'hf):(4'ha)]))) == ({reg10,
              (reg9 ? {reg12, reg8} : $unsigned(reg15))} ?
          (8'ha0) : (~(!(reg13 >= (7'h40)))))))
        begin
          reg16 <= $unsigned(((reg11 == reg14[(1'h1):(1'h0)]) ?
              (8'ha1) : wire3[(2'h2):(1'h0)]));
          reg17 <= wire3;
          reg18 <= {wire3[(2'h3):(2'h3)]};
          reg19 <= ((($signed(reg6) >> {wire0}) != reg16) ~^ reg16[(3'h5):(1'h1)]);
        end
      else
        begin
          reg16 <= $unsigned($signed((reg11[(3'h4):(2'h2)] != $signed((~(8'h9e))))));
          reg17 <= $unsigned(($signed(reg12) <= reg14));
        end
      reg20 <= (-reg10);
    end
  module21 #() modinst40 (wire39, clk, reg8, reg6, wire4, wire2);
  assign wire41 = $signed((reg14[(2'h2):(1'h0)] ~^ $signed($unsigned({reg15,
                      reg5}))));
endmodule

module module21
#(parameter param37 = ((({(^~(7'h40)), ((8'hb9) + (8'hb1))} ? (((8'haf) ? (8'hbc) : (7'h42)) ? ((8'hb7) >= (8'hbf)) : (~&(8'hba))) : ((&(8'ha0)) ? (8'had) : (|(8'h9e)))) == (~^((8'ha6) ? ((7'h41) + (8'hbc)) : ((8'h9e) ? (8'ha7) : (7'h41))))) ? ((^{((8'ha8) ? (8'ha7) : (8'hbf))}) ? ((((8'hae) ? (8'hb9) : (8'h9f)) && ((8'hbd) ^~ (7'h40))) ^~ (-(^~(8'h9e)))) : (({(8'ha3)} ^~ ((8'hbf) ? (8'hb9) : (8'haf))) ^ (((8'h9d) >= (8'hb1)) ? ((8'hb6) < (8'h9c)) : ((8'hbf) << (8'hbe))))) : (((((8'ha9) == (8'had)) && ((8'haa) != (8'hb6))) + (8'hbe)) ? {(((8'h9d) <<< (8'hb8)) | ((7'h44) ? (8'hb3) : (8'ha8))), {((8'hb0) ? (8'hae) : (8'hb2))}} : {((8'h9c) >>> ((8'ha2) ? (8'haa) : (8'hbd))), {((8'hac) >= (8'h9e)), ((8'hb3) ? (8'hbd) : (8'h9f))}})), 
parameter param38 = (~|param37))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire26 = wire24[(3'h6):(3'h4)];
  assign wire27 = ({((!$signed(wire22)) * $signed($signed(wire24)))} ?
                      wire24 : (($signed(wire23[(5'h14):(4'h8)]) >>> (wire24 ^~ {wire24,
                          wire23})) & $unsigned(($unsigned(wire26) ?
                          $unsigned(wire24) : (8'ha1)))));
  assign wire28 = wire22;
  assign wire29 = ($signed(((wire25[(1'h0):(1'h0)] ?
                          {wire24} : $unsigned(wire26)) && ($unsigned(wire23) ?
                          wire26 : $signed(wire28)))) ?
                      (~|($signed($unsigned(wire22)) ?
                          $signed((wire25 && wire24)) : (~$signed(wire24)))) : {wire28,
                          (8'hae)});
  always
    @(posedge clk) begin
      reg30 <= {(~|$signed(((!(8'hba)) <= wire22))),
          $signed($unsigned(($signed(wire27) < (wire25 <= wire26))))};
      reg31 <= wire23;
      if ($signed($unsigned(wire27)))
        begin
          reg32 <= reg30;
          reg33 <= $unsigned((8'haa));
        end
      else
        begin
          reg32 <= (reg32 ?
              $signed($unsigned($signed(wire22[(5'h10):(3'h7)]))) : (8'hbd));
          reg33 <= (reg32 ?
              ($unsigned(wire28) ?
                  $signed((|(~wire28))) : $unsigned(wire28[(4'h9):(3'h4)])) : (($unsigned(wire25[(1'h1):(1'h0)]) > $signed($unsigned(wire24))) == {$signed((wire23 ?
                      reg31 : wire29))}));
          reg34 <= reg32[(3'h5):(2'h2)];
          reg35 <= $unsigned((^~((reg33 > wire22[(4'h8):(1'h1)]) ?
              reg30 : {((8'ha8) - reg32), (reg31 <= (8'haf))})));
        end
      reg36 <= wire27;
    end
endmodule
