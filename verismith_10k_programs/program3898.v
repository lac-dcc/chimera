module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire43;
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire45,
                 wire5,
                 wire6,
                 wire7,
                 wire43,
                 reg56,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire5 = $signed((~&wire1));
  assign wire6 = (wire2 ?
                     $signed({{wire1, wire0[(3'h5):(1'h0)]},
                         $signed((wire0 + (8'hb1)))}) : $signed(wire1[(3'h7):(1'h0)]));
  assign wire7 = $signed(wire6[(2'h3):(1'h1)]);
  module8 #() modinst44 (wire43, clk, wire4, wire7, wire0, wire3, wire5);
  assign wire45 = ((wire0 != $unsigned(wire1)) || wire0[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg46 <= wire5[(3'h6):(3'h4)];
      if (wire2[(5'h11):(3'h5)])
        begin
          reg47 <= $signed((~|((|$unsigned(wire7)) * reg46)));
        end
      else
        begin
          reg47 <= wire2;
          if ($signed((wire0 << {$signed($unsigned(wire4))})))
            begin
              reg48 <= {$signed($signed($signed((wire4 ? (7'h41) : reg47)))),
                  wire2[(1'h0):(1'h0)]};
              reg49 <= $unsigned(wire43);
              reg50 <= $signed({$unsigned(reg46[(3'h6):(3'h5)]), wire0});
              reg51 <= ($unsigned(reg46) < wire43);
              reg52 <= ((($unsigned(reg50) ?
                          $signed((wire4 ?
                              (8'hbc) : wire4)) : (wire6[(3'h5):(3'h5)] ?
                              reg48 : ((7'h44) ~^ wire7))) ?
                      (~&($signed((7'h40)) < reg46[(3'h7):(1'h1)])) : $signed(wire6)) ?
                  (!(~&(|$unsigned((8'hb0))))) : wire7[(1'h0):(1'h0)]);
            end
          else
            begin
              reg48 <= (wire45 <<< (((8'ha0) ?
                  ($unsigned(reg52) ?
                      wire3[(2'h3):(1'h0)] : (&(8'hb7))) : (wire3 ?
                      $signed(wire6) : $unsigned(wire0))) && $signed(wire7[(4'h8):(3'h6)])));
              reg49 <= $unsigned((((~&(reg48 > wire0)) >> ($unsigned(wire6) || (wire43 ?
                      wire4 : wire43))) ?
                  (reg49[(1'h0):(1'h0)] < reg52[(1'h1):(1'h0)]) : reg49[(2'h3):(2'h2)]));
              reg50 <= (~wire0[(3'h5):(2'h2)]);
            end
          reg53 <= wire0;
        end
    end
  assign wire54 = ({$unsigned((~|{wire3}))} ?
                      (($unsigned((wire1 <= wire2)) ?
                          {(+(8'hb5))} : wire4[(2'h3):(1'h0)]) >= (8'ha1)) : $signed(wire4[(3'h4):(3'h4)]));
  assign wire55 = (((+wire2) ? reg48 : $unsigned($unsigned(wire43))) ?
                      wire2[(4'ha):(3'h5)] : (((reg46[(4'h8):(3'h6)] && $unsigned(reg46)) ?
                          $signed(wire4) : $signed(wire45)) > $unsigned((8'hbe))));
  always
    @(posedge clk) begin
      reg56 <= $unsigned(reg52[(2'h2):(1'h1)]);
    end
endmodule

module module8
#(parameter param41 = ((|(({(8'ha6), (8'ha2)} + ((8'hb9) ~^ (8'hb4))) ^ (8'hbb))) >>> ((8'hb9) ? (~&{(^~(8'h9d)), ((8'hba) ~^ (8'haf))}) : ((^(+(8'h9c))) | ({(8'hb4), (8'h9c)} ? (~^(8'hb2)) : {(8'hbe), (8'hab)})))), 
parameter param42 = ((param41 ? (|(8'hb3)) : (((~^param41) ? (^~param41) : (8'hb1)) ? ((param41 - param41) | (param41 ? param41 : param41)) : param41)) ? ((param41 ? (&param41) : (param41 + (param41 > param41))) ? (((param41 >>> param41) ? (^~param41) : param41) ? (^{param41, (8'hb8)}) : ((!param41) >= param41)) : (param41 ? ((!(8'ha2)) ? {param41} : param41) : ((&param41) | {param41}))) : (~&(param41 << ((8'ha7) <= param41)))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= ($unsigned(($signed($signed((8'h9c))) > ((~wire12) ?
          $unsigned(wire13) : wire12))) & $signed($signed($unsigned(wire10[(3'h7):(1'h0)]))));
      if ($unsigned(wire12))
        begin
          reg15 <= $signed($signed(({$unsigned(wire13),
              $unsigned(wire13)} ~^ $signed({reg14, wire11}))));
          reg16 <= wire10;
          reg17 <= wire12;
          reg18 <= $signed({($unsigned(reg15[(4'hf):(2'h3)]) >> (&{(8'haf)})),
              wire13});
          reg19 <= reg14;
        end
      else
        begin
          reg15 <= ((!reg17[(4'h9):(4'h9)]) ?
              ($unsigned($unsigned(wire12)) + ($unsigned(reg15) ~^ reg19[(3'h6):(1'h0)])) : {$unsigned($signed((wire13 < (8'h9c))))});
          reg16 <= $unsigned({$unsigned($unsigned($signed((8'hbb)))),
              (($unsigned((8'haa)) ? wire13 : $unsigned(wire12)) * wire9)});
        end
      if (((~|reg15[(5'h15):(3'h7)]) >= (wire11[(5'h10):(3'h7)] ?
          ($unsigned((wire13 ? (7'h43) : (8'hb0))) > ($unsigned(wire10) ?
              (reg16 ^ wire9) : (wire11 ?
                  wire13 : wire9))) : (|reg18[(4'h8):(2'h2)]))))
        begin
          reg20 <= $unsigned($signed((~($unsigned(reg18) <= (wire10 + reg18)))));
          reg21 <= wire12;
          if (reg18[(2'h2):(1'h1)])
            begin
              reg22 <= reg19;
              reg23 <= ((+(8'ha6)) == reg22[(1'h0):(1'h0)]);
              reg24 <= (((^((wire11 + reg14) ^ (wire11 & reg18))) ?
                      {(-$signed((7'h41)))} : (($signed((8'ha3)) >>> wire9[(2'h2):(1'h1)]) ?
                          $signed(reg23[(4'hd):(3'h7)]) : ((reg19 ?
                              wire10 : reg23) ^~ wire11[(4'hf):(3'h4)]))) ?
                  (8'hbd) : reg21[(4'h8):(4'h8)]);
              reg25 <= $unsigned($unsigned((({(8'hb2)} ?
                  (reg18 >= reg19) : (reg15 ? (8'hac) : wire11)) >= ((reg16 ?
                  reg19 : wire13) || (~&(8'ha8))))));
              reg26 <= (7'h40);
            end
          else
            begin
              reg22 <= {$signed(((^~(reg22 + reg17)) ?
                      (reg16 >>> {wire12, reg17}) : reg19[(3'h4):(2'h3)])),
                  $signed($unsigned(reg24[(3'h6):(3'h6)]))};
              reg23 <= (!$signed(($unsigned((+wire9)) ?
                  ($unsigned((8'hb0)) < $unsigned(wire12)) : ($unsigned((8'hb0)) ?
                      $unsigned(reg20) : reg15[(5'h11):(1'h0)]))));
              reg24 <= $unsigned($signed({(8'ha8)}));
              reg25 <= (8'hae);
            end
        end
      else
        begin
          reg20 <= (((^~(((7'h41) ? reg17 : wire9) ?
              $signed(reg15) : (~&wire12))) << (~&reg14[(4'hd):(1'h1)])) <= ((reg20 ~^ {reg20[(3'h6):(2'h2)]}) ^ ($unsigned(reg16[(1'h1):(1'h1)]) == (+(reg15 ?
              reg14 : wire13)))));
          reg21 <= $signed($unsigned(reg16[(1'h0):(1'h0)]));
        end
      reg27 <= $signed((^~$unsigned($signed($unsigned((8'hb3))))));
      reg28 <= $signed((~&((^wire9[(3'h7):(3'h7)]) != $signed($signed((8'h9d))))));
    end
  assign wire29 = wire9;
  assign wire30 = $signed((^reg21[(5'h10):(4'h8)]));
  assign wire31 = $unsigned($signed($unsigned((reg15[(4'h8):(2'h3)] >= {wire12}))));
  assign wire32 = (wire10[(3'h7):(3'h4)] ?
                      ((+(!((7'h43) & reg28))) ?
                          (reg26 >= reg27) : reg26[(4'ha):(1'h0)]) : reg26);
  assign wire33 = {wire12[(2'h3):(1'h0)],
                      $unsigned($signed(wire10[(3'h6):(2'h3)]))};
  assign wire34 = {($unsigned(((^wire29) ?
                          ((8'ha3) >> reg23) : $signed(reg28))) > (wire30[(1'h1):(1'h0)] >= wire33)),
                      $unsigned(reg16[(1'h1):(1'h1)])};
  always
    @(posedge clk) begin
      reg35 <= (reg15 ?
          ((|reg20[(3'h5):(2'h2)]) ?
              ((~$unsigned(wire31)) != {(reg14 * (8'ha8)),
                  $signed(wire10)}) : ($signed(((8'haf) ?
                  reg18 : reg22)) ~^ {(wire13 ? reg21 : reg24)})) : wire29);
      reg36 <= ({reg28} ? $signed(reg35[(3'h7):(1'h0)]) : (8'hba));
      reg37 <= (8'had);
    end
  always
    @(posedge clk) begin
      reg38 <= wire31[(2'h3):(2'h2)];
    end
  assign wire39 = wire30[(5'h10):(4'h8)];
  assign wire40 = (reg25[(2'h2):(2'h2)] <<< (^~({reg15[(4'hf):(3'h7)]} & reg22)));
endmodule
