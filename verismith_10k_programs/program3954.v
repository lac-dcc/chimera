module top
#(parameter param52 = (^((~&{(~^(8'hbb)), ((8'ha4) ? (8'ha4) : (8'haa))}) - ({{(8'hb8)}} ? {((8'ha2) ? (8'ha4) : (8'ha6)), ((8'hbb) <<< (8'ha8))} : ((~&(8'hbd)) * {(8'hb1)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire41,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire4[(3'h7):(2'h3)] ? wire2 : $signed(wire4[(3'h6):(1'h1)]));
    end
  assign wire6 = ($signed(wire2[(1'h1):(1'h1)]) ^ $signed(({(-wire3)} ?
                     wire4[(3'h5):(2'h2)] : $signed((wire0 ? wire1 : wire1)))));
  assign wire7 = ($unsigned(wire3) == (~(~&wire3)));
  assign wire8 = wire1[(3'h4):(3'h4)];
  assign wire9 = wire2[(3'h5):(1'h0)];
  assign wire10 = ($signed(wire9[(4'hf):(3'h4)]) ?
                      $signed($signed((wire8 << reg5))) : wire7[(3'h5):(3'h5)]);
  assign wire11 = {{$unsigned($unsigned((8'hac))), wire1},
                      ((wire4 ?
                          wire2[(2'h3):(2'h2)] : $signed((wire0 ?
                              wire9 : (8'h9f)))) >> ($signed((wire10 ?
                          wire6 : wire8)) <= wire6[(2'h2):(1'h1)]))};
  assign wire12 = $signed(((~&$unsigned((^wire7))) == wire10));
  assign wire13 = reg5;
  module14 #() modinst42 (wire41, clk, reg5, wire3, wire0, wire4, wire9);
  always
    @(posedge clk) begin
      reg43 <= $signed((!(wire1 | {(+wire2), wire1[(3'h6):(2'h2)]})));
      reg44 <= $signed((+$unsigned(wire6)));
      reg45 <= wire1[(2'h2):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg46 <= wire11;
      reg47 <= reg46;
      reg48 <= $unsigned($signed((~^reg43[(3'h4):(1'h0)])));
    end
  assign wire49 = $signed(($unsigned((~|wire10[(3'h6):(1'h0)])) ?
                      $signed($signed(wire9[(4'he):(1'h0)])) : (({wire2} ?
                              {reg46} : $signed(wire1)) ?
                          $unsigned((wire12 ?
                              (8'hbb) : wire6)) : wire4[(4'h9):(4'h8)])));
  assign wire50 = (($signed($unsigned((~wire12))) >= $unsigned(wire11[(3'h5):(1'h0)])) ?
                      $signed($signed((-$signed(wire6)))) : $signed(wire11));
  assign wire51 = $unsigned(reg43[(4'ha):(2'h2)]);
endmodule

module module14
#(parameter param39 = ((~&({((7'h44) << (8'h9c))} ~^ ((|(8'hb3)) ? ((7'h40) ? (8'had) : (8'h9c)) : ((8'hb4) <<< (8'hbe))))) ? ((~&((&(7'h40)) ^ ((8'hb6) ? (7'h43) : (8'had)))) ? (~|{(^(8'hba)), ((8'hb3) <= (8'hbc))}) : (&(((8'hbc) ? (8'hab) : (8'ha5)) * ((8'hac) ? (8'hb2) : (8'ha8))))) : ({(~((7'h41) != (8'hbe))), ((~(8'hb8)) & ((8'ha3) <<< (7'h41)))} | (8'haa))), 
parameter param40 = ((param39 ? (~|param39) : ((8'ha6) ? param39 : (^(param39 & param39)))) ? (param39 != (+((param39 <<< param39) <<< (param39 ? param39 : param39)))) : (^~(param39 ? param39 : (~^(|param39))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire29,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire20 = (~&$unsigned(($unsigned((wire16 ?
                      wire18 : wire17)) ^~ $signed(wire16[(2'h2):(2'h2)]))));
  assign wire21 = $signed((7'h41));
  assign wire22 = ((|{(~&(wire20 == wire18)),
                      (^~$signed((7'h42)))}) <= (((+$unsigned((8'haf))) + $signed(wire21)) ?
                      ($unsigned((wire21 > wire18)) <= $signed((wire18 <= wire17))) : (((wire15 ~^ wire21) < wire21) ?
                          $unsigned((8'ha3)) : (wire15 ?
                              $unsigned((8'hbc)) : $unsigned(wire15)))));
  assign wire23 = $unsigned($signed(((((8'hb3) < wire19) ?
                      wire21[(3'h4):(1'h1)] : {(8'hb2)}) & (wire20 <= wire18))));
  always
    @(posedge clk) begin
      reg24 <= wire15[(5'h12):(4'hf)];
      reg25 <= $signed((~(|(~(!(8'ha9))))));
      reg26 <= (wire18 ?
          reg25[(1'h1):(1'h0)] : (((~(-wire15)) ?
                  wire18[(1'h1):(1'h1)] : $unsigned((wire17 ?
                      reg25 : (8'ha7)))) ?
              ($unsigned(wire15) ?
                  (wire15[(2'h2):(2'h2)] ?
                      (wire21 <<< wire16) : wire22) : wire22) : $unsigned((+$signed((7'h43))))));
    end
  assign wire27 = $unsigned(((wire22 ?
                          wire21[(2'h3):(2'h2)] : $unsigned((reg26 ~^ wire15))) ?
                      ({(wire21 || wire22)} ?
                          (~^(wire16 ?
                              reg25 : wire23)) : (~|$signed(reg24))) : ($signed((wire15 ?
                              wire20 : reg25)) ?
                          $unsigned((wire19 ?
                              wire18 : wire20)) : {$signed(wire19)})));
  assign wire28 = (^~{(8'ha6)});
  assign wire29 = reg26;
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire28)))
        begin
          reg30 <= ((((((7'h40) << (8'hac)) ? $signed(reg26) : wire27) ?
                      $unsigned($signed((8'hb3))) : $signed((8'h9d))) ?
                  {wire16[(4'he):(4'h9)],
                      {$signed(wire23),
                          (~^wire19)}} : $signed(wire20[(2'h2):(1'h0)])) ?
              $signed((wire16[(4'h9):(4'h9)] == {(wire22 - wire19),
                  wire22})) : (~^(reg26 ? $signed({reg24}) : (+{wire22}))));
          reg31 <= wire27;
          reg32 <= reg25[(1'h1):(1'h0)];
          reg33 <= (8'ha1);
          reg34 <= (reg31[(3'h4):(1'h1)] ?
              (!(^wire19)) : ((((wire19 && wire16) >>> $unsigned(reg25)) ?
                  {{wire29}} : $signed(wire29)) >> (((wire21 >> wire18) ?
                  reg26[(3'h4):(1'h1)] : {wire20,
                      wire20}) > wire18[(3'h5):(2'h2)])));
        end
      else
        begin
          reg30 <= $unsigned((8'hae));
          reg31 <= (~^($signed(($unsigned((8'hb3)) ?
                  reg34[(1'h1):(1'h1)] : wire21)) ?
              wire20 : $signed($unsigned(((8'hb5) ? wire21 : reg32)))));
        end
    end
  always
    @(posedge clk) begin
      reg35 <= (~|{$signed((wire22[(1'h1):(1'h0)] >= wire23[(4'h8):(2'h3)])),
          (reg31 ^ ((reg24 ? wire21 : wire16) ?
              (reg30 || wire20) : $signed(wire28)))});
    end
  assign wire36 = ({$unsigned($unsigned(wire17[(4'hb):(4'h8)]))} ?
                      (7'h40) : $unsigned((^~($signed(reg32) ?
                          $unsigned((8'hb1)) : reg26))));
  assign wire37 = ($unsigned({(&$unsigned(reg35)),
                          (~(reg35 ? wire27 : reg33))}) ?
                      wire29 : wire17[(3'h5):(3'h4)]);
  assign wire38 = (^$unsigned($signed($unsigned((wire28 && wire37)))));
endmodule
