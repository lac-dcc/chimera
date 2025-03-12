// Seed: 1960145762
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    output supply0 id_2,
    input tri0 id_3,
    output tri id_4,
    input tri1 id_5
);
  wire id_7;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    output logic id_2,
    output supply1 id_3,
    input wand id_4,
    input supply1 id_5
);
  wire id_7;
  nor primCall (id_0, id_1, id_5, id_7, id_4);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1
  );
  always @* begin : LABEL_0
    id_2 = -1;
    assert (id_7);
    {1, 1} = "";
    id_0 <= id_1 + id_4;
  end
  wire [1 : 1] id_8;
endmodule
