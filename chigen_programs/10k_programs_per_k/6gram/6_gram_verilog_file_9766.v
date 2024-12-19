// Seed: 2352671240
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_1 or posedge id_3) begin : LABEL_0
    if ((id_2)) disable id_4;
  end
  wand id_5;
  always @(1) begin : LABEL_0
    id_5 = id_2;
  end
  assign module_2.type_27 = 0;
endmodule
module module_1 ();
  wor id_2;
  assign id_1 = {id_1 - id_2{id_1}};
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_7 = 0;
endmodule
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output supply0 id_2,
    output logic id_3,
    output wire id_4,
    input wand id_5
    , id_21,
    input logic id_6,
    output tri1 id_7,
    input supply0 id_8,
    output wire id_9,
    input wor id_10,
    input wor id_11,
    output uwire id_12,
    input wire id_13,
    input tri id_14,
    input tri id_15,
    output uwire id_16,
    output logic id_17,
    input tri1 id_18,
    output tri id_19
);
  wire id_22;
  always force id_7 = 1;
  xnor primCall (
      id_2, id_1, id_8, id_14, id_5, id_22, id_21, id_11, id_18, id_13, id_15, id_10, id_0, id_6
  );
  always @(id_14 or posedge id_21) begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_17 = #1 1;
    end else id_3 <= id_6(id_6);
  end
  module_0 modCall_1 (
      id_22,
      id_22,
      id_22
  );
  id_23(
      .id_0(id_12), .id_1(id_12)
  );
  tri  id_24 = 1;
  wire id_25;
  assign id_2 = 1;
  id_26(
      .id_0(1'd0), .id_1(1), .id_2(id_19 == id_8 - module_2), .id_3(id_5)
  );
endmodule
