// Seed: 317892816
module module_0 (
    output wor   id_0,
    output tri   id_1,
    input  wor   module_0,
    input  uwire id_3,
    output uwire id_4,
    output wand  id_5,
    output tri0  id_6,
    input  wor   id_7
);
  assign id_4 = 1;
  assign module_1.id_7 = 0;
  wire id_9;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input wand id_2,
    output logic id_3,
    output uwire id_4,
    output logic id_5,
    input wand id_6,
    output supply1 id_7,
    inout logic id_8,
    output tri id_9,
    output uwire id_10,
    output tri0 id_11,
    input supply0 id_12,
    output wand id_13
);
  always @({id_12{id_1}}, posedge id_0 || 1 + 1)
    if (1) begin : LABEL_0
      if ((id_6)) id_5 <= 1;
      else begin : LABEL_0
        id_11 = 1;
        id_3 <= id_8;
      end
    end
  assign id_11 = 'b0;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_6,
      id_12,
      id_9,
      id_9,
      id_13,
      id_12
  );
endmodule
