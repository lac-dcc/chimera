// Seed: 4228811097
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = 1 ? id_1 & ~id_1 : ~id_1;
endmodule
module module_1;
  wand id_1, id_2;
  supply1 id_3;
  reg id_4;
  supply0 id_5;
  wor id_6;
  assign id_2 = id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3
  );
  assign modCall_1.id_4 = 0;
  always @(1 - 1 or negedge 1'b0) begin : LABEL_0
    id_4 <= 1;
  end
  always @(id_5 or negedge id_2) $display(id_1 - 1);
endmodule
