module top
#(parameter param24 = (-{{(((7'h41) > (8'ha1)) == (!(8'hae)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = (~|((+(wire3 ?
                     (~^wire0) : ((8'ha9) ? wire2 : wire1))) == wire0));
  assign wire5 = wire2;
  assign wire6 = (wire2 ?
                     (wire0 > $unsigned((wire3[(2'h2):(1'h1)] ?
                         (wire3 <<< wire2) : wire4[(4'hd):(4'hd)]))) : wire3[(4'hc):(1'h0)]);
  assign wire7 = {$unsigned((wire5[(4'hc):(3'h5)] ^~ ((wire5 ^~ wire6) ?
                         $signed((7'h40)) : (wire3 ? wire3 : wire0)))),
                     $signed((^~wire2))};
  assign wire8 = ({wire2[(1'h0):(1'h0)]} >>> $signed(wire3));
  assign wire9 = $signed($signed((!(!wire1[(1'h0):(1'h0)]))));
  assign wire10 = (($signed(wire4[(4'hc):(2'h2)]) ?
                      (~|(|$unsigned(wire4))) : ($unsigned(wire8[(1'h1):(1'h0)]) & $unsigned((wire9 > wire3)))) >> (!$signed({(wire7 ?
                          wire7 : wire7),
                      wire8[(2'h2):(1'h0)]})));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg11 <= ((&wire4) ?
              ($signed((~&wire7[(3'h4):(2'h2)])) <= wire9) : wire8);
          reg12 <= $signed($unsigned($signed(wire5)));
          reg13 <= ((~^$signed({$signed((8'had))})) ?
              wire5[(4'he):(3'h7)] : ({({wire10} | reg11[(2'h2):(1'h1)])} ?
                  (wire3 ?
                      $signed({wire9}) : $unsigned($signed(wire2))) : reg12[(2'h2):(1'h0)]));
          reg14 <= $signed(wire0[(4'h8):(3'h5)]);
          reg15 <= wire0[(4'hb):(2'h2)];
        end
      else
        begin
          reg11 <= ((!wire3) <<< reg15[(3'h6):(3'h4)]);
          reg12 <= wire4;
          reg13 <= (7'h44);
          reg14 <= wire3;
          reg15 <= ($unsigned(wire4[(3'h6):(1'h1)]) < ($signed($unsigned($unsigned(wire9))) < (~($unsigned(wire4) - reg15))));
        end
    end
  assign wire16 = wire1;
  assign wire17 = {(|((~&$unsigned(wire4)) | $unsigned(wire6[(2'h3):(1'h0)])))};
  always
    @(posedge clk) begin
      reg18 <= wire5[(3'h7):(3'h7)];
      reg19 <= $signed((((~(8'hb7)) | (reg13 ?
          $signed(wire16) : (wire6 ~^ wire1))) << ($signed(reg13) ^~ reg13)));
      reg20 <= ($signed((~^$signed($signed(reg11)))) ?
          (wire8[(1'h0):(1'h0)] ?
              ($signed($signed(wire4)) ?
                  reg12[(1'h0):(1'h0)] : (reg19[(4'hd):(4'hd)] ^ $unsigned(wire4))) : $signed({wire9[(4'h8):(1'h0)]})) : $unsigned((wire10 ^ reg12[(1'h1):(1'h0)])));
      reg21 <= $unsigned((~&$unsigned(wire1)));
    end
  assign wire22 = $signed(({$unsigned((8'ha1)), reg11[(1'h0):(1'h0)]} ?
                      ($unsigned((wire10 ? reg15 : reg20)) ?
                          ($signed(reg11) ?
                              ((8'ha0) < reg12) : (wire10 * wire5)) : ({wire10} ?
                              $unsigned(reg20) : {reg14})) : ($signed($unsigned(wire10)) < ($signed(wire10) > $unsigned(reg11)))));
  assign wire23 = $signed(wire10[(3'h7):(3'h4)]);
endmodule
