// Seed: 1489741152
module module_0 #(
    parameter id_12 = 32'd39,
    parameter id_13 = 32'd25
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  for (id_11 = id_6 - 1; 1; id_5 = id_6) begin : LABEL_0
    defparam id_12.id_13 = 1;
    always @(posedge id_11 or 1) begin : LABEL_0
      id_4.id_9 = 1;
    end
  end
endmodule
module module_1 (
    output supply1 id_0,
    output tri1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
