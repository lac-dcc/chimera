module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire32,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg15,
                 reg14,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire4[(1'h1):(1'h0)])
        begin
          reg5 <= $unsigned(wire1);
          reg6 <= (|({($signed((8'hb1)) ?
                  (wire4 ?
                      wire3 : wire3) : (^wire1))} <<< reg5[(4'ha):(2'h2)]));
          reg7 <= {reg5,
              {reg5[(4'hd):(1'h1)], {(~^wire3), $signed($signed(wire1))}}};
        end
      else
        begin
          reg5 <= wire2[(1'h0):(1'h0)];
          reg6 <= reg6;
        end
      reg8 <= (reg7[(2'h3):(2'h3)] ? wire1 : $signed(wire3[(2'h2):(1'h1)]));
      reg9 <= wire2[(3'h7):(2'h2)];
    end
  assign wire10 = reg5[(4'hb):(1'h1)];
  assign wire11 = $unsigned(((~(8'ha7)) <= ($signed($unsigned(wire1)) ?
                      $unsigned(wire10[(3'h7):(3'h6)]) : ((!wire3) ~^ (^(8'ha2))))));
  assign wire12 = {wire11};
  assign wire13 = wire11;
  always
    @(posedge clk) begin
      reg14 <= $unsigned($unsigned(wire1[(1'h0):(1'h0)]));
      reg15 <= $signed($unsigned(wire1[(2'h3):(1'h1)]));
      reg16 <= ({(~|$unsigned(reg5)),
          $signed(((8'h9e) ?
              (^reg7) : ((8'h9e) ? wire12 : wire12)))} ^ {((wire1 ?
              wire2[(1'h1):(1'h1)] : $unsigned((8'haf))) ~^ wire1)});
      reg17 <= $unsigned((reg6[(4'h8):(3'h6)] == (&$unsigned(wire1[(1'h0):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg18 <= $signed({$unsigned(reg5[(3'h7):(1'h1)]), wire3[(4'ha):(3'h4)]});
      reg19 <= (^~($signed($unsigned($signed(wire4))) ?
          reg9[(2'h3):(2'h3)] : $unsigned((+$signed(reg17)))));
      if ((((((reg6 || wire12) ?
                  ((8'hb2) | (7'h44)) : $signed(reg14)) << $unsigned((^~wire11))) ?
              wire10 : reg6) ?
          wire11 : wire12))
        begin
          reg20 <= ($signed(($unsigned((reg15 ? reg18 : wire12)) ?
                  (~^$unsigned((8'hae))) : $unsigned($unsigned(wire10)))) ?
              $signed(wire3) : $unsigned((8'h9f)));
          reg21 <= wire11;
          if ((reg18[(3'h7):(1'h0)] - (reg6[(3'h6):(2'h3)] - reg6[(1'h0):(1'h0)])))
            begin
              reg22 <= wire1;
              reg23 <= ((^{(~&(~&reg9))}) ?
                  $signed($unsigned({reg5,
                      (reg22 > wire13)})) : (-($unsigned((^~reg6)) ?
                      $signed(reg20) : ((&reg17) < reg20[(3'h7):(3'h7)]))));
              reg24 <= {$signed(reg20[(3'h4):(1'h1)]), reg9[(4'h8):(2'h3)]};
              reg25 <= reg17[(4'ha):(2'h2)];
              reg26 <= wire10[(4'h8):(3'h7)];
            end
          else
            begin
              reg22 <= $unsigned(((reg9[(3'h6):(3'h4)] <= ((-wire3) ?
                  $signed(reg8) : (|(8'hae)))) ~^ (~^$unsigned($signed(wire1)))));
            end
          reg27 <= wire12;
          if ({((&((reg19 >> reg7) < ((8'hb8) ? wire2 : reg8))) ?
                  $unsigned(wire1[(2'h3):(1'h1)]) : ((~|(wire0 > wire0)) - reg21)),
              (8'had)})
            begin
              reg28 <= reg8;
              reg29 <= (reg28 ?
                  ((((reg17 | reg17) ? wire1[(1'h1):(1'h1)] : (~wire2)) ?
                          (~&$signed(reg9)) : $unsigned({reg15, wire2})) ?
                      {$unsigned(((8'ha5) ? (8'hbd) : wire3)),
                          $unsigned((wire12 || wire3))} : wire3) : $unsigned((((-wire12) ?
                          (reg14 + reg8) : reg26) ?
                      (+$signed(wire12)) : reg19[(3'h5):(3'h4)])));
            end
          else
            begin
              reg28 <= (^wire13);
            end
        end
      else
        begin
          if (wire12[(1'h0):(1'h0)])
            begin
              reg20 <= $unsigned(reg24);
              reg21 <= {reg17};
              reg22 <= $signed({reg29[(4'hd):(4'ha)], wire1});
            end
          else
            begin
              reg20 <= (!$signed(reg24[(2'h3):(1'h0)]));
              reg21 <= wire1[(1'h0):(1'h0)];
              reg22 <= $signed(wire2[(2'h3):(1'h0)]);
              reg23 <= (reg16[(1'h0):(1'h0)] ?
                  reg22[(3'h4):(2'h3)] : (~&reg25));
              reg24 <= ((reg17[(1'h1):(1'h1)] ? reg22 : wire13[(3'h5):(2'h2)]) ?
                  reg26[(1'h1):(1'h1)] : reg17[(4'hc):(4'ha)]);
            end
          reg25 <= $unsigned((((wire2[(2'h3):(2'h2)] ?
                  {(8'ha3)} : $signed(wire3)) ?
              (wire4[(1'h0):(1'h0)] ?
                  (~^reg20) : reg24) : (~^$signed(wire1))) || wire12));
          reg26 <= $unsigned($signed($signed(reg26[(2'h2):(2'h2)])));
        end
      reg30 <= reg9[(4'h8):(3'h4)];
      reg31 <= {(&{$signed((|wire10)), $unsigned({(8'h9c)})}), wire3};
    end
  assign wire32 = (~&($unsigned($unsigned(reg21[(4'h8):(2'h3)])) <= {reg30,
                      {(reg14 ? reg25 : (8'h9f))}}));
endmodule
