module top
#(parameter param33 = (~^((+(8'hae)) > ((((8'hb3) < (8'hb6)) ^ {(8'hb5), (8'hb8)}) ? {((8'hb1) + (8'hb9))} : ({(8'h9e)} ? (|(8'hb5)) : (7'h41))))), 
parameter param34 = (8'ha5))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire15,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed(wire3);
  assign wire6 = wire5;
  assign wire7 = ({(({wire6, wire5} > (wire1 ?
                             wire3 : wire3)) != ({wire6} || wire3[(3'h4):(1'h1)]))} ?
                     $unsigned((^{(wire0 | wire0),
                         (wire4 ? (7'h40) : wire3)})) : (~&(~(-(wire1 ?
                         wire4 : wire1)))));
  assign wire8 = (!$signed($signed(((!wire0) > (wire1 ? wire2 : wire0)))));
  always
    @(posedge clk) begin
      reg9 <= (wire3 ? (8'hac) : wire3);
      if ((&((wire6[(1'h0):(1'h0)] * (8'hbf)) ?
          ((8'ha2) ?
              wire2[(2'h2):(1'h0)] : $signed($signed(wire8))) : $unsigned($signed((^~wire4))))))
        begin
          reg10 <= (^~((($unsigned(wire4) ?
                  $unsigned(wire4) : wire1[(3'h6):(2'h2)]) ?
              $unsigned((wire5 | wire6)) : (^~$unsigned(wire5))) << ({{(8'hb0)}} ?
              $unsigned({wire5, wire2}) : $unsigned($signed(wire5)))));
          reg11 <= ((!wire8[(4'hc):(4'hc)]) ?
              (|{wire6[(1'h0):(1'h0)],
                  $unsigned((wire0 ? wire4 : wire3))}) : reg10[(4'h9):(4'h9)]);
        end
      else
        begin
          if (wire7[(4'ha):(4'ha)])
            begin
              reg10 <= (-(wire4 && $signed((wire1 != {wire4, wire0}))));
              reg11 <= (8'hbb);
            end
          else
            begin
              reg10 <= {(wire1 ?
                      (~wire2[(1'h1):(1'h1)]) : {wire3, wire1[(3'h7):(3'h5)]})};
            end
          reg12 <= $signed(wire8[(4'hf):(2'h2)]);
          reg13 <= wire5[(2'h3):(1'h1)];
          reg14 <= wire7[(4'hb):(3'h7)];
        end
    end
  assign wire15 = $unsigned(wire6);
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire6[(2'h2):(1'h0)]);
      if (reg10)
        begin
          reg17 <= $signed(reg13);
          reg18 <= (reg14[(2'h2):(1'h0)] != (reg13[(3'h7):(2'h3)] - $signed(reg14)));
        end
      else
        begin
          reg17 <= {(wire5 ?
                  wire15[(1'h0):(1'h0)] : $unsigned(wire0[(1'h1):(1'h0)]))};
          if (wire15)
            begin
              reg18 <= ($signed($signed(wire5[(3'h5):(3'h5)])) ?
                  ((|(wire8 ? {reg17} : $signed(reg16))) ?
                      $signed(reg10[(1'h0):(1'h0)]) : reg9) : (-$signed($unsigned((reg14 ?
                      wire1 : wire5)))));
              reg19 <= wire1;
              reg20 <= ($unsigned((~|wire15[(1'h1):(1'h0)])) == (wire2[(1'h1):(1'h0)] ?
                  wire2[(1'h0):(1'h0)] : (((wire0 ^~ wire1) | reg18[(4'hf):(3'h6)]) <<< (wire8[(4'hf):(3'h4)] <<< (wire1 <<< wire6)))));
              reg21 <= wire5[(2'h3):(2'h3)];
              reg22 <= (({$signed((wire7 ? reg13 : reg14)),
                      ((reg13 ? (8'haa) : reg10) ? (^reg9) : reg9)} * {reg9,
                      (wire4 ? $unsigned(wire0) : {wire2, reg12})}) ?
                  (reg20[(4'hb):(3'h6)] ~^ $unsigned((8'hb5))) : $unsigned((|{wire0[(1'h0):(1'h0)]})));
            end
          else
            begin
              reg18 <= reg19[(2'h2):(1'h1)];
              reg19 <= $signed($unsigned($unsigned($signed($unsigned(wire7)))));
              reg20 <= {({($signed(reg13) ? (reg16 >> reg13) : wire7),
                      $unsigned($unsigned(reg18))} * (wire4 <<< ((reg14 ?
                          wire0 : reg13) ?
                      (wire1 ~^ reg19) : wire2[(2'h2):(1'h0)])))};
              reg21 <= wire6[(1'h0):(1'h0)];
            end
          reg23 <= (8'hbe);
          reg24 <= (($signed(((^reg22) && $signed(reg23))) ?
                  $unsigned($unsigned(wire15[(2'h3):(1'h1)])) : {$unsigned((reg18 ?
                          wire8 : reg23)),
                      reg17[(3'h6):(3'h6)]}) ?
              ($signed((((8'haa) ? (8'haa) : reg16) & (reg19 ?
                  reg12 : reg20))) - ({(wire2 ? reg20 : wire15)} ?
                  wire2 : (^~$signed(reg16)))) : $unsigned(($signed(reg22[(4'hc):(4'h8)]) >= $unsigned($unsigned(wire8)))));
          reg25 <= (-wire8[(4'h9):(3'h4)]);
        end
      if ($unsigned(reg14))
        begin
          reg26 <= (wire2[(1'h1):(1'h1)] ? ((+wire1) >= (&reg16)) : (~|wire15));
          reg27 <= (reg11 >= ($unsigned($signed($unsigned(wire4))) ?
              $signed($unsigned(reg13)) : (+(~$unsigned(wire5)))));
        end
      else
        begin
          reg26 <= (8'hbf);
          if ((reg17 ?
              ($unsigned(wire0) ?
                  reg13 : (reg13 ?
                      (^$unsigned((8'hbb))) : reg18)) : (reg22 && $unsigned($unsigned($signed(reg11))))))
            begin
              reg27 <= wire8[(4'h9):(3'h5)];
              reg28 <= $signed((wire0 ?
                  wire4 : (reg10[(3'h5):(1'h1)] | ((wire2 ? (8'h9f) : reg22) ?
                      wire2[(1'h0):(1'h0)] : (reg18 | reg18)))));
            end
          else
            begin
              reg27 <= $unsigned(reg10[(4'hc):(4'ha)]);
            end
          reg29 <= (^((^~reg21[(3'h5):(3'h5)]) ?
              ((-$signed(wire7)) ?
                  wire15[(1'h1):(1'h1)] : reg19) : ($unsigned(wire4[(2'h2):(2'h2)]) ?
                  reg26 : (reg28 >= ((8'hbc) && reg9)))));
          reg30 <= (^~$signed((~^reg18)));
        end
      reg31 <= reg14[(2'h3):(2'h3)];
      reg32 <= ((($unsigned($signed(wire2)) < {(reg30 ?
                  wire1 : reg29)}) == (^reg12)) ?
          ((+(~^wire8)) ?
              (^~reg25) : {reg31[(4'ha):(3'h4)]}) : (~$signed({$signed(reg25)})));
    end
endmodule
