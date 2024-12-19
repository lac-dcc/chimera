// Seed: 3667577114
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  specify
    (id_5 => id_6) = (id_5);
  endspecify
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(id_4 or posedge id_13)
    forever begin : LABEL_0
      id_8 <= 1;
      if (id_2) begin : LABEL_0
        if (1 && 1 && id_4) begin : LABEL_0
          if (id_5) begin : LABEL_0
            id_8 = id_4;
          end
        end
      end
    end
  module_0 modCall_1 (
      id_12,
      id_12,
      id_6,
      id_3
  );
endmodule
