// Seed: 1282711944
module module_0 #(
    parameter id_8 = 32'd31,
    parameter id_9 = 32'd39
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = id_2;
  supply0 id_4;
  assign id_4 = 1;
  assign id_3 = 1;
  reg   id_5;
  wire  id_6;
  uwire id_7;
  defparam id_8.id_9 = 1;
  always @(posedge 1) begin : LABEL_0
    id_5 <= 1;
    $display(1'h0, id_7++);
  end
  wire id_10;
endmodule
module module_1 ();
  assign id_1 = 1;
  wand id_2, id_3;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.type_14 = 0;
  wire id_5;
  assign id_1 = id_2;
endmodule
