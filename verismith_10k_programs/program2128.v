module top #(parameter param32 = (8'hbe)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire31, wire30, wire29, wire27, wire4, (1'h0)};
  assign wire4 = (&(~&(((~^wire0) != wire1) ?
                     ({wire1, wire1} ?
                         $signed(wire1) : wire1[(3'h7):(1'h0)]) : $signed(((8'hb3) ?
                         wire1 : wire1)))));
  module5 #() modinst28 (wire27, clk, wire4, wire0, wire1, wire3);
  assign wire29 = $signed((~&(wire2 ? wire3 : {$unsigned((8'hb4))})));
  assign wire30 = wire29;
  assign wire31 = (8'hb9);
endmodule

module module5
#(parameter param26 = {{(((+(8'hbe)) >> (7'h42)) ^~ ((|(8'ha0)) ? {(8'hb3), (8'ha8)} : ((8'haa) ? (8'hb9) : (8'ha7)))), (((+(7'h40)) ? ((7'h42) + (8'hbb)) : (!(8'hbd))) != (8'ha2))}})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 (1'h0)};
  assign wire10 = wire8[(4'hf):(4'h8)];
  assign wire11 = (7'h43);
  assign wire12 = wire6;
  assign wire13 = {$unsigned(({(wire10 ?
                              wire8 : wire8)} == $unsigned($signed(wire8))))};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($unsigned(wire9) ?
          (+(wire8 ? (8'hb1) : wire9)) : ($signed(wire9) ?
              {wire12, wire10} : $unsigned(wire6))))))
        begin
          reg14 <= ((8'haf) ?
              {{wire6, wire7[(4'hd):(4'hc)]},
                  ({wire9[(4'hc):(1'h0)], (wire9 || wire7)} ?
                      wire10[(3'h6):(1'h1)] : {$unsigned(wire12)})} : (($unsigned((wire10 ?
                      wire9 : wire8)) && $unsigned(wire10[(2'h2):(1'h1)])) ?
                  ($unsigned({wire9}) ?
                      wire10[(2'h3):(2'h2)] : $signed(wire12)) : $signed(wire9)));
        end
      else
        begin
          reg14 <= reg14;
          reg15 <= wire8[(1'h1):(1'h1)];
        end
      reg16 <= reg15[(3'h4):(1'h0)];
      reg17 <= $signed(($unsigned(($unsigned(wire8) ?
          (~wire6) : (-reg16))) || $unsigned($signed(wire6))));
      if (({($unsigned((wire12 ? wire8 : wire12)) ?
              wire6 : (wire6 && (~|wire12)))} - wire10[(4'h8):(4'h8)]))
        begin
          reg18 <= wire7[(2'h2):(1'h1)];
          reg19 <= (-wire12);
          reg20 <= {(wire8[(4'hd):(4'hc)] ?
                  reg15[(3'h7):(3'h7)] : (reg14 ^ {$signed((8'hbf))}))};
        end
      else
        begin
          if (($signed({($unsigned(wire8) ? wire13[(3'h4):(1'h0)] : reg20),
              (wire13 ?
                  $signed(wire11) : (-(7'h42)))}) | (+(+reg15[(3'h7):(3'h6)]))))
            begin
              reg18 <= (^~$signed(($unsigned((8'hae)) ~^ reg15)));
              reg19 <= $unsigned((((8'haa) ?
                  $signed(reg18) : (wire7[(3'h6):(2'h2)] ?
                      $signed(reg17) : wire6)) && $signed((wire12[(3'h5):(2'h2)] ?
                  $unsigned(reg20) : {wire11, wire8}))));
              reg20 <= ($unsigned(wire6[(4'hf):(3'h5)]) ?
                  ((~&reg19[(3'h5):(1'h1)]) ?
                      wire11 : ($unsigned(reg18) ?
                          $signed((wire10 ? reg17 : wire8)) : reg17)) : reg18);
            end
          else
            begin
              reg18 <= (~^(^$signed($unsigned($unsigned((7'h40))))));
              reg19 <= $unsigned(({({reg17} == (wire7 ? reg16 : (8'h9e))),
                      (^$signed((8'ha6)))} ?
                  reg19[(1'h0):(1'h0)] : reg19[(5'h11):(5'h10)]));
              reg20 <= reg20[(1'h1):(1'h0)];
            end
          if (((~&(({wire12} ^ {(7'h41), wire9}) ?
              $unsigned((reg15 ?
                  wire9 : wire8)) : reg17)) - reg20[(3'h7):(3'h7)]))
            begin
              reg21 <= ({(|((8'hb3) ? (wire13 ? wire13 : reg14) : wire10)),
                  wire7[(4'hc):(4'hc)]} && ((|((wire6 & wire9) != (~&wire12))) ?
                  (($signed((8'hb2)) + $signed((8'h9d))) & (&(reg19 ?
                      (8'hb3) : wire11))) : {$signed((~^reg16)), wire6}));
              reg22 <= $unsigned(($unsigned($unsigned({reg19,
                  wire8})) >> (~(wire7[(4'h9):(1'h0)] * (reg15 | wire6)))));
            end
          else
            begin
              reg21 <= wire8[(3'h7):(2'h2)];
              reg22 <= reg22;
              reg23 <= $signed(reg14[(4'ha):(2'h3)]);
              reg24 <= $unsigned((~&(~&(8'hb3))));
            end
          reg25 <= $signed(($unsigned(reg18[(1'h1):(1'h1)]) ?
              wire6[(3'h6):(3'h6)] : ($unsigned(reg23) ?
                  ($signed(wire8) ?
                      reg22[(4'hc):(3'h5)] : $unsigned(wire12)) : (^$signed(reg16)))));
        end
    end
endmodule
