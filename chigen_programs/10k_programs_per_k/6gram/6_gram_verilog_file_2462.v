// Seed: 665725002
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    output supply0 id_3,
    output supply1 id_4
    , id_6
);
  reg id_7;
  id_8(
      .id_0(1), .id_1(1'b0), .id_2(id_0)
  );
  initial begin : LABEL_0
    id_7 <= 1 == 1;
    if (1'd0) disable id_9#(.id_10(1));
  end
endmodule
module module_1 (
    input logic id_0,
    input logic id_1,
    output supply1 id_2,
    input wand id_3,
    output logic id_4
);
  initial begin : LABEL_0
    id_4 <= id_1 ? id_0 : id_1;
    id_4 <= id_0;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
