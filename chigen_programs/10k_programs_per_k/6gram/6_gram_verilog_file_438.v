// Seed: 856880331
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input wire id_2,
    input supply1 id_3,
    input supply1 id_4,
    input wand id_5,
    input uwire id_6,
    output uwire id_7,
    input tri id_8,
    input tri1 id_9,
    output uwire id_10
);
  wire id_12;
  genvar id_13;
  always @(posedge id_9) begin : LABEL_0
    deassign id_13;
  end
endmodule
module module_1 #(
    parameter id_5 = 32'd97,
    parameter id_6 = 32'd16
) (
    output tri id_0,
    input tri id_1,
    output uwire id_2,
    output supply1 id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_0
  );
  defparam id_5.id_6 = "";
endmodule
