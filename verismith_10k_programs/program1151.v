module top
#(parameter param43 = ((((&(!(8'hba))) << (^((8'ha4) ? (7'h44) : (8'ha0)))) & (~&(((8'hbf) ? (8'hbe) : (8'hb2)) ~^ (^~(8'hb1))))) >= (((~|((8'ha8) ? (8'ha9) : (8'hb9))) ? ((^(7'h44)) ? ((8'ha6) < (8'hb1)) : ((8'ha3) <<< (8'h9c))) : ({(8'h9c), (8'h9f)} ? ((8'ha5) ? (8'hbe) : (8'had)) : ((8'ha8) ? (7'h44) : (7'h42)))) ~^ ((~{(8'ha9)}) < ((-(8'hb8)) ? ((8'ha4) ? (8'hbe) : (7'h43)) : ((8'had) ? (8'ha5) : (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire4;
  assign y = {wire42, wire41, wire40, wire39, wire37, wire4, (1'h0)};
  assign wire4 = (wire0 ?
                     (wire3 ?
                         (&(wire3 ?
                             (wire0 >> wire0) : $unsigned(wire0))) : (wire3[(4'hb):(4'h9)] ?
                             wire0 : (-wire1[(1'h1):(1'h1)]))) : $signed((~^$unsigned(wire1))));
  module5 #() modinst38 (wire37, clk, wire2, wire1, wire4, wire3);
  assign wire39 = ((($unsigned((8'hae)) ? $signed($signed(wire0)) : wire37) ?
                          $unsigned($signed($unsigned(wire0))) : (($signed(wire0) ^ $unsigned(wire1)) >> {wire37,
                              $signed((8'h9d))})) ?
                      (wire2 ?
                          $signed($unsigned(wire1)) : wire0) : $unsigned(wire4));
  assign wire40 = (-({wire39[(3'h6):(1'h1)],
                      (wire4 ?
                          wire2 : $unsigned((8'hae)))} >> $unsigned($unsigned((~^(8'ha1))))));
  assign wire41 = wire40[(2'h2):(1'h1)];
  assign wire42 = wire2;
endmodule

module module5
#(parameter param35 = (((~^(((8'ha2) ? (8'ha3) : (8'h9d)) | ((8'hab) < (7'h43)))) ? (7'h40) : ((((8'ha8) ^~ (8'hac)) & ((8'ha2) ^~ (8'ha3))) != (((8'h9c) ^ (8'hbf)) ? (!(7'h44)) : {(8'hb6), (8'haf)}))) >>> ((8'hb4) | (~(~^{(8'h9e), (8'had)})))), 
parameter param36 = ((^~{(~^param35)}) ? ({{((8'hb8) ? (8'hb5) : param35)}, ((~&(8'hba)) & (param35 ? param35 : param35))} ? {((param35 ? param35 : param35) ? (-param35) : (~&param35)), ((8'hbb) && (param35 >= param35))} : ({(param35 ~^ param35), (param35 ? (8'ha7) : param35)} ? (^(param35 ? param35 : param35)) : ((+param35) ? (8'h9d) : (^(8'hb5))))) : (~param35)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire25;
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire25,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  module10 #() modinst26 (wire25, clk, wire6, wire7, wire9, wire8);
  assign wire27 = (((wire8 ?
                          {(wire8 ^ wire7),
                              {wire6}} : (-((8'hbb) >> wire9))) < ($signed($unsigned(wire7)) * wire6[(1'h0):(1'h0)])) ?
                      $signed((wire8[(4'he):(4'hb)] ?
                          (-{wire8}) : (wire7 ?
                              wire6 : {wire6}))) : (~&wire7[(2'h2):(1'h0)]));
  assign wire28 = {wire6};
  always
    @(posedge clk) begin
      if ($signed(wire25[(4'hb):(4'hb)]))
        begin
          reg29 <= {((-((wire27 ? wire27 : wire25) > $unsigned(wire27))) ?
                  $unsigned({wire7[(4'hb):(1'h1)],
                      (wire27 - (8'ha0))}) : wire25[(4'he):(4'h8)])};
          reg30 <= (8'hbd);
          reg31 <= $signed(wire25);
          reg32 <= (-wire7);
          reg33 <= wire27;
        end
      else
        begin
          reg29 <= ($unsigned(wire28) > (wire9 << (+wire9[(4'hd):(1'h1)])));
          reg30 <= wire6[(5'h13):(5'h10)];
          reg31 <= (&wire8[(4'hd):(4'h8)]);
        end
      reg34 <= ((((((8'hbb) ? wire28 : reg31) ~^ (-reg32)) ?
              wire7[(4'h9):(4'h8)] : wire28[(3'h4):(2'h2)]) || $unsigned(((wire8 || wire28) || $signed(wire6)))) ?
          $unsigned($unsigned($unsigned(reg31))) : (reg31 <<< ({$unsigned(wire27)} ?
              $signed(reg29[(2'h2):(1'h1)]) : ({reg30, reg33} ?
                  (~^wire8) : wire27))));
    end
endmodule

module module10
#(parameter param24 = ((!({{(8'hbc)}, ((8'hb5) ? (8'hbd) : (8'hb8))} ? (-{(8'hbb), (8'ha0)}) : {{(8'hb1), (8'h9e)}, (~(8'hbd))})) * ((((^~(8'hbf)) ? (^~(8'h9c)) : ((8'h9f) ? (8'hae) : (7'h44))) >>> (&(!(8'hab)))) ? (((8'hba) ? (8'hb6) : (!(8'hb8))) ? (((8'hb8) - (8'hb8)) ? ((8'hb7) ~^ (8'hb7)) : ((8'haf) ? (8'hbb) : (8'hbb))) : ((^(8'h9c)) ? ((8'hb8) && (7'h44)) : (~|(8'had)))) : (~(~&((8'ha5) + (8'hbc)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire15;
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire15,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = $signed((($unsigned((wire14 ^ wire12)) ?
                          $unsigned((wire13 ? wire13 : wire13)) : wire14) ?
                      wire11[(1'h1):(1'h0)] : ({wire12, {wire13, wire13}} ?
                          $signed((&(8'ha1))) : (((8'ha1) ?
                              wire11 : wire14) != ((8'hb0) ?
                              wire14 : wire14)))));
  always
    @(posedge clk) begin
      if ($signed((~|((~&(wire11 ? wire12 : (8'hab))) ~^ ((wire12 ?
          wire15 : wire15) && (wire15 ? wire14 : wire13))))))
        begin
          reg16 <= $unsigned((^~($unsigned($signed(wire11)) != (|(wire14 ?
              wire14 : wire11)))));
          reg17 <= $unsigned((-(wire14 ?
              wire13 : $unsigned($unsigned(wire12)))));
          reg18 <= $unsigned(((-(~(wire12 ^~ reg16))) != {wire12[(3'h4):(2'h3)]}));
          if ($signed({($signed((-wire11)) ~^ $signed($signed(wire13)))}))
            begin
              reg19 <= wire15;
              reg20 <= wire11;
            end
          else
            begin
              reg19 <= (wire14 <= {{$signed($signed(wire11)),
                      $signed((reg19 ^ wire15))},
                  wire15[(2'h3):(1'h0)]});
            end
          reg21 <= reg17;
        end
      else
        begin
          reg16 <= $unsigned({$unsigned(wire14[(4'hd):(4'ha)])});
          if (wire15)
            begin
              reg17 <= $unsigned(wire13);
            end
          else
            begin
              reg17 <= reg18[(2'h2):(1'h1)];
            end
          reg18 <= $unsigned(($signed(reg19) ?
              $unsigned($signed(wire11)) : $unsigned({{reg18}})));
        end
    end
  assign wire22 = {reg21,
                      ((((8'ha3) - (^wire15)) ?
                          $unsigned(((8'hb6) & reg18)) : (~{(8'hbf)})) >> (wire15[(3'h6):(1'h0)] == $unsigned(reg16[(4'hb):(3'h5)])))};
  assign wire23 = {$unsigned(reg16), reg17};
endmodule
