module top
#(parameter param31 = ((~(((-(8'ha6)) - {(8'ha8)}) > (((8'hae) << (8'hb0)) | {(8'hb9)}))) ? (((^~(8'hb5)) & ((~&(8'ha1)) == (~&(7'h41)))) ^ ((((8'hb7) * (7'h43)) ? {(8'h9d)} : ((8'hb7) ^ (8'ha2))) ? {{(8'hb7), (8'ha2)}, ((8'h9f) >>> (8'hb5))} : (-((8'haf) > (7'h42))))) : {({((8'ha0) > (8'ha0)), ((8'ha0) + (8'ha8))} ? (&((8'hb4) << (8'hbb))) : (((8'ha0) ^ (8'ha5)) ? ((8'hb6) ? (8'ha0) : (7'h42)) : ((8'h9e) ? (8'ha3) : (8'hb9)))), ({((8'hbe) <<< (7'h41)), ((8'hb6) ? (7'h42) : (8'h9e))} ? (((8'hb4) == (8'hae)) <= {(8'h9c), (8'hb3)}) : (((8'hb5) >= (8'hb6)) ? ((8'hbe) == (8'hae)) : (|(8'hb8))))}), 
parameter param32 = {(&(~|param31))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire30,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned((wire1[(4'h8):(3'h7)] ?
                     (wire4[(1'h1):(1'h0)] ?
                         wire1 : ((wire4 ?
                             wire1 : wire0) << wire2[(3'h6):(1'h0)])) : wire3));
  always
    @(posedge clk) begin
      reg6 <= ((~|{((!(8'hac)) * $signed(wire1)),
              (wire3 == (wire0 ? wire5 : wire4))}) ?
          ((((&wire3) ? (wire5 == wire0) : {wire4, wire1}) >> wire5) ?
              ((&{wire5, wire3}) ?
                  $unsigned(((7'h41) ?
                      wire2 : wire4)) : (-{wire1})) : wire0[(3'h4):(2'h2)]) : (-((~&wire2[(4'ha):(3'h5)]) | ($unsigned((8'ha1)) ?
              {wire4} : {wire4, wire1}))));
    end
  always
    @(posedge clk) begin
      reg7 <= (wire5[(2'h2):(1'h1)] ?
          ((wire4 ?
              (&$unsigned(wire5)) : $signed($signed(reg6))) || wire3) : wire0[(4'hc):(4'h8)]);
      if ((8'hb7))
        begin
          if ((8'hbe))
            begin
              reg8 <= wire5;
              reg9 <= wire3;
              reg10 <= (reg7 ?
                  reg8[(3'h4):(2'h3)] : ($unsigned((~wire3)) ?
                      $signed($signed(wire0)) : $unsigned((^~(|wire2)))));
            end
          else
            begin
              reg8 <= reg8[(3'h4):(1'h0)];
              reg9 <= {wire5, $signed(reg8)};
              reg10 <= {$signed($signed((~&$signed(reg7)))),
                  $unsigned($unsigned($signed(reg6)))};
            end
        end
      else
        begin
          reg8 <= {(^~(&$signed($signed(reg10))))};
          reg9 <= reg7[(5'h12):(5'h10)];
          if ({reg10})
            begin
              reg10 <= reg8[(1'h0):(1'h0)];
              reg11 <= {reg7[(4'hb):(3'h6)]};
              reg12 <= wire4[(3'h4):(3'h4)];
              reg13 <= wire4[(4'hd):(4'hd)];
              reg14 <= (&reg12);
            end
          else
            begin
              reg10 <= $unsigned($unsigned((|((~(7'h40)) * (wire2 ?
                  reg8 : reg8)))));
              reg11 <= $unsigned(((^~wire3[(3'h5):(2'h2)]) ?
                  (reg14 && $unsigned($signed((8'hb7)))) : $signed($signed(wire3[(2'h3):(2'h3)]))));
              reg12 <= reg6;
              reg13 <= ((~&(+reg12[(1'h1):(1'h0)])) ? reg12 : reg13);
              reg14 <= $signed(reg10[(5'h14):(3'h5)]);
            end
        end
      if ((reg14[(3'h5):(3'h5)] ? reg8 : {wire1}))
        begin
          reg15 <= reg12[(1'h0):(1'h0)];
          reg16 <= (reg7 <= (~^(reg13[(1'h1):(1'h1)] ?
              ($signed(reg8) ?
                  $unsigned((7'h40)) : (reg15 > (8'haa))) : ((wire1 ?
                      wire2 : reg11) ?
                  (wire4 ? (7'h44) : reg13) : (~^reg9)))));
          reg17 <= (((reg8[(2'h2):(1'h1)] ^~ $unsigned((reg8 ?
                  wire5 : reg14))) >> (reg13[(4'h9):(2'h2)] ^~ (~(reg6 <= wire5)))) ?
              $unsigned(wire2[(2'h2):(2'h2)]) : (8'ha5));
          if (($signed({$signed(reg12[(1'h0):(1'h0)]), $signed((^reg9))}) ?
              ({{{reg11}}} == (8'hbb)) : {$unsigned($signed($signed(reg13)))}))
            begin
              reg18 <= (!$unsigned(reg9[(5'h12):(2'h2)]));
            end
          else
            begin
              reg18 <= wire2[(1'h0):(1'h0)];
            end
          reg19 <= (((!reg12[(2'h2):(1'h0)]) >= $signed($unsigned($unsigned(reg12)))) && $unsigned(reg12));
        end
      else
        begin
          if ((^~wire0))
            begin
              reg15 <= ((reg18[(2'h2):(1'h0)] ~^ (-((reg7 ^~ reg19) ?
                  ((8'hbc) != wire5) : reg19[(3'h6):(2'h3)]))) || reg8[(2'h2):(1'h1)]);
              reg16 <= $signed(reg17[(2'h3):(1'h0)]);
              reg17 <= {wire5,
                  {(($unsigned(reg16) + $signed(wire2)) ^~ {reg14[(3'h4):(2'h2)],
                          reg7}),
                      (^~((reg8 ? reg14 : wire0) ?
                          (wire1 >>> reg9) : (reg14 ? wire2 : reg12)))}};
            end
          else
            begin
              reg15 <= reg9;
              reg16 <= (-(reg6[(3'h5):(1'h1)] ?
                  (^($unsigned(reg16) >>> wire1)) : (8'ha1)));
              reg17 <= $unsigned($signed(wire4));
              reg18 <= $unsigned(wire1[(1'h0):(1'h0)]);
              reg19 <= reg6;
            end
        end
      reg20 <= $signed((($unsigned((wire3 < reg8)) ?
              $signed((&reg14)) : (~$unsigned(reg18))) ?
          ((&$unsigned((7'h44))) & reg16) : ((^~wire0[(4'hd):(2'h3)]) << ($unsigned(reg15) ?
              wire1 : {reg12}))));
    end
  assign wire21 = $signed({reg11[(1'h0):(1'h0)],
                      ($unsigned($signed((8'hb8))) ? wire1 : reg17)});
  assign wire22 = reg12;
  assign wire23 = (+((+{(reg19 ? reg12 : wire21)}) + (wire22 ?
                      (+wire2[(3'h4):(2'h2)]) : (wire4 ?
                          $unsigned(reg10) : (wire2 ? (8'h9f) : (8'hbd))))));
  assign wire24 = (wire5[(3'h4):(1'h0)] ?
                      reg11 : ((wire4[(4'hf):(3'h6)] ?
                              $signed($signed((8'hb5))) : {(reg20 ?
                                      reg13 : reg14),
                                  (reg13 ? reg15 : wire21)}) ?
                          $unsigned($signed((8'hbc))) : $signed(reg13[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ((({reg9} ?
              (((8'hbe) ? wire4[(3'h5):(2'h2)] : $signed(wire23)) | ((8'hae) ?
                  (reg12 ?
                      reg13 : (8'h9e)) : reg7)) : (~wire0[(4'hd):(2'h2)])) ?
          (~|$signed((^~(wire22 ?
              reg12 : wire22)))) : $signed(reg7[(1'h0):(1'h0)])))
        begin
          if (reg6[(3'h6):(2'h2)])
            begin
              reg25 <= wire0[(4'hc):(3'h7)];
            end
          else
            begin
              reg25 <= $signed((8'haa));
            end
          reg26 <= reg19;
          reg27 <= $signed($unsigned((!$unsigned((wire23 ? (8'hac) : reg9)))));
        end
      else
        begin
          reg25 <= $unsigned(reg13[(3'h4):(1'h1)]);
          reg26 <= ($signed((reg14[(2'h3):(2'h3)] || ($unsigned((8'h9c)) >> $signed(wire21)))) >> {{{{wire1},
                      wire4}}});
          reg27 <= $signed((reg16 && wire21));
          reg28 <= {{(($signed(reg27) ~^ (reg19 ?
                      reg14 : reg10)) == $signed((reg15 & reg14))),
                  ((|wire1) ?
                      {$unsigned(reg16), {wire2}} : (+(reg16 ^ wire1)))}};
          reg29 <= $signed($unsigned(reg7[(5'h15):(1'h1)]));
        end
    end
  assign wire30 = (~|({($signed((8'hbb)) ^~ wire3[(3'h6):(3'h5)])} <<< $signed((-$signed((8'ha7))))));
endmodule
