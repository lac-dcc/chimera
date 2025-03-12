// Seed: 3180672852
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output supply0 id_3
);
  id_5 :
  assert property (@(posedge id_5) id_1)
  else @(posedge id_5 * -1) id_5 <= -1;
endmodule
module module_1 (
    output logic id_0,
    output wand id_1,
    input wor id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    output tri0 id_7
);
  id_9 :
  assert property (@(posedge 1) id_6)
  else if (1)
    assert (id_9);
    else begin : LABEL_0
      id_0 = ((-1'b0));
    end
  module_0 modCall_1 (
      id_7,
      id_3,
      id_4,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
