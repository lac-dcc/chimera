// Seed: 99354356
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri id_2,
    input wire id_3,
    output tri id_4,
    output tri1 id_5,
    input tri id_6,
    output uwire id_7,
    inout uwire id_8,
    input wor id_9,
    input uwire id_10
);
  logic [7:0] id_12;
  wire id_13;
  assign id_2 = 1;
  id_14(
      .id_0(id_5), .id_1(id_4), .id_2(1), .id_3(id_12)
  );
  wire id_15;
  assign module_1.id_1 = 0;
  id_16(
      .id_0(id_15), .id_1(1 == 1 - 1'd0)
  );
endmodule
module module_1 (
    output wire id_0,
    input  wor  id_1,
    output wire id_2,
    input  tri0 id_3,
    input  wire id_4
);
  tri0 id_6;
  tri1 id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_3,
      id_7,
      id_0,
      id_1,
      id_0,
      id_7,
      id_4,
      id_3
  );
  assign id_6 = id_6;
  assign id_7 = id_3;
  specify
    specparam id_8 = id_7 - id_4;
    (id_9 => id_10) = 1;
    (id_11 *> id_12) = (1, 1);
    if (id_3 == id_6) (posedge id_13 => (id_14 +: id_10 - 1)) = (id_10, ~1 && 1 && "" != id_3);
  endspecify
endmodule
