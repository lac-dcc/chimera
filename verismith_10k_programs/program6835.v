module top
#(parameter param32 = ({((((8'hb7) ? (8'ha2) : (8'hbf)) + {(8'hac)}) ? (((8'hac) & (8'haf)) ? ((8'hbe) ? (7'h42) : (8'h9c)) : {(8'hb4)}) : (&((8'hb7) != (7'h44))))} ? {(~^((!(8'hb2)) ? (+(8'ha2)) : ((8'haa) ? (8'ha7) : (8'hab))))} : ((|((-(8'ha1)) & (~(8'h9e)))) <= (((^(8'hb9)) >> ((8'ha8) ? (8'haf) : (8'ha3))) || (^(8'hbe))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (($unsigned((8'hb7)) ?
                     $signed($signed($unsigned(wire1))) : $signed(((wire3 ?
                         wire1 : wire0) >> wire3))) <= (wire0 * $signed((+$unsigned(wire4)))));
  assign wire6 = $signed($unsigned($unsigned($unsigned($signed(wire5)))));
  assign wire7 = $signed((~|($unsigned((wire0 ? wire0 : (8'h9d))) ?
                     ((wire5 ? (8'hb9) : (8'haa)) ?
                         wire3 : wire0) : $signed((wire5 ? wire3 : wire0)))));
  assign wire8 = (8'hb6);
  assign wire9 = $signed(wire2[(3'h5):(1'h1)]);
  assign wire10 = wire1[(4'hd):(4'hb)];
  assign wire11 = ($unsigned($signed(wire1)) ?
                      {$signed(wire4[(2'h3):(1'h1)]),
                          (8'hac)} : wire1[(4'hd):(4'hc)]);
  assign wire12 = ($unsigned($unsigned($signed($unsigned(wire8)))) ^~ ($unsigned((((8'hbf) >= wire3) || wire8)) ^~ (&(+$unsigned((8'h9f))))));
  assign wire13 = wire7;
  always
    @(posedge clk) begin
      if ((8'ha2))
        begin
          reg14 <= (&wire3);
          if (wire1[(4'ha):(4'ha)])
            begin
              reg15 <= {$unsigned($signed((+$signed((7'h44))))),
                  $signed($signed(((wire4 ? wire8 : wire0) ?
                      wire6 : {wire1})))};
              reg16 <= (&(wire9[(3'h6):(3'h6)] >> wire4));
            end
          else
            begin
              reg15 <= wire6[(4'hd):(3'h6)];
            end
          reg17 <= (8'hb1);
          reg18 <= {$unsigned($unsigned(({(8'hb2)} ?
                  {reg14, (8'hbf)} : wire3)))};
          reg19 <= $signed($unsigned((|wire10)));
        end
      else
        begin
          reg14 <= ((wire2[(3'h6):(3'h4)] * ($unsigned($unsigned(wire9)) ?
              ((~&wire5) ?
                  $unsigned(wire0) : {reg15}) : $unsigned($unsigned(wire3)))) > ({wire13[(4'ha):(3'h6)],
              wire8} > ($unsigned($signed(reg14)) ?
              $signed(wire0) : $unsigned(reg19[(5'h11):(3'h6)]))));
          reg15 <= $unsigned((((8'hbb) ? reg16 : $unsigned($unsigned(reg14))) ?
              wire1[(4'h9):(1'h1)] : wire13[(3'h6):(1'h1)]));
        end
      reg20 <= $signed(wire8);
      if (reg14)
        begin
          reg21 <= $unsigned(((((wire10 ^~ reg16) ? $unsigned(wire6) : wire11) ?
                  ({wire10} && (wire12 >> wire9)) : (!(-wire6))) ?
              $unsigned(wire1) : wire0[(3'h4):(1'h1)]));
        end
      else
        begin
          reg21 <= $signed((~&wire8));
          reg22 <= reg18[(2'h3):(1'h0)];
          reg23 <= (((-$unsigned((~reg20))) > {(reg17[(4'hb):(2'h3)] ?
                      $unsigned((8'ha9)) : (wire1 * (8'hb2)))}) ?
              (8'ha2) : $unsigned({(reg19 & reg14[(2'h2):(2'h2)])}));
          if ((~|(|((&{wire3}) ?
              wire7[(1'h1):(1'h0)] : ((&wire4) && (reg17 ? wire10 : reg14))))))
            begin
              reg24 <= (((($signed(reg16) <<< (+wire2)) ?
                          ({reg19} ?
                              $unsigned(wire1) : $signed((8'h9e))) : (|$signed(reg17))) ?
                      $signed(wire0) : wire2[(3'h5):(2'h2)]) ?
                  $unsigned((reg15 ?
                      wire4[(1'h0):(1'h0)] : (reg21 ?
                          $signed(reg19) : ((8'h9f) ?
                              wire8 : wire3)))) : (-(reg16 >> wire3[(1'h1):(1'h1)])));
            end
          else
            begin
              reg24 <= (~^$unsigned($unsigned((8'hab))));
              reg25 <= $signed(reg15);
              reg26 <= {({{(8'hb0)}} > (8'ha5))};
              reg27 <= reg26[(2'h3):(2'h3)];
              reg28 <= (reg15[(4'ha):(4'h9)] ?
                  wire6 : ($unsigned(((reg26 > wire9) ?
                          ((8'hae) << wire13) : (~|wire3))) ?
                      (((reg19 <= wire5) ?
                              (reg19 * reg23) : ((8'hba) << reg23)) ?
                          (wire7 ?
                              (reg23 ?
                                  (8'h9f) : wire11) : {reg22}) : $signed((+(8'hb9)))) : (reg17[(2'h2):(1'h0)] ?
                          (wire9 ?
                              (wire11 ?
                                  (8'haa) : wire7) : (~|reg25)) : $signed((wire13 ?
                              reg27 : wire3)))));
            end
        end
    end
  assign wire29 = wire0[(3'h7):(3'h6)];
  assign wire30 = (~(^$unsigned($signed($signed(reg18)))));
  assign wire31 = wire12;
endmodule
