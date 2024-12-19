// Seed: 2338481697
module module_0 (
    input  wand  id_0,
    output tri0  id_1,
    output uwire id_2,
    output tri0  id_3,
    input  wand  id_4,
    input  wire  id_5,
    input  wor   id_6
);
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    output logic id_3,
    output tri0 id_4,
    output tri id_5,
    output tri id_6,
    input uwire id_7,
    output logic id_8,
    output uwire id_9,
    input wire id_10,
    input supply1 id_11,
    input supply1 id_12,
    output supply0 id_13,
    input supply0 id_14
);
  wire id_16;
  wire id_17;
  assign id_1 = id_12;
  reg id_18;
  id_19(
      .id_0(id_4), .id_1(1), .id_2(""), .id_3(1)
  );
  module_0 modCall_1 (
      id_0,
      id_13,
      id_6,
      id_5,
      id_0,
      id_2,
      id_7
  );
  wire id_20;
  always @(posedge 1'b0 or posedge id_0)
    if (1) begin : LABEL_0
      if (id_2) begin : LABEL_0
        id_3 <= 1'b0;
      end
    end
  always @(posedge id_2 or posedge {id_14{id_7}}) begin : LABEL_0
    id_8 <= id_18;
  end
endmodule
