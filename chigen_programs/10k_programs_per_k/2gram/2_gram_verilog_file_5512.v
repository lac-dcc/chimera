// Seed: 1219204068
module module_0 (
    output supply1 id_0,
    input wire id_1,
    output wor id_2,
    input tri0 id_3,
    output uwire id_4,
    input wand id_5,
    output tri1 id_6,
    output supply0 id_7,
    input wor id_8,
    output supply0 id_9
    , id_13,
    input supply0 id_10,
    input supply1 id_11
);
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    input  wand  id_2,
    output logic id_3,
    input  uwire id_4,
    output tri1  id_5,
    output logic id_6,
    input  tri1  id_7,
    output wire  id_8,
    output tri1  id_9
);
  always begin : LABEL_0
    id_1 <= id_2;
    id_1 <= id_4;
    if (|{1{-1}}) begin : LABEL_1
      for (id_8 = -1; id_7; id_6 = -1'b0) begin : LABEL_2
        id_3 <= id_0;
      end
    end
  end
  module_0 modCall_1 (
      id_8,
      id_2,
      id_5,
      id_7,
      id_5,
      id_0,
      id_9,
      id_5,
      id_2,
      id_9,
      id_4,
      id_0
  );
  assign modCall_1.id_3 = 0;
  localparam id_11 = -1;
endmodule
