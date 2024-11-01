// Seed: 982829415
module module_0 (
    input wor   id_0,
    input tri1  id_1,
    input tri   id_2,
    input uwire id_3,
    input tri0  id_4,
    input tri   id_5,
    input wand  id_6
);
  assign id_8 = id_8;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri id_3,
    output logic id_4,
    input wand id_5,
    input tri1 id_6,
    input tri1 id_7,
    input wire id_8,
    input supply1 id_9,
    input tri id_10,
    output supply0 id_11,
    input tri0 id_12,
    output logic id_13,
    input tri1 id_14
);
  id_16 :
  assert property (@(posedge 1) 1)
  else begin
    #(1) id_13 <= 1;
    id_4 <= 1'b0;
  end
  always @(id_1 === 1 or posedge id_12)
    if (id_12) begin
      id_16 <= 1'h0;
    end
  always @(1, posedge id_9) begin
    id_13 <= 1;
  end
  assign id_4 = 1;
  wire id_17;
  module_0(
      id_6, id_5, id_3, id_5, id_1, id_5, id_8
  );
endmodule
