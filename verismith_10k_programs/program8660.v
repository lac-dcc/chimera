module top
#(parameter param67 = (-({(~^(8'hae)), {((8'ha2) ? (8'hba) : (8'hab))}} ^ ({{(8'ha9), (7'h41)}, (8'h9f)} ? (((8'hb2) | (8'hb2)) ? ((8'ha8) ? (8'ha3) : (8'hae)) : (-(8'hac))) : ((~|(8'h9f)) ^~ ((8'ha9) > (8'hac)))))), 
parameter param68 = (~&((((8'hab) ? param67 : (param67 ^~ param67)) ? param67 : param67) > param67)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire63,
                 wire31,
                 wire6,
                 wire5,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire5 = (&$signed((wire0 <<< ((~wire4) ^ (wire0 | (8'ha4))))));
  assign wire6 = $unsigned($signed((wire2[(2'h2):(1'h0)] || {(wire3 == wire4)})));
  always
    @(posedge clk) begin
      if (($signed(wire3[(2'h2):(1'h0)]) ? wire1 : wire6[(4'h8):(1'h0)]))
        begin
          reg7 <= {wire3[(1'h0):(1'h0)]};
          reg8 <= $signed((^{(wire2[(1'h1):(1'h1)] ?
                  {(8'ha3), wire0} : reg7)}));
          if (wire6)
            begin
              reg9 <= $signed($unsigned(((((8'haa) ^~ reg8) ?
                      {wire6, reg8} : (wire5 << wire4)) ?
                  (~reg8[(4'hd):(1'h0)]) : $signed((+wire3)))));
              reg10 <= wire6;
            end
          else
            begin
              reg9 <= (&($signed(((reg10 - reg7) & (+reg7))) ?
                  reg7[(1'h1):(1'h0)] : {$unsigned((wire5 >> wire4))}));
              reg10 <= (($unsigned((8'ha3)) ?
                  reg7[(3'h4):(2'h3)] : reg9) << (reg8[(4'hd):(3'h6)] <<< $unsigned($signed(reg9))));
              reg11 <= wire0[(2'h3):(1'h1)];
              reg12 <= ($unsigned((wire5[(2'h2):(1'h0)] ? reg11 : (^{wire6}))) ?
                  ({reg7} != {reg9}) : $unsigned($unsigned($signed($signed(reg10)))));
            end
          reg13 <= (reg8 ? reg11[(4'hb):(3'h7)] : $signed(reg7[(3'h5):(1'h0)]));
          reg14 <= reg7[(2'h3):(2'h3)];
        end
      else
        begin
          reg7 <= reg13[(3'h7):(3'h6)];
          reg8 <= $unsigned((reg7[(3'h5):(3'h5)] ?
              ((wire0 >> (wire6 << reg10)) ?
                  reg7 : ($signed(reg7) <= wire2[(2'h3):(1'h0)])) : ($unsigned((~|wire2)) ?
                  ($signed((8'h9c)) ?
                      (reg14 ?
                          reg9 : (8'hb3)) : reg12) : wire2[(1'h1):(1'h0)])));
        end
      if (reg7)
        begin
          if (($signed(((8'ha4) ?
              $signed({reg9,
                  reg13}) : wire2)) ^ ((~&((|reg10) == wire3[(2'h2):(2'h2)])) | {(reg13 || $signed(wire2))})))
            begin
              reg15 <= $unsigned((~$unsigned(wire1)));
            end
          else
            begin
              reg15 <= (8'hb5);
              reg16 <= $signed(((wire4[(4'h9):(2'h2)] ? reg8 : (^wire0)) ?
                  $signed(wire6[(2'h2):(1'h1)]) : reg10));
              reg17 <= reg16;
              reg18 <= $unsigned($unsigned(($unsigned(wire0[(2'h3):(1'h1)]) - $signed((^~wire0)))));
            end
          reg19 <= wire3;
          reg20 <= (8'h9c);
          reg21 <= {reg12, (8'hb1)};
          reg22 <= $unsigned(reg8);
        end
      else
        begin
          if ((~|$signed($unsigned(((~|wire6) & {reg9})))))
            begin
              reg15 <= wire5[(1'h1):(1'h0)];
              reg16 <= ((+($unsigned(reg11[(4'ha):(4'h9)]) ?
                  {$unsigned(wire4)} : {$unsigned(reg15)})) < (reg22[(2'h3):(2'h3)] <<< (&reg21)));
              reg17 <= ($signed((~&(reg8[(4'hb):(4'hb)] >> reg19))) ?
                  (((~&((8'ha3) < reg11)) ?
                      (reg15[(1'h0):(1'h0)] ?
                          $unsigned(wire5) : (!reg8)) : $unsigned(reg16[(4'ha):(4'h9)])) >> wire2[(3'h7):(2'h2)]) : reg17);
              reg18 <= (wire0[(2'h2):(2'h2)] ^ $unsigned((reg22[(1'h1):(1'h1)] ?
                  reg16[(4'h8):(4'h8)] : reg13)));
            end
          else
            begin
              reg15 <= $signed((wire3[(2'h2):(1'h0)] <<< wire6));
            end
          reg19 <= (((wire6 ?
              {(|reg15),
                  (~|reg7)} : (~&reg9[(2'h2):(1'h0)])) + ((-(reg22 == wire2)) ?
              $unsigned((reg11 ?
                  reg10 : wire0)) : (!reg17))) >>> ($unsigned(wire6) ?
              $signed($unsigned($signed(reg7))) : ($signed({reg20, wire6}) ?
                  ((+wire2) >= (reg12 & reg14)) : $signed(reg22[(1'h0):(1'h0)]))));
        end
      reg23 <= (reg19[(4'ha):(4'h8)] || reg11);
      reg24 <= (8'ha8);
      if (((reg16 ?
          (+$signed({reg24, reg9})) : (($unsigned(reg17) ?
              (|reg8) : (~|reg13)) && $unsigned(wire3[(1'h1):(1'h0)]))) * (($signed($signed(reg18)) ?
              wire6[(3'h4):(1'h0)] : $signed(reg23[(2'h2):(1'h1)])) ?
          (wire2 ? $signed({reg22}) : (-$signed(reg20))) : (8'ha4))))
        begin
          reg25 <= reg9;
          reg26 <= (&((~&(~^$signed(wire0))) <= $unsigned($unsigned(((8'hbe) ?
              wire3 : reg20)))));
          if ($unsigned(wire3))
            begin
              reg27 <= (reg23 ?
                  (~{(^$unsigned(reg26)),
                      (^reg21[(4'ha):(1'h1)])}) : ($signed((|reg11)) ^ ($signed(reg16[(3'h7):(3'h6)]) == ((reg21 - reg26) ?
                      (reg20 ? reg14 : (8'hbc)) : (wire0 ? reg7 : reg13)))));
              reg28 <= ({{(&(wire6 ? (7'h40) : reg15)), reg27},
                      (~$signed($signed(reg23)))} ?
                  reg21 : $signed((reg10[(1'h0):(1'h0)] >>> reg7[(1'h0):(1'h0)])));
              reg29 <= (7'h41);
            end
          else
            begin
              reg27 <= reg26[(3'h6):(3'h6)];
              reg28 <= (((|((reg14 ? reg23 : reg22) ?
                      {wire0,
                          reg29} : (^~reg29))) & ((reg10 >> $signed(wire1)) ?
                      reg25[(5'h12):(5'h11)] : reg13[(1'h0):(1'h0)])) ?
                  wire2 : reg20);
            end
          reg30 <= {((~^$unsigned((wire6 ? wire2 : reg21))) ^ ({reg28,
                  {reg11}} | (8'ha8)))};
        end
      else
        begin
          reg25 <= reg12[(2'h2):(1'h0)];
        end
    end
  assign wire31 = (7'h43);
  module32 #() modinst64 (.wire34(reg12), .clk(clk), .wire35(wire31), .wire33(wire5), .wire36(reg19), .y(wire63), .wire37(reg18));
  assign wire65 = ({wire31, ((^~{(8'hab), reg27}) * (8'hbe))} ?
                      (($signed(reg19) << reg22[(2'h2):(2'h2)]) ?
                          ($signed(reg9) ?
                              $signed($unsigned(reg11)) : $unsigned(reg11[(4'he):(3'h4)])) : ((8'hb0) ?
                              ($unsigned(reg19) ?
                                  (wire31 ? (8'haf) : reg13) : {reg17,
                                      reg20}) : $signed($signed(wire31)))) : (reg18[(4'hb):(3'h4)] ?
                          $unsigned((8'hb9)) : $unsigned((^~((8'h9e) || wire31)))));
  assign wire66 = $unsigned(reg19[(3'h6):(1'h1)]);
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  input wire [(3'h7):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire51,
                 wire39,
                 wire38,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire38 = $signed($signed((~{$unsigned(wire37), wire36})));
  assign wire39 = (&$unsigned($unsigned($signed(wire36))));
  module40 #() modinst52 (.y(wire51), .wire41(wire35), .wire43(wire36), .wire44(wire34), .wire42(wire37), .clk(clk));
  always
    @(posedge clk) begin
      reg53 <= wire33;
    end
  always
    @(posedge clk) begin
      reg54 <= $signed(wire35[(1'h1):(1'h1)]);
      reg55 <= (~|((^(^(wire39 || (7'h40)))) ?
          (^(|{wire51})) : (~^((~|wire51) >>> $unsigned(wire51)))));
    end
  always
    @(posedge clk) begin
      reg56 <= (($signed(($unsigned(reg55) ?
                  ((7'h41) ? wire35 : wire34) : (wire39 << reg55))) ?
              ((^~((8'h9c) ?
                  wire35 : wire39)) * wire51[(3'h4):(3'h4)]) : (7'h41)) ?
          (reg53[(4'ha):(1'h1)] ?
              (&(~&reg54)) : reg53[(4'hc):(4'h9)]) : ((wire36 ?
                  reg53[(4'hf):(4'hc)] : $unsigned($unsigned(wire36))) ?
              $unsigned((+(~^wire36))) : $signed($unsigned(wire39[(3'h6):(3'h6)]))));
      reg57 <= $signed((&{(wire39 ? wire35 : (wire34 ? (8'h9f) : (8'hb8)))}));
      reg58 <= $unsigned((~^$signed(reg53[(4'hf):(3'h5)])));
      reg59 <= ($signed(wire39[(4'hc):(3'h7)]) ?
          ((wire37 ~^ $unsigned(wire35)) ?
              $unsigned((((8'hbb) ^~ wire51) >>> (8'ha9))) : (^~$unsigned($unsigned(reg53)))) : wire36);
    end
  assign wire60 = ({wire33[(2'h3):(2'h2)],
                          ($signed((!wire37)) ?
                              $unsigned($unsigned(reg56)) : $unsigned((wire34 >= (8'haa))))} ?
                      reg58[(1'h0):(1'h0)] : reg53);
  assign wire61 = reg57;
  assign wire62 = (wire60[(3'h6):(1'h1)] == ($unsigned(wire61) ?
                      $signed((reg58 | (^reg55))) : $unsigned((^$unsigned(reg56)))));
endmodule

module module40
#(parameter param49 = {(((((8'ha5) >= (8'hb6)) & ((8'hb8) ? (8'hb5) : (7'h44))) != (((8'ha3) ? (7'h40) : (8'ha8)) * (^~(8'hbb)))) ? ((+((8'ha6) - (8'hbb))) ? (~(8'hb4)) : (~^((8'hab) ? (7'h44) : (8'hac)))) : ((|(^(8'hba))) ? ((!(8'hbf)) * {(7'h42)}) : (((8'ha6) | (8'ha0)) || ((8'hb2) ? (8'h9d) : (8'hb7)))))}, 
parameter param50 = (~((~&param49) + ({(param49 >= param49)} ? (&(-(8'hb1))) : ((8'h9f) ? (|param49) : param49)))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire43;
  input wire [(3'h5):(1'h0)] wire42;
  input wire [(4'hf):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  assign y = {wire48, wire47, wire46, wire45, (1'h0)};
  assign wire45 = wire41;
  assign wire46 = {wire43, wire41[(4'hb):(4'ha)]};
  assign wire47 = ($unsigned((~$signed((wire43 ?
                      wire43 : wire46)))) - (~|(~|wire46[(1'h1):(1'h1)])));
  assign wire48 = ((~|($signed(wire42[(1'h0):(1'h0)]) <= (wire42 ?
                      ((8'ha9) ? wire43 : wire46) : (wire46 ?
                          wire44 : wire47)))) ~^ $unsigned(wire42));
endmodule
