module top
#(parameter param23 = ((({((8'ha9) ^ (8'hb6)), ((8'hbc) ? (8'h9d) : (8'ha1))} ? (((7'h40) ? (8'hac) : (7'h43)) ^~ (+(8'hac))) : {(8'hb0)}) < ((((7'h41) ~^ (8'hac)) || (^~(7'h43))) ? (+((8'hba) ? (8'hb1) : (7'h42))) : (-{(8'hb6), (8'ha9)}))) ? (&((((8'ha1) ? (8'hb0) : (8'h9c)) & ((7'h40) | (8'ha0))) ? (((7'h41) ? (8'hb4) : (8'hbd)) ~^ (|(8'ha5))) : (^((8'h9e) ? (8'hb5) : (8'ha5))))) : (((~^(8'haf)) != ({(8'ha8), (8'h9c)} >>> ((8'had) * (8'hb8)))) ? (~(-((8'ha4) ? (8'h9f) : (8'haf)))) : (^~(((8'haf) ? (8'had) : (8'ha2)) ? ((8'hab) >>> (8'ha0)) : ((8'hbd) ? (7'h42) : (8'hae)))))), 
parameter param24 = (!((((param23 < param23) >> {param23, param23}) ^ ((param23 ^~ (8'haa)) ? (8'hb2) : (param23 ? param23 : param23))) > ((~(param23 && param23)) ? ((+param23) ^~ (&param23)) : ((8'hb6) | (~&(8'hb8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~^{$unsigned(wire3[(3'h7):(3'h5)]), (8'h9d)}))
        begin
          reg5 <= (8'ha5);
          reg6 <= ((~^$signed((wire2 ?
              {wire0, wire3} : {wire4}))) >>> (~^{$signed(wire2[(4'hf):(3'h5)]),
              {(wire2 ? wire3 : wire1), (wire0 != wire4)}}));
          if ($signed($unsigned((wire2[(4'h8):(2'h2)] ^ wire0))))
            begin
              reg7 <= {(reg6[(3'h5):(1'h1)] ?
                      $signed((+$signed(wire0))) : ($signed($unsigned(reg6)) ?
                          (-(wire3 >= (8'hb9))) : {(wire1 ?
                                  wire4 : (8'hbb))}))};
              reg8 <= $unsigned((((+$signed(wire1)) ?
                      $unsigned($unsigned(wire2)) : {$signed(reg6),
                          reg6[(3'h4):(1'h0)]}) ?
                  $signed(wire1) : (wire2 ? (8'ha7) : reg7)));
            end
          else
            begin
              reg7 <= wire0[(1'h0):(1'h0)];
              reg8 <= wire4[(3'h6):(2'h3)];
              reg9 <= (~&((((reg6 ? reg6 : reg5) ?
                      (~|(8'ha6)) : wire1[(3'h5):(3'h4)]) ?
                  ($signed(reg8) ?
                      $unsigned(wire4) : wire1) : (8'h9f)) ^ wire4));
              reg10 <= $signed({(~&((reg5 ^~ wire2) >>> (reg8 * (8'hab))))});
              reg11 <= ($signed((+$unsigned((7'h43)))) ?
                  reg8 : (reg9[(2'h3):(2'h3)] ?
                      $unsigned($signed($unsigned(wire2))) : {(wire1[(1'h1):(1'h0)] ~^ (wire2 ^ wire3)),
                          reg6}));
            end
          reg12 <= ($signed(reg8[(2'h3):(1'h0)]) ?
              (-((8'h9c) ?
                  (8'hb0) : $signed((!(7'h41))))) : ($unsigned($unsigned((^reg5))) ^~ reg11));
        end
      else
        begin
          reg5 <= reg5;
          reg6 <= reg8[(3'h5):(2'h3)];
          reg7 <= (!{(-((reg8 * (8'hbb)) & ((8'hb0) ? reg9 : wire2))),
              $signed($signed((reg10 ? wire2 : wire0)))});
          reg8 <= (wire0 ?
              (($unsigned($signed(reg8)) > ({wire1, (8'had)} ?
                  (~&reg12) : (wire4 && wire2))) != reg7[(4'h8):(3'h6)]) : ($unsigned((7'h42)) ?
                  (-((wire1 >> wire4) ? (reg11 >> reg12) : (8'hb3))) : ((reg11 ?
                          ((8'h9f) * reg6) : $signed(wire0)) ?
                      ((wire0 ? wire1 : (8'hac)) ?
                          (!reg8) : $signed(reg6)) : reg9)));
        end
      if ($unsigned($unsigned(wire3[(2'h3):(2'h2)])))
        begin
          if ({(reg8 ? reg5 : (+(~|(reg12 ^ reg6))))})
            begin
              reg13 <= (((reg6 ?
                      reg6 : reg11[(2'h2):(1'h0)]) | (~&($signed((8'ha1)) ?
                      {(7'h41)} : reg5))) ?
                  ((($signed(reg9) ?
                              reg9[(4'hb):(1'h1)] : (reg7 ? reg5 : reg8)) ?
                          reg6[(3'h5):(2'h3)] : $signed((reg9 >>> wire1))) ?
                      ($unsigned($signed(wire4)) == ($signed(reg6) ?
                          (reg10 ?
                              reg7 : wire2) : (~|reg9))) : ($signed($signed(reg5)) != (-reg8))) : reg12);
              reg14 <= reg12[(3'h6):(3'h5)];
              reg15 <= (!(-((!reg9[(2'h2):(1'h0)]) > reg9)));
            end
          else
            begin
              reg13 <= ((($signed($signed(reg14)) <= (8'hbf)) ?
                  $unsigned((^$signed(reg10))) : (reg14 ?
                      $unsigned(wire4[(4'ha):(1'h0)]) : reg8)) << reg6[(4'h9):(1'h1)]);
              reg14 <= wire2;
              reg15 <= ($unsigned((wire1[(4'hc):(1'h1)] >= $unsigned((wire1 * wire1)))) ?
                  reg7 : ($signed(((wire1 ? (8'h9f) : reg11) ?
                          reg8 : (&reg15))) ?
                      $signed({{reg15}}) : $unsigned($signed($signed(reg13)))));
              reg16 <= (wire4 ?
                  ((~&{$unsigned(reg6)}) != $signed(reg8[(4'ha):(3'h7)])) : $signed((!($unsigned(wire1) ?
                      $unsigned(reg9) : (reg12 ? wire4 : reg8)))));
            end
          reg17 <= (wire4[(3'h6):(1'h1)] < {wire1[(2'h2):(2'h2)]});
          reg18 <= $unsigned((8'hbd));
        end
      else
        begin
          if ({($signed((8'hbc)) || (($unsigned(wire0) ~^ {wire1, wire1}) ?
                  $unsigned($unsigned(reg10)) : wire0)),
              (~($signed((-reg17)) && {$unsigned(wire1),
                  (reg18 ? reg15 : reg14)}))})
            begin
              reg13 <= {(reg7[(4'he):(1'h0)] ?
                      $signed(($signed(reg17) ?
                          (-reg17) : $unsigned(reg13))) : reg6),
                  $signed((~{(reg10 - reg5), reg15}))};
              reg14 <= ($signed($unsigned(((reg9 ^ wire4) ?
                      reg9[(2'h3):(2'h3)] : (wire4 ? reg13 : reg9)))) ?
                  ({reg5} + (^((reg10 >> reg9) ^~ (reg9 >= reg5)))) : reg12[(1'h1):(1'h0)]);
              reg15 <= $unsigned($unsigned((((+reg14) ?
                      {reg13} : $unsigned(reg5)) ?
                  $unsigned($unsigned(reg18)) : ({reg9} ^ $unsigned((8'hb2))))));
              reg16 <= ($unsigned(reg7[(3'h6):(3'h6)]) ? wire0 : reg18);
              reg17 <= (reg7 >= reg11[(1'h0):(1'h0)]);
            end
          else
            begin
              reg13 <= (($unsigned((^~wire0[(3'h4):(2'h3)])) || wire0) > reg7[(4'ha):(3'h5)]);
            end
          reg18 <= (reg7 ~^ $unsigned($unsigned(($signed(reg10) && (reg16 ?
              reg10 : wire4)))));
          reg19 <= $unsigned(($unsigned($unsigned({(8'hb2)})) == (~&(~&$unsigned(reg11)))));
        end
    end
  assign wire20 = reg8;
  assign wire21 = $unsigned($signed((&wire4)));
  assign wire22 = reg14;
endmodule
