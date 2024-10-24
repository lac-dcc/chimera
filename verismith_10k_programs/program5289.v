module top
#(parameter param76 = {(8'h9c)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire66;
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire75,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3[(2'h2):(2'h2)];
    end
  module6 #() modinst67 (wire66, clk, reg5, wire0, wire1, wire4, wire3);
  assign wire68 = (wire3 ?
                      {((reg5 ?
                              (wire66 > wire0) : (^~wire1)) < $unsigned($unsigned(wire66))),
                          ({wire66} <<< (-$unsigned(wire4)))} : reg5[(2'h3):(1'h1)]);
  assign wire69 = wire0;
  assign wire70 = $signed((8'haf));
  always
    @(posedge clk) begin
      reg71 <= $signed($unsigned({wire0[(3'h6):(3'h5)],
          wire70[(1'h1):(1'h1)]}));
      reg72 <= (&(|wire4[(4'hc):(4'hc)]));
      reg73 <= $signed($unsigned($unsigned(((wire4 ?
          wire3 : wire2) <<< ((7'h42) != wire0)))));
      reg74 <= {wire2};
    end
  assign wire75 = (^(wire2 ?
                      reg74[(2'h3):(2'h2)] : {wire1,
                          {(wire1 <<< (8'ha7)), {wire70, reg72}}}));
endmodule

module module6
#(parameter param64 = (~|(~((-((8'hb4) ? (8'hb3) : (8'h9c))) * ((8'hba) ? (^(8'ha8)) : (|(8'ha3)))))), 
parameter param65 = ((8'hbc) ? param64 : (param64 & ((8'hb5) ? ((param64 != param64) ? (8'hbd) : param64) : ({param64, param64} ? param64 : (^param64))))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire62;
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  assign y = {wire23,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire36,
                 wire62,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  module12 #() modinst24 (wire23, clk, wire10, wire11, wire8, wire7);
  assign wire25 = $unsigned($unsigned($unsigned(wire7)));
  assign wire26 = (~|(8'hb0));
  assign wire27 = $signed({wire25[(1'h0):(1'h0)], (&(-wire9[(3'h5):(3'h4)]))});
  assign wire28 = (wire26 ^ ($unsigned(($unsigned((7'h41)) ?
                          wire26 : {wire7})) ?
                      ({wire23[(4'hf):(4'ha)]} <<< (^(|(8'haf)))) : $unsigned(wire10[(3'h6):(1'h0)])));
  assign wire29 = wire7;
  assign wire30 = wire23[(3'h5):(2'h2)];
  assign wire31 = (^~wire23);
  assign wire32 = (~|($unsigned((^(-(8'ha0)))) <<< wire29[(4'ha):(1'h1)]));
  always
    @(posedge clk) begin
      reg33 <= $signed(({{wire27},
          ((wire25 >= (8'hb4)) ?
              wire11 : wire30[(1'h1):(1'h1)])} == (~&wire28)));
      reg34 <= (~((wire30[(1'h1):(1'h0)] == $unsigned($unsigned(wire28))) ?
          $signed(wire30[(4'h8):(1'h1)]) : (8'hbf)));
      reg35 <= $signed($signed((({wire29} ?
          (wire23 & wire11) : (!wire10)) - $unsigned((+wire29)))));
    end
  assign wire36 = (~&$unsigned((|wire31[(3'h7):(1'h1)])));
  module37 #() modinst63 (.y(wire62), .wire41(wire36), .wire40(wire7), .wire42(wire27), .clk(clk), .wire38(wire9), .wire39(wire28));
endmodule

module module37
#(parameter param61 = ((!(|(((8'ha6) ? (7'h44) : (8'ha3)) + {(8'hb9)}))) ~^ ((^(((8'hbc) ? (7'h43) : (8'had)) ? ((8'haf) ? (8'hb5) : (8'hb1)) : ((8'hbc) ? (8'hab) : (8'h9d)))) ^~ ((((8'hbb) ? (8'hb6) : (8'haf)) ? ((8'ha1) ? (7'h40) : (8'hb1)) : {(8'hbf)}) >>> {((7'h43) ? (8'hbb) : (8'ha6))}))))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire [(4'he):(1'h0)] wire40;
  input wire [(4'h9):(1'h0)] wire39;
  input wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= $signed(((~$unsigned(((8'ha3) ? wire38 : wire42))) ?
          wire39[(1'h1):(1'h1)] : wire40));
      reg44 <= $unsigned((~|$unsigned(((~&wire42) != reg43))));
      if (({$signed((wire40 ? (reg43 | (8'ha1)) : $signed(wire41))),
              wire38[(2'h2):(1'h1)]} ?
          ((($unsigned(reg43) ? wire38 : ((8'ha6) * (8'hba))) ?
              ((|reg44) || reg44) : $signed(wire40[(4'he):(4'ha)])) + $signed(wire39)) : (&$signed($signed($unsigned(reg44))))))
        begin
          if ((8'ha1))
            begin
              reg45 <= $unsigned($unsigned($unsigned(wire41)));
              reg46 <= $signed($unsigned(($signed($signed(wire39)) ?
                  wire38 : wire39)));
            end
          else
            begin
              reg45 <= $signed(((|reg43[(2'h3):(1'h0)]) < wire39));
              reg46 <= (|((&wire39[(1'h1):(1'h0)]) || $signed(wire42)));
              reg47 <= ($signed(wire39) ?
                  $signed($unsigned($signed((reg44 + reg43)))) : reg43[(2'h2):(2'h2)]);
              reg48 <= ((8'hac) ^~ $unsigned($signed($signed((wire39 <<< wire38)))));
              reg49 <= reg43[(2'h3):(1'h0)];
            end
          reg50 <= (~($unsigned((reg44 ~^ (!reg47))) ~^ $signed(((8'ha4) <= reg44[(1'h0):(1'h0)]))));
          if (reg49)
            begin
              reg51 <= reg45[(2'h3):(2'h3)];
            end
          else
            begin
              reg51 <= wire39[(3'h7):(3'h4)];
              reg52 <= {reg49[(3'h5):(1'h0)]};
              reg53 <= (wire38[(3'h4):(2'h3)] > (((~^(+reg48)) || (+reg51)) + reg44));
            end
          reg54 <= ({{$unsigned((reg45 && reg50)),
                      $unsigned((wire41 + (7'h42)))},
                  ((^reg46) > reg52)} ?
              $unsigned(wire38[(1'h0):(1'h0)]) : $signed($signed($unsigned(reg48[(1'h0):(1'h0)]))));
          reg55 <= (8'ha8);
        end
      else
        begin
          reg45 <= {$unsigned({wire38[(3'h4):(2'h3)]}), wire42};
          reg46 <= wire39;
          reg47 <= reg48;
        end
      reg56 <= reg45;
    end
  assign wire57 = $unsigned((((reg53[(3'h6):(3'h4)] ?
                          reg48[(1'h1):(1'h1)] : $unsigned(wire38)) ?
                      reg56[(5'h12):(4'he)] : $unsigned($unsigned(reg47))) ^~ reg43));
  assign wire58 = reg52;
  assign wire59 = $unsigned({$signed((((8'ha1) - (8'hb0)) < (reg45 ^ reg54))),
                      $signed(wire57[(2'h2):(2'h2)])});
  assign wire60 = (wire41 >>> (^wire59[(1'h0):(1'h0)]));
endmodule

module module12
#(parameter param21 = (^((~((-(8'hac)) ? ((8'hbe) ? (8'ha1) : (8'hb2)) : (~^(8'hb9)))) < ((&((8'ha1) ? (8'ha6) : (8'ha7))) <<< (((8'ha2) > (8'hb0)) ? ((8'hb0) + (8'hb6)) : (&(8'ha8)))))), 
parameter param22 = (param21 && (-(+param21))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h14):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  assign y = {wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = $signed(wire15[(4'h9):(1'h1)]);
  assign wire18 = $unsigned(((wire14 ?
                          $unsigned((wire15 ?
                              wire16 : wire16)) : $unsigned(wire15[(4'hf):(4'hd)])) ?
                      (8'hbe) : (|wire16[(1'h1):(1'h1)])));
  assign wire19 = ((+({$unsigned(wire15), (wire13 ? wire17 : wire16)} ?
                      {wire14} : (wire13[(3'h7):(1'h0)] << (wire15 ?
                          (8'h9d) : wire15)))) <= wire18[(2'h2):(1'h0)]);
  assign wire20 = ($unsigned(($unsigned($signed((8'ha0))) - wire19)) ?
                      $signed(((+$signed(wire13)) < (wire18 >> (|wire13)))) : (({$unsigned(wire15),
                              wire14} * $unsigned(wire19)) ?
                          {(^~wire17), wire16} : wire13));
endmodule
