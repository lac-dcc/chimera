module top
#(parameter param23 = (((((~^(8'ha9)) ? ((8'ha1) ? (8'ha6) : (8'ha4)) : ((8'ha7) ? (8'hbe) : (7'h42))) * ((^~(8'hb8)) * {(8'hbb), (8'haa)})) && ({{(8'ha2), (8'hbc)}} ? ((~(8'h9d)) ? {(8'ha0), (8'ha5)} : ((7'h44) ? (8'ha2) : (7'h42))) : {((8'hbe) ? (8'ha9) : (8'ha1)), {(7'h42), (8'haa)}})) != ((8'haf) ? ((8'hb2) ? (((8'hb9) || (8'hb6)) != ((7'h41) ? (7'h41) : (8'hbd))) : (|((8'ha1) & (8'ha6)))) : (~^(((8'hb0) ^~ (8'haa)) <= ((8'hba) > (8'haf)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire18,
                 wire17,
                 reg20,
                 reg19,
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
      if ((wire4[(1'h0):(1'h0)] | wire2[(4'ha):(3'h5)]))
        begin
          if (($unsigned(wire0) | ({wire2, (7'h40)} ?
              (($unsigned(wire2) + (&wire0)) <<< (wire2 <= $unsigned(wire2))) : (($signed(wire2) >> wire4) && {(^~wire0),
                  (wire2 ? (8'h9f) : (8'hba))}))))
            begin
              reg5 <= $unsigned($signed((wire1[(2'h2):(1'h0)] ?
                  ((wire3 * (8'ha0)) ?
                      wire4 : (wire0 * wire4)) : (+wire4[(1'h0):(1'h0)]))));
              reg6 <= (wire3 ?
                  (!($signed($signed(wire3)) ?
                      ((wire3 ? wire0 : reg5) || (wire4 ?
                          (7'h42) : wire3)) : wire3)) : $unsigned($unsigned($signed($unsigned(reg5)))));
              reg7 <= ((~|((wire3 >> (^wire4)) ?
                  (7'h40) : (~&((8'haa) ? (8'haf) : wire3)))) == wire2);
              reg8 <= wire1;
            end
          else
            begin
              reg5 <= ($unsigned(wire4) ?
                  wire0[(3'h4):(2'h2)] : (($unsigned($unsigned(wire2)) ?
                          ($signed(wire1) ?
                              (reg8 - wire0) : wire4[(1'h0):(1'h0)]) : wire1[(4'hb):(4'h8)]) ?
                      (((reg5 + wire3) ? (^wire2) : wire1) ?
                          {reg7[(1'h0):(1'h0)],
                              ((8'hbf) <= reg6)} : $signed(reg6)) : $unsigned(reg7)));
              reg6 <= reg8[(2'h2):(2'h2)];
              reg7 <= (reg8[(3'h4):(2'h3)] * ((^(8'hbc)) ?
                  {wire1[(1'h1):(1'h0)]} : $unsigned((8'hbb))));
            end
          reg9 <= (reg6 ?
              {reg5[(2'h2):(1'h0)],
                  {$signed(wire0[(4'h8):(3'h5)])}} : ((((-wire2) >= (~^(8'hab))) ?
                      reg6[(2'h3):(2'h2)] : $signed($unsigned(wire3))) ?
                  (~^$signed($signed(wire0))) : reg5));
          if (reg5[(4'h9):(2'h2)])
            begin
              reg10 <= (($signed(((wire3 ?
                      wire2 : reg9) <= ((8'hbb) - wire1))) & (|$signed((wire4 ^~ reg7)))) ?
                  {wire0,
                      ((^(wire1 ~^ reg6)) ?
                          $signed($signed(wire4)) : $signed((reg9 + reg6)))} : reg5[(2'h3):(2'h2)]);
              reg11 <= {$signed((8'ha7))};
              reg12 <= $signed($signed($signed($signed($signed(reg7)))));
              reg13 <= $unsigned({($unsigned($unsigned(reg8)) ^~ wire0)});
              reg14 <= ($unsigned((^{$signed(wire4)})) ?
                  $signed((!wire0[(3'h5):(3'h5)])) : reg10);
            end
          else
            begin
              reg10 <= (reg7 ?
                  $signed(reg13[(4'hb):(3'h5)]) : reg11[(1'h1):(1'h0)]);
            end
          reg15 <= $signed((~&$unsigned((~(7'h41)))));
          reg16 <= (wire4[(2'h3):(2'h3)] ?
              (((reg13 | (reg7 - (8'hb2))) * (reg8 ?
                  (reg7 ?
                      reg5 : reg6) : wire1[(3'h5):(2'h3)])) != (-($signed(reg12) ?
                  (wire3 < reg6) : (~reg14)))) : $unsigned(reg12[(2'h3):(1'h0)]));
        end
      else
        begin
          reg5 <= (reg8 | (|reg16[(3'h6):(1'h0)]));
        end
    end
  assign wire17 = {$unsigned($signed(($signed(reg5) ?
                          (reg9 ? wire2 : (8'ha7)) : $signed(reg8)))),
                      (reg5 + {(reg7 - $signed(wire4))})};
  assign wire18 = $signed(wire2);
  always
    @(posedge clk) begin
      reg19 <= {($unsigned((wire4[(2'h3):(2'h2)] ~^ (~^reg5))) ?
              ($unsigned(reg15) ?
                  $signed($signed(reg12)) : wire3[(1'h1):(1'h0)]) : $unsigned($signed((reg14 ^ reg16)))),
          reg11[(4'hf):(3'h7)]};
      reg20 <= $signed(wire4);
    end
  assign wire21 = ({$signed((wire17 ?
                              (reg7 ? wire17 : wire17) : $signed(reg7))),
                          reg11[(5'h11):(1'h1)]} ?
                      $signed((^($unsigned(wire3) == $signed(reg5)))) : $signed($unsigned($unsigned({wire18}))));
  assign wire22 = wire17;
endmodule
