module top
#(parameter param29 = ({(|(!((8'haa) ^~ (7'h41))))} | {(((^(8'hb6)) >> (!(8'hbd))) ? (8'hb2) : (|(^~(8'ha7)))), ((7'h42) ? (((8'hbd) ? (8'ha7) : (8'hb7)) ? (!(8'ha3)) : ((8'ha2) & (8'ha5))) : (((8'hae) ? (8'hb8) : (8'hba)) ? {(8'h9d), (8'had)} : {(8'h9c), (8'ha7)}))}), 
parameter param30 = ({(|(param29 ^ param29)), {(!(param29 > param29))}} ~^ (~^(param29 ? (^~{(8'ha1)}) : ((param29 ? param29 : param29) ^~ param29)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg13,
                 (1'h0)};
  assign wire4 = (~$unsigned({wire3[(1'h1):(1'h1)]}));
  assign wire5 = {((((wire4 * wire0) ? $signed(wire1) : (8'h9f)) * ((~^wire2) ?
                         (wire1 ?
                             wire1 : wire1) : wire0)) - (!(wire4[(4'hd):(1'h0)] << $signed(wire2)))),
                     (($signed((&wire4)) <<< wire2) << ((^~(^~wire4)) ?
                         {$unsigned(wire4)} : (wire4[(5'h11):(3'h7)] ?
                             (wire4 >> wire0) : wire3[(4'h8):(3'h6)])))};
  assign wire6 = $unsigned((wire2[(3'h7):(3'h5)] || $unsigned($signed((wire1 ?
                     wire2 : (8'hb1))))));
  assign wire7 = $unsigned({(8'hb8), wire6});
  assign wire8 = $unsigned(($unsigned((((8'hb7) ?
                         wire6 : wire3) ^ $signed(wire3))) ?
                     wire1[(3'h4):(1'h1)] : (+(|$signed(wire1)))));
  assign wire9 = (~^$signed((wire5[(2'h3):(2'h3)] ^ $unsigned((wire3 ?
                     wire7 : wire0)))));
  assign wire10 = $unsigned(wire4);
  assign wire11 = wire6[(1'h0):(1'h0)];
  assign wire12 = $unsigned($unsigned(wire2[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg13 <= $unsigned($signed(((-(wire0 ? wire8 : wire8)) * {$signed(wire0),
          {wire12, wire11}})));
      reg14 <= wire6[(3'h4):(1'h0)];
      reg15 <= wire8[(5'h11):(4'h8)];
      if ($unsigned(($signed($signed($unsigned(wire12))) <<< (wire6 ?
          (8'hbe) : wire0[(4'h8):(1'h1)]))))
        begin
          if (wire9)
            begin
              reg16 <= (($signed($signed(wire3)) ?
                      $unsigned((wire5[(1'h1):(1'h1)] >= $signed(wire5))) : (^$signed(wire12[(4'h9):(3'h4)]))) ?
                  $signed((&(8'hab))) : (~^$signed(((!(8'hb3)) && (-reg13)))));
              reg17 <= (8'hba);
              reg18 <= wire5[(1'h0):(1'h0)];
            end
          else
            begin
              reg16 <= {(-{(~(8'hbd)), (~&$unsigned((8'ha4)))}), reg14};
              reg17 <= $unsigned($signed((-wire5)));
              reg18 <= {$signed(reg15[(4'h9):(4'h8)])};
            end
          reg19 <= {((reg18[(3'h4):(1'h1)] ? reg18 : reg13[(2'h3):(1'h1)]) ?
                  ((~^$unsigned(reg16)) >= $signed((8'ha6))) : ($unsigned((reg18 ?
                          reg16 : wire7)) ?
                      wire10[(3'h7):(1'h0)] : $unsigned(reg16[(4'hc):(1'h0)])))};
        end
      else
        begin
          reg16 <= wire6;
          reg17 <= (8'ha3);
          if ($unsigned(wire9[(4'h9):(4'h8)]))
            begin
              reg18 <= (^~$signed($unsigned(((!reg15) ?
                  wire2[(1'h0):(1'h0)] : (~&reg18)))));
              reg19 <= wire10[(3'h6):(2'h3)];
            end
          else
            begin
              reg18 <= (wire1[(1'h0):(1'h0)] ^~ ((reg14[(4'he):(2'h2)] ?
                      reg13[(4'h8):(3'h6)] : (!(reg17 & wire6))) ?
                  $unsigned(($signed(wire2) ?
                      (-wire8) : {wire0})) : (($unsigned(wire7) ?
                      $unsigned((8'hb0)) : {reg15,
                          (8'ha1)}) == $unsigned((wire3 <<< wire3)))));
            end
          reg20 <= $unsigned(($signed((8'ha0)) ~^ {{(wire2 ? wire12 : reg17),
                  $signed(reg15)},
              $signed((reg17 - (8'hab)))}));
        end
      if (wire8)
        begin
          reg21 <= ((&$signed($unsigned($unsigned((7'h44))))) ?
              (($signed((wire1 && reg17)) <= wire6) + wire2) : $unsigned(((wire6 << $unsigned((8'hb4))) >>> $signed(wire2))));
          reg22 <= (wire7 ?
              $unsigned($signed($signed(reg19[(4'hc):(4'hc)]))) : $unsigned(((!$unsigned(reg20)) >= reg14)));
          reg23 <= ({($signed(((8'hac) >> (8'hab))) ?
                  {reg15[(4'h9):(1'h0)], wire10[(3'h7):(2'h3)]} : reg17),
              (8'h9c)} >= {(~^reg18[(3'h7):(3'h5)]), reg20[(2'h2):(2'h2)]});
        end
      else
        begin
          if (wire10)
            begin
              reg21 <= ($signed($unsigned(wire4)) ?
                  (~reg16[(1'h1):(1'h1)]) : $signed($signed($unsigned((wire12 ?
                      reg21 : reg19)))));
              reg22 <= {reg20};
              reg23 <= ((($signed($unsigned(wire5)) != (+$signed(wire6))) ^ ($signed($unsigned((8'hba))) ?
                  {$signed(wire11),
                      $signed(reg15)} : ($signed((8'hac)) ^ $signed(wire4)))) || ($signed(reg22[(2'h2):(2'h2)]) | wire12));
              reg24 <= wire10[(3'h4):(1'h0)];
            end
          else
            begin
              reg21 <= reg15;
            end
          reg25 <= {wire8};
          reg26 <= (($signed((~^(reg20 ? (8'ha8) : (8'hb0)))) ?
              ((reg14 ?
                  (!reg17) : wire9[(4'h9):(1'h1)]) != reg14) : wire7) << reg19);
        end
    end
  assign wire27 = (($signed($signed((~|wire8))) || reg20[(1'h1):(1'h0)]) != wire11);
  assign wire28 = ($signed({($unsigned(wire2) < $unsigned(reg23)),
                          ($unsigned((8'ha6)) ^~ reg24[(1'h1):(1'h0)])}) ?
                      (8'ha8) : ($signed($signed({reg14,
                          wire7})) <= $unsigned(((reg20 > reg26) ?
                          {wire12} : {reg26, wire27}))));
endmodule
