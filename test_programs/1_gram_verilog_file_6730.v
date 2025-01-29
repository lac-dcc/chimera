// Seed: 2826611082
module module_0 (
    input wire id_0,
    id_13,
    input tri1 id_1,
    output tri id_2,
    input uwire id_3,
    input wand id_4,
    input wand id_5,
    output tri id_6,
    output uwire id_7,
    output supply0 id_8,
    output supply0 id_9,
    output supply1 id_10,
    input wor id_11
);
  always id_8 = 1;
  assign id_8 = id_0 && id_13;
  parameter id_14 = -1;
  assign module_1.id_5 = 0;
  always
    if (id_4) begin : LABEL_0
      begin : LABEL_0
        #1 begin : LABEL_0
          id_7 = id_13;
          id_9 = 1;
        end
      end
    end
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    output tri1 id_2,
    input supply1 id_3,
    input tri1 id_4,
    output supply1 id_5,
    input uwire id_6
);
  wire id_8;
  tri  id_9;
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_8,
      id_9,
      id_4,
      id_8,
      id_0,
      id_5,
      id_8,
      id_9,
      id_8,
      id_4
  );
  assign id_0 = id_9;
  assign id_8 = id_6;
  wire id_11;
  assign id_5 = 1;
endmodule
