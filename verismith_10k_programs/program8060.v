module top
#(parameter param38 = ((&((((7'h40) ? (7'h40) : (8'hbc)) == (-(8'ha8))) ? ((~&(8'hb1)) - ((8'hae) >>> (8'ha6))) : (((7'h44) || (7'h43)) - ((8'h9c) < (8'ha9))))) ? ((((+(8'hb3)) ^~ ((8'hbd) & (7'h43))) ? (|(^(8'hb2))) : (^~((8'ha2) ? (8'hbb) : (8'h9e)))) - (((!(8'h9f)) != ((8'hba) > (8'hb7))) - (~|((8'ha8) ? (8'hbe) : (8'hbe))))) : {((^((8'hbb) ? (8'ha1) : (8'ha1))) ? ({(8'ha4), (7'h44)} ? (~&(7'h44)) : ((8'hb8) && (8'had))) : (((8'ha3) ? (8'hba) : (8'hbf)) ? ((8'haa) ? (8'ha5) : (8'haf)) : (&(7'h40))))}), 
parameter param39 = ((~|(~&((param38 * param38) ? (8'h9f) : param38))) ? ((((8'ha6) ? ((8'ha0) & param38) : {param38}) > ((8'ha2) <= param38)) ? param38 : ((param38 ? (+param38) : (-param38)) ? param38 : (~&param38))) : ((~(!(param38 + param38))) ? ({(param38 || param38), (8'h9f)} == {(param38 ? param38 : (8'hbf))}) : {(~(param38 <<< param38)), param38})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire26;
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  assign y = {wire28,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire26,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire5 = (~^wire2[(3'h4):(3'h4)]);
  assign wire6 = (+$unsigned(wire2[(1'h0):(1'h0)]));
  assign wire7 = $signed((wire4 ?
                     {(wire2 ?
                             wire4 : $unsigned(wire6))} : $signed($signed(wire4[(4'h9):(3'h6)]))));
  assign wire8 = ($unsigned($unsigned({(wire0 >> wire2), {wire7}})) ?
                     {{(~(wire0 >= wire4)), wire4[(2'h2):(2'h2)]},
                         wire4[(2'h2):(1'h1)]} : wire7);
  assign wire9 = (((((wire5 * wire6) ^~ wire3[(2'h2):(1'h0)]) ?
                             $unsigned(wire0) : {(~wire0)}) ?
                         (8'ha2) : ((!(wire2 ? wire1 : wire7)) ?
                             $signed((+wire1)) : (wire4 ^~ $signed(wire2)))) ?
                     {$signed(($unsigned(wire3) != (|wire3))),
                         (wire8 - $signed(wire4[(4'ha):(3'h5)]))} : (+wire4[(4'hd):(4'ha)]));
  module10 #() modinst27 (.wire11(wire0), .wire14(wire1), .wire15(wire9), .wire13(wire3), .clk(clk), .wire12(wire4), .y(wire26));
  assign wire28 = $unsigned($unsigned((wire7 ?
                      {$signed(wire0), wire3[(1'h0):(1'h0)]} : (8'hb6))));
  always
    @(posedge clk) begin
      reg29 <= (wire26[(1'h1):(1'h0)] ?
          (+(^((^~wire7) ?
              wire5[(1'h0):(1'h0)] : $unsigned(wire6)))) : $signed((^~wire1)));
      if ({$unsigned((^~$signed(((8'hac) << wire8)))),
          ($signed(($unsigned(wire28) ? (wire3 && wire0) : $unsigned(wire3))) ?
              (8'h9d) : wire7)})
        begin
          reg30 <= ((~wire8) ?
              wire9 : $unsigned($signed(wire26[(3'h7):(1'h0)])));
          if (wire5)
            begin
              reg31 <= {{((|$signed(wire26)) ?
                          (wire26 >= wire5[(4'hd):(4'hc)]) : (((8'hbb) ?
                                  (8'h9f) : wire26) ?
                              $unsigned(wire5) : (wire5 ? wire4 : wire3))),
                      $unsigned(({wire1, wire28} ?
                          (wire2 ? wire4 : (8'hae)) : wire3[(1'h1):(1'h1)]))}};
              reg32 <= wire1[(5'h11):(1'h0)];
              reg33 <= ($signed((|($unsigned(wire0) >> reg30))) ?
                  $signed($unsigned((&(wire8 > reg30)))) : (^(+(reg29 * (reg32 ?
                      wire5 : wire5)))));
              reg34 <= (^~$signed(wire9));
            end
          else
            begin
              reg31 <= ((~$unsigned($signed($unsigned(wire2)))) ?
                  $signed($signed((8'ha2))) : ($unsigned(wire4) ?
                      (^((wire9 ?
                          wire6 : wire1) & (8'hba))) : $unsigned(((wire2 ?
                          (8'had) : wire28) >>> (^wire3)))));
              reg32 <= (^$signed(wire9));
              reg33 <= (8'h9f);
              reg34 <= $signed(((($unsigned(wire1) != (wire9 && reg30)) >>> ((&wire2) << (wire8 ?
                      (8'hb9) : reg34))) ?
                  $unsigned(reg32[(2'h3):(2'h2)]) : $signed(wire28[(4'hc):(1'h1)])));
              reg35 <= ($unsigned(reg33[(4'hc):(3'h5)]) ?
                  wire8 : ($unsigned((~&wire7)) | (-$unsigned((reg29 ~^ wire2)))));
            end
        end
      else
        begin
          if (wire6[(1'h0):(1'h0)])
            begin
              reg30 <= reg33;
              reg31 <= (8'ha7);
              reg32 <= {wire28,
                  ({$unsigned((wire6 ? wire0 : (8'ha4))),
                      $unsigned(reg30)} >= (8'hab))};
              reg33 <= (~^wire5[(3'h4):(2'h2)]);
            end
          else
            begin
              reg30 <= ((({(8'hb6)} ?
                      (|wire8[(3'h5):(2'h2)]) : wire2) <<< $signed(((reg35 >= reg33) ?
                      (reg33 ? reg31 : reg31) : {(8'h9f)}))) ?
                  {(wire5 ~^ $signed($signed(wire2))),
                      (~(reg33 ?
                          (wire28 ?
                              reg32 : reg35) : wire8))} : $unsigned($unsigned(wire7)));
              reg31 <= wire2;
              reg32 <= reg34[(1'h1):(1'h0)];
              reg33 <= wire7[(3'h6):(1'h1)];
              reg34 <= wire0;
            end
          reg35 <= reg35;
          reg36 <= wire9;
          reg37 <= $unsigned(wire26[(1'h1):(1'h0)]);
        end
    end
endmodule

module module10
#(parameter param24 = ((((((8'hbe) ? (8'hbf) : (8'ha8)) ? ((8'hb5) ? (7'h40) : (8'hbb)) : (+(8'h9e))) ? ((^~(8'ha4)) ^~ (~&(8'had))) : (((8'hb6) ? (8'haa) : (8'hbb)) ? ((8'ha1) ? (8'ha8) : (8'hbe)) : (+(8'ha0)))) < ((~{(8'hbf), (8'hbe)}) & ({(8'hac), (8'ha0)} ? ((8'hbf) > (8'ha5)) : ((8'h9e) ? (8'haa) : (8'ha7))))) != (({((8'ha7) > (8'hb5))} || (~((8'hb2) > (8'had)))) * (^(((7'h41) ~^ (7'h43)) || (|(8'hac)))))), 
parameter param25 = (((|{(param24 ? param24 : param24)}) ? param24 : (^~param24)) ? ((^~(((8'hba) ^ param24) * ((8'hbd) && param24))) & (~&(&(+param24)))) : ((|(param24 & (param24 ? param24 : param24))) ? {(~|(&param24))} : (param24 != (param24 <= (^param24))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire21, wire20, reg23, reg22, reg19, reg18, reg17, reg16, (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= {(~|{$signed({(8'hb3)}), $unsigned($signed(wire15))})};
      reg17 <= wire11[(3'h7):(3'h7)];
    end
  always
    @(posedge clk) begin
      reg18 <= wire11;
      reg19 <= $unsigned({{($signed(wire14) ?
                  (reg16 || reg17) : {(8'hbc), reg18}),
              {$signed(wire14)}},
          reg17[(4'hc):(4'hc)]});
    end
  assign wire20 = ((({(reg17 ? wire12 : wire15)} > wire12[(3'h4):(1'h0)]) ?
                          (~((wire15 ? (8'ha9) : wire12) ?
                              (^~wire13) : $unsigned(reg18))) : wire12) ?
                      $signed(wire11[(3'h7):(3'h4)]) : {($unsigned($unsigned(reg17)) ?
                              ((&(7'h44)) != $signed(reg19)) : $unsigned($unsigned(wire15))),
                          (8'hb9)});
  assign wire21 = {$unsigned($unsigned(wire13))};
  always
    @(posedge clk) begin
      reg22 <= $signed($unsigned(wire11[(4'hc):(2'h3)]));
      reg23 <= (&(7'h43));
    end
endmodule
