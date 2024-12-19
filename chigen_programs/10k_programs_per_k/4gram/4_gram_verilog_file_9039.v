// Seed: 4122819993
module module_0 (
    input  tri0  id_0,
    output uwire id_1,
    input  tri1  id_2
);
  assign id_1 = 1;
  assign module_1.id_8 = 0;
  wire id_4;
endmodule
module module_1 #(
    parameter id_10 = 32'd45,
    parameter id_11 = 32'd46
) (
    input supply0 id_0,
    output tri0 id_1,
    input wand id_2,
    output logic id_3
    , id_6,
    input tri0 id_4
);
  logic id_7;
  final begin : LABEL_0
    id_7 <= 1 == id_2;
  end
  assign id_3 = id_7;
  id_8 :
  assert property (@(negedge id_0) ~id_8)
  else $display(id_4);
  wor  id_9 = 1;
  defparam id_10.id_11 = !id_6;
  wire id_12;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_8
  );
endmodule
