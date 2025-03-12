// Seed: 1308418965
module module_0 (
    input  wor   id_0,
    input  uwire id_1,
    input  wire  id_2,
    output uwire id_3,
    input  tri   id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  tri0  id_7,
    input  tri   id_8,
    output wor   id_9
);
  logic id_11;
  if (1) assign id_11 = id_2;
  else assign id_9 = -1;
  assign id_9 = -1;
  assign module_1._id_1 = 0;
endmodule
module module_1 #(
    parameter id_1  = 32'd46,
    parameter id_14 = 32'd68
) (
    output wand id_0[id_1  ^  id_14 : 1 'b0],
    input wor _id_1,
    inout tri id_2,
    input uwire id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    output logic id_7,
    output logic id_8,
    output wand id_9,
    output supply1 id_10,
    input tri1 id_11,
    output uwire id_12[-1 : ""],
    output logic id_13,
    input supply0 _id_14
);
  struct packed {logic id_16;} id_17;
  assign id_7 = 1;
  always begin : LABEL_0
    begin : LABEL_1
      id_7  <= -1;
      id_13 <= -1 + 1'b0;
      begin : LABEL_2
        id_8 <= id_1;
      end
      id_17.id_16 = id_11;
    end
  end
  module_0 modCall_1 (
      id_6,
      id_6,
      id_4,
      id_12,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_9
  );
  logic id_18;
  initial id_18 = id_14;
  logic id_19;
  assign id_17.id_16 = -1;
endmodule
