// Seed: 3301448302
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    output supply0 id_3,
    output uwire id_4,
    output wand id_5,
    input tri1 id_6,
    input wand id_7,
    input supply0 id_8,
    output supply1 id_9,
    input tri1 id_10,
    id_12
);
  parameter id_13 = id_10 * id_10;
  wire id_14;
  wire id_15;
  wire id_16, id_17;
  if (id_12) begin : LABEL_0
    tri1 id_18 = 1;
    begin : LABEL_0
      wire id_19, id_20, id_21;
      assign id_18 = (1);
      wire id_22;
    end
  end else wire id_23, id_24;
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    id_14,
    input tri id_2,
    input tri id_3,
    input tri0 id_4,
    input wire id_5,
    input tri id_6,
    input tri1 id_7,
    id_15,
    output supply1 id_8,
    input supply0 id_9,
    output supply0 id_10,
    output supply0 id_11,
    input wand id_12
);
  nor primCall (id_11, id_0, id_16, id_3, id_6, id_2, id_14, id_12, id_1);
  wire   id_16;
  string id_17 = "";
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_11,
      id_11,
      id_11,
      id_0,
      id_12,
      id_2,
      id_11,
      id_9
  );
  id_18(
      -1
  );
endmodule
