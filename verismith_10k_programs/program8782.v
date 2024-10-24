module top
#(parameter param69 = (^((~^{((8'haa) && (8'ha6))}) ? ((7'h41) < (+((8'haf) && (8'hb6)))) : ({((7'h41) && (8'ha3))} ^~ ({(8'hb5), (8'ha3)} >> (|(8'haf)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire65;
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire34,
                 wire65,
                 reg68,
                 reg67,
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
                 reg21,
                 reg20,
                 reg11,
                 (1'h0)};
  assign wire5 = ((((wire4[(3'h7):(3'h4)] ?
                         ((7'h43) ?
                             wire1 : wire4) : wire0[(4'hc):(2'h2)]) ^ ((8'hbb) ?
                         (8'hb6) : {wire2})) || ($unsigned(wire1) ?
                         ((wire2 * wire4) ^~ {(8'hb9), (8'ha9)}) : ({wire0,
                             wire2} > ((8'hac) | wire1)))) ?
                     $unsigned(({{wire2,
                             wire1}} ^~ {wire2})) : wire0[(3'h5):(2'h3)]);
  assign wire6 = (^~wire0[(2'h3):(1'h1)]);
  assign wire7 = (~(wire2 != (~((wire2 ? wire6 : wire5) ?
                     wire4 : $unsigned(wire5)))));
  assign wire8 = wire1;
  assign wire9 = (^wire1[(5'h14):(5'h13)]);
  assign wire10 = (+(((7'h41) & $signed((wire8 ?
                      (8'hb9) : wire2))) && $signed($unsigned((wire1 - wire1)))));
  always
    @(posedge clk) begin
      reg11 <= (wire2[(1'h1):(1'h1)] == ($signed(($signed((8'hb8)) ?
              (|wire10) : wire6)) ?
          wire1[(5'h15):(3'h6)] : wire2[(4'hf):(2'h2)]));
    end
  assign wire12 = (wire6[(3'h7):(3'h4)] ? wire3[(3'h5):(2'h2)] : (7'h44));
  assign wire13 = $signed({$signed((&(^(8'hba)))),
                      $unsigned($unsigned({(8'hb2)}))});
  assign wire14 = (~(+wire10));
  assign wire15 = (wire4[(3'h7):(3'h4)] ?
                      $unsigned((((wire7 ^ wire7) != wire7) ?
                          (+(~|wire0)) : $unsigned((wire7 ^~ wire10)))) : wire12[(3'h5):(1'h1)]);
  assign wire16 = wire14;
  assign wire17 = {$signed(({(8'hb5), (wire0 ? wire16 : wire7)} ?
                          $signed((wire12 ? wire2 : wire2)) : (|((8'haa) ?
                              (8'ha5) : wire4))))};
  assign wire18 = (~|wire14);
  assign wire19 = (($unsigned($signed((wire13 >>> wire9))) ?
                      ((wire3 && (~|wire3)) ?
                          {wire13} : wire9[(2'h3):(2'h2)]) : $unsigned($signed((&wire13)))) <= (((&$unsigned((8'ha4))) <<< (wire1[(2'h2):(1'h0)] & $unsigned(wire18))) <= {$unsigned(((8'hb6) ?
                          wire17 : wire18))}));
  always
    @(posedge clk) begin
      reg20 <= wire13[(1'h1):(1'h1)];
      reg21 <= {(^~wire15[(3'h4):(2'h2)])};
      reg22 <= ({(reg20 ?
                  ((wire8 | wire2) >>> (|(8'hb1))) : (wire1 ?
                      (8'hb7) : wire7[(1'h0):(1'h0)]))} ?
          $unsigned(((&$signed(wire12)) <= {$signed(wire7),
              (wire6 ^ wire3)})) : (8'hb4));
    end
  always
    @(posedge clk) begin
      if ({reg22})
        begin
          if ((-((wire13[(2'h3):(2'h2)] && ($unsigned((8'hb2)) ?
                  reg21[(2'h3):(1'h1)] : $unsigned(wire18))) ?
              (8'hbf) : $signed(wire17))))
            begin
              reg23 <= ((^(wire14 * $unsigned((8'hb4)))) ?
                  (((-$unsigned((8'ha5))) ? wire5 : $signed((wire2 | wire13))) ?
                      {wire2} : $signed($signed($unsigned(reg22)))) : wire7);
            end
          else
            begin
              reg23 <= ({(wire19 == ({(8'h9e), reg21} ^ wire5))} ?
                  {wire9[(2'h3):(2'h3)]} : wire18[(2'h3):(1'h0)]);
            end
          reg24 <= (reg11 < ((&$unsigned(reg23[(3'h4):(3'h4)])) ?
              ($signed((wire2 ? wire8 : (8'hb4))) ?
                  ($signed((8'hb4)) ?
                      (+wire17) : (-wire2)) : $unsigned(wire10)) : $signed(wire1)));
          reg25 <= wire13[(2'h3):(1'h0)];
          if ($unsigned(($unsigned(((wire18 ? wire7 : wire17) ?
                  (reg22 ? (8'hb4) : wire13) : (wire5 <<< reg23))) ?
              (8'hb1) : reg21)))
            begin
              reg26 <= {((-(wire18[(2'h2):(1'h1)] ^ reg23)) != {wire15[(2'h2):(1'h1)],
                      ({reg22} ? wire7 : (wire0 <<< wire7))})};
              reg27 <= ({($unsigned(wire2[(3'h7):(3'h4)]) <<< $signed($signed(reg23))),
                      $unsigned({(!reg26)})} ?
                  (wire0[(4'he):(4'h9)] && (&reg22)) : wire1);
            end
          else
            begin
              reg26 <= wire16;
              reg27 <= $signed((~(((wire0 >= wire15) ? wire18 : {wire2}) ?
                  $signed(wire2[(4'hf):(2'h3)]) : (((8'hbb) - wire16) ?
                      $unsigned((8'hbb)) : (reg26 >= wire19)))));
            end
          reg28 <= ((((((8'ha9) ? wire13 : wire13) ?
              reg24 : $signed(wire1)) ~^ {wire18[(3'h4):(1'h0)],
              wire0[(1'h1):(1'h1)]}) != reg21[(1'h0):(1'h0)]) & reg20[(4'hd):(1'h1)]);
        end
      else
        begin
          reg23 <= $unsigned(wire12[(2'h3):(1'h0)]);
          if ($unsigned((wire15[(1'h0):(1'h0)] && reg27)))
            begin
              reg24 <= {$signed((~wire2)),
                  ((~&(-$signed(wire12))) ^ ($signed((wire18 ~^ reg20)) + reg26[(2'h3):(1'h1)]))};
              reg25 <= wire9[(1'h0):(1'h0)];
              reg26 <= wire8;
            end
          else
            begin
              reg24 <= $signed(wire6[(4'h9):(4'h9)]);
              reg25 <= reg26[(3'h4):(1'h1)];
              reg26 <= reg22[(4'h8):(3'h5)];
            end
          if ($unsigned((~&reg26[(4'h9):(2'h2)])))
            begin
              reg27 <= (|($signed((~(reg27 != wire10))) ?
                  (((wire13 && wire14) ? reg28 : (~^wire2)) ?
                      $signed($unsigned(wire1)) : ((wire13 <<< wire6) ?
                          (wire7 > wire3) : $signed(reg20))) : $unsigned($signed($signed((8'ha0))))));
              reg28 <= $signed({(-$signed((reg11 << reg11))),
                  {wire8[(2'h2):(1'h0)]}});
              reg29 <= (|$unsigned(($signed((^~reg11)) ?
                  {wire15[(1'h1):(1'h0)]} : $unsigned((wire5 ?
                      (8'ha0) : (8'h9c))))));
              reg30 <= wire2;
              reg31 <= (reg30[(1'h0):(1'h0)] ?
                  {(($signed((8'h9f)) <<< (wire4 ~^ reg20)) ?
                          ({wire14} ?
                              (|reg24) : reg25[(3'h5):(3'h5)]) : ((reg26 + (8'h9e)) | (reg29 ?
                              wire15 : reg25))),
                      wire3[(4'ha):(4'h8)]} : $unsigned(((wire6[(2'h3):(1'h0)] ?
                      wire6 : $unsigned(reg23)) * (reg30 ?
                      {reg20, wire2} : reg30))));
            end
          else
            begin
              reg27 <= $signed($unsigned($signed($signed($signed(wire1)))));
              reg28 <= wire14;
              reg29 <= $unsigned((^{(&wire15),
                  $signed(wire13[(1'h1):(1'h1)])}));
              reg30 <= $signed((reg30[(2'h3):(2'h3)] ?
                  (wire17 || ($unsigned((8'had)) ?
                      $signed(reg11) : (reg30 ? wire8 : reg31))) : wire14));
            end
          reg32 <= (^$signed(($signed($signed(wire6)) ?
              $unsigned((~|wire18)) : $signed((-wire10)))));
          reg33 <= (((reg21 ?
                      (wire4[(4'h9):(1'h0)] ?
                          (7'h44) : (wire1 ?
                              (7'h43) : wire3)) : ($unsigned((8'hb9)) ?
                          (~|wire13) : $unsigned(reg25))) ?
                  (^((reg20 ? wire7 : reg27) ?
                      $signed((8'hb0)) : reg29[(4'ha):(4'h8)])) : wire7[(1'h1):(1'h1)]) ?
              reg11[(3'h5):(3'h4)] : {(-$signed($unsigned((8'hb2)))),
                  (~&$unsigned(wire18))});
        end
    end
  assign wire34 = (($signed(reg32) ?
                          (reg33[(2'h2):(1'h1)] <<< (reg11[(3'h4):(1'h0)] ?
                              wire14[(2'h2):(1'h0)] : wire16)) : $signed($signed(reg28[(4'hc):(3'h6)]))) ?
                      $unsigned({(~&wire7),
                          (!wire17)}) : $unsigned(wire0[(3'h6):(2'h2)]));
  module35 #() modinst66 (.wire39(wire15), .wire38(reg30), .wire36(reg28), .wire37(wire12), .y(wire65), .wire40(wire14), .clk(clk));
  always
    @(posedge clk) begin
      reg67 <= $signed(wire0);
    end
  always
    @(posedge clk) begin
      reg68 <= $unsigned((~wire15));
    end
endmodule

module module35  (y, clk, wire36, wire37, wire38, wire39, wire40);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire37;
  input wire [(4'hc):(1'h0)] wire38;
  input wire [(4'h9):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire63;
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire41,
                 wire44,
                 wire45,
                 wire46,
                 wire53,
                 wire63,
                 reg42,
                 reg43,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 (1'h0)};
  assign wire41 = (wire39[(2'h3):(2'h2)] ?
                      wire39 : $signed(wire40[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg42 <= ($signed(((!((8'hb8) ? wire38 : wire37)) ?
              (8'hbe) : {(^wire37)})) ?
          (^~(~|$signed($signed(wire38)))) : $signed((wire36[(2'h2):(2'h2)] ?
              wire39[(1'h1):(1'h0)] : wire37)));
      reg43 <= wire40;
    end
  assign wire44 = (wire39[(4'h9):(1'h0)] > $signed({$signed(wire39[(3'h7):(2'h2)]),
                      wire38}));
  assign wire45 = wire37[(5'h10):(4'hc)];
  assign wire46 = wire40[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg47 <= $unsigned((($signed((wire39 ?
          (8'ha8) : wire45)) >> (wire44[(3'h6):(3'h5)] ?
          (wire41 * (8'hb4)) : $unsigned((8'h9f)))) <<< $unsigned($unsigned(reg43[(3'h4):(1'h1)]))));
      reg48 <= (wire39[(3'h6):(2'h3)] ?
          (wire36 ?
              $unsigned(wire38) : wire37) : $unsigned((wire39[(1'h0):(1'h0)] ?
              ((wire38 ? wire39 : (8'hb6)) ?
                  {reg42, wire36} : wire39[(2'h2):(1'h1)]) : $unsigned({wire39,
                  wire39}))));
      reg49 <= wire41;
      reg50 <= (($unsigned({{reg49, wire36}, $unsigned((7'h43))}) ?
          (^($unsigned(reg47) | reg42)) : $signed((|reg42))) * (reg49[(2'h3):(2'h3)] ?
          wire44 : ($signed((!(8'ha7))) > wire39)));
    end
  always
    @(posedge clk) begin
      reg51 <= reg48;
      reg52 <= reg49;
    end
  assign wire53 = (($unsigned(wire39[(3'h4):(1'h1)]) == ({(reg52 ?
                              reg49 : wire38)} - {(wire44 > (8'ha5)),
                          $unsigned(wire37)})) ?
                      (reg52 && (|wire44)) : reg52[(1'h1):(1'h1)]);
  module54 #() modinst64 (wire63, clk, wire44, wire45, wire46, reg49);
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire [(3'h7):(1'h0)] wire56;
  input wire [(4'h9):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  assign y = {wire62, wire61, wire60, wire59, (1'h0)};
  assign wire59 = ((~wire57[(3'h6):(3'h4)]) ?
                      (~|(({(8'ha0), wire55} - (+wire55)) ?
                          wire55[(3'h5):(1'h1)] : $unsigned((!(8'hb2))))) : $unsigned(wire58[(4'h8):(1'h0)]));
  assign wire60 = {wire58,
                      ((~|$signed(((8'h9c) ? wire57 : wire56))) && wire57)};
  assign wire61 = $signed($unsigned((^wire60[(2'h3):(2'h2)])));
  assign wire62 = ((~$unsigned((^~$signed((8'haf))))) ?
                      wire55[(1'h0):(1'h0)] : {($signed((wire60 ?
                                  wire55 : wire60)) ?
                              $unsigned($unsigned(wire58)) : (((8'hbe) <<< wire59) ?
                                  $unsigned(wire56) : {wire60})),
                          ($unsigned({(8'h9c)}) ?
                              $signed(wire61[(2'h2):(2'h2)]) : wire59)});
endmodule
