module top
#(parameter param21 = (!({{((8'hbb) * (8'ha4)), (!(8'ha3))}, ((+(8'hae)) <<< (~^(7'h43)))} >> ((((8'hb7) * (8'hab)) > ((7'h44) ? (7'h40) : (8'ha7))) ? (((8'haa) <<< (8'ha6)) > ((7'h42) && (7'h42))) : ((~(8'hb3)) << ((8'had) ? (8'ha1) : (8'hbd)))))), 
parameter param22 = (((&{(!(8'ha3))}) ? (((^~param21) ? (!(8'hab)) : (~^param21)) ? param21 : ((7'h43) << {param21, param21})) : (((param21 ? param21 : param21) >= (param21 ? param21 : param21)) ? param21 : {(param21 <<< param21), (param21 ? param21 : param21)})) ? ((~^param21) ? ((8'ha2) ? (!(~|param21)) : ((param21 ? param21 : param21) ? {param21} : param21)) : ((-(param21 ? param21 : (8'h9d))) ? {(|param21)} : ((param21 == param21) ? (^param21) : (param21 ~^ param21)))) : (param21 ? ((~&(&param21)) ? ((~|(8'hac)) & (param21 ? (7'h44) : (8'ha8))) : ((param21 - param21) ? {(7'h42), param21} : (param21 ? param21 : (8'ha0)))) : (~^{param21}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire5,
                 wire4,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ((($unsigned((wire2 + wire2)) ?
                             (~^wire1) : wire0[(4'h8):(4'h8)]) ?
                         wire0[(3'h6):(3'h6)] : (^(8'ha3))) ?
                     wire0[(3'h6):(2'h3)] : wire3[(3'h6):(2'h2)]);
  assign wire5 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((-$signed(($unsigned((wire2 > wire0)) ?
          {$unsigned(wire5),
              ((7'h41) >= wire2)} : $signed(wire4[(2'h2):(1'h0)])))))
        begin
          reg6 <= (~&((8'hb5) ?
              wire2 : (($unsigned((7'h44)) - (wire4 < wire0)) > wire1)));
          reg7 <= (^~$signed(wire4[(2'h3):(2'h2)]));
        end
      else
        begin
          reg6 <= (({(8'h9e), ($signed(reg6) ? reg7 : {(8'ha0), wire1})} ?
              (((8'hb9) <= $unsigned(reg6)) ?
                  {$signed(wire5)} : wire4[(1'h1):(1'h0)]) : wire5) <<< $unsigned((((|wire2) ?
              $unsigned(wire2) : $signed(reg6)) << $unsigned((reg6 << (8'hb3))))));
          reg7 <= $signed({$unsigned((wire0 - (wire1 ? (8'hb3) : (8'hb4)))),
              wire1[(4'ha):(4'h9)]});
        end
      reg8 <= reg6[(1'h0):(1'h0)];
      if ((($signed((((8'hab) ? wire1 : wire2) ?
          wire1 : {wire0})) ^ (&$unsigned(reg6[(2'h3):(2'h3)]))) >> (((~&wire5[(3'h6):(1'h1)]) & (&$signed(wire1))) ?
          (((~wire2) ?
              {reg8,
                  wire5} : $unsigned(reg7)) && wire4[(1'h0):(1'h0)]) : $unsigned((~$signed(wire5))))))
        begin
          reg9 <= $unsigned($signed(wire2));
          reg10 <= {((((reg6 ? wire5 : wire1) ? {reg6} : (wire4 && (7'h41))) ?
                      wire5 : (reg6[(3'h4):(3'h4)] ?
                          (wire2 ? wire5 : reg8) : {wire3, wire4})) ?
                  (wire5 ?
                      ($signed(wire3) ? (7'h43) : wire1) : ((wire0 ?
                          reg7 : wire4) && wire2)) : $unsigned($signed($unsigned(wire2)))),
              wire3};
        end
      else
        begin
          reg9 <= wire3[(3'h4):(3'h4)];
          if (wire3)
            begin
              reg10 <= ((({reg10, $unsigned(reg7)} ?
                  ((8'ha7) ?
                      reg10 : (reg9 ?
                          wire3 : wire3)) : reg10) <= {wire5}) + ((~(wire0[(4'h9):(2'h3)] ?
                      reg6[(2'h2):(1'h0)] : $signed(reg6))) ?
                  $unsigned(((reg9 ? reg9 : reg9) ?
                      (reg7 ?
                          (7'h41) : reg8) : (|(8'hbe)))) : (($signed(wire1) ?
                          $signed((8'ha7)) : (reg10 ~^ wire0)) ?
                      {$signed(wire1),
                          $signed(wire0)} : $unsigned($signed(reg6)))));
              reg11 <= (wire3[(4'h9):(2'h3)] >= (($unsigned(wire2[(4'h8):(2'h3)]) && reg10[(1'h1):(1'h0)]) <<< $unsigned(($signed((8'ha6)) == $signed(wire2)))));
            end
          else
            begin
              reg10 <= (~&reg10);
              reg11 <= (&(|(wire2 ?
                  ({wire1, reg6} ?
                      $signed(reg9) : wire5[(4'hc):(3'h7)]) : (((8'hb8) ?
                          wire4 : reg6) ?
                      ((8'ha6) < reg8) : wire1[(4'h9):(3'h7)]))));
              reg12 <= (((~(|(reg8 ? wire4 : reg10))) ~^ (|({reg9, wire3} ?
                      reg10 : $signed(reg11)))) ?
                  $signed((^~{wire5})) : $signed((wire3[(5'h10):(4'ha)] ?
                      (8'haf) : wire5)));
            end
          if (({reg10} <<< reg9[(3'h4):(1'h0)]))
            begin
              reg13 <= (8'ha6);
              reg14 <= (+((8'hbb) - reg9));
              reg15 <= reg12;
              reg16 <= {reg9, {reg14}};
              reg17 <= $signed(wire3);
            end
          else
            begin
              reg13 <= reg6;
              reg14 <= $unsigned((^~$signed(wire4)));
              reg15 <= $unsigned((({$signed(reg14),
                      (7'h43)} != wire3[(3'h7):(2'h3)]) ?
                  reg14[(4'ha):(3'h5)] : (|((reg17 ? (8'hac) : reg16) >> (reg7 ?
                      reg16 : wire5)))));
              reg16 <= (|$unsigned(reg16));
              reg17 <= (!(~&reg15));
            end
          reg18 <= reg11;
        end
    end
  always
    @(posedge clk) begin
      reg19 <= ((8'hb6) <<< (8'ha6));
    end
  assign wire20 = $signed((!reg19));
endmodule
