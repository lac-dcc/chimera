// Seed: 2032225704
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  supply1 id_8 = 1'b0, id_9, id_10;
  module_2 modCall_1 ();
  assign modCall_1.type_6 = 0;
  wire id_11;
  assign id_8 = id_4;
  wire id_12 = id_7;
endmodule
module module_1 ();
  wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule
module module_2;
  wire  id_1;
  uwire id_4;
  always @(posedge id_3) if (id_3 == 1) if (id_4 == (1'b0)) assign id_2 = id_3;
endmodule
