module top
#(parameter param31 = ({({((8'hbf) != (8'ha6)), ((8'hbe) ? (8'had) : (8'hb8))} >>> (!(8'hb6)))} ? ((~^(((8'hba) != (8'haf)) ? (+(8'hb5)) : ((8'ha9) ? (8'hac) : (8'hb1)))) ? (~^{(^~(8'ha2))}) : (~&{((8'h9e) > (8'ha6)), ((8'ha6) <<< (8'hab))})) : {({((8'hb6) | (8'ha4)), (~&(8'h9e))} ? ((|(8'ha8)) ? {(7'h42)} : ((8'ha3) ? (8'hae) : (7'h43))) : (((8'hb8) + (8'hb8)) ? (8'ha2) : ((8'h9e) != (8'hb7)))), (|({(8'hb5), (8'hbd)} ? ((8'hb2) <= (8'hbd)) : ((8'ha6) ? (8'ha0) : (8'hac))))}), 
parameter param32 = (((({param31, param31} ? (param31 ? param31 : (8'hbf)) : (param31 <= param31)) * ((param31 ? param31 : param31) ? (param31 ? param31 : param31) : (+param31))) ? (-(param31 ? (param31 >= (8'hb9)) : (+param31))) : param31) ? ((param31 ? {(param31 ? param31 : param31)} : {(|param31), {param31, (8'hb1)}}) ? (((param31 ? (8'h9c) : param31) ? param31 : (~&param31)) ? ((8'hbb) ? (-param31) : param31) : (&(param31 >= param31))) : (^~param31)) : ((param31 ~^ (+(&param31))) ? (({param31} ? (param31 ? param31 : param31) : (~|param31)) << (&param31)) : (({param31, (8'hbb)} | (param31 ? param31 : param31)) | param31))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg12,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = (((((!wire5) ? {(8'hbb), wire0} : ((7'h43) && wire3)) ?
                     wire3[(1'h0):(1'h0)] : wire3) && $signed((~&(wire5 && wire1)))) >= wire3[(3'h5):(3'h4)]);
  assign wire7 = $signed($signed((($signed(wire6) ^~ ((8'hb8) ?
                         wire3 : wire5)) ?
                     {(wire4 >>> wire2)} : (wire4 != $signed(wire4)))));
  assign wire8 = (~^{wire5});
  assign wire9 = $signed(wire8);
  assign wire10 = {(~&$unsigned($unsigned($unsigned(wire0))))};
  assign wire11 = (~^$unsigned((wire4 * $unsigned($signed(wire8)))));
  always
    @(posedge clk) begin
      reg12 <= (~|$signed($unsigned((~(8'hb1)))));
    end
  always
    @(posedge clk) begin
      if ((((8'hb2) << $signed(wire7)) ?
          (^~((((8'ha5) ? reg12 : wire4) >> (~wire2)) ?
              $unsigned(wire11) : ((wire9 ? wire3 : wire0) ?
                  (7'h41) : (reg12 > wire4)))) : (({(|wire0)} ?
              ((+wire10) ?
                  wire2 : $unsigned(reg12)) : wire0[(1'h0):(1'h0)]) < wire7)))
        begin
          reg13 <= $unsigned(wire3[(3'h4):(1'h0)]);
          reg14 <= wire3[(1'h0):(1'h0)];
          reg15 <= {wire0,
              ({$unsigned(wire9)} | {(8'ha6),
                  ((wire9 ? wire8 : wire2) ? (&wire3) : (wire1 <<< wire2))})};
          reg16 <= reg14[(3'h4):(2'h3)];
          reg17 <= $signed((|(^~$signed((-wire0)))));
        end
      else
        begin
          if (wire5[(3'h7):(2'h3)])
            begin
              reg13 <= $unsigned(((|(~(~reg14))) <<< (!(8'ha1))));
              reg14 <= wire3;
              reg15 <= wire9[(3'h4):(1'h0)];
              reg16 <= (|wire4);
            end
          else
            begin
              reg13 <= (($signed((~|(~|wire5))) ?
                      reg15[(2'h3):(2'h2)] : (((reg12 == (8'ha7)) ?
                          {reg15, wire2} : $signed(reg16)) * wire8)) ?
                  reg13 : (^~wire8));
            end
        end
      reg18 <= {({$unsigned($unsigned(wire10)), (reg13 | $unsigned(wire3))} ?
              reg16[(3'h5):(3'h5)] : {reg13[(3'h5):(3'h5)],
                  ({wire5} >= $signed(reg16))})};
      reg19 <= $unsigned((wire11 ? wire9[(3'h4):(1'h1)] : {wire9}));
      if (($unsigned((8'hb6)) <<< reg13))
        begin
          reg20 <= wire3;
        end
      else
        begin
          reg20 <= wire8;
          reg21 <= wire7;
        end
      if ($signed($unsigned($unsigned((wire2 ?
          (reg19 > reg18) : (wire9 ? reg16 : wire2))))))
        begin
          if ((~^$unsigned($unsigned(wire7[(3'h7):(3'h7)]))))
            begin
              reg22 <= wire6[(4'hd):(2'h2)];
              reg23 <= $signed(wire5);
              reg24 <= reg20[(1'h0):(1'h0)];
              reg25 <= reg24[(2'h3):(1'h1)];
            end
          else
            begin
              reg22 <= (((8'ha6) ?
                      ((^(8'hbc)) ?
                          reg19 : wire9[(3'h5):(1'h1)]) : (wire7 | $signed($signed((8'h9e))))) ?
                  (reg21 <= reg16) : $unsigned($signed($signed((|reg19)))));
              reg23 <= $signed((($signed($signed(reg20)) ?
                  {wire4[(1'h1):(1'h1)]} : $unsigned(reg25[(2'h3):(2'h3)])) >= ((wire11 <<< $unsigned(reg18)) ?
                  $unsigned($signed(reg15)) : $unsigned((wire2 >>> reg18)))));
              reg24 <= $signed(($unsigned(($signed(wire5) != $signed(wire1))) >> $signed(reg22[(3'h6):(1'h1)])));
            end
          reg26 <= ((8'ha9) | wire9[(3'h4):(3'h4)]);
        end
      else
        begin
          if ($signed(reg20[(3'h7):(1'h1)]))
            begin
              reg22 <= (^~reg15[(1'h0):(1'h0)]);
              reg23 <= $signed($unsigned(($unsigned(reg26[(1'h0):(1'h0)]) < $signed((reg15 > reg13)))));
              reg24 <= (+$signed({wire9[(1'h1):(1'h1)],
                  {$unsigned(wire2), $unsigned(wire4)}}));
              reg25 <= wire1[(4'he):(4'hd)];
            end
          else
            begin
              reg22 <= reg25[(3'h4):(2'h3)];
              reg23 <= $unsigned(((!(~(reg15 ~^ reg15))) ?
                  ((((7'h41) ? reg18 : (7'h44)) ?
                      $signed(wire7) : $unsigned(wire7)) << (~(wire5 ?
                      reg22 : (8'ha3)))) : $unsigned((|$unsigned(reg23)))));
            end
          reg26 <= $unsigned((&$signed(($signed(reg17) < (!reg23)))));
        end
    end
  assign wire27 = $unsigned(wire6[(4'hb):(2'h3)]);
  assign wire28 = (|(($unsigned(reg21[(4'hf):(4'h9)]) ?
                          ((wire2 ^ reg24) << $signed(reg25)) : (~&{(8'hae),
                              reg22})) ?
                      (wire11 ?
                          (reg14[(3'h7):(1'h1)] ?
                              wire4 : (wire27 ?
                                  reg21 : reg20)) : $signed(reg20[(4'h8):(1'h0)])) : (^reg13[(2'h3):(2'h3)])));
  assign wire29 = wire28[(4'ha):(1'h0)];
  assign wire30 = ($signed((~&wire7[(5'h11):(4'hb)])) >>> ($unsigned(((&wire10) ?
                      wire6[(4'he):(4'hd)] : (~&reg13))) ^ (&$signed((^~wire5)))));
endmodule
