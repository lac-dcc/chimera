// Seed: 2588503319
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  reg id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  initial begin : LABEL_0
    `define pp_18 0
    id_15 <= #1 id_8;
  end
  wire id_19;
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_17 = 0;
  wire  id_2;
  uwire id_3 = 1;
  wand  id_4;
  id_5(
      .id_0(1'b0), .id_1(1'b0), .id_2(1)
  );
  wire id_6;
  wire id_7;
endmodule
