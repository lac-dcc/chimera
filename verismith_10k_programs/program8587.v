module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire33, wire32, wire31, wire30, wire29, wire27, wire4, (1'h0)};
  assign wire4 = wire1[(3'h6):(2'h3)];
  module5 #() modinst28 (wire27, clk, wire3, wire0, wire1, wire4);
  assign wire29 = wire4;
  assign wire30 = $signed($signed($signed(wire0)));
  assign wire31 = wire2;
  assign wire32 = wire31;
  assign wire33 = $signed(($signed($unsigned(wire4[(1'h0):(1'h0)])) != (~|(+$signed(wire27)))));
endmodule

module module5
#(parameter param26 = {(~|(-{{(8'hbb), (8'haf)}, ((8'hbc) & (8'ha6))})), {((+{(8'hb5), (8'haf)}) + (8'hbe))}})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = wire7;
  assign wire11 = wire10;
  assign wire12 = $unsigned((wire9[(4'ha):(2'h3)] ?
                      ({wire8[(4'h9):(4'h9)]} != {(~^wire10),
                          (wire10 ?
                              wire7 : wire9)}) : $signed(((~^wire8) * (wire9 << wire9)))));
  assign wire13 = $signed($unsigned(wire7[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ((~&(^($signed((wire9 ~^ wire12)) ?
          (!(^(8'hb7))) : {(wire10 ? wire12 : wire7)}))))
        begin
          reg14 <= (!(wire12[(1'h0):(1'h0)] ^~ wire6));
          reg15 <= {((-wire7[(1'h0):(1'h0)]) ?
                  wire8 : ((~&{(8'hb9), wire9}) ?
                      ((wire7 ^~ wire9) ? $signed(wire12) : (8'h9f)) : ({wire8,
                              wire9} ?
                          wire10 : (wire10 ? wire9 : wire11))))};
          reg16 <= $signed(($signed($unsigned(((8'hb8) < reg14))) << ($unsigned($signed(wire13)) ?
              reg15 : wire8)));
          if ($unsigned(reg14))
            begin
              reg17 <= $unsigned($signed(reg14));
              reg18 <= (8'hac);
            end
          else
            begin
              reg17 <= (8'hba);
            end
          reg19 <= $unsigned(wire13[(1'h1):(1'h1)]);
        end
      else
        begin
          if ((~^reg16))
            begin
              reg14 <= ({(!wire12)} == (~&$unsigned($unsigned(reg18[(4'ha):(2'h2)]))));
            end
          else
            begin
              reg14 <= $signed(({(reg17 == (reg14 ? wire7 : reg17)),
                  (reg15[(2'h2):(1'h1)] == (wire7 >= wire12))} & wire7));
              reg15 <= {(wire10 ?
                      (reg16 ?
                          $unsigned((!wire8)) : ($signed(wire12) && {wire13,
                              reg14})) : (((wire10 - reg19) - {wire11,
                              wire12}) ?
                          (8'hbd) : $unsigned((wire7 & wire8)))),
                  wire10[(1'h1):(1'h0)]};
              reg16 <= ({$unsigned(wire11[(3'h4):(1'h0)])} ?
                  wire8[(4'h8):(4'h8)] : wire13);
              reg17 <= reg15;
              reg18 <= (({{(~&(8'had))}} ?
                  wire6[(3'h7):(3'h4)] : (((~&reg17) && (reg14 ?
                          wire8 : wire8)) ?
                      ($signed(wire8) ^~ wire7) : {wire6,
                          (+wire6)})) >> $signed(reg16[(4'he):(4'he)]));
            end
          reg19 <= wire10[(4'he):(4'hd)];
        end
      reg20 <= (^~(!(^($signed(reg15) ?
          (reg17 ? wire9 : reg19) : $unsigned(reg17)))));
      reg21 <= reg15;
    end
  assign wire22 = {reg16[(4'hf):(4'hb)], (8'hb4)};
  assign wire23 = $unsigned($unsigned((7'h41)));
  assign wire24 = wire22;
  assign wire25 = reg17;
endmodule
