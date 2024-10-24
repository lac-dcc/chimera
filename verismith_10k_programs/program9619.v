module top
#(parameter param26 = {({({(8'hb7)} + ((8'ha6) ? (8'hae) : (8'h9f))), {((8'hbd) && (8'hb0)), (-(8'hb0))}} ? ((8'hbe) != (!((8'h9d) >> (8'hb5)))) : (^((|(8'ha7)) ? ((8'hae) ? (8'ha0) : (8'hb5)) : ((7'h43) * (8'hbd)))))}, 
parameter param27 = (((~^param26) + ((^(~|param26)) >> ((param26 == param26) ^~ ((8'hb1) ? param26 : param26)))) ? ((!(param26 < (~&param26))) ? (param26 | ((param26 ? (8'hb1) : param26) == {param26})) : (((param26 + param26) >= (|param26)) ? param26 : (param26 | param26))) : ((((8'haf) << (~param26)) <= ((param26 - param26) ? ((8'hb6) >> (8'hbb)) : (param26 ? param26 : (7'h43)))) ? (param26 ? (~^(param26 <<< param26)) : (!(param26 ^ param26))) : param26)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire25,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $unsigned({(~^(((8'hb9) ?
                         wire0 : (8'ha3)) >= (wire3 <<< wire0))),
                     wire1[(4'h9):(2'h2)]});
  assign wire5 = wire4;
  assign wire6 = wire3;
  assign wire7 = ((-wire1) ?
                     (wire2[(4'hf):(3'h4)] ?
                         (wire6 ?
                             wire2[(5'h12):(3'h5)] : ((-wire5) >>> wire1)) : $signed($signed(wire4))) : $unsigned(wire0[(1'h0):(1'h0)]));
  assign wire8 = (+(wire0[(1'h0):(1'h0)] ?
                     $signed((wire0[(2'h2):(1'h0)] * (|wire2))) : ($unsigned(wire3) ?
                         (~{wire7}) : wire2)));
  always
    @(posedge clk) begin
      reg9 <= {($signed($unsigned($unsigned(wire2))) << wire5[(4'h8):(3'h7)]),
          (~&wire0)};
    end
  always
    @(posedge clk) begin
      if (wire8)
        begin
          if (((^(~|($unsigned(wire2) <<< (8'had)))) ?
              ($signed((wire3[(1'h1):(1'h0)] ? $signed(wire4) : (8'ha9))) ?
                  (wire4 ?
                      $signed(wire7[(2'h2):(1'h0)]) : (^~((8'hb2) >>> wire5))) : reg9[(3'h6):(1'h1)]) : $unsigned((($signed(wire8) ?
                  {(8'ha2)} : (8'hab)) & (!(wire3 ? wire5 : wire6))))))
            begin
              reg10 <= wire3[(2'h2):(1'h1)];
              reg11 <= wire7;
              reg12 <= (wire5 - $unsigned($signed($unsigned(wire7))));
            end
          else
            begin
              reg10 <= (!{(~wire7),
                  ($unsigned($unsigned(wire6)) ?
                      reg11[(4'hd):(3'h5)] : $unsigned(wire1[(1'h1):(1'h0)]))});
              reg11 <= $signed($unsigned(reg10));
            end
          if (wire1)
            begin
              reg13 <= (^~(wire3 ?
                  $signed({(reg12 - wire0)}) : (((-(8'hb4)) ?
                      reg10 : (~&reg9)) - $signed((reg10 ? wire8 : wire3)))));
              reg14 <= $unsigned($signed((~$signed(((8'ha2) < wire3)))));
              reg15 <= ((^(wire0 ?
                  $signed(wire1[(4'h9):(2'h2)]) : ($signed(reg10) ?
                      (wire8 >>> reg14) : ((8'haa) ?
                          wire5 : wire5)))) * {($signed(reg9[(4'ha):(1'h1)]) != {wire6[(2'h3):(2'h2)],
                      $signed(wire5)}),
                  (($signed(wire3) ? (reg10 ~^ reg13) : $signed(wire8)) ?
                      $signed((reg13 ?
                          reg11 : reg12)) : ($unsigned((8'ha5)) || ((7'h41) ?
                          wire8 : reg12)))});
              reg16 <= $signed(((~((^wire6) <<< (~(8'ha0)))) * (~&(~&wire7[(3'h7):(3'h5)]))));
            end
          else
            begin
              reg13 <= $unsigned($signed(($signed($unsigned((8'hb0))) ?
                  ($unsigned(wire8) & wire1) : wire5[(4'hf):(4'h8)])));
              reg14 <= (wire2[(4'hc):(4'h9)] || (+$signed(((reg13 & wire8) | (reg14 | wire1)))));
            end
        end
      else
        begin
          if ((8'hbe))
            begin
              reg10 <= reg16[(3'h5):(1'h1)];
            end
          else
            begin
              reg10 <= ($signed($unsigned(wire7[(3'h5):(3'h5)])) ?
                  reg11[(4'h9):(2'h3)] : reg15[(1'h0):(1'h0)]);
              reg11 <= {wire7[(1'h1):(1'h0)]};
              reg12 <= wire0;
              reg13 <= {wire4[(4'ha):(1'h1)]};
            end
          reg14 <= reg14[(4'h8):(1'h0)];
          reg15 <= reg13;
          if ($unsigned({reg11,
              ($unsigned($signed(wire6)) ^~ wire3[(2'h3):(1'h1)])}))
            begin
              reg16 <= $unsigned((^~((~{wire7, reg11}) ?
                  wire2[(1'h0):(1'h0)] : $signed(wire5[(3'h5):(2'h2)]))));
              reg17 <= wire2;
              reg18 <= $signed($signed(((wire7 < $signed(reg16)) ?
                  ((wire4 || wire6) ?
                      (~&wire6) : (|wire4)) : $signed($unsigned(reg9)))));
              reg19 <= (-(~^wire4));
            end
          else
            begin
              reg16 <= $unsigned((8'hbf));
              reg17 <= $signed($unsigned($unsigned((-((7'h43) ?
                  reg18 : wire1)))));
              reg18 <= (!{$unsigned({(reg11 >>> wire3), {wire2}}),
                  (-{(^(7'h40)), (~^reg9)})});
              reg19 <= wire2;
              reg20 <= (wire4 ^~ {reg19[(4'hc):(2'h2)], wire0[(1'h0):(1'h0)]});
            end
          if (($unsigned((wire3[(2'h2):(2'h2)] >> (+$unsigned((8'ha6))))) ?
              reg17 : reg14))
            begin
              reg21 <= reg18[(4'he):(4'ha)];
              reg22 <= ((($signed(((8'ha2) ?
                  wire5 : reg13)) != (wire7[(3'h5):(1'h0)] ?
                  $unsigned(reg9) : ((8'ha1) | wire4))) ^ (&$unsigned((^~wire3)))) ^~ ((((~|(8'ha6)) ~^ reg18[(3'h4):(2'h2)]) ?
                  reg15 : $signed((reg9 != reg11))) >> $unsigned(($unsigned(reg12) == $unsigned(wire2)))));
            end
          else
            begin
              reg21 <= wire4;
              reg22 <= wire8[(4'hd):(2'h3)];
              reg23 <= reg12;
            end
        end
      reg24 <= (^(~^(8'hb3)));
    end
  assign wire25 = reg22;
endmodule
