module top
#(parameter param22 = {((8'hb6) <= ((((8'hb7) ? (8'hac) : (8'hb7)) ? ((8'hbc) * (8'hbd)) : {(8'hb2), (8'ha4)}) && {((8'h9f) ? (8'hb1) : (8'h9e))})), ({((~(8'had)) ^~ {(8'hb8)}), {((8'hb8) ? (8'hb6) : (8'ha7)), (+(8'hb6))}} + ((((7'h44) ? (8'hb6) : (8'ha8)) ? ((8'hbc) >> (8'hac)) : ((8'hbf) ? (8'h9e) : (8'hb8))) && {((8'hb4) ? (7'h42) : (8'hb1))}))}, 
parameter param23 = ((8'h9e) ? param22 : param22))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire6,
                 wire5,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed((~^wire1)) ? $signed(wire1) : wire0);
    end
  assign wire5 = ((~&$unsigned($signed($signed(wire0)))) ^~ (((wire3[(3'h4):(1'h1)] - {wire1,
                     reg4}) ^~ ((8'haa) ?
                     $unsigned(wire0) : (wire1 <<< (8'hbb)))) >= $unsigned(((+wire2) ?
                     $signed(wire3) : $signed(wire2)))));
  assign wire6 = reg4[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if (wire6[(2'h3):(1'h1)])
        begin
          if (({{((wire0 <= wire5) >= (-wire0)),
                  ({wire0} ? ((8'haa) ~^ (8'hab)) : ((8'h9f) ? reg4 : wire1))},
              $signed((wire0 || wire3))} <<< (^({{wire1}} ?
              wire1[(4'h9):(3'h7)] : wire1[(1'h0):(1'h0)]))))
            begin
              reg7 <= wire0;
              reg8 <= $signed(((($signed(wire3) ?
                  (wire5 ?
                      wire2 : (8'hbf)) : $signed(wire6)) ^ reg4) > (|(|(reg4 - wire2)))));
              reg9 <= reg7;
              reg10 <= $signed($unsigned(((^~$signed(reg4)) ?
                  $signed((^~wire1)) : ($unsigned(reg9) - wire2))));
            end
          else
            begin
              reg7 <= ($signed((~((reg8 ? wire5 : wire2) <= (reg4 ?
                  wire3 : reg8)))) < ($signed(reg8) << {$signed((-wire1)),
                  $unsigned(wire6)}));
              reg8 <= (7'h44);
              reg9 <= (8'h9c);
            end
          if ((^$unsigned({wire0[(4'h9):(2'h2)], wire2[(2'h3):(2'h3)]})))
            begin
              reg11 <= $signed($unsigned((reg7 ?
                  $signed(reg8[(4'hc):(4'hc)]) : reg4)));
              reg12 <= (($signed((8'hbc)) ?
                      reg10 : (~&$unsigned($unsigned(reg4)))) ?
                  $signed((~^({(8'hb9), (8'h9e)} ?
                      (reg9 ^ wire0) : reg9))) : $signed((~^wire5[(3'h4):(1'h1)])));
              reg13 <= $unsigned(((^$unsigned($signed(reg4))) ?
                  reg8[(2'h3):(2'h2)] : (((wire5 != wire6) ^~ (reg12 ?
                      reg11 : reg8)) > wire5[(3'h4):(3'h4)])));
              reg14 <= ({(8'ha1),
                      ($signed($unsigned((8'hae))) ?
                          $signed((wire5 ?
                              (8'ha9) : wire3)) : (&(reg11 || reg8)))} ?
                  (~wire3[(3'h4):(2'h3)]) : (wire0 ?
                      $unsigned((+reg13[(4'hb):(3'h6)])) : (((-reg9) ?
                          (+reg13) : reg9) <<< ($signed((8'h9f)) ?
                          (wire6 ? (8'hb3) : wire3) : $unsigned((8'ha6))))));
            end
          else
            begin
              reg11 <= $unsigned({({$unsigned((8'hb8)), wire6[(2'h2):(1'h1)]} ?
                      $signed($unsigned(wire5)) : reg13[(4'hc):(4'ha)]),
                  reg8[(1'h1):(1'h1)]});
              reg12 <= reg8[(4'hd):(4'ha)];
              reg13 <= $signed(reg12);
              reg14 <= (reg4[(3'h7):(3'h4)] ?
                  ((7'h42) ?
                      reg8[(3'h5):(3'h5)] : ($unsigned((reg8 | reg7)) ?
                          ($signed(reg13) <= (reg11 ^ wire2)) : $signed($signed(reg9)))) : wire3[(1'h1):(1'h0)]);
              reg15 <= ((+(&(~&(reg13 && reg4)))) & $signed($signed($signed({wire5}))));
            end
          reg16 <= $signed(wire6);
        end
      else
        begin
          reg7 <= ($unsigned(reg16) && $signed({((8'hb9) << reg10[(5'h10):(2'h3)]),
              reg14[(4'h9):(4'h8)]}));
        end
      reg17 <= $unsigned((^~$signed($unsigned((reg12 ? reg9 : wire2)))));
      reg18 <= wire1;
    end
  assign wire19 = ($signed($unsigned($signed($unsigned(reg4)))) ?
                      (((reg7 ?
                          (reg11 ?
                              reg12 : wire3) : $unsigned(reg15)) >> reg13[(2'h3):(2'h3)]) ^ (&wire6)) : (reg13[(1'h0):(1'h0)] ?
                          (8'hae) : $signed(wire6[(4'h8):(2'h2)])));
  assign wire20 = {($signed((reg16 ?
                          $signed(reg17) : reg8[(4'hd):(3'h4)])) ^ wire19),
                      $unsigned(reg13[(4'ha):(3'h6)])};
  assign wire21 = (8'haf);
endmodule
