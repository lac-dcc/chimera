// Seed: 4253925748
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input tri1 id_2,
    input tri id_3,
    output uwire id_4,
    output uwire id_5,
    input wor id_6,
    output tri id_7
);
  assign id_4 = id_2 || id_6 - -1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply0 id_1,
    input tri1 id_2,
    output logic id_3,
    output tri id_4,
    output wor id_5,
    input uwire id_6,
    input supply0 id_7,
    input wire id_8,
    output logic id_9,
    output tri0 id_10,
    input tri id_11,
    input wand id_12
    , id_15,
    output logic id_13
);
  assign id_5 = -1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_11,
      id_6,
      id_4,
      id_4,
      id_7,
      id_4
  );
  always @(posedge 1 == 1 or posedge id_8) begin : LABEL_0
    if (1)
      case (id_11)
        -1: begin : LABEL_1
          wait (id_15);
        end
        1: id_13 = -1;
        id_2: id_9 = 1;
        -1: id_3 = -1;
      endcase
  end
  or primCall (id_4, id_8, id_15, id_11, id_2, id_12, id_7, id_6, id_1);
  logic id_16;
  ;
endmodule
