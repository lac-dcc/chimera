module top
#(parameter param69 = {(8'h9f)})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire55;
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  assign y = {wire68,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire5,
                 wire6,
                 wire7,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire55,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg59,
                 reg58,
                 reg57,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire5 = ({(!wire2), (^wire3[(2'h2):(1'h0)])} - ((~((wire2 << (8'had)) ?
                     wire4 : wire1)) <<< $unsigned(wire3[(1'h0):(1'h0)])));
  assign wire6 = $signed($unsigned($unsigned($unsigned(wire0[(2'h2):(1'h1)]))));
  assign wire7 = wire4[(5'h13):(1'h1)];
  always
    @(posedge clk) begin
      reg8 <= (~|$signed((~&(!((8'hbb) ? wire3 : wire0)))));
      reg9 <= (|((8'hb6) & $signed(wire2[(3'h6):(1'h1)])));
      reg10 <= (~|$unsigned((~&((~&reg8) ?
          wire6[(2'h3):(2'h2)] : reg8[(2'h3):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg11 <= reg8[(2'h2):(2'h2)];
    end
  assign wire12 = $unsigned(wire3);
  assign wire13 = reg10;
  assign wire14 = $signed({$unsigned(((wire7 ? wire6 : (8'hb7)) <<< {wire0,
                          wire0})),
                      {(reg10[(1'h1):(1'h0)] ?
                              reg10[(1'h1):(1'h1)] : (reg9 ? wire12 : wire4)),
                          $unsigned($signed(wire5))}});
  assign wire15 = {($signed($signed((wire2 ? wire4 : wire12))) ?
                          ($unsigned($signed(wire0)) >>> ((+wire6) ?
                              wire5[(1'h0):(1'h0)] : (wire1 ?
                                  reg11 : reg9))) : reg11[(1'h1):(1'h1)])};
  module16 #() modinst56 (.wire20(wire6), .wire18(reg9), .wire17(wire12), .wire19(wire14), .y(wire55), .clk(clk));
  always
    @(posedge clk) begin
      reg57 <= reg9[(3'h5):(2'h3)];
      reg58 <= reg8[(3'h4):(2'h3)];
      reg59 <= $unsigned(reg10[(4'h8):(2'h2)]);
    end
  assign wire60 = reg58;
  assign wire61 = $signed(reg8[(2'h3):(2'h2)]);
  assign wire62 = wire15[(4'h8):(4'h8)];
  assign wire63 = (~|$unsigned((wire13 ? $unsigned((&reg11)) : (~|reg57))));
  always
    @(posedge clk) begin
      reg64 <= wire0;
      reg65 <= ((&wire15) ?
          (&$signed((reg8 ?
              $signed(wire63) : wire13))) : $unsigned($signed({reg57[(4'h9):(4'h9)],
              (!wire12)})));
      reg66 <= wire3;
      reg67 <= $unsigned(wire15);
    end
  assign wire68 = reg10;
endmodule

module module16
#(parameter param53 = {(^~(~(((7'h44) && (8'hb7)) ? ((8'hbe) <<< (8'hb2)) : (~&(8'ha8)))))}, 
parameter param54 = (8'hb8))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire21;
  assign y = {wire52, wire51, wire50, wire49, wire48, wire46, wire21, (1'h0)};
  assign wire21 = wire19[(4'he):(4'h8)];
  module22 #() modinst47 (wire46, clk, wire20, wire21, wire17, wire19);
  assign wire48 = $unsigned((($signed($signed(wire17)) > (&wire18[(4'h8):(3'h5)])) ?
                      $unsigned(wire19[(2'h3):(2'h3)]) : (-$unsigned(wire18[(5'h11):(4'hc)]))));
  assign wire49 = $signed(wire18[(1'h0):(1'h0)]);
  assign wire50 = $unsigned($unsigned((8'hb8)));
  assign wire51 = (~&wire20);
  assign wire52 = ($unsigned(wire20[(4'h8):(3'h4)]) ^ wire48[(4'hb):(4'h8)]);
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire27;
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg28,
                 (1'h0)};
  assign wire27 = wire26[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg28 <= $unsigned(($signed(($signed(wire23) ^~ (+wire25))) ?
          $signed(wire27) : ($unsigned(((8'h9e) ? wire23 : wire25)) ?
              (|$unsigned(wire23)) : $signed((wire23 ? wire25 : wire23)))));
    end
  assign wire29 = $signed({(wire27[(5'h13):(4'h9)] ? wire25 : (^wire23)),
                      {wire23,
                          (reg28[(1'h0):(1'h0)] >= reg28[(1'h1):(1'h1)])}});
  assign wire30 = (^~$unsigned(wire23[(2'h2):(2'h2)]));
  assign wire31 = $unsigned(wire24[(1'h1):(1'h0)]);
  assign wire32 = ((~(~(-$signed(wire30)))) ?
                      ((~&(wire26 ?
                          (wire25 ?
                              wire24 : wire27) : wire30)) ~^ wire23) : $signed(($signed($signed(wire25)) ?
                          wire26[(1'h1):(1'h0)] : ($unsigned(wire29) != wire27[(1'h0):(1'h0)]))));
  assign wire33 = (~|{(!wire32[(1'h1):(1'h0)]), (~$unsigned((^~reg28)))});
  assign wire34 = $unsigned({$signed(((^~reg28) || wire27))});
  always
    @(posedge clk) begin
      if ($unsigned((wire24[(3'h4):(1'h1)] && ((wire26 ?
              wire23[(1'h0):(1'h0)] : wire27) ?
          $signed((wire25 << wire25)) : (&$unsigned(wire25))))))
        begin
          reg35 <= $signed($unsigned($signed($unsigned({wire31}))));
          reg36 <= (((($unsigned(reg28) ?
                  ((8'hab) ?
                      wire34 : wire25) : $signed(wire30)) >>> (|(wire32 < reg35))) ?
              {$unsigned(reg28),
                  (~(^wire30))} : $unsigned(($unsigned(wire33) <<< wire24))) | wire25);
          reg37 <= (^$unsigned(($unsigned((wire23 - wire31)) < (~$signed(reg35)))));
          if ((~|$signed((^{(wire26 ? wire34 : wire24)}))))
            begin
              reg38 <= reg37[(3'h5):(1'h0)];
              reg39 <= $signed(($unsigned(((wire30 | reg37) ?
                      reg36 : ((7'h43) ? (8'hb8) : (8'ha7)))) ?
                  (wire34[(3'h7):(3'h6)] & ((~^(8'hb1)) ?
                      (8'ha4) : $signed(wire32))) : $signed((~wire26))));
            end
          else
            begin
              reg38 <= {$signed($signed(wire30[(3'h4):(3'h4)])),
                  ($unsigned((8'hb4)) ?
                      reg28[(1'h0):(1'h0)] : ({reg38,
                          (wire33 ^ reg35)} && {((8'hbe) ? reg36 : wire27)}))};
              reg39 <= ($signed((wire23 ?
                  $signed((wire26 ? reg36 : wire25)) : {$unsigned(wire31),
                      {wire27, reg35}})) + (^~(|$signed(wire31))));
            end
          reg40 <= wire25;
        end
      else
        begin
          reg35 <= ($signed($signed(wire33)) ? (~&$signed((^reg37))) : reg40);
          reg36 <= wire23[(2'h3):(2'h3)];
          if ($signed((|(~$unsigned($signed((7'h41)))))))
            begin
              reg37 <= $unsigned({(~^($signed(reg35) ?
                      $unsigned(reg35) : wire23))});
              reg38 <= (wire31 ? wire24[(3'h4):(2'h2)] : (8'ha1));
            end
          else
            begin
              reg37 <= $unsigned(wire29);
              reg38 <= $signed($signed({reg37, {reg35}}));
              reg39 <= $unsigned((reg39 >>> wire32));
              reg40 <= reg38[(4'h8):(3'h5)];
            end
          reg41 <= {reg35[(1'h1):(1'h1)]};
        end
    end
  assign wire42 = reg40;
  assign wire43 = {$unsigned($signed({wire23, reg28}))};
  assign wire44 = $signed((&reg40[(3'h7):(3'h5)]));
  assign wire45 = wire43[(1'h0):(1'h0)];
endmodule
