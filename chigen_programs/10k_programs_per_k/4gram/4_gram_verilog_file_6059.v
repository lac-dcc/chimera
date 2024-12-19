// Seed: 122453151
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wor id_3,
    input wor id_4,
    input tri1 id_5,
    input tri1 id_6
);
  supply1 id_8 = id_4 & 1;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
endmodule
module module_2 (
    input tri id_0,
    output supply1 id_1,
    output logic id_2
    , id_17,
    input supply0 id_3,
    input wire id_4,
    output tri id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wor id_8,
    input tri1 id_9,
    output uwire id_10,
    input wand id_11,
    output tri1 id_12,
    input logic id_13,
    input tri1 id_14,
    input uwire id_15
);
  wire id_18;
  final begin : LABEL_0
    id_2 <= 1 ? 1 : "";
    if (id_8 == 'h0) begin : LABEL_0
      id_17 <= id_13;
      id_10 = 1;
    end else begin : LABEL_0
      id_7 = id_13 !== id_6;
    end
  end
  id_19(
      id_6, 1
  );
  wire id_20;
  integer id_21;
  module_0 modCall_1 (
      id_21,
      id_18,
      id_21,
      id_18,
      id_20
  );
  assign id_10 = 1;
  and primCall (
      id_2,
      id_0,
      id_9,
      id_20,
      id_11,
      id_4,
      id_8,
      id_18,
      id_17,
      id_6,
      id_13,
      id_21,
      id_14,
      id_19,
      id_15
  );
endmodule
