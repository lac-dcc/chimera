module top
#(parameter param25 = (~^((^~({(7'h40), (8'h9f)} ? ((8'haa) >= (8'haa)) : ((8'ha3) >>> (8'ha0)))) > (8'haa))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = (wire3 == ($unsigned(((wire0 >= (8'ha2)) ~^ (wire0 ?
                     wire4 : (8'hbe)))) | (~&(wire4 ?
                     $signed(wire1) : (wire0 ? wire3 : wire3)))));
  assign wire6 = wire5;
  assign wire7 = (~|(wire2 ?
                     $unsigned((~^wire3[(3'h4):(2'h3)])) : (~^(wire4[(1'h1):(1'h0)] ^ (wire6 != wire1)))));
  assign wire8 = $signed($unsigned(((wire5[(4'h8):(2'h3)] > (wire5 ?
                         wire3 : wire4)) ?
                     $signed(wire4) : (&wire6[(3'h6):(1'h1)]))));
  assign wire9 = ((^($signed($unsigned(wire8)) ?
                         $signed(wire4[(3'h7):(3'h4)]) : wire5[(4'h8):(1'h0)])) ?
                     (~|((wire5 ? (wire4 ? wire1 : wire3) : (~|wire8)) ?
                         ({(8'hbe)} < $signed(wire0)) : {(wire1 ?
                                 wire0 : wire1),
                             (wire6 <= (8'hab))})) : $unsigned($signed(wire8)));
  assign wire10 = {({(wire2 ? wire7[(3'h4):(3'h4)] : wire9)} ^~ (wire3 ?
                          ($unsigned(wire6) ?
                              $unsigned(wire4) : $signed((8'hb3))) : $unsigned((|(8'ha8)))))};
  assign wire11 = {wire10[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      if ((wire6[(4'hb):(3'h7)] <<< $unsigned((!$signed($unsigned(wire2))))))
        begin
          if (wire9[(1'h0):(1'h0)])
            begin
              reg12 <= $signed((+$signed(((wire1 ?
                  wire11 : wire4) ~^ $signed((8'ha9))))));
              reg13 <= $signed(((((!wire10) ?
                          (wire1 ~^ (8'hb3)) : $unsigned(wire11)) ?
                      ({wire6} ?
                          (wire8 >= wire3) : wire3[(4'hc):(4'ha)]) : ($signed(wire5) ~^ (~&wire10))) ?
                  wire11 : $unsigned({{wire5}})));
              reg14 <= wire0;
              reg15 <= (-((^~$unsigned((wire0 ?
                  wire6 : (8'hb2)))) < {wire11[(3'h6):(2'h2)],
                  (wire7[(4'hd):(1'h0)] ? {wire9, wire5} : wire2)}));
              reg16 <= ($signed(reg13) ?
                  (({(8'hac)} ?
                          $signed($signed(reg12)) : ((wire5 && (8'hba)) ?
                              $signed((8'hb3)) : (wire2 ~^ wire3))) ?
                      (&($unsigned(wire0) | (reg14 ?
                          wire7 : wire6))) : wire6) : $unsigned(wire10));
            end
          else
            begin
              reg12 <= reg15[(1'h1):(1'h0)];
              reg13 <= ($unsigned((~$unsigned($signed(wire9)))) ?
                  (~^$unsigned((wire11 ?
                      $signed(wire10) : ((8'hb5) || wire8)))) : (&$unsigned(({wire0} ?
                      $signed(reg15) : wire5))));
              reg14 <= $unsigned($unsigned((wire3 ?
                  ($unsigned(reg15) ?
                      $unsigned(wire4) : wire9) : (~|wire0[(2'h3):(2'h3)]))));
            end
          if (wire2)
            begin
              reg17 <= (-{$unsigned((8'hb0))});
              reg18 <= reg16[(3'h4):(2'h3)];
              reg19 <= (~&((8'hba) ?
                  {$unsigned($unsigned(reg12))} : (wire11 << reg17)));
            end
          else
            begin
              reg17 <= $unsigned({($unsigned(reg17[(1'h1):(1'h0)]) ?
                      (((8'ha2) ? wire0 : wire2) ?
                          $unsigned(wire2) : wire2) : reg17[(1'h1):(1'h1)])});
              reg18 <= (8'h9d);
              reg19 <= wire11[(1'h1):(1'h1)];
              reg20 <= {wire11};
            end
          reg21 <= $signed($unsigned((&reg17[(5'h11):(3'h5)])));
          reg22 <= $unsigned((~^wire6[(4'h9):(3'h6)]));
          reg23 <= ($signed((|$unsigned((wire10 ? reg16 : reg16)))) ?
              reg12[(4'h8):(2'h2)] : (8'ha7));
        end
      else
        begin
          reg12 <= ($unsigned($signed($signed((~|wire3)))) ?
              reg16[(2'h3):(2'h3)] : {(~reg19), reg18});
          if ((8'hb5))
            begin
              reg13 <= ($unsigned(wire5[(4'h9):(2'h3)]) ?
                  ((((|reg19) ? $unsigned(reg23) : $signed(reg20)) >> wire10) ?
                      (8'hb5) : ((reg23 ? {wire1} : wire5) ?
                          wire0 : reg20[(1'h0):(1'h0)])) : $signed((!((8'hb5) ?
                      (wire0 > (8'hae)) : reg13))));
            end
          else
            begin
              reg13 <= wire5[(4'h8):(4'h8)];
              reg14 <= (reg23 && $unsigned($unsigned(($signed(reg22) < wire3))));
              reg15 <= $unsigned($unsigned(wire4[(3'h4):(2'h3)]));
            end
          reg16 <= {$unsigned((+reg15)), reg19};
        end
      reg24 <= (!$unsigned($unsigned(((reg19 ? wire3 : reg21) ?
          $unsigned(wire6) : wire7))));
    end
endmodule
