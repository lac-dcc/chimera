module top
#(parameter param39 = (((({(7'h41)} ? ((8'hb0) < (8'hbf)) : {(8'h9d)}) ? (!((8'hb3) ? (8'hb7) : (8'h9c))) : (((8'haa) ? (8'hb5) : (7'h42)) && ((8'hb0) ? (8'ha8) : (8'had)))) ? ((((8'ha4) ? (8'ha6) : (8'had)) ? ((8'hae) ^~ (8'hb3)) : (8'hb7)) ? ((^(8'h9e)) ? (7'h42) : ((8'hb9) ? (8'hb2) : (8'hba))) : (-((8'ha7) ? (7'h42) : (8'had)))) : ((((8'hb9) ? (8'hb5) : (8'ha1)) ? ((8'hb2) ? (8'hae) : (8'hb6)) : ((8'h9c) ? (8'ha9) : (7'h41))) - (((8'hb1) ^ (8'ha0)) * ((8'had) <<< (8'h9f))))) ? (^~((((8'ha3) ? (8'hbb) : (8'haa)) - (^(8'h9f))) << ({(8'hbb), (8'h9f)} + (8'hbe)))) : ({(((8'hab) ? (8'hbb) : (8'hbb)) >>> {(8'hba)})} ? ((~&(-(8'ha4))) ? ({(7'h40), (8'hb8)} ^ ((8'h9f) ? (8'ha6) : (7'h44))) : (^~((7'h44) << (8'ha8)))) : ((7'h40) ? {(^(8'ha6)), ((7'h44) >>> (8'haf))} : (((8'hb7) ^ (8'haa)) ? ((7'h40) ? (8'hbb) : (8'ha3)) : ((8'hb3) >>> (8'hb3)))))), 
parameter param40 = ((((param39 ? param39 : (param39 ? param39 : param39)) ? param39 : ((param39 ? param39 : param39) > (param39 ? param39 : (8'hb5)))) ? {param39} : (8'ha0)) != ((((param39 ^ param39) && ((8'hac) < param39)) * param39) <<< (param39 ? (^~(8'hb9)) : {(param39 ? param39 : param39), (param39 ? param39 : (8'hb3))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire23,
                 wire22,
                 wire21,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg35,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = (-(wire3[(2'h3):(1'h0)] ?
                     ((wire0 ?
                         (^(8'h9f)) : (wire4 ?
                             (8'haa) : wire4)) || ((~^wire3) - (~(8'ha0)))) : (^((wire3 && wire2) >> wire3))));
  assign wire6 = $unsigned($signed(((!wire2[(2'h2):(1'h1)]) <= wire4)));
  assign wire7 = ((+$unsigned(wire4)) ?
                     wire2[(2'h3):(1'h0)] : $unsigned(wire4[(3'h6):(3'h5)]));
  assign wire8 = (8'ha5);
  assign wire9 = wire3;
  assign wire10 = (((|(8'h9f)) ?
                          wire1[(2'h2):(1'h0)] : $signed({$unsigned(wire5)})) ?
                      $unsigned((wire7[(1'h1):(1'h1)] ?
                          ({wire8} == wire1) : ((wire9 - wire9) << wire6[(2'h2):(1'h0)]))) : $unsigned(wire1));
  assign wire11 = $unsigned((((!(wire4 ? wire5 : wire2)) >>> $signed(((8'hb5) ?
                      wire3 : wire0))) * ($signed(wire9) ?
                      (wire1 ?
                          (wire1 | wire4) : (8'hba)) : wire1[(4'hb):(3'h4)])));
  assign wire12 = wire10[(1'h1):(1'h0)];
  assign wire13 = wire12;
  assign wire14 = $unsigned($unsigned(($signed(wire13) >>> wire13)));
  always
    @(posedge clk) begin
      reg15 <= ((wire10 ? $unsigned((8'h9c)) : (~&wire8[(2'h3):(1'h1)])) ?
          (wire14 ? $unsigned(wire13) : wire0) : ({((+wire10) ?
                  (8'hbb) : (wire5 ~^ wire2))} + ({wire5[(1'h0):(1'h0)]} ?
              $unsigned(wire5) : wire9)));
      reg16 <= wire10[(2'h2):(2'h2)];
      if ((&(~|$unsigned($signed((~^wire9))))))
        begin
          reg17 <= wire1;
          reg18 <= ((8'h9e) ? wire11 : (^~reg15[(2'h2):(1'h1)]));
        end
      else
        begin
          if (wire11)
            begin
              reg17 <= $unsigned(($signed($unsigned($signed(wire6))) ?
                  wire12 : $unsigned((&{(8'hb4)}))));
              reg18 <= ((~&(($signed(wire13) ?
                          ((8'hb9) ? wire14 : wire13) : (~|wire0)) ?
                      reg15[(3'h6):(2'h2)] : (+$signed((8'hbd))))) ?
                  (((~^(reg18 ? wire1 : wire1)) ?
                      $signed(wire2[(2'h3):(1'h1)]) : reg16) && wire0) : $signed($unsigned(wire10)));
            end
          else
            begin
              reg17 <= ($unsigned((~|(8'ha7))) ?
                  (8'h9d) : (reg15[(3'h6):(3'h6)] != $signed(wire5)));
              reg18 <= (reg17 ? wire12 : (7'h40));
              reg19 <= ($unsigned($signed(wire6)) & (^$unsigned(((wire4 <<< wire8) == wire1))));
            end
          reg20 <= (wire8[(1'h1):(1'h1)] ?
              ($unsigned({(wire11 >> wire6)}) ^ (-((wire8 ? (8'ha1) : reg15) ?
                  (~|wire7) : $signed(wire8)))) : $signed((+{(reg17 ?
                      wire10 : wire13),
                  reg19})));
        end
    end
  assign wire21 = (^~wire9[(2'h2):(1'h1)]);
  assign wire22 = (~((&{{wire0}}) + $unsigned($unsigned((~&wire8)))));
  assign wire23 = wire3[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if (reg19)
        begin
          reg24 <= ({($unsigned(wire13) & ($unsigned(wire11) - (|reg16))),
              (wire6 <= ($unsigned((8'ha9)) ?
                  reg16[(4'h9):(2'h2)] : reg16))} <= (wire9[(4'h9):(1'h0)] >>> ((wire10 ?
              (!reg16) : wire11) >= wire13)));
          if ((-$signed($signed({wire21}))))
            begin
              reg25 <= $signed($unsigned(({(&wire7),
                  (wire12 ? wire10 : wire12)} > wire3[(2'h2):(2'h2)])));
              reg26 <= wire12;
              reg27 <= wire13;
              reg28 <= $signed((($signed($unsigned((8'hbb))) >> wire9) ^~ (reg18 || (~wire12))));
            end
          else
            begin
              reg25 <= (&((~^(^wire13[(4'he):(3'h5)])) + reg18));
              reg26 <= (wire13[(3'h6):(3'h6)] != (-($signed(((8'hae) ?
                      wire23 : (8'ha5))) ?
                  $unsigned((~&wire11)) : wire22)));
              reg27 <= (8'hb7);
            end
        end
      else
        begin
          if ($signed((^reg25)))
            begin
              reg24 <= ((~^$signed((wire9 <<< {wire1,
                  reg24}))) ~^ {($signed((wire2 >> (8'ha3))) ?
                      $signed(wire4[(2'h2):(2'h2)]) : ($signed(wire0) > (reg20 ?
                          reg24 : reg15)))});
            end
          else
            begin
              reg24 <= wire8;
              reg25 <= (wire1 + $unsigned($unsigned($unsigned(reg26[(1'h0):(1'h0)]))));
              reg26 <= $signed(reg28[(4'hd):(2'h3)]);
              reg27 <= (-($unsigned($signed((^~reg19))) & $unsigned((^~$signed(wire10)))));
              reg28 <= wire10[(1'h1):(1'h0)];
            end
          if ({reg17[(3'h6):(2'h2)]})
            begin
              reg29 <= {$signed($signed(((reg20 ? wire13 : wire10) ?
                      {wire21, wire8} : (!wire3))))};
              reg30 <= $signed((~|$unsigned(reg28[(2'h3):(2'h3)])));
              reg31 <= reg26[(4'he):(4'h9)];
              reg32 <= reg26[(4'hf):(1'h1)];
            end
          else
            begin
              reg29 <= reg27;
              reg30 <= reg20[(2'h3):(2'h2)];
            end
          reg33 <= $signed(wire9);
          reg34 <= reg25[(3'h4):(2'h2)];
        end
      reg35 <= (^~(((~&(wire10 ? wire23 : (8'hae))) != (|{wire10, (8'ha3)})) ?
          (reg33 <= $unsigned($unsigned(wire23))) : (~^(~(wire23 + wire23)))));
    end
  assign wire36 = (reg25 + wire11[(4'h9):(1'h1)]);
  assign wire37 = $signed(($signed($signed($signed((8'haf)))) >> reg20));
  assign wire38 = ((~&reg25[(4'hb):(2'h3)]) ? (|reg17) : reg27[(2'h3):(1'h1)]);
endmodule
