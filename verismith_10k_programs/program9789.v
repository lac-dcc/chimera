module top
#(parameter param90 = (8'h9e))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire64;
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire64,
                 reg89,
                 reg88,
                 reg87,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  module5 #() modinst65 (.wire6(wire4), .y(wire64), .wire7(wire0), .clk(clk), .wire8(wire2), .wire9(wire1));
  always
    @(posedge clk) begin
      reg66 <= ((-$unsigned((~^$unsigned(wire2)))) > (+(wire0 & $signed((wire0 ?
          (8'hb8) : wire4)))));
      reg67 <= ($unsigned((wire4 ?
              (+$signed(wire64)) : (|(reg66 ? wire64 : wire64)))) ?
          wire2[(2'h3):(1'h1)] : (((~wire0[(3'h4):(2'h2)]) ?
                  $signed((wire2 ~^ wire2)) : (wire3[(4'h9):(4'h9)] ?
                      $unsigned(wire3) : {(8'hb7), wire1})) ?
              ($signed($signed(reg66)) == $unsigned({wire64,
                  wire4})) : $unsigned((~&((8'hb8) <= wire1)))));
      if ((~^$unsigned((8'hb3))))
        begin
          if (reg66)
            begin
              reg68 <= $unsigned(reg67);
              reg69 <= $unsigned(((wire2 >>> (-wire2)) ?
                  $unsigned(reg68[(1'h0):(1'h0)]) : ($unsigned((wire0 ?
                      reg66 : (8'ha0))) << $signed((wire64 ? wire1 : wire0)))));
              reg70 <= wire2;
              reg71 <= (((7'h43) * ((~(~|reg70)) ?
                  reg69 : $unsigned({wire4}))) ^ wire64);
            end
          else
            begin
              reg68 <= $unsigned(($signed(((-reg67) << (wire4 != wire2))) > wire3));
            end
          reg72 <= $signed({$signed((|(!wire0))),
              (wire3[(4'h8):(1'h1)] ?
                  ($signed(reg69) != reg66) : (reg69 >= (reg71 ?
                      reg69 : wire64)))});
          reg73 <= (!(((((8'hbf) <<< wire3) == $unsigned(reg67)) - $signed($signed(reg66))) > ((8'ha4) - $signed(((8'ha2) ?
              wire1 : wire0)))));
          if ($signed(reg69))
            begin
              reg74 <= $signed($unsigned($unsigned(($signed((7'h43)) ?
                  $signed(wire1) : (^~reg73)))));
              reg75 <= (^~$signed(($unsigned((reg72 == wire3)) ~^ ((8'hb7) >>> {(8'hab)}))));
              reg76 <= $unsigned({reg74[(4'hc):(1'h0)]});
              reg77 <= (~{{$signed($signed(reg76))}, reg70[(4'hd):(1'h1)]});
              reg78 <= (wire0 >>> $unsigned($signed(wire0[(4'hf):(2'h3)])));
            end
          else
            begin
              reg74 <= {((~((reg77 > reg75) ?
                      (!reg67) : {reg70, reg72})) && (wire3 ?
                      (8'ha9) : (!((8'hb4) ? reg67 : wire4))))};
              reg75 <= ((~|(~&$signed((reg74 ?
                  (8'hb7) : reg74)))) >>> wire64[(3'h7):(3'h4)]);
            end
          reg79 <= (&reg76[(3'h6):(2'h2)]);
        end
      else
        begin
          reg68 <= (!((reg69 ^~ reg74) ?
              $unsigned((8'hbc)) : (-reg74[(5'h11):(4'ha)])));
          reg69 <= (reg71[(4'h9):(3'h7)] ?
              $unsigned(((wire1[(4'he):(4'he)] ?
                  (reg79 ?
                      reg76 : wire1) : reg69[(5'h10):(3'h5)]) ~^ (7'h44))) : $signed((($unsigned(reg76) ?
                      (reg70 * wire64) : $unsigned((8'hae))) ?
                  (~$unsigned(reg74)) : reg74)));
          reg70 <= ((((~((7'h41) ?
                  wire3 : wire0)) & $unsigned(wire1[(4'h9):(1'h1)])) ?
              (8'h9e) : (((~^(8'hb9)) | $unsigned((8'hbd))) ?
                  wire3[(4'ha):(1'h0)] : $signed(reg73))) <<< (8'hb8));
          if (($signed(reg76) ^ $signed($signed((8'ha0)))))
            begin
              reg71 <= (((reg67[(1'h1):(1'h1)] ?
                  reg72[(2'h3):(1'h1)] : reg75) ^~ ({((8'ha4) > reg68),
                  $unsigned(wire3)} ^~ reg66[(3'h5):(3'h4)])) >>> $unsigned($signed(((!reg67) ?
                  $signed(reg69) : reg77))));
              reg72 <= $unsigned(reg77);
              reg73 <= ($signed(((reg72 ? $signed((8'hb2)) : $unsigned(wire0)) ?
                  $unsigned((8'hb1)) : wire64[(3'h5):(1'h0)])) > (!($unsigned($unsigned(wire0)) ?
                  (+$unsigned(wire64)) : $signed(((8'h9c) && wire64)))));
            end
          else
            begin
              reg71 <= (~$signed($signed($unsigned($signed(reg75)))));
              reg72 <= ((wire3 ~^ (&(reg76 ?
                  $unsigned(wire4) : (wire1 + reg67)))) != (+wire0));
              reg73 <= $unsigned((7'h41));
              reg74 <= ($unsigned((~|(~&((8'ha5) ? reg70 : reg76)))) ?
                  $unsigned(reg67[(1'h1):(1'h0)]) : $unsigned({$signed(reg71[(3'h4):(1'h1)]),
                      {(reg72 >>> (8'hba)), $unsigned((7'h44))}}));
            end
        end
      reg80 <= (&reg75);
    end
  assign wire81 = $signed($signed(reg72[(4'h9):(4'h8)]));
  assign wire82 = ((((~&$unsigned(reg71)) < $signed(reg69)) ?
                      {($signed(reg80) ?
                              (!reg71) : {reg68,
                                  wire4})} : $signed((wire4[(2'h3):(1'h0)] ?
                          (+reg66) : {reg67, reg79}))) ^~ ($unsigned(((8'ha1) ?
                      reg78 : $signed(reg78))) == reg79[(2'h3):(1'h1)]));
  assign wire83 = wire1[(4'ha):(3'h5)];
  assign wire84 = ((-wire0[(3'h6):(1'h0)]) ? (+reg71) : $unsigned(wire0));
  assign wire85 = $signed(($signed((!(reg79 >> wire82))) ?
                      {reg72, wire84[(4'h8):(1'h1)]} : $unsigned(({wire83,
                          wire64} << (reg80 || reg79)))));
  assign wire86 = ((~&$signed(wire85[(4'hf):(4'hc)])) + (reg67[(2'h2):(1'h1)] != $unsigned((+(wire0 & wire1)))));
  always
    @(posedge clk) begin
      reg87 <= reg74[(4'hd):(3'h4)];
      reg88 <= wire3;
      reg89 <= reg75[(2'h2):(1'h1)];
    end
endmodule

module module5
#(parameter param63 = (~(((+{(8'hb9), (8'hbe)}) ^~ {((8'ha3) ? (7'h42) : (8'ha9))}) > (({(8'hbf), (8'ha6)} ^ ((8'ha0) ? (8'hb7) : (7'h43))) + ((7'h41) ? (^(8'hb7)) : ((8'hb4) ? (7'h42) : (8'haf)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire59;
  assign y = {wire62, wire61, wire41, wire11, wire10, wire59, (1'h0)};
  assign wire10 = wire7[(1'h1):(1'h0)];
  assign wire11 = (-(wire10[(1'h0):(1'h0)] & ((8'hbf) ?
                      (wire10 ?
                          (wire8 >= wire8) : (~&wire8)) : $unsigned((wire7 & wire9)))));
  module12 #() modinst42 (wire41, clk, wire11, wire8, wire7, wire10, wire6);
  module43 #() modinst60 (.clk(clk), .y(wire59), .wire44(wire6), .wire48(wire7), .wire45(wire10), .wire47(wire8), .wire46(wire11));
  assign wire61 = wire11[(4'hd):(1'h0)];
  assign wire62 = $signed(($unsigned($unsigned($unsigned(wire10))) ?
                      ($signed((8'hb3)) >>> (8'ha6)) : ($signed((8'ha7)) ?
                          (!(~|wire8)) : (^~wire9[(1'h0):(1'h0)]))));
endmodule

module module43
#(parameter param58 = ((~^{(~&((8'hb1) ^ (8'hbb)))}) | (^{(~|(|(8'hab)))})))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire47;
  input wire signed [(5'h12):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire50;
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire50,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= $signed((((((7'h43) < (8'ha9)) - $unsigned(wire47)) <<< $signed((wire48 <= (8'had)))) ?
          wire48[(2'h2):(1'h1)] : $signed($unsigned($unsigned(wire45)))));
    end
  assign wire50 = {(&wire48[(2'h2):(2'h2)])};
  always
    @(posedge clk) begin
      reg51 <= $signed($signed(($unsigned((wire47 <<< (7'h44))) << $unsigned((&wire45)))));
      if ({($unsigned($signed(reg49[(3'h4):(1'h1)])) ?
              $unsigned(wire44) : wire46[(4'hf):(4'hc)])})
        begin
          reg52 <= (((+($signed((8'haf)) ?
                  (|wire46) : wire44[(3'h7):(1'h0)])) < reg51) ?
              (~^{$signed($unsigned((8'ha3)))}) : wire47[(1'h0):(1'h0)]);
          reg53 <= $signed({(~|(wire45[(1'h0):(1'h0)] ?
                  wire50[(4'ha):(2'h2)] : $unsigned(wire46)))});
          reg54 <= wire48;
        end
      else
        begin
          reg52 <= (reg52 >>> ($signed((&$signed(wire44))) ? wire47 : reg53));
          reg53 <= (~$signed($signed($signed((wire47 - reg52)))));
          reg54 <= $signed(reg49[(3'h5):(2'h3)]);
        end
    end
  assign wire55 = (($unsigned((|wire50[(3'h5):(2'h3)])) ~^ $signed((^reg52))) >>> ($signed(wire48) ?
                      ((8'hb7) ?
                          reg54 : (-(wire44 & wire45))) : ((reg53[(1'h1):(1'h1)] == $signed((7'h40))) ?
                          (|wire47) : ($unsigned(wire47) ?
                              (reg49 ?
                                  wire47 : (8'hbf)) : wire44[(1'h0):(1'h0)]))));
  assign wire56 = ({reg49} ?
                      $signed({{{wire44}, (8'hae)},
                          $signed($signed(reg49))}) : ($unsigned((^reg49[(1'h0):(1'h0)])) ^ (~reg53[(3'h4):(2'h3)])));
  assign wire57 = $signed((!(^~reg54[(2'h3):(1'h1)])));
endmodule

module module12
#(parameter param39 = {(8'h9f), ((|(&((7'h41) ? (8'hab) : (8'hb6)))) ? (^(!((8'hbc) ? (8'hbc) : (8'hb2)))) : (~&(~|((8'ha8) ? (8'hac) : (8'hbc)))))}, 
parameter param40 = {((param39 >>> (!(^param39))) ^ {((+param39) ? (param39 ? param39 : param39) : (param39 ? param39 : param39))})})
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire35;
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire35,
                 reg36,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= ((wire17[(4'h9):(2'h3)] == wire17) ?
          $signed(wire15) : $unsigned(wire14[(3'h4):(3'h4)]));
      if (wire13)
        begin
          reg19 <= ((reg18[(1'h0):(1'h0)] ?
              ((wire15 ? (wire14 ? wire14 : wire16) : $unsigned((8'hbc))) ?
                  $unsigned((wire13 ?
                      wire17 : wire17)) : wire14) : $signed($unsigned((!(8'ha1))))) >= $unsigned((wire13 ?
              $signed((wire17 >> wire15)) : $signed((~wire15)))));
          reg20 <= {((^~$signed((~&wire13))) ~^ wire15)};
          if ((^$signed((reg18 ? (~reg19) : reg18[(3'h4):(1'h1)]))))
            begin
              reg21 <= ($unsigned((wire15[(3'h4):(1'h0)] >= $signed($unsigned(reg19)))) <= $signed(wire14[(3'h4):(1'h0)]));
            end
          else
            begin
              reg21 <= $signed({wire14});
              reg22 <= {(reg21[(3'h4):(1'h1)] - wire14[(2'h2):(2'h2)]),
                  $unsigned(wire13[(3'h6):(1'h1)])};
            end
          reg23 <= {$unsigned(wire16),
              $unsigned((!(reg21[(1'h1):(1'h0)] ^~ (8'h9e))))};
          reg24 <= wire13;
        end
      else
        begin
          reg19 <= (~&wire14);
        end
      reg25 <= $signed((+wire17[(4'hd):(4'h9)]));
      if ((~reg25))
        begin
          reg26 <= wire16[(4'h9):(1'h0)];
        end
      else
        begin
          reg26 <= wire15;
          reg27 <= $signed((($unsigned({wire16}) ?
              {reg21[(3'h7):(1'h1)],
                  reg21[(3'h4):(3'h4)]} : reg26) ^~ {(^~$unsigned(reg25))}));
          reg28 <= {$unsigned(reg26[(4'ha):(2'h3)])};
          if ({$signed(reg21), (reg23 << $unsigned(reg28[(3'h5):(3'h5)]))})
            begin
              reg29 <= (|((~&$unsigned((8'hbe))) ?
                  wire17[(3'h7):(3'h5)] : wire13[(4'ha):(2'h2)]));
              reg30 <= wire17;
              reg31 <= (reg21[(1'h0):(1'h0)] ?
                  reg30 : (wire13 < $unsigned(wire13)));
            end
          else
            begin
              reg29 <= $signed($unsigned(reg26[(4'h8):(3'h6)]));
              reg30 <= reg30;
              reg31 <= $unsigned($unsigned({$signed($unsigned(reg22)),
                  ((^~(8'hb6)) > {(8'hb3), reg31})}));
              reg32 <= (((((~&(8'ha2)) < $unsigned(reg25)) ?
                      (reg25[(4'hb):(3'h7)] ?
                          $signed(reg26) : reg29[(1'h1):(1'h0)]) : reg29) ?
                  ($unsigned(reg18[(2'h3):(1'h1)]) ?
                      ((~(8'h9e)) >>> reg30) : $signed((wire14 ?
                          reg31 : reg22))) : reg18) && $unsigned(({(!wire13)} >= (((8'ha9) ?
                      (8'ha9) : (8'ha8)) ?
                  $unsigned(wire13) : (reg27 ? reg24 : reg31)))));
            end
          reg33 <= wire14[(2'h2):(1'h1)];
        end
      reg34 <= reg21;
    end
  assign wire35 = reg20[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      reg36 <= reg28[(3'h4):(1'h1)];
    end
  assign wire37 = $signed((~|(^(reg20[(3'h5):(1'h1)] ?
                      {reg24} : $signed((8'hb1))))));
  assign wire38 = ($unsigned((reg29[(3'h4):(2'h3)] ?
                          reg31[(2'h3):(1'h1)] : ((wire14 == reg23) ?
                              reg30[(4'hb):(4'ha)] : (8'hb5)))) ?
                      (&((!reg22[(4'ha):(4'ha)]) >= $signed($signed(reg28)))) : $unsigned(reg32[(3'h5):(3'h4)]));
endmodule
