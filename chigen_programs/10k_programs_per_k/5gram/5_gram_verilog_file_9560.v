// Seed: 4058634077
module module_0 (
    input tri id_0,
    output supply1 id_1
    , id_26,
    output tri id_2,
    input supply1 id_3,
    output uwire id_4,
    input tri0 id_5,
    input wand id_6,
    input wor id_7,
    input tri0 id_8,
    input tri id_9,
    input supply0 id_10,
    output uwire id_11,
    input tri id_12,
    input tri1 id_13,
    output uwire id_14,
    input tri1 module_0,
    output tri1 id_16,
    input tri0 id_17,
    input wire id_18,
    output uwire id_19,
    input tri0 id_20,
    input wand id_21,
    output uwire id_22,
    input supply1 id_23,
    input tri1 id_24
);
  wor id_27 = 1;
  assign id_2 = 1 ? id_0 : 1;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    input supply1 id_2,
    output supply0 id_3,
    output logic id_4,
    inout wire id_5,
    input wire id_6,
    input wor id_7,
    input supply0 id_8
);
  always @(1 or posedge id_6 >= id_5) begin : LABEL_0
    if (id_0) begin : LABEL_0
      fork
        id_1 <= id_7 >= ~id_7;
        #1 id_4 <= 1 == id_2;
      join
    end
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_5,
      id_8,
      id_5,
      id_5,
      id_6,
      id_6,
      id_0,
      id_2,
      id_8,
      id_5,
      id_5,
      id_6,
      id_3,
      id_0,
      id_5,
      id_8,
      id_8,
      id_5,
      id_2,
      id_2,
      id_3,
      id_5,
      id_2
  );
  assign modCall_1.id_9 = 0;
endmodule
