module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire29,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire4[(1'h1):(1'h0)] && $signed((^~($signed(wire2) ?
                     $signed((8'had)) : wire3[(1'h0):(1'h0)]))));
  assign wire6 = wire0[(3'h5):(3'h4)];
  assign wire7 = wire2;
  assign wire8 = (((wire5 ?
                         (&wire7[(2'h3):(2'h2)]) : wire0[(4'hb):(2'h3)]) + (wire6 ?
                         $unsigned((&(8'hba))) : (((8'hbd) >> wire2) || (wire5 ?
                             wire6 : wire6)))) ?
                     (wire0[(3'h5):(1'h0)] ?
                         (wire3 ?
                             $unsigned(wire1[(2'h2):(1'h0)]) : (8'hb7)) : ($signed(wire1) ?
                             wire7 : $signed(wire3[(1'h1):(1'h1)]))) : (|wire6));
  always
    @(posedge clk) begin
      reg9 <= $signed(wire6[(2'h2):(1'h0)]);
      reg10 <= (wire7[(1'h1):(1'h1)] ?
          $unsigned((-reg9)) : {({(wire1 ?
                      wire7 : wire7)} < $signed(wire5[(4'h8):(3'h6)]))});
      reg11 <= (|$unsigned((($signed(wire0) ?
          $unsigned(wire2) : (wire2 ?
              reg10 : (8'hba))) > wire1[(1'h1):(1'h0)])));
      reg12 <= {$signed(reg9), $signed((~^$unsigned(((8'h9f) < (8'ha9)))))};
      reg13 <= reg9;
    end
  assign wire14 = wire7[(1'h0):(1'h0)];
  assign wire15 = $unsigned((~$unsigned($unsigned((wire3 == wire6)))));
  always
    @(posedge clk) begin
      if (reg11[(1'h1):(1'h0)])
        begin
          if ($unsigned(wire8[(1'h1):(1'h0)]))
            begin
              reg16 <= ({reg12[(4'h8):(3'h6)]} < (-(wire5[(1'h1):(1'h1)] <= ((wire14 ?
                  (8'hb0) : wire4) == (~&wire14)))));
              reg17 <= $unsigned(wire15);
              reg18 <= $signed(($signed(({reg9} ?
                      wire2[(4'h9):(3'h6)] : reg13[(1'h1):(1'h1)])) ?
                  wire2 : (!wire0[(4'h8):(2'h2)])));
              reg19 <= (reg17[(3'h7):(3'h6)] && (reg18[(4'ha):(4'ha)] ?
                  (8'ha0) : $signed(((reg13 ? reg12 : reg11) ?
                      (!reg11) : (-wire6)))));
              reg20 <= $signed((wire6 ?
                  reg12[(3'h7):(1'h0)] : ((+(~wire6)) ?
                      (wire0[(4'hb):(1'h0)] >= wire7[(2'h3):(1'h0)]) : (8'hbc))));
            end
          else
            begin
              reg16 <= ((~reg17[(5'h11):(3'h4)]) ?
                  reg16[(2'h2):(2'h2)] : $signed(((+reg9[(3'h6):(2'h2)]) ?
                      $unsigned(wire8[(1'h0):(1'h0)]) : $unsigned(wire1[(1'h0):(1'h0)]))));
            end
          reg21 <= wire3[(1'h0):(1'h0)];
          reg22 <= (^~($unsigned($unsigned(((8'hb4) ? reg20 : wire5))) ?
              {$signed((^wire4))} : $unsigned($signed((|reg17)))));
          reg23 <= wire7[(2'h3):(2'h2)];
          reg24 <= reg12;
        end
      else
        begin
          reg16 <= reg10;
          if ($unsigned($unsigned($signed($signed($signed(reg17))))))
            begin
              reg17 <= wire1[(1'h0):(1'h0)];
              reg18 <= (|$unsigned(wire15));
              reg19 <= {{reg17[(5'h10):(4'he)],
                      $unsigned({$unsigned(reg13), {reg23, wire15}})}};
              reg20 <= (^~({((wire4 ?
                      wire1 : reg21) < wire0)} >>> $signed((~^$unsigned(reg24)))));
            end
          else
            begin
              reg17 <= ({$unsigned(((reg20 < (8'ha4)) - reg22))} ?
                  {(((&reg22) ^ $unsigned(wire7)) - ({reg9, wire5} ?
                          (reg16 <= reg11) : $signed(reg16))),
                      (8'h9c)} : {reg18});
            end
          if ((wire4 < {reg9[(5'h12):(4'ha)],
              (+({reg11, (8'ha5)} ? (wire1 & wire8) : reg24))}))
            begin
              reg21 <= $unsigned({reg21[(3'h4):(1'h1)]});
            end
          else
            begin
              reg21 <= (+({reg10, ((^wire2) + {reg13, wire7})} ?
                  (8'ha1) : ({$signed(reg22)} ?
                      $unsigned((reg16 >>> wire7)) : (8'ha5))));
              reg22 <= $unsigned(($unsigned((reg18[(4'h9):(2'h2)] >>> {wire3})) ?
                  (-reg12[(3'h6):(1'h0)]) : (reg11[(1'h1):(1'h0)] ?
                      wire4[(4'hd):(4'hc)] : (&$unsigned(reg19)))));
            end
        end
      reg25 <= reg16[(3'h5):(1'h1)];
      reg26 <= $unsigned(reg11);
      reg27 <= ((~$unsigned(($unsigned(reg17) ?
          (reg13 > wire14) : (~wire0)))) * ((^~($unsigned(reg19) | ((8'haf) ?
          reg19 : wire0))) <<< (8'hab)));
      reg28 <= reg27;
    end
  assign wire29 = reg10;
endmodule
