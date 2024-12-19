// Seed: 1280529136
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wor  id_3
);
  wire id_5;
  assign module_1.id_15 = 0;
endmodule
module module_0 (
    input tri id_0,
    output wor id_1,
    input supply0 id_2,
    output uwire id_3,
    input uwire id_4
    , id_20,
    input wire id_5,
    input wire id_6,
    input logic id_7,
    input tri1 id_8,
    input supply1 id_9,
    input supply1 id_10,
    output tri id_11,
    output uwire module_1,
    input wor id_13,
    output uwire id_14,
    output uwire id_15,
    output tri id_16,
    input wand id_17,
    output wire id_18
);
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_5
  );
  reg id_21;
  assign id_14 = 1;
  wor id_22 = 1;
  logic [7:0] id_23;
  supply0 id_24 = (id_17);
  or primCall (id_18, id_4, id_17, id_20, id_6, id_7, id_10, id_2, id_0, id_8, id_13);
  assign id_16 = 1;
  initial begin : LABEL_0
    fork
      id_21 <= id_7;
    join
  end
  id_25(
      .id_0(id_7),
      .id_1(id_23[1] - id_5),
      .id_2(1),
      .id_3((id_8) - 1'b0),
      .id_4(1),
      .id_5(1),
      .id_6(id_6)
  );
endmodule
