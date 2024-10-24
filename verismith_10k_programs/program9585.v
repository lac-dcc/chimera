module top
#(parameter param135 = ((~^(+{{(8'had), (8'hbf)}, ((8'hb9) + (8'ha3))})) ? ((~&({(8'hbe), (8'haf)} + (^(8'hba)))) ? ((((7'h41) <<< (8'hbe)) ^ (^~(8'haa))) ? ({(8'h9e), (8'ha2)} <<< ((7'h40) ^ (8'h9c))) : ({(8'hb8), (8'h9c)} && (!(8'hba)))) : (((8'hb3) ? ((8'ha8) >= (8'hac)) : ((8'hbf) & (8'h9d))) ? {(~(7'h43))} : (((8'hbc) >> (8'hbb)) ? ((8'h9f) ? (8'hae) : (8'ha6)) : (+(8'hb6))))) : {((~|((8'h9c) ? (7'h44) : (8'ha8))) ^~ (((8'ha8) ? (8'haf) : (8'hac)) | ((8'hae) ? (8'hbc) : (8'ha0)))), (((~(8'hb3)) ? ((8'h9f) ^ (8'ha8)) : {(8'hb6)}) ? (~((8'ha1) ? (8'hbb) : (8'hb9))) : ((8'hbd) <<< ((7'h44) ? (8'hbe) : (8'hb2))))}), 
parameter param136 = ((((~^(param135 ? param135 : param135)) & ((^~param135) && (!param135))) != ({((8'ha1) ? param135 : param135), (!param135)} || ((&(7'h40)) < param135))) ? (~({param135, param135} >= (^(~^param135)))) : param135))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire133;
  assign y = {wire69,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire133,
                 (1'h0)};
  module4 #() modinst70 (.clk(clk), .wire7(wire1), .y(wire69), .wire8(wire3), .wire5(wire2), .wire6(wire0));
  assign wire71 = (|(|wire3));
  assign wire72 = (wire2 < (^~wire0[(5'h15):(3'h6)]));
  assign wire73 = ((~$signed($signed((wire1 != wire3)))) ?
                      $signed(wire69[(3'h7):(3'h4)]) : wire1[(4'ha):(4'h9)]);
  assign wire74 = $unsigned((wire1[(4'hb):(1'h1)] ?
                      ($unsigned((&(8'had))) ^~ wire2) : (^((wire71 + wire3) >= wire2[(4'h8):(1'h0)]))));
  assign wire75 = ($unsigned((((|wire2) != (wire71 ?
                          wire1 : wire2)) || ((wire72 * wire0) ?
                          ((8'hb5) & wire73) : wire1[(4'hb):(3'h6)]))) ?
                      (~^$unsigned(wire73[(3'h6):(2'h2)])) : (((-$unsigned(wire74)) || wire71[(1'h1):(1'h0)]) ?
                          wire73 : wire74[(1'h1):(1'h1)]));
  assign wire76 = wire69[(3'h6):(3'h5)];
  assign wire77 = $unsigned(((8'hbd) && $unsigned($unsigned({(8'hb3)}))));
  module78 #() modinst134 (wire133, clk, wire69, wire1, wire77, wire73, wire71);
endmodule

module module78  (y, clk, wire79, wire80, wire81, wire82, wire83);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire79;
  input wire [(4'hd):(1'h0)] wire80;
  input wire [(4'h8):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire82;
  input wire [(3'h5):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire112;
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  assign y = {wire84,
                 wire85,
                 wire112,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire84 = ($unsigned(wire82[(3'h4):(1'h1)]) ?
                      $signed(($signed($unsigned(wire82)) ?
                          wire81 : ((wire81 ? (7'h40) : wire79) ~^ (wire79 ?
                              wire80 : wire80)))) : $signed(wire82[(1'h0):(1'h0)]));
  assign wire85 = $signed(((-(|wire81[(1'h1):(1'h1)])) << wire81[(2'h3):(2'h2)]));
  module86 #() modinst113 (wire112, clk, wire84, wire83, wire80, wire79, wire85);
  always
    @(posedge clk) begin
      reg114 <= (^~wire81);
      reg115 <= (+$unsigned($unsigned((~^wire79[(4'hf):(1'h1)]))));
      reg116 <= ($unsigned(wire82[(2'h2):(1'h1)]) ?
          $signed($signed($unsigned(wire79[(5'h11):(3'h6)]))) : (^~($signed(wire79) >> (~^reg114[(4'hb):(1'h1)]))));
      if ((reg116 ?
          {$signed(($signed(wire85) || $unsigned((8'hbd)))),
              reg115[(4'h9):(3'h5)]} : ({(wire79 ?
                      wire81 : (reg115 ? wire112 : wire80))} ?
              wire112[(1'h1):(1'h1)] : $signed({$signed(wire80),
                  reg116[(1'h1):(1'h0)]}))))
        begin
          if ((~&(({reg115[(4'h8):(2'h2)], ((8'h9f) <= wire84)} - reg114) ?
              {(~|wire81), wire112} : $signed(($signed(reg114) >= wire82)))))
            begin
              reg117 <= $unsigned({($unsigned((reg114 != wire79)) ?
                      reg114[(4'hf):(4'hb)] : (-{reg115, reg115}))});
              reg118 <= $signed($unsigned($unsigned($signed((wire82 ?
                  reg114 : (7'h42))))));
              reg119 <= ((wire84 ?
                      (reg118[(3'h6):(3'h5)] & $unsigned({reg115,
                          (8'h9e)})) : (wire80 && {(&reg114),
                          (reg118 + wire84)})) ?
                  (wire85 ?
                      (reg118[(3'h5):(2'h2)] ?
                          reg115 : ($signed(reg118) ?
                              wire84[(4'h8):(3'h6)] : $signed(reg115))) : ((wire112 ?
                              {reg116} : (reg118 ? wire85 : wire79)) ?
                          reg116[(1'h1):(1'h1)] : reg118)) : wire85);
            end
          else
            begin
              reg117 <= (reg119[(3'h5):(1'h0)] <<< (((+$signed(wire81)) ?
                      ((+reg119) ?
                          $signed(reg117) : (reg119 - (8'hb6))) : ((~^wire83) != wire79[(5'h11):(3'h5)])) ?
                  ({reg115} + wire83) : $signed($signed((reg116 >> reg116)))));
              reg118 <= (8'hb4);
              reg119 <= ((({(!reg114)} ?
                  (((8'hbd) ? reg117 : wire81) ?
                      (reg117 ?
                          reg117 : wire81) : {wire84}) : reg116[(1'h1):(1'h0)]) + ($signed(reg114) >>> reg116)) <= reg117[(2'h3):(1'h0)]);
              reg120 <= wire80;
            end
          reg121 <= $unsigned(($unsigned(((^reg118) ?
                  $signed(wire83) : $unsigned(wire79))) ?
              $signed((+$signed((7'h42)))) : $unsigned((~^$unsigned(wire79)))));
          reg122 <= {((reg119 - (wire82[(2'h2):(1'h1)] & (|wire81))) ?
                  reg117[(1'h1):(1'h0)] : (reg121 ^~ reg119[(3'h5):(1'h0)])),
              wire84[(4'hd):(1'h1)]};
          reg123 <= (wire82[(2'h3):(1'h1)] ?
              reg118 : (($signed($signed(reg121)) ?
                      reg118[(3'h7):(3'h5)] : $signed((wire83 ?
                          wire79 : reg118))) ?
                  ((~&(-reg118)) | {(reg119 ? wire81 : reg118),
                      (wire80 ? reg118 : wire79)}) : reg114));
        end
      else
        begin
          reg117 <= (reg117[(1'h0):(1'h0)] && wire85[(1'h0):(1'h0)]);
        end
      reg124 <= $signed(wire83[(2'h3):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($signed(reg115[(1'h0):(1'h0)]))
        begin
          reg125 <= (&reg117);
          if ($unsigned((($signed(reg122) ?
              {wire81[(2'h3):(2'h2)]} : reg115) <<< (($unsigned(wire81) >= (reg121 ?
              (8'ha9) : (8'ha6))) == $unsigned(wire83[(3'h4):(1'h1)])))))
            begin
              reg126 <= ((($signed(wire80) ?
                  wire85 : ((reg122 ?
                      reg124 : reg121) <<< $signed(reg124))) & (~^wire81)) - wire112);
              reg127 <= wire82[(2'h3):(1'h0)];
              reg128 <= (+(~^((((7'h42) ? reg118 : wire82) <<< (reg126 ?
                  reg122 : (7'h41))) && {wire82, reg114[(4'hf):(4'he)]})));
            end
          else
            begin
              reg126 <= $unsigned(($signed((reg125[(3'h7):(2'h2)] ?
                      (reg123 ? reg125 : reg122) : $signed(reg128))) ?
                  (($unsigned(reg120) ?
                      $signed(wire83) : $unsigned(reg114)) && ($unsigned(wire83) & (+reg117))) : (~reg118[(2'h3):(2'h3)])));
              reg127 <= wire79[(5'h14):(4'ha)];
            end
          reg129 <= reg115[(2'h2):(1'h0)];
          reg130 <= $unsigned(($unsigned({(wire80 >>> reg122)}) < $signed({wire84[(1'h1):(1'h1)]})));
        end
      else
        begin
          reg125 <= (~&$unsigned($unsigned({$signed(wire81)})));
          reg126 <= ((^wire80[(4'h9):(2'h2)]) <<< ($signed({$unsigned(reg124),
              reg124[(4'h9):(1'h0)]}) & ($signed($unsigned(reg128)) ?
              $signed(reg116[(1'h0):(1'h0)]) : (8'hb6))));
          reg127 <= (reg128 ? {(&(reg123 ? (&reg114) : (&reg117)))} : reg129);
          reg128 <= ({(((&(8'hac)) * (reg130 ?
                  (8'hbb) : wire80)) ^~ $unsigned($unsigned((8'ha7))))} ^~ (reg128 ?
              (8'ha2) : {(8'ha0), (~^$unsigned(wire82))}));
        end
      reg131 <= $signed($signed((-({wire80, (7'h44)} ?
          reg117[(2'h3):(1'h0)] : $signed(wire85)))));
      reg132 <= $unsigned((8'hbb));
    end
endmodule

module module4
#(parameter param68 = (^~{({{(8'hb4)}, (+(8'ha3))} >= (((8'hb2) ? (8'h9f) : (8'hb9)) << ((8'hac) == (8'hbb))))}))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire5;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(2'h2):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire65;
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire67,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire31,
                 wire32,
                 wire33,
                 wire65,
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
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= $unsigned(wire6);
      reg10 <= (~&wire5[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg11 <= $unsigned((wire6 ~^ $unsigned(wire6)));
    end
  assign wire12 = $signed({$unsigned(reg11), reg11});
  assign wire13 = (wire12[(2'h2):(1'h0)] | wire5);
  assign wire14 = ({(8'ha7), (8'ha3)} ?
                      ($unsigned($unsigned(wire6[(2'h3):(2'h3)])) ?
                          wire12 : (wire7[(1'h0):(1'h0)] | {wire12})) : $signed((-(wire12 ?
                          (wire8 > reg10) : (|reg10)))));
  assign wire15 = reg11[(4'h9):(3'h5)];
  assign wire16 = wire13;
  assign wire17 = (!wire5[(2'h3):(1'h0)]);
  assign wire18 = {$unsigned(wire8[(3'h5):(3'h4)])};
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire14);
      if ($unsigned($unsigned((7'h41))))
        begin
          if ($signed({{$unsigned(wire7)}}))
            begin
              reg20 <= wire16[(5'h15):(5'h13)];
              reg21 <= ((wire5 ^~ (8'hb9)) + $unsigned((^($unsigned(reg10) ?
                  wire14 : (wire7 + wire7)))));
            end
          else
            begin
              reg20 <= (&wire13);
              reg21 <= $signed($unsigned(wire18[(5'h13):(3'h4)]));
              reg22 <= ((wire5 == wire17) ?
                  (reg9[(2'h2):(1'h0)] > ((8'haa) ?
                      ($signed(reg19) ^ reg10[(3'h5):(1'h1)]) : (+$unsigned(wire8)))) : (~^$signed((8'hbf))));
              reg23 <= (reg21[(3'h5):(3'h5)] ?
                  (^~($signed($unsigned(wire17)) >>> $unsigned((8'ha0)))) : $signed(wire13));
              reg24 <= wire14[(3'h4):(3'h4)];
            end
        end
      else
        begin
          reg20 <= {($unsigned((~|(^wire12))) - wire18[(3'h7):(3'h5)]),
              $unsigned($unsigned($signed((wire7 * wire15))))};
          reg21 <= reg9[(2'h3):(1'h0)];
          reg22 <= (^wire6);
          reg23 <= wire14[(4'h9):(4'h8)];
        end
    end
  always
    @(posedge clk) begin
      reg25 <= ($signed(reg24[(1'h0):(1'h0)]) << wire15);
      reg26 <= $unsigned(wire13[(4'he):(4'hc)]);
      if (reg25)
        begin
          reg27 <= $unsigned(($signed(wire14[(3'h6):(3'h4)]) != $signed($signed({wire6,
              wire12}))));
          reg28 <= {($unsigned($signed((&reg25))) ?
                  reg23[(3'h5):(2'h3)] : reg20)};
          reg29 <= (((!wire13) || (^(-(reg25 | (8'ha2))))) + reg22[(4'he):(1'h1)]);
          reg30 <= (reg19 ~^ $unsigned($signed((~(reg10 > wire17)))));
        end
      else
        begin
          reg27 <= (8'ha0);
        end
    end
  assign wire31 = $unsigned(reg10);
  assign wire32 = reg21;
  assign wire33 = ($signed($signed(reg30[(3'h7):(3'h7)])) ~^ $unsigned($unsigned((~^(wire7 ?
                      wire6 : (8'haa))))));
  module34 #() modinst66 (.y(wire65), .wire39(reg27), .wire37(wire18), .clk(clk), .wire36(wire6), .wire38(reg25), .wire35(wire8));
  assign wire67 = $signed({(!reg28)});
endmodule

module module34
#(parameter param64 = ((^((8'haf) ? (((8'ha6) ? (8'ha2) : (8'hb9)) ? (8'ha1) : (-(8'h9c))) : (!((7'h42) ^~ (8'ha0))))) ? {((+((8'hbd) ? (8'ha5) : (8'hbd))) ? (~&(+(8'hab))) : (((8'hb5) || (8'h9e)) ? ((8'h9d) ? (8'hb9) : (7'h41)) : (8'hb8)))} : (((|((8'haf) >= (7'h41))) ? (^(&(8'hab))) : (((8'hb4) ? (8'ha3) : (8'hb7)) == (8'ha9))) ^ (!(!((8'hae) && (8'hbb)))))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  input wire signed [(2'h3):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire40;
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire40,
                 reg58,
                 reg57,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire40 = $unsigned(($signed($unsigned(wire38[(2'h2):(2'h2)])) ?
                      $signed(($unsigned(wire36) >>> (~wire37))) : {wire37[(2'h2):(2'h2)],
                          wire35}));
  always
    @(posedge clk) begin
      if ($signed((+((~wire40) ?
          (wire39[(2'h2):(2'h2)] * wire36[(1'h0):(1'h0)]) : (~$unsigned(wire35))))))
        begin
          reg41 <= (wire38 >> ($unsigned(wire36[(1'h1):(1'h0)]) ?
              (($signed(wire39) ? $signed(wire37) : {wire38}) ?
                  (~((8'hb7) < (8'h9d))) : $unsigned($unsigned(wire39))) : $unsigned(wire40[(3'h4):(2'h3)])));
          reg42 <= (|(!(-({wire36, wire39} ?
              (wire36 <<< reg41) : (wire37 ? wire35 : wire40)))));
          reg43 <= (~^(wire40 ? wire39[(1'h0):(1'h0)] : (~&reg42)));
        end
      else
        begin
          if (({wire37, wire38} ?
              (-(((wire40 ? reg43 : wire39) ?
                      wire35[(3'h6):(1'h1)] : (wire36 ? wire39 : wire35)) ?
                  $signed(reg43[(4'h9):(3'h7)]) : wire38)) : $signed(wire36[(2'h3):(1'h0)])))
            begin
              reg41 <= wire39;
              reg42 <= (wire38[(1'h0):(1'h0)] ?
                  (+{reg43, wire37[(3'h4):(1'h1)]}) : (8'ha8));
              reg43 <= (8'hb7);
              reg44 <= wire36;
              reg45 <= wire38[(3'h5):(3'h5)];
            end
          else
            begin
              reg41 <= reg45;
              reg42 <= reg41[(2'h3):(1'h1)];
              reg43 <= {wire35};
              reg44 <= (+(reg44[(3'h4):(2'h3)] ?
                  ($unsigned(wire39) < $unsigned($unsigned(reg44))) : $signed($unsigned((^(8'ha1))))));
            end
          reg46 <= ((|$unsigned(((wire35 >>> reg41) <<< (wire40 & wire37)))) - (8'hb3));
        end
      reg47 <= $signed((reg45 && (wire38 - ($signed(wire40) || reg41[(4'hc):(1'h0)]))));
      reg48 <= wire37;
      reg49 <= $signed((wire40[(3'h4):(1'h1)] ? wire40 : wire36));
      reg50 <= $unsigned({(((^~(7'h42)) ?
              $unsigned(wire38) : wire35) ^~ wire38),
          wire40[(1'h0):(1'h0)]});
    end
  assign wire51 = {$unsigned(wire39[(1'h1):(1'h1)]),
                      {(reg43 ?
                              $unsigned((reg42 ?
                                  reg47 : wire35)) : (reg49[(2'h3):(1'h0)] >= wire39[(2'h2):(1'h0)]))}};
  assign wire52 = $unsigned(reg48[(2'h2):(1'h1)]);
  assign wire53 = (wire40 >> $signed((wire40 >= (|(reg42 ? wire39 : reg43)))));
  assign wire54 = (8'hb5);
  assign wire55 = $unsigned((wire54 ?
                      (|(~^wire51)) : $signed({{reg50, reg50}})));
  assign wire56 = ((~&(8'ha5)) ?
                      (~^reg47[(3'h6):(3'h6)]) : ((reg44 || $signed($signed(reg43))) < $signed(($unsigned(wire54) >> (!reg42)))));
  always
    @(posedge clk) begin
      if ({$signed(reg47), $signed(reg45[(1'h1):(1'h0)])})
        begin
          reg57 <= ((~(({reg41, reg42} + wire38) ?
              wire38 : {(wire55 ? wire40 : wire51),
                  (wire54 == reg43)})) ~^ (^wire35[(4'h9):(3'h4)]));
        end
      else
        begin
          reg57 <= $unsigned($signed($signed(($unsigned(wire53) & wire40[(3'h6):(3'h6)]))));
        end
      reg58 <= reg45[(1'h0):(1'h0)];
    end
  assign wire59 = ((+(~|$signed($unsigned(reg47)))) ^~ (^(reg57[(2'h2):(2'h2)] != reg44)));
  assign wire60 = wire56;
  assign wire61 = $signed($signed(((wire53[(3'h5):(3'h4)] ?
                      reg58[(3'h5):(3'h4)] : (wire52 >>> wire59)) != $unsigned(wire59))));
  assign wire62 = $unsigned(wire53);
  assign wire63 = (~^((|(8'ha7)) != $signed(((~^wire38) - (wire61 ?
                      reg58 : reg45)))));
endmodule

module module86
#(parameter param111 = (!(((~^((7'h41) ^~ (8'hbb))) ^ (+(8'h9f))) ? ((((8'hae) ? (8'ha3) : (8'ha0)) ? (~^(8'ha1)) : {(7'h43)}) ? ((~&(8'hbb)) > (-(8'h9d))) : {{(8'hbb), (7'h44)}, {(8'ha1)}}) : (({(7'h44)} ^~ (8'ha3)) ? (~((8'ha7) ? (8'hb9) : (8'h9e))) : ((!(8'hbe)) ? (7'h43) : ((7'h40) ? (8'h9d) : (8'hb1)))))))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire [(3'h5):(1'h0)] wire90;
  input wire [(2'h3):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  input wire [(2'h3):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg93,
                 reg92,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg92 <= wire87[(2'h2):(1'h0)];
      reg93 <= wire88[(4'h9):(3'h7)];
    end
  assign wire94 = wire87[(1'h0):(1'h0)];
  assign wire95 = wire89;
  assign wire96 = reg93;
  assign wire97 = {$unsigned(reg92)};
  assign wire98 = (~&wire88);
  assign wire99 = (!({{wire88[(2'h3):(1'h0)]},
                      ((wire90 - reg92) | (wire96 != reg93))} || $signed(((wire87 ?
                          wire98 : (8'h9d)) ?
                      {wire98} : wire96[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg100 <= ((wire97[(3'h5):(1'h0)] ?
          (8'hb2) : $signed($unsigned((wire87 ?
              wire96 : reg92)))) <= $signed($unsigned(({(8'h9d)} ?
          (reg93 ? wire88 : wire99) : (~wire90)))));
      reg101 <= $unsigned($unsigned(wire96[(3'h7):(3'h7)]));
      if ($unsigned(($signed((~&$signed(wire99))) ?
          ($unsigned((wire97 << wire89)) > ($unsigned(wire90) ?
              wire98[(4'hd):(3'h5)] : reg101[(4'hf):(4'ha)])) : wire87[(2'h3):(2'h2)])))
        begin
          if ($signed($unsigned((~|((reg101 ?
              wire97 : wire96) << wire95[(2'h2):(1'h1)])))))
            begin
              reg102 <= wire94[(2'h3):(1'h0)];
              reg103 <= (wire89 ?
                  ((($unsigned(wire88) > $signed(wire98)) >>> $signed((~^wire96))) >= $unsigned(wire87[(1'h1):(1'h1)])) : ($signed(wire99[(1'h0):(1'h0)]) ?
                      {($signed(wire90) ?
                              wire98 : $signed(wire97))} : (({wire98, wire95} ?
                              wire88[(1'h0):(1'h0)] : $signed(wire90)) ?
                          $signed((wire94 || reg100)) : ((wire97 <<< wire99) ?
                              wire94[(1'h0):(1'h0)] : (8'hb7)))));
              reg104 <= (~&wire87);
              reg105 <= $signed($unsigned(wire96[(3'h7):(1'h0)]));
            end
          else
            begin
              reg102 <= wire96;
              reg103 <= ((wire97[(1'h1):(1'h1)] > ({(wire91 ?
                          reg100 : wire91)} ~^ $unsigned(wire87))) ?
                  wire88 : reg100[(2'h2):(2'h2)]);
              reg104 <= {((reg104[(5'h11):(4'h8)] < {$unsigned(wire87)}) & (!(wire98[(4'h8):(2'h2)] - ((8'hb0) ^~ (8'hbe))))),
                  ($signed($signed(wire99)) != (~^$signed({reg100})))};
            end
          reg106 <= (~|reg93);
          reg107 <= {$unsigned(reg103[(1'h1):(1'h0)])};
        end
      else
        begin
          reg102 <= reg103[(1'h0):(1'h0)];
          reg103 <= ({(|(wire99 << (~reg102))),
              (reg103 - wire88)} >= (~wire95));
          reg104 <= wire95;
          reg105 <= (~wire97);
          reg106 <= (($signed(reg93[(4'hb):(3'h4)]) == (~|$signed(reg106))) ?
              wire88 : ((reg93[(4'hb):(3'h5)] ?
                      ((wire96 ? wire99 : reg93) ?
                          wire99[(2'h2):(2'h2)] : $unsigned(reg106)) : (~^reg93[(2'h3):(1'h1)])) ?
                  reg103[(2'h3):(2'h2)] : ($unsigned({wire96}) ~^ ($unsigned(wire99) ?
                      wire90[(2'h2):(1'h0)] : (wire89 ? (8'hb6) : (8'ha3))))));
        end
    end
  assign wire108 = $unsigned(($unsigned(wire96) && wire96[(3'h5):(3'h4)]));
  assign wire109 = reg93;
  assign wire110 = (((8'hb3) ?
                           $unsigned({wire94}) : $unsigned($signed($unsigned(reg100)))) ?
                       $unsigned(($signed(reg107) ?
                           $unsigned($unsigned((8'hb7))) : reg100)) : $signed((reg102 || (wire95 - $signed(wire108)))));
endmodule
