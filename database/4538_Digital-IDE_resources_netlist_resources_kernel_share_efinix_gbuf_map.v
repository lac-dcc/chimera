// This program was cloned from: https://github.com/Digital-EDA/Digital-IDE
// License: MIT License

module \$__EFX_GBUF (input I, output O);
  EFX_GBUFCE #(.CE_POLARITY(1'b1)) _TECHMAP_REPLACE_ (.I(I), .O(O), .CE(1'b1));
endmodule
