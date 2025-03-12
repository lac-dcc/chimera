// Seed: 446134124
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input wire id_2,
    input supply1 id_3,
    input tri id_4,
    output tri1 id_5
);
  assign id_5 = id_0;
endmodule
module module_1 (
    output wire id_0,
    output wand id_1,
    input tri0 id_2,
    output logic id_3,
    output tri0 id_4,
    input supply0 id_5,
    input uwire id_6
);
  id_8 :
  assert property (@(posedge id_6) id_2)
  else begin : LABEL_0
    id_3 <= id_3++ == id_8;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_6,
      id_4
  );
  assign modCall_1.id_4 = 0;
  assign id_8 = id_6;
  assign id_8[""] = id_5;
endmodule
