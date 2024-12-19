// Seed: 402052186
module module_0 (
    output logic id_0,
    output supply0 id_1,
    input wire id_2,
    input wor id_3,
    input wire id_4,
    input tri id_5,
    output supply1 id_6
);
  wand id_8;
  wire id_9;
  assign id_1 = ~id_8;
  always @(posedge id_9) id_0 <= 1;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    input tri1 id_2,
    input supply1 id_3,
    output logic id_4
);
  tri0 id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_2,
      id_1,
      id_0,
      id_3,
      id_6
  );
  assign modCall_1.id_1 = 0;
  assign id_6 = id_6 - id_0 ? id_0 : 1;
  always
    if (1)
      for (id_6 = 1; 1 == 1'b0 >= id_6; id_6 = id_3)
        #1 begin : LABEL_0
          id_6 = id_1;
          id_6 = id_1;
        end
    else id_4 <= 1;
endmodule
