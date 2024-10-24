module top
#(parameter param30 = ((({((8'h9e) * (8'h9d)), ((8'h9e) ? (8'hae) : (8'h9c))} >= ((~^(7'h42)) <= (-(8'ha8)))) >>> ((~{(8'hb0), (8'hb8)}) ? (&((8'h9d) ? (8'h9e) : (8'hbd))) : ((^(8'ha3)) ? ((8'hbd) + (8'haa)) : (-(8'hab))))) >> (!(({(8'hbb), (8'hba)} < ((8'h9e) ? (8'hba) : (8'hb3))) == (-{(8'hbe)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  assign y = {wire29,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg28,
                 reg27,
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
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed((wire1 || (&{(+(8'ha9)), {wire4, (8'hbb)}})));
  assign wire6 = $signed($unsigned(wire2[(4'hb):(3'h7)]));
  assign wire7 = wire4[(2'h2):(1'h0)];
  assign wire8 = ((^wire6) ?
                     $signed({wire0[(4'hd):(2'h2)],
                         (^$signed((8'ha0)))}) : (8'hb7));
  always
    @(posedge clk) begin
      reg9 <= (~wire8);
      if (wire8[(4'ha):(2'h2)])
        begin
          reg10 <= (+$unsigned(wire3));
          reg11 <= ({$unsigned({((7'h44) + wire7), (&reg10)}),
                  ((wire5[(2'h3):(2'h2)] + (wire8 | wire0)) ?
                      (8'hbb) : ((reg9 ? wire0 : wire1) ?
                          {wire5, wire3} : (~wire2)))} ?
              $unsigned(wire5) : wire8);
        end
      else
        begin
          if ($unsigned($signed((!wire6[(2'h2):(2'h2)]))))
            begin
              reg10 <= ((reg10 ?
                      ({(~|(8'h9e))} + wire5) : wire1[(2'h3):(1'h0)]) ?
                  $unsigned($unsigned($signed(wire8))) : $signed(wire6));
              reg11 <= $unsigned((reg9[(3'h5):(1'h0)] + wire5[(3'h7):(2'h3)]));
              reg12 <= $unsigned(wire1);
              reg13 <= $signed(wire2[(2'h2):(2'h2)]);
            end
          else
            begin
              reg10 <= {wire8[(4'h8):(2'h2)], (!wire7)};
            end
          reg14 <= $signed($signed($signed(reg9)));
        end
      reg15 <= (-wire1);
      if ((wire3[(3'h6):(3'h5)] ? reg11 : $unsigned(wire5[(1'h1):(1'h0)])))
        begin
          reg16 <= $unsigned(({((wire3 - reg12) || $unsigned(wire2))} < ({(reg10 ?
                      wire1 : reg12)} ?
              (!reg9[(1'h0):(1'h0)]) : reg11)));
          reg17 <= (^(wire1 != (wire4[(1'h0):(1'h0)] << reg15)));
          reg18 <= (reg10[(4'ha):(1'h0)] ?
              reg16[(1'h0):(1'h0)] : $signed((($signed(wire3) >= (wire8 >= reg9)) ?
                  reg16 : wire2[(4'h8):(2'h2)])));
        end
      else
        begin
          if ((8'hb4))
            begin
              reg16 <= ($unsigned(wire2) > $unsigned(($unsigned((^~(7'h43))) ^~ wire3[(2'h3):(1'h0)])));
              reg17 <= (wire0[(4'he):(4'h8)] ?
                  reg10[(3'h7):(2'h2)] : $unsigned((&(&reg17[(4'h9):(2'h2)]))));
              reg18 <= $signed((&(($unsigned(reg10) ?
                  (~^wire2) : (-reg18)) - (^$signed(reg10)))));
              reg19 <= reg10;
              reg20 <= (8'hb8);
            end
          else
            begin
              reg16 <= $unsigned($signed(((wire6[(5'h12):(3'h4)] <= {wire0}) ?
                  ({reg20, wire1} ? (reg9 ^ wire5) : {wire3}) : reg19)));
              reg17 <= $unsigned($unsigned(reg17[(4'hb):(1'h1)]));
              reg18 <= (~reg16);
              reg19 <= (&wire1[(3'h4):(2'h3)]);
            end
        end
      reg21 <= $signed(((wire5 ?
              $signed(reg16[(2'h2):(1'h0)]) : $unsigned({reg14, reg17})) ?
          wire1[(1'h1):(1'h1)] : (~&$signed($signed(wire0)))));
    end
  assign wire22 = (!{(wire2[(3'h4):(2'h2)] & {{reg13, wire5},
                          wire8[(4'h9):(1'h0)]}),
                      $signed((~&(wire1 - wire4)))});
  assign wire23 = (+$signed((($unsigned(reg20) ?
                          (~|wire22) : (reg9 ? wire2 : wire6)) ?
                      ((wire5 + reg19) > $unsigned(wire2)) : $signed($signed(reg20)))));
  assign wire24 = reg10[(5'h12):(1'h1)];
  assign wire25 = ({wire1, reg11[(4'hd):(3'h7)]} ?
                      (wire6[(4'hb):(1'h0)] ?
                          {((wire8 - (8'ha3)) && (wire6 ? reg19 : wire8)),
                              {{wire23, wire24},
                                  $unsigned(wire8)}} : (|(wire0[(3'h5):(2'h3)] & $unsigned((8'hab))))) : $signed(($signed(reg15) ~^ (wire7[(4'hc):(4'h9)] ?
                          $unsigned((8'ha4)) : {wire23, reg12}))));
  assign wire26 = reg13;
  always
    @(posedge clk) begin
      reg27 <= {(wire22 ? $signed(reg12[(4'h8):(1'h0)]) : wire22),
          ((((~|wire23) ? (reg10 - wire2) : reg12) ?
              reg10[(4'h8):(2'h2)] : $unsigned((reg15 ?
                  reg12 : reg21))) < wire25)};
      reg28 <= wire8;
    end
  assign wire29 = (~$unsigned($signed(reg13)));
endmodule
