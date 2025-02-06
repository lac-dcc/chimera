// Seed: 466578908
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  id_8(
      .id_0(id_2), .id_1($realtime), .id_2()
  );
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  specify
    (posedge id_3 => (id_4  : (1'b0))) = ($realtime : $realtime : 1, $realtime : id_4  : id_3);
  endspecify
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
endmodule
