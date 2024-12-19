// Seed: 3781338925
module module_0 (
    input uwire id_0,
    input wand id_1,
    output tri1 id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    output wire id_6
);
  initial $display(id_1 & id_0);
endmodule
module module_1 (
    input  tri   id_0,
    output wand  id_1,
    input  uwire id_2,
    input  logic id_3,
    output logic id_4,
    input  logic id_5
);
  always begin : LABEL_0
    assume (1);
    repeat (1) id_4 <= id_3;
    id_4 <= id_5;
    if (id_2) if (id_5 < 1 && id_3 && id_0 && id_2) id_4 <= (id_3 - id_5);
    if (id_3) begin : LABEL_0
      id_4 = id_5;
      fork
        id_7();
        $display(id_0, id_7);
      join
    end
    wait (1);
    wait (id_3);
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_7,
      id_2,
      id_7,
      id_0,
      id_1
  );
  assign modCall_1.type_11 = 0;
endmodule
