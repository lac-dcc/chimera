// Seed: 1816814249
module module_0 (
    input wand id_0,
    input wand id_1,
    input tri1 id_2,
    input supply0 id_3,
    output tri0 id_4,
    input wand id_5,
    output supply1 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input tri id_10
    , id_21,
    input tri0 id_11,
    input wor id_12,
    input wand id_13,
    output wire id_14,
    output wor id_15,
    output tri0 id_16,
    output wor id_17,
    output uwire id_18,
    output supply1 id_19
);
  wire id_22;
  ;
  logic id_23;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input wor id_2,
    input wire id_3,
    input tri id_4,
    input supply0 id_5,
    input tri id_6
    , id_10,
    input wire id_7,
    output supply1 id_8
);
  bit id_11;
  ;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_6,
      id_8,
      id_1,
      id_8,
      id_7,
      id_2,
      id_5,
      id_2,
      id_7,
      id_5,
      id_2,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  assign modCall_1.id_12 = 0;
  always @(id_6 or 1'h0 / (-1 ? -1'h0 == id_3 : 1 == id_5 << id_6)) begin : LABEL_0
    id_11 = new;
    if (1)
      if (1)
        assert (id_10);
        else begin : LABEL_1
          id_11 <= "";
        end
      else begin : LABEL_2
        id_11 <= 1;
      end
  end
endmodule
