// Seed: 1123079039
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  wire id_8;
  specify
    $width(negedge id_9 &&& $realtime, id_9, -1'd0 == 1'h0, id_10);
  endspecify
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = $realtime;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_3
  );
  wire id_4;
  wire id_5;
  wire id_6;
  id_7(
      .id_0(id_2)
  );
endmodule
