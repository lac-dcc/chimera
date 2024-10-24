module top
#(parameter param56 = (((8'ha8) ? {((~|(8'h9f)) > ((8'hac) && (8'h9e)))} : ((((8'hb5) ? (8'hb1) : (8'hb9)) ~^ (7'h40)) ? (-(&(8'had))) : (((7'h44) > (8'hbe)) ? ((8'hb4) ? (8'hb7) : (8'ha8)) : (|(8'hbf))))) <<< ((({(8'h9d), (8'h9e)} ? ((8'h9d) != (8'h9d)) : ((8'hac) ^ (7'h42))) ^~ {(7'h41), (^~(8'hb3))}) - (((~|(7'h41)) - ((8'haa) && (8'ha7))) ? ((+(8'hb1)) >>> ((8'h9c) >= (8'hb0))) : ((&(7'h44)) == (~|(8'hbf)))))), 
parameter param57 = (((7'h42) >= {((8'hac) ? param56 : (param56 ^ (7'h41)))}) ? (+param56) : param56))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire17,
                 wire4,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  assign wire4 = ((-{(~(!wire1))}) ?
                     {((+$unsigned(wire2)) >>> wire2),
                         $signed($signed($signed(wire3)))} : $unsigned($signed((~|wire3[(4'hd):(4'hc)]))));
  module5 #() modinst18 (.clk(clk), .wire6(wire1), .wire7(wire4), .wire9(wire2), .wire8(wire3), .y(wire17));
  always
    @(posedge clk) begin
      if ((8'ha5))
        begin
          reg19 <= $unsigned((8'ha3));
          reg20 <= $signed(($signed(wire1) ? (~^wire3) : reg19));
          reg21 <= $unsigned($unsigned(reg20[(5'h15):(4'he)]));
          if ((^~wire3[(4'ha):(3'h4)]))
            begin
              reg22 <= $unsigned((((^$signed((7'h44))) >> ($unsigned(wire0) ?
                      wire2[(2'h3):(1'h1)] : $unsigned(reg21))) ?
                  ($unsigned((wire17 * reg20)) >> {(wire2 ^~ reg19),
                      $signed(wire2)}) : (~($signed((8'ha0)) - {wire2,
                      wire2}))));
              reg23 <= ($unsigned((&$signed((wire1 ? wire17 : reg21)))) ?
                  $unsigned((^$unsigned(wire2[(1'h0):(1'h0)]))) : reg20);
            end
          else
            begin
              reg22 <= wire4[(4'h9):(2'h2)];
              reg23 <= reg22[(3'h5):(3'h5)];
              reg24 <= $signed((!{$unsigned($signed(reg21)), wire0}));
              reg25 <= ((~($signed((reg24 << wire2)) ?
                      (|(^~wire0)) : (^wire1))) ?
                  reg19 : (^~$unsigned(({(8'hac), reg22} ?
                      reg22[(3'h4):(3'h4)] : (|(8'ha1))))));
              reg26 <= $signed((($unsigned((8'hb3)) >> (^(reg21 * (8'ha8)))) <= $signed($signed((wire2 ^ reg20)))));
            end
        end
      else
        begin
          reg19 <= $signed(reg20);
          reg20 <= reg19;
          reg21 <= (reg26[(4'he):(4'h8)] | (($unsigned($signed((8'ha4))) ~^ $signed((|reg20))) ?
              ($signed((!wire4)) ?
                  ((~&reg20) <<< $signed(wire1)) : $signed((reg21 < wire4))) : (~^{wire3,
                  $unsigned(wire17)})));
        end
      reg27 <= ((~(reg25 ^~ ({wire4, reg26} ?
          wire4 : (~&reg25)))) > (~|(^~{(reg24 ? reg23 : (8'hab))})));
      if ({wire0[(2'h3):(2'h2)],
          (~^(reg26 ?
              ({reg25} ? $signed(reg26) : $unsigned((7'h41))) : reg25))})
        begin
          reg28 <= $signed({{{reg25}, ((wire3 == reg24) >>> $signed(reg23))}});
          reg29 <= (8'ha0);
          reg30 <= reg22;
        end
      else
        begin
          reg28 <= ($unsigned(wire0[(1'h1):(1'h1)]) ?
              wire17[(4'hc):(2'h2)] : $signed({(|reg25)}));
          reg29 <= (~&(&(reg24 | (~&$unsigned(wire17)))));
          reg30 <= reg20;
          reg31 <= (&((8'hac) >> reg27));
          reg32 <= (~&(!(+reg28[(4'hf):(3'h5)])));
        end
    end
  assign wire33 = wire2;
  assign wire34 = reg29[(3'h6):(2'h3)];
  assign wire35 = {$unsigned($unsigned($unsigned($signed((7'h42))))),
                      reg30[(2'h2):(2'h2)]};
  assign wire36 = $signed(((((reg30 ? reg20 : reg27) * {reg19,
                      (8'hb5)}) * (reg19 ?
                      reg25 : (reg24 | reg32))) & $signed($unsigned((+(8'hbb))))));
  always
    @(posedge clk) begin
      if (wire17)
        begin
          if (reg32[(4'h8):(3'h4)])
            begin
              reg37 <= $unsigned((!$signed((wire17 ^~ (reg21 - wire17)))));
            end
          else
            begin
              reg37 <= {(+(^$signed(reg30[(2'h2):(1'h1)])))};
              reg38 <= {$signed((reg21 ?
                      ((^reg19) > (wire4 && reg31)) : reg25[(4'hf):(4'he)]))};
              reg39 <= reg21;
              reg40 <= {($unsigned((reg24 ?
                          (wire17 || reg39) : {reg19, reg20})) ?
                      (~|reg23) : $signed($unsigned(reg27[(2'h2):(1'h1)])))};
              reg41 <= (8'ha8);
            end
          if (reg39)
            begin
              reg42 <= {reg24[(1'h0):(1'h0)],
                  (+(&((wire35 ? reg41 : reg24) * (-reg30))))};
              reg43 <= wire17;
              reg44 <= ($unsigned(reg32) && wire35[(1'h0):(1'h0)]);
            end
          else
            begin
              reg42 <= wire35[(4'hf):(3'h4)];
              reg43 <= $signed($unsigned(wire36));
            end
          reg45 <= $signed($signed({$signed({reg29, wire33})}));
          reg46 <= {{reg44, reg28},
              $unsigned((reg39[(2'h2):(1'h0)] << ((8'hb0) * reg42[(3'h6):(2'h2)])))};
          reg47 <= reg45;
        end
      else
        begin
          reg37 <= ((reg43[(4'hd):(2'h3)] == ($signed($signed((8'hbb))) ?
              {(wire36 ? reg20 : wire36),
                  (8'hb3)} : reg38)) >= ((~|reg26[(4'ha):(4'ha)]) ?
              reg41 : (~reg41)));
        end
      reg48 <= (|reg20[(4'hc):(3'h5)]);
      reg49 <= (8'hb2);
    end
  assign wire50 = $signed((8'hba));
  assign wire51 = (reg47[(1'h0):(1'h0)] ?
                      ($unsigned({(wire1 ?
                              reg49 : (8'hb2))}) || wire0[(1'h0):(1'h0)]) : reg30[(1'h0):(1'h0)]);
  assign wire52 = reg49;
  assign wire53 = $signed((((~&{reg45}) ^ (reg25[(5'h11):(2'h2)] >>> $signed(wire52))) ?
                      (($unsigned(reg19) ?
                          $signed(wire51) : reg43[(1'h0):(1'h0)]) * (~^((8'ha3) >>> reg46))) : {(reg44 ~^ reg48[(3'h4):(1'h0)])}));
  assign wire54 = $unsigned({reg39[(4'h8):(2'h3)]});
  assign wire55 = ($unsigned(reg40) ?
                      (8'ha6) : ((8'hbb) ?
                          wire35[(4'ha):(2'h2)] : $signed((8'hb3))));
endmodule

module module5
#(parameter param15 = (^(8'hb8)), 
parameter param16 = (~^param15))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  assign y = {wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = $unsigned(({wire7[(5'h14):(3'h7)],
                          ($signed(wire8) ?
                              $signed(wire8) : $unsigned(wire9))} ?
                      {$signed(wire7),
                          wire7[(2'h3):(2'h3)]} : wire7[(1'h1):(1'h0)]));
  assign wire11 = ($unsigned($signed($signed($unsigned(wire9)))) && {wire9[(4'hc):(4'hc)],
                      $signed(wire9[(4'hc):(4'h8)])});
  assign wire12 = ($unsigned(wire10) ?
                      (&$signed(({wire6,
                          wire8} == {(8'h9e)}))) : $unsigned($unsigned({$unsigned(wire6),
                          $unsigned(wire6)})));
  assign wire13 = (~{wire12[(2'h2):(1'h0)], $signed((^(wire8 < wire8)))});
  assign wire14 = wire12;
endmodule
