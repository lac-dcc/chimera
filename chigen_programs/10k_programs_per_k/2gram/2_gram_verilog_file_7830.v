// Seed: 3498235696
module module_0 (
    input wire id_0,
    output logic id_1#(.id_12("")),
    input tri id_2,
    input tri id_3,
    input uwire id_4,
    input wire id_5,
    input supply0 id_6,
    input wire id_7,
    input tri1 id_8,
    output logic id_9,
    input wor id_10
);
  wire  id_13;
  logic id_14;
  ;
  wire [1 : -1 'b0] id_15;
  always begin : LABEL_0
    id_9 = -1;
    @(posedge id_15 or posedge -1 or id_5) id_1 = id_8;
    `define pp_16 0
    if (1) begin : LABEL_1
      id_9 = id_8;
      $unsigned(99);
      ;
      SystemTFIdentifier(id_0, "", (1));
    end
  end
  wire id_17 = id_7, id_18;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    output logic id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5,
    output wire id_6,
    output tri id_7,
    input supply1 id_8
);
  always begin : LABEL_0
    if (1)
      fork
        id_2 = id_3 ^ 1;
      join_any
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_8,
      id_3,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2,
      id_8
  );
endmodule
