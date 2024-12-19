// Seed: 3659894373
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_5;
  always @(posedge id_5 or posedge 1 && id_3) begin : LABEL_0
    assume #1  (id_4) $display(1);
    else $display;
  end
  assign id_4 = 1;
  assign id_2 = id_2 || id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wand id_5 = 1;
  wor  id_6 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2
  );
endmodule
