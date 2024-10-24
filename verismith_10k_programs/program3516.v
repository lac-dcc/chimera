module top
#(parameter param22 = {((~^(((8'hb6) >>> (8'hbe)) ^ {(8'hb5), (8'ha7)})) ? ((((8'hbe) | (8'ha2)) & (~^(8'hbf))) - (((8'hbb) <= (8'hb2)) >> (+(8'hab)))) : {(~&{(8'hb5), (8'ha9)}), (~^(8'h9f))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = {$signed(wire0)};
  assign wire7 = $unsigned($unsigned($signed($unsigned($unsigned(wire1)))));
  assign wire8 = wire3;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed($signed((8'hb2))))))
        begin
          reg9 <= ($signed((-wire1[(4'ha):(2'h2)])) + $unsigned(wire3[(3'h5):(1'h0)]));
        end
      else
        begin
          reg9 <= ({$unsigned($signed((wire1 ? (8'hb4) : wire3)))} ?
              $signed((($unsigned(wire2) ?
                  (wire6 ?
                      wire2 : wire5) : $unsigned(wire5)) != (wire0[(3'h5):(1'h0)] <= (wire7 ?
                  wire3 : wire2)))) : $unsigned($unsigned($unsigned((~|wire7)))));
          reg10 <= {wire7};
          if (reg10[(1'h1):(1'h0)])
            begin
              reg11 <= (-(^$signed((8'hbf))));
            end
          else
            begin
              reg11 <= {reg11};
              reg12 <= $signed((~|reg11[(3'h4):(1'h0)]));
            end
        end
      reg13 <= $signed(({(wire1 << wire8[(3'h6):(1'h0)])} ?
          ($unsigned(wire0[(3'h6):(2'h3)]) ? wire1 : reg10) : (~&(8'hbd))));
    end
  assign wire14 = {wire4[(3'h6):(2'h2)], (~&(wire2 & (+{reg10, wire7})))};
  always
    @(posedge clk) begin
      reg15 <= (!$unsigned((wire1 ?
          ($unsigned(wire8) ? $signed(wire3) : (&reg13)) : (7'h42))));
    end
  assign wire16 = reg15;
  assign wire17 = ((-reg15[(4'ha):(1'h0)]) ?
                      {$unsigned($unsigned((~(8'hb8)))),
                          {($unsigned(wire7) >> wire2)}} : $unsigned(wire7));
  always
    @(posedge clk) begin
      reg18 <= $signed(wire0);
      reg19 <= {((((wire4 ? wire2 : wire4) ?
              (reg11 && wire7) : $signed((8'hae))) & ((wire8 ? wire7 : wire16) ?
              reg18[(3'h7):(1'h0)] : {wire0})) + $unsigned({$signed(reg10),
              (wire14 ? wire2 : wire7)}))};
      reg20 <= (^~reg12);
      reg21 <= {(8'had), (^{wire2[(3'h4):(3'h4)]})};
    end
endmodule
