// Seed: 687428000
module module_0 (
    input wor id_0,
    output wire id_1,
    input supply1 id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input wand id_6,
    output supply0 id_7
);
  wire id_9;
  id_10(
      1, id_1, id_0
  );
  assign id_1 = id_3 ^ 1;
  wire id_11;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    input uwire id_2,
    input wor id_3,
    output wor id_4,
    input uwire id_5,
    input uwire id_6,
    input wand module_1,
    output logic id_8,
    input wire id_9,
    output wor id_10,
    output supply0 id_11
);
  supply1 id_13 = id_6;
  initial begin : LABEL_0
    fork
      begin : LABEL_0
        #(1) id_4 = id_5;
        id_8 <= 1'b0;
      end
    join
    id_13 = id_7;
  end
  module_0 modCall_1 (
      id_3,
      id_10,
      id_9,
      id_1,
      id_5,
      id_6,
      id_3,
      id_13
  );
endmodule
