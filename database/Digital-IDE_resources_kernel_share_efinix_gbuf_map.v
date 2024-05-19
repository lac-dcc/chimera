// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

module \$__EFX_GBUF (input I, output O);
  EFX_GBUFCE #(.CE_POLARITY(1'b1)) _TECHMAP_REPLACE_ (.I(I), .O(O), .CE(1'b1));
endmodule
