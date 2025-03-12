// Seed: 1071759175
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input supply1 id_4
    , id_7,
    output supply0 id_5
);
  assign id_0 = !id_1;
  assign id_0 = id_4;
  assign id_7 = -1'h0 ? 1'b0 : -1;
endmodule
module module_1 (
    output logic id_0,
    input wire id_1,
    input wire id_2,
    output tri1 id_3,
    inout supply1 id_4,
    input supply1 id_5,
    output logic id_6
);
  assign id_0 = {id_4, 1, id_1, 1};
  assign id_0 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_7 = 0;
  always @(negedge -1 or negedge id_5)
    if (-1'b0) id_0 <= #1 1;
    else id_6#(.id_2(-1)) <= 1 > -1;
  assign id_6 = id_5;
endmodule
