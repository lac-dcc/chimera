// Seed: 1108566319
module module_0 #(
    parameter id_5 = 32'd96
) (
    input tri id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3
);
  wire [  -1 : ""] _id_5;
  wire [id_5 : -1] id_6;
  always @(posedge -1) release id_6;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    output uwire id_2,
    input tri0 id_3,
    input wor id_4,
    input wand id_5,
    output uwire id_6,
    input wor id_7,
    output supply1 id_8
);
  always @(posedge id_0) begin : LABEL_0
    id_1 <= id_5 == 1;
  end
  parameter id_10 = 1;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_0,
      id_8
  );
  wire id_12;
  assign id_6 = -1;
  nand primCall (id_8, id_11, id_7, id_0, id_10, id_3, id_5, id_4);
  assign id_2 = 1'h0 == id_12(!id_10);
endmodule
