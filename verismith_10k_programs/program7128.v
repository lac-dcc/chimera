module top
#(parameter param24 = {(({{(8'h9c), (8'hb2)}, (8'hba)} ? {{(8'ha0)}, ((8'ha2) ? (8'ha2) : (8'ha1))} : ((~(8'ha3)) - {(8'ha1), (8'hbb)})) & (8'hb7)), ((~((~^(8'hb8)) ? (-(8'hbe)) : ((8'hb2) < (8'hac)))) ? {(((8'ha7) >= (8'hbd)) ? (8'ha6) : ((8'ha4) ? (8'haf) : (8'ha7))), (~((8'hb2) ? (7'h44) : (7'h41)))} : (~|({(8'hb5), (8'hae)} ? (~&(8'hbd)) : ((8'hb0) && (7'h44)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  assign y = {wire23,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = wire3[(5'h11):(5'h10)];
  assign wire7 = (($unsigned(((~wire0) ?
                     {wire4,
                         wire2} : wire6[(2'h2):(1'h0)])) >> $signed(wire5)) ~^ $signed(wire5));
  assign wire8 = {(wire4 < $unsigned(((wire6 && wire6) == (wire2 ?
                         wire5 : wire3))))};
  assign wire9 = $signed(wire1);
  assign wire10 = wire3[(4'hc):(1'h1)];
  assign wire11 = $unsigned(($unsigned(((wire4 ? wire10 : wire10) ?
                          (|wire1) : wire0)) ?
                      $unsigned({(wire3 & wire8),
                          (wire10 ?
                              wire1 : wire4)}) : ($signed((~wire7)) > wire9[(3'h6):(1'h1)])));
  assign wire12 = wire9;
  assign wire13 = ((wire1[(4'hf):(3'h7)] > wire11) >= (&(wire6 ?
                      wire3 : (~^$signed(wire12)))));
  always
    @(posedge clk) begin
      if ($unsigned(((~{(wire1 ?
              wire0 : wire1)}) > $signed((+$signed(wire4))))))
        begin
          reg14 <= (!(wire12 >> $unsigned((^$unsigned(wire4)))));
          reg15 <= wire4;
          reg16 <= ({$unsigned(({wire3, (8'hae)} ?
                      ((8'hbe) ? wire13 : reg14) : $signed(reg15)))} ?
              (&wire2[(2'h2):(1'h1)]) : ($unsigned(wire13[(2'h3):(2'h3)]) ~^ (~(!(~&reg14)))));
        end
      else
        begin
          reg14 <= (~^($signed($unsigned((&(8'hb1)))) ?
              $unsigned(wire4) : ({(~^wire0)} ?
                  ((8'ha6) || (wire2 * wire7)) : wire5[(1'h1):(1'h0)])));
        end
      if (wire6)
        begin
          reg17 <= (~|$signed(($unsigned($unsigned(wire11)) ^~ wire11[(2'h3):(1'h0)])));
          if (wire6[(2'h2):(1'h1)])
            begin
              reg18 <= (($signed(wire11) * (($signed((8'hbe)) ?
                      (wire4 ? wire10 : wire11) : wire3) ?
                  wire9 : (~|wire7[(1'h0):(1'h0)]))) != (-{((-wire8) ?
                      (^~(8'hac)) : (reg16 ? wire5 : wire8))}));
              reg19 <= {wire7};
              reg20 <= {$unsigned($unsigned($signed($unsigned(reg15)))),
                  (|wire12[(1'h0):(1'h0)])};
            end
          else
            begin
              reg18 <= $unsigned(wire0[(4'hd):(4'hc)]);
            end
        end
      else
        begin
          reg17 <= $signed((^wire13[(1'h0):(1'h0)]));
          reg18 <= wire12;
          reg19 <= reg20[(3'h6):(3'h5)];
          if (wire8[(3'h6):(3'h4)])
            begin
              reg20 <= reg20[(2'h3):(2'h2)];
              reg21 <= $signed(({(!{(8'hac)})} ^ reg18[(2'h3):(2'h2)]));
            end
          else
            begin
              reg20 <= {wire8[(4'ha):(4'h8)],
                  (wire10 <<< $unsigned((~&wire3[(4'hc):(3'h7)])))};
              reg21 <= wire5[(2'h2):(1'h0)];
            end
          reg22 <= reg18;
        end
    end
  assign wire23 = wire11[(3'h5):(1'h0)];
endmodule
