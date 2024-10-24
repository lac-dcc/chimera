module top
#(parameter param153 = (!((!(((8'ha4) == (8'ha3)) | ((8'hb3) ? (8'hb3) : (8'h9e)))) ? {(((8'ha9) && (7'h44)) ? {(8'ha4), (8'hac)} : ((8'had) ? (8'ha8) : (7'h44)))} : {{{(8'hb5)}, ((7'h44) ? (8'had) : (8'hae))}, ((-(8'h9c)) >> ((8'ha5) ? (8'hb8) : (8'hbf)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire148;
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire5,
                 wire6,
                 wire7,
                 wire148,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire5 = ((^~$signed((8'hbf))) * {(wire0 ~^ wire1)});
  assign wire6 = wire1[(1'h0):(1'h0)];
  assign wire7 = (~^((($unsigned(wire6) ?
                     $signed(wire5) : (wire4 ^ wire2)) <<< $unsigned(wire0)) || {$signed($unsigned(wire1))}));
  always
    @(posedge clk) begin
      reg8 <= $signed(($unsigned($unsigned(wire3[(1'h1):(1'h1)])) ?
          {$unsigned(wire2[(4'hd):(3'h4)]), wire4} : (!wire5[(5'h13):(4'hc)])));
      if (wire6[(2'h3):(2'h2)])
        begin
          reg9 <= {((wire2[(3'h4):(1'h1)] ?
                      ({wire6, wire4} > $signed(reg8)) : $unsigned((wire1 ?
                          reg8 : wire2))) ?
                  (~|(|(~^reg8))) : wire5),
              $unsigned($signed(({wire4} ?
                  (wire2 & wire0) : ((8'haa) ? (8'ha2) : wire5))))};
          reg10 <= wire3;
        end
      else
        begin
          if ((((reg8[(1'h1):(1'h1)] != (~reg10[(1'h0):(1'h0)])) ?
              {reg8, wire1[(2'h3):(1'h0)]} : ($unsigned($signed(wire1)) ?
                  ((wire7 ? wire4 : wire7) ?
                      wire2[(3'h7):(1'h1)] : (wire3 == wire6)) : ((wire3 ?
                      reg8 : wire0) < {wire4}))) ~^ (wire4 == {(&(wire5 ?
                  wire6 : reg10))})))
            begin
              reg9 <= {{(reg8 * {(wire0 && reg10), $unsigned(wire7)}),
                      (&(~$unsigned(wire1)))},
                  (~|$signed(wire1))};
              reg10 <= wire4;
            end
          else
            begin
              reg9 <= $unsigned(wire3[(1'h0):(1'h0)]);
              reg10 <= {wire0[(3'h6):(3'h4)]};
              reg11 <= ({$unsigned($signed((8'hb5))),
                      $unsigned((((8'hac) ? reg9 : wire0) ?
                          wire3[(2'h3):(2'h2)] : {(8'hb9)}))} ?
                  wire0[(3'h5):(2'h3)] : (-(reg9[(3'h7):(2'h2)] >> wire4)));
              reg12 <= reg10;
            end
        end
      reg13 <= reg9;
      reg14 <= {reg13};
    end
  module15 #() modinst149 (.y(wire148), .wire19(wire0), .wire18(reg9), .wire16(reg14), .wire17(reg12), .clk(clk));
  assign wire150 = (~{($signed((-reg12)) ?
                           (-(reg13 ? wire5 : reg12)) : wire1[(2'h2):(1'h0)])});
  assign wire151 = (($unsigned($unsigned(wire3)) + $signed(((reg12 ?
                       (8'hb6) : wire3) >= $signed(reg10)))) >= ((wire3[(1'h1):(1'h1)] >>> (((8'h9f) > wire1) ?
                           (~^reg10) : (~&wire3))) ?
                       $signed((~|wire6[(3'h6):(2'h2)])) : reg12));
  assign wire152 = wire148;
endmodule

module module15
#(parameter param146 = (~^((&(+((7'h40) ? (7'h44) : (8'hb7)))) == ((|{(8'ha9)}) ? (((8'ha5) ~^ (8'ha6)) != {(8'hb1), (8'ha3)}) : (~|(+(8'hbf)))))), 
parameter param147 = param146)
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire143;
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  assign y = {wire145,
                 wire99,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire78,
                 wire69,
                 wire68,
                 wire60,
                 wire143,
                 reg87,
                 reg81,
                 reg80,
                 reg79,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  module20 #() modinst61 (.wire22(wire19), .wire23(wire18), .wire24(wire16), .wire25(wire17), .y(wire60), .clk(clk), .wire21((8'hb7)));
  always
    @(posedge clk) begin
      reg62 <= wire17;
      reg63 <= (($signed((wire19 ? wire16 : $unsigned(reg62))) ?
              $signed(wire18) : ((|(reg62 ? wire17 : wire60)) ?
                  ({wire19, wire60} ?
                      $unsigned((8'hb5)) : reg62[(4'h9):(1'h1)]) : {(wire18 - wire18)})) ?
          ($signed((wire17[(3'h4):(3'h4)] ?
              {wire18} : $unsigned(wire16))) >>> wire17[(4'hb):(1'h0)]) : ($signed($signed(((8'ha9) ?
              reg62 : wire60))) < $signed(reg62[(4'hd):(4'hd)])));
      reg64 <= reg62[(4'hb):(1'h0)];
      reg65 <= (-((wire19 < (wire17 >> wire19)) ~^ wire19[(2'h3):(2'h3)]));
      if (reg62)
        begin
          reg66 <= (-$signed(reg64));
          reg67 <= (~&reg63[(1'h1):(1'h0)]);
        end
      else
        begin
          reg66 <= reg66;
          reg67 <= reg63;
        end
    end
  assign wire68 = $signed(reg62[(4'hf):(3'h7)]);
  assign wire69 = (^~reg64);
  always
    @(posedge clk) begin
      reg70 <= reg63;
      reg71 <= (~|($signed(wire69) ?
          wire18[(4'hf):(4'h8)] : {$unsigned((reg62 ? wire68 : wire16))}));
      if (wire69[(2'h3):(2'h2)])
        begin
          reg72 <= wire69[(3'h4):(1'h1)];
          reg73 <= reg70[(4'h8):(2'h2)];
          if ((reg71[(1'h1):(1'h1)] ?
              $signed((((reg70 ? reg72 : reg65) ~^ reg64) ?
                  (8'ha0) : ((reg63 != wire19) ?
                      (wire18 ? reg73 : wire18) : $signed((8'ha3))))) : wire60))
            begin
              reg74 <= (&reg65);
              reg75 <= $unsigned({(+(~reg72[(2'h2):(1'h1)])), (!wire18)});
            end
          else
            begin
              reg74 <= (~|wire17[(1'h1):(1'h1)]);
              reg75 <= reg73[(3'h6):(3'h6)];
              reg76 <= (~|$unsigned((!((wire18 ? wire16 : (7'h44)) <<< (reg65 ?
                  reg63 : reg67)))));
            end
        end
      else
        begin
          reg72 <= {$signed($unsigned($signed({reg64, reg70}))),
              $unsigned(reg70[(2'h3):(1'h0)])};
          reg73 <= (reg76 ?
              (^~(((8'ha9) ?
                  $unsigned((8'hb5)) : (reg70 ? reg70 : reg73)) ^~ ((8'hae) ?
                  $signed(reg72) : $unsigned(reg73)))) : $unsigned(reg67));
          reg74 <= $unsigned((|reg70[(2'h2):(1'h1)]));
          reg75 <= reg70[(2'h3):(1'h0)];
        end
      reg77 <= (8'ha2);
    end
  assign wire78 = (($signed($unsigned((~^reg73))) && $unsigned(({reg64,
                          reg73} * (reg71 ^ reg62)))) ?
                      (7'h40) : (~^(8'ha9)));
  always
    @(posedge clk) begin
      reg79 <= wire68[(1'h1):(1'h0)];
      reg80 <= $unsigned(reg73[(4'h9):(3'h6)]);
      reg81 <= wire78;
    end
  assign wire82 = ($unsigned({{wire68, reg76[(1'h0):(1'h0)]},
                      ((wire69 + (8'hbb)) | (reg62 ^~ reg74))}) & {reg75[(3'h4):(2'h3)],
                      reg79[(4'hd):(4'hb)]});
  assign wire83 = (((reg64[(5'h10):(2'h3)] ?
                          $signed($unsigned(reg67)) : reg65) < ((reg66[(1'h1):(1'h0)] ?
                          (&reg65) : $signed(reg70)) && {(~^reg77)})) ?
                      (~({reg67} || $signed(wire78[(3'h5):(3'h5)]))) : $signed($unsigned(reg66[(1'h1):(1'h0)])));
  assign wire84 = {(~|$unsigned(reg81[(2'h2):(1'h0)])),
                      (~(reg81 ? (~|{wire82}) : reg75))};
  assign wire85 = ($signed(({(reg72 >> reg63)} << reg72[(4'h9):(3'h5)])) >>> reg63);
  assign wire86 = $signed((&(8'ha8)));
  always
    @(posedge clk) begin
      reg87 <= ($unsigned((wire17 ? reg75 : wire69)) ?
          ($unsigned((~^$signed(reg75))) ?
              reg63[(1'h1):(1'h0)] : (reg73[(2'h3):(1'h0)] ?
                  reg63[(1'h0):(1'h0)] : $unsigned($signed(wire86)))) : $signed(($unsigned((8'hab)) ?
              (~^(~^wire82)) : (~|{(7'h43), wire86}))));
    end
  module88 #() modinst100 (.y(wire99), .wire90(wire85), .wire92(wire83), .wire91(reg81), .wire93(reg76), .wire89(wire69), .clk(clk));
  module101 #() modinst144 (.clk(clk), .wire104(reg76), .wire103(reg77), .y(wire143), .wire106(wire78), .wire105(reg79), .wire102(reg80));
  assign wire145 = (reg62[(2'h2):(2'h2)] >> (-wire78[(2'h2):(2'h2)]));
endmodule

module module101
#(parameter param142 = (&((|(((8'ha2) ? (8'ha1) : (8'hbf)) | ((8'hb7) ? (8'hb0) : (8'hb6)))) ? (((~(8'haf)) >>> ((8'hac) ? (8'haa) : (8'hba))) ? ((~^(8'hab)) ? ((8'ha4) >>> (8'hb6)) : ((8'hb3) ? (8'ha7) : (8'hb0))) : (((8'hb3) || (8'haf)) ~^ ((8'hb5) == (8'ha8)))) : ((+((8'hb0) ^ (8'hb9))) ? ({(8'hb5), (8'ha6)} ? {(8'h9c), (8'hb8)} : (|(8'ha2))) : (~&((8'ha4) + (8'hbf)))))))
(y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire106;
  input wire [(5'h14):(1'h0)] wire105;
  input wire [(3'h6):(1'h0)] wire104;
  input wire [(4'he):(1'h0)] wire103;
  input wire [(4'h9):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire137;
  wire [(5'h12):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire107;
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire133,
                 wire109,
                 wire108,
                 wire107,
                 reg136,
                 reg135,
                 reg134,
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
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire107 = (wire105 ?
                       (wire104 ?
                           wire106 : (wire104[(3'h5):(2'h3)] << {wire103[(4'h8):(3'h4)]})) : wire106[(3'h4):(2'h3)]);
  assign wire108 = wire104;
  assign wire109 = $unsigned($signed(wire104[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg110 <= (&$signed($unsigned(wire103)));
      if ((^{$signed({(reg110 ? (8'hb7) : wire109), $unsigned(wire108)}),
          wire108[(4'h8):(2'h3)]}))
        begin
          reg111 <= (!wire102);
          reg112 <= ((8'ha3) <<< wire105);
          if ((wire108 ?
              wire104[(3'h5):(1'h0)] : $signed(reg110[(1'h0):(1'h0)])))
            begin
              reg113 <= wire106;
              reg114 <= (+reg110);
              reg115 <= reg113[(4'ha):(3'h6)];
              reg116 <= wire103[(4'he):(2'h3)];
            end
          else
            begin
              reg113 <= wire106;
              reg114 <= ((reg112[(1'h0):(1'h0)] && ((~&reg111[(2'h3):(1'h0)]) >> (wire106[(1'h1):(1'h0)] != $signed(reg114)))) ?
                  $signed($signed(reg116[(3'h4):(2'h2)])) : (8'had));
              reg115 <= reg115;
              reg116 <= (|wire102[(1'h0):(1'h0)]);
              reg117 <= (8'hb1);
            end
          if ((reg114 ?
              wire108 : (-($unsigned((^~wire106)) >> wire104[(3'h5):(1'h0)]))))
            begin
              reg118 <= $signed($unsigned({$unsigned((reg110 ?
                      reg111 : reg117))}));
              reg119 <= reg114;
              reg120 <= ((-$unsigned(reg112)) ? reg117 : wire105);
            end
          else
            begin
              reg118 <= (^(^~{(wire102 ? (wire108 + wire106) : reg111),
                  (~&reg115[(4'hd):(3'h4)])}));
              reg119 <= reg120[(2'h3):(1'h0)];
              reg120 <= (reg113[(3'h4):(2'h2)] * reg111[(2'h2):(2'h2)]);
              reg121 <= wire107;
              reg122 <= $signed((({$unsigned(wire108),
                  (^~reg111)} | reg115) ^~ wire102[(3'h6):(2'h2)]));
            end
          reg123 <= $unsigned(reg115);
        end
      else
        begin
          if ((~^(reg113 + reg116[(2'h3):(2'h2)])))
            begin
              reg111 <= reg121;
              reg112 <= {$unsigned((-(reg123 << wire104))),
                  $signed((reg123[(2'h2):(2'h2)] ?
                      ((wire104 >> wire109) ?
                          {reg121, reg120} : wire106) : ((reg111 ?
                              (8'had) : reg120) ?
                          $unsigned(reg111) : $signed(reg123))))};
              reg113 <= $unsigned(((!reg121[(4'h8):(3'h5)]) < (~&($unsigned(reg114) & reg117[(2'h3):(2'h3)]))));
              reg114 <= ((~&reg113[(4'hc):(1'h0)]) < $unsigned({wire103,
                  $unsigned(wire102)}));
            end
          else
            begin
              reg111 <= ($signed((($unsigned(reg119) ?
                  (7'h40) : (~&reg118)) ~^ wire108[(4'h9):(1'h0)])) <<< ($unsigned(reg119[(4'ha):(3'h5)]) != (reg120 ?
                  reg112 : (reg112 ? (^~(8'hb1)) : wire105))));
              reg112 <= (($signed($unsigned((!reg117))) == ($signed((&wire104)) * (~reg110))) || $signed((^~reg116[(1'h0):(1'h0)])));
            end
          reg115 <= wire109[(3'h6):(3'h6)];
        end
      if (reg110[(1'h0):(1'h0)])
        begin
          reg124 <= ($signed((($signed(reg120) ?
                  reg115[(3'h5):(2'h3)] : $signed((8'ha3))) ?
              $unsigned($signed(reg116)) : (^~(reg112 << reg122)))) ~^ (~^$signed($unsigned((reg111 >> (8'ha7))))));
          reg125 <= $unsigned(reg116[(1'h1):(1'h1)]);
        end
      else
        begin
          reg124 <= $unsigned(reg115);
          reg125 <= (&reg112);
          if (({$unsigned(wire107[(2'h3):(1'h0)]),
                  {(~&reg117),
                      ($unsigned(reg123) ?
                          reg123[(2'h2):(1'h1)] : (wire109 ?
                              wire107 : (8'ha8)))}} ?
              $signed(wire104[(3'h4):(2'h2)]) : ((|$signed((wire106 + wire107))) != $unsigned(reg110[(3'h5):(1'h0)]))))
            begin
              reg126 <= wire103;
              reg127 <= $signed((^~((~$signed(reg115)) ^ $unsigned((reg123 && reg126)))));
              reg128 <= (~wire109[(4'hd):(3'h7)]);
              reg129 <= reg124[(3'h7):(2'h2)];
              reg130 <= (~|reg111);
            end
          else
            begin
              reg126 <= reg124[(4'hf):(4'hc)];
              reg127 <= $unsigned((8'hac));
            end
          reg131 <= $signed(((^~wire106[(1'h1):(1'h1)]) ?
              {(~&(reg118 ^ wire102)),
                  $unsigned(reg115)} : (!(((8'ha7) != (8'hb8)) ^~ (reg117 ?
                  reg128 : (8'hb6))))));
          reg132 <= $signed($unsigned(reg128));
        end
    end
  assign wire133 = reg111;
  always
    @(posedge clk) begin
      if ((-(reg115 ?
          reg126[(1'h1):(1'h0)] : (reg115 & $signed((reg120 & reg120))))))
        begin
          reg134 <= (reg115 ?
              wire109 : ($unsigned(((wire103 ?
                      reg111 : (7'h40)) + reg127[(3'h5):(1'h1)])) ?
                  $unsigned(($unsigned(reg112) * reg117)) : $signed({$signed((8'hac)),
                      $unsigned(reg112)})));
        end
      else
        begin
          reg134 <= $unsigned($signed({reg115[(3'h7):(3'h5)],
              {$unsigned(reg130)}}));
          reg135 <= $unsigned($signed(reg118[(1'h1):(1'h0)]));
        end
      reg136 <= $signed((^~wire105));
    end
  assign wire137 = $unsigned((wire103[(4'hb):(1'h0)] >>> ((((8'ha1) ^ reg126) << wire108[(1'h1):(1'h1)]) >= $signed((reg127 ?
                       reg113 : reg135)))));
  assign wire138 = ($signed($signed(wire108)) < ((^~((reg113 << wire104) > (wire107 > (8'ha3)))) ?
                       reg116[(1'h1):(1'h1)] : $unsigned(reg121[(4'h9):(2'h3)])));
  assign wire139 = reg116;
  assign wire140 = $unsigned(reg122);
  assign wire141 = (~^wire137);
endmodule

module module88
#(parameter param98 = (~|({((~|(8'ha1)) <= ((8'hba) ^~ (8'hb2))), (((8'haf) ? (8'hbd) : (8'ha6)) - ((8'ha3) ? (8'hb0) : (8'hae)))} != {{(^(8'h9d)), (^(8'hbb))}, ({(8'ha8), (8'hb0)} ? (-(8'hbf)) : {(8'hb7), (8'h9e)})})))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire93;
  input wire [(5'h14):(1'h0)] wire92;
  input wire [(3'h7):(1'h0)] wire91;
  input wire [(5'h13):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  reg signed [(4'h8):(1'h0)] reg97 = (1'h0);
  assign y = {wire96, wire95, wire94, reg97, (1'h0)};
  assign wire94 = $unsigned($unsigned(wire89));
  assign wire95 = (wire92[(4'hd):(3'h5)] * $unsigned($unsigned((!wire91))));
  assign wire96 = ((8'hb2) || wire95[(3'h7):(3'h7)]);
  always
    @(posedge clk) begin
      reg97 <= ($unsigned((wire94 << wire92)) ?
          (((wire95[(2'h2):(1'h1)] >= (wire91 ? wire95 : (8'haa))) ?
              wire92[(3'h6):(3'h6)] : $signed($unsigned((7'h43)))) <<< {$unsigned(wire91[(3'h4):(1'h0)]),
              wire93}) : wire90);
    end
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  assign y = {wire59,
                 wire28,
                 wire27,
                 wire26,
                 reg58,
                 reg57,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
  assign wire26 = $unsigned($signed({wire22[(4'h9):(3'h6)]}));
  assign wire27 = (wire23 ?
                      wire23[(4'h8):(1'h1)] : {$signed(wire23[(2'h2):(2'h2)])});
  assign wire28 = $unsigned((wire25[(4'hf):(3'h7)] ?
                      ($unsigned((wire21 ? wire26 : wire23)) ?
                          $unsigned(wire25[(5'h10):(3'h6)]) : wire23) : {wire26[(4'h9):(3'h4)],
                          ($unsigned((8'hb6)) == {wire27, wire27})}));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned((wire24[(1'h1):(1'h1)] + {wire26})))))
        begin
          reg29 <= wire25;
          reg30 <= (+wire21);
          reg31 <= (~(((7'h42) << ((~|reg30) ?
              $signed(reg29) : $signed(wire23))) & (+(^~(wire23 ?
              wire25 : (8'ha9))))));
          reg32 <= (~&wire27);
          reg33 <= ((^~(reg30 ?
              reg31[(3'h7):(3'h6)] : (8'hb2))) && $unsigned((!reg31[(2'h2):(2'h2)])));
        end
      else
        begin
          reg29 <= $signed(wire25[(4'hb):(3'h7)]);
          reg30 <= $signed((wire25[(5'h12):(4'hb)] ?
              wire21[(3'h6):(3'h6)] : (&(+wire27))));
          reg31 <= $signed((|$signed(wire25)));
        end
      reg34 <= (^~($unsigned($unsigned($signed((8'h9c)))) ?
          {(((8'hbb) * reg29) >= reg32)} : wire21));
      if ((-(~^reg31[(2'h2):(2'h2)])))
        begin
          reg35 <= ($signed(reg31) | ((~(+$unsigned(wire25))) ?
              wire25 : ($unsigned({reg34, wire25}) ?
                  ({wire21, (8'ha4)} ?
                      (8'h9f) : reg30) : (~$signed((8'ha1))))));
          reg36 <= wire24;
          reg37 <= (wire25[(5'h10):(1'h1)] >= reg36);
        end
      else
        begin
          if ({wire23[(4'hf):(4'hd)]})
            begin
              reg35 <= (((8'ha5) < $unsigned($signed((wire28 >>> wire27)))) ?
                  ($signed((-$unsigned(reg31))) >>> {$unsigned(reg36[(3'h7):(3'h5)]),
                      (wire23[(4'ha):(4'ha)] ?
                          wire21[(3'h4):(2'h2)] : $signed(wire27))}) : $signed((reg30 * $signed({reg32,
                      reg37}))));
            end
          else
            begin
              reg35 <= $signed((8'h9f));
              reg36 <= $unsigned($signed((((reg31 ~^ wire27) ?
                  (reg34 ?
                      (7'h43) : (8'haa)) : reg35[(4'h9):(2'h3)]) >>> wire25)));
              reg37 <= $signed({($unsigned(wire28) ?
                      $signed($signed(reg29)) : reg29[(4'h9):(4'h9)]),
                  wire22[(1'h0):(1'h0)]});
              reg38 <= (~|({(reg33 ? (reg36 && reg31) : $signed(reg34))} ?
                  wire25[(3'h5):(3'h4)] : $unsigned((~wire23))));
            end
          if ($signed($signed($unsigned({(8'hab)}))))
            begin
              reg39 <= (8'hb6);
              reg40 <= (8'haf);
              reg41 <= {(((^~((8'had) == reg38)) <= {reg37}) ?
                      ($signed((-reg29)) && reg40[(4'hd):(3'h5)]) : (8'hb4))};
            end
          else
            begin
              reg39 <= (((~|(reg41[(4'hf):(3'h6)] ?
                      $unsigned(reg40) : reg40[(5'h15):(4'h8)])) * wire26[(2'h2):(1'h1)]) ?
                  $signed((wire26[(4'hc):(3'h5)] ?
                      (~^$unsigned(wire24)) : wire22)) : (~|reg36[(1'h0):(1'h0)]));
            end
          reg42 <= $signed($signed(reg34));
        end
      if (((reg34 < (8'ha8)) - $unsigned(reg37)))
        begin
          if ($signed(($unsigned({$signed(wire22), reg41}) ?
              (reg40[(1'h1):(1'h1)] <<< $unsigned($signed(wire23))) : reg38[(1'h0):(1'h0)])))
            begin
              reg43 <= reg36[(3'h5):(1'h0)];
              reg44 <= {({wire28, wire24[(3'h7):(1'h1)]} ?
                      $signed(({wire26, reg40} ?
                          reg32 : (reg43 ? wire21 : wire28))) : {((~|reg34) ?
                              (wire28 ?
                                  wire26 : reg30) : reg38[(4'h8):(1'h1)])}),
                  $signed(wire27[(4'hb):(2'h3)])};
              reg45 <= (($signed(reg35) & {((~&reg37) ?
                      $signed(wire21) : (~|reg34)),
                  reg37}) != reg29);
              reg46 <= ($unsigned(reg29) ?
                  $signed((~$signed({reg32,
                      reg34}))) : (reg43[(4'h8):(4'h8)] > $signed(((reg37 <= reg40) ?
                      $signed(wire25) : (reg35 + (7'h44))))));
              reg47 <= $unsigned(reg40[(2'h3):(1'h1)]);
            end
          else
            begin
              reg43 <= reg32[(4'ha):(3'h7)];
              reg44 <= $unsigned($signed({reg46,
                  (reg39[(4'hb):(4'h8)] ? $signed((8'hac)) : wire28)}));
              reg45 <= ($signed($unsigned(((~^reg47) ^ (reg41 - reg32)))) ?
                  $signed(reg44[(3'h5):(2'h3)]) : (wire25 ?
                      wire22[(3'h5):(3'h5)] : $unsigned(wire22[(3'h7):(1'h0)])));
              reg46 <= $signed(reg29);
              reg47 <= wire21;
            end
          reg48 <= reg29[(1'h0):(1'h0)];
        end
      else
        begin
          reg43 <= (reg47 >>> ($unsigned(reg35) ?
              $signed((~|$signed(reg41))) : ({$unsigned((8'ha1)),
                  (reg40 >> reg42)} | $unsigned(reg38))));
          reg44 <= (reg33[(1'h0):(1'h0)] >= $unsigned(({$unsigned(wire24)} > (+(reg44 ?
              reg31 : wire25)))));
          reg45 <= $signed($signed((($unsigned((8'hb1)) ?
                  $unsigned(wire28) : (wire22 < wire27)) ?
              ((^~reg38) ?
                  $signed(reg38) : (reg47 << wire23)) : reg47[(3'h7):(2'h2)])));
          reg46 <= (reg45[(3'h6):(3'h4)] ?
              $signed(reg46) : ((((reg48 ? reg46 : reg30) || $unsigned(reg36)) ?
                      (((8'ha6) ?
                          reg32 : reg45) ^~ (-(8'ha1))) : ($unsigned((8'ha1)) ?
                          (~&(8'hb0)) : $unsigned(reg44))) ?
                  $signed($unsigned($unsigned(reg31))) : (($unsigned(reg36) && $unsigned(reg47)) << $signed(reg45))));
          reg47 <= $unsigned(wire27);
        end
      if ({(~reg35[(4'h9):(3'h7)]),
          $unsigned(($signed($signed((8'hab))) ?
              reg48[(2'h2):(2'h2)] : (8'hb6)))})
        begin
          reg49 <= $unsigned((wire23 >= ((~&$unsigned(reg48)) & (8'hb8))));
          reg50 <= $signed($unsigned($signed((reg44[(2'h3):(2'h3)] ?
              wire21[(2'h2):(1'h1)] : $signed(reg42)))));
          if ((~^($signed($signed($unsigned(wire28))) ?
              (+({(8'hb0)} != reg46)) : {reg41})))
            begin
              reg51 <= $signed(reg37);
              reg52 <= $unsigned({$unsigned($unsigned((reg33 ?
                      wire22 : reg31)))});
            end
          else
            begin
              reg51 <= ((8'ha5) >>> reg33[(1'h1):(1'h1)]);
              reg52 <= (~$unsigned({$unsigned(((8'hbe) & reg51)),
                  $unsigned({wire26, wire26})}));
              reg53 <= (((($unsigned(reg48) << {(8'hb2), reg36}) ?
                      ($unsigned(wire27) ?
                          reg52[(4'he):(3'h6)] : reg42) : reg49[(5'h13):(4'ha)]) >> {reg33[(1'h0):(1'h0)]}) ?
                  reg46[(3'h7):(3'h6)] : (~|((8'hb3) ~^ reg41)));
              reg54 <= (8'hac);
            end
          reg55 <= $unsigned($signed((~&(8'hb1))));
          reg56 <= $unsigned($signed(($unsigned({reg37}) > $signed((reg44 != wire22)))));
        end
      else
        begin
          if (($unsigned((wire26 * wire23)) ?
              $signed($signed($signed((reg49 ?
                  reg45 : reg46)))) : $signed(reg53)))
            begin
              reg49 <= {(reg45 & reg43[(2'h2):(2'h2)]),
                  (-$unsigned(wire25[(5'h10):(4'h9)]))};
              reg50 <= $signed($unsigned(reg42));
              reg51 <= $signed($unsigned($unsigned(({reg48} | reg51))));
              reg52 <= (-(wire22 ? wire24 : $unsigned(reg44[(4'hc):(4'hb)])));
            end
          else
            begin
              reg49 <= $unsigned((($signed(reg47) | ($signed(reg30) >>> (wire22 ?
                  reg40 : wire25))) <= ($signed((&reg38)) ?
                  ($signed(reg31) < $unsigned(reg54)) : {reg48,
                      ((8'ha8) ? reg55 : (8'hbc))})));
              reg50 <= $unsigned((reg34[(1'h1):(1'h0)] ~^ ($signed((reg41 ?
                      reg47 : reg34)) ?
                  ($unsigned((8'hb9)) & (&reg29)) : reg44[(3'h7):(3'h5)])));
            end
          if (($signed((wire27 & {reg43[(3'h6):(3'h4)]})) ?
              reg30 : (&$signed(($unsigned(reg55) - (wire25 ?
                  reg49 : reg30))))))
            begin
              reg53 <= ($signed({((wire22 ? reg40 : reg41) ?
                          (reg34 - reg33) : (reg44 ? wire21 : (8'ha3)))}) ?
                  (~&($signed((+reg55)) ?
                      (^$signed(reg47)) : $unsigned($unsigned(reg51)))) : $signed({(~^$signed(reg47)),
                      (&(reg54 ? (8'hb3) : reg47))}));
              reg54 <= {$signed(reg48)};
              reg55 <= ($unsigned(wire26) ?
                  $unsigned(reg49[(4'hb):(3'h6)]) : (-(&reg43)));
              reg56 <= ((~((reg44[(4'hf):(3'h4)] || reg52[(3'h5):(1'h1)]) > reg38)) < ($signed($unsigned((^~reg52))) ^ $unsigned($signed(reg32))));
            end
          else
            begin
              reg53 <= reg42[(5'h13):(5'h10)];
              reg54 <= (reg49[(3'h7):(3'h4)] <<< wire25[(2'h3):(1'h0)]);
              reg55 <= {(&$signed((~^((8'hb3) ~^ reg53))))};
            end
          reg57 <= ((($signed($signed((8'h9e))) ?
                      ((reg43 ?
                          reg48 : wire24) * (~reg31)) : (~^$unsigned((8'ha3)))) ?
                  reg54[(2'h2):(2'h2)] : $signed(((^reg48) ?
                      (reg55 - reg33) : $signed(reg51)))) ?
              $signed($unsigned(reg47)) : ({(8'hba),
                      ($unsigned(reg54) & wire27[(1'h0):(1'h0)])} ?
                  $signed((+(+reg54))) : (^wire25)));
          reg58 <= $signed(((-$unsigned(wire22[(4'hb):(4'ha)])) - (-reg44)));
        end
    end
  assign wire59 = {reg41[(4'hb):(4'ha)], (8'hb2)};
endmodule
