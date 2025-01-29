// Seed: 381031547
module module_0;
  id_1(
      .id_0(id_2)
  );
  assign module_2.type_26 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
endmodule
program module_2 (
    input wand id_0,
    output wand id_1,
    input wand id_2,
    output wire id_3,
    input wire id_4,
    input tri id_5,
    input supply0 id_6,
    output supply1 id_7,
    input wand id_8,
    input wand id_9,
    input tri id_10,
    output logic id_11,
    input tri id_12,
    input supply0 id_13,
    output wor id_14,
    output tri id_15,
    input tri id_16
);
  assign id_7.id_4 = id_10;
  always
    if (id_2) begin : LABEL_0
      id_1 = id_9 & "";
      $display;
      id_11 <= -1 ? 1 : ({(id_6), id_0, 1'b0} ^ id_2 - id_4);
      $display(id_16);
    end
  id_18(
      id_2
  );
  module_0 modCall_1 ();
  localparam id_19 = id_19;
endmodule
