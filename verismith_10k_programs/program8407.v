module top
#(parameter param55 = ((((((8'hb6) ? (8'hb4) : (8'ha5)) ? ((8'hab) ? (8'haa) : (8'ha3)) : (+(8'h9d))) <= (8'hab)) <<< ({{(8'ha8)}} <<< {((8'hb4) != (8'ha9)), ((8'hab) ~^ (8'h9d))})) ? ({(((8'hba) ~^ (8'ha8)) ~^ (&(8'ha7)))} == ((((8'hac) != (8'hbc)) | {(8'h9d), (8'ha4)}) && (((8'hbe) + (8'h9d)) ? (&(8'hb3)) : ((8'ha7) ? (8'hb0) : (8'ha3))))) : (|((-(-(8'ha2))) * (((8'hbe) ? (7'h44) : (8'ha7)) ? (^(8'ha3)) : (~^(8'hb8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire54,
                 wire45,
                 wire43,
                 wire15,
                 wire13,
                 wire12,
                 wire11,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned({wire3});
      reg6 <= wire3;
      reg7 <= wire4;
    end
  always
    @(posedge clk) begin
      reg8 <= (8'hac);
      reg9 <= (&wire0[(3'h5):(2'h3)]);
      reg10 <= (wire3[(1'h0):(1'h0)] + $signed(wire1));
    end
  assign wire11 = ((($unsigned((^~wire3)) <<< (8'h9e)) ?
                          ((wire0 ?
                              (reg7 ?
                                  reg10 : reg6) : $unsigned(reg9)) < wire1) : (({wire0,
                                  wire3} ?
                              (^~reg7) : (reg8 >> reg8)) + reg10[(4'hb):(3'h7)])) ?
                      $signed($signed($unsigned((reg6 ?
                          reg10 : reg7)))) : $signed($unsigned((~^(reg7 + wire3)))));
  assign wire12 = $signed(wire1[(4'hd):(4'hb)]);
  assign wire13 = (~^(^(&reg9[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg14 <= ($signed((~^{wire11[(3'h6):(2'h3)], {wire3}})) ?
          reg9 : wire3[(4'h9):(3'h7)]);
    end
  assign wire15 = ((~reg5) <<< wire12[(1'h0):(1'h0)]);
  module16 #() modinst44 (.wire20(wire12), .wire18(wire13), .clk(clk), .wire19(reg6), .wire17(wire4), .wire21(wire2), .y(wire43));
  assign wire45 = reg8;
  always
    @(posedge clk) begin
      reg46 <= (~$signed(($signed($unsigned(reg5)) ^ $signed((+wire1)))));
      reg47 <= (+$unsigned((8'hb2)));
      if (($unsigned($unsigned(reg8[(3'h5):(2'h3)])) >= (((8'hb5) ?
          reg5[(4'h8):(3'h7)] : ({reg46} ?
              $signed(wire15) : wire1)) - $signed((8'ha0)))))
        begin
          reg48 <= (~|$unsigned($signed(($signed(wire15) - ((8'ha6) ?
              wire3 : reg10)))));
          if ($signed(($signed(reg9[(1'h0):(1'h0)]) <= $unsigned($unsigned((wire3 && wire11))))))
            begin
              reg49 <= $signed(($signed(wire43[(1'h1):(1'h1)]) ?
                  $signed(((&wire2) ?
                      wire11[(4'h8):(3'h7)] : (-reg5))) : reg10[(1'h1):(1'h1)]));
              reg50 <= reg49[(4'h8):(1'h1)];
            end
          else
            begin
              reg49 <= reg7;
              reg50 <= $signed($signed(reg10[(2'h2):(1'h0)]));
            end
          reg51 <= $unsigned((reg49[(4'h8):(3'h5)] <<< (+$unsigned((wire3 ?
              reg14 : (8'hbd))))));
        end
      else
        begin
          reg48 <= $signed($signed($signed({$unsigned(reg51)})));
        end
      reg52 <= reg8[(3'h6):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg53 <= (~^((((reg47 ?
          wire15 : reg49) >> reg6[(1'h0):(1'h0)]) << ($signed(reg48) <<< $unsigned(wire3))) >> {wire45[(1'h1):(1'h1)]}));
    end
  assign wire54 = wire11;
endmodule

module module16
#(parameter param42 = ((8'ha1) ? (|((8'hb7) ? {((8'hb1) != (8'ha6)), ((8'ha5) >= (8'ha9))} : ((^(8'hbe)) ? {(8'ha2)} : ((8'hb6) ? (8'hb1) : (8'hb7))))) : ((({(8'haa)} - (!(8'ha9))) ? {{(8'had), (8'ha7)}, {(8'hbf)}} : (~|(^~(8'hbc)))) & {(|((8'h9f) ? (8'ha4) : (8'haf)))})))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire22;
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire22,
                 reg38,
                 reg37,
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
                 (1'h0)};
  assign wire22 = $unsigned($unsigned(wire18));
  always
    @(posedge clk) begin
      if (wire19[(1'h1):(1'h0)])
        begin
          if ($signed({$signed(wire17)}))
            begin
              reg23 <= wire18;
              reg24 <= $unsigned(((&{{wire21, wire17},
                  ((8'ha9) ? wire21 : wire21)}) ^ (8'hb7)));
            end
          else
            begin
              reg23 <= (wire19 ? reg24 : wire20[(3'h6):(3'h4)]);
              reg24 <= wire17[(2'h2):(2'h2)];
              reg25 <= wire21[(1'h1):(1'h0)];
              reg26 <= $signed($unsigned((~|(&wire22))));
            end
          if ($unsigned($signed($unsigned(($signed(wire17) ?
              (|reg23) : $unsigned(wire21))))))
            begin
              reg27 <= {(wire17[(4'ha):(3'h4)] <= {{wire19[(1'h1):(1'h1)]},
                      wire20})};
              reg28 <= reg23[(3'h5):(1'h0)];
            end
          else
            begin
              reg27 <= $unsigned($unsigned((~|$unsigned((wire17 ?
                  (7'h40) : wire21)))));
              reg28 <= $unsigned(($unsigned($unsigned((reg26 ?
                  reg26 : reg25))) - (+(|wire20[(1'h0):(1'h0)]))));
              reg29 <= (($unsigned((~|reg28[(2'h2):(1'h0)])) ?
                  reg27 : $unsigned(($unsigned(wire20) ?
                      (wire20 >= (8'ha6)) : {reg23}))) & (+($signed($signed((8'hb3))) ?
                  wire21[(1'h0):(1'h0)] : (reg28 && $unsigned(reg26)))));
              reg30 <= $signed(reg28);
              reg31 <= reg27;
            end
          if (((((~(+reg28)) & ((wire20 ? wire21 : wire19) ?
                  $unsigned(wire17) : {reg30, (8'ha9)})) ?
              ($signed($unsigned(reg26)) ?
                  $unsigned(reg24) : reg23[(4'ha):(3'h4)]) : (reg27 ?
                  ($unsigned(wire22) <= wire20) : (!reg31[(2'h2):(1'h1)]))) != wire19[(2'h2):(1'h0)]))
            begin
              reg32 <= reg27[(2'h2):(1'h0)];
              reg33 <= $unsigned((~&(((~^wire18) ? $signed(wire17) : (~reg26)) ?
                  {wire19[(1'h1):(1'h0)], {(8'h9d)}} : {$signed(reg25),
                      reg32[(5'h10):(4'hd)]})));
              reg34 <= $signed({$signed($signed(wire22[(4'hb):(1'h0)]))});
              reg35 <= $unsigned($signed((~|wire22[(4'hf):(3'h7)])));
            end
          else
            begin
              reg32 <= reg23[(2'h3):(2'h2)];
              reg33 <= (((~((reg23 & (7'h44)) ?
                          (wire22 ? wire20 : wire17) : (7'h44))) ?
                      (~^($unsigned(reg30) ?
                          (wire19 ? reg33 : wire18) : (reg30 ?
                              wire20 : wire17))) : {(wire18[(1'h0):(1'h0)] ?
                              (reg29 - reg26) : reg26[(2'h3):(2'h3)])}) ?
                  reg33[(3'h7):(1'h1)] : (~&($unsigned($signed(reg29)) | (wire19 ?
                      reg27 : wire19[(1'h0):(1'h0)]))));
            end
          reg36 <= (!$unsigned((!reg30)));
        end
      else
        begin
          if ((^((-(~|$signed((8'hb7)))) >>> reg25)))
            begin
              reg23 <= wire21;
              reg24 <= ((($unsigned((reg30 ~^ reg29)) != reg29[(5'h14):(4'h8)]) - reg29) ^~ reg30[(1'h0):(1'h0)]);
              reg25 <= (~|(reg24 ?
                  $unsigned((wire17 != (&wire22))) : {({reg25,
                          reg23} >>> reg30),
                      $unsigned(reg27[(3'h5):(2'h3)])}));
              reg26 <= reg29[(4'hb):(1'h1)];
            end
          else
            begin
              reg23 <= (({wire19[(1'h0):(1'h0)], (~&(&reg32))} ?
                  {reg32[(1'h1):(1'h0)],
                      $unsigned($unsigned(reg35))} : reg29[(5'h15):(4'hf)]) * (($signed((|wire18)) ?
                  ($unsigned((8'h9e)) ?
                      (~^reg24) : reg29[(3'h4):(1'h1)]) : $unsigned((reg30 & reg29))) || reg36[(2'h3):(2'h3)]));
              reg24 <= (~reg29[(4'he):(1'h1)]);
              reg25 <= $signed(((-(reg36 ~^ ((8'hbf) ? reg24 : wire20))) ?
                  wire17[(2'h2):(2'h2)] : (-$signed((reg26 - (8'hb9))))));
              reg26 <= $unsigned((reg28[(4'h9):(2'h3)] >>> $unsigned(((+reg30) > (8'hae)))));
              reg27 <= (~((wire20 ?
                  ((wire20 && (8'ha0)) ?
                      (~^reg33) : reg24) : wire20) != wire22));
            end
          if (reg30)
            begin
              reg28 <= reg36[(1'h0):(1'h0)];
              reg29 <= reg23[(1'h1):(1'h1)];
              reg30 <= (wire22[(4'h8):(2'h3)] >= reg36);
              reg31 <= ($signed(($unsigned((wire17 ? wire20 : wire22)) ?
                  $unsigned((reg29 ? wire18 : reg34)) : ($unsigned(reg24) ?
                      wire17 : $unsigned(reg24)))) >> $signed($signed($unsigned(reg35[(4'h8):(2'h3)]))));
            end
          else
            begin
              reg28 <= $signed((^(~((reg27 ? wire18 : wire21) || (reg26 ?
                  wire17 : (8'hbf))))));
              reg29 <= reg32[(4'h9):(2'h3)];
              reg30 <= $unsigned((&wire21[(2'h2):(1'h1)]));
            end
          reg32 <= ($unsigned((~&($signed(reg33) == reg28[(4'h8):(4'h8)]))) ?
              reg36 : wire18);
          reg33 <= wire22;
          reg34 <= reg25;
        end
      reg37 <= wire17[(1'h0):(1'h0)];
      reg38 <= (reg35 ?
          wire19 : $signed($signed({reg24[(1'h1):(1'h1)], reg30})));
    end
  assign wire39 = reg32;
  assign wire40 = $unsigned($signed((($signed(reg24) ^ {reg30}) ?
                      $signed((7'h40)) : $signed(reg29))));
  assign wire41 = reg37;
endmodule
