// Seed: 1187279385
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    inout tri id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    input tri id_7,
    output tri id_8,
    input supply1 id_9
);
  generate
    begin : LABEL_0
      begin : LABEL_0
        uwire id_11 = id_1;
      end
      wire id_12;
    end
  endgenerate
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    output supply1 id_2,
    output logic id_3,
    input tri0 id_4,
    input uwire id_5,
    input uwire id_6,
    input supply1 id_7,
    input supply0 id_8,
    id_19,
    input tri0 id_9,
    input wand id_10,
    output wire id_11,
    output wire id_12,
    output wand id_13,
    output wor id_14,
    input supply0 id_15,
    output logic id_16,
    input uwire id_17
);
  always id_16 <= ~1 & -1;
  assign id_12 = 1;
  wire id_20;
  assign id_3 = id_9 + id_0;
  id_21 :
  assert property (@(posedge id_21 + id_9 or posedge id_21 or posedge 1) id_4) if (1) id_3 <= -1;
  supply1 id_22;
  assign id_21 = id_9;
  wire id_23;
  assign id_16 = -1;
  assign id_13 = id_1;
  wire id_24;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_17,
      id_21,
      id_9,
      id_8,
      id_21,
      id_21,
      id_12,
      id_9
  );
  wire id_25;
  supply1 id_26, id_27, id_28 = id_17, id_29;
endmodule
