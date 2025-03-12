// Seed: 3312596650
module module_0 (
    output tri0 id_0
    , id_10,
    output supply1 id_1,
    input tri0 id_2,
    input tri id_3,
    output tri1 id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri1 id_7,
    output supply0 id_8
);
  wire id_11;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output wand id_1,
    output wire id_2,
    input wire id_3,
    output wand id_4,
    input supply0 id_5,
    output logic id_6,
    input uwire id_7
);
  always @(1 or id_7 or posedge (id_5)) begin : LABEL_0
    for (id_1 = id_7 && 1 && id_7 - -1 && 1; id_7; id_6 = 1)
    @(id_5 != id_3 or ~id_7) release id_2[-1'b0];
  end
  wire [1 : -1] id_9;
  and primCall (id_0, id_7, id_5, id_9);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_5,
      id_3,
      id_4,
      id_3,
      id_5,
      id_3,
      id_0
  );
endmodule
