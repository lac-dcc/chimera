// Seed: 3837458725
module module_0 (
    input wire id_0,
    output tri0 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    input tri0 id_5,
    input uwire id_6,
    input supply1 id_7,
    input wire id_8
);
  always_latch begin : LABEL_0
    fork
      begin : LABEL_0
        wait (id_6);
      end
    join_none
  end
  assign id_3 = 1'h0;
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    input supply0 id_2
);
  assign id_1 = 1;
  wand id_4;
  wire id_5;
  wire id_6;
  id_7(
      .id_0(id_5),
      .id_1(1),
      .id_2(id_2),
      .id_3(1'b0),
      .id_4(1),
      .id_5(id_4 < id_2),
      .id_6(id_1),
      .id_7((id_5)),
      .id_8(1 + id_0),
      .id_9(id_4),
      .id_10(1)
  );
  assign id_5 = id_5;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_4 = 0;
  wire id_8;
endmodule
