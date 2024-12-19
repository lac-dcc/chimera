// Seed: 3804376041
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge 1 or posedge id_3) begin : LABEL_0
    disable id_4;
    wait (1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = id_1[1];
  reg id_9, id_10;
  always @(posedge 1 | id_3 or 1) begin : LABEL_0
    id_9 <= id_2;
  end
  module_0 modCall_1 (
      id_7,
      id_8,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
