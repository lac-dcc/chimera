module top
#(parameter param30 = (((8'hb4) ? (&(8'h9d)) : (((8'hb7) ? (&(8'hb7)) : ((8'hb8) * (8'hb0))) ? (((8'hb7) ? (7'h42) : (8'hab)) == ((8'haf) ? (8'ha8) : (8'haa))) : ((^~(8'hb9)) ? ((7'h41) ? (8'hbc) : (8'had)) : (~|(8'hb6))))) ? {{(((7'h44) & (8'hac)) ? {(8'hb8)} : ((8'ha2) ? (8'hb0) : (8'had))), {((8'hab) ? (8'hba) : (8'hba))}}, ((((8'haa) && (7'h40)) ? ((8'hb7) <<< (8'hae)) : {(7'h40), (8'haa)}) ? (~|(+(8'hb5))) : {(-(8'ha1))})} : (~&(^(!(&(8'hbd)))))), 
parameter param31 = param30)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  assign y = {wire20,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 (1'h0)};
  assign wire5 = ({(8'ha5)} ?
                     (^~wire3[(3'h6):(1'h0)]) : {(|((wire4 > wire0) ?
                             {wire0, wire2} : $signed(wire0)))});
  assign wire6 = ((wire2[(3'h4):(2'h3)] ?
                     wire1[(4'h8):(1'h0)] : {$unsigned(wire0[(4'h9):(4'h9)])}) >> {((8'hb5) && wire2[(2'h3):(1'h1)]),
                     $signed(wire4[(3'h6):(3'h5)])});
  assign wire7 = wire5[(5'h14):(5'h13)];
  assign wire8 = $signed((!$signed($unsigned(wire5))));
  assign wire9 = $unsigned((~^(((!wire7) ? (-wire1) : (!wire2)) ?
                     ((wire3 ^ wire0) ? wire4 : $signed(wire8)) : (|{wire3,
                         wire1}))));
  always
    @(posedge clk) begin
      reg10 <= (wire3 ?
          (wire9[(4'ha):(4'h9)] ?
              $unsigned((~&wire2[(2'h3):(1'h0)])) : wire8[(3'h4):(1'h0)]) : (($unsigned($unsigned(wire4)) ?
              (~|(+(8'hb2))) : (7'h40)) ~^ (wire7[(3'h7):(1'h1)] ?
              $signed({wire1}) : $signed(wire4))));
      reg11 <= ($signed(wire5[(1'h1):(1'h1)]) - {(reg10[(2'h2):(1'h0)] ?
              ((wire7 ? wire9 : wire7) ?
                  (wire4 != (8'h9c)) : wire0) : $signed((+wire8)))});
      reg12 <= wire9[(4'hb):(2'h2)];
      reg13 <= (^(8'ha6));
    end
  always
    @(posedge clk) begin
      reg14 <= wire3[(3'h4):(2'h3)];
      reg15 <= (~&(+((~&(reg14 ? wire6 : wire1)) ?
          $signed(wire4[(2'h2):(1'h1)]) : wire9)));
      reg16 <= $unsigned($unsigned((reg13[(1'h0):(1'h0)] ~^ (~^$signed(wire8)))));
      if (wire1)
        begin
          reg17 <= $unsigned($unsigned($unsigned(wire2)));
        end
      else
        begin
          reg17 <= reg10[(3'h4):(1'h0)];
          reg18 <= $unsigned((~$unsigned($signed(reg11[(3'h7):(1'h1)]))));
        end
      reg19 <= (+$unsigned((^~reg17)));
    end
  assign wire20 = (!wire6);
  always
    @(posedge clk) begin
      reg21 <= wire4;
      if ({(8'hba)})
        begin
          if ($signed($signed(reg16)))
            begin
              reg22 <= reg21[(3'h5):(3'h5)];
            end
          else
            begin
              reg22 <= {wire9};
            end
          reg23 <= ({{wire9[(1'h0):(1'h0)]}} ?
              (({(wire8 ? reg21 : (8'hb6))} != ($signed(reg11) ?
                      reg13[(2'h2):(2'h2)] : (wire7 ? wire1 : reg11))) ?
                  ((~^$unsigned(reg18)) ?
                      ({reg12,
                          wire7} | $unsigned(wire0)) : wire5[(5'h10):(3'h5)]) : $signed($unsigned(wire7[(3'h7):(1'h1)]))) : $unsigned((8'haf)));
        end
      else
        begin
          if (reg11)
            begin
              reg22 <= ($unsigned((((reg11 * reg10) ?
                      (reg13 ? reg11 : reg14) : wire20) >> {$unsigned(wire5),
                      $unsigned(reg17)})) ?
                  reg14[(2'h2):(1'h1)] : wire20[(2'h3):(1'h0)]);
              reg23 <= wire2[(1'h1):(1'h0)];
              reg24 <= $signed($signed((~&((reg17 ?
                  reg23 : (8'h9d)) - reg12[(1'h1):(1'h1)]))));
              reg25 <= (~((($signed(reg17) ?
                      (wire8 ?
                          wire8 : reg23) : (^~wire1)) >> reg21[(3'h6):(3'h6)]) ?
                  (($signed(reg22) ^ (wire4 & wire6)) ?
                      ((reg18 + reg24) ^~ reg14[(1'h0):(1'h0)]) : reg11) : (reg14[(2'h3):(2'h3)] | {$signed((8'hb7))})));
            end
          else
            begin
              reg22 <= ($signed($signed($unsigned($signed(reg22)))) * ({(8'ha0),
                  reg12[(1'h0):(1'h0)]} <<< ((wire8 << $unsigned(wire3)) << {{wire6}})));
              reg23 <= wire0[(2'h3):(2'h2)];
            end
          if ($unsigned(($unsigned(((^~reg17) || reg24[(4'he):(2'h2)])) ^ (^{(reg23 ^ wire9),
              (reg18 ^~ reg15)}))))
            begin
              reg26 <= $unsigned($signed($unsigned(wire20[(1'h1):(1'h0)])));
              reg27 <= ((($signed($signed(wire5)) ?
                      reg11[(3'h6):(2'h3)] : ($signed(wire2) ?
                          wire0[(3'h7):(3'h5)] : $unsigned(wire0))) ~^ reg24) ?
                  {$signed(wire1[(2'h3):(2'h3)])} : $signed($unsigned(wire20)));
              reg28 <= reg17[(3'h6):(3'h5)];
            end
          else
            begin
              reg26 <= ((&reg11) ?
                  $signed((wire5[(4'he):(4'h9)] ?
                      $unsigned((~wire4)) : $signed(reg26))) : ((reg15 ?
                      ((8'hb9) - (^~reg19)) : reg15[(3'h4):(1'h1)]) ~^ reg15[(3'h4):(2'h3)]));
              reg27 <= reg18;
              reg28 <= {reg17};
              reg29 <= $signed((((+(^~wire2)) ?
                      (((8'hbf) <= (8'h9f)) ?
                          (~|reg14) : (wire7 ^ reg18)) : wire9[(1'h1):(1'h1)]) ?
                  $signed(reg28) : (({reg19, reg13} ?
                      wire20[(3'h4):(1'h1)] : ((8'hb7) ?
                          (8'hb6) : wire1)) | (8'hba))));
            end
        end
    end
endmodule
