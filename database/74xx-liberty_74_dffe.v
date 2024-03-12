module \$_DFFE_PP_ (input D, C, E, output Q); \74AC377_8x1DFFE _TECHMAP_REPLACE_(.D(D), .CP(C), .CE(!E), .Q(Q)); endmodule
module \$_DFFE_PN_ (input D, C, E, output Q); \74AC377_8x1DFFE _TECHMAP_REPLACE_(.D(D), .CP(C), .CE(E), .Q(Q)); endmodule
module \$_DFFE_NP_ (input D, C, E, output Q); \74AC377_8x1DFFE _TECHMAP_REPLACE_(.D(D), .CP(!C), .CE(!E), .Q(Q)); endmodule
module \$_DFFE_NN_ (input D, C, E, output Q); \74AC377_8x1DFFE _TECHMAP_REPLACE_(.D(D), .CP(!C), .CE(E), .Q(Q)); endmodule
