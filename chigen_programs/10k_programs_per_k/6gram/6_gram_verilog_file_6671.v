// Seed: 2407573088
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_5, id_6, id_7, id_8;
  id_9(
      .id_0(1), .id_1(1'b0), .id_2(id_4), .id_3(~id_5 == id_3), .id_4(id_8)
  );
  always @(negedge id_9) if (id_6) id_6 <= 1;
  assign id_5 = 1'b0;
  assign id_5 = 1 - 1'd0;
  wire   id_10;
  string id_11 = "";
  wire   id_12;
  wire   id_13;
  assign id_1 = id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
  wire id_5;
endmodule
