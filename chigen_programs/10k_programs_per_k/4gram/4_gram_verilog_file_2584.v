// Seed: 1916321921
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input wire id_2,
    output wire id_3
);
  final begin : LABEL_0$display
    ;
  end
  assign module_1.id_9 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input wor id_2,
    output wor id_3
);
  assign id_3 = 1;
  uwire id_5;
  reg   id_6;
  wire  id_7;
  wire  id_8;
  reg   id_9;
  reg   id_10 = id_9;
  always_ff @(id_9 or posedge id_6) $display(id_2);
  wor id_11;
  always @(id_11) if (id_11) id_9 <= !id_5;
  wire id_12;
  id_13(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4(1), .id_5()
  ); specify
    (id_14 => id_15) = 1;
  endspecify
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_3
  );
endmodule
