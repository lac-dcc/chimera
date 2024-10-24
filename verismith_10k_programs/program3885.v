module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire34, wire33, wire32, wire30, wire5, wire4, (1'h0)};
  assign wire4 = (((wire2 - (8'h9f)) && (7'h41)) ?
                     wire2[(1'h1):(1'h0)] : wire0);
  assign wire5 = $unsigned($signed($unsigned(($unsigned(wire1) ?
                     (wire1 ^~ wire3) : wire2[(2'h2):(1'h0)]))));
  module6 #() modinst31 (wire30, clk, wire3, wire2, wire0, wire5);
  assign wire32 = ({$unsigned(wire30[(1'h0):(1'h0)]),
                          (wire1[(1'h0):(1'h0)] ?
                              $signed($unsigned((8'hb4))) : ($signed(wire5) ?
                                  (+wire5) : (|wire0)))} ?
                      ($signed((|wire3[(4'hb):(3'h6)])) ^ wire3[(5'h10):(4'ha)]) : wire4[(1'h0):(1'h0)]);
  assign wire33 = wire4[(1'h1):(1'h0)];
  assign wire34 = $unsigned($signed($signed(($unsigned(wire3) >>> {wire32,
                      (8'ha8)}))));
endmodule

module module6
#(parameter param29 = {((7'h41) ? {(+(~|(8'ha1))), (^((8'hb2) ? (8'ha5) : (8'h9e)))} : ({(~^(8'ha6))} & ({(8'had), (8'ha4)} ? (^~(8'hb1)) : (^(8'hbe)))))})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire11;
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire13,
                 wire11,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 reg12,
                 (1'h0)};
  assign wire11 = $unsigned({{wire9,
                          (((8'h9c) <= (8'h9f)) ?
                              wire9[(2'h2):(1'h0)] : wire10)},
                      wire8});
  always
    @(posedge clk) begin
      reg12 <= wire7[(3'h5):(1'h1)];
    end
  assign wire13 = {wire8, $unsigned(wire10[(4'ha):(2'h2)])};
  always
    @(posedge clk) begin
      reg14 <= (+$signed((~|wire11)));
      if (((~|wire11) <= $unsigned($signed((~^(wire7 ? wire7 : wire7))))))
        begin
          if ({wire10[(3'h4):(2'h3)]})
            begin
              reg15 <= wire10[(3'h4):(3'h4)];
              reg16 <= ($signed(((^~{reg15}) ?
                  ((wire7 ? reg12 : wire7) & (wire13 ?
                      reg14 : wire11)) : wire11)) & ($unsigned(({wire10} && {wire10})) ?
                  ({wire8,
                      wire11} + wire9[(2'h2):(1'h1)]) : $unsigned(($signed((8'ha2)) - $unsigned((8'hae))))));
              reg17 <= wire10[(1'h1):(1'h0)];
              reg18 <= (((!(|$signed(reg17))) >= wire11[(3'h4):(1'h1)]) || $signed((~(|wire7))));
              reg19 <= wire11[(2'h2):(1'h0)];
            end
          else
            begin
              reg15 <= wire10;
            end
          reg20 <= $unsigned({{$unsigned(wire13),
                  $signed(((8'hb1) ? (8'ha6) : (8'h9c)))}});
          reg21 <= (&$signed($unsigned((!(reg17 <= (8'hb7))))));
          if (reg16[(2'h2):(1'h0)])
            begin
              reg22 <= ((reg14 || $unsigned($signed($unsigned(wire10)))) + (8'hb6));
              reg23 <= (wire10 ~^ (^(((8'ha5) > (reg21 + reg14)) ?
                  wire7 : wire11[(3'h5):(1'h0)])));
              reg24 <= reg12[(2'h2):(1'h0)];
              reg25 <= $unsigned({wire7, reg21[(4'hd):(3'h6)]});
            end
          else
            begin
              reg22 <= reg21[(2'h3):(2'h3)];
              reg23 <= (&{{(!(^wire11)),
                      (reg25[(1'h1):(1'h0)] ?
                          {(8'haf), wire13} : $signed(reg21))},
                  (&$signed(wire7[(3'h6):(3'h5)]))});
              reg24 <= (wire9[(1'h1):(1'h1)] ?
                  reg21[(3'h5):(1'h1)] : ((!{(-reg15)}) ?
                      $unsigned(((8'ha9) ?
                          $signed((7'h40)) : (reg12 ?
                              reg15 : reg14))) : (~|wire10[(4'hd):(4'ha)])));
              reg25 <= wire7[(4'hb):(3'h5)];
            end
        end
      else
        begin
          if ($unsigned((($unsigned((~reg22)) || $unsigned(reg14[(4'h8):(1'h1)])) ?
              {wire8,
                  {reg24[(2'h3):(2'h2)]}} : $signed(($unsigned((8'h9f)) >= (~^reg19))))))
            begin
              reg15 <= (($signed(reg16[(3'h6):(3'h5)]) ~^ wire10) >>> (8'ha4));
              reg16 <= ($unsigned($signed(reg20)) | $unsigned((^reg14)));
              reg17 <= ({reg22, $signed(wire8[(4'h8):(2'h2)])} * reg22);
            end
          else
            begin
              reg15 <= $unsigned(wire9);
              reg16 <= reg14[(1'h1):(1'h1)];
              reg17 <= $unsigned(reg20);
              reg18 <= $signed($signed($signed(((8'haa) ?
                  (reg18 ? reg21 : reg23) : reg17[(4'he):(2'h2)]))));
            end
        end
      reg26 <= (8'had);
      reg27 <= ({reg21[(5'h11):(1'h0)],
          $unsigned(reg23)} ^ (+reg18[(1'h0):(1'h0)]));
      reg28 <= {((8'hb1) ?
              ($signed((reg24 | wire8)) ?
                  ($unsigned(wire13) & {reg15,
                      reg20}) : (^(&(8'hba)))) : ((!{reg17}) >> reg27[(4'ha):(1'h1)])),
          (wire7[(4'ha):(3'h7)] < $signed($signed((reg20 != (8'hb9)))))};
    end
endmodule
