// Seed: 3450426988
module module_0 (
    output tri1 id_0,
    input wand id_1,
    output supply0 id_2,
    output tri0 id_3,
    input uwire id_4,
    output tri id_5,
    input wire id_6,
    input supply1 id_7,
    output tri id_8,
    output supply0 id_9
);
  logic [7:0] id_11, id_12;
  assign module_1.type_9 = 0;
  id_13(
      .id_0(1'b0), .id_1(1), .id_2(id_4), .id_3(1'b0)
  );
endmodule
module module_1 (
    output wire id_0,
    output uwire id_1,
    output supply0 id_2,
    input wire id_3,
    input wand id_4,
    output supply0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input wor id_8,
    output uwire id_9,
    output supply1 id_10,
    input wand id_11,
    input wor id_12,
    input supply0 id_13
);
  assign id_9 = {{id_4{1 - id_12}} {1 - id_7}};
  wire id_15;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_9,
      id_5,
      id_4,
      id_2,
      id_7,
      id_4,
      id_1,
      id_5
  );
  wire id_16, id_17, id_18;
endmodule
