module top
#(parameter param40 = (~{(7'h42), {(((8'hb6) ? (8'hb2) : (8'hba)) <<< {(8'hb5), (8'h9d)}), (((8'h9f) - (8'hb7)) == ((8'ha9) ? (8'hba) : (8'ha6)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg39,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = $unsigned(wire4[(1'h0):(1'h0)]);
  assign wire6 = $signed($unsigned((wire2 ?
                     $signed((wire3 ?
                         wire3 : (8'ha9))) : wire2[(4'hd):(1'h1)])));
  assign wire7 = $unsigned(($unsigned((~|wire5)) ?
                     $signed(wire4[(1'h1):(1'h1)]) : $unsigned($signed((wire6 ?
                         (8'ha2) : wire3)))));
  assign wire8 = wire5[(4'h8):(4'h8)];
  assign wire9 = wire4[(3'h7):(2'h3)];
  assign wire10 = $unsigned((wire5[(4'ha):(4'h9)] << (8'haf)));
  assign wire11 = (8'ha4);
  assign wire12 = $unsigned($unsigned(({(wire2 > wire3), (^wire0)} ?
                      wire3[(1'h0):(1'h0)] : {(wire11 ? wire6 : wire9)})));
  assign wire13 = (~&((^~((wire3 == (8'hbc)) && wire8[(1'h0):(1'h0)])) ?
                      ($signed((~^wire6)) ?
                          wire5[(3'h5):(3'h5)] : ((wire7 ? wire1 : wire3) ?
                              (wire3 != (8'haf)) : $unsigned(wire2))) : $signed($signed($unsigned((8'ha4))))));
  assign wire14 = ($unsigned($signed({(~&wire2),
                      $unsigned(wire2)})) << ((|($signed(wire4) != $unsigned(wire7))) & (wire13 ?
                      ({wire9,
                          wire1} + (&wire5)) : ($unsigned(wire3) * $unsigned((8'haf))))));
  always
    @(posedge clk) begin
      reg15 <= (((((~^wire12) <= wire4) <= ($signed(wire2) || $signed(wire13))) ?
          ($signed((wire7 < wire2)) & wire0[(3'h6):(1'h0)]) : $unsigned(((wire3 & wire11) ?
              (^(7'h42)) : $signed(wire2)))) - $signed(wire8));
      reg16 <= {(&$unsigned((-(!wire0)))), wire8[(1'h0):(1'h0)]};
      reg17 <= wire5[(3'h4):(2'h2)];
      reg18 <= $signed($unsigned((wire11 * $signed(wire4[(3'h7):(3'h4)]))));
    end
  assign wire19 = ((reg16[(2'h3):(1'h0)] << wire10) ^ wire2);
  assign wire20 = (!(+wire13));
  assign wire21 = $unsigned(wire0[(4'hf):(2'h2)]);
  assign wire22 = reg16[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg23 <= wire12[(4'hd):(4'ha)];
      if (wire1)
        begin
          reg24 <= (~^$signed(($signed(reg15[(2'h2):(1'h0)]) <<< reg18[(5'h11):(3'h6)])));
          reg25 <= wire5[(3'h7):(1'h0)];
        end
      else
        begin
          if ((reg15 ?
              $unsigned((^wire4)) : (-((~|(|reg25)) ?
                  {$unsigned(reg25),
                      $signed(wire10)} : ($unsigned(wire22) >> {wire3})))))
            begin
              reg24 <= (~({wire2,
                  (wire5[(3'h4):(3'h4)] ?
                      {wire1} : (wire20 >= wire7))} >= (wire20[(4'hb):(1'h0)] >>> wire22[(2'h2):(2'h2)])));
              reg25 <= ($signed(wire6[(3'h5):(3'h5)]) & wire11[(3'h4):(3'h4)]);
              reg26 <= $unsigned((-$unsigned((((7'h40) != (8'hb7)) == reg17[(4'h9):(2'h3)]))));
              reg27 <= (reg23 > wire7);
              reg28 <= (&$signed($signed({{reg17}})));
            end
          else
            begin
              reg24 <= wire5;
              reg25 <= ($signed(((((8'haf) ? wire12 : (8'ha2)) ?
                  wire22 : $signed(reg25)) == $signed(((7'h44) << reg17)))) > ((~^$signed($signed(wire20))) ?
                  wire3 : (reg17 >> ($unsigned(wire20) == reg24[(3'h7):(3'h6)]))));
            end
          if ((8'hbc))
            begin
              reg29 <= (-$unsigned($signed((~(reg18 ^ wire13)))));
              reg30 <= $signed(((($signed(reg27) ? {reg25} : $unsigned(wire6)) ?
                      $signed(wire2[(4'h9):(2'h2)]) : $signed((8'h9d))) ?
                  reg26 : $signed((!wire1))));
            end
          else
            begin
              reg29 <= ((({((8'had) ? wire6 : (8'hb9))} ?
                      (~reg15[(4'h9):(3'h6)]) : ({(8'ha8)} != (wire11 | wire8))) - $unsigned(wire14)) ?
                  ($unsigned(({reg15,
                      wire6} >>> wire10[(2'h3):(2'h2)])) | wire8[(1'h0):(1'h0)]) : wire5);
            end
          reg31 <= $unsigned(reg23);
        end
      if ((($unsigned({(wire20 ? (8'had) : wire20)}) <<< $unsigned({{wire9}})) ?
          reg24[(1'h0):(1'h0)] : {$signed($unsigned((wire1 ? wire0 : reg29)))}))
        begin
          if ((~^$unsigned(wire9)))
            begin
              reg32 <= $signed($signed($unsigned($signed((reg26 ?
                  wire9 : reg17)))));
            end
          else
            begin
              reg32 <= $unsigned($unsigned($signed($unsigned(wire4[(4'hb):(3'h7)]))));
              reg33 <= (8'ha8);
            end
        end
      else
        begin
          if ($signed((8'ha4)))
            begin
              reg32 <= {($signed(($unsigned(wire21) ?
                          (reg27 ^ wire6) : {wire13})) ?
                      wire4[(4'h9):(2'h2)] : $unsigned(wire6[(4'hb):(2'h3)]))};
              reg33 <= $unsigned(({(reg15[(4'ha):(3'h4)] ?
                          (wire22 >> wire20) : {(8'ha7)}),
                      $unsigned((reg25 ~^ (8'hbb)))} ?
                  (((reg27 <= wire4) * $signed(wire13)) >= $signed($unsigned(reg17))) : reg33));
              reg34 <= (+$signed(wire22));
            end
          else
            begin
              reg32 <= ((-($unsigned(reg31[(1'h0):(1'h0)]) ?
                      {(~&wire20), reg31} : $signed((&(8'hb3))))) ?
                  reg25[(3'h4):(2'h3)] : $signed(wire7[(3'h6):(1'h0)]));
            end
          reg35 <= $signed(wire6[(4'hb):(3'h7)]);
        end
      reg36 <= (reg28 > (($signed((wire5 ^~ wire7)) >>> $unsigned(wire0[(3'h6):(1'h1)])) < ($unsigned($signed(wire3)) ~^ $unsigned(reg33))));
    end
  assign wire37 = ($unsigned(($unsigned({wire21, reg26}) ?
                      wire13[(2'h2):(2'h2)] : (~$unsigned(wire4)))) & (^~{wire3[(3'h6):(1'h1)]}));
  assign wire38 = wire11[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg39 <= ((reg31 ?
          $unsigned((reg27 ?
              reg24 : ((8'haa) >> wire22))) : ($signed({wire22}) ^~ ($unsigned(reg26) >>> reg34))) != reg26[(4'h8):(2'h3)]);
    end
endmodule
