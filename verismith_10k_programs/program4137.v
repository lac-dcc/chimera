module top
#(parameter param29 = {{{(~(!(8'hba))), ((+(8'hb3)) ^~ (8'hab))}, {(-((8'hab) ? (8'hac) : (8'hac))), (~|(|(8'ha5)))}}, (((((8'ha1) ? (8'hab) : (8'hbb)) <= (^~(8'h9e))) ? {((8'ha1) && (8'hb5))} : (((8'hae) ? (8'had) : (8'hb6)) ? ((8'h9e) ? (8'hb8) : (8'ha2)) : {(7'h44)})) ? {{(~(8'hbb)), {(7'h43)}}} : ((((8'hb6) * (8'ha2)) ? (^(8'hae)) : ((8'ha0) - (8'ha5))) | (^(8'haa))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg28,
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
                 reg11,
                 (1'h0)};
  assign wire4 = $signed((~(~^($signed(wire3) | (8'hb8)))));
  assign wire5 = $unsigned((((~^(wire2 ^ (8'hb5))) & $unsigned(wire3)) ?
                     $unsigned(wire3[(3'h4):(2'h3)]) : (8'ha2)));
  assign wire6 = ((wire4[(4'hc):(4'hb)] ?
                     wire0 : ((wire2 != $signed(wire5)) ?
                         $unsigned(((7'h43) ?
                             wire4 : wire2)) : $signed(wire2[(1'h0):(1'h0)]))) < wire1);
  assign wire7 = wire2[(1'h1):(1'h1)];
  assign wire8 = (&(wire7[(3'h4):(1'h0)] ?
                     ($unsigned(wire5[(3'h6):(2'h3)]) << $unsigned(wire2[(3'h4):(1'h1)])) : wire4));
  assign wire9 = (wire3 < {$signed($signed(wire2))});
  assign wire10 = (^(wire1 ? wire5 : wire8));
  always
    @(posedge clk) begin
      if ($signed(wire4))
        begin
          reg11 <= $unsigned(wire3[(3'h5):(1'h1)]);
          reg12 <= $signed($unsigned($unsigned(wire4)));
          if (wire7[(4'ha):(1'h1)])
            begin
              reg13 <= (wire5 + (wire6 != {$unsigned($unsigned((8'hae))),
                  $unsigned($unsigned(wire5))}));
              reg14 <= $unsigned(wire6[(3'h4):(1'h0)]);
              reg15 <= (wire3 ^~ {reg12[(4'ha):(4'h9)]});
            end
          else
            begin
              reg13 <= wire2[(3'h7):(3'h4)];
              reg14 <= (7'h40);
              reg15 <= (~&reg14);
            end
        end
      else
        begin
          if ((^~wire9[(4'hc):(1'h0)]))
            begin
              reg11 <= $signed($signed({wire4[(4'h9):(3'h4)]}));
              reg12 <= $signed(((wire3 >> $unsigned((8'h9d))) <<< $signed($signed((reg15 ?
                  wire7 : reg13)))));
              reg13 <= (^$unsigned(($signed(reg14[(4'hb):(2'h2)]) + reg13[(1'h1):(1'h1)])));
              reg14 <= wire7;
              reg15 <= wire3[(5'h10):(4'h8)];
            end
          else
            begin
              reg11 <= ($signed($unsigned((!$signed(wire4)))) ?
                  ((^~wire1) ?
                      wire2[(3'h7):(3'h5)] : ((-(!wire3)) ?
                          ({wire4} ^ (wire5 & wire5)) : $unsigned((wire1 - wire7)))) : wire2[(3'h6):(2'h3)]);
              reg12 <= {$signed((((wire3 + wire1) - (wire10 <<< wire6)) ?
                      (~^(^~wire6)) : (~|reg14)))};
              reg13 <= ($unsigned((~^$signed({(8'h9d)}))) ?
                  wire6[(2'h2):(2'h2)] : $unsigned($unsigned($unsigned({wire5}))));
            end
          reg16 <= (wire9 ? reg15 : (+wire4[(1'h1):(1'h0)]));
          reg17 <= wire0;
          reg18 <= {($signed(reg13) ? (8'hbe) : $unsigned(reg14))};
        end
      if ($unsigned($unsigned(wire5)))
        begin
          reg19 <= wire9[(3'h6):(2'h2)];
          reg20 <= ((((reg16 > (~|wire0)) ^~ wire0) ?
              ({wire7} ?
                  $unsigned($unsigned(wire4)) : wire0) : $unsigned($unsigned({wire1,
                  reg12}))) >= $signed(reg15));
        end
      else
        begin
          reg19 <= ($signed({$signed((reg13 == wire2)),
              (|reg14[(4'hb):(3'h5)])}) << $signed((((wire10 == wire9) ?
              $signed(wire7) : wire3) <<< (~&$unsigned(wire9)))));
          if ((~wire8[(3'h7):(3'h4)]))
            begin
              reg20 <= (($unsigned((reg16 >>> $unsigned((7'h43)))) < wire5) & (&((^~{reg20,
                      reg11}) ?
                  (reg14 ^ wire0) : ($unsigned(wire4) >= wire10))));
              reg21 <= ($signed({$unsigned(wire6),
                  ($unsigned(wire9) ? (&reg16) : $unsigned(reg20))}) >>> wire6);
            end
          else
            begin
              reg20 <= reg11[(1'h0):(1'h0)];
              reg21 <= $unsigned(($signed((((7'h41) ?
                      reg19 : wire5) != (wire9 >>> reg18))) ?
                  reg12 : (~^((reg16 ? reg12 : wire4) ^~ wire8))));
              reg22 <= $unsigned((~|{wire5[(2'h3):(2'h2)]}));
            end
        end
    end
  assign wire23 = (reg17 ?
                      $signed(wire3[(3'h5):(3'h5)]) : {wire2[(2'h3):(1'h1)]});
  assign wire24 = reg16[(1'h0):(1'h0)];
  assign wire25 = $signed($signed(wire3[(4'ha):(1'h1)]));
  assign wire26 = (&wire24);
  assign wire27 = ($signed($signed(({(7'h43), reg21} ~^ {wire26}))) ?
                      $signed(($unsigned((~^reg12)) ?
                          wire24[(2'h2):(2'h2)] : $signed($signed(wire3)))) : ((!((wire6 <<< wire4) | $signed(reg16))) && (-{((8'ha3) * reg22),
                          $signed((7'h42))})));
  always
    @(posedge clk) begin
      reg28 <= reg22;
    end
endmodule
