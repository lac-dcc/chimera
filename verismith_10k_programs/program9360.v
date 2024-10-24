module top
#(parameter param23 = {(((8'haa) <<< (((8'ha3) ? (8'had) : (8'haa)) <= ((8'haa) << (8'ha4)))) ~^ ((((8'hbb) && (8'h9c)) ? {(8'ha5)} : ((8'hb9) != (8'hab))) ? (((8'haf) ? (8'hb9) : (8'hb5)) ? ((8'had) ? (8'hb7) : (7'h44)) : (8'hb2)) : (~&((7'h44) != (8'ha9))))), {{(~^((8'ha0) ? (8'hb9) : (7'h42)))}}}, 
parameter param24 = {param23, (param23 && (param23 ^ param23))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = {((($unsigned(wire5) ?
                         wire5 : (wire2 ? wire3 : wire3)) == (~&(wire1 ?
                         wire5 : (8'hac)))) <<< (wire3 != ((~^wire5) ?
                         $signed(wire2) : (wire0 ? wire4 : wire2))))};
  assign wire7 = wire1[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg8 <= (8'hbb);
      if ($unsigned((!(reg8[(4'h8):(2'h3)] <= {(wire5 >>> reg8),
          wire5[(3'h7):(3'h5)]}))))
        begin
          reg9 <= $unsigned(($unsigned((8'ha2)) | ((~|$signed(wire5)) >= $unsigned(reg8[(4'hb):(1'h1)]))));
          if ($unsigned(((~^wire0[(3'h5):(1'h0)]) <<< wire5)))
            begin
              reg10 <= ((-(^~((~&wire5) ?
                  wire5 : (7'h41)))) & $unsigned(wire4[(5'h12):(2'h2)]));
              reg11 <= {(8'hb6)};
              reg12 <= (^~({($signed(wire6) ?
                          (~wire3) : (reg11 ? wire7 : wire3))} ?
                  reg10 : wire6));
              reg13 <= $unsigned(((8'hb9) < $signed(((wire2 >= reg11) ?
                  reg10 : reg11[(5'h12):(3'h4)]))));
              reg14 <= wire6[(1'h1):(1'h1)];
            end
          else
            begin
              reg10 <= wire5;
              reg11 <= (^({$unsigned((~&wire0))} <<< $signed(wire3)));
              reg12 <= {wire3[(3'h5):(1'h1)]};
              reg13 <= $signed(({{(wire7 == wire5)}} ?
                  $unsigned(((reg11 ?
                      wire5 : reg8) || $signed(wire2))) : {wire0[(3'h6):(3'h4)],
                      wire7}));
            end
          reg15 <= ($unsigned((-(wire1 || (reg11 ? reg8 : wire1)))) ?
              ({reg10} - ($signed($signed(wire2)) <= {(reg11 << wire5)})) : $unsigned(wire7[(1'h0):(1'h0)]));
          if ({wire2})
            begin
              reg16 <= reg9[(3'h7):(3'h5)];
              reg17 <= $signed(wire7);
              reg18 <= (&$unsigned($unsigned(($signed(reg12) ?
                  (7'h43) : $signed((8'haf))))));
            end
          else
            begin
              reg16 <= wire5;
            end
        end
      else
        begin
          if ($unsigned(wire3[(3'h6):(2'h3)]))
            begin
              reg9 <= ((&(reg11[(4'h8):(1'h0)] ?
                      ((wire4 - reg18) == wire0) : (~(reg15 ?
                          reg15 : reg11)))) ?
                  $unsigned($signed(((|wire7) <<< reg14))) : reg9);
              reg10 <= $unsigned((reg17[(1'h1):(1'h1)] == (reg10 - ((wire0 ?
                  reg13 : reg16) << $signed(wire5)))));
            end
          else
            begin
              reg9 <= reg8;
              reg10 <= wire3[(3'h5):(2'h2)];
            end
        end
      reg19 <= (|reg9[(5'h12):(1'h1)]);
      reg20 <= {{reg8,
              ($signed(((8'hbf) ?
                  reg19 : reg10)) << ((reg18 && wire6) > (reg14 + (8'ha3))))},
          ((($signed(reg10) || (|reg10)) ?
                  (|$signed(wire1)) : (~|(reg9 ? (7'h41) : reg12))) ?
              {reg15[(3'h7):(3'h4)],
                  reg19} : ($signed((!reg15)) << ($signed(wire7) ?
                  $unsigned(wire4) : $signed(reg9))))};
    end
  assign wire21 = $signed($unsigned((~&reg10)));
  assign wire22 = $unsigned(reg20);
endmodule
