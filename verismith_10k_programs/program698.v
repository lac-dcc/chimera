module top
#(parameter param67 = {(~((!(8'ha0)) * ((~&(8'h9c)) <<< ((7'h41) ? (8'hb5) : (8'hb6))))), (((((8'ha6) ? (8'hbb) : (8'hbf)) ^~ (~|(8'ha1))) ? (8'hb7) : ((8'hb0) ^~ (-(8'ha5)))) ? ((((7'h43) ? (8'ha9) : (8'ha1)) <= ((8'hb1) && (8'ha5))) != {(~&(7'h42)), ((8'ha2) & (8'ha4))}) : ((8'hac) ? {((8'hae) & (8'hb9))} : (8'h9e)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire47;
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire52,
                 wire51,
                 wire49,
                 wire47,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg50,
                 (1'h0)};
  module4 #() modinst48 (wire47, clk, wire3, wire0, wire2, wire1, (8'hb5));
  assign wire49 = wire3[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg50 <= ($unsigned((^(-wire2))) != wire49);
    end
  assign wire51 = wire2;
  assign wire52 = (wire0 ?
                      $signed({(|$signed(wire0))}) : {wire3[(1'h1):(1'h0)],
                          wire2[(4'h8):(3'h7)]});
  always
    @(posedge clk) begin
      if ((wire52 << $unsigned({(+$signed(wire3))})))
        begin
          reg53 <= reg50;
          reg54 <= (($signed((~(wire52 ? wire49 : reg53))) << wire52) ^ reg53);
          reg55 <= ({$signed($unsigned({(8'hba)})), reg54} ?
              $signed(($signed((!wire51)) ?
                  (reg54[(1'h1):(1'h0)] ?
                      (^~(8'haa)) : (!(7'h42))) : ((wire2 <= (8'h9c)) ?
                      {reg53} : $signed(reg53)))) : ({wire3, wire52} ?
                  ((reg54 + (wire0 ? wire2 : wire52)) ?
                      wire1[(1'h1):(1'h0)] : wire49) : ((8'haf) ?
                      wire52 : (wire2 ^ $signed(wire3)))));
        end
      else
        begin
          reg53 <= (~&wire52[(1'h0):(1'h0)]);
          reg54 <= wire51;
          if ((7'h40))
            begin
              reg55 <= (wire51[(3'h7):(3'h6)] ?
                  $signed((((wire1 ? reg53 : reg54) ?
                      wire49[(3'h5):(3'h5)] : wire49[(4'h8):(1'h0)]) != {{wire52}})) : (((wire2 ?
                          $signed(reg55) : $signed(wire0)) ?
                      $signed((~|reg55)) : $unsigned(wire0[(3'h6):(1'h1)])) >= $unsigned($signed((!wire3)))));
              reg56 <= ((((reg53 < (wire52 ? reg54 : (8'h9e))) ?
                      ((wire52 <= reg53) ?
                          reg53 : $signed((8'h9c))) : (wire51 != (wire52 ?
                          wire47 : wire3))) * wire3[(3'h4):(3'h4)]) ?
                  $unsigned(wire47) : {$unsigned($signed(((8'hb9) ?
                          wire47 : (8'haf)))),
                      $unsigned(($unsigned(wire47) - $signed(wire1)))});
            end
          else
            begin
              reg55 <= $signed(reg50[(3'h5):(1'h0)]);
              reg56 <= ($unsigned(reg50[(3'h7):(1'h1)]) ?
                  (($signed(reg55[(4'ha):(3'h4)]) * (wire2[(3'h6):(1'h1)] ?
                          (wire47 <= wire47) : (reg50 ? wire0 : wire49))) ?
                      {reg55, wire2[(4'hb):(3'h5)]} : ($signed((~wire3)) ?
                          {((8'h9d) << reg50)} : $unsigned((reg55 ?
                              wire49 : wire1)))) : reg50);
              reg57 <= (~wire47[(1'h0):(1'h0)]);
              reg58 <= (reg57 ?
                  (reg53[(1'h1):(1'h1)] ?
                      $unsigned((wire3 ?
                          reg57[(1'h0):(1'h0)] : {reg55, wire47})) : ((wire49 ?
                          $signed(wire49) : {reg55}) >>> ((wire1 & reg54) || $signed(wire47)))) : wire52);
            end
        end
    end
  assign wire59 = (wire1[(2'h2):(1'h0)] < wire52[(4'hc):(4'ha)]);
  assign wire60 = $unsigned($signed($signed($signed(wire1[(1'h0):(1'h0)]))));
  assign wire61 = $unsigned(((~&wire49[(4'hb):(4'h9)]) ?
                      $unsigned(wire59) : (({wire3} ^ {reg55}) != $unsigned($signed((8'hab))))));
  assign wire62 = $signed((+reg54));
  assign wire63 = reg50[(5'h13):(5'h13)];
  assign wire64 = $signed((reg57 ^ {wire59}));
  assign wire65 = $signed(wire3);
  assign wire66 = reg57;
endmodule

module module4
#(parameter param46 = (((^(((8'h9c) * (8'hb0)) ? ((8'hae) ? (8'had) : (8'ha4)) : ((8'hbc) ? (8'hba) : (8'hab)))) ? ((((8'ha5) ? (8'h9c) : (8'ha1)) >= ((8'hb2) != (8'ha3))) < (((8'h9c) ? (8'h9e) : (7'h44)) != ((7'h44) * (8'hab)))) : (^~(((7'h43) ? (8'ha6) : (7'h42)) ? (|(8'hb2)) : (8'ha3)))) ? {({(|(7'h41))} >= ((8'ha5) ^~ ((8'haf) ? (8'hbf) : (8'hb9)))), {{(7'h44), {(8'hb3), (7'h41)}}}} : {(-(((8'hb0) > (8'had)) ~^ {(8'hb7), (8'h9c)}))}))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire5;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire43;
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  assign y = {wire45,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire43,
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
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire10 = (~&wire9[(4'hf):(4'ha)]);
  assign wire11 = wire8[(3'h5):(1'h0)];
  assign wire12 = wire9;
  assign wire13 = wire10[(4'h9):(3'h4)];
  assign wire14 = {((wire11[(4'hb):(1'h1)] ?
                              $signed((^~wire10)) : ((wire7 ?
                                  (7'h44) : wire10) <= ((8'hb5) <<< wire5))) ?
                          (~(+(^~wire12))) : (($unsigned((7'h43)) - $signed(wire11)) ?
                              ($unsigned((7'h40)) <<< wire12) : (~^wire7))),
                      $signed(wire13)};
  assign wire15 = $signed(wire9);
  assign wire16 = wire6[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= wire5;
      reg18 <= $unsigned(wire10);
      if ((((reg17 ?
          ($unsigned(wire10) ?
              $unsigned(wire6) : wire5) : (wire15[(4'hd):(1'h0)] ?
              (~^reg18) : (wire8 && wire12))) ~^ wire10[(5'h10):(2'h3)]) | $unsigned({(reg18[(2'h2):(1'h1)] ?
              wire9 : $signed(wire16)),
          wire11})))
        begin
          if (((^~$signed(reg18[(4'h9):(3'h7)])) | ($unsigned(wire5[(1'h1):(1'h1)]) ?
              $signed(((8'hbe) != (wire7 ?
                  wire6 : (8'h9e)))) : $unsigned($signed(wire7)))))
            begin
              reg19 <= {(~^wire8)};
              reg20 <= (!reg19);
              reg21 <= wire10[(3'h6):(1'h0)];
              reg22 <= $unsigned((8'hb9));
            end
          else
            begin
              reg19 <= {reg18};
            end
          if ((~|({(reg21 ^~ wire16)} + $signed($unsigned($signed(wire14))))))
            begin
              reg23 <= $unsigned(reg19[(3'h5):(2'h3)]);
              reg24 <= ($unsigned($signed($unsigned((reg18 ? reg18 : reg23)))) ?
                  {(^~wire15)} : (({wire12} ?
                          $unsigned({reg17}) : ($signed(wire14) <<< (reg18 < reg21))) ?
                      $signed(((^~(8'hb7)) >>> (reg20 <<< wire9))) : (($unsigned((8'ha4)) ?
                              $signed(reg17) : $unsigned(reg18)) ?
                          {(~&wire6), wire6[(3'h5):(2'h3)]} : reg20)));
              reg25 <= reg17[(4'he):(1'h1)];
              reg26 <= (+(wire14[(2'h2):(1'h1)] ?
                  {(reg25 << reg25[(3'h6):(2'h2)])} : reg20[(1'h0):(1'h0)]));
              reg27 <= (|(reg18 - wire16));
            end
          else
            begin
              reg23 <= {$signed(reg21[(2'h2):(2'h2)])};
              reg24 <= ($signed((($signed(wire15) + (reg26 - reg27)) | ({reg27,
                      wire12} ?
                  $unsigned(reg18) : wire5))) <= {wire6[(1'h0):(1'h0)]});
              reg25 <= reg24[(5'h11):(4'hd)];
              reg26 <= $signed($unsigned(wire6[(3'h4):(2'h3)]));
              reg27 <= {wire11,
                  ($signed(({wire9} ? (wire10 <<< reg20) : wire12)) ?
                      {$signed(reg24[(4'hb):(3'h5)])} : {reg19})};
            end
          reg28 <= (reg17 ?
              ((wire11[(3'h4):(1'h0)] ?
                  {$unsigned((8'hb8)), $unsigned(wire5)} : ((reg19 ?
                      wire13 : wire14) >> (-reg23))) | $unsigned(reg27[(1'h0):(1'h0)])) : ((-wire7[(5'h10):(1'h0)]) <<< wire16[(3'h7):(3'h7)]));
          reg29 <= $signed((~|wire16));
        end
      else
        begin
          if (($signed($signed($unsigned($signed(wire10)))) && (wire11[(3'h6):(2'h3)] + $unsigned((reg19[(3'h6):(1'h1)] ?
              $signed(wire11) : ((8'hae) ? (8'hab) : reg22))))))
            begin
              reg19 <= $unsigned(($signed((reg24 >>> $signed(reg29))) >= {wire13[(3'h7):(3'h6)],
                  (&{reg28, wire13})}));
              reg20 <= ($unsigned((^~((8'ha1) < (+reg28)))) ~^ $unsigned($signed(($unsigned(wire7) ?
                  reg17 : $unsigned((8'ha2))))));
              reg21 <= ($signed(((+$unsigned(wire8)) < ({reg24, wire5} ?
                  $signed(wire5) : $signed(reg29)))) >> $signed($signed((wire15[(5'h14):(5'h13)] ?
                  wire6 : $unsigned(wire14)))));
              reg22 <= $signed(reg27[(1'h0):(1'h0)]);
              reg23 <= {({(reg20[(3'h5):(2'h3)] - wire9)} || $unsigned(wire15))};
            end
          else
            begin
              reg19 <= {((|reg24[(4'hc):(4'ha)]) ?
                      reg21 : reg23[(3'h5):(3'h4)])};
              reg20 <= wire14[(2'h3):(1'h0)];
              reg21 <= $signed((8'haf));
            end
          reg24 <= wire6[(2'h2):(2'h2)];
          reg25 <= reg19;
        end
      reg30 <= ((reg24 <= wire11) ?
          (~|(7'h41)) : $unsigned($unsigned((^~(reg22 ? reg20 : reg24)))));
    end
  module31 #() modinst44 (wire43, clk, wire15, reg30, reg22, reg23, reg17);
  assign wire45 = reg27[(1'h0):(1'h0)];
endmodule

module module31
#(parameter param41 = (-(~&(^~({(7'h40), (7'h43)} ? (~(8'hb5)) : ((8'hac) ? (8'hb5) : (8'h9c)))))), 
parameter param42 = (-((!((param41 ? (8'h9d) : param41) & param41)) ? (~^param41) : (8'h9e))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  input wire signed [(4'he):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire signed [(3'h6):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  assign y = {wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = $signed((-($unsigned(wire32[(3'h5):(1'h0)]) ?
                      (wire34 >> $signed(wire34)) : $signed((wire33 <= (8'ha6))))));
  assign wire38 = wire37[(1'h1):(1'h0)];
  assign wire39 = (8'hb6);
  assign wire40 = wire39;
endmodule
