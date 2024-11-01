// Seed: 11562683
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  id_5(
      .id_0(1), .id_1(id_4), .id_2(id_4), .id_3(id_2[1])
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  always @(posedge id_4) #1 id_3 = id_4;
  wire id_6;
  wire id_7;
  logic [7:0] id_8;
  module_0(
      id_3, id_8, id_6
  );
  wire id_9;
  assign id_8[1] = 1;
endmodule
