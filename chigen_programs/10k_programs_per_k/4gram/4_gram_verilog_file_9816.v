// Seed: 2107032911
module module_0 (
    output tri id_0,
    output wor id_1,
    input tri1 id_2,
    input uwire id_3,
    input wand id_4,
    input tri0 id_5,
    output tri0 id_6,
    output tri0 id_7,
    input wire id_8,
    input supply0 id_9,
    output tri0 id_10,
    output tri0 id_11
);
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    output uwire id_3,
    output tri1 id_4
    , id_8,
    output supply1 id_5,
    output wire id_6
);
  wire id_9;
  assign id_8 = 1;
  always @(posedge id_0) begin : LABEL_0
    id_4 = 1;
  end
  reg  id_10;
  wire id_11;
  wire id_12;
  always @(posedge 1) id_10 <= 1;
  wire id_13;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_5,
      id_1,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_7 = 0;
  function id_14(id_15);
    if (1) assert ($display);
  endfunction
endmodule
