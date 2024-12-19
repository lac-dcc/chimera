// Seed: 1389895746
module module_0;
  always #1 id_1 = 1;
  tri1 id_2;
  tri0 id_5;
  id_6(
      id_4, 1, id_1, !id_1, 1'h0, id_5, 1, id_1, id_1
  );
  wire id_7;
  assign id_2 = id_5;
  wire id_8, id_9;
  supply0 id_10 = 1, id_11;
  id_12(
      .id_0(1 - id_4), .id_1({1, 1, ""}), .id_2(id_9), .id_3(1)
  );
  wire id_13;
  id_14(
      .id_0(id_6), .id_1(id_11)
  );
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wand id_4,
    output logic id_5,
    input wand id_6,
    input wand id_7,
    input wand id_8
);
  assign id_5 = id_6 ? 1 : 1;
  always if (1) id_5 <= ~id_7;
  module_0 modCall_1 ();
  wire id_10, id_11, id_12, id_13;
  initial begin : LABEL_0
    id_0 <= 1;
  end
endmodule
