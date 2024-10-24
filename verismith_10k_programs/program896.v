module top
#(parameter param86 = (((((^(8'ha3)) ? ((8'h9e) ? (8'hbe) : (8'hb3)) : ((8'hb8) ? (7'h43) : (8'ha7))) && (~^((8'h9c) >> (8'hab)))) ? ((((7'h44) & (8'hb6)) ? ((8'hba) - (8'h9d)) : (~|(8'haa))) ^~ ({(8'ha4)} ? ((8'hbc) ? (8'ha6) : (7'h41)) : (8'hbd))) : ((((8'ha4) ? (8'hbe) : (8'ha7)) + ((8'h9d) ? (8'hb4) : (8'h9f))) ^ {((8'hb7) && (7'h43))})) << (!(^(~((8'hb3) == (8'hba)))))), 
parameter param87 = ((((&(param86 >>> param86)) << (^(param86 > param86))) ? (&((~^param86) ? (|param86) : ((8'hb8) | (8'h9c)))) : (&(param86 || (param86 - param86)))) * (param86 ? param86 : (8'hb0))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire85,
                 wire83,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(3'h6):(2'h3)];
      reg6 <= (((wire3[(4'hf):(4'hd)] ^~ (wire3 << (wire0 >> wire0))) ?
          $unsigned(reg5[(4'hd):(4'ha)]) : $signed(wire4)) ^ wire4[(3'h7):(3'h7)]);
      reg7 <= $signed(wire1);
    end
  always
    @(posedge clk) begin
      reg8 <= {(~((^{wire4, reg5}) ?
              ((~&wire0) ?
                  (^reg5) : $unsigned(reg5)) : $unsigned((reg5 < (8'hba))))),
          reg5};
    end
  assign wire9 = wire3;
  assign wire10 = wire4;
  assign wire11 = $unsigned(reg5[(2'h3):(2'h3)]);
  assign wire12 = $unsigned(($unsigned(reg7[(1'h1):(1'h1)]) != ($unsigned((!wire11)) ?
                      (reg5 < $signed((8'h9c))) : $signed($signed(reg5)))));
  assign wire13 = (~(^(~wire2)));
  assign wire14 = wire12[(1'h1):(1'h0)];
  assign wire15 = (wire4[(3'h7):(2'h2)] ?
                      $signed((8'ha0)) : reg7[(1'h1):(1'h0)]);
  assign wire16 = (wire11[(1'h0):(1'h0)] <<< (~((&(^(8'hbf))) ?
                      ({wire13,
                          (8'hba)} >>> $unsigned(wire0)) : wire10[(4'hf):(4'h9)])));
  module17 #() modinst84 (wire83, clk, reg5, wire16, wire9, wire12, wire1);
  assign wire85 = $signed($unsigned($unsigned(wire15[(1'h0):(1'h0)])));
endmodule

module module17
#(parameter param82 = (((~|(((8'hac) ? (8'hb3) : (7'h44)) ? ((8'ha5) & (8'hbc)) : ((7'h42) ? (8'hac) : (8'had)))) ? (^~((|(8'hb8)) * (8'hb9))) : (~(((8'hb8) ? (8'hac) : (8'ha3)) ? {(8'ha9)} : {(8'hac)}))) ? {(-({(8'hb3)} ? {(8'hb2), (8'haf)} : ((8'hbe) >> (8'hac)))), (~^(^~((7'h44) ? (8'hbb) : (8'hab))))} : ((-(((8'hb3) ? (8'hac) : (8'hb0)) ^ ((8'hb3) > (8'hb2)))) + (~&((!(8'haf)) ? ((7'h44) ? (8'hb1) : (8'haa)) : ((8'hb6) >= (8'h9e)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire [(4'he):(1'h0)] wire21;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  assign y = {wire80,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg28,
                 (1'h0)};
  assign wire23 = wire20[(5'h11):(3'h7)];
  assign wire24 = ($signed(wire19[(2'h3):(1'h0)]) ?
                      (8'haa) : $signed($signed(({wire18, wire22} <= {wire20,
                          wire19}))));
  assign wire25 = wire23[(4'hb):(3'h6)];
  assign wire26 = $signed(wire19);
  assign wire27 = {{$unsigned($signed(wire18[(3'h4):(1'h0)])),
                          $signed(wire25[(4'h9):(2'h3)])}};
  always
    @(posedge clk) begin
      reg28 <= ((wire27 ?
          wire20[(1'h1):(1'h1)] : $unsigned({{wire22}})) & $unsigned(wire18[(4'h8):(4'h8)]));
    end
  assign wire29 = $unsigned((~&(^~(~|(|(8'ha2))))));
  assign wire30 = (8'hbf);
  assign wire31 = $signed(wire21[(1'h0):(1'h0)]);
  assign wire32 = $signed($signed((((!wire31) ?
                          wire25[(1'h1):(1'h0)] : $unsigned(wire26)) ?
                      $signed(wire19) : (~(wire26 || wire23)))));
  module33 #() modinst58 (.wire35(wire23), .wire37(wire31), .y(wire57), .wire36(wire29), .clk(clk), .wire34(wire20));
  assign wire59 = ((wire20 - wire27) <= (wire22[(4'hf):(4'hc)] > wire24));
  assign wire60 = ($unsigned(((~|wire18) <= (((8'hb3) ?
                          wire23 : wire21) && (^~(8'ha6))))) ?
                      wire18 : $unsigned($unsigned(wire22)));
  assign wire61 = ($signed((wire60 ?
                      $unsigned((wire25 ? wire24 : wire31)) : {(wire31 ?
                              wire20 : wire31)})) > ({wire26[(4'ha):(4'ha)]} ?
                      (-wire19) : wire24));
  assign wire62 = wire30;
  assign wire63 = (&{(~|{(8'had), $signed(wire62)})});
  module64 #() modinst81 (wire80, clk, wire24, wire31, wire18, wire21);
endmodule

module module64  (y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire68;
  input wire signed [(4'hb):(1'h0)] wire67;
  input wire signed [(4'he):(1'h0)] wire66;
  input wire [(4'hc):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire69;
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire69,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire69 = ($unsigned((({wire66} ?
                          (wire68 ~^ wire68) : $signed(wire65)) ?
                      ($signed(wire68) ?
                          (~&wire65) : ((8'hb8) ?
                              wire67 : wire65)) : wire67)) ^ $signed($signed(wire68[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg70 <= wire66[(4'ha):(3'h7)];
      if ((((wire66 ?
              (!wire65[(2'h3):(2'h3)]) : (wire69 ?
                  wire69[(2'h3):(2'h2)] : (wire65 ?
                      wire65 : wire69))) << $unsigned({$signed(wire66),
              wire68[(3'h6):(1'h1)]})) ?
          (wire68[(3'h7):(1'h1)] ?
              {(^(wire66 ? reg70 : wire69)), (8'hbc)} : (({wire67, wire65} ?
                      $signed(wire67) : {wire69, reg70}) ?
                  (-wire69[(2'h2):(2'h2)]) : wire65)) : (!(+$unsigned($unsigned(wire68))))))
        begin
          reg71 <= $signed($unsigned({$unsigned(reg70[(2'h2):(2'h2)])}));
        end
      else
        begin
          reg71 <= (~^(8'haa));
          reg72 <= wire65;
        end
      reg73 <= {reg70};
    end
  assign wire74 = wire67;
  assign wire75 = {wire66[(3'h6):(3'h6)]};
  assign wire76 = $unsigned($unsigned(((~^(-reg70)) > $unsigned(wire75[(5'h14):(5'h12)]))));
  assign wire77 = $signed((wire67 ?
                      ($unsigned(((7'h43) ? reg72 : (7'h41))) ?
                          (8'ha1) : wire67[(4'h8):(3'h5)]) : wire66[(2'h3):(2'h3)]));
  assign wire78 = $signed(($signed(reg72[(4'hf):(4'he)]) ?
                      (+$signed($unsigned(wire68))) : ($signed((wire68 ?
                          (8'h9c) : wire77)) | wire67)));
  assign wire79 = {reg70};
endmodule

module module33
#(parameter param55 = (!((~&{(!(8'hbe))}) ? (8'hb7) : {(~|((8'hb5) ? (8'hb0) : (8'hb6))), (((8'ha7) ? (8'haf) : (8'hb6)) ? {(8'hbe)} : ((8'hbd) ^~ (7'h43)))})), 
parameter param56 = param55)
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire [(4'h8):(1'h0)] wire35;
  input wire signed [(3'h7):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  assign y = {wire50,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire39,
                 wire38,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg41,
                 (1'h0)};
  assign wire38 = (^wire34);
  assign wire39 = wire38;
  assign wire40 = (^~(8'ha8));
  always
    @(posedge clk) begin
      reg41 <= ((8'hab) ? (8'h9e) : wire36[(4'hd):(3'h7)]);
    end
  assign wire42 = wire38;
  assign wire43 = (^~$signed($unsigned(($unsigned(wire40) < wire37))));
  assign wire44 = wire38;
  assign wire45 = $unsigned($signed(wire38));
  assign wire46 = {(+$signed(($unsigned((8'hac)) ?
                          $unsigned(wire39) : {wire36, wire38}))),
                      $unsigned((wire42 ?
                          {(8'hb1),
                              $unsigned((8'ha9))} : $signed((wire40 ^ wire36))))};
  assign wire47 = $signed($unsigned((wire42[(3'h6):(1'h0)] ?
                      wire45 : wire42[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg48 <= {wire43[(3'h4):(2'h2)]};
      reg49 <= wire40;
    end
  assign wire50 = ((wire47 ?
                      $unsigned((-(^(8'ha6)))) : ({(wire43 != wire35)} ?
                          (~^((8'hba) || (8'hab))) : ($signed(wire46) * (wire44 ?
                              wire38 : wire45)))) ^~ $unsigned(wire36[(4'hf):(1'h1)]));
  always
    @(posedge clk) begin
      if ((wire39 ?
          $signed((~^(wire37[(3'h4):(3'h4)] * $unsigned((8'hbc))))) : (^~({wire42[(2'h2):(1'h0)],
                  $signed(wire42)} ?
              ((reg48 << wire43) ?
                  $unsigned(wire37) : (+reg48)) : $signed((~^reg49))))))
        begin
          reg51 <= ($unsigned(wire46) ? reg48 : wire38);
          reg52 <= (wire47[(1'h1):(1'h1)] ~^ wire43[(1'h1):(1'h1)]);
          reg53 <= ({((^~wire47) ?
                  $signed($unsigned(wire39)) : wire34)} ~^ $unsigned({$unsigned((wire44 || reg41)),
              {wire40[(1'h1):(1'h0)]}}));
          reg54 <= $signed(($signed(($signed(wire37) < (!wire44))) ?
              {$signed(wire37),
                  $unsigned({wire42,
                      (7'h43)})} : (^($signed(reg48) ^~ (wire36 != wire47)))));
        end
      else
        begin
          reg51 <= ({((wire36[(1'h1):(1'h0)] <<< ((8'ha0) != wire47)) ?
                  $unsigned((&(8'hba))) : $signed((8'ha5)))} == reg53);
          reg52 <= ((wire35 ?
                  wire45[(3'h7):(3'h6)] : (~$unsigned({wire38, wire42}))) ?
              reg41 : $signed({($signed(wire40) | (reg51 ?
                      wire34 : (8'ha6)))}));
        end
    end
endmodule
