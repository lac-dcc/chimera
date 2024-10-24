module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire60;
  assign y = {wire89, wire88, wire87, wire86, wire84, wire5, wire60, (1'h0)};
  assign wire5 = wire1[(3'h4):(2'h3)];
  module6 #() modinst61 (.wire8(wire5), .wire10(wire3), .wire7(wire0), .clk(clk), .wire11(wire2), .y(wire60), .wire9(wire1));
  module62 #() modinst85 (wire84, clk, wire2, wire3, wire4, wire0);
  assign wire86 = ($signed(((^~(^wire3)) ?
                          {$signed(wire0)} : (~(wire0 ? wire0 : wire1)))) ?
                      (&$unsigned($signed(((8'ha6) - (8'hb4))))) : $unsigned((($unsigned((8'hbe)) >= wire4[(4'h9):(1'h1)]) && (~wire60[(1'h0):(1'h0)]))));
  assign wire87 = (^~(^$signed($unsigned(wire60))));
  assign wire88 = (~$unsigned($unsigned(((wire1 != wire86) ^~ $signed(wire84)))));
  assign wire89 = (((8'h9e) ?
                          ({wire60,
                              (wire1 < wire0)} <= $unsigned((8'hb6))) : (|$unsigned(wire5))) ?
                      {(~((wire3 ? wire0 : wire2) ^ wire1)),
                          wire60[(1'h0):(1'h0)]} : $signed(wire2[(5'h12):(3'h4)]));
endmodule

module module62  (y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire66;
  input wire signed [(2'h3):(1'h0)] wire65;
  input wire signed [(4'ha):(1'h0)] wire64;
  input wire [(3'h6):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  assign y = {wire83,
                 wire78,
                 wire77,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire67 = wire63;
  assign wire68 = ($unsigned($signed(wire67)) | ($signed((&((8'hb0) ?
                          (8'ha7) : wire67))) ?
                      wire67 : (8'hb9)));
  assign wire69 = wire68[(1'h0):(1'h0)];
  assign wire70 = $unsigned($unsigned(wire63[(3'h6):(2'h2)]));
  assign wire71 = (&{(8'hbb)});
  always
    @(posedge clk) begin
      if ($unsigned(((wire69 ?
          $unsigned(wire66[(3'h4):(1'h1)]) : wire66) || (((!wire69) >>> (&wire69)) <= $unsigned((wire64 ?
          (8'hb5) : wire69))))))
        begin
          reg72 <= (+wire69[(4'h9):(1'h1)]);
        end
      else
        begin
          reg72 <= (|$unsigned((wire68[(4'h9):(3'h5)] <= $unsigned((reg72 ?
              (8'hb5) : wire71)))));
          if ((+(((~&(wire63 ? wire63 : wire71)) ?
                  (wire66[(1'h0):(1'h0)] - (~|wire70)) : (|{wire67})) ?
              (-($signed(wire63) ?
                  wire69 : $signed(reg72))) : (wire67[(1'h0):(1'h0)] ?
                  wire64[(3'h6):(1'h1)] : ((wire67 & reg72) - wire65[(1'h1):(1'h1)])))))
            begin
              reg73 <= (wire69 ?
                  ($unsigned($signed(wire67[(3'h5):(2'h2)])) <<< $unsigned(wire67)) : ({(8'hb6),
                          $unsigned($signed(wire67))} ?
                      $unsigned(wire66) : $unsigned($unsigned((7'h44)))));
            end
          else
            begin
              reg73 <= wire69[(4'hd):(4'hc)];
            end
          reg74 <= $unsigned($signed(wire66));
          reg75 <= $signed((8'hbd));
        end
      reg76 <= wire71;
    end
  assign wire77 = (^~($unsigned(reg73[(3'h6):(2'h3)]) ?
                      (~^reg73) : (({wire68, (8'hb7)} ?
                              {reg72, wire66} : $unsigned(wire68)) ?
                          ($signed(reg72) ?
                              wire67 : $unsigned(reg72)) : ($unsigned(reg73) ?
                              wire70 : reg74[(1'h1):(1'h0)]))));
  assign wire78 = {$unsigned(wire71[(4'hc):(2'h3)]),
                      (-{((^wire77) ?
                              wire70[(1'h0):(1'h0)] : (wire67 ?
                                  wire68 : wire70)),
                          {(^~(8'ha9)), reg72}})};
  always
    @(posedge clk) begin
      reg79 <= wire71[(3'h7):(2'h2)];
      reg80 <= $unsigned($signed((~&{wire77[(4'ha):(2'h3)], (8'hb3)})));
      reg81 <= $unsigned((($unsigned((wire71 ?
          reg80 : (8'ha6))) - reg74) > reg80[(1'h1):(1'h0)]));
      reg82 <= reg72[(4'hb):(2'h2)];
    end
  assign wire83 = (^(wire69[(4'h8):(3'h6)] ?
                      $unsigned((~|wire69[(3'h5):(3'h4)])) : wire71));
endmodule

module module6
#(parameter param59 = ((((~&(7'h41)) ? (((8'hb0) > (8'had)) | {(8'hac), (8'hb7)}) : (((8'hac) ? (8'hb2) : (8'hb2)) ? ((8'ha1) ? (8'ha2) : (8'hbc)) : (+(7'h41)))) ? ((&((8'h9d) ? (8'h9d) : (8'hb5))) & (8'hb8)) : (({(8'hbc), (8'ha9)} ? ((8'ha1) <<< (8'ha6)) : ((7'h42) ^ (8'hbf))) ^ (~&((8'ha7) ? (8'hb5) : (8'hba))))) ? (~&((~&((8'hb8) ? (8'h9f) : (8'ha2))) ? (~(&(8'hb9))) : ((^~(8'ha7)) && ((8'hbf) ? (8'h9e) : (8'ha8))))) : {((~(+(8'haf))) == (((7'h40) != (7'h41)) >> ((8'hbb) <= (8'ha0))))}))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire33;
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  assign y = {wire58,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire48,
                 wire47,
                 wire46,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire33,
                 reg57,
                 reg51,
                 reg50,
                 reg49,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire12 = (wire9[(2'h2):(2'h2)] ~^ $unsigned($signed(wire8)));
  assign wire13 = (~$unsigned((^~{wire8[(1'h1):(1'h0)]})));
  assign wire14 = (8'hbd);
  assign wire15 = $signed({(wire7[(2'h3):(1'h1)] ?
                          (~^(^wire10)) : $unsigned($signed(wire8)))});
  module16 #() modinst34 (.wire20(wire15), .wire21(wire12), .wire18(wire7), .y(wire33), .wire19(wire9), .clk(clk), .wire17(wire8));
  always
    @(posedge clk) begin
      reg35 <= (~|(~&(!$unsigned($signed((8'ha4))))));
      if ((wire9 ?
          wire11[(2'h2):(1'h1)] : (|$signed(({(8'h9c)} ?
              (!(8'hb7)) : {reg35, wire13})))))
        begin
          if (wire33[(3'h5):(3'h5)])
            begin
              reg36 <= $signed(($unsigned((^~wire11)) ~^ wire15));
            end
          else
            begin
              reg36 <= ((7'h42) >> $unsigned((~((wire12 ? wire13 : wire10) ?
                  (wire8 ? wire15 : reg36) : wire7[(4'he):(1'h1)]))));
              reg37 <= wire12[(4'h9):(2'h3)];
              reg38 <= wire13;
              reg39 <= wire8;
              reg40 <= (wire8[(4'hd):(4'h8)] == ((&(|{reg35,
                  wire9})) >= wire33[(3'h6):(2'h3)]));
            end
          reg41 <= reg36;
          reg42 <= $unsigned($unsigned($signed((wire7[(4'hc):(4'hb)] ?
              {reg39, wire10} : $unsigned(wire33)))));
          if ($signed(reg38[(3'h4):(1'h0)]))
            begin
              reg43 <= {$unsigned(($signed($unsigned(reg42)) | $signed($unsigned((8'hb7))))),
                  wire10[(4'hc):(3'h7)]};
              reg44 <= (~reg43);
              reg45 <= $signed($unsigned(wire14));
            end
          else
            begin
              reg43 <= wire8;
              reg44 <= wire12[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg36 <= reg40;
          reg37 <= wire7;
        end
    end
  assign wire46 = wire8[(2'h2):(2'h2)];
  assign wire47 = (!(~(&(reg42[(3'h6):(1'h1)] ?
                      (reg40 ? wire8 : wire15) : wire9))));
  assign wire48 = reg35[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg49 <= $unsigned((^~reg38[(2'h2):(2'h2)]));
      reg50 <= (($signed($unsigned((~|wire48))) >> $signed({wire48,
          reg42[(2'h2):(1'h0)]})) | (($signed($signed(wire48)) | (reg49[(4'hb):(1'h0)] ?
          (wire13 == reg35) : reg37)) == wire46));
      reg51 <= $unsigned($signed((~|$signed($unsigned(wire33)))));
    end
  assign wire52 = $unsigned(((~|wire13[(4'h8):(1'h1)]) & $unsigned(reg42)));
  assign wire53 = (reg41 | (($unsigned($signed(reg40)) <<< wire11) ?
                      $unsigned(wire52) : (reg39[(2'h3):(1'h0)] ^~ (-wire52[(1'h0):(1'h0)]))));
  assign wire54 = wire46;
  assign wire55 = $signed(($signed($unsigned((wire13 ?
                      reg35 : reg51))) >= $unsigned({(reg39 ?
                          wire9 : reg41)})));
  assign wire56 = ((8'ha1) >> $unsigned(wire47[(4'ha):(3'h5)]));
  always
    @(posedge clk) begin
      reg57 <= wire12[(3'h6):(1'h1)];
    end
  assign wire58 = (-((reg43 < reg49[(3'h5):(3'h4)]) ?
                      {reg45[(3'h5):(1'h0)]} : $signed((wire15[(4'hf):(2'h3)] >= $unsigned((8'hb1))))));
endmodule

module module16
#(parameter param32 = (&(~&(~|((!(8'ha2)) ^ ((8'ha9) ? (7'h40) : (8'hbe)))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire22;
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  assign y = {wire25,
                 wire22,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = wire18[(5'h13):(4'hb)];
  always
    @(posedge clk) begin
      reg23 <= ($unsigned(wire20) ? $signed(wire21[(4'ha):(2'h3)]) : wire18);
      reg24 <= $signed(($signed(((wire21 >= reg23) ? (^wire18) : (8'haa))) ?
          (^$signed((wire18 << wire18))) : (8'h9e)));
    end
  assign wire25 = $unsigned((^~(^reg23)));
  always
    @(posedge clk) begin
      reg26 <= wire22[(4'hf):(3'h7)];
      reg27 <= $unsigned(wire19[(1'h1):(1'h1)]);
      reg28 <= wire17;
      if (($signed({reg27[(5'h12):(4'hc)],
          ((8'hb1) || (wire25 ? wire19 : (7'h44)))}) & (~^((~&{wire20}) ?
          (wire22[(3'h6):(3'h4)] ?
              (+(8'hb3)) : (&wire22)) : $unsigned($signed((8'hb7)))))))
        begin
          if (wire18[(5'h11):(3'h5)])
            begin
              reg29 <= (((($unsigned(reg28) > ((8'h9d) ? reg24 : reg28)) ?
                          wire17 : (|$signed((8'hbe)))) ?
                      wire20[(4'hb):(4'h9)] : (wire22[(4'hf):(3'h5)] - wire21[(1'h1):(1'h0)])) ?
                  ($signed((((7'h44) << reg28) ?
                      {wire21} : (wire19 ?
                          (8'hb3) : wire19))) ~^ $signed($signed($signed(wire19)))) : (~&$unsigned(reg23)));
              reg30 <= ((($unsigned($unsigned(wire22)) ?
                      $unsigned($signed(reg26)) : ($unsigned(reg29) ^~ wire22[(4'hd):(4'hc)])) <= (~^($signed(reg23) ?
                      reg26 : (reg28 ? reg27 : wire19)))) ?
                  ((wire19 ?
                          wire19 : (wire25 ?
                              (wire17 ? wire17 : reg29) : (wire21 ?
                                  wire18 : reg27))) ?
                      (((wire25 - reg29) & $unsigned(wire22)) << wire20[(4'hf):(4'h8)]) : (wire17[(3'h4):(1'h1)] ?
                          reg26 : (7'h44))) : $signed(wire18));
            end
          else
            begin
              reg29 <= $unsigned((+(&reg27[(2'h2):(2'h2)])));
            end
          reg31 <= {reg26[(1'h0):(1'h0)], wire18};
        end
      else
        begin
          reg29 <= $unsigned($signed(wire17[(4'he):(4'he)]));
        end
    end
endmodule
