// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module rvdff_WIDTH28
(
  din,
  clk,
  rst_l,
  dout
);

  input [27:0] din;
  output [27:0] dout;
  input clk;
  input rst_l;
  wire N0;
  reg [27:0] dout;

  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[27] <= 1'b0;
    end else if(1'b1) begin
      dout[27] <= din[27];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[26] <= 1'b0;
    end else if(1'b1) begin
      dout[26] <= din[26];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[25] <= 1'b0;
    end else if(1'b1) begin
      dout[25] <= din[25];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[24] <= 1'b0;
    end else if(1'b1) begin
      dout[24] <= din[24];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[23] <= 1'b0;
    end else if(1'b1) begin
      dout[23] <= din[23];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[22] <= 1'b0;
    end else if(1'b1) begin
      dout[22] <= din[22];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[21] <= 1'b0;
    end else if(1'b1) begin
      dout[21] <= din[21];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[20] <= 1'b0;
    end else if(1'b1) begin
      dout[20] <= din[20];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[19] <= 1'b0;
    end else if(1'b1) begin
      dout[19] <= din[19];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[18] <= 1'b0;
    end else if(1'b1) begin
      dout[18] <= din[18];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[17] <= 1'b0;
    end else if(1'b1) begin
      dout[17] <= din[17];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[16] <= 1'b0;
    end else if(1'b1) begin
      dout[16] <= din[16];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[15] <= 1'b0;
    end else if(1'b1) begin
      dout[15] <= din[15];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[14] <= 1'b0;
    end else if(1'b1) begin
      dout[14] <= din[14];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[13] <= 1'b0;
    end else if(1'b1) begin
      dout[13] <= din[13];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[12] <= 1'b0;
    end else if(1'b1) begin
      dout[12] <= din[12];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[11] <= 1'b0;
    end else if(1'b1) begin
      dout[11] <= din[11];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[10] <= 1'b0;
    end else if(1'b1) begin
      dout[10] <= din[10];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[9] <= 1'b0;
    end else if(1'b1) begin
      dout[9] <= din[9];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[8] <= 1'b0;
    end else if(1'b1) begin
      dout[8] <= din[8];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[7] <= 1'b0;
    end else if(1'b1) begin
      dout[7] <= din[7];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[6] <= 1'b0;
    end else if(1'b1) begin
      dout[6] <= din[6];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[5] <= 1'b0;
    end else if(1'b1) begin
      dout[5] <= din[5];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[4] <= 1'b0;
    end else if(1'b1) begin
      dout[4] <= din[4];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[3] <= 1'b0;
    end else if(1'b1) begin
      dout[3] <= din[3];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[2] <= 1'b0;
    end else if(1'b1) begin
      dout[2] <= din[2];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[1] <= 1'b0;
    end else if(1'b1) begin
      dout[1] <= din[1];
    end
  end


  always @(posedge clk or posedge N0) begin
    if(N0) begin
      dout[0] <= 1'b0;
    end else if(1'b1) begin
      dout[0] <= din[0];
    end
  end

  assign N0 = ~rst_l;

endmodule