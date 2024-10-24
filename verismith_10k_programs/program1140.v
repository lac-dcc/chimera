module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (~|($signed(((~|wire3) ?
                         (wire2 ? wire2 : (8'h9e)) : (+wire0))) ?
                     ($signed($unsigned((7'h40))) ?
                         wire3 : (^(8'h9c))) : (((wire3 ?
                             wire2 : wire1) | wire0[(4'h8):(2'h2)]) ?
                         wire0 : {wire3[(3'h4):(1'h1)]})));
  always
    @(posedge clk) begin
      reg6 <= (((($unsigned(wire5) ?
              $unsigned(wire5) : (~|wire1)) <<< ((^wire4) < $unsigned((8'ha0)))) ?
          ({wire5[(1'h1):(1'h0)], $signed(wire5)} ?
              {(wire5 < wire1)} : (+wire2)) : ((|{wire1, wire4}) ?
              (~&(^~(8'hbb))) : wire2[(2'h3):(2'h3)])) != (&wire0));
      reg7 <= wire2[(2'h2):(2'h2)];
    end
  assign wire8 = ($unsigned(((~|wire3) ?
                     (~|wire0[(3'h6):(3'h6)]) : reg6)) << $signed($signed($unsigned(wire1[(2'h2):(1'h1)]))));
  assign wire9 = $unsigned(reg7[(1'h0):(1'h0)]);
  assign wire10 = (wire4[(1'h1):(1'h1)] ?
                      reg7 : ($signed(wire2[(3'h5):(1'h1)]) < (($unsigned(wire2) ?
                          $unsigned(wire2) : (-(8'hb9))) & (wire5 ?
                          (!wire2) : (|(8'ha1))))));
  module11 #() modinst70 (.wire15(wire10), .wire12(wire1), .wire14(wire0), .clk(clk), .y(wire69), .wire13(wire4));
  assign wire71 = ((|(&$signed((|wire3)))) > wire0);
  assign wire72 = $unsigned(wire71);
  assign wire73 = $unsigned(($unsigned(reg6) ?
                      $signed(({reg6, (8'h9f)} ^ $unsigned(wire9))) : reg7));
  assign wire74 = $signed((+wire10));
endmodule

module module11
#(parameter param67 = ({((8'ha8) ~^ (((8'hb0) ^ (8'ha0)) ? (|(8'hbf)) : ((8'hba) ? (8'hab) : (8'h9f)))), (+(~&((8'haf) ? (8'hb0) : (8'ha3))))} ? (!({((8'hb7) ? (7'h43) : (8'hbc))} ? (~|((8'hb6) ? (8'ha8) : (8'hb3))) : (((8'ha0) == (8'hb1)) | ((8'haf) ? (8'hb9) : (8'ha6))))) : ((((~|(8'hab)) ? ((8'hb6) ? (8'ha6) : (7'h43)) : ((8'hb6) + (7'h43))) ? (+((8'ha1) ? (8'hb2) : (8'ha6))) : (|{(8'ha0), (8'h9d)})) <= (-(~^((8'hb1) ? (8'ha8) : (8'hbb)))))), 
parameter param68 = {{param67}})
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire45;
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire66,
                 wire59,
                 wire58,
                 wire57,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((~|$signed($unsigned($unsigned(wire15))))))
        begin
          reg16 <= wire15;
          reg17 <= $unsigned(({reg16,
              ($unsigned((8'ha4)) ?
                  $unsigned(reg16) : (wire13 ? (7'h44) : (8'hb6)))} ^~ (wire13 ?
              $unsigned((+wire14)) : wire13[(2'h2):(1'h1)])));
          reg18 <= {(((+wire12) ?
                  $unsigned($unsigned((8'ha5))) : (reg17 & wire15[(3'h5):(3'h5)])) || (!reg16[(3'h6):(1'h0)]))};
        end
      else
        begin
          reg16 <= (($signed(((wire12 ? wire13 : wire12) ?
                      (~&reg17) : $signed(wire12))) ?
                  reg17[(4'hb):(4'h8)] : $signed(reg18)) ?
              $unsigned($unsigned($unsigned((8'hbf)))) : $signed($signed((wire12 ^ $signed(wire12)))));
          reg17 <= (~&{$signed(wire12), $unsigned(reg17)});
          if ((((((wire12 >> (8'haf)) != $signed(reg18)) && (~^wire12)) ?
                  wire12[(2'h3):(1'h1)] : (^wire15[(1'h1):(1'h1)])) ?
              wire15 : (((~&(reg17 | (8'ha9))) <<< ($signed(wire12) ^~ (-(7'h41)))) == wire13)))
            begin
              reg18 <= ({(((~&wire14) | reg18) ?
                      (reg18[(4'h8):(3'h4)] == {wire12,
                          reg17}) : ((+wire15) << (8'hb7))),
                  (!wire12)} >>> reg17[(4'hd):(4'ha)]);
              reg19 <= ($signed(($signed(reg16[(4'ha):(2'h3)]) ?
                  reg16[(4'h9):(1'h0)] : {reg18,
                      (wire14 ? wire13 : reg16)})) ^~ $signed(({{wire12, reg18},
                  $signed(wire14)} + $unsigned($signed(reg17)))));
              reg20 <= $signed(wire13[(1'h1):(1'h1)]);
            end
          else
            begin
              reg18 <= (~|wire15[(2'h3):(2'h3)]);
              reg19 <= (((^$signed(wire15[(3'h5):(3'h5)])) ~^ (wire15[(2'h3):(2'h3)] ?
                  wire12[(2'h3):(2'h3)] : (wire15[(2'h3):(2'h2)] ?
                      $signed(wire15) : (!reg19)))) != (~$unsigned($unsigned((~reg19)))));
            end
        end
      reg21 <= {((+wire12[(3'h7):(3'h6)]) > reg17[(3'h7):(3'h7)])};
    end
  module22 #() modinst46 (.clk(clk), .y(wire45), .wire27(wire15), .wire26(wire12), .wire23(reg20), .wire24(reg16), .wire25(reg19));
  assign wire47 = $unsigned((wire45 ?
                      $signed($signed((wire12 ^ wire14))) : reg18));
  assign wire48 = $unsigned((($signed((reg18 == wire14)) | $unsigned((reg17 && reg20))) ?
                      wire45 : ((wire13 ? (~reg16) : $signed(reg18)) ?
                          wire47[(3'h4):(1'h1)] : $unsigned({reg21}))));
  assign wire49 = ($unsigned(wire13) ? wire15 : reg21[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      if ((-wire15[(1'h1):(1'h0)]))
        begin
          reg50 <= (wire12 > wire45[(3'h5):(1'h0)]);
          if ((reg21[(4'h8):(3'h7)] ?
              ((!($unsigned(wire12) || wire48[(1'h1):(1'h0)])) < (+(~^$unsigned(wire15)))) : reg19))
            begin
              reg51 <= ($signed($unsigned((reg21 ?
                  wire14[(3'h5):(3'h4)] : (+reg17)))) == ((8'hb0) < $unsigned(reg18)));
              reg52 <= reg51[(3'h6):(1'h1)];
              reg53 <= (+($unsigned({reg18}) ^~ {((reg20 ?
                      reg18 : reg19) >> {(7'h43)})}));
            end
          else
            begin
              reg51 <= (wire13[(1'h0):(1'h0)] ?
                  $unsigned(((~|wire48[(2'h3):(1'h0)]) | reg53)) : (($unsigned((wire49 ?
                      reg20 : wire47)) <= $unsigned(wire49)) + ((!$unsigned(reg20)) ?
                      $unsigned((reg50 ?
                          reg21 : reg17)) : reg20[(4'hc):(3'h5)])));
              reg52 <= reg19[(5'h12):(4'hc)];
              reg53 <= (|((8'haf) * (({(8'h9d), reg21} ?
                      {reg51, (8'hab)} : $unsigned(wire45)) ?
                  (8'h9e) : reg52[(1'h1):(1'h1)])));
            end
          reg54 <= wire14[(4'h8):(3'h4)];
          reg55 <= wire47[(3'h4):(2'h3)];
          reg56 <= (!{wire14});
        end
      else
        begin
          reg50 <= $signed(((({reg50, wire49} ?
              {wire15, reg19} : {reg53}) + wire49[(3'h4):(3'h4)]) & reg51));
          reg51 <= $signed((~|$unsigned((reg53[(4'he):(4'he)] <<< $signed(wire48)))));
        end
    end
  assign wire57 = ((^~$signed(reg53)) ?
                      (~|(~^wire47)) : (($signed(reg17[(4'ha):(3'h6)]) <<< (reg21 ?
                              (~&wire48) : {(8'h9d)})) ?
                          reg18[(4'ha):(3'h6)] : reg54));
  assign wire58 = (&reg51[(4'hb):(3'h4)]);
  assign wire59 = (reg54[(5'h13):(1'h0)] ^~ (((reg50 ?
                          (-reg52) : $unsigned(wire15)) ?
                      $signed($signed(reg56)) : ((7'h43) >>> $signed(reg20))) - wire49));
  always
    @(posedge clk) begin
      reg60 <= ($unsigned({$signed((reg50 & reg52))}) | $signed(((~&(reg53 | reg54)) < ({wire15} * wire57[(2'h3):(1'h0)]))));
      reg61 <= {((+$signed(wire45)) == {($signed(wire12) ?
                  (^wire57) : wire49[(3'h6):(1'h0)]),
              ((wire49 <<< reg19) == wire58[(4'ha):(3'h5)])}),
          reg19};
      reg62 <= ((wire12[(3'h6):(3'h5)] ?
          reg53 : (^((!reg21) ?
              (wire59 ? reg18 : reg55) : (wire14 ? reg60 : reg17)))) - wire48);
    end
  always
    @(posedge clk) begin
      reg63 <= (wire58 ?
          (($unsigned((-reg21)) & ({reg52} >>> reg60)) == reg56[(4'hd):(2'h3)]) : ($signed((^~reg50)) ?
              $unsigned(wire49) : $signed($signed((|(8'ha5))))));
      reg64 <= {$unsigned($unsigned($signed({reg55, reg16}))),
          ((reg56 ?
              (wire12[(4'hb):(2'h2)] ?
                  (wire14 >> reg18) : (reg62 ?
                      wire47 : reg51)) : ((wire57 || reg55) ?
                  {reg55, (8'hb0)} : wire13)) > ($unsigned(reg19) ?
              ((wire57 ? wire47 : reg63) ?
                  wire48 : $unsigned(wire12)) : wire57))};
      reg65 <= $unsigned($unsigned($unsigned(wire58[(3'h4):(1'h1)])));
    end
  assign wire66 = (~|$signed($unsigned(reg17[(3'h7):(1'h1)])));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
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
  assign wire28 = $unsigned((wire23[(1'h1):(1'h0)] != $signed(($unsigned(wire27) > (&(8'ha6))))));
  assign wire29 = ($signed($unsigned((wire25 ?
                      (|wire24) : (wire25 >= wire27)))) < ($signed($signed(wire28[(3'h4):(2'h3)])) ?
                      wire27[(3'h5):(2'h2)] : wire25[(2'h3):(1'h1)]));
  assign wire30 = wire28[(1'h1):(1'h1)];
  assign wire31 = (wire24 ?
                      ($signed(((wire23 ? wire26 : wire30) >> (wire26 ?
                              wire28 : (8'hac)))) ?
                          $unsigned($unsigned($signed(wire27))) : wire30) : $unsigned(({$unsigned(wire24),
                              $unsigned(wire30)} ?
                          (~|(^wire28)) : (8'haa))));
  assign wire32 = (wire30 ~^ $signed((~^wire26[(2'h3):(2'h3)])));
  assign wire33 = wire31[(1'h1):(1'h1)];
  assign wire34 = ($unsigned($unsigned(wire33[(2'h3):(1'h0)])) ?
                      (~&(wire28 ?
                          ($signed((8'hbe)) ~^ $signed(wire26)) : (wire33 ?
                              wire24 : (-wire33)))) : (($unsigned($unsigned(wire30)) ?
                              $unsigned((wire28 >= wire31)) : (wire31 ~^ (~^wire29))) ?
                          {$signed((&wire33)),
                              wire26[(3'h5):(1'h0)]} : wire30));
  always
    @(posedge clk) begin
      if ($unsigned(wire27[(4'hc):(2'h2)]))
        begin
          reg35 <= $unsigned(wire33[(4'h9):(3'h7)]);
          if ($signed(wire31[(4'h8):(2'h2)]))
            begin
              reg36 <= wire30;
              reg37 <= ((wire27 ?
                  $signed(((~wire27) - wire32[(3'h4):(1'h0)])) : (+$unsigned(wire27[(4'he):(2'h3)]))) | (8'hb7));
              reg38 <= wire24;
              reg39 <= wire25[(1'h0):(1'h0)];
            end
          else
            begin
              reg36 <= ($signed($signed($signed($signed(reg36)))) - (({((7'h41) | wire30)} <= (reg39[(4'h8):(2'h3)] ?
                  wire31 : reg38)) << (~^wire23[(3'h4):(2'h3)])));
            end
          if ($signed((~^$unsigned((7'h40)))))
            begin
              reg40 <= $unsigned({(8'hbd)});
            end
          else
            begin
              reg40 <= (~^($signed(wire26) ?
                  wire28[(1'h1):(1'h1)] : (+($signed(wire31) <= reg38))));
            end
          if ($signed((wire26[(4'hc):(4'h9)] ?
              reg37[(1'h0):(1'h0)] : (!$unsigned($signed(wire26))))))
            begin
              reg41 <= (~^($unsigned($signed($unsigned(reg35))) ?
                  ({((8'ha9) ? reg37 : wire27), wire24[(4'hd):(4'ha)]} ?
                      (+wire29) : ((^~wire28) && reg36)) : wire30[(1'h1):(1'h1)]));
              reg42 <= reg41[(3'h4):(1'h1)];
            end
          else
            begin
              reg41 <= {reg35[(4'he):(3'h7)],
                  (-(~$unsigned((wire31 ? wire24 : wire29))))};
              reg42 <= $unsigned(wire25[(5'h11):(1'h1)]);
              reg43 <= wire34[(1'h0):(1'h0)];
            end
          reg44 <= (((reg41[(2'h2):(2'h2)] ^~ $signed((&wire33))) - $unsigned((^~(wire24 ?
                  (8'hb6) : reg43)))) ?
              ((~|{$signed(reg39)}) && $signed((((8'hba) | reg36) & ((8'ha1) ?
                  wire34 : reg41)))) : reg40);
        end
      else
        begin
          if (reg44)
            begin
              reg35 <= (^~({$unsigned((reg41 ?
                      (8'hba) : wire30))} - (($unsigned(reg37) ?
                  $signed(reg35) : (^~wire29)) != $signed($signed(wire30)))));
              reg36 <= wire32;
              reg37 <= $unsigned(wire28);
              reg38 <= {($unsigned($unsigned($unsigned((8'hbe)))) ~^ {wire34[(2'h2):(1'h1)]})};
            end
          else
            begin
              reg35 <= ({(wire33[(2'h2):(2'h2)] << ($signed(wire29) <<< $unsigned(wire31))),
                  reg42} * wire25[(3'h7):(3'h5)]);
              reg36 <= $signed((reg39 ? reg40 : (8'hb5)));
              reg37 <= $signed(reg37[(1'h0):(1'h0)]);
            end
        end
    end
endmodule
