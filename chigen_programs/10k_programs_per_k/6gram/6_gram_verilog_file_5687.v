// Seed: 3682543384
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_10;
  wire id_11;
  always @(1'b0 or id_1) begin
    if (id_2) disable id_12;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_7 = id_1 >= id_2;
  module_0(
      id_4, id_4, id_6, id_4, id_4, id_4, id_2, id_4, id_3
  );
  always @(posedge 1 or posedge id_7) begin
    id_7 <= 1 === ((id_6 ? ~id_4 : 1));
  end
endmodule
