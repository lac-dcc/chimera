// Seed: 634212448
`timescale 1ps / 1ps
module module_0 #(
    parameter id_3 = 32'd19,
    parameter id_5 = 32'd84
) (
    input reg id_1,
    input id_2,
    input _id_3,
    output id_4,
    output logic _id_5
);
  always @(posedge id_4) id_3 <= #1 1;
  reg id_6;
  reg id_7 = id_2;
  always @(posedge id_6 or posedge 1) begin
    id_4 <= 1;
    if (1) begin
      SystemTFIdentifier;
    end else begin
      id_4[id_5] <= id_6;
      {id_4[id_5], (1)} <= 1;
    end
  end
  assign id_2 = id_1;
  always @* begin
    if (1 | id_3)
      if (1) id_1 <= {id_7, id_4[1 : 1] == 1, id_6, id_5, 1, id_5[1], id_4, (id_7), 1, id_2[id_5]};
      else begin
        if (id_5) begin
          if (1) id_2 <= #id_8 1;
          else begin
            id_2 = 1;
          end
        end
      end
  end
  assign id_1 = id_6;
  assign id_2 = id_2;
  assign id_7 = id_4;
  type_14 id_9 (
      .id_0(id_6[|id_3]),
      .id_1(id_1["" : 1]),
      .id_2(id_7),
      .id_3(id_5),
      .id_4(""),
      .id_5(id_6),
      .id_6(),
      .id_7(id_3[id_3 : id_3])
  );
endmodule
