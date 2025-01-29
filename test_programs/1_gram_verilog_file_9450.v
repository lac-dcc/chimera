// Seed: 2239534298
module module_0;
  always_latch #1 begin : LABEL_0
    id_1 <= 1;
    begin : LABEL_0
      id_2 <= -1 << -1'b0;
      id_1 <= ~id_1 ? id_2 : 1 | {1, id_2};
    end
    $display(-1);
  end
endmodule
module module_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
program module_2 (
    output supply1 id_0
);
  wire id_2, id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_3 (
    input supply1 id_0,
    output wor id_1,
    input tri1 id_2,
    input wor id_3,
    input wire id_4,
    input tri id_5,
    input wand id_6,
    input wire id_7,
    output wire id_8
);
  wire id_10;
  nor primCall (id_1, id_10, id_2, id_3, id_4, id_5, id_6, id_7);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
