// Seed: 2580251322
module module_0 (
    output tri   id_0,
    input  wire  id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    output wire  id_4,
    output wand  id_5,
    input  tri   id_6,
    input  tri0  id_7,
    output tri   id_8,
    output uwire id_9
);
  wire id_11;
  wire id_12;
  wire id_13;
  assign module_1.type_1 = 0;
  id_14(
      .id_0(id_7), .id_1(~id_3), .id_2(1)
  );
  wire id_15;
  wire id_16;
  wire id_17, id_18;
  wire id_19;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input tri1 id_2,
    output uwire id_3,
    output tri1 id_4,
    input wire id_5
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_1,
      id_4,
      id_3,
      id_5,
      id_5,
      id_3,
      id_3
  );
  static real id_7;
  wire id_8;
  id_9 :
  assert property (@(1 & 1) 1)
  else begin : LABEL_0
    id_0 <= 1'b0;
  end
endmodule
