module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire1[(2'h3):(1'h1)];
  assign wire6 = $signed($signed((8'ha8)));
  assign wire7 = ($unsigned(wire0) == $signed(($signed(wire2[(4'hd):(4'hb)]) >> $signed({wire1}))));
  assign wire8 = $unsigned(wire5);
  always
    @(posedge clk) begin
      reg9 <= ({((^~$signed((8'ha0))) || $unsigned(wire3[(4'hd):(3'h5)]))} ?
          {$signed((8'hb2)),
              ($signed((8'ha1)) ? wire6[(1'h1):(1'h1)] : wire8)} : (8'ha7));
      if ((wire6 ?
          (^$signed((~^{wire1, wire8}))) : ({wire8} ?
              (&$signed($signed(reg9))) : (wire6 ?
                  (wire4 ? wire8[(1'h0):(1'h0)] : {wire0}) : wire6))))
        begin
          reg10 <= (8'had);
          reg11 <= (-wire6[(4'hb):(3'h5)]);
        end
      else
        begin
          reg10 <= ($signed(wire6[(3'h5):(3'h5)]) | $signed(reg10));
          reg11 <= $unsigned({$signed($unsigned($signed(reg10))),
              ((^((8'h9d) << (8'hac))) >= $unsigned(wire3[(1'h0):(1'h0)]))});
          reg12 <= (wire7 - wire1[(1'h1):(1'h0)]);
          reg13 <= $signed((!(~^({wire5} ? {wire4, wire3} : $unsigned(reg9)))));
          reg14 <= ($unsigned($signed(($signed(wire1) ?
              $unsigned(wire1) : reg13))) | wire8[(2'h2):(1'h0)]);
        end
      reg15 <= {$unsigned(($unsigned((wire6 ? reg13 : wire7)) != {(reg11 ?
                  reg12 : (8'ha1))})),
          $signed({{(-wire4), {reg11}}, wire3[(1'h1):(1'h1)]})};
    end
  assign wire16 = reg13[(1'h1):(1'h1)];
  assign wire17 = (!(8'hb1));
  always
    @(posedge clk) begin
      reg18 <= (reg15[(2'h2):(2'h2)] - ((^(~^(wire0 ?
          wire16 : reg12))) <= {reg15[(2'h2):(2'h2)]}));
      if ({(8'hb3)})
        begin
          reg19 <= (wire17[(1'h1):(1'h1)] < (wire7[(2'h2):(2'h2)] - $signed($unsigned($unsigned(reg12)))));
          reg20 <= $unsigned($unsigned(reg18));
        end
      else
        begin
          reg19 <= $unsigned(wire5);
          reg20 <= (((+reg10[(4'h9):(3'h4)]) ?
              wire8[(2'h2):(2'h2)] : reg14) ^ reg14);
          reg21 <= (|(-(reg13[(2'h3):(2'h3)] + ((wire2 | (8'hb0)) & (reg14 ?
              wire16 : wire4)))));
        end
    end
endmodule
