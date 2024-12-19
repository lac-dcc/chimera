// Seed: 3781101585
module module_0 (
    output tri id_0,
    output supply0 id_1,
    output wor id_2,
    output wire id_3,
    output tri id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri id_7,
    input tri1 id_8,
    input supply0 id_9,
    input tri0 id_10,
    input wire id_11,
    input uwire id_12,
    input uwire id_13,
    input uwire id_14,
    output supply1 id_15
);
  id_17(
      .id_0(1), .id_1(id_10)
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    input wire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output supply0 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_1,
      id_5,
      id_0,
      id_4,
      id_0,
      id_2,
      id_4,
      id_3,
      id_2,
      id_4,
      id_0,
      id_2,
      id_1
  );
  always begin : LABEL_0
    release id_7.id_0;
    ;
    fork
      id_5 = 1;
      deassign id_7;
    join
  end
  wire id_8;
  wire id_9;
  assign id_7 = ~"";
endmodule
