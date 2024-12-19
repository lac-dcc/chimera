// Seed: 1276471103
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    input  wor   id_2
    , id_9,
    input  uwire id_3,
    input  uwire id_4,
    output uwire id_5,
    input  wor   id_6,
    output tri   id_7
);
  assign id_9 = id_9;
  wire id_10;
  id_11(
      id_9, 1'b0, 1
  );
endmodule
module module_1 (
    output wire  id_0,
    output uwire id_1,
    input  tri1  id_2,
    output tri   id_3,
    output tri0  id_4,
    input  wand  id_5,
    input  wand  id_6,
    output logic id_7
);
  always @(posedge id_5 != id_2)
    #1 begin : LABEL_0
      id_0 = (id_6);
      if (id_2) disable id_9;
      else begin : LABEL_0
        id_7 <= 1;
      end
    end
  wire id_10;
  assign id_4 = 1;
  wire id_11;
  id_12(
      .id_0(id_11), .id_1(id_3), .id_2(id_6)
  );
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_5,
      id_5,
      id_4,
      id_2,
      id_0
  );
endmodule
