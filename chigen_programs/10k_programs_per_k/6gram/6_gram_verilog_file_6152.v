// Seed: 3459328398
module module_0 (
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
    id_12
);
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_4 == 1 or posedge id_11) begin
    #1 id_2 = id_2;
    id_1 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  xnor (id_2, id_1, id_4, id_3);
  always @(id_4 or 1) begin
    disable id_5;
  end
  module_0(
      id_2, id_3, id_4, id_3, id_3, id_1, id_3, id_4, id_3, id_1, id_1, id_1
  );
  wire id_6 = id_1;
  always @(negedge 1) id_2 <= id_4 == 1;
endmodule
