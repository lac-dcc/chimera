module top
#(parameter param40 = ((~&(|(((8'ha0) > (8'hbb)) ? ((8'hac) | (8'hbf)) : (-(8'ha7))))) ? ({({(8'had)} ? ((7'h42) ? (8'ha1) : (8'h9e)) : ((7'h41) ? (7'h41) : (8'ha3))), (((8'hb2) && (8'ha6)) ? ((8'hb5) ? (8'hb5) : (8'ha7)) : (~^(8'ha1)))} ^~ (((~|(8'hbc)) < (-(8'ha8))) ~^ {{(8'hab)}, (8'hae)})) : ((8'hb3) == (({(8'had), (8'hbc)} || ((8'haa) ? (8'hb9) : (8'hbf))) ? ((8'haa) | ((8'hb7) ? (8'hb0) : (8'hb0))) : (|((7'h44) ? (7'h41) : (8'hba)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire39,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
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
                 reg22,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2[(2'h2):(2'h2)];
  assign wire5 = ((($unsigned($unsigned((8'haa))) < (~|$signed(wire0))) >> (~^(8'ha1))) == ({((wire3 ?
                         (8'hb3) : wire2) > (wire4 ?
                         wire1 : wire0))} << wire4));
  always
    @(posedge clk) begin
      reg6 <= (^((wire0 ^ $unsigned((wire3 || wire0))) ?
          {($signed(wire3) ?
                  (wire1 >>> wire5) : $unsigned(wire2))} : (($unsigned(wire1) || wire2) ?
              ($unsigned(wire5) + ((8'hb6) ? wire1 : wire0)) : (+(-wire2)))));
      reg7 <= $unsigned(((($unsigned(wire1) ?
              $unsigned(wire5) : $signed((8'hb3))) ?
          wire0[(2'h3):(1'h0)] : $signed(wire3)) != (wire0 ?
          {$signed(wire5)} : (reg6[(1'h0):(1'h0)] - reg6[(4'hc):(4'hb)]))));
    end
  assign wire8 = ((~&(wire1[(3'h6):(3'h6)] ?
                         $signed((+(8'hb4))) : $unsigned(((8'hb6) ?
                             reg6 : wire5)))) ?
                     (((~^(~|reg7)) * (&(+wire1))) ?
                         (reg7[(5'h13):(4'he)] || $unsigned(reg6)) : wire4) : ($unsigned((wire1 >>> $signed((8'hb3)))) ?
                         ($signed({(8'hb4)}) ?
                             $unsigned(reg7) : ($signed(wire5) && (wire1 ?
                                 (8'h9c) : reg6))) : ({$signed(wire2)} ?
                             $unsigned(wire4[(3'h5):(1'h1)]) : ($unsigned(wire1) || wire1))));
  assign wire9 = wire4[(1'h1):(1'h0)];
  assign wire10 = (^~(reg6 ?
                      $signed(((|reg7) == ((8'hbb) >= wire9))) : (((^reg6) == $signed((8'hb2))) < $signed(wire8))));
  assign wire11 = {$signed(wire8[(4'h9):(3'h5)])};
  assign wire12 = (((^wire11[(1'h1):(1'h0)]) ?
                          (reg6[(4'ha):(1'h0)] ~^ (|{(8'hbd)})) : (wire3 ?
                              wire2[(1'h0):(1'h0)] : (~&wire5))) ?
                      wire4 : (|reg7));
  assign wire13 = (!$signed(wire3[(4'hb):(4'h8)]));
  assign wire14 = (($unsigned($signed(wire8)) ?
                          $unsigned((+(wire5 < wire11))) : wire13) ?
                      $unsigned($unsigned((wire0 ?
                          (+wire2) : $signed(wire0)))) : ({({(8'hab), wire0} ?
                              (^~wire8) : (^~wire1))} << (^~(wire1[(2'h3):(1'h1)] < {wire13}))));
  assign wire15 = (!$signed((^~(wire1 | wire14))));
  assign wire16 = (7'h40);
  assign wire17 = wire5;
  assign wire18 = wire12[(3'h6):(3'h6)];
  assign wire19 = $unsigned($unsigned(((^~wire0[(2'h3):(1'h0)]) ?
                      (reg7[(5'h12):(4'hd)] ?
                          wire9 : (+(8'hb0))) : ($signed(wire11) << wire10))));
  assign wire20 = (~|wire12[(4'h8):(4'h8)]);
  assign wire21 = $unsigned(($unsigned((wire9[(3'h4):(1'h0)] && (8'hb4))) ?
                      ($unsigned($unsigned(wire0)) <<< $unsigned({wire20})) : (~|((~wire19) ?
                          (~wire3) : wire2[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire10[(1'h1):(1'h1)])
        begin
          if ({($signed($unsigned((wire2 ^~ (8'hb4)))) ?
                  ($unsigned(reg6) ? (wire21 != reg7) : (7'h41)) : ({(reg7 ?
                          wire0 : wire16),
                      $unsigned(reg6)} >>> wire10))})
            begin
              reg22 <= {(wire21[(4'h9):(3'h5)] <= (({(8'ha6)} ?
                      (!wire19) : (wire1 ^~ reg7)) && $unsigned(wire11[(2'h3):(2'h2)])))};
            end
          else
            begin
              reg22 <= {(reg6 ? {$signed($signed(wire3))} : wire17), (|wire14)};
              reg23 <= $unsigned((~&(~^$signed((-wire21)))));
              reg24 <= wire1[(2'h3):(1'h0)];
              reg25 <= wire17;
              reg26 <= ({(8'ha7)} < $signed($unsigned((8'hb3))));
            end
          reg27 <= {(((~|wire13[(3'h4):(2'h3)]) ~^ wire1) <= reg23[(1'h0):(1'h0)])};
        end
      else
        begin
          if ((~&$unsigned(reg25)))
            begin
              reg22 <= wire0[(2'h3):(2'h2)];
              reg23 <= $signed({$unsigned($unsigned(wire12[(4'h8):(3'h6)]))});
            end
          else
            begin
              reg22 <= $unsigned(reg23[(4'h8):(3'h4)]);
              reg23 <= wire2[(1'h0):(1'h0)];
            end
        end
      reg28 <= (!wire2[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg29 <= $unsigned(((((^~(8'ha2)) * {wire12, wire0}) <= ({(8'hb6)} ?
              {wire15, (8'ha6)} : reg6[(4'hb):(4'h8)])) ?
          {(|$unsigned(wire21))} : (-($signed(wire1) ?
              $signed(wire10) : (wire17 ? reg26 : wire17)))));
      reg30 <= ((^wire21[(3'h4):(1'h0)]) ?
          reg23[(4'h8):(3'h5)] : (|$unsigned(wire8)));
      if ((wire20 < (7'h43)))
        begin
          reg31 <= reg6[(4'ha):(4'ha)];
          reg32 <= (~^(^((wire16[(4'h9):(3'h7)] ?
              (reg30 <<< wire16) : (reg30 ^ (7'h40))) * (8'h9e))));
          reg33 <= $signed(reg7[(4'ha):(2'h2)]);
          if ((^~wire17[(2'h2):(2'h2)]))
            begin
              reg34 <= ((((wire16 ?
                  (~&reg24) : (reg29 == reg23)) || reg6) + (wire17[(2'h3):(2'h3)] ?
                  (~&{wire18, reg22}) : {(wire9 ? reg28 : wire18),
                      wire19})) ^~ wire12);
            end
          else
            begin
              reg34 <= (&({$unsigned((~reg26)),
                  $unsigned({(8'hb8)})} || (($signed(wire13) ?
                      {wire14} : ((8'ha8) && reg26)) ?
                  (+(wire12 ? wire15 : wire18)) : (-$unsigned((8'hb1))))));
              reg35 <= $unsigned(($unsigned($unsigned(wire1)) ?
                  (($signed(wire17) ? (reg24 * wire1) : $signed(wire14)) ?
                      $unsigned((reg25 & wire16)) : $unsigned((8'ha6))) : (|{(^reg23),
                      (7'h44)})));
              reg36 <= wire18;
              reg37 <= (~^{{reg22}});
            end
          reg38 <= reg27;
        end
      else
        begin
          reg31 <= ((^~(^((!reg25) < reg31[(3'h5):(3'h4)]))) * reg33[(2'h3):(1'h1)]);
          reg32 <= $unsigned(({((reg37 + wire1) ? (~|reg25) : $signed(wire15)),
                  (!reg25[(2'h2):(1'h1)])} ?
              (wire5 << (~((8'hb3) < reg31))) : (({reg35} ?
                      (+wire13) : (wire5 < reg34)) ?
                  (wire5[(4'ha):(3'h5)] ?
                      (wire1 > reg31) : $unsigned((8'had))) : ((&reg28) ^~ wire5[(3'h6):(1'h0)]))));
          reg33 <= wire1[(3'h4):(3'h4)];
          reg34 <= (~&(wire9[(4'hd):(4'h8)] ?
              (~|wire8) : ($unsigned(wire16[(1'h1):(1'h0)]) - $unsigned($signed(reg26)))));
        end
    end
  assign wire39 = wire13;
endmodule
