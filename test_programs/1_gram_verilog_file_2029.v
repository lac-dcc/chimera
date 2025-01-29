// Seed: 2129342177
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
    id_11
);
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  tri1  id_3,
    id_7,
    input  wor   id_4,
    input  wor   id_5
);
  function id_8;
    input id_9;
    if (-1'b0)
      if (id_5) @(id_7) @(posedge id_4) id_2 = -1;
      else begin : LABEL_0
        id_0 <= -1;
      end
  endfunction
  module_0 modCall_1 (
      id_8,
      id_9,
      id_8,
      id_9,
      id_9,
      id_9,
      id_8,
      id_9,
      id_8,
      id_8,
      id_9
  );
endmodule
