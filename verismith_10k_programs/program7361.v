module top
#(parameter param75 = ((~&((~&(^(8'had))) ? ({(8'hbe), (8'h9e)} ? {(8'hb9), (8'hb8)} : {(7'h40)}) : ((&(8'hae)) ? ((8'hab) ? (8'had) : (8'hb5)) : (~|(8'hb7))))) ? (!(((^(8'ha6)) < ((8'h9f) && (8'ha3))) <<< ((~(8'h9c)) <= ((8'haa) ? (8'hbb) : (8'hba))))) : {(^(((8'hbb) ? (8'hb4) : (8'hbd)) - ((8'hbc) == (7'h43))))}), 
parameter param76 = ((!param75) || (param75 && ((+(param75 >= param75)) + ((param75 ? param75 : param75) >= (^param75))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire62;
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  assign y = {wire74,
                 wire65,
                 wire64,
                 wire5,
                 wire62,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire5 = (({$unsigned(wire3[(2'h2):(1'h0)])} ?
                         $unsigned($unsigned(wire3)) : wire4[(1'h0):(1'h0)]) ?
                     (~&(wire0[(3'h6):(2'h3)] ?
                         $signed((wire2 - (7'h42))) : ((+wire2) ~^ $signed((8'ha6))))) : (^~wire1));
  module6 #() modinst63 (wire62, clk, wire2, wire5, wire0, wire4, wire1);
  assign wire64 = {(wire3[(1'h1):(1'h0)] != ((wire3 <= (+wire0)) ?
                          (8'hb5) : $signed(wire4)))};
  assign wire65 = $unsigned(wire64);
  always
    @(posedge clk) begin
      reg66 <= $signed($unsigned(wire64[(2'h2):(1'h0)]));
      reg67 <= $signed({(wire4 - (8'hb7))});
      reg68 <= (^reg66);
      if (wire62)
        begin
          reg69 <= (+wire1);
          reg70 <= reg69[(3'h5):(2'h2)];
          reg71 <= wire5;
          reg72 <= (^(wire1[(2'h3):(1'h1)] ? reg68[(3'h6):(2'h3)] : reg71));
        end
      else
        begin
          reg69 <= {$signed(reg71),
              (^~(reg72 ? {$signed(wire3)} : $signed(reg66)))};
          reg70 <= wire1;
          reg71 <= {{wire5[(5'h11):(3'h4)]}, reg67};
        end
      reg73 <= ($unsigned((wire0[(4'ha):(4'h8)] ^ reg70[(3'h4):(3'h4)])) ^ ({({wire0} + (wire65 ?
              reg69 : (8'ha1))),
          $unsigned($unsigned(wire65))} >>> (($signed((8'hac)) - (wire3 ?
          (8'hae) : reg71)) << {wire1, {wire1}})));
    end
  assign wire74 = $unsigned(((reg66 ?
                          $unsigned($unsigned(reg73)) : wire64[(1'h0):(1'h0)]) ?
                      (8'hb0) : (wire5[(3'h7):(3'h4)] ?
                          reg67[(3'h4):(2'h2)] : (reg70 <<< (-(8'ha5))))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire59;
  assign y = {wire61,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire59,
                 (1'h0)};
  assign wire12 = $signed($unsigned($unsigned($unsigned(((8'ha5) ?
                      wire7 : wire7)))));
  assign wire13 = wire10;
  assign wire14 = {$unsigned($signed({wire11[(4'hc):(4'h9)],
                          $signed(wire12)}))};
  assign wire15 = $signed(wire14);
  assign wire16 = $signed(wire12[(1'h1):(1'h1)]);
  assign wire17 = ((($signed($signed(wire13)) ?
                          ((!wire9) << wire14) : $unsigned((wire12 != wire14))) ?
                      ((wire14 ?
                          (wire9 && wire10) : {wire13,
                              wire10}) <= (7'h44)) : (~&$signed($unsigned(wire11)))) >>> (($signed($signed(wire8)) > {(+wire15)}) != (+{wire11})));
  assign wire18 = {($signed(((^(8'ha9)) ? (~^wire7) : wire10[(3'h5):(2'h3)])) ?
                          (((~|wire15) ~^ (wire11 ?
                              wire15 : wire15)) > ($unsigned((8'haa)) ?
                              (wire7 | wire11) : (|wire10))) : $signed(wire15)),
                      (wire13[(1'h1):(1'h1)] + (~|(8'hac)))};
  assign wire19 = ($unsigned($signed((~&wire14[(1'h0):(1'h0)]))) || $signed(wire16[(1'h0):(1'h0)]));
  assign wire20 = {$unsigned($signed((^(wire19 ? wire7 : wire14))))};
  module21 #() modinst60 (.y(wire59), .wire25(wire8), .clk(clk), .wire24(wire9), .wire23(wire14), .wire26(wire18), .wire22(wire11));
  assign wire61 = $signed((~|$signed({$signed(wire12)})));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire27;
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  assign y = {wire58,
                 wire49,
                 wire48,
                 wire34,
                 wire32,
                 wire27,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 reg36,
                 reg35,
                 reg33,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire27 = $signed($unsigned($signed($unsigned($unsigned((8'h9e))))));
  always
    @(posedge clk) begin
      reg28 <= (~&{(~|((~&wire22) * $signed(wire24)))});
      reg29 <= (^(~|($signed((wire24 >> wire26)) << $signed($unsigned(wire25)))));
      reg30 <= (8'h9e);
      reg31 <= {reg30[(1'h0):(1'h0)]};
    end
  assign wire32 = reg29[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg33 <= {$signed($unsigned(wire26)),
          (~|({(~reg30)} & ($unsigned(reg29) | wire23)))};
    end
  assign wire34 = ((($signed((wire22 ?
                          reg31 : (8'hb3))) << wire25[(4'h9):(3'h5)]) << $signed((reg31[(2'h2):(1'h0)] && (reg29 <<< reg33)))) ?
                      (~&$unsigned($unsigned((wire27 ?
                          wire24 : wire22)))) : $unsigned(wire25[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg35 <= (&wire23[(2'h3):(2'h2)]);
      reg36 <= (~&$unsigned(wire22[(5'h11):(4'hd)]));
      reg37 <= reg30;
      if ({$signed((^~{$unsigned(wire22)})), (~^$signed((&$unsigned(reg33))))})
        begin
          if (reg29)
            begin
              reg38 <= (wire22 | reg35);
            end
          else
            begin
              reg38 <= wire27[(2'h3):(1'h0)];
              reg39 <= $signed($signed(reg30));
              reg40 <= wire32[(1'h1):(1'h1)];
              reg41 <= (+(^~(^($signed(reg30) & {(8'hba), wire24}))));
              reg42 <= (wire32[(1'h0):(1'h0)] ?
                  $signed(reg37[(2'h2):(2'h2)]) : (~&reg28));
            end
          if (reg33[(3'h5):(3'h5)])
            begin
              reg43 <= wire27[(3'h7):(3'h7)];
            end
          else
            begin
              reg43 <= (7'h41);
            end
          reg44 <= ($unsigned(reg41) ?
              wire26[(3'h7):(3'h4)] : {(wire25[(4'ha):(3'h5)] <= reg30)});
          reg45 <= (8'ha2);
          if ($unsigned(reg29))
            begin
              reg46 <= (+(reg38[(1'h1):(1'h0)] ?
                  (~^$unsigned((wire27 < reg40))) : (wire23 ?
                      $signed(((8'hb3) >= reg35)) : wire25)));
              reg47 <= {reg29[(2'h2):(1'h1)]};
            end
          else
            begin
              reg46 <= $signed((!reg28));
            end
        end
      else
        begin
          reg38 <= {reg31[(4'hc):(4'h9)], $signed(reg45[(1'h0):(1'h0)])};
          reg39 <= (^reg31);
          reg40 <= (((~&reg44[(1'h0):(1'h0)]) ?
              reg41 : ((8'ha4) ?
                  ($signed(reg43) ?
                      $signed(wire27) : ((7'h41) ?
                          reg41 : reg40)) : wire32)) < $unsigned(((&(reg38 >> wire24)) << $signed((reg39 ?
              reg39 : reg29)))));
          reg41 <= (~&$signed($unsigned(reg41)));
          reg42 <= reg47[(3'h4):(1'h0)];
        end
    end
  assign wire48 = $signed($unsigned(wire22));
  assign wire49 = wire23[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg50 <= wire25;
      if (((~|(reg38 && (!wire24[(3'h6):(1'h0)]))) ^ reg28[(1'h0):(1'h0)]))
        begin
          reg51 <= ($unsigned(wire25[(5'h10):(4'h8)]) < {((^~(^~(8'hb4))) ?
                  wire23 : ((8'ha4) ^~ (wire23 ? reg37 : reg40))),
              $unsigned($unsigned($signed(reg39)))});
          if (reg40)
            begin
              reg52 <= ($signed(($unsigned(reg33[(5'h11):(5'h10)]) ?
                      $signed(reg29[(5'h10):(5'h10)]) : reg30)) ?
                  (reg36 ?
                      $signed((~^(^(8'hb6)))) : reg45[(1'h0):(1'h0)]) : {$signed(wire34[(2'h3):(2'h3)])});
              reg53 <= reg36;
              reg54 <= wire48;
              reg55 <= {reg29, reg36[(5'h12):(4'hb)]};
            end
          else
            begin
              reg52 <= $unsigned(wire22);
              reg53 <= (wire26[(4'hd):(3'h7)] && (wire23[(4'ha):(1'h0)] < $signed(((reg54 ?
                  (8'ha5) : reg39) << reg55))));
              reg54 <= (((reg53 ? $signed($unsigned(reg30)) : wire25) ?
                  $signed($unsigned(wire23)) : $signed($signed((-(8'hb2))))) >> reg53);
              reg55 <= reg30;
            end
          reg56 <= $signed({reg33});
        end
      else
        begin
          reg51 <= $signed(reg56[(3'h6):(3'h6)]);
          reg52 <= (|reg44);
          reg53 <= reg39[(5'h11):(3'h6)];
          reg54 <= ((^{wire27[(1'h1):(1'h0)]}) ? wire22 : reg55[(4'ha):(3'h4)]);
          reg55 <= $signed($unsigned(((|(wire48 == reg52)) ?
              $signed((~&(8'hbe))) : reg51[(4'h8):(3'h7)])));
        end
      reg57 <= (reg44 < reg33[(4'hb):(2'h2)]);
    end
  assign wire58 = wire26;
endmodule
