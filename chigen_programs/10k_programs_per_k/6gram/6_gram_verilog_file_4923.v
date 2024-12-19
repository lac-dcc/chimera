// Seed: 3646051546
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    input supply0 id_5,
    input tri id_6,
    input wor id_7
);
  function automatic integer id_9;
    reg id_10;
    begin : LABEL_0
      for (id_2 = id_5; 1; id_1 = 1 + 1) begin : LABEL_0
        id_10 <= 1;
      end
    end
  endfunction
  wire id_11;
  wire id_12;
  genvar id_13;
  assign id_4 = id_3;
  string id_14 = "";
  tri1   id_15 = 1, id_16;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    output supply1 id_2,
    input tri id_3,
    output supply1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_10 = 0;
  assign id_2 = !id_3;
endmodule
