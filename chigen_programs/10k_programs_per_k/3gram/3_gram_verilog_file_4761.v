// Seed: 3231104127
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4 = id_2;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
endmodule
module module_2;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = ~1'b0 ^ id_2;
  initial begin : LABEL_0
    if (id_2)
      if (id_2) id_4 = id_2;
      else id_3 <= id_2;
    else id_1 = 1;
    #1 begin : LABEL_0
      id_2 = id_2;
    end
  end
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_5;
endmodule
