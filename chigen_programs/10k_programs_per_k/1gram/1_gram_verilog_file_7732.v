// Seed: 3634800109
program module_0 (
    input supply0 id_0,
    output wire id_1,
    input wor id_2,
    output wand id_3,
    output tri id_4,
    input supply1 id_5,
    output tri0 id_6,
    input uwire id_7,
    output wand id_8,
    input tri0 id_9,
    input supply1 id_10,
    output supply0 id_11,
    input tri0 id_12
);
  assign id_8 = -1;
  assign id_8 = 1;
  assign module_1.id_0 = 0;
endprogram
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output wire id_2,
    output tri0 id_3,
    output supply0 id_4,
    output logic id_5,
    output uwire id_6,
    output supply1 id_7#(-1)
);
  module_0 modCall_1 (
      id_1,
      id_6,
      id_0,
      id_2,
      id_6,
      id_1,
      id_7,
      id_0,
      id_3,
      id_0,
      id_0,
      id_7,
      id_1
  );
  logic id_9;
  ;
  id_10 :
  assert property (@(posedge id_0 or -1) 1) begin : LABEL_0
    id_5 = id_9.id_1;
  end
  wire [1 : ""] id_11;
endmodule
