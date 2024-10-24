module top
#(parameter param22 = ((^~(~{(7'h42)})) ? {{(8'ha0), (8'hbf)}, (-((&(7'h41)) ? (!(8'hb2)) : ((8'ha5) ~^ (8'hbc))))} : (~{((~&(8'ha6)) >> ((7'h44) ? (8'hbf) : (8'hb9))), ((!(8'ha1)) ? (~|(8'ha0)) : ((8'hb8) <= (8'ha6)))})), 
parameter param23 = {((((param22 != param22) ? (8'ha2) : {param22}) ? param22 : {param22, (param22 ? param22 : (8'ha2))}) ~^ (((8'hb5) & (param22 << (7'h41))) ? (-((8'ha5) ? param22 : param22)) : {(param22 ? param22 : param22)}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = wire1[(2'h2):(1'h0)];
  assign wire6 = wire4;
  assign wire7 = (wire6 ^~ (wire0 && {wire0}));
  assign wire8 = $signed((wire2 ?
                     ($signed({wire4, wire2}) ?
                         (^(7'h42)) : ($unsigned(wire4) >= $unsigned(wire6))) : ((8'hb7) ?
                         $signed((wire0 ? (8'haf) : (8'ha0))) : ((+(7'h43)) ?
                             wire0[(1'h0):(1'h0)] : wire6))));
  assign wire9 = $unsigned(wire2);
  always
    @(posedge clk) begin
      if (wire5[(4'h9):(4'h8)])
        begin
          if (wire1)
            begin
              reg10 <= $signed({$unsigned($unsigned($unsigned(wire8))),
                  $unsigned(wire2[(3'h6):(2'h3)])});
              reg11 <= (($signed((wire1 > wire3)) ?
                  $unsigned(wire4) : (~reg10)) >= wire1[(3'h5):(3'h4)]);
              reg12 <= $unsigned((^(($unsigned(reg11) ?
                  (wire8 ? wire5 : wire0) : {wire5,
                      reg10}) >= $signed((wire5 >>> (8'hbc))))));
              reg13 <= (+wire4[(4'h8):(3'h7)]);
            end
          else
            begin
              reg10 <= (((8'hb9) ?
                  {$signed(reg10),
                      $signed(((8'hbc) ?
                          (8'haa) : wire8))} : $signed($unsigned({(8'h9c)}))) ^ (wire1 != (^wire5)));
              reg11 <= $unsigned($unsigned((wire3 ?
                  wire4 : $signed((reg10 == wire6)))));
              reg12 <= wire4;
            end
          reg14 <= {(~&(reg13[(4'hd):(3'h5)] || (wire2 << reg11))),
              wire5[(1'h0):(1'h0)]};
          if ((reg11 ?
              {((reg11 ?
                      ((8'ha6) == reg11) : wire9[(2'h3):(1'h0)]) <<< $unsigned((-reg14)))} : reg13[(4'h9):(4'h9)]))
            begin
              reg15 <= ($unsigned($signed($signed(reg13))) ~^ $unsigned(wire0[(3'h6):(1'h1)]));
              reg16 <= (wire9[(3'h7):(1'h1)] ?
                  (reg14[(4'h9):(1'h1)] ?
                      (^~(reg11[(3'h4):(2'h3)] ?
                          $unsigned(wire8) : $signed((8'hb3)))) : $unsigned(reg12)) : {$unsigned(wire8),
                      ($signed((wire6 || (8'ha0))) ?
                          (wire4 || wire5[(3'h6):(3'h4)]) : reg10[(1'h0):(1'h0)])});
              reg17 <= (8'ha5);
              reg18 <= $signed($unsigned(reg17));
            end
          else
            begin
              reg15 <= (|{(8'hbd), (reg15 < $signed($signed((8'haf))))});
              reg16 <= wire4[(4'he):(3'h4)];
            end
          reg19 <= wire0[(1'h1):(1'h1)];
        end
      else
        begin
          if ($unsigned(wire6[(3'h6):(3'h6)]))
            begin
              reg10 <= wire0[(3'h5):(2'h2)];
              reg11 <= reg12[(1'h0):(1'h0)];
              reg12 <= (((((reg17 <= (8'h9c)) ?
                      $signed(reg19) : $unsigned(reg12)) ^ ((8'hb0) ~^ (&(8'hb4)))) == $unsigned(reg12)) ?
                  (wire7[(3'h5):(3'h4)] | (((reg12 ?
                          reg19 : reg17) || ((7'h41) != (8'haf))) ?
                      $unsigned((wire0 ? wire4 : reg17)) : ($unsigned(reg15) ?
                          (wire4 <<< reg14) : (~|reg10)))) : reg16);
            end
          else
            begin
              reg10 <= reg15[(3'h6):(2'h2)];
              reg11 <= ((~&$signed({((8'hb9) >>> reg10),
                  $unsigned(wire7)})) <= (~&$signed(((reg19 - reg14) ?
                  wire1 : (wire6 <= reg13)))));
              reg12 <= reg10;
              reg13 <= $unsigned($signed(reg18[(2'h2):(1'h1)]));
            end
          if ({(($unsigned(wire4[(1'h0):(1'h0)]) ?
                  $signed((reg15 ? reg14 : reg10)) : (((8'hbf) ?
                      reg17 : (8'hb0)) | $unsigned(wire0))) << (+$unsigned((reg19 ?
                  wire5 : (8'hac))))),
              wire4[(2'h2):(1'h1)]})
            begin
              reg14 <= (wire5[(2'h3):(2'h2)] ?
                  $signed((reg10 << $signed((reg18 >= reg18)))) : ((7'h43) || reg17));
              reg15 <= (^(^(~&{$signed(wire4), reg16})));
              reg16 <= $signed(($unsigned({$unsigned((8'h9c)),
                      $signed(reg12)}) ?
                  {(~wire1[(3'h6):(1'h0)]),
                      ($signed(wire6) ?
                          (wire3 | reg11) : $unsigned(reg16))} : reg13));
            end
          else
            begin
              reg14 <= ($signed(((+(reg10 <= reg19)) && wire0)) ?
                  $unsigned(($unsigned(reg17[(1'h1):(1'h1)]) > reg17)) : $unsigned(({(reg14 ^~ reg12)} ~^ (~^$unsigned(wire4)))));
            end
        end
    end
  assign wire20 = ($signed({(((7'h44) <= reg13) ^ $signed(reg19)),
                          (+$signed(reg13))}) ?
                      ($signed($unsigned(reg17)) <= $signed(($signed(wire8) & (^~(8'ha0))))) : $unsigned(wire8[(3'h6):(2'h2)]));
  assign wire21 = (8'hbf);
endmodule
