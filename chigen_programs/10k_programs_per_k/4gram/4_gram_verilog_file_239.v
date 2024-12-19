// Seed: 3303319012
module module_0 (
    input tri0 id_0,
    input tri0 id_1
);
  wire id_3;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input wand id_2,
    input tri0 id_3,
    output wor id_4,
    input wire id_5,
    input uwire id_6,
    input uwire id_7,
    output wire id_8,
    output wor id_9,
    output tri1 id_10
    , id_12
);
  wire id_13, id_14;
  module_0 modCall_1 (
      id_3,
      id_5
  );
endmodule
module module_2 (
    input wor id_0,
    output wor id_1,
    input supply0 id_2,
    input wand id_3,
    output supply0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output supply0 id_7,
    input wor id_8,
    output logic id_9,
    input uwire id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_10
  );
  assign modCall_1.type_4 = 0;
  wire id_13;
  wand id_14;
  xor primCall (id_4, id_10, id_0, id_3, id_12, id_2, id_5, id_6, id_8);
  assign #id_15 id_1 = id_0;
  assign id_14 = id_6;
  assign id_7 = {1, 1, id_14};
  always @(posedge id_0) begin : LABEL_0
    id_9 <= 1;
  end
endmodule
