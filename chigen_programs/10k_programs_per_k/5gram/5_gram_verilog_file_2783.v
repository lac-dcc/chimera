// Seed: 3583743144
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  wire id_5, id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    module_2,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(1 or posedge id_7) begin : LABEL_0
    if (id_14) begin : LABEL_0
      id_3 <= #id_13 id_5++;
    end
  end
  module_0 modCall_1 (
      id_12,
      id_12,
      id_1
  );
endmodule
